Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D51F6A88BD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 19:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSKxQ16llz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 05:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=BDkuvwlB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=BDkuvwlB;
	dkim-atps=neutral
X-Greylist: delayed 378 seconds by postgrey-1.36 at boromir; Thu, 02 Mar 2023 23:26:35 AEDT
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PS9MH35Tjz3cLr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 23:26:35 +1100 (AEDT)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E292B1EC04F0;
	Thu,  2 Mar 2023 13:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1677759598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=EXqRPO+1UJ/Jugo4uZb8s1y5eA/PT9L+UzCFhY6JB88=;
	b=BDkuvwlB34QQjIUo59EDVmj7oKCVncxfi5b5gZ5JgkhU3aIBDgDeTmJNn7jbJHW3znTvCf
	YFoHuKLNQrQyliq8pTOmjR9MRkIeF/W/wjuynsx9rHark059JR7Yp19Rw8Aocd30uUMCn6
	EDHphDviZmnnExDRi0VvwD18ImB95dQ=
Date: Thu, 2 Mar 2023 13:19:52 +0100
From: Borislav Petkov <bp@alien8.de>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v7 13/41] mm: Make pte_mkwrite() take a VMA
Message-ID: <ZACUaN0NRNXMwkT2@zn.tnic>
References: <20230227222957.24501-1-rick.p.edgecombe@intel.com>
 <20230227222957.24501-14-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230227222957.24501-14-rick.p.edgecombe@intel.com>
X-Mailman-Approved-At: Fri, 03 Mar 2023 05:52:28 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kcc@google.com, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, david@redhat.com, eranian@google.com, Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, linux-csky@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dethoma@microsoft.com, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Eugene Syromiatnikov <esyr@redhat.com>, jamorris@linux.microsoft.com, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, linux-snps-arc@lists.infradead.org, "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-alpha@vger.kernel.org, linux-um@lists.inf
 radead.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, debug@rivosinc.com, Florian Weimer <fweimer@redhat.com>, Michal Simek <monstr@monstr.eu>, John Allen <john.allen@amd.com>, linux-parisc@vger.kernel.org, Weijiang Yang <weijiang.yang@intel.com>, linux-api@vger.kernel.org, christina.schimpe@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, rppt@kernel.org, Andrew.Cooper3@citrix.com, linux-openrisc@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 27, 2023 at 02:29:29PM -0800, Rick Edgecombe wrote:
> [0] https://lore.kernel.org/lkml/0e29a2d0-08d8-bcd6-ff26-4bea0e4037b0@redhat.com/#t

I guess that sub-thread about how you arrived at this "pass a VMA"
decision should be in the Link tag. But that's for the committer, I'd
say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
