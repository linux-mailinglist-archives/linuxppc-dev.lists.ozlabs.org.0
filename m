Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2668ADBE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 04:27:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acldNQb3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNmGX0XHhz3cXm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 12:27:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acldNQb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=zhenzhong.duan@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 23 Apr 2024 12:26:19 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNmFl0SYqz3bsj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 12:26:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713839179; x=1745375179;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zrKRwii+jidVjclWejsfPfX/6lmkL1wSu/EKEEAfxTc=;
  b=acldNQb3o7OFoQYt7gfoq+DnrzFuMadrv/FPQ3eS4XkM59DYOSBsTm6u
   4AdwmhzRwRdsVrgB1uWZ4vULM9PZTW6toRpkM0lbNjLbSWjICMs3Oc+0M
   MShqzV+z8fPIB/egUqlpGlWp/51KyLicWhYQuIATk4if43pV0f5kAQLkV
   Br9k6d4wLoc3gNvH0ZxLgjV3HMvY6gw+XL0Xrqw41t5WHuhiG4PO5ijkF
   owVKfLM+mJlcV08Ru9vZTgim2Uw0H4EVwb93zavOQPdzMkNUbcU/bGJad
   PJHnVM2jcZjkIi23A0PlG7y75eb3uX6Xm7q/6fW5zn4NeYdAHYPNpGwK6
   Q==;
X-CSE-ConnectionGUID: X6JKesD2SXe9hZpexXDrLw==
X-CSE-MsgGUID: ALlg1fgwQ52oXYkflb4ksQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9514648"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9514648"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 19:25:09 -0700
X-CSE-ConnectionGUID: OX/mpGU5Sq261NWzIBN8Bw==
X-CSE-MsgGUID: 9brH2GyoSKqGoPuX5q4FAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24196799"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Apr 2024 19:25:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 19:25:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 19:25:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 19:25:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fh5B6NgHBN4SiNX0dZv/5fyugCxLS+mmndzM4Y7SjlxjtXULCp/8eLWtASGd0n0cB3HVOP2PcFWxX3E/Vk2NpuDSPonwGazxpNRrspwtvNfbM5vs+++HxojLjkQ2zkZkVI1eAA2YfVAmeCjgh1jrgKtHUgc1LVfg/u7+UhbjW5rYkhrbXK41z0oc2FThH9YyjTkOkgWa72mF/z15hyfT3KVh5DHki2RzLN+qPeLjHJPRAVrigEXK+JLitbli1nfbX+Kl2MaRdPhaz1h2OS+NlRva60EmiiS12ZQgHF+qmI843smTUy3lV7NBCopOfoVKAgbZapp+PAjOt88WFJl16A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiI1mzvJrq6FG1NTtwnnU09E2ERNeLE1Wm5namS2EFw=;
 b=MNpXdsRLeH0UkDpiAInZFi0kC6HftNIIi0JdrNQgVOLu3RW648o3sTs1WqKuJQhIVfdUyVmDpOatWQVCfE/FjmirFPteMMoRz9BBU2mTtGo1rchqEpy4J67nGYOva+70e24pC89cTMiq9mqh0IA8ExGfKTy0rLbhtdn0qFQrll/4oD5G84ezQ9BBubAAyMYGlTX1vOZXar6mh6mui6sZCaQIiPYrakE8HLuKlJf1JFCxgH8FxS/7AK4BtU2hnvYX4ylvaefBk748GfGvDX/7xW9rTthClhyOuCMkiXaloaQVCgude3vcXEc9orQ3H+L1T9Ohqc3a1i6p3Lw2u6aoGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Tue, 23 Apr
 2024 02:25:06 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::e4a3:76ce:879:9129%7]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 02:25:05 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: RE: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Topic: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might be
 ANFE in aer_err_info
Thread-Index: AQHakI7e85jyDjVvVkqdnwboxKPALbF0f7+AgACn2IA=
Date: Tue, 23 Apr 2024 02:25:05 +0000
Message-ID: <SJ0PR11MB6744EC971D1BE6F3119EEA9992112@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20240417061407.1491361-1-zhenzhong.duan@intel.com>
	<20240417061407.1491361-2-zhenzhong.duan@intel.com>
 <20240422171629.00005675@Huawei.com>
