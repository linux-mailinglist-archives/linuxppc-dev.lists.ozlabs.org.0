Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A19956223D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 07:17:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6ZWd43cSz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 17:17:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eIunty7U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.59; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=eIunty7U;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90059.outbound.protection.outlook.com [40.107.9.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6ZVj30l8z2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 17:16:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcNxS1gMs0DtP+gKED2OyRRw+sfdLTEOiZbU5ULERLJk2zfCfqq79dUeJMC8m9dHkJZOLG3BtnExLpqmJM/WhpzWFdzBIonR9eGn4VCrlK+L3JrftRPvCIMdwN3fBxEA5qRVfRFcVIiGL5Fu7h/CGQhyLJ8DlnlrgKX2OpqJenEkTeIuq1BLJALuoWd34vvqXItOKTPik3Z4zFjhicMFj7PBSzyI5eEIapfSviMknaOhhnjUEH7heRO3fPEyZ5mjolJjK29n/HUBoQx9Q4XEK26MUIRoDMrnPVd1LjGjw5GwrcunLk+l/eQ+6BQsMoqYR8ijxZCsE76Twq404nBaMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEs5YAcFLAvF+QtwkK4Lldqw65MSJWghlRWP52ldRgc=;
 b=AcZdvNnJb0hmhDRIJFhm1ey5ldMMfh8+a/WgvKldH319Sy8lHkYf9f3+tgvvYKQb09npzKWTE3h40ZK3VTJKs7Ei8FXbdO0dtegfUpzkRL/kaczdCmJBeDM6EvfsP350eDuu5XflWjSi1PxncCjfxGTfwToT9jTQzxPGd8Ud/avqhCsaAIpLixGB82eogs3OGLj9Of6NE0Cb85JDRBeq0EVzG4pHFb9EHHlSubLv8sgjnHsVvZWbeLfAVS3+RSyOoUuOBFPE9//oiC38pfZDL5WPY3G+/779cvyP9GdNwYk6ufTbuPEqyDstgnEPdBAuwDDLxl2VgljGmEtalbLzsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEs5YAcFLAvF+QtwkK4Lldqw65MSJWghlRWP52ldRgc=;
 b=eIunty7UWMaFf2wIQN0+0p7l5ZCJH0v4DL8NeR8fmVuWoX+gsAs/XxGUOVZqUhnId0YroCHpN6NPQiC1ww1h5RvgEfydvC7dGFrmJ6c4YVA6KJtK7xP6G0D1dQhx+SQ1n9CeFoR5Z4f6Gpquoa2VOHRBpvxzNgam9RqUaxO+E4kMK5/AnE1OAPGTECOksBG8A17QNP5kT7MEpB247JX4yw0CiVIXLnhXRou8NCpG8AxP3Z8ZTMU9oOuOqG4MimY1f9CYpPz2Kcfb2+RDbWqUlzG/6woPyjFnEfRYY2CSJfn8LBawHsRuO2oN7ashg0FWdUb46golqGcFNgbqcOl27w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1865.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Wed, 9 Nov
 2022 06:16:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 06:16:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v10 3/9] powerpc/mm: Remove extern from function
 prototypes
Thread-Topic: [PATCH v10 3/9] powerpc/mm: Remove extern from function
 prototypes
Thread-Index: AQHY8/b5ZdDm6oWKEE2ijQ0jshnhXq42HamA
Date: Wed, 9 Nov 2022 06:16:26 +0000
Message-ID: <d8206a40-0693-15ad-ef1d-0188b1ad686d@csgroup.eu>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
 <20221109045112.187069-4-bgray@linux.ibm.com>
