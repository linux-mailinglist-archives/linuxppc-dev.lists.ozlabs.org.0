Return-Path: <linuxppc-dev+bounces-15489-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F8FD0D7B7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 15:50:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dpM4Z6GxHz2yFk;
	Sun, 11 Jan 2026 01:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768056606;
	cv=none; b=lf30OcOKoOsTfLoywVHDE7a2oMr/c6maK2Kr0qAbBNGwMaztWqPZI3UFgAqWq0o5FA2bdAW5RPGBh4mqnZg1CrVlPsZ3vZGOzoP+F6NG2nB9Gwj6RTHFYfY4bb1UMzndUnE8TOntzfNNpB7JOB9fsK/vhlqSGxh8ZGw5hs7BXhYaAbs46EpuFlHT3qfiLvBZgfIlKbswnpaVHnbkwzIORO68lNCiUo2MYac0WzdxgPKFYbGWan4gTkZZukWzYXrAoXg6hOUWNRDjeigP3cH71XEwYd1QQel02785DNBvNC99cIz6MMtxP54JA7mJhWHfcExcRKxJqWOJHsyg5SHO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768056606; c=relaxed/relaxed;
	bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQdohDW6ziR2+F+CLEpEo0Ctuy0xBekYiE0GhVbKtjmYTY0q9y4F5gKaORVHgpGe8T5fpZMJQK59/EJVG2HULkjk3cOwvhVgV2rYUJXt7VsgscJqubSmgqI/HIjqJcwO6Um4sHg4luATvjPuSHu6VSEc5GXErbHtoLbhD7G3HhhTKQXgMlLTuegDJmavbkckZDS+b7SyWNDyJOz2qm3IipBe7gGNTgwPCxm6CBpkNJoiupc78Y/YpYz6KyW6FPckIn4ntsgr4SntDjXm1y5OGopHpDUjDs1jE8wJj/V94iAReRXMGCjYm0Wd5c45lV6JfoU0B5Shg+YW4ktvkJ2RIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=OfFo1Ql1; dkim-atps=neutral; spf=pass (client-ip=209.85.221.54; helo=mail-wr1-f54.google.com; envelope-from=claudiu.beznea@tuxon.dev; receiver=lists.ozlabs.org) smtp.mailfrom=tuxon.dev
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=OfFo1Ql1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tuxon.dev (client-ip=209.85.221.54; helo=mail-wr1-f54.google.com; envelope-from=claudiu.beznea@tuxon.dev; receiver=lists.ozlabs.org)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dpM4X68Czz2xRv
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jan 2026 01:50:03 +1100 (AEDT)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fbbc3df8fso2562002f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jan 2026 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768056540; x=1768661340; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=OfFo1Ql19jlymsVQqkvdZcCjI7wNyVb5yNPMexXwerlv+T6PLlxlBjnYWO6JuXVOHP
         9gpbFahpRHkWww60YuXqhj4H9oeICy7Ecm0jEP4EklZrwuHrKPV5vqSp+x8qLcaVX5xi
         4ZKuwS6lIHIsimwhNmBlGeESg1G+yPMwcd/7TgEHJzNixS8SPO2rQk/IfOiVwvdwe8O8
         PiU40Lxk+lXZ9s3eXNkj2StRPUQgxtci5CEYwF7cY2DeXEgNsafXZuXZ2uhTdfHiMxhg
         l8rBQhnN4fhEs0H1GlxN7apoRC4kXF/27FuJrnLwRAcuRV4pzvqBPTxp/0BLX9saQIZ8
         EgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768056540; x=1768661340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IHk6EgoNk8lP2vqJMYUzvRzyl3K2JzNhjFEm/rJg//s=;
        b=UidU25YmC9l+1/Vm0UoDVbXgJu0X9k4TmV8XZC+j6OhciO+jzcDqVPopWD5js6H5Um
         6NSB3f0kpIuHMVgIIS0BDYNLoMZ8zD15TK3oGnvZ+57F+LBQmbt4HZdtwKPxvmVZf7mc
         kwbZOiMX10ESksCOk+hqDWXXAjfz3yBYJ67xJSS3zvomIguGa+mQzbiy+aVktgAnzeHb
         WP8m66bLNbna2YB56QSUoVbVcgAmzX5R/20k+Wmd/JJyO/+0P61OcfAe3vxgyDTG+Suh
         dIMYrlCvA2wLl/g3HeZ8IkYlB97NWtsNl4KmfSmAyePXnuTBf8xpkcrmbTdOs/z5HY6a
         Y1IA==
X-Forwarded-Encrypted: i=1; AJvYcCWhHWmDgpfckCRwThwFGiK59lmpEKw8zi2RnLCmkaN6Iklp6D5Wr+nOd+Fvmd12CfTa07bDp9JB10JLhjw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFRgChEWgliww1P73kD6QQ8/nOrGfw7iVRCxFk12v8ESLMSgEv
	4EL0zkxKuSc/9VVRCd19ie2P54zJ5uH7eac/n0KiveG+QM6Ho5haDmv/o7iGPzy11T8=
X-Gm-Gg: AY/fxX4hj3L8xv3sTjjnpfAPbxr8z7Pb5GexKmdOcCPeXS7OdwjB5y08ABFWhAjFpBv
	Obg2RwGihAJ5duAO1C/pBid4zecZG8mesKDC10HOsj1PxX37BTKKIyyOitGa0wHLIB0pM4xXdze
	iU5nD+dqm1TG4cqpZRiH11CYrC7OEecVNTM//FCIF1staY+Woe8IsvFedo1Azyk264HPIZqfptq
	fzxI2B6u1Wb5dEvyIBLHfkcUTdGiX0pzJa/zFfIsTT+vnBtzpOxttUMPK/VurwypZfWgJ7Nim1M
	/mK89aiquC3xuPG6jZTvl9c3K1KMH0JVRyFtACZiEpg1KDReSYXMhiZp1criIWCbk3QGT1kkg41
	wK5uo+jmPFwxZd7azD1B7d3SGh/Wbddg8/zDMZAvgB2xpMCl2nh7x6afR5wSRdx/bsA7IeEoaQI
	1w/ta0oSSIRlNxU0iYKynv0CCfpfBH
X-Google-Smtp-Source: AGHT+IExDiyl6+cMqnLU0OScR46v/DhXxaFlI7KfbIz5c0gjBYd8wiO/Eo5iH1Cn00OMlkpwekH3Hg==
X-Received: by 2002:adf:f54f:0:b0:432:e00b:866f with SMTP id ffacd0b85a97d-432e00b8b14mr2891143f8f.60.1768056540373;
        Sat, 10 Jan 2026 06:49:00 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm27764794f8f.4.2026.01.10.06.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 06:48:59 -0800 (PST)
Message-ID: <b0dec3fb-51df-4bcd-ba13-c2049695266e@tuxon.dev>
Date: Sat, 10 Jan 2026 16:48:55 +0200
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
Subject: Re: [PATCH 02/11] ARM: at91: Simplify with scoped for each OF child
 loop
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
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-2-24e99c177164@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 1/5/26 15:33, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

