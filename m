Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F98E494851
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 08:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfZ3V3DHyz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 18:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::607;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::607])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfZ2x5Xtvz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 18:32:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyWvLpSF6qFK9M451ZJKYoTrPNe7XkaragEPj36/7lQ08UvLfBiUzJGahfGnYc/V+g9ScSvdfolgE3/riCTsi4KJNcq1aZH4Sgu2JIVRSuW6uhxYEYgk6NeVGJd4ZuD7EoGKZRJfKI25HTm9+zPQNTxtSo5mX6rj9any2iJ6bvks0c8yR3ddfz21OjOz0jXu5i6tIqKrnQqqqWnNw7MR+6h4bnXdWvLtx2Vs4gR9LQ2ZfSiMHs8P79E7bFz3iAfK8KSstpfjeaFj7A21XsZ7ThVrbvk3foKhmbHV+K83cN8QZlIyx6OyHp7YZiHmevsTrkVSXGv2YQVT96aADKjZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqwegi4nvVdQnxb/BRZgPCPHZf8/Ozl90voRVSgGG5k=;
 b=h7Dr+kB74hJqsmlAvcib8Jj3FFk3dwn1fdAsr8VLShuLNvd6jJa+B3eSe6u7N02YkXc+iXT9C190PbhgsbDJc/dtwJqHXUyDQET8CvhdKg5nFkQ5lQqW6rrJUtqhcd7NB/EctB9+f1yMg8xg7X8EQV+0ZlmOdAVTVaPsKb/2o4u0CJnD05r91qpE5xWaxf8eD8lBdqDn1f6rXh4tiFHD8xHt5MTLF71t6Bb5TLLQZBigEbiBlb2CUXRyyVnLLwjufJXd5r616Ho+uCtiNPsLFNhiphVyKxynMuVzRy+ST54QbKdSpHKe/2CnxV3gE+ztC2y8v0UMuHg2aSRejpMDJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR2P264MB0350.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Thu, 20 Jan
 2022 07:31:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9d4f:1090:9b36:3fc5%5]) with mapi id 15.20.4909.008; Thu, 20 Jan 2022
 07:31:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Kefeng Wang <wangkefeng.wang@huawei.com>, Nicholas Piggin
 <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Kees Cook <keescook@chromium.org>,
 Laura Abbott <labbott@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Mark Rutland
 <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras
 <paulus@samba.org>
Subject: Re: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Topic: [PATCH v2 1/2] powerpc: Fix virt_addr_valid() check
Thread-Index: AQHX+Ya2u0aEpSnXzUqUcTfc81tnDqxZGu4AgAQ74YCAABh2AIAMQeSAgAH7VIA=
Date: Thu, 20 Jan 2022 07:31:43 +0000
Message-ID: <017744c1-1252-a25c-3dcc-057ee18d0769@csgroup.eu>
References: <20211225120621.13908-1-wangkefeng.wang@huawei.com>
 <20211225120621.13908-2-wangkefeng.wang@huawei.com>
 <09ed46a5-6df3-ffc0-8243-61612c06153a@huawei.com>
 <1641871726.fshx7g5r92.astroid@bobo.none>
 <ca351bfc-3507-11ad-73f1-79ca772b55fd@csgroup.eu>
 <8a24ef1d-1c93-416d-cfbe-e63aacfb25cc@huawei.com>
