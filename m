Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819787864B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 18:26:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jLZEeoVO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtkFj5tfxz3cZL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 04:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=jLZEeoVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtkDx0Kktz3cGw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 04:25:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcrT+XvwllHtRgreTTTbaTVGcNbivWZYP63EadPBx7BIstP5HQGqHcdXc2VauJRGWp4x+tUi/UbtgTy5tw3eR9PEus2JX7697/T4Bye7Q7lAK5XpDttgzbMj157wAl3hUvFVi3z8yzbDh4K+tHLHFiK188n11ngUxIgkFPxOd6X/kUWbKn/buiez7+vfq25pBM4Z5yCy9qWUuFsxUw38y3GYrd+LiS5bshYX4Tp26TzaQtFUK5VV74BPKnfX1TvYTvylh0sPJOCEyJXKaIb/pu9wC9w+PPSCB5tnIBI8TNQAhWdtSZdIIuDlORSgv6klD5wvsn9uh21Xwj42z98TMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twHiqTMyDZ2w75YQa1aynUwMaEyAgBATHMJ1lmW828c=;
 b=RHZKBUq2H3J1Q1TbY5bMe1ZGTAwi+bRDLm599EQWlhH4ZG129PvXbtwtjjq7hys0S1AHJ+cryNnaYBe+mxa4TnDChg9JkbJ60TugRUw0RUk7nz9msf+IzVMyP/xRVk6CV4kvzvO7klKqYz+aWVQ5vohup6+2BQCz/wBeqjpQZV1z0T8H6GaZkAXCYaixx1UuzCC5Ijon1sr51YcsF9ISr+G6esKaP0LE4K/w74W4yUfjJIapVmuCd0Re7uptLTPrjfZ90H/wSNfUeSXKWfF25zB8viliBmmM0lFSHQ+a2M+6zx/dKqCfXyjHtIN6jsKWkXc4Xx6pKi9HflQaTaIEBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twHiqTMyDZ2w75YQa1aynUwMaEyAgBATHMJ1lmW828c=;
 b=jLZEeoVO/14K3YXK+DzqdxFC5zpi4/zKZTmgMffd8b8RoYqfl00IIYndh88VKrXedWr/mWvPF8wgtjhmzNFJqwvohts9fs/KeWWRJfTlED9S6ACS99/T52a3OISun0/qPETZpjFEP1Ff310lS08pI09dRXgoufq+6i7MzB1D5vOwqj+L9iiwkeHI1NCxdkrdfadfdx5eRYCEh/IRj02e54oeNK/RCPapUm0jOlQqKqQ7ytncFIPcwvdtIphSOa3MKQ2V66rvpbDxBSDlhybjXW3wrODzkzT2mOeyaWAGv/k7hdGLFGJXKpvk2QwV6H+Hjc++tpDJwE9ygwQ6DEwjmQ==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 MR1P264MB2288.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.36; Mon, 11 Mar 2024 17:24:52 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2e47:cba6:3e12:e310%4]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 17:24:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stefan Berger <stefanb@linux.ibm.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH v2 1/3] powerpc/prom_init: Replace
 linux,sml-base/sml-size with linux,sml-log
Thread-Topic: [RFC PATCH v2 1/3] powerpc/prom_init: Replace
 linux,sml-base/sml-size with linux,sml-log
Thread-Index: AQHac7chmzQXrwm5hkGmtZcSn/HZ/LEyypwA
Date: Mon, 11 Mar 2024 17:24:51 +0000
Message-ID: <0bde9a6f-e002-452e-8610-8d4040fb0b86@csgroup.eu>
References: <20240311132030.1103122-1-stefanb@linux.ibm.com>
 <20240311132030.1103122-2-stefanb@linux.ibm.com>
