Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3977563A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 14:58:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=C4sMqbtn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4MbH0zcWz2yV1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 22:58:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=C4sMqbtn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4MZP45hdz2xVR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 22:58:04 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-682b1768a0bso1184384b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jul 2023 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689598682; x=1692190682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxuqeyRLaGsgNS7cAk/VqAg+8wOCZMSgEI8rvm938k4=;
        b=C4sMqbtnpXDlshts60r/+0Ez4QLa3NwxAmYEzemv8uCYxfBgYZkk3It9ABO4G4/HZL
         ZqJTnfu5Tj/VntYxD43FFdUgweGRwV82HJwLKJGCN7oHVvWpDYNF3CSkp3OJ3iO4MxoM
         9u9kod6Pc2YAEZmirmWjjP5Pe3WupvJHsRS6/JUYtA1c4RBlgF/GTGq2YSIW4VQObMF/
         iaKu7cO7YGhaU2Jf2YNViewo/iR+0/RKxGj6BrHrAYyFKS+qoX9oluTXCVY1hNq4aw/h
         JH2OjUjktf3FTNrICRRUQhscQvDRfnf9S0ro9mh8daFPCLJ5ODEGnTgd8Wxg3cRjxOGj
         kJIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689598682; x=1692190682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxuqeyRLaGsgNS7cAk/VqAg+8wOCZMSgEI8rvm938k4=;
        b=eQZmmll82V3W/KRaUUO0dl8GX80jxCCX7QiIH446e3a1WhT65Xx8SBiuNOLqbEWsn6
         S2qLFEhjKZu4O/axOkUC9es2HslU1waMYCfNxTimCmzCRpxfpRSDcNZqitLRD26QRmGX
         uc9Mr+tiBXdCUFvnJRra1p2bcGjqBEe0EzaVyAh/qWuoCxA1mmwa1qWRyualWgxoZaYO
         bzmINOEs1f5u09CIZlXwVfAEhsjVDogJ7vODSN1F62uQqZ61wnkyatHC0LjKPezAU9On
         FqrXCSmM3t63NbNHqx+bu33gU6bfhMWSInFU7KVh1H/K9j18+NNHjxXn27G5vEok+UOi
         JvJQ==
X-Gm-Message-State: ABy/qLY9NhGheM6htOlhz9vOLkNDRQH/N9citcGtlTkVPMYekTP5T0Uu
	WmrcFW/aN5Ng9FtuycopN5BG8/lMiRsXN8JAGC0=
X-Google-Smtp-Source: APBJJlE+HoutIK0nYRGucBoutTN8r7cbUC50Qgs0XXpYoXMdjkD2MMidht1fWvrtSMB3N9kLad/8McQYvSeOZVpSZLI=
X-Received: by 2002:a05:6a21:998b:b0:133:6e3d:68cd with SMTP id
 ve11-20020a056a21998b00b001336e3d68cdmr9189787pzb.3.1689598681751; Mon, 17
 Jul 2023 05:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230712124934.32232-1-matuszpd@gmail.com> <CAOMZO5ATTK7UsTRPTF_7r86WbNmAhtpEphO2u896QqARTk2kpA@mail.gmail.com>
 <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
In-Reply-To: <d2cbf249-32e1-4e19-8362-7087d6b7d3d8@sirena.org.uk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 17 Jul 2023 09:57:50 -0300
Message-ID: <CAOMZO5A6YrUX58VwZtbzOV6UBsvE+AF3U5i8_Vr2E_VOb49zKw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Matus Gajdos <matuszpd@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 17, 2023 at 9:55=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:

> I'll just put a non-specific Cc stable tag on it, that should be enough
> to get it backported.

Sounds good. Thanks, Mark.
