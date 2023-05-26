Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8071247D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 12:22:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QSLZK4Xx1z3fDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 20:22:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tv5mKdx3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::612; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tv5mKdx3;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QSLYP6Y0yz3c8v
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 20:21:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9laIPg6YpkRcpiFYjrlVusOqlIPynlYsjndpuZJRPXxEfHbvfX67xKS8PFWUofYQVnC7HgBOv59hp5KuVSfVcy34N7D5LVt4n+Kc0vBB6zfVmNVmHoJhLna2smc/z1slSuBMpj/ATSv5UtJy7YPi8Bw9cVkGr9g+HKx0MDM8sxosV3jcnHD7xyu3CH+PS/OS9NQvCtc49XXBhLh0W1KVZwvorcXi9hlU0FHDW+8dkRVypf0xskVaiCzr3Bol4KGpwwLSILhqqmVK3CQeiJCLle804A7vyHICfWc3PGNn2hX3dSo5dtmkEvKvMM1dIYdFgjCFqiCN+OA2wfIPZWdBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIr/LP4mkx4aMvlSCM/RrQmaXl0QFhQ8T6CaAV+KoE8=;
 b=Np1nIH4FUcwyfsQi6Ak5/gpz3anzGmgVK4bjy/ftCeg11vZiO9Yd71atM1/aSfbY6BiXYb+0b4ijEX1xu+4oCRPv785AST67oayMy1wKRpUk+oL44o7t6dNv64mys8hPXSUk+E9nmnp13I6+IOXxM0qbxAoz8zy3T9YlOud3xZptDRExE7pog7fEe2GXQnh7JglMI0XE3gp+vF9nAhGDMQzFlqAJNsGOItJZ39hZ9WKFeuDSKL2vWInVnN8ILMJ+DL/gzKjzb/4xvmTaxMhPZaAHAwG4PEJ8hdITzT1YYQ1NH0JGIpuHbKSEih9qJNxTmvQyqsrSknQAjb06j9UUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIr/LP4mkx4aMvlSCM/RrQmaXl0QFhQ8T6CaAV+KoE8=;
 b=tv5mKdx33Ojf52aYcxQYCWWrcIGjJV0cCpn+OzesNLnnLXsxuhXqm2ZlBp1/YZonzbMbtxqUq1UI7jroGrTUV9Ano2s25BSEQSZzGDqr4XMqoSznAld9LFuIXVf51/0K2Ob05StoZO3YSqqFZml1vgEPURIL9wANakOPDR14hif2NwHYy+t1Hmltw84795CtYKimZJAkKb43Zuf4zG83CKyYKzd/NtHFXrTzqRxX11JPf53quLopgIYMx8OqyXN9Yvy6QHF7Zc5wUVLTcDY1EycdeU5RfwHtsR0x0DOSfNxhxsl0ySXkl8tJeoNzWu9d/rLd00oPi4NefqnCCuKkAg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2052.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.18; Fri, 26 May
 2023 10:20:50 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::447b:6135:3337:d243%3]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 10:20:50 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nick Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Bug: Write fault blocked by KUAP! in do_notify_resume()
