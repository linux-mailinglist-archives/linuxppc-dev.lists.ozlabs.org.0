Return-Path: <linuxppc-dev+bounces-6585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912CA4A47D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 22:02:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4LJV0KzBz2yVb;
	Sat,  1 Mar 2025 08:02:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:d409::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740762609;
	cv=pass; b=l1WoBsyGDWogvT24rQUei8EblAA/7f3F8+twsQEOz0q6wC/gDiB6Q9GD1ki8rfDdgSn0Es1EqYDAvFdY9Gz58APqfLTcWnBsCjcx9eLNpa3P2A8S6L2Pz/Xptt2kx2sUWvRKCuDw5QInVXlQpG0InfRKD5tGe+Tw3YSNXrpg5Ojjd/vcezHziq0clGdIK+ag2RI+yYsJ24qoKm4xl+RqAbSXr1yH5Sx84Cy2OcSFLbOPk+ydRlW0NwcfjAd1KPUxS9kKjXCVqPYgtFcC9u4iDSKDpC08IJwh25mUlJa116cTq9mCaiNlVOaSvf3MiAwbQ+XwWZ1dgCJ51mQzFFZ9kA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740762609; c=relaxed/relaxed;
	bh=353dHU/dcH1oQNEjAxC+mEVGV4fL2hyz2Spx7RZ3KFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rnpe/BKZru6pm7g7h7p+c4GKX0hOWEHdpmndgvZ5Exmj/fnuEz2Y6VwB8wfARr0qurMqtjOybSfO+XwEvzg/GIJvjBhQwspfKFtPE1AE+KtP5Jh2CAAE112Ne4Qj5Xi+pNWDRN0Yj7qI1HQusluf8YYLf0sFf2T0eiW5qwX5PVzNk5iTOz0/R4HIzW4FInZUX2bVj4m4ayaiqNcuWIS0ur/U8sU4iDMbom3pzEK+aZiXiMhHawl89UYVM1XxVcFkjN5i4j9ogV6SJKImyl6tVgk00lT+P0baVnhNjFztJxHU23wLsyYWiEIAPi+rywq7QVssirs0G9IIwDaDjI7BMA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=live.com; dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=krsR5jHC; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:d409::1; helo=pnzpr01cu001.outbound.protection.outlook.com; envelope-from=gargaditya08@live.com; receiver=lists.ozlabs.org) smtp.mailfrom=live.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256 header.s=selector1 header.b=krsR5jHC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=live.com (client-ip=2a01:111:f403:d409::1; helo=pnzpr01cu001.outbound.protection.outlook.com; envelope-from=gargaditya08@live.com; receiver=lists.ozlabs.org)
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn190110001.outbound.protection.outlook.com [IPv6:2a01:111:f403:d409::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4F803strz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 04:10:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQA65UIpDsgPbdG08Ro+Z5ARCSJwwwMljnJj/uqzhOiyeVpaiOPpGAdQaZf4InWIkYkJ5uHuHCGUMgx2HRhuC5cwVCB6ZTmw9xF9dKHm8s4LbcV4VZkDYBYYO+8AJQ7ei3puCGjU1MWuwOnwpyN1JYY0D5b+oA8VChRmdMK8ZQyOp4xn/Z92eouRi7PfwBmrv9x+L9cCKelk3NInlEfpVpVe21Kdhmtm/isor0CksVZPDXJ4INflbV+KxQy3/H5+vGAm8nuEmgi/m6/HqjKHh/nnjQ4JZKUWZWTU7aNTNU/+6op6bsLUXURG7al9K21IfEtW66RF2zi5xmWX8Xwo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=353dHU/dcH1oQNEjAxC+mEVGV4fL2hyz2Spx7RZ3KFw=;
 b=thzV7t8bIoRTGflFEvYsnNleWLH6nAo5lyH7LPsKIKkLdfQjmFHpcG+34HwFSAYx4hVHk5H4z6j4ZMPGADRPA2COo0uV+7HZXzJWtxjLEWNBVEBmlgqRlSoX6XitJWLqhICOeZVxk3GeIkhLhAh8NKpfFi5zoVqnY94Or6QQaTDZ94ERpRwS2XuXbf7nmjbXueCLjib7Grd47CcqPqgeSluED+Q4F1JPGwo6ggAggGogB25NcLxai+TnOA16C6mwZtmd7ORap28uM6ek446arg5jitTyDLEUlgKqALmSE1bL3+NGedMInWBL3LFjVN8/6NE+oFjODJAi67QbRWdOIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=353dHU/dcH1oQNEjAxC+mEVGV4fL2hyz2Spx7RZ3KFw=;
 b=krsR5jHCbsponi+/ZNOoS0kDkTvMs6fcq7QnmkaU4rJYJcPvd5+xHzpK5H0jfnrhn9KY4RrtYa+toU+8y5kncwts6Pue7xQtg7KSR82RdmN3KhJr92LRoaDW4lUHd1e04Y44P2bVz/3nhf+N4fa0nrJ1yjLKied+94S0SVVz8aiSCGwAf8thIQwNs9jIlwzbPNVwYcZnV7e07gM5c7fI/B7wavSBIzSxmENzSc8DubyfrKF1IJhNRAi0xSE9codhzRGg+xBWtp+xwEPDniHK3zsViFtwih26ib1MWK4U1pQUMUlAQWoJXCOadLWCq2Mot3vLd+PS9Iip+HLKEUBWTg==
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10c::9)
 by MAYPR01MB10715.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:157::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.24; Fri, 28 Feb
 2025 17:09:36 +0000
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa]) by PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa%3]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 17:09:36 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "castet.matthieu@free.fr" <castet.matthieu@free.fr>, "stf_xl@wp.pl"
	<stf_xl@wp.pl>, "b-liu@ti.com" <b-liu@ti.com>, "johan@kernel.org"
	<johan@kernel.org>, "heikki.krogerus@linux.intel.com"
	<heikki.krogerus@linux.intel.com>, "valentina.manea.m@gmail.com"
	<valentina.manea.m@gmail.com>, "shuah@kernel.org" <shuah@kernel.org>,
	"i@zenithal.me" <i@zenithal.me>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] usb: replace strcpy() with strscpy()
