Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F26476E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 20:58:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSlN12nQJz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 06:58:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ohb+vKqW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::619; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=ohb+vKqW;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSlLz64qRz30Qy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 06:58:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqDOBvJOh6SuLzx+t9y6MdX717Q643nBI5FZMaWnBb+b981fbeCo94AwtDK8zuggbuy9wsnEcTIvFZbdp0V1/4zF5Kzi1mvzn/x5fw2NN8et/jaK+leBq+nfhPapGRDEoPaY/cRmuFM3GCIAOsOeVd9sBJCOko+HbCol4avzaKXkfTBvMiSfdc4HLHc0QEmMDlusnm7Nso42zubIImlWI9qzNA03KEjKpVQmuRTZ8Jtq5a9K76kQz0AAuMua38aYEqMk8N7bdFWY2x0Rgpb8eBdltbOkAwyQxkqbpBv644qr5F5UTQBacHofvv5iirKQehkQhBUIeZ+I6EWsI/UKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jjq9+dvzpyDYSFVkzv7vwoC+liUoAHV72db/y/h5H7k=;
 b=Z2lYHgbAtrfjGRB0Ocl3C5rHOn1L7bbOVJIkYkzpySA6Uw5R0buup40AcMqF/damVuRxW25WSNUfPZP59Wgz3kQAMEp3c1nvlOTk+nRoomDefywCieQdRjiBGuDKcdWd7OngR0+mpAeSAaU25UV5PVuJd4E1TAD7uhVNReX4RMdpX53kUF74YtU6bPF/hxEnPe321K4wT2APwezs/DR0nvEqrIgWpFGQP4gsj5mG1LQosV2KmA8oQWVivZnwb53DOv3zcfuSqHShlCwakBQ66RC4tmnxlekEEQs8q9t+JS8RWg+ymFEfr5E4eWnhUOez+GlAsIrU5Z4Z4aq/9q3u6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jjq9+dvzpyDYSFVkzv7vwoC+liUoAHV72db/y/h5H7k=;
 b=ohb+vKqWxw3svrsxtsgNhMNs8h1RSh+R6lz7Oxru6swT9qspD2+V0gUEmHjXok98Zh5Pzzh9pUeXFXJ9T3bfqHluSHi99Q5y+8WYOtbjvjM5Kfr8vke3L+IQe3ZqujdQD3a6OUWmr73YWa91tATlR+JdTG2NY6MGMpll3FQNvnV/LKzV6IvfGxji++xOQAdLmD244oV2ss87kydC8dzXekOcQT26nkmOtlZsnN5Nvm7vov/wyshzRMOp5m/NnMtUZM/vTDQW3UCmpCSJffSQoYjxwa2g/7wJ5TCdeXrSn8sSorzBGCHBQ79j7IkVDW/49ga16pxBtAksGsHBSg5e4g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB3408.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 19:57:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 19:57:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v3] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index:  AQHYusSLeJySvCAqP0OhPUxxriPKGa3Eku+AgAABwQCAAACcgIAAAKWAgKBniwCAAAuhgA==
Date: Thu, 8 Dec 2022 19:57:39 +0000
Message-ID: <aca70dc9-2185-9def-7bc0-b415bec8a5c6@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220828095659.4061-1-pali@kernel.org>
 <e3cb2642-20e4-6c26-104d-329a04260946@csgroup.eu>
 <c8d657db-02da-7840-5b40-755e47277a2c@csgroup.eu>
 <20220828174135.rcql4uiunqbnn5gh@pali>
 <d49c5905-ff68-00e9-ddaf-d60d5e5ebe65@csgroup.eu>
 <20221208191602.diywrt3g2f6zmt4s@pali>
