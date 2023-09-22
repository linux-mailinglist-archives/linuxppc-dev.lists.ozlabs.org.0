Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A717AAD96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 11:15:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=f0/ImvgP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsRT61Jppz3dXk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 19:15:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=f0/ImvgP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::629; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsRS75j2Yz2xdq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 19:15:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA9wrXVe5osl1krtdfS93yf53v+SjHnL0M+CcDfprqucTe0VxdXrCaefHN7FDxM9pzcYyex4mDndj/JHMxvw88ht5n6sBQj+1qXXPA/R28sSRNyBsv/0S3HYvo1kiza+BQcyYZz4fzyZCVAiu7JOhLcFeGTHgol/dKALsRx5bQg85oLd9cHBMcUBidF7Ot9z3uK0Vcws3S2f/htKd9pIuni7Rv++K6Jav45fOKcy/dmNZKI1DrNorqCIxdJCFu/X05RgcddKY/X4vsSjpEu4XWXDWAGumxRQiYcVvQBCbQUs9lr4o6fUIERALJt5SBklQ9/L66rFhmMxE26EvRuUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGwsNF8e35tllqCdKTFbkdz4LKn4g2f9aYykJj/sTnE=;
 b=V7pBwFlbuMJH6ua2vPOG4yzrqeH77E+EPIrJcguhu84rt9fpRFO19KtbEOtnn2L+lvd1GIfdTa/40zK/XcnhnX03Sg8+nFdHh3PNHu/A8H4wTt4WAuGD7eYzc1DtJdwfrIyMPaDCcVW3tThYI+pp2IidcqT3+SDpf1EWx2bBwRkMB3qA+f2zqLGQTYAvHT5G7x5qOYn1z7Unes7wTVjRfOpN/rMnKjiuSd3dhZy+vj5Q2wKIW0eoOG6cCW3ks1TkQToG/ph6GhCKSNMWhKbvcOV+WD651mu0Hgw/nAttFNglWIyCt7DHE++DTI+DbswXWLr7SHAKXATPoDjZU+V4RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGwsNF8e35tllqCdKTFbkdz4LKn4g2f9aYykJj/sTnE=;
 b=f0/ImvgPZv4EA9v/HVXodxc9EYiV1Qf1Maez38MZp8Afr6G5IXCgY7Ay8MGfRENpgh1fk814mfN3AywXOqX2E/SOh8uJFBcbGFVFboYo76HTG2fgk7si8mmRzMUdwqLho17wwjNNx7jPc391Dvr5Uut7rLTS4Nl09rMIVJhpH8e4RyAymJ6JBk8B+nVnYkw7Szblk8Qe7AwG8ht4C2KIQKwJy726DT8NqkxuAtKjF92aQfzxEonqs7bhOJOja75qj0yVgKPPtm9d+Q+2zYLrwTRGk2wUmrPBjB30yCRLr8o2IMgRjo+fpNewxVE2sr7c2xI0CchiELK7F0BpBRL7Pg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1521.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:15::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.22; Fri, 22 Sep
 2023 09:14:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 09:14:40 +0000
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
Thread-Index: AQHZ7KeOgKWYHqkhmkaEjar9bQgRYLAmapKAgAAKKYCAAAqCAIAACHoAgAAJZQA=
Date: Fri, 22 Sep 2023 09:14:40 +0000
Message-ID: <1cc4d995-efeb-9d15-446f-475e63154a2d@csgroup.eu>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-3-ryan.roberts@arm.com>
 <0f2dd31a-a361-24ba-154d-4e614c0eff73@csgroup.eu>
 <597e7496-ef99-4505-88ee-91701af02835@arm.com>
 <5ee382da-0ed0-9fb1-7640-35ef77c195fc@csgroup.eu>
 <871d277e-6c4e-418a-9574-2e9117646ca2@arm.com>
