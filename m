Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A2170138
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 15:39:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sjQH1STZzDqW4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 23:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sjMT6ykyzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:37:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="Sq5mZQtK"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45sjMS64Tpz8tTQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 23:37:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45sjMS4Z5kz9sMQ; Mon, 22 Jul 2019 23:37:08 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=brauner.io
 (client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=christian@brauner.io; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=brauner.io
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=brauner.io header.i=@brauner.io header.b="Sq5mZQtK"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45sjMR31Qbz9sBZ
 for <linuxppc-dev@ozlabs.org>; Mon, 22 Jul 2019 23:37:06 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id x1so24468466wrr.9
 for <linuxppc-dev@ozlabs.org>; Mon, 22 Jul 2019 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brauner.io; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G+ee5z/udz98mpIWHmoiqwVolL/BB5iZ0zMxw+XvsZU=;
 b=Sq5mZQtKCd02zpB5GMq8UlqdCMCn44R31o3uvz8PqURSpo3xHrO5Wsy9F1/1PwzLUD
 XQ4GsW5DMoST9UCpxH3jpdCGH2r5gvxv2ojKeKRfRiQ1dgcTUF4tOhMY7cxy67VzGJ3T
 up1NIhnuO15UsA62wi2kXhzAEJ6XLZeUMnTuq442CZclG+Ap6X+zvziKN4qIRX5y+Rrh
 ymSNzDEhwEmpmObptc0CYQ4RB12Ld4lZZ0I4q4ZpSfk5Q12pHAFUOaB9rZ77d+QRydF5
 qPW+r2IkHHg/Ajg7rXcBOJYyXD/ZFR3lLe1Wbr+PoLy+03KJ3ig9A1ghvGtnEQDyPCp/
 W4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G+ee5z/udz98mpIWHmoiqwVolL/BB5iZ0zMxw+XvsZU=;
 b=SDhANEEjkcLD/QQuKm2lZPgv9ebAVkgRX4UW+3HeK+xb7E+twSGx0rCIeQq2/IRD5a
 1j/aInXUOPFK9TCHPNXvS600irhdrBS3aVfpndBsUGOuePtPxJs+i9kDIpBEg12z1OBb
 E+ShIv7cO4e2hjWCOI/qFcTXj0B1pIIqSt9tueD1N2iTmu9ipRboJD91XhKj2G5yOK55
 OscEr7yfZSRqUDkQsg7MHPdALZhk+728h/x7AUJZHBVndDju2lT+fBo2+R4HLDgBdnfs
 lclApESsU2F4y26cI97RqxQDbhMhy1Q6Ew68NO3B1luQaPuBsEsOtvJ5RjSUKHheWPol
 Hm4A==
X-Gm-Message-State: APjAAAVXjgvrEpHAph9WAPWiHg1vg738Aj/4irLeXyZ/Hg/0rYddOsH9
 9WEhIwxIfTAh2qZ7EQoVtM4=
X-Google-Smtp-Source: APXvYqzJhfE8EvBrpbkoFUobwg2Lx87mEQnfE+2OVykFMcOs+cLD4+tU3KpIRwMfVKVQ/o9VIdRhzA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr47557307wrp.92.1563802624016; 
 Mon, 22 Jul 2019 06:37:04 -0700 (PDT)
Received: from brauner.io ([213.220.153.21])
 by smtp.gmail.com with ESMTPSA id a8sm30742274wma.31.2019.07.22.06.37.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 06:37:03 -0700 (PDT)
Date: Mon, 22 Jul 2019 15:37:02 +0200
From: Christian Brauner <christian@brauner.io>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Wire up clone3 syscall
Message-ID: <20190722133701.g3w5g4crogqb7oi5@brauner.io>
References: <20190722132231.10169-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190722132231.10169-1-mpe@ellerman.id.au>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 11:22:31PM +1000, Michael Ellerman wrote:
> Wire up the new clone3 syscall added in commit 7f192e3cd316 ("fork:
> add clone3").
> 
> This requires a ppc_clone3 wrapper, in order to save the non-volatile
> GPRs before calling into the generic syscall code. Otherwise we hit
> the BUG_ON in CHECK_FULL_REGS in copy_thread().
> 
> Lightly tested using Christian's test code on a Power8 LE VM.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Thank you, Michael!

One comment below, otherwise:

Acked-by: Christian Brauner <christian@brauner.io>

> ---
>  arch/powerpc/include/asm/unistd.h        | 1 +
>  arch/powerpc/kernel/entry_64.S           | 5 +++++
>  arch/powerpc/kernel/syscalls/syscall.tbl | 1 +
>  3 files changed, 7 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
> index 68473c3c471c..b0720c7c3fcf 100644
> --- a/arch/powerpc/include/asm/unistd.h
> +++ b/arch/powerpc/include/asm/unistd.h
> @@ -49,6 +49,7 @@
>  #define __ARCH_WANT_SYS_FORK
>  #define __ARCH_WANT_SYS_VFORK
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_SYS_CLONE3
>  
>  #endif		/* __ASSEMBLY__ */
>  #endif /* _ASM_POWERPC_UNISTD_H_ */
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index d9105fcf4021..0a0b5310f54a 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -487,6 +487,11 @@ _GLOBAL(ppc_clone)
>  	bl	sys_clone
>  	b	.Lsyscall_exit
>  
> +_GLOBAL(ppc_clone3)
> +       bl      save_nvgprs
> +       bl      sys_clone3
> +       b       .Lsyscall_exit
> +
>  _GLOBAL(ppc32_swapcontext)
>  	bl	save_nvgprs
>  	bl	compat_sys_swapcontext
> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
> index f2c3bda2d39f..6886ecb590d5 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -516,3 +516,4 @@
>  432	common	fsmount				sys_fsmount
>  433	common	fspick				sys_fspick
>  434	common	pidfd_open			sys_pidfd_open
> +435	common	clone3				ppc_clone3

Note that in v5.3-rc1 there's now a comment that 435 is reserved in
there. So this will likely cause a merge conflict. You might want to
base your change off of v5.3-rc1 instead to avoid that. :)

So basically:

From 10b2e4176d712e45c7cb22af4aed4ce09818785c Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 22 Jul 2019 23:22:31 +1000
Subject: [PATCH] powerpc: Wire up clone3 syscall

Wire up the new clone3 syscall added in commit 7f192e3cd316 ("fork:
add clone3").

This requires a ppc_clone3 wrapper, in order to save the non-volatile
GPRs before calling into the generic syscall code. Otherwise we hit
the BUG_ON in CHECK_FULL_REGS in copy_thread().

Lightly tested using Christian's test code on a Power8 LE VM.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Acked-by: Christian Brauner <christian@brauner.io>
Link: https://lore.kernel.org/r/20190722132231.10169-1-mpe@ellerman.id.au
---
 arch/powerpc/include/asm/unistd.h        | 1 +
 arch/powerpc/kernel/entry_64.S           | 5 +++++
 arch/powerpc/kernel/syscalls/syscall.tbl | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/unistd.h b/arch/powerpc/include/asm/unistd.h
index 68473c3c471c..b0720c7c3fcf 100644
--- a/arch/powerpc/include/asm/unistd.h
+++ b/arch/powerpc/include/asm/unistd.h
@@ -49,6 +49,7 @@
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_VFORK
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_CLONE3
 
 #endif		/* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_UNISTD_H_ */
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index d9105fcf4021..0a0b5310f54a 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -487,6 +487,11 @@ _GLOBAL(ppc_clone)
 	bl	sys_clone
 	b	.Lsyscall_exit
 
+_GLOBAL(ppc_clone3)
+       bl      save_nvgprs
+       bl      sys_clone3
+       b       .Lsyscall_exit
+
 _GLOBAL(ppc32_swapcontext)
 	bl	save_nvgprs
 	bl	compat_sys_swapcontext
diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
index 3331749aab20..6886ecb590d5 100644
--- a/arch/powerpc/kernel/syscalls/syscall.tbl
+++ b/arch/powerpc/kernel/syscalls/syscall.tbl
@@ -516,4 +516,4 @@
 432	common	fsmount				sys_fsmount
 433	common	fspick				sys_fspick
 434	common	pidfd_open			sys_pidfd_open
-# 435 reserved for clone3
+435	common	clone3				ppc_clone3
-- 
2.22.0

