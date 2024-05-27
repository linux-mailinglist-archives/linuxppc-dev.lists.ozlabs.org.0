Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F08D0756
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 18:02:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S2LJsuV1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vp0Xd26Dmz79Js
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 01:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=S2LJsuV1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vp0Wt04Yxz3g4f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 01:52:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuvPqcInuhF+zHwQyzLEAg+MzytGiFgrqS5BHm4swFOe/x42g4DLtD5toqWsZuHia5K15rcvs4J5MP4bXZ99z8Z3aCdfhHkZozomly6Z2+CJOSlB2oPYaR+gq7ZRhvN381hpZ5F/yixRrF5L8dViUw2hvsnFBdL9aK8jNfubMy0b6rM8CWpJNhIw5f5THi609sXL9+RkGqSbnrsVxpZxIeDbXtYvO72/vObqqLnTWplnizci/PFX6M1K0MmDGhYoyFHaa0UWWhA6AXD9gIrz8kKRTs6mE3y0SPqjSVz1iYhzTP18sFaAe6eA8Jebq/HKFwi5+E9lw8BqFRq0KxwaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atA0qf6Th68/GBsL42zGqtHHphiAxZtqAoGMKEc9vZE=;
 b=Ueiqiy0BqGzgPnvrIATO4qW8GcE2+NWBWcdkinpzZEiX9cZ4p14INzXLbJoEgBA+lUyZ8x14xuj2wzCEAd5oynUwOfO7HOIGuxsjR6/cVWeqnqvix+UMfx2Z9t1MUPQSqsJAovqsXmqDHcMB1GiD4G2xv5S+jpqR3BdM06wJvneYg9X2wtBaQEpOOPAG+NF98RI3CwM7TQA9exWB5YsiXicHFKBKIrijBM6H81s1L0UwSJSOQefUjd53L6dAf1FsHBkz9fh8xUSbNFt82hLkbphOh/qqMbK8z0kutMMbU9usCm8Rb/jbz2feuk3TekUE0dhQg6zNxLHmn+3HHVc87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atA0qf6Th68/GBsL42zGqtHHphiAxZtqAoGMKEc9vZE=;
 b=S2LJsuV1GJSdLMqiG2hOxVLytN+61/bX1udipoQTsAe7w55GijeeG+V6C8Sx8gCagxXSDzxV2UHvAfdXMBIwQjg/i0dpF+BEPilmY8Jf0ceGBViA8550hbCkVTEvvvjH2KFsQR+jcTZLFPrVQTVo0Fudoy9YKZy2XoY8LaEcUZ0Vm+wAMmR5OEU4Ja6iuSUEfIQMMpJiDFZU1sa7vP0Jg+UhgxG0dcT3GcqBHVnjJ0gNWNHWB0Kj5vYGnywmhIlBOfGZEPl1gCb0YkSusoBXBEMyxhNM4ZDeT9o56QCvZd9AnwDyrcMWguCaR+85V+piOW/BZ/C+j2TEB77I2pNang==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3695.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:142::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 15:51:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 15:51:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Topic: [RFC PATCH v3 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Index: AQHar049Ix1YQLnVmUmJYzhNoE20v7Gq8MoAgABMH4A=
Date: Mon, 27 May 2024 15:51:41 +0000
Message-ID: <22c4ba7c-28d2-43bd-81b6-bd63f77d1d9e@csgroup.eu>
References: <cover.1716714720.git.christophe.leroy@csgroup.eu>
 <fbba60d762faad40ebb959bf9517c5c22301f69e.1716714720.git.christophe.leroy@csgroup.eu>
 <ZlRsMCvVo9tSEFQV@localhost.localdomain>
In-Reply-To: <ZlRsMCvVo9tSEFQV@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3695:EE_
x-ms-office365-filtering-correlation-id: 5f0b9f5f-b4e3-4d1b-dd77-08dc7e64e6f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?blVLOEhDYzhWdk1YMUsvd3AweFVTbUU2UHdTRms2S0V4OHJlbHVwR1lzOGlK?=
 =?utf-8?B?ekpzaDE0ZEVTVS9Bak9Gay9EK0t1Q3lWNzRsV2JjQXUwVitLNitPVWpZeVYw?=
 =?utf-8?B?SUo0L1VvTW1JVEkrclcwVkFWNjZ0YlByTXE5VklGYnBZYlAwVmNBTVkrdVUw?=
 =?utf-8?B?K3h0WjFObTdhejh2TUk0eEVleGF1QlA5QUx4cEgvUHlacjM1WUsyQmpZcGh0?=
 =?utf-8?B?N3k0UjRxWWlseUtUUUViemxRNHYzL0tHQi93aWdLTmk5NnAra1JiQ3hra2F5?=
 =?utf-8?B?djNhem9SSzc4U3VZZjd3WWtmSnZVVXliQWVsTEdGdmpFQWR6K0NXcmZzRk5W?=
 =?utf-8?B?R3EzaG1pQ28yT0d6SnJuK1FWNzlhdmpySUVXTitVNWU1TTBoSzFoeUExazVZ?=
 =?utf-8?B?dDY2ZHFVNDNwSFlTQStWZDR2RmxiUk8wNy9weVRwVkJHZ2U1d0NiRHFPV0RE?=
 =?utf-8?B?S2txUlRMaFAxMHEwK0F0KzFjMGhqNmtndkxIdkFGUDhycWFOaXY0dWJJa3U0?=
 =?utf-8?B?Y1F5MmFIT2xZUDI1YllyeTgvL1ZxUk94aEFOZmp6Y2x2Zy9QaXZLcHNKRTdQ?=
 =?utf-8?B?VWZsNmhhdkh5QWJ6VlViV0VmMWJjaVBiWWlDZEVUQk9JWHdGcStHKzdiMGlG?=
 =?utf-8?B?RVhWU0oxVU9vZUpLaStJL01HbURNNkdWSDh5TUhtOUZRMjYrWm44ekVtbDZo?=
 =?utf-8?B?K1pLQ1hIZlMySjloM3Iya3AyT010RFdkU0ZmR25nOEQ4UHNzZy9JQ0F2M3ZE?=
 =?utf-8?B?WTJ5M014aWptcHJqU2MyUWVkb3U2ai9LWmtXWWFVcXkrY2R0Wm0zZzRodXgy?=
 =?utf-8?B?dElqWklHY0hWTTJ5c3hwSVp6UVBXYjhEaTh4UTBneldZZzRNMlV5SllyQ0xG?=
 =?utf-8?B?cGNEcS93bWl4aU92L29sdStkSFhGdFgzQXRwZEhmNkkrOWVUQnFPQWMwYnNH?=
 =?utf-8?B?cmpXc1hMZnNPNVp1ei84aEQ1QUwxODBocU5RYU5qWGFWWW5oWWE1Z3I0akli?=
 =?utf-8?B?Q25sUHRuL1pMZWlyakZ2WWljTXdQZzNtclIwNVFvaWxtUDBqci9ubWNYcmkz?=
 =?utf-8?B?MlZvWFdFT2g5d2MxZndIT2VjL0RmS0lJcnF6N3Qrd056Y3ZvSG9zOUFnRmNT?=
 =?utf-8?B?T1QwNkVrcFZHd0IrS0dHeXdEblRYS2sxclNZTUd6ajJlNjJNSmZBMEttbm5u?=
 =?utf-8?B?R0Q1WkdxTGxsWW54S2RHN1g0ekxTek1nWk95Z3IyeDQ5OWVac3pyWW5yanFR?=
 =?utf-8?B?eFpVcG1CSHRsZlEzc1QraFdseTJkakltNnZhejhENHJNV1RkQ0xBY2ZuKzUy?=
 =?utf-8?B?OUo5SWhkK1gycE04OGdTdVVvYW90TmdwbVpJNmNZNndhQlB6blIxK0NDRWRn?=
 =?utf-8?B?YlpSYjJ1dWdabGNPV2UvWjFZMUsvQnREYWJkTFF4TWdocVZyR1lmV2wzYUZx?=
 =?utf-8?B?aUkyckpJdU10ZWtjUHg3RXRaRTBoek5nU3NpekhvMGtVb1ZibE5JeURCcXZ4?=
 =?utf-8?B?U0dUbnpMbGZvY1B0OGRQZ1VNRHh1V1J5a2Vqa1p3cVB0OGpYSEo0RDRWdkRr?=
 =?utf-8?B?dW42V2tFYmpnQS9NUmpESjh0bWJHOFNSQURaY1UwbzVCY2VXcGNpWnh0aUFk?=
 =?utf-8?B?RzlYQllNY1RZRU9SbjMrV0ZRSU5KVVozREVuN3Z1UUhUbUlFVm02WWhpQlNW?=
 =?utf-8?B?cDJDeGt1Q3dxNit3YmVKanJZaWpSOWxJQjlvQmFDaUI2dUFXUC92RHIzN2po?=
 =?utf-8?B?cFBqQm9WUVZ3emV1LzBKaGdoeWYybGFrdzhha2ZEQXJZdFZQUXJxZS8rSW9O?=
 =?utf-8?B?eGdGZVpsRThlSythVFI5QT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z0F0dWV1SXRybGw3Ti9QT3VrVGR3bWpwc0RIenFpc3IzMzU2MFdrZTd1c1Uv?=
 =?utf-8?B?NDdUMGZmUHIzekN5Ky8veFJLSFNjOERUU29CWUZaajl1V0swRVljOE52eFB3?=
 =?utf-8?B?aWF4VytmSkFiYUhiT2gwbkh0UEc4eFRBa0c1YzgzVGp3OEFzeWJnSk5oODdt?=
 =?utf-8?B?MnErZDBZekw3S0ozNzlyOC93QjAyWlVrTlhWUFZ0ZENYb3ZIU29zZkF3TmVB?=
 =?utf-8?B?WTBCbTcxYWhTbFR0TmtTQ0hvSmRQczhxd3VnYm5qVFVjVDJWaXhWUUJRdlBJ?=
 =?utf-8?B?Y0ZKbWRNS2tQWktoZy90NVF5S3ozZFJaR2JZZnh4QWhmb3ZpVHFHdngrd2VZ?=
 =?utf-8?B?Wm9TUjFvbExzRDR3VG9NY3pvTk5TYjdoY1ZuYnR3bXR1VHdjZ0p2ajBuV1Bt?=
 =?utf-8?B?SlpmSDRiVVdScHdMM2VzUDJtdzE1WmZoRTl5VWE3N2NnaDEwRlEwM1J3M3cr?=
 =?utf-8?B?Z3B2K2lVRUFoMFF1ckQxbWZ6ZDFGeTN4cFIvZnMyTXV0ZlZMdUJHOHRIY3BK?=
 =?utf-8?B?VFV3a0xORkV4VnJzenowKzQ2Myt4ZCtiVkZRc05wcXlXd0hIMG9za2FjZFFP?=
 =?utf-8?B?U2xvWWpOMENnakkwLy8vSG52bmZVSUQxM291dUhVMjZHUjJKZU5EZExMbjY4?=
 =?utf-8?B?NVlTOTZWODVCY3NnWnd0RG80ODZsVnNpYWVteEN2ZmhSdEthSTlOczdvbGFY?=
 =?utf-8?B?MmpFRUFrakZScGtUSmhFMDF5ak5vZkZmUGVBSTNSbzdLV3k0WXZRUHg1WEQz?=
 =?utf-8?B?U3VDUGpaOVZQeGdrR1gvWEp3NTN4cmFHdGtpV2pjelR0UVFtN0ZLanhnNHBP?=
 =?utf-8?B?U28yNEtBOHplM2lTVG8rTi9jelkxZXRQaVE1aTl4cTkvMHlZZjlUYVJmS2NX?=
 =?utf-8?B?YWJ3aitmNWRQcGYvL2s4dkYwV29mNlF1dy9JN0VNb1o3cDRYN1VpbXdqRWp0?=
 =?utf-8?B?KytsQ0lMSm11QWQ1OVhhQTBQaWdpSlBvQ1lybzhJNWpVNGxNV0l5Z0ZjYnFo?=
 =?utf-8?B?WFRHcnNoMlIrSnR6UHRLbU0ySHEzMFpLMkhtanRGY0VlYWZ5a05ZSnNndUlz?=
 =?utf-8?B?eTFUQkZvMXBkVDQyMyt5U0MxR1dXTUpnNGR6RTYvckpNalZXUXFYSncxemFU?=
 =?utf-8?B?OU5YWTZORkt2VDRKWk51NURyUm10TVFPWmNLa0dzZU1RbHNLdFkrTHZsNzFn?=
 =?utf-8?B?NEk4TmY5UnN0UG40bkxUWTVleUtlemFXODU2b2VyN2RYbjdzODFXNWxSdEN2?=
 =?utf-8?B?VGtSaW9Bb3JKWFJxTmcxZmJDZ01HWHFXazBBbFEwUHAzbnpVWHBnTkhaVERw?=
 =?utf-8?B?YS9BMmNBRGFvNDRzL25ROE1BVllBS1JEanlRVTQ0Tm1PRWhDUzNnWkFMVHBO?=
 =?utf-8?B?bTQ0NzdteE1Yd0FsNURFMzNqRmI4QVl3L1ZkMmdZeEY2MEJDUmlZK0dmMjY2?=
 =?utf-8?B?UnphZUNwZVV4cG5uc1hWaWQzVlB0T3dGdGtvVUFvWHlSSkhXcEdDS0FGOUdD?=
 =?utf-8?B?OEd0TlZtckNHcTNmYkRqSG9kdyswbkFIUmdxb0g3ZFRobS9tSTJZMWFsWWtq?=
 =?utf-8?B?a1VFdVIrZ0lyY2R1R0dKT3R6cnFpMVpoSXBTcEtOZzlzZFZkN3BBRFJaYis0?=
 =?utf-8?B?RVh0VVlLUE5paG1rSWRzbEVDMHNQN012ci95UjJ6ZXlEamJ3QWdwejNsdGh1?=
 =?utf-8?B?LzFGVGU2YUxlKy9xM2xOdzZmaXdCVUJkSHdTWnlMNUFERUlCck81KzM0NElQ?=
 =?utf-8?B?Vi9uYVFzMlhiaFo2SjlXSmpJRGEwL1NxNDVRSU5ndjUyaEs1QVF2M2Nad21U?=
 =?utf-8?B?VjZPWmRDbVQ2L2JhUnVlbXI2dk5Uamx3ejRJQUMvc2lwNzNUc3p5SlAwTVdL?=
 =?utf-8?B?ZjJnaHloZ1l6YVc3TUlxTDFGTTZJVVZibnpGQlk2MXNNZkVMK21CMmNXSjVI?=
 =?utf-8?B?YytmNStVS0xqVzdkbVFlcFJPSE53VkEyZjBuUlZMWXpGTUs1OEtGVzJsaFhF?=
 =?utf-8?B?d3hObDVBQXJmYWhtREQ5cEp3K3JqSHhtb1lseTdUeHhqNEVrUk50R2pYajZE?=
 =?utf-8?B?c3Rld1BqcS8yZUo1QmNVSHFJN0Qrcm12NXFIdlRXR0VvTmV5Qlh1d0k4dWZY?=
 =?utf-8?Q?TD08JoK81tX+cphEtCKjNKikp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDF29D008F33E84A9BFCCE968012B909@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0b9f5f-b4e3-4d1b-dd77-08dc7e64e6f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 15:51:41.6108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1kpcPp1/azShOLHL4tafVNLOEtxppbsLfrian5eEVmf9+v+MtcTKHTFXjBV1VTItjd1VGvr3f/DwpKh6tBxEVfPahnSwxz0vy4pgmPynaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3695
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA1LzIwMjQgw6AgMTM6MTksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIFN1biwgTWF5IDI2LCAyMDI0IGF0IDExOjIyOjIzQU0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBPbiBwb3dlcnBjIDh4eCBodWdlX3B0ZXBfZ2V0KCkgd2lsbCBuZWVkIHRv
IGtub3cgd2hldGhlciB0aGUgZ2l2ZW4NCj4+IHB0ZXAgaXMgYSBQVEUgZW50cnkgb3IgYSBQTUQg
ZW50cnkuIFRoaXMgY2Fubm90IGJlIGtub3duIHdpdGggdGhlDQo+PiBQTUQgZW50cnkgaXRzZWxm
IGJlY2F1c2UgdGhlcmUgaXMgbm8gZWFzeSB3YXkgdG8ga25vdyBpdCBmcm9tIHRoZQ0KPj4gY29u
dGVudCBvZiB0aGUgZW50cnkuDQo+Pg0KPj4gU28gaHVnZV9wdGVwX2dldCgpIHdpbGwgbmVlZCB0
byBrbm93IGVpdGhlciB0aGUgc2l6ZSBvZiB0aGUgcGFnZQ0KPj4gb3IgZ2V0IHRoZSBwbWQuDQo+
Pg0KPj4gSW4gb3JkZXIgdG8gYmUgY29uc2lzdGVudCB3aXRoIGh1Z2VfcHRlcF9nZXRfYW5kX2Ns
ZWFyKCksIGdpdmUNCj4+IG1tIGFuZCBhZGRyZXNzIHRvIGh1Z2VfcHRlcF9nZXQoKS4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3Jv
dXAuZXU+DQo+PiAtLS0NCj4+IHYyOiBBZGQgbWlzc2luZyBjaGFuZ2VzIGluIGFyY2ggaW1wbGVt
ZW50YXRpb25zDQo+PiB2MzogRml4ZWQgYSBjb21tZW50IGluIEFSTSBhbmQgbWlzc2luZyBjaGFu
Z2VzIGluIFMzOTANCj4+IC0tLQ0KPj4gICBhcmNoL2FybS9pbmNsdWRlL2FzbS9odWdldGxiLTNs
ZXZlbC5oIHwgIDQgKy0tDQo+PiAgIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAg
ICAgfCAgMiArLQ0KPj4gICBhcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgIHwg
IDIgKy0NCj4+ICAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9odWdldGxiLmggICAgICB8ICAyICst
DQo+PiAgIGFyY2gvcmlzY3YvbW0vaHVnZXRsYnBhZ2UuYyAgICAgICAgICAgfCAgMiArLQ0KPj4g
ICBhcmNoL3MzOTAvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgICAgIHwgIDQgKy0tDQo+PiAgIGFy
Y2gvczM5MC9tbS9odWdldGxicGFnZS5jICAgICAgICAgICAgfCAgNCArLS0NCj4gDQo+IEkgd2Fz
IHdvbmRlcmluZyB3aGV0aGVyIHdlIGNvdWxkIGRvIHNvbWV0aGluZyBzaW1pbGFyIGZvciB3aGF0
IHdlIGRpZCBpbg0KPiBwYXRjaCMxLCBzbyB3ZSBkbyBub3QgdG91Y2ggYXJjaGl0ZWN0dXJlcyBj
b2RlLg0KDQpXZSBjb3VsZCBiZSBpcyB0aGF0IHdvcnRoIHRoZSBjaHVybiA/DQoNCldpdGggcGF0
Y2ggMSB0aGVyZSB3YXMgb25seSBvbmUgY2FsbHNpdGUuDQoNCkhlcmUgd2UgaGF2ZSBtYW55IGNh
bGxzaXRlcywgYW5kIHdlIGFsc28gaGF2ZSBodWdlX3B0ZXBfZ2V0X2FuZF9jbGVhcigpIA0Kd2hp
Y2ggYWxyZWFkeSB0YWtlcyB0aHJlZSBhcmd1bWVudHMuIFNvIGZvciBtZSBpdCBtYWtlIG1vcmUg
c2Vuc2UgdG8gDQphZGFwdCBodWdlX3B0ZXBfZ2V0KCkgaGVyZS4NCg0KVG9kYXkgc2V2ZXJhbCBv
ZiB0aGUgaHVnZS1yZWxhdGVkIGZ1bmN0aW9ucyBhbHJlYWR5IGhhdmUgcGFyYW1ldGVycyB0aGF0
IA0KYXJlIHVzZWQgb25seSBieSBhIGZldyBhcmNoaXRlY3R1cmVzIGFuZCBldmVyeXRpbWUgb25l
IGFyY2hpdGVjdHVyZSANCm5lZWRzIGEgbmV3IHBhcmFtZXRlciBpdCBpcyBhZGRlZCBmb3IgYWxs
IG9mIHRoZW0sIGFuZCB0aGVyZSBhcmUgDQpleGVtcGxlcyBpbiB0aGUgcGFzdCBvZiBuZXcgZnVu
Y3Rpb25zIGFkZGVkIHRvIGdldCBuZXcgcGFyYW1ldGVycyBmb3IgDQpvbmx5IGEgZmV3IGFyY2hp
dGVjdHVyZXMgdGhhdCBlbmRlZCB1cCB3aXRoIGEgbWVzcyBhbmQgYSBuZWVkIHRvIA0KcmUtZmFj
dG9yIGF0IHRoZSBlbmQuDQoNClNlZSBmb3IgaW5zdGFuY2UgdGhlIHN0b3J5IGFyb3VuZCBhcmNo
X21ha2VfaHVnZV9wdGUoKSBhbmQgcHRlX21raHVnZSgpLCANCmJvdGggZG8gdGhlIHNhbWUgYnV0
IGFyY2hfbWFrZV9odWdlX3B0ZSgpIHdhcyBhZGRlZCB0byB0YWtlIGFkZGl0aW9uYWwgDQpwYXJh
bWV0ZXJzIGJ5IGNvbW1pdCBkOWVkOWZhYWMyODMgKCJtbTogYWRkIG5ldyBhcmNoX21ha2VfaHVn
ZV9wdGUoKSANCm1ldGhvZCBmb3IgdGlsZSBzdXBwb3J0IikgdGhlbiB0aGV5IHdlcmUgbWVyZ2Vk
IGJ5IGNvbW1pdCAxNjc4NWJkNzc0MzEgDQooIm1tOiBtZXJnZSBwdGVfbWtodWdlKCkgY2FsbCBp
bnRvIGFyY2hfbWFrZV9odWdlX3B0ZSgpIikNCg0KU28gSSdtIG9wZW4gdG8gYW55IHN1Z2dlc3Rp
b24gYnV0IHdlIG5lZWQgdG8gdHJ5IG5vdCBtYWtlIGl0IGEgYmlnZ2VyIA0KbWVzcyBhdCB0aGUg
ZW5kLg0KDQpCeSB0aGUgd2F5LCBJIHRoaW5rIG1vc3QgaWYgbm90IGFsbCBodWdlIHJlbGF0ZWQg
aGVscGVycyBzaG91bGQgYWxsIHRha2UgDQp0aGUgc2FtZSBwYXJhbWV0ZXJzIGV2ZW4gaWYgbm90
IGFsbCBvZiB0aGVtIGFyZSB1c2VkLCB0aGVuIGl0IHdvdWxkIG1ha2UgDQp0aGluZ3MgZWFzaWVy
LiBBbmQgbWF5YmUgdGhlIGNsZWFuZXN0IHdvdWxkIGJlIHRvIGdpdmUgdGhlIHBhZ2Ugc2l6ZSB0
byANCmFsbCB0aG9zZSBmdW5jdGlvbnMgaW5zdGVhZCBvZiBoYXZpbmcgdGhlbSBndWVzcyBpdC4N
Cg0KU28gbGV0J3MgaGF2ZSB5b3VyIGlkZWFzIGhlcmUgb24gdGhlIG1vc3Qgc3RyYWlnaHQgZm9y
d2FyZCB3YXkgdG8gaGFuZGxlIA0KdGhhdC4NCg0KPiANCj4gICAgDQo+PiBkaWZmIC0tZ2l0IGEv
bW0vZ3VwLmMgYi9tbS9ndXAuYw0KPj4gaW5kZXggMTYxMWU3M2IxMTIxLi44NmI1MTA1YjgyYTEg
MTAwNjQ0DQo+PiAtLS0gYS9tbS9ndXAuYw0KPj4gKysrIGIvbW0vZ3VwLmMNCj4+IEBAIC0yODEy
LDcgKzI4MTIsNyBAQCBzdGF0aWMgaW50IGd1cF9odWdlcHRlKHB0ZV90ICpwdGVwLCB1bnNpZ25l
ZCBsb25nIHN6LCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+PiAgIAlpZiAocHRlX2VuZCA8IGVuZCkN
Cj4+ICAgCQllbmQgPSBwdGVfZW5kOw0KPj4gICANCj4+IC0JcHRlID0gaHVnZV9wdGVwX2dldChw
dGVwKTsNCj4+ICsJcHRlID0gaHVnZV9wdGVwX2dldChOVUxMLCBhZGRyLCBwdGVwKTsNCj4gDQo+
IEkga25vdyB0aGF0IGFmdGVyIHRoaXMgc2VyaWVzIGFsbCB0aGlzIGNvZGUgaXMgZ29uZSwgYnV0
IEkgd2FzIG5vdCBzdXJlDQo+IGFib3V0IHRoZSBiZWhhdmlvdXIgYmV0d2VlbiB0aGlzIHBhdGNo
IGFuZCB0aGUgbGFzdCBvbmUuDQo+IA0KPiBJdCBtYWRlIG1lIG5lcnZvdXMsIHVudGlsIEkgcmVh
bGl6ZWQgdGhhdCB0aGlzIGNvZGUgaXMgb25seSB1c2VkDQo+IG9uIENPTkZJR19BUkNIX0hBU19I
VUdFUEQsIHdoaWNoIHNob3VsZCBub3QgYmUgdGhlIGNhc2UgYW55bW9yZSBmb3IgOHh4IGFmdGVy
DQo+IHBhdGNoIzgsIGFuZCBzaW5jZSA4eHggaXMgdGhlIG9ubHkgb25lIHRoYXQgd2lsbCB1c2Ug
dGhlIG1tIHBhcmFtZXRlciBmcm9tDQo+IGh1Z2VfcHRlcF9nZXQsIHdlIGFyZSBhbGwgZ29vZC4N
Cj4gDQoNCkJ5IHRoZSB3YXksIGFmdGVyIGNvbW1pdCAwMWQ4OWI5M2UxNzYgKCJtbS9ndXA6IGZp
eCBodWdlcGQgaGFuZGxpbmcgaW4gDQpodWdldGxiIHJld29yayIpIHdlIG5vdyBoYXZlIHRoZSB2
bWEgaW4gZ3VwX2h1Z2VwdGUoKSBzbyB3ZSBub3cgcGFzcyANCnZtYS0+dm1fbW0NCg0KVGhhbmtz
IGZvciB0aGUgcmV2aWV3DQpDaHJpc3RvcGhlDQo=
