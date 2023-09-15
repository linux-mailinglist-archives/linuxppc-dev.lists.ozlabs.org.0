Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657377A1909
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 10:39:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B60VTpXE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rn70p1cyRz3cnd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 18:39:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B60VTpXE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rn6zz4zSFz3c2Z
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 18:39:10 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-52a1ce52ef4so2296214a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694767146; x=1695371946; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dcJ0YF656Gqyw4TwkIVu38nmGFD+TIOI6rP0TNwnO88=;
        b=B60VTpXEurNjwB4Ma+Qbvm4aj/QUuzWKnd7/7iyvCEuoKODCC+Awivk3SPR+cpidDP
         KlORyzmEnCaMXpOeMrG0iF/sps1QIZSoqZjjcGtuC34sW8x93TkZslShwIQfK/57UDXS
         ojUeKwCHZJDx9D87hVfS+BLg++UYy7X1n1Zt+Mm+Mb37eth7xjJQ+WY8KYPeHclu0Blg
         8MF3oi9y9KXHy5Y0qZiUgKK6YL6RK6qEP/EFMWRJiAfevCYsX5UHwE5IGLnTl7956CMG
         wZoD3v9WhQkQPVMo26vi2GvojFNSDSqsxpSyI15hN9ioCZmpRZ+rdytkV9xOxhI4w3p1
         TzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694767146; x=1695371946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dcJ0YF656Gqyw4TwkIVu38nmGFD+TIOI6rP0TNwnO88=;
        b=ppuYp7wAG59DCpn0y0pcID/1c6MTcIObVPiKIdyQJu2UsCCfy3xgu6O7KProiZO0oc
         T3M8u4DL2qE9IKMBVIy2TkYGj6bylOsHpSY6o6tqmIZEa15//WYASrHPdBH1dvoHHkHf
         cYD0Vbm7ztvtCjrUIxfPpWn53YZ8aszzO+5njwNkM76HCsbPXA4d0Q7LbL8Ddpw67c8B
         rGyk/V85mFp1uRp3Q8IFyxkq2xUdyMlSWEgC7mRUi2QGa8UJBzBHShWuRw0zvfgArItO
         F37RWlCUtwQu09/aPFxhRRQrw95+agGrdPXVKeDDBtsBkG4Imao7ZDWPiltgaZTMo9vh
         vgEg==
X-Gm-Message-State: AOJu0YxqqkaNhfqdal/mwz8nCGkalDUQY5a0/I7+7Hjpmz3AKIfuigdv
	Pm2X9Az7yDPUiavBYMf70m1CqjG7zPpdN1cdUMs=
X-Google-Smtp-Source: AGHT+IFqWx5uj2DHjRauIvxPCOhENMc7x02MgQj1RmKhG/d1C1fdZNN3IRf0HXHut2+w8tXTNZoGQcO6LcoXjI6pYko=
X-Received: by 2002:aa7:cd57:0:b0:52d:212d:78e8 with SMTP id
 v23-20020aa7cd57000000b0052d212d78e8mr847795edw.34.1694767146186; Fri, 15 Sep
 2023 01:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <1694757731-18308-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1694757731-18308-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 15 Sep 2023 11:38:54 +0300
Message-ID: <CAEnQRZAU01qbeVjcEVnL0emc3ovo+NSs_N5=xUB2fVaswnjVqg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmix: Fix return error with devm_clk_get()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 9:38=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The devm_clk_get() can return -EPROBE_DEFER error,
> modify the error code to be -EINVAL is not correct, which
> cause the -EPROBE_DEFER error is not correctly handled.
>
> This patch is to fix the return error code.
>
> Fixes: b86ef5367761 ("ASoC: fsl: Add Audio Mixer machine driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
