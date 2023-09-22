Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 782257AACC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:37:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mxyqnDGb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQcG25C8z3fg4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mxyqnDGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsQ2H6JJNz3hmp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:11:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LquQb36gPRREPmB1QmzyX0exNQGBXKmf2z5fK+SRqwv+lfv1cz+0nfQR0MkSEZrzfiKjCXk6bBxO+Xc+Z9ovuSgS1gHQ1g3iRMnFP7/v0ur03YA9IATI04oYGuPkoJ2GTzGOltso4arZOyyjkfU37pFCNnFZVrsZzj8bL4UAvLLksstUpPfCGaounhPILhvIDsrAem5mayfVnjJ7YU/wi1+xILjAz9oQ6K+vNpxTL3igIuanBLhsjdFirugSADvfuTggjktkbcEv5UoSEkbjXczzzH1eIcibx8v21vd0ltf7Nm6PFmqeHxb0WQjzqdT0iYWo/GMVx86uEJ4Gh5FzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZNhg37pZ8SouDZrqNWFfxAsMtcLeUPjv5sRaefa64Y=;
 b=B3YS6WYmm+oVzjc338u8IDCzkWBQhdgD2uyq5qu6ibEYcJvl5VflEbEL8e5h80ks5TLtOkTC4sGWz8GlG6awNe5Whl6EblQXUvZowbiIN42ZF1+eidMs3p65l6qA2IRRDdnoT7LqRSSNDfRouB7yH2QKr8L6uGryTHGH2fFdIlCOtew0bpL/vkkzsUgUSJk0zl0N6HNHqA5mEgjD2sLURxQyRxAoBJi6Mc41c1UwcghsRCwUHM08HVPc3u7QasBehctqg5BFskesHQKb/5O3xcU3rMGooch7lZFBOdc+df+oXxtT7wteyI3OF9hSMU6PW6HdUlUTuF/XLVHv0gOb8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZNhg37pZ8SouDZrqNWFfxAsMtcLeUPjv5sRaefa64Y=;
 b=mxyqnDGboe0bH38cySCdKrgjURc6GIFXRoX38UhW5d9awa/+0XMya+OH/uEaq+yFx2w/Sv4KrFhH0JSLeKwHKV1mdC4+niZp5xhfLpjMzTmiSb6MF8/6B+hDp8DK8FFF/8YzqZhpu2Pje6V6fGOPCjMnXr+2sIZmrMiaDj5PPOzzbE5M2piDWb/y5jFlEpdtFyTwm6u5j2jJuDLfksSB7/6B1CBID5ZinOm0fwa3AEo4L2otgOop8vtNMF7Ts8NuPV9v4b7iXA9ArWDE52PRqt4wBhUKRtQ6oDFvxBniwHDcV8cd6KCaUQfBxp+qlk5Z78a93LolpUZfFaacVjRt2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1874.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.22; Fri, 22 Sep
 2023 08:10:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:10:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
	<deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
	<gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, "David S. Miller"
	<davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>, Mike Kravetz
	<mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, SeongJae Park
	<sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Uladzislau Rezki
	<urezki@gmail.com>, Christoph Hellwig <hch@infradead.org>, Lorenzo Stoakes
	<lstoakes@gmail.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Peter Xu
	<peterx@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, Qi Zheng
	<zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Thread-Topic: [PATCH v1 2/8] powerpc: hugetlb: Convert set_huge_pte_at() to
 take vma
Thread-Index: AQHZ7KeOgKWYHqkhmkaEjar9bQgRYLAmapKAgAAKKYCAAAqCAA==
Date: Fri, 22 Sep 2023 08:10:43 +0000
Message-ID: <5ee382da-0ed0-9fb1-7640-35ef77c195fc@csgroup.eu>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
 <597e7496-ef99-4505-88ee-91701af02835@arm.com>
