Return-Path: <linuxppc-dev+bounces-1638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA1A9882A1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 12:37:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFRjz71kFz2yYJ;
	Fri, 27 Sep 2024 20:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727433447;
	cv=none; b=O50pOH74P4ZSj3bMyu8DbBrF+oRJq70lJQT6hsTD5WguOURpqnfNp1wFo0BLmc/Udeo4rLZOjimC4NoxxzMQ22YxhVCO/+J/oYOz91+TfMTjY4bt4qZmw58dkD93xXcZVCAJz9hE0U19vcOD8vaDjE1+wAFZUWzaxoh4VsByc6xBFOAbnK1BPEH9Wl4m0O3nz+Iz4Zk/k4tZz9LXv8v0WZKU6n8fQ/6tHZtstpHkYBAl7vMYYNCCkklciXkHQxPZaJJjDsAxnxXMN5ATHtfWyFHcx1WUyCuWRMdWKXgqdAB5umtqaXSxoJUspZzkDhsTrc6IWDuyiipuiloODSmWkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727433447; c=relaxed/relaxed;
	bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dK5prF0MN3bmhnHrJkXYItHRauxoGmArafhzO9waWTS4LzqdIsyfAAWEiILBljCLXhYHx/yVeeuxXsbkUjl15vOKXd3Xu6R5UvnPlXZxKgCjhD8c31KGSgbij+YjfHt4+KiA8SXgV3szYou5q5BKeznG4KDCoskh3+oUrG++bWJJK2FEGhVuk4Kjm2SphwhlUwIZ3E5qyc0xOlGaTNZKzYGUyBUbr8u0vTEzBWIz598lEluxK+6SqbYUdwLUipJgNvq5cczPCw2FCDBCtyAUER7FAKih4jWKUr/+vbh8j2F+GCPrv0oafg0PCiTmkZmZIlnuLGbLav1t6rAHZpLsHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TSnd0JnQ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TSnd0JnQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFRjy6Pyvz2xl5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 20:37:26 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a8ce5db8668so311607766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727433440; x=1728038240; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
        b=TSnd0JnQbjSMD6/ixTYFwZ3meqLmyRgSaogdBDyNDszY3KRCANyo8qY4XMYb8oZ2R3
         uY0hLCgS5K8onEGGsl8r7TOCq3KtSOlSbke2zEYZO/jlrwyAxWcaL4OIknTGl0egF31L
         NnWYaw4/9E5l1dy4li4lIpMPqK9BJD4Hj6FzminR0RxvNFV8uZ0VT3/krxfb5CQ2iEd5
         xIY75CVe9lqaYvAKC4ANYUmd3Vzpessh54rojjoWxnqPhFapU5vFDqkFLEWyG6fzhhM+
         p0w3Jshn+kIVWKPqML6h3ZHszbs9X/mWtnIlE1TdfPvVvYVaWLd+wWtHx2j9BVuAoihA
         jDeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727433440; x=1728038240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHoju3u/041HhlyK9FzkDceCp+u0ugdPviMfZb0y9V0=;
        b=AsFngnbHMydgeRru+DDnqq0Qx1L0LojtxqV6KCUg1jD6U/f2KKvuReSs6ITJfaaT/R
         63alxah90EP3GP3jDC3WHZyJoWAe2BQJTE5Xms2YhCLurznQaXxwAYmG/0G62IhNIY1S
         4c7kDRzpU9SosdPD1Aa/DzQ8Zxxq42nupD2GQyq24huSHxd9m5Vv6FwOejQbgxK3oexd
         73JNXcleUBPY/VkhMYiajAeLXMvWkW/M8Apk1XaSYvjuNXEM2RpjenLCl/Rb6TxZr27N
         Eem2VPKAl7plUrsywahxLhI4uaDbsumhE4rt0EJ5R6nD6/oG+xJE1RnoHXIjbZD9GHCI
         atQg==
X-Forwarded-Encrypted: i=1; AJvYcCXBwci2mStit7fE46bKPIylIRUwUnzTpIi9+BR138DRVuZ9kobm29jZbXoSLQUm5mQc8kEuZCTXXLR3NUk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLWzvnU82x+vRMq6NW0oGzVRTG0XfY6r2VX3nuw0UjB9iNdCn3
	dXYw/TFo5iWP2QzlND5mh4IsthA8571XqZOhVqvvswajpi1JrMbwphrM6kUo0lFsd+YQr8iwOjG
	fb9zSts7eRnfbYThXDSoDNMn5YRM=
X-Google-Smtp-Source: AGHT+IH78ZbE2U9C9t69k5TZ6X+Gi8DEQA9qne76aeeb9j3yf1y3FHSicvo5uPYPSIyCtIKCVHczjOJor/I4gd87RzU=
X-Received: by 2002:a17:907:9709:b0:a8a:7b8e:fe52 with SMTP id
 a640c23a62f3a-a93c4a98d9dmr283774766b.59.1727433440228; Fri, 27 Sep 2024
 03:37:20 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com> <1727424031-19551-2-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1727424031-19551-2-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 27 Sep 2024 13:38:15 +0300
Message-ID: <CAEnQRZC3SPUQg3B=0KtsWdNj40=rvjp9+e=1zAn7DhS+Z3wZ5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_micfil: fix regmap_write_bits usage
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 11:23=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> The last parameter 1 means BIT(0), which should be the
> correct BIT(X).
>
> Fixes: 47a70e6fc9a8 ("ASoC: Add MICFIL SoC Digital Audio Interface driver=
.")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

