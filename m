Return-Path: <linuxppc-dev+bounces-3032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AA59C17B1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 09:19:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlBg12DrWz3bs0;
	Fri,  8 Nov 2024 19:19:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731053949;
	cv=none; b=cVPq65xO9usoWw0IFjHFmZ0gXGBycOdfLYiZkH89rwcgVKxs6x0S+9QQh0eODZKa7c+GnrHmKYS6492wGqB2iCmXy74ohiTwc7EwSVG5Oo7t855M3A0B3cEPal5LExQmmXH4Whh+a0hTu9/zmLUsf3Xg5lQ56uSLGbMbRVgz/TlCHufuM3rMna8DqSvbJJyQ9xB5IPCbQKM0d91ldWsSCZnLZQN+Ia6hVujmnCCGfCTdQnQ7JoHMMuM7wML+8JeJSMmdW4WN/Bfnpfm7bl9W+rP3D0h4XqDN1fpPfRnp6FdgWg81jpad5WNZ5ciQv4Ix6/LrKuBz4298JepEPJ/GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731053949; c=relaxed/relaxed;
	bh=7weDCW+gN74xem4t7h6tdCuTguG0yxU10+YOsux9xyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGo8I7FaGnEjwIZx5PSCMAxxQWZVRuw8UJR+DUtVcClsM2vPdvgn0iL2HVByqQ4I12h+xRL9ZGVtimOlZ/Z0hjq/0uThNAup9uM94BXTQkOP2EdKSFl69DKWZz03eeDGgz9fmf62CNBGXfSHTUJEIw4wXjjBh/f+pOd4WuYNKeVFMQGVeNUF8XIAtW0VBQrW5aiKBu/Njtu/d4o7fVN2dY35vQVbKfLdrNDh3rXFzI70XBpy7X+dn5rbbFZ5aOaBnaxEJIuAJbchyYLgIhdKTq8u6EEIxW9nDtkvpReptJg6QlmK2z7Ra8SWoQlTSlh0eUWG3oklwhAojAZ2fdjAWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oruH1Bf/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=oruH1Bf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlBfy74Vmz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 19:19:05 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb561f273eso17165591fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Nov 2024 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731053937; x=1731658737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7weDCW+gN74xem4t7h6tdCuTguG0yxU10+YOsux9xyA=;
        b=oruH1Bf/pDz+rRxFxHRblBvfncVToaTAQFRo70kTfUkaAcGefEPEey2gzRx6xa4DjA
         jDUdu3GcQ+Pir6KqgnZcVkYMfT+DrWof35rP6LRwtHb+i18lDdz8cX6P4tUMIZgurLQD
         SE39Lox+DIJbAmE4bZsLMLKREsFE7DOTvkjNPuGBrMuJFOCa9sIHN8+0ejMwaFptF3vG
         z1dya/z8wSZEj9FW8xXXxe5iltc1n7LYYxzUzpapnuthXGRH88t9K8DhQUUusi7QAEMi
         Rj4pHchv2qAMBsVDzRDZZqWTl6irEPAURRoAmgJjF8boKTxrXK5t0yeEbEhgtoW3vX5p
         xBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731053937; x=1731658737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7weDCW+gN74xem4t7h6tdCuTguG0yxU10+YOsux9xyA=;
        b=LwoHQPPhMJUMerCNydrT/8zsI4qcNnXqVTH7kfDaNSaBhORxbqXzVwPsXH9XuJiVwO
         iVl70Ih+QOXHKbqs6Udaxpe1wCQw3/npmwrY82lyEYayvAY67oyoCBJH3ckrb2cmiaR1
         52wa9ZqPlT50w/XU4r8O1pjU8sOnf9HGhwcsO50hB0KOPhahqhy0rjpfCIlOi6I1CaQr
         nFBm0NkCRXrdR8n6jsUJdiQYGBiqCEAWjg+1cfBp/IuVoZuW33rtofSUzY+nJD3Al8LX
         b8XsNhUR/RX6f+eqFJ9qCG9M/g53N25UnqSX/w6/G/EJImUU2kKwwqj5NRwr2WZ2st56
         CGMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSVJ9OxcnBckX6krui+UiauxyQf6nDwqCdv3PljCTw+oXM1gd2nS5LCU1YGoJQQqWz+3eP++rsPCtfMfs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwuyOV3W4DMlfHHtTx0XHQHu5UA7SGkQjq4Qe55+qWDEUX5t/B7
	VDva8M3UgE9Zpaazo/UKxFNtUAAHM2PbO30AoWZ36OHLjLZVrN/WL0JdwtaFYH00RZbBAM4BL4k
	mCoWMhDCWf7V4Fqt/h/dHRy8YmpazAIFwO6Yk4A==
X-Google-Smtp-Source: AGHT+IHCIxuHEoVE8+BFhK198XyG/6aUMFHKEpPKf+uJvRzG/l802RGWVl7otTIHAYFAGrY/bbYUdRjkiACDFEhl8zE=
X-Received: by 2002:a2e:a914:0:b0:2ff:191d:f077 with SMTP id
 38308e7fff4ca-2ff200809a3mr9758101fa.0.1731053936611; Fri, 08 Nov 2024
 00:18:56 -0800 (PST)
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
References: <202410301531.7Vr9UkCn-lkp@intel.com>
In-Reply-To: <202410301531.7Vr9UkCn-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 09:18:45 +0100
Message-ID: <CACRpkdbW5kheaWPzKip9ucEwK2uv+Cmf5SwT1necfa3Ynct6Ag@mail.gmail.com>
Subject: Re: drivers/net/ethernet/freescale/ucc_geth.c:2454:64: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
To: kernel test robot <lkp@intel.com>, 
	"linuxppc-dev@lists.ozlabs.org list" <linuxppc-dev@lists.ozlabs.org>, netdev <netdev@vger.kernel.org>
Cc: Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 30, 2024 at 8:05=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
> commit: b28d1ccf921a4333be14017d82066386d419e638 powerpc/io: Expect immut=
able pointer in virt_to_phys() prototype

Ugh Stanislav do you have ideas around this one?

>    drivers/net/ethernet/freescale/ucc_geth.c:244:21: sparse:     got rest=
ricted __be32 [noderef] __iomem *
>    drivers/net/ethernet/freescale/ucc_geth.c:405:22: sparse: sparse: inco=
rrect type in argument 1 (different base types) @@     expected unsigned sh=
ort volatile [noderef] [usertype] __iomem *addr @@     got restricted __be1=
6 [noderef] [usertype] __iomem * @@

They all look the same, it's from this:

static void set_mac_addr(__be16 __iomem *reg, u8 *mac)
{
    out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);
    out_be16(&reg[1], ((u16)mac[3] << 8) | mac[2]);
    out_be16(&reg[2], ((u16)mac[1] << 8) | mac[0]);
}

Is it simply that we need a paranthesis extra around the thing casted
to (u16) else it becomes u32?

I.e. change:

out_be16(&reg[0], ((u16)mac[5] << 8) | mac[4]);

to:

out_be16(&reg[0], ((u16)(mac[5] << 8) | mac[4]));

everywhere in this driver?

In that case it's a straight-forward fix (and the code is buggy to begin wi=
th).

Yours,
Linus Walleij

