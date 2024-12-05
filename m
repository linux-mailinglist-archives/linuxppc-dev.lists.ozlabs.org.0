Return-Path: <linuxppc-dev+bounces-3820-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1AB9E529D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 11:42:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3rYj6GV4z2yFB;
	Thu,  5 Dec 2024 21:42:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733395337;
	cv=none; b=Zsf3EU+gjqIRINsKJ5o9VoL/iFMiGjNOTWneltubYWPm+kkGi441h/C4oCN9BsV67RzpqGbHlh207GQQvS4CFG24VYUECa5yaAhhbtHJyGcruc5ARdtAunY7tBtCl3pmt3UnLgGn34CxuRhuVpFSfwpj2394bFlHeWbDJ/BbvQgIA2T90e9npBGxhdxeeGbygrMKUOIgTA1TlMfr/1dmDeZjE9ibB6Ccdar8kXPO8O9f+0+WCaWC5O0Mw4+IbSXZwH9v1Qckh/OMcK0HbVyubpOhw2i9kkT3V9NCT8ImI8RlpgpideDTvlfYMY3EMxZTPmXsmfMeuV29Bc7Sosxo/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733395337; c=relaxed/relaxed;
	bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=G16CAnJimreRogKeFzwutqT7llhkRw1UjBsQ6mk5FIwdI7iv/IsydCz5M5joYmzrQdLEYI5QaKy732Lu0Zi+QEVbvj/82FgOm03LrcJMfFNCLdslk6PgenZB6Fky5817OX33hkB0XIV78CbWMHo/MgfJZ2diy2QhOGXxRf7epgDpUvGKP5MfzYmd+pf4VC7iWDQTDty3//EhCCfYkUsYPivT+uZhbgybMYiBvVQqd5t2zX5nhi9dtUEPsLIO2TdPX9n1WrtMVef2ybqE/iCN4ukVIQ3oYDtxfpSSffxg3/Coa0NClPnkdMihO8TvJeERuT6u0wDN43Wj3Eb+XBELyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPU6XEHj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kPU6XEHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3rYg56Rbz2y8P
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 21:42:13 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e0dadaaaso25130f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2024 02:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733395330; x=1734000130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=kPU6XEHjyV6HWmtgGDcut4U84drkvEP/lOfCDgJk4su22Oi5YaF/PyLJjSuudBOcdm
         o45teo7FWVC6BPB1OO6vqYQHvB5aHx763/A63vv0fZeIbXW7yjwgtdExn60OQdlA4ROT
         JEtxgu2peFNzyxXxC+0hjoRQJPiA5btO0cFb1TSjN3Yd9ryC1ugDxV3yA3TrDXi/Yu2M
         SA9s4AiGzoeUVQyFHT+A8qNWnmcvZG5zFUKaVA/9mMkbjR6rZddH5WjMkbSYgsanRJoU
         samQXLdJGOV9ZmQ39uHHvR1WDD8rgQ1f3p/I8Ut5HKS+8lWjxHiHFvHmQIk5Y0kveUAp
         Db1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395330; x=1734000130;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=auq5zJF5QB1/jurPp3lGcoZhcOJpdST3K99TgzxALp9bYqmtc5Bhn1/nLAo2FkT2/X
         sz3ukPILHVN9fzyMMKDA9JQFPmFcQRVJ8DtqqeQ5F0t4BpbWkqdpM+33hBvGeYklxy4I
         OpqsSY8+bxdLxmqSwzT6wh8wYe1kcw6/RWFPLCymu4Ph6tFnGqcrXgUmg9eqe5k1snLM
         s/U+inOMVEaqzQESX1xt4MggzwEDU5SlZQmS+6qiEArpSdwCNM6vg3jn2GierSYwYiMt
         M0KljlTBMyjoIHqjzVfA/+wJWxptAFV7s2MbSTYTK+NYJN6fl4Qp35rpCOgR5ZvbWgsB
         ISzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/vqFZdGWOjLTY4IVMkWacDqUo2F2qx2VoseaIdrs+SQqNA1uuoTkDVineYYEFPKILek+RIS+rMQhTWvs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4GWh9AWqB1W1XUw8FSJTlqun5fJlbVRjOexQ/FVf8yf68NrjB
	mbKqroeCbe3QVJxO/UF4l0p2UX+M0l85RtgUms3POjWj7Ln/THCSUzk8AN7jPrQ=
X-Gm-Gg: ASbGncv7uqg889Ia7CBAS0+vDh3xZKnIPG6h2+HASIVpCcPJJ593ZsNmBPHZZ4HgqjU
	aIEvrXZLzbvxs/4NquZsFFs6KsCe2dS1kl8JMCwfr+bcUhdIpTB6qEdv5taXNf/kd6h/Mp12lfO
	fYKRlWcmE6gh041nmnFirUdFPQ7MPT4sVa2FfdPAZ0ucr5ehh4Wei5R7St1OgjAaXWLKb+2LNbr
	Aa7qqOwD9hG774Bhx+Sptcjh+PSkCrHov1euNactlCe7Z4pQTx+YVac89RkemrLOQ==
X-Google-Smtp-Source: AGHT+IGz3GjcyfBhQ5HlqLVmhmG7Qtmhnbj9BaPJEz/QzVaC6xVbnrbhQALk4UuX4nKmsjVBEJ+aKg==
X-Received: by 2002:a5d:6d82:0:b0:385:e8e7:d0ac with SMTP id ffacd0b85a97d-385fde34d9bmr2947632f8f.13.1733395329824;
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf406csm1662701f8f.3.2024.12.05.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <173339532775.70936.4554643874403091214.b4-ty@linaro.org>
Date: Thu, 05 Dec 2024 11:42:07 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/62f95d8a4920706e94759a8f5e34677528530cf1
[08/11] arm64: dts: uniphier: Switch to hp-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/751df73d825b3f7e6cad42ed333c28096635784d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


