Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561CA4DABB6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 08:17:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJM6L22Dfz3fTG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 18:17:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::62c;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJLzv21y7z3dyc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 18:11:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8WF89S5+sQYw8keiaDOrBTgKgapy8c4JOX3Y5Q/G2Z2N6hU3TorqtyZYd5j+ZDYqS8GGp5A5qslFeljMDJaNYVdPG8qXlJ+xTL95s1o5RlvOeTH2oKbNOA4ENP9cSq0eQMligr0PqZyxetEeSBV5l+l1NeNd41AUXQZlHzb0SUsTGTely8rABzpihv7Nm9EvgD+TIc7p9MOZw35TFaWlF+i0BZ4KDg9flUP/R5IQRsH8B8J9YF/5x45gtwib51k1i3mHIPyaghZ9SjakW98n5CbZkIXbRxzbiMV9QueSnhjSQMPFkVNamgji1lU+2FdsPnZ7kt65yZ0UId8sUXuJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N87drQsQAfpDRyVdzp6IMEQM+BWGw+F7T79wfF3Vq8=;
 b=MaskkfpEB7ORLDgKoQYOZejd4IGNpy2vdGIC2kQKTvHtVpIGwtYl9atfi0X/VqxxY2LdjsUCCgh8c9XZko8V8VCAfv/2mDu5FbLdcrYyi8KT1dNRs9oZZLIn+fMl3nGeWEbJaveUYhr1gdR498ZyBx3cTEWYrUDyT3RLohT6UYC0/YSjSpyHQpOXIUByFoLORMk5gv7XiZFnYzSbteYcmzdKbB1c4iBVkLcIH9MRxV36S0PK5ZuCG3xdJTWfvrv6AzJKc8v7tnqWg1JAHVDvg/s5yEmr6pWIPitSmm6RIPwBp4BtfwUBJwmt0xhZXtjpFot/mRivYYeW1nHnV3G3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2876.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:19::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Wed, 16 Mar
 2022 07:11:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5081.014; Wed, 16 Mar 2022
 07:11:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] static_call: Don't make __static_call_return0 static
Thread-Topic: [PATCH] static_call: Don't make __static_call_return0 static
Thread-Index: AQHYN3QmErE3bJogF0unLvbGlzWypqzA87QAgACnbwA=
Date: Wed, 16 Mar 2022 07:11:14 +0000
Message-ID: <eabd82b5-6617-1965-e65b-25abae19e1d5@csgroup.eu>
References: <b301796066e4fdd45c50c9e202d36a43688eb78e.1647242388.git.christophe.leroy@csgroup.eu>
 <20220315211158.kymtyh2nv4xj7ite@treble>
