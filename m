Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DF62D3B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 08:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCW5K3cQjz3dyW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 18:00:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=X9Xf04U/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::627; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=X9Xf04U/;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0627.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::627])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCW4N5D9bz3cK7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 17:59:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3LKF7LnC17WHc5admd88tlQpKKBTK/0MIk4DNwj/L1QoKd4EJI45ZVMFo2Thk+i8QtRFjYZ9Qsn5nwiREfCkm8hoWy/Qzwtakv5p4x9BeUirfFEgpWP0ybuNswR/5HXDNYXHEvT2yoq+01S0ea6pPRYQ9lH2pMN08Bj4ABhsDHDH+3/R7bOnUPY4FfWyXP0ycVvAswFbNH9EIwG+D/Y5qB8nH2jsXxaRn8XXdWd958TOWb985AVZbN+qTlmxhLocJwLaBVngnmWI8dIA9C8cuILNbfjcWwvYx+YuAEuwiDz9TexZAAzNqzNXcmCiAaEiI6l0ssP62drbXL1bBhniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6nDvGhKPeOikXoPqtnTPr0DBehpx0qtK+GrwQJXNxA=;
 b=nzTB2TYyxpUL9B3NM1sX/IAfgKWKRC/Bk3FvnFxdSQdpr54JNShCohPka3Q07GH+jMFxe+iaU2/eSfQWdCh0zSMspcLQAdtbBnsJondOT6n8X860vHRbh4hA+dggtWwZZnljvPZ9CsqcpcadX5w9sBROyDaWEwTeL17AQCvLsDkVVuw2ap1c30K+gRaX4HU8eOrDv4diTHyZY5ERFNeQTxnJSRQgP+CLgJ6QaJzdkCpDJIKkiArM7/vQ66F0HMs6X1O/k4NSISM3Y1Gsxc0+FdnDIQMDsb5QwPasznJT1zi5MRJTCYdZGbrTsdwoAtjmuVF2C/Eo988wjNWI9Kv5dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6nDvGhKPeOikXoPqtnTPr0DBehpx0qtK+GrwQJXNxA=;
 b=X9Xf04U/2lVuv2xfYhnzEFn+/vEWprUhyriXSrZhqD3SW4BtullsfOepFfT+Nz2Jpdnp3ThUGnWnFenrnxhucm7GCAlpcaTatxAjlxpt5MCLAOauUCIDGXHzY1pqPcCY0pDAlOaomMP2lBo1ke0vFAoNSJCSA/AwVyI6ljZnMZwx5PnaRzNJO4LVKbp3QMqKDsRvVOO2nVflkknVeiLY/3QFA5dxRkehynSz7wJ9gNM44qFPhdCjqCJ/cl+s3LWhZdMiWBjglBvU+d0E5/+edB7tJr6EL7NA8rCeZVJup9Obmg1hEd+rK8RL0LCInW4cb2XhxXcEd8Ksxham5Knp7Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1563.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Thu, 17 Nov
 2022 06:59:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.020; Thu, 17 Nov 2022
 06:59:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Topic: [RFC PATCH 0/3] enable bpf_prog_pack allocator for powerpc
Thread-Index:  AQHY9TR92HLsIR9PiEOmF5X/4UnXLK45ljcAgATvboCAACzCgIABp7yAgAF1qQCAAOn5gA==
Date: Thu, 17 Nov 2022 06:59:09 +0000
Message-ID: <02496f7a-51d8-4fc0-161d-b29d5e657089@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <00efe9b1-d9fd-441c-9eb4-cbf25d82baf2@csgroup.eu>
 <5b59b7df-d2ec-1664-f0fb-764c9b93417c@linux.ibm.com>
 <bf0af91e-861c-1608-7150-d31578be9b02@csgroup.eu>
 <e0266414-843f-db48-a56d-1d8a8944726a@csgroup.eu>
 <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
