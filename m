Return-Path: <linuxppc-dev+bounces-3493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A119D57CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 02:52:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvdQw0KYYz3bcV;
	Fri, 22 Nov 2024 12:52:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732240375;
	cv=none; b=cr9iJl1KsYXri3pIe4GIlPt94y07jNFGQMlvbk16Yu/sgwuMdDAC8qCa0kdlv+mOqoR5qhJhKik2HhPrXcq3GqzL8v1YV3uzZfA2MuI9lrI2TQNMJog/tG+wZHEwZxffCLN/+cHrNhUlYD9BS7XJ6ARG4Bk/Zf8HzR77fia72Jl2rkRFzIXzpqd4ichNfbK0a+8388Eid2g8+xlimF3aFZBE1aL3vNyHTzCFs7l+giwKBCaFETiSCv0lk/53kQG8nlSzDCHs9uG/cWSKjvDEAPZs0iSR3VWzh26dMtjatz2zGNrI94B/Yls4JKjrUe1y2CdF42pPYf5tFRhnAr85SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732240375; c=relaxed/relaxed;
	bh=mbFaO9tez8qpqQxYtfq9BotE31cLqD95Co6agCJWCiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2xDiIKk1kIXaUS029wJhrvb4Wlcf2GldR9ZtifWc2dqPu+YPaA26ZCS0eXMsuV2SlLITwHzA57qAwzhFqJwDvY2qJkV9Tex4BLMIPRdBlfSHJUHCcSW7MY+RhwSyjorE8sWnwusMhk3R3IWw7E7fGVUe0xYmY5qr6vReLKfx9HD4e6nHnvn7Glkv0v0+IaqDJUj5BFWqvdR9xsXKH67JLP3l6quiO351UXia6XAsBrcWe3RISZh1BFHGzs7a3E4hmyty0qkhOYTuQ0CFeNunacItdfLMg1MRaouj7rilEtkzgEEDLgZXYt20Eqp9eUm1I2268PHVY7vpC5YmgT9rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lXTl+0mN; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lXTl+0mN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvdQt1NT4z3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 12:52:53 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53c779ef19cso1845531e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 17:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732240369; x=1732845169; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbFaO9tez8qpqQxYtfq9BotE31cLqD95Co6agCJWCiE=;
        b=lXTl+0mN7nizRbrnPmnB74dOwP2TgVYlAw57BObNVWVCnCuNgh1kxUsWrxt0pH5urm
         4KN7BeYl9BMeLDDxihzCDoO01++Cet7NYqRlcrNLKy7WLCeHBRKBX0vJSe6EPXcWskgy
         rdhw92VmDw3vlNquExvoK2WE7iPjN7F/CN/dy5VKb2QJ7WdxpM+SYmox0YlOUTJxjF0g
         fq8pTmeaJQsrNZ4P4l75UJXnR1T4IYRiCyG6NCL3NPNtG6z7HZ7RQ3LKDLH8DLGG9qJR
         1xZlJFtpsKIyfZqAGNCnskIp+tvrTZTrXIJ0GgBdFuJWv2sxYyYyr4ghd+TmvKm6MVsV
         ZLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732240369; x=1732845169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbFaO9tez8qpqQxYtfq9BotE31cLqD95Co6agCJWCiE=;
        b=IUvs0mnIiSQek7/uQNy8l9UT8BIrdjIO2mOBMWazR8O8lCj+KNr8ArKvVq/BJMr8EB
         bAGee7wWdnO43+iJhm00PbOPAlB14yMrF9wEcZ6Vpwe7BmvWAntPTpFvlBIxWfs8hHPP
         cSjQaeKfRnGb00JMlMnOwLHovxXVQnAL+nKKKVMsp5gpvCgmRxg3sebhxByhQiGh+eLQ
         g59V+pT3dWDM0UZikK9tnIcl/WPJrdl0gzM4R4bHMaXsK0KU4vlPARsK4nHTfhbw5slP
         0Nv+jAhCqd/nKreVJ/Wfs5HBNCCuUx2j7fTe0SVAmPtZvcVQ+ont5YGOKYmFwazq1+pr
         GVLA==
X-Forwarded-Encrypted: i=1; AJvYcCUUSMJJqSdtuRNBpsXQPYNsM+/zDgtbnoM/o/uRbrVfG+9EMhqE8tMioFRImW0qtIyXP/zi50XRzNLQLGs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxT6vvBoN/1BpN53yo5c0H/zR+KY5KBy/SCCycCXtxxvgpPXuid
	EGRZJse82kHTSverdc6csDb6X+3vvdQB3hxDpVXHPbek9Eot1fTlLc9TeWKmNB0IwWpIBY5g67p
	upnHEJa2paB3RqYXFV1esdj+rSoM=
X-Gm-Gg: ASbGncspk2A4uHihbKJRAZHAFMoR2/DLgFMQb6bsSWJZE0z48CsVZYopzN6Omel+BhS
	xtC2ba3ctXg+26bPkdxPqFgwHegnhpZb8PdCOuSH+1i+Lqt38TQ47seWWfdnQ9A==
X-Google-Smtp-Source: AGHT+IHM9SYHUS840AKyk8frq7eVMfvYJ/7a2ZIQ4e3JhKBpwblqqJvz+6okd9WeuY9ETsGuSmUNrbjg33EZCqp2Vos=
X-Received: by 2002:a05:6512:3d28:b0:539:ea49:d163 with SMTP id
 2adb3069b0e04-53dd35aa4b4mr363247e87.21.1732240369055; Thu, 21 Nov 2024
 17:52:49 -0800 (PST)
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
References: <20241122014941.503789-1-shengjiu.wang@nxp.com> <20241122014941.503789-2-shengjiu.wang@nxp.com>
In-Reply-To: <20241122014941.503789-2-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 21 Nov 2024 22:52:37 -0300
Message-ID: <CAOMZO5CwCLZAM62CtNrLrCAFfQFvKuTArV3auR1WcE0+s0BnMg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_xcvr: change IFACE_PCM to IFACE_MIXER
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 21, 2024 at 10:50=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> As the snd_soc_card_get_kcontrol() is updated to use
> snd_ctl_find_id_mixer() in
> commit 897cc72b0837 ("ASoC: soc-card: Use
> snd_ctl_find_id_mixer() instead of open-coding")
> which make the iface fix to be IFACE_MIXER.

Should this have a Fixes tag?

