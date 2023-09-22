Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D487AA93E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 08:45:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m05V/m21;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsN7w5lSwz3clQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 16:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=m05V/m21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::618; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsN6y2JPBz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 16:44:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUbMKIBdbI0/BdKIt6gfl0NTwt2TuiectchwE1BEItgqilVAzMxPKlg7Ef/3x9g9JuUR+qxk3YgT3Flybpf8DPDC6GWj3tUqYweSgFZliMvoaAQ23cHzgEG/ro/nlJViUSSI21Pde+n2KzduJI4oQGFuQrAg+xYrQlChvMwsYZDygXIAd5GDP+i9VPuJ/XFlBOgpnG+o8UWDbhH5B2YSaOTVoijOKPAVTGZw9nyJ7MP6da5hifAAejbfyO2qDrCGjXM8Y5SIUwSnKwVr3jGjVMpMjYv1TvHxHubryyj9dIOxrfiUzWD7+NJj7ahJgOM/VtUvv/RC9yylBZ8N1U8rTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvXH8uweL/JyDr0xtZV0D8eRwZQ2KU1LvOfFDqK3UQc=;
 b=WWpb59FL93rczLt7eW12xCuTYQFTKHDOm9LQpSQNHPJrT/W0e085wd+FVnJ+KIRg8AoD21dhIqdxG5WNkDkr6O4BD95AEpPol6xbX7P1JnUlJQi2qXhi2AOkt4MuPx4pO+EKKpE2TKAKIfM+mYCU7XjzAWvp5kG/dzuRq+FUk6bOmr+d4xXuxzOitvUZBkA3T9TKzLTEoC6QE0kTSus6NhqHkD6ym8kXes2LeE61pNsPag2aw1pW42deDSQVNreLwTijUNqBNMsrupq0RaqAB/SP+jcjsm+JqU7+H2uQgDox3neNYG8j0J5mIPP0hnocXsWokrp8RrLAfsqWi3SMOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvXH8uweL/JyDr0xtZV0D8eRwZQ2KU1LvOfFDqK3UQc=;
 b=m05V/m21Fa2L8sElQQ9me3YxVJa2I8ebb2UzV5PP3Ulp8xIsH0eMVE7rsut5bA5F02k3z+ZFnGs+XOJGuhzKXMHd70FSyMqnzCkcaNs+GshnjShXWFniPRCNTHBO7U2WaY9ppcImAp3iw7OltH66Z+akENcvO1uOlQv197XtHVpL7LZekBTwrx403eYPM6Jk2pI/mIFIrUA0cNjElsy27vyhrIDZYIvMBYyV8eUkto+2UdTiy2XAxca77zRMPN0E0tiTLynIg695hPgQ0saRc5mgXcjPYag+kA1sc/ikKTMqGkj47jVifXhLa/ViziieQy8RxuYrXF9dz+oOXXMsug==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 06:44:38 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 06:44:38 +0000
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
Thread-Index: AQHZ7KeOgKWYHqkhmkaEjar9bQgRYLAlnaKAgADJjwA=
Date: Fri, 22 Sep 2023 06:44:38 +0000
Message-ID: <0958d813-15f8-5ed5-1e20-08b8feb465ad@csgroup.eu>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <9864a7eb-004d-14c6-c2bd-bb9333fe67be@csgroup.eu>
In-Reply-To: <9864a7eb-004d-14c6-c2bd-bb9333fe67be@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3175:EE_
x-ms-office365-filtering-correlation-id: 5c4b5dfd-93f0-4562-df4e-08dbbb376455
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QUYbCtpAN5gwdhcq2UK5AnsyW2A9141IWbPZ8UPuPfkhNYbSMNMWd0eTvWg9Bxxx8ILSydbaq9EUzTsvA+/WgikVVoTqudvw/aZBZRN+Cv2fYlUFL9QJ6RenfChh8fpr/sMFI8+g0XPLKxuT3XvF9TKeOjK70jdJim13echWWD6oSupFIqR88nLt3P8jFaIzEOUebxd7OelbXZv1NJh91iaRTjOCS9edXuzn2hSOdFP6KlqVekkquwATpa/wO0Kh7J9aQ1JilFIeXPsXj8q5aYf++DlTy/MpxDuLhOAY++SiEXqYkB8GO8TZXarfht0EKNqwkb9CVLkeq4hE6vNDgiMvoEREZjiYxL0lK51ciQ5nkmu1QjrAmQYizQxm7gGCwDdKe/LYpmcSg8MJr76sOX2sjohj04SfQC1quMXJBDJwSGjJoLUjYRaXAualk+95wjVI83GuJ0nT07ekSYZh89IK8fYrK2iSoOrK/0VcLlgwUyuxYV0nVNCb+Jd0U3YjGf0OmTyP92XIhSwEcK/HFGHg7nv+V2IyBoh6G8U7WQncosPurIP3cjUYunzbQtsAp2Ot2H/TQmPSI/8e1gBs1nlm5DV4AKQl3iMhl0uiSIHoOWau9zfEjRYpqxcmiA8wL0lGvb/TfqxpA18xeHZ2x0AlXqFKolieYEUESVJr3U+pagGEbA6ldESuW752NBJ0c2EL9LIWItLajx6g/HgJ6Px56UKXRZVYptjmb55yH7w=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(478600001)(7406005)(7416002)(86362001)(41300700001)(91956017)(5660300002)(38100700002)(31696002)(44832011)(110136005)(4326008)(38070700005)(8936002)(76116006)(2906002)(8676002)(64756008)(66476007)(54906003)(66446008)(66556008)(66946007)(71200400001)(316002)(122000001)(83380400001)(66574015)(31686004)(36756003)(26005)(2616005)(921005)(6512007)(6506007)(6486002)(14583001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eDdhb2V1WEVwMDEvRkZYQUtrTGJQc09aZzQvdHUxVkVpbFExbjBzM0tGZGE2?=
 =?utf-8?B?RlZCYUtseHl6dlJPUmF6MmFneUoveUMxV0RneEc3YVliVVhpWVhSV3N4aDdC?=
 =?utf-8?B?TmFrdC9uVmdPdkU4MWV6dVBLQjcreEFOdnJmMTM5L0xNNzZMQWhjcjlDcElB?=
 =?utf-8?B?TTlWZXc1OUIvUHBhU2J2ZU95SHg3SEZxS2h0bjN5SUl1WURsVUN4WU1JM05C?=
 =?utf-8?B?ZTlsdGZDWGRzTHZOWUpVWWdXc0M0QkNZenNBZnVpS0M5MVA0VTNCWVZiTUpt?=
 =?utf-8?B?WjRYQmxzOU5NWlhtTnUvdzI3Tjk2Z2ZlNFkyRDJCY3JLUEpmVkNwWlFFcWIv?=
 =?utf-8?B?ZlZTOU0zN1kxQm1ZdmRScDFDRHMzTmRPVCsvaDBLdUt4Rm1Ka1BzZDRYdk9j?=
 =?utf-8?B?K1BvRFlJZGY4dUV4KzFkSnEvNXhPbGw1bWsyQUZkNmU0UnlqL0tBYlpWajZF?=
 =?utf-8?B?NUhzVnhHS1N1UUl3VGtlRTZNdzAvcUx0ZzVwcWRQeEozYkhWVU0wblhneDRl?=
 =?utf-8?B?STc5cWNyWnFKcjdQNzNRN3JVK2tPbkJDSjFsZ05FNTlteUdDdFJRS1NVZXdh?=
 =?utf-8?B?b0Mxd0x1QWpOdjBSd0l2UnJkUW5xaWtVdGlQMFQwVEovRzI4V2RSMlRmUERJ?=
 =?utf-8?B?TStmRHlHRG5wZVlOa3RkN0JkdXVsWDNaaVRUd0c4NlhkOXl0Sm5QMG84eEJh?=
 =?utf-8?B?dnB3eENxZ3Z3R29JaUxFMm5HUWdHU2ZDbEJtY0Jzb0sxK1B6VmdxWDF6d0dY?=
 =?utf-8?B?Rk1TUHFqSUJrbWdQVnB4bEtZWDVqeVdORnFHY3ByOTIwbDhvUVhiY0FTM2Z5?=
 =?utf-8?B?MlMvUjVJWWZQV1lMQUt0ZWM5ZGxwT3RscGh5RFFuS2wvTzk3N2RHTEhOcHdt?=
 =?utf-8?B?K0ZWdmpUWjROZ09ueG03d3h2eG02Qkk2NndiREdFMy8vYjBNUWd4RUdVWER0?=
 =?utf-8?B?NjVJSWwyQzdFeTA2aURFUndnYWxrczQvS2U2c2w0YUVIKzRYRkdyYVJ5OWVT?=
 =?utf-8?B?NGpQamMrRk14Z1Q5c2tLWktqdlRoeSs0eFpWUXQycnZCdkVIdm0veEVhU2VJ?=
 =?utf-8?B?WTVZQXIwZmkzTDVvRUYyVDk1QnVOcU1YTTZDUnh3Q2RlVlZXbFBaN0NBOXEz?=
 =?utf-8?B?bE9lbi94UVV5VlZrMWJiY0Jnb2hrb3JHOUhtTGRvT0ZIK0taNmJmcG5oNzZy?=
 =?utf-8?B?V3ViaWRpUFNsT0dkU0ZIaEZWWnI3NEhzd2xZYUlVc0laQzV1L005WXppeTZo?=
 =?utf-8?B?R3hlcmx1cytMLys1T1ZSQVFZSStjZ3NvZkhkVzJtVnBrcXpFOThvUm5pQnZ2?=
 =?utf-8?B?c3E1ZjFsWVk1WXV5akQ4Y0RzaE44Y0dnYlRCNnUraDRVS2pxd2NIUTBkckdH?=
 =?utf-8?B?WENjZG1memZER1NjR21ISWpzMXBYOHdqNFBKM1hkV0l6WEJ3RSs2SHJ6bEY2?=
 =?utf-8?B?cjUrV21RT3FrdHJjNnQwSTZXY3MrWndsWndXYy95OG53dEF3dWdoRmd1b2ZJ?=
 =?utf-8?B?QXR5QXNON3NCcTdiVkVZMk1qUU5mSThrdE1MeERsa0wxdFRlRUZNbWZCSGV1?=
 =?utf-8?B?MWpiOE54enJ5OVMxQlVxRzlBakxKQVFwVjREc0VBYlZQNllwK0c5Ylh1ZlFh?=
 =?utf-8?B?RE5rc25lRFZFKzJUZE14a0ZuRXpCRzg4cXdoUlFGYjdLcmhJZ3BYY01iaE9K?=
 =?utf-8?B?ZDlhSGtFclFFYmZPQ0tFZXhCMmxNNm5pWDc5L1hOWU1rVzZHclFCMFhNMXA3?=
 =?utf-8?B?OWQ4ZFBXd0NsL2hWQm9yejlXb2pEaE9kWmgyTldZUVJvR0pjd3U2TGY3NHRZ?=
 =?utf-8?B?Q0wrZThWWS9PNGFjTmo5Rmw4b29GOWxyTVdMZ1VVckdiY3VPMkNKQ0V1dDBP?=
 =?utf-8?B?U2RzRWJ6RXk4WmlRODNEdlZ5SDVSaDRuMjZJbXdrZi9MbkhEWUgwdWJaUVgr?=
 =?utf-8?B?R2N3NnR3blBTRjdXYzJ1bk95RS9rNzNhMm5iS09ydHVvR3ZRT2U5Q0twcm9N?=
 =?utf-8?B?djZCdnEvVzhDVFhOb1Ryd3ArUm0wOXVmVk5jQ0ZYUXgwK2FjQmswUFRRbjd4?=
 =?utf-8?B?NDQ3djdUV0hjR0IrVERNOTdMVVlYNmQrOUdoRU9raEhmTXZNenZNQ1dlcW1I?=
 =?utf-8?B?dnlGWmM3OUxQTVVhdXJzMEZuN21BYUo5NXIyeXA2WkNuUGI0TEQ5NUVON2hh?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FDFBC10A0A3C849B23D61E7B7A1ECF9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4b5dfd-93f0-4562-df4e-08dbbb376455
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 06:44:38.3910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GV6Z0XOYfJmz2la0hlTsa8U6/crWk55PT6qeMf4c1sDAiKv4HAii9vdkh/ybH+5VFr8K0zdDDF8hO2DK3SzFCqXjU2anx40pBj20NVE1hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3175
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

DQoNCkxlIDIxLzA5LzIwMjMgw6AgMjA6NDMsIENocmlzdG9waGUgTGVyb3kgYSDDqWNyaXTCoDoN
Cj4gDQo+IA0KPiBMZSAyMS8wOS8yMDIzIMOgIDE4OjIwLCBSeWFuIFJvYmVydHMgYSDDqWNyaXTC
oDoNCj4+IEluIG9yZGVyIHRvIGZpeCBhIGJ1ZywgYXJtNjQgbmVlZHMgYWNjZXNzIHRvIHRoZSB2
bWEgaW5zaWRlIGl0J3MNCj4+IGltcGxlbWVudGF0aW9uIG9mIHNldF9odWdlX3B0ZV9hdCgpLiBQ
cm92aWRlIGZvciB0aGlzIGJ5IGNvbnZlcnRpbmcgdGhlDQo+PiBtbSBwYXJhbWV0ZXIgdG8gYmUg
YSB2bWEuIEFueSBpbXBsZW1lbnRhdGlvbnMgdGhhdCByZXF1aXJlIHRoZSBtbSBjYW4NCj4+IGFj
Y2VzcyBpdCB2aWEgdm1hLT52bV9tbS4NCj4+DQo+PiBUaGlzIGNvbW1pdCBtYWtlcyB0aGUgcmVx
dWlyZWQgcG93ZXJwYyBtb2RpZmljYXRpb25zLiBTZXBhcmF0ZSBjb21taXRzDQo+PiB1cGRhdGUg
dGhlIG90aGVyIGFyY2hlcyBhbmQgY29yZSBjb2RlLCBiZWZvcmUgdGhlIGFjdHVhbCBidWcgaXMg
Zml4ZWQgaW4NCj4+IGFybTY0Lg0KPj4NCj4+IE5vIGJlaGF2aW9yYWwgY2hhbmdlcyBpbnRlbmRl
ZC4NCj4gDQo+IFRoaXMgcGF0Y2ggZG9lc24ndCBidWlsZCwgYWxsdGhvdWdoIEkgaGF2ZSBhbHNv
IGFwcGxpZWQgcGF0Y2ggMS4gSXMNCj4gc29tZXRoaW5nIG1pc3NpbmcgPw0KPiANCj4gICAgIENB
TEwgICAgc2NyaXB0cy9jaGVja3N5c2NhbGxzLnNoDQo+ICAgICBDQyAgICAgIGFyY2gvcG93ZXJw
Yy9rZXJuZWwvc2V0dXAtY29tbW9uLm8NCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGFyY2gvcG93
ZXJwYy9rZXJuZWwvc2V0dXAtY29tbW9uLmM6Mzc6DQo+IC4vaW5jbHVkZS9saW51eC9odWdldGxi
Lmg6IEluIGZ1bmN0aW9uICdodWdlX3B0ZXBfbW9kaWZ5X3Byb3RfY29tbWl0JzoNCj4gLi9pbmNs
dWRlL2xpbnV4L2h1Z2V0bGIuaDo5ODc6Mjg6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2YN
Cj4gJ3NldF9odWdlX3B0ZV9hdCcgZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlDQo+IFst
V2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KPiAgICAgOTg3IHwgICAgICAgICBz
ZXRfaHVnZV9wdGVfYXQodm1hLT52bV9tbSwgYWRkciwgcHRlcCwgcHRlKTsNCj4gICAgICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgIH5+fl5+fn5+fn4NCj4gICAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwNCj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKg0KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9hcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vaHVnZXRsYi5oOjEzLA0KPiAgICAgICAgICAgICAgICAgICAgZnJv
bSAuL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oOjgxNToNCj4gLi9hcmNoL3Bvd2VycGMvaW5jbHVk
ZS9hc20vbm9oYXNoLzMyL2h1Z2V0bGItOHh4Lmg6NDk6NDU6IG5vdGU6IGV4cGVjdGVkDQo+ICdz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKicgYnV0IGFyZ3VtZW50IGlzIG9mIHR5cGUgJ3N0cnVjdCBt
bV9zdHJ1Y3QgKicNCj4gICAgICA0OSB8IHZvaWQgc2V0X2h1Z2VfcHRlX2F0KHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nDQo+IGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVf
dCBwdGUpOw0KPiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5efn4NCj4gY2MxOiBhbGwgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMN
Cj4gbWFrZVs0XTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0MzoNCg0KT2gsIEkgcmVh
bGlzZWQgdGhhdCBpdCByZXF1aXJlcyBwYXRjaCA2IHRvIGJ1aWxkIHByb3Blcmx5LiBUaGlzIGlz
IG5vdCANCmdvb2QuIFlvdXIgc2VyaWVzIHNob3VsZCBiZSBiaXNlY3RhYmxlLCB0aGF0IG1lYW5z
IGl0IG11c3QgYnVpbGQgYW5kIHJ1biANCnN1Y2Nlc3NmdWxseSBhZnRlciBlYWNoIHBhdGNoLiBU
aGVyZWZvcmUgeW91IGhhdmUgdG8gc3F1YXNoIHBhdGNoZXMgMSB0byANCjcgYWxsIHRvZ2V0aGVy
cy4NCg0KSSdsbCBzZW5kIHlvdSBjb21tZW50cyBvbiB0aGUgcG93ZXJwYyBwYXJ0IGluIGFub3Ro
ZXIgbWFpbC4NCg0KQ2hyaXN0b3BoZQ0K
