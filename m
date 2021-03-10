Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB23C334A0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 22:48:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwm0b5x8Pz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 08:48:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=bJVDkR3w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bJVDkR3w; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwm0818ckz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 08:47:49 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id l2so12291071pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=mCiogpXAvnyIZ07NXe3U+jkz++MrPHNJq4E2jewoVME=;
 b=bJVDkR3wZsBDZQRcdc+hvRJ1PGY2Hy2AjnBbtHH48u/3UTXKpLx2GJnN8CtqqEI2IE
 t6a5cS6JRWbLHVsWfNnGvUjZCtDMie7O0bFnwatk6kpCMWr50sJksoUJ5SOFfm/v5Dev
 R4Q55JBOGbBSDtz9n+CT3p6TXvqnwojvbaPtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=mCiogpXAvnyIZ07NXe3U+jkz++MrPHNJq4E2jewoVME=;
 b=NS8Qtu9F6DOFKQ26aGB8f1+rfZHjkAv32CFxwGbdz1tvCfg1HjMC6jiNhUSbGMes7U
 Ze2DiRrMzjeFZjSHziscQDiiHU0UH4gGSEOyKyqf0V1Tfojl4a/h50DGT+dLXtpBTikA
 AwmceUTW72obDgZesGDroiza4LOq/awq4JManLMQj4kbQOQy2g9i/2ivh8+75KlT23ga
 1niwBkcQL0+jdMDh5gLg21MmSQFTQYSCGDvvsAfh2R1mk1/2ONfEZ+7Qu+7o6XLJMlTk
 RgpCLJPCKAT/YyoWk4TUAjz68EAgi+Csf+x8b4cPWZtInzz9mdffsEAS/huTrXkEv2PW
 Igxg==
X-Gm-Message-State: AOAM531XbSONcRiJ1FyiCWIjE/NXGmWlMZUQOEpkiGYZtLT7uLElw6e0
 dTpHzNuJ2JPUfENGwpZ9VfSwCQ==
X-Google-Smtp-Source: ABdhPJz6yqPHIcO/YXVHTgYXA8LMt5NUkJPVvXtvcu/MlK1eW5X9GcRbADpaXIsp5RSETNpnQ0j0fg==
X-Received: by 2002:a65:4344:: with SMTP id k4mr4502725pgq.48.1615412865961;
 Wed, 10 Mar 2021 13:47:45 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-0e28-c46d-f4e0-67e7.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:e28:c46d:f4e0:67e7])
 by smtp.gmail.com with ESMTPSA id j3sm290489pjf.36.2021.03.10.13.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 13:47:45 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 01/15] powerpc/uaccess: Remove __get_user_allowed() and
 unsafe_op_wrap()
In-Reply-To: <439179c5e54c18f2cb8bdf1eea13ea0ef6b98375.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
 <439179c5e54c18f2cb8bdf1eea13ea0ef6b98375.1615398265.git.christophe.leroy@csgroup.eu>
Date: Thu, 11 Mar 2021 08:47:42 +1100
Message-ID: <877dmed6kh.fsf@dja-thinkpad.axtens.net>
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

Hi Christophe,

Thanks for the answers to my questions on v1.

This all looks good to me.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

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
>  #define unsafe_put_user(x, p, e) \
>  	__unsafe_put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>  
> -- 
> 2.25.0
