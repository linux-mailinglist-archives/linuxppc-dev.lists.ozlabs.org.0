Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8665B587F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 12:34:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR2yg01BZz3bms
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 20:34:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ViPHStop;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ViPHStop;
	dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR2y03CH1z2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 20:33:43 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id 78so7835712pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=9Skrw66xRdoVNUVBLV7A90jCnW6HPA3h92qwDvbqHmk=;
        b=ViPHStopxL87r/ez0XBFcEFz3VzE0t695oe/H/4vedEPyq5I+GDufcibvlvx68FmF7
         FPiI8KVcRQbMATKGisgoiZcoiNJJqew+bubHonT3pWbcxC/fLsLB7qiVxde5R7LzjjLG
         djBRh6X7K1bQH+ROtrk0rwbIdg/CtOdqWnHpPQJoRT7mcr5Lfq6UoU9GcgJ50Iv7M+/d
         64AuNVCDsBNrHA4KcycMBVg12aAxeZPM9UwcvKRj7O9r0KotNByLh3j4j8L4bbZ2xFub
         5FrHby+VlHiVH6fcyAvqpeLVnjJ3B/bipOhZD8KVPsi43gWsCzl9RLyqlnMtspzkpJ4r
         FnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=9Skrw66xRdoVNUVBLV7A90jCnW6HPA3h92qwDvbqHmk=;
        b=GZGmsuE19WNTcKMDcGgewAYreJjk6aw9Nz6MZTqK+EbXIiuEB37prP2Tz5s9qPZKi9
         E+x4TyKMwzE7lRU1pHwVAqL2AYilqT5Tow8E7qXDWt/YjZGlzwAdjQxQXk9SDymkr9O4
         +we7BDsKvt0rmn75nMDs+Tsf3m3F/eZTn4ZF8pK5Xo+Dpsf0TBmBcVm5r0vjrOsESdW9
         zOFIp0NSfZBOtPfximLJU9f/oSjcZ+1tlvAZ0EY2l8a7CfrEAHBgW+292J5otngW1+3D
         j9Rbv+VRtCxc7Tn8NDsggRJv2Wb05xSdJwOI8Qlktvw5DgBDtbB30PkL+GM/gY+o42+4
         475w==
X-Gm-Message-State: ACgBeo3QHqNXsPh4/ibTkMaWeOla7TGuMigfkGiJ6Ml9sSzpw9gJYujy
	65nEG7hD2rnezYAPfb6JZHg=
X-Google-Smtp-Source: AA6agR63sBf7Ug/+xbzbtmGt506lvdxRkQ+tmvOh56hAR5VTLC/dUx+s0gaSVzH7W8cOl/s+8P12Aw==
X-Received: by 2002:a62:be0d:0:b0:535:df64:b106 with SMTP id l13-20020a62be0d000000b00535df64b106mr26857876pff.60.1662978820825;
        Mon, 12 Sep 2022 03:33:40 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id k72-20020a62844b000000b0053e8368ec34sm5070367pfd.32.2022.09.12.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 03:33:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 20:33:35 +1000
Message-Id: <CMUCSHFFSDYT.B7W3EV9G02B6@bobo>
Subject: Re: [PATCH v4 08/20] powerpc: Include all arch-specific syscall
 prototypes
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-9-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-9-rmclure@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Forward declare all syscall handler prototypes where a generic prototype
> is not provided in either linux/syscalls.h or linux/compat.h in
> asm/syscalls.h. This is required for compile-time type-checking for
> syscall handlers, which is implemented later in this series.
>
> 32-bit compatibility syscall handlers are expressed in terms of types in
> ppc32.h. Expose this header globally.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Explicitly include prototypes.
> V2 -> V3: Remove extraneous #include <asm/compat.h> and ppc_fallocate
> prototype. Rename header.
> ---
>  arch/powerpc/include/asm/syscalls.h          | 90 +++++++++++++-----
>  .../ppc32.h =3D> include/asm/syscalls_32.h}    |  0
>  arch/powerpc/kernel/signal_32.c              |  2 +-
>  arch/powerpc/perf/callchain_32.c             |  2 +-
>  4 files changed, 70 insertions(+), 24 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/a=
sm/syscalls.h
> index 3e3aff0835a6..91417dee534e 100644
> --- a/arch/powerpc/include/asm/syscalls.h
> +++ b/arch/powerpc/include/asm/syscalls.h
> @@ -8,45 +8,91 @@
>  #include <linux/types.h>
>  #include <linux/compat.h>
> =20
> +#ifdef CONFIG_PPC64
> +#include <asm/syscalls_32.h>
> +#endif
> +#include <asm/unistd.h>
> +#include <asm/ucontext.h>
> +
>  struct rtas_args;
> =20
> +#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER

Do you need this ifdef?

> +
> +/*
> + * PowerPC architecture-specific syscalls
> + */
> +
> +long sys_rtas(struct rtas_args __user *uargs);
> +long sys_ni_syscall(void);
> +
> +#ifdef CONFIG_PPC64
> +long sys_ppc64_personality(unsigned long personality);
> +#ifdef CONFIG_COMPAT
> +long compat_sys_ppc64_personality(unsigned long personality);
> +#endif /* CONFIG_COMPAT */
> +#endif /* CONFIG_PPC64 */
> +
> +/* Parameters are reordered for powerpc to avoid padding */
> +long sys_ppc_fadvise64_64(int fd, int advice,
> +			  u32 offset_high, u32 offset_low,
> +			  u32 len_high, u32 len_low);

Should this be under PPC32 since you're adding the ifdefs?

Because you added a new comment here... This is register padding
to do with something, even/odd pair calling convention? I can't
remember the details would you be able to expand the comment a bit
because I'm sure I'll forget it again too.

Thanks,
Nick