In-Reply-To: <597e7496-ef99-4505-88ee-91701af02835@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1874:EE_
x-ms-office365-filtering-correlation-id: 8c3ed740-7338-4b4e-74ea-08dbbb436acc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8vLxc1yCni7IK8KDxglsXCG7Sp57uGllYy9TA/f2MXTIIdkIjLXOZH0HtDkPIHANiyJ3ljTk+JrCM6QLk4O7vRdc7uMEHi43t5zBSBuhezRnjb4pH8B2FM29KJLDsbfDVwhtM+TilSX7slquBY159teKXn5e1BjCsYm0EWjBHoZNQYCKLgHsQvM0i5wi5fMuEns+hhC2fdmw/I/c8306eTfoLyLI/8GmJg7BCpNmL9nHY2XBleS4Hl2Fn0qPOIUG4s8k2RzAKfOMD8ph0RARNE2+jjJZZvydVuD5Fi33m0lBKdJo9njdy2+UsPc3cR962u2hvv2jtwEJpG507QXX1Q61dU5a/XB52hk0Z+UQMBMng8BfFlJ4flx6KRmOHZw2RdJNpJRp+Xr1R44QBNZvM6WsvAGsz8JnwfIZwUtp9pojgBF0JsRMKxOVixCD/1UFGWs2NBcawJNvrc+aF5BubG8uaHzguvK90Gpm6tOpAT1htknWTWfAwdZPASLiIvb+LRr856Cqhx7RvaL60ZU3y4qUWwrcjmndvs5beIYvk4i4yV7rbjnQ9xOrhNRXt1NO5ZzJn/yo3Ugl1KcTf/SVyDPzJRdCP32LRcgFevSH69XFXALmY4p0i1TyKBDhYOMZ+ezHrpwGVN7Hqo+U1xH+ENtTXToNs+wxcm9kXRVzDDztUe1+e9xMOH/Gm41b9i1b7GTYK49rSxR3znyJTeQoHMJnDSv8dpnco/riVXf2xHc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(396003)(346002)(136003)(366004)(186009)(451199024)(1800799009)(31686004)(6506007)(71200400001)(53546011)(36756003)(38100700002)(31696002)(122000001)(921005)(86362001)(2616005)(26005)(66574015)(8936002)(2906002)(7416002)(7406005)(478600001)(6512007)(6486002)(83380400001)(5660300002)(91956017)(8676002)(110136005)(4326008)(41300700001)(44832011)(38070700005)(76116006)(54906003)(66556008)(66446008)(64756008)(316002)(66946007)(66476007)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RU83UkcrQTFBK2JBWktVaTlzM3hIamk5U3lwQ2tHRXN4WUZTUmtpUElvUGZ6?=
 =?utf-8?B?bHpxV1NQVEpOdmY0U3Z4cjQ0RndiSlRYVjZpK2VvY3FneTJWQjFoTzF1aXJ4?=
 =?utf-8?B?aE55VVRBZHJNd3IxUHJjVTdkbU9XQ0dxQWdIcHJnbWM0SUdmdDZBT1ZWb3dp?=
 =?utf-8?B?dkUyRUFkeHNPQ1VoOEVyRzJuSWQ3SUhPbTBkSXF0UDFhZEEwNWprZCtUTGs0?=
 =?utf-8?B?MUExWE9HRmVQZFVkWVdQajRjNHltUmlheExQUFdSNzlrbUlrVUcvUncwVzVH?=
 =?utf-8?B?cGVqSDFFUmhROVo1aE5DYlVMa3dJMUFhVnlvMkpZY1d5dlNoVXFsTEpJNVhS?=
 =?utf-8?B?ektFOXpIZFFUak85ajNYZmtjMk5tcWxBbk9aZXlEcUY0TStEZDYrYkQ3c0g5?=
 =?utf-8?B?WU9uMS80WEp0UlNabnJsOENyc3E3QUhWY1NnYWROdW5xdS8xRkdFUUhKZytB?=
 =?utf-8?B?MWc1TmZZR0NCQnNTeE5FZHVvWmZscjhhZFV4anlRVlhJNm5KYjNQdTZpakth?=
 =?utf-8?B?M2YvWU5mSmRpa1dGK1pDV041SzFnMEMzTTl5ck9ML0YzM2VXRU5VQ1NlRUhv?=
 =?utf-8?B?eFJjb3JWL0xHcFlDd1RrdEIySGFIZFRrT1pYQTBlVU83OC9RRWtZRHZ3V3E0?=
 =?utf-8?B?eWlaZU1EM2FVbVhBRUlJalpmTHE3Y0lIMnVrRm5tR2FEYUJFOXZiaEs2OEo2?=
 =?utf-8?B?OEx3MEtkYzAxQXJsNzBSbXBqUDQySUZyWjJDYmRNZGp2MEVDUlp3UENwMUFZ?=
 =?utf-8?B?eXFIcDNmVVN5UmIvdm1HZi9mOW1EdWpjZDdzTStWUHVYd3hldXRsM3V3SEEr?=
 =?utf-8?B?ekdtem43WWFnL0h1OExJVmdYaExxTkdQd1hGM1NSMjNvQSs3NlhQRXhLMHNK?=
 =?utf-8?B?bTJCaTM2aERDUDAzYU5PUE41dTMwZlorUE5IY3ZXdTZFV3A2bkl6R2hRbkVG?=
 =?utf-8?B?YlhRb3VEME16a3R5TkNQckFmQVFHLzMxRTB2M0dvdUlIeVcxZWdSb0I3NEZr?=
 =?utf-8?B?Y2dVb1NHcmRNeGJoS1lVMGZvY1laMFhiMVRHN3o3R0RZSVpGNjBlYUFpdTAw?=
 =?utf-8?B?M1ZndzczbFFDNFp4dzFIM2lQYzJhNFo2SlFmeWVXTTJldGQycko4bXpFcnJQ?=
 =?utf-8?B?R2dhcm5ZUGJYRDM5ZUQ2Q3NiYy9PUGpSNWRhWnJiQXc3MzlDY1pBT3l4YitS?=
 =?utf-8?B?dnNSLzZwck1SajkxTkZxeGpnQ1hOWDFKMVI3NDZyWENYdnRpd3d2RFRyVVR5?=
 =?utf-8?B?dVhvNUtIQzIvUlF1N052MFRuODRraFdQRW1Od2xVRkpDREVXVTByc3c4VzRu?=
 =?utf-8?B?QmV5WGhTSmRLV001S3J6bXd6a3h6R3BUSUZvU1d0UzJuazB5UHAxazdsck52?=
 =?utf-8?B?NFJoN1NJRnBBczlWcHFDTjNBeDRCOUJ4WXVFT2JITWk3b3BoV0RkZGtiUzNF?=
 =?utf-8?B?eXZ6Wmw2SGd6WkF1cEJGR0YxNUFZc0tjVlltYU9INitLeW5adVFoZDE5TWRX?=
 =?utf-8?B?K2hyMDlqSkc5Uk4vTlU3L1ZBTEVzMXFMb2NJY0NNa05nNklJQWkzTUljMW9Z?=
 =?utf-8?B?RWxpbWxTYkVEQzBPQTRBOEFabmFLVHF6VmN2WDJJV0hpRUJ6WVVZZ2VEaGxh?=
 =?utf-8?B?YTN1YmxQMHM2NGU3UDlSb1ZZK2loTDBwdWdrakZTOFJ3K1N3SzRzbm1sM1dt?=
 =?utf-8?B?S0dhRWRTSzBwSEJZSkNoY2k1VWFSZ2crV1NVYmZtZW5obDNPcUFwYUc4TVNj?=
 =?utf-8?B?cjUwcUNYUnNEYUZxTEg3Z1c4bFpqOHZzWHdXakJpWUtiWkFISHhLQlZPNnRv?=
 =?utf-8?B?eFNXS1oxaVR6anBJN0k1UHhEUXlSamxiSHN2azBtYko0ZUZTMFJCQ3BjRFp1?=
 =?utf-8?B?UWY0cHF3UXVJNmY3VXg1MjB5TkxBdGNHa1ZSaXowd3ZuYTFyK1dvNVB3RWF2?=
 =?utf-8?B?cnhOVFRkTXA3YzZsZWZHQVJhajhzMENZZGw3OEQ3U2ZMbkZ5Vm5FaHJYRnJQ?=
 =?utf-8?B?eXBwL1M0SXZBalEzR29KR0tzbG55dmF4dGxPN1VjTkRBL3FnbjhydjA3YzI2?=
 =?utf-8?B?d3dTeDhiN1c0SklUTEdVb3VNT2k0ZDJKQktQc2hrTllVNnZMUUw0SFVmc0tr?=
 =?utf-8?B?UjV3bXF4UE81VE9OVWNlTVVvdkxpM1JJb08rTXBnM3IwZ3Yxc3dmTG1LcXdG?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A690594E8940A40B587C2F346B2CB35@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3ed740-7338-4b4e-74ea-08dbbb436acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 08:10:43.1593
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +2ZyvIBKUcQO76yxecIZqm7jeYcEfqYIAaKqKZbrDX2zVKf7aVZFPGXwkaezCItlyxQ1DfDih0japipCzXTgF2gICLoj2Jam0a5upQgWxPA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1874
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIyLzA5LzIwMjMgw6AgMDk6MzMsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBP
biAyMi8wOS8yMDIzIDA3OjU2LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+PiBM
ZSAyMS8wOS8yMDIzIMOgIDE4OjIwLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTCoDoNCj4+PiBJbiBv
cmRlciB0byBmaXggYSBidWcsIGFybTY0IG5lZWRzIGFjY2VzcyB0byB0aGUgdm1hIGluc2lkZSBp
dCdzDQo+Pj4gaW1wbGVtZW50YXRpb24gb2Ygc2V0X2h1Z2VfcHRlX2F0KCkuIFByb3ZpZGUgZm9y
IHRoaXMgYnkgY29udmVydGluZyB0aGUNCj4+PiBtbSBwYXJhbWV0ZXIgdG8gYmUgYSB2bWEuIEFu
eSBpbXBsZW1lbnRhdGlvbnMgdGhhdCByZXF1aXJlIHRoZSBtbSBjYW4NCj4+PiBhY2Nlc3MgaXQg
dmlhIHZtYS0+dm1fbW0uDQo+Pj4NCj4+PiBUaGlzIGNvbW1pdCBtYWtlcyB0aGUgcmVxdWlyZWQg
cG93ZXJwYyBtb2RpZmljYXRpb25zLiBTZXBhcmF0ZSBjb21taXRzDQo+Pj4gdXBkYXRlIHRoZSBv
dGhlciBhcmNoZXMgYW5kIGNvcmUgY29kZSwgYmVmb3JlIHRoZSBhY3R1YWwgYnVnIGlzIGZpeGVk
IGluDQo+Pj4gYXJtNjQuDQo+Pj4NCj4+PiBObyBiZWhhdmlvcmFsIGNoYW5nZXMgaW50ZW5kZWQu
DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBSeWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0u
Y29tPg0KPj4+IC0tLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIv
aHVnZXRsYi04eHguaCB8IDMgKystDQo+Pj4gICAgYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2h1
Z2V0bGJwYWdlLmMgICAgICAgICAgIHwgMiArLQ0KPj4+ICAgIGFyY2gvcG93ZXJwYy9tbS9ib29r
M3M2NC9yYWRpeF9odWdldGxicGFnZS5jICAgICB8IDIgKy0NCj4+PiAgICBhcmNoL3Bvd2VycGMv
bW0vbm9oYXNoLzh4eC5jICAgICAgICAgICAgICAgICAgICAgfCAyICstDQo+Pj4gICAgYXJjaC9w
b3dlcnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNyArKysrKystDQo+
Pj4gICAgNSBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0K
Pj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIv
aHVnZXRsYi04eHguaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRs
Yi04eHguaA0KPj4+IGluZGV4IGRlMDkyYjA0ZWUxYS4uZmZmOGNkNzI2YmM3IDEwMDY0NA0KPj4+
IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHguaA0K
Pj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvaHVnZXRsYi04eHgu
aA0KPj4+IEBAIC00Niw3ICs0Niw4IEBAIHN0YXRpYyBpbmxpbmUgaW50IGNoZWNrX2FuZF9nZXRf
aHVnZV9wc2l6ZShpbnQgc2hpZnQpDQo+Pj4gICAgfQ0KPj4+ICAgIA0KPj4+ICAgICNkZWZpbmUg
X19IQVZFX0FSQ0hfSFVHRV9TRVRfSFVHRV9QVEVfQVQNCj4+PiAtdm9pZCBzZXRfaHVnZV9wdGVf
YXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAs
IHB0ZV90IHB0ZSk7DQo+Pj4gK3ZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpOw0K
Pj4+ICt2b2lkIF9fc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25l
ZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGUpOw0KPj4NCj4+IERvbid0IGFkZCB0
aGUgYnVyZGVuIG9mIGFuIGFkZGl0aW9uYWwgZnVuY3Rpb24sIHNlZSBiZWxvdw0KPj4NCj4+PiAg
ICANCj4+PiAgICAjZGVmaW5lIF9fSEFWRV9BUkNIX0hVR0VfUFRFX0NMRUFSDQo+Pj4gICAgc3Rh
dGljIGlubGluZSB2b2lkIGh1Z2VfcHRlX2NsZWFyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNp
Z25lZCBsb25nIGFkZHIsDQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2
NC9odWdldGxicGFnZS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2h1Z2V0bGJwYWdlLmMN
Cj4+PiBpbmRleCAzYmMwZWIyMWIyYTAuLmFlN2ZkN2M5MGViOCAxMDA2NDQNCj4+PiAtLS0gYS9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaHVnZXRsYnBhZ2UuYw0KPj4+ICsrKyBiL2FyY2gvcG93
ZXJwYy9tbS9ib29rM3M2NC9odWdldGxicGFnZS5jDQo+Pj4gQEAgLTE0Nyw3ICsxNDcsNyBAQCB2
b2lkIGh1Z2VfcHRlcF9tb2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsIHVuc2lnbmVkIGxvbmcgYWRkcg0KPj4+ICAgIAlpZiAocmFkaXhfZW5hYmxlZCgpKQ0KPj4+
ICAgIAkJcmV0dXJuIHJhZGl4X19odWdlX3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0KHZtYSwgYWRk
ciwgcHRlcCwNCj4+PiAgICAJCQkJCQkJICAgb2xkX3B0ZSwgcHRlKTsNCj4+PiAtCXNldF9odWdl
X3B0ZV9hdCh2bWEtPnZtX21tLCBhZGRyLCBwdGVwLCBwdGUpOw0KPj4+ICsJc2V0X2h1Z2VfcHRl
X2F0KHZtYSwgYWRkciwgcHRlcCwgcHRlKTsNCj4+PiAgICB9DQo+Pj4gICAgDQo+Pj4gICAgdm9p
ZCBfX2luaXQgaHVnZXRsYnBhZ2VfaW5pdF9kZWZhdWx0c2l6ZSh2b2lkKQ0KPj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcmFkaXhfaHVnZXRsYnBhZ2UuYyBiL2FyY2gv
cG93ZXJwYy9tbS9ib29rM3M2NC9yYWRpeF9odWdldGxicGFnZS5jDQo+Pj4gaW5kZXggMTcwNzVj
NzhkNGJjLi43Y2Q0MGEzMzRjM2EgMTAwNjQ0DQo+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jv
b2szczY0L3JhZGl4X2h1Z2V0bGJwYWdlLmMNCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9v
azNzNjQvcmFkaXhfaHVnZXRsYnBhZ2UuYw0KPj4+IEBAIC01OCw1ICs1OCw1IEBAIHZvaWQgcmFk
aXhfX2h1Z2VfcHRlcF9tb2RpZnlfcHJvdF9jb21taXQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsDQo+Pj4gICAgCSAgICBhdG9taWNfcmVhZCgmbW0tPmNvbnRleHQuY29wcm9zKSA+IDApDQo+
Pj4gICAgCQlyYWRpeF9fZmx1c2hfaHVnZXRsYl9wYWdlKHZtYSwgYWRkcik7DQo+Pj4gICAgDQo+
Pj4gLQlzZXRfaHVnZV9wdGVfYXQodm1hLT52bV9tbSwgYWRkciwgcHRlcCwgcHRlKTsNCj4+PiAr
CXNldF9odWdlX3B0ZV9hdCh2bWEsIGFkZHIsIHB0ZXAsIHB0ZSk7DQo+Pj4gICAgfQ0KPj4+IGRp
ZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jIGIvYXJjaC9wb3dlcnBjL21t
L25vaGFzaC84eHguYw0KPj4+IGluZGV4IGRiYmZlODk3NDU1ZC4uNjUwYTdhODQ5NmI2IDEwMDY0
NA0KPj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ub2hhc2gvOHh4LmMNCj4+PiArKysgYi9hcmNo
L3Bvd2VycGMvbW0vbm9oYXNoLzh4eC5jDQo+Pj4gQEAgLTkxLDcgKzkxLDcgQEAgc3RhdGljIGlu
dCBfX3JlZiBfX2Vhcmx5X21hcF9rZXJuZWxfaHVnZXBhZ2UodW5zaWduZWQgbG9uZyB2YSwgcGh5
c19hZGRyX3QgcGEsDQo+Pj4gICAgCWlmIChuZXcgJiYgV0FSTl9PTihwdGVfcHJlc2VudCgqcHRl
cCkgJiYgcGdwcm90X3ZhbChwcm90KSkpDQo+Pj4gICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+PiAg
ICANCj4+PiAtCXNldF9odWdlX3B0ZV9hdCgmaW5pdF9tbSwgdmEsIHB0ZXAsIHB0ZV9ta2h1Z2Uo
cGZuX3B0ZShwYSA+PiBQQUdFX1NISUZULCBwcm90KSkpOw0KPj4+ICsJX19zZXRfaHVnZV9wdGVf
YXQoJmluaXRfbW0sIHZhLCBwdGVwLCBwdGVfbWtodWdlKHBmbl9wdGUocGEgPj4gUEFHRV9TSElG
VCwgcHJvdCkpKTsNCj4+DQo+PiBDYWxsIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggYSBOVUxMIHZt
YSBpbnN0ZWFkLg0KPiANCj4gSSdtIGhhcHB5IHRvIHRha2UgeW91ciBwcm9wb3NlZCBhcHByb2Fj
aCBpZiB0aGF0J3MgeW91ciBwcmVmZXJlbmNlLiBBbm90aGVyDQo+IG9wdGlvbiBpcyB0byB1c2Ug
YSBkdW1teSBWTUEsIGFzIEkgaGF2ZSBkb25lIGluIHRoZSBjb3JlIGNvZGUsIGZvciB0aGUgb25l
IGNhbGwNCj4gc2l0ZSB0aGF0IGNhbGxzIHNldF9odWdlX3B0ZV9hdCgpIHdpdGggaW5pdF9tbToN
Cj4gDQo+IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCB2bWEgPSBUTEJfRkxVU0hfVk1BKCZpbml0X21t
LCAwKTsNCj4gDQo+IFRoaXMgaXMgYW4gZXhpc3RpbmcgbWFjcm8gdGhhdCBjcmVhdGVzIGEgZHVt
bXkgdm1hIHdpdGggdm1hLT52bV9tbSBmaWxsZWQgaW4uDQo+IFRoZW4gSSBwYXNzICZ2bWEgdG8g
dGhlIGZ1bmN0aW9uLg0KDQpJIGRvbid0IGxpa2UgdGhhdCwgSSBwcmVmZXIgdGhlIHNvbHV0aW9u
IEkgcHJvcG9zZWQuIFdlIGFscmVhZHkgaGF2ZSBhIA0KY291cGxlIHBsYWNlcyB3aGVyZSBwb3dl
cnBjIGRvIHRoaW5ncyBiYXNlZCBvbiB3aGV0aGVyIHZtYSBpcyBOVUxMIG9yIG5vdC4NCg0KPiAN
Cj4gT3IgeWV0IGFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGtlZXAgdGhlIG1tIHBhcmFtIGFz
IGlzIGluIHNldF9odWdlX3B0ZV9hdCgpLA0KPiBhbmQgYWRkIGEgc2l6ZSBwYXJhbSB0byB0aGUg
ZnVuY3Rpb24uIEJ1dCB0aGVuIGFsbCBjYWxsIHNpdGVzIGhhdmUgdGhlIGJ1cmRlbiBvZg0KPiBm
aWd1cmluZyBvdXQgdGhlIHNpemUgb2YgdGhlIGh1Z2UgcHRlIChhbHRob3VnaCBJIHRoaW5rIG1v
c3Qga25vdyBhbHJlYWR5KS4NCg0KSW5kZWVkLg0KDQphcmNoX21ha2VfaHVnZV9wdGUoKSB1c2Vk
IHRvIHRha2UgYSB2bWEgdW50aWwgY29tbWl0IDc5YzFjNTk0ZjQ5YSANCigibW0vaHVnZXRsYjog
Y2hhbmdlIHBhcmFtZXRlcnMgb2YgYXJjaF9tYWtlX2h1Z2VfcHRlKCkiKS4NCg0KU2hvdWxkIHdl
IHRyeSBhbmQgaGF2ZSB0aGUgc2FtZSBhcHByb2FjaCA/IE9yIGlzIGl0IGlycmVsZXZhbnQgPw0K
DQpDaHJpc3RvcGhlDQoNCj4gDQo+IFRoYW5rcywNCj4gUnlhbg0KPiANCj4+DQo+Pj4gICAgDQo+
Pj4gICAgCXJldHVybiAwOw0KPj4+ICAgIH0NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L21tL3BndGFibGUuYyBiL2FyY2gvcG93ZXJwYy9tbS9wZ3RhYmxlLmMNCj4+PiBpbmRleCAzZjg2
ZmQyMTc2OTAuLjljYmNiNTYxYTRkOCAxMDA2NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvbW0v
cGd0YWJsZS5jDQo+Pj4gKysrIGIvYXJjaC9wb3dlcnBjL21tL3BndGFibGUuYw0KPj4+IEBAIC0y
ODgsNyArMjg4LDcgQEAgaW50IGh1Z2VfcHRlcF9zZXRfYWNjZXNzX2ZsYWdzKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLA0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAgICAjaWYgZGVmaW5lZChD
T05GSUdfUFBDXzh4eCkNCj4+PiAtdm9pZCBzZXRfaHVnZV9wdGVfYXQoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSkNCj4+PiAr
dm9pZCBfX3NldF9odWdlX3B0ZV9hdChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9u
ZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRlKQ0KPj4NCj4+IEtlZXAgaXQgYXMgc2V0X2h1
Z2VfcHRlX2F0KCkgd2l0aCB2bWEgYXJndW1lbnQuDQo+Pg0KPj4+ICAgIHsNCj4+PiAgICAJcG1k
X3QgKnBtZCA9IHBtZF9vZmYobW0sIGFkZHIpOw0KPj4NCj4+IENoYW5nZSB0bzoNCj4+DQo+PiAJ
cG1kX3QgKnBtZCA9IHZtYSA/IHBtZF9vZmYodm1hLT52bV9tbSwgYWRkcikgOiBwbWRfb2ZmX2so
YWRkcik7DQo+Pg0KPj4+ICAgIAlwdGVfYmFzaWNfdCB2YWw7DQo+Pj4gQEAgLTMxMCw2ICszMTAs
MTEgQEAgdm9pZCBzZXRfaHVnZV9wdGVfYXQoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVk
IGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV8NCj4+PiAgICAJZm9yIChpID0gMDsgaSA8IG51
bTsgaSsrLCBlbnRyeSsrLCB2YWwgKz0gU1pfNEspDQo+Pj4gICAgCQkqZW50cnkgPSB2YWw7DQo+
Pj4gICAgfQ0KPj4+ICsNCj4+PiArdm9pZCBzZXRfaHVnZV9wdGVfYXQoc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3QgKnB0ZXAsIHB0ZV90IHB0ZSkN
Cj4+PiArew0KPj4+ICsJX19zZXRfaHVnZV9wdGVfYXQodm1hLT52bV9tbSwgYWRkciwgcHRlcCwg
cHRlKTsNCj4+PiArfQ0KPj4NCj4+IFJlbW92ZSB0aGlzIGJ1cmRlbi4NCj4+DQo+Pj4gICAgI2Vu
ZGlmDQo+Pj4gICAgI2VuZGlmIC8qIENPTkZJR19IVUdFVExCX1BBR0UgKi8NCj4+PiAgICANCj4+
DQo+Pg0KPj4gQ2hyaXN0b3BoZQ0KPiANCg==
