Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73765F606B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 07:06:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjfXv6Gchz3cds
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:06:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3Pvnl+fc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.42; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=3Pvnl+fc;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90042.outbound.protection.outlook.com [40.107.9.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjfWv0HdXz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 16:05:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyQ02pcX3nDfPdKRHjrYU5yGT7Xhy9hU4Cqavrw3gZ7YwxmrsoAuRTd+kD0kKD+ugi3Lc49ea7AZ+twAgGwzP5qsOCjmBFa1O3mVPV43bnj49LdK3fwXa2jHUIDhlI7xNc72ciNHpxpcBdD6WUA6exMzkWRwzLKwrKKf7DX3TL3+meDH8ViKi6hY3xrbfAv4nEODO23g2Jpr4Vb6dtUVX0SH5y1fs1PcrPVTmiZ44Wgp45VQ/rJzkt/F14dmz1faOXt51zhZ/b7ft3mN0MQGwbeH8eCkSjuN4nVbdVuTxKw7cHZdw1qHLLhorwPjNnltG89NJGyvIvRlANX0xLQE4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hvbm9xjuNQoUJTs7XTOQE8rt2DtGJNppwrxUEVs8KHY=;
 b=i57omGY84Fk1RHrBfdQlnIBLxLUphbxEHJUQ/wMSBuM3RfUkVMGZ/+oB/HpYYmkMyst1ToBGXiGJIIfL32SBFV/5bsOdy7Bay9q3Wk8uRkjkimTduUx+sTG4wFh2CUMUXgt4043HFLeHO0udYCcF8pyBvXdxBp22VeVUbjkHZAEIe2e5IepFBkePvw7gEGUiz8RH1n2UCjQdF2LRWlwwMchiS3CxpdpFLZJSkX0Sldz0FuX/HWn/ANtMgYJdzvDWtvlmJArGEegClwem7JsymAyXxRpJlMV3aF3ow+biVBaEAUO0jsedHpekYxltFi/VcpxuQQ8nWX7rNZgNwgftBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hvbm9xjuNQoUJTs7XTOQE8rt2DtGJNppwrxUEVs8KHY=;
 b=3Pvnl+fc0VPlZz4W+h6q5gmuvmDYaOcWHOy2ehuZRc5ZwjftYBTBiiRQqu4yoUWLShsybp6ViTE6A+l1+f4cijQxepDbw3KyKUEhEovZOhicH6A+fCzwGzc/uLAxz2UW/+qbeCuxUL4ccp+ygi9jSOjOMZ24sSAEyfY3gulcF2IwZXkTTP0M51/NzMe8dKWFdUIc+5DHXcbHSSXP30Y8+gtyBsA6hQA5cGYlsovUnoX5DIbtrYuWS4CSd6nMkMjKhjnjp7ZRNGox4OSVIE7T0n8vRzWWVAcKUvRYjoH81FOt7TGgwyjwybxE5KlKlpIb67gORHLKyBUxQ4EGd3gN5Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1937.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Thu, 6 Oct
 2022 05:04:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.036; Thu, 6 Oct 2022
 05:04:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch
	<nathanl@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Topic: [PATCH] powerpc/kasan/book3s_64: warn when running with hash MMU
Thread-Index: AQHY2EIBh+iraNEA6UKZa+r/wPzLXq4AwrWAgAAPGgA=
Date: Thu, 6 Oct 2022 05:04:52 +0000
Message-ID: <9b6eb796-6b40-f61d-b9c6-c2e9ab0ced38@csgroup.eu>
References: <20221004223724.38707-1-nathanl@linux.ibm.com>
 <874jwhpp6g.fsf@mpe.ellerman.id.au>
In-Reply-To: <874jwhpp6g.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1937:EE_
x-ms-office365-filtering-correlation-id: d462bb16-06f4-4332-1140-08daa7584d6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ChsFjvafE6B55OGqar0FvIH9vgthmQJNTEi6X9tmHRwpcooILQGj6jiiJnHUCKwGL+L272/N9+a5vh+o752Sc5qqS8YWQF3xNJVvPu2nkyt2zSNB7gIYK16e4X9FbFwwj90hBMH46G6r6/TaKBY7mjPk3YkiJCRY+ltKih1PiVr7IdixObwJHE/0N/95/U9cEi5SD7c3uVkR4yd216sQbORMz/jB6QffeNAaPg6JcACWsNgzrFnEeD8n3b39j9CAYObsLQ4bByWc9T3k3WG1qDjZTIZqIsJI2BNPCrGS11KhGS5DUeAi7wl9SEPB0MHzsUUaLRG4BpBTJM+CKLkNRXan8s75z4MVgBJEbUKe6Q6J/LSeM3DY/HeoXYwlN2RpGUV1NstEQYSB6dg/yScTtSbFUAGYjvPLh6FMeN2/E9T/BEW4AelOevURC0lMGIkLB++GoL8ydzBkxd7FkRV4i00mAisP/GlJAiALlR0I9Fu3GZ+CkYoo5kCQuVJFecxXq83ZVw/IYIfn4QTxmm0Hj1QpHGPwiVzoKqeSfZaNN4tbgmkcaBju3wOw80l8bHmxbBnTqJMAnS2QDLcRTypj8v5TZrnIgNzidEcSZ31xtoT+436Za8Zlso7u0qXCYZ1dETPv7cyxPirnFMRYPAjNPb3/duc7X+csssvHrSYJq3x9L86uFI9bqb2XLxnL8U6lZrshLgbqraGL/xWubSlkV/lc/SXU9BKhb0+tVofpn5gLIHk7CTN7v5L4j45hVAGUz+vS8LJfQ8Q9f+Ib7Ny02ZEJFY48aNtaafBCeSs39+CFKF57fFVZeGLc4oPN4wm6d8Qvf7+ZMgMmEEvFd0Tn/w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(31696002)(86362001)(38070700005)(122000001)(66946007)(8676002)(76116006)(91956017)(38100700002)(66556008)(66446008)(64756008)(66476007)(316002)(110136005)(44832011)(2906002)(41300700001)(5660300002)(8936002)(186003)(83380400001)(2616005)(66574015)(71200400001)(478600001)(6486002)(6512007)(6506007)(31686004)(26005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bk1KWWM3c2orNnN3MXdlUmF0cENkWkhNa2l2Z1QzU3lEazZhQSsxSWJ1cVMw?=
 =?utf-8?B?UHorUzFTUDZyN3BtVkNmUFV5REhBUVZpL2VWdkFZclBTUlZmYm52OXE2WERC?=
 =?utf-8?B?QytoTVZhdGtXQjZKV016VkZGNHJrUGpHRnNlWVQyaDVlS3BCamNUN3NBanJo?=
 =?utf-8?B?SEtpcEZVVVo5Q3hFU0lyNzdybnl0R1pRTDFVcVRRc0dDMnFuRWFnRHZhaFh5?=
 =?utf-8?B?VzFEZklyaTVJQzNCcFFmVTlYUXNSNlJaNk5xQ2NBYnkwc3NvOTdNV3FvaTRT?=
 =?utf-8?B?cFdSTDlkeEZYcUxVNlJUbUxkL21IbGY4L3RFb2xPZmF3VjRNdTljbUdkZkhR?=
 =?utf-8?B?U3Q5WFN4c3dzYUxoRlFTbzFpejJYd25zd2dOTldvVmh5ay9TdXhjOElQYitI?=
 =?utf-8?B?YWFuYmZGNm13Y0VwVlVqOTJlY2x5RlU1MGIwUGtBMDEyVWpzV2poOG9GNWJj?=
 =?utf-8?B?ajlIWU5TcmFJS01DTGp2citOV2xSdkdRSTg1d2I0SS8xY0xUYXN0bHRLQkc4?=
 =?utf-8?B?Z21nbHFRYWQ1YVU4dDJqa0pwcmhXdStET3Y3VU1qT1loTWtCOGFObHZIOURa?=
 =?utf-8?B?TUNiaEtNNXU1Nld6ZUo5VXpYV3kvV0VGem5jVmhYc0JDRG9SNHN1RWNMM3VK?=
 =?utf-8?B?V0tsc2pTYUlYaktZOE9XbWZSK3ZJTDhVUWQ1bE80SlU0dUZNWkUvUWpBb3Mv?=
 =?utf-8?B?bWJWeTNtSkNRL3h1dXhzcVdrSjVCWEdJcWdMUHB2YWJacXNjWkpRaklpRGpv?=
 =?utf-8?B?SzlwQjBvTGdCd2pYUkdkOEF5ckxEMGV0QmtkdXJlUkZWMTZIL3RoTEZBalJP?=
 =?utf-8?B?eEM3aE1hd1RxVnpxMUNMMXA0N21SanNlSFFuRWhqUVJHcGR1SEp6Z1dKelFE?=
 =?utf-8?B?aXB1d3BwQXV5cnBRNlBwV1hHNkYvK09PRUJBNjM5cVZNcmRpdXpvUjhVa0VF?=
 =?utf-8?B?UnUwdzlxeDlnNkRnTVczRDR6bk92eDV5cENteHhJQzVZV2twTWxJSE1OUXQ0?=
 =?utf-8?B?c1Vzc1pEb3IydHdTZS9IdzdqQ3QydFhzZkpZWXEwS1dvYjFyaS9CdXUzVjN0?=
 =?utf-8?B?ZTM2Ri9KWkhPQWsvWmt2N3pqTC8wck5acGc0YmdCRC9Xem52Y2NnbWIyWlVO?=
 =?utf-8?B?SSs3eVlTanhtTHF5elU0cXJWWTFVcXBDbGVVdS9telEwQWM1M1I1QUZhK3Jk?=
 =?utf-8?B?SU5oODIybHA2eE1vNXhvRjlQd2dXZjZwOWRkTTFtUktoaW1MclF0MjA5TlZB?=
 =?utf-8?B?ZzFyRWpucndqc1RFdEVrQ2dRb2dmalJmRkNiUEpHbGNXZGRIckhBdnhRSDBh?=
 =?utf-8?B?cUVHTzRxVU93dTdIZ0ZTL29Tb0dhbHZGWm9YLzczYnZKVjZ0Qm5VdHBPaFpP?=
 =?utf-8?B?eS9PVC9LWE9mVnEzRjB6QnFaOGdHWUdBeGZVbW9CQnBJQ3hlVUNtU1c1SnlC?=
 =?utf-8?B?UVJkYWYyTSt2RDVTWFVVeHcyUW1tMk5ENndKUUpzYTRQTWJWTTFBRVdPbS9H?=
 =?utf-8?B?dFllaDZ5UHV6MXFxYytabjREVUJOcERidVNucDVneU1objFxM3pkempjcVRx?=
 =?utf-8?B?QUtRam5ScXNPTUFnNHhQRTN3dkFXMTNVc2dhQTJJMEw1NUV1b1RYMnc3N3VP?=
 =?utf-8?B?YkdZYXg5eEUvMk56bDMyRE9ySTlyd2pzMEJ4eDhtZEhtbFNFcXI5REQvcHR4?=
 =?utf-8?B?eU1yR0dtVitsdE1TeFNRZGRsZ3pZRDdSZUJYckJJMmdZUVZNR1lKaUxUL2gz?=
 =?utf-8?B?T2d0b1IzWXJqeXZQUmNxdjdsN3lpVkVTQ015d2Q0c3ZvaVUxU0FLNXh0UGxD?=
 =?utf-8?B?cXZ4d0c5dHJpaE5CZ0g0SWkzeS9jaDhGTmVqeGhkUVNCMDhkcHJuOXc2WUtt?=
 =?utf-8?B?K0xNVzE2ZUg2RXNoSG9yd3VaelRmZDhYYTZMUEc1RHphR0dWK3NhY24zT1hj?=
 =?utf-8?B?T0hnTDNJcWdndjQ3c0dJNEhpQ3gvdnBmN1FTdFUwWk9JM0hPZm5RTTdpakJV?=
 =?utf-8?B?U1RUTEVxNHZUSnBOb1I1Y3NiNGgySFVJcWQvWnRzR1YvNmN3a0c4UHZBSHN5?=
 =?utf-8?B?UkJOUXREakMzay9YbjNiM05rQzdWRzhlK0hvWkFjNUJjV1A5MzFGcFZrMHpP?=
 =?utf-8?B?a0Y2K3J1WEUrd2dyaEh4R0FzSzhpeDRCQlFSREFrS0NmdjBMSTFvVEl5R3E4?=
 =?utf-8?Q?P0Ptnv+pvfMmK3HamhQGXAU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <224C9307AE1F21498A72301446E21372@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d462bb16-06f4-4332-1140-08daa7584d6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 05:04:52.4078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e6HbwViBTY1FHg1i/5FU4LYmZZZ0TJZK8UFtjj72Use9IUHmHSuR4t1AJ/tRKlQ/md7l3XpTC5YUP83YtL9IXhWDO0Sz8nStgvmw23lwfOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1937
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

KyBLQVNBTiBsaXN0DQoNCkxlIDA2LzEwLzIwMjIgw6AgMDY6MTAsIE1pY2hhZWwgRWxsZXJtYW4g
YSDDqWNyaXTCoDoNCj4gTmF0aGFuIEx5bmNoIDxuYXRoYW5sQGxpbnV4LmlibS5jb20+IHdyaXRl
czoNCj4+IGthc2FuIGlzIGtub3duIHRvIGNyYXNoIGF0IGJvb3Qgb24gYm9vazNzXzY0IHdpdGgg
bm9uLXJhZGl4IE1NVS4gQXMNCj4+IG5vdGVkIGluIGNvbW1pdCA0MWI3YTM0N2JmMTQgKCJwb3dl
cnBjOiBCb29rM1MgNjQtYml0IG91dGxpbmUtb25seQ0KPj4gS0FTQU4gc3VwcG9ydCIpOg0KPj4N
Cj4+ICAgIEEga2VybmVsIHdpdGggQ09ORklHX0tBU0FOPXkgd2lsbCBjcmFzaCBkdXJpbmcgYm9v
dCBvbiBhIG1hY2hpbmUNCj4+ICAgIHVzaW5nIEhQVCB0cmFuc2xhdGlvbiBiZWNhdXNlIG5vdCBh
bGwgdGhlIGVudHJ5IHBvaW50cyB0byB0aGUNCj4+ICAgIGdlbmVyaWMgS0FTQU4gY29kZSBhcmUg
cHJvdGVjdGVkIHdpdGggYSBjYWxsIHRvIGthc2FuX2FyY2hfaXNfcmVhZHkoKS4NCj4gDQo+IEkg
Z3Vlc3MgSSB0aG91Z2h0IHRoZXJlIHdhcyBzb21lIHBsYW4gdG8gZml4IHRoYXQuDQoNCkkgd2Fz
IHRoaW5raW5nIHRoZSBzYW1lLg0KDQpEbyB3ZSBoYXZlIGEgbGlzdCBvZiB0aGUgc2FpZCBlbnRy
eSBwb2ludHMgdG8gdGhlIGdlbmVyaWMgY29kZSB0aGF0IGFyZSANCmxhY2tpbmcgYSBjYWxsIHRv
IGthc2FuX2FyY2hfaXNfcmVhZHkoKSA/DQoNClR5cGljYWxseSwgdGhlIEJVRyBkdW1wIGJlbG93
IHNob3dzIHRoYXQga2FzYW5fYnl0ZV9hY2Nlc3NpYmxlKCkgaXMgDQpsYWNraW5nIHRoZSBjaGVj
ay4gSXQgc2hvdWxkIGJlIHN0cmFpZ2h0IGZvcndhcmQgdG8gYWRkIA0Ka2FzYW5fYXJjaF9pc19y
ZWFkeSgpIGNoZWNrIHRvIGthc2FuX2J5dGVfYWNjZXNzaWJsZSgpLCBzaG91bGRuJ3QgaXQgPw0K
DQo+IA0KPiBCdXQgbWF5YmUgSSdtIG1pc3JlbWVtYmVyaW5nLiBMb29raW5nIG5vdyBpdCdzIG5v
dCBlbnRpcmVseSBzdHJhaWdodA0KPiBmb3J3YXJkIHdpdGggdGhlIHdheSB0aGUgaGVhZGVycyBh
cmUgc3RydWN0dXJlZC4gU28gSSBndWVzcyBJJ20gd3JvbmcNCj4gYWJvdXQgdGhhdC4NCj4gDQo+
PiBTdWNoIGNyYXNoZXMgbG9vayBsaWtlIHRoaXM6DQo+Pg0KPj4gICAgQlVHOiBVbmFibGUgdG8g
aGFuZGxlIGtlcm5lbCBkYXRhIGFjY2VzcyBhdCAweGMwMGUwMDAwMDMwOGIxMDANCj4+ICAgIEZh
dWx0aW5nIGluc3RydWN0aW9uIGFkZHJlc3M6IDB4YzAwMDAwMDAwMDZkMGZjYw0KPj4gICAgT29w
czogS2VybmVsIGFjY2VzcyBvZiBiYWQgYXJlYSwgc2lnOiAxMSBbIzFdDQo+PiAgICBMRSBQQUdF
X1NJWkU9NjRLIE1NVT1IYXNoIFNNUCBOUl9DUFVTPTIwNDggTlVNQSBwU2VyaWVzDQo+PiAgICBD
UFU6IDAgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjAuMC1yYzUtMDIxODMt
ZzNhYjE2NWRlYTJhMiAjMTMNCj4+ICAgIFsuLi5yZWdzLi4uXQ0KPj4gICAgTklQIFtjMDAwMDAw
MDAwNmQwZmNjXSBrYXNhbl9ieXRlX2FjY2Vzc2libGUrMHhjLzB4MjANCj4+ICAgIExSIFtjMDAw
MDAwMDAwNmNkOWNjXSBfX2thc2FuX2NoZWNrX2J5dGUrMHgyYy8weGEwDQo+PiAgICBDYWxsIFRy
YWNlOg0KLi4uDQo+Pg0KPj4gQ2hhbmdlIGluaXRfYm9vazNzXzY0LmM6Omthc2FuX2luaXQoKSB0
byBlbWl0IGEgd2FybmluZyBiYWNrdHJhY2UgYW5kDQo+PiB0YWludCB0aGUga2VybmVsIHdoZW4g
bm90IHJ1bm5pbmcgb24gcmFkaXguIFdoZW4gdGhlIGtlcm5lbCBsaWtlbHkNCj4+IG9vcHNlcyBs
YXRlciwgdGhlICdXJyB0YWludCBmbGFnIGluIHRoZSByZXBvcnQgc2hvdWxkIGhlbHAgbWluaW1p
emUNCj4+IGRldmVsb3BlciB0aW1lIHNwZW50IHRyeWluZyB0byB1bmRlcnN0YW5kIHdoYXQncyBn
b25lIHdyb25nLg0KPiANCj4gU2hvdWxkIHdlIGp1c3QgcGFuaWMoKSBkaXJlY3RseT8NCg0KQnV0
IHRoZW4geW91IGxvb3NlIGFueSBzaWdodCB0aGF0IHRoZSBwcm9ibGVtIGlzIGluIA0Ka2FzYW5f
Ynl0ZV9hY2Nlc3NpYmxlKCkgYW5kIGhhdmUgdG8gYmUgZml4ZWQgdGhlcmUuDQoNCkNocmlzdG9w
aGU=
