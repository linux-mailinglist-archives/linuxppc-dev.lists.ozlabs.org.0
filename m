Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90EA6665CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jan 2023 22:47:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nsh8y3nbvz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 08:46:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=piJ6AR/7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=piJ6AR/7;
	dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsWq94xdsz3bXL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 02:31:00 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id g13so24089211lfv.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jan 2023 07:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qbu6KqoFVUP3hpnWPUahg6+pfccNp1XMgcyJhxL3sHQ=;
        b=piJ6AR/7mwIv5ssf0bPeGI/y1HfticwRpnHpKDxpJJOmyFI9+Fcte6qtWkH0I2fOxf
         xTYmiVIlFySN2KbqHCXqxzBIxc6/2nlxu2+ixkY3fDhe2OFDyngzekiuLGrNcgW/Xsu1
         xqJdTvSzEIrHX7Hx9YvafGHvvBa4vY2qsZ3b1McEzW5tmaA8Nw9+yNGHiBd8I4QF/H0L
         PLkaIsFKD8tt7+XUYZ4Z0Jp/RHCbQ3m0OkeG8mkPs1ENMKkoMw8SGGYL4Yuyp+dMY28h
         Jcy4hVLz8OdUGwq9wRNwLttaNd4at+MPk+3V1lPBjbBePveIBaxuDRkGijEMOSgYcWva
         gHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qbu6KqoFVUP3hpnWPUahg6+pfccNp1XMgcyJhxL3sHQ=;
        b=kGns3GrLn5z3ewSoAZfaXbo5E6nDL73HAL+30w67GzVCI61KtdfUVglB0hzDttB9MI
         A3n2L2XmobXy6CTwZGjKLItGwly+xA3iFueoD4pJbIwYK0AcsMfLZIQl1iDuVMiqqOiT
         K79ZSp/mbIwxhjg7yjy8M+FBOS2IAZYkL7rwBO2dqmDCaJUJPpSboA3D0PfCPS2ehG7X
         wH6k8OUdFEexhjrOyFahvzXJjFtQ4jBgb+DjqxpDWWSbrffLCBjRG/QMvPHYGdk+A49M
         vdv+t8tTbKin7PAdTUZ9PGvhC+hvyaJ2WFzVSkgGyeEAhFa3WChc/ZTiDa+uPpNmvwrK
         DHQw==
X-Gm-Message-State: AFqh2korwt+y75PdNTwvI30f1gqttJGyLH13Gpzt+qXBBFz5sc5lVGjZ
	3Lrc30TXYXE96VT8i2TymyyRTA==
X-Google-Smtp-Source: AMrXdXsJsrNv/JojgqdyGM2htDPuCMqWkk3bmrHNobr84SP2C7Wa10a79dDgSHhARO48zeWm2i9u1A==
X-Received: by 2002:ac2:495b:0:b0:4b5:6755:4226 with SMTP id o27-20020ac2495b000000b004b567554226mr19619019lfi.55.1673451054761;
        Wed, 11 Jan 2023 07:30:54 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v23-20020ac258f7000000b004cb00bf6724sm2779947lfo.143.2023.01.11.07.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:30:54 -0800 (PST)
Message-ID: <88faa612-e7a0-24b8-aba8-4a42919402ec@linaro.org>
Date: Wed, 11 Jan 2023 17:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-2-gregkh@linuxfoundation.org>
 <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
 <Y77VDGvHGu8gDIga@kroah.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y77VDGvHGu8gDIga@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 12 Jan 2023 08:46:12 +1100
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Liang He <windhl@126.com>, Zou Wei <zou_wei@huawei.com>, Samuel Holland <samuel@sholland.org>, Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Corentin Labbe <clabbe@baylibre.com>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Lyude Paul <lyude@redhat.com>, Daniel Vetter <daniel@ffwll.ch>, Nicholas Piggin <npiggin@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/01/2023 17:26, Greg Kroah-Hartman wrote:
> On Wed, Jan 11, 2023 at 08:54:04AM -0600, Rob Herring wrote:
>> On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> of_device_uevent_modalias() does not modify the device pointer passed to
>>> it, so mark it constant.  In order to properly do this, a number of
>>> busses need to have a modalias function added as they were attempting to
>>> just point to of_device_uevent_modalias instead of their bus-specific
>>> modalias function.  This is fine except if the prototype for a bus and
>>> device type modalias function diverges and then problems could happen.  To
>>> prevent all of that, just wrap the call to of_device_uevent_modalias()
>>> directly for each bus and device type individually.
>>
>> Why not just put the wrapper function in the DT code instead of making
>> 4 copies of it?
> 
> I could, if you think that it would be better there instead of in each
> individual bus (like all of the other bus callbacks).  This way each bus
> "owns" their implementation :)



I'd vote for the generic wrapper instead of 4 similar wrapper. In the 
end, if of_device_uevent_modalias (or the bus callback) interface 
changes again for whatever reasons, there will be just a single place to 
fix rather than fixing 4 (or more) bus drivers.
-- 
With best wishes
Dmitry

