Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 722DF69EED2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 07:40:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM63S2fqcz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 17:40:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lHIOILts;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::610; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=lHIOILts;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM62T07qBz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 17:39:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RfAIx6hU4vYCYINhgekjUXzCuSM61qEKDOdxtM+UG5J5Hus05MEI6ync3dIzP2hdU9qXnUZWbiR7T1mEUzo8s4q+qvs1icrjm3iVLdQOa610sToP5ZZ2l3f4iGAcCv7jW++lEB2cer7UwftIxRxaYhFGNvcBOciu1V+xi4bt8H7sprKz94JXh3AMYfv6+TmuGy5UOQMCBPR1/9VDlGAZ/JEdOnoSfTJNUHGsiw9Hw6keXRbGiKW/xbrDoRzGAedwc2Rf+0UZTWd0a/8OwyKwQhuxaP2O+14sHzmv4SYv0WUrgZwDzBOiFzBCrSBzLVWtxOtuk6Rxo7wzI2+VdApzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkiR4Dm1WPr3w+b/pfZI0Ra2XAKcn0Zm7PXMsHbUTy4=;
 b=gvxwdsTnhvv6CakNGIloxq9Qjan1E2oVCnRV2nzt1drvTLdpq7o/f8dHfbLNDspLeRK+U0/7Y1WijORYF5I8UNnKVkUYSdGL0VxIRB16jICVe0KcQOVq896nO93nztugjwdsmCWSY6UFn/rv9USPXOwImuo/YOmeZA+Synz0ATSqcwX0Z/G0EiG86GmN8YD+qk9DM72MefhFdtFzR1BKoP7pS3BB0mvsgEcE6IQzYujsvx8ghNiyz49nA2gdsSKIxCN2vnKVqj8uImafG+7ZOmtkmNOcZGPJk4XNs+JY/N4Oi97GIILNBqwQC0xxlZwoj9CECouvqZHboVD1IxduAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkiR4Dm1WPr3w+b/pfZI0Ra2XAKcn0Zm7PXMsHbUTy4=;
 b=lHIOILtsC0n7l+CEog6ed8EwmIXfkhfoVLMZ+cnHxJ927xYmKCQ8k27TwnUjuiblDS4zAjZmQraShMlRwGOxRdjsPBJgcta61lsOvJUsohgj5Po24I3lF8MAMWdmr64eyL7L1FiKzlEQ3i3IeeRZcs2r+W0rIq0VxUkorsz2+LHO+eRbWQW0udIYpiGsod+n9N9NMQA7E3tQAalPaMxsLrs+jpZNMXxFPGT6c7i8qfMdwbha2paj/AXTMJULFVSVnl/rFANbmUZsctya804Pau3A5x1d1lqXJaRMrl6RQ5aQ/VLX41zu46BiJI1f0669mM4RJPqaEnQawxzWvfrU0Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3429.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 06:39:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 06:39:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Topic: [PATCH v3 0/8] powerpc/85xx: p2020: Create one unified machine
 description
Thread-Index: AQHZQ4voiBHHMXLxIEOEExcEj19bG67Z+pwAgACPBYA=
Date: Wed, 22 Feb 2023 06:39:07 +0000
Message-ID: <a692823b-eada-3072-c9e9-83877480454f@csgroup.eu>
References: <20230218111405.27688-1-pali@kernel.org>
 <20230221220714.pm64kwsnf3erdjcm@pali>
