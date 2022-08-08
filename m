Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627D58C5BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 11:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1WN65y31z3bpr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 19:38:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dcsWLhlk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.44; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=dcsWLhlk;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90044.outbound.protection.outlook.com [40.107.9.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1WMM5yPPz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 19:37:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJ7zBHd2H6DKvfhm9/5asbtM5oR0WhwLA2lXNTVMmHHv4slDtQnAbMBbI5b8sMC2WsKyV+TD2xJLDm47m5/isBLWDsVI+hKqFl1tC7ppV/03JjmhKvUn9nNFMLQmjR6qvQOHJR2yr0U5WuSFnupdpuV8FQk/JtQXIrOEaUQvOczv81tf8zUEv2oSOg7iMRSn1yQDEeHw1AGb/nVpxJDJpcpCqIJxwUN6XKZSwd5TfsCjrvjek1f5N/gicegjcizxQkp8F9/kCGbHmk2nm3j+i8FegGRps6WYTQaO5d8BG8wPTOuvMqyDVQQ6LMNvol9iPNJ3+7xd2scDOg4vJFOBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYqAIIwgsMPwyCH0CgLelJJsZC0uWo3LYPvdm19nTt8=;
 b=oOL0ayxJRWjlOPqyvRnczdr5APWJ96bpWw9qu3qSmmIQcV66NYEPeBaF06RFVpYO0rQ5/GFR+SK3fDgD51mD4kIDMxpqxiclELxa9SCKmXbvTlJpzvnbFfDEhkbNQ2Xk2w6clWBIHQuj4SkeTY+AvySuR9+tK26L45YGnEO14QFViYIu6o27be/GimlIJPqwwQzED91s1GfGKptqaumYRvu7tz1fKJ6h9Iazrq9Vs5m29SP6QzxYizizNgUAcRNFtiMdE8gibxxLumh+iEAruwLWEbrLfJ2uKWM4mydRg399GitDtn7QBYXSMtQKK2DEIgyQUMXbuKBb/kDm4srxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYqAIIwgsMPwyCH0CgLelJJsZC0uWo3LYPvdm19nTt8=;
 b=dcsWLhlkvmSDKrZHeEkP/nnLw8oLamZIbH5nxXNkORMZG0s8d/M0ImJp5ehWwhz82R7nl6/DRO6rwrOp/eVUn29ZislERD7KsjS0Vg+QddnSQGmciKXhrB698E7AZh12xE9Av47S82DtnPYRJC5F+DQF9MFU/pFXewGe8Spn8KNWHGochzcQ6fmcWKRjyKdexQZu5f5SeP0UZQtbQQBcWFwtD1gPL8ICZabqjMch08Sg2sygFUrM0HpU8x0ALjudiHsPBKaIlQQv/3u4h5jFU18IPoAQ/fFz5Zpljyn0oGNK4jYJP8xy8k5B9YPxDMjkPut0agZ4SVlKCzNZS5QJaA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 09:37:15 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 09:37:15 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH v2 01/14] powerpc: Adopt SYSCALL_DEFINE for arch-specific
 syscall handlers
Thread-Topic: [PATCH v2 01/14] powerpc: Adopt SYSCALL_DEFINE for arch-specific
 syscall handlers
Thread-Index: AQHYn+85Hpu/RwNDi06+BOlxstLGl62glx+AgAQCj4CAADtVAA==
Date: Mon, 8 Aug 2022 09:37:15 +0000
Message-ID: <83ed398f-ce1b-029f-2788-a4e74af5ffa5@csgroup.eu>
References: <20220725062420.118013-1-rmclure@linux.ibm.com>
 <34538d4b-2c44-a527-66c8-5049f0176877@csgroup.eu>
 <59FC80E2-27E0-43AD-854E-4F351E13E9E2@linux.ibm.com>
