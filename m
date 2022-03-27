Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 839164E870F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 11:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KR95Y3MtKz3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 20:10:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::60f;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KR9553vbSz3c03
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 20:09:43 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MlwxT4Zc+4kqSdglfcTVSe3kkbRh1kjtfsNirLU88Wy4DPRZTlRGB95QDZv8A8pFOhsSaQ1KNGyYO08H2n7exBh3UoEprIrVs7Sm3yb9rSjYRA2oTeo6NYrkw8ujRX/cHegyUgZhmdZWPTHxSDe6hO0V3MYwgHn3I/UXInUyN1LLSwCDutYU4k1FqcT1XLWA9fuQDk6XtZjQddtQ5Siu29XIWiMFylWGyn/Ar4DXMbEe81GDuMwCMJaB7RYvuZOWUw/ftBIY4QxPY5wevuYyf0Rkdc3U/y6LVEeQvgwmJNeQLxCHNcVPBVKNvNungqVdBhGGipcUsOWbZCsfW430SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzJrCNf+e8lzQ9rof0l96np4bfkbCJE80R7PRgvbsE0=;
 b=Ukj2pWJ4Y/foduxlkGkg+xkNdAtXJe7zn1Lmtm79azIdKMRy+4GKmUw9792M8RIkTO80CesE4wLCZBmbJOKVdXIgyeEH8AnidMyRudz6Lh2Krr9SvyRACcs9M+Hm4rIsrZM1ODiwAudfnEZKyvmVnF/tnP58c/Vro1r4Uj8f/CEc2005s4q8rjo3S7DDoxXPQJ7jooE+jzxDTjWwGtG1cAumciAy4HxS2yIbcqstb8VEpY7k2C7KqPFpqpJ2kLTclVBPLyy085CqMTAuWWnjs2PbVByOLtujdm7sLAG+LGuzbOiLiv2q5UrTq1eGEMcWDG7/r1EHZvcX8I9NMkx+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2195.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:14::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Sun, 27 Mar
 2022 09:09:20 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::cd2f:d05d:9aa3:400d%6]) with mapi id 15.20.5102.022; Sun, 27 Mar 2022
 09:09:20 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, "jpoimboe@redhat.com"
 <jpoimboe@redhat.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Topic: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Thread-Index: AQHYOsOkMhd+XrYXYE6fzWpV8XELvKzS/yUA
