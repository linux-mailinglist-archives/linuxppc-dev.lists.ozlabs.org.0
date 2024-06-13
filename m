Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F80290788D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 18:45:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=ETxQXiP0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0Sv13BZYz3cyg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 02:45:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=ETxQXiP0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260d::600; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0StH0ZW7z3cVW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 02:44:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChlB4pLKDTNTnI6khMbVIIjQF1TOG6jhpj65V18Are9qhvNpSzNtrF7mbCuCilHxVgFGarDtMRqax9imLelObJl+xMOIq5ibSQd5clogGHg8cgHDeWU0kWGFPikxJe79rJzPeZnNPH7tZ0WIXS7Jrg44dzDAU2bsc6vJSPzLQ8eqiWjWDa50kI6/reVsPipCyQZHausEGqNP5AOnu99UpurvRlHefmkt97mwKQOYdHHo/SgpdlfmZQvmlPbCqiS+j+s+yFHoGC6Zzk1kgjYFtBiUVDVyY0eurZOuMC8Igmuj/0X4xsQDFHbO2D3AggDiEznMrl4ZVbmMrCqmsGFIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BPj8giOGAqPR1H0nV86+EeDpmfueixl93sIKWppayM=;
 b=KuDi6eEmy1I829AysYb0OKtpGQx/+I98N1BvxSF9mJjI3BAaoKUrVkiH2lXIK+cyxWrLCSxvtiQwgs4PWrw5SprRh6/VI42BGn2xQoYM9gCTdAaTbeW1kAixYo9GGncEczG1do/+/ly8A0raCP2/xuCfOhxIFow1ISf2HJpMA3p8BzG7S3qivzOkqfmUFhD82nGQXTKm8OByS/cRBRdCgTlqNHsbdoSfY/kKqtL7pVQRcdbi3o35nLE5wl7htytEPdMne9u7loduD0yEjz7W/lZ6ROFqcC8BRUOX5BYHfJooNPtFayeYwxI/I5VohWUzYNXs4VeXPMV5i+hZbiIKdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BPj8giOGAqPR1H0nV86+EeDpmfueixl93sIKWppayM=;
 b=ETxQXiP0QIUmNwoYN8MEqUNWZZ/9NIrzhA+EsnilzZd2C+gsNmHUhnqQOks2jJRoTfAdDJZ8LDRTVEd4Wg2YnkMpGWBgKTL6mGLUY+7RIxvvVrhuEF2RdO92TZ/CeI4yCqfsrzrkqtRffzAztE1viNmYuHiGvXjzhiU7hD+zlhEoGbqltzwq1Q10+VxGpM7BqKw/fGlqT4kihBPQaGUb2ep98vTg7JYC/VSHi3m8BAjjW4O6uYDJpUF2Hj+/JC+TvoIsntG6mn6Pdza6Fy6+Qw9fPv3+FszVoBQ/H3g+j/PhbLiWovG/HhBggpY/a9KQrLxra3MKxFVgahhaN0DS5Q==
