Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB6122D7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 14:54:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cfkp0ZndzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 00:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.b="TJ/Scu83"; 
 dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cfdl0pVFzDqVk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 00:49:46 +1100 (AEDT)
Received: from zn.tnic (p200300EC2F0BBF009DDBE489521279C1.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:bf00:9ddb:e489:5212:79c1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 629771EC0419;
 Tue, 17 Dec 2019 14:49:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1576590572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=NnxRmWgXR04lov5uUe4Y9eBEjC/dJ8PLB6ALjMhspEU=;
 b=TJ/Scu83qAvDm1yqbm7OqNy1WIybTlQX6dv1VHY4h42q+MTkWzjoQk34XOqwo3EiK3kmem
 ecsKz+yWWT5zvbpfqkBM7vYYWEFsFKi6TYdBB2AD1ej7S9TxcqKgFZjK346LuAqiCR3IXe
 xDzQYaVhKbpk/VZlK+03kUkkzkdmuS0=
Date: Tue, 17 Dec 2019 14:49:23 +0100
From: Borislav Petkov <bp@alien8.de>
To: Bhupesh Sharma <bhsharma@redhat.com>
Subject: Re: [PATCH v5 0/5] Append new variables to vmcoreinfo (TCR_EL1.T1SZ
 for arm64 and MAX_PHYSMEM_BITS for all archs)
Message-ID: <20191217134923.GE28788@zn.tnic>
References: <1574972621-25750-1-git-send-email-bhsharma@redhat.com>
 <20191214122734.GC28635@zn.tnic>
 <CACi5LpP2PPcmaQw95V4MUzhvENq9+mB7UR7eib2HADCDHLz4oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACi5LpP2PPcmaQw95V4MUzhvENq9+mB7UR7eib2HADCDHLz4oA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Dave Anderson <anderson@redhat.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 kexec mailing list <kexec@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kazuhito Hagio <k-hagio@ab.jp.nec.com>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Steve Capper <steve.capper@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 16, 2019 at 12:16:12PM +0530, Bhupesh Sharma wrote:
> I remember there was a suggestion during the review of an earlier
> version to keep them as a separate patch(es) so that the documentation
> text is easier to review,

Documentation text is one sentence, respectively. Not really worth a
separate patch.

> I can merge the documentation patches with the respective patches
> (which export the variables/defines to vmcoreinfo) in v6,

Please do.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