In-Reply-To: <20240311132030.1103122-2-stefanb@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MR1P264MB2980:EE_|MR1P264MB2288:EE_
x-ms-office365-filtering-correlation-id: 8cc06096-59e5-4f53-9b94-08dc41f0294e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  zT3MpWNCalMhaAjK9rasgssVfk+s6G6SrSORUaZOnckQoYpGizHy7R+Pn90XPRdYXZTYrF7QVsJQKYvV/NEJ+pn2U6vnfjIzZRD8KCa6cKzeXKTprZhIxctGr5jxJNJ5LxXQbDOBr4/sC5kiJtRwbedNluTx5at0EzSqVEium8CXLTdLF8c/QNHBtClXvX7A0LOizHuOIbi5a7n9aznPsJjJiBmY3Cx+pFBYZluIshShU8edEiq8Nd709nN70zOBqBJo6+DzOYPsqwR22HCuZlLa4251N3gZ0vK9l2mhOPRzz0FOGQKu/TQqiqnWcAUJcYre2kbBousEdocKWXDqIOd9CuK6fApgUinGS52h/KEy4htjBdi4ycw5D46Vvc2jook1wDq0IqOSX7tFGS2U5Q+svmQSokXsEluboeIULj+qpMXmLEGIuFoJGh1MhU157kPq3Gzv05nGI8shqVsHikQao5BwSTWqL4LbZIkJqCyuwl0SnTLnIV9aLSGggL3vFvsHh0yJ4ZOrj2+k9QuT5PNLW5JdTcsRKqdBrqgYAlxyu4XVtJ2sMKzoJpDmw8TkZ3efTnCbVtPrVp1fj2PgGSdb2p9zcbak8p6o4jwY9rqZ/WYTIs/OuVgYB30eImHAOT50o8c4Kde5J6VpeTT/JS97h/F2Fys5YMVz/MDpLzNCs4bGgDecu0mYl43W8LrWkz1Rm6kDunB/nWF7kEH+zm63xsGt/xcY+Ckr+fxSX0I=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?UUI2NldzazJhMlJzSGV2RUVtYVExeVVUR3MxbmZNbTlXUU50VzlKZ2NWWVdh?=
 =?utf-8?B?TXI1NGgwUlB2a21MSWdNMlpoaHBBc0p1dFF0Y1hGOXlJbWpkMEl4WCs4d2N0?=
 =?utf-8?B?K0lBOUcwM3l1c3pHSmFPK3JUUFYrVkwwVmpwanpSR1kxTmRCY2JzeVRPblJi?=
 =?utf-8?B?c3B5UEEyd3N4cTZLSHFqMkVYbGZUTmxUN0Z3T1AzWU9yZzJiZXNkdjVmZVI0?=
 =?utf-8?B?OGJzRFROUXdPMVhRNWM5SENGSm53MGYvYUNpRytuVk1ISzVTNFdYV2NqTyto?=
 =?utf-8?B?dHZRYUVRbEhMR2R3Mi9PUnFzeFJ2Z3VtRUZybGwzTVBUa1E2WGxwRDJYSFND?=
 =?utf-8?B?cXRNbWF4dXp3RVBhNWlJMWYxcTRKZlBReVhHZ0J5UnhuUmNhZUdvOUUxalY1?=
 =?utf-8?B?SXVrYjRueWpnTEVNeE1sQTVZdC9ieFdYdTRwbUQvdU9OVUFsaUFoMG5zYzBM?=
 =?utf-8?B?RUMyMk82R1VmNDJud0loZi9aclRBRTVydk9RajFML2RYOVlGSG94K1ZzR2Vh?=
 =?utf-8?B?VE91dE94RVRPdGNNQnlhVUE3UkhxaTZBYVZWaDcrMXEyemRhNXhHWlFLVTlM?=
 =?utf-8?B?ZzRiMStUaytTYWxla203UG9pcFkrdnNYUnVvSUNZbU5LQ2ZCa25XZmZjeGla?=
 =?utf-8?B?bHRnMHliYUFTdStISWlaVkZuMTdJNitiS0dET2VsbTl4NnlYTVh1WWhZSnBh?=
 =?utf-8?B?QzNFUVZlVGdWSkxldzlTOENDdDZDTjBNc24wc0FqQVF0UU9oNXhLdVJiTUps?=
 =?utf-8?B?VG13djJLUUhDTStQSHlScFJEWGhXcU01OVdsd1B3M3gzcm9aVTBpcUJKdEY0?=
 =?utf-8?B?SWw0ZC9sNlpYUDZ4RzBMdHNJSDQ5UEI4MVV0WlFPRndGNEk2SVlIRTdueVpL?=
 =?utf-8?B?NG9jTlFpL2wvZm9sZlBQMXlDT3dHanNrRTV6enRKdm0yVTM0RlNoSzYwNUNu?=
 =?utf-8?B?VTJ0Z1hjK1hXVW41SWNvUis2RnE1V1hBYVFSMTBMWlRvc29YM29LOUl4elI0?=
 =?utf-8?B?K2ttblJTd1NNNHhaL0h6QkhXSVlwdTJFUSt4ZXliSXY2M0ZmNWtXQUNZRC91?=
 =?utf-8?B?cU5sSk9qK2wzVml6cEF0TElyajkwWW50b3JhdkdkMHpnN3dBMzVZYU5Lb0k4?=
 =?utf-8?B?c0NXQkJKZytTY0prZURPYU0zN05vT2pBVDFnVDNLRTZ3ZmZXMzBOSkpPVXJx?=
 =?utf-8?B?MFBhVW1CTDVJeWg2ZE5QeHQzRjhoT0d1MWpXRmJoemcxbEJ2V0RlcWYzY2tF?=
 =?utf-8?B?VWV1ajRvWW9GV2NlemlpNk10aEJrZ09taE9tdmV5OXZpOEtyaWZ2WUc5Q0FB?=
 =?utf-8?B?UktZVEoyc3dYK1BzYTMxVnhSbVQzcUNMaVNSV2RUTmlVV1pSV3lFaGM1aXlp?=
 =?utf-8?B?SlZ2UlpUYTk3Zk1WRHN4L2VCTXF4a0Znamp5b2RLOThtbE9RV25QQlhLb0RO?=
 =?utf-8?B?UmhJbzhJeHhBR1hFQXdONE1pTlExNEN6Y3ZzbklLZjFqNFNWZFNwQUVQdTNU?=
 =?utf-8?B?K3VlUE1wWUFyUS8rQmJObG9LSm5sK0pWZDFKa3lkSDRGNWhHWUNVeHpwcXFp?=
 =?utf-8?B?cHJwZy9td2xoYkFTam05clpjTWVRamV6d2c5VzZScENpU0Nkb1ZuSktHMG1O?=
 =?utf-8?B?SUs5WG1WRUgrSnF2Tm1TSGhkQzRSYWxFaUlldlovWWQ1c1FMNmRoQTBXZDNL?=
 =?utf-8?B?b0FadStNQ0FyeWxiUDk0NERRSzFXSTFlNXRtbFl2UWx2bzQxRmRJdDhhOFYx?=
 =?utf-8?B?Z2VGRVR5NkkrdzhNS2U3VFFOODBNdmxiamc5RjJMVlFZWnRZQzNpZ3RRZFZk?=
 =?utf-8?B?S2hhMmpmaXdOMXZybzRsZFE2aWFmUHZTZXFyQU55K0V1eUloWnFBcXgwL1lD?=
 =?utf-8?B?Z1ZGa24vWVJLRXZYVWU5bEF4VEtGUk9EQUJ4Sk9kbkVrcmtEZ2NtSXN1UFk2?=
 =?utf-8?B?eUNXNktJdzdaRWxCbUhJc1BJWitNb0pzSVE1RkxLNVlSaXRxbVdhK3dPNnpE?=
 =?utf-8?B?SmhzQWt0NmdwbjM3VEdRYlNXWnJIZmJjZ0lkc3JvY0hNSXcxVzlkTXAwdUEz?=
 =?utf-8?B?R2o5eHJxeWNwbWRONGEvVncrdUdaWDhMNndiMkFCb0k2SXREdnhaM0hkOVBq?=
 =?utf-8?B?OWwyL1hhR0I4S0RDaWJIaHRkM0tGZDZ1eWVZTG05N1lBVGZHc3pxRVdtelpQ?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <34A61303F401AD4FB1B9CB7CC276CA10@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc06096-59e5-4f53-9b94-08dc41f0294e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 17:24:52.0517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e/MNF9aAnghoU23SZ6JK7mRocIuIBBnTA4EQ97MID4fcwcw+UETF9novxEQcXNRt5I23v2fcVaWbfHa1vFv6+bKWT9xfgI4tefD+MP+PfxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2288
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "rnsastry@linux.ibm.com" <rnsastry@linux.ibm.com>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jarkko@kernel.org" <jarkko@kernel.org>, "peterhuewe@gmx.de" <peterhuewe@gmx.de>, "viparash@in.ibm.com" <viparash@in.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzAzLzIwMjQgw6AgMTQ6MjAsIFN0ZWZhbiBCZXJnZXIgYSDDqWNyaXTCoDoNCj4g
bGludXgsc21sLWJhc2UgaG9sZHMgdGhlIGFkZHJlc3Mgb2YgYSBidWZmZXIgd2l0aCB0aGUgVFBN
IGxvZy4gVGhpcw0KPiBidWZmZXIgbWF5IGJlY29tZSBpbnZhbGlkIGFmdGVyIGEga2V4ZWMuIFRv
IGF2b2lkIGFjY2Vzc2luZyBhbiBpbnZhbGlkDQo+IGFkZHJlc3Mgb3IgY29ycnVwdGVkIGJ1ZmZl
ciwgZW1iZWQgdGhlIHdob2xlIFRQTSBsb2cgaW4gdGhlIGRldmljZSB0cmVlDQo+IHByb3BlcnR5
IGxpbnV4LHNtbC1sb2cuIFRoaXMgaGVscHMgdG8gcHJvdGVjdCB0aGUgbG9nIHNpbmNlIGl0IGlz
DQo+IHByb3Blcmx5IGNhcnJpZWQgYWNyb3NzIGEga2V4ZWMgc29mdCByZWJvb3Qgd2l0aCBib3Ro
IG9mIHRoZSBrZXhlYw0KPiBzeXNjYWxscy4NCj4gDQo+IEF2b2lkIGhhdmluZyB0aGUgZmlybXdh
cmUgaW5nZXN0IHRoZSB3aG9sZSBUUE0gbG9nIHdoZW4gY2FsbGluZw0KPiBwcm9tX3NldHByb3Ag
YnV0IG9ubHkgY3JlYXRlIHRoZSBsaW51eCxzbWwtbG9nIHByb3BlcnR5IGFzIGEgcGxhY2UgaG9s
ZGVyLg0KPiBJbnNlcnQgdGhlIGFjdHVhbCBUUE0gbG9nIGR1cmluZyB0aGUgdHJlZSBmbGF0dGVu
aW5nIHBoYXNlLg0KPiANCj4gRml4ZXM6IDRhNzI3NDI5YWJlYyAoIlBQQzY0OiBBZGQgc3VwcG9y
dCBmb3IgaW5zdGFudGlhdGluZyBTTUwgZnJvbSBPcGVuIEZpcm13YXJlIikNCj4gU3VnZ2VzdGVk
LWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+IFNpZ25lZC1vZmYt
Ynk6IFN0ZWZhbiBCZXJnZXIgPHN0ZWZhbmJAbGludXguaWJtLmNvbT4NCj4gLS0tDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyB8IDI3ICsrKysrKysrKysrKysrKysrKystLS0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMgYi9h
cmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5jDQo+IGluZGV4IGU2N2VmZmRiYTg1Yy4uNmY3
Y2E3MjAxM2MyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5pdC5j
DQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMNCj4gQEAgLTIxMSw2ICsy
MTEsOCBAQCBzdGF0aWMgY2VsbF90IF9fcHJvbWJzcyByZWdidWZbMTAyNF07DQo+ICAgDQo+ICAg
c3RhdGljIGJvb2wgIF9fcHJvbWJzcyBydGFzX2hhc19xdWVyeV9jcHVfc3RvcHBlZDsNCj4gICAN
Cj4gK3N0YXRpYyB1NjQgX19wcm9tYnNzIHNtbF9iYXNlOw0KPiArc3RhdGljIHUzMiBfX3Byb21i
c3Mgc21sX3NpemU7DQo+ICAgDQo+ICAgLyoNCj4gICAgKiBFcnJvciByZXN1bHRzIC4uLiBzb21l
IE9GIGNhbGxzIHdpbGwgcmV0dXJuICItMSIgb24gZXJyb3IsIHNvbWUNCj4gQEAgLTE5NTQsMTcg
KzE5NTYsMTUgQEAgc3RhdGljIHZvaWQgX19pbml0IHByb21faW5zdGFudGlhdGVfc21sKHZvaWQp
DQo+ICAgCX0NCj4gICAJcHJvbV9wcmludGYoIiBkb25lXG4iKTsNCj4gICANCj4gLQlyZXNlcnZl
X21lbShiYXNlLCBzaXplKTsNCj4gLQ0KPiAtCXByb21fc2V0cHJvcChpYm12dHBtX25vZGUsICIv
dmRldmljZS92dHBtIiwgImxpbnV4LHNtbC1iYXNlIiwNCj4gLQkJICAgICAmYmFzZSwgc2l6ZW9m
KGJhc2UpKTsNCj4gLQlwcm9tX3NldHByb3AoaWJtdnRwbV9ub2RlLCAiL3ZkZXZpY2UvdnRwbSIs
ICJsaW51eCxzbWwtc2l6ZSIsDQo+IC0JCSAgICAgJnNpemUsIHNpemVvZihzaXplKSk7DQo+IC0N
Cj4gLQlwcm9tX2RlYnVnKCJzbWwgYmFzZSAgICAgPSAweCVsbHhcbiIsIGJhc2UpOw0KPiArCS8q
IEFkZCBwcm9wZXJ0eSBub3csIGRlZmVyIGFkZGluZyBsb2cgdG8gdHJlZSBmbGF0dGVuaW5nIHBo
YXNlICovDQo+ICsJcHJvbV9zZXRwcm9wKGlibXZ0cG1fbm9kZSwgIi92ZGV2aWNlL3Z0cG0iLCAi
bGludXgsc21sLWxvZyIsDQo+ICsJCSAgICAgTlVMTCwgMCk7DQo+ICAgCXByb21fZGVidWcoInNt
bCBzaXplICAgICA9IDB4JXhcbiIsIHNpemUpOw0KPiAgIA0KPiAgIAlwcm9tX2RlYnVnKCJwcm9t
X2luc3RhbnRpYXRlX3NtbDogZW5kLi4uXG4iKTsNCj4gKw0KPiArCXNtbF9iYXNlID0gYmFzZTsN
Cj4gKwlzbWxfc2l6ZSA9IHNpemU7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qDQo+IEBAIC0yNjQ1LDYg
KzI2NDUsMTcgQEAgc3RhdGljIHZvaWQgX19pbml0IHNjYW5fZHRfYnVpbGRfc3RydWN0KHBoYW5k
bGUgbm9kZSwgdW5zaWduZWQgbG9uZyAqbWVtX3N0YXJ0LA0KPiAgIAkJfQ0KPiAgIAkJcHJldl9u
YW1lID0gc3N0YXJ0ICsgc29mZjsNCj4gICANCj4gKwkJaWYgKCFwcm9tX3N0cmNtcCgibGludXgs
c21sLWxvZyIsIHBuYW1lKSkgew0KPiArCQkJLyogcHVzaCBwcm9wZXJ0eSBoZWFkICovDQo+ICsJ
CQlkdF9wdXNoX3Rva2VuKE9GX0RUX1BST1AsIG1lbV9zdGFydCwgbWVtX2VuZCk7DQo+ICsJCQlk
dF9wdXNoX3Rva2VuKHNtbF9zaXplLCBtZW1fc3RhcnQsIG1lbV9lbmQpOw0KPiArCQkJZHRfcHVz
aF90b2tlbihzb2ZmLCBtZW1fc3RhcnQsIG1lbV9lbmQpOw0KPiArCQkJLyogcHVzaCBwcm9wZXJ0
eSBjb250ZW50ICovDQo+ICsJCQl2YWxwID0gbWFrZV9yb29tKG1lbV9zdGFydCwgbWVtX2VuZCwg
c21sX3NpemUsIDEpOw0KPiArCQkJbWVtY3B5KHZhbHAsICh2b2lkICopc21sX2Jhc2UsIHNtbF9z
aXplKTsNCg0KWW91IGNhbid0IGNhc3QgYSB1NjQgaW50byBhIHBvaW50ZXIuIElmIHNtbF9iYXNl
IGlzIGFuIGFkZHJlc3MsIGl0IG11c3QgDQpiZSBkZWNsYXJlZCBhcyBhbiB1bnNpZ25lZCBsb25n
Lg0KDQpCdWlsZCB3aXRoIHBtYWMzMl9kZWZjb25maWcgOg0KDQogICBDQyAgICAgIGFyY2gvcG93
ZXJwYy9rZXJuZWwvcHJvbV9pbml0Lm8NCmFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmM6
IEluIGZ1bmN0aW9uICdzY2FuX2R0X2J1aWxkX3N0cnVjdCc6DQphcmNoL3Bvd2VycGMva2VybmVs
L3Byb21faW5pdC5jOjI2NjM6Mzg6IGVycm9yOiBjYXN0IHRvIHBvaW50ZXIgZnJvbSANCmludGVn
ZXIgb2YgZGlmZmVyZW50IHNpemUgWy1XZXJyb3I9aW50LXRvLXBvaW50ZXItY2FzdF0NCiAgMjY2
MyB8ICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweSh2YWxwLCAodm9pZCAqKXNtbF9iYXNl
LCBzbWxfc2l6ZSk7DQogICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXg0KY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCm1ha2VbNF06
ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDM6IA0KYXJjaC9wb3dlcnBjL2tlcm5lbC9w
cm9tX2luaXQub10gRXJyb3IgMQ0KDQoNCj4gKwkJCSptZW1fc3RhcnQgPSBBTElHTigqbWVtX3N0
YXJ0LCA0KTsNCj4gKwkJCWNvbnRpbnVlOw0KPiArCQl9DQo+ICAgCQkvKiBnZXQgbGVuZ3RoICov
DQo+ICAgCQlsID0gY2FsbF9wcm9tKCJnZXRwcm9wbGVuIiwgMiwgMSwgbm9kZSwgcG5hbWUpOw0K
PiAgIA0K
