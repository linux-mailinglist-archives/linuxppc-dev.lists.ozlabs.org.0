Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD38A627E56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9ptR3tzdz3cND
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:45:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zoPXwhfW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::626; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=zoPXwhfW;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9psW47nXz2xDv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:44:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvVjy78lwK75mprDKYpQCkC1nQARQW5dW3LWDPub9krLAMzWVjKn/Lv7EXilEAM2E0/xoutRiXmhvFBsMXBkkpOJB5B3bF1eXECTso0eBirWtm7j/zCv6I61n0zaQSfWyuO4lWBYRMI2qOh6lYPCyzsaa9dCP/ZjkvcYWpAqojELqaNI6q0MMKP3s23tM/QgZcO6YZW+kih0ftAJK0dFITqJBqtW3SYvbKlBtgLG0s5MPNXhVrYYERBlr7ws1Jks9iq27482kvbeH0njA51k0f8QSNyIUZSaXmXXuzsU6664lez0iNcucgJm84HjvL7Wt+HJ6n21K3JUXhvOPMEv6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPX2bW5NxcuxhUFaJx0fSu2bpOsJPeOfkonwOlHuVo8=;
 b=WXv3emt1GG08HxDWuF1QBQp6Py9RBtYEUWijk/OHxEwvNAdYPf36YngYNei6Yick6T4/eHiA6fwDMas0Yrpv++W48dFNClGQxR/g1GbIOlKS4olVOZjzm/2WZJncp1nUNBn3zxbxHQHDEWoQpq2dstxhFyLqW9VcHXIh5lUUAOycJRvxppeEmpqRPVxywjGv33/kT0bg06F1ODFOKYdPcyjRnh5a0RqF+Xu3CwNRo1TWmV6q8b+rfjHLuw8wYZeY1QdkQLyu9wnkC7sbEX8gZDeXfuNwUn6Fjd1alFjaTUDv1+mBjKoIAf6F2PbqIksdRpInVY/Ey4+xTPsbQVDM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPX2bW5NxcuxhUFaJx0fSu2bpOsJPeOfkonwOlHuVo8=;
 b=zoPXwhfWMPtYq6x6fx49eimZWHTHzO7zq2zfJDr3k2GuQil1zhDE3Cxr7NrtUf9uKXf6JCr/R/XJdo+SvS/9/N/j5YelDn/+BZjyP2rYBIetxHB/zphnFEhZPpn8jtvDgOlW4CKt3b4ffHF5b2+93mPjqOz8s/Xeuo1HFyH1snHG2C2jSSHjQw4Jjga3Cgf4atmnwff6nKQDY7FQHHRL39SGVG1flXeBxMgjnLrBrfshUBNt9nW1LP3mV75gfShRCw85fe1c+uLc4M4mVBAoQ+I+uoUS1vrYSCHN566NRyc1rtL8F3wm+BluNKGFLYHgTNlBWVgV6yH17Z1/alFjEw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1900.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:43:56 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:43:55 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>, Julia Lawall
	<Julia.Lawall@inria.fr>, Frederic Barrat <fbarrat@linux.ibm.com>, Bjorn
 Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] cxl: fix typo in comment
Thread-Topic: [PATCH] cxl: fix typo in comment
Thread-Index: AQHYbQO1/HQHR9YwdkCW6DkT1tBRDq0rjPCAgRPmjIA=
Date: Mon, 14 Nov 2022 12:43:55 +0000
Message-ID: <48936161-3e97-e8bb-1f85-ea511c13571e@csgroup.eu>
References: <20220521111145.81697-82-Julia.Lawall@inria.fr>
 <2835d67e-8ca0-cc2d-b86e-b2ac254428ab@linux.ibm.com>