Thread-Topic: [PATCH] usb: replace strcpy() with strscpy()
Thread-Index: AQHbifJsk9kt+6VW20O5GBlEUknWILNc8R0AgAACEhc=
Date: Fri, 28 Feb 2025 17:09:36 +0000
Message-ID:
 <PN0PR01MB958840C7836018AB49819981B8CC2@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
References: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
 <2025022833-unawake-barricade-7bb8@gregkh>
In-Reply-To: <2025022833-unawake-barricade-7bb8@gregkh>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9588:EE_|MAYPR01MB10715:EE_
x-ms-office365-filtering-correlation-id: c0c8cd51-9519-4e21-d4a3-08dd581aad8d
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|8060799006|461199028|15080799006|6072599003|7092599003|440099028|4302099013|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?dXprVE04ZDJvTWpvbS9BVmVSSm1tODFNSTlQOEZvdFNEazhLV0czdXJacXZX?=
 =?utf-8?B?OVlCRThYTTJ3OFphNlJuTktvMERPMjlyM2cvVVBkeDVFaEZycmd4S3ozTGk0?=
 =?utf-8?B?dWhVQXhJV2RjeWhyWUpMcmhpUHcwNW1wWGtiOFlDSHQ5R09GcW14UVZFRGxR?=
 =?utf-8?B?UkVmUmZKNVFkV1ZWU0NoazJhTmI5b0wvRVNQcFc5SC9YRkVmczNhcnVyeXI3?=
 =?utf-8?B?U1JZVENQcjRJWUUzdWl2eW1rWWlPK2VQendTWEphOFh4SjY1a3BhVmRBWXkz?=
 =?utf-8?B?T3p4eGlnalRMb2JKbFVYTnUwRSsyRTdjR3hhazN0Yzd4dFFLUmdEcGhxQzlG?=
 =?utf-8?B?WVVCTlg3YjFVNFk4UlRPYkc4Q3RDUjM5dSs0MEpsWXdJUVdnTTMyUmZLSnZs?=
 =?utf-8?B?Y2ZCUHQvWUN1Z3V4cG1EVmlCc1N6b1p6R29EQkZubkYzc1UwaklYMGM0SmEz?=
 =?utf-8?B?dE4weks4eTQyY3FPblFxUzZ6QjdiS1VSRW9zbi9CL051MTlZYmlIdXhPZUNW?=
 =?utf-8?B?MjFrSllYQ0F1V2hiNXJwQWl5TVd2NGVWNE05NEdmcFU0S2d4Yk96d3ZtYlpE?=
 =?utf-8?B?b0ROUWdkcm5xaENiWlNUY2hpOFhlamVxcjNUbWF6bDlmb2t4c0orYmJsT2sr?=
 =?utf-8?B?dUVGQXFPZ0RpYVVwaVpBZjF1UVBITEdEMTIvTWVMZzZaL2F6UVRldEZZSzdG?=
 =?utf-8?B?OElod1YrM004czMxeXdoSEdFbVA3R0hFUzd2SWV1VWJxRUZ0SzllSEozdzFW?=
 =?utf-8?B?RW15TXFzSlduZUV0aTg2WHBCdWlJVUE0cEJzQ3Y4dGxGdFBUVDhIbW9ocS9H?=
 =?utf-8?B?VWlYN1htZXRzQy8yMDkrTHJmUTFGOFB6L01yd1dIT2laZ1RlRWxlY0RvTmY0?=
 =?utf-8?B?dkRJNlVueUl1L3BjUHF1b3Yvd3h1MWdTUkV0WWtjb2Z1VGUrSkRySDJuSHBQ?=
 =?utf-8?B?RHpnZjNRM0dpekhOSEFkNnNoQzN2Qll1Y0Y4ekJvdk0vNEpoTldnSU41RStQ?=
 =?utf-8?B?RGZleHJRc1dVenhYZlJEbjlmNkZVV0hqWFhMMGFxWm9IQ21WT0M3cW14eExR?=
 =?utf-8?B?SHdCbkhNRDBwRVhYOGhnUzdUZjlwZnQ2NUIvWStUSG15amhDdVZqclppQ1pR?=
 =?utf-8?B?R1RSbGdBYnpLVWlQSHRqRXBEQmhHb1BtU1JRZlg3TGJVOXVGR0x4bHozM3BX?=
 =?utf-8?B?WEdVUlpuSHAwOU1hcFBhUTRGMTgwZnlUSzNoZmNPaWROOFBFcUdkUExEc05z?=
 =?utf-8?B?ZmRFeUhTTW0wd2xHbk93Yy96RzhrQVVCaitvVC91NTV6aEo0WlN1WnBGMnJ1?=
 =?utf-8?B?NE8zMTZSOGxXWnhyeHBXNGhaNmdMOVY2cW1ldWUvRUpJaDVXcVRUR0oxZ0pi?=
 =?utf-8?B?MC9QdWsxdTk1Znd0WGR0UmZDT1FFMTBYOWZmeDdPbUdxQmtNa2phY0pyRnB2?=
 =?utf-8?B?YUltNHF6UDdjWHRnUEIvNVdudXh3Y3liU0dkTGhzaG12dlBHZzZZS1d6OS9j?=
 =?utf-8?B?TTF3d2RDN2VyNFVrY0ttVVM1M0lpcWl3RjNBZlRQUFJtQmlSSzBxaVBTTlNG?=
 =?utf-8?B?ek10elZ0a1RUby95aTl4K2ZkYnRTWXkyYXZSTDRSSndIZGlsd3lzb3cydU5H?=
 =?utf-8?B?UlJuSGEzdDhTejBaZzU4T0pzYjJ1VVE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WitPaEtRK3VkendBNkJCMWxobTZpZ04vSndCSHJubUtNTFo5aUxIanRxNWNp?=
 =?utf-8?B?dmlYRzdMeCtnUTBFSUVoZkpiNlkvRjNmaFVjZzZiT3Y3Um9LOUNUQ2N3YlBK?=
 =?utf-8?B?NXFmNVdhNGhpRU85MGIxT0R2NktqOEkxVUFHbGY2a0huSUJoanJEZnQraUF2?=
 =?utf-8?B?d3hRT0o4OTM2UVh4U2thL3liRVY1OFFHV2JRZ1VaelNpWSs2SmVWK3lKSEx1?=
 =?utf-8?B?QktwQkNEZjBINlFKSXR2MzQ4b3oramFQTk1SQTljMGMyR2Z5dDJwNnpUWU5I?=
 =?utf-8?B?aFE4OTBGYkdCT3F4eGcrSHhkZ1d5M0cvdytmTFB2dncvMzRhQThDMDJidG5s?=
 =?utf-8?B?SU9VYUJBbFg4VFB5elh4S1FJRzQxOFRJMFVxaDdoSUFjOGN4N21rb1QxRmkw?=
 =?utf-8?B?Smt0VGRJTU04NHJEUjNOQnl1SFBxVkFvY0ZZY2c0dGovdUYzRFpzNDZDV09Q?=
 =?utf-8?B?L1RibkdDQ3BYaWVFeUlIWlJlVTNRbWhXK3VuSnVsaTVIWUdvWFhOTTFqWXFu?=
 =?utf-8?B?UWNHZGIrTm5PZ2RSQ3VjajlTU1JhZXlML29FanpBMkhTRDRiRVJGVlgxdUdt?=
 =?utf-8?B?WHUzeEJxZVRsZlZvWlhpK3NxL2svTk8reTBPRFdDQTVvVWVjYnpkcjhtTkpq?=
 =?utf-8?B?UjIrZFpoS25jZGVHRmQwK250c215dWNTZ3R0QUp4OE1jYUY2M3FkMzN0bWRK?=
 =?utf-8?B?Vlg0ZldsYkVvcjk2QUViYzF3T20rWG9vM0kwZ016Qit3V2EwdCtGNUpQS2xY?=
 =?utf-8?B?aXdFOE1HeFhrS2VjaXgva20wN1BURUJQWGhabkswTDMxaHVlNHRtZnBnNCtY?=
 =?utf-8?B?a0FQNnFjMnRzZ1dqYnN3cHIrVFpCTWl4TFZVb0QyQmtHMzdBY0h2KzV4WkNS?=
 =?utf-8?B?ejREdTNjR3ZPc1Vic3JvNlFlYjJiMVNRT0N3MmJNbXNIQXAvbnJPYVYxaWRm?=
 =?utf-8?B?ZjJFMjBlWk9zUVJicThrUVZyMmFaTGh3RjIrbkFwTkZEQXNsUXNITStTQTh4?=
 =?utf-8?B?QWw3R0FiQTNOVkdpZkZXUWdnUkpVNHU4THBnbkJGYjl1cExlRklmZ2dVSmFJ?=
 =?utf-8?B?NDYyUzV6M2RZZVRFeFJweEUrYkFPNDNNR01VUkI2aG5LY1lPVHhXZWE4c1hI?=
 =?utf-8?B?MWNYaEczUDhwSk1LT3o1TTJOZ1RLN0N5bDdJN2huTFpLazBuSlE2czlkdUZj?=
 =?utf-8?B?amljZmhrbWVJTFFhUnRlOHhvOStvZWJnS3l3SzNlcUllczgrN0tVejh0TnAy?=
 =?utf-8?B?ZVlhakhYQW5HenBCLzJVbU9DNERIMHV0RUkzbjFwWFlHcWR5R0JsUXpMOTgz?=
 =?utf-8?B?OWJMWTJGbXU1Rmw3WE1vbnltUUgwODNlamhydllsRlh4QTMvTTV1alErN2Vp?=
 =?utf-8?B?dXAveThNQytrQ3NxcTgySFVxM3NPOWRnd0tacDlrSnFwTThJR1MvR2JiVjFQ?=
 =?utf-8?B?RVByWS9Jc2Q2L3QxZzZiSytPdTZrMXM5Q1FWK24ycTFaZHE3UkpabjJIb2pq?=
 =?utf-8?B?S2VQUFJNT0R3THRKaUltV3VSNHZyekRlRFBHWWV2Smp0VEpiaEpKMVVMdG8v?=
 =?utf-8?B?WVBGMnZpVTNWRDU4aGNGT1dGSTFkc3lTdGRhSE03NkNYZitJSlhmWmdya0hn?=
 =?utf-8?B?T1hjQ3diRUQzckdCeUVrejVpQ1ZqMnRvSWlEbmdlMm5XUEdQZ1JpeEJuRnpY?=
 =?utf-8?B?K3J3VmMydXQ5STFiWW14aGtwSWlUZHpMVkh6RnlUV2szSG5DbHlKOWR4eXkr?=
 =?utf-8?Q?wfaqVuzUGSefKfq5gY=3D?=
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
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c8cd51-9519-4e21-d4a3-08dd581aad8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 17:09:36.0247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10715
X-Spam-Status: No, score=0.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DQoNCj4gT24gMjggRmViIDIwMjUsIGF0IDEwOjMz4oCvUE0sIGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnIHdyb3RlOg0KPiANCj4g77u/T24gRnJpLCBGZWIgMjgsIDIwMjUgYXQgMDM6MDc6MDNQ
TSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9tOiBBZGl0eWEgR2FyZyA8Z2FyZ2Fk
aXR5YTA4QGxpdmUuY29tPg0KPj4gDQo+PiBUaGUgc3RyY3B5KCkgZnVuY3Rpb24gaGFzIGJlZW4g
ZGVwcmVjYXRlZCBhbmQgcmVwbGFjZWQgd2l0aCBzdHJzY3B5KCkuDQo+PiBUaGlzIHBhdGNoIHNo
YWxsIHJlcGxhY2UgaXQgaW4gdGhlIHdob2xlIFVTQiB0cmVlLg0KPj4gDQo+PiBMaW5rOiBodHRw
czovL2dpdGh1Yi5jb20vS1NQUC9saW51eC9pc3N1ZXMvODgNCj4+IFNpZ25lZC1vZmYtYnk6IEFk
aXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+DQo+IA0KPiBBcyB0aGUgdHdvIGZ1bmN0
aW9ucyBkbyBkaWZmZXJlbnQgdGhpbmdzLCBhcmUgeW91IHN1cmUgaXQgaXMgc2FmZSB0bw0KPiBq
dXN0IGRvIGEgc2VhcmNoL3JlcGxhY2UgaGVyZT8gIElmIHNvLCB5b3UgbmVlZCB0byBleHBsYWlu
IHRoYXQgaW4gdGhlDQo+IGNoYW5nZWxvZyB3aHkgdGhpcyBpcyBvaywgYW5kIGlmIG5vdCwgcGxl
YXNlIGRvY3VtZW50IHRoYXQgYXMgd2VsbCA6KQ0KDQpUaGF0J3MgYWN0dWFsbHkgYSBnb29kIHF1
ZXN0aW9uLiBGcm9tIHdoYXQgSSBjYW4gdGVsbCBmcm9tIHRoZSBrZXJuZWwgZG9jcywgdGhlIG9u
bHkgY2FzZSB3aGVyZSB0aGlzIGNhbiBiZSBhIHByb2JsZW0gaXMgd2hlbiBzdHJjcHkgaXMgcmV0
dXJuaW5nLiBXaGlsZSBJIGRvbid0IHNlZSBhbnkgc3VjaCBjYXNlIG92ZXIgaGVyZSwgSSdsbCBz
dGlsbCBkb3VibGUgY2hlY2sgaWYgdGhhdCdzIHRoZSBjYXNlLiBBbHNvLCBJJ2xsIHdhaXQgZm9y
IHRoZSBrZXJuZWwgdGVzdCBib3QgcmVzdWx0cy4NCg==