In-Reply-To: <6151f5c6-2e64-5f2d-01b1-6f517f4301c0@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1563:EE_
x-ms-office365-filtering-correlation-id: 3a6d4024-36b1-4d77-5448-08dac8693a08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7Zs3UtmZof9RUPW6g+5HI46TAYUVeSi/x3ZaamXz6hcm28Cnur25PXjOICr5LTbJGvzNuhMxx6Dh0XrKiZQbdtmy5ZNEEGbacE+XCC3ryZSqMSf4KIySjb5sPIhBp5ew7B6Od04rqzHXxeMtT5iXkY3L+mT/P9dsuuHmKNtPF/J6rQ8ULpkfPFyl1mXnyt3RHBSA9MOfKQUHOLLksyM/Ula/FehPGxl/HsJZoe5JE55+t1n9AWgKPqLtFXn28T1iP9YqL2JI308nSiZwZBvMF27YxqI+24JaorwkcJIjdweibICbcAd7onGvSBm9SiTwau9ZTQLxVQR3PzKNvAqGBlJ2+KmootKsvgAh/avRNZZ5XFHpa647saQl3MjCPmRTmGrgH9VKpjYW+7sTXH+6u7b8l7l+kdx5oDO8TR/+QN+XEga+md8SR3XYnvOy5jbxqRi5tUvSHUyIu50K54CvR06qFthMMxf83SRSa1/w30OoWkExp/aXHQmbFrQEU5h69xuNKYmLk7Hz2ThmTldmcEkDRsG1oF+N+NE1v8KTM0QHKVaLXubpkSbpQI6/WcmjwcJHE/UyPqXkJM1tt+jX0XnB4gITgPjaPgA6V9FnR0FyPKsEMXewzwyRPe7B0Byp79tbvV75sgEArM/Xag0njyNuzLyoT8m5VB/GJQWQGYgRtXwgPhm/vAFfa1rjc6xvQeo/V9J/Kd1r6Z1YF6GWtZeXCedmkQVQT4Jggx7V/S4kbmWIEZUBpZdjJqP4gsHCht07LbVeRlKSNPlHl2D99A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199015)(122000001)(38100700002)(54906003)(316002)(66574015)(6506007)(53546011)(2906002)(44832011)(41300700001)(2616005)(36756003)(186003)(5660300002)(38070700005)(26005)(91956017)(6512007)(8936002)(31696002)(86362001)(66556008)(66446008)(8676002)(64756008)(76116006)(66476007)(4326008)(66946007)(31686004)(83380400001)(478600001)(6486002)(110136005)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Mi9vM1RxL3VPTEpIVTE4VGJDMFllT2FxN2gzczY4VCtxVlZWQjg4ditOVkVm?=
 =?utf-8?B?bmxsZXBqRFJUQkZPZGJzVDdTQWFxNVlFOW83VnZGNklrOVZBc3VnYmFwcXVZ?=
 =?utf-8?B?NHcrcjZLVi9qKzJRWHFrNThnbmFMbDRwdlA1USs5ZTNqT2pzbHU1dVlSZkoz?=
 =?utf-8?B?V0t6eDBSci9WbFEwVC9KejNibTlINjkvNDI1c1RQZStkbU1oQ2tvOW40TzhW?=
 =?utf-8?B?dk45SE84ZCtOWXVUdWNhb0IzWStieGVsRktiSFBwVG56UThydVFXdndXQjlB?=
 =?utf-8?B?b1cydWdHVHBKSnhidlh4YXRLNTF5VUJvN3QzczdoVStLMGoxdVI3UURXTU5r?=
 =?utf-8?B?QlJMQmFlQ25LVWZqLzIreUZCV1JNazNBOUIyYkhUOUN4SkR0Z2l1YlhyQTV5?=
 =?utf-8?B?eXhjMGtJNVA3Zm9zdlhMNmcrK29QUGY2S0VrbkJWUVhjZHBnaDRsQ2lMYjhJ?=
 =?utf-8?B?MEl5TTJuNHRmNVptSHpGQ2xjNkRWY2V5eWFPdTdxQ1ZKcUhRVFlpZi9zQUpC?=
 =?utf-8?B?K3FieVBxc2xoUFZkOHlKZER5a1kydFE1aDJydmkxd0MrZ1NYakEydjQ4NUdm?=
 =?utf-8?B?TDMxVHAzRUVZaG5jV2dOcGV6dWJPWWRQRzVIWjBzTXl4QUpwZ3g2V0VtNUl3?=
 =?utf-8?B?dVNCUVpaV3Q3TW1ZRDFsV0RkZDZURVJYcWRsR3RkNzZobkhRVDlxaTIvVXd1?=
 =?utf-8?B?d2ZiREQ3R0xNVEM3eUh5Q242cll6djAzU2MzTllPMnIzRloxeExqbU9DQ1Fx?=
 =?utf-8?B?NVc5ZmpOS21tY0hJNFJQTTJNeGhmREFubHo5M0FQVnFvdThJd0UrZ243ZU00?=
 =?utf-8?B?R0RYT0pGUkZUVGlLODR4NWhHVWk1Q1lvVnRrTGxrNnRFRi83TllIV2N0aVdO?=
 =?utf-8?B?K29CUTRwYnkzZEN5ZHhDSHRCdml0Q2lLdFdncjNQYXUrbzVRbENiWFN4VStE?=
 =?utf-8?B?M0RQeGQ0c1hjYzRLS3NUN0RSb0NvQ3dXQUZLYnVHUWlMQlBHd0pQMytnWXhH?=
 =?utf-8?B?KzExWVE5OTl6V0hqZ25MbStxWWo1amlRbm00Z2p5U1lNcEY4MHJjblJMMW9m?=
 =?utf-8?B?VzhPdjVubDI2aW5lS3ZDYTM3TzhONk85d2Z6Z05GOEpjU2RTU25kWTM0WnVV?=
 =?utf-8?B?SFlMV1p4dFdqUFRybjlPVVJRT2t1aWN3NHJNMHRMSkRxOU9Lakl6UCtsbmEv?=
 =?utf-8?B?QnpjMktwRExTUUFydjVQVm9uNlJsTEE4elRUZGFneHhESzNzRDAzK21BYzlK?=
 =?utf-8?B?TS9hckJKVm8vSUFnRTZJeFNwbFNlbXgyWWh5QmQ4MHJnaUZWVUNaZTlaNFBv?=
 =?utf-8?B?MUZnRzJJczBhbm9jOXFBSHBtcG1Za1hjRVJqS083b0YyRXpXMktxVTQ1OUww?=
 =?utf-8?B?WklvMVR2RmVuWitKeU13RXo5L3Q5MzUrcTF1b3libTE0SmR6UHh1OFNURm44?=
 =?utf-8?B?N0NNeDdsdGxPWGtNU0FVRzdCd2trZXdwSFA0R3lIZ0xZcnA0czE5TGx0ek5X?=
 =?utf-8?B?YWNYemNmREkxZW50bU1sdXhyd0xSWko3bTdsOVVzNTdLREgwcnpxNU5mb2RX?=
 =?utf-8?B?RlRSUDdDVTJXWDZ0ZVM0MEVENlFEVmd0M3I5alRHbDc2Y2hrQ0s2VkZ0NHB5?=
 =?utf-8?B?T1RzdWx0Tld6WlAxcU5OMmFlY0JUTzFqS1ZDWVBpblRXaFBrSTJDeEkzS1NY?=
 =?utf-8?B?cDMza0sxbER0anA0Zm9IVmw1dStyV2xDVU5YaGJIMk56QmhCa2g1dlZiMENF?=
 =?utf-8?B?Qko0NTRjSlNXcFprMzd5WlptZjl5NXVrZ3J1NWRwTGdMM2xVdnBOVzBtMko3?=
 =?utf-8?B?WFBta1pZQU96em9PdWdZRzJweVJlSnprelY2QjVqK2pjZ3VqMHViRUVaRUFV?=
 =?utf-8?B?NEx3bG5pUGtzeEFsMTBDVnNGMlhjc1FWeFh6T2tDUjJhanhHcXZIUGZEV2VE?=
 =?utf-8?B?UndTQ0g2cG4zc3ovcWpZVzlYenV4aE1JeWNyUDJaR00zZllsSnlTSjJ6R0x6?=
 =?utf-8?B?UTNubzNjUDl1LzBnYy83U094MGgvWHhQM25iK0FFWUNCVlVOVmlvM0l1MWdX?=
 =?utf-8?B?dVZRWFVDTXNOMjJSZzhSelRtTVp5amU0Mm52aHJ3WGF6aUU5VCt1TlQxeklD?=
 =?utf-8?B?SFpWcWxwTG45Tk9KWnNBbkJIZ0RZUGVPNkNEakV3dzIrdXVZQ2ZINXJ1Vy9T?=
 =?utf-8?B?R0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC0109CB5C5EDD4AAFFB91A015ECFA47@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6d4024-36b1-4d77-5448-08dac8693a08
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 06:59:09.6623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kjfp7E8d0X9fBhcnodmwJONRKmsUeDvLOyrHUsov4WYREoDmLjZEB0OiS34QX1DglaupkUI2OpdHPQZ2Oe+50Zrz42oZRoLYzA43v1+0Ztw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1563
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzExLzIwMjIgw6AgMTg6MDEsIEhhcmkgQmF0aGluaSBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDE2LzExLzIyIDEyOjE0IGFtLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4N
Cj4+DQo+PiBMZSAxNC8xMS8yMDIyIMOgIDE4OjI3LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0
wqA6DQo+Pj4NCj4+Pg0KPj4+IExlIDE0LzExLzIwMjIgw6AgMTU6NDcsIEhhcmkgQmF0aGluaSBh
IMOpY3JpdMKgOg0KPj4+PiBIaSBDaHJpc3RvcGhlLA0KPj4+Pg0KPj4+PiBPbiAxMS8xMS8yMiA0
OjU1IHBtLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4+Pj4gTGUgMTAvMTEvMjAyMiDDoCAx
OTo0MywgSGFyaSBCYXRoaW5pIGEgw6ljcml0wqA6DQo+Pj4+Pj4gTW9zdCBCUEYgcHJvZ3JhbXMg
YXJlIHNtYWxsLCBidXQgdGhleSBjb25zdW1lIGEgcGFnZSBlYWNoLiBGb3IgDQo+Pj4+Pj4gc3lz
dGVtcw0KPj4+Pj4+IHdpdGggYnVzeSB0cmFmZmljIGFuZCBtYW55IEJQRiBwcm9ncmFtcywgdGhp
cyBtYXkgYWxzbyBhZGQgDQo+Pj4+Pj4gc2lnbmlmaWNhbnQNCj4+Pj4+PiBwcmVzc3VyZSBvbiBp
bnN0cnVjdGlvbiBUTEIuIEhpZ2ggaVRMQiBwcmVzc3VyZSB1c3VhbGx5IHNsb3dzIGRvd24gDQo+
Pj4+Pj4gdGhlDQo+Pj4+Pj4gd2hvbGUgc3lzdGVtIGNhdXNpbmcgdmlzaWJsZSBwZXJmb3JtYW5j
ZSBkZWdyYWRhdGlvbiBmb3IgcHJvZHVjdGlvbg0KPj4+Pj4+IHdvcmtsb2Fkcy4NCj4+Pj4+Pg0K
Pj4+Pj4+IGJwZl9wcm9nX3BhY2ssIGEgY3VzdG9taXplZCBhbGxvY2F0b3IgdGhhdCBwYWNrcyBt
dWx0aXBsZSBicGYgDQo+Pj4+Pj4gcHJvZ3JhbXMNCj4+Pj4+PiBpbnRvIHByZWFsbG9jYXRlZCBt
ZW1vcnkgY2h1bmtzLCB3YXMgcHJvcG9zZWQgWzFdIHRvIGFkZHJlc3MgaXQuIFRoaXMNCj4+Pj4+
PiBzZXJpZXMgZXh0ZW5kcyB0aGlzIHN1cHBvcnQgb24gcG93ZXJwYy4NCj4+Pj4+Pg0KPj4+Pj4+
IFBhdGNoZXMgMSAmIDIgYWRkIHRoZSBhcmNoIHNwZWNpZmljIGZ1bmN0aW9ucyBuZWVkZWQgdG8g
c3VwcG9ydCB0aGlzDQo+Pj4+Pj4gZmVhdHVyZS4gUGF0Y2ggMyBlbmFibGVzIHRoZSBzdXBwb3J0
IGZvciBwb3dlcnBjLiBUaGUgbGFzdCBwYXRjaA0KPj4+Pj4+IGVuc3VyZXMgY2xlYW51cCBpcyBo
YW5kbGVkIHJhY2VmdWxseS4NCj4+Pj4+Pg0KPj4+Pg0KPj4+Pj4+IFRlc3RlZCB0aGUgY2hhbmdl
cyBzdWNjZXNzZnVsbHkgb24gYSBQb3dlclZNLiBwYXRjaF9pbnN0cnVjdGlvbigpLA0KPj4+Pj4+
IG5lZWRlZCBmb3IgYnBmX2FyY2hfdGV4dF9jb3B5KCksIGlzIGZhaWxpbmcgZm9yIHBwYzMyLiBE
ZWJ1Z2dpbmcgaXQuDQo+Pj4+Pj4gUG9zdGluZyB0aGUgcGF0Y2hlcyBpbiB0aGUgbWVhbndoaWxl
IGZvciBmZWVkYmFjayBvbiB0aGVzZSBjaGFuZ2VzLg0KPj4+Pj4NCj4+Pj4+IEkgZGlkIGEgcXVp
Y2sgdGVzdCBvbiBwcGMzMiwgSSBkb24ndCBnZXQgc3VjaCBhIHByb2JsZW0sIG9ubHkgDQo+Pj4+
PiBzb21ldGhpbmcNCj4+Pj4+IHdyb25nIGluIHRoZSBkdW1wIHByaW50IGFzIHRyYXBzIGludHJ1
Y3Rpb25zIG9ubHkgYXJlIGR1bXBlZCwgYnV0DQo+Pj4+PiB0Y3BkdW1wIHdvcmtzIGFzIGV4cGVj
dGVkOg0KPj4+Pg0KPj4+PiBUaGFua3MgZm9yIHRoZSBxdWljayB0ZXN0LiBDb3VsZCB5b3UgcGxl
YXNlIHNoYXJlIHRoZSBjb25maWcgeW91IHVzZWQuDQo+Pj4+IEkgYW0gcHJvYmFibHkgbWlzc2lu
ZyBhIGZldyBrbm9icyBpbiBteSBjb25pZmcuLi4NCj4+Pj4NCj4+Pg0KPj4NCj4+IEkgYWxzbyBt
YW5hZ2VkIHRvIHRlc3QgaXQgb24gUUVNVS4gVGhlIGNvbmZpZyBpcyBiYXNlZCBvbiANCj4+IHBt
YWMzMl9kZWZjb25maWcuDQo+IA0KPiBJIGhhZCB0aGUgc2FtZSBjb25maWcgYnV0IGhpdCB0aGlz
IHByb2JsZW06DQo+IA0KPiAgwqDCoMKgwqAjIGVjaG8gMSA+IC9wcm9jL3N5cy9uZXQvY29yZS9i
cGZfaml0X2VuYWJsZTsgbW9kcHJvYmUgdGVzdF9icGYNCj4gIMKgwqDCoMKgdGVzdF9icGY6ICMw
IFRBWA0KPiAgwqDCoMKgwqAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4g
IMKgwqDCoMKgV0FSTklORzogQ1BVOiAwIFBJRDogOTYgYXQgYXJjaC9wb3dlcnBjL25ldC9icGZf
aml0X2NvbXAuYzozNjcgDQo+IGJwZl9pbnRfaml0X2NvbXBpbGUrMHg4YTAvMHg5ZjgNCg0KSSBn
ZXQgbm8gc3VjaCBwcm9ibGVtLCBvbiBRRU1VLCBhbmQgSSBjaGVja2VkIHRoZSAuY29uZmlnIGhh
czoNCkNPTkZJR19TVFJJQ1RfS0VSTkVMX1JXWD15DQpDT05GSUdfU1RSSUNUX01PRFVMRV9SV1g9
eQ0KDQpCb290IHN1Y2Nlc3NmdWwuDQovICMgaWZjb25maWcgZXRoMCAxMC4wLjIuMTUNCmUxMDAw
OiBldGgwIE5JQyBMaW5rIGlzIFVwIDEwMDAgTWJwcyBGdWxsIER1cGxleCwgRmxvdyBDb250cm9s
OiBSWA0KLyAjIHRmdHAgLWcgMTAuMC4yLjIgLXIgdGVzdF9icGYua28NCi8gIyBlY2hvIDEgPiAv
cHJvYy9zeXMvbmV0L2NvcmUvYnBmX2ppdF9lbmFibGUNCi8gIyBpbnNtb2QgLi90ZXN0X2JwZi5r
bw0KdGVzdF9icGY6ICMwIFRBWCBqaXRlZDoxIDIxNiA4NyA4NiBQQVNTDQp0ZXN0X2JwZjogIzEg
VFhBIGppdGVkOjEgNTcgMjcgMjcgUEFTUw0KdGVzdF9icGY6ICMyIEFERF9TVUJfTVVMX0sgaml0
ZWQ6MSA1MCBQQVNTDQp0ZXN0X2JwZjogIzMgRElWX01PRF9LWCBqaXRlZDoxIDExMCBQQVNTDQp0
ZXN0X2JwZjogIzQgQU5EX09SX0xTSF9LIGppdGVkOjEgNjcgMjYgUEFTUw0KdGVzdF9icGY6ICM1
IExEX0lNTV8wIGppdGVkOjEgNzcgUEFTUw0KLi4uDQoNCkJ5IHRoZSB3YXksIHlvdSBjYW4gbm90
ZSB0aGF0IGR1cmluZyB0aGUgYm9vdCB5b3UgZ2V0Og0KDQoJVGhpcyBwbGF0Zm9ybSBoYXMgSEFT
SCBNTVUsIFNUUklDVF9NT0RVTEVfUldYIHdvbid0IHdvcmsNCg0KU2VlIHdoeSBpbiAwNjcwMDEw
ZjNiMTAgKCJwb3dlcnBjLzMyczogRW5hYmxlIFNUUklDVF9NT0RVTEVfUldYIGZvciB0aGUgDQo2
MDMgY29yZSIpDQoNCk5ldmVydGhlbGVzcyBpdCBzaG91bGQgcHJldmVudCBwYXRjaF9pbnN0cnVj
dGlvbigpIHRvIHdvcmsuDQoNCkNvdWxkIHlvdSBoYWQgYSBwcl9lcnIoKSBpbiBfX3BhdGNoX2lu
c3RydWN0aW9uKCkgaW4gdGhlIGZhaWx1cmUgcGF0aCB0byANCnByaW50IGFuZCBjaGVjayBleGVj
X2FkZHIgYW5kIHBhdGNoX2FkZHIgPw0KDQoNCg0KPiAgwqDCoMKgwqBqaXRlZDoxDQo+ICDCoMKg
wqDCoGtlcm5lbCB0cmllZCB0byBleGVjdXRlIGV4ZWMtcHJvdGVjdGVkIHBhZ2UgKGJlODU3MDIw
KSAtIGV4cGxvaXQgDQo+IGF0dGVtcHQ/ICh1aWQ6IDApDQo+ICDCoMKgwqDCoEJVRzogVW5hYmxl
IHRvIGhhbmRsZSBrZXJuZWwgaW5zdHJ1Y3Rpb24gZmV0Y2gNCj4gIMKgwqDCoMKgRmF1bHRpbmcg
aW5zdHJ1Y3Rpb24gYWRkcmVzczogMHhiZTg1NzAyMA0KDQpJJ20gYSBiaXQgc3VycHJpc2VkIG9m
IHRoaXMuIE9uIGhhc2ggYmFzZWQgYm9vazNzLzMyIHRoZXJlIGlzIG5vIHdheSB0byANCnByb3Rl
Y3QgcGFnZXMgZm9yIGV4ZWMtcHJvdGVjdGlvbi4gUHJvdGVjdGlvbiBpcyBwZXJmb3JtZWQgYXQg
c2VnbWVudCANCmxldmVsLCBhbGwga2VybmVsIHNlZ21lbnRzIGhhdmUgdGhlIE5YIGJpdCBzZXQg
ZXhjZXB0IHRoZSBzZWdtZW50IHVzZWQgDQpmb3IgbW9kdWxlIHRleHQsIHdoaWNoIGlzIGJ5IGRl
ZmF1bHQgMHhiMDAwMDAwMC0weGJmZmZmZmZmLg0KDQpPciBtYXliZSB0aGlzIGlzIHRoZSBmaXJz
dCB0aW1lIHRoYXQgYWRkcmVzcyBpcyBhY2Nlc3NlZCwgYW5kIHRoZSBJU0kgDQpoYW5kbGVyIGRv
ZXMgdGhlIGNoZWNrIGJlZm9yZSBsb2FkaW5nIHRoZSBoYXNoIHRhYmxlID8NCg0KPiANCj4gYnBm
X2ppdF9iaW5hcnlfcGFja19maW5hbGl6ZSgpIGZ1bmN0aW9uIGZhaWxlZCBkdWUgdG8gDQo+IHBh
dGNoX2luc3RydWN0aW9uKCkgLi4NCg0KSXMgdGhlcmUgYSB3YXkgdGVsbCBCUEYgY29yZSB0aGF0
IGppdCBmYWlsZWQgaW4gdGhhdCBjYXNlIHRvIGF2b2lkIHRoYXQgPw0KDQpDaHJpc3RvcGhlDQo=
