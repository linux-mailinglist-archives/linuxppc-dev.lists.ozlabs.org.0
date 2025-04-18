Return-Path: <linuxppc-dev+bounces-7793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F8FA938A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 16:30:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfHGk3Pwwz3bs0;
	Sat, 19 Apr 2025 00:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::531"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744986606;
	cv=none; b=MH29W6Xz+ctf0CyXQWbhNAziVzjI106j/oGTnF4ib4hgzEBzVYHV6XMLt1uw1p5lSQfLYPCOs7Jb0WtQSFY6vsZINeJAUgUHysKeZ+BpQEMEYfR/6LI98cFd6Y+ffGwilmzBIhNE+M7b+ktr4nI/9OVEAhk32PKWIy0uzZuOa3ci6xA7GRKH6J5Kxd7EbI0lZLYIwFbf3IiWX6VIV5eG6cSVMzaDpJMHaXY63zxj8XENei2lOpP0iAm0uGvfSW5zDEVhv/bJH0w81auPCioDpFfs3mQwSRZhUYykNafHj/6UvpQGmjxiD8kcBHf7Sgvk8lIYUROWt5KJu6mDZ2jPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744986606; c=relaxed/relaxed;
	bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boBazf42+CZIvYbgznT0Ii/U9fvB4uyB1mJwVGsDB1yWpI7gmKWOTMc9M9ljY/VYKmO22MS01Ot6k0o1bVOXyyu6ETBXOVOSyLbKHqG89+JWvG6ZVfQc5XZspYtIMBdhmc6miUgwV2Xxn+dOVWY0qbFpLargPxB8LZNLq8Pei5/69NY7R4jdz/JBB4DM/WAB2yUt5M8I51Nu8VMAqOFVJhZOr5+oKOfaQdLfxs+6MN6GyNyG3oVQKvo2ZlupfdYdnePnA1TsR6s8VkqqZn0GJiONVFtLg1xRPqgl0+D+nsG9CRxZwsLqjIHMdypGpuXvcEL6rM/0bQh1tVOSYhjQ0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V6YuOnva; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V6YuOnva;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfHGj0qmwz3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 00:30:04 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5e8484bb895so545656a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744986602; x=1745591402; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=V6YuOnvaFh0NVu36KPxg0m0XwtsRNRD1e6kJ4IE00ilxwQ6uKsfibLiNaUom/QVujd
         FG4bO3qpLav71YcOO7x1ZnAYgsVhAbLRcM60CG/9eb8SB4ygkzZe8bNt4CX0ClORo/ju
         LtI/TpbX4cko3a7iUoqB7PumomgzgGO5LDhxZWgeeoHks8mHWYvv0sjLYMOAKn0LncGb
         gmlnoa6yC48NxLR94DNyeQA4/NemlMwe3KFWWQavdPI/8C5sLWbL/XizbyA28CnWeCCH
         0oXaKUWLKhMWtuTLVKDbmNd2rE+0nx5TJowG9FqOfwY3VZKxHhladH5dNQ4HsQDY5t9q
         qcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744986602; x=1745591402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jEb+3qqZQ6y0qknhmyqZMe7sYP4AQ+xYtScn/gz9NwM=;
        b=PMRFVMQA1JXD+0PIQ/sKwGQPZbX0XAY1ZdSlOGE6DDQy5ZtsmGRq9Avy8e5VUc2Eor
         VcJ4zCXf6PrKpoeDCZ3ga66b/F/Njczrx80jA6Y00Zwu4WAY1Dco6laANbki6nkBrc5+
         VTFKD1hyfkqWZSsPKQi0m9nyKim9ShRnavANGOqTwc7ovHqBCq8Hp6huNsfDLuk234Vw
         Fr3V9Mtg09RNTzmq7v31PsYKFmxiEzn/mo1V5ceRlO7SINaeyCYnVU55LrF1pj7abQTm
         FESpkFZTR4nWrriqB9Q4RChoGX/r0BALhQLpW4nwRBExj//AJ9mVHTJZqU1T5Ic9Gsd5
         F9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVXS1C9XllJS1YYeyNm0wZeynIBH8qi9nk8Jc44dedHcWwDFhN8D0MoNAwzU4noZig+A3L2gu+qgqJlNNs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxrrdBvoNei1saNg47xgNIs3ZlksZmsy5Vno1hyjX56Jn/jc4wp
	2oun6i9rgAN1VRgeHJfFbRdredOwN5Am/SLxRqmUR1BQtVdkQyAx
X-Gm-Gg: ASbGnctFSvf2dJD+vkGy1h54d3QITjfkli+poFUtcz2KMJYERNjoqVPiK0lYTFNgLLo
	toaaej+pfFvPqzzcEdO7m1pb7o7ARXZ0do27vpXZIcXfmPgy6nsRjIkHCQfl+fIaRK1BLyGsaIM
	+Zznl7ERTDmFJxWoqqTDiK4ppkZ0CuHmwE+Psd0Ojtt6Kk8zQfJqwmtzHpSLazTqcXx1LmUwuu3
	vGhYtWihhLb/TrQqWsKPqg4dEHk9EV6q8XPux80JGYX36cEzRY4K7RWr+pib6/vEwZk8XCdLOTO
	kLu6iQSiyM5pV73lMHuJkInSliKs
X-Google-Smtp-Source: AGHT+IGdnYDFhquPDANBW/t8s+v17pRTpxTdgVNlSSlgqLevLyFnxfpZxlTzVSiFWuujrFYTqz760Q==
X-Received: by 2002:a17:907:6e8d:b0:ac7:2aa7:5ba6 with SMTP id a640c23a62f3a-acb74b2d23emr92002066b.5.1744986601569;
        Fri, 18 Apr 2025 07:30:01 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef41605sm123261366b.124.2025.04.18.07.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:30:00 -0700 (PDT)
Date: Fri, 18 Apr 2025 17:29:58 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418142958.6ews5uuoqayc7lof@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
 <20250415204238.4e0634f8@kernel.org>
 <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB85100BB81C6B25BFC69B32B588BD2@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 05:16:15AM +0000, Wei Fang wrote:
> > -----Original Message-----
> > From: Jakub Kicinski <kuba@kernel.org>
> > Sent: 2025年4月16日 11:43
> > To: Wei Fang <wei.fang@nxp.com>
> > Cc: Claudiu Manoil <claudiu.manoil@nxp.com>; Vladimir Oltean
> > <vladimir.oltean@nxp.com>; Clark Wang <xiaoning.wang@nxp.com>;
> > andrew+netdev@lunn.ch; davem@davemloft.net; edumazet@google.com;
> > pabeni@redhat.com; christophe.leroy@csgroup.eu; netdev@vger.kernel.org;
> > linux-kernel@vger.kernel.org; imx@lists.linux.dev; linuxppc-dev@lists.ozlabs.org;
> > linux-arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for i.MX95
> > ENETC PF
> > 
> > On Fri, 11 Apr 2025 17:57:42 +0800 Wei Fang wrote:
> > >  	enetc4_pf_netdev_destroy(si);
> > >  	enetc4_pf_free(pf);
> > > +	destroy_workqueue(si->workqueue);
> > 
> > I think that you need to flush or cancel the work after unregistering
> > the netdev but before freeing it? The work may access netdev after its
> > freed.
> 
> Yes, you are right, I will improve it. thanks.

I think the workqueue creation needs to be handled in
enetc4_pf_netdev_create() somewhere in between alloc_etherdev_mqs() and
register_netdev(), so that the workqueue is available as soon as the
interface is registered, but also so that the workqueue teardown takes
places naturally where Jakub indicated.

