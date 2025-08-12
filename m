Return-Path: <linuxppc-dev+bounces-10867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAF5B229E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 16:16:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1YTY3Wlbz3cR1;
	Wed, 13 Aug 2025 00:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755008193;
	cv=none; b=eJz5mt4YmK862NdUKq44sNVNPVRATTG9xv+VkT6PeDAhuPp+ctChJSNdhtkir2FTcaD8U6btDZ7KQW5WJ4jMDHs+f1vD+l19JUT+rbG3ebyF7hGEYp1IOtAeGza/ZZIfqlO9UXztB8T7aa21u7nzglV2jjtBWUGwbIRjzBOugvJkyB9mdrI9cT41zFEjd4GSDgu4obku734iiLV34nwC3fuptIaceZQ1TamNS2hEugfwfmevUFDoFkLEnHI4g3lqaRYEPuOTAraVigriA/RBPllBWxW/Bzmoe+TSo+UK0BH6HlHA4KPg9fqPfnXcguokfHYgsLKTBWijLaMOezt7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755008193; c=relaxed/relaxed;
	bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNn/o9Va5vxCCGzvaRtApmLE7lL3QcyidBj0PBEXIWmsoqb08mvBCV33Rjd7z0xP2MGMF7zMP2yHbtT3MGQqRSUrt0Mrzft33AIWCPHWlZz09Wul8dYau/5CmE3GUV0OOGc1baGru+KY4GO3HkpjAtVYMSZBXkVUDYVWtaOGhpKh7x7CVRIT3znJBXKPa973TXPUr0IeOKgHY7H7VHo0NmbAKblPoRDnixwF0M7Ck/+z+XnLO6tUNN28KeQsimpcGNZMjs56sYcGc2X9g7o5M019o3W8+u7kCkZvcREHg14FTPzFZ9IaVKZEh5AVWbFrzAKh4MQutcZweoffu3AyGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=rMbO08uF; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=rMbO08uF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1YTW2znlz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 00:16:30 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55502821bd2so5660078e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755008184; x=1755612984; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=;
        b=rMbO08uFKmXp3hlpmoT9LxrdimT/BkqkZp1CWfQe6oIWpfDuMi5jUVWAOrSTazKi8G
         rGcezVI5B6+adUmU0cpHmoDEVw5frhgoUJnJ4GwPOfeFYSabn5Is66tMUAEKblDZiAgO
         6PWneJPwShB+e9orDiXCaZ6ea2UQ+wETWOailCyYojOZz90U+4sGJqMaydoXib0sN4+2
         adBa/J/KKlERtvxF+pj5pI8IWkfiUmQvuzyfMZbMAWxzy3hiT4NaAhj6xhGLTdiDbDIT
         6Z/r8MjdG1r5gZzPwUADXTYF3M+DzZZIILyixG5Di7mlOn3j8HktZ0k3usmeKvEICNhg
         oyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755008184; x=1755612984;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R5nnZKtUiilDivRmsxMYOh+vKL6+puQDJ6xyxH4ExM8=;
        b=ne9H5wxlpJGdnFvhy1vbMsTxaaIag54f9nnXnQtqJ23PDIMFwInOCrTnxTshQI+2Im
         Ky+b7+6D82c8QkS7wZ2OdNcpxYvG/30YTydyLrIxKH0DhmxvpvzfowfR2AjPcrsXbt83
         GknlnpoWJ8sm3414o5U5pA9Lg247EVuQRqdLnP4uLV6PoQVb0Gclk7kh6n4i48LV7QR5
         A+WCb8LkBz5by71X/Ky4l+kWtbLUDjGTq/GamGF45oulHZktGGHu1OXVxRTztcsM3hcw
         F7KxGbg6tSVp1xKNiczjWBxKv4RYIiGtb0NoFmiHRXXu7luICnVt8bc5JDBE9diA098x
         Qm5A==
X-Forwarded-Encrypted: i=1; AJvYcCX6RR8VcBk7kXpE6kB1Y4Xk6THQmCaaKa3rjHhsZRBKFDmXfFlza4tHV/x0DpIaBlq/73CNfiOQ2A3o5C4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwY4YhXKouhx0QYRmKUo7+fvtJ7LHOreKfCDh2ZPPlGwD7C3lfH
	G4HGoD6vZxu3rZUmKe0wSyz9QGEa+VSXkeYfmvHLNVmUhuVZO6oKPRTdBByYPLb1HJXTgwihiql
	8vkPfBb6eH/A2S99f7QoSoDnYLCgAwCdirulBLUBSrw==
X-Gm-Gg: ASbGncv5PyLIUHhnCTqyIEMV3+M2y5d3hjziMEfuL6cbfkT3pqa8WHkeODRFgUfYbgt
	6AViIaM/vRoioKkpY85IUX3dM6q0u6v5EBHiU4cP+jc0iHneWKL9eQoEHc3C+wxsYMpjX6rYW7a
	NzXB18BwL4G+Oher4zdTHqSiwh7m26MF33JrSQdItQy08EWL4/QMEze0REtumxoEL/dlgWBEr8e
	II0NNXB52d4pYSA7o28lU0X8acJ8exaFM2j
X-Google-Smtp-Source: AGHT+IFSWGaG+YAxuC5QAHmmbcboQlauIZZLZgo0OwDLSkIV0ywA07Ks+Bfh+bGhzN53ifgDGqSDL8YW+yRt/PdEog4=
X-Received: by 2002:a05:6512:1329:b0:553:2480:2309 with SMTP id
 2adb3069b0e04-55cd7581e05mr1175047e87.3.1755008183964; Tue, 12 Aug 2025
 07:16:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:16:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 12 Aug 2025 10:16:23 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
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
References: <cover.1754996033.git.christophe.leroy@csgroup.eu> <f4d04d0c9d72d089af7490c6ce91bb4c455fbffd.1754996033.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Aug 2025 10:16:23 -0400
X-Gm-Features: Ac12FXwr1ZykknKcViL5DSBC6TTWTpzY9rOvoc9OKAJoev5KLP9n85B_Vyoqws8
Message-ID: <CAMRc=Mc_MMwsiGybyMdY0T+QiRuZWFGEifxV4Kz7oqZaY_-kzg@mail.gmail.com>
Subject: Re: [PATCH 2/4] soc: fsl: qe: Change GPIO driver to a proper platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, Qiang Zhao <qiang.zhao@nxp.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 12 Aug 2025 13:02:52 +0200, Christophe Leroy
<christophe.leroy@csgroup.eu> said:
> In order to be able to add interrupts to the GPIOs, first change the
> QE GPIO driver to the proper platform driver in order to allow
> initialisation to be done in the right order, otherwise the GPIOs
> get added before the interrupts are registered.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

