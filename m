Return-Path: <linuxppc-dev+bounces-3600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CEE9DBCBE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 21:08:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XznRp6Gr5z2yN2;
	Fri, 29 Nov 2024 07:08:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.119.213.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732824486;
	cv=none; b=EVgHwTzTHvCbzjcMiOPSL/hMmTALzoVMLPN621ZkzmlMCdr56FuXltzwr+fM9o1J4m4hQrPyt2zLT51/tAI/VDrHuLPWMQ89m34qi22smCcrtmTmJN1bNVBN9RcIi7tu0jU0WnM5FIzrGKbfzdBuEx3jGRpr68Gzvc34/5yae0RbqkYhnZ8ROzkhQK8/ETu5bOSM0rsyoknK0W2wTEQvN/rjDGEVhFpmTgsUWlLcFNz1o75jPGMPYaTQqfSjMg8oK2mcDqWHCvt2cnsUaWZQvIgtWO1bleJwmevzjsAD4NRMoY6wlt3NSVya20VKg9LTZzDDi/GjjW9wqxUS++cO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732824486; c=relaxed/relaxed;
	bh=OqkEOPg1Ntw5OzjoKV6qV13YxrudUL0x8D+JX5oOx/Q=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nOxo13NJ4QEAQzeGhh4JAm6HhR2aQtVclXH3MegMGE4lzTPcFZfE4xyqEopWim5r3C2oeG0FKaqU2goiDqa2+RSYgnbuXYu/a72oKX4Ot5WfXunQYT/qGu0Lu94e44APq19ZiUoHlqd6lLQjEJ+G+GLPyjn/SsOgc1b2YgYQ4m16bb0FllHJyr6xpfCvCYDZSU34WnRj8JujatA0F+C1lCQr8WQkS1hs4+ZEIpPsBGnt5Bwi21WUB94gu5oWhuZMrjwwyt5s+7u8ydeinLN20irOwxVnQrV2YU+K9M47FYNfiqJbAmHkVnvXMF2zLo7mI2HrbuKJSU3LqB51qd7o2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=OnEICyTM; dkim-atps=neutral; spf=pass (client-ip=52.119.213.156; helo=smtp-fw-52005.amazon.com; envelope-from=prvs=055e4adf4=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=OnEICyTM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.119.213.156; helo=smtp-fw-52005.amazon.com; envelope-from=prvs=055e4adf4=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XznRn0CJnz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 07:08:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732824485; x=1764360485;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OqkEOPg1Ntw5OzjoKV6qV13YxrudUL0x8D+JX5oOx/Q=;
  b=OnEICyTMXQXwCD8ACE5hERsci3CRey2V82sXve+/iVyPQ5Brqgzu0TQm
   R7HGJFHjrWCCETz3p9jgvxYEMfQ3iQeXn+rvZ7RLqmVlCPXzfEgX72T9e
   9ThbvQaXn4fVwgxyLtWx1JYodLD+sk1HeP2SkC1J66HSSA8CrpPDnMXqH
   o=;
X-IronPort-AV: E=Sophos;i="6.12,193,1728950400"; 
   d="scan'208";a="699037645"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:07:59 +0000
Received: from EX19MTAEUA002.ant.amazon.com [10.0.10.100:44286]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.34.163:2525] with esmtp (Farcaster)
 id 092245c2-527c-4203-87c5-e650bdd3ad53; Thu, 28 Nov 2024 20:07:58 +0000 (UTC)
X-Farcaster-Flow-ID: 092245c2-527c-4203-87c5-e650bdd3ad53
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Thu, 28 Nov 2024 20:07:58 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 20:07:58 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Thu, 28 Nov 2024 20:07:58 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "bhe@redhat.com" <bhe@redhat.com>,
	"hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "adityag@linux.ibm.com"
	<adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
Thread-Topic: [PATCH v2] arm64: kexec: Check if IRQ is already masked before
 masking
Thread-Index: AdtB0CLnH24qyvw6Ek+EUcflLj/BEA==
Date: Thu, 28 Nov 2024 20:07:57 +0000
Message-ID: <3a499ecdfa5042f8b6e8834c47cdb2d9@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.85.143.173]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 11/28/2024 12:39 PM, Thomas Gleixner wrote:
> This is just wrong. If the interrupt was torn down, then its state is dea=
ctivated and it was masked already. So the EOI handling and the mask/disabl=
e dance are neither required nor make sense.
>
> So this whole thing should be:
>
>                 chip =3D irq_desc_get_chip(desc);
> -               if (!chip)
> +               if (!chip || !irqd_is_started(&desc->irq_data))
>                         continue;
ACK. Will be done this way in V3.

> But what's worse is that we have 4 almost identical variants of the same =
code.
>
> So instead of exposing core functionality and "fixing" up four variants, =
can we please have a consolidated version of this function in the core
> code:
>                 struct irq_chip *chip;
>                 int check_eoi =3D 1;
>
>                 chip =3D irq_desc_get_chip(desc);
>                 if (!chip || !irqd_is_started(&desc->irq_data))
>                         continue;
>
>                 if (IS_ENABLED(CONFIG_.....)) {
>                         /*
>                          * Add a sensible comment which explains this.
>                          */
>                         check_eoi =3D irq_set_irqchip_state(....);
>                 }
>
>                 if (check_eoi && ....)
>                         chip->irq_eoi(&desc->irq_data);
>
>                 irq_shutdown(desc);
>
> No?
In V3 I will add a preliminary patch that will remove the four variants
and instead add a common implementations to the kexec core.

Thanks, Eliav

