Return-Path: <linuxppc-dev+bounces-7791-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B858A9381E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 15:52:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfGRr0JXdz3br7;
	Fri, 18 Apr 2025 23:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744984376;
	cv=none; b=KN2cjWYCSz11NPCemimM1S0z3HRV3DG8i5vkzl0TLsleuN6aV78KknS4G21CKUt0h0Kbyr8/6l6yIjxk0qrZRPyxAmXMDftApJPs0umaf5j7z315dRHXwMkJoizcMG6FDGjWJ3r2C8TEHAeL4xbHu0prjzWxkdOcQoAajkwDdee66MXf0DOS7WMpyiiS0fjQtmOvYM7+lWYwNg6zMQhBJPMPno1ZfOyh2kiMJIp0MQJfG7uxBVWoukJukcQSzNAgVRo80gqn/QkoXvvoUgetbvVT+PUHMbDsLoCKDmdk4gnHBspiAb6OsWCyprCzVJIXB1ETuAHVJeBDRSEqZB5Kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744984376; c=relaxed/relaxed;
	bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcfIpOGzXbUk2NkOsx7jtW0XknZ7HmGAkYWwtvWlSKY1O8DGNQXbqEXq3LgzMeAs7Rg3s8zuXFGEsYe40kk7cWldaXxIaxCMme+xYrCq4IqUN4lwCsiAtsVMneVp+Q0lI7wr0YFmmDsN2FezMN2/DEOwt6apFsMjxIT+8Cr5Z848IPPcDLOnDoma1OHuQRYrfGVeOjHJIuPG00SlL1CGDS6fO4ow43NdrKiOP07+1jusOXLawaSugtDvTJBQxNKONAz7+Asyy6hYXw4OPaiCUg9O3JzRHq2w7bEs8dLAAC1TWKut6a01XCP36u+Joxi4L07vpETxz7bhk9+Uo2jGxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaGNINY6; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GaGNINY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfGRp6G1hz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 23:52:54 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5f37f45e819so312513a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 06:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744984371; x=1745589171; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=GaGNINY6153CFVFMz0Vo47T+KVOWSkl3MpjcSGtcval6NFU6SqpIkiLaq8J6qOgxON
         Y51slMLmKQj5pqhZ8AlQBoW52sQIe4yPfMoQ+x0K1NuS288SHZCjU3uZniRYzXXijU55
         BNVRG+aneR5FLZHNGfYVL/nRzLGj6g4XuFIaCSWs4IKlc0CoUMj8k9rU884xyqmugZ27
         PNP0IziZE13rQnoVOfQGaUvB65ddiNN/PaOUoOl0l4FW7jO6LypBe/m04a3hVyGJydRW
         s1N0Lg34oh88boXNLR398tWIXjU8LP45Oon++wm5iwVdjaHbpIb4+AZ32skpE69rl1bp
         mUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984371; x=1745589171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuBgNv5cd1S2PD2hevcSRahDNpP8CA3ZoLvuCSdO+No=;
        b=rFDdnUBI7/IPUlAKsBrcUc3VKtQS0/RohzZuOYkeXC8bIm664usivsKLLF1JqgaJsb
         hYzZxZBd6IpyMJ2zwXvSUecYVTJq1dIYRGMIcUM34UdsxEjc/JxqPbod59vRQR6hSWDe
         EQMv2KZYCz5mz/65dA4Su/yq1h5bAaR2ieKUyxI7G/Je9Fhk9wql+DyczvFaB7ICFS9M
         Wh5ys0G3OWCt7W3dx4Ce+w5fl8hNRGOujH4ljudUO80uqsO7u9D6W0MKeDRkJ7RTib5g
         DjwBfBlZCknAiuEHz0B5OZvZQkssgO/KTRWeK3/11Je5u8plCf5wt4uGm8xK9Cl3AyDa
         XINQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwCVRWmRUu1qcCf8MzLxShqDbxjkcTZbgVUEUR254eNpWhb2HmuPF4cxmXLBG9zd/XHRlPLBbqmxrTTsY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4FWv5jpVMB4b57oHUVAfEo5rc/cRb8DGogXRKKSXToRVD40+q
	9G3Ju8Fv/9at8iREkdY6RLhnGPPwLb3Slt3STuwItZLRvfH81Yh5Gf0CZJ1B
X-Gm-Gg: ASbGncsU/rrJIJNbkggjYDI5Dm4JnB9KNYb1R3udVUqI1qNBzInyk8fDesEtgl0nhXH
	SZZM3WJ5av3ZaL9daq9Y/SlMyO5NQpgJi/JQfVazdezAMcqB6WRpKitnhtw9mtnHllSk5AB8fuD
	+7nS5rXZBWmcNgkamqMoE7w+8jI7bSEKUrOmj1YenMZw4dAOV3IOi3FpWoLMDtZts8MpxaMcXah
	lNdEo56g4KJyoN9EzaHb6Sl/BhVZAi4+kxJ9ceB9ZX+7rW7QNbkh+s1NnasttCt+UhiIGaiK/B6
	40Cgn9Tn5DiDcP5rghbQHqSqZ5W2
X-Google-Smtp-Source: AGHT+IFVtlQMaZys0yRiOygdgzqKHFtvYUnzaYsTx8NK1/CznrSsNWU+sPquLkREls3wzbKnT9aYMw==
X-Received: by 2002:a17:907:7f0d:b0:acb:583:c63a with SMTP id a640c23a62f3a-acb74dd060cmr67927566b.15.1744984371062;
        Fri, 18 Apr 2025 06:52:51 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0bedbsm124885266b.16.2025.04.18.06.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:52:50 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:52:47 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 02/14] net: enetc: add command BD ring
 support for i.MX95 ENETC
Message-ID: <20250418135247.kf3syqrv3lznmcbf@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250411095752.3072696-3-wei.fang@nxp.com>
 <20250418132511.azibvntwzh6odqvx@skbuf>
 <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
In-Reply-To: <PAXPR04MB85105C88656FA179985C8F0D88BF2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 01:49:25PM +0000, Wei Fang wrote:
> Do we need to retain cbdr_size in struct ntmp_user? Or just remove it in
> next version?

It seems redundant with cbdr->bd_num, so yes, please remove it.

