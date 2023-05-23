Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4443770E78B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 23:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQnnG0djwz3fC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 07:41:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lFBe/CB0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=dmitry.torokhov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lFBe/CB0;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQnmP5z0dz2xD7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 07:40:20 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-64d2467d640so19246b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684878016; x=1687470016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s7yqKtJGQ4rO6GxpsP0WhBw/hM2jGWUUfgT4G26UFH4=;
        b=lFBe/CB0hLjL+iwz6TiXDBABiey4ZOfn0KgPP+dpPo2ZpjVk69nB3jVlZG9zfppW1I
         wV+52SS64FmIrGsLfumRbHzt1ZOcpLGXC3YTDGGyF4k4LWvDxB9GX5v8q6Sc1Myma5zq
         Td3wY9WDajX4Bq9POlxWenccYj/Vg/edoQgvU5TgevII478Lwy2z1zI8QNKbtEiBNfTG
         sUAcx7v+BaFF+f2GX6X4QnB3qqDF+1zpGcCMHXWXl8RXlJhRA2FDdYTYZXSCQPpV8IiL
         j3M38ki22Fct53VG6W9gUQ4StaAIX7o9lqQRR0FIV8DJ1T+xrKNiLhSYzPAwGUKaRzKG
         9RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684878016; x=1687470016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s7yqKtJGQ4rO6GxpsP0WhBw/hM2jGWUUfgT4G26UFH4=;
        b=eWPeWcgKqsduqdoY51qDgBRSBBLappp21QWSE6w+LpwQ/eTam/kerphGO/s5ljuSJt
         ukoqpgtpsmishfuDB2c+bZFZ9mQugQat2wpQPG7q/dxVtecyfR1Qtprsq2SiWAdnFHti
         bQp/RWJpRzOP8gfcwRGygh7N7fk8mEDkET3XtdHq8B0kq19WpZSUrbvBbss1x50KMiDR
         WBp4eaZCIrzRjeZVb1mEV95NmMh7QU95HNQyya+aTB2nU8htIWQcHNgHj0ykivTuhiP7
         izg8ix/136aY/C/yQAUl3FdOmZ4Eg/CvoVvPYzNKZvpShVGbA1KCPqaGwRNG6JzmMPx1
         36AA==
X-Gm-Message-State: AC+VfDxfoIO2JPlrC5xEgg0pvFU0l9BtTw0yVYYyLzU02qSaq2gw4DOA
	vaoWZsSm0qPESvrPnHwyA0w=
X-Google-Smtp-Source: ACHHUZ7ByQYmbPNiRk/npdxnALHiSpClUqugilniT8IGLIIEeSkstEVA1QE9+T8037r37/yslRajFw==
X-Received: by 2002:a05:6a20:728c:b0:ff:da37:ae9 with SMTP id o12-20020a056a20728c00b000ffda370ae9mr17573318pzk.53.1684878016554;
        Tue, 23 May 2023 14:40:16 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3913:9c00:6a9e:2c95])
        by smtp.gmail.com with ESMTPSA id s23-20020a63dc17000000b0052c737ea9bbsm6512466pgg.39.2023.05.23.14.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:40:15 -0700 (PDT)
Date: Tue, 23 May 2023 14:40:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] macintosh: Switch i2c drivers back to use .probe()
Message-ID: <ZG0yvL890RwSeLS8@google.com>
References: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523195053.464138-1-u.kleine-koenig@pengutronix.de>
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
Cc: Corey Minyard <cminyard@mvista.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Ajay Gupta <ajayg@nvidia.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Liang He <windhl@126.com>, Jean Delvare <jdelvare@suse.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, Adrien Grassein <adrien.grassein@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Colin Leroy <colin@colino.net>, Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Petr Machata <petrm@nvidia.com>, Maximilian Luz <luzmaximilian@gmail.com>, Wolfram Sang <wsa@kernel.org>, kernel@pengutronix.de, Hans Verkuil <hverkuil-cisco@xs4all.nl>, linuxppc-dev@lists.ozlabs.org, Peter Rosin <peda@axentia.se>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 23, 2023 at 09:50:53PM +0200, Uwe Kleine-König wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
