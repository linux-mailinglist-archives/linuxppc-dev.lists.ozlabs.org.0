Return-Path: <linuxppc-dev+bounces-7955-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51821A9A6F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 10:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjqXG1QHzz3blc;
	Thu, 24 Apr 2025 18:54:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::230"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745484846;
	cv=none; b=Ka+8pk/Eygd4X5qQ5clsqP8lga4yeWRL6jWlplrOSI7lt3aNEZuN/hHMx/CRwjuYtN04pSZxvCWdD/xAJE2g9jcmaVSUiEN2auqVqruz5VBaGUYi/zwT7l0bnbiFTZ+8rZlqz7dVtwnL1BpF0lZHKu5BMv+zTmPll2cC5y/d1INdUxxBQDbfoGMK7+daxxMlK2S++kcn9g3u4N5Zi5RLQOo1105Q6dEK2b7tu6rc7GKGW/Tt/xkJ3w4fPWA/dyqOVpsd/tjhgGb0SLQy4wsfJiDJQbSF63xIdO3N+DLgzQycYeCWkacw6xRiWaNoy/b0aqm7BL90xeR6ZVl3irKimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745484846; c=relaxed/relaxed;
	bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EE1IeSrMxtMrn252CmMVFJCisuPjWjt9ZwG0jADV0+XU0HlOZNjfqisHRCdCbgK0xs+c2rAa9+C+0sGSZm+MFveLK9HiaQhX4E4Mp/Q56btu52wPU3RotSVyWavjPMB9kEUY2HYTs12iyxsoMwhOwKFpG51xV+XyFaYqYMD3EJ10Xf+YIoBf4WZ9BFub6a18RWp2awoDLCdHbGIpIxdt0PZzRRBulreDCXseiUTIB96imYM80A7nVuTvtUsmP2boPnfrpRWNxj5E/M4rI5Sh5sI+V0Fc/b5U1ZdgHmCuka7sZmMzsYNFmI1hXMSYvmnJIfLQTDUaqO9RApIVmugljw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s9nTXbrx; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=s9nTXbrx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjqXD47tGz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 18:54:03 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-31062172698so9650921fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 01:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484835; x=1746089635; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=s9nTXbrxvKbkhCvQ4mGXq1BQTadzaYCZ0KYnmijt4X9payG8uXaeoom/I6C2mBcDjL
         LVDq9vqfTUlNWsNWa+nP1Vo/0x559whqn2gHa/FSWzT62rTeBEhXdNc8cA/g2PACB7Ui
         z11z9uGbL/qdkeWwUu6ftZYk+FCupEe52Al2lrLxRUE1EaVp9pdoX/RFSejrozz73YHg
         mAvJEjBfbEdUpfBqULHLuE8N4MEZtNgybKcZGTMSuibdwEK7ry93pr2hoz8hLso0yMnJ
         hNYHuW33KkK+999DJRQI75ouBO+26c+2mbNYAQamUiE8rVoZ53dN30wvfh7OB7SulZH5
         Un+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484835; x=1746089635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6xUHLkDXbn9hFTDw4xZ4U4OpXA7f7rhuSxwjLV2dJw=;
        b=g+P0dqnGREgulwL9x7Y0aux/UGNqvwxY/Bq6Sk3jhcUzn/JToE9X/UvYxlYk5eOvFJ
         UUIrCjBeYS2h2wCEuXS9mKXwjgT8oXllTQhiKG0nRY+65PXOxZkPiQ/QYKz/AuErRbSs
         Mt9tj2dak+9vfaTBoThN0QQIxUDubk5ksyDK5gTIQveI4iC3QdrSDwvSVzemOKXTwJxg
         xp8sqmy9Sg9OoBdc5+GK5fYuG8gwFipp1jtvnmb1ZVGCBKGKMvnvz3tGsi5FvuQdWaa1
         WJg7pcac7ZARND1xOIuLWsxxEM/4CeS2ak5mBqlr/qE1+Xt349K4/XRym1uq6RReBfZf
         1k9g==
X-Forwarded-Encrypted: i=1; AJvYcCXlFK8mkFKXNowiacTAyf/0G2C1zzuodVNfwsOi7t5qP2rps1+vJ0ZZqRJCPRUIAC8j7LQnSAQOZ0+ZF5w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxwk77V4yANe7UlHX7tyAnvUrHcuB4rp2yU71ywcRmCPtZcwwjB
	6zuvosTOcWQ+SoQXQH+SpfOq/qwueBb8LzL349vCZYZQpavDfliSK4uWU27wXQ0Zc/7lOqMWdvX
	DTlv6ps4KpuwLQk95iU3QJkChAOm7ZNAJcPmNgQ==
X-Gm-Gg: ASbGnctk/3/91Q2CwS+0x9ecSahizeIj8+VodLyJ+cct4VQ2CY2BgCauQN2+aFkqYlx
	mTGXjVtjmbI3MwuDEFvrxgfuTHuCaPOVkt1O3kmNIFc9sPbzGlJEtmjlKBoWhTasdqZXi/FxZH7
	/xXZmVTaGpWNnicH1O0Rv9CQ==
X-Google-Smtp-Source: AGHT+IFd6o2V1cDvfxchwTZEaDmypkAJ0u4hlPv2if9D2Y7a8wVhtGISsPpquAIRqMziQ60KxwoTpx35yBhShkFLhuw=
X-Received: by 2002:a05:651c:993:b0:30b:a20d:1c06 with SMTP id
 38308e7fff4ca-3179bf49914mr6039361fa.0.1745484823463; Thu, 24 Apr 2025
 01:53:43 -0700 (PDT)
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
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 24 Apr 2025 10:53:32 +0200
X-Gm-Features: ATxdqUH1x92NvEG1VXzt3NjeT_OyAU-iOFZq_KwpZ_kjnPdsk-aLLUsyLsYPhSY
Message-ID: <CACRpkdbMzKOkrxmWUuC-ORHg5gBdkmwrsbp4daA0aGnNs07bxA@mail.gmail.com>
Subject: Re: [PATCH 0/5] powerpc: convert board-file GPIO chips to using new
 value setters
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Anatolij Gustschin <agust@denx.de>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 8, 2025 at 9:21=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all powerpc board-file level controllers.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