In-Reply-To: <2835d67e-8ca0-cc2d-b86e-b2ac254428ab@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1900:EE_
x-ms-office365-filtering-correlation-id: 65ea18d6-07e4-4f58-6c63-08dac63de4c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  /grcm00CV816uQs2oz/EL9Rva9vntLCvznjw+v23QcSbZp270C3IGVODD2kQCHBCYSQqVBGEr8bDBrmolol0PxTn1bo24ETB4tZODemCqxJjGJ8NCLT06EK8yFXJyDZrZMJ/fWeyEQ0sr+2ELIjJuZoWg4WUdbHMbyQoew6JznGWJm3KBzuV6CWuQ83roZSoYSJW8i8SgIbchbqLdPb6Y6GOyKcdx3sD+Ah/N3M+y9t8gNy1Q1xrG6TGYP8Ed4jGSuaSzH34md2OmLNMjS33AyZXHxH8jzwPPLNzPvp/Z+/wIFpk9a6+PO6UYFiGs8sTMzdyeNKWLqx2sRhEO+H1Vqhhdo2cfMyjvHSgqI7DlAbTRcJTo3uasO+u3YUb00aWAv4kyzLmC94Y7TT02kCO52agkC8uuI9Cht4gT7sUnM7dxqJyzvec+kC19NJWefiupCd3v9L07pLN/12exrtQbMzl6KVdwlBIu1ib1e8gjEMznicxAKPIrQpx2M9fVlA7+SEWU1EG1sNRpT6aNjOrDyCiWckKBUSxCUcbyibRHKgwczw855FhSNx3mqTNq1sck8ZXlpAJdFX6Zy4KTCDKxZ0tWKrn+QnCoNS8CEMLLCG6JH7ggp6UwA0ZfRZMKlNQDJNU1NI5x4TZhvp/4bPhMzCUcXg8WJ0nG5uavSsPddvI6F5in+oFwwzmmc/lo9CLXstc3Pj1vLJPCCcpkCrHt37RG5r3x2VVLIAntVYNaKBIGDVFxCupHH/cfuz2z/9CSefDnDi8+TztW95YM9A9xlEhRzqfViFbTweOKZj62qVKBVuAq0ityqcLPbmlX3BFsAG1jBv4pA1qiJ+sw5C8pA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(39850400004)(366004)(136003)(451199015)(71200400001)(478600001)(54906003)(110136005)(6486002)(31686004)(5660300002)(186003)(8936002)(44832011)(36756003)(2616005)(6506007)(41300700001)(2906002)(26005)(91956017)(53546011)(66556008)(66476007)(66446008)(316002)(76116006)(4326008)(8676002)(64756008)(6512007)(66946007)(558084003)(83380400001)(86362001)(38100700002)(31696002)(38070700005)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ajNHT3JpOGE1UXYvMGdTZ3h1cjdSekpEc1U0cGRRSTVrUTY3alBvSTBOVDQv?=
 =?utf-8?B?TEhkK3V5QTVLdzN5WDVhMFZ3Rjh0cWlZaHo3TElDeXlvTzJ6WVVjTU5OSUg3?=
 =?utf-8?B?Q2plVzBPRlpUcHJTdk1rK0YxV1RxZXdHVjVOOUhuUkdCWStSQ0tBdzVCZ3do?=
 =?utf-8?B?YUhTZjNIYk12K0ljbzhYT201NW5ZSkdjWndDZEx5WU90RGw2dk5GcWVNdkQ1?=
 =?utf-8?B?UDFETVQybDltZVBNM1VVNGRhRGtoNGZOLzQ0ZUswdFBNd3VWakdyL0hqVWVP?=
 =?utf-8?B?KzJnYTdmZEV1RXFLTy9xUG01cmNISzE1QUJ6czlKRGZzNjlycE1CMzY5L3pG?=
 =?utf-8?B?dTJ2WS85cmFZcmNQQzBkZEZUUUNTVFEreTV1OVhMS1NaSkNZbENPNXZPSmVG?=
 =?utf-8?B?dFJSYWxxTlBwRVJKTGQ1b3VxSE5BRm84YUhNSld2ZElXNThiSFBLWXFPMlJi?=
 =?utf-8?B?N25VZFpkcDVGdHBaaDJiTm95RHZKeXdMMzBNS0hSQ1hzMHpxdExvMDNibHdJ?=
 =?utf-8?B?L0U1Q2g2a2QxamhXcDFiWEpLdkpTczd4QTNlVG9LRG9SVHpTbkFNakdpSkJB?=
 =?utf-8?B?QWFYTVVoN0lyMUtneDZVR0M0NHo4dFBTVXdXb2hOT1BSbWk5ajQ2TS83bXNp?=
 =?utf-8?B?WUpNV1lhSEtKd3lxT2s4NFRpQ1ZsbDd0czZkZjh5ZE5iODRSTG5PczdTenRy?=
 =?utf-8?B?c3RnMVc4Z0lYdE9aR3hUdnMxNVBZUCtvanM2T005TzdhOUxZemxEM1dKU2lO?=
 =?utf-8?B?WnVwS2swNWRnNVdtOFh5RTM5aEtUQWFtZXdJUURmRTY0bE05Um1TVUZwVWxs?=
 =?utf-8?B?czZtWG9RWEIzWjViSUlWRW5ybWZJclY5WGZXZ1ExM283VnRLRXZZYUNYVmxs?=
 =?utf-8?B?NmNuQ0dLZ2kyOGFqSEh1Uk5lT3Y4dXB5LzJGaXVEbWE1Wk5FZUI2TllXMnVX?=
 =?utf-8?B?MUVhWU1QYUlndVBhSk00ZjArZmNpcU9aZEp2a2cydHJTVzU2YXMwOXZyd3lJ?=
 =?utf-8?B?WFl3em9KdEN3aFlIK2ZhL0dnbEpVdVBHZVpoNXNrQ25uV2Q3aGhRMnpYZHhL?=
 =?utf-8?B?bnpHQlNWZ1B0a1dndXVDNEVTa21DQm80SlBUTWF6ZVB0QmREZ2wxc2JZcmdh?=
 =?utf-8?B?OWRZak9WT00za05TODBwLzkyYkxmU1VDWTB6cHZqK0Nmc3BCdFM1MExQZ3lW?=
 =?utf-8?B?UEJ4aUdhQlJwVUNrUlNtRE1pZUtvVTRrYmIveitWeUd2MU5ZSjFkWW1Mb3Y4?=
 =?utf-8?B?bm9SRmtvYnJLT1FSUE1xUlVzTld2TGNnUkpnNVZLVkdkR1M0ZUs4aDVUQVlB?=
 =?utf-8?B?bDdYUFdzWWpSc09KeEhSWnVVVys2dEp2TTBEb0JpWmlsY25Ca3FBcEZ5MFdH?=
 =?utf-8?B?cURuS2FtWityMHYyVytrVmlZbm9XMXkxb2tWbTc3WlVPN0lGanpEcmk4UFVw?=
 =?utf-8?B?cjRobzY1OWppVHRiNVlaMk5JUGdCczRlZCs4aWZoYXJsVTBVeUZBTWlqYUJP?=
 =?utf-8?B?L1FPcFhEblV1akthalpVU1l4RWZlRFpBMDZKd2NuTWMrRlVJWTJIbnBlazcw?=
 =?utf-8?B?cWhzc2dGWHJlMGlHMTJpK0tnSWhPTmZxMUhwdEMwOExTZVRNMjBjWTZaOUhp?=
 =?utf-8?B?eGVWeEdKMGltcTJhMCtMSGRwYTZJYnBwclhCbkNCSGdEWGdUZEFiTzNGREdV?=
 =?utf-8?B?UzZJU3dmVEVQcVVVMUZmV0VtRzFxM2FjRDkvcEdGaC9SMEQzeTB4WUFDS2dQ?=
 =?utf-8?B?MUVSZCtiUnFXeGM2SHQxemF1Ky9YZjVmVDNwYTZzMXYvRzZHeFVUaXNxSUl0?=
 =?utf-8?B?TGxYZkRkQjVERmZLdVRSK0ZwZXF3VUIrekV3Z0VHWW5zdUtaOGh4V3VQQ1NP?=
 =?utf-8?B?Zy91Sll6cmdVUHVZZjhhTk5zdFNBMWlKVHF5Rm9jdEdFZjEvc2VQT0hJVHhD?=
 =?utf-8?B?VTZtUWhwNm0wUUx1S2x1SFhFSXZSMGFKdlB6UUQ5d2pTYnBoSFBhRkRIZWhZ?=
 =?utf-8?B?ZDMxbUNZcktIMjU5Z1ZlRFltUktBWGlWTG1acS9scFpNYTFwMjdvNEZhcWlU?=
 =?utf-8?B?aDJCamxHVkgyYU45cnprN3oxTURCZm1aZWx3MFZvbkFGYzZLQVZjUkVVVTA2?=
 =?utf-8?B?b2tzZjIwQzZCSTYrMi9hN2hHdmtkaDdxQkdWUFEva0htT1h4YmxvTVNSR2hv?=
 =?utf-8?B?U1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F86747AD11AA6D449F01845E90F3DF79@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ea18d6-07e4-4f58-6c63-08dac63de4c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 12:43:55.9169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UptZmP7mPvE4sTMe7UZ5ZLZgMW/eHnWtCBbdlMmfuB4bnLT1PW9A8CO/RIzCzOOqc3m6Lnzd8G9B08spEM3VWR3AVcP4D3b4EpQVFg0xfV0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1900
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMjMvMDUvMjAyMiDDoCAwMToyNywgQW5kcmV3IERvbm5lbGxhbiBhIMOpY3JpdMKgOg0KPiBP
biAyMS81LzIyIDIxOjExLCBKdWxpYSBMYXdhbGwgd3JvdGU6DQo+PiBTcGVsbGluZyBtaXN0YWtl
ICh0cmlwbGUgbGV0dGVycykgaW4gY29tbWVudC4NCj4+IERldGVjdGVkIHdpdGggdGhlIGhlbHAg
b2YgQ29jY2luZWxsZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpYSBMYXdhbGwgPEp1bGlh
Lkxhd2FsbEBpbnJpYS5mcj4NCj4gDQo+IEFja2VkLWJ5OiBBbmRyZXcgRG9ubmVsbGFuIDxhamRA
bGludXguaWJtLmNvbT4NCj4gDQo+IA0KDQpIb3cgc2hvdWxkIGFwcGx5IHRoYXQgY2hhbmdlID8N
Cg0KVGhhbmtzDQpDaHJpc3RvcGhlDQo=