In-Reply-To: <20221208191602.diywrt3g2f6zmt4s@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB3408:EE_
x-ms-office365-filtering-correlation-id: 317088d5-50fa-49b8-0549-08dad95675e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QOsUbZrVN/tkCZFzfqezYwZbSqdpI+hZmIawFSUIOeMNLzRO6wqEeKkPM+CAlJ3VCqykqxO5YDU20wwSEG4fE0q70a3f/VrqklEkSlm4Aq05YinsreHcMhA9XuW0SleQokM4G5/9SCG+Tc1ssDLeb4paSH1Tq05knmxwrL+bDmrtCM32W0HXZIVmndBkQ/simt3gAU+CTQ4F6g8teOXcAYMmTjDj2ug4CMcQc2E/2WJUZwqMxmIuOD1tmOvd9xCfq1Fc9mBII1CmXQ9mbdq12rpzx5eGBteVvFvnHVxiFpaMPudicXNn7I9IeD7FDvmvRiD1HsgCZH+dWjA94iH/V/3pk6HuMhAX+3xIHH43O0VKv3WVCQFMt/uZAWwAiBjU886r8SAaTEeN2AUbq551DKIEKFI33In09ARr2bCcJscAcDJD6yl+eYn/w3+1aUutolB6cLxxLnJ09051RPZAbmPo8aJCTFFgMfoEkQMdylxqEsqy9fS3bjbsXqQSta1JHUOIGjUnB2SCjsUbIubf+Cwsa6JssZxZkzmGGBKoPkzU36SJmSru51JhdT2T0WcuHCjC6C5HLUulFaobPnZWKVYDcDUpXT31hmOXx8Qundu1dRu3+DncW/lCLZZVVUGtTfMjfz+S2Pjc/g29cWXHDvqGjv0CyGUxp4k45IpY+zMJZqfe7zRqzNsHm6LuTfMOjLPzqg1P6QG4VhDt0UMAOCVUS8N1kuoCar/YSZi/47hFi99meyganTnDRY/mNunGeKoUfIkCqUEA4tSCfIwiOc20+qeDi4fdGqhSuZx1XO4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199015)(36756003)(54906003)(66574015)(83380400001)(6916009)(41300700001)(186003)(316002)(2906002)(2616005)(31686004)(966005)(6486002)(71200400001)(478600001)(38100700002)(5660300002)(6506007)(86362001)(44832011)(31696002)(6512007)(8676002)(38070700005)(91956017)(122000001)(26005)(8936002)(66476007)(4326008)(66946007)(66446008)(66556008)(76116006)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bkcxdTVPMmNmYVVOUUZiN2RZWHp1R1MyenZCZ2RqK2NvaWhKemt4VmVSNjNw?=
 =?utf-8?B?Q1hNQmw4L0VKMDNSOE9XeE1XSWRLc3h1ejZUVDRENG5mbTV2bjlIc2lkdDBu?=
 =?utf-8?B?d2F4R055TGZCWExWOHcvRHZxRVlDNjVzdHhSdkZTdnBBNzNKcW5ucjVVRHFl?=
 =?utf-8?B?emxLZG5kSFBvbzVnMWRGbUV3ZjZSU3VWU0dici9kdEJIKzZPZUJ4Vmxyb1Ju?=
 =?utf-8?B?RmhYNnZ4ak9MbTYzeE8zUEhnT0R1ME9WMzJuNXN6bmNSdExrYytoeXpCcXQz?=
 =?utf-8?B?ZEtnQ25Ha040WjF1Y0MrdjB3WnRndk9SU1RwRkxoMjNoaDRpS2NWZ2xHRWdQ?=
 =?utf-8?B?YWVYZC9SNUl5TVFBaVY3UmlSUFJxQTZWUHhNa1ZvOVNEdjNETllYL2JZY1V4?=
 =?utf-8?B?U0hGTWVrT21zbUR4QlZTZFlPM0F1ZFMzZGxERHNSK3FKcU8weXYrNjdlRWIx?=
 =?utf-8?B?dGR0VHcrMzJ1WjJpZU9yOUpralBkV2VjSHA5UEorYUlnSTRrbGpkRUF0MC9w?=
 =?utf-8?B?SHRyblBtb1BhcitQR1FQNXZHYWNMOFhUVkJGdXpYbzBKR2xXdGF1aDkrNTE3?=
 =?utf-8?B?VzNmbmtvMlg0SCtUeVl4YlluK3lRemhBOXJqd1oxbGxhdXEwcVYvaEVqTzBr?=
 =?utf-8?B?Y3NUczhYWmt4N3VIbk05dmFUZXU1Y1pIZklERTBHQjlvWEZUTkwzbVIxMnJT?=
 =?utf-8?B?ZFQzcTNQNlByUUdHV2ZMSEZhWVNoMmJzTmRGV1FkcXZJaEpNa0lsRzYyLzRQ?=
 =?utf-8?B?eUZHVTVZd0crVmJnbU5NR09LVUc5MUR6M1ZoZHNlUy95NHBTVHRqQ01tTFRy?=
 =?utf-8?B?RC8xS1JyZGxtVkZ0bk43WmRtdlJzWFhqSW0wQkZFL1RyckordVBXclBxNzgz?=
 =?utf-8?B?c0lJaDlYbi8vR08wWXBKUXNmaWxOSGZtSHpYNlNDV2xMVXhLc2JxbCtURFNS?=
 =?utf-8?B?Z09ZVnE1TGwzbktrQmhaUjRxaHBvTzBFeTB5OXBGSVJOeUg0SkVGODUrSHda?=
 =?utf-8?B?ZEQwNjVPQmlBMC9temxYdUVRNFRLTHNJR28yMHg3S2tLRUQ5ZjhpMTdaNzJH?=
 =?utf-8?B?VDJ3QWxNSS9HVXYwTUNqamZiK0RyRmU0VzdPM1Z3aGFia081NEtrNWJwZjJu?=
 =?utf-8?B?RzFlcGlWK3pPcHdxRXVadmp6ZkdvMitFamt1aDR2cGFLVFlwandrOVJtaTRH?=
 =?utf-8?B?RXpZa3kwY2Uvb2tSOCtjM2NMaURmZ3gza2ZFVUFSZWpZYTVMR0lRdEp4VkNB?=
 =?utf-8?B?MlFudlRpblh1WWV1OForNTV0dndOVlpyZzR6QWhqT3N2MUdrVHM2WkVTdXd4?=
 =?utf-8?B?YjhNWU9SRjZYTlBRNFFlOW0rQ3NJaFkvd3dpci93bWpFN09oWjN2d0k4Mk9O?=
 =?utf-8?B?VzNnWWpxaUpHOUhaVnpjbHpqV2krWUJYSWs5b21CYUFmZjJQdFRMVzFnWGJG?=
 =?utf-8?B?TFRoYjhPYy9teWxPekdOR2lqcXlmcGtrZGNBOFZnZndqRmhvdVRKaTVkbFVi?=
 =?utf-8?B?b25peTlidFpUcFJRSFFHQndJZ0c2TW4rdUUreTQ5UitYSTQwSVM1OGgvUTRG?=
 =?utf-8?B?K2hsYnY5b1A3RG9Jclp6NFBXOFRWWlJudkhXMVVjRFBGZk40V2pINkNiRzV4?=
 =?utf-8?B?Mi9tQ3V5azViZFJ3RnQ4TjdGQTlONTNmQ2txT2wraCt2V2ZxWVF2U2ZVY2lY?=
 =?utf-8?B?YXNUZnZjQnJja3g3Z2JlT3NWVVEvY2RGaDZvczNIaE8wUkdMQVMrTzdmL3J3?=
 =?utf-8?B?ci80UndHZGx2Y2wrZHllVEFoR0tvemxpRjRiOHpCY2pTZHNVdHcrNE1ic1hC?=
 =?utf-8?B?a1dxd3ZYTXhQYmtjS0g0cHU2MFZoUGpKc2JEY254MGVGenNNY281UGZvMFla?=
 =?utf-8?B?bWVURld3R05CMGpibG8xUkRONmdxcUpNSXRTVVNYMjR1WTltVHNJemNsZ2p1?=
 =?utf-8?B?b2hHVzNQVlNOQ2ZRTWJlYXgyTG0xaXRmTUVHNFErOTZHbEsrWjJ0VHFQb0g0?=
 =?utf-8?B?c0l3b3BhR05RSjhEKzZObFBYdlVtdEdnckRkKy9ybzRFN1NoMmtra2RaRE9w?=
 =?utf-8?B?NUxQN2pseHFFdjVyTGI5dU1wQkNMMUgydHd2WCtZYm81L0dqTkxTRS96eW5s?=
 =?utf-8?B?dDR0dVlEenF6MERoSEZJYmRVUVNuSy9PRklDaDQrUDNUTWRGMnBhNGR6RXd1?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D4785E0622E37408BDCD8D0D7B31B66@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 317088d5-50fa-49b8-0549-08dad95675e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 19:57:39.3752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUtSOvgJqFVHmfx5jdoF9zcJneBQnSUQbGkTmN5ZHQdbD435ZCdqF6WzMbHu2mX7woprZ9SXkX+QqNDTfek6+hMZjpXbRjuLHmgDe/Ny06Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB3408
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA4LzEyLzIwMjIgw6AgMjA6MTYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFN1bmRheSAyOCBBdWd1c3QgMjAyMiAxNzo0Mzo1MyBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0K
Pj4gTGUgMjgvMDgvMjAyMiDDoCAxOTo0MSwgUGFsaSBSb2jDoXIgYSDDqWNyaXTCoDoNCj4+PiBP
biBTdW5kYXkgMjggQXVndXN0IDIwMjIgMTc6Mzk6MjUgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToN
Cj4+Pj4gTGUgMjgvMDgvMjAyMiDDoCAxOTozMywgQ2hyaXN0b3BoZSBMZXJveSBhIMOpY3JpdMKg
Og0KPj4+Pj4NCj4+Pj4+DQo+Pj4+PiBMZSAyOC8wOC8yMDIyIMOgIDExOjU2LCBQYWxpIFJvaMOh
ciBhIMOpY3JpdMKgOg0KPj4+Pj4+IFdoZW4gQ09ORklHX1RBUkdFVF9DUFUgaXMgc3BlY2lmaWVk
IHRoZW4gcGFzcyBpdHMgdmFsdWUgdG8gdGhlIGNvbXBpbGVyDQo+Pj4+Pj4gLW1jcHUgb3B0aW9u
LiBUaGlzIGZpeGVzIGZvbGxvd2luZyBidWlsZCBlcnJvciB3aGVuIGJ1aWxkaW5nIGtlcm5lbCB3
aXRoDQo+Pj4+Pj4gcG93ZXJwYyBlNTAwIFNQRSBjYXBhYmxlIGNyb3NzIGNvbXBpbGVyczoNCj4+
Pj4+Pg0KPj4+Pj4+ICAgwqDCoMKgwqAgQk9PVEFTwqAgYXJjaC9wb3dlcnBjL2Jvb3QvY3J0MC5v
DQo+Pj4+Pj4gICDCoMKgIHBvd2VycGMtbGludXgtZ251c3BlLWdjYzogZXJyb3I6IHVucmVjb2du
aXplZCBhcmd1bWVudCBpbiBvcHRpb24NCj4+Pj4+PiDigJgtbWNwdT1wb3dlcnBj4oCZDQo+Pj4+
Pj4gICDCoMKgIHBvd2VycGMtbGludXgtZ251c3BlLWdjYzogbm90ZTogdmFsaWQgYXJndW1lbnRz
IHRvIOKAmC1tY3B1PeKAmSBhcmU6DQo+Pj4+Pj4gODU0MCA4NTQ4IG5hdGl2ZQ0KPj4+Pj4+ICAg
wqDCoCBtYWtlWzFdOiAqKiogW2FyY2gvcG93ZXJwYy9ib290L01ha2VmaWxlOjIzMToNCj4+Pj4+
PiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dIEVycm9yIDENCj4+Pj4+DQo+Pj4+PiBjb3JlbmV0
NjRfc21wX2RlZmNvbmZpZyA6DQo+Pj4+Pg0KPj4+Pj4gICAgwqAgQk9PVEFTwqAgYXJjaC9wb3dl
cnBjL2Jvb3QvY3J0MC5vDQo+Pj4+PiBwb3dlcnBjNjQtbGludXgtZ2NjOiBlcnJvcjogbWlzc2lu
ZyBhcmd1bWVudCB0byAnLW1jcHU9Jw0KPj4+Pj4gbWFrZVsxXTogKioqIFthcmNoL3Bvd2VycGMv
Ym9vdC9NYWtlZmlsZToyMzcgOiBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm9dDQo+Pj4+PiBFcnJl
dXIgMQ0KPj4+Pj4gbWFrZTogKioqIFthcmNoL3Bvd2VycGMvTWFrZWZpbGU6MjUzIDogdUltYWdl
XSBFcnJldXIgMg0KPj4+Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4+IFNlZW1zIGxpa2UgaW4gZmFjdCwg
RTU1MDBfQ1BVIGFuZCBFNjUwMF9DUFUgYXJlIG5vdCB0YWtlbiBpbnRvIGFjY291bnQNCj4+Pj4g
aW4gQ09ORklHX1RBUkdFVF9DUFUsIGFuZCBnZXQgc3BlY2lhbCB0cmVhdG1lbnQgZGlyZWN0bHkg
aW4NCj4+Pj4gYXJjaC9wb3dlcnBjL01ha2VmaWxlLg0KPj4+Pg0KPj4+PiBUaGlzIGdvZXMgdW5u
b3RpY2VkIGJlY2F1c2Ugb2YgQ0ZMQUdTLSQoQ09ORklHX1RBUkdFVF9DUFVfQk9PTCkgKz0NCj4+
Pj4gJChjYWxsIGNjLW9wdGlvbiwtbWNwdT0kKENPTkZJR19UQVJHRVRfQ1BVKSkNCj4+Pj4NCj4+
Pj4gSSB0aGluayB3ZSBuZWVkIHRvIGZpeCB0aGF0IHByaW9yIHRvIHlvdXIgcGF0Y2guDQo+Pj4N
Cj4+PiBJdCBsb29rcyBsaWtlIHRoYXQgQ09ORklHX1RBUkdFVF9DUFUgaXMgYnJva2VuLg0KPj4+
DQo+Pj4gICAgICQgbWFrZSBBUkNIPXBvd2VycGMgY29yZW5ldDY0X3NtcF9kZWZjb25maWcgQ1JP
U1NfQ09NUElMRT1wb3dlcnBjNjQtbGludXgtZ251LQ0KPj4+ICAgICAuLi4NCj4+PiAgICAgIyBj
b25maWd1cmF0aW9uIHdyaXR0ZW4gdG8gLmNvbmZpZw0KPj4+DQo+Pj4gICAgICQgZ3JlcCBDT05G
SUdfVEFSR0VUX0NQVSAuY29uZmlnDQo+Pj4gICAgIENPTkZJR19UQVJHRVRfQ1BVX0JPT0w9eQ0K
Pj4+DQo+Pj4gQ09ORklHX1RBUkdFVF9DUFVfQk9PTCBpcyBzZXQgYnV0IENPTkZJR19UQVJHRVRf
Q1BVIG5vdCENCj4+DQo+PiBZZXMsIGJlY2F1c2UgdGhlcmUgaXMgbm8gZGVmYXVsdCB2YWx1ZSBm
b3IgRTU1MDBfQ1BVIGFuZCBFNjUwMF9DUFUuIFdlDQo+PiBuZWVkIHRvIGFkZCBvbmUgZm9yIGVh
Y2guDQo+IA0KPiBXaXRoICJbUEFUQ0ggdjFdIHBvd2VycGMvNjQ6IFNldCBkZWZhdWx0IENQVSBp
biBLY29uZmlnIiBwYXRjaCBmcm9tDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4cHBj
LWRldi8zZmQ2MGMyZDhhMjg2NjhhNDJiNzY2YjE4MzYyYTUyNmVmNDdlNzU3LjE2NzA0MjAyODEu
Z2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8NCj4gdGhpcyBjaGFuZ2UgZG9lcyBub3Qg
dGhyb3cgYWJvdmUgY29tcGlsZSBlcnJvciBhbnltb3JlLg0KDQoNClRoYXQgcGF0Y2ggc2hvdWxk
IGxhbmQgaW4gcG93ZXJwYy9uZXh0IHNvb24uIFdoZW4gaXQgaGFzIGxhbmRlZCwgY291bGQgDQp5
b3UgcmVzZW50IHRoaXMgcGF0Y2ggc28gdGhhdCBzbm93cGF0Y2ggY2hlY2tzIHRoZSBidWlsZCBh
Z2FpbiA/DQoNCkJlY2F1c2UgYXQgdGhlIHRpbWUgYmVpbmcgaXQgaXMgZmxhZ2dlZCBhcyAiZmFp
bGVkIiwgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBj
LWRldi9wYXRjaC8yMDIyMDgyODA5NTY1OS40MDYxLTEtcGFsaUBrZXJuZWwub3JnLw0KDQpDaHJp
c3RvcGhlDQo=
