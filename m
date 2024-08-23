Return-Path: <linuxppc-dev+bounces-408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 974C595C552
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 08:20:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqqgM3TpXz2yXd;
	Fri, 23 Aug 2024 16:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2613::622" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724394015;
	cv=pass; b=PBaZZOITgrhV2z5Ztei+BZueUzPB0+837A8G6XGQSLA0s7zXU6+0/nbJOWYxhD7oz37MPOlEJGz63dbUF3rraw5GketZXlueHVYL+4/W/PPN/yUuyiNsHwUrw+hcIfjwfnTCVdud9WtX/VfrMAckiBYRbscPfReg7V11VubYHe4Fmym7/brL/Y8CkrMkqjcFHBvDXo6Okh2Ubh9oiJEQwR+37qz088GAjagrBMq6Bwz3HmqkpXAJdlPWiA2cktXFmLHW053XNGSdnHHJbn1Dz32lCtMOus6F7jYYtOQBrclay6+N+WsZCjjyfdC/ME7f8fpjvX9ubZrswXmNYCVFQw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724394015; c=relaxed/relaxed;
	bh=lsQ8BfPIqOyZWyy6LLTLH0yEG+6xVUj4BIUd94h18rc=;
	h=ARC-Message-Signature:ARC-Authentication-Results:DKIM-Signature:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityhea
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=M5d+bJ7b; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2613::622; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=M5d+bJ7b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2613::622; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20622.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqqgL4N0Tz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 16:20:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acTYA+7bVDDlsWs0oGVtlf/iirY6AhWPQPU4unBc92fbrV6J7H0/LVmSihh+lyEH+f148mkN7oYP7IMZLsz1CY6GJYCllOcHTiw82KJkzkFr4CnvpD6xpPvoEO6jJWAi4Uvqn50WVaMYtOgDxcGCOpTyjJKx+Qfdy6ihjN+68C9p4/UPmlvSLTMg6mpGZ/3J5FW/IRBYB/38d41sg8VAE9675Y0Q8MBvbGoG9Ru0v/yc6FGj6QpMeUMYTQjB24XnZ7LgbqocLPEgtQHrWROdLPqSUYQ3rvSG70Znd/y4gS4dDEtfmGRRXDWkpyg5x3iYz1Obzu9rMsNkmLRRwCkmGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsQ8BfPIqOyZWyy6LLTLH0yEG+6xVUj4BIUd94h18rc=;
 b=raWWGgqNxeJL0pMM23jMD1Rw7XpWSEmnxonzxQli4zjQ3lYdV+YyBgD2tPGILJ0hoAWAZtv38+75vSjSPF1Y1rsULxSm8xakhyuq0jYFbJxXPONE9nAKJzNzrPVjdL8z3GvHJvAnQu1DpFbD6ZjeWAWUDGLKyyx4+pCANzfMliGAW/d7kAlVmJ/YYi5iZjwhSdcrA4WdQ+gYFo+VnAmJODyYHrYo//HV46FmiZ6CNpuTNZBn4ZwexzJZYsi9IAjfYR2XluQ+GSL6qktOTuXx1z1rQmBj7LPkz+ZlsAPgAty0Omq0tyPoG9XtDjl48QYCl//l2TIUKwpx2H6VMIsZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsQ8BfPIqOyZWyy6LLTLH0yEG+6xVUj4BIUd94h18rc=;
 b=M5d+bJ7bSml1jnuYcdpSQNrqEnuD2ePPrx/hIGGg93MYOFqGYi2j+LvTvFWNrkTvu8fRr69StZdfpAa8Frm6+kuewsuahhBgAHwV7/XZ9CL0ucjSd8jTGvHm1IlnXcO1FJ9QUUQPcITcBb/lHVJsoEhUJb2QNR0EXtkozM1192JKUQ2O6dCxjlAueqid4bbeFWztya96voljnIEO7QpjyNw8R8U7EoPOZXx/oGS0GzVtpwbAwYoDC9o/pYqfcswSYaEoUSDMECq168/8RrwQ3tfTKAcrzFSqchNkevdwy9apw+EcFjg22uFdWyvqB0izWClUizO1pNv4YE+3jyuS7A==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAXPR07MB8556.eurprd07.prod.outlook.com (2603:10a6:102:24e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 23 Aug
 2024 06:19:54 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Fri, 23 Aug 2024
 06:19:52 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Peter Xu <peterx@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>, Oscar Salvador <osalvador@suse.de>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, Dan
 Williams <dan.j.williams@intel.com>, Michal Hocko <mhocko@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alex Williamson
	<alex.williamson@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, Alistair Popple <apopple@nvidia.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>, Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Thread-Topic: [PATCH RFC 2/6] mm: PGTABLE_HAS_P[MU]D_LEAVES config options
Thread-Index: AQHa2JUJlWxXufeiak2xn74HyFoRpLIzvnGAgAAgGICAALk5gA==
Date: Fri, 23 Aug 2024 06:19:52 +0000
Message-ID: <d3e4256f-253a-4a61-a83b-93f50ebabed8@cs-soprasteria.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
 <20240717220219.3743374-3-peterx@redhat.com>
 <dcdde9fc-7e7c-45a8-8dc7-7f7ed13b81ec@cs-soprasteria.com>
 <ZseOp7M9AmZtW4jw@x1n>
In-Reply-To: <ZseOp7M9AmZtW4jw@x1n>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAXPR07MB8556:EE_
x-ms-office365-filtering-correlation-id: 74db3cc2-5d1a-4a79-7024-08dcc33b999b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TkJGRjN6MnAzMVd0R2ZWdFZTdFJ0bk5uaWROQ25SdkFwRmFueFRYRW1rVFdE?=
 =?utf-8?B?WkR4Vmd0QVJuSTFEVXpuUjBDODYrWnNuNmVUeDJBMVAxOUhEQmRYK0VacVJn?=
 =?utf-8?B?YnZzMHBydWUySHVEa1oxcUtzb3Z5d08yd3J3Nm83TGZFRnhwTWFjUFBtN3Iw?=
 =?utf-8?B?VTRhS0ZVbG93djlQVm50YlovVUo2aUNjWU5DeUNENmlWbW5UTkhONUM2TnI1?=
 =?utf-8?B?UTFLY3d5Z292aVhsYzJPZk0vS2JBSVdPWGMweHh3Qk54RDVhMkVmbytLZ2pF?=
 =?utf-8?B?NE8vcitFTWZhdkg4WGltZllIckhlenlTZ1NRNWJkbnlkZkhYTkxHbGJqbUt3?=
 =?utf-8?B?VTd0WHp2cUZyTnZabVl6WG5iK3JLZ1RGQUV5NGhkSnF0bWpBdGFtQ05Ld0Z5?=
 =?utf-8?B?Tk5UeXBMcGQyQkcvdXhFMTlmeHpRb3loM2FpcWFObVJMY0IxNlVxR04rR0Mv?=
 =?utf-8?B?Y2JlUkVVUEkzL0FaZEJnL3o1S1pySXo1azYvNlJnVkhHNEFGc0F1MG05QmdP?=
 =?utf-8?B?RWM4U1lxRUVhRXVuSzBHcFlxVnZCb0tEMTZhK0kwK25ZWFBuV0duclB3Vmw0?=
 =?utf-8?B?dDBhN0FLSjAxaU9Bbm9jbFBzbkhmQkdRcTA0R3diZEwvZ21NYlJlN2lOTHFq?=
 =?utf-8?B?QVJJNDQ1K20vVTliTXVjdlFHL3BiT0M0V3BPRFVmcXUzVGxOR3F3aHpVN2pr?=
 =?utf-8?B?ZE9KS0E5dnRLa1gxTzh3eEV0UlVQRTJheGpLYkMydXN6ZlZUS2MyYjVadkl4?=
 =?utf-8?B?R1hkVG5mU0FvYm1NYi9GU1B2YVVRU0NIWmprRXJHS3J0QXhYaXlTYXhrMS9y?=
 =?utf-8?B?RnhKVFFNK20xejh6Wm44RVNObUtEOGxBOEhubEVRdDZXZUZTRVlKL0g5aEpL?=
 =?utf-8?B?Z3VsWU9VcUp1ZkgweE9tdklBRnMxcXN1dFV2SDZYM0Q3VUJhSHEzdEhuaWtB?=
 =?utf-8?B?aDZhdDZGc1BVeEVQZVh3QlBVb3o3aFNSOVlodG1wM0Q1WlpmVktFS1pyYkN2?=
 =?utf-8?B?UlppZm1GckVid0Jvd0R3dlFhd2dOcUMxRk5FckJGVWtCMG1renVNSFVYdkQv?=
 =?utf-8?B?WlNSbDQ3Tk9nNUhqVkdKeEV2QmxpN2p4aXlqVWpDMFQxUVAvOG1sMmorcitR?=
 =?utf-8?B?ZC9uQ2tBalJhbjBSVTdsaGVodDc2S3JoVFgxUjVyOVlhdnRGRkN4Y2xGazhq?=
 =?utf-8?B?cW51czdpV0ZHMTMwZ2Y3QlhDVFJCaElKRmdQNC9GakdKMnNkeDY3b2pub2dV?=
 =?utf-8?B?Qy9KeDRxeGtDM2NZK0lQOHlYVDM2L0g2Q0JWdEkrYmZUZFpzT2lpZ09wTWIr?=
 =?utf-8?B?Z2V0Q1ZlN2k1VnNGbzdVUkpZSlQwekdmWUdhdkRGSUQyN0JWQWZZRzdMNnVZ?=
 =?utf-8?B?d1VkQU1ETEYyTVI2U3dUYzFDYmJ0ZmxHQUg2K3B3TVpMUG50MlFUWGI5Yzlv?=
 =?utf-8?B?RXY1T0tjODM1R0tRajdta2FoTTZzeGZ6M010emFodmlMZFl1R0tPQU10NldR?=
 =?utf-8?B?L1c1TWJ2OHdpM0E1N3hVOGtRbDZnalRqcHgzMXV5NFBWbjU0RC9HMExBcDlK?=
 =?utf-8?B?ZU00U0NaUXNRcnA2ZE43Nnh6eHJqY3JaejM3bUNDZitqMGMvV3BJSkxXRklF?=
 =?utf-8?B?N0lPc0xpbDg3UzlHb1lCamYrY3dRQmF5UDRtbmY4U2RIOGtsU01kOU1KRk5F?=
 =?utf-8?B?WTdSRlJPLzZaK1dvbWcwK01NY2Z1SEE0VWlEangzajQ1QmRQNXE3TW9yMWRO?=
 =?utf-8?B?amZDRFZIdEMvZ3pnaERzTHNjRHdkdW45eFl5RC82akIzUHJBdmwrcG83TGtw?=
 =?utf-8?B?OFRoMTFmNDNHM3BNSGNab1A3OW13SWpWYWVOTmQyUWpEN1h4SGU0ODY1ajFa?=
 =?utf-8?B?OExIRFdQQnoxMU9KNHlES041K1M2TyszbjdhN0xRMVFwQlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ui9qRkRSeVlEU3lrU2ZJMHkrQ2UrcGJNM2xHUDEyeFhlUzZFU1VWK1ZBOXpW?=
 =?utf-8?B?ZSt6dG12YmFpUGovQW83a3cxdEVuRzNacy9lazBIRjdGSWJ0VytVb1lyREsr?=
 =?utf-8?B?QWpTa2lRdWVINElXYkJ3M3pGNEZ1RmJCa0x3SFZZL1gvKytxaE1BVnZsUlhC?=
 =?utf-8?B?eFR1QmcvREYwWXoxdmtPRTBMSEkwc29Gc0wrTGhxd0JzWjh0RE1DRVF2b3Fq?=
 =?utf-8?B?S3l0dmlFcGxNaEpQVlNyZUpTaDVsSGJ0bTNpM1dlakNaS1BGTlU1ZkI5VUFl?=
 =?utf-8?B?SVM1U3czRitUUU1FcWcxUWhYUHZvVy8yN3lsZHV2ZFg5MUJIUTZHdHRZNXph?=
 =?utf-8?B?eW0yRmdKRC9TazFYR0hBcUtDWlQvcERaVlE1RjErUmE4MEpXRHhxUlQwb2tW?=
 =?utf-8?B?TEZ6RTJyYjFLejExbUFGdlV3b25uR0UxL3k1L0pjNlhZUVk1cUxjWHhxQ2pB?=
 =?utf-8?B?MmVIeDcvZjU0aFpCZFJ4MGxlQ3BRSmVhWmV4NkJWcUxCQm42WFU3Z0dXQVI5?=
 =?utf-8?B?aHc4MEtmbnBCRU1LRjNlelRPZXNtYVdoWVZCc3dSSllKelpIci93Wk90MlJm?=
 =?utf-8?B?NkVDa1h5ZUkzVXpvNkhtZnMrN2h6S0t1TjAwWTBSQUdqQjgxSzh4NkZHVXE3?=
 =?utf-8?B?SnNia3FjR0dRakt6amVTQWtZTHVldDFpQjgxTWJURkoxZ2htZC9EZ2RIV3Zn?=
 =?utf-8?B?eW1IMzUxbXVEY3lrN0xUcnBaWGJJQ3FoTlBqMk1FdUFKZWVya2RNY3MzRUZl?=
 =?utf-8?B?WWZteHFxZkRZOXVYdHU5bUVKL3lINWR1RjM5eFlJcFZtTlBFRDhUV3ZmbnBM?=
 =?utf-8?B?ZXlTSjVySENqM2lsSFJ2STA4RHR3dWVDRCtBZzBjVzJtSkFkNDl3dGt6b0ZO?=
 =?utf-8?B?TnNlTWFpNGs1aTFyN2ZSY3Zjdk9vQzFiaUQwZ3UrYnNjTU9IcTJJYTQ4Tldm?=
 =?utf-8?B?V083alBob2QwblViSDgvNERvUHpRbnpaMncvcC9WV2ZkNmhJWFJ6azJRSlJq?=
 =?utf-8?B?QllpdFdhMEdZQTd2ZEFzb2FFTFZSRm85UWJnVUFWL1RaOTFEamt6bWk2RG1Q?=
 =?utf-8?B?ZElBb2NpbGt5TGVWM0s3cG4ydGs2M0hhbnpZZlZxWG9PaU1PMHIvWjRUSTNO?=
 =?utf-8?B?emVHZmlTeXMxTVhaU1RUb01tcVc4Zmp3M1ZSY3NSYVhBSGQvSzhhcWhvM0U3?=
 =?utf-8?B?SzBwVGJVWXd3cXNDZDMzNHVLd1hhNzdEWjNwMEx0RlFHeFBWQkp3aXplVDRP?=
 =?utf-8?B?VkFETWQ0SHhFTzlrT0Vrc3V5ajJsc0QwaDJCamc3ZkgwWk5TSk1PeE4wV0JC?=
 =?utf-8?B?OE94aHk3ditLL1Z6cGtYMzFpdVNMMExHWGRoY2JBTWZOV1ZNZkZTaTRFTTNK?=
 =?utf-8?B?c3NPVStMeHV4UWdvazV6dFhCM3cvM2E3TVVXNWJFZWdFWkF5eHpLOFkwOVc2?=
 =?utf-8?B?bWZ5V3BHRlI5eHd0VFlDSitLNDRGd1VZMTNnU25hU2s3ZWhONG5vWU1CamhO?=
 =?utf-8?B?SGJ5aFEvcTU0MGFSMnJlMnZwUVBZYVJDajUvakZLb2pZdmY2L0svYXNRZVNS?=
 =?utf-8?B?NW85eHJVSVFFTmtGM2xScXZiY0lpZ1dGWlc0eDB2U1VTWlYvb1BQTURFVlVX?=
 =?utf-8?B?UjBWZEVyYmdINWNQZXB2aXlCYlVFNC9TOE1rUWFTT1M3ZFYwcXE4S3lFNVph?=
 =?utf-8?B?dTFMdkRkTWdpcDJxQi9COUY1V01VWkphL2xVQ283RHNwQzlPY0ZxcmczMUNS?=
 =?utf-8?B?UDFsb3ZONmwyOGg4V1VlVTN0YUE0eXM3b0ZsSUt2UUYxRjBMckwwd1MwVFd2?=
 =?utf-8?B?QUlsZUsxU0thU1FWTGNpWUxIQURwMGQwZGU2anN0QVNHK25ka0tTald0Vysr?=
 =?utf-8?B?Wk9tbllJUnhXK3h1R1puRXkzWHJpeG9iUGNCUmVlRDZuS0RQU0VaM2xjcW5R?=
 =?utf-8?B?TzBWSElKeWI3L3NadFlyMDBKZ3dZcFhZSUVFOWU0dEFuZ2luTGZtT1hiTGRV?=
 =?utf-8?B?SmtVM1hNL0h3cTNXK2tnVk44b2pjTjVWOXF1MFh0OTFTdHNWYjZvRTF6YXRW?=
 =?utf-8?B?dGhGdWVhcy9manVxRGV0WWkrRkdwclg2dmJLNXByaStGSXhXbHAvZTc4bGQz?=
 =?utf-8?B?Y2JYbDJna3F1R1I5aC95RVFRd3pJQ1d4blBsOFl0aHhGQUxGOHBNaENtamRV?=
 =?utf-8?B?cjhvdk12U0FLRVEzdjlMM2xNbW5hNWZFN0N5elBqcG1EYVhiMzVKa3J2aUY1?=
 =?utf-8?Q?dbeL/vAcnZqAZzkkCj9/NSyR9UI80C9FJuj/+f+OxY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC1CDEA391A3724BA2AB148767A20F88@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74db3cc2-5d1a-4a79-7024-08dcc33b999b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 06:19:52.7010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vs7ct+32sAcFIJ/RbHjZ6mO559rQtUW2EWULk5pwOT7pjrqvuS8WoyjZC3jrvm8d655Avum3xMUo3DgAXVb933F34curyI0b1UnWx9kduoMtjVZF41SH41n1WYq7m4d/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8556
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAXPR07MB8556.eurprd07.prod.outlook.com

DQoNCkxlIDIyLzA4LzIwMjQgw6AgMjE6MTYsIFBldGVyIFh1IGEgw6ljcml0wqA6DQo+IE9uIFRo
dSwgQXVnIDIyLCAyMDI0IGF0IDA1OjIyOjAzUE0gKzAwMDAsIExFUk9ZIENocmlzdG9waGUgd3Jv
dGU6DQo+Pg0KPj4NCj4+IExlIDE4LzA3LzIwMjQgw6AgMDA6MDIsIFBldGVyIFh1IGEgw6ljcml0
wqA6DQo+Pj4gSW50cm9kdWNlIHR3byBtb3JlIHN1Yi1vcHRpb25zIGZvciBQR1RBQkxFX0hBU19I
VUdFX0xFQVZFUzoNCj4+Pg0KPj4+ICAgICAtIFBHVEFCTEVfSEFTX1BNRF9MRUFWRVM6IHNldCB3
aGVuIHRoZXJlIGNhbiBiZSBQTUQgbWFwcGluZ3MNCj4+PiAgICAgLSBQR1RBQkxFX0hBU19QVURf
TEVBVkVTOiBzZXQgd2hlbiB0aGVyZSBjYW4gYmUgUFVEIG1hcHBpbmdzDQo+Pj4NCj4+PiBJdCB3
aWxsIGhlbHAgdG8gaWRlbnRpZnkgd2hldGhlciB0aGUgY3VycmVudCBidWlsZCBtYXkgb25seSB3
YW50IFBNRA0KPj4+IGhlbHBlcnMgYnV0IG5vdCBQVUQgb25lcywgYXMgdGhlc2Ugc3ViLW9wdGlv
bnMgd2lsbCBhbHNvIGNoZWNrIGFnYWluc3QgdGhlDQo+Pj4gYXJjaCBzdXBwb3J0IG92ZXIgSEFW
RV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFW19QVURdLg0KPj4+DQo+Pj4gTm90ZSB0aGF0IGhh
dmluZyB0aGVtIGRlcGVuZCBvbiBIQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VbX1BVRF0g
aXMNCj4+PiBzdGlsbCBzb21lIGludGVybWVkaWF0ZSBzdGVwLiAgVGhlIGJlc3Qgd2F5IGlzIHRv
IGhhdmUgYW4gb3B0aW9uIHNheQ0KPj4+ICJ3aGV0aGVyIGFyY2ggWFhYIHN1cHBvcnRzIFBNRC9Q
VUQgbWFwcGluZ3MiIGFuZCBzbyBvbi4gIEhvd2V2ZXIgbGV0J3MNCj4+PiBsZWF2ZSB0aGF0IGZv
ciBsYXRlciBhcyB0aGF0J3MgdGhlIGVhc3kgcGFydC4gIFNvIGZhciwgd2UgdXNlIHRoZXNlIG9w
dGlvbnMNCj4+PiB0byBzdGFibHkgZGV0ZWN0IHBlci1hcmNoIGh1Z2UgbWFwcGluZyBzdXBwb3J0
Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29tPg0K
Pj4+IC0tLQ0KPj4+ICAgIGluY2x1ZGUvbGludXgvaHVnZV9tbS5oIHwgMTAgKysrKysrKy0tLQ0K
Pj4+ICAgIG1tL0tjb25maWcgICAgICAgICAgICAgIHwgIDYgKysrKysrDQo+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaHVnZV9tbS5oIGIvaW5jbHVkZS9saW51eC9odWdlX21t
LmgNCj4+PiBpbmRleCA3MTE2MzJkZjdlZGYuLjM3NDgyYzg0NDVkMSAxMDA2NDQNCj4+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L2h1Z2VfbW0uaA0KPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvaHVnZV9t
bS5oDQo+Pj4gQEAgLTk2LDE0ICs5NiwxOCBAQCBleHRlcm4gc3RydWN0IGtvYmpfYXR0cmlidXRl
IHRocHNpemVfc2htZW1fZW5hYmxlZF9hdHRyOw0KPj4+ICAgICNkZWZpbmUgdGhwX3ZtYV9hbGxv
d2FibGVfb3JkZXIodm1hLCB2bV9mbGFncywgdHZhX2ZsYWdzLCBvcmRlcikgXA0KPj4+ICAgIAko
ISF0aHBfdm1hX2FsbG93YWJsZV9vcmRlcnModm1hLCB2bV9mbGFncywgdHZhX2ZsYWdzLCBCSVQo
b3JkZXIpKSkNCj4+PiAgICANCj4+PiAtI2lmZGVmIENPTkZJR19QR1RBQkxFX0hBU19IVUdFX0xF
QVZFUw0KPj4+IC0jZGVmaW5lIEhQQUdFX1BNRF9TSElGVCBQTURfU0hJRlQNCj4+PiArI2lmZGVm
IENPTkZJR19QR1RBQkxFX0hBU19QVURfTEVBVkVTDQo+Pj4gICAgI2RlZmluZSBIUEFHRV9QVURf
U0hJRlQgUFVEX1NISUZUDQo+Pj4gICAgI2Vsc2UNCj4+PiAtI2RlZmluZSBIUEFHRV9QTURfU0hJ
RlQgKHsgQlVJTERfQlVHKCk7IDA7IH0pDQo+Pj4gICAgI2RlZmluZSBIUEFHRV9QVURfU0hJRlQg
KHsgQlVJTERfQlVHKCk7IDA7IH0pDQo+Pj4gICAgI2VuZGlmDQo+Pj4gICAgDQo+Pj4gKyNpZmRl
ZiBDT05GSUdfUEdUQUJMRV9IQVNfUE1EX0xFQVZFUw0KPj4+ICsjZGVmaW5lIEhQQUdFX1BNRF9T
SElGVCBQTURfU0hJRlQNCj4+PiArI2Vsc2UNCj4+PiArI2RlZmluZSBIUEFHRV9QTURfU0hJRlQg
KHsgQlVJTERfQlVHKCk7IDA7IH0pDQo+Pj4gKyNlbmRpZg0KPj4+ICsNCj4+PiAgICAjZGVmaW5l
IEhQQUdFX1BNRF9PUkRFUiAoSFBBR0VfUE1EX1NISUZULVBBR0VfU0hJRlQpDQo+Pj4gICAgI2Rl
ZmluZSBIUEFHRV9QTURfTlIgKDE8PEhQQUdFX1BNRF9PUkRFUikNCj4+PiAgICAjZGVmaW5lIEhQ
QUdFX1BNRF9NQVNLCSh+KEhQQUdFX1BNRF9TSVpFIC0gMSkpDQo+Pj4gZGlmZiAtLWdpdCBhL21t
L0tjb25maWcgYi9tbS9LY29uZmlnDQo+Pj4gaW5kZXggNjA3OTY0MDI4NTBlLi4yZGJkYzA4OGRl
ZTggMTAwNjQ0DQo+Pj4gLS0tIGEvbW0vS2NvbmZpZw0KPj4+ICsrKyBiL21tL0tjb25maWcNCj4+
PiBAQCAtODYwLDYgKzg2MCwxMiBAQCBlbmRpZiAjIFRSQU5TUEFSRU5UX0hVR0VQQUdFDQo+Pj4g
ICAgY29uZmlnIFBHVEFCTEVfSEFTX0hVR0VfTEVBVkVTDQo+Pj4gICAgCWRlZl9ib29sIFRSQU5T
UEFSRU5UX0hVR0VQQUdFIHx8IEhVR0VUTEJfUEFHRQ0KPj4+ICAgIA0KPj4+ICtjb25maWcgUEdU
QUJMRV9IQVNfUE1EX0xFQVZFUw0KPj4+ICsJZGVmX2Jvb2wgSEFWRV9BUkNIX1RSQU5TUEFSRU5U
X0hVR0VQQUdFICYmIFBHVEFCTEVfSEFTX0hVR0VfTEVBVkVTDQo+Pj4gKw0KPj4+ICtjb25maWcg
UEdUQUJMRV9IQVNfUFVEX0xFQVZFUw0KPj4+ICsJZGVmX2Jvb2wgSEFWRV9BUkNIX1RSQU5TUEFS
RU5UX0hVR0VQQUdFX1BVRCAmJiBQR1RBQkxFX0hBU19IVUdFX0xFQVZFUw0KPj4+ICsNCj4+DQo+
PiBXaGF0IGlmIGFuIGFyY2hpdGVjdHVyZSBoYXMgaHVnZXBhZ2VzIGF0IFBNRCBhbmQvb3IgUFVE
IGxldmVsIGFuZA0KPj4gZG9lc24ndCBzdXBwb3J0IFRIUCA/DQo+IA0KPiBXaGF0J3MgdGhlIGFy
Y2ggdG8gYmUgZGlzY3Vzc2VkIGhlcmU/DQoNCkl0IGlzIExPT05HQVJDSCBhbmQgTUlQUywgdGhl
eSBwcm92aWRlIHB1ZF9sZWFmKCkgdGhhdCBjYW4gcmV0dXJuIHRydWUgDQpldmVuIHdoZW4gdGhl
eSBoYXZlIG5vIFBVRC4NCg0KPiANCj4gVGhlIHdob2xlIHB1cnBvc2Ugb2YgdGhpcyBzZXJpZXMg
c28gZmFyIGlzIHRyeWluZyB0byBtYWtlIHNvbWUgcG1kL3B1ZA0KPiBoZWxwZXJzIHRoYXQgb25s
eSBkZWZpbmVkIHdpdGggQ09ORklHX1RIUD1vbiB0byBiZSBhdmFpbGFibGUgZXZlbiBpZiBub3Qu
DQo+IEl0IG1lYW5zIHRoaXMgc2VyaWVzIGFsb25lIChvciBhbnkgZnV0dXJlIHBsYW4pIHNob3Vs
ZG4ndCBhZmZlY3QgYW55IGFyY2gNCj4gdGhhdCBoYXMgQ09ORklHX1RIUD1vZmYgYWx3YXlzLg0K
PiANCj4gQnV0IGxvZ2ljYWxseSBJIHRoaW5rIHdlIHNob3VsZCBuZWVkIHNvbWUgY29uZmlnIG9w
dGlvbiBqdXN0IHRvIHNheSAidGhpcw0KPiBhcmNoIHN1cHBvcnRzIHBtZCBtYXBwaW5ncyIgaW5k
ZWVkLCBldmVuIGlmIENPTkZJR19USFA9b2ZmLiAgV2hlbiB0aGF0J3MNCj4gdGhlcmUsIHdlIHNo
b3VsZCBwZXJoYXBzIGFkZCB0aGF0IG9wdGlvbiBpbnRvIHRoaXMgZXF1YXRpb24gc28NCj4gUEdU
QUJMRV9IQVNfKl9MRUFWRVMgd2lsbCBhbHNvIGJlIHNlbGVjdGVkIGluIHRoYXQgY2FzZS4NCj4g
DQoNCldoeSBpcyBhbiBvcHRpb24gbmVlZGVkIGZvciB0aGF0ID8gSWYgcG1kX2xlYWYoKSByZXR1
cm5zIGFsd2F5cyBmYWxzZSwgDQppdCBtZWFucyB0aGUgYXJjaCBkb2Vzbid0IHN1cHBvcnQgcG1k
IG1hcHBpbmdzIGFuZCBpZiBwcm9wZXJseSB1c2VkIGFsbCANCnJlbGF0ZWQgY29kZSBzaG91bGQg
Zm9sZCBhd2F5IHdpdGhvdXQgYSBjb25maWcgb3B0aW9uLCBzaG91bGRuJ3QgaXQgPw0K

