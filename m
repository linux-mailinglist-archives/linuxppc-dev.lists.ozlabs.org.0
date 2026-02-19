Return-Path: <linuxppc-dev+bounces-16967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IuiIg2Al2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7DB162C93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:26:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5zZ2k3xz3blq;
	Fri, 20 Feb 2026 08:26:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771524910;
	cv=pass; b=ffOvR+HBxV135bnatMLvGvUZu32erVlqWeAhBGex4p7dnyPznukNPAdPh+UysTwLn4vwnbzHBvZNUcGuvEUP5e0wDE9yr6AwW34O3i+gGst8anZsEGov0XcxzkPmVxYiZ5aj44FG2IqAzh9XiCvSxb1t2apYWKI2MMllE+ZZ5v2s0LGtYP2iwmSyHm56BmFtszYKwU+TjpARd92ITdJymevW3QOvyZ7nI+mpHpK6lS8Yw2beSMsqYXC3Zz6LtkmLysHsTkNpGiS9m12lnTlG45Wm1SQXJ6QuFdedJer8uBbROwS3qy1iZtRX6S9bF+ZrT8NvT8rqcYXPXR3Axpc4Xw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771524910; c=relaxed/relaxed;
	bh=YDI/mEcy1I8D2Y9ol10coJWSj4uwTttNJBYHBkbC+Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjpeB+riH5a606101DttvlL3J5x4K9s+f5Zk5+CwpD6eep+bBUjk8du0vRpJIEpfqFMznYISAIuesf7f2hgr0AP3GScWXIN54L5gctFaP0BQvC7yaAGcvrWrL7lJvl91vyEIFIxRTN2lPKjpt7YhDyfqcB9fJnSSnr57j6jwAYNnVQXGWWOIkEnyhC59o+uuVihtPHtGnr7Ddvzwu5j/tHHpK9FdvXeap7yfsH+TGY1Nc7wGTuv1+PdBsMPwu/nM07lkPvU7hiQq/6CQGKdfZSNDmimjdvpTvMiOqZtiQZcRmAo5V9Z9NnzETxLrNevm9WYAG1lyjoFeqMISAKLJBA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lbV50Ced; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lbV50Ced;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=ynorov@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazlp170120007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH1kk0hZ7z2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:15:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmCCvfmpWWzY8m9lhy/xKUSwB+297Y+YBuVbEf2W2uJONrnua3rVZz84TkSkd/fW6h3EXgNIrnDNPRCTpidG4citUwdP9NLHJkDg2ZB130RSc0fHpvF9iriA2SBmWR+q4ZCd6Ephm6ty5/I8RUeHOc4lJbJ0eTuPwnI9wKK2wCgfhgjdKm8XI/gutnBAUDlREvEDBPBM+yGN2mg7/8krp1AfIc5rCvxMTCu/CwCgFXwfub51BxgbArsylkwkROsBygiNn49Dcae0FkYDsli0NK/7I5c2scGKLi0oZI0U2ErWWwsnTST+U6PWxk49cZb9ah2B01FNx85R6NnDa7q9Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDI/mEcy1I8D2Y9ol10coJWSj4uwTttNJBYHBkbC+Fc=;
 b=j2ogI46f0GxC56xei3tjuRJdyzUyCTzR/IyvpIuGANCfE6xqGsUdrV4XS72qiIsFkIYOZalkgSTzHxeGV0dinY+4a95JxeaS+yPGC4rV5WRkH+LnVbSt9WuXj1kG+PBbnQZpW+A9kdOHenG6M0+AnR6lJJKiYPf5Zu/jcNxQKef+E9lb3n+IvlZypClSg3J+n6dRy5u05Ukg6CKmXVBR88BjCbSJkDjrm9dsHpIoOzzsL9twI/wpEE1xPPDyS5MrfdhQHgPFG3YRze/zHrDQv93TuZtIE3PUMoHyT4tswmX1scJMrDYt5oX4CPDyN3GncKlAgP/rZwJCQC9/Fq/sZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDI/mEcy1I8D2Y9ol10coJWSj4uwTttNJBYHBkbC+Fc=;
 b=lbV50CedHFb9WPxSVyDVwfWLv0y33FMTmNdPwi1dJgpNqnBBOkfR2E0qRjJk3MKIkjAFCdGD8YujMZmrZviK5+PdU3lTQJetpRAn3/rZvMAAJl4JdGb5RuIZEmn/X8K7QViIQ2Elut84NEts6Nee4Bpvq3UdKzPseWFuC7w8YRyiO170+uVnJDoRoeGFD7B03TNYXokkHEVtnYIh+m/sot7q/XQK+ujufBgmY12uRmevGr6bzWA1TWUqoh3pjC3Gi3kINVB6IQOcTamBSEIKM908F4jnHkFsipuk7GBRALChXmbeMtl/s/ostkdc4+xgKvluzD3UQI1zfClN1f5D7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by CH3PR12MB8877.namprd12.prod.outlook.com (2603:10b6:610:170::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 19 Feb
 2026 18:14:30 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 18:14:30 +0000
From: Yury Norov <ynorov@nvidia.com>
To: linux-kernel@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	Antoine Tenart <atenart@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Eric Dumazet <edumazet@google.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ingo Molnar <mingo@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Jerin Jacob <jerinj@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Mike Leach <mike.leach@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Simon Horman <horms@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tom Rix <trix@redhat.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Yajun Deng <yajun.deng@linux.dev>,
	Yury Norov <yury.norov@gmail.com>,
	Zhang Rui <rui.zhang@intel.com>,
	hariprasad <hkelam@marvell.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	netdev@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>
Subject: [PATCH 08/12] coresight: don't use bitmap_print_to_pagebuf()
Date: Thu, 19 Feb 2026 13:14:00 -0500
Message-ID: <20260219181407.290201-9-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219181407.290201-1-ynorov@nvidia.com>
References: <20260219181407.290201-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN1PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:408:e2::31) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|CH3PR12MB8877:EE_
X-MS-Office365-Filtering-Correlation-Id: c30e02e8-2e2c-41ef-1cf4-08de6fe2b977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RQfMKe3eIGzGn/jkKXhzQLHAzKTR5y4XKsTL+gMDqogUF7GiGyl9N8ZPKOom?=
 =?us-ascii?Q?wDXf7Uf5iXfJLP3iLrmeyWCHPE4gtIqXd3PngT/RybNW0NSfFJKlt65VOauW?=
 =?us-ascii?Q?WiHdbB/WWGY3MhMmkBpYwslX/BGvYkDIgl4d7412hoF8K34SGp4nkul3r+aB?=
 =?us-ascii?Q?INwhr60QhYB9sf9TVfIccC33nvddGHYliaryjQ5btSYsHbH+2VaLnBipxHyj?=
 =?us-ascii?Q?8LCfoCxvEZbP7pJdshUZ7ek2yBWY9Vql1Lgu4eQEi7U7gyI9uq4ppu3ddGHy?=
 =?us-ascii?Q?o6D4K56KXRB4kzmfHWy2dgZ+7kEGBTHH+OOVvprW4nK+KyikGFUci3iRLGX5?=
 =?us-ascii?Q?fJGJCqcgB/6u8354YWQDJNEYRywips0RomfwlIN/C4J5/m+sxSPTr85ARnGQ?=
 =?us-ascii?Q?FmB6QtQdDWedldjERAVMY8il3ATdpHzz7Zt1yGmr/wBZIpNaIx/PIBMeqj9b?=
 =?us-ascii?Q?fk8uwf1BvYxo8gpfNRQPV8qkG71gFYfrCWxbO3ogSakcars1bD8ECWkMkGc0?=
 =?us-ascii?Q?RB9R5CGrB+uw2bJ8v9NUhdMeVdi+WkAk7Iu8eJ10YYPCBGdQ1UkSgr98mAm0?=
 =?us-ascii?Q?uYlBzJcR+AJzGALkjNrNVtO0hxK38VOGMYA3ykAG1ZbnfMBQHTBqxBqr39Fc?=
 =?us-ascii?Q?SJzu8QWTap9HPSKoyxZ9i3jVqm+pI23Dqlp6EL4oEebOVQvOJE1e9RsmgwV5?=
 =?us-ascii?Q?9AQaAN4LaFqHfcI0Rs6cJfYQmvAoKLcQAlHyNgIf8JLeWhQ2KXxrNnFGr7Z0?=
 =?us-ascii?Q?oPxJBlYscN9qLOvdFjbdhaaXoSTGbUcFJVgahC6kzX4slTFvCBbGkC7GtZ0P?=
 =?us-ascii?Q?sJuqoVFhrxTP51lVZ3K1LkZbHkx9XSa9FponFLtP+6bvEZIq2wWju/8FFpOK?=
 =?us-ascii?Q?UxXH/cRPdBTXXc3e6/MUkJ0NwvzTtCoiZpt/45Vup51+D/7O28lytb1+7nji?=
 =?us-ascii?Q?GerWQAwWmMYGBxRMp2OnVFj+kO9kEJNsL6Pc+rF3b8+KwaH4R9Akt3RFDu8g?=
 =?us-ascii?Q?7KDEMEyfmiqWPRp3TAKEil8dwd0KUXNvXPGZH0DTaCbN55G1W2vsauhAo+hM?=
 =?us-ascii?Q?KNfNdCGhNxL+S9vmbEndyFLxb1jM2nP75EVX9udYcDT/pXJImjBrwob97T1C?=
 =?us-ascii?Q?o70h2gVXsYh8CwdRd25FSVymenrdLY4Pvf1kMnlM/4NVl3chbndH71PP4Lj5?=
 =?us-ascii?Q?jZ0hEup7745Y7NCqR/lYJ+hfbBWzOm0Tr0ZROpdCxhqpTI+ITl0YpeMUIIRk?=
 =?us-ascii?Q?TK+I2Ty4XVOJqmg+imbuxduL3Oa1SEAnPmR92m5VoZy8vACmau3kTfcR4I5P?=
 =?us-ascii?Q?JlcOsYFOrg8uZeRc1ei8DgqWkKAzkXrc75Eqh4dsxRRa4EPrAjA2RZRbKPBS?=
 =?us-ascii?Q?ylhy98S48B2tT/2VxGxQUey2YHUdbu/SBNz0BbLxh1+u581QcjWGjqoLxhtO?=
 =?us-ascii?Q?/28AWwzbh4YTHLOPDpdP6IdRaOcS1jI3wAQyJD/LiOfaRZi4/d5p2ytvDxB/?=
 =?us-ascii?Q?58ZwpBE3YUmND7VpTJgKoGWKwBxx1smHkA3lb43ugImDQuqWXbHs4M6Qmngz?=
 =?us-ascii?Q?dpIVL3rNLvpUcY0ExwnHp0Br3CDfEdvQjg+EsaLddR5TkQe3vnprJXJrnmJT?=
 =?us-ascii?Q?Jg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fLYhAOzJ1yCv1rO9pjxoIXxaEF+iEZ4PkXSGTYtKeNqfGfSWhz8TskfH0PWF?=
 =?us-ascii?Q?UlmBECw7WN38+x5JXoI3AFzO3xO+RO6fAQI1gSgPktEEJWPdVlb14DzGPt/z?=
 =?us-ascii?Q?WicY9p4u9dlp8Xv/EUbfIzxTx1FjZHT5+ZRqddn1vMmBM5EAuJfoTbwrR2Mh?=
 =?us-ascii?Q?vTVsLkRIo2ozVdzz79MhB7ePhU+IJn9FgmWNRB5Wxte0Eo720G5p6OvP8F2K?=
 =?us-ascii?Q?j46fNWx2FxstOxRcohVIwRItI3MNF6/LdEeDTnkre5XJfOBkgVVkcalOq2S9?=
 =?us-ascii?Q?QiPEyMWm1OLmkyjgcSkpwzTkfoRcoDQgvJCNqxxdRGzhDqe/INgubwMLBZwt?=
 =?us-ascii?Q?0+82CuS2byHy1yIWj7dpwoftW61MuJq+6jc6dFmOMVcciXrA/4H+uwCCTWYL?=
 =?us-ascii?Q?S8qRJ25uD7KCa/CZLajiUGP/T2sQCmThkQCyp6gKr06LJCMgsTXQm8DT4CDk?=
 =?us-ascii?Q?AQ265JL21XJkQuLYkVe3z+YMtFeKwzeqJgobzeo4lMFV7CWQ1YtVJhbno3JT?=
 =?us-ascii?Q?MsTz8cuYszK93rKvZkr+LYoP8TTuuASYXwtTw+pX46raCPP8WhcEbLyCU7Dx?=
 =?us-ascii?Q?V3djiIMrAVLRWayR8qKs5MfT9vkWI4V8m5zK7eVpgfu+StL7CpiUXj/Ud+hp?=
 =?us-ascii?Q?jvAACloeNlaWY1f4KkXxa7giZfU97h5/at2oNsQnLEVXUq59OKx3MApaBZ57?=
 =?us-ascii?Q?zbmpqgTIz5AhqjMl7mj3awqytrgDJ1Nsrfax4XeuvmHMgTUv+6KTS3uoxkuj?=
 =?us-ascii?Q?qR3aZdblNXd2sbWvgd8SIVT+GqnuNtHQBxw4l3Y3oJ7K8IOWi/wUsUnaAfVZ?=
 =?us-ascii?Q?M8BtH2cbjnVTuyJBfTZN8APJzl02CvTzlLJX0BDRebXJOxY0c8uPvyi6sV68?=
 =?us-ascii?Q?36rwIMPllLu0LkJbLMU1Cy7KR/R9yfKcHAR+g+Thg5GQrOtCDVYaWn6MTTy6?=
 =?us-ascii?Q?m5nmHzR9yhm1/4OY36er2bVI0rjM/bFQA6NeBNLqKaLNUEEL2/kiFfl0oAlm?=
 =?us-ascii?Q?xjE3Ti4wa08Zw9Tbl5Tv7VMSHpbjUePj68UeHJ9SGdm4UDOgTf+a2s7cbjiF?=
 =?us-ascii?Q?HkALQXuw32x6WqWQ2IDePoxYCmwdw3Bv4SI2WEVtxWRQOkgmCC3EFur3hyAz?=
 =?us-ascii?Q?buBQetljB2aPd7Ks04QtU4uYJRbFloCnL2spmy/Bt2d89mZxPsyFE397ceXS?=
 =?us-ascii?Q?9KKd0ZRA8WiAJfDWk4HSl/cV6mS5PwIcqx3OkrZVud0GLoCDLTrjHCbPhKCl?=
 =?us-ascii?Q?Ur6TNJ6vmSkhKicHt18T8cQVYenWB8UiVNe50Vh8dFYusNySGkPpIqVXfYTY?=
 =?us-ascii?Q?WZXambRCqvWllSLmhZSUHyIp9LkhDSkU778azYRvTqcPXrjhoqs5fwkCL6gv?=
 =?us-ascii?Q?Ec3Yw68OGE3XLPmw3nH2d40fud3VV9L4pjMTyodDuRPWtZTNaBYXVBjG7pdG?=
 =?us-ascii?Q?WGgJ6b45ZdPcgSrQyLctlIt+7HVfTRJwalJVKd1CYcGmJe1e1HUgP3Wr5vzI?=
 =?us-ascii?Q?pu18o+b9yuI4Q3adrdYJ94r75C4uiReJuS7PSNj/U0tQVn0SYvttdszmJbVT?=
 =?us-ascii?Q?yF9GvNbW+FJZyApBDGRTRYxuhLrvPFnieYihjvSq/JigIlxN3SHvjzimMled?=
 =?us-ascii?Q?Bl2cJRT8gd1Q85gx/9E+3Wj8uiVAZTBVqmKGTvL0giDzA4RnblhfLpqPhAoK?=
 =?us-ascii?Q?16NRRRtEUALIkfbA8rzYsZYL6wTw1KctVCcaO5W0jHLE5PiRH8AvETFdnyvO?=
 =?us-ascii?Q?fT6uUHCT6qTA6qKfekBCzf3qb5T+V8ZPnaKScr20ND4U0lcXvht2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30e02e8-2e2c-41ef-1cf4-08de6fe2b977
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 18:14:30.0665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1mTZ9Qqu2IEVtNjU8qeSnMi4UJFyWv5zGHHLdHtza+Be54MHNi7B5tEpPmpiEVGrBPxRrNzlkVJkr1J/3Svaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8877
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,davemloft.net,infradead.org,linux.intel.com,lunn.ch,linux-foundation.org,linaro.org,google.com,marvell.com,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,rasmusvillemoes.dk,fomichev.me,intel.com,linux.dev,lists.linaro.org,lists.infradead.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:davem@davemloft.net,m:peterz@infradead.org,m:rafael@kernel.org,m:alexander.shishkin@linux.intel.com,m:andrew+netdev@lunn.ch,m:akpm@linux-foundation.org,m:atenart@kernel.org,m:brauner@kernel.org,m:daniel.lezcano@linaro.org,m:edumazet@google.com,m:gakula@marvell.com,m:mingo@kernel.org,m:kuba@kernel.org,m:james.clark@linaro.org,m:jerinj@marvell.com,m:lcherian@marvell.com,m:lukasz.luba@arm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:mike.leach@linaro.org,m:mdf@kernel.org,m:npiggin@gmail.com,m:pabeni@redhat.com,m:linux@rasmusvillemoes.dk,m:horms@kernel.org,m:sdf@fomichev.me,m:sbhatta@marvell.com,m:sgoutham@marvell.com,m:suzuki.poulose@arm.com,m:trix@redhat.com,m:yilun.xu@intel.com,m:yajun.deng@linux.dev,m:yury.norov@gmail.com,m:rui.zhang@intel.com,m:hkelam@marvell.com,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fpga@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linuxppc-dev@l
 ists.ozlabs.org,m:netdev@vger.kernel.org,m:ynorov@nvidia.com,m:andrew@lunn.ch,m:yurynorov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16967-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: AB7DB162C93
