Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD156343EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 19:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGtX54ThFz3cbV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 05:46:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhEERrBR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhEERrBR;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGtW86Gngz3cFv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 05:45:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15F7C6164C;
	Tue, 22 Nov 2022 18:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B47C433C1;
	Tue, 22 Nov 2022 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669142752;
	bh=fqxt6my1VSa4mXhEYdIoCfXvdzW45n/iFIvfCGSEDwo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hhEERrBRIpsc+q9yO9csAlWHVhCaviR/WcBNWNuioF+tk6pV0ZhL7NiG1rd0mCAxq
	 1szidsMiWWaFcDgeW9EGShTYklszbBWjIUflN4ZPlaCK62nJuyzjDBPZTppOU3jv4N
	 8/hxDxIBUqAHSPgEChU749Xv+EuNTWQcC+6zplPAHN/Izkl+hvR/NDoy/ucWGRSQdw
	 6okmEtteWfpDi+EH50bg96/6ZjPlAMMe5gMT1Fl+eoDaKbHg0REnL4BteXHVhuIHEj
	 P64Js1Mq3YXxz372bDZyRlFZt9w4L3EsyIeqfNpZZSqs+lnqo+Nmvd9aWM/UsJjBvO
	 sa1pYfX2CaTsw==
Date: Tue, 22 Nov 2022 18:58:18 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH 000/606] i2c: Complete conversion to i2c_probe_new
Message-ID: <20221122185818.3740200d@jic23-huawei>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org, linux-input@vger.kernel.org, Grant Likely <grant.likely@linaro.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, chrome-platform@lists.linux.dev, linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, Angel Iglesias <ang.iglesiasg@gmail.com>, gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, openipmi-developer@lists
 .sourceforge.net, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Queued all of the below:
with one tweaked as per your suggestion and the highlighted one dropped on basis
I was already carrying the equivalent - as you pointed out.

I was already carrying the required dependency.

Includes the IIO ones in staging.

Thanks,

Jonathan

p.s. I perhaps foolishly did this in a highly manual way so as to
also pick up Andy's RB.  So might have dropped one...

Definitely would have been better as one patch per subsystem with
a cover letter suitable for replies like Andy's to be picked up
by b4.


