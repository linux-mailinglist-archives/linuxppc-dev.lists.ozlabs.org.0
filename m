Return-Path: <linuxppc-dev+bounces-4784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2BAA042B7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2025 15:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSDDg6fmBz3bTM;
	Wed,  8 Jan 2025 01:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2608::600" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736260691;
	cv=pass; b=eRALXFqChkCMP+DF6IDShw4BI+6JW2vv3HeBlf98vkGjY0hqTQ11jPWP9Ih1mnSMrRxVFM3cxu42VcX6DmTLdggEGv2NmNBMfXHVlm5V9K/W2k1BpXmGeaAtBLjpq2XDHkayBqLJCEfP4lF9lN9+4hAy3tmgxwr4Kew6v1rU+B2rCcrZTEWJ8CrCmuDS5hYgdZMLcMLrIFo7ARL0a1plemq9caepy8A7DHZTWowGbnsY21OclHRG/TjXjbpXGsJS8Ka87vaoSlefhlwJlQuzgPBX+8SFFxtdWnCDySjqlREXSWtkKx9dYnbME2VILFVXAEEolaD5ncKvY9xkOhYoww==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736260691; c=relaxed/relaxed;
	bh=Tou2A62XUOC9VeyhkK82Uz3+DM5jkBwyVLg/r2ToCwg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TIEph08h4Z99mZY1IPvZ8arnBuoq2upzTPCpLtS4Jyf2hAyC3KYRiHs2eIAVP64sp/NZztn5PL5UD/gNkN/EcxHyFybXicZce+cbG7RM3sseVHlM3RlMtCay8MGGFf+CIpRUu7TmPq8VFzRRRhpC3DAYCFIxkIYbiGHdUk9UgBwb2jkuRHJ4Dp6do37KnycZ+8nV5FAHWe1rTOAFC1n9tJFRxrLBvXN/17NU+lJ1cRar44pXpOXOLgYkUjG3duyepsuRJ8qKXFp0RdAm835RNP9WKgEy1N72OMGcAqqlfMTKmhbgjdG4RgRcUKfuHXpTY7U++sgZqcc1aIkTJ7TTgg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=PUNoMnpj; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2608::600; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=PUNoMnpj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2608::600; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2608::600])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSDDf1r8Jz3bTD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 01:38:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxG/qRJeaifQQ8nZx6jGNfZYOy5FGfgD0Nf7ZAuJO2XqO86n2zuiXKJpNvwygEbF70T/goSHaq96uXLgeViJ8jdCItO8YUT9eH+ppHszz+5zY5qf7JXd1JI6/HEzDTYSfDkLAmWKO0QO7b4A2f2mGpxiqkUcfPGMbwfDIEBPAiUrMihkD5bDoMEvu10XT45TnzV8jFIT5CTBCR/1VDZva9zbPzISsGZmHVD+itAiyJ53+WPQZUKuYlBTFDEwu4WuWMp8xQw8UbTUviUPzToJT5wpY9cURQtXmvd4OQQPozM3QHeVJ4qXR70g2qxIAMRIk+NDGMtKPC2BgZ3/pguvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tou2A62XUOC9VeyhkK82Uz3+DM5jkBwyVLg/r2ToCwg=;
 b=LR90Y3XkaA+j4wdvVWEMhOopIqK5cmSZWJ8zWOqqqn0f4UsGVFbZFzyB4OxcJFhsNQNZoRys3jslPlFJlQweCoVz+eSp8Pc5Mo5Vj/47/z70qxkChZyPSgFsK+HepJcNP8rdv2NeJVRaXzXwgmJVgayDm9Bjp9CAVkkM6f2Hcq8bSDF6GE4r02CevXrn6jRubR5uRV6WFv610cjY6MgmVGghQGmE4m3x/UxU3q07k97dIlU7XegNVfg8Cv3HRgRde4lyiDICwk8g9rTFX92r0opn5EgY1ys2Db1xdoD0atPSG4tQ537uaBGNoZ6TwMAmGHVSA0OdgkoNFE+kaBU/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tou2A62XUOC9VeyhkK82Uz3+DM5jkBwyVLg/r2ToCwg=;
 b=PUNoMnpjFKFo080ntyUleKlw2odv22GUsg6RGX2a/41mzfm0DBI71zEKeP9ay2FpEWIUiD7Ggg/3xT878ld8ljCl1HBBbh0d1j71Y2jQilvH3ntCHwKXx/kybHRT9139APhCsaM4B6YIO2Na/3cG3Kzz6o4uNj4izEjP0fiVCZnz2SZIvtyDdcHFVcCQoJ8sKILyDrw+ALKL9vBU1DfBdSBBfUwGTYjLUvEhvQTErmtEzt+uhT3t2SOo8xpmHWe8s9qwUKEFaxEbwCcbtSArd6/2a5k/ur6bkvMIW/PEF/9UwT5Y88Pw8mINTIeXuN7enP7FkqNcSBl/ooGygQTR5w==
Received: from AS8PR07MB7447.eurprd07.prod.outlook.com (2603:10a6:20b:2ad::15)
 by AS8PR07MB7576.eurprd07.prod.outlook.com (2603:10a6:20b:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 14:37:42 +0000
Received: from AS8PR07MB7447.eurprd07.prod.outlook.com
 ([fe80::8713:e6f3:1f5b:cd6f]) by AS8PR07MB7447.eurprd07.prod.outlook.com
 ([fe80::8713:e6f3:1f5b:cd6f%3]) with mapi id 15.20.8314.013; Tue, 7 Jan 2025
 14:37:42 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Eric Biederman
	<ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, Dave Martin
	<Dave.Martin@arm.com>, Baoquan He <bhe@redhat.com>, Vivek Goyal
	<vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>, "binutils@sourceware.org"
	<binutils@sourceware.org>, "devel@daynix.com" <devel@daynix.com>
Subject: Re: [PATCH v3 3/6] powwerpc: Use note name macros
Thread-Topic: [PATCH v3 3/6] powwerpc: Use note name macros
Thread-Index: AQHbYQJt8vSyaxXYwEmBNk+ysBRLfLMLYWUA
Date: Tue, 7 Jan 2025 14:37:42 +0000
Message-ID: <ceb65b63-3b16-490b-adfb-daf8838bb54a@cs-soprasteria.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-3-99cb505b1ab2@daynix.com>
In-Reply-To: <20250107-elf-v3-3-99cb505b1ab2@daynix.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR07MB7447:EE_|AS8PR07MB7576:EE_
x-ms-office365-filtering-correlation-id: b5ddb174-25e0-4cd8-80d7-08dd2f28d833
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S1VhNmpJT3o3eHJGZEJIRWV0N2VpS3AzdXR6d3Qydlk4YnZrbnhLQVB1ZzVT?=
 =?utf-8?B?NUdLM0pRcllBQ1pmQzA4TGhmUVg3N0tNVzBKOEwwWXFuamFnMG8rODhrdWZV?=
 =?utf-8?B?bkFGc1BvbGM5KzNqRTJoM1l1Uk5KdVRuYWMxWUUweE9mZWxRdzF6WFVwQkJn?=
 =?utf-8?B?UHdueEF5Q3JDVDN0aktNYWpSVlVsVDBRTHZzK3I5ZnNNa2JlL3Juem9nSktL?=
 =?utf-8?B?aHRJTDYycndGSDVES1VpSXY2bDUvYldKOU1CdjR1Uk40ZVJhS3BpVTVKbFFW?=
 =?utf-8?B?M1FpcHc0S09nTTJETlRHb3Y0RHJZek9WQnU2c1p3cDdOOEVMRi9jTS9ITUdv?=
 =?utf-8?B?SGlObVVoYWJxalVWTFJWVEJRYUd3NzlUQnJSd3FRT2Uwd0ZXdEpBbDFxN3pQ?=
 =?utf-8?B?ekNLQ3QzdndaMGh1Y29QbElHWlFnaWcvY3M2K2V5L21yNEoyeVNXY1I5QzZO?=
 =?utf-8?B?ZjlvTnJWRy8wTS90elVkSkgwWWRNai9jUWxRMTZjL0lzMk00VjMyR3JHOUx1?=
 =?utf-8?B?bHdwbFJFRVlBZmpqYitsbEFvVjBXQ0duN05Cd09HZ0Rtcjc5RXJMSjdSVk15?=
 =?utf-8?B?RTZZZ3VlYmtucGExNG9zRUgwMk1mbnkrVnBMVE1UWnRRbXFsanRPUW5wc1gx?=
 =?utf-8?B?ZlR0QkFQNU1oazJETWFUOUFMOXNIazRudlhPU3VOL0FNb0tFTWlTajgvNG5Z?=
 =?utf-8?B?b3BrM3hZbHMyU2xHd2p1cFMvUHV6MXZJY0NvNTZKZDU1QzJ3YW5JKzZjUFpC?=
 =?utf-8?B?MkFocDFSWkpPWlZkQ0h0RnpGUENHbDExeWx4RTYxRDVIMmFjTFNqZ0tzM2hZ?=
 =?utf-8?B?eUN3Smc3UGEyQnlCMGptR3VWRnlnV3UrUGZidTc1dXE4dm94TnFQanYva2Nk?=
 =?utf-8?B?YjJ4S0M4WVNCWHFhZFREb2ZlcWJRblN1eTFuODFBdENISEFEeHZ1aElrMjN1?=
 =?utf-8?B?dUVZcU5EcUVOWlh6VHgxUUVtQjhTeUc3d1BObXBGRDdLQjdvUUZmaFI5a2Ew?=
 =?utf-8?B?ZENKQU96dFhoUVkxNk41dU9WT01BTEJyVkVtWWNlb21jejFqZVJHWTI0QzdF?=
 =?utf-8?B?dXQvWWRsMUJaalVCM3c1M3dLN2tuVEQ4ZllxTWxnRVFwUkNJSGJFeXExVEtX?=
 =?utf-8?B?cW9UcVdOOVFmQ3d5OVJLbEJKMjhjcWREaXZsYzJvaDA5bVhmajJFMTc3bHMx?=
 =?utf-8?B?OGE5bE5rc3hXamR0eHoyVXNXSzQ3L0xqMCtVUTEvVlV6c0lrUmlYY0NJZW9j?=
 =?utf-8?B?S3JIS0VDdHVpanVTcE5tM3krSFRLdm9XUnhlRlQxbWVwa0lGcldickpCUjQz?=
 =?utf-8?B?SWtWdFVhR0ZFdnIzQ3BGQTFsOEdodmdxNXF2N3p1elh6bnZxVGFDR3paUDh5?=
 =?utf-8?B?cjBpbEhlZkR1ZDUySWRMdytnZlpYcXVlY09aOUZQY0p0NVBvcUZCdmNla2tz?=
 =?utf-8?B?VFdFeVF1bFZ2b0pJT0dJU2QvZCtMV1lKaitIOFMybkx4dFdSV25hTjhNeWtl?=
 =?utf-8?B?Z0FaODI0UkUzdFFCSGcwYm1vTGYxNmRHeEtrb3hLelB1cFhLa2MwKzZaaWhr?=
 =?utf-8?B?TjNQRFNqdDIxZzNJcm9XenpCTGNPSGFrTXo2dWdmRVRlcEZyZTF5Ky9LR0ZB?=
 =?utf-8?B?UzhTUExuYjlqM3o1S3pXdmZ0RlJVQ0ZjaThUUUtDZU1KVnArZnhGMEhTUU5W?=
 =?utf-8?B?WUU1SUtJNmY4UFB2b3Y0YXpYUlY4K0FUMEt6S3RJMTlJV1lFdWRiaWhWVGVI?=
 =?utf-8?B?ekJjaHZLUFBRWm1kTmdVd0xna0RjcFpkci9ZazBBOEdjaHVKL2xCaUVFVzBn?=
 =?utf-8?B?U0Z6aWNLZ0REdkdQQjZpVUtnaCtTWHVyUzRXSmVoeDdqQ1MyZ29QNmRqMVVT?=
 =?utf-8?B?NDhQdndITzZQV3FUUVh3czQxbzRrOVBtSnV5UTlBSzdwVjBoQjlKZHc2dXFY?=
 =?utf-8?Q?Q9FS/TNbkwqLiYcVE8vdiAboFLZZOEMG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR07MB7447.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SWhaVmpHZ2R5Uk5tQTJWVVF5VGI2OVB3YTJ0MmxvWmVpWFNnZ2wza0xxaVpL?=
 =?utf-8?B?Ryt2VzA1ajhkSlE1c2Mramw3bGZhREtuMTJTOGFCMEpMeWpjZk5HbCtZeVlr?=
 =?utf-8?B?b2pvK3I4UWZTWlVmaFJzdC9neWYvQWxuWkN5TmpmYllLUWE5NjBIMGNzally?=
 =?utf-8?B?ejNKQmI1cFRvelo0UmlHeW1lZ1JGcElVM21WMlBtMVdyZmpjNDlwdWE2NUlm?=
 =?utf-8?B?USt1OE5XS2VDajJBaXlwWGJUQzNFSHNLRXdtR00waE4vNUMyS3NBbHpRVUxn?=
 =?utf-8?B?YThjZlptSThWRDdZaFltZFZMbW15YmMvYzVmVVpJaWx5Z0Vaamo1YXFLWjJu?=
 =?utf-8?B?YkxQOFpibjYwZVp2MEIxRTNaWDd5aXczZndxenhUeU00bWRxd0VTWFRhbElx?=
 =?utf-8?B?aWNuZ0RXQmREOEo0UDdDcXBCSnYzeGxkZWZDOGhIY2RyZzJMTjhTMWRzRVdE?=
 =?utf-8?B?N2FUc3g3QkJkMkhNSlh2M284a2Y1Nzg4b3ZyUlI3QkV3OURRMTlBZm1Uc1pr?=
 =?utf-8?B?SzZHYncyTG14SXVPWnJ5cUd1NEpuVWx5YlRlNWVWUlhJMmJqOGpibVVyY3ly?=
 =?utf-8?B?UkdHSXRnemhjejZTNUZFYU5aYmJkVmFaUlhXK3pnQzIrdHRDck1YT29iZkZi?=
 =?utf-8?B?d21Kc2xnNFlrQ0ZoTjdWMmg0bDZ6SnNIOWJ6eU5BRkY3TDM0VE9udW9RWU5j?=
 =?utf-8?B?MUJlOTd5V1pncTI4dUlxaFhlYWpTelRFMDB2ZkNPR25tQVYwMk5IMS9vSnUw?=
 =?utf-8?B?L1BxSXRxejZpN1ZEWE9iaUlNcnFpNi9tY2RVellwT3R0cDJoOFRKR05sOUo2?=
 =?utf-8?B?NHpuWlNBVGZiRlV5U0g3ZUVUV3VvY3hzbDN0WnJRK1ljWUhFVlR3VmVpcnRW?=
 =?utf-8?B?S0xYcnUyZ015b016d1VLODQ0Y2Q2T05PNDJZb1VJYkJjVGNiNHlQb0YvSENF?=
 =?utf-8?B?N09xZEZVVmRFOStjOXlGK2ZMN3VubG5hMnJtWDJ5RDVINUZ3SnFldU5qZ0tK?=
 =?utf-8?B?cjlaNE0vWERhR2I4S3RGbnpNNm5HNzBEV1FaRDlSOXNpWGlLMlNPcXpHQXV4?=
 =?utf-8?B?Z2NHKzM1QU5uRkY4UVU4ZFEzbVhwaVo1eHBMUWtaQmZjKzRSd0h6RE8rWFh2?=
 =?utf-8?B?bFB3ZnhOdTBQeXpObWhvN1p1cVFkZHBHSHJwV1ZjeXY5eVFhY21teE05b2Fl?=
 =?utf-8?B?UEF3VVdkSlRrYVFaeHNpWEc2QU1PaXMwZ3haWGs2TVAvOFZCZ2dzeFZQRm4x?=
 =?utf-8?B?K1REaytOZ3VkczRaR3NCZVZHSjZZSVBIME1DdS9rNW90QkNjNFdLMDB1ZWFJ?=
 =?utf-8?B?ODNUUGpPOTRqTnlGeXU4M0M3Q2pvTGd4bEVCNStVTmZWUjRqb2RVKzZ3ZENZ?=
 =?utf-8?B?Qm5HVGhTVDlKVCtsUlhLS2RsOHRIR1lnbVlPQi81cmdGS3ZSMm9McHQ1S1h1?=
 =?utf-8?B?Z1c3L09peTZma2xOZXlwd2dlMCtCTEZnSXNMQmtsZjBPUCtsUTFFSllyOW1q?=
 =?utf-8?B?RE1KRFJwb28yTWppUWZ5VWFwckNXQ0g2V3ZQNUdySnUxcFcwenR4R1NseUF4?=
 =?utf-8?B?TTd1Nm8rTG92UjNRT0wrUnU4MmVPZFhubjdWMkxHTG1MSTJKelJkbHlnanVj?=
 =?utf-8?B?UXYwdWx0Z3lIeVdjeDB4ZTcvWUpPN0x1eExEM3lJS01FSDlxMm9reUNJaHcr?=
 =?utf-8?B?bEtZblNaMmxQVXMzN1FPYTR6L0lwa0FkRndQb0dxK3NrZVNkQUkwTk96YmNz?=
 =?utf-8?B?TTVoSEgwK1JzTk9YOW54aEc1YnN2cTUxTThQSENkN3VEalN2ajdyR0V4UkRR?=
 =?utf-8?B?Vm9mU2FBTGVFanl0UGpONHQ5ejhldVUxNFI4RGV3dlJWUGNNeGxQbWVNdFNQ?=
 =?utf-8?B?ZkpGb1duZHZITXlyWlZvc0NFL09UY0JlVXlKRis2QTZ1ZGNMLzUrUE5meXl6?=
 =?utf-8?B?ck90M0J5eDN5M2ZYZ1IzcU5BaEdWeVg1cnZGZmVUV0hPUVA4NGpRRUIvRXFC?=
 =?utf-8?B?U1YxUmJvL0p5UnByNHhMRHVQQi9wVVVML2wvcS9Ia0MzdmlVSUpBWUZURXZa?=
 =?utf-8?B?S1BnSTRER2E2Q2tKRWFUOUQrZ2J2MG4vVjFKMFdiTTkxdzBGcG5VK0R4dGdo?=
 =?utf-8?B?QkZUYlhNUllxNWd4ZFVrcndaMmxYN292Qjl4ak5rTlJ6Y0I2cXhPS05ZYTFT?=
 =?utf-8?B?c3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B1F92D880573742B2F45685F8258343@eurprd07.prod.outlook.com>
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
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR07MB7447.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ddb174-25e0-4cd8-80d7-08dd2f28d833
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 14:37:42.8554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 25voWRYnYJRvad+OWkzpGVWJ5yDjA69BRzjSeUGBlikHKGRyauPirVwpRIvHnwOreEerfKjnCsAodjwebN9m539eGH+Q3Dj//Xik0dW2DkK8vJ12ibJqecrNjFvqwuyF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7576
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AS8PR07MB7447.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 93.17.236.2
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS8PR07MB7576.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

DQpMZSAwNy8wMS8yMDI1IMOgIDEzOjQ1LCBBa2loaWtvIE9kYWtpIGEgw6ljcml0wqA6DQo+IFVz
ZSBub3RlIG5hbWUgbWFjcm9zIHRvIG1hdGNoIHdpdGggdGhlIHVzZXJzcGFjZSdzIGV4cGVjdGF0
aW9uLg0KDQpJbiB0aGUgc3ViamVjdDoNCg0Kcy9wb3d3ZXJwYy9wb3dlcnBjDQoNCkNocmlzdG9w
aGUNCg0KDQo+IA0KPiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmhlQHJlZGhhdC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4g
LS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYyAgICAgICAgICAgICAgIHwgMiAr
LQ0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLWNvcmUuYyB8IDggKysr
Ky0tLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jIGIvYXJj
aC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYw0KPiBpbmRleCA0YjM3MWM3MzgyMTMuLmQ0NDM0OWZl
OGUyYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9mYWR1bXAuYw0KPiArKysg
Yi9hcmNoL3Bvd2VycGMva2VybmVsL2ZhZHVtcC5jDQo+IEBAIC03NTEsNyArNzUxLDcgQEAgdTMy
ICpfX2luaXQgZmFkdW1wX3JlZ3NfdG9fZWxmX25vdGVzKHUzMiAqYnVmLCBzdHJ1Y3QgcHRfcmVn
cyAqcmVncykNCj4gICAJICogcHJzdGF0dXMucHJfcGlkID0gPz8/Pw0KPiAgIAkgKi8NCj4gICAJ
ZWxmX2NvcmVfY29weV9yZWdzKCZwcnN0YXR1cy5wcl9yZWcsIHJlZ3MpOw0KPiAtCWJ1ZiA9IGFw
cGVuZF9lbGZfbm90ZShidWYsIENSQVNIX0NPUkVfTk9URV9OQU1FLCBOVF9QUlNUQVRVUywNCj4g
KwlidWYgPSBhcHBlbmRfZWxmX25vdGUoYnVmLCBOTl9QUlNUQVRVUywgTlRfUFJTVEFUVVMsDQo+
ICAgCQkJICAgICAgJnByc3RhdHVzLCBzaXplb2YocHJzdGF0dXMpKTsNCj4gICAJcmV0dXJuIGJ1
ZjsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYv
b3BhbC1jb3JlLmMgYi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1jb3JlLmMN
Cj4gaW5kZXggYzlhOWI3NTljYzkyLi5hMzc5ZmY4NmMxMjAgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcG93ZXJudi9vcGFsLWNvcmUuYw0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL3Bvd2VybnYvb3BhbC1jb3JlLmMNCj4gQEAgLTE0OSw3ICsxNDksNyBAQCBz
dGF0aWMgRWxmNjRfV29yZCAqX19pbml0IGF1eHZfdG9fZWxmNjRfbm90ZXMoRWxmNjRfV29yZCAq
YnVmLA0KPiAgIAkvKiBlbmQgb2YgdmVjdG9yICovDQo+ICAgCWJ1ZnBbaWR4KytdID0gY3B1X3Rv
X2JlNjQoQVRfTlVMTCk7DQo+ICAgDQo+IC0JYnVmID0gYXBwZW5kX2VsZjY0X25vdGUoYnVmLCBD
UkFTSF9DT1JFX05PVEVfTkFNRSwgTlRfQVVYViwNCj4gKwlidWYgPSBhcHBlbmRfZWxmNjRfbm90
ZShidWYsIE5OX0FVWFYsIE5UX0FVWFYsDQo+ICAgCQkJCW9jX2NvbmYtPmF1eHZfYnVmLCBBVVhW
X0RFU0NfU1opOw0KPiAgIAlyZXR1cm4gYnVmOw0KPiAgIH0NCj4gQEAgLTI1Miw3ICsyNTIsNyBA
QCBzdGF0aWMgRWxmNjRfV29yZCAqIF9faW5pdCBvcGFsY29yZV9hcHBlbmRfY3B1X25vdGVzKEVs
ZjY0X1dvcmQgKmJ1ZikNCj4gICAJICogY3Jhc2hpbmcgQ1BVJ3MgcHJzdGF0dXMuDQo+ICAgCSAq
Lw0KPiAgIAlmaXJzdF9jcHVfbm90ZSA9IGJ1ZjsNCj4gLQlidWYgPSBhcHBlbmRfZWxmNjRfbm90
ZShidWYsIENSQVNIX0NPUkVfTk9URV9OQU1FLCBOVF9QUlNUQVRVUywNCj4gKwlidWYgPSBhcHBl
bmRfZWxmNjRfbm90ZShidWYsIE5OX1BSU1RBVFVTLCBOVF9QUlNUQVRVUywNCj4gICAJCQkJJnBy
c3RhdHVzLCBzaXplb2YocHJzdGF0dXMpKTsNCj4gICANCj4gICAJZm9yIChpID0gMDsgaSA8IG9j
X2NvbmYtPm51bV9jcHVzOyBpKyssIGJ1ZnAgKz0gc2l6ZV9wZXJfdGhyZWFkKSB7DQo+IEBAIC0y
NzksNyArMjc5LDcgQEAgc3RhdGljIEVsZjY0X1dvcmQgKiBfX2luaXQgb3BhbGNvcmVfYXBwZW5k
X2NwdV9ub3RlcyhFbGY2NF9Xb3JkICpidWYpDQo+ICAgCQlmaWxsX3Byc3RhdHVzKCZwcnN0YXR1
cywgdGhyZWFkX3BpciwgJnJlZ3MpOw0KPiAgIA0KPiAgIAkJaWYgKHRocmVhZF9waXIgIT0gb2Nf
Y29uZi0+Y3Jhc2hpbmdfY3B1KSB7DQo+IC0JCQlidWYgPSBhcHBlbmRfZWxmNjRfbm90ZShidWYs
IENSQVNIX0NPUkVfTk9URV9OQU1FLA0KPiArCQkJYnVmID0gYXBwZW5kX2VsZjY0X25vdGUoYnVm
LCBOTl9QUlNUQVRVUywNCj4gICAJCQkJCQlOVF9QUlNUQVRVUywgJnByc3RhdHVzLA0KPiAgIAkJ
CQkJCXNpemVvZihwcnN0YXR1cykpOw0KPiAgIAkJfSBlbHNlIHsNCj4gQEAgLTI4Nyw3ICsyODcs
NyBAQCBzdGF0aWMgRWxmNjRfV29yZCAqIF9faW5pdCBvcGFsY29yZV9hcHBlbmRfY3B1X25vdGVz
KEVsZjY0X1dvcmQgKmJ1ZikNCj4gICAJCQkgKiBBZGQgY3Jhc2hpbmcgQ1BVIGFzIHRoZSBmaXJz
dCBOVF9QUlNUQVRVUyBub3RlIGZvcg0KPiAgIAkJCSAqIEdEQiB0byBwcm9jZXNzIHRoZSBjb3Jl
IGZpbGUgYXBwcm9wcmlhdGVseS4NCj4gICAJCQkgKi8NCj4gLQkJCWFwcGVuZF9lbGY2NF9ub3Rl
KGZpcnN0X2NwdV9ub3RlLCBDUkFTSF9DT1JFX05PVEVfTkFNRSwNCj4gKwkJCWFwcGVuZF9lbGY2
NF9ub3RlKGZpcnN0X2NwdV9ub3RlLCBOTl9QUlNUQVRVUywNCj4gICAJCQkJCSAgTlRfUFJTVEFU
VVMsICZwcnN0YXR1cywNCj4gICAJCQkJCSAgc2l6ZW9mKHByc3RhdHVzKSk7DQo+ICAgCQl9DQo+
IA0KDQo=