Date: Sun, 27 Mar 2022 09:09:20 +0000
Message-ID: <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
In-Reply-To: <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 765b9e2a-78ad-420d-dacb-08da0fd17a6b
x-ms-traffictypediagnostic: MR1P264MB2195:EE_
x-microsoft-antispam-prvs: <MR1P264MB2195780D0DAE374A6C7383E8ED1C9@MR1P264MB2195.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OPtof7R2T540kByLnu1MVqQ/oXfcarZFhz7rDXBJM8iUA6lofGV0D5gXFg3DpFFFzVGFjOko7rfPnrhIeI5RQc4wZFAWwAmTt/tcdSLna3PVj9EOeBuk7PIU12VirJbfYfWfT7OI77YnwecSMR+BeDMz1Ub/4eCvTgG8pVfQ28eBZyPaNfnK6/TffasUuFtjWI9Gnn3qH+H8oDVrBxCE7Glq/rHk2BeiTg3nMEPgAAdBKh81Ak8TUT3gpZCZvvmfaN5HpP3tbOyNSJqs8UgYXTo+W0cCZfXgg+0wm0wEdOxtzqQOfDt0tGhB4cLh056Ej0EK2OwmTJVTnaNr8NUbh2CBF1Rs2MSe9wRdE9DYwQDFeHqsnfeSn0bIRxyg0p9G/bmkQebROJbVYdKnGEN4djwBJZxUTn/XK/+WGdzpo86aa7wZ/HA5T5KFGyThBNoHZow2j+2R06PITC/TnY40+cmTXwUnJqPTK3sAyQ+WlqTESReu4SF3ucoVfiv2Occwh7j0nBlVoZzjWKb23dq+MEPofTTrnyGTPSVstc3ovCpPEiQoSeYdKtdKZ1utzecSkaWxOXnKubQxo2HuRs5SXtoTpC/kmTcwXlvlXqrQMRkaF7AhCTs4hQmxh/e0BXIgP714I7DTgHNKcIKH9k455vKafkNn+itywslmkmfIh2CDRcYLYgAun6caRIl7Qh0ttavxPCO3BpAnAOXAXG4WR5AbjuCteOHiHa7fxlSl3MywkxYk39+vvn4a3/Et6ii4XqAd4Q1TYw6+QhOfzwkj9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(71200400001)(6512007)(31686004)(2906002)(316002)(86362001)(44832011)(2616005)(186003)(6506007)(91956017)(38100700002)(508600001)(110136005)(4326008)(26005)(38070700005)(76116006)(6486002)(8936002)(31696002)(8676002)(66446008)(5660300002)(122000001)(54906003)(64756008)(66476007)(66946007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2pQNjJGQW5rVUxJU1ExMWx3YmVKeGRiL2VBUjFyS0pzRzVzWHRyMngxWm81?=
 =?utf-8?B?SnQvMWU2aXBVeEZLWkxSY3lsdlpySlVrT0RTbDJZT3RwVWFCMWpKTkoyTFYr?=
 =?utf-8?B?ek02d0pZbDFPMDZIclE0cEt3dEg0Z3o3VzBCK0twclRoVlFhOThYTVZSSmUz?=
 =?utf-8?B?ZThxeENYdWNSeXJkWTVZRGZrRSs4RnFqeHE5eTVOTnpjQUpZdzVUOTFTS2Zw?=
 =?utf-8?B?RUx6akxGSEgyb1ltMnIzckZaU1lBMDY2VzZtVjkxOVoxTUROaXpVN2JrZWhv?=
 =?utf-8?B?L3hXYUMwOXFrajVYMmRYWUNhaFJVNnRLZWlsZVhhbDd5YXRsRDdydlFVdVFI?=
 =?utf-8?B?NkdmeUJNYWJMZUo5UVZrMDFiRFhxRmpqSW9ZSzhIVnViOS9rN25MSzQ0bGRz?=
 =?utf-8?B?TXV1aGpDM1FtZEx2MUJyS2xwNC9aWXNiVkQ3VVBoSnlHSHNMZUlKOHh0d2FI?=
 =?utf-8?B?R0xmSmpKV2pvSHJzYTZIUi9rSUIxNTZBMFIzSXhqVjE0UmVxdkhrazBQdEFE?=
 =?utf-8?B?UmxSLyt4S3FJRUsxazEwcXpoNitKRlEyMEFwN0xYWVpVOVRDeDRmNW4xTkIy?=
 =?utf-8?B?bnp4MjBlSjR1ak5veHRDRzgyNGtKdGQrVERXaEI2Yi9Dais5dHROUERZaE4r?=
 =?utf-8?B?aUlMU1Uxd3JYRjhhMndoZDZmbDJTYmZmWElJVUprc0REY3hFOWIwa0JiUHdh?=
 =?utf-8?B?NzEyRllwditVdEVnVDI5U1dCNndSMDhaakw2TTlJdVo1c00ydDNJM1BVNlZZ?=
 =?utf-8?B?RzZ3bmJKY2VRZGRiSU05cXVTd04zTUtFcGFXRytEZW5laDNnNGV3dkRYaFZU?=
 =?utf-8?B?MkgyNm0vUkFCYzJ4RFV5OTFidUZGU2hQRHRRZ3ZVVXJVT09UNHh3TGtsZUpi?=
 =?utf-8?B?bmdhOENYVkpNSFEvamE1TVJiMHlzRXZ6N0F4ZGtxMERjeDdQUGsyOEdDYllz?=
 =?utf-8?B?eC9hT2pybVlvQkowQVovTGFLVlRmMUdPTXB0UTc2VW1nS0RvanlYcFoxeG9B?=
 =?utf-8?B?SHVZWSsvK0hVcHpsOTA3T0RKNC85UUp1UG1BZTZLTWpGLzRIUE1qeXBXWjBm?=
 =?utf-8?B?bUN2Mm43emRZeEZqcG9IOEpVQUx5NnhsYnpnWXJGYmhGRll1b3dmTVF0ekdK?=
 =?utf-8?B?cGdGL1h3ZWxralE2TnRxM3RCRkUvNjdiVW03VTF3aUpQTEF2ajVvQW5GNXNi?=
 =?utf-8?B?VTZKMTBuMnFLcXRnOTB0bVhUZTZ6aWNML25kWitZTWFHZ0FVOG90aWJpV3gy?=
 =?utf-8?B?djlsaUdsTmYwbFcyelpYcmZia3MrL1dVMm4xOFlHOUxpSnN3cE9iVGQyc25q?=
 =?utf-8?B?b2pCK0U1ZTlvVnRvNXJtNVNlV2F0THQrRk5CbDQ1NlNQNytiN1R3cXQ5RnEx?=
 =?utf-8?B?SlRudTNEMElMOXpyK3VUbDRBUmsxK2paMzZQaFMvSFIrT1hXMGxObnVMYmho?=
 =?utf-8?B?UzVoU0U4ZzZCMk9UaW94Mm5DSURCUDlBYnRFdlQvb2QrUjFoaHAvRTF2T2wv?=
 =?utf-8?B?ZVcyTExZeXNvUk5uMzVQajhtaTZyeUlDVXlnNkRJRUMvTkloZjI5bVE3K21a?=
 =?utf-8?B?bUZHamhyS1owUVA1eUpSbFJSTzNvRnROSUR2RThLc0t2cllDRGVzWktYYVNm?=
 =?utf-8?B?OE1XOW82dVpYRDg3ckFuODFLT05Kd3A3WUdNUnR4MDRDV0dlM2ZmSGZuais4?=
 =?utf-8?B?dS9wc0JFcVBEYnBCRVI3TTlRWnJaSTlOc3lpVWxpOCs3MFl0Mit1NUhiV3pk?=
 =?utf-8?B?c0c5VnBVUU5mTmdWeGZ2SFFVSVMvdUNzODNXKzEzNmxkRUxMdE4yem9qZHpV?=
 =?utf-8?B?WkswS2xkdlBaaDFlcC9lOTZqakRQeXVSRW92ZDd4WUF5WTkzUTBjMmEvY0sr?=
 =?utf-8?B?cnJFRmJUbjR1KzBDdk02NlhGdGIvWXZaMk5ubFpNc0MycFpVQ2grSWFLM0Qr?=
 =?utf-8?B?Uy9KTFVvY0pwam5tUTNDYnBiQjdVdTFtaitwMnVibnhETVJZTjR3QWI1eTlh?=
 =?utf-8?B?NThINXF4MGlSNitYcE1pSmZpV1dFell1djdtc1VHUGZVWUJUNXAra0Jod09r?=
 =?utf-8?B?THZxTzRrU0ZLQ3JhWHM0MC9YbVNXUGJOSTAwWjdhM090ak40N3I5UFcrTjVa?=
 =?utf-8?B?QWZ6bUxyL3YxTHUwaTIvdTBkU1R1bSthZzdITFh6ZVdmQVoxNUFzMnFrNXRQ?=
 =?utf-8?B?SzJNd2hjVi9wMFVNYis1YWpqQWFNWnFrMkd6VnorRWJWcWFjUDdhR3NDSUxq?=
 =?utf-8?B?OUNzTGFiWnFwUmhOVG1oOUE4RnJLeU5tVzM3MUdsQi9zU2t1WTIrWEgvWFd6?=
 =?utf-8?B?eTZ5TndNaWV6bTdRdDA3M3RIREpPaVV0ajBMTXJ1NC9vd3hpY3hUWWJBUGNq?=
 =?utf-8?Q?xOJXeEw6Aqy3P1WNGHMzKHQRV1S+nznhr+jqg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63755ABA4BE5CD4B89278662E8C4C80F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 765b9e2a-78ad-420d-dacb-08da0fd17a6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2022 09:09:20.1878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1sC3DinAaM0hDDPPwjNbXtbfAvL1PU+PnMNyui1H4EE159N2SCVsrx/O9h4Xk2s0fFjOJx+hrWU2qgy+1yvO345iGjjD3auqnyhmwxaVTu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2195
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUGV0ZXIsIEhpIEpvc2gNCg0KTGUgMTgvMDMvMjAyMiDDoCAxMzoyNiwgUGV0ZXIgWmlqbHN0
cmEgYSDDqWNyaXTCoDoNCj4gT24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgMDQ6MjE6NDBQTSArMDUz
MCwgU2F0aHZpa2EgVmFzaXJlZGR5IHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBhZGRzIHBvd2VycGMg
c3BlY2lmaWMgZnVuY3Rpb25zIHJlcXVpcmVkIGZvcg0KPj4gJ29ianRvb2wgbWNvdW50JyB0byB3
b3JrLCBhbmQgZW5hYmxlcyBtY291bnQgZm9yIHBwYy4NCj4gDQo+IEkgd291bGQgbG92ZSB0byBz
ZWUgbW9yZSBvYmp0b29sIGVuYWJsZW1lbnQgZm9yIFBvd2VyIDotKQ0KPiANCj4gDQoNCkknbSBh
bHNvIHZlcnkgaGFwcHkgc29tZW9uZSBzdGFydGVkIHRvIGxvb2sgYXQgaXQuDQoNCkkgdGhvdWdo
dCBpdCB3b3VsZCBiZSBtb3JlIGRpZmZpY3VsdCB0byBnZXQgaXQgd29yayBvbiBwb3dlcnBjLg0K
DQpJbWwgbG9va2luZyBmb3J3YXJkIHRvIGJlaW5nIGFibGUgdG8gdXNlIGl0IGFuZCBpbXBsZW1l
bnQgSU5MSU5FIFNUQVRJQyANCkNBTExzIG9uIFBQQzMyIHRvIHN0YXJ0IHdpdGguDQoNCkknbSB3
b25kZXJpbmcgd2hhdCBhcmUgdGhlIHBsYW5zIG9uIHlvdXIgc2lkZSBhbmQgd2hhdCB3ZSBzaG91
bGQgd2FpdCANCmZvciBhbmQgd2hhdCB3ZSBjb3VsZCBzdGFydCB3aXRoLg0KDQpJIGNvdWxkIGRv
IHRoZSBzYW1lIGFzIGRvbmUgYnkgU2F0aHZpa2EgZm9yIHN0YXRpYyBjYWxscywgaW4gZXh0ZW5z
byBnZXQgDQppdCBvdXQgb2YgY2hlY2suYyBpbnRvIGEgc3RhbmRhbG9uZSBmZWF0dXJlLiBPbiB0
aGUgb3RoZXIgaGFuZCBJIA0KdW5kZXJzdG9vZCB0aGF0IEpvc2ggaXMgYWxzbyB3b3JraW5nIGF0
IG1ha2luZyB0aGUgZGlmZmVyZW50IGZlYXR1cmVzIG9mIA0Kb2JqdG9vbCBpbmRlcGVuZGFudCwg
c28gc2hvdWxkIEkgd2FpdCBmb3IgdGhhdCA/IEFueSBpZGVhIG9mIHdoZW4gaXQgDQpjb21lcyBv
dXQgPw0KDQpTZWNvbmQgcG9pbnQgaXMgdGhlIGVuZGlhbmVzcyBhbmQgMzIvNjQgc2VsZWN0aW9u
LCBlc3BlY2lhbGx5IHdoZW4gDQpjcm9zc2J1aWxkaW5nLiBUaGVyZSBpcyBhbHJlYWR5IHNvbWUg
c3R1ZmYgcmVnYXJkaW5nIGVuZGlhbmVzcyBiYXNlZCBvbiANCmJzd2FwX2lmX25lZWRlZCgpIGJ1
dCB0aGF0J3MgYmFzZWQgb24gY29uc3RhbnQgc2VsZWN0aW9uIGF0IGJ1aWxkIHRpbWUgDQphbmQg
SSBjb3VsZG4ndCBmaW5kIGFuIGVhc3kgd2F5IHRvIHNldCBpdCBjb25kaXRpb25hbHkgYmFzZWQg
b24gdGhlIA0KdGFyZ2V0IGJlaW5nIGJ1aWx0Lg0KDQpSZWdhcmRpbmcgMzIvNjQgc2VsZWN0aW9u
LCB0aGVyZSBpcyBhbG1vc3Qgbm90aGluZywgaXQncyBiYXNlZCBvbiB1c2luZyANCnR5cGUgJ2xv
bmcnIHdoaWNoIG1lYW5zIHRoYXQgYXQgdGhlIHRpbWUgYmVpbmcgdGhlIHRhcmdldCBhbmQgdGhl
IGJ1aWxkIA0KcGxhdGZvcm0gbXVzdCBib3RoIGJlIDMyIGJpdHMgb3IgNjQgYml0cy4NCg0KRm9y
IGJvdGggY2FzZXMgKGVuZGlhbmVzcyBhbmQgMzIvNjQpIEkgdGhpbmsgdGhlIHNvbHV0aW9uIHNo
b3VsZCANCnByb2JhYmx5IGJlIHRvIHN0YXJ0IHdpdGggdGhlIGZpbGVmb3JtYXQgb2YgdGhlIG9i
amVjdCBmaWxlIGJlaW5nIA0KcmV3b3JrZWQgYnkgb2JqdG9vbC4NCg0KV2hhdCBhcmUgY3VycmVu
dCB3b3JrcyBpbiBwcm9ncmVzcyBvbiBvYmp0b29sID8gU2hvdWxkIEkgd2FpdCBKb3NoJ3MgDQpj
aGFuZ2VzIGJlZm9yZSBzdGFydGluZyBsb29raW5nIGF0IGFsbCB0aGlzID8gU2hvdWxkIEkgd2Fp
dCBmb3IgYW55dGhpbmcgDQplbHNlID8NCg0KQ2hyaXN0b3BoZQ==