In-Reply-To: <20221109045112.187069-4-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1865:EE_
x-ms-office365-filtering-correlation-id: a10a3b01-a195-48e3-b69e-08dac219eeb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NDyT4iU7w4gxaJPqsvUzEfwJkGPGMWZGW/n8s1AxlpFHxxVOBFYOZ0dlFrpaQVO5ItPIOImunVdTdfanvQPRPUkqD4HCNGEWXSDZ4ogrNnh05W/cPeUcXE/9nm01ZqqOEXir1+nP2xXmoHCYLqXq5MwwsMW5Pfj8gBZKKFnyFW3ZopT/wkGXfm5JGqKC/wgYMU7olaSNPRFB/dkvRjmyvM5rVni+NUwdRY1XUhgFezWXZzIwVCrxg5WporxoCTsTYUmI7qX+k4bsFGwMo6D5DTNqshd7kUE6P5h5Y8F1ko4QmdCP594jFTkLLCDbxhqB8lsmEhUBaSnHKXLR2Vwy5GFWSk5xjggYTfLS0C0psz2pj2j0Gg8ndHA7rXKBhksZkjfSyp7hUS1mrc+Gt1JIKhMkBoYVYU2BlToiARLzIrgPB+sui0NUpTWzaXlTVz78qSR7jrQmATDwmCNyd5eOOUO2BiUZ5dLqFrxg17xJYE/EPciQQECPCEIjk/b51Kp7LHFUyCZebRgU12fM4TaJCT0ilvwheBAxnmveb+2uVyrI7/MaUFBXzgOOijZ3gvTo0KeSPjLwuUWquXcJw3Gk3ty1cYDPF5JzMAfwFFUAhXo8FtayAkZnHPt0zAfn1L7xxGcrnYor8JRZmtaad87yOfScoiiSN2SuNa56AnfOE9IIm7K8fOJt3y6ViMw/+VbqeTZUGXaaqaZO4MOhnUiT3fdbNWThXOo5Da8+NjoDx7273mwKbvXuSHr3O4z/wVI9yQ6YTdmeTgmsz67hUKCoAXUP5cBZnVUqty5KAdACmD7shEdbBripwCN2vVm7Kdr2Tx17ghmmuP6xY3Yb+/zr+g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(91956017)(8676002)(86362001)(66946007)(4326008)(66446008)(64756008)(66476007)(76116006)(31696002)(316002)(66556008)(6506007)(6486002)(478600001)(2616005)(66574015)(186003)(26005)(36756003)(54906003)(110136005)(38100700002)(6512007)(38070700005)(83380400001)(122000001)(8936002)(71200400001)(5660300002)(44832011)(31686004)(2906002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UExWQlZma1NyKzdtdk4zdjNtN1ZSQkRXNFFBaUhOVnFTcTRrclVrSjljNHdS?=
 =?utf-8?B?TGppeHhqRE1FZllPcTBCSWtReTRvT3R5MXUvSE1qRmMrODk0L3UwSDIrWkcw?=
 =?utf-8?B?N0E0WGIwaWNVNWErNzZkblFSZUFWb1R6czZvQnJKVjVESmNDTTZDYXlKVFl5?=
 =?utf-8?B?ZGRkcUFteFdYU1V0SmRwUk5Pa3NMbDdoUWUva2JLaTRPbXRzeFFKWGVSKzRw?=
 =?utf-8?B?a0EwdXZ4L0dhWUs4cmNaYk9JRXpqSHVCaU9hMmJuem84UXpVeEdqZnVKVHow?=
 =?utf-8?B?b0d3SHVQMGdGRStpTFlVcjBGcDkxaXgvTXY1cnRXblR6Q1V2MERCMzVpMjhL?=
 =?utf-8?B?L1E5SHpHcHR3dTY2ZlNmV2c5blNJQjQrM0lqT2JvZDVFNFMydzBpRFFrZ2xh?=
 =?utf-8?B?Sm92eVhHUHBwV21MYmlabExTZFlKK0xQWEI2WUNpaEw0VnNtREhvUmVmZXlj?=
 =?utf-8?B?Z1VLWU9XNnphblo4dUJsQXRHQ0F3Q0JpcEZjVWhKQUlMMkRwanUrWGhrMzho?=
 =?utf-8?B?YitkRjIrVW5kTHNQSm9EdGowMGptTnlqSmlpaWNRRFROdWw0MWZRM0lpajBF?=
 =?utf-8?B?Mk5WMHl4cUNRcko4K3JMeGsvWFFZZjIxaU1lbDlBb1pEMmZVQ1g5c1RDN2oz?=
 =?utf-8?B?dFF2NEN2d3JoaGlRNE8zczNoZ1M2WGtaaitJemdLSkR6Mml6K0F2Vlk4d282?=
 =?utf-8?B?V0w4cnJMUnFzbmRMQkdxV2laYzlFYytSWU1USUhzaU9ad1lHRVNyMEN3OVpL?=
 =?utf-8?B?dXFXQlNUQ3BBbG5nWC9CbTkvS0J0VWgxSDM2Z0lDMGlsbmZaYkdHTisxRTQr?=
 =?utf-8?B?bDluVEp6SE1PbE1idmRmMTFtVFBmNWFycE1ERUdOU3pHQkpENXM2VGYyNFZH?=
 =?utf-8?B?dU1wVWRZTHFBWTNnRW43UjdrUWhKTGhWSURzZnpISmRadzd3WGVhMVlmaFdB?=
 =?utf-8?B?R0JCVWNyTXJ6aEFMalVDY3kyV3pQTm5pam5rNTZpbE5rTnYrcnRUZThUaU93?=
 =?utf-8?B?VGFLM1o0VXoxVjY4dVl0RnZJV0dKaDJLT1EvdkRjc2VZWExVbjFUYmJiVEdY?=
 =?utf-8?B?bGIyUktvcHVoS2NkamxIYWIzb1ZEenk3UzZFMTcvQndKYzlDUzF0ZytsNENO?=
 =?utf-8?B?ajZPellZS2lNcmYrL3VKMVloVHZlYTFNVE4xOEE4MlBzVURFb0E3dHNjOUs2?=
 =?utf-8?B?N1EwMGtWRUZnYS9qS2RJQkJtbjVZZnVHSzUzd2crS1JqczV2eGp5MWwrMjU1?=
 =?utf-8?B?MnNEc2JRZUM1NkFFUzRrOXdPcU5BeDdvN21Fb0syblFtT0poZHpZWDJLMC9M?=
 =?utf-8?B?ZkdXVnU1aFhhbCtCem1ySURMVTBDUnNzT3puRDFPaEFWR2JJR0xCUTFzbDk4?=
 =?utf-8?B?TGlwVG5LM1VBcUdhbC96OGJEV3N0c0NWam56bmxkejB4NXV1TDFlVTlzNVRB?=
 =?utf-8?B?dm9iTjk5YnRROExIelNwRUxhMU9xTFp1d1Q3OTE3S3F4OW92cmVKNWYva0Na?=
 =?utf-8?B?N0lxRzMwUFIzSWVnUjlBdEtpWS9zQldDYkR4VFA3QUFUNEtmeFR6NFNOU2Uy?=
 =?utf-8?B?OVlrNk01Yk90SVcxK1R6b2IyOGxMNmNDNUlBN1UxWEtvVTRzcU4xUFRzVk5G?=
 =?utf-8?B?QWRCdTdZUkIyM21kYXpYM1gyTDF0d3BwK2ovcFhxa3UvbXF0MUMvZlJDNUNp?=
 =?utf-8?B?dGI3N3JYUEFabHBKWW12amUwWFlpTUlSemlZclRNV2hRZ0ZjNWx4MWtUSFZi?=
 =?utf-8?B?MlVLUFVOd1dKbHU1VGsyWDJ2ZEVod1EvUFNXVG5kSjdoVnNRNTRadE5sNGVS?=
 =?utf-8?B?bU11c1FHMitxdTZ6T0IzVFB5M0t3azVsdXNFU0lhWHNldzlMUGtnUmhXRld3?=
 =?utf-8?B?c1JKeDMrQzJsMnVJWmJ2MEVVcXNUb0dUcXlPWXcvNFcxK28wMlcyOStlUDkr?=
 =?utf-8?B?ekVBNm5kd1FLVytqMFJJbkRRV3BzaXVJWWxDQzR6b2NiYTh0YzdoNjhyMTZn?=
 =?utf-8?B?ZjhTbHFhM2x4V2EzUFkyVFNRbDFXV2tCVmN1YTNqRTczbFRDOVd3OU5kZUZS?=
 =?utf-8?B?WHVpWHM0WXc5MVdwVHBycU5wTUk2c0NsaDI0dnpveHlodUhZUHZXS0FNSks0?=
 =?utf-8?B?WFZGc1JqR3NWbFpBS1RrV3FjZHIzb1J1SS9yZ0xUZGJUeCtwYndOaGxyU3A1?=
 =?utf-8?Q?XbOwKbWlZ71KCP1jnLD6XwY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4E61C2CDE8BBA429697FE0A349FB3FA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a10a3b01-a195-48e3-b69e-08dac219eeb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2022 06:16:26.1087
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZxlcnuQICLJwTrdaAyUycTzz9aIdr2qmzKY+ltZJcU0FQm23+rz0SYn+mo680/ye4wNMXU51PGjp92rIzkF4Yay5XOuh/LoH6afgu49pwio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1865
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
Cc: "jniethe5@gmail.com" <jniethe5@gmail.com>, "cmr@bluescreens.de" <cmr@bluescreens.de>, "ajd@linux.ibm.com" <ajd@linux.ibm.com>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzExLzIwMjIgw6AgMDU6NTEsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
UmVtb3ZlIHRoZSBleHRlcm4ga2V5d29yZCBmcm9tIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4gSXQg
aXMgcmVkdW5kYW50DQo+IGFuZCB3b3VsZCBjYXVzZSBpbmNvbnNpc3RlbnQgc3R5bGUgd2hlbiBu
ZXcgZnVuY3Rpb25zIGFyZSBhZGRlZCB3aXRob3V0DQo+IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQmVuamFtaW4gR3JheSA8YmdyYXlAbGludXguaWJtLmNvbT4NCg0KDQpSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KDQoNCkFsbHRo
b3VnaCB0aGUgc3R5bGUgaW5jb25zaXN0ZW5jeSBpcyBub3QgYSBnb29kIGFyZ3VtZW50IGZyb20g
bXkgcG9pbnQgDQpvZiB2aWV3LiBTdWNoIHN0eWxlIGNoYW5nZXMgY2FuIHNvb24gYmVjb21lIGEg
bmlnaHRtYXJlIHdpdGggYmFja3BvcnRpbmcgDQp0byBzdGFibGUuDQoNCkluIHNtYWxsIHZpbGxh
Z2VzLCBkbyB5b3UgYnVpbGQgbmV3IGhvdXNlcyB3aXRoIHRoZSBzdHlsZSBvZiBvbGQgaG91c2Vz
IA0Kb25seSA/IE9yIGRvIHlvdSBkZXN0cm95IGFsbCBvbGQgaG91c2VzIGluIG9yZGVyIHRvIHJl
YnVpbGQgYWxsIG9mIHRoZW0gDQp3aXRoIG1vcmUgbW9kZXJuIHN0eWxlID8NCg0KPiAtLS0NCj4g
djEwOgkqIE5ldyBpbiB2MTAgZm9yIGNvbnNpc3RlbmN5IHdpdGggbmV3IGZ1bmN0aW9ucw0KPiAt
LS0NCj4gICAuLi4vaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaCAgICAgfCAx
OSArKysrKysrKystLS0tLS0tLS0NCj4gICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNo
L3RsYmZsdXNoLmggICAgfCAyMCArKysrKysrKystLS0tLS0tLS0tDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxOCBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2gtaGFzaC5oDQo+IGluZGV4
IGZhYjgzMzJmZTFhZC4uM2M4OWU2MjVlNjIwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaA0KPiArKysgYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3RsYmZsdXNoLWhhc2guaA0KPiBAQCAtMjIsNyArMjIs
NyBAQCBzdHJ1Y3QgcHBjNjRfdGxiX2JhdGNoIHsNCj4gICB9Ow0KPiAgIERFQ0xBUkVfUEVSX0NQ
VShzdHJ1Y3QgcHBjNjRfdGxiX2JhdGNoLCBwcGM2NF90bGJfYmF0Y2gpOw0KPiAgIA0KPiAtZXh0
ZXJuIHZvaWQgX19mbHVzaF90bGJfcGVuZGluZyhzdHJ1Y3QgcHBjNjRfdGxiX2JhdGNoICpiYXRj
aCk7DQo+ICt2b2lkIF9fZmx1c2hfdGxiX3BlbmRpbmcoc3RydWN0IHBwYzY0X3RsYl9iYXRjaCAq
YmF0Y2gpOw0KPiAgIA0KPiAgICNkZWZpbmUgX19IQVZFX0FSQ0hfRU5URVJfTEFaWV9NTVVfTU9E
RQ0KPiAgIA0KPiBAQCAtNTEsMTQgKzUxLDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBhcmNoX2xl
YXZlX2xhenlfbW11X21vZGUodm9pZCkNCj4gICANCj4gICAjZGVmaW5lIGFyY2hfZmx1c2hfbGF6
eV9tbXVfbW9kZSgpICAgICAgZG8ge30gd2hpbGUgKDApDQo+ICAgDQo+IC1leHRlcm4gdm9pZCBo
YXNoX190bGJpZWxfYWxsKHVuc2lnbmVkIGludCBhY3Rpb24pOw0KPiArdm9pZCBoYXNoX190bGJp
ZWxfYWxsKHVuc2lnbmVkIGludCBhY3Rpb24pOw0KPiAgIA0KPiAtZXh0ZXJuIHZvaWQgZmx1c2hf
aGFzaF9wYWdlKHVuc2lnbmVkIGxvbmcgdnBuLCByZWFsX3B0ZV90IHB0ZSwgaW50IHBzaXplLA0K
PiAtCQkJICAgIGludCBzc2l6ZSwgdW5zaWduZWQgbG9uZyBmbGFncyk7DQo+IC1leHRlcm4gdm9p
ZCBmbHVzaF9oYXNoX3JhbmdlKHVuc2lnbmVkIGxvbmcgbnVtYmVyLCBpbnQgbG9jYWwpOw0KPiAt
ZXh0ZXJuIHZvaWQgZmx1c2hfaGFzaF9odWdlcGFnZSh1bnNpZ25lZCBsb25nIHZzaWQsIHVuc2ln
bmVkIGxvbmcgYWRkciwNCj4gLQkJCQlwbWRfdCAqcG1kcCwgdW5zaWduZWQgaW50IHBzaXplLCBp
bnQgc3NpemUsDQo+IC0JCQkJdW5zaWduZWQgbG9uZyBmbGFncyk7DQo+ICt2b2lkIGZsdXNoX2hh
c2hfcGFnZSh1bnNpZ25lZCBsb25nIHZwbiwgcmVhbF9wdGVfdCBwdGUsIGludCBwc2l6ZSwgaW50
IHNzaXplLA0KPiArCQkgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpOw0KPiArdm9pZCBmbHVzaF9o
YXNoX3JhbmdlKHVuc2lnbmVkIGxvbmcgbnVtYmVyLCBpbnQgbG9jYWwpOw0KPiArdm9pZCBmbHVz
aF9oYXNoX2h1Z2VwYWdlKHVuc2lnbmVkIGxvbmcgdnNpZCwgdW5zaWduZWQgbG9uZyBhZGRyLCBw
bWRfdCAqcG1kcCwNCj4gKwkJCSB1bnNpZ25lZCBpbnQgcHNpemUsIGludCBzc2l6ZSwgdW5zaWdu
ZWQgbG9uZyBmbGFncyk7DQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGhhc2hfX2xvY2FsX2ZsdXNo
X3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4gICB7DQo+ICAgfQ0KPiBAQCAtMTExLDEx
ICsxMTAsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIGhhc2hfX2ZsdXNoX3RsYl9rZXJuZWxfcmFu
Z2UodW5zaWduZWQgbG9uZyBzdGFydCwNCj4gICANCj4gICANCj4gICBzdHJ1Y3QgbW11X2dhdGhl
cjsNCj4gLWV4dGVybiB2b2lkIGhhc2hfX3RsYl9mbHVzaChzdHJ1Y3QgbW11X2dhdGhlciAqdGxi
KTsNCj4gK3ZvaWQgaGFzaF9fdGxiX2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpOw0KPiAg
IA0KPiAgICNpZmRlZiBDT05GSUdfUFBDXzY0U19IQVNIX01NVQ0KPiAgIC8qIFByaXZhdGUgZnVu
Y3Rpb24gZm9yIHVzZSBieSBQQ0kgSU8gbWFwcGluZyBjb2RlICovDQo+IC1leHRlcm4gdm9pZCBf
X2ZsdXNoX2hhc2hfdGFibGVfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9u
ZyBlbmQpOw0KPiArdm9pZCBfX2ZsdXNoX2hhc2hfdGFibGVfcmFuZ2UodW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOw0KPiAgIHZvaWQgZmx1c2hfaGFzaF90YWJsZV9wbWRf
cmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBtZF90ICpwbWQsIHVuc2lnbmVkIGxvbmcgYWRk
cik7DQo+ICAgI2Vsc2UNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgX19mbHVzaF9oYXNoX3RhYmxl
X3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKSB7IH0NCj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvdGxiZmx1c2guaCBiL2Fy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvdGxiZmx1c2guaA0KPiBpbmRleCBiZGFmMzRh
ZDQxZWEuLjBjZWY1ZTRmOGQ5MiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUv
YXNtL25vaGFzaC90bGJmbHVzaC5oDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9u
b2hhc2gvdGxiZmx1c2guaA0KPiBAQCAtMjgsOCArMjgsNyBAQCBzdHJ1Y3QgbW1fc3RydWN0Ow0K
PiAgIA0KPiAgICNkZWZpbmUgTU1VX05PX0NPTlRFWFQgICAgICAJKCh1bnNpZ25lZCBpbnQpLTEp
DQo+ICAgDQo+IC1leHRlcm4gdm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3Ry
dWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgc3RhcnQsDQo+IC0JCQkgICAgdW5zaWduZWQgbG9uZyBl
bmQpOw0KPiArdm9pZCBmbHVzaF90bGJfcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kKTsNCj4gICANCj4gICAjaWZk
ZWYgQ09ORklHX1BQQ184eHgNCj4gICBzdGF0aWMgaW5saW5lIHZvaWQgbG9jYWxfZmx1c2hfdGxi
X21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiBAQCAtNTUsMTkgKzU0LDE4IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBmbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVu
c2lnbmVkIGxvbmcgZW5kDQo+ICAgCQlhc20gdm9sYXRpbGUgKCJzeW5jOyB0bGJpYTsgaXN5bmMi
IDogOiA6ICJtZW1vcnkiKTsNCj4gICB9DQo+ICAgI2Vsc2UNCj4gLWV4dGVybiB2b2lkIGZsdXNo
X3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQp
Ow0KPiAtZXh0ZXJuIHZvaWQgbG9jYWxfZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
KTsNCj4gLWV4dGVybiB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIHZtYWRkcik7DQo+ICt2b2lkIGZsdXNoX3RsYl9rZXJu
ZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQpOw0KPiArdm9p
ZCBsb2NhbF9mbHVzaF90bGJfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0pOw0KPiArdm9pZCBsb2Nh
bF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9u
ZyB2bWFkZHIpOw0KPiAgIA0KPiAtZXh0ZXJuIHZvaWQgX19sb2NhbF9mbHVzaF90bGJfcGFnZShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2bWFkZHIsDQo+IC0JCQkJICAgaW50
IHRzaXplLCBpbnQgaW5kKTsNCj4gK3ZvaWQgX19sb2NhbF9mbHVzaF90bGJfcGFnZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2bWFkZHIsDQo+ICsJCQkgICAgaW50IHRzaXpl
LCBpbnQgaW5kKTsNCj4gICAjZW5kaWYNCj4gICANCj4gICAjaWZkZWYgQ09ORklHX1NNUA0KPiAt
ZXh0ZXJuIHZvaWQgZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsNCj4gLWV4dGVy
biB2b2lkIGZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25l
ZCBsb25nIHZtYWRkcik7DQo+IC1leHRlcm4gdm9pZCBfX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCBt
bV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZtYWRkciwNCj4gLQkJCSAgICAgaW50IHRzaXpl
LCBpbnQgaW5kKTsNCj4gK3ZvaWQgZmx1c2hfdGxiX21tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKTsN
Cj4gK3ZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2ln
bmVkIGxvbmcgdm1hZGRyKTsNCj4gK3ZvaWQgX19mbHVzaF90bGJfcGFnZShzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgdW5zaWduZWQgbG9uZyB2bWFkZHIsIGludCB0c2l6ZSwgaW50IGluZCk7DQo+ICAg
I2Vsc2UNCj4gICAjZGVmaW5lIGZsdXNoX3RsYl9tbShtbSkJCWxvY2FsX2ZsdXNoX3RsYl9tbSht
bSkNCj4gICAjZGVmaW5lIGZsdXNoX3RsYl9wYWdlKHZtYSxhZGRyKQlsb2NhbF9mbHVzaF90bGJf
cGFnZSh2bWEsYWRkcik=
