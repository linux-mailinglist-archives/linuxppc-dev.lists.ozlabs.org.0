Return-Path: <linuxppc-dev+bounces-4629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A5A00833
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:02:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPgf772Sxz30TG;
	Fri,  3 Jan 2025 22:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735902175;
	cv=none; b=JPnKXoyl2t2hGUmUXL/EznwEtGnVV626fgUP80V8nLE6+2K7jMLd5AGJRMaN2Tk3nV9bAOrx4xMHCO2pg6Q7ZFE/66J09kM0yDQrDoI+g9pc9cgjp6d9D3Fp5uFuFKzi3orTf6hKv3gYvQa76mWlESVwV70WdBTHB+1sqL1Xma88mD/nQs3P5RFdzwDDevxvWJukBlC5TGdk5athMym/rdkGXETfqEEGJTwLZfor15zl4yyrAjxlwOotteDz0a0/K0Al5VvWhdNLc2GaKiXgeSJ2TEHFcaVfv7M186J6ahWaTCkjQGKZ8OiD1e/P6aba7YKrL0T2Zs0EPOtZnCr32g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735902175; c=relaxed/relaxed;
	bh=/rOuOQCXPeEPXSdaRhoiaWfBCbmAh7K8VZCZZW8dAIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwkOLzF9FVDD4jAFZXwzDj7n9ezx9ArBzfYyJDiXd7ZF+dqFdhc71ssAjuGSEQPc781+Y0Sb3B87z03TB+wJHmb2VCk9FGffcKQtL/Uvt3e2jCCb2SUyoUYkqsoCNGI+Vdttys74N6pJOyAM1PBnhZbzJGbh5mAWU9+mdRtDxpN2vKCi3mq2RKKEgQLqf22KaS1Bh2RBFInVKJUJZZ/bYZNyvbVN4nm4q6XbVc6RCurKufs7bt/VtSzu2+i6/10sKEUySflh7+aZ5DvRLaI0RVqv4k4+frqayCU0BAldkwZSFkSpjG7oFabEFvtd+i7DgCwUu0rOro3jJrkvtWF0ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJ/aUzBk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aJ/aUzBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=philipp.g.hortmann@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPgf50zM5z30TC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:02:52 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d84179ef26so18116468a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 03:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735902169; x=1736506969; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rOuOQCXPeEPXSdaRhoiaWfBCbmAh7K8VZCZZW8dAIM=;
        b=aJ/aUzBkKq9o7T5ffLZycFwA1Q/VeGOGToYFIXjpRMaqtg9GyjlNh7iSFpVRMFIxZL
         B8YurRY5YjMyyglWEPYIl4R9n4TSlJNs7SBV/hNIuSt1sA0IPqdKc00x4jl3Pr1I2wQR
         3BdL2WyGWJUKrCRiFgwI/MWg/RD5ZXPfxehc6bDIcXBf1N2XJzqzMLLmXpI0QL0KWU4D
         TisX+GBcw2aq3FIKmd7hZvvB8uuPzbE0+ASWVaLKMqzYDQOtSMbqmYx1IZAHcWViKSQa
         FukuGzAQ4QrtLO2mwJI5r3ho2Z11utf3eQaucPRwX3dhQu17B9w9hbeCWPE8bSxIu3SD
         +EdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902169; x=1736506969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rOuOQCXPeEPXSdaRhoiaWfBCbmAh7K8VZCZZW8dAIM=;
        b=HRKN/YPjwQLcWh9FzR90z32dcMVQvpEGiKVh/DCUo6LtogVcfoyREAxiS7Ohe8t+Jv
         qFyPBOMyZRfdHwQ6gmEIX6GwreEajQoa1Qklz7wYKm96wcvoyB2Xd8YKIqKHE7srvwLh
         O5UDD1yymuKihTHeJIFf2cxpHM75N7FSq+EofqfKpxZ1JcZ+7862YyIp144RoNV3SAD0
         3NPZNhcuNDmWzscUlBBhwbIdld6UjXv0k29phcFJQJlYYYc5zK3/WnWK27hhs585qXLu
         qKrHBDI+lwxuV1D1+PaGlzIA1GDNihdG3meENwpsLnpMyVAdpew9HqMkIBfOB2UBG1G8
         N7XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe9XKyVrzzDAx2D4KAkWGYk7M7+rC4biMWV5ZGGN3uu8SSP+X4opDRXtEP+y5a9aS16rSf3pQwYhppjtg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywn9qFJFHpWfvC8kQ85+U8z2GtOe2veRC7fIXIP8IgRb9YsKa2s
	tYvQQeRXvMkAMTKEek4Xc99B4ywAav39Hkyhs9KWPLhVo8xl3DhK
X-Gm-Gg: ASbGncs3TkOasi+kgLbqk2g+mjNiTAFlyi9dmYIepBh9oPEJGrqtMkYd/Mnr9Pdis3y
	GS/OFAtayxphdZoPnoZ6akabuUyuwAO6qsRXGw/jg4SrD1lHg1U6fptS+GlLFuzU84y4Xp11LRY
	BsQVVfjRtThBOPwoUfduda/dgR3kI/5eM9PRw9jbTaJKcLa/gEnvH13Wy43AIluaC9TCt2SxwZb
	ztzcKYdlyc2waSwBDT6Bfv7tVVHOh3G+Um/wCwx/Wkf5CGuZY4QMRStXyuYinvfClvgMvfevgcz
	0cwusmlpWAmRhaDf0E50T8fgGvNJeltA9k1sdWSn
X-Google-Smtp-Source: AGHT+IELOj3ljb0yz/zpTAl091B9waIEdRafqL0QKOui6kqdPzcOHU9l3lR4G6t4WMgvS5W/cdGrCw==
X-Received: by 2002:a05:6402:26d6:b0:5d3:cd5b:64da with SMTP id 4fb4d7f45d1cf-5d81ddfd841mr38618019a12.23.1735902168650;
        Fri, 03 Jan 2025 03:02:48 -0800 (PST)
Received: from ?IPV6:2a02:3033:600:7448:4613:e00c:fbb7:1d60? ([2a02:3033:600:7448:4613:e00c:fbb7:1d60])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701bf20sm19347935a12.83.2025.01.03.03.02.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:02:47 -0800 (PST)
Message-ID: <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
Date: Fri, 3 Jan 2025 12:02:43 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geoff Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>,
 Stanislaw Gruszka <stf_xl@wp.pl>,
 Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
 <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 03.01.25 09:53, Geert Uytterhoeven wrote:
> Care to tell us where the fix is?
Hi Geert,

please find all patches for T2 on this page:
https://wiki.t2linux.org/guides/kernel/
More exact here:
git clone --depth=1 https://github.com/t2linux/linux-t2-patches patches

Bye Philipp




