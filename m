Return-Path: <linuxppc-dev+bounces-771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 303DC9652E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 00:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvwrM61tGz2yYK;
	Fri, 30 Aug 2024 08:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724946246;
	cv=none; b=MDapml8yTC4CiQZ6ONR438R3yeFWMF361YZy0d0wM3pxp0QL2RwRjpfz9IltDpHSFCsjpcBnQFo9nsXzasSkRpv2ncoyOYgEHxde6M/SEjUnpdgCNlfgeHDJpUoEvlh/QMeu+sxOPKBqvLrFG6CEGhhxzHdtmj+900Id7KX8WHWp3Ck4oEOJmT+6dg/W8PnzvYl9cJjmz6J1EW6EetreC5iGtCplwDHWL5VJYSl+QArM961FQwbiIvpQx3Lm0Lfnqz9I6IBGI/obmjBIunFk3wYX76vjG6fVjj1KnoqKPhVdDQDXjdxFGLzer+19JtzlRPijdA1MMjcoZskASANbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724946246; c=relaxed/relaxed;
	bh=cICNfAYxuHlGoBLMmySe2jZdtkeuZEM13jDTfWpAGak=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=kUPOptFLl6mUeQcH51ffnzaZLDBXNeEVG83TS9IWbXVsCBAMXZxmmsXJkeRhgjBEO4PmnEZB2AR7g1aaxgRo4JhTQWZ00UMs/FKcrmE0J7wtl0gL5I4EPj+u90gcf1iXQc8PJE37SVV3r94tau7tPLhegqdXY6l1YOAQCkqZ2BimmXoG9T77u8GHQ3002xbge42VNQoeGiftpGMhgXaTsTrI3YfXeoYpDPkvvlLPwVi//4kfVk7Zp8nxPy1gg1RPIAlbYaqSEgjQWo4yZY/zE/q7vXOKKVDD+2cmean68fU3qRcBazzXYrjjkt0B51U88b9H64gbkpI85GYVc7Da5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WWrTiY4E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WWrTiY4E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvlvB1LqTz2yNB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 01:44:05 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3718ca50fd7so561042f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2024 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946242; x=1725551042; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cICNfAYxuHlGoBLMmySe2jZdtkeuZEM13jDTfWpAGak=;
        b=WWrTiY4EmGGNyI4XgXWgpG3X0KLiGWCA8xct4dCCJHOs/eCrD/ckg4P81GkL/SQW1X
         VEXM5QOjPVOLNOvgdLoin9S7oeBvwVfdWiBYWsrQ1ADP2orhG/0k0XLSQh0MW7qMDu9g
         WsroewQvWUh4U+MLCaR3I4rdppNCHY8Pe3q4G05Ef/Q2Msbaul05DeGsOA76wLwok/0k
         5mDd6Z7TbOVQHBSJ1eidNioTaOh0WCkPRiTZj7ENvGcyP4xdYxTSzmYpww6n2VOgHtws
         SU+GiwmPTi1Gbz8wXaQwkqt/GemlfGxUKNi4KnjXaLANYuTYO7MgoDAm0G3qZL6tTETK
         fLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946242; x=1725551042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cICNfAYxuHlGoBLMmySe2jZdtkeuZEM13jDTfWpAGak=;
        b=QausWE+n4VBZrmDrAVwOKk0FNYIUUkrsnAPvwNwqUjaMZTt5B4i2gPOdbeMt+pa5K0
         UfN+YczXszvsgnASk459VShxEce/b9oqPta3vsE5HyNmKFW0EyUwhjbJJ+bOBq9Rsfp5
         6VwyjoF77udbAx1PPbC/iljaKNjBmqaXikQdKD8xyjaTI0XErLnxPNW/7pO8p0d/ziT6
         lLmH/0loSDYMvRTisDxDwfiE0xngjsRITLGclsf1EwIcDBnsxVRt8r7ykC//CIRYFXkI
         Bqtbc1uj9w0ilLEwFq8avMMR58npeEcibm2iGV0jGSTLdTziNdL+U45DdRIZYC81cKl2
         UXKg==
X-Forwarded-Encrypted: i=1; AJvYcCXSg5z2GkakQg37xbBxmkfI9yvNejeZhSyra9+3htukIHOLLvPtiwwHhJ/PrUcTB8XvW5a/jM/OHparJX8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzG8ipdQafgEvVqq49opXD7ataC7+1QEs4urlja09Z8a3VXuxRC
	8egR0pUpNqOtk+EGKuHaAgwz7XcuK/GBXV9v34UFlfy4Db+Ozetb
X-Google-Smtp-Source: AGHT+IGcAdGlG49gRrkCbVOqaBayd5DteBon3uD6YJo6Kzq7DSTeVYyMPSJNW2iUjczaglkr/owaTw==
X-Received: by 2002:adf:fb4f:0:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-3749b531648mr2529192f8f.7.1724946241199;
        Thu, 29 Aug 2024 08:44:01 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee4d391sm1728239f8f.3.2024.08.29.08.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:44:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: andrew@lunn.ch,
	sebastian.hesselbarth@gmail.com,
	gregory.clement@bootlin.com,
	herve.codina@bootlin.com,
	qiang.zhao@nxp.com,
	christophe.leroy@csgroup.eu,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	nm@ti.com,
	ssantosh@kernel.org,
	petlozup@nvidia.com,
	pshete@nvidia.com,
	christophe.jaillet@wanadoo.fr,
	ulf.hansson@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org,
	krzk@kernel.org,
	jic23@kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: (subset) [PATCH -next 0/8] soc: Simplify with scoped for each OF child loop and dev_err_probe()
Date: Thu, 29 Aug 2024 17:43:59 +0200
Message-ID: <172494623252.1306218.1886935295305888202.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240827114607.4019972-1-ruanjinjie@huawei.com>
References: <20240827114607.4019972-1-ruanjinjie@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 27 Aug 2024 19:45:59 +0800, Jinjie Ruan wrote:
> Use for_each_child_of_node_scoped() to simplify code.
> 
> Jinjie Ruan (8):
>   soc: fsl: cpm1: Simplify with scoped for each OF child loop
>   soc: fsl: cpm1: Simplify with dev_err_probe()
>   soc: fsl: cpm1: qmc: Simplify with scoped for each OF child
>   soc: fsl: cpm1: qmc: Simplify with dev_err_probe()
>   soc/tegra: pmc: Simplify with scoped for each OF child loop
>   soc: dove: Simplify with scoped for each OF child loop
>   soc: ti: knav_dma: Simplify with scoped for each OF child loop
>   soc: ti: knav_qmss_queue: Simplify with scoped for each OF child loop
> 
> [...]

Applied, thanks!

[5/8] soc/tegra: pmc: Simplify with scoped for each OF child loop
      commit: 4d57a840560c3ff04fed07a06b3aec7cbac4bff0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>

