Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9C518531
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 15:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt0j220mLz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 23:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::617;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::617])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt0hW3CPJz2ynx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 23:11:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ci4pLEWkVsVZcKoSPGojwZkUrGfnubLU1oJ2utjeiVnH28vwkel/JJ+0zLSezSzFN1YpdKl6YwUK7PvL2u3orwEaRXNd6cYZRkigMowOEseTy70xVf5XU0OGAdgU27BMI9zFzeBqtwv+ZueriYqp7Ht60oUOVBu3vMOKypTwwecUmQXiKsLotmBfPuH2YgwNUQ0lFG6siKhpQxx72fqBFApqTLW23lk4Cttl5c3FNj3phu+B8+4PORjLk/jmyIZXHyZOebJLrJkhdTqkmK62BKoTbUlDN2Ax856LX3JMsDWANdpjFpTAzqt6yEuW32uS/BNfBUbRCXNysjlUDN666g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+S6NrgnLxrnzOEL5V/xNwQtut+TLcom9oNhljCllwRQ=;
 b=RN6pibvU2Pvye6mc6MTd1tFeddYvbC7e2lsJxLntRBiQjd8k9ArrkkyNAR5Dbz4NQH7vUEpGJSOoDKC9yKVamEyjcbgNLrSQQI485PCiBD7fK2Hi+OGkqGk6e0DHYc7R2QRFSBC8w5UZunwaAojZ8z9epwXYxTGG+U2Wptyk2hBkrkXBYTZUR4oIf7V0vgnds/u1v2EtmB3XNTwBgAJbc2I8bu6KmKx8GdOtLqcZ49Rd6OFASweQQutR5FT2gFZ3l1PAF5Jjo2nkyhUCrtxtjUBbtjwmn5nXoaHod88CqC0F+r8nQJlGY3ZskBnzhl0Fj9dNRLVA0H7cqBgc7eQcFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2880.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1e5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 13:10:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::d572:ae3f:9e0c:3c6%7]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 13:10:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, Linux-Next Mailing List
 <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "lkft-triage@lists.linaro.org"
 <lkft-triage@lists.linaro.org>, Peter Collingbourne <pcc@google.com>, Andrew
 Morton <akpm@linux-foundation.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [next] powerpc: multiple definition of `____cacheline_aligned';
 sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
Thread-Topic: [next] powerpc: multiple definition of `____cacheline_aligned'; 
 sound/core/oss/pcm_oss.o:(.bss+0x40): first defined here
