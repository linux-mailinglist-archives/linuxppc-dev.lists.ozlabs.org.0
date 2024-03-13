Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFCE87A3AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 08:40:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBXiIRPj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvj906fLcz3vbl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 18:40:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=JBXiIRPj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tvj8D1J71z2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 18:39:38 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a44665605f3so876193766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 00:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710315572; x=1710920372; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=JBXiIRPjyXSRjeg73eeKrgUa8r664IoTGKqnjwyUBEXy/9ywdun3bkPQPg2jFXTfH6
         CBI8DFKdSD5qUdAthwXQPCSBccAr2H0ReOSyXpFyZp7/+g0Fo+X2lUrgT5e6An5ypc1H
         A6WED7iUiBeYiIxrw87P5AhEtvSpxdS6BlLuJuKyNRb4JeKAYToo+uMKHPd9MLWYLjGt
         mcLwk31rqRZa2w8S0SbIxxg+CK6q0e9p6pHojw9eQZ34w5Hm/1dhnFliq7lCOwnJ9mBB
         SIxJkc7D+tp2tY77+MZ2VpT/kmXqev7SOYoaGNnMpG6PR9zjrwfOQd5OERHf1lHRURCn
         4Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710315572; x=1710920372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=rHTH5OrGgUYAwKdKTMzi56Wd/4QvP8ZwGEO0eFFn3FwyuEwfQMzBWk9GDYdWAzGosh
         tXFsIzsju4paQVIY8AN2nlm7o9qKIlB256ugRcPS71cLNIKrRiA6E48lZtPSc1Yo5exY
         VisXGPtsqB7n55KPMgqg8Md8150qd2JFKmYjpVnm3Lo7gvpZFI6L6TOj/AuIgfIDzAj6
         2gcnLYGjcvCFTpgrJG6E+BmR50SgNBuY0LjJf32l3tjhC2SVkX5xl5L9fDelQIJ0tMya
         k2N4jxrRshkIkNcNzjH7VC9eGAKKzvvRcuSpFcZhjpxMllyh0JgljveADPvXDW773ANz
         2yug==
X-Forwarded-Encrypted: i=1; AJvYcCVaaf0V/rOjSbt46E8qsLesrQsavfjQkrYNSpZHaSaGP+o7sOGhVbyZQTFpNd+ugujchbUKQiTIDc4TZJVvdLGLYDaKBF6TYs0o7HO/jg==
X-Gm-Message-State: AOJu0Yxeah8KTAryV7WFaC8svj+J6+BrHQo5hLDnQdQG5sGaX5Awr6D6
	piMII3BRp/5LfiPS/xVUXeKwXnOibpfsUVn5oV1u/mnhWtYmvU7m9e+Md9LbhoE=
X-Google-Smtp-Source: AGHT+IH38GneADkyKtRbEkb8+HLK5ZsZNpyhD22lE4uk6eUmiwmdHa00scLatPQEFNYx/T2Y2VkSUg==
X-Received: by 2002:a17:906:2ccb:b0:a41:3e39:b918 with SMTP id r11-20020a1709062ccb00b00a413e39b918mr7484516ejr.24.1710315572226;
        Wed, 13 Mar 2024 00:39:32 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id qx26-20020a170906fcda00b00a45a687b52asm4578781ejb.213.2024.03.13.00.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 00:39:31 -0700 (PDT)
Date: Wed, 13 Mar 2024 10:39:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
Message-ID: <43ef4ef4-303b-45c6-aa50-3e0982c93bd7@moroto.mountain>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
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
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Arthur Grillo <arthurgrillo@riseup.net>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Daniel Diaz <daniel.diaz@linaro.org>, linux-sh@vger.kernel.org, Naresh Kamboju <naresh.kamboju@linaro.org>, =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, netdev@lists.linux.dev, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, David Gow <davidgow@google.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Andrew Morton <akpm@lin
 ux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