In-Reply-To: <59FC80E2-27E0-43AD-854E-4F351E13E9E2@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3be99baa-5627-4c9f-67ab-08da79219417
x-ms-traffictypediagnostic: PR0P264MB2123:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  shPAmP8mDyhpJgJuXp7fmDWTl250R1FNUheWBfZFgr7GqYzXCD5Ka8SHCNezZ+fLpS+wnX0AtU8JZZgxFr5S5CO4Wijx0C7J3khJottEKMDGUPerCrtLwCk8C8k6ZZKJD8DN38xymUBSOuRvgYmZvirJneFij9kq+RgmCI7mD/enkd6KlwT3RUnZg97wtQ5veRTkhR7Jej2OgvD/vGIXkxvC4XuabFwLncF+W7bzGcyxuiVRnTGWzpgES6oVwKDNooyWQXfXWF1zvy5nVXQN+WiAwirSjjXkJGz2XMcFaAnEybBMti3L/ep7HuIvwtW1KMPWNhR48bbvAFRAuDPgaY2r4X1hq1OUZAlQwnOoviqVgd9b460irTh9vZxpxZMwolO1jOdICgvi7ZgyKwYHFbTsmpJzRalip/pY6Je2bMmwwaMO4yzGKgSGwFvZOXubNJYNueEyaxz98KbPeOZ1vuyFXOeVnH5SoBS2qd09Iq5u3ynJDDPiM/02zRTRQcHxGaVNFqc1tf1+36bFZwP/rkE6r/f0LYx4TCc44CrA9Vvsttw3wvMX6bwCqD9+fWa5sUhbOgO2Va1WAm/juhCsO5+zerbJSjuDP1msfk+PeoCZxTPQHYqQP4miavE3ReBhcU+blM3Kr9sio5vY4q2FczW8raH5aWLH8OsuUjQD02WJQV8HmUAjrinRQ1Wz1zDCdyrqnv3/McCJmGIXNZYkZcDHFebORbEfaL3BiV9ibbE8iytEjQs9a3TQL7GKiqsfok8QoMLs/+5Om86RQonSDZLD4XVMTgeixtnNBTwjIgDdd0SohXZKyxycaf7oLmrUjKA2MKlbUGF4rbyZMye67jqY7sg0BXzA5aYAZvp4DxKln3h/vdXHshMvH3W6G0mRbYam3qXZvXP6YRooK0u7Dg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(136003)(39850400004)(396003)(366004)(346002)(44832011)(5660300002)(2906002)(76116006)(66946007)(36756003)(71200400001)(6486002)(6916009)(966005)(316002)(478600001)(54906003)(31686004)(8936002)(122000001)(38070700005)(38100700002)(26005)(86362001)(41300700001)(31696002)(6506007)(6512007)(8676002)(4326008)(64756008)(66446008)(66476007)(66556008)(91956017)(66574015)(186003)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFVMcXc0OUhzUjJOZjFRcm1tU09HMFA1NkxqT0F6MDEwK3BNOHpjOER4MlJn?=
 =?utf-8?B?Ylg3Y2tqTzZKR0I0bnNEbzBBUWRBN204SHFVN285amNGUkR1NG85YlFxZE5U?=
 =?utf-8?B?QUFvSSs1MDVmZHlCcFExWTV2dVlLd1ZnV3BrY0JnbU4ybDZ0TzBBbVlpRXc4?=
 =?utf-8?B?RGh3K3ArRm1lcy82d0xzUmdFdnBLUGNmK0IyOVBBL0NuSDBVbWlSdEFoY2ox?=
 =?utf-8?B?eG50TE82YjY4TEhLVi9uMU8wRGdVWE1CUnFPekhPSlJmckxLaGw3cGF5dTBh?=
 =?utf-8?B?SjJHSGphdSsxcVJDYUhRNmJpT1dFczlKeG5lR1k2VkUvRDlpY29WbHg4dHUy?=
 =?utf-8?B?MEM3dDU2QU5KZjZUdWhTUWxGMWJ3WHdOWHdFRnBCem01L0tjd1hmNjhrZ3Uw?=
 =?utf-8?B?UTduSU5LZCtsWk9SLzgwZVNDNkNIVW5LaWg5LzRMNG1Sb2FVc25iL1BOcDhx?=
 =?utf-8?B?UDlmRklUQnlIQldkbzdWT1dxdElpaEdLNHNkQW1CcXhseGFRVFJiUXFKbXlW?=
 =?utf-8?B?eTVKclNBZHl3Z0JENzBwT3gzb3JRWGtUZDVGSVRNVWtwdFpiNmtBMlRKRzNl?=
 =?utf-8?B?SDNrR2JLNWZDSlpLbTI5RHlOMS9jczg3QzRqcGhpc3d5dDdydXA0OXNWOHk1?=
 =?utf-8?B?ek1FNWRjZHdSVGVDMG5UTmExZ0FiajlpbFZMTGQ2b3cyaUhCaXQ5d0c3eWVo?=
 =?utf-8?B?eUhCVWJicU1mdFJ5SVN4MFFnZ1BicWdnWFd4YjlUd25BRFZ1WjZUU2tKbGh5?=
 =?utf-8?B?ZmtubXN6L2h4SFVURnlEQnJSNW4wOCs3RUZSMmdkRktUTzRsdm10Mk9KRWgr?=
 =?utf-8?B?RlA4V3g3ZWd2SHc4ZHd6SWR3cFovMi8yMmRaOXV4UmEyMGphQnFBcEt1SDdC?=
 =?utf-8?B?bXZ5c0dzUzJlVmM4RkkxQVMxU2RvU09mSWpjcWtsSzRJZkZOUFRaNmk1UWRa?=
 =?utf-8?B?QmZDS2VmV2gwRTJxSlJFekg0cjJZQ21tcUhlZ1h5ZHYzN2JtditiZFdwRmZw?=
 =?utf-8?B?bmNBS2FaK0hiWW01MjBHNFp0aXBOTExGRENuRVBlbk95UllvWHlXeHV0aU1v?=
 =?utf-8?B?aDY0TGtkME9EbkFpOW5UVS9IY0ErbFBYL0JXam1KOHZDR0Z5ZHBaeklIcXJr?=
 =?utf-8?B?eGxuSHl3MHM3ejIvMW5zL0hvalRXSk55Wll4UDJHbTRibFNjK1BRWXh1S2JD?=
 =?utf-8?B?SGFtbVVwQkR6czhOQUNkQk5adVhKYytFMVhGUFAyQXA5dW9SdVJ4Q3NmRTdG?=
 =?utf-8?B?TFhIcHRrU3ZQRmUvWkZZNHFzZWtqdG4wOForb0dVcG8wYm1makk1MkJHZzNi?=
 =?utf-8?B?SkpSMjFEdlZ3eGFQeXQ3WDNsdkNPY0VNRjg2SWNDRW12Z0hwbVRUV3BSbHlM?=
 =?utf-8?B?VldFbEJaTjk4L2NVakVGMSswcDZObk11THFQWTJLK0FhYmpCY0FUWlMzSmYz?=
 =?utf-8?B?aDdIc2h4U1dEeWtzMy9yU3NreEdzcW1tMnorZnpYQVBQa1ZHUHZNVGpkWmNR?=
 =?utf-8?B?a2I2dERTWXZPdmRqRDJOeGl2amlSVThsWGdXak5FWG1LMnhWRkdDVW1oTFlz?=
 =?utf-8?B?eWtrZisva2NhcThqd2RrTHFLeW5yVTdLRndnOVpnMlhzVWJxVStrSVdvUEhp?=
 =?utf-8?B?cGdhRllZNEQwSnN5Z0VJZXNWcDFTZ1pUUytleGFaVU9teDcyZFBhZGtCUnRN?=
 =?utf-8?B?VE5zNkl0MDlGSUlZbElqQ1N1NGhNdXdJV0t4NHFXWDRRMXoyZFVwTTJLQ0RF?=
 =?utf-8?B?aTN0eW1yaDNmbWJlMXYyajdrRUJvRk1ka2dLVEhxcUVtNG1EMVF6UWYvUjBo?=
 =?utf-8?B?SXVlRTNVWkMxRElrOENNbmZmb01nL0U2RGNnWEh0Y050emVaY0J6V2UvSXJB?=
 =?utf-8?B?c3krUnMyaWlSRlU3ZFNWY0VwSU9tWW15NFVKUzhPWDJNa3RaejVlOXZ5blY5?=
 =?utf-8?B?ODFyYWhJNUxGbmVLR3pRRk5jVFZ1ZjlQUWVuUEJGOUxTYnJsdHhYNmhIaUhZ?=
 =?utf-8?B?K1ZIWVNvbm4vTDZxQlRxcjJ2dHNjaTNCZUVCRlhjNlZhRW5VcTF6aXJTNEY5?=
 =?utf-8?B?QzVvN1FYaytuTXdqUW1WSDZDZnJOTWloVVdYd1czWjdoWkkxb2RwNXlmUDZo?=
 =?utf-8?B?cDJNWE1STytscWxMcEN2M0pveXhqdExCTlVmWEpzaUJxcGM0d0pPN0pTTmtB?=
 =?utf-8?Q?isvHNxuYNrz3SqV+dT535qw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F32D1604F624D48921471352BA79D0D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be99baa-5627-4c9f-67ab-08da79219417
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 09:37:15.1633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e929prPQ8xVNEkReLhcp+RLSxClQwoeboMW5jGj7aaWRS38XRSymdn94GWE6qXHvA0LGwr4DuEol2MCejJMVhSBx9biTfCk3DcuenWbI7EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2123
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzA4LzIwMjIgw6AgMDg6MDQsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBU
aGFua3MgZm9yIHJldmlld2luZyBteSBwYXRjaGVzLg0KPiANCj4+IEkgdGhpbmsgdGhpcyBwYXRj
aCBzaG91bGQgYmUgc3BsaXQgaW4gdHdvIHBhdGNoZXMuIE9uZSB3aGVyZSB5b3UganVzdA0KPj4g
Y2hhbmdlIHRvIHVzaW5nIFNZU0NBTExfREVGSU5FIGFuZCBDT01QQVRfU1lTQ0FMTF9ERUZJTkUs
IGFuZCBhIHNlY29uZA0KPj4gcGF0Y2ggZm9yIGV2ZXJ5dGhpbmcgZWxzZS4NCj4+DQo+PiBUaGUg
Zmlyc3QgcGF0Y2ggY291bGQgdGhlbiBiZSBsaW5rZWQgdG8NCj4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9saW51eHBwYy9pc3N1ZXMvaXNzdWVzLzE0Ng0KPj4NCj4+IE9yIGluIHRoZSByZXZlcnNlIG9y
ZGVyIGlmIGl0IG1ha2VzIG1vcmUgc2Vuc2UgbWF5YmUuDQo+IA0KPiBNeSByZWFzb25pbmcgZm9y
IGNvbXBsZXRpbmcgYWxsIG9mIHRoZXNlIGNoYW5nZXMgaW4gYSBzaW5nbGUgcGF0Y2ggaXMgZm9y
DQo+IHJldGFpbmluZyBiaXNlY3RhYmlsaXR5LiBBZG9wdGluZyBTWVNDQUxMX0RFRklORSBhbmQg
Q09NUEFUX1NZU0NBTExfREVGSU5FDQo+IHByZXBlbmRzIHtzeXNfLCBjb21wYXRfc3lzX30gdG8g
dGhlIHN5bWJvbCBuYW1lcywgYW5kIHNvIHRoaXMgbXVzdCBiZQ0KPiByZWZsZWN0ZWQgaW1tZWRp
YXRlbHkgaW4gdGhlIHN5bWJvbCB0YWJsZXMuDQoNCldlbGwsIG9mIGNvdXJzZSB3ZSBuZWVkIHRo
ZSBwYXRjaCBidWlsZCwgc28gU1lTQ0FMTF9ERUZJTkUgYW5kIA0KQ09NUEFUX1NZU0NBTExfREVG
SU5FIGhhdmUgdG8gZ28gd2l0aCB0aGUgbmFtZSBjaGFuZ2VzLCB0aGF0J3Mgb2J2aW91cy4NCg0K
TXkgY29tbWVudCB3YXMgbW9yZSByZWxhdGVkIHRvIGNoYW5nZXMgbGlrZSB0aGUgcmVuYW1pbmcg
b2YgDQpwcGM2NF9wZXJzb25hbGl0eSgpIHRvIGRvX3BwYzY0X3BlcnNvbmFsaXR5KCkgYW5kIHRo
ZSBjcmVhdGlvbiBvZiANCnN5c19wcGM2NF9wZXJzb25hbGl0eSgpIGFuZCBjb21wYXRfLi4uLg0K
VGhhdCBjb3VsZCBiZSBhIHBhdGNoIGJ5IGl0c2VsZi4NCg0KQWxzbyBwYXRjaCA0IGNvdWxkIGdv
IHVwIGZyb250IGluIG9yZGVyIHRvIGF2b2lkIHJlbmFtaW5nIGEgZnVuY3Rpb24geW91IA0KYXJl
IHJlbW92aW5nIGluIGEgZm9sbG93LXVwIHBhdGNoLg0KDQpTbyBhcyBhIHN1bW1hcnksIGRvIGFs
bCBwcmVwYXJhdGlvbiB1cCBmcm9udCBvZiBwYXRjaCAxLCBpbiBvcmRlciB0byANCmtlZXAgaXQg
YXMgbWluaW1hbC4NCg0KPiANCj4+IElzIHRoYXQgJ2FzbWxpbmthZ2UnIHN0aWxsIG5lZWRlZCA/
IE5vdCBhbGwgc3lzY2FsbHMgaGF2ZSBpdCBzZWVtcywgYW5kDQo+PiBhcyBmYXIgYXMgSSBjYW4g
c2VlIHRoYXQgbWFjcm8gdm9pZHMgZm9yIHBvd2VycGMuDQo+IA0KPiBTb3JyeSwgeW91IGNvbW1l
bnRlZCBvbiB0aGlzIGluIHRoZSBwcmV2aW91cyByZXZpc2lvbiwgYW5kIEkgc2hvdWxkIGhhdmUN
Cj4gYWN0ZWQgb24gaXQgdGhlbi4gSSBpbiBmYWN0IHRvdWNoIGFsbCBidXQgb25lIHVzYWdlcyBv
ZiDigJhhc21saW5rYWdl4oCZIGluIGFyY2gvcG93ZXJwYywgYW5kIHNvIGFtIGluIGEgZ29vZCBw
b3NpdGlvbiB0byBnZXQgcmlkIG9mIGFsbCBvZiB0aGVtLiBJ4oCZbGwNCj4gZG8gdGhhdCBpbiBu
ZXh0IHJldmlzaW9uLg0KPiA=
