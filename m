Return-Path: <linuxppc-dev+bounces-7786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADA5A937E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 15:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfFr119kKz2yrQ;
	Fri, 18 Apr 2025 23:25:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744982721;
	cv=none; b=NYd2CjhYr5KMNF0/uQRYem0BJchajiZFnuZxs5GEEp/9LxXAkwdl//jSowfnaDDjMR6cv7h6lvXBBZb+q4gYZzz06srFcxNGqmjSps5nTSxW1+abgUYA5gIL2fUAtdAYbJ9sq/eJPBMgZT5JQciSySvWTJ0U9OsrEHQxPB6So07156AAuNXF2VHdyuYlmRPuwT9oSTwhOqcHsNSM3brwi3BUYLDfBR8o9DoXC6JuCi6ALeqV+YJZCCy0rP98OTmmTNsjxHLdTuESWI9P5kWp00L15L0WRb6WRQ3d1rBO3pzUvvOPAeH/fk9lmaKaKbnBzLABO6LX5XIVQ5QhkzOtvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744982721; c=relaxed/relaxed;
	bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+3/qjzyzWbStA7RYWZOG/y+949tWFnvwkC8y9ecPLCygfAL0HB2ZvzWulKRxuxtFQMcH2Yg4ieb11V692Dz5vLfFzqmBZtAaCvsyJlw6ZY+PX+0310/ovctRfXgvzkXnjMlC12iHibv2LY2sgJwG/v4GdNY7tY0zwf5cIGVAF3ko3smVrDT57Ul0PNZ4kpojKK5LR4k/QV8guYTDaB9vasjatbgirHCdkveyA48i8tnw2PqdQ5QJOFjTzMPeNByTW/OuaH/u5/MALWwiPdxgsnrNArOurj1wChbICuv2pf8lhIJMzm75UUDTTiTnJd3Nb9+GKEoJGKdTi9ZTrE8zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9edAHBq; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A9edAHBq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfFqy6YBQz2yqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 23:25:17 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e82396baaeso275050a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744982715; x=1745587515; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=A9edAHBqtdXu7fpa96gQrKE0mOgTseKkfVjXsMy45Sp8VBA9A6cfaGwrh328YwINRv
         UV9cu+DL7M4UqcHE5QixQZ+fOkVY+bRQJhHv4bQ6IbOiqd9UV4EH1suP4Z8oHh2mRKK1
         zuP3/OcezWBUth1eEzujSHnx4tv+WuRQBvnw4Vyr2+/TUzEerFSSazgd0NndC7o9FjWh
         er5s+fCm2y39Lje8vL988ZETDZy+4mQbCWqqQ/u4Z7rl3cDTkLKiQYzfs+6mlTAriJVM
         L90ZmfRQzFO1wf0W0gBfPmBUsDua7k97lBxkO3LabL5SoizcDRlcKITmnkBF+e2MWEK8
         Beuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744982715; x=1745587515;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVpxnI/29mpkrDRARmH1s8IOVcoXlXa8dMGnnZK1EKQ=;
        b=R67qYcwG/ONiWL8Qvs5VfqmRJaYOMUJu/JWgoi6XmnLdcwUP2xUhnmbjy1vBgxAnzY
         6e0aMb0PgzIH36XpPO/iY7pn8SKTmeB4uK8jy0c2sdU241vJI1TOW4hblql9bXaaQhzf
         wTc4WFwTAAHZ3D8d894xCs60m7VmkOyYdqsN0X2rrlaQKTA1bBwksadWe5iXFP4w1t5c
         RVCdbwaTaK+oUZQMOB7I6qoSAS36Uw+sfftXtnU5V4Qt3DsxYHeL7tkQDuBS8Yy0Dp+F
         T7IGetvZ0MSu2lJ8ioKJuNlVLMO4+IyUUf+PzmSPiiKvrj1gc8VYh27kvq21OjWATRId
         eyug==
X-Forwarded-Encrypted: i=1; AJvYcCVMcPg1yGtGZBQV0CoN3DN6iJLtnT3NoEFz/msN+JgDsii+4WjQTrX0BW9GYmJ+/d+kRZ/Uf3klLT5rTgA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhkOqKCo6q3tTQgnk6OUtEo8cltaeZS/MqVh59tSoXx/qxHWwy
	HpgFpDTddpH/vq5TOLrxPTOOxW3HfVKcvqgTxL/pJsLORoEEX/px
