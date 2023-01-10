Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29464663AED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 09:24:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrkPD6qc9z3cYd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 19:24:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1vV/qiv7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.72; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=1vV/qiv7;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2072.outbound.protection.outlook.com [40.107.9.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrkNC381Jz2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 19:23:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VrwkoV5hbFT+naERJba04TDHh61LM5TDE3YNYeIJyEYKcDzi4ZaEYsgPbNQRKeWr6l3E9/AbG3Wcyd58tDclfg60dfc5ADupyqUZwyY+GrDOIVNXnTEjcabk5+AWnNDQROZLpZW7g46nq7aF0EqzkaKe7VkwUATu/RgH6yQcFlFKg2eZc7AC3OCjK90Y3/ElFhwQNzLBZDMHYiGv6KU7/SaVMFltllBoFMfhkS4RewSynNnK4FaJXOfRkcMY3UNzudoib4hRZn5SWcFTsiGFnxPBL1iD1P/xmlSZzoMMgWVLE3T08XsucMVud/k91fkIOrLzAYNrKpzvRKkZtr6PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIVKvg30dMya/6HSNKRMbUv0I1h5EGNENwrtTlH9e0M=;
 b=lyOTtgDJMVZV4ZP/5yFSI9PD+Icc/EgkZL7fn6IuzEfXZbkvn1bodrZ92Ez+a9dcnSeRyuHsTjy3iedDE459eKZk8FYAN4jqcAaDrkB5lvS/svumODYDpE5B134CBDmHlu7xM375NabZEp62J+A72pV83ogfAaA/iImgr9VPQtMlamU1HIEKgvQkJvCPyGot1Mq0v4sDeV8Nyxu3zhqCQ1GTEjGabxNoodp/ffmmYDheJAJ7q8FxKo4fi6KjlpqfbQ1k6VFDm3x56cAPcNQlK1AmFGWcSxbmaME4DRPkJcvPgZCyGmu00rwWHIB3OfKbanrpGuz3Dlu7QU4uRx/P1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIVKvg30dMya/6HSNKRMbUv0I1h5EGNENwrtTlH9e0M=;
 b=1vV/qiv7ZyXEZsMvijkUqJRkdK0DrkHoRvZTiaZhTREjRcQdQLKpdXow6kC3POZLA3cyTPuvdT4WnwpEybOqAjlho15D3VObr+H3AvTCygwiN4hjc3SnWN0mQHn3PWs2p7sm8GZsicsIiqfD2wvwPdUGNdhZNtzcbsezJUWl0IzywkQZN58sERrTWfp21WqMl49JYYoifRj65SqluOhvewV/MuBad/FbKOl+Zwc3ZNi5ihIi3V/9iS7ehG8+Vk1fIeNxL/DQkFkAZkeQNqSgjBICQZidQkT3qcFDwxP9Qtad72Fe8TMiB7tgRWLM3YZnL0RB+d3LnbBXcq4BiLUKHQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1963.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:23:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%7]) with mapi id 15.20.5986.018; Tue, 10 Jan 2023
 08:23:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu
 Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
	<festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v2 04/10] powerpc/8xx: Use a larger CPM1 command check
 mask
Thread-Topic: [PATCH v2 04/10] powerpc/8xx: Use a larger CPM1 command check
 mask
