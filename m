Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id C2B838CEE17
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 08:51:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BzPuj7uk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VmXR73rHwz79bQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 May 2024 16:42:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=BzPuj7uk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VmXQP12rjz797q
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 May 2024 16:42:19 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDwjTJd4CYw+R0ynCs1PrQijWpvxs4+eXdyxN/rr58VkGnVbbmxulqobw59Pk7ycxyEtwRN2LANPjulUPF7l/Pi06sTwW12/BKs/vSRPYOZyCrKGIPQ9zIE9oaRwW4PnHgwtFVUtgp/24A2jVI7RA66nsiOdVTAjVyei4NkkyeD3ejDavz3lQg85YG4m8vo5C0YWcOecAHQZ++mZixXfM/3Wry8MCtVaMuFC1OPLzFAO9K0P59a7OdvXXuW9FGtnfvWSm5rGi2EeBFh0MoYd2bZ/CCt57izF1A2yfzrjb15eb9AEOL1af/9VQck3U9dxol35jOPPGOrHvYe2RgacbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCpq5Ym4k4xWDLlsZ50VZgchSpnoAUJLq41PytNtl8w=;
 b=nYXriiJMwPGeP3tbpqrB+thHR4jgcAvHDSXXTPeOdeJQcRY+zosMElg3UFWZxu65S4aZHGFwI6H8bGKHfzi6O/uhblE41aceyDm0YP4CbFmo7LTt5pRe7UnpEoHpMKddmpbkvlNUBAR4PB7t907vXo35nPlNhtMV0L2zt1FEi6o8cCH7UkkxQ9kPH3NQtYjC0iV9alKuMEvK+x2JgNKQwRil6MwTsFq2MhvPOHEXhTwOnApyiakaz37an9nqnmuNbSjKnRTo1mv04IJkpN9CiPauThQWflhXsPdvLRa0rtqzYfBMf7XZOK+fUxy+BAlXfoJJ/zxaZet93j8V1HAuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCpq5Ym4k4xWDLlsZ50VZgchSpnoAUJLq41PytNtl8w=;
 b=BzPuj7ukuwLc3sC/AqESvOnUJpahXE8cw5kl5iTAagfJn35u0tgabt66ipXBAsq7e/1ABSlRQYBV72DUl8d7A0Ardsr8E+e3IgL7C+ZCg8/CXGXzznxZIuVMRIpNgMpd6Hh1x2rC6Mu4fB8Vk7EAXIWsnnFQ3+VJAH38gdCX4mSISyum+gMfhzKXN+cqT6vB17/EL4oKv0UBomNnJ5n2L0rrjYrl1kHjPFFNliq6v84f+Vpsvm29wfavUBcQLdsvW38b9w8r6NRfisETHP+NPPbFVJtc3yhm7WES2gQ6FZCuwX4fRQWgxp+P3tg/fyE1BQB6fOcttEcMIaQ5nqIs3A==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2055.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.27; Sat, 25 May
 2024 06:41:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.025; Sat, 25 May 2024
 06:41:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 10/20] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Thread-Topic: [RFC PATCH v2 10/20] powerpc/mm: Fix __find_linux_pte() on 32
 bits with PMD leaf entries
Thread-Index: AQHaqIxz9+sK+6dqBUu/rFeg7q9ZTLGnYogAgAApl4A=
Date: Sat, 25 May 2024 06:41:46 +0000
Message-ID: <e4be79b2-810f-4190-ab90-5745179ee994@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <41bf05806501c0091a7d52e118b187416d24a76f.1715971869.git.christophe.leroy@csgroup.eu>
 <ZlFlRr26AvS6n7p8@localhost.localdomain>
