Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F49C64A4FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 17:38:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NW6kJ0hjQz3bhN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 03:38:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lIFXcScE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=robert.foss@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lIFXcScE;
	dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NW6jK43hkz3bTS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 03:37:07 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id v8so13692780edi.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
        b=lIFXcScE+1mmzH1SBNLfPzmU2yyZ22FDa7zo6/O0Bw9aIOxDeXxYkEVfus52JWuhda
         4ouELocZnEhmnwFppolEYq4c3c7RHYAqD4pax4M3unQDLONiM/9+ejXSM9E2FE+Z0v02
         plxbNMhSLCExfq6g58BwEJLatQLzpt/xLWOhKWfMwSgaHbhPuPfGnoShEU2Q/8V0GhBe
         I8mO/6POKEHTvHhiQrSmT3i/DlcfyH1o4pAMtSuNXvNoHj+mOy3GKKCsRTSQGVPFd3Z7
         AQYI0FN6wamo3RnZf0VXDCwVvMRjPWjYDkKYXDeP5o/vQIFIn9FanCQzU/XNFNQHrfWF
         2geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYON1Uq6UT3Qph7OPPr0NH47G6rUYR8O1BO9MFwJow=;
        b=keicPSX0Qq+HGTw5Y94jpW5lSBP5DhDfvJFU3I5Nd/czgvJ1Ufx+kDa9TJIwFZQ2F6
         sOrGbm67aNDw44JvtLSI0KJW+qUqutvj9JQ171NxwhQw32BSoQg/5aZJWUggPkdOmuK3
         5vyKmVKxNVFiNrZ5A0XQ7aLKJa9GHL2wjyrqs30VUUJ19gsDf8GBEh2fEyN9i589G9vi
         O18HN9PNPHD59qf8aQd4dTqYjBpuCYp/XX/rYUy4B1EVtsyZGvFrhcJQHqCOoUe8wrvf
         Xuh/PNcq9jWWUBiEYIxDZM4Vh+NH+nFHRoT76ciUlxjk4ItodUzPDQmUS62K/XY8Mn4E
         +hww==
X-Gm-Message-State: ANoB5pmu+PS8xocvob5mW0m2kd1MEF2Q6G2ZTPnwUcprr9cujkkIB1R+
	YmU96H6d8QmbeMAwe+n8Hq4ZvA==
X-Google-Smtp-Source: AA0mqf5ppTTyM6N0bPOAfBX//eKXVRPakyRimeYdkY/8NocUbAvjnOSiYLmQOcD2W7tmhBu2XO410g==
X-Received: by 2002:a05:6402:702:b0:46f:68d0:76 with SMTP id w2-20020a056402070200b0046f68d00076mr10093614edx.34.1670863020790;
        Mon, 12 Dec 2022 08:37:00 -0800 (PST)
Received: from prec5560.. ([2001:bf7:830:a7a8:ff97:7d8d:1f2e:ffaa])
        by smtp.gmail.com with ESMTPSA id m15-20020a50930f000000b00463597d2c25sm4051979eda.74.2022.12.12.08.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 08:37:00 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: Lee Jones <lee.jones@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Grant Likely <grant.likely@linaro.org>
Subject: Re: (subset) [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Date: Mon, 12 Dec 2022 17:36:51 +0100
Message-Id: <167086288411.3041259.17824406556561546642.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>, linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

Applied, thanks!

Repo: https://cgit.freedesktop.org/drm/drm-misc/


[014/606] drm/bridge: adv7511: Convert to i2c's .probe_new()
          commit: 1c546894ff82f8b7c070998c03f9b15a3499f326
[028/606] drm/bridge: parade-ps8622: Convert to i2c's .probe_new()
          commit: d6b522e9bbb0cca1aeae4ef6188800534794836f
[035/606] drm/bridge: ti-sn65dsi83: Convert to i2c's .probe_new()
          commit: 0f6548807fa77e87bbc37964c6b1ed9ba6e1155d



rob

