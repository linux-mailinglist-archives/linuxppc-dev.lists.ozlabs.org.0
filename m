Return-Path: <linuxppc-dev+bounces-2852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6439BC2AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 02:35:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xj9rc5hgLz2xrb;
	Tue,  5 Nov 2024 12:35:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730770528;
	cv=none; b=LMVI40aBpBUlByV7tKn/pFQjxEiGeh4y3LZe/k8xUP094e8aptK53YX4xm74VkAMiP5hKkqMW5GjlGoBiXFd1lF/NlnplXBXqIIEzfwd6K/suSgLBRH+AUPgoqRoDLpim2eJSk3CNGcXlBF8s81VGiPqo8+8ueVGoHOQl4f+3nMoSa9Rs+jPcdeI2ADtVxO27hyLTTqVRH8QAof9LqhOLck9QejPboz4D5qN8k3BoDRxkymK4Ic6fs4Ve9Y+tUcHAyMpdLew9BnWvKmZFmDWXytH3ZLDVq94h7Me/lPLH9VeIEc0UAPNTd2FKWGpq56AAB4wFy3y04jSYPODcRdTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730770528; c=relaxed/relaxed;
	bh=1olVdcYdpbzAU58yRsPEPtreJytP/ErwpPoWbC/4Weo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFB43DkQVcf1UZh/fE49lwJKNa5ayU1xdET85scf1cN7me84s8rfUlgy5rVU9ZxcQf75uYmvQbAf9fAOsIN4uY+Qk2UMpysmFr/dnfFVj6CB/4VOA/R1aYGOtRoQM1copyRGyZVk6RsyOKnyWl48nXUMHAqQOsIf2VZcr1jhdDEmyOid2Oy06mildgIMk9NUyRfkyu2sz5wqawCvoyKydCvVtvvfoEcTvBZDYP1zOfDcgBYm6AZFT6nX5AhkEHb5QnO7rJe+8UE/KzvBJFlGy0GNfVCyka321k+KKhgAgTXrC6geIY7hWVlWNgPOxqditLyLmKtopFPod2eO1gxVaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iuHDM3rD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iuHDM3rD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=rosenp@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xj9rb1p6qz2xk7
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 12:35:25 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-6e5cec98cceso39009937b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 17:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730770519; x=1731375319; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1olVdcYdpbzAU58yRsPEPtreJytP/ErwpPoWbC/4Weo=;
        b=iuHDM3rDLhujVe6sE662zGYyu+EG2JyTaSeFoWrwtQ6kl9WtK25RnNheJc3jD4NGWo
         DyTuBHkWuRLY/Xf2MuS2QGWAyqfsh68DWKmnzc6MBglF5vjy1LLdjB8vsq0L4fEAnst5
         SmgBlZlNouN7PGXVuphmQ0JCGbBwDjzrs9XwdbZ0QwiXxCD/gicAXu0JUYDhCWf00E0x
         HzMLE7y4xnKiY3fczBLE6KJK9rj6Vuvy0+GRVq9ZfuGF0yB6EonCFtum1Gb+jVnbrmNG
         3L6cs1BlR2YIfjF7A7ysGyXykfKhl7Ro4oWxJ3/RjuQDRZknnHjS21p5ECMY2+zoXdzL
         GZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730770519; x=1731375319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1olVdcYdpbzAU58yRsPEPtreJytP/ErwpPoWbC/4Weo=;
        b=vS0uN3/Oq6T2TFgAvzDVuJdkzZxBL9Rq+mfjC2fZrIOlKrhB+3pDgo3o4Y4dQomfZY
         fknPjDn+DxdwPdARZ5nc4Agu4VoH8F3sjWQEH+L4ESixkmgClY1/D37INd05pEN6Tmtw
         m/FoDnL60gaGzcl0SJ4z8sn6XGxhHehbCcHmHITSiE+tghve6LsPxLBP3dHCxYNK/XiH
         fthHY1Xe1rPQsvb2LeEG1VFEJPIj5QO7Cw8wYktot4kwqSdyzMgJkZHNsDu25WXfVAbR
         kr1BQJysiU6Opq71B8bqiUqKY1yjxJ2gxM6fI4So/2rpDkSmh39J5BoZnyvcy6Q2+PtE
         3/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUj+m3S8tdEWUfiz2e7jBn6M4P5oslMZIr4obKYTfIhqW2b4I6kpQtWaAVt1BSDJn+NwiS1PVzJEr2aWjA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3whVWMoGwJbApesCWx8bvWe5caS4X3PErpRWx0M81TsbQG9Hx
	WtdsZhxE16SMf+IFO9754jlz5JRJBJzP5DvNdklV23zeead/ZgX8JSmH44uduH8ouT5Vo3+pmuC
	LS4Sh/8Q4iaLrpsTx/kFmY5ogcrg=
X-Google-Smtp-Source: AGHT+IHumg29ZCvANUFmdwzLHDkWQb+pLrpZmept1M1Rh2XLyhWlPjqmDFclS/BZdxG49yfm/f+VICBmuMl/EwbpAlM=
X-Received: by 2002:a05:690c:64c6:b0:6e2:1a56:bff8 with SMTP id
 00721157ae682-6ea52525bb1mr153943557b3.36.1730770519634; Mon, 04 Nov 2024
 17:35:19 -0800 (PST)
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
References: <20241104210127.307420-1-rosenp@gmail.com>
In-Reply-To: <20241104210127.307420-1-rosenp@gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 4 Nov 2024 17:35:08 -0800
Message-ID: <CAKxU2N_wxh+31VkZAAczVUUVt5duLv=yBj9zyLMDfoYGPq=G5Q@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: ucc_geth: devm cleanups
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, maxime.chevallier@bootlin.com, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"open list:FREESCALE QUICC ENGINE UCC ETHERNET DRIVER" <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 4, 2024 at 1:01=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:
>
> Also added a small fix for NVMEM mac addresses.
>
> This was tested as working on a Watchguard T10 device.
>
> Rosen Penev (4):
>   net: ucc_geth: use devm for kmemdup
>   net: ucc_geth: use devm for alloc_etherdev
>   net: ucc_geth: use devm for register_netdev
>   net: ucc_geth: fix usage with NVMEM MAC address
oh this is interesting

_remove calls platform_get_drvdata but platform_set_drvdata never gets
called. I believe that means _remove is operating on a NULL pointer.
>
>  drivers/net/ethernet/freescale/ucc_geth.c | 34 ++++++++++-------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
>
> --
> 2.47.0
>

