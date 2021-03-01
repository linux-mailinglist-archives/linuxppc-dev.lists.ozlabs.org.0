Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEC329471
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 23:03:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqDmG6LC2z3clX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:03:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=RKt8VDYl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=RKt8VDYl; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqDlp3cqfz30N4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 09:03:00 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id o188so5789052pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Mar 2021 14:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qZ//7UGmglUFd9a+K6I+xp+r8KSLdySqRo4lIorwHRQ=;
 b=RKt8VDYlVD/hDSLtRtLJB9q7LoGnpuo2sk84bcxbEoSf84NYm/Dj+wlcOat9vUyLvU
 BpOmRFVA1VNz3TirVy4M4WxwSHOGpHtTr154/1k39CfTegA7vbagTk7V2RuRa6ZDJPip
 u+VdXHk43FdYsOZLjNk09aa0nZMlFXUv3z6cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qZ//7UGmglUFd9a+K6I+xp+r8KSLdySqRo4lIorwHRQ=;
 b=dIU1G2xCL99+Ft48yhQbaI1IjuSvfRz4sU2Wa71RbWxmTXygwauuHfBD+Ef2O4PIj7
 XMoHG15eaoo2OasSglMADhPCgksiQUirO92S4B0UVC46hcPb+jR0+fY/3zu8qWAEnlwS
 H8WLPowEkLx1OF6t/VxaMA81dQ7yiBvdoqA+Sat/0Q71O4TeMxCWUGaM/mXQSHVMxSch
 uSLbWWZceTV9oXAXGi7pU8BbR5xfzFBLfmXo0PDunsATTjwuWKiitHD2c++zFYLFU3eS
 TrRF61cc1AL09COi3TwKozS6MnGjIdmBhKm0xUys5chbEzLbQI/x8NeYZGp25Wa18XbG
 PiVg==
X-Gm-Message-State: AOAM5326dDiBAkPXT8wD+WXZNRGrJI9yWvGjSYOJ6C2TqaIcNtnrd/Y0
 ETSoqhWnuA4mwWQODj2c2G5Pvw==
X-Google-Smtp-Source: ABdhPJwmq0kilOi0JQKkj25v/mVFtfXKLg24Abgr69OrIZbj+HE+w4Zv7SxblC5O8Gv+agxEKcqrxA==
X-Received: by 2002:a62:5a45:0:b029:1e5:4c81:c59 with SMTP id
 o66-20020a625a450000b02901e54c810c59mr430011pfb.51.1614636178553; 
 Mon, 01 Mar 2021 14:02:58 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b18e-89be-e1b2-4959.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b18e:89be:e1b2:4959])
 by smtp.gmail.com with ESMTPSA id 16sm5601501pfx.45.2021.03.01.14.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 14:02:57 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 01/15] powerpc/uaccess: Remove __get_user_allowed() and
 unsafe_op_wrap()
In-Reply-To: <e0538c71167bd90224a8727fea9ed5b75612e2d7.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
 <e0538c71167bd90224a8727fea9ed5b75612e2d7.1614275314.git.christophe.leroy@csgroup.eu>
Date: Tue, 02 Mar 2021 09:02:54 +1100
Message-ID: <87im6ao7ld.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Those two macros have only one user which is unsafe_get_user().
>
> Put everything in one place and remove them.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/uaccess.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 78e2a3990eab..8cbf3e3874f1 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -53,9 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
>  #define __put_user(x, ptr) \
>  	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
>  
> -#define __get_user_allowed(x, ptr) \
> -	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
> -
>  #define __get_user_inatomic(x, ptr) \
>  	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
>  #define __put_user_inatomic(x, ptr) \
> @@ -482,8 +479,11 @@ user_write_access_begin(const void __user *ptr, size_t len)
>  #define user_write_access_begin	user_write_access_begin
>  #define user_write_access_end		prevent_current_write_to_user
>  
> -#define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
> -#define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
> +#define unsafe_get_user(x, p, e) do {					\
> +	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
> +		goto e;							\
> +} while (0)
> +

This seems correct to me.

Checkpatch does have one check that is relevant:

CHECK: Macro argument reuse 'p' - possible side-effects?
#36: FILE: arch/powerpc/include/asm/uaccess.h:482:
+#define unsafe_get_user(x, p, e) do {					\
+	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
+		goto e;							\
+} while (0)

Given that we are already creating a new block, should we do something
like this (completely untested):

#define unsafe_get_user(x, p, e) do {					\
        __typeof__(p) __p = (p);
	if (unlikely(__get_user_nocheck((x), (__p), sizeof(*(__p)), false)))\
		goto e;							\
} while (0)

Kind regards,
Daniel

>  #define unsafe_put_user(x, p, e) \
>  	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>  
> -- 
> 2.25.0