Thread-Index: AQHZIe1D9QEwSf/dLEacU5m+8047TK6XVaUA
Date: Tue, 10 Jan 2023 08:23:01 +0000
Message-ID: <072b0a98-bea8-cac5-1df4-0eb49bf380af@csgroup.eu>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-5-herve.codina@bootlin.com>
In-Reply-To: <20230106163746.439717-5-herve.codina@bootlin.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1963:EE_
x-ms-office365-filtering-correlation-id: 8680ac61-4963-4207-4818-08daf2e3e393
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  kRcrOQK1ZkFqHk2eKWNcpk2ZV7vXPZmxzMq5MZEsjnMxeiqNQyOlfRCqv14iRF/tehxqrNTQxfq53FTogkyWUKbbxcPoLWcPrwQI9/AiO+Oj60yQ3JDSjuQpgNdxqdWA604RQe9UY6ytAXSYqHQt/pwF0X181WasN8Q18lIaRH8mb2Jmw4V6bngjH7jSbgHJ9aX9DQrJsWfLXTCnEAh2aZTzuZmlQl+mYoXz40b8OHFN9ZsB7WvFUSGxE/ZypUDWcOUB/gSg+OKZ949z7/EfyHZ9WZ771aVV/GEhXN62OjFF9XCACHHdcRlwrL14NnGZx0N5wAs06E7wf8muDozeEO1/V0X4dvxoyjnDFuJZJb8FMDrzpjGcu1QI+KJYzNXtcOm3ImNZvaddN4CwdjPT8osPIHXxZEsfeRGJ9SjBCpkK0AdiKfeey0vig1He3Vwk3kGBm0Nwamo45BM3WFtFO1U/9x6lWlsgNTx8LzgUFmCoNmIZBfgXbOKUrtZGQkPQHIfT1U2E20DAlt4YghqqRR2JvXEE1pkvbg8v4hPGA7m1pKt2LchpfplHYvI/1kbilGvLTDjjU74u+fOnZ6o6AaImLx5j07AtiA3QkfIbkfNQLJo5hBR0dv/SiqjukbVW2v7YW7AcevDl29UR6gfwXdLiUMJo/C2kYRakX8uCPfflGNcMDLYw+CxOHuOlXb1T1vMVEcVnvpQuhXK+e0sbFWXs+ESyWvix7zLttkBEk5pvK06cQkWxTxMUpyQ6wjAXs1iyso4TmB9QFebuS1ehXH5bSNIKCDNQO1auadPDN5E=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199015)(7416002)(5660300002)(316002)(44832011)(71200400001)(26005)(6512007)(186003)(478600001)(6486002)(2616005)(31696002)(66574015)(41300700001)(91956017)(66946007)(76116006)(54906003)(110136005)(4326008)(66446008)(66556008)(66476007)(8676002)(64756008)(8936002)(38070700005)(83380400001)(86362001)(36756003)(31686004)(6506007)(122000001)(38100700002)(2906002)(921005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?S05zMnFlNUNvL0ZEeGxRNWppbGdZcFlKRGphenBuemZsTlBEYTRad25aWkpn?=
 =?utf-8?B?ZjNRN1lZZEdkMHhwWkFueXRkWDBLM1BhNzg1NWlVd3BpTFo5ZGpHTnlrS3pr?=
 =?utf-8?B?L2IwRG5aSEp4aGJTRzdGM3hvZVR4UWI1ckI3MXNYTjZkV1Mvd3ZKNGdXMGlN?=
 =?utf-8?B?T0liVC9HbDBoMm1UeStiUTFPUEFFa3lTVnRCQXNyWjNjUUsyRStpbjljN2k3?=
 =?utf-8?B?R2hUV0JRUmU2ak5aVWV2SUNidHBSdnFpYk9sUVNNcFhBalA0alFDRjlFeTYw?=
 =?utf-8?B?WVV0dTZQTzMvU0E5V28wMWFUdzVmRVVYQ01wTWdMdWQ1OWdtQzcxUXg2TlVi?=
 =?utf-8?B?eGlvb25nOWQ5QXJvdGpNSHA4YnBDKzNVaFRydE1OQ3FDek1QRUFhQ2lreUNq?=
 =?utf-8?B?WlFUOFdXT3FFOWdFVmpqMk1MYTc0bUlLRjVXK0ZSWXAzM29kM2pwck8rbm5C?=
 =?utf-8?B?c3NoNFBWOGVMQ2ZvSDVlWkM4T0hneXVqc1NmOGtwTmVvSko5NjRXSnFOL0Zm?=
 =?utf-8?B?Vlhxdyt5UmJ3SDkwbEVvZFpwWnhEdjRiaDZzWWY0WnYxVVdHZ2owU0E5SDY0?=
 =?utf-8?B?Q0U1SjhUaDJjZGx2Q3diUkQxUi9NZ3NWSVorVFFndGlBK0lDWkM1dTVKYit2?=
 =?utf-8?B?YUlGZnUycWtFYkhNV1c5TlBXa25wbnFwUDJKSm9lb0ZZc0Y5eTJjekE4MVpE?=
 =?utf-8?B?dEFRUHNsaVdLRmJscm9jakZDT0tRdktJVGdYT0ZQamMvZkV2N2x6UmV2NW54?=
 =?utf-8?B?WWg5OHJWd2FIZXN5QWxHZk0wcE4yUERxYVZqaVcxS3lLSW5IWUdDSVN4YSt3?=
 =?utf-8?B?bURrU0xxcUJ3RWhrTGoxQnlqK0RmMzJLd1NYTGVRbndWTHltWEc3UTJOcTFz?=
 =?utf-8?B?UTZ2c0liazR2b0J1K2tybjI5K21yc21hdEI0L1JRNWg3b3NaK1pyc2N5ZTF0?=
 =?utf-8?B?blhxS2FsU2R2T3RObURlVmhsZjRhcmJOMGN6eHlJSFNmbWo1bUlYNjJWd0RU?=
 =?utf-8?B?bFVrTk55eHNrbTVSdnF5WXpXWXNheURZV0FFRmFTYzBVTUFCZW8yUlJyMGNE?=
 =?utf-8?B?RVhlNGxZWUpRZGJNbFlMR25NSTY5dkFvMEdja1BGZ3cwWGtFZjJONHY2Q1lI?=
 =?utf-8?B?L0tUbDB0YUVsY1NKMTNqeFFMeHhyK0RTakFjRFBnUzY0R2t6eXM1cDlKaUdt?=
 =?utf-8?B?Ym4xSS9BYVdlUXZYMmdxMFE4WkJTT1dvMHVqSmpmcUk0aVIxYWNmMjJVV296?=
 =?utf-8?B?ZHdISm9ZbzJhRFE5V05RNXMzNnZLdFR4STZpTlVVOFRDQi90b2krMW1Vdkdn?=
 =?utf-8?B?UEZOS29STVlIeEJmZm5xY0U1S2RtbFFIL3lQbllmUTEycmlVcmtLa0JDN1Jh?=
 =?utf-8?B?YjRJK0M0VlNINHRRMmtqQmg0ZUlpSk03elplMVE3cS8weFdEQXRtQ3NidDNV?=
 =?utf-8?B?cUYwNFpkazY5MnZzY2M0WmR0enVXeEpvMFpDSjFqcitMd3pUSTFRZUtNSitk?=
 =?utf-8?B?cmp6QVI2T2htUEFSMVBxZnRRVHlyN2tMUUdMVHVodkEyaFp5UzJVRkZMT2JD?=
 =?utf-8?B?S1BYMTNsOGtHTmlMMGFNVzZ1QnlpckRWZ01rVlJRYmJYQmowSkpaem8zQkcz?=
 =?utf-8?B?cDA1VjhYNWFEU2ErbzNESXVTODgwSUFaanFMblZzVjZ0bWFpQXk5Ylp0Mmtw?=
 =?utf-8?B?RnhNZmJzUnJUTHd0MDBCbDNDdWR3MWxGNkl3bUNMd096U3VIblBqZUdzazJ3?=
 =?utf-8?B?MkZyMTlzNDNKL3ZIdE01SHZKa3EvRkVMZ2hVZmdjbGJEbTU4MlZnUzFiQlFn?=
 =?utf-8?B?SkFkN0k3YUhiWUZyRFpwUzhnZ3JuZUo3SDhGa1ZXU3NPbENJbHh4eC9Wc3JV?=
 =?utf-8?B?SjZOK1hzaW5VcEQ2MmZnbVBlUjUzUzJwZW92dThIaHYyOUxyc2YyS1VZMy9H?=
 =?utf-8?B?aWU5QThGbzNkZTFEWkROR2xNZjNrR29FTlg1UXhPeGd5OHRBZlZzbDRTNGRh?=
 =?utf-8?B?Q05jVU5UV3hzQ1JndENYSm0vR3g5THN0WlRYc3hvWDU4eERYbnBTeXFCL0Nq?=
 =?utf-8?B?ZFBkZGR1WDhMRXJaSFZHaG8xL0NvdERuWXdZcHA2d3JxMHlST3A1d1BmOWV2?=
 =?utf-8?B?VmQvamRsR0taUDg0UTJTdFR2MlpMbEFvdXZZa3VpcUlVMGNjYzhWekJaQTlz?=
 =?utf-8?B?QVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3796450FE836994D9D76FB81E8F27154@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680ac61-4963-4207-4818-08daf2e3e393
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2023 08:23:01.5612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mgkHg2GUuKY2GD4awpWZsM/HqCfk4CsQ+rFdIK00FbIm2V80YK8e65C9BzCT2JBpXbx3KkVOn4IkWbmoI81O2wCLfeV3J3cYp6bSnLg4S+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1963
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAxLzIwMjMgw6AgMTc6MzcsIEhlcnZlIENvZGluYSBhIMOpY3JpdMKgOg0KPiBU
aGUgQ1BNMSBjb21tYW5kIG1hc2sgaXMgZGVmaW5lZCBmb3IgdXNlIHdpdGggdGhlIHN0YW5kYXJk
DQo+IENQTTEgY29tbWFuZCByZWdpc3RlciBhcyBkZXNjcmliZWQgaW4gdGhlIHVzZXIncyBtYW51
YWw6DQo+ICAgIDAgIHwxICAgICAgICAzfDQgICAgN3w4ICAgMTF8MTIgICAgICAxNHwgMTV8DQo+
ICAgIFJTVHwgICAgLSAgICAgfE9QQ09ERXxDSF9OVU18ICAgICAtICAgIHxGTEd8DQo+IA0KPiBJ
biB0aGUgUU1DIGV4dGVuc2lvbiB0aGUgQ1BNMSBjb21tYW5kIHJlZ2lzdGVyIGlzIHJlZGVmaW5l
ZA0KPiAoUU1DIHN1cHBsZW1lbnQgdXNlcidzIG1hbnVlbCkgd2l0aCB0aGUgZm9sbG93aW5nIG1h
cHBpbmc6DQo+ICAgIDAgIHwxICAgICAgICAzfDQgICAgN3w4ICAgICAgICAgICAxM3wxNHwgMTV8
DQo+ICAgIFJTVHxRTUMgT1BDT0RFfCAgMTExMHxDSEFOTkVMX05VTUJFUnwgLXxGTEd8DQo+IA0K
PiBFeHRlbmQgdGhlIGNoZWNrIGNvbW1hbmQgbWFzayBpbiBvcmRlciB0byBzdXBwb3J0IGJvdGgg
dGhlDQo+IHN0YW5kYXJkIENIX05VTSBmaWVsZCBhbmQgdGhlIFFNQyBleHRlbnNpb24gQ0hBTk5F
TF9OVU1CRVINCj4gZmllbGQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhl
cnZlLmNvZGluYUBib290bGluLmNvbT4NCg0KQWNrZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gKEFzIG1haW50YWluZXIgDQpvZiBMSU5VWCBGT1Ig
UE9XRVJQQyBFTUJFRERFRCBQUEM4WFgpDQoNCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy84eHgvY3BtMS5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvOHh4L2NwbTEuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvOHh4L2NwbTEuYw0KPiBpbmRl
eCA4ZWYxZjQzOTIwODYuLjZiODI4YjlmOTBkOSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBj
L3BsYXRmb3Jtcy84eHgvY3BtMS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvOHh4
L2NwbTEuYw0KPiBAQCAtMTAwLDcgKzEwMCw3IEBAIGludCBjcG1fY29tbWFuZCh1MzIgY29tbWFu
ZCwgdTggb3Bjb2RlKQ0KPiAgIAlpbnQgaSwgcmV0Ow0KPiAgIAl1bnNpZ25lZCBsb25nIGZsYWdz
Ow0KPiAgIA0KPiAtCWlmIChjb21tYW5kICYgMHhmZmZmZmYwZikNCj4gKwlpZiAoY29tbWFuZCAm
IDB4ZmZmZmZmMDMpDQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gICAJc3Bpbl9sb2Nr
X2lycXNhdmUoJmNtZF9sb2NrLCBmbGFncyk7DQo=
