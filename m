Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B4414181
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 08:05:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDnpJ4djwz305t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S1fWqCKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=clabbe.montjoie@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=S1fWqCKT; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDnnc36Mrz2xr9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 16:04:51 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id t7so3230777wrw.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 23:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=E8PWpzGE4nXx9yLcpibeowYfrua7uZ6eTJJKaxClepM=;
 b=S1fWqCKTc+U3XKV5MShwR46eahJQSdbw+NMA8XAWaqVGE4gxmVvz/ieJJpTPvygGB+
 NNN5aTQCiy5LkLq8A9yKOgrmXJlT3dt1rY51hmAS9BwwbIGAmyUshJArA5LNHHbEqGG6
 vpMogiWPbwy7kMJ/XJta/8xaIXkqvkd5SlmkQmn852FfcsPb1bj9sfRgfVakG8YEmd28
 OhxgMrpK7MglhTkJqlaS3vCa5Vn4cXfJ2pmqYfjihzGZEeYcM92zU/EhXXMCPetBA/kc
 9yQ+S8F6dX/34PidSe5ZanAPHXbo5xw4HI+KcwnVlFAYllBy+RA01+pglKkhtXw0Ejzm
 ssMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=E8PWpzGE4nXx9yLcpibeowYfrua7uZ6eTJJKaxClepM=;
 b=o8CSCtELv0qdi3rzHhDC/gILNUK7ipIi5QkxPwHRdcmib9XhQY2uwJZyFNuzt9fHtK
 1Y0qkhOcdeUanAMswjTsEJYKsveumbS7Bb+grP54WwK2owhzn1ABj66I5wFTzJUj3yLy
 ommE3B3BfViVCX2RWGULdEZ1TNkBDOfXlp6T0dPLiJCtNT8Dk51b7e/1/W6vj9ppTy6q
 oY0byJKx6wneL3z2feg1QCROYg8G7wWx2oKr5dmyPsjFr87Syrx4Ne2uJTAEQVhp4DJA
 x3KCgW3kWpWfv9Gj1vUNS+YPMa0F7HBMU7ESc8iddslcHKPnCZF2qSc4ve+ukvs7Zrgx
 i1dg==
X-Gm-Message-State: AOAM531jcjk3YvV4nyY/SDCAuTAMTkvnWUgnvIIjjyCy6CMTAYOhrQcv
 XMcWMPw/SLAQANWzuuAcjAE=
X-Google-Smtp-Source: ABdhPJy/Oa9kivCqfNjj4Wo8JUjtuGYaGVP7hcDPKnWoCziHCeeoiDjTZzPckMOtTD3xk6YWepI41Q==
X-Received: by 2002:adf:a745:: with SMTP id e5mr28523356wrd.406.1632290683592; 
 Tue, 21 Sep 2021 23:04:43 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id o1sm1071032wru.91.2021.09.21.23.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:04:43 -0700 (PDT)
Date: Wed, 22 Sep 2021 08:04:39 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Subject: Re: [PATCH 1/4] crypto: nintendo-aes - add a new AES driver
Message-ID: <YUrHdxY4EyanC9KR@Red>
References: <20210921213930.10366-1-linkmauve@linkmauve.fr>
 <20210921213930.10366-2-linkmauve@linkmauve.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210921213930.10366-2-linkmauve@linkmauve.fr>
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
Cc: devicetree@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Ash Logan <ash@heyquark.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Tue, Sep 21, 2021 at 11:39:27PM +0200, Emmanuel Gil Peyrot a écrit :
> This engine implements AES in CBC mode, using 128-bit keys only.  It is
> present on both the Wii and the Wii U, and is apparently identical in
> both consoles.
> 
> The hardware is capable of firing an interrupt when the operation is
> done, but this driver currently uses a busy loop, I’m not too sure
> whether it would be preferable to switch, nor how to achieve that.
> 
> It also supports a mode where no operation is done, and thus could be
> used as a DMA copy engine, but I don’t know how to expose that to the
> kernel or whether it would even be useful.
> 
> In my testing, on a Wii U, this driver reaches 80.7 MiB/s, while the
> aes-generic driver only reaches 30.9 MiB/s, so it is a quite welcome
> speedup.
> 
> This driver was written based on reversed documentation, see:
> https://wiibrew.org/wiki/Hardware/AES
> 
> Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
> Tested-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>  # on Wii U

[...]

> +static int
> +do_crypt(const void *src, void *dst, u32 len, u32 flags)
> +{
> +	u32 blocks = ((len >> 4) - 1) & AES_CTRL_BLOCK;
> +	u32 status;
> +	u32 counter = OP_TIMEOUT;
> +	u32 i;
> +
> +	/* Flush out all of src, we can’t know whether any of it is in cache */
> +	for (i = 0; i < len; i += 32)
> +		__asm__("dcbf 0, %0" : : "r" (src + i));
> +	__asm__("sync" : : : "memory");
> +
> +	/* Set the addresses for DMA */
> +	iowrite32be(virt_to_phys((void *)src), base + AES_SRC);
> +	iowrite32be(virt_to_phys(dst), base + AES_DEST);

Hello

Since you do DMA operation, I think you should use the DMA-API and call dma_map_xxx()
This will prevent the use of __asm__ and virt_to_phys().

Regards
