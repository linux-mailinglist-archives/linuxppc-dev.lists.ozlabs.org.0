Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 027DA648969
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 21:14:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NTMgB5jJ6z3bgj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Dec 2022 07:14:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=blV6eki9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=robert.foss@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=blV6eki9;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NT8jn5r61z3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 23:00:43 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id gh17so10977415ejb.6
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Dec 2022 04:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
        b=blV6eki9f/dE3yt8k9vQjmYbdmKqtjXhWL8aRDi0+PTy9DZ7PoASn6Hb4YDawt6/Pq
         TOTWkNyJ1bQ0LXeAOKmZsgrohPEAxg4I9Vxq8Iql4MCfOpzd9bk59Kg8A1l2aCabzc1i
         Pwb8zUD5pTagBDWz9wlqw8be8RXHOe4ntLhBEh7HXgPppKgizTPX68btz3fJ69iSfJef
         zAFAyKFjvCY4s0mBfuw+77i/sj6ivMcyXsKkk5Q+7miuQY1uqqYMcxvazgbad3gQhSeN
         osKwSC1CYREx2mikz7Rsbjiro/V/gVq1uBZVJYbtUMGcexuFEHFb/xJK0jJPCO1YVyoF
         GpZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCwzWMPdgO9Dcc0FuYTNg8nT6gaYsC62geOPdirkTlQ=;
        b=VP43sSDw3XChe+DWXa7N5crhJoUIj3CZItO6J8/ddX3JorGat9wtbJIA2M0DDMR+aA
         ns3elv/9E104zLvpdH34IpvpdQT3n9n/hp5gKaaijAueInQeIz7RosmYHenSZhK9a22T
         2hvOT/7BRt7Wqvujahy/enyEhrSHL9E5waJQokWkECsTbZBfsm8SQGFFt/AJb3jVuaHO
         Fdm0zHi2mz9bVxSGzEo63ch56tP0RijDBILpXrZuDWRFBJtZKsuhJ3csoJ3faHIAXq4r
         j1yTBfceVUwN+ZqKFIjz4BRTo0etAVQIjaWA0jGWBAWL1nXSjgAM0kGpTTii0oeV1X7K
         /kPg==
X-Gm-Message-State: ANoB5pn5rhk0BGIudXh/TmT16w9j9oH0yPSCNm+iUjtRgzxl7FOOm6jF
	E6JjXU+na2ORH+idBHmhXAEsWw==
X-Google-Smtp-Source: AA0mqf7P1uuFrcKToZQL1Qs7OSMRUELHntqUphTx86r+y9eGx8OMntNtg5Twtz4wxSVo6DNFFYUZgg==
X-Received: by 2002:a17:906:4907:b0:7c0:d4fa:3151 with SMTP id b7-20020a170906490700b007c0d4fa3151mr4765674ejq.17.1670587236522;
        Fri, 09 Dec 2022 04:00:36 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906861700b007c0a7286c0asm489597ejx.58.2022.12.09.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 04:00:35 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Wolfram Sang <wsa@kernel.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Grant Likely <grant.likely@linaro.org>,
	Lee Jones <lee.jones@linaro.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Date: Fri,  9 Dec 2022 13:00:14 +0100
Message-Id: <167058708567.1651663.18170722235132459286.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Dec 2022 07:12:35 +1100
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
Cc: linux-fbdev@vger.kernel.org, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, alsa-devel@alsa-project.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, linux-k
 ernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, patches@opensource.cirrus.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Nov 2022 23:35:34 +0100, Uwe Kleine-König wrote:
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Applied all patches that build.

Patches excluded:
 - ps8622
 - ti-sn65dsi83
 - adv7511

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[014/606] drm/bridge: adv7511: Convert to i2c's .probe_new()
          (no commit info)
[015/606] drm/bridge/analogix/anx6345: Convert to i2c's .probe_new()
          (no commit info)
[016/606] drm/bridge/analogix/anx78xx: Convert to i2c's .probe_new()
          (no commit info)
[017/606] drm/bridge: anx7625: Convert to i2c's .probe_new()
          (no commit info)
[018/606] drm/bridge: icn6211: Convert to i2c's .probe_new()
          (no commit info)
[019/606] drm/bridge: chrontel-ch7033: Convert to i2c's .probe_new()
          commit: 8dc6de280f01c0f7b8d40435736f3c975368ad70
[020/606] drm/bridge: it6505: Convert to i2c's .probe_new()
          (no commit info)
[021/606] drm/bridge: it66121: Convert to i2c's .probe_new()
          (no commit info)
[022/606] drm/bridge: lt8912b: Convert to i2c's .probe_new()
          (no commit info)
[023/606] drm/bridge: lt9211: Convert to i2c's .probe_new()
          (no commit info)
[024/606] drm/bridge: lt9611: Convert to i2c's .probe_new()
          (no commit info)
[025/606] drm/bridge: lt9611uxc: Convert to i2c's .probe_new()
          (no commit info)
[026/606] drm/bridge: megachips: Convert to i2c's .probe_new()
          (no commit info)
[027/606] drm/bridge: nxp-ptn3460: Convert to i2c's .probe_new()
          (no commit info)
[028/606] drm/bridge: parade-ps8622: Convert to i2c's .probe_new()
          (no commit info)
[029/606] drm/bridge: sii902x: Convert to i2c's .probe_new()
          (no commit info)
[030/606] drm/bridge: sii9234: Convert to i2c's .probe_new()
          (no commit info)
[031/606] drm/bridge: sii8620: Convert to i2c's .probe_new()
          (no commit info)
[032/606] drm/bridge: tc358767: Convert to i2c's .probe_new()
          (no commit info)
[033/606] drm/bridge: tc358768: Convert to i2c's .probe_new()
          (no commit info)
[034/606] drm/bridge/tc358775: Convert to i2c's .probe_new()
          (no commit info)
[035/606] drm/bridge: ti-sn65dsi83: Convert to i2c's .probe_new()
          (no commit info)
[037/606] drm/bridge: tfp410: Convert to i2c's .probe_new()
          (no commit info)



rob