>   iio: accel: adxl372_i2c: Convert to i2c's .probe_new()
>   iio: accel: bma180: Convert to i2c's .probe_new()
>   iio: accel: bma400: Convert to i2c's .probe_new()
>   iio: accel: bmc150: Convert to i2c's .probe_new()
>   iio: accel: da280: Convert to i2c's .probe_new()
>   iio: accel: kxcjk-1013: Convert to i2c's .probe_new()
>   iio: accel: mma7455_i2c: Convert to i2c's .probe_new()
>   iio: accel: mma8452: Convert to i2c's .probe_new()
>   iio: accel: mma9551: Convert to i2c's .probe_new()
>   iio: accel: mma9553: Convert to i2c's .probe_new()
>   iio: adc: ad7091r5: Convert to i2c's .probe_new()
>   iio: adc: ad7291: Convert to i2c's .probe_new()
>   iio: adc: ad799x: Convert to i2c's .probe_new()
>   iio: adc: ina2xx-adc: Convert to i2c's .probe_new()
>   iio: adc: ltc2471: Convert to i2c's .probe_new()
>   iio: adc: ltc2485: Convert to i2c's .probe_new()
>   iio: adc: ltc2497: Convert to i2c's .probe_new()
>   iio: adc: max1363: Convert to i2c's .probe_new()
>   iio: adc: max9611: Convert to i2c's .probe_new()
>   iio: adc: mcp3422: Convert to i2c's .probe_new()
>   iio: adc: ti-adc081c: Convert to i2c's .probe_new()
>   iio: adc: ti-ads1015: Convert to i2c's .probe_new()
>   iio: cdc: ad7150: Convert to i2c's .probe_new()
>   iio: cdc: ad7746: Convert to i2c's .probe_new()
>   iio: chemical: ams-iaq-core: Convert to i2c's .probe_new()
>   iio: chemical: atlas-ezo-sensor: Convert to i2c's .probe_new()
>   iio: chemical: atlas-sensor: Convert to i2c's .probe_new()
>   iio: chemical: bme680_i2c: Convert to i2c's .probe_new()
>   iio: chemical: ccs811: Convert to i2c's .probe_new()
>   iio: chemical: scd4x: Convert to i2c's .probe_new()
>   iio: chemical: sgp30: Convert to i2c's .probe_new()
>   iio: chemical: sgp40: Convert to i2c's .probe_new()
>   iio: chemical: vz89x: Convert to i2c's .probe_new()
>   iio: dac: ad5064: Convert to i2c's .probe_new()
>   iio: dac: ad5380: Convert to i2c's .probe_new()
>   iio: dac: ad5446: Convert to i2c's .probe_new()
>   iio: dac: ad5593r: Convert to i2c's .probe_new()
>   iio: dac: ad5696-i2c: Convert to i2c's .probe_new()
>   iio: dac: ds4424: Convert to i2c's .probe_new()
>   iio: dac: m62332: Convert to i2c's .probe_new()
>   iio: dac: max517: Convert to i2c's .probe_new()
>   iio: dac: max5821: Convert to i2c's .probe_new()
>   iio: dac: mcp4725: Convert to i2c's .probe_new()
>   iio: dac: ti-dac5571: Convert to i2c's .probe_new()
>   iio: gyro: bmg160_i2c: Convert to i2c's .probe_new()
>   iio: gyro: itg3200_core: Convert to i2c's .probe_new()
>   iio: gyro: mpu3050-i2c: Convert to i2c's .probe_new()
>   iio: gyro: st_gyro_i2c: Convert to i2c's .probe_new()
>   iio: health: afe4404: Convert to i2c's .probe_new()
>   iio: health: max30100: Convert to i2c's .probe_new()
>   iio: health: max30102: Convert to i2c's .probe_new()
>   iio: humidity: am2315: Convert to i2c's .probe_new()
>   iio: humidity: hdc100x: Convert to i2c's .probe_new()
>   iio: humidity: hdc2010: Convert to i2c's .probe_new()
>   iio: humidity: hts221_i2c: Convert to i2c's .probe_new()
>   iio: humidity: htu21: Convert to i2c's .probe_new()
>   iio: humidity: si7005: Convert to i2c's .probe_new()
>   iio: humidity: si7020: Convert to i2c's .probe_new()
>   iio: imu: bmi160/bmi160_i2c: Convert to i2c's .probe_new()
>   iio: imu: fxos8700_i2c: Convert to i2c's .probe_new()
>   iio: imu: inv_mpu6050: Convert to i2c's .probe_new()
>   iio: imu: kmx61: Convert to i2c's .probe_new()
>   iio: imu: st_lsm6dsx: Convert to i2c's .probe_new()
>   iio: light: adjd_s311: Convert to i2c's .probe_new()
>   iio: light: adux1020: Convert to i2c's .probe_new()
>   iio: light: al3010: Convert to i2c's .probe_new()
>   iio: light: al3320a: Convert to i2c's .probe_new()
>   iio: light: apds9300: Convert to i2c's .probe_new()
>   iio: light: apds9960: Convert to i2c's .probe_new()
>   iio: light: bh1750: Convert to i2c's .probe_new()
>   iio: light: bh1780: Convert to i2c's .probe_new()
>   iio: light: cm3232: Convert to i2c's .probe_new()
>   iio: light: cm3323: Convert to i2c's .probe_new()
>   iio: light: cm36651: Convert to i2c's .probe_new()
>   iio: light: gp2ap002: Convert to i2c's .probe_new()
>   iio: light: gp2ap020a00f: Convert to i2c's .probe_new()
>   iio: light: isl29018: Convert to i2c's .probe_new()
>   iio: light: isl29028: Convert to i2c's .probe_new()
>   iio: light: isl29125: Convert to i2c's .probe_new()
>   iio: light: jsa1212: Convert to i2c's .probe_new()
>   iio: light: ltr501: Convert to i2c's .probe_new()
>   iio: light: lv0104cs: Convert to i2c's .probe_new()
>   iio: light: max44000: Convert to i2c's .probe_new()
>   iio: light: max44009: Convert to i2c's .probe_new()
>   iio: light: noa1305: Convert to i2c's .probe_new()
>   iio: light: opt3001: Convert to i2c's .probe_new()
>   iio: light: pa12203001: Convert to i2c's .probe_new()
>   iio: light: rpr0521: Convert to i2c's .probe_new()
>   iio: light: si1133: Convert to i2c's .probe_new()
>   iio: light: si1145: Convert to i2c's .probe_new()
>   iio: light: st_uvis25_i2c: Convert to i2c's .probe_new()
>   iio: light: stk3310: Convert to i2c's .probe_new()
>   iio: light: tcs3414: Convert to i2c's .probe_new()
>   iio: light: tcs3472: Convert to i2c's .probe_new()
>   iio: light: tsl2563: Convert to i2c's .probe_new()
>   iio: light: tsl2583: Convert to i2c's .probe_new()
>   iio: light: tsl2772: Convert to i2c's .probe_new()
>   iio: light: tsl4531: Convert to i2c's .probe_new()
>   iio: light: us5182d: Convert to i2c's .probe_new()
>   iio: light: vcnl4000: Convert to i2c's .probe_new()
>   iio: light: vcnl4035: Convert to i2c's .probe_new()
>   iio: light: veml6030: Convert to i2c's .probe_new()
>   iio: light: veml6070: Convert to i2c's .probe_new()
>   iio: light: zopt2201: Convert to i2c's .probe_new()
>   iio: magnetometer: ak8974: Convert to i2c's .probe_new()
>   iio: magnetometer: ak8975: Convert to i2c's .probe_new()
>   iio: magnetometer: bmc150_magn_i2c: Convert to i2c's .probe_new()
>   iio: magnetometer: hmc5843: Convert to i2c's .probe_new()
>   iio: magnetometer: mag3110: Convert to i2c's .probe_new()
>   iio: magnetometer: mmc35240: Convert to i2c's .probe_new()
>   iio: magnetometer: yamaha-yas530: Convert to i2c's .probe_new()
>   iio: potentiometer: ad5272: Convert to i2c's .probe_new()
>   iio: potentiometer: ds1803: Convert to i2c's .probe_new()
>   iio: potentiometer: max5432: Convert to i2c's .probe_new()
>   iio: potentiometer: tpl0102: Convert to i2c's .probe_new()
>   iio: potentiostat: lmp91000: Convert to i2c's .probe_new()
>   iio: pressure: abp060mg: Convert to i2c's .probe_new()
Not this one > iio: pressure: bmp280-i2c: Convert to i2c's .probe_new()
>   iio: pressure: dlhl60d: Convert to i2c's .probe_new()
>   iio: pressure: dps310: Convert to i2c's .probe_new()
>   iio: pressure: hp03: Convert to i2c's .probe_new()
>   iio: pressure: hp206c: Convert to i2c's .probe_new()
>   iio: pressure: icp10100: Convert to i2c's .probe_new()
>   iio: pressure: mpl115_i2c: Convert to i2c's .probe_new()
>   iio: pressure: mpl3115: Convert to i2c's .probe_new()
>   iio: pressure: ms5611_i2c: Convert to i2c's .probe_new()
>   iio: pressure: ms5637: Convert to i2c's .probe_new()
>   iio: pressure: st_pressure_i2c: Convert to i2c's .probe_new()
>   iio: pressure: t5403: Convert to i2c's .probe_new()
>   iio: pressure: zpa2326_i2c: Convert to i2c's .probe_new()
>   iio: proximity: isl29501: Convert to i2c's .probe_new()
>   iio: proximity: mb1232: Convert to i2c's .probe_new()
>   iio: proximity: pulsedlight-lidar-lite-v2: Convert to i2c's
>     .probe_new()
>   iio: proximity: rfd77402: Convert to i2c's .probe_new()
>   iio: proximity: srf08: Convert to i2c's .probe_new()
>   iio: proximity: sx9500: Convert to i2c's .probe_new()
>   iio: temperature: mlx90614: Convert to i2c's .probe_new()
>   iio: temperature: mlx90632: Convert to i2c's .probe_new()
>   iio: temperature: tmp006: Convert to i2c's .probe_new()
>   iio: temperature: tmp007: Convert to i2c's .probe_new()
>   iio: temperature: tsys01: Convert to i2c's .probe_new()
>   iio: temperature: tsys02d: Convert to i2c's .probe_new()
...

>   staging: iio: adt7316: Convert to i2c's .probe_new()
>   staging: iio: ad5933: Convert to i2c's .probe_new()
>   staging: iio: ade7854: Convert to i2c's .probe_new()
 
