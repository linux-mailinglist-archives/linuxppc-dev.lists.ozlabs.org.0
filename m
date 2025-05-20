Return-Path: <linuxppc-dev+bounces-8717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95592ABD2AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 11:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1pYC6W9Xz2xCW;
	Tue, 20 May 2025 19:05:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747731919;
	cv=none; b=b0KSj4dEpGWAZGRZm1d4rqYPhLOXp5TZHhk39tkCD/q9J16RMOA6nXZ+y3BWItZF9U2GoIe4FT6t2iLi8ND+kruvdu4khjWArDa7NzmByYJ/LzRZLkvUMUkoqYptiz+dn/1wsKHoxdSH97HRcz3CugO208iC6m+0xXyEveUnXxGhbRNwFtctRJJ2jeYQX92fKbtlVU1pX8VHKqHfbZ6MlD4//2a+jsXs5E/lERLQslYtnKswl0MIuW2XH2im6AbwbQdj+bTpDd0IVg3/rZnA+F1BWmkdIQXyyqfRrJX0yQ6t/YRHGLfIaWI1NW+9TO41QcpgQGOF7/BQvfJ/dJY1Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747731919; c=relaxed/relaxed;
	bh=vPLD9IYUR0Y+5sJprRW/vuKK7RVWsVDEYp/o2Jak7lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB+EN8/RoK7l1XKnmpcUdIxih/aI59nw/rmafCClWiFejiwhBTC+YM55UEd+INzhI9HNbxda9pffXJdhRIWuaL89EJ5KXC9hPCLmSmUMXifMAd7uTl3047guxkN9lwCfIS1sDNdCWM+s5vYvHK0qUll2L08BAMkOvG1APxalZ+0c3x474VPhJlfX5CiRjb5huVpLN0oAq+dOl249M4qFVD6Eb0DLuQ3pjRejdDKGFCtl908V7qtqU0b4x4x6GIPflIX6mjHSL83/08neGqCXqyCSTmdBnQ9lAzyFNR6RBoSLPDu9aJjzUWZVFysiso2rOgxjEDfhhcgvsXIPQ9I9nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass (client-ip=209.85.214.179; helo=mail-pl1-f179.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.179; helo=mail-pl1-f179.google.com; envelope-from=kswilczynski@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1pYB4TWSz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 19:05:17 +1000 (AEST)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2321c38a948so27016175ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 02:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731914; x=1748336714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPLD9IYUR0Y+5sJprRW/vuKK7RVWsVDEYp/o2Jak7lM=;
        b=eT0wsP7/R/oqmDqFBrWrQqn+kAGVxqO8NYCmLvZ9DpeshhQ5y5yURI0y0kt60T3mKM
         IV4AB5fBdZ3RCdxYYLuquC8+WYjY164E4Uw8ReKQAl/YI1acHzPlPDU29QGS6sVtL2Ta
         TYX4fvBdysfqi3PeDJYfAF/do4rU3z7tvNaDGJIZtDvsmitg/Stn+bXYrDP67kDoDinV
         6vjaRnsxjm8G8iokNFeoCzqYPcPltPXze0vLgynb7m2GyubaZAoTmdFXgxQghDC55z3P
         QXxpFlkTyHH0Uq7UIR0f8yRO/LCY1Ip1Oi9MiZhijN5LPfisFzfPBCC19EHQuNAtdsvH
         LbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4R3Q52dpfEZq9cT7GVpVySxM4SkjP36MVDdlkJZHxKNWEk4JLzZjWLGuws0xmw/Q44WLPvIjYl+JrVr4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzbfde5f7q84TwyRSvcX5bmbQOVlZK7Ih+l3swo5EDawM1b9QyZ
	SIxeCtZ45WC/L9LecQgrxCPSZ1FCMDP1DBsGFANGCa5rPc/nd0uATlB1
X-Gm-Gg: ASbGncswY4d6c+l6WDLcMfnBj/Cj4T+WJujV1DR1ptpZ4Fq1BFzgKByLGtkNSWs0sDJ
	+crmVVWUuZ7/vGMJMDLcv6SAY8tTda6bjDrTK91sGP3Phzcvfd1LyuMVAt5bFeNA1ScwdJjhotd
	OTtCUi4YFzuO+JeD+/gnd4qknSrxyxAqf/8Cqq1nrdvm5Th/OikUTVEdOmvwl022+EVnnt+XKI4
	02SlNlRhRC/73WVnF2b6tObf3s26wvBIeSX0Oh1aaYPdc+ROJka3oYr15afxjwABfVHrfiJL1uM
	vYVn70WFwpyAO+81hlNsIByNEMSen2Mjjth25M5BDgx96YN+kBJRCURmiaWM+afTeMzrBtN/+t+
	aANx6BS5eIw==
X-Google-Smtp-Source: AGHT+IF9SMS8koL5Y6RdygoaqjEc6b1s5T1eXmJSkB0oyvgy8zufe4IJynlSet98+P+t12+8WtOqgQ==
X-Received: by 2002:a17:902:f551:b0:22e:627f:ebc9 with SMTP id d9443c01a7336-231de3514e9mr164934925ad.3.1747731914152;
        Tue, 20 May 2025 02:05:14 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b26eaf8cc59sm7547070a12.40.2025.05.20.02.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 02:05:13 -0700 (PDT)
Date: Tue, 20 May 2025 18:05:11 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v6 00/16] Rate limit AER logs
Message-ID: <20250520090511.GC261485@rocinante>
References: <20250519213603.1257897-1-helgaas@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519213603.1257897-1-helgaas@kernel.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello,

> This work is mostly due to Jon Pan-Doh and Karolina Stolarek.  I rebased
> this to v6.15-rc1, factored out some of the trace and statistics updates,
> and added some minor cleanups.
> 
> Proposal
> ========
> 
> When using native AER, spammy devices can flood kernel logs with AER errors
> and slow/stall execution. Add per-device per-error-severity ratelimits for
> more robust error logging. Allow userspace to configure ratelimits via
> sysfs knobs.
> 
> Motivation
> ==========
> 
> Inconsistent PCIe error handling, exacerbated at datacenter scale (myriad
> of devices), affects repairabilitiy flows for fleet operators.
> 
> Exposing PCIe errors/debug info in-band for a userspace daemon (e.g.
> rasdaemon) to collect/pass on to repairability services will allow for more
> predictable repair flows and decrease machine downtime.
> 
> Background
> ==========
> 
> AER error spam has been observed many times, both publicly (e.g. [1], [2],
> [3]) and privately. While it usually occurs with correctable errors, it can
> happen with uncorrectable errors (e.g. during new HW bringup).
> 
> There have been previous attempts to add ratelimits to AER logs ([4], [5]).
> The most recent attempt[5] has many similarities with the proposed
> approach.

I have been testing this series locally with and without faults triggered
using the AER error injection facility.  No issues thus far.

And, as such...

Tested-by: Krzysztof Wilczyński <kwilczynski@kernel.org>

Thank you!

	Krzysztof

