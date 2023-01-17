Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9866DC82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 12:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx6GD5lNJz3c79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:33:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4JaPbx5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=T4JaPbx5;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx6FK141pz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 22:32:37 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so7875853wmc.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 03:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GO2eKjxO1iedMdXK50/d7P4tpciSJOhld+mYv0gRRXc=;
        b=T4JaPbx5Qg4+WbL7GJMmSfpAFUnxdXuOeTRQgZhAauo/QmncDkQ1Doe9cV/ZIWX18z
         Nma4y8iNmrkm64rsnZmbtiA9AVPzK729a4uhrGfYFmr5TGOgGfaQNX66zrXvP46bdCHh
         cme4SVs/Dt1RGYCT9nJ2y0HWLZDyk0yrjztC+aDoCSy7N2pRLvdvu7Ml3Cc0DmrkjFcs
         8GkGGyU3+1kcBpCkVZKQYtBr2rOe7tFiNWiOl4gb2ZZ8bEsM2V4gIYKDvVrge3k0UB+i
         BEGHCNBix3AE0Pr1ockO2EoadlIDlJy7BfEz11Q6z/8Ni8XVZQwnLlPDNv+hP2IZb5hb
         SQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GO2eKjxO1iedMdXK50/d7P4tpciSJOhld+mYv0gRRXc=;
        b=OuoVHGbXA6Bm+fP1TTZU/sJcHuMEqFKg5DFDyy+iDMOjnlk4nLwqvOx4lTpSDstRfC
         tOFVRinp+VjZ61IAyK6L0TexPGQwtDDi4mvNpddMvRbEn05xmOBmvvkGC5O/ir68E/eJ
         GT7K/Y5X2AQ3X3HyJfXTch5lflkvn25CFsc2EJhW0tIxxDR7dj2RUfR6kJIgc0TlxKxm
         gMr+b6ytHeYudu5Jh9DjTYExBphDyAHuYcSaOXs1/h9aCJDMt3XZhasUg5OAtd+FLw2d
         F+GNzmce0Kh1aPDZ3K/K2EaGEm3SshORxIeW0G7gCTzLfEqusDI7A9pTHJ9dMlj3xCJG
         ecDw==
X-Gm-Message-State: AFqh2kq/bymGo6SuEQDD1o6+YnW/2nbQQQKGLXAm+sd/SO3E7VUoy/+n
	UfcEn8UUI1iVAZ8orlTT822r4w==
X-Google-Smtp-Source: AMrXdXsGd5j2tSvSR09VtVGdaTSDX2UTM7mcUyv1SW5KP7xJAX77Ip6jhrpihEqLCIfvpX8xfJMZvw==
X-Received: by 2002:a05:600c:538c:b0:3cf:6f4d:c259 with SMTP id hg12-20020a05600c538c00b003cf6f4dc259mr2655123wmb.39.1673955153043;
        Tue, 17 Jan 2023 03:32:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id he12-20020a05600c540c00b003d9ddc82450sm35745300wmb.45.2023.01.17.03.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:32:32 -0800 (PST)
Message-ID: <c3746492-b943-9bb8-9c5f-10c0bbd219c8@linaro.org>
Date: Tue, 17 Jan 2023 12:32:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 08/10] dt-bindings: sound: Add support for QMC audio
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-9-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113103759.327698-9-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/01/2023 11:37, Herve Codina wrote:
> The QMC (QUICC mutichannel controller) is a controller
> present in some PowerQUICC SoC such as MPC885.
> The QMC audio is an ASoC component that uses the QMC
> controller to transfer the audio data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

