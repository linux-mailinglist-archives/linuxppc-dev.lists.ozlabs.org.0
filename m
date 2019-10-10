Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B222D2FE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2019 20:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46pzSv3WhDzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2019 05:02:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alien8.de
 (client-ip=2a01:4f8:190:11c2::b:1457; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="ho8GObx8"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46pzQL2ZVwzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2019 05:00:24 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0A6300D1C0EB70E9B309BA.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:6300:d1c0:eb70:e9b3:9ba])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4B7011EC090E;
 Thu, 10 Oct 2019 20:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1570730415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=Xe1SX//dDoWeX+ij/nDraOaVSkSMgvg4F8+xxebszBM=;
 b=ho8GObx8x8ogaRx5uJLjl31cqJAZGDuZNy/gKli2vkRXyewbGzasCVSSCyhDoQQwLUSAdB
 6Ch+ilhWD9WU/Q44lP40VOutBHAqCxDcNCYXoLlw0x0BYwbf3EhUuehrKk4qWbR8joF/Uh
 MKxwSv/3EwfqYFCfTb6K2+9UEj5t1ns=
Date: Thu, 10 Oct 2019 20:00:08 +0200
From: Borislav Petkov <bp@alien8.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 28/29] x86/mm: Report actual image regions in /proc/iomem
Message-ID: <20191010180008.GH7658@zn.tnic>
References: <20190926175602.33098-1-keescook@chromium.org>
 <20190926175602.33098-29-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190926175602.33098-29-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, linux-alpha@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Arnd Bergmann <arnd@arndb.de>, linux-xtensa@linux-xtensa.org,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Ingo Molnar <mingo@redhat.com>, linux-parisc@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 26, 2019 at 10:56:01AM -0700, Kees Cook wrote:
> The resource reservations in made for the kernel image did not reflect
			      ^
			      /proc/iomem

> the gaps between text, rodata, and data. This adds the rodata resource

s/This adds/Add/

> and updates the start/end calculations to match the respective calls to

s/updates/update/

> free_kernel_image_pages().
> 
> Before (booted with "nokaslr" for easier comparison):

...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
