Return-Path: <linuxppc-dev+bounces-5290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF489A1236B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 13:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YY4R70w1Hz3bVF;
	Wed, 15 Jan 2025 23:04:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736942643;
	cv=none; b=i1AJ/dkypumId3uCeSVYLWJrykA9cSAkYAbQECZNSlNfmkhjvSTWrNSIbNcJ4YbDl60yEI7L73Yo6pGjWE2hABLdz8AJ4MJf0sOt0YqnaehKZtxduphO5Ry0YHeVGZ321L68UV3rbT9V/qJedXwbH/ZjbspAziWYr1gS6844ED6hyLab9ub6bJESUtGRedxt1iZv6gDoXEsWd/7+vhatN3HAP3ln63I0zD0iqRYCSz5oBrpr8gxZcW9eVZE8d5UCj5EF71IGuI5qRosGF5NH2r67xZKuogQk9HBqsirCaEsDopdWmjKY89QNqAaFUB5HwxkLZXunMv5r3ACwT5dT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736942643; c=relaxed/relaxed;
	bh=nn2m3YvPKxsHqucofUHRKBClV54hrr7dyawjs31YpmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1FQG0AcVPQ0ImnqNOfOUsxFmssUPP16nl7H4ID05wp+q0SxbNv8Z+kEkucbpY3/rAmbFrUEd9zWahsN5zmhb8/3BRvI7ldZFwui0obGLLe5LkIPbzWivcE3ptMUB8sgMc5t0kkH8m+5gbp226NoLrVOukdyY/nPva6VU0bvWx8nti3qRlh0x0rpIUaqzyGGvrXo+q+dPQGV4Is54pMqg+yA7gC4QNYgWybyBwdgK2PZs+XxpxXm4U62KFixAxc1UgmQSLaeWgZxcMJmARdrttvQEppIYaLTSUkeEOPXGvvkuDOUP9D7Hj3J+4yaO8J3WMGDgwjSgDtykYdpANWLjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass (client-ip=209.85.214.177; helo=mail-pl1-f177.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.177; helo=mail-pl1-f177.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YY4R60cSzz3bSM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 23:04:01 +1100 (AEDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166f1e589cso142873935ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2025 04:04:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942634; x=1737547434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn2m3YvPKxsHqucofUHRKBClV54hrr7dyawjs31YpmM=;
        b=OGi4SYr7O7UQVQ9yGx4P/z+ghyVNP/oO14HgVKju1pRGDd9S6R78ex5JeTRHUDsNRe
         0y0Sq1ZMK741GuBONr+aLQBJCgLACXR9FZkcAOMSwYtcuOhpRmHvaHtQYHIeTDh9Anlc
         6wnMu2tzpxPMnEbFI6osBsL0ymrVgTDZiiSSpJ86bpYhy+66/kUtboQn7kJRHQxCYRYF
         InR71pRF2JYUpolaSUWqck7YvCb6oAH1M5mriDc5ckzZZYlxptXVw0iYZ2BSl+RIc6Ft
         pRst3oBFAEdoQmeKJSQ0jkpZLOZy/15prBkBq0fkerzQqNHMJvMNPDpLjpn74UFvonG/
         A9uw==
X-Forwarded-Encrypted: i=1; AJvYcCW8py9fVn01LO+AcViBKj2xZ5ruBGBwXsY8hs9YXWAHCqiljvzwZJy4LxM3L3zsTwtOyp8oZ3/kNNFjgTs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw1aK4O74bIn7bG9f0C/Qdpo0x5xlofY+6BN8mblYkhJUvVHwX4
	aeolnCQBwlEir3zV/A/OgdXkcv8lhoY7dCZCzE74ryD/ykHNP0WF
X-Gm-Gg: ASbGncvClWkYnF/zpkS90uZL39rPhfKhGAGpWRf/KYcfJn+CPap6+V3vbYMYEqGryf2
	AJN79woZOGf+N/MpHYKsu+JriZVSEkg8WOKtKFACxkuZCqA256HpGjBH6KEwLOQGNdb9Cm4Qms+
	glzJ7J1Qw3wXFx+78eRmKJ6AtNGfhdqn2MWXPxpwUJfcuf4nZHSVFP+bYmKzPNumSn1XsL/5Wbm
	LIfxTg3AJTS7Ro7g+ZktDDLE5Iaez5JN00odTf9RU+i4q+OyGouCjYKduSl7g9qOsU4J1x/WN9S
	8bQ7HFq8klw3OrY=
X-Google-Smtp-Source: AGHT+IEYVToacHIhaLiuPZMNMw8ey/7WGb5On7+yKJ58yY4usQG65tLlT774MHHUh//xwlxvNtx6eA==
X-Received: by 2002:a17:902:e888:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21a83fc3886mr482072125ad.40.1736942634229;
        Wed, 15 Jan 2025 04:03:54 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f520sm81190325ad.7.2025.01.15.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:03:53 -0800 (PST)
Date: Wed, 15 Jan 2025 21:03:52 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/2] PCI: Simplify few things
Message-ID: <20250115120352.GR4176564@rocinante>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
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
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello,

> Few code simplifications without functional impact.  Not tested on
> hardware.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof

