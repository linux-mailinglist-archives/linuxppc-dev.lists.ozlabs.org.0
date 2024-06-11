Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1675903F37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2024 16:51:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=R9QgrCto;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzBTQ4Nq1z3d87
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 00:51:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=R9QgrCto;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzBSg0wPGz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:51:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNTawylhmmvM58cRw78JcwwqsmIaMLjncGIvpV0qoECaB9bLB9/huHmIaB7OWnWDKquJ2VQJoRQyUT108UCQcPJM8HA8iviMuqURZ2yImtEhnn8kKO7VWr+zaA+Yj0rvUrXpa7fjbp61nKNhYG7eJT8uDf5tOyKiwLb0+tZwTJ3B8gufF3rlmwN6F/uPRF7zcqcIF0vNa5Osu0NiE436O/rrhHaijyKYg7HjNXd5lsB+UzLmLVhqVEgfYIGbaBxa9iG4ah6j/ISqah2Uc2xUmesKvBpXc2B6nfFoGQoXPtFixPPJz06FJgTeakTaKcUl4bckn5/vtep8PezN27Wr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+/lc1fZgOPkkXC43fXR//G2t4EwHtWQaACFGP0A7k4=;
 b=S6uAknA9386uipYuoHOAqV3VjuwCh1IcErCXzn2Y1ajv5OJhd6eOgdomIjXbm62yxpNmyKxg2KYnveBs9EUdZUAd2N1wbbGEdgwnKGik1QNZ4IjtchjthPGvfiEXxpjmpHZP+aDaTVcpbrlOlKT25BVAqf/lvn3mDRaKh/WpriwTDZ/sbX/RLFhADU9dOxRZ5NG0EqdZgQG94IA7UnxhuH8mUjOR729b95R5LY1c4ftZeUMWvkH+pf2cR7LNz60skfbLIyxt2aIeMwY2EcqQpuTto8ZBGrxlATvI2pWu2VIB7ii+4ZiKXcTwXcgEvBit3ggVb435oJCfKO+IQs8sAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+/lc1fZgOPkkXC43fXR//G2t4EwHtWQaACFGP0A7k4=;
 b=R9QgrCtofz072ZcH/A1S/QBEQmEN9i/qmW62Bph+5U7Rn2goHISgpkmE6Qx3fuB4WEl8Jo+TlpX5wD1tC//XHub1yW5zRu4sGxdfhzie3H67FsZXeT4P10YuSHs/R7XLJsv8kJn9AXufAzlg4e11IXQ8RvmnOQ/7LwHLoHEnaWSfLP/3I87x+vJLGJmGBOy1PZtY2+5Al+Gp7vF/uX42dsIMTN3CbZs2BYH1qDjCFhQxdF3TFQJ9/voFK+pwig059XfQlYpg1pQRWKMwfR7iFEXMrO2hBJIRA27x+inGb2yJvKVjp0FXe33cBVSthzaOHaXAehZHu+D6whkT3a0Euw==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by DU2PR07MB8174.eurprd07.prod.outlook.com (2603:10a6:10:273::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 14:50:47 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7633.033; Tue, 11 Jun 2024
 14:50:46 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Topic: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Index: AQHau+KLGQQ/eNTTsES+mAG/hC7cQrHCpbYA
Date: Tue, 11 Jun 2024 14:50:46 +0000
Message-ID: <9ed345d5-aa1e-48e3-8dfc-d0c8e47db1c2@cs-soprasteria.com>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain>
In-Reply-To: <ZmgaHyS0izhtKbx6@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|DU2PR07MB8174:EE_
x-ms-office365-filtering-correlation-id: dde6b641-2410-4d33-bb4b-08dc8a25e0ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|376006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info:  =?utf-8?B?SSs3elNoTVdkTVF1elVaNlVkaWJmZmpqQWRXYzFCOU9Sb3o1bCtkTzQ4SFph?=
 =?utf-8?B?YTluWWhTOHZnVDR1Q3FMeUtpUEx5NUc1bVIzNHZQaU1FRHRWdlFlN2J1V3RK?=
 =?utf-8?B?RjRhQXYzQXlqc2ZBWHczYVJPemw1TGxDVlNBWXhKMC9zMGt3OTd0WkxnVS8w?=
 =?utf-8?B?MXh4SkcyYUNKMjNyRGRmM2c3MEJQcnJWcURNL2JmS21aejBBV1VqKzVoSHRM?=
 =?utf-8?B?aVBxQU9iaEh1Z1pVRTB0Y0FlbmdvWEFqNG05eDZjS001cjlQL0tHUjVrWW1a?=
 =?utf-8?B?c2tkZ2hTUzA4bU1JZ1NvWTk2b2tpamlIUWlWdEx4UnRqOU1ETkw4aUovdDhn?=
 =?utf-8?B?ZjdjL2ZoMnZBN3hlRW5lZDhHOVRSQ0s4SFloUE92LzdweWVJdTFyWUU4c2pa?=
 =?utf-8?B?cXRKL2xmUUJGL04wSWhmeUdWR3hUMVNPcWJGaDZla1IrZ014T1V2MjE4ZnJj?=
 =?utf-8?B?RXlyaFBFN3pVRDlxU1lrdnA0VXFNWTFKNkJoTUpDNUhnK21DSlY5TG1GOWkr?=
 =?utf-8?B?NkdBMm5yTWhuWU5EWkdLWm5McmdRcUtob2JWT2JIRzFOMzcwdDMxRlp0Wkwr?=
 =?utf-8?B?Yks5VlJnSXM3TWx4TlpBYWhqUlBuSFNIVTZ1KzhSU3pSQUxlM09SWmNoSDNF?=
 =?utf-8?B?MmdUTkdjQWV1ODRxc2pVck0yaC9sRnlnTlNFRldOVHAzMjh6Y1Y3dEFMbi9T?=
 =?utf-8?B?SEF1cGVzdlJzVm1QWElFejdDS2R3NCsyM20vUi9kcmhkS3cyOTVRSjY4Yy9R?=
 =?utf-8?B?RHVoeVFrVXp3a2ZMS290WmF4OUs2bzNHSUFFZXJwUCtMa1pKOEVLQUh5UEhG?=
 =?utf-8?B?WGQ4Wnd5OTcvRGd2bTdncHZ2djlyV3pNNUFHZ3dFbUV5T3g1c3hwT0xGRkV4?=
 =?utf-8?B?Z0hOTjlwUGN5c0NNa2w2L0dXWUNLelZUTHZqb0pvOWZ1WTNCdGEwSjlIV0ta?=
 =?utf-8?B?Q3ltVUg1SkoxWXZSWXNnRERjY2xEaDJEdFhXRlZFaTM4b1p1ejFLQmRtSDRw?=
 =?utf-8?B?RGQwNnl5R0o4RFFLRXZYSFUydjhWTnMxN2NaeEdjVkFhQzRoMmVtNEg4M0F4?=
 =?utf-8?B?NExpS1FzVFAvMFIyR2ZyT3lEc3Y5Q0IzSUhPUUtXTVZ0MDg4SWxiUEw0b2VR?=
 =?utf-8?B?WmV5Y0VEZEFOY1lHVTdtZklZN3VZWEdoNjExRFV2RjFBdndvOTBJQkRvZWoz?=
 =?utf-8?B?L2ZwN3VXUWt0T0VWMFE0ejV5Qi9XWUhyTi9ERDEyNVZkYkxWZi9iMnJLTnNS?=
 =?utf-8?B?c1VZdnFNT2lyOTU2czdQTnlLNmhSNnlWb2NGMmlVQmFrWm40QXdObUZ6U0RZ?=
 =?utf-8?B?UjJMd1VUcDVVVDlySVpKb3I4OU50SWMxT29wOXgwMGMrU0Q0TXViWDQzUXRj?=
 =?utf-8?B?OTFZczZiV0dVWkVocDlONHV0eVF4QThwMElMU3BKSzh2SU5Gd2ZYeEY1RnU1?=
 =?utf-8?B?OGNXTmQ4b3dIZGFhL3dyc0Z4TytnQkplWXFXa1hSaWhmRWdGZGE1Ym9JTWJM?=
 =?utf-8?B?SFV1ZmFVZ0FIYzZRcXh1L0V6U3NPS25KdkJBN2dUdEo1WmRBQjgzb0N2VlUw?=
 =?utf-8?B?VllzMm5lUlYyUGhaZVJhdE9VU2lzbEdNUWx1cFRUNEhjV3RiVDU3MjdxTFdR?=
 =?utf-8?B?WXBxTDAyUDZUT3NnZGNycm4rNVVoWlFOQnpRa0Zpb3FmVUhNUUsrMENmSTVm?=
 =?utf-8?B?cXNmUEtqQ2NSTEZRZ3Fxa0NLL3lqMk1CNjBrOXN4SGdpT3N1cUVTdW02Q1kv?=
 =?utf-8?B?R0tXZzRqYkF0TkQzTW5KT000VHpQdU9tOFlhMXRCYVd4Vi8vVjZiTjc4dndt?=
 =?utf-8?Q?zDB9RezybyfFVkDLxH8hjnq1AeEAA30lZ8LsQ=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFNXZWc4eXFQQUJDSzU3VGlEZTFCdENvU2JYM2pSd0EycVFmQlhmZno4NlIr?=
 =?utf-8?B?ZzR3U0tQYStSNTdMUWNBbHZBNHE1R3NEUTgwK08zYVcxR0k5d3RLS2NtaUJj?=
 =?utf-8?B?djhuZ3BsZ0kxZDZLTnYxNlE3OEVCZ3lKRDhmWVFDUW5NMDRsZGxMWkZmQmg4?=
 =?utf-8?B?eXVGOVdiZEZWaGljZDRxczJxU0RnU2EvTGc1NnRKbkIzT0szL1RrcjBpbWJw?=
 =?utf-8?B?YXMySUpXYXZuSXlTenpBYi8zT2wzV3FSNXNiNUxUK2JicjVuVXdZcWhpTE9i?=
 =?utf-8?B?LzhuS1RoVjF4OHBOZ20yQXhKVEhiZWY1UXk0SnZrZDlEaU1yMGtrL2Z6M2ZD?=
 =?utf-8?B?WFBuTks3K3h0UGJhbExZLzRYZXRzbnBaQndRdWdsRUc1aHZOZzdYNEh0dllY?=
 =?utf-8?B?U3pmem9odGE1aXFIc1UxTEM2OFhoMVgxaFpBVVVwanJsMDJSS2duYmVET0Uy?=
 =?utf-8?B?d0FMTENoSEtmQTA2K0RHOFRtWTZLUVo5amI2Wm9MWjYzSHBOSHdzWmZlRVlz?=
 =?utf-8?B?NCt2akFDRGJTZXJha21SWHRsRWt2UFJPVHhidTRUZElnc3VpMkhwWi9RWmNv?=
 =?utf-8?B?Wk1CMWUxT0FxNFNLMnBKb3BKemtkeDY1ZjZEeHZZaFZmMElQdCtTMWJyeWRK?=
 =?utf-8?B?bDVyRE0xOHcvZy9yYzU5QVNYSjUxMk1hZ1lIR0Y4eUVLV2d6U0R6WDd0Wjh6?=
 =?utf-8?B?d3BFY0FBY1dsc2pMNzcwck5scGx1RnZnelJIWnhuQndzSkd2Tmg5Mk10Y3Bx?=
 =?utf-8?B?VENQZnV6NHVNYjh5a2F3RnEwU05JT3R6dlRreGZOck53Z1RxZ3dmQVM1QWVK?=
 =?utf-8?B?MmZMQmg3UFBUanN5SnRQYXVjQzFYdHRnbVpOd0pEalYxYUxUR0FrK3M1NnV0?=
 =?utf-8?B?Q2FIK0pYMGV3OVRsOEI2TjFjL09zb0dvNWZtcUpvUlIrZ1RraWNSSEhvSmlp?=
 =?utf-8?B?TGxDVDR0Z2d5ZzhqRDR6TUxYTmppSlNXd1R5YjhLYWgySEE0dHNhV1YxN1pu?=
 =?utf-8?B?dG8xSGhSWmxOaXlNK0tTampvSmpHQWNnTkhhbkdRS2VEYXF0RmZYa1dQdkFD?=
 =?utf-8?B?bFQ2dVdSbnhMU0c0WWlyVlZFUmpjTzVUMm5rWFRhRDZSN0dSNndMazZkZ0Y1?=
 =?utf-8?B?YjNlYkVLemx0U1JpOWpxZUszN3IvNDJuOXJaM0RMT1lHNVVLTityRkdEeE1x?=
 =?utf-8?B?YlBqZVdBNjVOTFhWOHFUYStxczdINEVJRmNYc1pHNWxweU5sRnMvMi9jdGxm?=
 =?utf-8?B?YjdEN2l5U3NGaDZVMEdrVDZ1WGpTWFk4dVltNU9vUCsyVXhvdi9wMnR1ZGds?=
 =?utf-8?B?ajNYNndEL3VjK2VEbHpxS1I0VXlVOUFPQzltaWJ3a3VLbkVIVHpodk5WSFhW?=
 =?utf-8?B?ZW9lMkt0OFE0TWwvMVRqRVA3OFNjOFQ0TXVWNTlnYzAyQVo5bGl5d2puRzgr?=
 =?utf-8?B?bytXOE5MVGMydlRheDkzbFp1eUwzdEdJOUdKcExxbWlsWllGdCtOOHJXOWtQ?=
 =?utf-8?B?Y1NKdXltRXR5YXBRWG1naFg2cjV6V3hqb0h1bjczK2lPeW1vSFJXRFhKTDdW?=
 =?utf-8?B?VnFvNnE2RGVXTDVEbnRCVWRKYktodHNKR2xlTmJSc3RHMnZPOXpMWmpOamZr?=
 =?utf-8?B?TXFNSS92UDFMdkNvSUduWVlDejdqSk14ZDVMRHlTT0RyOVkvcncvd2tHTS9M?=
 =?utf-8?B?NW9NVnNoK0tPMkVxNm1qRjVQRHVLd3ZlL1pzREtzOWo1amNLUGJiUkdLQWFZ?=
 =?utf-8?B?d1dXNjQ0QnFyRFJ5L1R2UVFDU0Y0eHJYY2gvU24rQTlNQTE3dFhNekFPZFpL?=
 =?utf-8?B?L0RhNThxNWp0OXBhZmpXN1dTUjFBYm95c0NFZzNDRVh4MEthd2VXdER4V0pN?=
 =?utf-8?B?aXp1eXFWeTZEazd5QTc0QnJSc3V1aUk2VE4yRnh2cU5UNWpoRnVtSkRpNkxh?=
 =?utf-8?B?Q1hQMHhZZFlOV042SVZ1dkI4eUZOREZmZVpNbnZjVjBmMUc5dncvYUlIR1Rw?=
 =?utf-8?B?TitWT0xhbEpPTHBvaDk4REFNMEU4eTZKRms3VnZYVm9BR3RnZjEyRGszVVRY?=
 =?utf-8?B?ZzRBOEUza25tK1VVWHdTZzZQQjZPSFV0bE80RE1OOEd6RDJabDdldE9jVUJX?=
 =?utf-8?B?WVQ5R1Z0SW5xUk1QMEgyMFJKT3JwK1poZ1JYbnNnUXh6VGtWZ3RoVmVvN2kw?=
 =?utf-8?B?TC9wRVRLT3dMT25DdWZtYWtPQzNuSVluTWxtTThYS2NMZ3VZM2xFZDhsdHJv?=
 =?utf-8?Q?2ppr4Kt+ySwL+jBye/y0TRYxCARqhsiiIPDeGe2CmI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3DD985F17282674A981F8FEBE85C10CA@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dde6b641-2410-4d33-bb4b-08dc8a25e0ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 14:50:46.8268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpYHl3X7Z77c9Ne2sqvApLGBbGwppTmJ/OkPVkuvk7iy7W2ck11DQvXwwNYvrTShW880/YfxqdyWH9B2CnehmJGKL6pNfXqxKJBdEQICH+VTb+a2z+WCro4FdZvsQHCo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8174
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
X-OrganizationHeadersPreserved: DU2PR07MB8174.eurprd07.prod.outlook.com
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