In-Reply-To: <ZlFlRr26AvS6n7p8@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2055:EE_
x-ms-office365-filtering-correlation-id: 4ab88d3a-4699-4bdf-c853-08dc7c85bf51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?V2pFejFOeGNWc28wcGdSaWh1V1lSSlNUR1lGUHpsOStpZWJoNkc1dndQNVh3?=
 =?utf-8?B?VzduY1FzajZJUEVqZlpDekN5TzFQeFFFK0laUENjL1JGcWZQcG92QmhoZ3FX?=
 =?utf-8?B?dFZIam9zSUdQdkNMaitSOHJLd3NReHB3N2FQUmxIMmZ0TjFnSnl2ZUN0czFv?=
 =?utf-8?B?RTZ4R0ZtdUozVFI0Y0kxdExOQ2hTbFFDMVgvaGk4Y1J6WjBrN1NsTXM5Tzdj?=
 =?utf-8?B?bmtHc2pCZkZKRVF3eThiL00xYktEUDhQcE5QM081TGpwTHlseE5NcjBwOVJL?=
 =?utf-8?B?Y3RoN0d6OGlFTFFRbkJ0a2hxTFZpNVJBWkhOaDNxUWR4Qy92ZHNmWno3R0Rq?=
 =?utf-8?B?ZU9iTE1JZFExYmxzdVUrRzNRRjgwWHFJTmRRaEhKZ2FMSTl2L2pOalVjUjV5?=
 =?utf-8?B?dDRNZjBNTGhiQ1E4bS81QXV1aFJMayt2MFlqY3J6cjlKV3E5SnliY0JCM2Zh?=
 =?utf-8?B?czFiMWJ3TWJkSVR0NGYzVFQzbmt3WUN3UWxsRDhSL0FCZEM3cmhZeS9qMDZB?=
 =?utf-8?B?anRxMHpxMGppOU04SEdXaUdRanBjZHc5ZURpWTJCRm1tb3R2bnlzWDVNbDEx?=
 =?utf-8?B?THU3SnZhUFR1bXlER1pTVW5haW9IenZLeEdWN1NPUXNwdW43bTdUaXNnWEVZ?=
 =?utf-8?B?RFRrVnBVVVBiV3UrcGVIK2NBODZYWDJmR25uMTlZMWdrd1gxTDZKY0JMM1FX?=
 =?utf-8?B?bC9vVTdKRjRkNWhRMWxuYzljVzlIVjk1Vi9NZVZtcG83MmtkMGl1SGxmWmJM?=
 =?utf-8?B?UXFGdDZXSXpLMzhkVG1tTy9qN0N0Zm1qMXJuTWZNZzVIbmVYV3FQdVZOVjV6?=
 =?utf-8?B?VkdtdHFUdXhNS3NXNHJTR2l0a0Z0dWRHdUQ3WTdnamlvN3dZaExndDY3WWhy?=
 =?utf-8?B?bkhIb2tZbFRUd3NNTGFhTTYvNjFKMW81MjdpTUZINjFHMlppWU9hbUpvUHhk?=
 =?utf-8?B?QXF0cnJzeW5sZjlWbW8raGFyZVk1d3pQdDc3SzlhS3RERkdyOUhnQXBWOW1J?=
 =?utf-8?B?bmplWFdibDlMRG5hZW0ybEhhcnExcGJWbnpCVllGMXM2b0lPNHIvbWQvVEZU?=
 =?utf-8?B?UUJwLzU1ZlBHTG4xS01XUEdFbGJER2ZoT0xEVlBkRWh2N0lMMTNiUkZSZ0hS?=
 =?utf-8?B?S0lENDVaTE4yT2hiNE1iQmN0UnhGSVB5SHpSTWtXWW5WeEJMdG8wT2FKNExB?=
 =?utf-8?B?MGpZSkM2eFRXenFDWmMvVVJ1SXJYRlJPYzdibmhVU09YcHp4dHJtYWFpSFht?=
 =?utf-8?B?RHRwODFOQk5QR280N041YVA4TWo2d3hzcVJWUGk2azE4MTFVbVpLU2VNbjJa?=
 =?utf-8?B?M1N6M3JzcXg4ejlMWVlnd2Zia0lwd1JCQkhTYVJTbnpTRnVhbnBEQmpnSVdW?=
 =?utf-8?B?VVhtTk40NS9rSVpyU2RwSXpBbk05UlMyR2Y1R0tXRTVwQWUzaGJmTzBGZ0xT?=
 =?utf-8?B?UlBzZzA5aGxYUDZDMXNCem5FeFBReVptZzNzUGQwMU9NWHVwYnNBUktnZm5w?=
 =?utf-8?B?VFlURFpmTXoxS3U5cWlrVXRqU0FBM21uamM0dWluSnZha055MUpMY21EUis4?=
 =?utf-8?B?R1NVWkV0Q0pubXg1UFRyZUY1T081Q0NlZWhXbkJVVzA0ckxVdUlzeDlLVEpk?=
 =?utf-8?B?NWF6UkdZbDFsU0FEQ0ZVbnBIaDRNSTVVTThNcGhtdUVEcE1oS3QyQ0dwcDdU?=
 =?utf-8?B?ellIUHVvY3ZjNVkzS1FzSXB0VG9ISkYxdXU3Z01CWHJtRnEvaWFEZEovYkJB?=
 =?utf-8?B?akZRcmhxZUJ3dU0vNzBsbnU4SHdWeWViVGlrUHIxQTRGeFpEUGwzRnRwYzlL?=
 =?utf-8?B?ckU1bXVDd2pPYlQ3dGo0Zz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Slpqek00V0pnRU1qNENsREdyK0dzNmc1Tnc2cXBOOG5GL2RzTzhOKzYvTzk2?=
 =?utf-8?B?dFRncHRkd2pOVW43TmsraE9BNTl0djhJWWlRekRGZlJrZ3JIZW45Q1V0Qks2?=
 =?utf-8?B?Zy9Db0lxWTFZUG8rSUFnSWlaZE92WTh5LzhkUG5xVUd5NnNTTWQ5TmpLYkpR?=
 =?utf-8?B?Z2dPVHYzaTcwdWFlSm4yVmdaRDJHL28wZlI3QlNKUHowL1JoWlQyblQybGJL?=
 =?utf-8?B?MjZJOW1MVmU3V3RHWHhXdmlya05wZmpWZVNGQU1maHlsNE4wTUhqUXVkSWNq?=
 =?utf-8?B?ZlN4Mzc1REhzbjVEY0JuY1hrbG5zWDF4clB6cEdKeTdZdEtaelZGbkdFK3dk?=
 =?utf-8?B?TFU5dVBMY0NMMDFub0VJMTRhWWg0ZDA4cEkvUDU5MzVyUk1NQXJQeUk2S1V3?=
 =?utf-8?B?TXB5SkJHbEt0L2s0ZnVXdXdqWnd6Ti9SWkQxaUIxNkthTmpTSWxuckJFRWpU?=
 =?utf-8?B?NkNTZkdac1lzTHJvY3VuczRmdGtBZlN5TWkvVTZIS1AvNGNLTVIyKzZLV1VT?=
 =?utf-8?B?emVSSU5vNFB5OVJheVpBYzdxMm8yTmtYREJqdjFXaWE5ZDNnU3hwN3NuaGZ6?=
 =?utf-8?B?ODY2NXlIRzVucDhQTUxyN05SUit5aWxtQVE4MktKQnRIRFJvYUlIcnJtQmhO?=
 =?utf-8?B?VzZLdjczZCs4WjE2VExMSWJOd29CWVZvRDFaQVFzQ3FSUkp5Ly9rYVhuMjda?=
 =?utf-8?B?dVFqSDJqYjlFN1dMakc2Z1NWdk0wVFVqUlk4RTc0bDVmZjFMOXBNTGVqRWRF?=
 =?utf-8?B?MS9USHVXSTJVaEh2SDlJZ3FTZ1FTdFRMWkt0ZlJuc09YaXUvL0todGdhUXJs?=
 =?utf-8?B?eE9QSGNCOWpFL0hqTmNkZnVwdXlUVDkzc1dPYWJCcmV3ODVQVm8ybjNhWmdp?=
 =?utf-8?B?bjBYNkZpZERmclltSDFrZHNXRnFGUno3aWNwSnJnbzhoWU4yby9nM09KVkVt?=
 =?utf-8?B?cmUxWGU2a2szV09zaGhESWMrL3diV05uNlQvcDJhYWxHSVJTSm9sRkthT3ZU?=
 =?utf-8?B?NDZqakRTaFNoYzdZR3VjZFZPZ2hhcFV1Z3lEdnZjL3lVU2hwbStsRUx0ZWxn?=
 =?utf-8?B?dmJRQk1LZ1kydFY0Y2NGV2FhNUdhMjFaQncyZHh2eldLUEtvYU96azBRZ0VD?=
 =?utf-8?B?aDQ5eUtwQW1oaEN6eXN5MHI4OTBrenA1d0J5SmNRaGJGWFoxeFZBOEhGSUsz?=
 =?utf-8?B?dUxBSUhGWW9jbWRTRnZPbWdRWGNodE1pdFlWTHpvQVViRFU1QnQ2NVBnOUpv?=
 =?utf-8?B?KzJxNlR6R0dUdGpXYTdqWXpWRGdyTkxOS0xwM0R6UGNjcFZ2SHlKbTN1anlm?=
 =?utf-8?B?RVVwSzFnQmpiYTJmUjhZUEZLeExQZ2NpK1U4Ny9QK29NOENpK3dyb1dFcXQ5?=
 =?utf-8?B?OUpOOWZGR3RhTWRCMm1ycFRVU2NIaHorQTBHQVdjUS9xZzhra3pXVC9yd1ZR?=
 =?utf-8?B?M3kvc0RoVnFxbTRxQnhvVEhhSGwzZ0t5TEw2Z0o3NS9BZ3BkVEFNd1NuVzBy?=
 =?utf-8?B?ZmpORFlsZDRhSjBLRjhXa2dGKzRReGhnUWNsSTNWWGRST3pONUdMcW1yck1F?=
 =?utf-8?B?YUI0YzRDZTdhc2E5QitKRlNkelhVbVNtTWxTcmhLaDBwTVZSeEFTeEU4VlFJ?=
 =?utf-8?B?ZS9qTjFYd2JIWkZiRlRuVWhLRldJeE51NEpPamNYZzdOZSsxZlF2Mk12Mlky?=
 =?utf-8?B?bDFmbHJ1d3l1TUI1V1RuQ1BsMjJ6eDh4dE9nV05GM0Zacmt3dmZtMkwxZ0Iy?=
 =?utf-8?B?WWcya2REL1RMeG4yWHo5cWNTWXNxRnV5ZEo2QWxqczZkQ1phMi9oM1I2TzFk?=
 =?utf-8?B?SURaZEtZUHlMRlpUNWFhMnRiaHdvZFhXVy9ReHZJdFpMT2hNWW1VRVlXRGNz?=
 =?utf-8?B?TTNob3YyWjR0QTFZQURad1p2Q1dQR1p1TVdKRHVBTUtGYlkxTTFoMWdQenNH?=
 =?utf-8?B?clQydEJSMHhZUkxhd29LUWdtRUhSMmo0bllkV2s5NmRLcHN1dE0zTkh0UmRt?=
 =?utf-8?B?YmNTWG9uSWVUVGFFd0RYRWswcXF2UHNKa3o2L3JVNnJ4UGdMTFJ3UVpGR1ZV?=
 =?utf-8?B?TlpoZEpqWERDc3VUQ3FXNUVxa2p3WHZJS1podVpiNWh0RFZXRW1RS2xvcnJG?=
 =?utf-8?B?UjJhQlYyK0owR251NktkREF2NTdVUXFGUENzSjdvU1AzYWF5SWRDWExRRUxp?=
 =?utf-8?Q?bCk64W/4LUBSvq+P47/x6hAtdCCHztbXBE5ELcFaIt+r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63FA50D9511FE249ACD50614C87E7389@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab88d3a-4699-4bdf-c853-08dc7c85bf51
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2024 06:41:46.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZ77o3eDlD8nQQksjNtWej25/MkuLHsYrSMmN6Y/QPenFF7G8qePlxyZwoJDN0jj1MSbrdGKcqtPOXS5uDf1Ykg8VlfW5F7M79VziTFMyiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2055
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