In-Reply-To: <20220315211158.kymtyh2nv4xj7ite@treble>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0321a8a3-b915-410d-b2d7-08da071c2886
x-ms-traffictypediagnostic: MRZP264MB2876:EE_
x-microsoft-antispam-prvs: <MRZP264MB287642F3195C0221E49C8115ED119@MRZP264MB2876.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XgP178r8FMDqD83GW/vzN1QBA4TAExc2ixg0lNSJ0AV56uq3ZMBKVz5qOqNPRO6UHJGzQ/6GXOHxe/PloCZzggBrtOyuYfud9FAvgvu9pCNKkpaJh3OUzU6kdzAmflLTWx8wD0oN35GfFbAYRoLsKNeCVqDwIuRZmBf23lCb14S5bpRAivu4Kp38Yy1kZ88r4XJVNEhUKDXfp7iMggrJO4qPojApNnqb7X9aa/rVKaVpU6qkVbP2AmKL8ZDKubiDNgOUSUAN0xdz2T+x7kmoaaSj5hJNXHld+0FRw1B9wNwe/u0QDHmwmIgycr5r55v2ddBC283cuhR+R7PeIVNMHE40PCtRfQLzErXr15d9eWjTBduIVnQPoegFozw1oAs3I3lPMH21dw+en0w7y9LkT8KkrqptP/F6FdWdZQoneSrRztOZkhuRhom+Ka4uQEMxxjfe7uo0RrWSaN9eUgXqiaQ/NIjNIxn6VHJqttH8RWMhFZLzSILJ2/hpD1DKhFYFSYbNG9isRFrPJa2SrvQjPUqlV8u31CE17vAb/X1y3yBqsSeJiQgU86AMY994qSBBukTkVA6lI8eT9CwtDMo5nLm7Mio/9QjT6QqRASNfB4IR+xGGyCxtKGwGNu7ZlrVqQwC4SI+DGgUCxqkRglSz3qhpdAfS4jCb/w9yIv7K56TihIuojOiyxb2MnRTz1EmQv8lM3YAS7xIcKMrcm/mI2crgDY7K1r3gMvJO7Q+BK3UJYGudO2VQZMbZGVR4J6nlbMRq6iPpK+1SUokmbif+VA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(316002)(38100700002)(31696002)(38070700005)(122000001)(91956017)(54906003)(6486002)(6916009)(5660300002)(2906002)(8936002)(8676002)(76116006)(64756008)(66556008)(66946007)(66476007)(66446008)(66574015)(2616005)(83380400001)(36756003)(44832011)(508600001)(71200400001)(26005)(6506007)(6512007)(186003)(31686004)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEFlaG1FS2JmMTJvY2FUNTBlcW9YZkoyWlE0TnUwR1FiM2R1NU44dEtzWXB4?=
 =?utf-8?B?eTh4RjJTaGF0dENMVjhXZ0d1MVo3eGVoZXlUeWhQUmJUbXFLL3VkcjRXcHFO?=
 =?utf-8?B?ZEkzL2h2V0NyeG04RURGcDNIUStLbjlKa2s2OVdyVkY0L1R3RzYzZW00by9I?=
 =?utf-8?B?Y29WcDlmSHluelQ5ZE1PVTl5TzhiT1dRaUZvalJwdDZZTWMyU1JKMkJiRXVh?=
 =?utf-8?B?NC9Sbzg3SmVRQmF3dVRhYWE3T1NYcUNWb0dkMVBOWk1wekdVcUJGOVRyV2pD?=
 =?utf-8?B?Zm9iWks0SDVXcjVQR0U2aVJTYktlMnhZUWZUeGl1K3JZdGtnWENXeDQvR0NI?=
 =?utf-8?B?TUdGV3kxbVBXSk5zcjJ0bDVpa0lnV3JrS1NyUjlvOUNmN3M1cUNSNXpnMkJo?=
 =?utf-8?B?VnhiMUw5S0ludlg0RThBOFhVdXQ3bUZla0I0ZGFQQVdwSEc1NzZ1MlU3WVpz?=
 =?utf-8?B?Lzd2WnpOTDhKY2g5QXZ2WFJuVG9OQk4xUzhwb3hZL2FBZTlhWFUyVzh1Qm5G?=
 =?utf-8?B?dXpmaGp4NElwdDFUUHVqQWR4YnJoOElDUEVqbmZ6SndDRnMxNGpRSTFVSjVD?=
 =?utf-8?B?WmxEOEdzeHN2dzY1SWV1RWxibU1GYUplMlEyZHhWZDZlQ2xhdmxST3J2VkRF?=
 =?utf-8?B?VmRYcS9lRWxrbThSaE8rZ0NwdmdCWHM1dWc0NytscnZ3U0U2a2t1eUM3YlZL?=
 =?utf-8?B?M3lyK08wZm9Oc2JOS3N6a0UxVytSYTR0cEpicHgxMTJEVHJMei9zdGVHZEd2?=
 =?utf-8?B?TUlxMElpYkRGR1kwS1ZPdHc4cHBOcWNBUlBWZUpXVnZudVdsWEEySExtLzBD?=
 =?utf-8?B?dlErdmt5bzZZajNZWXo3WW5NOUU5RHRxWEtaTFAvWkJ0OUV2TTVDcU0xVEpU?=
 =?utf-8?B?aCtHbGgremJIQWQzNXd3Zk1OSXZXQlc3bklTRWJZOU10ZzlPcFlFVVA0ZGFF?=
 =?utf-8?B?Z3dqSytndG1XOUZrbEVzb2svVHQxNGhlb2tuR3VqOUVvSzlnTTVzK1JBSzNo?=
 =?utf-8?B?MzhnQUxQbC9Wd0ttMFFnM2ZZQms3ZlZpcmNEOWNWVXBvMDNQVXZ0OTNpZHgv?=
 =?utf-8?B?K0czTE15OTBWalJVR1lERjhpSHYwOU5YM3poWW01dHVxVFhMZGZYQ3Y2R0dI?=
 =?utf-8?B?NFFHQ1NnUTZzeDRPY2c0bmlSeTI2OTBmckdjZkd1LzlzeEp0NTFld3F0Y3ZE?=
 =?utf-8?B?RDlnRFhMRTBPRi9kM05VYTNaUTIzRDg2SENTMW12MDJBbGxSQVdWMmg5cnVO?=
 =?utf-8?B?cklzWjVQQk4xaWdSTlo3MElQV2FKSXczcGtDVlM2Q2Q4bjdpdjBrVDJZV0Ny?=
 =?utf-8?B?dU5RRE9nbkpGT1U0OUtpeDRVTkY2MFgyVkRHUmFlaytlNEM1a0NucnFEeUdu?=
 =?utf-8?B?dWVoY1pOOUNJNE5LNmM1bnI0enl1OU1nc3lOdVIwMUxCbjZ1bFcrdGU1eE53?=
 =?utf-8?B?RGhCVzNlV1JzTG52UTF5UTB3NG56bk5VTElBVXYzZWxSU3Q2bUFzN0Y1bTEy?=
 =?utf-8?B?QVkxZXJma3B0aU9yeHM4bGZML2tQUUJReEs3OTI0Skxqbk1CMVppRXorUHJK?=
 =?utf-8?B?NHVrZEJQQTJtZ09pSzFhUnVSSm9IMmsrN093L21vaGZRSUFkWFVvVndNMEVp?=
 =?utf-8?B?V3ZrbWpYTmRWUXV2enhpbjdxOWZqS3FkSVBKdThncjFqc1kwQ1A0UFc2QUIv?=
 =?utf-8?B?emVzMmlRcUNJTnBjMGFHL2NKblp1UWVSQUVqSkVqQlpxL0dDQi9pTGN2WEFx?=
 =?utf-8?B?YnlDcDlRZ09OL1I2OUdEdm8zZk5yTFcrNG1pMUhwdEpsRTdwNFFZNk5tSHdG?=
 =?utf-8?B?bHIzNG5wcHNzdENhUWhKMlpZcVRHTTdiczU5aG5XNVVlb21nckcvR0pIelYx?=
 =?utf-8?B?OGJOeXV0TzFEYjNjUHBiVll2b2ZvWGdMYlUzSDlrTkE2Q3pBa0ozMlFTck93?=
 =?utf-8?B?RzVkSVhwUWxCcWNkaERWZmpNWkhnc20zOHUwV3VmQVpQZ0hjaGplWCtKQlZu?=
 =?utf-8?Q?fJEWjJSl+hETP9IGwdhVOSlKvAyQoo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BA1BA2E0042934894BC2918EE847A11@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0321a8a3-b915-410d-b2d7-08da071c2886
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 07:11:14.6116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1VUffJ46H+QQU8CzxI2INt5QnY9/7pY+YfLERitO9xi93uBf037ITyTEYMlY/dlj6ZHcpbojarIjQx88xjTVzae6m7hOw1sdl+rz5aFwsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2876
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
Cc: Peter Zijlstra <peterz@infradead.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzAzLzIwMjIgw6AgMjI6MTEsIEpvc2ggUG9pbWJvZXVmIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgTWFyIDE0LCAyMDIyIGF0IDA4OjIxOjMwQU0gKzAxMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBTeXN0ZW0ubWFwIHNob3dzIHRoYXQgdm1saW51eCBjb250YWlucyBzZXZl
cmFsIGluc3RhbmNlcyBvZg0KPj4gX19zdGF0aWNfY2FsbF9yZXR1cm4wKCk6DQo+Pg0KPj4gCWMw
MDA0ZmMwIHQgX19zdGF0aWNfY2FsbF9yZXR1cm4wDQo+PiAJYzAwMTE1MTggdCBfX3N0YXRpY19j
YWxsX3JldHVybjANCj4+IAljMDBkODE2MCB0IF9fc3RhdGljX2NhbGxfcmV0dXJuMA0KPj4NCj4+
IGFyY2hfc3RhdGljX2NhbGxfdHJhbnNmb3JtKCkgdXNlcyB0aGUgbWlkZGxlIG9uZSB0byBjaGVj
ayB3aGV0aGVyIHdlIGFyZQ0KPj4gc2V0dGluZyBhIGNhbGwgdG8gX19zdGF0aWNfY2FsbF9yZXR1
cm4wIG9yIG5vdDoNCj4+DQo+PiAJYzAwMTE1MjAgPGFyY2hfc3RhdGljX2NhbGxfdHJhbnNmb3Jt
PjoNCj4+IAljMDAxMTUyMDogICAgICAgM2QgMjAgYzAgMDEgICAgIGxpcyAgICAgcjksLTE2Mzgz
CTw9PSByOSA9ICAweGMwMDEgPDwgMTYNCj4+IAljMDAxMTUyNDogICAgICAgMzkgMjkgMTUgMTgg
ICAgIGFkZGkgICAgcjkscjksNTQwMAk8PT0gcjkgKz0gMHgxNTE4DQo+PiAJYzAwMTE1Mjg6ICAg
ICAgIDdjIDA1IDQ4IDAwICAgICBjbXB3ICAgIHI1LHI5CQk8PT0gcjkgaGFzIHZhbHVlIDB4YzAw
MTE1MTggaGVyZQ0KPj4NCj4+IFNvIGlmIHN0YXRpY19jYWxsX3VwZGF0ZSgpIGlzIGNhbGxlZCB3
aXRoIG9uZSBvZiB0aGUgb3RoZXIgaW5zdGFuY2VzIG9mDQo+PiBfX3N0YXRpY19jYWxsX3JldHVy
bjAoKSwgYXJjaF9zdGF0aWNfY2FsbF90cmFuc2Zvcm0oKSB3b24ndCByZWNvZ25pc2UgaXQuDQo+
Pg0KPj4gSW4gb3JkZXIgdG8gd29yayBwcm9wZXJseSwgZ2xvYmFsIHNpbmdsZSBpbnN0YW5jZSBv
ZiBfX3N0YXRpY19jYWxsX3JldHVybjAoKSBpcyByZXF1aXJlZC4NCj4+DQo+PiBGaXhlczogM2Yy
YThmYzRiMTVkICgic3RhdGljX2NhbGwveDg2OiBBZGQgX19zdGF0aWNfY2FsbF9yZXR1cm4wKCki
KQ0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBj
c2dyb3VwLmV1Pg0KPiANCj4gQWNrZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUByZWRo
YXQuY29tPg0KPiANCg0KVGhhbmtzIGZvciB0aGlzIEFjay4NCg0KQnkgdGhlIHdheSBJIHNlbnQg
dmVyc2lvbiB2MiBiZWZvcmUgeW91ciBBY2sgZm9yIGEgbWlzc2luZyAjaW5jbHVkZQ0KDQpDaHJp
c3RvcGhl
