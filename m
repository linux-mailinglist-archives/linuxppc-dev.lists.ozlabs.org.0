Return-Path: <linuxppc-dev+bounces-3622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638E9DF2E5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 21:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y11QQ0Vjtz2xs8;
	Sun,  1 Dec 2024 07:11:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.119.213.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732997470;
	cv=none; b=SvTvaHwxDoRvb79R0etBhgfwPP3WPPEfiorzh2l5ghgiVPSRB+8K61YgMaSUjpbxzPPmZFyejQAG0/OBTrkfILIVjwz66Or/DAGMpQWnD8RjO4859uN40YInl76cAV2PZWdEDQ8DPteX5SKG2Ga6VyeNRuna3ucBFDetVLHHQg/5833pXxsD7SskwD5Vjg8LCVFjGEYRIPkrS40rGQFubtTUlmonnGTQQ0UHVX8eDhgUaGU96ZjDS2WVYs0GdlGQrS/w1R3H6+CJ+AwBJqwbEypZQqt3R5iU+18QsqY/esVSGScoJPxWhEwdibVyu4MtFqUpnwcBSiMqtgF+D15A7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732997470; c=relaxed/relaxed;
	bh=is582WBBi937WdWYFufHhkkhP+21AhVYgF4uiSgdXuo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EHxmk3lHGCcfLm0OCQ5x6G3H1++ueEAriucsqQjOdfpwrqIO3kz5qi5uV3OJP6ZZcEuQKtSDKWThy64k7tkUwhg83JxaFK9X7+LVOf+xGL36IUHFiH/yPEcwJmXcmqSgYg59g9iHv+vVk2IVJSFo3RYv79Y91ZkCsO4oFuMepDc5a+s427nbTg2uiskCUyhAvkZu1pbirljMwAsZLwlys29hkvwyIYLEp75oUXybxew6eRnGYICwid2hm/fBRBmcwuDqpUJpnfs4AQDWSyuKsNG85uVKHB++PviW9UDfn/BtwE8KTALzxpR/ka8A26xLE5c1LI0I3JCdUbNVtv5uNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=I6axK2hm; dkim-atps=neutral; spf=pass (client-ip=52.119.213.156; helo=smtp-fw-52005.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=I6axK2hm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.119.213.156; helo=smtp-fw-52005.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y11QN4KjZz2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 07:11:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732997469; x=1764533469;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=is582WBBi937WdWYFufHhkkhP+21AhVYgF4uiSgdXuo=;
  b=I6axK2hmdLL7NYNGsxOtx4ODvKEVKRUJGtAt3Z2jDT+zK3SvB63s4uJ9
   EFgQk1amAFVM66CXSr5TKxwRQna007xe9Lv0rUoJl2Scj/e4J2ghQmzHo
   ZKI1373s42O2JngUpr+HC7/WApWiTXqoA/8VIb5uG7pail8Vl26Mfhhty
   o=;
X-IronPort-AV: E=Sophos;i="6.12,199,1728950400"; 
   d="scan'208";a="699401236"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:11:01 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.10.100:31389]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.11.83:2525] with esmtp (Farcaster)
 id 120978b2-243c-4482-ad00-e4a375ddd09f; Sat, 30 Nov 2024 20:11:00 +0000 (UTC)
X-Farcaster-Flow-ID: 120978b2-243c-4482-ad00-e4a375ddd09f
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:11:00 +0000
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:10:59 +0000
Received: from EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d]) by
 EX19D018EUA004.ant.amazon.com ([fe80::e53:84f8:3456:a97d%3]) with mapi id
 15.02.1258.034; Sat, 30 Nov 2024 20:10:59 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Thomas Gleixner <tglx@linutronix.de>, "linux@armlinux.org.uk"
	<linux@armlinux.org.uk>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>, "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "ebiederm@xmission.com" <ebiederm@xmission.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "bhe@redhat.com"
	<bhe@redhat.com>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>,
	"sourabhjain@linux.ibm.com" <sourabhjain@linux.ibm.com>,
	"adityag@linux.ibm.com" <adityag@linux.ibm.com>, "songshuaishuai@tinylab.org"
	<songshuaishuai@tinylab.org>, "takakura@valinux.co.jp"
	<takakura@valinux.co.jp>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>
CC: "Chocron, Jonathan" <jonnyc@amazon.com>
Subject: RE: [PATCH v4 2/2] kexec: Prevent redundant IRQ masking by checking
 state before shutdown
Thread-Topic: [PATCH v4 2/2] kexec: Prevent redundant IRQ masking by checking
 state before shutdown
Thread-Index: AdtDY+7g3Mjx3Vru6kGTSk5UpEUWVw==
Date: Sat, 30 Nov 2024 20:10:59 +0000
Message-ID: <0e467b4c2bc34eb59c8f23f36a9a6956@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.85.143.175]
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

On 11/29/2024 3:32 PM, Thomas Gleixner wrote:
>> This patch addresses the issue by:
>
> Again:  git grep 'This patch' Documentation/process/
Done (in v5 series)

