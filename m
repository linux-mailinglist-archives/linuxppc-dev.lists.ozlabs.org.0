Return-Path: <linuxppc-dev+bounces-3047-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C659C1C6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 12:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlHKl0dDTz3bv8;
	Fri,  8 Nov 2024 22:49:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::530"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731066571;
	cv=none; b=MUOVRSHlkaIUefbNr6Zfa705ggO589nPl5G2fPWGB2G5TzsDr+8t9os/E63Kzx9TCr9GL2NkzEGadNeQ7rRE3VEL4jO8dh466ghUqFr55r71cFtRRSCQZJeiCAl47XMUTkGbfGSuO4J6bviphpT66GiacT8hckID0A/1/LbJkpJC3CfQ57B1oX9Rbb7Na9+eYk4t8VfoFwHCjKQ/IjKUN4GmtEKHGtXHmERUFEr2Ygw01Go+BFyvoker8c68D2znI3b0/45/VDvymQMyP9gyGb02nvA31+LZxpOhb/glqa+9iOvX2I8FJBmdp+U/0b8iMh1A0EekS19nnpxCS5CS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731066571; c=relaxed/relaxed;
	bh=CXSvbTMRrcj6fCxF0ufHCuWCloLz1hIjGxoKK8AG/+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WX98GQL+rnFfkUwKDra1Rsi7PIzPizP5PAa1Dww5kyKwMrKoHU9bOQiGpb5E7z09B48Pl39M8dc126dE8oT/UoKGnEShIHrtaE3Ba2HuJgwB6O2FaPolNph8n/JkHQhL82FX/6feIKuoQSXv6SEc6WipsTFqWcsTr0CZDQ3bA3KfxsaQRoc0P8LP7VZI0SiW4EbsCrLUhohSWOTqRwwkqlMSi9NJH1RkB9A+WU+XXGS3iDX8pkf1noVy3qJYYeQqtnHxukucOdLCjUCzOpydEcGgzWtpUqaZckIljaap+uoWmU2uMDyXBfF8ZXlFhwgx9K39wu5vlqtObsxADbXILQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=crO4kIAY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=crO4kIAY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlHKh6nNmz3btt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 22:49:26 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5ceca7df7f0so2393051a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 03:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731066563; x=1731671363; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXSvbTMRrcj6fCxF0ufHCuWCloLz1hIjGxoKK8AG/+o=;
        b=crO4kIAY2ermQnrT62DSZonZLheG7PbaZ7o58wFWVryOnn+x8CpN+HMfNl3ehrkdqh
         b6eWMAp3txDbem6YvGMLsbNjHAfFD3yqMImwJIE51YdmocyNH33YLWGZIire6N7KVK/A
         Um90i7Mw5UCwnzbjxSjNbm2f1PUxck4vCQZPTnSeZfRhtAXOiwm16SeEHMjv9u7YRiB2
         Q850P7fKe9IC1c6O1sclJwZBNaXHjQTOOVFrtjG0UioHCxxMUO1o9I9jgKMSCMNYGePj
         gUvbMtIihfIhsxlP4C9sVJ/NnJ2389q/WHNcFesQc0er1XgmXqDaNhldq/uthGdWFlai
         Q2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731066563; x=1731671363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXSvbTMRrcj6fCxF0ufHCuWCloLz1hIjGxoKK8AG/+o=;
        b=ZDv9298q1clybGdrdColbO2byOTnQ926lIaC/+Krg+2oC0lMFRPPvO7hCNOKBLCr4P
         lb5DYZi7iHbYolY8cq/MwjPVG5o8Is36YsG9MSWnyAHNfdHjaQOdJeTPo+ozDTYXNcL5
         ABoEyX6WHGrIcXzKUwJB3LvH1yOj1+y3GhMgiLr2GBZWdgkFjP8RHeC7SViOG/D8DEqE
         Ujej8SsXMFF5V3jCjPw3BGsYXyMbHb8h+O6YlrTxcGH/6lE3EQeMVQb4L4hXRtz/aRl5
         85qifBboolgd3lhsGMlZ0ta4SVRRcRATS2pXyOEgrzCqLM2VAPg6Ph/ZdUMA/y3yFBmX
         HfCA==
X-Forwarded-Encrypted: i=1; AJvYcCX0CZ9m0GGqapG6KOluIs7j8P3YntbVV+R8+AFEmmUUSi/6M0BVlQRznovb4zWDrN7rPEzpcusTTE0pL58=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvvBUZVF2f1H7vo/gIurX1aQk3y+LLDWOSZ4/smuK4jEn8EvkX
	3eWnyVOUgTnU3y4shP7kkZYpDcg+lTgdfBSaaHAH8wcl694S7cTtwL2tl7r2GUI9hymPcxvOw3y
	IavX8CtDb4oJE4xWvXUwdTFNuDq5bd9kl0R7CB0uwbxaWbyYJDvU=
X-Google-Smtp-Source: AGHT+IG6dsbVHDy06kTkj5zAs70A2/MyWRJqE/mKAm1qvOYLwYQg1hL1cr+88CsDKtRlIRo2uCMtTHRVmKF8kaDiYQk=
X-Received: by 2002:a05:651c:1515:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2ff20185abfmr11928261fa.10.1731066088370; Fri, 08 Nov 2024
 03:41:28 -0800 (PST)
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
References: <202410301531.7Vr9UkCn-lkp@intel.com> <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
 <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
In-Reply-To: <2010cc7a-7f49-4c5b-b684-8e08ff8d17ed@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 12:41:17 +0100
Message-ID: <CACRpkdYQ6Pfn_Y7FJh7MV2Mb8etDXFCJEUrgq=c3JDxkSPOndA@mail.gmail.com>
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: kernel test robot <lkp@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, netdev <netdev@vger.kernel.org>, 
	Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Nov 8, 2024 at 11:30=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:


> The problem is the __be16 in the function prototype.
>
>         set_mac_addr(&p_82xx_addr_filt->taddr.h, p_enet_addr);
>
> p_82xx_addr_filt->taddr.h is a u16
> and out_be16() expects a u16*
>
> So the following fixes the above warnings:

Ah you are right of course, thanks! :)

Let's wait to the big rework you mentioned to land and I will try
to remember to revisit this in the v6.13 kernel cycle.

Yours,
Linus Walleij