In-Reply-To: <20240422171629.00005675@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: 824d91f0-916f-4bd8-42a7-08dc633c96ab
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?lbBYq+D0+BlTsQK6rqoQiagHpn2cPsrNHu85D5065x41YQsjr4lq+nzqTW+9?=
 =?us-ascii?Q?Y88rz891OSX4xVQ6k66mfq8jZxxbs4B8Yme2w2VPrSc0+JTzWWbS0AkvktcD?=
 =?us-ascii?Q?7y+MYyc8tlGHV8A29lY6xqCEj3umliXgplIQydGMAHzcNd9DMKlVs6fyVwYg?=
 =?us-ascii?Q?brKsgiaR0GFhOC2pcA0zqirLg2vu6fHIaxEuQdxElSQNM0x3W/rsqAZYaYi7?=
 =?us-ascii?Q?pgPGxWyHsROhnL+gC0iWHLr1sTBmMdTHN5GPO42t5YCbuU5MdDvjSLG96VZQ?=
 =?us-ascii?Q?bFXXdnsQJWUjekEk7f+uqvuLlq6oMlr6fzWWTKSNzAoQhlBHdcOOKV4C0/Cx?=
 =?us-ascii?Q?0qILBR0oBrWilwOHqT7aeppOaSKiT2YVvtRNIFoZpApY4bUs/422Z5en+5is?=
 =?us-ascii?Q?ldpQQuCgM1+z9dc4c00N3WVRJ1MjIc2i0RGwVS63NwqMHaU7GXy+nkIuUv+l?=
 =?us-ascii?Q?B709+Q1TOJ3DKuF3mGu4SfmvuRQbWAK1AYG50sN0pKej7ffSnoTl8g3kcTxf?=
 =?us-ascii?Q?ZFFdw4InXL0CMRwaNd7BLqN8+F/aUDsjhEctb8EZOhMJLhXphc+EVsMRamae?=
 =?us-ascii?Q?9PpvUzOiogTjBAE0GvJun6etf0MgWKpImZjyw9bcfMLSZ0xCoCpBcz2ygiBB?=
 =?us-ascii?Q?VrSSLy0EZGpluntAjGfgruF+s926g1KdsyI+bFaJro9ZuM0ZONZGOpMWsz84?=
 =?us-ascii?Q?X3Wx0Ai//wKaRv8NaUedh1cuapsfNzAmkl8Q0V3QKF0FzxPM0eT3qWJ8BPw5?=
 =?us-ascii?Q?w4+5lvQZwawveDn8N3j8NHVsDa3k9nF5ls6bWstbslng89n+1lvlqNYNdQc2?=
 =?us-ascii?Q?5kCa3wTAXnacqdl31qTxCTA9ZDZNvkDngzQfJhixLSAnLb6aXMJJIyTwjsFS?=
 =?us-ascii?Q?1KEL8wKpfv60eogjeTvIHvsBYICjiXIT03EmCMii2li4/hHgDYOEQlbzQClb?=
 =?us-ascii?Q?sGwEsA3eL7G5S0xWncou30tKO6KJpjEq4tYvR/iG4ZR6mV76KtB38K9QA4qj?=
 =?us-ascii?Q?7yyV7GTXWUuoolMJis+DZ6nWSNM9AswNnKk9HMb+0MzQv59EKYFWMl3n/M/M?=
 =?us-ascii?Q?jFNML7GK7ajfdWLv+Waktq7pyUC8kmSKrfSpEMXn7kTZ+sRONgV+Kyxd0OHd?=
 =?us-ascii?Q?IoZFvWQFCSOIpltNI3TOhv/1P2l8WrOTMBJjeXoPI4OKOOGiV+vzJ9n4tr3T?=
 =?us-ascii?Q?5mA2jHfZV5fmF5E8M7FtQP+ZBVdq7SBaxijczQrN02PUos/VczI+qcMMinuo?=
 =?us-ascii?Q?RQt1S5NbrK22VMBP1p9NDbWAzWaKZTQkz/IQ3LJULmseWh8GdmT8P97Ky9fS?=
 =?us-ascii?Q?I6+9/4bJzITLOu+kwpL0zSnhJpBiZBXMAqdpQDBZuqANLw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6744.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GvAMAx+S/78bnnBnhdxybiDvBBDCZSX4wwaKQqKhNqpiB+pX753BCXok9FQb?=
 =?us-ascii?Q?OwzCrCpAE1AILvBCXG6gSZp31BtedUx5Im/LRQL3LOJXGuuNEkZLp3Sv8u1u?=
 =?us-ascii?Q?6tBJ2q/hL6gUzyRLldQg/0nWFbkcAJBzbEPCbkOzKOiXTpD85nNmwLxLNfpu?=
 =?us-ascii?Q?Bs4SVDKhuZ7WcboSyba8UrsQlLMtxqzsps+IKh4lzAC5bYIXIlheCf/DKC/7?=
 =?us-ascii?Q?h6m6BdHzSCnOjFYxPtDMo+TvdGw6/sQEXRH4gk7xMYgpjdsOiL1w6NHcrnRb?=
 =?us-ascii?Q?/I5UCQ8Tzv0AjPOm7z8Ok7+7Co8nIpoMn3Ht+PGSgRrFBttPl8GMg5+kjaG+?=
 =?us-ascii?Q?MdYmsaeHMZ+06sohihzvp4tCBi5O7gdvCJHVGVApcdmgRvAK0Mva3Mc8jXrs?=
 =?us-ascii?Q?NI86PhQSmilIhV7h7ts3hkW03t8hsc83cwrl+ulnaqx52RK5VejipRdQbyYk?=
 =?us-ascii?Q?zStJIKmgF2OIRM4HQv7FINidiAFaIes2cUGT3Z0XW8kJQrgPbyvSG2ITeL0F?=
 =?us-ascii?Q?KQ7L2syVkkeAOF/nluzQZ7CAl42lWV+RvumhQUR+cvC5L7gs61t+i+H6WsBA?=
 =?us-ascii?Q?aPbCXwLVB8Ar8mjcfVPH/JJgIFr/sczS+DSTnLnabRIi++jjhodKQjqgwzTU?=
 =?us-ascii?Q?akA6BdTXwuh//is7LzEwP3AJ77QPCZZFH/IPQWH8ZwdYu4d+RsuBuyxtG6aH?=
 =?us-ascii?Q?OHkZ8xw7MQ+9ghapR6TkPl45FT97+nFOFKkgdMXw9bakg9ddIzIr9pA890qw?=
 =?us-ascii?Q?RxLZ6tEvX+oLBzRB5GTBrhq0Z2OQrek9CbxQyXSKmZg4nBCOSnPLW173/jtX?=
 =?us-ascii?Q?m+mBoiWE0e+AM2qLF6l2CFBIcUF4p0IkLg/44OlA6xSBDnsgLNA0PhQpn7o5?=
 =?us-ascii?Q?q8WcxXn02+an//nVVpDCkcfaYHKoLdrQ8VhIoi9/svrscioEPAH2YoKsgcuJ?=
 =?us-ascii?Q?vhJnuLB9MZZutPl4SqHt2TGlhFVV5JV0+kGNPb6SmT3tIzswmO6LegPffOeB?=
 =?us-ascii?Q?Z8xu++DofQENp0Y5BH6ic8iNWaJdxP08w8zebiG/3oAENhMrU2brlC3F1pG1?=
 =?us-ascii?Q?Edbh6HRQOkNAzBw51unExaU7USLXzcPvspxhoSMOgYQ4RO/DIq3Mo9aKwKA9?=
 =?us-ascii?Q?LFl6wpsUvnysaug8iUnamPp8YQqG9U3tb5tJBxyxrcLYt0yoodcD+TlszmlI?=
 =?us-ascii?Q?uC6QqDdIlUsZeVKjwQE/yDzzKEG2BYVKjZEey8UZoSeoyhQfulTIXd5QHA+y?=
 =?us-ascii?Q?qiOWLv0iCOUS7/Ay7AoK4Arn1n3SVT3i4PefBmXor/yGMsL5tNUoCKfegAK2?=
 =?us-ascii?Q?lJF1tBi/GReNR6r7KRbnf/vF6LVtsNn2n6YjLnMORpNl70YIDmgn7cNZalFu?=
 =?us-ascii?Q?HPT+yS8x4aFCDW77C6MMF15+daE7c7WMVv6e5oFzxUQdLaEi6qfiFVWV5RCB?=
 =?us-ascii?Q?urVlBQW5uEiyLo3rgqDCdcw6ja0c/Cj9tO39w4R3kIF5Y9wFHiDaUXLgbASO?=
 =?us-ascii?Q?7v9/yzBaDz4QXwBXlMAqgPefhPZPQoHUn9gMOpPwSWPaGtetNVFDmhgJ3kJ3?=
 =?us-ascii?Q?wCxsjSL1XLPqHGwIf7b/mW3D/7Dob6YFWLF4QMDR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824d91f0-916f-4bd8-42a7-08dc633c96ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 02:25:05.6442
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iw2Cmq04ug+In3yiGpB0NKojrIIuk66jxpG9WF6J/vzohiy0xaTrs/nVc1X/Omioo+X0t2PDJA4Lqit5TWeemG5MTNvO74NDe36gqRlfooQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linmiaohe@huawei.com" <linmiaohe@huawei.com>, "Schofield,
 Alison" <alison.schofield@intel.com>, "rafael@kernel.org" <rafael@kernel.org>, "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@intel.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Tsaur, Erwin" <erwin.tsaur@intel.com>, "linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oohall@gmail.com" <oohall@gmail.com>, "Weiny, Ira" <ira.weiny@intel.com>, "dave@stgolabs.net" <dave@stgolabs.net>, "Jiang, Dave" <dave.jiang@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>, "Smita.KoralahalliChannabasappa@amd.com" <Smita.KoralahalliChannabasappa@amd.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "helgaas@kernel.org" <helgaas@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>, "Peng, Chao P" <chao.p.peng@intel.com>, "rrichter@amd.com" <rrichter@amd.com>, "Wang, Yudong" <yudong.wang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "qingshun.wang@linux.intel.com" <qingshun.wang@linux.intel.
 com>, "bhelgaas@google.com" <bhelgaas@google.com>, "Williams, Dan J" <dan.j.williams@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, "Wanyan, Feiting" <feiting.wanyan@intel.com>, "Preble, Adam C" <adam.c.preble@intel.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "lukas@wunner.de" <lukas@wunner.de>, "james.morse@arm.com" <james.morse@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "shiju.jose@huawei.com" <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