Received: from VI1PR07MB4973.eurprd07.prod.outlook.com (2603:10a6:803:b2::19)
 by VI0PR07MB10152.eurprd07.prod.outlook.com (2603:10a6:800:25d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Thu, 13 Jun
 2024 16:43:57 +0000
Received: from VI1PR07MB4973.eurprd07.prod.outlook.com
 ([fe80::64d2:e173:c437:23b0]) by VI1PR07MB4973.eurprd07.prod.outlook.com
 ([fe80::64d2:e173:c437:23b0%7]) with mapi id 15.20.7633.033; Thu, 13 Jun 2024
 16:43:57 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Topic: [PATCH v5 02/18] mm: Define __pte_leaf_size() to also take a PMD
 entry
Thread-Index:  AQHau+KLGQQ/eNTTsES+mAG/hC7cQrHCnGsAgAAOUYCAAAMmgIAADheAgAAvcACAAmD7gIAAnZoA
Date: Thu, 13 Jun 2024 16:43:57 +0000
Message-ID: <0b52260d-28b2-4b33-b73e-88c5e5bfce66@cs-soprasteria.com>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
 <172b11c93e0de7a84937af2da9f80bd17c56b8c9.1717955558.git.christophe.leroy@csgroup.eu>
 <ZmgaHyS0izhtKbx6@localhost.localdomain> <ZmhcepJrkDpJ7mSC@x1n>
 <ZmhofWIiMC3I0aMF@localhost.localdomain> <ZmhrIdh3PLzvZU07@x1n>
 <Zmh282yJjxc7zqbL@localhost.localdomain>
 <e9583aa5-4ad7-4bcf-b3ff-f42b983231f5@cs-soprasteria.com>
 <Zmqdl1aqmU9BgYzo@localhost.localdomain>
In-Reply-To: <Zmqdl1aqmU9BgYzo@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR07MB4973:EE_|VI0PR07MB10152:EE_
x-ms-office365-filtering-correlation-id: 88e74951-3f68-4bc8-8b40-08dc8bc80507
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230035|376009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info:  =?utf-8?B?ck1xWlBIdmtrV2o3WWxvRkkyNHdNMGtFUlNDMVluYVFNdFBjSWxyam9Mdk4r?=
 =?utf-8?B?MmZvRGpMYTFDZkxXS1hkWWVob3BrYjFxL3F5cWFVUmJlMllNT3lyazdYa3JR?=
 =?utf-8?B?cUZ3N3l3ZGVhTnRZTDlTbzFOOGhMRnNwRFZHQmRJR3NPMXBlU0JGMHJjS1Br?=
 =?utf-8?B?MGdxYU8wdW8zeTFFcS9mbmNxZXpWU1h2NEM3OEV2UjRLcmsrWUVMZkU5SHZN?=
 =?utf-8?B?dFFZSGl4T3hZOXdTVnBBSys0TlpFcUhHYjNIV2xSeWo4N2g5N1g5Yzg1V24v?=
 =?utf-8?B?dldDeEZQZWowWkVRQUlYeEh4Ym1OT3hxay82ZHhPdmNvWFk2cTFDclZuMkRk?=
 =?utf-8?B?YmxiMmVWUnh0cjVtdEg1dFk2Q1Y3am5yemNtMGZ2dS9zMCtOanlPS2VNeFNK?=
 =?utf-8?B?QU9JUnpQRTJmVjhkd05DZ3RTZDlOMHQzZzI1SGZJb1U4cEIzdWhBN1VkbDBE?=
 =?utf-8?B?NFcwQVJCSEJuVUlPZUtIRDlSc2xzU0pkcFlHZXBrNXdENklQcHhZcXM2OEF4?=
 =?utf-8?B?KytoT2tNY2dlK2lXRGw3OThzWktWbXZFeHNUZm1rb1F2UHBTRmpNeVB4VXJ0?=
 =?utf-8?B?dE5jWDE1RmMvZFhXTnZ0U2NFY2M1VVUvUXdOUWR2NUFkdlA4amN1RzI1VFFD?=
 =?utf-8?B?TVVKbFExQUd3UEN6cW9MTzNzOTJqclBQbmYyRFJxQU80eDRaMWh0UmJKU0RK?=
 =?utf-8?B?M09uSTlqVGFZZVZnZkhsSkFsYU5aYVRvaDY4dWdNT0RpZWFIY3hMNVM5N1VL?=
 =?utf-8?B?OXczcDVMNFVyYmpPQ0ZXaU9rdTZXUFloY3VTY0VkM3ZBbnJUbENic0tvek90?=
 =?utf-8?B?RVBLYmhFaGdUVGFQZ1JydnZtSFcxaEZadTZ5aWpDTDBneXZaZDAvTGVYRUds?=
 =?utf-8?B?R3E1Tlc1NmFReVNhd1MreE9mMU4xNE9VdzZtU1h4MzhtMGNEbWcxTzZLZkFW?=
 =?utf-8?B?ZzdDOERiYnpPRnlKUXE0TUYrYjljb3BCanYwSStyRSs4UzkvdjNkRVpQNWJH?=
 =?utf-8?B?VFRwbW9EWDY5SFdKMkI0RlhCdEowS2ZqMDBPcEdPSUVwbG52ekpBbWR1S28x?=
 =?utf-8?B?TkkzbC9pc09wTFJDSzBOTExkYTFtZXc2Q3ZZOGJwRmliZVNEWERHY1RRZVlR?=
 =?utf-8?B?SWhPdnJZZTdoNXdOZWEzYjFBUGl3YTZxZEc3N0w0ME5HcS9Ba2lERSttdkZU?=
 =?utf-8?B?bHdnNlhqcEk3eTArU0JCQk1CMEVCNVVBRzZrY1RENVNpWXJPNkRJa255ZmRE?=
 =?utf-8?B?NjBhcDNxVmxjWGF5RmhUSnZvMzdZeGt0QmVDV0R5VlpkTnIyNENBSXVoSnFt?=
 =?utf-8?B?SStTcCtiMlhoYmE1WVNrUlRialc2dVZuQlprdldjOExyL0taM3RqOHRsWGRw?=
 =?utf-8?B?RDJ1M3ptWTRla3NqcW9oVlU4cnpPeGtCbmtleHNQZjh5L2tvclBid0xGemtz?=
 =?utf-8?B?WFRpTitGVFZjUFBrYmNJRCsxdFhzd2gzQ2Q0Z0Y4azZLUVlDTXJuWHpPQTFh?=
 =?utf-8?B?MnRsUW13N3FIT3hqeDJiblY5RXlBRUtDRDZOb1dxREhqQjBBZ01FZ3dLVm1L?=
 =?utf-8?B?UGpVY1ZMNzRGWmxDSTBOaERaVFVaaEFUV1I4dWdhaHMwekpNWThBU2xoOHhG?=
 =?utf-8?B?U1dONzhUTkRETUx2YVN4Y00wN1FUVVYrOWxWT3hyRXQ5VlJXUmtDZWkwdzhC?=
 =?utf-8?B?MWdTSm1iSjI0alo3WTRWbUw5SXJKNEduS1ZxRCtIb2pMa1BRTUxZK3JVUjhV?=
 =?utf-8?B?RzhiQ1ppNEJveE8zZU5PSzJqdWxURCtvN2QvM043aFRCb2kwTWpOYzdkOE1i?=
 =?utf-8?Q?GrCfIGp/SQ6cnvjHuxNOsWOhIV6fco9cXOhpA=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR07MB4973.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(1800799019)(366011)(38070700013);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?U2JMWFlxaEVGbjREV1pkZ3BGK0tRdHBQcytXcGhmVEd5bVU4dExiTEprcTIz?=
 =?utf-8?B?V2ZyM2ZvaHFEbEloSitNRWpJRTA1V1M4SmVpSnRHN3pkU1Z3Q0l3VmEzTlI5?=
 =?utf-8?B?NldxRlJxbkpEbk9ibEhhSERXTUUzb3N5OVovTEdYaE5wT3lpNXlnYWFZL1o5?=
 =?utf-8?B?dmV3N0hja0FJa3FhRlhqb0FzaExPQUVZcmZjL0NIUVlCTitxK3dITGQ1Q3FZ?=
 =?utf-8?B?Z1lTU0RBTjZlTWI3VDU1Uk1FTEtPT1ByUFZUZXFuZjlaTy9YUzJjRWVQMjk5?=
 =?utf-8?B?K3lvS2QveEZxNXo0bGxnUXlWOUdxLzIrVzhsREU2UUlDYVkrWE1BS01sYnZK?=
 =?utf-8?B?ZDd1Tm1RK0pBcFErS1pKNTJVN3RZWmhNVHZmeGc3QmpIOVZLWkh1ZCtyak8z?=
 =?utf-8?B?WnNTN1kvREhhQVdOKzhkeU1IOTh3RGIwZGFkTFo4VXFWTlBYU0ZqVUh6L1Bz?=
 =?utf-8?B?aGF0cUVrU0grRWtzdDBuMGZrZ3FVc0NWTE00Y2pTSWQwZjVLUkxFUVljWFRE?=
 =?utf-8?B?ZkE1dkp6QXpZNHdpK2FOa0t4Zm9JMDJCcCtDa2JWcUxrQVpKV0g0NTB4bVdQ?=
 =?utf-8?B?VjJNalB3UGFLd01td3dheG16TzNjQ0NLeXVNRWxwZjdYUDg0OWtGM2hDS2lN?=
 =?utf-8?B?YUoyQXUyZWxmcm5FWGJCNFNCMGRVTWdYV2VJSjRLVlZyWDBmcUFoaEZMK0p3?=
 =?utf-8?B?ZFQ4bk1RSHZkeitNSnV3Qjc1WTdmM24vZTBRYXluazM3SWEwZEFLRkU1OE1m?=
 =?utf-8?B?ZEJ0STFYZTVhUDFDUjdzQzN6MWFJRGUwMXU1akxVbTZhVGJPRUpPMVFYNWZv?=
 =?utf-8?B?YjZBK3Jsd1VpS1dVUm4rQlNqK0IrbHhzRmpQeFVZWmVSKzRtanVkUUZKNzY4?=
 =?utf-8?B?WEVBcnRxWGlLbkZIdUxlUUxSSUJSbmQ5TW5tSGdDb0pld1ZNTXlCU2lwYjJa?=
 =?utf-8?B?cUR2MzRoNmxlWXJSaUwzVi9EUmo3WEtXck5ObkExM3poU01Rd1NxRGlwN0VT?=
 =?utf-8?B?UFZ4TGwydjhaMmtSdEF2VUlBSjY0MnlNclJROWNrQ3Y5emJmS3Yrdjh5QWt0?=
 =?utf-8?B?bEZ6ZWpBdGtmZi9zZ1pJZ3Vwa1dOTDgxVXY3a2gweStOa3VOWDZZcW1DaGds?=
 =?utf-8?B?LzRwV1VJa1cydzJweElxS3l5dUtqTmRFWVZncWZhSFFacXI1Wmg0TnBFQnU0?=
 =?utf-8?B?NE15UmpZRndIMVhZQlplWkZWcEl4WXBvaFU1MnFQY3NIVlBBQ05uR0Z0QUk4?=
 =?utf-8?B?NmJhSTkzeTdFY0UvZllEZzc1UnpCNXJEbzRjM0EzeVRkUU1Sc2ZrRzd3V2tN?=
 =?utf-8?B?ZExPUm5FbXJOV3U5YnRvQUdOOEszMU9tb2ZSaEluV1RGNjVsZ1JyQ05BQ20z?=
 =?utf-8?B?ZmloRnU3Qkk0UzkwL1JmL20rRys3RHVSWmp3b3BISzhyVXF3MXVZaDlkeDh5?=
 =?utf-8?B?QUZIa3VyUHRnVmdYNlBNZEd5MWp1K01jNHRXcDV6TTJWdVhJR2VObGQyTHhZ?=
 =?utf-8?B?WUtoSm5lZUJTZXFxR3ljalBCd2tJclNaRUJ5QkM3L2VZUm9tVm0ydDFwTm9X?=
 =?utf-8?B?aDVNMGh3QjNyZ2RxdzUzN0VjcGV0U3h6T0hncWZLcWQ5blYzVGxGb0praUZ4?=
 =?utf-8?B?YnpPdlZPTEJobzJEdkZBZ1VmcDl4QnpPQnNCNHcrM1hjOFdGbEsyR1BwSy91?=
 =?utf-8?B?V2pPU21SU3hzTW50QTBZTlduR0FNZnJsNW5JS3ZJZUpSazVwcDhSSXVWcEQ3?=
 =?utf-8?B?VUgyRlFCN3JYQk11aVJQcHJOVDNGZWhFV1dCbkNWZ1JHYnNmOXBGSm9ZQmFo?=
 =?utf-8?B?V01VZjJXOEdwY2I1cUg5NW4vNnBWcnhjaGE4TUFDbjdjQUNLbUwwYnZWUGRP?=
 =?utf-8?B?ZFZhdFNSc2FYUDJ3YnVESWRzMVY2NXh0RUEvZVNzRG5ZMk01cTNMbVphQUE4?=
 =?utf-8?B?azFYU2JxdGh0eTRwb3d5TXEyTC9oTXZHaVpBemhnZEVzUFc5YVIzYmkxcTVt?=
 =?utf-8?B?ZEo1ZmFONWN3TDZ3VHpHalgxb0xCTWk0U2hzVFVYSlpjS3JyekwyMFBGbzIv?=
 =?utf-8?B?L2tQRTNqMGxKRk8zK3pQNkl5VkxGMURsWm5uamNER0ltWHFLbmU1cjJoMFBy?=
 =?utf-8?B?Vng2RWFVQStzY1JqVWVzTkhXelUyS0g3TGFwMG9iUTlSTzNvTGNTdHU2K01y?=
 =?utf-8?Q?Q+sTXzRVouhsMsME+YOpM0M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F928D55B01C764EB29FE5222A1C8AA4@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB4973.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e74951-3f68-4bc8-8b40-08dc8bc80507
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 16:43:57.3366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Vtzejyl1xDEwpVrJ2dvKuiIBB+J2+23Uan2zIrytfWOg6SBBaYMOj7eOXA2zvLG9aDQ6K1kOHqqAIHrqz3VVHuz5/UVcB6QLgsammYVMf9Zgkk/cPyBgR7qtktPXITK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB10152
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: VI1PR07MB4973.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: VI0PR07MB10152.eurprd07.prod.outlook.com
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

DQoNCkxlIDEzLzA2LzIwMjQgw6AgMDk6MTksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgSnVuIDExLCAyMDI0IGF0IDA3OjAwOjE0UE0gKzAwMDAsIExFUk9ZIENocmlzdG9w
aGUgd3JvdGU6DQo+PiBXZSBoYXZlIHNwYWNlIGF2YWlsYWJsZSBpbiBQTUQgaWYgd2UgbmVlZCBt
b3JlIGZsYWdzLCBidXQgaW4gUFRFIEkgY2FuJ3QNCj4+IHNlZSBhbnl0aGluZyBwb3NzaWJsZSB3
aXRob3V0IGFkZGl0aW9uYWwgY2h1cm4gdGhhdCB3b3VsZCByZXF1aXJlDQo+PiBhZGRpdGlvbmFs
IGluc3RydWN0aW9ucyBpbiBUTEIgbWlzcyBoYW5kbGVycywgd2hpY2ggaXMgd2hhdCBJIHdhbnQg
dG8NCj4+IGF2b2lkIG1vc3QuDQo+Pg0KPj4gQml0cyBtYXBwZWQgdG8gSFcgUFRFOg0KPj4NCj4+
ICNkZWZpbmUgX1BBR0VfUFJFU0VOVAkweDAwMDEJLyogVjogUGFnZSBpcyB2YWxpZCAqLw0KPj4g
I2RlZmluZSBfUEFHRV9OT19DQUNIRQkweDAwMDIJLyogQ0k6IGNhY2hlIGluaGliaXQgKi8NCj4+
ICNkZWZpbmUgX1BBR0VfU0gJMHgwMDA0CS8qIFNIOiBObyBBU0lEIChjb250ZXh0KSBjb21wYXJl
ICovDQo+PiAjZGVmaW5lIF9QQUdFX1NQUwkweDAwMDgJLyogU1BTOiBTbWFsbCBQYWdlIFNpemUg
KDEgaWYgMTZrLCA1MTJrIG9yIDhNKSovDQo+PiAjZGVmaW5lIF9QQUdFX0RJUlRZCTB4MDEwMAkv
KiBDOiBwYWdlIGNoYW5nZWQgKi8NCj4+ICNkZWZpbmUgX1BBR0VfTkEJMHgwMjAwCS8qIFN1cGVy
dmlzb3IgTkEsIFVzZXIgbm8gYWNjZXNzICovDQo+PiAjZGVmaW5lIF9QQUdFX1JPCTB4MDYwMAkv
KiBTdXBlcnZpc29yIFJPLCBVc2VyIG5vIGFjY2VzcyAqLw0KPj4NCj4+IFNXIGJpdHMgbWFza2Vk
IG91dCBpbiBUTEIgbWlzcyBoYW5kbGVyOg0KPj4NCj4+ICNkZWZpbmUgX1BBR0VfR1VBUkRFRAkw
eDAwMTAJLyogQ29waWVkIHRvIEwxIEcgZW50cnkgaW4gRFRMQiAqLw0KPj4gI2RlZmluZSBfUEFH
RV9BQ0NFU1NFRAkweDAwMjAJLyogQ29waWVkIHRvIEwxIEFQRyAxIGVudHJ5IGluIEkvRFRMQiAq
Lw0KPj4gI2RlZmluZSBfUEFHRV9FWEVDCTB4MDA0MAkvKiBDb3BpZWQgdG8gUFAgKGJpdCAyMSkg
aW4gSVRMQiAqLw0KPj4gI2RlZmluZSBfUEFHRV9TUEVDSUFMCTB4MDA4MAkvKiBTVyBlbnRyeSAq
Lw0KPj4gI2RlZmluZSBfUEFHRV9IVUdFCTB4MDgwMAkvKiBDb3BpZWQgdG8gTDEgUFMgYml0IDI5
ICovDQo+Pg0KPj4gQWxsIGJpdHMgYXJlIHVzZWQuIFRoZSBvbmx5IHRoaW5nIHdvdWxkIGNvdWxk
IGRvIGJ1dCB0aGF0IHdvdWxkIGhhdmUgYQ0KPj4gcGVyZm9ybWFuY2UgY29zdCBpcyB0byByZXRy
aWV2ZSBfUEFHRV9TSCBmcm9tIHRoZSBQTUQgYW5kIHVzZSB0aGF0IGJpdA0KPj4gZm9yIHNvbWV0
aGluZyBlbHNlLg0KPiANCj4gSSBndWVzcyB0aGF0IHRoaXMgd291bGQgYmUgdGhlIGxhc3QgcmVz
b3J0IGlmIHdlIHJ1biBvdXQgb2Ygb3B0aW9ucy4NCj4gQnV0IGF0IGxlYXN0IGl0IGlzIGdvb2Qg
dG8ga25vdyB0aGF0IHRoZXJlIGlzIGEgcGxhbiBCIChvciBaIGlmIHlvdSB3aWxsDQo+IDotKSkN
Cj4gDQo+PiBCdXQgSSB3YXMgbWF5YmUgdGhpbmtpbmcgYW5vdGhlciB3YXkuIExldHMgdGFrZSB0
aGUgZXhlbXBsZSBvZg0KPj4gcG1kX3dyaXRlKCkgaGVscGVyOg0KPj4NCj4+ICNkZWZpbmUgcG1k
X3dyaXRlKHBtZCkJCXB0ZV93cml0ZShwbWRfcHRlKHBtZCkpDQo+Pg0KPj4gQXQgdGhlIHRpbWUg
YmVpbmcgd2UgaGF2ZQ0KPj4NCj4+IHN0YXRpYyBpbmxpbmUgcHRlX3QgcG1kX3B0ZShwbWRfdCBw
bWQpDQo+PiB7DQo+PiAJcmV0dXJuIF9fcHRlKHBtZF92YWwocG1kKSk7DQo+PiB9DQo+Pg0KPj4g
QnV0IHdoYXQgYWJvdXQgc29tZXRoaW5nIGxpa2UNCj4+DQo+PiBzdGF0aWMgaW5saW5lIHB0ZV90
IHBtZF9wdGUocG1kX3QgcG1kKQ0KPj4gew0KPj4gCXJldHVybiAqKHB0ZV90ICopcG1kX3BhZ2Vf
dmFkZHIocG1kKTsNCj4+IH0NCj4gDQo+IEkgdGhpbmsgdGhpcyBjb3VsZCB3b3JrLCB5ZXMuDQo+
IA0KPiBTbywgd2Ugc2hvdWxkIGRlZmluZSBhbGwgcG1kXyoocG1kKSBvcGVyYXRpb25zIGZvciA4
eHggdGhlIHdheSB0aGV5IGFyZSBkZWZpbmVkDQo+IGluIGluY2x1ZGUvYXNtL2Jvb2szcy82NC9w
Z3RhYmxlLmguDQo+IA0KPiBPdGhlciBwYWdlIHNpemUgd291bGQgbm90IGludGVyZmVyZSBiZWNh
dXNlIHRoZXkgYWxyZWFkeSBjYW4gcGVyZm9ybQ0KPiBvcGVyYXRpb25zIG9uIHB0ZSBsZXZlbC4N
Cj4gDQo+IE9rLCBJIHRoaW5rIHdlIG1pZ2h0IGhhdmUgYSBzaG90IGhlcmUuDQo+IA0KPiBJIHdv
dWxkIGhlbHAgdGVzdGluZywgYnV0IEkgZG8gbm90IGhhdmUgOHh4IGhhcmR3YXJlLCBhbmQgUWVt
dSBkb2VzIG5vdCBzdXBwb3J0DQo+IDh4eCBlbXVsYXRpb24sIGJ1dCBJIHRoaW5rIHRoYXQgaWYg
d2UgYXJlIGNhcmVmdWwgZW5vdWdoLCB0aGlzIGNhbiB3b3JrLg0KPiANCj4gQWN0dWFsbHksIGFz
IGEgc21va2V0ZXN0IHdvdWxkIGJlIGVub3VnaCB0byBoYXZlIGEgdGFzayB3aXRoIGEgOE1CIGh1
Z2UNCj4gbWFwcGVkLCBhbmQgdGhlbiBkbzoNCj4gDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
bV93YWxrX29wcyB0ZXN0X3dhbGtfb3BzID0gew0KPiAgICAgICAgICAgLnBtZF9lbnRyeSA9IHRl
c3RfOG1icF9odWdlcGFnZSwNCj4gICAgICAgICAgIC5wdGVfZW50cnkgPSB0ZXN0XzE2a19hbmRf
NTEya19odWdlcGFnZSwNCj4gICAgICAgICAgIC5odWdldGxiX2VudHJ5ID0gY2hlY2tfaHVnZXRs
Yl9lbnRyeSwNCj4gICAgICAgICAgIC53YWxrX2xvY2sgPSBQR1dBTEtfUkRMT0NLLA0KPiAgIH07
DQo+IA0KPiAgIHN0YXRpYyBpbnQgdGVzdCh2b2lkKQ0KPiAgIHsNCj4gICANCj4gICAgICAgICAg
ICBwcl9pbmZvKCIlczogJXMgWzAgLSAlbHhdXG4iLCBfX2Z1bmNfXywgY3VycmVudC0+Y29tbSwg
VEFTS19TSVpFKTsNCj4gICAgICAgICAgICBtbWFwX3JlYWRfbG9jayhjdXJyZW50LT5tbSk7DQo+
ICAgICAgICAgICAgcmV0ID0gd2Fsa19wYWdlX3JhbmdlKGN1cnJlbnQtPm1tLCAwLCBUQVNLX1NJ
WkUsICZ0ZXN0X3dhbGtfb3BzLCBOVUxMKTsNCj4gICAgICAgICAgICBtbWFwX3JlYWRfdW5sb2Nr
KGN1cnJlbnQtPm1tKTsNCj4gICAgICAgICAgICANCj4gICAgICAgICAgICBwcl9pbmZvKCIlczog
JXMgcmV0OiAlZFxuIiwgX19mdW5jX18sIGN1cnJlbnQtPmNvbW0sIHJldCk7DQo+ICAgICAgICAg
ICAgDQo+ICAgICAgICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPiANCj4gVGhpcyBpcyBhbiBleHRy
YWN0IG9mIGEgZGVidWdnaW5nIG1lY2hhbmlzbSBJIGhhdmUgdG8gY2hlY2sgdGhhdCBJIGFtDQo+
IG5vdCBnb2luZyBvZmYgcmFpbHMgd2hlbiB1bmlmeWluZyBodWdldGxiIGFuZCBub3JtYWwgd2Fs
a2Vycy4NCj4gDQo+IHRlc3RfOG1icF9odWdlcGFnZSgpIGNvdWxkIHNvIHNvbWUgY2hlY2tzIHdp
dGggcG1kXyBvcGVyYXRpb25zLCBwcmludA0KPiB0aGUgcmVzdWx0cywgYW5kIHRoZW4gY29tcGFy
ZSB0aGVtIHdpdGggdGhvc2UgdGhhdCBjaGVja19odWdldGxiX2VudHJ5KCkNCj4gd291bGQgZ2l2
ZSB1cy4NCj4gSWYgZXZlcnl0aGluZyBpcyBhbHJpZ2h0LCBib3RoIHJlc3VsdHMgc2hvdWxkIGJl
IHRoZSBzYW1lLg0KPiANCj4gSSBjYW4gd3JpdGUgdGhlIHRlc3RzIHVwLCBzbyB3ZSBydW4gc29t
ZSBzb3J0IG9mIHNtb2tldGVzdHMuDQo+IA0KPiBTbyB5ZXMsIEkgZG8gdGhpbmsgdGhhdCB0aGlz
IGlzIGEgZ29vZCBpbml0aWF0aXZlLg0KPiANCg0KDQpJIGNhbiB0ZXN0IHdoYXRldmVyIHlvdSB3
YW50IG9uIG15IDh4eCBib2FyZHMuDQoNCkkgaGF2ZSB0d28gdHlwZXMgb2YgYm9hcmQ6DQotIE9u
ZSB3aXRoIE1QQzg2NiBtaWNyb2NvbnRyb2xsZXIgYW5kIDMyTWJ5dGVzIG1lbW9yeQ0KLSBPbmUg
d2l0aCBNUEM4ODUgbWljcm9jb250cm9sbGVyIGFuZCAxMjhNYnl0ZXMgbWVtb3J5DQoNCkNocmlz
dG9waGUNCg==