X-Gm-Gg: ASbGncutPgKmjMttqA0pd1c225MhuLrFhSHQbWNwQjlXmHvtBwmAcYXz/+1oYjPxKhb
	wt5recsrN0QNhDqNPeDqt8PkCaoYEfCS79CIZn5aKCjJ9QQlUBVMbfKp/feE3+s6pmL7gcIqx8o
	t3yaExv0LZaKejiqo6lMlLRmyNywLamSSBTb8tssdQuVr9KlyfpFeHwuu5yUuAXehEl7wzx0A3T
	K2MNImkoaOFD006UeuSeVRD2T6AQNhYVUeZ0f8US6S5X2kXCYpxuG0oBHfeYiTaT9W7PVUpJ1/C
	CEW5SylpsRzaVGYX2hdXS2n71FE2
X-Google-Smtp-Source: AGHT+IHY8YYl+gLe7z4XbImJlTJtfNKJ64WGJaDAJCdf8mISh7qKy9awk9jjoRAY+BWRqWp8cGMOBA==
X-Received: by 2002:a05:6402:350f:b0:5f4:5dfa:992c with SMTP id 4fb4d7f45d1cf-5f628536df7mr802836a12.3.1744982714460;
        Fri, 18 Apr 2025 06:25:14 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef45779sm118202566b.127.2025.04.18.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:25:13 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:25:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418132511.azibvntwzh6odqvx@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 11, 2025 at 05:57:40PM +0800, Wei Fang wrote:
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> index 20bfdf7fb4b4..ecb571e5ea50 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_cbdr.c
> @@ -60,6 +60,45 @@ void enetc_teardown_cbdr(struct enetc_cbdr *cbdr)
>  }
>  EXPORT_SYMBOL_GPL(enetc_teardown_cbdr);
>  
> +int enetc4_setup_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +	struct device *dev = &si->pdev->dev;
> +	struct enetc_hw *hw = &si->hw;
> +	struct netc_cbdr_regs regs;
> +
> +	user->cbdr_num = 1;
> +	user->cbdr_size = NETC_CBDR_BD_NUM;
> +	user->dev = dev;
> +	user->ring = devm_kcalloc(dev, user->cbdr_num,
> +				  sizeof(struct netc_cbdr), GFP_KERNEL);
> +	if (!user->ring)
> +		return -ENOMEM;
> +
> +	/* set CBDR cache attributes */
> +	enetc_wr(hw, ENETC_SICAR2,
> +		 ENETC_SICAR_RD_COHERENT | ENETC_SICAR_WR_COHERENT);
> +
> +	regs.pir = hw->reg + ENETC_SICBDRPIR;
> +	regs.cir = hw->reg + ENETC_SICBDRCIR;
> +	regs.mr = hw->reg + ENETC_SICBDRMR;
> +	regs.bar0 = hw->reg + ENETC_SICBDRBAR0;
> +	regs.bar1 = hw->reg + ENETC_SICBDRBAR1;
> +	regs.lenr = hw->reg + ENETC_SICBDRLENR;
> +
> +	return netc_setup_cbdr(dev, user->cbdr_size, &regs, user->ring);
> +}
> +EXPORT_SYMBOL_GPL(enetc4_setup_cbdr);
> +
> +void enetc4_teardown_cbdr(struct enetc_si *si)
> +{
> +	struct ntmp_user *user = &si->ntmp_user;
> +
> +	netc_teardown_cbdr(user->dev, user->ring);
> +	user->dev = NULL;
> +}
> +EXPORT_SYMBOL_GPL(enetc4_teardown_cbdr);

I wanted to ask why isn't netc_setup_cbdr() merged into enetc4_setup_cbdr()
(and likewise for teardown_cbdr), because they sound very similar, and
they operate on the same data - one is literally a continuation of the
other. Then I looked downstream where the netc_switch is another API
user of netc_setup_cbdr() and netc_teardown_cbdr().

Do you think you could rename netc_setup_cbdr() into something like below:

struct ntmp_user *ntmp_user_create(struct device *dev, size_t num_cbdr,
				   const struct netc_cbdr_regs *regs);
void ntmp_user_destroy(struct ntmp_user *user);

From a data encapsulation perspective, it would be great if the outside
world only worked with an opaque struct ntmp_user * pointer.

Hide NETC_CBDR_BD_NUM from include/linux/fsl/ntmp.h if API users don't
need to customize it, and let ntmp_user_create() set it.

Move even more initialization into ntmp_user_create(), like the
allocation of "user->ring", and reduce the number of arguments.

In my opinion this would be a more natural organization of the code.