DQoNCkxlIDExLzA2LzIwMjQgw6AgMTE6MzQsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG9zYWx2YWRvckBz
dXNlLmRlLiBEP2NvdXZyZXogcG91cnF1b2kgY2VjaSBlc3QgaW1wb3J0YW50ID8gaHR0cHM6Ly9h
a2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIE1vbiwgSnVu
IDEwLCAyMDI0IGF0IDA3OjU0OjQ3QU0gKzAyMDAsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+
PiBPbiBwb3dlcnBjIDh4eCwgd2hlbiBhIHBhZ2UgaXMgOE0gc2l6ZSwgdGhlIGluZm9ybWF0aW9u
IGlzIGluIHRoZSBQTUQNCj4+IGVudHJ5LiBTbyBhbGxvdyBhcmNoaXRlY3R1cmVzIHRvIHByb3Zp
ZGUgX19wdGVfbGVhZl9zaXplKCkgaW5zdGVhZCBvZg0KPj4gcHRlX2xlYWZfc2l6ZSgpIGFuZCBw
cm92aWRlIHRoZSBQTUQgZW50cnkgdG8gdGhhdCBmdW5jdGlvbi4NCj4+DQo+PiBXaGVuIF9fcHRl
X2xlYWZfc2l6ZSgpIGlzIG5vdCBkZWZpbmVkLCBkZWZpbmUgaXQgYXMgYSBwdGVfbGVhZl9zaXpl
KCkNCj4+IHNvIHRoYXQgYXJjaGl0ZWN0dXJlcyBub3QgaW50ZXJlc3RlZCBpbiB0aGUgUE1EIGFy
Z3VtZW50cyBhcmUgbm90DQo+PiBpbXBhY3RlZC4NCj4+DQo+PiBPbmx5IGRlZmluZSBhIGRlZmF1
bHQgcHRlX2xlYWZfc2l6ZSgpIHdoZW4gX19wdGVfbGVhZl9zaXplKCkgaXMgbm90DQo+PiBkZWZp
bmVkIHRvIG1ha2Ugc3VyZSBub2JvZHkgYWRkcyBuZXcgY2FsbHMgdG8gcHRlX2xlYWZfc2l6ZSgp
IGluIHRoZQ0KPj4gY29yZS4NCj4gDQo+IEhpIENocmlzdG9waGUsDQo+IA0KPiBOb3cgSSBhbSBn
b2luZyB0byBnaXZlIHlvdSBhIGhhcmQgdGltZSwgc28gc29ycnkgaW4gYWR2YW5jZS4NCj4gSSBz
aG91bGQgaGF2ZSByYWlzZWQgdGhpcyBiZWZvcmUsIGJ1dCBJIHdhcyBub3QgZnVsbHkgYXdhcmUg
b2YgaXQuDQo+IA0KPiBUaGVyZSBpcyBhbiBvbmdvaW5nIGVmZm9ydCBvZiB1bmlmeWluZyBwYWdl
d2Fsa2VycyBbMV0sIHNvIGh1Z2V0bGIgZG9lcyBub3QgaGF2ZQ0KPiB0byBiZSBzcGVjaWFsLWNh
c2VkIGFueW1vcmUsIGFuZCB0aGUgb3BlcmF0aW9ucyB3ZSBkbyBmb3IgVEhQIG9uIHBhZ2UtdGFi
bGUgYmFzaXMNCj4gd29yayBmb3IgaHVnZXRsYiBhcyB3ZWxsLg0KPiANCj4gVGhlIG1vc3Qgc3Bl
Y2lhbCBiaXQgYWJvdXQgdGhpcyBpcyBodWdlX3B0ZXBfZ2V0Lg0KPiBodWdlX3B0ZXBfZ2V0KCkg
Z2V0cyBzcGVjaWFsIGhhbmRsZWQgb24gYXJtL2FybTY0L3Jpc2N2IGFuZCBzMzkwLg0KPiANCj4g
YXJtNjQgYW5kIHJpc2N2IGlzIGFib3V0IGNvbnQtcG1kL3B0ZSBhbmQgcHJvcGFnYXRlIHRoZSBk
aXJ0eS95b3VuZyBiaXRzIGJpdHMsIHNvIHRoYXQNCj4gaXMgZmluZSBhcyB3YWxrZXJzIGNhbiBh
bHJlYWR5IHVuZGVyc3RhbmQgdGhhdC4NCj4gczM5MCBpcyBhIGZ1bm55IG9uZSBiZWNhdXNlIGl0
IGNvbnZlcnRzIHB1ZC9wbWQgdG8gcHRlIGFuZCB2aWNldmVyc2EsIGJlY2F1c2UgaHVnZXRsYg0K
PiAqd29ya3MqIHdpdGggcHRlcywgc28gYmVmb3JlIHJldHVybmluZyB0aGUgcHRlIGl0IGhhcyB0
byB0cmFuc2ZlciBhbGwNCj4gYml0cyBmcm9tIFBVRC9QTUQgbGV2ZWwgaW50byBhIHNvbWV0aGlu
ZyB0aGF0IFBURSBsZXZlbCBjYW4gdW5kZXJzdGFuZC4NCj4gQXMgeW91IGNhbiBpbWFnaW5lLCB0
aGlzIGNhbiBiZSBnb25lIGFzIHdlIGFscmVhZHkgaGF2ZSBhbGwgdGhlDQo+IGluZm9ybWF0aW9u
IGluIFBVRC9QTUQgYW5kIHRoYXQgaXMgYWxsIHBhZ2V3YWxrZXJzIG5lZWQuDQo+IA0KPiBCdXQg
d2UgYXJlIGxlZnQgd2l0aCB0aGUgb25lIHlvdSB3aWxsIGludHJvZHVjZSBpbiBwYXRjaCM4Lg0K
PiANCj4gOE1CIHBhZ2VzIGdldCBtYXBwZWQgYXMgY29udC1wdGUsIGJ1dCBhbGwgdGhlIGluZm9y
bWF0aW9uIGlzIHN0b3JlZCBpbg0KPiB0aGUgUE1EIGVudHJpZXMgKHNpemUsIGRpcnRpbmVzcywg
cHJlc2VudCBldGMpLg0KDQpJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4u
DQoNCkluIG15IGNhc2UsIHRoZSBQTUQgZW50cnkgaXMgYWxtb3N0IHN0YW5kYXJkLCB0aGUgb25s
eSB0aGluZyBpdCBjb250YWlucyANCmlzIGEgYml0IHRlbGxpbmcgdGhhdCB0aGUgcG9pbnRlZCBQ
VEVzIGFyZSB0byBiZSBtYXBwZWQgOE0uDQoNCj4gaHVnZV9wdGVwX2dldCgpIHdpbGwgcmV0dXJu
IHRoZSBQTUQgZm9yIDhNQiwgYW5kIHNvIGFsbCBvcGVyYXRpb25zIGh1Z2V0bGINCj4gY29kZSBw
ZXJmb3JtcyB3aXRoIHdoYXQgaHVnZV9wdGVwX2dldCByZXR1cm5zIHdpbGwgYmUgcGVyZm9ybWVk
IG9uIHRob3NlIFBNRHMuDQoNCkluZGVlZCBubywgbXkgaHVnZV9wdGVwX2dldCgpIGRvZXNuJ3Qg
cmV0dXJuIHRoZSBQTUQgYnV0IHRoZSBQVEUuDQoNCj4gDQo+IFdoaWNoIGJyaW5ncyBtZSB0byB0
aGlzIHBvaW50Og0KPiANCj4gSSBkbyBub3QgdGhpbmsgX19wdGVfbGVhZl9zaXplIGlzIG5lZWRl
ZC4gQUZBSUNTLCBpdCBzaG91bGQgYmUgZW5vdWdoIHRvIGRlZmluZQ0KPiBwbWRfbGVhZiBvbiA4
eHgsIGFuZCByZXR1cm4gOE1CIGlmIGl0IGlzIGEgOE1CIGh1Z2VwYWdlLg0KDQpJZiBJIGRlY2xh
cmUgaXQgYXMgYSBQTUQgbGVhZiwgdGhlbiBtYW55IHBsYWNlcyB3aWxsIGV4cGVjdCB0aGUgUFRF
IA0KZW50cnkgdG8gYmUgdGhlIFBNRCBlbnRyeSwgd2hpY2ggaXMgbm90IHRoZSBjYXNlIGhlcmUu
IEFzIGZhciBhcyBJIA0KdW5kZXJzdGFuZCwgaW4gb3JkZXIgdGhhdCB0aGUgd2Fsa2VyIHdhbGtz
IGRvd24gdG8gdGhlIHBhZ2UgdGFibGUsIHdlIA0KbmVlZCBpdCBmbGFnZWQgYXMgbm9uLWxlYWYg
YnkgUE1ELWxlYWYuDQoNCj4gDQo+ICAgICAjZGVmaW5lIHBtZF9sZWFmIHBtZF9sZWFmDQo+ICAg
ICBzdGF0aWMgaW5saW5lIGJvb2wgcG1kX2xlYWYocG1kX3QgcG1kKQ0KPiAgICAgew0KPiAgICAg
ICAgICAgIHJldHVybiBwbWRfdmFsKHBtZCkgJiBfUE1EX1BBR0VfOE0pOw0KPiAgICAgfQ0KPiAN
Cj4gICAgIGFuZCB0aGVuIHBtZF9sZWFmX3NpemUgdG8gcmV0dXJuIF9QTURfUEFHRV84TS4NCj4g
DQo+IFRoaXMgd2lsbCBoZWxwIGJlY2F1c2Ugb24gdGhlIG9uZ29pbmcgZWZmb3J0IG9mIHVuaWZ5
aW5nIGh1Z2V0bGIgYW5kDQo+IGdldHRpbmcgcmlkIG9mIGh1Z2VfcHRlcF9nZXQoKSBbMV0sIHBh
Z2V3YWxrZXJzIHdpbGwgc3R1bWJsZSB1cG9uIHRoZQ0KPiA4bWItUE1EIGFzIHRoZXkgZG8gZm9y
IHJlZ3VsYXIgUE1Ecy4NCg0KQnV0IEFGQUlVLCBpdCB3b24ndCB3b3JrIHRoYXQgc2ltcGxlLCBi
ZWNhdXNlICpwbWQgaXMgZGVmaW5pdGVseSBub3QgYSANClBURSBidXQgc3RpbGwgYSBwb2ludGVy
IHRvIGEgcGFnZSB0YWJsZSB3aGljaCBjb250YWlucyB0aGUgUFRFLg0KDQo+IA0KPiBXaGljaCBt
ZWFucyB0aGF0IHRoZXkgd291bGQgYmUgY2F1Z2h0IGluIHRoZSBmb2xsb3dpbmcgY29kZToNCj4g
DQo+ICAgICAgICAgIHB0bCA9IHBtZF9odWdlX2xvY2socG1kLCB2bWEpOw0KPiAgICAgICAgICBp
ZiAocHRsKSB7DQo+ICAgICAgICAgICAgICAgICAgLSA4TUIgaHVnZXBhZ2VzIHdpbGwgYmUgaGFu
ZGxlZCBoZXJlDQo+ICAgICAgICAgICAgICAgICAgc21hcHNfcG1kX2VudHJ5KHBtZCwgYWRkciwg
d2Fsayk7DQo+ICAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2socHRsKTsNCj4gICAgICAgICAg
fQ0KPiAgICAgICAgICAvKiBwdGUgc3R1ZmYgKi8NCj4gICAgICAgICAgLi4uDQo+IA0KPiB3aGVy
ZSBwbWRfaHVnZV9sb2NrIGlzOg0KPiANCj4gICBzdGF0aWMgaW5saW5lIHNwaW5sb2NrX3QgKnBt
ZF9odWdlX2xvY2socG1kX3QgKnBtZCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQo+ICAg
ew0KPiAgICAgICAgICBzcGlubG9ja190ICpwdGwgPSBwbWRfbG9jayh2bWEtPnZtX21tLCBwbWQp
Ow0KPiANCj4gICAgICAgICAgaWYgKHBtZF9sZWFmKCpwbWQpIHx8IHBtZF9kZXZtYXAoKnBtZCkp
DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJuIHB0bDsNCj4gICAgICAgICAgc3Bpbl91bmxvY2so
cHRsKTsNCj4gICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ICAgfQ0KPiANCj4gU28sIHNpbmNlIHBt
ZF9sZWFmKCkgd2lsbCByZXR1cm4gdHJ1ZSBmb3IgOE1CIGh1Z2VwYWdlcywgd2UgYXJlIGZpbmUs
DQo+IGJlY2F1c2UgYW55d2F5IHdlIHdhbnQgdG8gcGVyZm9ybSBwYWdldGFibGUgb3BlcmF0aW9u
cyBvbiAqdGhhdCogUE1EIGFuZA0KPiBub3QgdGhlIHB0ZXMgdGhhdCBhcmUgY29udC1tYXBwZWQs
IHdoaWNoIGlzIGRpZmZlcmVudCBmb3IgZS5nOiA1MTJLDQo+IGh1Z2VwYWdlcywgd2hlcmUgd2Ug
cGVyZm9ybSBpdCBvbiBwdGUgbGV2ZWwuDQoNCldlIHN0aWxsIHdhbnQgdG8gZG8gdGhlIG9wZXJh
dGlvbiBvbiB0aGUgY29udC1QVEUsIGluIGZhY3QgaW4gYm90aCA0TSANCnBhZ2UgdGFibGVzIHNv
IHRoYXQgd2UgY292ZXIgdGhlIDhNLiBUaGVyZSBpcyBubyBvcGVyYXRpb24gdG8gZG8gb24gdGhl
IA0KUE1EIGVudHJ5IGl0c2VsZiBleGNlcHQgdGhhdCB0ZWxsaW5nIGl0IGlzIGEgOE0gcGFnZSB0
YWJsZSB1bmRlcm5lYXRoLg0KDQo+IA0KPiBTbyBJIHdvdWxkIHN1Z2dlc3QgdGhhdCBpbnN0ZWFk
IG9mIHRoaXMgcGF0Y2gsIHdlIGhhdmUgb25lIGltcGxlbWVudGluZyBwbWRfbGVhZg0KPiBhbmQg
cG1kX2xlYWZfc2l6ZSBmb3IgOE1iIGh1Z2VwYWdlcyBvbiBwb3dlcjh4eCwgYXMgdGhhdCB0YWtl
cyB1cyBjbG9zZXIgdG8gb3VyIGdvYWwgb2YNCj4gdW5pZnlpbmcgaHVnZXRsYi4NCg0KQnV0IHRo
ZW4sIGhvdyB3aWxsIGl0IHdvcmsgdG8gZ28gZG93biB0aGUgUFRFIHJvYWQgPw0KDQpDaHJpc3Rv
cGhlDQo=
