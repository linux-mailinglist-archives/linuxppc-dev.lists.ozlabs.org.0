Return-Path: <linuxppc-dev+bounces-13910-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A3C3E424
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 03:33:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2jmX23kzz3bs7;
	Fri,  7 Nov 2025 13:33:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762482828;
	cv=pass; b=hNNly/eWRQTYIesRP0KnNy/RPXmsfJT2d4u+nUgGaz9OAJ+lMdh+vDox00fRSxYcwk0RnRAD0inHaBP2VywaJont7ssyWdz1suhuT4j3ChfENFd7CE3B8Byx+HCTJyQqDgx6y3isF/aTgJ6ZVGvwsYSyJrX4ePyAWRdipKEkToHmBtnK+xbs6jKDV7jSsq/j8IjXXXoBIFVzL22Q3CGhTsM2k96azNdGJKbdaGWCoZLd1EyTr6g6BgO393zx3VLTzS7AMwWCE+nFov1K7LMi1M8VK35UbRN9N6lGlXtXxfTlsRJM2RxmZFKEWVlp1WRPqC/2pttLhDk0HqLUjB8cMg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762482828; c=relaxed/relaxed;
	bh=c0xFOzc+nVtZNTt9O048cyfoJQ7LU6uKMDGDuEVBN2Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dSEhLYHCnipDEgkserlg/2Nj/MBcUnVesX53df8W1Owfh8RO55z5cloa5FQbISRc+oVSXsHewjDeS2dzcUZFozxWmwPTE4Jyt7/bx5GEQo0yR6FETAzZ/3f3TlPTeeBluvQE2NDimbJ5Tsk6KvO4pZcMxGbliQpbo4sfKGL9uGiWq+8vM4s+qW3A0Na/LV5jMl0tod6qF/QrW/BI2wIttCHZ1iT5Cpz4aCdAYx8o/S/ihNschBxfqlvOh95x5c4slbTLMho/6P9bc4k3ezBhVAk3TEKJQtBoyyahuOb7rT9rGOghlWubzM1ir+v/+0Ydzkn1GGs+o/kL/OUZ0FqcGg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mp4S16dK; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=hongxing.zhu@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=Mp4S16dK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::1; helo=db3pr0202cu003.outbound.protection.outlook.com; envelope-from=hongxing.zhu@nxp.com; receiver=lists.ozlabs.org)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2jmW16byz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 13:33:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwJ4chIL0G1Zxftc/4Z83n9Jt7RP9hYdkd8jbkyqfPjUEEykkucqvVKJ38NmAYA02ae5GGL2cafyiNLwYNso3XiWY7hrdmvJcw4nK36/M3AbDErQzBw17jAMTLI1ULWbaG5uXGnis7XaMFuZWoA1CWuBD7PEXfFYqe6oXKSpMXSab3N2VlYw3Dp/im/3M6YCpuzJmY8ABQOYoNFrmwrqcjOAHxSggliw8Jl3bQ9S/UmyEjWCDa6kaFW4JJrEx6Y/9VDe7QHjjxGBbUDqIt/QXhkRGwA9fc3igj32T8jzary7kOXM4n52Xc97KUMFy693dGC8Rpbq+aVIAY0ala5hng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0xFOzc+nVtZNTt9O048cyfoJQ7LU6uKMDGDuEVBN2Y=;
 b=XgELkGdc9eCWEA5MZp7fm5wqoOlRXbi+vLlZzsobbzaPkCuFZUvmeHokzTQR8Yq41PvI6bhWjeILvKjT6OZ/ybU3OAl02DC/QywQTk1ipEeuqZb7RAOtp0rKdBEgaFLAQYTVWUnWFRCbf7DFBqrRptMfQ1fyGxAiTrmJcMLJvTAYpqRMqgB2Y777OZnX/v/TkpqzCYJrpak2jckuDOLdxGFf9GOSNSmcsz9sXPI7w7DXz2+22GlqonAkx/Tet2AqIKhIzycRBbhz9Ffz0mvMi+8PyneiQsxs2DTiNrfjBNYOK3nGpXyDETOOuIu9HkpscWkqaj97eC0z6R9mdpnbQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0xFOzc+nVtZNTt9O048cyfoJQ7LU6uKMDGDuEVBN2Y=;
 b=Mp4S16dK+I8W5P8eVXj+O6XKl/qAKRa2HHeegvzn5VDwKZqWhq2MELK9OyB41+KNrXscfENLDmlbFloautl9hbZiDHDlPiJ/FlHoM+uMdp33h18gM9BhqT+hfzbz//RAiEhBr7AErK87Y4+N9WcWWX5ormlxDt2oCzg6LnSmr1ZHM39IydPryihoPU5d3vF3X88D0BDFyauqfR9q7Jugo2U0nwZR9F8aYhXOjV6uVKtJdj3fTyjY35TBDLSY4q8IGDvLK/XMhNF3UAOYRrsRIBCQxGsgzVi4660x5kAYF4wEcnqVoIiGWl4EET/3FLSgAJTYYocL3RyYYuJPktDjng==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 02:33:23 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%7]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 02:33:23 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
