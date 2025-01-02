Return-Path: <linuxppc-dev+bounces-4594-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F138A000C5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 22:37:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPKmp5s8Tz2x9T;
	Fri,  3 Jan 2025 08:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735853850;
	cv=none; b=lu9qIJLGKiOPQL4LcQYD7yfCUMs09mH1lB21cqGcZbEGQuoL/SSOR9Z08VVttcg+aitN0p6vES2H0ZkBA4NpQL9Nh2dgn1Ih3mCqSDDyKcvg0I3IsyvPxo8sibNMqiopD+PhFSIfHyZ+/4LGfsnuEYk4gG6GBH80A4JHwim/4dwfSW9/XqBNDGklmO4BudkMty3tz9JPOjelbzbC8bD1ir7xFXzIEOHxgTV7ZsG0aeaSJCiUpBrOc0OmR9KFpjZBRrsZFLyddVzq1BI8qqXePPwU9wJ7j0vye5szRBqGRg6xszX273t9ywz4KJoFlsrfpS8L8etT8t3uxU9bId7i0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735853850; c=relaxed/relaxed;
	bh=gisomaO+L2GIVKZW9oMvTTOjgiixCpyPxn51SMugAMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YS2qLT9m44lknJwcSEEDcL6GEhqzInILWvP4KPWNgDJxZZE34raTQeVyuUPoUR7UJwQ5cHyTNXIwKjq+qf/FaxLthv/lX6Cjii8jrxNpTfMqIVT4fIZ9FYKV4UWug/jCkr9rmhNlqnlh58JStcqY4QMKCP3hgMIM5/h0vDdexYdIleZaJkQLetQe+R9+RJj4vB/orjmOPo6e/ySx++k9CQ/BkcWY5i53rAARSk3cCG4kfuqWiOmwJKBB81j0q6xLZxeoLb462mrCYYBDmo4XwyNjWjoXFZZWwN3hLiUzTn6L+Tu8VHKjncOoy8Q/H+YEhLXPKOP7oL08A03IZUN7qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MSvgUklo; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MSvgUklo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPKmm6hNbz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 08:37:26 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-53e399e3310so14301929e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735853838; x=1736458638; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gisomaO+L2GIVKZW9oMvTTOjgiixCpyPxn51SMugAMU=;
        b=MSvgUklogweKDY9ms/G296LjY9P/Vmr6/cXyZit9jq5Auhl+ecJZYb/jyH8f2KtB84
         cB9vPGyiRc0rfnF2oSy+KsK4I08d8Dv6lz7HGHAHn0grtgaW37Op2LNaEC39Olm03eql
         FrVD7IeT4nvIUx+bS0Wb2Q/0Lj7lnrdZSdx5wq4NYGgmBGtBSibnuMx4tye1EWoqc16t
         v9yTbzDuVQ+5KSODq1j0+ulBeZx83jXj2g4PjK3ng3SPjOdx1YNWG04AbedQ2PvMuwua
         hzOwIxP1Gl9p05khjtXT9SMbYAP8w6r2JK4VZEtjt8Wldfnkt8RKufaeWuarIBkMhcpX
         lwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735853838; x=1736458638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gisomaO+L2GIVKZW9oMvTTOjgiixCpyPxn51SMugAMU=;
        b=w0IqRGdcBBXEFyLCOsgEzDkGArf9BmgL8/zajyD2Sw6BePWPxZqbwXPabkn03KAgCi
         s3RJhje/a75AH5kGznMfEO9gmL+kp0y+bkx7po8+NpnDSFAJp1m8qX+ogcPFOrd4tllf
         TjmrDHuKskHLkdQGonnqrkEzf7rc7po+yYz5CMVb8K9/x+6oI5aOg6ACU3sP/uM2FUCY
         jBQzv8RqsODtaFdbzFxALkQEOFN1feHwa+F4f+Db+rfB3CVWgr4jckOAXmJKlJLjCy7P
         BUd6r3xXExOTvTLe+C3mmZzoCH0nf56dQfUw5Hr2jrGBsNLPcplpJTH2SGqIpbq4cF1P
         PXdw==
X-Forwarded-Encrypted: i=1; AJvYcCXAp7FKw2g7WptOYcWa0JDs9rEO6NNOpDEWlVYWImLVIFYfMvE/EuL5d/Gp8NhhSszNeF8Ri847eOTCvzY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxkFhpByuQCwgRZzympbIi/1IxDvwY/fSlAeoPocjXGpGf8b3vh
	fH9GWs5cuQ3b5tF3jdqAR9WHjpfkc83hPtFn1AoQCrNwa5ZThwix2AnOvWKEF3yg4vg4D/9EB2W
	lPy2kELnT93UQ7/qwlE5qkzqtJoABg3jrssi9/Q==
X-Gm-Gg: ASbGncu/M3uYs5QSQQXAkmI0Wf5C2o1GhdYgsIXDLsn9bEsX4n3rNIL/CzIRPhWbD95
	Gp6XEqQI5ZFeYDpuZSGr9TkHh/bg37roQduMh
X-Google-Smtp-Source: AGHT+IFzHplckR4742TUfZ5sO6raHTYRlXz3BpSLB1Co99YggfuQOyG2xtX6buS1XOMwQ6IDHaXQhcF4tHvVn0hAZ0E=
X-Received: by 2002:a05:6512:2246:b0:542:2e04:edd1 with SMTP id
 2adb3069b0e04-5422e04f073mr10683653e87.42.1735853838389; Thu, 02 Jan 2025
 13:37:18 -0800 (PST)
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
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net> <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 2 Jan 2025 22:37:06 +0100
Message-ID: <CACRpkdbwAUYxerznTzukeWkMSj80ni82oupdLjBbZRHzmjuH2A@mail.gmail.com>
Subject: Re: [PATCH 11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible
 string fsl,mpc8314-gpio
To: j.ne@posteo.net
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 2, 2025 at 7:32=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:

> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> This is for the MPC831{4,5}{,E} SoCs.
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

