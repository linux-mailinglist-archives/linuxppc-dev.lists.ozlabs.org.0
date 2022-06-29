Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2C560C28
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 00:14:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYG3S6Hdhz3dq7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 08:14:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S2dVib/e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com; envelope-from=luzmaximilian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=S2dVib/e;
	dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY3fn40mNz3cD9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 00:26:08 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id h23so32878909ejj.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
        b=S2dVib/eYmAFl827WdIoCLllzfbxALRjIjzfRRwuBWpdbVEMsjXdf1fQZ0QK1n2n0J
         7Rc0uKmDUlj06sv7gme85B+3fLmze+mOouy0tIsuBDVpy1nD4eEh9k2i1LyAyfo/z7Zj
         KDlk5RBwfb1T/0o1rVzuZORFiKZsCvSsNfve9fNt60vuT8XdzQWLTwkS/9FAhK69nmEs
         mEzSIHBFyIvznhb3ZYEmWznM5HxrpFTwi8PXn2kSF7LDJWEQQU2316sTZ03OvudAaN+G
         thYeRK11RnXT7zItby/QP43/O2E1Z4EfVZv3Nyn7dRrR7zoEuvKZKKrx+f9P5pfvx3Rg
         uLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nzVAkjUIXnSmifmZO/KNuTW33GCGTCzsi9aX026XXeg=;
        b=OBbKECVh5iXCRjjJ2/42rDZSTjKtWslkKY9pBlF8FuaLV7gOKrHX4sUDIvBnOqFYKK
         ATZ4wHwDNuyIoGTBDZWwrAzW9TwwauLTw5FVDt89y3MyPIfoF3+y8YCNHkDlhBaWMs4z
         ien9dyGZoI2zDrM/edCEK+gAKHBZaDK8qXm5y9Gzqic6GK9rlvRGcRvGm992VT728YM2
         +xSsnDQH343XyitD+Z8w+5bAmjSemKvD70mQfZdmwDMTa6utqFQaV6kUEIduCCCb8ZHs
         zhkk3mDNeidxz5yolliIE35MF76KH6y//hq6khYIUiRpptq/xVAOixwTfjzLV4rFK2x3
         wk6w==
X-Gm-Message-State: AJIora8hoeyRcXXOJJd5ksSb5oJmcOXQIqf9DXfDJHGmiUNP2umcv0it
	+HA+AWq/CO188NhiiyxZGhs=
X-Google-Smtp-Source: AGRyM1vLxTFMIxeh0MQDJmw094z51hmalDIKhKM+71jelG0gY6NpuuzQXDALY4ZT1iSuYjMs9++euw==
X-Received: by 2002:a17:906:58cf:b0:722:e4e1:c174 with SMTP id e15-20020a17090658cf00b00722e4e1c174mr3593366ejs.85.1656512758310;
        Wed, 29 Jun 2022 07:25:58 -0700 (PDT)
Received: from [10.29.0.16] ([37.120.217.82])
        by smtp.gmail.com with ESMTPSA id jy19-20020a170907763300b007263713cfe9sm7220580ejc.169.2022.06.29.07.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 07:25:57 -0700 (PDT)
Message-ID: <80117936-6869-19b2-45a6-96a4562c6cd2@gmail.com>
Date: Wed, 29 Jun 2022 16:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 08:13:02 +1000
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
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev, devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, netdev@vger.kernel.org, kasan-dev@googlegroups.com, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev, linux-omap@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>, Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org, linux-media@vger.kernel.org, Shawn Tu <shawnx.tu@intel.com>, linux-hwmon@v
 ger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-serial@vger.kernel.org, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>, Manivannan Sadhasivam <mani@kernel.org>, Jiri Kosina <jikos@kernel.org>, linuxppc-dev@lists.ozlabs.org, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, platform-driver-x86@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@kernel.org>, linux-crypto@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus
 .com, linux-integrity@vger.kernel.org, =?UTF-8?Q?Pali

_Roh=c3=a1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/28/22 16:03, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

[...]
>   drivers/platform/surface/surface3_power.c                 | 4 +---

[...]

> diff --git a/drivers/platform/surface/surface3_power.c b/drivers/platform/surface/surface3_power.c
> index 444ec81ba02d..3b20dddeb815 100644
> --- a/drivers/platform/surface/surface3_power.c
> +++ b/drivers/platform/surface/surface3_power.c
> @@ -554,7 +554,7 @@ static int mshw0011_probe(struct i2c_client *client)
>   	return error;
>   }
>   
> -static int mshw0011_remove(struct i2c_client *client)
> +static void mshw0011_remove(struct i2c_client *client)
>   {
>   	struct mshw0011_data *cdata = i2c_get_clientdata(client);
>   
> @@ -564,8 +564,6 @@ static int mshw0011_remove(struct i2c_client *client)
>   		kthread_stop(cdata->poll_task);
>   
>   	i2c_unregister_device(cdata->bat0);
> -
> -	return 0;
>   }
>   
>   static const struct acpi_device_id mshw0011_acpi_match[] = {

For the quoted above:

Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