Thread-Topic: Bug: Write fault blocked by KUAP! in do_notify_resume()
Thread-Index: AQHZj7u+twVuWSQyM0G+b3lMSiZ3hA==
Date: Fri, 26 May 2023 10:20:50 +0000
Message-ID: <47f9e1cb-6a20-e5d2-59b1-a39f80bf1b7a@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB2052:EE_
x-ms-office365-filtering-correlation-id: 5095dc04-8b76-4227-bb3b-08db5dd2e10e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3FN90cOJVMdP+eZSVFmm1os1nd7hv6MPVtFEz82PnzG1DhTjqnNpxgMGj6/9or+VusAMdy5MqvPqEQxEh4Ri6esRfFNfELsDYX2tBq7y6gI4PUY+9296mJsbJckUPpgQJkyaK0j+qLzD3d8H4HWVWfEOYTHD/Um818gcKIGb2bsy6hhaTPL2MFBuDqKlmb361vH9Y4XICVBRQYGYiVsqmx0Jmwm+DfDvINWcIkmkXVNytfCGEuXDiUbWRPGTnzlxsGkevGUQlxuUP+ongVokX9lUBVw3IFQVMYk5OWMw0vx1elDg0tKSNCLl5aosE76CwlMVzMfNOXsnzL6RcIePk244rjD2U648v01z48TWsBCSZGfR3n7vVZOLAqbJtlRSUlJae8lzT1TZ1X5gX/W5gtwEOqli1+3p+9I+IiosWgXit4wgf8ReQsJd2afZbCTnmvwnKIAPn3EK2ZNwhnZRddCfZnv6+/OjBn3sPRkgcqnvy+GbZCrPEeoWEfgNKpU6BrfhxmgLM7eMS0q1h1KHWSJXeHldf+YlFIi/zh6KpeSU4dHchWHZ5QYeXIfGCt6WqA9Y+Boj/aMxt2O+sDGfEdpQ6HoOsbmwbFeC0JtUB2WOIqWx+fzqntTQbDPGH3gTgNggsUTn1rPjyfmZiYKNoX3RI1B2c3YAiXPhGu5woEOCMmOiLeeKq4GKjEav0AW6
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(451199021)(478600001)(66446008)(64756008)(66556008)(66476007)(91956017)(76116006)(66946007)(71200400001)(110136005)(31686004)(122000001)(316002)(6486002)(41300700001)(38100700002)(6512007)(6506007)(26005)(36756003)(44832011)(8676002)(8936002)(38070700005)(83380400001)(5660300002)(2906002)(31696002)(2616005)(186003)(15650500001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UkVpYWduamltL0ZBS0QwcXBTSEVha1F1ZkF3dFZZbldyWDJJcUl0WGVCbWIv?=
 =?utf-8?B?RWtOWVFmS3BROUFwNCtSR1pubWZPSjdIREpXNEhtVjA2cUVQYTA3aEhpMmNN?=
 =?utf-8?B?MXk2V2lCMjdXUzNOUHdqTWdSVExYbWlKQXZzWHpoMGpGTU81dFBQSWVFUm1Q?=
 =?utf-8?B?bSszaGxPdFYybzA5eWtBS3ViTXd5SmJCNGhBdkcyL3c1K25FZXNQNmJVRGdM?=
 =?utf-8?B?b28zTGtUTHF2eHJRUk9NeERteEMzOVZtQUwrYXZJV3hHSE5WbnBLdXczUzg4?=
 =?utf-8?B?aWVMaitqUUNVREFzcHpPWVVHczhWNmxmS1BNTXNZRWJTNHdtMUJUYkNobzRq?=
 =?utf-8?B?UjQ2WGY3V3NGTG5PaWtHdjdVd2lNTldaMmFxeXRFUlV3OWt1SUpIQjNRTnpv?=
 =?utf-8?B?UWJXcHlWZ0ROSm9KL2RxSzJJWGhaYTAxcVdneU5EcTJtZ0R3QXUxZlVnbjZT?=
 =?utf-8?B?OGVQMEZtTnN5RExYOENUVkUwcjROcEVjWldndzVMd3UyZHdPSERHc3cxaWZV?=
 =?utf-8?B?c0ozekcxZXQzRUoraHNFVU9wZ0xqekUxekJvQS9VQTN4MXRCME9kT2RYVytm?=
 =?utf-8?B?bGN1eDk4em4vOTRyTWo0VmVqdGlxdE9PVzN6VFlrYW9IT2c3Qk9HTzFIK0RY?=
 =?utf-8?B?SlQzZVR0YnhZZmE5T2JNZFRPcVp6REd4RXFIcE5Samdxblppck5Ydnp1T2hr?=
 =?utf-8?B?MERsS2hNdmkvUFN6blhXM01uS0dnZm9YUGtZM1h6T1NpVERvMkdOQnMrN1Vw?=
 =?utf-8?B?RS9Ick9NMVZjdUF6UXJxUGVpRkZpWE5mMW1SQ2p2M0tKSVVwVi8xcHpUR09K?=
 =?utf-8?B?bTErSFI4WkY2K0YvWHRtK2owUXlkaGpQZXZncE9hdURBK0pPQTRzWWtWKzU3?=
 =?utf-8?B?Zi8yVDBFakIweUxqenlPK0w1S2EzNVRCcUNHdkFtT3hMWmF3d3hoamU0QXNv?=
 =?utf-8?B?MTRCOU1OV3I3amNWNWJzbEQ2TVZvblZ2K0VSdDg2SitZOFhUWnZuSjkyREdj?=
 =?utf-8?B?aG9BTVI1VEYxWk5DbFVxZHZNVmtoTE83bzJGeXE2dHEwK0dIdEhoTVpveVVV?=
 =?utf-8?B?Z0pMbFYyT3VESWdMSnYvUVlZbEdGV2w4V2hSbk5ycjE0Ni91Q0I1dGFLSC9B?=
 =?utf-8?B?QWp3enlFOVNidCtJdkU4MU1YQStzQXMvUU5IS1NZcVdYYWJWRE1KdGxPWjR4?=
 =?utf-8?B?aHBsV0w1MmdhU0N5TXhxVFE0MGtjUlVHa3BSTGR5eVlZZ0xmZ1dFcC9VYytY?=
 =?utf-8?B?RnBSN3hkRXZyeUgxbjJuNExiOXltZzBoMFFoelNZRWErdld0RWRmT1BITTh3?=
 =?utf-8?B?ZUhaQVA1eC94SDVBYW02OEhiUDlUbXBXWW9aaGRBUjlDWXpvL01kbGRCQUVT?=
 =?utf-8?B?ZXViaUFLVXFhOXJnbXVBVG85TjZXeXhkWFZQa2E4UE1iMjg1K0VwdkpJNGFz?=
 =?utf-8?B?ZW9NU2ZjUXg3eVNBNVV0R3luTmZxRDJnTEoxZXkxcXBLbXV2MDc5NFRmVTEr?=
 =?utf-8?B?U1l4aWdYUWt1Y1dDamVOaVRvcS9ic1EyL25CTjJhc0Q1MUR3NE1ybEhYaHJH?=
 =?utf-8?B?QmRyKzMwSW55L0FJekpZMzhFOCtsTVd3aTIrT1ZaQkZYZlZGckg3SjVINFFa?=
 =?utf-8?B?QnRUVXFVNzd2aWRkNmNHNzI1YVNTZ1d6S3BBUXo3R1MwMVprbi9mWkhzZVNl?=
 =?utf-8?B?V2UyY2Y5blZHUE1PN1MvNkJzQ3FWNnc2QnY0TkZWeGpuTzVYUXVUUXh3R1d3?=
 =?utf-8?B?Smd6c1dsbmFZbkF4OStnZWVOQ1ROaUU4cm9aZGVuUEIxQjkwYW9aUDJudTlx?=
 =?utf-8?B?b2dvaVZzWXFjVWl1a0Y3cUhVSW1URXAyRE92Vk90ZEtUbUwwSGVrWlN5WkRM?=
 =?utf-8?B?SnFrWk1DRXFURnBFK0xIOVRsaVdMMS9VNjdSWVRTQW5HMFpYSExkVFpVL2FY?=
 =?utf-8?B?c2k5MmJPbW9YT1dkMGRBbTVLdEhKMVZRZThGcm1ST1dSWTdOTS9hUWx2eW1o?=
 =?utf-8?B?ODBNUlRQMWEyRXY2c3ppb3ZTeElFWVRIQjNFYjNpR0JnWkFLWDBxV1UvS1Mw?=
 =?utf-8?B?M3ZWNTJrZjVjaU1ES2dnL0F1NC85c3Q4eDNjaURma085N3NGOFlkYmFmR01K?=
 =?utf-8?B?YzlzSm5KRyttZlJ6dXlNZXErM2p1a3JYV2xGbzFCWUt5Q0Q0MkhJcm9VcHZw?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D4F010A653FCE45866D062E5DA95821@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5095dc04-8b76-4227-bb3b-08db5dd2e10e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2023 10:20:50.3015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rcukVW+9djuLogbrUKeWIAo8mNiQFg1htBZqHQkP1mAWveE1B6fV+jzmr4vsQgI4dJ+CRPPjIZ6Z0PmgAvITo7HZ2UEYPG8+H+RUyEgBGuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2052
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Q2FuJ3QgZmluZCBob3cgdGhhdCBjYW4gaGFwcGVuLg0KDQpJIGhhdmU6DQoNCkNPTkZJR19QUkVF
TVBUX0JVSUxEPXkNCiMgQ09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0DQojIENPTkZJR19Q
UkVFTVBUX1ZPTFVOVEFSWSBpcyBub3Qgc2V0DQpDT05GSUdfUFJFRU1QVD15DQpDT05GSUdfUFJF
RU1QVF9DT1VOVD15DQpDT05GSUdfUFJFRU1QVElPTj15DQpDT05GSUdfUFJFRU1QVF9SQ1U9eQ0K
DQpXZSBhcmUgaW5zaWRlIGFuIGFjY2Vzc19iZWdpbiAvIGFjY2Vzc19lbmQgYmxvY2suDQoNCg0K
WyAgMzgwLjQwNzU4OV0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQpbICAz
ODAuNDA4MDE5XSBCdWc6IFdyaXRlIGZhdWx0IGJsb2NrZWQgYnkgS1VBUCENClsgIDM4MC40MDg0
OTddIFdBUk5JTkc6IENQVTogMCBQSUQ6IDQyMiBhdCBhcmNoL3Bvd2VycGMvbW0vZmF1bHQuYzoy
MjggDQpkb19wYWdlX2ZhdWx0KzB4NTEwLzB4NzhjDQpbICAzODAuNDA5MzUzXSBDUFU6IDAgUElE
OiA0MjIgQ29tbTogQ09SU3VydiBUYWludGVkOiBHICAgICAgICBXIA0KICA2LjQuMC1yYzItczNr
LWRldi0wMjI3NC1nY2E2OWQyOGJhNzNjICMzMjgNClsgIDM4MC40MDk4NzldIEhhcmR3YXJlIG5h
bWU6IE1DUjMwMDBfMkcgOHh4IDB4NTAwMDAwIENNUEM4ODUNClsgIDM4MC40MTAzNDZdIE5JUDog
IGMwMDEzNWNjIExSOiBjMDAxMzVjYyBDVFI6IGMwMDY1YjA4DQpbICAzODAuNDEwODM0XSBSRUdT
OiBjYWU1M2NlMCBUUkFQOiAwNzAwICAgVGFpbnRlZDogRyAgICAgICAgVyANCig2LjQuMC1yYzIt
czNrLWRldi0wMjI3NC1nY2E2OWQyOGJhNzNjKQ0KWyAgMzgwLjQxMTMzNV0gTVNSOiAgMDAwMjEw
MzIgPE1FLElSLERSLFJJPiAgQ1I6IDIyZTgyMmQyICBYRVI6IDIwMDBmNzAxDQpbICAzODAuNDE0
MzAwXQ0KWyAgMzgwLjQxNDMwMF0gR1BSMDA6IGMwMDEzNWNjIGNhZTUzZGEwIGMyNjQzOWMwIDAw
MDAwMDIxIGMwYTc1ZDc4IA0KMDAwMDAwMDEgYzBhNzVlODggMDAwMDEwMzINClsgIDM4MC40MTQz
MDBdIEdQUjA4OiAwMDAwMDAyNyAwMDAwMDAwMCAwMDAwMDAwMSA5MjFhNWYwMCAyMmU4MjJkMiAN
CjEwMDJjOWY0IDAwMDAwMDAxIDAwMDAwMDA1DQpbICAzODAuNDE0MzAwXSBHUFIxNjogMTAwMjU3
NjAgZmZmZmZmZmYgMDAwMDAwMDAgMTAwMjU0YmMgMTAwMjRlZWMgDQowMDAwMDAwMCAwMDAwMDAw
MCAwMDAwMDAwNA0KWyAgMzgwLjQxNDMwMF0gR1BSMjQ6IDAwMDAwMDA2IDEwMDI1NzcwIDEwMDEw
MGNjIGMyNmM4ZDgwIDdmYWI3YjUwIA0KMDIwMDAwMDAgMDAwMDAzMDAgY2FlNTNkZTANClsgIDM4
MC40MjgzMTZdIE5JUCBbYzAwMTM1Y2NdIGRvX3BhZ2VfZmF1bHQrMHg1MTAvMHg3OGMNClsgIDM4
MC40MjkwMDVdIExSIFtjMDAxMzVjY10gZG9fcGFnZV9mYXVsdCsweDUxMC8weDc4Yw0KWyAgMzgw
LjQyOTY3M10gQ2FsbCBUcmFjZToNClsgIDM4MC40MzAxMTVdIFtjYWU1M2RhMF0gW2MwMDEzNWNj
XSBkb19wYWdlX2ZhdWx0KzB4NTEwLzB4NzhjICh1bnJlbGlhYmxlKQ0KWyAgMzgwLjQzMTUxM10g
W2NhZTUzZGQwXSBbYzAwMDNhYzRdIERhdGFUTEJFcnJvcl92aXJ0KzB4MTE0LzB4MTE4DQpbICAz
ODAuNDMyNTQ2XSAtLS0gaW50ZXJydXB0OiAzMDAgYXQgDQpfX3Vuc2FmZV9zYXZlX3VzZXJfcmVn
cy5jb25zdHByb3AuMCsweDI0LzB4ODgNClsgIDM4MC40MzMyMzFdIE5JUDogIGMwMDA2NTZjIExS
OiBjMDAwNjk4MCBDVFI6IDAwMDAwMDA2DQpbICAzODAuNDMzNzE0XSBSRUdTOiBjYWU1M2RlMCBU
UkFQOiAwMzAwICAgVGFpbnRlZDogRyAgICAgICAgVyANCig2LjQuMC1yYzItczNrLWRldi0wMjI3
NC1nY2E2OWQyOGJhNzNjKQ0KWyAgMzgwLjQzNDIxNl0gTVNSOiAgMDAwMDkwMzIgPEVFLE1FLElS
LERSLFJJPiAgQ1I6IDIyMDg0NDQyICBYRVI6IDIwMDBmNzAxDQpbICAzODAuNDM3NTYxXSBEQVI6
IDdmYWI3YjUwIERTSVNSOiA4YTAwMDAwMA0KWyAgMzgwLjQzNzU2MV0gR1BSMDA6IGMwMDA2OTgw
IGNhZTUzZWEwIGMyNjQzOWMwIGNhZTUzZjQwIDdmYWI3YjUwIA0KN2ZhYjdiMzAgMDAwMDAwMWQg
N2ZhYjgwMTANClsgIDM4MC40Mzc1NjFdIEdQUjA4OiBjYWU1M2YzOCA3ZmFiN2I1MCBjYWU1M2Y0
MCA5MThmZmMwMCAyMjA4NDQ0MiANCjEwMDJjOWY0IDAwMDAwMDAxIDAwMDAwMDA1DQpbICAzODAu
NDM3NTYxXSBHUFIxNjogMTAwMjU3NjAgZmZmZmZmZmYgMDAwMDAwMDAgMTAwMjU0YmMgMTAwMjRl
ZWMgDQowMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwNA0KWyAgMzgwLjQzNzU2MV0gR1BSMjQ6IDAw
MDAwMDA2IDEwMDI1NzcwIDEwMDEwMGNjIGNhZTUzZjQwIGNhZTUzZjQwIA0KY2FlNTNlYzggYzI2
NDM5YzAgN2ZhYjdiNTANClsgIDM4MC40NTE5OTFdIE5JUCBbYzAwMDY1NmNdIF9fdW5zYWZlX3Nh
dmVfdXNlcl9yZWdzLmNvbnN0cHJvcC4wKzB4MjQvMHg4OA0KWyAgMzgwLjQ1MjY3OF0gTFIgW2Mw
MDA2OTgwXSBoYW5kbGVfc2lnbmFsMzIrMHg5Yy8weDFhMA0KWyAgMzgwLjQ1MzMyOV0gLS0tIGlu
dGVycnVwdDogMzAwDQpbICAzODAuNDUzODAzXSBbY2FlNTNlYTBdIFsxMDAyNTc3MF0gMHgxMDAy
NTc3MCAodW5yZWxpYWJsZSkNClsgIDM4MC40NTUwODZdIFtjYWU1M2VjMF0gW2MwMDA4ODQ0XSBk
b19ub3RpZnlfcmVzdW1lKzB4MTI4LzB4MmNjDQpbICAzODAuNDU2MTQ5XSBbY2FlNTNmMjBdIFtj
MDAwZGY3MF0gDQppbnRlcnJ1cHRfZXhpdF91c2VyX3ByZXBhcmVfbWFpbisweDdjLzB4ZDgNClsg
IDM4MC40NTcyMDVdIFtjYWU1M2YzMF0gW2MwMDEyMGI0XSByZXRfZnJvbV9zeXNjYWxsKzB4Yy8w
eDI4DQpbICAzODAuNDU4MjQ5XSAtLS0gaW50ZXJydXB0OiBjMDAgYXQgMHhmZjQyZTk4DQpbICAz
ODAuNDU4ODA5XSBOSVA6ICAwZmY0MmU5OCBMUjogMGZmNDJlOGMgQ1RSOiAwZmRmZjI0NA0KWyAg
MzgwLjQ1OTI5OF0gUkVHUzogY2FlNTNmNDAgVFJBUDogMGMwMCAgIFRhaW50ZWQ6IEcgICAgICAg
IFcgDQooNi40LjAtcmMyLXMzay1kZXYtMDIyNzQtZ2NhNjlkMjhiYTczYykNClsgIDM4MC40NTk3
OTZdIE1TUjogIDAwMDBkMDMyIDxFRSxQUixNRSxJUixEUixSST4gIENSOiAzODA4NDQ0OCAgWEVS
OiANCjIwMDBmNzAxDQpbICAzODAuNDYzNDczXQ0KWyAgMzgwLjQ2MzQ3M10gR1BSMDA6IDAwMDAw
MDFkIDdmYWI4MDEwIDc3ZmMzNGQwIDAwMDAwMDA0IDAwMDAwMDAwIA0KMDAwMDAwMDAgMDAwMDAw
MDAgMDAwMDAwMDANClsgIDM4MC40NjM0NzNdIEdQUjA4OiAwMDAwMDAwMCAwMDAwMjAwOSAwMDAw
MDAwMCA3ZmFiN2VmMCAyODA4NDg0MiANCjEwMDJjOWY0IDAwMDAwMDAxIDAwMDAwMDA1DQpbICAz
ODAuNDYzNDczXSBHUFIxNjogMTAwMjU3NjAgZmZmZmZmZmYgMDAwMDAwMDAgMTAwMjU0YmMgMTAw
MjRlZWMgDQowMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwNA0KWyAgMzgwLjQ2MzQ3M10gR1BSMjQ6
IDAwMDAwMDA2IDEwMDI1NzcwIDEwMDEwMGNjIDBmYzQyNWVjIDEwMDEwNDhjIA0KN2ZhYjgwNDgg
MTAwMjU1NTggMTAwMjRlZTgNClsgIDM4MC40Nzc0NjZdIE5JUCBbMGZmNDJlOThdIDB4ZmY0MmU5
OA0KWyAgMzgwLjQ3ODAxNV0gTFIgWzBmZjQyZThjXSAweGZmNDJlOGMNClsgIDM4MC40Nzg1NDZd
IC0tLSBpbnRlcnJ1cHQ6IGMwMA0KWyAgMzgwLjQ3OTAyNl0gQ29kZTogNDA4MjAxZjggODA3ZjAw
ODAgNDgwMzMzNjEgMmMwMzAwMDAgNDFhMmZmYzggDQoyYzFkMDAwMCA0MTgyMDEzOCAzYzgwYzA5
NiAzODg0ZDVkMCAzYzYwYzA5NiAzODYzZDZiYyA0ODAwZmE3OSANCjwwZmUwMDAwMD4gOTM0MTAw
MTggODE0MjAzYzggNzE0YTAxMDANClsgIDM4MC40ODYyNjNdIC0tLVsgZW5kIHRyYWNlIDAwMDAw
MDAwMDAwMDAwMDAgXS0tLQ0KWyAgMzgwLjQ5MjgxM10NClsgIDM4MC41NDc5NTBdIENPUlN1cnZb
NDIyXTogYmFkIGZyYW1lIGluIGhhbmRsZV9zaWduYWwzMjogM2U2YjYxZTUgbmlwIA0KMGZmNDJl
OTggbHIgMGZmNDJlOGMNCg0KDQpBbnkgaWRlYSA/DQoNCkNocmlzdG9waGUNCg==
