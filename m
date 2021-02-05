Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E06E31042A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 05:49:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DX2y14YPBzDsqK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 15:49:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ii80C4Y8; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DX2w40RqKzDsqM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 15:47:30 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id g15so3118135pjd.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Feb 2021 20:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=fRXyQtTNCsrkfLO/ZRL30wLdpnOcYYJ5OfonlqzOUEo=;
 b=Ii80C4Y88+JZcw8ux10+X3lreZOK9sP1kvZwGVIE+2g0Qrl32TNUXwIYnICMq3PGV5
 OzarV99KZDdssvHjHChFZtcMXrumTbMyrJNfurGtbGUi6CbFOomvrmFIaasZDMeEmvAn
 Qn07XlJ9cjOb7eOqlP4lXGRNgZZskJ6geamWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=fRXyQtTNCsrkfLO/ZRL30wLdpnOcYYJ5OfonlqzOUEo=;
 b=e9pnHP4CqNdxxer3p/pUjuuO3L+ECtnzH5qDrt7E/fsKphPHzvYdb1hxHLf7wJajPK
 mDhLG7ymJM9do4hqPQyjBsomuHblR69IMBJG8fT5Kuzsj8nMIdVf5DKZaQvy7tAK9c2k
 TEAN1qwMqpwqc7NcSbg9MGqDlScLQiApdY/g16hF4BslMDon5TXrNsSURtqXwKJIy5iP
 kYuBj4sBWjAqwp5qjgXQd/cFNVigZ1kb8KUA/jSl7z28CYMB+HLl7GqHNKXj9Ke9vLul
 KTFEhmTdCMcjybaIa9SNJId9PJE0BJjDUCWhIhUNTUF7FDkj0DGULF9fUWGkHv85v6Ac
 g9oA==
X-Gm-Message-State: AOAM533ap61Eh5kaAgc6K9yhSNLh181RWvLlOJianTiVMLMIYY/m8zQ5
 LEqfdnjf9KS+qLtYzEI+jMR6BJ6k6EoRGQ==
X-Google-Smtp-Source: ABdhPJy9LT+UAEVZwr2hOb9jsUoFKhLY7aG/1vgN6WmEKzqJW54cU3r8fJf+c4zpURcqJYoEB0VrGw==
X-Received: by 2002:a17:902:e5cc:b029:df:bc77:3aba with SMTP id
 u12-20020a170902e5ccb02900dfbc773abamr2593171plf.72.1612500446505; 
 Thu, 04 Feb 2021 20:47:26 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-a9fe-013b-f6b0-c0a4.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:a9fe:13b:f6b0:c0a4])
 by smtp.gmail.com with ESMTPSA id x81sm7779796pfc.46.2021.02.04.20.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 20:47:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 01/10] powerpc/uaccess: Add unsafe_copy_from_user
In-Reply-To: <20210203184323.20792-2-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-2-cmr@codefail.de>
Date: Fri, 05 Feb 2021 15:47:22 +1100
Message-ID: <87k0rndsth.fsf@dja-thinkpad.axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,

Pending anything that sparse reported (which I haven't checked), this
looks ok to me.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> Just wrap __copy_tofrom_user() for the usual 'unsafe' pattern which
> takes in a label to goto on error.
>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/include/asm/uaccess.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 501c9a79038c..036e82eefac9 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -542,6 +542,9 @@ user_write_access_begin(const void __user *ptr, size_t len)
>  #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
>  #define unsafe_put_user(x, p, e) __put_user_goto(x, p, e)
>  
> +#define unsafe_copy_from_user(d, s, l, e) \
> +	unsafe_op_wrap(__copy_tofrom_user((__force void __user *)d, s, l), e)
> +
>  #define unsafe_copy_to_user(d, s, l, e) \
>  do {									\
>  	u8 __user *_dst = (u8 __user *)(d);				\
> -- 
> 2.26.1