>-----Original Message-----
>From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
>Subject: Re: [PATCH v3 1/3] PCI/AER: Store UNCOR_STATUS bits that might
>be ANFE in aer_err_info
>
>On Wed, 17 Apr 2024 14:14:05 +0800
>Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
>
>> In some cases the detector of a Non-Fatal Error(NFE) is not the most
>> appropriate agent to determine the type of the error. For example,
>> when software performs a configuration read from a non-existent
>> device or Function, completer will send an ERR_NONFATAL Message.
>> On some platforms, ERR_NONFATAL results in a System Error, which
>> breaks normal software probing.
>>
>> Advisory Non-Fatal Error(ANFE) is a special case that can be used
>> in above scenario. It is predominantly determined by the role of the
>> detecting agent (Requester, Completer, or Receiver) and the specific
>> error. In such cases, an agent with AER signals the NFE (if enabled)
>> by sending an ERR_COR Message as an advisory to software, instead of
>> sending ERR_NONFATAL.
>>
>> When processing an ANFE, ideally both correctable error(CE) status and
>> uncorrectable error(UE) status should be cleared. However, there is no
>> way to fully identify the UE associated with ANFE. Even worse, a Fatal
>> Error(FE) or Non-Fatal Error(NFE) may set the same UE status bit as
>> ANFE. Treating an ANFE as NFE will reproduce above mentioned issue,
>> i.e., breaking softwore probing; treating NFE as ANFE will make us
>> ignoring some UEs which need active recover operation. To avoid clearing
>> UEs that are not ANFE by accident, the most conservative route is taken
>> here: If any of the FE/NFE Detected bits is set in Device Status, do not
>> touch UE status, they should be cleared later by the UE handler. Otherwi=
se,
>> a specific set of UEs that may be raised as ANFE according to the PCIe
>> specification will be cleared if their corresponding severity is Non-Fat=
al.
>>
>> To achieve above purpose, store UNCOR_STATUS bits that might be ANFE
>> in aer_err_info.anfe_status. So that those bits could be printed and
>> processed later.
>>
>> Tested-by: Yudong Wang <yudong.wang@intel.com>
>> Co-developed-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
>> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
>> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> ---
>>  drivers/pci/pci.h      |  1 +
>>  drivers/pci/pcie/aer.c | 45
>++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>> index 17fed1846847..3f9eb807f9fd 100644
>> --- a/drivers/pci/pci.h
>> +++ b/drivers/pci/pci.h
>> @@ -412,6 +412,7 @@ struct aer_err_info {
>>
>>  	unsigned int status;		/* COR/UNCOR Error Status */
>>  	unsigned int mask;		/* COR/UNCOR Error Mask */
>> +	unsigned int anfe_status;	/* UNCOR Error Status for ANFE */
>>  	struct pcie_tlp_log tlp;	/* TLP Header */
>>  };
>>
>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>> index ac6293c24976..27364ab4b148 100644
>> --- a/drivers/pci/pcie/aer.c
>> +++ b/drivers/pci/pcie/aer.c
>> @@ -107,6 +107,12 @@ struct aer_stats {
>>  					PCI_ERR_ROOT_MULTI_COR_RCV |
>	\
>>  					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
>>
>> +#define AER_ERR_ANFE_UNC_MASK
>	(PCI_ERR_UNC_POISON_TLP |	\
>> +					PCI_ERR_UNC_COMP_TIME |
>	\
>> +					PCI_ERR_UNC_COMP_ABORT |
>	\
>> +					PCI_ERR_UNC_UNX_COMP |
>	\
>> +					PCI_ERR_UNC_UNSUP)
>> +
>>  static int pcie_aer_disable;
>>  static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
>>
>> @@ -1196,6 +1202,41 @@ void aer_recover_queue(int domain, unsigned
>int bus, unsigned int devfn,
>>  EXPORT_SYMBOL_GPL(aer_recover_queue);
>>  #endif
>>
>> +static void anfe_get_uc_status(struct pci_dev *dev, struct aer_err_info
>*info)
>> +{
>> +	u32 uncor_mask, uncor_status;
>> +	u16 device_status;
>> +	int aer =3D dev->aer_cap;
>> +
>> +	if (pcie_capability_read_word(dev, PCI_EXP_DEVSTA,
>&device_status))
>> +		return;
>> +	/*
>> +	 * Take the most conservative route here. If there are
>> +	 * Non-Fatal/Fatal errors detected, do not assume any
>> +	 * bit in uncor_status is set by ANFE.
>> +	 */
>> +	if (device_status & (PCI_EXP_DEVSTA_NFED | PCI_EXP_DEVSTA_FED))
>> +		return;
>> +
>
>Is there not a race here?  If we happen to get either an NFED or FED
>between the read of device_status above and here we might pick up a status
>that corresponds to that (and hence clear something we should not).

In this scenario, info->anfe_status is 0.

>
>Or am I missing that race being close somewhere?

The bits leading to NFED or FED is masked out when assigning info->anfe_sta=
tus.
Bits for FED is masked out by ~info->severity,
bit for NFED is masked out by AER_ERR_ANFE_UNC_MASK.

So we never clear status bits for NFED or FED in ANFE handler.

See below assignment of info->anfe_status.

Thanks
Zhenzhong

>
>> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>&uncor_status);
>> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
>&uncor_mask);
>> +	/*
>> +	 * According to PCIe Base Specification Revision 6.1,
>> +	 * Section 6.2.3.2.4, if an UNCOR error is raised as
>> +	 * Advisory Non-Fatal error, it will match the following
>> +	 * conditions:
>> +	 *	a. The severity of the error is Non-Fatal.
>> +	 *	b. The error is one of the following:
>> +	 *		1. Poisoned TLP           (Section 6.2.3.2.4.3)
>> +	 *		2. Completion Timeout     (Section 6.2.3.2.4.4)
>> +	 *		3. Completer Abort        (Section 6.2.3.2.4.1)
>> +	 *		4. Unexpected Completion  (Section 6.2.3.2.4.5)
>> +	 *		5. Unsupported Request    (Section 6.2.3.2.4.1)
>> +	 */
>> +	info->anfe_status =3D uncor_status & ~uncor_mask & ~info->severity
>&
>> +			    AER_ERR_ANFE_UNC_MASK;
>> +}
>> +
>>  /**
>>   * aer_get_device_error_info - read error status from dev and store it =
to
>info
>>   * @dev: pointer to the device expected to have a error record
>> @@ -1213,6 +1254,7 @@ int aer_get_device_error_info(struct pci_dev
>*dev, struct aer_err_info *info)
>>
>>  	/* Must reset in this function */
>>  	info->status =3D 0;
>> +	info->anfe_status =3D 0;
>>  	info->tlp_header_valid =3D 0;
>>
>>  	/* The device might not support AER */
>> @@ -1226,6 +1268,9 @@ int aer_get_device_error_info(struct pci_dev
>*dev, struct aer_err_info *info)
>>  			&info->mask);
>>  		if (!(info->status & ~info->mask))
>>  			return 0;
>> +
>> +		if (info->status & PCI_ERR_COR_ADV_NFAT)
>> +			anfe_get_uc_status(dev, info);
>>  	} else if (type =3D=3D PCI_EXP_TYPE_ROOT_PORT ||
>>  		   type =3D=3D PCI_EXP_TYPE_RC_EC ||
>>  		   type =3D=3D PCI_EXP_TYPE_DOWNSTREAM ||

