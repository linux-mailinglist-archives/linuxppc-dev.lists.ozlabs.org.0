Return-Path: <linuxppc-dev+bounces-9811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E5AE9DD3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 14:51:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSdq40GLLz2xYl;
	Thu, 26 Jun 2025 22:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750942287;
	cv=none; b=kyk1RBKfhRh6ZSC2xrCSy8g85+3ar+Cn5MU3X8psEAWcc1l40ZQ7XcHsEdOpAcy/l6DybKhAH9u4GUBW7dqbtw6tJ1DXhB9riBWxgytStTsYty9JO6g3zWkGA08DcnJN70/456HXrQ6iWe3bdETWhOLUjVsylKRtCvQbK6f6uK9+js7J2gUHPYF1mFvonoLeQ456mS8pYTKK1jiyQXiWE5UYRPOt6Hzkb3KwBm5fXPv3K1oS76fQAVvl1SPvk+25nL8LL8R7HG0MwYk2U7ebcUMOfTpX5F+fz6751aPzebroV+5SLLQzMppniislfdQEdAhDo8Dd+XkcXLoraNNhww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750942287; c=relaxed/relaxed;
	bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CFs/UX0xgtHcwPwi6tsTKlCaQMaH4FoShRayHe/H8JKE+YnZrKg0SEHtgf61naPkKCs8uPZxPqGcvkzu7nIB4fOb7L3fAslJSq+OfuXPQa740O5nY7eX5amXZ2BNTd5rrNxjsEBv8Veta/BQRyOimthhMmciqPuS30V4o1wDFiBJB3VtHO46ExNRsCtgFsdGgcORB9MFG3j+tHUYBPOUxBE8xpiMjixe6ujwYhUzzEiixCoFvAe5R7igblqy3yfKx0QQjlDv55jhfYxt/VgOWRtWw1qXcDvwCxU/Ya0eEy6nwFSkmJmnmkXe58mobxjvHirEYsaUb/hgV4X0SAdmQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mfSEPBlv; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mfSEPBlv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSdq26P5Qz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 22:51:26 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so7935031fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750942282; x=1751547082; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
        b=mfSEPBlv9Vlyjvx13pQlKuE0wWDR4zxAYiauaEBPcaVfSrOh3TFJr8bPN2PtsPNnm6
         MCcTzwhTxb+7vV0zOjIL9zhsRjxS9SEiiCB1JXRvAhZD/mhJCCJ861FI3LTW388tnzyr
         59oJY/jA0+7+5BM38WAWN7KL39uLcUUnDi37b9OKdc/PticrJNKVygiseiAkhQ5d9rPn
         4b1f2ad9V2o6VylKpDa5I98xLAqvmnCtXOmRZG5n4I78qcyI0M9ZOR2P1KvGkXXLzf3o
         dH/ija9gkPEF72rcAE3UDrGEOGul6MxABC3ygRghFkgCqRkTgJ6ZSHGXwWwVAr987y01
         Xbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942282; x=1751547082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBOE1VMy3aiNmMAuqSezLi2vpU4eQvqAQi8D31wgqI0=;
        b=muTafCase+N+1gkWBUD9SNUqX6ZOnKolA0JWqsUre19NN6bBrF8PmBY0MW1duf30Am
         Jka22+v87lDth0VIliKmnGIbl1dVuDXUqiVgU9c/chuUJzA3OsSblVeCYhrlUTSGm+M1
         2Olq5uU3Sc9cd8Z7AljTw50O3GjkMjN5Hh9x0X0VJ6WeCC/0sxvyqgK2NJFb3ealuPVC
         ZuWAqti4Bwra18YjV1yhxAxMYrVNyws5ZRK5MUNWfaNbRubmZXpmyOLoQ6vL+9m3kxLM
         lRoXc5lOWq6m0iBhK/07fIuHGYGSIkWwnuOZIxpFS1EzSMY1SKPyfYGSMpgXdKouh7W1
         F+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCX9eaCbttdP1uEGHAgPvwN1D2gQwzcB/HaDlDSqrKILMJnofTdC5FNVY44aw8J6BgkSQuk4DzKywyLcxIE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwS+iDz97/a1L+iEtpYiFQvZVsh7mr/cvII86F2lm3etuQELIf
	ur2gnUvMLs6kRdudzViu1bANj/uTMTYA6tLZ36goA9x0P1ihuuCpvdkwVaalvWvo4nPzFX9Sapt
	YGbL0w9OVjuNdLUe8Q7MmtVnInnn0J3J8pg==
X-Gm-Gg: ASbGnctfgsmZgpWRgBnH72Jb+uR4KhhS7Zg2SPtYuWCIS4p6xdw76UlVfe+mkuAqhbu
	lIdxsRbEIH5dqSovqswKzZ1WfRrx1YqzDRvIns6qnpN3wYmjBerB9ARSWA+FP4L+tpKxe66WVt+
	MyskxrkR3RJmVPM1Vmd9V5gMJlBzudH6qvrD0MySzmjtGE/Jyy6EnHhu7UuWIZkosYMjtzdy2cl
	QM=
X-Google-Smtp-Source: AGHT+IFZWx1CExsFcYzkKgRSn6PT1OrKOu0ar4lCr3LZ6482v+JvAxgEUxMROKMeUYASoC6jLk7aMuv0twPWR9b66d4=
X-Received: by 2002:a05:6512:6c2:b0:553:ad28:210a with SMTP id
 2adb3069b0e04-554fdfba1a4mr2378510e87.51.1750942282202; Thu, 26 Jun 2025
 05:51:22 -0700 (PDT)
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
References: <20250626115218.141874-1-arun@arunraghavan.net>
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com> <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
In-Reply-To: <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jun 2025 09:51:10 -0300
X-Gm-Features: Ac12FXwpQlqZH1FACB-cLvSeHDIWlKkvSrVU00W6rjN53m_7T8RNmlcxPGqQphA
Message-ID: <CAOMZO5AN1gH398AFS_F2G_nwR2-hJjJx-x0_Zy_VtmK3uet_uA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 9:28=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:

> Sure! Will send in a v4 with both of these.
>
> The commit that added the initial fix (3e3f8bd56955 ("ASoC: fsl_sai: fix
> no frame clk in master mode")) refers to an errata, but I could find
> anything in a couple of imx8* errata I checked.
>
> I was wondering if there's any public documentation of this that I can
> refer (and link) to?

I'm not aware of any public errata for this issue.