CC: Christian Zigotzky <chzigotzky@xenosoft.de>, Manivannan Sadhasivam
	<mani@kernel.org>, mad skateman <madskateman@gmail.com>, "R . T . Dickinson"
	<rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, Lukas Wunner <lukas@wunner.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>, Roland
	<rol7and@gmx.com>, "hypexed@yahoo.com.au" <hypexed@yahoo.com.au>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
Subject: RE: [PATCH 0/2] PCI/ASPM: Allow quirks to avoid L0s and L1
Thread-Topic: [PATCH 0/2] PCI/ASPM: Allow quirks to avoid L0s and L1
Thread-Index: AQHcT0xTWtAVvqV570G7dxg5wRKq1LTmfXEg
Date: Fri, 7 Nov 2025 02:33:23 +0000
Message-ID:
 <AS8PR04MB8833A6EA37021A6754A9F6128CC3A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References: <20251106183643.1963801-1-helgaas@kernel.org>
In-Reply-To: <20251106183643.1963801-1-helgaas@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|GVXPR04MB10969:EE_
x-ms-office365-filtering-correlation-id: 63612ab8-9049-4be0-1644-08de1da605e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?SERjaTgzZ3hGcHVmTkUwcDllOTMwMFBiWXZ4SXdScEFXbXVhMHhkeFlSWGJh?=
 =?gb2312?B?ZGVocWU4NXR2S1NBREcyWUNvLzRVc21ZVUhGUVdFZSs1QVpFVW9hWHFnV28z?=
 =?gb2312?B?djhBVHBpM1VCNHRualhBK3ZrRkNJMlRDUlZZTlJVcG54YlQwczN0S3hvREVF?=
 =?gb2312?B?Ny81d1ZYQnVqNlN6dW4rNUsvOGt6N1B5Znd1SlhrR0c1MWtSOTdhcTFwOHBU?=
 =?gb2312?B?eGd0dUNsMk5DaVhKRUF3YWU2M29vdnRnWlBzYkMyUzgzc283M3dTQ0xmRmcw?=
 =?gb2312?B?QWxXMG15TDdESEFRMnRISW5OVHNveU5QV0xZTVFac1ZHYjU2dWQrSUxKUmJM?=
 =?gb2312?B?UEhEM2tYUVBiV1R2MjhtUnVVZ2V5YWdPRzRuZ0Y3TlR5NDVhNU45aGVjUWRN?=
 =?gb2312?B?SlB1VFJlcHhUYkxid2pNQTN1OHFxLzJZRWl3akVlMktRMWVJVTM4SXQwZjhP?=
 =?gb2312?B?ZkZaVWRWWlBQcGFycFJScVBmMHFXMkI3UnlLa2VTZ09rZS81YVBVY3dDa0R5?=
 =?gb2312?B?dVIyN282UVhIVG1abUZuVXZpVEE3YjBCdDlla1hUL1lpNTA1LzAvbERoZ1hX?=
 =?gb2312?B?cWwweUdaNStZQ21wS09kdkVLWStJK0g2dkZ6S2J5TElqRWtiWjUzcGZKVWg5?=
 =?gb2312?B?QTA2aGpDSUxycjViMlNwY1RDME1FOFQ4aDVDN1paU0o0cEt1bVA0MDBLM0tC?=
 =?gb2312?B?WU5BRVpMQkxjNmFrVG1YU3llTDRWN1dlYW9DNzhLYjhjWGFiRjh2cUlWQTht?=
 =?gb2312?B?Qk9GNUZrWnNDZjJNY2RyZ096UzFQcDc5UGlsSitsUlFESHhLRUNiOVVRUnQv?=
 =?gb2312?B?MHkxL21KRGVYSWlwMUplOW5ydzBZN24wTkVndThXajNtdExJZzkxQWhjVno4?=
 =?gb2312?B?WGduU2cxVEtMUzdkWU16dWFWZGt2NHkzNm9Fak5TMEhIU2ZSVXJReUVEb3FV?=
 =?gb2312?B?WjkxZ3IycWZzKzJmMStQS0lqczVadFluOWV4dmVicGJndjdaWFZweWRMc1Ns?=
 =?gb2312?B?YjVDZjhXaGZEYkVCWUdvckpHc0NTeHNmOUFFZnQwakRSOEFwU3ZBTFRCaDJS?=
 =?gb2312?B?MWt6bUVXRm9yeUlRTTlrdWlZcEZrbTdRZVE0dXZ1WFBDWXp3T21uZWpubVZY?=
 =?gb2312?B?KzRGYmJpSStMMks2ZHpUNVhQSEVzbWFkZGNkZ09WMGN3RWFUeEVEZnhNLzB1?=
 =?gb2312?B?VXBZekdPWXdPUVRIS2szRjB4OFJKQnhheFkvTVZ6L040dHFLbTNpcGxlTEVa?=
 =?gb2312?B?WEwrYmtVeTFVYWllZ0tacjV1aDd1VnNVTmllNWRCT1grWmRyNms2NGFYQnIw?=
 =?gb2312?B?UE5yOFRZMEczNWZDZVBqV0JvczRwbUlndmNXb2Z6cStyOUgrOFdwanNVRTk2?=
 =?gb2312?B?RWI0TzVqU1BsalNncWFka0dUQzk0WW0vNWtxc216RzVCdHZTVGVWamFwR1Fr?=
 =?gb2312?B?L21vc29HNFpFZGZJUTYwd2VNUVo4dnJFdDJCcVZNbnZJTFoxNURjVEFuWjlX?=
 =?gb2312?B?bTIwVWUzQzNaeFpJcUFZaDZ3VExYL3JSZ2loRWdEV0cvcCtQWVdHU3pWWTlJ?=
 =?gb2312?B?TnFyRzFuMDNlWWhGTVVSVG1nZEpoZ3BTQ1RuejBXcktGS2hVZEFIckJ3bFB1?=
 =?gb2312?B?dlM2NWVXL0hVVmVZbmwzY0NVa3BvTVNqZnJBR3hLN01nRXVudkRwaGFvQzNF?=
 =?gb2312?B?VGg3SWNyblZ5cnhjTXQzU2ZSVjFqeEp5bW41ZGVDbkVCQnF2T2krT2x0MFlY?=
 =?gb2312?B?MGZaa3JkOWZScUx6dHNsZVBYZ21PWUozMHNEU1cxeDlqK3l5NVBEQmdvekZv?=
 =?gb2312?B?cjRRcmtXcFhIRFFCOUQrazd3YzBuL0UyY2I2RTEvQ00zempPdlVPWXNlVzQx?=
 =?gb2312?B?dG9jYXVLY3J3eHZqeWpvTVJucGRwQ21LS3lLd0dxZ2EvUHlNYk1MaTF3Mkt3?=
 =?gb2312?B?MUhrZXRHdmU1cW1ONHcxcFdBQ0Fkc2kwT0hQSHJaSUlLKzhjZUsxajdqdmg2?=
 =?gb2312?B?MGlzRGRTd1pNRUhLbzZIeUN3WHU2di8vMUR0Uld2WGxXa3lPK0lYWHZNaml0?=
 =?gb2312?Q?cefXdk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Wk1qellvMDhCT0ZYYmpiVmhjQTNWT3YwMUNnSUR4SW8zcWFIZnFRZ2diMSt6?=
 =?gb2312?B?RmtyR0x6a3MrZ2NEZ2o2Nk5OY2VvOWZyRkNtZkFwU0ZHSzU0UlA4T2JtTHpS?=
 =?gb2312?B?NUFEZ2djcmNSbmZiUTVEaTd6b1c4eUxpNk1JMG9rZVZ0Ry9Eem9ZYkU0dE5o?=
 =?gb2312?B?NjZYc3FMZFpIb2lJMGxpYTJvUE93QXE4YmorQXRoWktNT29MRHUxc0Y1NjZB?=
 =?gb2312?B?WHVWa1dKNTVrYmF5QVFlOVNQZjVyV3hsQ0d4Nmh5MkduR1UrcjVNQ0pGZG5F?=
 =?gb2312?B?QURaSC8weHZ2ZXFudmhOYXJUVzJxQ1NMMmdINUxZR3V1SUZ2dzhTZGtSTmJt?=
 =?gb2312?B?ampyeE1KWE5iRnBidXVQSGVGSWFzN2wyR0hTWnhNZ3FVbXdHSGZKY0EwSFov?=
 =?gb2312?B?ZU9qZEd3bnVNRjJqY2oxcmhJajJYSEdmMDE1RVBCUE54dFRWNjhOQWVtNGpC?=
 =?gb2312?B?cDNoTEQxbW96a2RnRU0xdjVGWVJVY04zZTFHSGtwb0JsWWlyTFJKN1ZPWDJw?=
 =?gb2312?B?ckoxMFdyUnlHTkI1SGJYZ1AzL2ttU1pIUHpDRGRrUzBCdzY5YmpONkp6UkRk?=
 =?gb2312?B?TGx2cUNtNlpYZ2QrTWNUNHdvVXFEWm5zS0tKQ2RBMU1VOGNCbG56ejdrckFl?=
 =?gb2312?B?dnJCOEVjNDlJMXpmdVpFYklJdDFmeDJrYUhpZ0pTTWhLQmpsZjdCTGJJM1k4?=
 =?gb2312?B?Z3lsQm9yRVBTOTFRYkp4ZGZOZXZ6K3Z1RStjRmVKTnk5SzkyTVJvM3JPdE13?=
 =?gb2312?B?R3lqb2VBMWR2bVlFUHZLTkF5QW5ieU5jcnNHa0M5cnNRM05IVTN4bUxKTVlv?=
 =?gb2312?B?K3JoNUh2ZFB4Wkk4Z1YySDhJRzQ0RU4rZ3BYQzdDZWlVNGdqTUxaTExjTlJt?=
 =?gb2312?B?d0o3TEVncXJmZzVHUGp1Wi93OXE1Z1V4ZllPTXA2MGFNTTlIYkVVTHJHOUFx?=
 =?gb2312?B?TXV2M0tOVEFZTTFEb3NhejJDZHZYanF1WGhUY2tISmJVeStsQWpLaVNVK2Rn?=
 =?gb2312?B?aWpjNURQamVtaEYxY2lpb09XQTNVMU9nOWpzRCt1RUlsZDl6ayt4MWkxQnZW?=
 =?gb2312?B?Y2syQTNGQVdEOUk1dTR5aWg1ekdCSTBrc1N0YVNEbmhVdkZPdmZXdndXNkhn?=
 =?gb2312?B?V093RlZTYlVTZGNSUjZLSHJMelBmbFRJeHBsUTJvOVo4RjZQOFpsSXh2N1Nn?=
 =?gb2312?B?ODA3UC9jb2cxTmliQ291WEJHRUxFQkVGbzViTUl0eEJaM21uS3NzWXMybHBn?=
 =?gb2312?B?bjBsRG02a092VjJzZVZhcEJxWmhHN1NCc1Y0OENHWVdsQWZWYXRFaEVzNnN4?=
 =?gb2312?B?QTVNOEg0RmtJUHVtRW9zNlZsb09PMVp0UzRNSG9ReU1MdGNKbzB5WEV1Kzg2?=
 =?gb2312?B?a0RNYU4yaGhEQTZPZmxrczdCSW5SZS9vYjQrSjcwTG1EOGEzMkx0NVh0UnEx?=
 =?gb2312?B?bnZYU1pBK0ROc2ozRlhJVktlOVR0bDBKMjlnU0lyaGMvSzcxd2I2QUJkbjFW?=
 =?gb2312?B?bGp5bGhYODIzcUdIL2xyT1NEamp6WmR4YnFnT244VUNNWTNySSs2S2ZOa2cv?=
 =?gb2312?B?eDUwZmlkSnIrbUE5WS9xNVprVUdLeHBFNlFnOER4THpKN1ZhNXo0c1F2ZmFn?=
 =?gb2312?B?bHRJUHNXUDYrUlp2Unk0L3B4Ti96RENlTkJmRmRTZVVTZCs1TXVuL2VYRXJW?=
 =?gb2312?B?cUtXUGxQMUdhaXN2VmZra3NEQkF2OGdSMllYQlFieXhtRkhHQm13REtSYVhi?=
 =?gb2312?B?WTB2NFVaOW1zTkFaQm9FMG9OTVpHWHRiOWJMRTRJS0JaQXRRdjc1cW9TRlFS?=
 =?gb2312?B?cU1qVWhZQVo4ZHJ5T3JuSGZ6d3hQL3RseGJOeHBFdE5xVFAvdC9zL1g2dURi?=
 =?gb2312?B?THZEUWd5Um9Eck1keHpGMWR3S1lJMDJibjF5V1pQRTl2Rm9iWEtyeXc0WDJY?=
 =?gb2312?B?OGZseEZuVjZ5L3cwMCs0NjBNQjNsaEI4ZGRKUmxPdmNSOStzT0NIM0h5TUsx?=
 =?gb2312?B?NHZLdlFURFZRVGQwNzJEQU5xUzl1UEFiT291K3ZuMG5zaC9QWVIrR1ZoWi9W?=
 =?gb2312?B?VENmYy94QTcvSTRtbnJPdmJKb3FseWpscSsvRThHakYwYkRZOTRUNkowYTZN?=
 =?gb2312?Q?z8/4AEGM199xTBYkspYX2dOvh?=
