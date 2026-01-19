Return-Path: <linuxppc-dev+bounces-16000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20415D3AF3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 16:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvvgp3C8Zz3bZm;
	Tue, 20 Jan 2026 02:36:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768836982;
	cv=none; b=U8jFr/dPEurIcVNQqZq6DnN2f+/2ds0kVKMriQXR/7hylKefQW3z5d1qbE2RbKZ+pKhSJzTykDWe924WFIbZ1Uw2p7QU4pxF6h28IOHqeNcMB878NAGs5+4ELbeDRyge0QcPWK+9wxZP6NltLn2LrKu4gMWZRKC+KWSgJwLWcVSNahMxqdccWKfHMRHKxqt8h5vV475ieRGl6XRzinu8wKWVjbERzgxlbIINgHyR6rgaA9OMRYORyT/upTNCDz9ojOTPt09glqsw/q7YhTRiEuWf2HGsxepZNmZ3NqYjYZUGnuEH2tdRN136IHoZbPRVSd0iXhR2cTKIBqo2qbG0iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768836982; c=relaxed/relaxed;
	bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BFEuha5lEAPnrig1bx/LQPUYO2S13qR3q1f3o1tq7NjXe6uI9IFbOAKIBACs1LvG6oDwDlupAbeLU8WxKvrrioHWIzFRVZ0MAdk4Pky+nlIydeucDb1WpfGDR17x2PeijAHIzwZwhuWJIFPKG90AkShihtlgU3JDduXqd21NmdjmmxN+MhVJrjh0lRtqNDpQhwPGhzH495gv7zEiG3nl63Z3UFJHDhuP1PEScUYjSUZlveMRyxymRsqnx6GnzevgQFM+cs4ADJqgu8VtMePiyNY/BJAD8Ccn8KPdHpJsdSsxo1BP69YmcAr9QcI8Sf946O1XxyIVEUigg8t8vReXJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lRRO7DXS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lRRO7DXS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvvgn34Xvz2xT4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 02:36:21 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so24147205e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836978; x=1769441778; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=lRRO7DXSQV2ndcTbrb1iwJh20pzyfwyZ9eO2A6ajSt/LJUra4MgDRevK6M1Hu81Ml1
         21g2lcWxtx8NbGW/dCFHKyNhzDHNkVYig/Au8jHRcE2EE5f0RNvB2i/vgWYIyVSufBfW
         Mfw4Qi6xGrykWrJ+qPv4zq5r7LX712NPomyrPVgNIUUeiUwuqI7eT5QqNjc3Xkr5d9RU
         /Fb2uqSJHgOw/V8ixfLw1laGJqEhQaXo/mqyhyI8S33TdhS44AuUXuUS+ZJx7eafNZM9
         smva+Um6exSlOdPdfjz9bEbL8c7JZvAvvKmQLYmrsokm+adihNFxKgAE2Qc53KKeBWzK
         RVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836978; x=1769441778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=Xo8qo9XMNgHo3oBW0kyvOGi/YVBuh9YopdFiUaq+3+1nTy3/c6DHTFkThCXhiPjLgC
         p8goH/es9TD5Te9XF4ncTegbtOxQcBcETz6X0dWIXEDlV/Okd6LDt0190YZYzozIknEO
         U0xeE1FUNyR3qGsdL0bN4w0z6IIndd+Bft0nYL0beKczCi9SogVQQiFweBPvNCW6LALl
         Tjf70Lr0pkW1EaSLRX6qOMJ37qgUywefhhi8v0bIaV0JuPsyRguj96QHIwtMWp3f4Huy
         GiiDcKouUZQl0FhLcMGdoT/0udVui4wZJjCFhq/ehAqqEKdgrHN2DB6pTCPA/WqqjuFx
         OD2w==
X-Forwarded-Encrypted: i=1; AJvYcCXVZMu2dxPSh0AzLUb6Va6Q8h138qtsdinoVoX2r85CafUqz/+DzqgtfWuwwBuCX2bhTXcRA4BmJ41g68k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwtH7CsjacgdMVE05MKxyaVCQzrI7zY9UZvg5FnH44wLBHnyy/a
	yL12+A0R2VJAvQy0/A5hl5/LRTdeb9L2gjaiOVojydKh6WC0XP0h9CTI
X-Gm-Gg: AY/fxX7ZFpSctqs+4IoF+2TL8+5LuGlBxS0QzlIyZFQftyTdtl8SQiVRaHsETYF+s1g
	QD4SRJepJiXD7mFyrgYpR5ODQMNeI7QwsyDkUxjf02uxlkCpouwOZ9hrDVzrg59I7HzV37JiQdc
	2vVqWi0q0eEPGtbW1HHVyOk74ioGFdq8TGhxdHsL3xc3R4QONQAwAAu3dkxmNnS3GilZdqs5NYA
	dKBZF0xxV02ML1Lzq0LCQtdOA9W8TCfHBD8ucBZ3y0NwhdDlLA0IZu65yBas0JR3urkHNOHXt1e
	WA8E8tkLZkytAsWi0+26WmKVbt5ea/0aCOkzkJYRswuhFhySHNuIxUsg8fyf53LUTd3KIWTmhxU
	jUoBHORjzLvgmvtXTvMgpwROX35V4X3XxOPQJ27tpw6Yr1bhU4zxT5XN31M1h10mAPqDc1hVWKc
	WYLXvC6osye8akGdn1/3totM7BXnMwa7HqKZMLH/ZIt4/eQDhgNkijfbSVu+5HgZI/w/Am
X-Received: by 2002:a05:600c:4584:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-4801e350af0mr140088985e9.33.1768836977812;
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm23614533f8f.13.2026.01.19.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Date: Mon, 19 Jan 2026 16:36:15 +0100
Message-ID: <5957177.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References:
 <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dne ponedeljek, 19. januar 2026 ob 11:40:19 Srednjeevropski standardni =C4=
=8Das je Bartosz Golaszewski napisal(a):
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