Thread-Index: AQHYW9fxAE9QWFBI6UuRL7wxi+JO960NJrCA
Date: Tue, 3 May 2022 13:10:43 +0000
Message-ID: <e3c8b2bf-b55d-4c2c-a1cf-d5e9941e26b0@csgroup.eu>
References: <CA+G9fYvSqtsOMEiL7_kffPKnnO-Snhe2cup6g3qRngiwRO+RfA@mail.gmail.com>
In-Reply-To: <CA+G9fYvSqtsOMEiL7_kffPKnnO-Snhe2cup6g3qRngiwRO+RfA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bda77638-a798-4e6a-74e9-08da2d06542f
x-ms-traffictypediagnostic: PAZP264MB2880:EE_
x-microsoft-antispam-prvs: <PAZP264MB2880743E2A172CB1597FD58AEDC09@PAZP264MB2880.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mpJAZ0r7V0WMlcc6lU6tTfw/LGKh/7aBy4ag7C4TpjS2RWgw/XUf4OW1NXrKaW5ibkvUk1wYKhGv/V0WLSIp25hqk1bMvLDuguNLLOqWEYkLR4u4JY5lgr2AkviWOxT4ND5t1U3DKWs0RlNW9db5aEhppdlnxj+/LME3bThqnzie4Pc0NNP4EHseahBPg6g7naAF+RQbgQj2yYW+YoQckHBjrds+OzQnGEj5Q2Ks9jf+KnmyoxT61Rmgl1uR/qz4yBJwjYBNOWTXUpYoHzKGDTZgvFvqneMqtFNoEMFsz0LYOp0+qieCef6tfX6kv+P04mDcfYcb4sHmb36u1+YXnDY/YRhXsfBpSTKmjAJu1yLdpDhcsbwTSnrawz8hG6ddZQAlyRJHvo/WAeBE9O0LNfkeXtrGkOgx3sWWUFbBj8c6PlXzrDcVKkjTWMBRN70KfAsa7LcgNrUJ0wSDKeGCL0gzJ4BeQJNSQjAvprwKCoNsH0eli/TVzHAgugkqmcDA9J0nmDbvjIQ9viNb50jNIFSM+09LK7OpVO6RgzmcuksdY/LWVpfcW0PlbnYg7dE9RcxH+kagNi4ZN92jUZ4iU/4XxP9saJZWAvOOSTjCyFBYdUb0SByAsBQqj+kGxL4IhgZ2wna1sQMTiFZimWere90zP2YkXahflldlcfsMCxoWzHhCui4X6N9J724ojqk0Ta93mz/+DT3nEUHBqqlRlclUoDL319Jq/RA5HdyrTYZ1A0rJ2vi6cq1YCtgl7qhPnBSVAiqsjeCYBXawSQ/DvK4HItP3x5p83jty6c3wa0k4ZF5F1thupYDAaZkNA2cRY/cnucAkwFRL2crf1zTyxFhHurx9oQMjg/f/QoRfCYhfQmjUWTCRTXeG4lPMMVQf5Y/z5M/c4R+Oad40xdE/Pg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(31686004)(66556008)(66476007)(66446008)(64756008)(66946007)(66574015)(83380400001)(91956017)(8676002)(76116006)(4326008)(2616005)(54906003)(110136005)(316002)(186003)(86362001)(6512007)(31696002)(26005)(6506007)(2906002)(36756003)(71200400001)(44832011)(5660300002)(122000001)(38100700002)(38070700005)(8936002)(6486002)(966005)(508600001)(101420200003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzBYejRQSW5iaDhKTnlmVGhKdEdXNFMxUnI5bmM2UFNoMUc2bEVZNDIwRkR1?=
 =?utf-8?B?Nm5jZVpOcmplL0x1a0NxZ3NwRjEwZlFCOE1ieFd0VVNrQVhNVnNJM3JHdmZX?=
 =?utf-8?B?bXpkYm5KNFlWbjRvT0duU3RvYkpFZnVzM2thamNNNCtHSVJyOVZ1MTlSNTlj?=
 =?utf-8?B?OTNoVmRaSW4xazJCcGZDVGRFNllDdE1KZVJBdWxhdy8vTW5uU0V3SFRvWmNI?=
 =?utf-8?B?a0JGUWQ1cVhoZ1RxandScElJcDh5eUxvUWJic1pIVEFHL1I3Q3VWUHNGTmxT?=
 =?utf-8?B?UVBBRERtY2EyZDY5NE81RjNUdWdEeGtNWFkyNnExTFdlSG1POXVXVXgwb1gw?=
 =?utf-8?B?OHlVU1FoRHZQMFdtOGREUmhxSnppbUthY05CLzhFdG4wOVNRbk5laEo2L3Rk?=
 =?utf-8?B?MUtBa2thRVdGaURWVFJIK1QvWUJKemtwRWsvZldOeW4yRXR1dFhHd0ozcisx?=
 =?utf-8?B?RGZBUjlMbFJ0ZGRjbDFtSFg4WHVzL1BwL01xSnRxMUUwejE5dGg1UFljeTBL?=
 =?utf-8?B?U0xrYk9JenoydEFMMWxZUHBNbUppWmFCR2llNzNmNHgyR29wMkpFZEY1emtD?=
 =?utf-8?B?R2VrZHBscmgzNlhaT3VtajRkWi96RnJnRFprNmY5TnpoMmI5SDFZZnliUWFS?=
 =?utf-8?B?bkNJTDNHNWNKNE9PeFdyRk4rWDJqS2t2SnZ6c3I0TkJNVmVqWHJHd3B5MDMw?=
 =?utf-8?B?T0kxclBGWG5RUUdxT1A5N21CdWI5YzZ3dEY2RElvbXVRdlVMcDd4Ym9ORmht?=
 =?utf-8?B?aUhZa0ZKVHBCWUZWYVZWUTh4VnJJNDlHUlV2dStURHRZODZEdkFyRlJMcDkw?=
 =?utf-8?B?STBqR3k5N0hHZFloUjdqS2I1T0tKV3ZsQ3ZwV3VXRm1BSFRGR1dYeTFkSnFy?=
 =?utf-8?B?UkU1cUdJY1gwaUVBZ1VqZDNnOUNaK3F2aTEyYmNPL2tHMFphTDVEUUtTc0hH?=
 =?utf-8?B?NmpXU0Q1aTgxNkU5bjJqMk1xWE1ZdGVwcHBFQmdBUEZFWUJxb0hVN0ZFMHQy?=
 =?utf-8?B?QmtGeGdVbFVOQzk3cndEOGVrY1ZXWG9KYnZVOGMxazVDMUtmVkl4Q1R4VFF4?=
 =?utf-8?B?ZnJoa1ZMUFcya05jS3NQYlJ3SnpLL1FqSXdCRnU3d1BQa0dDMzErakpqaDZP?=
 =?utf-8?B?eWNQQ05NTTkzM2Nld0dCd2RlMHdJQk8rUVlEZHVVYW9QcTY1Y1lxbUxOdjE4?=
 =?utf-8?B?M0ZaelU5TVBHNHNHYTFtNjdpdU5DSmJ1dzRsZ3JHeXYwbXA4UzZrOER2M0dw?=
 =?utf-8?B?cG5PdTVVY2FuN2tYUU1idHo1dXdQU01yRFNyVTBjbktRMG9BYi9tMVF3K0hF?=
 =?utf-8?B?ZUx0SWh1RHdjaVU3YU5ZRi9qZW4zeFNjREN3ckRXQjcxU0lUQUVSWmhOeEVi?=
 =?utf-8?B?OHNESTNMUXlldkxISU9wVkhlU2JYWEpyRE43aWlaUWlQNVB1dTVRMnZYNDNy?=
 =?utf-8?B?WXRramR5N1ltZ0FTeHB0UlVYSDlKdXZpZ0dIRldib0JFOEJvVVhORWUwcGxL?=
 =?utf-8?B?U2c3TWNScE5Tb014L2VFYjNoSnNSK2tHdHc2ZEtzM050QTFnVnZieGFwS2Jx?=
 =?utf-8?B?V0ZyYWEzK3hINHRMU0hBd1F6UllNL3FvZjJsbFk2czF4ZHJVaEpSUjRvSEFh?=
 =?utf-8?B?RXNwWEtrZExKZHNNYkhnM2JCMGpoUjZkQ0pZOXZIUEFNb2s0dmtDZlQzczRQ?=
 =?utf-8?B?bnRTcEFGaS9NMnpRY0pXSmduSjFCWUNjV3FWNDIzN2p1UEFlR0VKZFoxaUdz?=
 =?utf-8?B?a092Z3NwQXlvZERTVzhnSGFnYkNWalB5Mkt2MVhpK2NpYUF5aG4xcmxpemtu?=
 =?utf-8?B?QWRUYVBIRGFrRFQxVmlvZEhaSFVQZm5TVy9HSG1VeEtkdVJVdEJRT3dqWTF1?=
 =?utf-8?B?aUxtSWptUWxQU0VIRDh1RGlWUlQ3QmJvc1EyT0tmSXUyai80dVl5Q1lVdkVy?=
 =?utf-8?B?S1lWMU45SkhLZzltUm5vNkVQWHZSeURUank0WTM5emNxVkZZV2R5VWNZUFFl?=
 =?utf-8?B?OUNidU5oWlBvS3NyWkJiaXllN0xCTE9mRkhRWFlRY1lIamluYktUL3dhbmM5?=
 =?utf-8?B?TDdBZnNDVzllaFJaR0FYMDh6MFNTWm9MTU5TUmhMV2h1RmQzM09UWnllTzdN?=
 =?utf-8?B?RExPNlJlc05JY1UveHRIOGJhSXRiRTBqSlpYUVhjSGd6M1g2MmNWeWg2eCtN?=
 =?utf-8?B?WGNidDFnTzRIRytjNS9POWx3cHpmVkJDSXFkMi9xN3BWK3dVK2lXSXd5TzUr?=
 =?utf-8?B?QnNORklJU2Q1TjFldCtEWHVGM3Fhc3Q4SlNQQWI3N3ZwNGN3MjdiUXducnNl?=
 =?utf-8?B?N1Z0bFoxRitEbFlORlNMR3ZmSjB3WmZBOXlRMkpqck1IWG1HNm5zVzc5RnFU?=
 =?utf-8?Q?1Rp2jAKL++dKhfYPmhnfTzd8aAZSAPDJSvnvb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B293CD55155134A9D660B7A5A692841@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bda77638-a798-4e6a-74e9-08da2d06542f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2022 13:10:43.1639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NFn8z9sfL8Wcs8nXlGKOtnY3zFy4GFNd7tteqIRdq4D+zc/KwXoxFq/tRqDcner6ud/Bzm9BJLnDrBcJGnzl0RhpUb7G52fd42WHDNuffjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2880
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Baoquan He <bhe@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
 aul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA0LzIwMjIgw6AgMTY6NDUsIE5hcmVzaCBLYW1ib2p1IGEgw6ljcml0wqA6DQo+
IEZvbGxvd2luZyBwb3dlcnBjIGJ1aWxkcyBmYWlsZWQgb24gTGludXggbmV4dC0yMDIyMDQyOCBh
bmQgbmV4dC0yMDIyMDQyOS4NCj4gDQo+IFJlZ3Jlc3Npb25zIGZvdW5kIG9uIHBvd2VycGM6DQo+
ICAgICAtIGdjYy0xMS1wcGM2NGVfZGVmY29uZmlnDQo+ICAgICAtIGdjYy0xMC1wcGM2NGVfZGVm
Y29uZmlnDQo+ICAgICAtIGdjYy05LXBwYzY0ZV9kZWZjb25maWcNCj4gICAgIC0gZ2NjLTgtcHBj
NjRlX2RlZmNvbmZpZw0KPiAgICAgLSBjbGFuZy0xNC1wcGM2NGVfZGVmY29uZmlnDQo+ICAgICAt
IGNsYW5nLW5pZ2h0bHktcHBjNjRlX2RlZmNvbmZpZw0KPiAgICAgLSBjbGFuZy0xMy1wcGM2NGVf
ZGVmY29uZmlnDQo+IA0KPiANCj4gQnVpbGQgZXJyb3I6DQo+IC0tLS0tLS0tLS0tLS0NCj4gRXJy
b3I6IFNlY3Rpb24gLmJzcyBub3QgZW1wdHkgaW4gcHJvbV9pbml0LmMNCj4gbWFrZVszXTogKioq
IFthcmNoL3Bvd2VycGMva2VybmVsL01ha2VmaWxlOjE5MToNCj4gYXJjaC9wb3dlcnBjL2tlcm5l
bC9wcm9tX2luaXRfY2hlY2tdIEVycm9yIDENCj4gbWFrZVszXTogVGFyZ2V0ICdfX2J1aWxkJyBu
b3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFr
ZWZpbGUuYnVpbGQ6NTk1OiBhcmNoL3Bvd2VycGMva2VybmVsXSBFcnJvciAyDQo+IG1ha2VbMl06
IFRhcmdldCAnX19idWlsZCcgbm90IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4gbWFrZVsx
XTogKioqIFtNYWtlZmlsZToxOTk2OiBhcmNoL3Bvd2VycGNdIEVycm9yIDINCj4gcG93ZXJwYzY0
bGUtbGludXgtZ251LWxkOiBzb3VuZC9jb3JlL29zcy9wY21fcGx1Z2luLm86KC5ic3MrMHgwKToN
Cj4gbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgX19fX2NhY2hlbGluZV9hbGlnbmVkJzsNCj4gc291
bmQvY29yZS9vc3MvcGNtX29zcy5vOiguYnNzKzB4NDApOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4g
bWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUzMDogc291bmQvY29yZS9vc3Mv
c25kLXBjbS1vc3Mub10gRXJyb3IgMQ0KPiBtYWtlWzRdOiBUYXJnZXQgJ19fYnVpbGQnIG5vdCBy
ZW1hZGUgYmVjYXVzZSBvZiBlcnJvcnMuDQo+IG1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmls
ZS5idWlsZDo1OTU6IHNvdW5kL2NvcmUvb3NzXSBFcnJvciAyDQo+IHBvd2VycGM2NGxlLWxpbnV4
LWdudS1sZDogc291bmQvY29yZS9zZXEvc2VxX2NsaWVudG1nci5vOiguYnNzKzB4OTAwKToNCj4g
bXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgX19fX2NhY2hlbGluZV9hbGlnbmVkJzsNCj4gc291bmQv
Y29yZS9zZXEvc2VxX2xvY2subzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4gcG93
ZXJwYzY0bGUtbGludXgtZ251LWxkOiBzb3VuZC9jb3JlL3NlcS9zZXFfbWVtb3J5Lm86KC5ic3Mr
MHgwKToNCj4gbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgX19fX2NhY2hlbGluZV9hbGlnbmVkJzsN
Cj4gc291bmQvY29yZS9zZXEvc2VxX2xvY2subzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhl
cmUNCj4gcG93ZXJwYzY0bGUtbGludXgtZ251LWxkOiBzb3VuZC9jb3JlL3NlcS9zZXFfcXVldWUu
bzooLmJzcysweDE0MCk6DQo+IG11bHRpcGxlIGRlZmluaXRpb24gb2YgYF9fX19jYWNoZWxpbmVf
YWxpZ25lZCc7DQo+IHNvdW5kL2NvcmUvc2VxL3NlcV9sb2NrLm86KC5ic3MrMHgwKTogZmlyc3Qg
ZGVmaW5lZCBoZXJlDQo+IHBvd2VycGM2NGxlLWxpbnV4LWdudS1sZDogc291bmQvY29yZS9zZXEv
c2VxX2ZpZm8ubzooLmJzcysweDApOg0KPiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBfX19fY2Fj
aGVsaW5lX2FsaWduZWQnOw0KPiBzb3VuZC9jb3JlL3NlcS9zZXFfbG9jay5vOiguYnNzKzB4MCk6
IGZpcnN0IGRlZmluZWQgaGVyZQ0KPiBwb3dlcnBjNjRsZS1saW51eC1nbnUtbGQ6IHNvdW5kL2Nv
cmUvc2VxL3NlcV90aW1lci5vOiguYnNzKzB4MCk6DQo+IG11bHRpcGxlIGRlZmluaXRpb24gb2Yg
YF9fX19jYWNoZWxpbmVfYWxpZ25lZCc7DQo+IHNvdW5kL2NvcmUvc2VxL3NlcV9sb2NrLm86KC5i
c3MrMHgwKTogZmlyc3QgZGVmaW5lZCBoZXJlDQo+IHBvd2VycGM2NGxlLWxpbnV4LWdudS1sZDog
c291bmQvY29yZS9zZXEvc2VxX3N5c3RlbS5vOiguYnNzKzB4MCk6DQo+IG11bHRpcGxlIGRlZmlu
aXRpb24gb2YgYF9fX19jYWNoZWxpbmVfYWxpZ25lZCc7DQo+IHNvdW5kL2NvcmUvc2VxL3NlcV9s
b2NrLm86KC5ic3MrMHgwKTogZmlyc3QgZGVmaW5lZCBoZXJlDQo+IHBvd2VycGM2NGxlLWxpbnV4
LWdudS1sZDogc291bmQvY29yZS9zZXEvc2VxX3BvcnRzLm86KC5ic3MrMHgwKToNCj4gbXVsdGlw
bGUgZGVmaW5pdGlvbiBvZiBgX19fX2NhY2hlbGluZV9hbGlnbmVkJzsNCj4gc291bmQvY29yZS9z
ZXEvc2VxX2xvY2subzooLmJzcysweDApOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4gcG93ZXJwYzY0
bGUtbGludXgtZ251LWxkOiBzb3VuZC9jb3JlL3NlcS9zZXFfaW5mby5vOiguYnNzKzB4NDApOg0K
PiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBfX19fY2FjaGVsaW5lX2FsaWduZWQnOw0KPiBzb3Vu
ZC9jb3JlL3NlcS9zZXFfbG9jay5vOiguYnNzKzB4MCk6IGZpcnN0IGRlZmluZWQgaGVyZQ0KPiBt
YWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NTMwOiBzb3VuZC9jb3JlL3NlcS9z
bmQtc2VxLm9dIEVycm9yIDENCj4gbWFrZVs0XTogVGFyZ2V0ICdfX2J1aWxkJyBub3QgcmVtYWRl
IGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiANCj4gDQo+IFJlcG9ydGVkLWJ5OiBMaW51eCBLZXJuZWwg
RnVuY3Rpb25hbCBUZXN0aW5nIDxsa2Z0QGxpbmFyby5vcmc+DQo+IA0KPiANCj4gc3RlcHMgdG8g
cmVwcm9kdWNlOg0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICMgVG8gaW5zdGFsbCB0dXhtYWtl
IG9uIHlvdXIgc3lzdGVtIGdsb2JhbGx5Og0KPiAjIHN1ZG8gcGlwMyBpbnN0YWxsIC1VIHR1eG1h
a2UNCj4gDQo+IHR1eG1ha2UgLS1ydW50aW1lIHBvZG1hbiAtLXRhcmdldC1hcmNoIHBvd2VycGMg
LS10b29sY2hhaW4gZ2NjLTExDQo+IC0ta2NvbmZpZyBwcGM2NGVfZGVmY29uZmlnDQo+IA0KPiAt
LQ0KPiBMaW5hcm8gTEtGVA0KPiBodHRwczovL2xrZnQubGluYXJvLm9yZw0KPiANCj4gWzFdIGh0
dHBzOi8vYnVpbGRzLnR1eGJ1aWxkLmNvbS8yOFNuMTVoQjJsYTFQd2VpZUdNTHJVZGJGTVEvDQoN
CkJpc2VjdGVkIHRvOg0KDQozNjZlN2I2MWNhMWYxMTVkMzgxMzgyMzY0NjcwNjhkOGFhY2FiY2Jj
IGlzIHRoZSBmaXJzdCBiYWQgY29tbWl0DQpjb21taXQgMzY2ZTdiNjFjYTFmMTE1ZDM4MTM4MjM2
NDY3MDY4ZDhhYWNhYmNiYw0KQXV0aG9yOiBQZXRlciBDb2xsaW5nYm91cm5lIDxwY2NAZ29vZ2xl
LmNvbT4NCkRhdGU6ICAgRnJpIEFwciAyOSAxNDo0Mjo1MSAyMDIyIC0wNzAwDQoNCiAgICAgcHJp
bnRrOiBzdG9wIGluY2x1ZGluZyBjYWNoZS5oIGZyb20gcHJpbnRrLmgNCg0KICAgICBBbiBpbmNs
dXNpb24gb2YgY2FjaGUuaCBpbiBwcmludGsuaCB3YXMgYWRkZWQgaW4gMjAxNCBpbiBjb21taXQN
CiAgICAgYzI4YWExZjBhODQ3ICgicHJpbnRrL2NhY2hlOiBtYXJrIHByaW50a19vbmNlIHRlc3Qg
dmFyaWFibGUNCiAgICAgX19yZWFkX21vc3RseSIpIGluIG9yZGVyIHRvIGJyaW5nIGluIHRoZSBk
ZWZpbml0aW9uIG9mIA0KX19yZWFkX21vc3RseS4gIFRoZQ0KICAgICB1c2FnZSBvZiBfX3JlYWRf
bW9zdGx5IHdhcyBsYXRlciByZW1vdmVkIGluIGNvbW1pdCAzZWMyNTgyNmFlMzMgDQooInByaW50
azoNCiAgICAgVGllIHByaW50a19vbmNlIC8gcHJpbnRrX2RlZmVycmVkX29uY2UgaW50byAuZGF0
YS5vbmNlIGZvciByZXNldCIpIA0Kd2hpY2gNCiAgICAgbWFkZSB0aGUgaW5jbHVzaW9uIG9mIGNh
Y2hlLmggdW5uZWNlc3NhcnksIHNvIHJlbW92ZSBpdC4NCg0KICAgICBXZSBoYXZlIGEgc21hbGwg
YW1vdW50IG9mIGNvZGUgdGhhdCBkZXBlbmRlZCBvbiB0aGUgaW5jbHVzaW9uIG9mIA0KY2FjaGUu
aA0KICAgICBmcm9tIHByaW50ay5oOyBmaXggdGhhdCBjb2RlIHRvIGluY2x1ZGUgdGhlIGFwcHJv
cHJpYXRlIGhlYWRlci4NCg0KICAgICBUaGlzIGZpeGVzIGEgY2lyY3VsYXIgaW5jbHVzaW9uIG9u
IGFybTY0IChsaW51eC9wcmludGsuaCAtPiANCmxpbnV4L2NhY2hlLmgNCiAgICAgLT4gYXNtL2Nh
Y2hlLmggLT4gbGludXgva2FzYW4tZW5hYmxlZC5oIC0+IGxpbnV4L3N0YXRpY19rZXkuaCAtPg0K
ICAgICBsaW51eC9qdW1wX2xhYmVsLmggLT4gbGludXgvYnVnLmggLT4gYXNtL2J1Zy5oIC0+IGxp
bnV4L3ByaW50ay5oKSB0aGF0DQogICAgIHdvdWxkIG90aGVyd2lzZSBiZSBpbnRyb2R1Y2VkIGJ5
IHRoZSBuZXh0IHBhdGNoLg0KDQogICAgIEJ1aWxkIHRlc3RlZCB1c2luZyB7YWxseWVzY29uZmln
LGRlZmNvbmZpZ30geCB7YXJtNjQseDg2XzY0fS4NCg0KICAgICBMaW5rOiANCmh0dHBzOi8vbGlu
dXgtcmV2aWV3Lmdvb2dsZXNvdXJjZS5jb20vaWQvSThmZDUxZjcyYzllZjFmMmQ2YWZkM2IyY2Jj
ODc1YWE0NzkyYzFmYmENCiAgICAgTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIy
MDQyNzE5NTgyMC4xNzE2OTc1LTEtcGNjQGdvb2dsZS5jb20NCiAgICAgU2lnbmVkLW9mZi1ieTog
UGV0ZXIgQ29sbGluZ2JvdXJuZSA8cGNjQGdvb2dsZS5jb20+DQogICAgIENjOiBBbGV4YW5kZXIg
UG90YXBlbmtvIDxnbGlkZXJAZ29vZ2xlLmNvbT4NCiAgICAgQ2M6IEFuZHJleSBLb25vdmFsb3Yg
PGFuZHJleWtudmxAZ21haWwuY29tPg0KICAgICBDYzogQW5kcmV5IFJ5YWJpbmluIDxyeWFiaW5p
bi5hLmFAZ21haWwuY29tPg0KICAgICBDYzogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmlu
YXNAYXJtLmNvbT4NCiAgICAgQ2M6IERhdmlkIFJpZW50amVzIDxyaWVudGplc0Bnb29nbGUuY29t
Pg0KICAgICBDYzogRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29nbGUuY29tPg0KICAgICBDYzog
RXJpYyBXLiBCaWVkZXJtYW4gPGViaWVkZXJtQHhtaXNzaW9uLmNvbT4NCiAgICAgQ2M6IEhlcmJl
cnQgWHUgPGhlcmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4NCiAgICAgQ2M6IEh5ZW9uZ2dvbiBZ
b28gPDQyLmh5ZXlvb0BnbWFpbC5jb20+DQogICAgIENjOiBKb29uc29vIEtpbSA8aWFtam9vbnNv
by5raW1AbGdlLmNvbT4NCiAgICAgQ2M6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3Jn
Pg0KICAgICBDYzogUGVra2EgRW5iZXJnIDxwZW5iZXJnQGtlcm5lbC5vcmc+DQogICAgIENjOiBS
b21hbiBHdXNoY2hpbiA8cm9tYW4uZ3VzaGNoaW5AbGludXguZGV2Pg0KICAgICBDYzogVmxhc3Rp
bWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4NCiAgICAgU2lnbmVkLW9mZi1ieTogQW5kcmV3IE1v
cnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4NCg0KICBhcmNoL2FybTY0L2luY2x1ZGUv
YXNtL210ZS1rYXNhbi5oIHwgMSArDQogIGFyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGVyY3B1Lmgg
ICAgfCAxICsNCiAgYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oICB8IDIgKy0NCiAg
ZHJpdmVycy9maXJtd2FyZS9zbWNjYy9rdm1fZ3Vlc3QuYyB8IDEgKw0KICBpbmNsdWRlL2xpbnV4
L3ByaW50ay5oICAgICAgICAgICAgIHwgMSAtDQogIGtlcm5lbC9icGYvYnBmX2xydV9saXN0Lmgg
ICAgICAgICAgfCAxICsNCiAgNiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0p