In-Reply-To: <871d277e-6c4e-418a-9574-2e9117646ca2@arm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1521:EE_
x-ms-office365-filtering-correlation-id: 496959c3-0a55-454f-0f87-08dbbb4c5a23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Z58QE7ca8BlcN5pnacYCJXTbB19qn10iIRYHb/0s8IwJi9MdGhmRHcHG1HESAw2BTUTK6IiMzPIjGh7kzSCMkdNjz1vjgmuqRcCP2VhqEFvyK61ftN28MUR23ih0ty9QsjYuNk45OBYtcMDZiBa+7vi3f/QklUKLw14tu3FhlZFwXfcmwsMfR+moX8bYi+Vyco1R7lo2XqXoifmzw+/udeM8toHYpdVUF7r0NEV5H64/Usw1aSbIWGbSPhoAwFrdONoTnARdb+1KHsB0PlGZ9RRTj2ACr08SVheXEm5NUlAVK1ZYt4q181bROVETMMjnx+elP+swN4pd9oYR5VPqMx8y/QRb8K+xS0rD3YWv61vyo+xg1op8bp+bl0PiMn5H4KlfX2c2qjolZqr6cl8HKEx4XMWongxbJMzKobqhoZT+koZ2t2JikoLA993V/aGrvb8uuJoVrSI9tPsk0IqMoBkYLDCdg6k6s4UVQKs2PMDXVYKTDqcFqUTYtHaFb8MjDedOlrTZ00R6pqaq+o042t1zwc1M8YbtGBg5OFGvyn5oEgk/HcNbIrdb/EiQ9jzA4OGpq0GhgDGgwetOKkctB6QoxqvwGRskkKS+hT61H8kXZp7c292OMU7Bje/1iiFZ563quMaoPoclLe8mUvhVb/LQKNEyWxe0swtf3lLoyEeCV9XX1y8QHeIFyGaNsLTggeser7zGydHPnLvhG5C2dGmpHQiqjjPmkxIbRj/XQHI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39830400003)(366004)(396003)(346002)(451199024)(1800799009)(186009)(31686004)(44832011)(5660300002)(91956017)(66556008)(66476007)(41300700001)(76116006)(110136005)(66574015)(8676002)(316002)(8936002)(4326008)(478600001)(66946007)(2906002)(7406005)(54906003)(38070700005)(122000001)(38100700002)(66446008)(64756008)(7416002)(86362001)(31696002)(71200400001)(921005)(6512007)(2616005)(6506007)(36756003)(53546011)(6486002)(26005)(14583001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?K3Npd0krKzd4b1Y2aDA2SXlJUjFXV0Y5Q3puMTlDM3NQZG04MEIveHRJUUpn?=
 =?utf-8?B?YkF5VEg1OENGdklqWjhYSnVjNU9uK2tCRDl4ZU13VlhzbkZycUt4VStrUkFU?=
 =?utf-8?B?TWhsUmhwS1NFS3FQRHpMWVFrTFExbjkrNjhGRlYwN2hFRXhxb0pwbG55NG1r?=
 =?utf-8?B?dG4rZDcrMENBQ0dVYlJ5YzJaS2FuQ3p3Z25ha0RBUmVtZFlRMGJCQlNndnVL?=
 =?utf-8?B?d2RNK1IzeDY0eVJTejB6UlNFSVZaUllGNWZhdjBqTnpKeC9XM2lkMEVVdUY3?=
 =?utf-8?B?cHY5aWo2d3JTQVVEbVkvendIYzZDeHJlQnlmUmljVFFtS2VhTUtXdVdIdE0w?=
 =?utf-8?B?S1FDNm53ZnNoSTNGandjVUFqdHo0QS9hSFBVeUg2VVU1dTVJM1VFUWh6b3c3?=
 =?utf-8?B?VEhpQVVwaXVuQzlLVUQ0Ty9Nd3IxUG1pcnBud3k1K1VuZGpKTUJVK2lDTjRB?=
 =?utf-8?B?bFE5Mmx6SGcvT25JYVZQeEM0SDI0TFc2bi9EQ00yWGVpczBPYzlUWGVoMEpZ?=
 =?utf-8?B?aXk1WDhySEZDTEgvV09XbDBxSm9FaExpNjA2RHJTak1oRXZzSTVPR2VIT21T?=
 =?utf-8?B?SnVlMjRVbStycU5mclBuNmhYZTBWZ3ZYbEpjQWVMd1NoZGRnc3ArcnhzelZp?=
 =?utf-8?B?OURWSEE2T0VqT0dGNWpaV0F4cVRFeVVjUWJxcnY0RFZkMnpzSGxhaHBVWlRY?=
 =?utf-8?B?cWFQeFEvelFQRkV5NnFJMFZEMDlqRWlSTDJRR0NyRFlmN3NCOHp5alBZSUEv?=
 =?utf-8?B?bXlzZ003Nit5NjZWbllSTzEveTRKZlZELzYyak9KTUJ0T1g0dSs0WkE4MHll?=
 =?utf-8?B?N2VJVi9WTDFncjVPUlV1VG1ORStaUmwyblkvMXdqMVJvcjEydStrNk1wMHVr?=
 =?utf-8?B?aHRFLzJDQ2R4eWFJbkUrTVVkakljbVh4RHdTa002bFJpWXBrZ1ZHVnRoN2hn?=
 =?utf-8?B?NGJ5ZzBrREhBZU5INmZGZDdjSU5yTDdzMTZsVGY0U3BHQWJUL1NlQTQ2S1M5?=
 =?utf-8?B?RW1kU3RydGRpMmYyTW1LMlFrN1pvY2RlSTk0OW5GTGFQZ014b3B0cWhDSFRn?=
 =?utf-8?B?YjJRRFI2SUpqZFZ6MzZiS08xaUpvVEhmNnlxMkJGSFk3ckVjUTFrajUvQTJw?=
 =?utf-8?B?Mm1LYWZ4a0JBQytuSXRvUHhCVWJDem9uWHlmeCtKaWxDbUg0U3U3UDcxNy9a?=
 =?utf-8?B?ZXorMTRlSk91eHFhT0JFTWN6Zzh3VVB6V0VTVVpLeDE5YzhTTGFYZmRLd0Vw?=
 =?utf-8?B?ZmZzZVpVamRtWldTWHo0cU4rZXZ1dHhRR3FHd2g1d3JvVnluK01qTWJuQkJm?=
 =?utf-8?B?YnAzSXpGaEl2ZFFuL09UV2MwTDFkQmlHbjNNNTZPeFRodWcxdlpDU2FNYm0z?=
 =?utf-8?B?MnNTeHNMY2xjYzhSRGJCaUVDSGgrYTlaNFZPYWVXVUxLZjJrVFpnZDNGNS84?=
 =?utf-8?B?b2NDU0h4dG5POWxNSkFyUndiaWlXVDZzUlhLZW5ZWUxLK0JjZTZHUEdHTDh4?=
 =?utf-8?B?ck13ajUybm4zRlY1U0hZUzZja3BaZ2s4SHBlMTlEbDFjVlJma2NTc3JmUEpp?=
 =?utf-8?B?Sll1Y1BsQzZBTEhxbUZIS2JGdkwyWFZHZmZDcEpkOTkzdHkvcGR0R2RjRGZ0?=
 =?utf-8?B?ZG81ZmNGdHJacUhpVXVialFHVFlYak9PS0w1Y0FMWHdPZU9CcWxyQkJqakdw?=
 =?utf-8?B?STc3R1Y1ekgvUjY1MnAwUUR2bHRFNENnalBUSkR6UGtPaktvcTd5Q1dMWm0x?=
 =?utf-8?B?MTYyZlZUd1pBN1ZpSis2RHdOK0h1SUh0d2hqTFJWU1NIVSt5RmQ4TTNTUzdn?=
 =?utf-8?B?cUREUVVNWmFxaS9LVGpnWkFQRGRuVmJ1RTdFa1B6RmVJR0hoWi9jVE55d3Qr?=
 =?utf-8?B?bklTd0FIWllsdUZZZHFkdGYzTXNKWlczd0JRU2NNaWFXSDc4SVN6OC9aeExM?=
 =?utf-8?B?ZkFEc0dQZjBxYkh1ZmJwbnZyTCtnbjRUZjJ4YS9wenhWbGd3cE0wK3R3d0dz?=
 =?utf-8?B?Y3QrckZRbzdPa1FtTHRNd0NtOHVFd3pkSmcrSUFubVh0SktkWDVIRjJDaGRO?=
 =?utf-8?B?RHRHa1ZlM2pRdFdNaERFTDJWZ0UrcG82ZjVFbnVBcXNqclgrdnVIQitDYzR3?=
 =?utf-8?B?NTVXcHRDbjRWaGZ3YmtSdk1DYUgwSlp4ZzQ2L1kwSGtFM1UwbTZ6MlpyWXNK?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9AC0516B71CFE4C86C63901DB912D5F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 496959c3-0a55-454f-0f87-08dbbb4c5a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2023 09:14:40.6811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JM3rVUdAQXwvVrOyDTfv3HpMvqAxFpmT3eu9n9WyuccgC1Mtr4l/BEF95j/D++31nDgitJhDmV+n9dLhrF4z0Rx+KRWMMG+SimI/6I1z/eA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1521
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

DQoNCkxlIDIyLzA5LzIwMjMgw6AgMTA6NDEsIFJ5YW4gUm9iZXJ0cyBhIMOpY3JpdMKgOg0KPiBP
biAyMi8wOS8yMDIzIDA5OjEwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+Pj4g
SSdtIGhhcHB5IHRvIHRha2UgeW91ciBwcm9wb3NlZCBhcHByb2FjaCBpZiB0aGF0J3MgeW91ciBw
cmVmZXJlbmNlLiBBbm90aGVyDQo+Pj4gb3B0aW9uIGlzIHRvIHVzZSBhIGR1bW15IFZNQSwgYXMg
SSBoYXZlIGRvbmUgaW4gdGhlIGNvcmUgY29kZSwgZm9yIHRoZSBvbmUgY2FsbA0KPj4+IHNpdGUg
dGhhdCBjYWxscyBzZXRfaHVnZV9wdGVfYXQoKSB3aXRoIGluaXRfbW06DQo+Pj4NCj4+PiBzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3Qgdm1hID0gVExCX0ZMVVNIX1ZNQSgmaW5pdF9tbSwgMCk7DQo+Pj4N
Cj4+PiBUaGlzIGlzIGFuIGV4aXN0aW5nIG1hY3JvIHRoYXQgY3JlYXRlcyBhIGR1bW15IHZtYSB3
aXRoIHZtYS0+dm1fbW0gZmlsbGVkIGluLg0KPj4+IFRoZW4gSSBwYXNzICZ2bWEgdG8gdGhlIGZ1
bmN0aW9uLg0KPj4NCj4+IEkgZG9uJ3QgbGlrZSB0aGF0LCBJIHByZWZlciB0aGUgc29sdXRpb24g
SSBwcm9wb3NlZC4gV2UgYWxyZWFkeSBoYXZlIGENCj4+IGNvdXBsZSBwbGFjZXMgd2hlcmUgcG93
ZXJwYyBkbyB0aGluZ3MgYmFzZWQgb24gd2hldGhlciB2bWEgaXMgTlVMTCBvciBub3QuDQo+Pg0K
Pj4+DQo+Pj4gT3IgeWV0IGFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIGtlZXAgdGhlIG1tIHBh
cmFtIGFzIGlzIGluIHNldF9odWdlX3B0ZV9hdCgpLA0KPj4+IGFuZCBhZGQgYSBzaXplIHBhcmFt
IHRvIHRoZSBmdW5jdGlvbi4gQnV0IHRoZW4gYWxsIGNhbGwgc2l0ZXMgaGF2ZSB0aGUgYnVyZGVu
IG9mDQo+Pj4gZmlndXJpbmcgb3V0IHRoZSBzaXplIG9mIHRoZSBodWdlIHB0ZSAoYWx0aG91Z2gg
SSB0aGluayBtb3N0IGtub3cgYWxyZWFkeSkuDQo+Pg0KPj4gSW5kZWVkLg0KPj4NCj4+IGFyY2hf
bWFrZV9odWdlX3B0ZSgpIHVzZWQgdG8gdGFrZSBhIHZtYSB1bnRpbCBjb21taXQgNzljMWM1OTRm
NDlhDQo+PiAoIm1tL2h1Z2V0bGI6IGNoYW5nZSBwYXJhbWV0ZXJzIG9mIGFyY2hfbWFrZV9odWdl
X3B0ZSgpIikuDQo+Pg0KPj4gU2hvdWxkIHdlIHRyeSBhbmQgaGF2ZSB0aGUgc2FtZSBhcHByb2Fj
aCA/IE9yIGlzIGl0IGlycmVsZXZhbnQgPw0KPiANCj4gU2VlIFsxXTsgSSdtIGdvaW5nIHRvIHJl
d29yayB0byBwYXNzIG1tICsgc2l6ZSBwYXJhbWV0ZXIgc2luY2UgdGhlIGN1cnJlbnQNCj4gYXBw
cm9hY2ggd2lsbCBicmVhayByaXNjdi4NCg0KQ2FuIHlvdSBwYXNzIGEgc2hpZnQgcGFyYW1ldGVy
IGluc3RlYWQgb2YgYSBzaXplLCBsaWtlIA0KYXJjaF9tYWtlX2h1Z2VfcHRlKCkgPyBBcyBmYXIg
YXMgSSByZW1lbWJlciBpdCBpcyBlYXNpZXIgdG8gaGFuZGxlIGEgDQpzaGlmdCB0aGFuIGEgc2l6
ZS4NCg0KQ2hyaXN0b3BoZQ0K
