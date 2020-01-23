Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C804146957
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 14:41:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483NjJ00jczDqYX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 00:41:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483NdV5dpFzDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 00:38:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jLNXR1xi; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 483NdV20v9z8sxP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 00:38:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 483NdV0cTsz9sRl; Fri, 24 Jan 2020 00:38:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=jLNXR1xi; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 483NdT2R5mz9sSN
 for <linuxppc-dev@ozlabs.org>; Fri, 24 Jan 2020 00:38:21 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id h12so2469517qtu.1
 for <linuxppc-dev@ozlabs.org>; Thu, 23 Jan 2020 05:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QFIT/ZNVqFYwIVYE5bqklL/THEWS9+AkUSSk3Xy6/6A=;
 b=jLNXR1xiaZU8QBKdkcZHem7zT48J7SOEMydLoJKVrjO0K3aLdWGnKEIQRBkJ2T2YMJ
 UpUTsGDFA4SbZN0Vx8xNjyYvL7UJMV/DL0JEqhUbZPeVlh71dy/4BcEiv6mL+nuUTA1W
 OkGnpuVBs6nG1j/VQFnDa+GxyxE2S3JiWklSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QFIT/ZNVqFYwIVYE5bqklL/THEWS9+AkUSSk3Xy6/6A=;
 b=MYQZLCKpR39SmQu9B0Az4Vn0bkWX88KzxcNiUp93gUUDncZg6GGQ2zARf2tLUxdaUD
 ok1DmkqdQfq8fTV5N+OVab+M7qVHp8bm7c81ZY4u/BOwXIhpWpGJcfLFDDY8yRhBSY9f
 AcF97bZ4S18mcOAfjlikH3hoK6ykmGY2oGkRir8PVi/QxOXBYdXlM/qq1+8gbSv0LKYG
 2JH/VIdwyaBBpK94vBtF951PwV3cUgyHhxDD9NGPcR9RoEhRwMcLD//wL4AUrqFTHI9P
 HgrfGD29VHmYATtLxH9ReMvklhJOXFkrx8GYsnuMYUecOXoIWBMPV/jhjdm6SPMnVVRa
 VheQ==
X-Gm-Message-State: APjAAAWpQw+tC8KZifFWbimjLcCexK69bj1qmYLI/nhHDmgeLJoeF+Hv
 go98K7TygSVR/MJvW1dh798nZ7du9D3MM8XDeBA=
X-Google-Smtp-Source: APXvYqzVOFJYmkh8h6OauochH3AycuaCQUh2xmhwIwBnImRFWfiCD+yYLgNNj2T0I4d8yA0I8VARmBEfXvoDrylqJDo=
X-Received: by 2002:ac8:1ac1:: with SMTP id h1mr9465555qtk.255.1579786695711; 
 Thu, 23 Jan 2020 05:38:15 -0800 (PST)
MIME-Version: 1.0
References: <20200121043000.16212-1-mpe@ellerman.id.au>
 <20200121043000.16212-7-mpe@ellerman.id.au>
In-Reply-To: <20200121043000.16212-7-mpe@ellerman.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Jan 2020 13:38:03 +0000
Message-ID: <CACPK8XeXNb_9ftjtTKG2i6DbyFwWFAT4bPhQ0+6eR8i-1a5JrQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] powerpc/configs/skiroot: Enable security features
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 21 Jan 2020 at 04:30, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> From: Joel Stanley <joel@jms.id.au>
>
> This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
> FORTIFY_SOURCE.
>
> It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
> LOCK_DOWN_KERNEL_FORCE_INTEGRITY options enabled. This still allows
> xmon to be used in read-only mode.
>
> MODULE_SIG is selected by lockdown, so it is still enabled.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> [mpe: Switch to lockdown integrity mode per oohal]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

I did some testing and with change we break kexec. As it's critical
for this kernel to be able to kexec we need to set KEXEC_FILE=y if
we're setting FORCE_INTEGRITY=y.

I've tested your series with that modification made and userspace was
once again able to kexec (with -s).

Cheers,

Joel

> ---
>  arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> v2: Switch to lockdown integrity mode rather than confidentiality as noticed by
> dja and discussed with jms and oohal.
>
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index 24a210fe0049..93b478436a2b 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -49,7 +49,6 @@ CONFIG_JUMP_LABEL=y
>  CONFIG_STRICT_KERNEL_RWX=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> -CONFIG_MODULE_SIG=y
>  CONFIG_MODULE_SIG_FORCE=y
>  CONFIG_MODULE_SIG_SHA512=y
>  CONFIG_PARTITION_ADVANCED=y
> @@ -272,6 +271,16 @@ CONFIG_NLS_ASCII=y
>  CONFIG_NLS_ISO8859_1=y
>  CONFIG_NLS_UTF8=y
>  CONFIG_ENCRYPTED_KEYS=y
> +CONFIG_SECURITY=y
> +CONFIG_HARDENED_USERCOPY=y
> +# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
> +CONFIG_HARDENED_USERCOPY_PAGESPAN=y
> +CONFIG_FORTIFY_SOURCE=y
> +CONFIG_SECURITY_LOCKDOWN_LSM=y
> +CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
> +CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY=y
> +# CONFIG_INTEGRITY is not set
> +CONFIG_LSM="yama,loadpin,safesetid,integrity"
>  # CONFIG_CRYPTO_HW is not set
>  CONFIG_CRC16=y
>  CONFIG_CRC_ITU_T=y
> --
> 2.21.1
>