Content-Type: text/plain; charset="gb2312"
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
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63612ab8-9049-4be0-1644-08de1da605e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 02:33:23.3878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /balrb7ryybMqaIkexoIrunCTKb6qWp6Mr/uh6zCRFQaGznKJiJFPUu9dO7U6Wo3sprk/Quj75FtgDn6o5urbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCam9ybiBIZWxnYWFzIDxoZWxn
YWFzQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDIwMjXE6jEx1MI3yNUgMjozNw0KPiBUbzogbGludXgt
cGNpQHZnZXIua2VybmVsLm9yZw0KPiBDYzogQ2hyaXN0aWFuIFppZ290emt5IDxjaHppZ290emt5
QHhlbm9zb2Z0LmRlPjsgTWFuaXZhbm5hbiBTYWRoYXNpdmFtDQo+IDxtYW5pQGtlcm5lbC5vcmc+
OyBtYWQgc2thdGVtYW4gPG1hZHNrYXRlbWFuQGdtYWlsLmNvbT47IFIgLiBUIC4NCj4gRGlja2lu
c29uIDxydGQyQHh0cmEuY28ubno+OyBEYXJyZW4gU3RldmVucyA8ZGFycmVuQHN0ZXZlbnMtem9u
ZS5uZXQ+Ow0KPiBKb2huIFBhdWwgQWRyaWFuIEdsYXViaXR6IDxnbGF1Yml0ekBwaHlzaWsuZnUt
YmVybGluLmRlPjsgTHVrYXMgV3VubmVyDQo+IDxsdWthc0B3dW5uZXIuZGU+OyBsdWlnaSBidXJk
byA8aW50ZXJtZWRpYWRjQGhvdG1haWwuY29tPjsgQWwNCj4gPGFsQGRhdGF6YXAubmV0PjsgUm9s
YW5kIDxyb2w3YW5kQGdteC5jb20+OyBIb25neGluZyBaaHUNCj4gPGhvbmd4aW5nLnpodUBueHAu
Y29tPjsgaHlwZXhlZEB5YWhvby5jb20uYXU7DQo+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnOyBkZWJpYW4tcG93ZXJwY0BsaXN0cy5kZWJpYW4ub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggMC8yXSBQQ0kvQVNQTTogQWxsb3cgcXVpcmtzIHRvIGF2b2lkIEwwcyBhbmQg
TDENCj4gDQo+IEZyb206IEJqb3JuIEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+DQo+IA0K
PiBXZSBlbmFibGVkIEFTUE0gdG9vIGFnZ3Jlc3NpdmVseSBpbiB2Ni4xOC1yYzEuICBmM2FjMmZm
MTQ4MzQgKCJQQ0kvQVNQTToNCj4gRW5hYmxlIGFsbCBDbG9ja1BNIGFuZCBBU1BNIHN0YXRlcyBm
b3IgZGV2aWNldHJlZSBwbGF0Zm9ybXMiKSBlbmFibGVkDQo+IEFTUE0gTDBzLCBMMSwgYW5kIChp
ZiBhZHZlcnRpc2VkKSBMMSBQTSBTdWJzdGF0ZXMuDQo+IA0KPiBMMSBQTSBTdWJzdGF0ZXMgYW5k
IENsb2NrIFBNIGluIHBhcnRpY3VsYXIgYXJlIGEgcHJvYmxlbSBiZWNhdXNlIHRoZXkNCj4gZGVw
ZW5kIG9uIENMS1JFUSMgYW5kIHNvbWV0aW1lcyBkZXZpY2Utc3BlY2lmaWMgY29uZmlndXJhdGlv
biwgYW5kIG5vbmUNCj4gb2YgdGhpcyBpcyBkaXNjb3ZlcmFibGUgaW4gYSBnZW5lcmljIHdheS4N
Cj4gDQo+IGRmNTE5MmQ5YmIwZSAoIlBDSS9BU1BNOiBFbmFibGUgb25seSBMMHMgYW5kIEwxIGZv
ciBkZXZpY2V0cmVlIHBsYXRmb3JtcyIpDQo+ICh2Ni4xOC1yYzMpIGJhY2tlZCBvZmYgYW5kIG9t
aXR0ZWQgQ2xvY2sgUE0gYW5kIEwxIFN1YnN0YXRlcy4NCj4gDQo+IEwwcyBhbmQgTDEgYXJlIGdl
bmVyaWNhbGx5IGRpc2NvdmVyYWJsZSwgYnV0IHNvbWUgZGV2aWNlcyBhZHZlcnRpc2UgdGhlbQ0K
PiBldmVuIHRob3VnaCB0aGV5IGRvbid0IHdvcmsgY29ycmVjdGx5LiAgVGhpcyBzZXJpZXMgaXMg
YSB3YXkgdG8gYXZvaWQgTDBzIGFuZA0KPiBMMSBpbiB0aGF0IGNhc2UuDQo+IA0KPiBCam9ybiBI
ZWxnYWFzICgyKToNCj4gICBQQ0kvQVNQTTogQ2FjaGUgTGluayBDYXBhYmlsaXRpZXMgc28gcXVp
cmtzIGNhbiBvdmVycmlkZSB0aGVtDQo+ICAgUENJL0FTUE06IEF2b2lkIEwwcyBhbmQgTDEgb24g
RnJlZXNjYWxlIFJvb3QgUG9ydHMNCg0KVGVzdGVkLWJ5OiBSaWNoYXJkIFpodSA8aG9uZ3hpbmcu
emh1QG54cC5jb20+DQoNCkJlc3QgUmVnYXJkcw0KUmljaGFyZCBaaHUNCg0KPiANCj4gIGRyaXZl
cnMvcGNpL3BjaWUvYXNwbS5jIHwgNDIgKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gIGRyaXZlcnMvcGNpL3Byb2JlLmMgICAgIHwgIDUgKystLS0NCj4gIGRyaXZl
cnMvcGNpL3F1aXJrcy5jICAgIHwgMTIgKysrKysrKysrKysrDQo+ICBpbmNsdWRlL2xpbnV4L3Bj
aS5oICAgICB8ICAxICsNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMjQg
ZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K

