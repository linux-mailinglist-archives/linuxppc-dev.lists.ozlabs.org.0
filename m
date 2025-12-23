Return-Path: <linuxppc-dev+bounces-14960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 719E8CDACE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 00:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbW3l3kvFz2yFW;
	Wed, 24 Dec 2025 10:11:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766487899;
	cv=none; b=OR/hLP4QKMHj+xmHbDnLTKRrYV7P8Dy9KKugBFYa/hulMQH3A0hh04onxnP2fZSJrmnQDLD+cUNRSxUk55izTWtZZkUMeqnJenerF0Zb0kkgKpnO4z6D649Qx1nOJGSBI0FiblIvAhvJfT/UtrfG7SwIkmXhf40uU11e588L/6EMheBXHWyGYQkMJ05FiNKUu80OKJYy4Fx1G5wVyEpBkecOoRVJTEL97GRLe88T3HFS+pRDq32iADyjLjia/t7tUKHIg4eUAmT7AUJOjmeTiqBcLcVb8J6YO4EHjlgA25Rh3srd5l/HeaG/6ZWh1aPlGvXbmZru64Tr522es7nOJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766487899; c=relaxed/relaxed;
	bh=pQ+XXkvHSA2dGT1VpgVey3NASrpnvjmCvzg+N/lld3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQynKzX5ULbLSTNAym6CdraqLcM6POhgTmv02upHT+kI69A50nh5DqrlQvbOfh4b3ZzZijnoStXaQVMqxGEpRvLg2NK5UUIYfpobN0hIs2HvomwKagPXfp5aOLTKTAsHQc4KG+FoOcyRgaBnnRATK1WF/Qv4og65hVNYHZUanKsT1mI7DiiCMzl7Bry86k8wOOWiScPjZETkVeyl5uEJAgBfCpQnrrZMnmD/tI8mcesXPTLnQtv0p4AliX7Cyx93hdygdx+8qkU3OuFptyS7J2eLm36qEYAmDKuHtVE9OFUgLn4nLwJF6Vha8h/OW6rWe+ieuoCxd9Ch5DUf5bXB8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4iFTtyU; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r4iFTtyU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=wens@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbBx63FKVz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 22:04:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B901A60139
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C54DC19425
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766487865;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=r4iFTtyUaJSeS53r1g6gYRFQ7LBaaU420AqItPgA01WKlV5q/GSaZwo5Y56adUcE8
	 u2d8PJaKvSBlyIoSlSx9EBMkmTqI5lE7OhtEd3m0mt0ypIdXUu86yEReqPgADay1Wu
	 1TnsXU79RRm0GCehzjxo1DccTqpYKDFimY3zRVGjBpBp140cl2IXt8llhHYbkzj44P
	 qS0WPx5fFkv3eVcFgNTxYag6jaHPWTkeJ/ATaaWXfpJNzDAbCJOolk76PdEn3+RgFT
	 6TM0VIWEe4Bs2OipQqftao//8I0zJxrPlQ1NbUAPqeZEUiBGfxuVW3LxW5SuVxbQy7
	 Ut4XKpDb0EqCQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59584301f0cso5254669e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Dec 2025 03:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWASG3PiIWbS3FUL97F6s5sfnAoaALxHJxScPpfRvOHpo33g7PDH9lOm3dQn9cVO+urFNmcxpGN70PdsRg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyH6RjlMPdYaAPWHdTJFArMGkTManQ2TbTuh3C1fMsSxvIfOCHs
	Pr+pZ3ion6yEecyhZ4eJLN0nOT389yE/UN6htn1rfcalL9ozDkQXHx/yDAi1bnwDfgtF2CJ+wrY
	HkCeHnxO1vOg4e9PFr8oLXi4S50k2Q/k=
X-Google-Smtp-Source: AGHT+IHFRCOw1OndrHUP8fu/5Pu86rNoly2fZw9WpBncVYiaNKQ4oxRlCC+E8Yk0b5wLZeLJPra7VnbPIBMd4pnW17A=
X-Received: by 2002:a05:6512:b85:b0:598:853e:4865 with SMTP id
 2adb3069b0e04-59a17d670demr5354973e87.50.1766487863823; Tue, 23 Dec 2025
 03:04:23 -0800 (PST)
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
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Dec 2025 19:04:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
X-Gm-Features: AQt7F2oTKoNzOiHRkxSJE0lLrLQx6-2c3kaid1cyT2kNWjPKTkvyybHt0ZNsvmc
Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
Subject: Re: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 6:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert all instances of using device printk helpers with struct device
> embedded in struct i2c_adapter to the new i2c-specific macros that hide
> that dereference.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648=
c082f319d955b5e 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
>         if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
> -               dev_err(&adap->dev, "invalid P2WI address\n");
> +               i2c_err(adap, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
>
> @@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         writel(dlen, p2wi->regs + P2WI_DLEN);
>
>         if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
> @@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap=
, u16 addr,
>         wait_for_completion(&p2wi->complete);
>
>         if (p2wi->status & P2WI_INTS_LOAD_BSY) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
>         if (p2wi->status & P2WI_INTS_TRANS_ERR) {
> -               dev_err(&adap->dev, "P2WI bus xfer error\n");
> +               i2c_err(adap, "P2WI bus xfer error\n");
>                 return -ENXIO;
>         }
>
>
> --
> 2.47.3
>