X-Rspamd-Action: no action

Switch to a more common scnprintf("%*pbl") where appropriate.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 .../hwtracing/coresight/coresight-cti-sysfs.c | 33 +++++++++----------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fb..182c8db52a04 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -606,14 +606,11 @@ static ssize_t chan_gate_enable_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long ctigate_bitmask = cfg->ctigate;
-	int size = 0;
 
 	if (cfg->ctigate == 0)
-		size = sprintf(buf, "\n");
-	else
-		size = bitmap_print_to_pagebuf(true, buf, &ctigate_bitmask,
-					       cfg->nr_ctm_channels);
-	return size;
+		return sprintf(buf, "\n");
+
+	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", cfg->nr_ctm_channels, &ctigate_bitmask);
 }
 static DEVICE_ATTR_RW(chan_gate_enable);
 
@@ -710,12 +707,13 @@ static ssize_t trigout_filtered_show(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	int size = 0, nr_trig_max = cfg->nr_trig_max;
+	int nr_trig_max = cfg->nr_trig_max;
 	unsigned long mask = cfg->trig_out_filter;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
-	return size;
+	if (mask == 0)
+		return 0;
+
+	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", nr_trig_max, &mask);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -834,7 +832,7 @@ static ssize_t print_chan_list(struct device *dev,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	int size, i;
+	int i;
 	unsigned long inuse_bits = 0, chan_mask;
 
 	/* scan regs to get bitmap of channels in use. */
@@ -852,11 +850,10 @@ static ssize_t print_chan_list(struct device *dev,
 	/* list of channels, or 'none' */
 	chan_mask = GENMASK(config->nr_ctm_channels - 1, 0);
 	if (inuse_bits & chan_mask)
-		size = bitmap_print_to_pagebuf(true, buf, &inuse_bits,
-					       config->nr_ctm_channels);
-	else
-		size = sprintf(buf, "\n");
-	return size;
+		return scnprintf(buf, rest_of_page(buf), "%*pbl\n",
+				 config->nr_ctm_channels, &inuse_bits);
+
+	return sprintf(buf, "\n");
 }
 
 static ssize_t chan_inuse_show(struct device *dev,
@@ -928,7 +925,7 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", cfg->nr_trig_max, &mask);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -942,7 +939,7 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_config *cfg = &drvdata->config;
 	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return scnprintf(buf, rest_of_page(buf), "%*pbl\n", cfg->nr_trig_max, &mask);
 }
 
 /* convert a sig type id to a name */
-- 
2.43.0


