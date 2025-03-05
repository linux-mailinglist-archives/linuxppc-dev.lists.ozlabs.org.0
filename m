Return-Path: <linuxppc-dev+bounces-6748-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48AA50CD7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 21:51:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7Pq765l7z3bsM;
	Thu,  6 Mar 2025 07:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.156.173 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741176973;
	cv=pass; b=S4baM6z9Hu0CC7ShkYQ7h3O9fpcxBMP87XSNqrLnZoTCcpbBVQL75nt3GiOA+c6A0e4Un/sbQgNDT1yaMeSV1sVtMGeJddkv+qcPvl7oWAsDfgUlPpGHyXM0KiE5VALJbG4z/1Fl2tcnu8mf5lPF/eZfRlsZ3s5Vh0Z7++mbMerMWC96cC3OkOLntlVwjpQ+EI98jx+9toVgQT0eIExI5wYPnE7JLRybWcAmrfQABT5oZtODb4vt/Ti/rxkfdiKaDsugzRtvZT8MwtmOWkBNCuzeX6fbtxZQiUXNUoLwGBFTcunVO5SgSqSMsIkSn458rAeS3ERY3+0EiCIE24Z9Zg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741176973; c=relaxed/relaxed;
	bh=49+QmkZtLSZ0oKiLEaYNjcmqnadhNmVcnXF5/JLFgBc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UiRZpeRANTk+D5Y4NrZyxX1x/q1x82FKbnJwe2aZLfpzZM2DMwRrUnA8LU2CeSTSW0EZvbkdvVXWjaBtxVrnAbCyhiRsREimzk6Q2X3fquvy8s8HumLYGv8ybO67pXR5PYAZt6CncKvQgEazBYylKyZAIa5WRgSnPFp9CW4rDPnadQIW90GRoAshIVv6n4Fp9U2d3tsyMw+fovvwUiBzynTlpM2f4UPdZZOak7Sos7Bw9urw3aVb84TTojnKND9YCswGsrKTuNQ2pVbliurism0o9raqLSbsDEfCr3FhSTyNpXX7Urx3EuqmmhjMmnvcEGfEci+oQQkswnckMGRdsA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com; dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=VniUezU8; dkim-atps=neutral; spf=pass (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org) smtp.mailfrom=marvell.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.com header.i=@marvell.com header.a=rsa-sha256 header.s=selector1 header.b=VniUezU8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com; envelope-from=gcherian@marvell.com; receiver=lists.ozlabs.org)
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7BNX30thz3brd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 23:16:11 +1100 (AEDT)
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525BOvFo030834;
	Wed, 5 Mar 2025 04:15:33 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 456nqeg2k0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 04:15:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sDa+krfUIerxxGncc81FcRXHl8h7aaZBHv7996sA6D+vu+xdCsNFzqG+uqqNSnaRccS8nx5EZnlYs5KH8PueOxXl/+tYSOWFH0eJNdQNCKv7UNPwMrZWfjQrEvGPB33OP1UZZxd89Rf5sOnr+UhkDO1VVehkdNXHgp69Z9jwLMIINzaVedUeNVFOC4ZGGCsmEKgCB5i+QxsfIDBq5STmU/pY8hsf9qZnANog6+Kh0Mg6+VkhpYwkUUhDGGaFEL6kXSRPoOV13Ol1z3fatkzWH2WlKoTZknC+NHybok/u3j8QZrBER4+Dl+lNDPa2HEh5wMubTf1qH3tJkkcNZRkZ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49+QmkZtLSZ0oKiLEaYNjcmqnadhNmVcnXF5/JLFgBc=;
 b=d6DbMxvpiV2/oG0gTzIZEIoWUSRy7x0t7GGkY7dMXLkFK6uN6HY8gR0UO23EHbMbodvghBPTCVpc51Ux9apjwbtXAvWppNhY3/f3SoiTzNtsW60mA2QB5YNo8FPAZIRYKVZozMNTHp93+kL7eQRJ/kMwm3vhcGIH+0xo67DCv6jNOtpYOalA00TsgS8LoJtyMAHRM4ejll9GodNjtK9l6xFZz/JeRP5eL6Vj5cIWm+JjG5giQugi4sQesQqRfShlXp6R4f3jwEs/HXH2D14An6mDk35ryOIUfgIS645kAQKZy+H71HWTSL1124vqM41noBqz8Kyvgr3MxxIyTjfrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49+QmkZtLSZ0oKiLEaYNjcmqnadhNmVcnXF5/JLFgBc=;
 b=VniUezU8L62L/2dR2Ycop2eSP9PQ5NBJdLkq7NzuJ5BFxdmCw1AqGg7STd9D5zGalqlnWMpdZl5CmO33vZaUW/5XXqhKxFsy+UgdqzUK6WowjFnKsIGhImwsI0o+XcgLiNJe3u+7eLc3REhfp7ahhGlnYmsBpLlQqHkpjbCv6IM=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by CH0PR18MB5507.namprd18.prod.outlook.com (2603:10b6:610:191::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 12:15:29 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 12:15:29 +0000
From: George Cherian <gcherian@marvell.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "linux@roeck-us.net"
	<linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "jwerner@chromium.org" <jwerner@chromium.org>,
        "evanbenn@chromium.org"
	<evanbenn@chromium.org>,
        "kabel@kernel.org" <kabel@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "mazziesaccount@gmail.com"
	<mazziesaccount@gmail.com>,
        "thomas.richard@bootlin.com"
	<thomas.richard@bootlin.com>,
        "lma@chromium.org" <lma@chromium.org>,
        "bleung@chromium.org" <bleung@chromium.org>,
        "support.opensource@diasemi.com"
	<support.opensource@diasemi.com>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com"
	<festevam@gmail.com>,
        "andy@kernel.org" <andy@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "alexander.usyskin@intel.com"
	<alexander.usyskin@intel.com>,
        "andreas.werner@men.de"
	<andreas.werner@men.de>,
        "daniel@thingy.jp" <daniel@thingy.jp>,
        "romain.perier@gmail.com" <romain.perier@gmail.com>,
        "avifishman70@gmail.com"
	<avifishman70@gmail.com>,
        "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
        "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
        "venture@google.com"
	<venture@google.com>,
        "yuenn@google.com" <yuenn@google.com>,
        "benjaminfair@google.com" <benjaminfair@google.com>,
        "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>,
        "naveen@kernel.org" <naveen@kernel.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "xingyu.wu@starfivetech.com"
	<xingyu.wu@starfivetech.com>,
        "ziv.xu@starfivetech.com"
	<ziv.xu@starfivetech.com>,
        "hayashi.kunihiko@socionext.com"
	<hayashi.kunihiko@socionext.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>
CC: "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
Thread-Topic: [PATCH v4 0/2] Add stop_on_panic support for watchdog
Thread-Index: AQHbjchIB0FTJOHUHku2YJ3rGogN8A==
Date: Wed, 5 Mar 2025 12:15:28 +0000
Message-ID:
 <PH8PR18MB5381B857859C6413392DD007C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
 <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <28d0ea70-db7a-40e7-aac9-86808320f252@pengutronix.de>
In-Reply-To: <28d0ea70-db7a-40e7-aac9-86808320f252@pengutronix.de>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|CH0PR18MB5507:EE_
x-ms-office365-filtering-correlation-id: 28e52802-9b42-4cca-44b7-08dd5bdf6b2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHlWNjhVYmNQbWNIUkd2bm5uOGtKdmJxUUdvMEJzaGhmQjJCMHQwb1lESjk3?=
 =?utf-8?B?ajArN0hxdTdsdkdZNjJIaGZhUjhib0RDdERlbnhxYnVqNHcxeWhFSlRyNlZw?=
 =?utf-8?B?WTd0Wno2Q2YwSm9CNWVqSlljVjZadE9MQ0MzUmc2UGVEcEVqQXM2TWxJeExL?=
 =?utf-8?B?R1VkcW96Y2pjMFdBS09YYWI2MDJZNkhYajFJV01lVXpTSkZ6Z1E4VHRMSERQ?=
 =?utf-8?B?UFZNUEVXK1BOd1Rvam51Y3RrSk1SNmR3VE9ZV0R5bThzNFJEMHd1NkVJaVFL?=
 =?utf-8?B?Z3ZlcjJlMFRvaGpqRGpwbUVVanFqU0VLOEVBa3VJKzA4ZWdVTWVxWU8yTVBh?=
 =?utf-8?B?MXdFMkh1cGpEZUdrQVZNdjcvLzluN0RycHhiODZtQ0x0by9yMnFLZWZOY3dy?=
 =?utf-8?B?Mk9QRVJGN0ZkUi9DTjZUbjNuNDZ2NkkxQnF0NUw5WTVPMDdQTnhWTm5KMTAy?=
 =?utf-8?B?L3lKOE94ekh0RTBPS2gvaEo4em5xb2NaUHp3N2YzRUtTdG1WY1gzSHE5a0Vl?=
 =?utf-8?B?ODJGT1o1cjgwYUZrY2I5OG9YUlIrd3ZXbGIweXpCWUVGeXNNaGlzM3VMUlRW?=
 =?utf-8?B?ajQwTk0wSVZDMnBueFZMZXh2TGZXZVZyVi9xRjNzNGwySU80TFp2UlFyNHdV?=
 =?utf-8?B?eDArWW5XWlRkUG1kOFN0bDFsOGR2eHdRVXg1RUYxTWdjaEt3VzRTd3NIck1V?=
 =?utf-8?B?bjN1dzFzTU5EMGh2MjVFKzFxbFRUemNTT2lPcFczaENyeEkyNU5EUDlNU3Nk?=
 =?utf-8?B?dWZxZ3VLaHRHUjVYbUlLTXhIU3dhS3BweHFxR0p2SWNWVHlERTdFbThZVEZ3?=
 =?utf-8?B?YTZuOFAxM21sTndIcWpyMDFxSHFVQjI4d2FzQmRmaTNjUUlMSEpMUHl1TWRB?=
 =?utf-8?B?a09uM1htU0hSRWNXdzMzZzhIN01DZGhYNWZVS0FvRThOa0xQbVdldFNLandl?=
 =?utf-8?B?cTl4Yysyc0NPRTR1TStsNkc1aU1iblJRRFc5b1ptemQzb3ljZlNLZ3hwbjJt?=
 =?utf-8?B?dmdoS1JGZjcwRm1hdklUc3lZZVE0cmhZT3p1d2JXVDRjdlBvTEVuNEgrSmw2?=
 =?utf-8?B?ZGMyOGV3SERMYnRIRzZZU1JkQThMUVpHU2tITERZRlU0Rkhwbzc0cEJoREM5?=
 =?utf-8?B?ckoyYkoyL2ZzNHNHdGl5RjZBOVJJNEk0K3ByZmlIOTFRMVFlZ2N6dFVMcGV6?=
 =?utf-8?B?Y1JVYmRqTjg1T29JS3BPc21DK1VpQ1N0akI2S0g5cm00ZmJjNlcrcUpHemFP?=
 =?utf-8?B?aU0wblBvTi8rbDZCSC83V1RmaTZZUUd5M2dMZm5uQy8wUkZuWjFYSHJ6RC9M?=
 =?utf-8?B?WjVBaVA3bHU2K28rNDNlcVJ4VnczUHpXNk5NaTRvVE1VdC9oNXlaQWNFZVhp?=
 =?utf-8?B?c3NscHlOdnVnbVdIVEFqbWxvUkFHTUpjbmdmTzZMRWVxYUFraEFMbFB4NXVp?=
 =?utf-8?B?N0xTTjUvYnJLTENtbHByMFhlZnozb3hpNlZSQmh1UUMzT2NWM0lxangzTXRs?=
 =?utf-8?B?bkJ3WlJKNm1MUVJabXlHRHFzdC9KM1hTTUVnMkpyQmdmZFh4c1lqWXR2OEZt?=
 =?utf-8?B?VE9vczFTNklpRjRnUFBCNVBtcnlmSDErZ2l6TjFrcmtSSXplc2VIQ2xmdE9v?=
 =?utf-8?B?UkJvZW1Rb3R4TFF1ZGdCRkw4azdHQ00vOFZjWXFXcHpab2U3cEpvcU1FNHFL?=
 =?utf-8?B?QjQ5RGJUVGlMRytqSElMZzJ2Mmg5REZFQlV6dWpSSXBNOG5VNTJUc3EzWlFY?=
 =?utf-8?B?K2JaVGF6bElVVDFGWHIwT0grdXQ4MGdlamdEZEdUNE1vR0M2Q24wOWxHUmdz?=
 =?utf-8?B?dlZUZGwwQjg1YTAxODVHdHNJbWVaRk90S2liM0ZDK1IySHFYeHRlN2laQTZy?=
 =?utf-8?B?c2NGeWlVdFFyZkNZT0FwU2IzenBCQlo0TEFDajVROWNnQkE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHk0bnN4UDZNNzRGOVlqeXFXdnpLd3FJVXdkTWtGUFNKMEw2dVU4cko5KzE0?=
 =?utf-8?B?d2FoZjFWUUYydE5ibVdncU1BdThJaUFTZjB1M2JUOHRZazhMT0hEc1loME1D?=
 =?utf-8?B?Skk5SDIrTk9MamdQd0haMUtHS091aDg2QzM2aUdEd1JKTUtNUVNTY2gzalBJ?=
 =?utf-8?B?L24wVGNLVmxpU1dveE51V1dhVGlxY0dUZGxIcSt1bGt2c1ZWMXNLb1loK1Jw?=
 =?utf-8?B?K2E5QXBFM1hHd1R6UXZNMzhWdzZ0dC82aXpwSkRoalR3aXZ1OFFSd293cFJN?=
 =?utf-8?B?Vlluc25SVHRpTXpHT1JiTzJldUNqTmlsdmJHckZmVDA1azZjTWUrSTFiT0Jv?=
 =?utf-8?B?NS80d0tuTnVzY0FveHYrTGUzYjYxUHdQU0U0d1JNSG80dnN3ZVBta3FhKzV5?=
 =?utf-8?B?QnJYQ3VScEx1dlpmbEhFVkxzb2thN1NqVER0T2QwT2pBbVdNZTZVbDg0Qnp0?=
 =?utf-8?B?dnNsSHJBRnVZaDIvU1k1ZzhuTWRabE9KTWdNTjFUdWdTM0l2Umc0ZkE2MzJu?=
 =?utf-8?B?eXRuY25Kbnk5LzV5amhBRTBISjUyU0JLd0RWWUJSZ1k4R1Vrbm9aNTNmVjVK?=
 =?utf-8?B?Zlkrb25Ea2RWbmxxMUQ5ajY5Y1N2aFpoZm01WXd1citRSzhORFg3b1p1dVA1?=
 =?utf-8?B?RWxUM2ZNajZBL1JVaTVTalpqeXU1cHVZcDNJMkxoTjBZQU1jcFRjcFN3bTRx?=
 =?utf-8?B?c3ZJdTZaRE5MMHc5MC9BU2FiTTZpanBNRUgrYUZCZXRiRkZYanZOTFhtZTdU?=
 =?utf-8?B?b3dsSnp4OHdjamN0NmNxV3c5NzZ5N1ErSVd1dG9RWjhtVFJKQkZ0ZTRmTGZp?=
 =?utf-8?B?UjlrTkFrbFUyd1ZUdUpRbGR2TXkzVHlPSFVrN3ZCakpyeThWZzNRVHN2cVJp?=
 =?utf-8?B?VEh6aVY5Qk1LUHVNUjFyUk54QVUxeDM3cHM1NmUxU2g4SlJBaEVPUmcxSTJR?=
 =?utf-8?B?OGd2aURxMkpjRmxRaHdUVkUzUmw4ZkxtNGpZcWk2SjFYVVp6WFRKZ0ZtMmJn?=
 =?utf-8?B?dUZsYU9IY0doN0JrcFNqcW1TZS9Wcnp4T0hJcnYzVGVTSFhtT1FsNlVYbStu?=
 =?utf-8?B?VGJ0ditWLzFLOEgyV3JGQkFscXhoUVFFZGJtckRZdFNWZ1c0M1QwaUlmWU8w?=
 =?utf-8?B?SVlGcDczUkpSSG5CNXdLT0ZSYUNZbGlOMDVyWkFEaTBYVFFZU3BueDhkdWUy?=
 =?utf-8?B?VWx6ZXRVSkFMM05SaEVUMUFlMU5ENkgzUHplVkZFeC9UdlVKVXdRV1ZRemVG?=
 =?utf-8?B?V0xiSEdGRjBJQ2RJS2k2b3hzSDBveVVIRHV0dXVkTVE2WWRaWGhqSy8rK0Zy?=
 =?utf-8?B?bVJ5Y0h4RC9YMUNPaWdWMHVxdjh6MVlxYUVzcHhkZy9QS2J4RGxCWlQ1OGRj?=
 =?utf-8?B?VXk5WVlXRUs1eUJoSHNMKzRIQUM0cmtuVzMzYUxlWUNWeWdEbTdSNjZxMVF2?=
 =?utf-8?B?TFR2TFI0OUNaay83cFk1bzBkNGhjTEpUeUdJSk9UOTJKU0ZIRHZRY1oyaGtY?=
 =?utf-8?B?VUlweDFWTXhYVkc3RlB4RTEwaTRSV0plYWFNY3N3Rkk4bUdBZkdxd09SendK?=
 =?utf-8?B?anVBYVZId2ZjbVh3KzRob2VSd2plazRVQ0huTGQvMlFQMWZyZzZQOW1OeExv?=
 =?utf-8?B?Z2xmMkpNQk5ZM1dXb3hhaXZKOEtQWHpzZ3NnSVRqNU4vS0U3b0txN0s5Qlpi?=
 =?utf-8?B?U21BNzB6VEdYbitEVmhiYTNRaWxjVk9mb1JJMytOMERIS0FOeTNHQjNvcEk2?=
 =?utf-8?B?Q1FGbHdQUmtEaU5hZWloODVqcnduekNDVC9uUjZ2Tm1QbmlTSThEUExCbDdJ?=
 =?utf-8?B?cHNSRVNtZGFZQWJmRW51WEtvZ0VCQUNkTjVVTHZaMGZBWmlFSFlYVXBwbGpV?=
 =?utf-8?B?ZlZCOTBVZ0xycWJBWGdCd0RyLzk1Vkp2ajhzZ3gxdVJOVUhRUnJWMjdabG5I?=
 =?utf-8?B?Nm9aMTdLRjU0ZFVvb3NIaXJ6SmhNYUlFM3JYemFCVnE4ZkttaVZFNzA4aXRr?=
 =?utf-8?B?WVZUZ05zNnEyWnRsMmVCclpsL1RKMmo0NEVsc1IyMlBNTytDUWxuN2pOSGhH?=
 =?utf-8?B?RFJsZEZzakxWQy8xTWNHYlpRbmx4a3pzSGdVY1lsN2lQTXNhdWR6M3ViNTFh?=
 =?utf-8?Q?8iiRE4+uBEzYGs1+JGqleXNtI?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e52802-9b42-4cca-44b7-08dd5bdf6b2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 12:15:29.0106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /fW9PyKYJ/CurlAPeYjepl0pqiHtwQCO9evMIQ2jPBVO2IQy/4MPJ5SAmkKpkli7VoFvysBDIxDz2hAjb/sd1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB5507
X-Proofpoint-ORIG-GUID: xcBlEfwT47bHArSHsw0UFToDTZthj9E9
X-Proofpoint-GUID: xcBlEfwT47bHArSHsw0UFToDTZthj9E9
X-Authority-Analysis: v=2.4 cv=Wr/RMcfv c=1 sm=1 tr=0 ts=67c84065 cx=c_pps a=VLWBoSTBoww685Dj7+Q0uQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=bGNZPXyTAAAA:8 a=nkFVMVAWg0sdIH7E3NIA:9 a=QEXdDO2ut3YA:10 a=yL4RfsBhuEsimFDS2qtJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_04,2025-03-05_01,2024-11-22_01
X-Spam-Status: No, score=-0.9 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

SGkgQWhtYWQsDQoNCj5IaSBHZW9yZ2UsDQo+DQo+T24gMDUuMDMuMjUgMTI6MjgsIEdlb3JnZSBD
aGVyaWFuIHdyb3RlOg0KPiBIaSBBaG1hZCwNCj4+PiBIaSBHZW9yZ2UsDQo+Pj4gT24gMDUuMDMu
MjUgMTE6MTAsIEdlb3JnZSBDaGVyaWFuIHdyb3RlOg0KPj4+PiBUaGlzIHNlcmllcyBhZGRzIGEg
bmV3IGtlcm5lbCBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIHdhdGNoZG9nIGNvcmUgdG8NCj4+Pj4g
c3RvcCB0aGUgd2F0Y2hkb2cgb24gcGFuaWMuIFRoaXMgaXMgdXNldWwgaW4gY2VydGFpbiBzeXN0
ZW1zIHdoaWNoIHByZXZlbnRzDQo+Pj4+IHN1Y2Nlc3NmdWwgbG9hZGluZyBvZiBrZHVtcCBrZXJu
ZWwgZHVlIHRvIHdhdGNoZG9nIHJlc2V0Lg0KPj4+Pg0KPj4+PiBTb21lIG9mIHRoZSB3YXRjaGRv
ZyBkcml2ZXJzIHN0b3AgZnVuY3Rpb24gY291bGQgc2xlZXAuIEZvciBzdWNoDQo+Pj4+IGRyaXZl
cnMgdGhlIHN0b3Bfb25fcGFuaWMgaXMgbm90IHZhbGlkIGFzIHRoZSBub3RpZmllciBjYWxsYmFj
ayBoYXBwZW5zDQo+Pj4+IGluIGF0b21pYyBjb250ZXh0LiBJbnRyb2R1Y2UgV0RJT0ZfU1RPUF9N
QVlTTEVFUCBmbGFnIHRvIHdhdGNoZG9nX2luZm8NCj4+Pj4gb3B0aW9ucyB0byBpbmRpY2F0ZSB3
aGV0aGVyIHRoZSBzdG9wIGZ1bmN0aW9uIHdvdWxkIHNsZWVwLg0KPj4+DQo+Pj4gRGlkIHlvdSBj
b25zaWRlciBoYXZpbmcgYSByZXNldF9vbl9wYW5pYyBpbnN0ZWFkLCB3aGljaCBzZXRzIGEgdXNl
ci1zcGVjaWZpZWQNCj4+PiB0aW1lb3V0IG9uIHBhbmljPyBUaGlzIHdvdWxkIG1ha2UgdGhlIG1l
Y2hhbmlzbSB1c2VmdWwgYWxzbyBmb3Igd2F0Y2hkb2dzDQo+PiANCj4+IC9wcm9jL3N5cy9rZXJu
ZWwvcGFuaWMgYWxyZWFkeSBwcm92aWRlcyB0aGF0IHN1cHBvcnQuIFlvdSBtYXkgZWNobyBhIG5v
bi16ZXJvIHZhbHVlIA0KPj4gYW5kIHRoZSBzeXN0ZW0gdHJpZXMgZm9yIGEgc29mdCByZWJvb3Qg
YWZ0ZXIgdGhvc2UgbWFueSBzZWNvbmRzLiBCdXQgdGhpcyBkb2Vzbid0IGhhcHBlbiANCj4+IGlu
IGNhc2Ugb2YgYSBrZHVtcCBrZXJuZWwgbG9hZCBhZnRlciBwYW5pYy4NCj4NCj5UaGUgdGltZW91
dCBzcGVjaWZpZWQgdG8gdGhlIFdhdGNoZG9nIHJlc2V0X29uX3BhbmljIG9wdGlvbiB3b3VsZCBi
ZSBwcm9ncmFtbWVkIGludG8NCj50aGUgYWN0aXZlIHdhdGNoZG9ncyBhbmQgbm90IGJlIHVzZWQg
dG8gdHJpZ2dlciBhIHNvZnR3YXJlLWluZHVjZWQgcmVib290LiANClllcy4NCj4NCj4+PiB0aGF0
IGNhbid0IGJlIGRpc2FibGVkIGFuZCB3b3VsZCBwcm90ZWN0IGFnYWluc3Qgc3lzdGVtIGxvY2sg
dXA6IA0KPj4+IENvbnNpZGVyIGEgbWVtb3J5LWNvcnJ1cHRpb24gYnVnIChwZXJoYXBzIGV4dGVy
bmFsbHkgdmlhIERNQSksIHdoaWNoIHBhcnRpYWxseQ0KPj4+IG92ZXJ3cml0ZXMgYm90aCBtYWlu
IGFuZCBrZHVtcCBrZXJuZWwuIFdpdGggYSBkaXNhYmxlZCB3YXRjaGRvZywgdGhlIHN5c3RlbQ0K
Pj4+IG1heSBub3QgYmUgYWJsZSB0byByZWNvdmVyIG9uIGl0cyBvd24uDQo+PiANCj4+IFllcywg
dGhhdCBpcyB0aGUgcmVhc29uIHdoeSB0aGUga2VybmVsIGNvbW1hbmQtbGluZSBpcyBvcHRpb25h
bCBhbmQgYnkgZGVmYXVsdCBpdCBpcyBzZXQgdG8gemVyby4NCj4+IFNvIHRoYXQgaW4gY2FzZXMg
aWYgeW91IGhhdmUgYSBjb3JydXB0ZWQga2R1bXAga2VybmVsIHRoZW4gd2F0Y2hkb2cga2lja3Mg
aW4uDQo+DQo+VGhlIGV4aXN0aW5nIG9wdGlvbiBpc24ndCBlbm91Z2ggZm9yIHRoZSBrZHVtcCBr
ZXJuZWwgdXNlIGNhc2UuDQo+SWYgd2UgKGkuZS4geW91KSBhcmUgZ29pbmcgdG8gZG8gc29tZXRo
aW5nIGFib3V0IGl0LCB3b3VsZG4ndCBpdCBiZQ0KPmJldHRlciB0byBoYXZlIGEgc29sdXRpb24g
dGhhdCdzIGFwcGxpY2FibGUgdG8gYSB3aWRlciBudW1iZXIgb2YNCj53YXRjaGRvZyBkZXZpY2Vz
Pw0KDQpJIG5lZWQgYSBzbGlnaHQgY2xhcmlmaWNhdGlvbiBoZXJlLiANCjEuIHJlc2V0X29uX3Bh
bmljIHRha2VzIHRoZSBudW1iZXIgb2Ygc2Vjb25kcyB0byBiZSByZWxvYWRlZCB0byB3YXRjaGRv
ZyBIVywgc28gdGhhdCBpdCBpbml0aWF0ZXMgYSANCndhdGNoZG9nIHJlc2V0IGFmdGVyIHRoZSBz
cGVjaWZpZWQgdGltZW91dCwgaWYga2R1bXAga2VybmVsIGZhaWxzIHRvIGJvb3Qgb3IgaHVuZyB3
aGlsZSBib290aW5nLg0KMi4gaW4gY2FzZSByZXNldF9vbl9wYW5pYyA9IDAgdGhlbiBpdCBiZWhh
dmVzIGxpa2Ugc3RvcF9vbl9wYW5pYz0xLg0KSXMgdGhpcyB3aGF0IHlvdSBtZWFudD8NCg0KSSB3
b3VsZCBsZXQgR3VlbnRlciBjb21tZW50IG9uIHRoaXMgYXBwcm9hY2guDQo+Pj4gSWYgeW91IGRp
ZCBjb25zaWRlciBpdCwgd2hhdCBtYWRlIHlvdSBkZWNpZGUgYWdhaW5zdCBpdD8NCj4+IHdhdGNo
ZG9nLnN0b3Bfb25fcGFuaWM9MSBpcyBzcGVjaWZpY2FsbHkgZm9yIHN5c3RlbXMgd2hpY2ggY2Fu
J3QgYm9vdCBhIGtkdW1wIGtlcm5lbCBkdWUgdG8gdGhlIGZhY3QgDQo+PiB0aGF0IHRoZSBrZHVt
cCBrZXJuZWwgZ2V0cyBhIHdhdGNoZG9nIHJlc2V0IHdoaWxlIGJvb3RpbmcsIG1heSBiZSBkdWUg
dG8gYSBzaG9ydGVyIHdhdGNoZG9nIHRpbWUuDQo+PiBGb3IgZWc6IGEgMzItYml0IHdhdGNoZG9n
IGRvd24gY291bnRlciBydW5uaW5nIGF0IDFHSHouDQo+PiByZXNldF9vbl9wYW5pYyBjYW4gZ3Vh
cmFudGVlIG9ubHkgdGhlIGxhcmdlc3Qgd2F0Y2hkb2cgdGltZW91dCBzdXBwb3J0ZWQgYnkgSFcs
IA0KPj4gc2luY2UgdGhlcmUgaXMgbm8gb25lIHRvIHBpbmcgdGhlIHdhdGNoZG9nLg0KDQo+SWYg
eW91IGFyZSBzZXJpb3VzIHdpdGggdGhlIHdhdGNoZG9nIHVzZSwgeW91J2xsIHdhbnQgdG8gdXNl
IHRoZSB3YXRjaGRvZyB0bw0KPm1vbml0b3Iga2VybmVsIHN0YXJ0dXAgYXMgd2VsbC4gSWYgdGhl
IGJvb3Rsb2FkZXIgY2FuIHNldCBhIHdhdGNoZG9nIHRpbWVvdXQNCj5qdXN0IGJlZm9yZSBzdGFy
dGluZyB0aGUga2VybmVsIGFuZCBpdCBkb2Vzbid0IGV4cGlyZSBiZWZvcmUgdGhlIGtlcm5lbCB3
YXRjaGRvZw0KPmRyaXZlciB0YWtlcyBvdmVyLCB3aHkgY2FuJ3Qgd2UgZG8gdGhlIHNhbWUganVz
dCBiZWZvcmUgc3RhcnRpbmcgdGhlIGR1bXBrZXJuZWw/DQoNClllcywgaW4gYW4gaWRlYWwgd29y
bGQgd2l0aCBpZGVhbCBIVy4gQnV0IHRoZXJlIGFyZSBIVyB3aXRoIGlzc3VlcyB3aGljaCBjYW5u
b3QgaGF2ZSBsYXJnZQ0KZW5vdWdoIFdhdGNoZG9nIHRpbWUuIFN1Y2ggSFcgd291bGQgYm9vdCBm
cm9tIEZXIHRvIGtlcm5lbCB3aXRob3V0IHdhdGNoZG9nIGVuYWJsZWQuDQpBbmQgc3RvcF9vbl9w
YW5pYyBkb2VzIHRoZSBzaW1pbGFyIGZvciBrZHVtcCBrZXJuZWwgdG9vLg0KDQotR2VvcmdlDQo+
DQo+VGhhbmtzLA0KPkFobWFkDQo+DQo+IA0KPj4NCj4+IFRoYW5rcywNCj4+IEFobWFkDQo+Pg0K
Pj4+DQo+Pj4NCj4+IENoYW5nZWxvZzoNCj4+IHYxIC0+IHYyDQo+PiAtIFJlbW92ZSB0aGUgcGVy
IGRyaXZlciBmbGFnIHNldHRpbmcgb3B0aW9uDQo+PiAtIFRha2UgdGhlIHBhcmFtZXRlciB2aWEg
a2VybmVsIGNvbW1hbmQtbGluZSBwYXJhbWV0ZXIgdG8gd2F0Y2hkb2dfY29yZS4NCj4+DQo+PiB2
MiAtPiB2Mw0KPj4gLSBSZW1vdmUgdGhlIGhlbHBlciBmdW5jdGlvbiB3YXRjaGRvZ19zdG9wX29u
X3BhbmljKCkgZnJvbSB3YXRjaGRvZy5oLg0KPj4gLSBUaGVyZSBhcmUgbm8gdXNlcnMgZm9yIHRo
aXMuIA0KPj4NCj4+IHYzIC0+IHY0DQo+PiAtIFNpbmNlIHRoZSBwYW5pYyBub3RpZmllciBpcyBp
biBhdG9taWMgY29udGV4dCwgd2F0Y2hkb2cgZnVuY3Rpb25zDQo+PiAgIHdoaWNoIHNsZWVwIGNh
bid0IGJlIGNhbGxlZC4gDQo+PiAtIEFkZCBhbiBvcHRpb25zIGZsYWcgV0RJT0ZfU1RPUF9NQVlT
TEVFUCB0byBpbmRpY2F0ZSB3aGV0aGVyIHN0b3ANCj4+ICAgZnVuY3Rpb24gc2xlZXBzLg0KPj4g
LSBTaW1wbGlmeSB0aGUgc3RvcF9vbl9wYW5pYyBrZXJuZWwgY29tbWFuZCBsaW5lIHBhcnNpbmcu
DQo+PiAtIEVuYWJsZSB0aGUgcGFuaWMgbm90aWZmaWVyIG9ubHkgaWYgdGhlIHdhdGNoZG9nIHN0
b3AgZnVuY3Rpb24gZG9lc24ndA0KPj4gICBzbGVlcA0KPj4NCj4+IEdlb3JnZSBDaGVyaWFuICgy
KToNCj4+ICAgd2F0Y2hkb2c6IEFkZCBhIG5ldyBmbGFnIFdESU9GX1NUT1BfTUFZU0xFRVANCj4+
ICAgZHJpdmVyczogd2F0Y2hkb2c6IEFkZCBzdXBwb3J0IGZvciBwYW5pYyBub3RpZmllciBjYWxs
YmFjaw0KPiANCj4gLSBHZW9yZ2UNCg0KDQotLSANClBlbmd1dHJvbml4IGUuSy4gICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQpTdGV1ZXJ3
YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwczovL3VybGRlZmVuc2Uu
cHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fd3d3LnBlbmd1dHJvbml4LmRlXyZkPUR3
SUNhUSZjPW5LaldlYzJiNlIwbU95UGF6N3h0ZlEmcj1ucGdUU2dIclVTTG1YcEJaSktWaGswbEVf
WE52dFZEbDhaQTJ6QnZCcVB3Jm09RGYzSjNaUmdhN1h4Y2dVZEpPcVlWTUotQUxYNWpDM2VpSUk0
WWhzQWRDNXBZaHIxeHdjcWJ6aEl5Nk1DRXF3cyZzPXliZ2x3LVdLNFZHRThnSEdOd01yQzFfVmxp
T3Y3MnBqRExFSW05RkZfZEUmZT0gIHwNCjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1hbnkgICAgICAg
ICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8DQpBbXRzZ2VyaWNodCBI
aWxkZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1
NTUgfA0K