DQoNCkxlIDI1LzA1LzIwMjQgw6AgMDY6MTIsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgTWF5IDE3LCAyMDI0IGF0IDA5OjAwOjA0UE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBCdWlsZGluZyBvbiAzMiBiaXRzIHdpdGggcG1kX2xlYWYoKSBub3QgcmV0
dXJuaW5nIGFsd2F5cyBmYWxzZSBsZWFkcw0KPj4gdG8gdGhlIGZvbGxvd2luZyBlcnJvcjoNCj4g
DQo+IEkgYW0gY3VyaW91cyB0aG91Z2guDQo+IHBtZF9sZWFmIGlzIG9ubHkgZGVmaW5lZCBpbiBp
bmNsdWRlL2xpbnV4L3BndGFibGUuaCBmb3IgMzJiaXRzLCBhbmQgaXMgaGFyZGNvZGVkDQo+IHRv
IGZhbHNlLg0KPiBJIGRvIG5vdCBzZWUgd2hlcmUgd2UgY2hhbmdlIGl0IGluIHByZXZpb3VzIHBh
dGNoZXMsIHNvIGlzIHRoaXMgYXJ0aWZpY2lhbD8NCg0KUGF0Y2ggMTcgYnJpbmdzIHBtZF9sZWFm
KCkNCg0KPiANCj4+DQo+PiAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLm8NCj4+
IGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmM6IEluIGZ1bmN0aW9uICdfX2ZpbmRfbGludXhfcHRl
JzoNCj4+IGFyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmM6NTA2OjE6IGVycm9yOiBmdW5jdGlvbiBt
YXkgcmV0dXJuIGFkZHJlc3Mgb2YgbG9jYWwgdmFyaWFibGUgWy1XZXJyb3I9cmV0dXJuLWxvY2Fs
LWFkZHJdDQo+PiAgICA1MDYgfCB9DQo+PiAgICAgICAgfCBeDQo+PiBhcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jOjM5NDoxNTogbm90ZTogZGVjbGFyZWQgaGVyZQ0KPj4gICAgMzk0IHwgICAgICAg
ICBwdWRfdCBwdWQsICpwdWRwOw0KPj4gICAgICAgIHwgICAgICAgICAgICAgICBefn4NCj4+IGFy
Y2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmM6Mzk0OjE1OiBub3RlOiBkZWNsYXJlZCBoZXJlDQo+Pg0K
Pj4gVGhpcyBpcyBkdWUgdG8gcG1kX29mZnNldCgpIGJlaW5nIGEgbm8tb3AgaW4gdGhhdCBjYXNl
Lg0KPiANCj4gVGhpcyBpcyBiZWNhdXNlIDMyYml0cyBwb3dlcnBjIGluY2x1ZGUgcGd0YWJsZS1u
b3BtZC5oPw0KPiANCj4+IFNvIHJld29yayBpdCBmb3IgcG93ZXJwYy8zMiBzbyB0aGF0IHBYZF9v
ZmZzZXQoKSBhcmUgdXNlZCBvbiByZWFsDQo+PiBwb2ludGVycyBhbmQgbm90IG9uIG9uLXN0YWNr
IGNvcGllcy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL21tL3BndGFi
bGUuYyB8IDE0ICsrKysrKysrKysrKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
bW0vcGd0YWJsZS5jIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPj4gaW5kZXggNTlmMGQ3
NzA2ZDJmLi41MWVlNTA4ZWViNWIgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0vcGd0
YWJsZS5jDQo+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vcGd0YWJsZS5jDQo+PiBAQCAtMzkwLDgg
KzM5MCwxMiBAQCBwdGVfdCAqX19maW5kX2xpbnV4X3B0ZShwZ2RfdCAqcGdkaXIsIHVuc2lnbmVk
IGxvbmcgZWEsDQo+PiAgIAkJCWJvb2wgKmlzX3RocCwgdW5zaWduZWQgKmhwYWdlX3NoaWZ0KQ0K
Pj4gICB7DQo+PiAgIAlwZ2RfdCAqcGdkcDsNCj4+IC0JcDRkX3QgcDRkLCAqcDRkcDsNCj4+IC0J
cHVkX3QgcHVkLCAqcHVkcDsNCj4+ICsJcDRkX3QgKnA0ZHA7DQo+PiArCXB1ZF90ICpwdWRwOw0K
Pj4gKyNpZmRlZiBDT05GSUdfUFBDNjQNCj4+ICsJcDRkX3QgcDRkOw0KPj4gKwlwdWRfdCBwdWQ7
DQo+PiArI2VuZGlmDQo+PiAgIAlwbWRfdCBwbWQsICpwbWRwOw0KPj4gICAJcHRlX3QgKnJldF9w
dGU7DQo+PiAgIAlodWdlcGRfdCAqaHBkcCA9IE5VTEw7DQo+PiBAQCAtNDEyLDYgKzQxNiw3IEBA
IHB0ZV90ICpfX2ZpbmRfbGludXhfcHRlKHBnZF90ICpwZ2RpciwgdW5zaWduZWQgbG9uZyBlYSwN
Cj4+ICAgCSAqLw0KPj4gICAJcGdkcCA9IHBnZGlyICsgcGdkX2luZGV4KGVhKTsNCj4+ICAgCXA0
ZHAgPSBwNGRfb2Zmc2V0KHBnZHAsIGVhKTsNCj4+ICsjaWZkZWYgQ09ORklHX1BQQzY0DQo+PiAg
IAlwNGQgID0gUkVBRF9PTkNFKCpwNGRwKTsNCj4+ICAgCXBkc2hpZnQgPSBQNERfU0hJRlQ7DQo+
PiAgIA0KPj4gQEAgLTQ1Miw2ICs0NTcsMTEgQEAgcHRlX3QgKl9fZmluZF9saW51eF9wdGUocGdk
X3QgKnBnZGlyLCB1bnNpZ25lZCBsb25nIGVhLA0KPj4gICANCj4+ICAgCXBkc2hpZnQgPSBQTURf
U0hJRlQ7DQo+PiAgIAlwbWRwID0gcG1kX29mZnNldCgmcHVkLCBlYSk7DQo+PiArI2Vsc2UNCj4+
ICsJcDRkcCA9IHA0ZF9vZmZzZXQocGdkcCwgZWEpOw0KPj4gKwlwdWRwID0gcHVkX29mZnNldChw
NGRwLCBlYSk7DQo+PiArCXBtZHAgPSBwbWRfb2Zmc2V0KHB1ZHAsIGVhKTsNCj4gDQo+IEkgd291
bGQgZHJvcCBhIGNvbW1lbnQgb24gdG9wIGV4cGxhaW5pbmcgdGhhdCB0aGVzZSBhcmUgbm8tb3Ag
Zm9yIDMyYml0cywNCj4gb3RoZXJ3aXNlIGl0IG1pZ2h0IG5vdCBiZSBvYnZpb3VzIHRvIHBlb3Bs
ZSBhcyB3aHkgdGhpcyBkaXN0aWN0aW9uIGJldHdlZW4gNjQgYW5kDQo+IDMyYml0cy4NCg0KT2sN
Cg0KPiANCj4gT3RoZXIgdGhhbiB0aGF0IGxvb2tzIGdvb2QgdG8gbWUNCj4gDQo+ICAgDQo+IA0K
