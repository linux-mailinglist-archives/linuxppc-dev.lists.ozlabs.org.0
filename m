Return-Path: <linuxppc-dev+bounces-11122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E16AEB2C494
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 15:05:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5qZY5cYVz3d3W;
	Tue, 19 Aug 2025 23:05:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755608741;
	cv=none; b=S10t4+XvnebfLCvRUwp7Zxpx/aWcnI9jl6c9agv/9GQe7qItvyJAnvsozqK2z83eZrCibFeKIgIal6PFZHu9O9GCMKENeDReeOxYNvUzC826oziBr1mY8JO9D/4x9AheB/z4cP4qXGTcdHo8Z0TOYn6v3e3dlkr0a4pJsbhp17+U8shWxX/OA4+fWoiF2Yu1HKWPTEpU4eYw8ALxOwmsg1Vxux2mF1iEk4qtzC6QiZM8CtKvk52I/8WWHjwC22L6kb9gxJLQvXByimt2LGdnT2uh5BytOHLEVsHzf/odQsfwNl06Hv1FVanu7xBhrjYwrrxWWhRykvYidvyAvA+VVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755608741; c=relaxed/relaxed;
	bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3qJ+/2TF5C6cPO16Mx4yF8rxDtJI6BZpl+GvmkDjxmzJaUTIrB4PqBIHPNMUoxUCjiQtBURYM9sCVJ+asD2+NulQWRGhYuDEg197xMHlMKpXLKHwcjApIcAhrx7l5id8mjF3gt7U4kpjHjvlqXcIbcWjZJ3Vg1eXZuriWOSGqx1kHPsWOkYAWfGFpPjFiZJerS7VArCeNaNvAaMmjNnktA58Ukqw+gR4YEIYSxv5zt0Ji5h39XM1PvJHPDuj8oMugJuVRF1WhU699qwuZxC6j/0pnU6rC0gbtWhBnS08MPBmbpA1aBNjXmT0m3ZqESlUs7xzbJrAoMGglBpDUzcwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wh5xkdKN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Wh5xkdKN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5qZX5yStz3d3M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 23:05:40 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-333f8f02afaso43236231fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 06:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755608738; x=1756213538; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
        b=Wh5xkdKNkV4HU8KCDoENb5YofvKoiNWhnDMe9nw+Rk6HENoudquo091VV4Zjo2Uq1C
         wMN8nTO/HAx2WACit6ycI4dZmjktvTbqHJiA5RHp5vKrAmDY3Be5Txovu2ZUIDhzlG1O
         DpxcpZE4VD8wh6jHoTslqEljZ2Ih6xwXw4PLFY2pMZ8nnztnHuHLITWhojjFXF7RETFH
         hq024TopMfELoAfeZL6cI2ufJi5jByJfb67aOsZZiL5/TlvwvFCmw3wEy1Ryzd3TCbm9
         8ZEvHY9vpUGJagSKVLuYvQjjKiwqQSmvTogJbFagnJNK2Inzb2rTNLELH/7AQEB2T0Ee
         xItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755608738; x=1756213538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TydTBW5thx9mDJs/hCsJtwVT0BXigr4SrIrrv36m4Gw=;
        b=szMragh2Ilud3qKT5ZHLrtQuOZq9YD7FtLDIJ6/E4Mff5raOf52QDZVYiMN1Kv41vl
         LNW7KE0JJedV8nW6MNrnCmTaVapsJE0JOv97LsjUaksy49h3/zWePiWOjXg1Ah8fDJqc
         S6TKNPzdomcPVjadFJUU4kk2Ag4N/sK9vUEs7Dmx0PnV1n3YtbeaYXt5haXTUCUEhNzI
         ATWfkKvDfc60EbNVsGk3t+dYuI81Asi963eXY8288Un63Nc6d67T0qdcRZBhZ+YR3Q1e
         4YrMm8ZOPZCUV3/Z9aOjcCZlA1btGS86w0piWWWyCqKSs9cj59nNLrN7Vl/NMzhWgAmH
         qEdw==
X-Forwarded-Encrypted: i=1; AJvYcCUsFQ9DmX9fgu+nWjnDKwv13VrHXqr/QB3YKaM+uJMRPMT4Dve8gnyf1xHKAQoJn1VHmcG8IvpAu9rPysY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqPPHp4FpfebV3fM5+LT04gOh/PsrLrZyMrY8X7YxbWkT/nlhS
	2rNzHg+PRssTKiEN7ihtYSuN2WBO2sIqISKm9FP/MjkShTYblvWru82q2P8hlu72TD0vapkMlL+
	V19OW20uJVhdrQSTOTTpiHm967/qKPr1j4cnVoiJWvw==
X-Gm-Gg: ASbGncvnHRs30bcmB0A58I68KnsFCMNseZ6H0wm/dVuJLSb/YXjIeTWatMB7d0q7G4f
	6kAXBIPiGH+Ny5gnKHRG2brImWOXYrpjUKXY8WlOyv2SVFbeaoUvIOlZUZnHpdeOBo7+RnYFZf+
	8o+LhzfzDM5zbVz033tEZZ2jsgdrZQCM0Ij7+FhcmQW5LSmyInif+h4aHVqPzy1OikS0HZIbXBj
	y923Rt3ylmmewzM2SI7KZI=
X-Google-Smtp-Source: AGHT+IEpK76uxGn/DS7ICLCoTV8giPyjNjAYLxm3xST9mGFGCKp3eB6JQE/Gx6nRy13cnpDfXlqQrB6jbaGh+1eqiHk=
X-Received: by 2002:a05:651c:1505:b0:32b:805e:20d9 with SMTP id
 38308e7fff4ca-33530809c75mr7490841fa.38.1755608737688; Tue, 19 Aug 2025
 06:05:37 -0700 (PDT)
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
References: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
In-Reply-To: <9652736ef05b94d9113ea5ce7899734ef82343d1.1755520794.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:05:26 +0200
X-Gm-Features: Ac12FXx42oLVZo77dClNUGC42QVr3TSxbMmRbjTF7n6R6gJYcLt9jZg72zItf9E
Message-ID: <CACRpkdaV8EA6O1x3+UpruhXEqzA5Zb_6v+DVwURvOFH+rD5Jrw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpc5200: Drop legacy-of-mm-gpiochip.h header
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 18, 2025 at 2:42=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> Remove legacy-of-mm-gpiochip.h header file. The above mentioned
> file provides an OF API that's deprecated. There is no agnostic
> alternatives to it and we have to open code the logic which was
> hidden behind of_mm_gpiochip_add_data(). Note, most of the GPIO
> drivers are using their own labeling schemas and resource retrieval
> that only a few may gain of the code deduplication, so whenever
> alternative is appear we can move drivers again to use that one.
>
> [text copied from commit 34064c8267a6 ("powerpc/8xx:
> Drop legacy-of-mm-gpiochip.h header")]
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