In-Reply-To: <8a24ef1d-1c93-416d-cfbe-e63aacfb25cc@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f007504-e6e1-4fe8-08ab-08d9dbe6e866
x-ms-traffictypediagnostic: PR2P264MB0350:EE_
x-microsoft-antispam-prvs: <PR2P264MB035054B0F720A8B36B596C66ED5A9@PR2P264MB0350.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yd2jtCit5X8emuCb4HVhdFMzFGT8QsfHJMtGssfsnrDJM1YhnQdmE9fLT3ov8GrmmLq37BNt2tPOtqSZXShmc5WUIqudfPatO4X1yYfVTYOOdtMGZeu9Dh5OL9WzFD606vqX46I86FrLICYkIvUpe0x696/1hgI4fhbFrT2jqw2YpPDbNyp8VWVEH4hBcpyckriEg/i7ae+PoCHhu9HIRw87G/su5sfCynwAK9B9P5Kl/n6DeDXphT3O8phzJJbBFP5X9zifXIcA/xJm9vMZjqKgYdF6MsDOaAAQNsWhRWsND1cYToK5Tk7pdERS5vep0m4bkG7YX1qEZDZDEBulXysE8VD4JEA4O1J+T/KlAfE90uyn4YlaeXCrCX3pF5V2C2aSmfiQDGah+RylQTpeko80+31pOghNEK7PoylzjSUluLA9zK9NS8i74s3X8Qr3J2MqGPRGuTXCZ7uBCK09tHsCWzJOJJtODRoLZHodcCQ/QZqB+rZ9qgY7ymC2VQRWgtLwqLeALnf66J76XVL5AqXD/VheY2filfdEatKW+n9QHa6s/M7FymgW+fNG6O91pqW4pWvWmUOYSY0DhcmIsKLEGdseZEgytSbeF3xkVtEBpk+Auxn5Oe3RsDC7+rJ7/CpTZ3+mtkGbRNL0BluviLMlFwkOBL1mps9PXTbXxzWysmOIpdWSPWYzJUlrCQV9lPkVeY0mVYDYYlos1CnwqjuDYXrwsNRWkJggZt6rEvk3t6a/e7sFia80hMUYLHe8Clktl+FAPLXEBC7B7At38608v030Vm1oSResOYa1G7k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(91956017)(76116006)(44832011)(6506007)(53546011)(26005)(921005)(110136005)(186003)(66946007)(316002)(5660300002)(508600001)(2616005)(31696002)(36756003)(66476007)(66556008)(64756008)(66446008)(122000001)(2906002)(7416002)(6512007)(38100700002)(6486002)(83380400001)(66574015)(8936002)(71200400001)(8676002)(86362001)(31686004)(38070700005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnphWU9NQUpBZU9XTnBTeGZGTHpiZkM4MDUxVFJhemlteWFVVjQzWlpPWWdv?=
 =?utf-8?B?T1MrM3QzQlBLcmFsQkdYNDVVeUZZMGdvMWZNZStGYXZZZll5Zy9ZbTYyaFpy?=
 =?utf-8?B?RFpXQllyeTdPN0FsbDhOZmhLeHBaQ3pRU3NmSXp1SlROWThSVXB3b3hQS1Jl?=
 =?utf-8?B?cWNERkh4Mk0yYXU5a2JFVWZlUTlTMGFIQUFLWHR4eFBnWk1WdVQ0b2U0alFq?=
 =?utf-8?B?QUk1cXkvZmFOMFhOQmlxbktHbUNUbXFEbktsSGw5b2NJRlBjb1IvNTlqdVI2?=
 =?utf-8?B?UmdKRlB0K083R2k0aU1haWNqVjl2anZnNVp4RXQwSzRWVWpObmVqRmpVUFRz?=
 =?utf-8?B?Ty8zcDVvQ1pwUVM4M0ZwdEhHdjM5dkl3TDVpeW1uS3gzRUlDUVg4em9Ja05p?=
 =?utf-8?B?RnJ6NUljZTRyaHFGMzZRRHdIYzh1WnlsaVMrNE5CNkxvTlhmalZWS25uZVQ5?=
 =?utf-8?B?ZlQ5eTIwdHdYTzFrelZZTHBmcmVrcE9OTmNXYkludjZvK01nOStPQU1RYlJL?=
 =?utf-8?B?N0R0YkNNNURCR2VHVmM1eGgzeUJia21abnh5VFlaNzN0SUVzeDJzZWFRSjRt?=
 =?utf-8?B?aUZJSy9Rc3l3WGxYbHpYMCtiQXJvVFRMdmd2cXFZQ3ZOalZuUVN6VkFyQmV2?=
 =?utf-8?B?Ym9LQmQzNllsbkZEZFh3M3BzaGdieVVpSnJiekxVNTVnVURKcG5Gb2RRT21W?=
 =?utf-8?B?eUk1WWlPTHV3NHdWQXN0SUovRFhKdU81aWpjNzMxYnBPQnFwbGJhazcvZkd3?=
 =?utf-8?B?M2N4UnBNbnJjYS8xMkE4TytIbGc5V25FRDBXbHd3aGVWUzIvblpoWWlPYmN5?=
 =?utf-8?B?dnZPZmFyZlFZbllkV0Q1YStOT1hLMWxMNGUyOXhhTGtGMVkraGNiVDBoNERR?=
 =?utf-8?B?aHVoaDZDQzNJZHFub2Rzb2tqdFhndC8wbitlOHR3a3VlN09qckFrNmNXS20y?=
 =?utf-8?B?N014U3NsMjJPQmx5cGo3UjdHdjVKWHlBOWFrTzk0QkdYOTNUaVViaXhPV2Uy?=
 =?utf-8?B?eFpaS0Y3QnFsUnRla2p2L2pvNDg4SnN1VEY4L3RTM1pCUmlLcFVLMlNNL29K?=
 =?utf-8?B?VkU5MzI5NlNOM3lUNEVPTEpETHdXZFAxWTNtL1I5Ny9TbnRPTkxvYlc1bHhl?=
 =?utf-8?B?Ly92TjlaRTBzVnN5N2RESVMvZmVsaVZKeklCbW82aGNhZFBDNThmNWpuV3J2?=
 =?utf-8?B?ZlZhTjZxeXZWa09yaUlvcTVjUUJGWWJJcXdPK3hHd3V1KzlhaUNIaUhpNm5X?=
 =?utf-8?B?Smw1R3hxRWplUTk4eTlYTThSR0g2Tm4yRUNEem9CUUZuSG1DY3dmU0F0cEdp?=
 =?utf-8?B?S3dmMGZ5UCtuQ3hiNUE2enJmcis0WVVvaXFNUExiMmQrbFc1dG5JVTljSTRt?=
 =?utf-8?B?T01JcURnUHVWaGFnSDdaUmo2V2ordzdQSVNqeXpoeFpsNFlEZWVsTXFKRjZ1?=
 =?utf-8?B?Y2hlVHljOGd4QWdTNU1EZStRWWsydXVLSWxEU1ZJZTZuV2xTUW5sdVppSDJX?=
 =?utf-8?B?SzFtVlVvSXRybXFyYjlzNTBjZXVuSWNFMmJIQ1lWcHRPVkZwbFBSVWJMdWNF?=
 =?utf-8?B?cVg2ajYvaTZ3aFZ6V2lLOG5mWnc5WnFEZm9VSmFBV1FRYlp0VXgzbTJVYUxH?=
 =?utf-8?B?Yk1MWUlzck1qMGtYYStBTVpQNVI0M0ZKWUMyUEtBL2FId3ZxblNXZW0yczRk?=
 =?utf-8?B?amhmdXNjWVVlM2lveFhiVkcyOG9HZVVUUXNRVEFOUnVtQ3pySHFSbFNiS3V2?=
 =?utf-8?B?VVlBS3ZBM2dCQnhQQnZYYzQxdnpPMzBqa2RNcmFiK2VlNksydWhNVjZIQ2V0?=
 =?utf-8?B?QW5xUXVkSzNyOGVQRElTMmFGRUNCeEFRYTIyLzNOL2FQOEZrTzZXME1HbW9V?=
 =?utf-8?B?M0RnZTIzbHNIajlHYml0aTdKUjZQc1pQaHREWGtmaHFqNjhadkFvQ3RQUlpo?=
 =?utf-8?B?ai9nVkdobHJTYjhRM1JXN1J3b2VqMnB2eGlSTUUyTzRBZFpkbFZRN1Y5Q29Z?=
 =?utf-8?B?RUphcGVjTmZOQWtGU0NOM1ZEbVpjODZDQXN0WHJoRzI5M3R1TXpYWFV1ODJs?=
 =?utf-8?B?azhSWE5IeWJ0QVRLL2VrbENRMlBiTzM4TWRScW1FWllqY2xSZ09nTWRWSzVw?=
 =?utf-8?B?UWdPcFAvUUpGVmZrVW5DTnh4QWh2L0NtTTUrMnlDSWJYTFhCamc2SGMyWUJw?=
 =?utf-8?B?S0x4MXNMbEd1SW5XRFZVSG04eHlRZnZTcFNzRldnbjdPQVFDSktHVExhZXkx?=
 =?utf-8?Q?rlEvV17he+tzyTy5ZDcZJHeOGwcstluNWD7zBLcG9I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC0857908DE3AF4A8D03E06CAF2E5119@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f007504-e6e1-4fe8-08ab-08d9dbe6e866
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 07:31:43.7129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NLu6aFTc1cfjDPvr9Ng8IuQIFrL17i2djPBHQHmtsfpGO8iEIizi68Z6O3kMQyeiHMOyzYxtdInaF1izE6Q4Pi61djmp0fFdbD3VwuamWeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2P264MB0350
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE5LzAxLzIwMjIgw6AgMDI6MTUsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6DQo+IA0K
PiBPbiAyMDIyLzEvMTEgMTQ6MDQsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pg0KPj4gTGUg
MTEvMDEvMjAyMiDDoCAwNTozNywgTmljaG9sYXMgUGlnZ2luIGEgw6ljcml0wqA6DQo+Pj4gRXhj
ZXJwdHMgZnJvbSBLZWZlbmcgV2FuZydzIG1lc3NhZ2Ugb2YgSmFudWFyeSA4LCAyMDIyIDk6NTgg
cG06DQo+Pj4+IEhpIFBQQyBtYWludGFpbmVyc++8jCBwaW5nLi4NCj4+PiBIbW0uIEkgbWlnaHQg
aGF2ZSBjb25mdXNlZCBteXNlbGYgYWJvdXQgdGhpcy4gSSdtIGdvaW5nIGJhY2sgYW5kDQo+Pj4g
dHJ5aW5nIHRvIHdvcmsgb3V0IHdoYXQgSSB3YXMgdGhpbmtpbmcgd2hlbiBJIHN1Z2dlc3RlZCBp
dC4gVGhpcw0KPj4+IHdvcmtzIG9uIDY0ZSBiZWNhdXNlIHZtYWxsb2Mgc3BhY2UgaXMgYmVsb3cg
dGhlIGtlcm5lbCBsaW5lYXIgbWFwLA0KPj4+IHJpZ2h0Pw0KPj4+DQo+Pj4gT24gNjRzIGl0IGlz
IHRoZSBvdGhlciB3YXkgYXJvdW5kIGFuZCBpdCBpcyBzdGlsbCBwb3NzaWJsZSB0byBlbmFibGUN
Cj4+PiBmbGF0bWVtIG9uIDY0cy4gQWx0b3VnaCB3ZSBtaWdodCBqdXN0IG5vdCBoaXQgdGhlIHBy
b2JsZW0gdGhlcmUgYmVjYXVzZQ0KPj4+IF9fcGEoKSB3aWxsIG5vdCBtYXNrIGF3YXkgdGhlIHZt
YWxsb2Mgb2Zmc2V0IGZvciA2NHMgc28gaXQgd2lsbCBzdGlsbA0KPj4+IHJldHVybiBzb21ldGhp
bmcgdGhhdCdzIG91dHNpZGUgdGhlIHBmbl92YWxpZCByYW5nZSBmb3IgZmxhdG1lbS4gVGhhdCdz
DQo+Pj4gdmVyeSBzdWJ0bGUgdGhvdWdoLg0KPj4gVGhhdCdzIHRoZSB3YXkgaXQgd29ya3Mgb24g
UFBDMzIgYXQgbGVhc3QsIHNvIGZvciBtZSBpdCdzIG5vdCBjaG9ja2luZw0KPj4gdG8gaGF2ZSBp
dCB3b3JrIHRoZSBzYW1lIHdheSBvbiBQUEM2NHMuDQo+Pg0KPj4gVGhlIG1haW4gaXNzdWUgaGVy
ZSBpcyB0aGUgd2F5IF9fcGEoKSB3b3Jrcy4gT24gUFBDMzIgX19wYSA9IHZhIC0NCj4+IFBBR0Vf
T0ZGU0VULCBzbyBpdCB3b3JrcyBjb3JyZWN0bHkgZm9yIGFueSBhZGRyZXNzLg0KPj4gT24gUFBD
NjQsIF9fcGEoKSB3b3JrcyBieSBtYXNraW5nIG91dCB0aGUgMiB0b3AgYml0cyBpbnN0ZWFkIG9m
DQo+PiBzdWJzdHJhY3RpbmcgUEFHRV9PRkZTRVQsIHNvIHRoZSB0ZXN0IG11c3QgYWRkIGEgdmVy
aWZpY2F0aW9uIHRoYXQgd2UNCj4+IHJlYWxseSBoYXZlIHRoZSAyIHRvcCBiaXRzIHNldCBhdCBm
aXJzdC4gVGhpcyBpcyB3aGF0IChhZGRyID49DQo+PiBQQUdFX09GRlNFVCkgZG9lcy4gT25jZSB0
aGlzIGZpcnN0IHRlc3QgaXMgZG9uZSwgd2UgY2FuIHBlcmZlY3RseSByZWx5DQo+PiBvbiBwZm5f
dmFsaWQoKSBqdXN0IGxpa2UgUFBDMzIsIEkgc2VlIGFic29sdXRlbHkgbm8gcG9pbnQgaW4gYW4N
Cj4+IGFkZGl0aW9ubmFsIHRlc3QgY2hlY2tpbmcgdGhlIGFkZHIgaXMgYmVsb3cgS0VSTl9WSVJU
X1NUQVJULg0KPiANCj4gDQo+IEhpIENocmlzdG9waGUgYW5kIE5pY2hvbGFz77yMIGZvciBwcGMz
Mu+8jCBJIHRoaW5rIHdlIG5lZWQgY2hlY2sgdGhlIHVwcGVyIA0KPiBsaW1pdCwNCg0KV2h5ID8g
SGF2ZSB5b3UgZXhwZXJpbWVudGVkIGFueSBwcm9ibGVtIGF0IGFsbCBvbiBQUEMzMiB3aXRoIHRo
ZSB3YXkgaXQgDQppcyBkb25lIGF0IHRoZSBtb21lbnQgPw0KDQpJIGRvbid0IHRoaW5rIHdlIGhh
dmUgdG8gY2hhbmdlIFBQQzMyIGF0IGFsbCB1bmxlc3Mgd2UgaGF2ZSBhIHJlYWwgDQpyZWFzb24g
dG8gZG8gaXQuDQoNCj4gDQo+IGVnLMKgIGFkZHIgPj0gUEFHRV9PRkZTRVQgJiYgYWRkciA8IGhp
Z2hfbWVtb3J5DQoNCklzbid0IGl0IGV4YWN0bHkgd2hhdCBwZm5fdmFsaWQoKSBhbHJlYWR5IGRv
IHRvZGF5ID8NCldoeSBjaGFuZ2UgdGhhdCBhdCBhbGwgPw0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+
IGFyY2gvcG93ZXJwYy9tbS9tZW0uYzrCoCBoaWdoX21lbW9yeSA9ICh2b2lkICopIF9fdmEobWF4
X2xvd19wZm4gKiANCj4gUEFHRV9TSVpFKTsNCj4gDQo+IGZvciBwcGMzMiBtYXhfbG93X3BmbiBp
cyB0aGUgdXBwZXIgbG93IG1lbW9yeSBwZm4swqAgYW5kIEZvciBwcGM2NCwgDQo+IGhpZ2hfbWVt
b3J5IGlzDQo+IA0KPiB0aGUgbWF4IG1lbW9yeSBwZm4sIGl0IGxvb2tzIGdvb2QgdG9vLCBjb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZywgaWYgdGhlIA0KPiBhYm92ZSBjaGVjaw0KPiANCj4gaXMgb2ss
IEkgd2lsbCBzZW5kIGEgbmV3IHYzLMKgIHRoYW5rcy4NCj4gDQo+IA0KPiANCj4gDQo+Pg0KPj4N
Cj4+PiBUaGUgY2hlY2tzIGFkZGVkIHRvIF9fcGEgYWN0dWFsbHkgZG9uJ3QgcHJldmVudCB2bWFs
bG9jIG1lbW9yeSBmcm9tDQo+Pj4gYmVpbmcgcGFzc2VkIHRvIGl0IGVpdGhlciBvbiA2NHMsIG9u
bHkgYSBtb3JlIGJhc2ljIHRlc3QuDQo+PiBUaGF0J3MgY29ycmVjdC4gSXQgaXMgdGhlIHJvbGUg
b2YgcGZuX3ZhbGlkKCkgdG8gY2hlY2sgdGhhdC4NCj4+DQo+PiBDaHJpc3RvcGhlDQo+Pg0KPj4+
IEkgdGhpbmsgNjRzIHdhbnRzIChhZGRyID49IFBBR0VfT0ZGU0VUICYmIGFkZHIgPCBLRVJOX1ZJ
UlRfU1RBUlQpIGFzDQo+Pj4gdGhlIGNvbmRpdGlvbi7CoCBDb3VsZCBwb3NzaWJseSBhZGQgdGhh
dCBjaGVjayB0byBfX3BhIGFzIHdlbGwgdG8NCj4+PiBjYXRjaCB2bWFsbG9jIGFkZHJlc3Nlcy4N
Cj4+Pg0KPj4+IFRoYW5rcywNCj4+PiBOaWNrDQo+Pj4NCj4+Pg==
