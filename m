Return-Path: <linuxppc-dev+bounces-6749-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 295D9A50F11
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 23:50:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7SSc3DG6z3brm;
	Thu,  6 Mar 2025 09:50:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741215040;
	cv=none; b=EoMFtnmoNoTuJhpAedTb9kRmI3y+sWTSOP8paO5c/jZQUEiA+fKgEBWtIOLQe8TbHu/19xhEgsbclVXWHZUTSWZUNjl29JBDFC27T2aiHrbuqfUtA4VyijtfLd38q0EbcQ1RNdWPNrsLqeZZeLpV4X1zl/UZFF+aDS+MVJw0ZI890RDJzxSGK9A8gfB5TV6f8O1mbLyWfBWD26QZo4Ym5gEq9WuIgIEKudGBO4C+BKqbVTl/2cuSdhx37BDXmcJnSBrCuIZd4RTj087YsRHyBsckm11noAsCzucogeHpCx3H8lWheOJvOJJuCW7wzcVY8AEQ6Fv5MDm2kLCIJbUdfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741215040; c=relaxed/relaxed;
	bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiNMrEGl33JdDI8k+QD4+H+7TowAD7GlPnwoYV9UwVGNpw/iGK2hs84q/oQvHdLhqfpWZOnrXozRD9nIowTSf6yoDbAgI0RZ9SXlwX2Oz8O0MH3MvhtrYOzKXAskqqRATtXqasBYnknlCWlsGasePj+0r00GfFho3HPNOOH5zkPh0aA4Scd0tqtATwRotejk8lNYYsng2U4jv6fpIjxeQ6Gxxn3pi5835PUZ2GhqZ4TD+h+8lQrA//qnoWMtJutj9Yg5Jk2J6yWWnFtzD2hpPXIKi9rzauCCo8hlx/Bf7wtNg/BZomY729ShGgxr0LIcLMPHOdPaOKQtLsnK28lAnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+hwXj48; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=jwerner@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=K+hwXj48;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82a; helo=mail-qt1-x82a.google.com; envelope-from=jwerner@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7SSZ4nxrz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Mar 2025 09:50:37 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4750a85a0ddso38121cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 14:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741215035; x=1741819835; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=K+hwXj48eQmG3aC0lSG16Jzat9DtBPudHMtB0/HSU/zpXFs3sVNpHqB8SmcFH8pSZP
         ZLykDvPpUo+T9RU6DvU7nnlBRsog+G55koFYs4Ltw8rk2JqJe6CGZcY0LDu1qWZ0TphG
         WQlGo6NIN0syTjdlWNsrzhLri7M+sfKqzDVmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215035; x=1741819835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsjM4YASNleulr3tBXWY5lzfU3eAoHcF5KVgOaYjt5c=;
        b=ijjAR5qUyFazgIlM9oJtnHreKbSI8d0ScYU+5hcnKFKd7r8aGDfyKImzJ5Gs1T0ngh
         Vv7QecRKxq4pTRdL2SyQcf3kGeVaeX2YiHLG0Y/vAdrVQRM9nz2lkqEBBJz4JHZaOBBA
         twTrAFK1J4k9xS3VsF/B8dQjX46Kol7xoC5hcMsBCci2ki7eFtShGfexUXREiNT3uTr6
         Jf7LmOB3fbGuHkjsYLWpCUa5DworBr6jSG6RlRUAARus6MJipthc09cmS3omroU304gz
         jt99b2VikNUAsgu/fkHThZ6wx0fbiRR/PsploXCjOpIXkDVbt5zCYpEtCn23sB+V2z81
         r2+A==
X-Forwarded-Encrypted: i=1; AJvYcCWtp5luCJvh19LYetqKnJiyFm6RnJI+owqgHvTVn0qiROsPFNY4qVj+a+mj3p7qPV1e6OsZoRPhi/GI7Nc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDqmn4KpPdxtqDUCVw94EnSmwjaV/qFOpepHk4I9kUtfGT8Bwi
	J2wP3A5gS4Nh6Shw58yYpTI7GkGVwD93HdFvJeSoj+WlObu9EvAhjZfl0VRW1LFHBTjtckJbDNm
	oZcqrU4sWjT1CRkkU3qo84LY49yaZp2ZqUFQ4
X-Gm-Gg: ASbGncs7as9jyomm6kqCl8zMYFI7WW8TW6rJnZPSQ8vpC8Lbck1pfDdbZMn3lzou/qX
	vJMEEVzAwHV/I/8wEvzmT1+EIG7Yminb9zcsVZp/QOxVIGzCjkLjrAWXET5tIm8hEwpGgGfnNv3
	ygrjpc6Iaq0JX1J6RzqtLz7Qhyv/aa/uri9dS91cjRsJqMLDkBnTIBh1dfwcA=
X-Google-Smtp-Source: AGHT+IHvK+t3RyIjKaNCRJHSF0lsNgux1FRjfJb7Y820KcKp5rPghSBOwl1IAFSXci0ouoP0BoEyc1UcQ1d61NKzM3g=
X-Received: by 2002:ac8:5905:0:b0:475:1754:e044 with SMTP id
 d75a77b69052e-4751c567b75mr312741cf.3.1741215034513; Wed, 05 Mar 2025
 14:50:34 -0800 (PST)
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
References: <20250305101025.2279951-1-george.cherian@marvell.com> <20250305101025.2279951-2-george.cherian@marvell.com>
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
From: Julius Werner <jwerner@chromium.org>
Date: Wed, 5 Mar 2025 14:50:20 -0800
X-Gm-Features: AQ5f1Jq5WN2NBjpsa146UgayYxAH8L0biqGumwPp8sUUsQ-SzcQC8JeVH7zSTCI
Message-ID: <CAODwPW_3BCfTcTu=K+6Q3PMe8DtWTiKFHC6+HO2q+cTqs=EPAA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, kabel@kernel.org, krzk@kernel.org, 
	mazziesaccount@gmail.com, thomas.richard@bootlin.com, lma@chromium.org, 
	bleung@chromium.org, support.opensource@diasemi.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	andy@kernel.org, paul@crapouillou.net, alexander.usyskin@intel.com, 
	andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, mwalle@kernel.org, 
	xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_SPF_WL
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

>  static const struct watchdog_ops adv_ec_wdt_ops = {
> diff --git a/drivers/watchdog/arm_smc_wdt.c b/drivers/watchdog/arm_smc_wdt.c
> index 8f3d0c3a005f..794cf0086912 100644
> --- a/drivers/watchdog/arm_smc_wdt.c
> +++ b/drivers/watchdog/arm_smc_wdt.c
> @@ -90,7 +90,8 @@ static const struct watchdog_info smcwd_info = {
>         .identity       = DRV_NAME,
>         .options        = WDIOF_SETTIMEOUT |
>                           WDIOF_KEEPALIVEPING |
> -                         WDIOF_MAGICCLOSE,
> +                         WDIOF_MAGICCLOSE |
> +                         WDIOF_STOP_MAYSLEEP,
>  };

I don't think this driver can sleep, unless I'm missing something?
`arm_smccc_smc()` does a synchronous call into firmware that always
returns back to the caller.

