Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EEF64999D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 08:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NVtl05y8dz3c6p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Dec 2022 18:37:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DhrXM3VF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.43; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=DhrXM3VF;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2043.outbound.protection.outlook.com [40.107.12.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NVtk31KvBz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Dec 2022 18:36:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUZkSWdSZQVq6xsMMLyRRk6hdtiXqfdHATrDRF0YF3MSTcU1poZ5FK9ULIqKYCUUPIPSMeU2hXSbcD534lt2gwEZ5HWoULCrbfBoDNAeJy/3/NwAudcYx3mE0jjq5J9CzZmakS0cNpb/jvwQIpQ84IVhx7nmv1LNskAF1KwOM58N+5uV1ZMGT1wFYBOr5bYFhp8YznDmKQXPIff4XYwcR7eDMok3hzdyehfOGqNDAjphIzsaxNDHUAuDnlPAVnN255rpNpRon5OzVkAv7Rb2PF4amOEIXyO2dVGxLNvdyYAFzQj8ChepPg0Snq1nX7FNNFxII2BxUEd4wlhHC5Y17w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KThi//1Wq2wI3knSnVFwLWQFcJbOsGMnRB58e5GrZDU=;
 b=FLlSHpgf+piXaxUxNCMvKwYqcPrY9ELQDEqJ6q247ixBCFc8sMLY/qf9p1WygppSUAH1sj9GB/XLIHb1RuVQceJB3hH0Q0c9yv/7YXr5J+46GCrUEuwpZpkLe2tO5ImtyvbpiMGPSpLdSETFbgdapXjjyZbyAHNN28C4fbD4BczGAaBkj8t9bJ2nzMn/09B5lXFYZt1oi5aqibu37fDRAP20paINZ19HjVWT2NOepRpRysyW/oT+Z9ekmd0Ggo4PLOQ+Fnte5ntFdMhqvX9A6Jpo8ANODHcznQs4QpJ9SFATlC2iCQNtnTzcNFdFLumh/NIx7ULGmzMYTmXptBW1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KThi//1Wq2wI3knSnVFwLWQFcJbOsGMnRB58e5GrZDU=;
 b=DhrXM3VFW55DSdbjMi/+fsgf8xq56a6oI4dEXZDKGk56PYJx8Wu9T8tgFvDJdzXruj/RSL72SYroHvzbi5YPQV4/SBP08a2xr9rYwiJREYGXPYYsgG4Yn2HuBEfNw9/DXt6f8bWzs6n/iqcetr0+HI8e4l4WXlQbUN7BR1NJEsTrMOnoEkE4nFYvl6Var36fsuzO+U39njc1EP3dYaRK753cW2Csg6JdiGq7W2oBnrNYWnXwoCQNVjQt6YN5UvR5vrttAPm2UlD4B57t6h2ub5z87NgPQmOhBkSE7gKs+lnFnsJ9NAzJxeR1uLitwpucf6p+b+tCYVfP7kyMlXWvZg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3441.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:23::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 07:36:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 07:36:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>
Subject: Re: [PATCH v1 5/5] powerpc/64e: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
Thread-Topic: [PATCH v1 5/5] powerpc/64e: Fix build failure with GCC 12
 (unrecognized opcode: `wrteei')
Thread-Index: AQHYlTFaGgcq0Qxookare1Yb8TiXmK5p4rYAgADr1oA=
Date: Mon, 12 Dec 2022 07:36:37 +0000
Message-ID: <101320ce-8f0c-d4d8-9d73-7f231d651f4e@csgroup.eu>
References:  <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
 <77255a5a957967723b84d0356d9e5fb21569f4e8.1657549153.git.christophe.leroy@csgroup.eu>
 <20221211173232.7hvgnadyr7wrdm2f@pali>
In-Reply-To: <20221211173232.7hvgnadyr7wrdm2f@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3441:EE_
x-ms-office365-filtering-correlation-id: d9e9f51e-c958-4c19-e1e0-08dadc139a55
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  9cccUc0jqQwX2St8aV0PMcgSDSZmDAhsis9OIhA9GdxZgu1bzxzU66YveySL7LDz1daZC7YxSa8f/DM7nhmyfMQ5HXEtToZQa5cn0n/KQkJSxSdzS+FG6CeIlDQ/Emb0PGDDxXLccuHbZfDeSWHEbbjTV7c7XyvVOEOzunJutRXsY198nKDPPJ7TzFQfiVNGYqE34VmGvnUQ9uHfk9bnBvITjmR0CnKzLwfWCnrwIJjaJ40J2Cda/C3FLRgt0mE2tW9oN4ZFofiBaGPzt2F8fWxEGvYd6Fc9r9bSDXOBHg4GLdq34m2eCmTMFS8J1p68Cr3kpvkmUwG3z/Bt+cpgDUxWEA8ivSwT9obEVa0VoWcH9DVDpneZWr3OyStOwkuL9gaDQ0Ey+tCYkCILUotgcuUvU5sPsh+yx6fhHSNqUXZfxbBbGwhqzCqbj9KmGSxf5dDmkZbqy1X5roTWKuWdcdhKLudrGjejgbe/nlqkeuVKYa9oDusz30mpxBbAZXLCEnVB+8nO5WMZNzoHohDYjLuf3Ahxo6Xx4P9FD+oy2kdTFHojPlLsxjLB4YcITBUPBLT3Y4IGcfXJbYtzygthW7r5hvXu1yMl/WcoBSyx6+32RPDpcPbxfL9VwyxWse8pnW8PisTSmJ2RUv/wfZqa/3N/rgpaW1IFh/wXUOBM3aQDKS14RJuCxzxqMpmG4juvykc0gdMj1xdNHbOUJe7/iPkD8DhoFg8eMBHEYhIhCXyfzqiaVN+0Hxz9IUt0yCeekijm5h2t41kns/tvgVJuwcRKwRcsAzPbakEvPl/27gPZEDfyB9WNCXK4y3RMG3vo
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39850400004)(346002)(366004)(136003)(451199015)(31686004)(38070700005)(36756003)(86362001)(31696002)(186003)(122000001)(2616005)(66574015)(478600001)(38100700002)(966005)(71200400001)(6486002)(26005)(6506007)(6512007)(41300700001)(110136005)(54906003)(4326008)(2906002)(66446008)(76116006)(64756008)(66556008)(66946007)(91956017)(8676002)(8936002)(44832011)(83380400001)(66476007)(316002)(5660300002)(81973001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L0lIT0ZTZmpCZExnRG5LQzcyOHNRVDdVNWhxaU9ndlBhckcvZ1VTY3pVU0Zn?=
 =?utf-8?B?R0FKeVQrUHpoM2ZWRW0wZWNnUjZ0ZkZ5T1pZMjcycERjWlBhNlJISkI4ZjRP?=
 =?utf-8?B?TFI0aVhhd0NkS3hNbkVkamZuRjgrSjZZL2d4cGRXMy9BVVJYbXdqSC9POG9U?=
 =?utf-8?B?SzM0S0xCVllHU2E1WU0zZmIzblJCVURVVk95cTZKbGllVjlMMEVjWTdFZTIx?=
 =?utf-8?B?Smdla2F3QUswNmZlZnNpQXVPREVnbmlPM2g4WU9KV1JtMVZsUWplclNoa042?=
 =?utf-8?B?VlBtcDg5M2l1eGRBZzZwL3pOQnVmL3FMejlQN1V2bFRtOWhEYkxRMHZMYVBl?=
 =?utf-8?B?MUp6OGUrZlR0QUUzTGgzMlc0amZNWXlZWndmQkxFOUFMWFZUNnFVWXlHZk9z?=
 =?utf-8?B?N1AyNXFjeEFYNHpNUEhlZG4wYk1xbFppV1J2MXYxeVNTOVdYMjNHRzVPRWVz?=
 =?utf-8?B?a0VTOU5qWDRPY0hYUTNKMEtLbzFJSHFWNnNmYm10dEg5c1pTTzVLZXU1MFVE?=
 =?utf-8?B?aVkvZWdVbUNKQkUySlJ4Z1NWdWoycWRYVjRPc2x0eC9jdzZZdjZ5S0JKN2hX?=
 =?utf-8?B?QUxFc1ZMR0gzV1F0ZDJiOVFRSHZrU0F3eVZ4dEo0dmlXQ21WMXRTcGYrSWU4?=
 =?utf-8?B?QkkxODZhbjI2cm9ROEpIQ2FCcU12QXFHQnF3ZWphOEFNODhpN2JKTWtZdS9q?=
 =?utf-8?B?UVhyZyt5N211aFRvS29nbVlmazZnSzRLUWkxdnVkOFdxWC9nbk0wTkM5MkJC?=
 =?utf-8?B?NFFzcWtCVmFJNVZVNVo2NXJmd3ZsZVdLaGw2aDBZbUtUMWpMbzFBN0RzeUtZ?=
 =?utf-8?B?dU5ucUJ6R0Rld0tQU296cjhYRG8vVnIvbk45UjRaSzRZWGVTd0lmNitNQW5I?=
 =?utf-8?B?QVovMFNUaWl2WEFaN1pnVmk0b2kxeUFpSC8yOXM5bkR2amJjU2NRVDZvMXVG?=
 =?utf-8?B?VndoUDFGM2hEUG9CZUVwM2V4UExXV2J1L2NreCtZNUdjaUt4eHBMMmVsRSsw?=
 =?utf-8?B?SW9VSTEzbzZ6WGNnVkJ6TmVTbTdEcUh3b2NJcHRLMlJaaXVKdnNONmpSbi8z?=
 =?utf-8?B?amhxSUZ4YmwweEpxeWFpOFgrRGFoRGhnN3BVVFJVYzBpTTRyekxheVpOeWlp?=
 =?utf-8?B?dlNIY3R1eXp1UWttWDZtWVg0WTQ1bEtPSDlpdTBSQlFMZ25VY2VIUDk5cC95?=
 =?utf-8?B?SUx5Q2JiVk1CRFFhNnc0MG1sZm1CUDF3SUpjWVptUFZsZ2QzQXZZZkd5czc1?=
 =?utf-8?B?dm5PblpKT0pOenh5NkdoQ1FITStUOVRKeUVPVjd6bVZFTXhXYVJGOTNvcFEr?=
 =?utf-8?B?aENEWm1rMWtKck5xM1B0NmVHZWNNcEdyaHZqQ2ZrRFpnUTYvMkkwSThsZndO?=
 =?utf-8?B?aXcwSjJNKy9LaDQ4L2thL2tSTFVEZTFMVmYvNXZPSTBoNm9mczRDMUhaSTZZ?=
 =?utf-8?B?WEwxQVpGNlhCV082bENNM1FHbHF0dkIrZlhNZnNMeW1ucW11ekF4dFp6c1Q3?=
 =?utf-8?B?aWRJSjAzNmd5eGQ5clQ5bUE1bllHd2VQTExTSFVtellIbXhxM2MzMDdBdXhP?=
 =?utf-8?B?emtOR3FmZ3ZpNkVuVGZpeE1UdU9uZWVCTWZiRkVrMkJMWndub0pXcWEvVmgz?=
 =?utf-8?B?aWx4eWtDUmRDSWxhV3liMCttNHhQMmZDQjJtUWE4NHR6YWhrS01MNEUyc2FC?=
 =?utf-8?B?NjdmQzRLUEtRMlE2cHpYOUpiY2ZMVVpMY21vR3U5VnJVVTBieWc3OGhnZDZR?=
 =?utf-8?B?cTlPaUpKZnFaZFdCaUZ1N0JQU2t3QXZHWnV3dk9WUVhnNHM0VmZxRGNUcDlB?=
 =?utf-8?B?QmYvVUdoc1p0bXJMREV3WmdMb1VjQTI2NUFxZmpvVlFpendaaTRrbHRoOXA1?=
 =?utf-8?B?ZklOdmxoT1ZZamlnWFphZ1VGUG9iMmRsdnczanJ5bXBxZHBMTUY1QnJvdktB?=
 =?utf-8?B?M05ZTzZBaG5uRTJ1ZmtZemREOGFuMTZDejZ6WlJMYmhXRTlaWkFsUDR4SjVG?=
 =?utf-8?B?QVNHYmdJZjc0Z0VTZ0VBODlUSWE0WVF1U09pMFRtSDl2OXo1OHhBUUYreFAx?=
 =?utf-8?B?TFJtNVYyNXFITlpscmdVUTl0NjlKK0hqZU5CcElKMnJiN1F6ZXJ2MUhBM2Vn?=
 =?utf-8?B?VUlrRHE2NWRmUmJYdVFhQVEySERFaG51c2RFTk1TdTdEQS8ybkdKT3Vpc3Ja?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <75F5E3DA844B434BAC83B825FD9EE35F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e9f51e-c958-4c19-e1e0-08dadc139a55
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2022 07:36:37.7843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cxz9/uGjFuIdum8bgBIXRFk2DRsN9P7nFVQmevY8P/+AhA2tLGmOnC5xGjYTnzB1YdPfITCgKxYkxIny4VT0hRTbLNjoQ2T2cbrqdKOJVyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3441
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzEyLzIwMjIgw6AgMTg6MzIsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IE1vbmRheSAxMSBKdWx5IDIwMjIgMTY6MTk6MzMgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+
IFdpdGggR0NDIDEyLCBjb3JlbmV0NjRfc21wX2RlZmNvbmZpZyBsZWFkcyB0byB0aGUgZm9sbG93
aW5nIGJ1aWxkIGVycm9yczoNCj4+DQo+PiAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9rZXJuZWwv
aXJxLm8NCj4+IHtzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNzYWdlczoNCj4+IHtzdGFu
ZGFyZCBpbnB1dH06MzYxNjogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6IGB3cnRlZWknDQo+
PiB7c3RhbmRhcmQgaW5wdXR9OjU2ODk6IEVycm9yOiB1bnJlY29nbml6ZWQgb3Bjb2RlOiBgd3J0
ZWVpJw0KPj4gICAgQ0MgICAgICBhcmNoL3Bvd2VycGMva2VybmVsL3BtYy5vDQo+PiB7c3RhbmRh
cmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVzc2FnZXM6DQo+PiB7c3RhbmRhcmQgaW5wdXR9OjQyOiBF
cnJvcjogdW5yZWNvZ25pemVkIG9wY29kZTogYG1mcG1yJw0KPj4ge3N0YW5kYXJkIGlucHV0fTo1
MzogRXJyb3I6IHVucmVjb2duaXplZCBvcGNvZGU6IGBtdHBtcicNCj4+ICAgIENDICAgICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9pby5vDQo+PiB7c3RhbmRhcmQgaW5wdXR9OiBBc3NlbWJsZXIgbWVz
c2FnZXM6DQo+PiB7c3RhbmRhcmQgaW5wdXR9OjM3NjogRXJyb3I6IHVucmVjb2duaXplZCBvcGNv
ZGU6IGBtYmFyJw0KPj4gLi4uDQo+PiAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9tbS9ub2hhc2gv
Ym9vazNlX2h1Z2V0bGJwYWdlLm8NCj4+IHtzdGFuZGFyZCBpbnB1dH06IEFzc2VtYmxlciBtZXNz
YWdlczoNCj4+IHtzdGFuZGFyZCBpbnB1dH06MjkxOiBFcnJvcjogdW5yZWNvZ25pemVkIG9wY29k
ZTogYHRsYnN4Jw0KPj4ge3N0YW5kYXJkIGlucHV0fTo0ODI6IEVycm9yOiB1bnJlY29nbml6ZWQg
b3Bjb2RlOiBgdGxid2UnDQo+PiB7c3RhbmRhcmQgaW5wdXR9OjYwODogRXJyb3I6IHVucmVjb2du
aXplZCBvcGNvZGU6IGBsYmFyeCcNCj4+IHtzdGFuZGFyZCBpbnB1dH06NjA4OiBFcnJvcjogdW5y
ZWNvZ25pemVkIG9wY29kZTogYHN0YmN4LicNCj4+DQo+PiAtbXBjdT1wb3dlcnBjNjQgY2Fubm90
IGJlIHVzZWQgYW55bW9yZSBmb3IgYm9vazNlLCBpdCBtdXN0IGJlIGEgYm9va2UgQ1BVLg0KPj4N
Cj4+IEJ1dCB0aGVuIHdlIGdldDoNCj4+DQo+PiAgICBDQyAgICAgIGFyY2gvcG93ZXJwYy9saWIv
eG9yX3ZteC5vDQo+PiBjYzE6IGVycm9yOiBBbHRpVmVjIG5vdCBzdXBwb3J0ZWQgaW4gdGhpcyB0
YXJnZXQNCj4+DQo+PiBBbHRpdmVjIGlzIG5vdCBzdXBwb3J0ZWQgd2l0aCAtbWNwdT1lNTUwMCBz
byBkb24ndCBhbGxvdyBzZWxlY3Rpb24NCj4+IG9mIGFsdGl2ZWMgd2hlbiBlNTUwMCBpcyBzZWxl
Y3RlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhl
Lmxlcm95QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgfCA4ICstLS0tLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
S2NvbmZpZy5jcHV0eXBlIHwgOCArKysrLS0tLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0KPj4gaW5kZXggZDU0ZTFmZTAz
NTUxLi4wMjc0MmZhY2Y4OTUgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvTWFrZWZpbGUN
Cj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9NYWtlZmlsZQ0KPj4gQEAgLTE2OCwxMyArMTY4LDcgQEAg
ZW5kaWYNCj4+ICAgQ0ZMQUdTLSQoQ09ORklHX1RBUkdFVF9DUFVfQk9PTCkgKz0gJChjYWxsIGNj
LW9wdGlvbiwtbWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKSkNCj4+ICAgQUZMQUdTLSQoQ09ORklH
X1RBUkdFVF9DUFVfQk9PTCkgKz0gJChjYWxsIGNjLW9wdGlvbiwtbWNwdT0kKENPTkZJR19UQVJH
RVRfQ1BVKSkNCj4+ICAgDQo+PiAtIyBBbHRpdmVjIG9wdGlvbiBub3QgYWxsb3dlZCB3aXRoIGU1
MDBtYzY0IGluIEdDQy4NCj4+IC1pZmRlZiBDT05GSUdfQUxUSVZFQw0KPj4gLUU1NTAwX0NQVSA6
PSAtbWNwdT1wb3dlcnBjNjQNCj4+IC1lbHNlDQo+PiAtRTU1MDBfQ1BVIDo9ICQoY2FsbCBjYy1v
cHRpb24sLW1jcHU9ZTUwMG1jNjQsLW1jcHU9cG93ZXJwYzY0KQ0KPj4gLWVuZGlmDQo+PiAtQ0ZM
QUdTLSQoQ09ORklHX0U1NTAwX0NQVSkgKz0gJChFNTUwMF9DUFUpDQo+PiArQ0ZMQUdTLSQoQ09O
RklHX0U1NTAwX0NQVSkgKz0gJChjYWxsIGNjLW9wdGlvbiwtbWNwdT1lNTAwbWM2NCwtbWNwdT1w
b3dlcnBjNjQpDQo+PiAgIENGTEFHUy0kKENPTkZJR19FNjUwMF9DUFUpICs9ICQoY2FsbCBjYy1v
cHRpb24sLW1jcHU9ZTY1MDAsJChFNTUwMF9DUFUpKQ0KPiANCj4gSGVsbG8hIEkgdGhpbmsgdGhh
dCB0aGVyZSBpcyBhbiBpc3N1ZS4gQWZ0ZXIgcmVtb3ZhbCBvZiBFNTUwMF9DUFUNCj4gdmFyaWFi
bGUgZmV3IGxpbmUgYWJvdmUsIGl0IGNhbm5vdCBiZSB1c2VkIGluIENGTEFHUy0kKENPTkZJR19F
NjUwMF9DUFUpDQo+IGFzc2lnbm1lbnQsIGJlY2F1c2UgaXQgaXMgZW1wdHkuDQo+IA0KDQpBaCB5
ZXMsIHlvdSBhcmUgcmlnaHQuDQoNCkl0IHNob3VsZCBiZSBmaXhlZCBieSANCmh0dHBzOi8vZ2l0
aHViLmNvbS9saW51eHBwYy9saW51eC9jb21taXQvZjI2MzZlYWFjN2RlZTFkN2QwOTZjYzExNWZm
NGY1MTExYjBjNTA4Yw0KDQpNaWNoYWVsLCBJIHNlZSB0aGUgcGF0Y2ggaXMgaW4gbmV4dC10ZXN0
LiBDYW4geW91IGFkZDoNCg0KRml4ZXM6IGQ2YjU1MWI4ZjkwYyAoInBvd2VycGMvNjRlOiBGaXgg
YnVpbGQgZmFpbHVyZSB3aXRoIEdDQyAxMiANCih1bnJlY29nbml6ZWQgb3Bjb2RlOiBgd3J0ZWVp
JykiKQ0KDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
