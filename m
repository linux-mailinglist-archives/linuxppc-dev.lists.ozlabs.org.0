Return-Path: <linuxppc-dev+bounces-15490-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539C2D0D821
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 16:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpMXT4N7Pz2yN1;
	Sun, 11 Jan 2026 02:10:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768057849;
	cv=none; b=SjTH5UB0RGMt20JIi1G2XI2p9Y+Khqq7m6R3mAArWb3FzP4nGt2S2antW2OEDYRsbYpVJOR64T4yYO0F8PnPJpTOutt/Io4xK+nP/4qSigHIIoSt3VEOKedb94i4gxIUKe4aTGQ/vo1g5zJOOgS1H4Y2H/P0wIw9ER1JohLoLRkQfPRjZ7HV9fFeRmAsogYcpSOrQ3rTkXBsMjuxLUMwaXKR7zhbEWtY4dhWfoOl0DyUh+6L/R0tRDK8foSOAe1/rQyHBg3BvjEuXtavjHkCwbkTnsZ2nwibFzgaBLRSD8o5uPO2VpL9Ki42RMN2Gz0PwO5w7RvP86Y6AkrgYwsXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768057849; c=relaxed/relaxed;
	bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdpgVSe06smaqW3t1L6/4n7uVN3ZQ2+wNRKCgu4ha0iADbefV67lsxjEJogK8Y7+aZY6bTkrt+sPfgRVpdTzudO2neceGgjcYumDHgmmRvgn67C70gnpBEDX1YsX7t1xh7IlPqeGX4nlIcSe31ZVui8+NGTctvnwdtwuJM9pvAF428NkI/LUOxyVDsW2/DcHG2GZx6SQm/78vRNI9kZZ9AGtMlTmP6PowgJMCxf89XBtTzWTYPwBv5qlj9gvH0KBHbx6VVr937/D10eTJORYifZyINZUJWd2nX1pecZMAPG5XxBnH9srOS8VexFYqJxh/hO0D4RmdVBN1tCr1u7Kgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=pDW5NAJi; dkim-atps=neutral; spf=pass (client-ip=209.85.221.45; helo=mail-wr1-f45.google.com; envelope-from=claudiu.beznea@tuxon.dev; receiver=lists.ozlabs.org) smtp.mailfrom=tuxon.dev
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=pDW5NAJi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tuxon.dev (client-ip=209.85.221.45; helo=mail-wr1-f45.google.com; envelope-from=claudiu.beznea@tuxon.dev; receiver=lists.ozlabs.org)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpMXS1wgsz2yLg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 02:10:47 +1100 (AEDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432755545fcso2961667f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 07:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=pDW5NAJilyIhgrlqkZHRVQM28dKMrRvGQNiVMsrSKbFwbnLnFQOSyh07X5Tt1ovtr2
         18EKF9Uex+kap2BMeihUGW0a81YksyVGUuikDf8Gcmgqu6IsKy9rezGnU/CoyHesS+KN
         bivxo/C5CP+SncumW5HZ+C1w3ECN7n1NsDLyMBp6sESHNPih3MUbllqeyFwx0T/Yx1eV
         J3A+Mh3FOTT4oFiZC+xO76XFs8eZVubpbe60DxFMI5ferg5jespyVVBGpvgH4HKxN5fb
         7jCM/oe0CkyesfcxONqwE8YK4ddHBG57yAE3QtAGyl6lxuIlXQr4T+skL/Q5o/7wBHGd
         Rcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=glV8l1vbYCN0psYI4GiTeLf5MjWjdQQHBkpr99GGi+kv+qwd1hxGBiO8nAgzkrckU/
         PYeZ4R/NGps0U0ka2/fAggJM7MYrjroxeAmlQw3Wm5lpTiVYQCWrfkVGJ1K8z6e5LUTF
         D+gbnXZ44ZdMjUN/gfMwuH57OhKqw6F864po0qtMD5vrIOylsKhc1EPqJKhe2InSwYC1
         eyr3PzbvzkfLvvcY6YSgNtqdW/7Rw5WGHYgE1hf0N1spnl1R2tNVxrC2IhwwyMDaW2Fh
         VBJ5VPClgrJgrDBj0Qc44fU3duoMIqFICbg4S2GimjLG0nrT/iHYtVPCWuEieool/o92
         HUPg==
X-Forwarded-Encrypted: i=1; AJvYcCWuiqrmpqpPO90N9UN4gPAKNj+N0hygOXU6H+eL9VqueXj9853U4bLeM5qwcZNG25dhGsfAPiB9mp60Vcs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwhXn8LDo38gRuTQTOkY4jIUL+ENvVbSMQB4Oke2KUNnI55StXJ
	hrpPUOY10T2QbzzzNmPbDSIlkXl0/fUuYVNGUxP+7OA21x+3BIcWUgrpi+3c3rOtDuo=
X-Gm-Gg: AY/fxX5P2MbFR1yIm4n7T6g8dAtMuGHl2VVUefuyljSeIYs9TiCjVQTxqRxcBuSlpIN
	faCw2Dws5SgaxMn5sDhFedW1Yu39XlHQ4L1xxOmifIOm6WlbirSBOusU8YI/IKdJ7W+1JARkVgp
	udjYn4W7nYN4Q+AofjmGOBnZFmSDCZ56pfkDrVlaKoBMC+NnKTMx9rfTQE33sImozGM9ySAsILN
	TknpTpDGzvqiqUGNICfoMYe1ce9hB/P5LoH8tqpA6cYe5u/QmFMk080Oc+N831iPOAjiCjntFVE
	rlD4vS+kUyt9Hy0XCiIs861xYJrNS6DFjpnI2ygqSwhUPqmiiLxtE0B7IDT8yhiCfMKpDSDBIes
	rfoNYVU+DP9MXxLUrROFJiiK7J0bZ8pebmkGogmbU0jfUfJUL/6yIQdvTtsjG0amI6J2VO7792y
	vNfYTRFtwHMENxhsS5wC2U8l4CzHcc
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