In-Reply-To: <20230221220714.pm64kwsnf3erdjcm@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3429:EE_
x-ms-office365-filtering-correlation-id: edf88736-a737-4b61-ba2a-08db149f7f8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  fhiGgkDTBqGaoovTcMs5XFZMW5LW7zyEbt/Yl013XrlftTf5hrhhczo71roMr2kGRt/FVA6rer1YU53mvTBe94rvQj1jIOilZFCz9Dan1sXW3f/jHjpsKD+pL/rVqdlbmKEkGLPbHXS9OleTcxu7vbfytAUtjIbGVkWbbdvCSBpxV6U3HSCZrUYCiICMzjA7yf6hdBt7EP1kJL4OuOTgHtGqe7C9UrNXd1gTCrQG4aiH22U0Hnybg7/AKFDP3XplWPE70I2U1Zjh4H1JV2m8wSSdKuXJB2/s+JpcxLq9MQJi4ypWMAVLauMUFbBmTXjhNiaovQInAeECtH5cv51vi9GJ9VjBn9teDL/n4XfMMtonU0+tCeupYtCS3U0XCpqyXRavr4U6qR6i784Ph/Aurv+ov+ArMjjwYA1lpag7BZ2UFWoN9mlyJunnwhGglp8VMjQngdR5hhrjgUNppZY1k4BZLs0eszPmkMvnvWk7dfr5PqzwJXPZpZV0Dz6s17mK4PuyDE+/g4fxc5gVjiwbsXLyQXp9mXn//IoeeB/YwXqi/793grqLocMwzIv2Ma8OROVS3pA/PxFXtBgWorukme8U5klO19xwp93VNxdYRmwGC0713DjpUqFVu83njIdc9sZ6lki2yjC6eJj4mnStWkkil+QtFjT5iT0NrN2xD2MESC2n0w3fxeqfEaNFgS4fqUFjtWs2RxVQeChNQarx9Fq00zxB31pB9j0hK/HHW1hP/d9Ul2RqRXSxcpdrTYsd7uItKqXpEnQorKJmbwBeBTFHVzj9e821OozhE3jKct0=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199018)(966005)(31686004)(26005)(186003)(6486002)(6916009)(4326008)(76116006)(66946007)(66556008)(66476007)(64756008)(8676002)(66446008)(5660300002)(36756003)(83380400001)(8936002)(91956017)(2616005)(6506007)(6512007)(71200400001)(478600001)(66574015)(54906003)(41300700001)(316002)(38100700002)(86362001)(122000001)(31696002)(38070700005)(44832011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UjNjZjEzMXhkYnZaN1grUTN3c1didmprRS83TngzSjdZVWh2Skpsb0R5dTE0?=
 =?utf-8?B?RnpYaVRaVkc2YmZIMFdMazdqTnZKR0FCbHN5YVNsRVV4d1hEWmNTYkdLcmtr?=
 =?utf-8?B?Z29mUG5IVnMrQUpENG8yQlFHQUVWcnBhR285QjVqbnhtNm02TzVnZi8xWXRG?=
 =?utf-8?B?ZS9FU0RoMGFibnJ5SlVMZWkwUFFiTklxbGFrU3JheUo2b3hRMVloNE9LSTl2?=
 =?utf-8?B?Qk9kcFF2aEI1MnhoTkZoK3BlaDRIQTE5QngvTUkxNnNhYlM1cHhDazgyMGls?=
 =?utf-8?B?NDVzOE4zdzc5dmp1Mk1IbmIraEE2c3RsWCtHRnB2UGRIa0t6d3NRdXZRMUJP?=
 =?utf-8?B?STd3enZKU0dTSUdVMEdqMHVCUEtZbUZFUDFWdCsyYTdSS1JOU1BnTUNibkpP?=
 =?utf-8?B?QjJSRW54YlRwbDl3eHRueTJhT000R0doU2l3QmFBWm9FZkdoR2dSZXVwUlEr?=
 =?utf-8?B?QlRIc21HMzlNT0RXaXd1WkRzSkxaUlRVUWd3VkphSTNkWUJBbkRtVmw1R3V5?=
 =?utf-8?B?NzI1cldaOXFtaE1DTHZaeHBKcWh0SlNmQnBSeXB1dXBIMVhsenl3NzA2Wjdn?=
 =?utf-8?B?NFBiUjlkckQxdU5RaUdab3lva3QyVk1BbkY0NnQ5NmxMcDk3ZGNveURXQ05I?=
 =?utf-8?B?YitoelpzZ20yVHRic1RJbXB1eWJzbnZ6aXgra2ZlaHZUZVdXMGowbHBnVklH?=
 =?utf-8?B?VFBtRWVXZ1l4SGVWZVYzZXFlNFpFWGJGelM0R3oxSDRjSTVmVzVLcWI2dFpB?=
 =?utf-8?B?TGZDak5ZOGZyWlZJZmcvWTVJR245dFF1YmdkUFFNS2E3UnFJZGd2ZG1ma2FV?=
 =?utf-8?B?enExaldIS2VMVkY0ZU9rYm44TG1NTERFaVE4QWxISjk4Vmp4UlFJenZHVUlV?=
 =?utf-8?B?RUN3ZGVPRU5pWXJxTEcvOVNLaTMwQ1oyVGQ0T2JFLzN2VHcwT04zTFFEYUJ0?=
 =?utf-8?B?S3FkS2ZaRVE0MGxjWElaQWc3Z3pBV3dTMzh0T2hIaWJ4NVRsNm11NThPVE15?=
 =?utf-8?B?b2V6aEtGbWpycE9naW1IZ1I3Z0FuT1BLRlEwanp0eGQzaUZ2eitxU1dQemNr?=
 =?utf-8?B?bURxelJ5RFNTWHl3NXNiRTJ2eXdpajFYS09CWG55YU5vMThBeGliVjNjYnZ4?=
 =?utf-8?B?bFUrK25uM0ZHeUJZOStqVzE2TVZHYXdHUml6ODRobmlub1VjRDRmZzFqSms5?=
 =?utf-8?B?T1Q4Ujd1UDNSWFhrV1ArM29DQWovako5S1ZJUlJOOXc5OEpoNDZXUzhWZzRH?=
 =?utf-8?B?Z2trRUxMSGI5U25VL0lKTmNwdlFuYnlCcEJEb2xNcXQybGs1blRLTTFKMWU5?=
 =?utf-8?B?ZTY0LzZqeDhJQnVqdG41UWpodGlVQ0NDZE1lQ2ljbm5qOWhCV1g3dU96Ty9q?=
 =?utf-8?B?cVArWUdGR1RGZTF5UEdRNmhCY2VveGI4eEJ3TDh2ZkU1NHdrWGt0ZlNOaVlr?=
 =?utf-8?B?enU2WVQ4QmFWRy8wbHNKQkZlR0I4ejIvUnowd01rRlRIaWpGWEJKWms5WFhq?=
 =?utf-8?B?NXhZTkxOeHpRM3c5WmVISlVqaktBSmxEMnQvRkViSHhKdGtJWkY2a1g1WDMx?=
 =?utf-8?B?R0YvUStaVWxnYkZ3d0tDNTJxSTVQeTlhTnBxMGZZQklwYzc0RUliWHJwcHZ0?=
 =?utf-8?B?UGJtZ2FOSldQcHJFVnZSVUk4VTNVUzZPTkpWeC9CR2hWMU1zaUpLN1NLYnFE?=
 =?utf-8?B?YUpsTVVBNjFOdlpUY2RVeTE0ajRIOWxhZmtGd2VDK21jdk5pd3QzQjN4NXJI?=
 =?utf-8?B?SmNJeGRmWDFyVjVWOGdlNmNEVlptVEpsNURaSjcwdzNpRGpwZ3JTU2REU2l2?=
 =?utf-8?B?dEpYazBPTHpzTVJzVi9QbHlMZ0xGZzNTaytScVRlQVAvSlJ2TGFUU2tBNXFM?=
 =?utf-8?B?Yko3T1dXU0lVZlIvaHpoTzZIeWE2RHVSeU95NDVYbmg0RWpaVUhnL3lBdUNP?=
 =?utf-8?B?ZktqZHVvUG9GMnJPdGVQR0ZsaDd4cGNHV0h4dFI4RWlNcElRUDlMNjZFdk1s?=
 =?utf-8?B?SWR0d2JVdG0xRnIvL1cxOEF5RDh4aUVva2pUWXM0MytZVG40aVh2YnJTM0xm?=
 =?utf-8?B?WFgwRDJieWx6RnZOdmRoVUt3M0pRTnkxSjZkN3ZrbGVpMExEdi9lRENZTTZB?=
 =?utf-8?B?d3pTRUQ4RGhncVlvdU5QY0o4czZSQjRUeVFEbUZkY2FXdGZhT0dldW5nRERh?=
 =?utf-8?B?d1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F72C8D26F40B2748A37908E6662E5FB3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: edf88736-a737-4b61-ba2a-08db149f7f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2023 06:39:07.5054
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sfD+t5h+ELnnXnWOvaXRntd7KFrYWfgAISDVzT+Ohl2790ngh4X2I8XDenVYltYFYneITDbZW8JezucV1lTGonweRejReoqCQBg4//dakXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3429
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
Cc: Sinan Akman <sinan@writeme.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Martin Kennedy <hurricos@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDIxLzAyLzIwMjMgw6AgMjM6MDcsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+
IEhlbGxvIENocmlzdG9waGUhIENvdWxkIHlvdSBsb29rIGF0IHRoaXMgdjMgc2VyaWVzPw0KPiBJ
IGFkZHJlc3NlZCB0aG9zZSBzbWFsbCBpc3N1ZXMgYW5kIGhvcGVmdWxseSBpdCBzaG91bGQgYmUg
cmVhZHkuDQo+IEl0IHdvdWxkIGJlIGdyZWF0IHRvIGhhdmUgdGhpcyBmaW5hbGx5IGluIHY2LjMg
cmVsZWFzZS4NCg0KSSBzdGFydGVkIGxvb2tpbmcgYXQgeW91ciBzZXJpZXMgYW5kIEkgd2lsbCB0
cnkgdG8gcHJvdmlkZSBhIGZlZWRiYWNrIA0Kd2l0aGluIGEgZmV3IGRheXMuDQoNCkJ5IHRoZSB3
YXkgSSBzZWUgdGhhdCBQYXVsIEdvcnRtYWtlciBoYXMgc3RhcnRlZCByZW1vdmFsIG9mIHNldmVy
YWwgODV4eCANCmJvYXJkcy4gU2hvdWxkIHdlIGZpcnN0IHRha2UgUGF1bCdzIHJlbW92YWwgc2Vy
aWVzIHRoZW4gc2VlIHdoYXQgcmVtYWlucyANCmJlZm9yZSBhcHBseWluZyB5b3VycyA/IFRoYXQg
d291bGQgbWFrZSB5b3VyIHNlcmllcyBldmVuIG1vcmUgZWZmaWNpZW50Lg0KDQpDaHJpc3RvcGgN
Cg0KPiANCj4gT24gU2F0dXJkYXkgMTggRmVicnVhcnkgMjAyMyAxMjoxMzo1NyBQYWxpIFJvaMOh
ciB3cm90ZToNCj4+IFRoaXMgcGF0Y2ggc2VyaWVzIHVuaWZpZXMgYWxsIFAyMDIwIGJvYXJkcyBh
bmQgbWFjaGluZSBkZXNjcmlwdGlvbnMgaW50bw0KPj4gb25lIGdlbmVyaWMgdW5pZmllZCBQMjAy
MCBtYWNoaW5lIGRlc2NyaXB0aW9uLiBXaXRoIHRoaXMgZ2VuZXJpYyBtYWNoaW5lDQo+PiBkZXNj
cmlwdGlvbiwga2VybmVsIGNhbiBib290IG9uIGFueSBQMjAyMC1iYXNlZCBib2FyZCB3aXRoIGNv
cnJlY3QgRFRTDQo+PiBmaWxlLg0KPj4NCj4+IFRlc3RlZCBvbiBDWi5OSUMgVHVycmlzIDEuMSBi
b2FyZCB3aXRoIGhhcyBGcmVlc2NhbGUgUDIwMjAgcHJvY2Vzc29yLg0KPj4gS2VybmVsIGR1cmlu
ZyBib290aW5nIGNvcnJlY3RseSBkZXRlY3RzIFAyMDIwIGFuZCBwcmludHM6DQo+PiBbICAgIDAu
MDAwMDAwXSBVc2luZyBGcmVlc2NhbGUgUDIwMjAgbWFjaGluZSBkZXNjcmlwdGlvbg0KPj4NCj4+
IENoYW5nZXMgaW4gdjM6DQo+PiAqIFVzZSAnaWYgKElTX0VOQUJMRUQoQ09ORklHX1BQQ19JODI1
OSkpJyBpbnN0ZWFkIG9mICcjaWZkZWYgQ09ORklHX1BQQ19JODI1OScNCj4+ICogU2ltcGxpZnkg
cDIwMjBfcHJvYmUoKQ0KPj4gKiBQYXRjaGVzIGdlbmVyYXRlZCBieSAtTSBhbmQgLUMgZ2l0IG9w
dGlvbnMNCj4+DQo+PiBMaW5rIHRvIHYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBw
Yy1kZXYvMjAyMjEyMjQyMTE0MjUuMTQ5ODMtMS1wYWxpQGtlcm5lbC5vcmcvDQo+Pg0KPj4gQ2hh
bmdlcyBpbiB2MjoNCj4+ICogQWRkZWQgcGF0Y2ggInAyMDIwOiBNb3ZlIGk4MjU5IGNvZGUgaW50
byBvd24gZnVuY3Rpb24iIChzZXBhcmF0ZWQgZnJvbSB0aGUgbmV4dCBvbmUpDQo+PiAqIFJlbmFt
ZWQgQ09ORklHX1AyMDIwIHRvIENPTkZJR19QUENfUDIwMjANCj4+ICogRml4ZWQgZGVzY3JpcHRp
b25zDQo+Pg0KPj4gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXhwcGMt
ZGV2LzIwMjIwODE5MTkxNTU3LjI4MTE2LTEtcGFsaUBrZXJuZWwub3JnLw0KPj4NCj4+IFBhbGkg
Um9ow6FyICg4KToNCj4+ICAgIHBvd2VycGMvODV4eDogTWFyayBtcGM4NXh4X3JkYl9waWNfaW5p
dCgpIGFzIHN0YXRpYw0KPj4gICAgcG93ZXJwYy84NXh4OiBNYXJrIG1wYzg1eHhfZHNfcGljX2lu
aXQoKSBhcyBzdGF0aWMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIwMjA6IE1vdmUgYWxsIFAyMDIw
IG1hY2hpbmUgZGVzY3JpcHRpb25zIHRvIHAyMDIwLmMNCj4+ICAgIHBvd2VycGMvODV4eDogcDIw
MjA6IE1vdmUgaTgyNTkgY29kZSBpbnRvIG93biBmdW5jdGlvbg0KPj4gICAgcG93ZXJwYy84NXh4
OiBwMjAyMDogVW5pZnkgLnNldHVwX2FyY2ggYW5kIC5pbml0X0lSUSBjYWxsYmFja3MNCj4+ICAg
IHBvd2VycGMvODV4eDogcDIwMjA6IERlZmluZSBqdXN0IG9uZSBtYWNoaW5lIGRlc2NyaXB0aW9u
DQo+PiAgICBwb3dlcnBjLzg1eHg6IHAyMDIwOiBFbmFibGUgYm9hcmRzIGJ5IG5ldyBjb25maWcg
b3B0aW9uDQo+PiAgICAgIENPTkZJR19QUENfUDIwMjANCj4+ICAgIHBvd2VycGM6IGR0czogdHVy
cmlzMXguZHRzOiBSZW1vdmUgImZzbCxQMjAyMFJEQi1QQyIgY29tcGF0aWJsZSBzdHJpbmcNCj4+
DQo+PiAgIGFyY2gvcG93ZXJwYy9ib290L2R0cy90dXJyaXMxeC5kdHMgICAgICAgICAgICB8ICAg
MiArLQ0KPj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvS2NvbmZpZyAgICAgICAgICAg
fCAgMjIgKystDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9NYWtlZmlsZSAgICAg
ICAgICB8ICAgMSArDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X2Rz
LmMgICAgICB8ICAyNSArLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4
NXh4X3JkYi5jICAgICB8ICA0NiArLS0tLS0NCj4+ICAgLi4uL3BsYXRmb3Jtcy84NXh4L3ttcGM4
NXh4X2RzLmMgPT4gcDIwMjAuY30gIHwgMTM1ICsrKysrKy0tLS0tLS0tLS0tLQ0KPj4gICA2IGZp
bGVzIGNoYW5nZWQsIDY4IGluc2VydGlvbnMoKyksIDE2MyBkZWxldGlvbnMoLSkNCj4+ICAgY29w
eSBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgve21wYzg1eHhfZHMuYyA9PiBwMjAyMC5jfSAo
NTIlKQ0KPj4NCj4+IC0tIA0KPj4gMi4yMC4xDQo+Pg0K
