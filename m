Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A49135B6D19
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 14:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRjKW54Ngz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 22:22:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=C+DjV3QF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=104.47.25.104; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=C+DjV3QF;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01lp0104.outbound.protection.outlook.com [104.47.25.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRjJj0j02z2yPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 22:22:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsCu1dX033hFjpy8mryVkvzB9+N1/to75Jr/jis4oqoLFAViyFjv+nPHwsHN+ChWUzE1kiJ3N7x3PiXc1pSivRyfZz+eo/qxIXsY605RpyxD7d77Gy+EAcksvTEsa6ax82gnk03cLPMyXiJY9gazgtXZLQNsvu03+ku8LXHORb9HmsS5+TaotG7K+r8EGuklKBno9EoWijaRHoVJCPDKiRjM1MMm4FCybaolcIC4fQjmomz/oGDpA/HfLbwB25AFR6NZNTWPXdjrJ51DVCjaCQnVavDSDElMJeSprXLiWjETBZ9kTWltCJIAkvB2mNkMxbgft5SBnaoBRfXAzYvKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20Oqgt71FN1gAv7TR4O6airSP5uD0IUZBSb2sOnLPxE=;
 b=PgChRI3tfxI5CXhHmwNvgVVVTRfa+CRrKQ+JT55nhpIhnaMSTkqobkOCLZmfP6CoLCrx9fCdCpzWAAY6EfAJIpvCCgpugztL7A6g7UP9Hz1xwv8kTVN9L0Oi+r2YS/yoOoDAOZXrKg9OZ4Tj6q5jRQ5oRrICc7J4r2libwBIYj7DnUr/yFslo60tUbOlENs93U2FMTRyaoC+WlxkWpnCUPCN/LbfexNXsX4SunVj0HCznk9Py1/qAbQGI1dNN0IhbPKQkqwew3gB+ucSg8lLfCvEr1kvL/cwcuuCnueeAxaaGMgRr9sOn6gxKdL64YXowmuFxqx1/VF8yYbbsVBHtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20Oqgt71FN1gAv7TR4O6airSP5uD0IUZBSb2sOnLPxE=;
 b=C+DjV3QFBIyENX/gn9BrFq32fe3bOQ1XcmvoKQ2zuv9mH0hthMvX3jWRUV2ZSBFAp1jsEj6xrvyC/YBtZ6IlobM4CSQ8swKYybqh1jr/zk+tjB728dTCh8L12Mfv4TpU2ubWziNBvt+lkBZkjAbgOCbhJvOcsZOrW7Glw8/iRJW9FNUPgDYj3WGWfuH2Gwue84JaPajICNDml0veoa+NXu1kIvroffWUpCptgccDKsUeqoetB96RFzWS9JNxqHmjGXCtT3pVyYACAtjzhhWbr4B0d3nIyTIUmq5G/13qJdYBoIfNsgjgcRlKyUG3j04LRW/CDqeJgceqsgRQC7BYQg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB2247.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 12:21:51 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%5]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 12:21:51 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>, Sathvika Vasireddy
	<sv@linux.ibm.com>
Subject: Re: [PATCH v3 02/16] powerpc: Override __ALIGN and __ALIGN_STR macros
Thread-Topic: [PATCH v3 02/16] powerpc: Override __ALIGN and __ALIGN_STR
 macros
Thread-Index: AQHYxoCR38pgxIoMh0u0ZJLXsNI2w63dRMgAgAAFAwA=
Date: Tue, 13 Sep 2022 12:21:51 +0000
Message-ID: <8480c380-2eb9-4eff-ceb4-f8bbcb425149@csgroup.eu>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <20220912082020.226755-3-sv@linux.ibm.com>
 <YyBxqjtC0DAhmQrT@hirez.programming.kicks-ass.net>
In-Reply-To: <YyBxqjtC0DAhmQrT@hirez.programming.kicks-ass.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB2247:EE_
x-ms-office365-filtering-correlation-id: 3cd75615-a1d8-4a68-d56c-08da958289bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1+sj3c5qif2vIklZcPJ9Lwjkn+dxiGHBjpe0Nm7MWraPeEfgvuWiKK6p9O17/xvZYwZ87AS4a1FTuWbIQTnwfsj46xHgpm6z2RFl0zAOUywnNEDoJLo1a+oSRTtejxyFfyGHI4nb7QlpTHRV34hQZM6Aq33RKBtam6hsiNyzwO1a3S2I36fEEVYxS88j+xwQZTwbwsFe4I/aOFbJYixB5R36CrSG24q9py9TyfScW+zXflAU2ZuD9ZLO8EYZ+aVeWiuYZ3vOds40Kx5f429SM/OONssjQEpYVr8dbPmNJ5rn17+ecoc+HZfUp/lWwZeFe7XETs6p8W19TBzOnSwcqyYUnFQM61eqTN368Ew+lW4xg6lhnJZVAAJmX8gFa17eh8lhkj1Im/qOQtUqfT8gG0NHbgzdg3LuLU4gkbJoM37aG5LvQKPy0ZhtDajuFibXpV+YBI4qYrNL33MP22wmgwylUg9SwK0lHmTw/J200YS70JalyMugEKtgknKaKjQrodoZgK5zss+SL84Cl65oRpZpOvIiW+Llhfl8sBej+JrWeA5PFJb+6OheG5ry87eKR9ql8VdF7CbstCBUXiL1klwt8rfyzqCAp2B3RAid1vgQyNGAUVVIHuLMFHBlKRtWiaVd5Gtj4bdXJmUiyw2VDM406/L1UgXaDPwAzSD++CxbmPw9ThgNAiAMjttCjCPYBWFDcUWiGCofqWQpppi0sAdHqXhANFCJfreMr7Hu5KaXM+wy/IXLGwyqpmiXHQBYA0slb42gqpvUor/fM5WMGiM7w98x2wNVlQMNk4I3AvkNyl6cYmDc67vmI0OSwCA2Vk8yeL204a5CgQjCEjL2uA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(39850400004)(376002)(451199015)(6506007)(316002)(54906003)(41300700001)(66476007)(38070700005)(76116006)(2616005)(71200400001)(6512007)(36756003)(66446008)(44832011)(122000001)(4326008)(66574015)(66556008)(6486002)(478600001)(186003)(7416002)(66946007)(8936002)(110136005)(2906002)(5660300002)(86362001)(91956017)(31696002)(8676002)(38100700002)(26005)(31686004)(64756008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?NnluSFA4WkhzV0Y5eHhmeEFlSkFvckdSZUtoUVVwWEg4OFNKSGswQ3RxMy9m?=
 =?utf-8?B?SGUwNm55aytzL0paS1Zlc3dyODh2Sm9IWDZGSk1RQnRqcGtxWUpUaE9ZZXg3?=
 =?utf-8?B?L2hyWmlRYUk0WitoblB1ckhNbWVTQXl0UWVqK1dLMGJXRzVaTDVUWFVTQjBT?=
 =?utf-8?B?UVpDN2RiUllybDJsMFFVOXhONWVCTGRhRjhORVZpL1NzY3o2b0JHeGVpREZo?=
 =?utf-8?B?MjJjZ2NiS1FXM0NXSGhYaE5XaHlRaWVJeGhITU5tTjRHQmZjL29mb0t3cnc1?=
 =?utf-8?B?eS94QkVKS2lRWHRaR05DL2hSbEFtaHJEbXRHb2doR0xWYTRGY2J6QlNEd3Fl?=
 =?utf-8?B?QjNJSDhKNmRXVFJ4TlBmSUVYZlRTZzNZUGdEa3pKY3B2eXEySGxhT3NIajJQ?=
 =?utf-8?B?M0RkaTIvbTlTd3dOckVEWkhoWlFURW50UFJwSVg3aGNZNjFGNFFXS2NUOTVD?=
 =?utf-8?B?aEdsWUlNK2R3UkpBN1htUk1laXlyeFJHNy9OeTFHeHM4WkJTQ082N1ZMSmRU?=
 =?utf-8?B?TlRCNDQyWFR6SWVBMWk3YlhPaFgybU9JajJxTVJlYk16NE9iZUJNanNXamox?=
 =?utf-8?B?eVpBSWRDRjlQOXFOdEJGVU8yWFFSY25JTyszT21VVVZ4bHZhV3NDcjJOZi9N?=
 =?utf-8?B?b0xSbGFYZXk4L2JTRWNPSkFibktYTlc5YmFucExyWlV5TThvS2RnRmlCNE1u?=
 =?utf-8?B?QTJlSXV3WWhyT0gweExsNVl4Ymw3T2xWK244VGpXQU8zaFdhWjlqQ0lOclZM?=
 =?utf-8?B?cHl0Y00yVGYxaXlwN0dXMDR2L2laT3VoTFp3VFVMYWgxS3JrTTNxdGc2K0lK?=
 =?utf-8?B?NjZ2N3kvdUdtOXZnQTc1VjZQcllYWlNpNUNMZVZaaWZWNWRMa1BlVnhnTUFw?=
 =?utf-8?B?WWl6SjQxMG1uallqNXhJNWxZUVBkQjlmNG1EQkVPa3lJRGJEZXV0Q2ZNam5C?=
 =?utf-8?B?Z2c2N21hb08rWkZqQWJsRU9rVU84SDIxKzhKalRxcm4yMldaQlZ3djE3cXU4?=
 =?utf-8?B?Tmt0cGhHR2ZJOU5sb0Q2YkZkWmtaTWQvazZvTVBnOG83dmpOQ3hUYkxwcVhO?=
 =?utf-8?B?SXBsbW1SVklTdGNjVVBNTWt5WWdFdVE1VWltcnFkS0ozNmNVelR0cEd6Z3JR?=
 =?utf-8?B?dU1CK2ZiSWtLOVo0RUVhU3dHSkpDVEV5b0RmUXlmQUtGUU1iNis4V2dBa0tN?=
 =?utf-8?B?NURKTUtWWTJSTVBSRHN4ajNiYndDejVoVzRTVTBmL2w4b0pXNnUvMXE4TUxw?=
 =?utf-8?B?VlplMlJJRGg5em1aZW5zekpiSlBVK3drSHdSWHZPTFlwcFRjZGhoMFFpZ2J4?=
 =?utf-8?B?NHhHOTg0eEZOeHE3eGtHdmRSd0V1T1hsaERCVGRKc3hLQjI3dTZuTFBWQVQy?=
 =?utf-8?B?SXhLaHVZdG9FVzhWVWpkQURMWEZNeW1VcXhReVRBeEhnaXJrWUpnSGtwMHFL?=
 =?utf-8?B?N3d2N25COWNoMWVkVzdkSEEwV1QvUEptb2hmSUEvZzhQVUVjVVFYOVFFajVj?=
 =?utf-8?B?bDJMSC82TjY0U1Mwb0UwVmx1aGJacTJRdEV1aEVuNFM4dzJEMTNVRzVUMmgx?=
 =?utf-8?B?bGRLaHRMd0V4UEMwZmdXYTVJSXdaUWRLb2xFS29XSlVtYmJyVzVVOWcvVU1U?=
 =?utf-8?B?YVZ6dStuV0RYRklKclJ1cXNyamJGbHEwVDJkSTgzaXZsclZzK090SldQWWRz?=
 =?utf-8?B?VTVqK2ZvTkRpcFJUbFppV3RMWHVXaE9UbGNoNGp2bXBqa0lzM1FWbVJSdWJV?=
 =?utf-8?B?N2VJSFJYQjVvViswNkc4UWdZckNVWkJsWmY5eG5ScndkZWthaERwVjlGaUVY?=
 =?utf-8?B?Rm1IY2dSUDRWL3QxNjQrKzBKRFNoUjBOU1hsZzNOQ0dnOVNBK3p2U20vTG1p?=
 =?utf-8?B?N09jc1hoQlo4cGhjY0tVa1NRTlJYSWtIRjhuOGFLTm1MOHZGNVdtZ1NJTkZU?=
 =?utf-8?B?bERkdXhoZjA5dlhEVFE3a2FOUDFwUERxWlF3cVhKQ0hJZ2U4UDlBajREN1hF?=
 =?utf-8?B?UE5oQmgrUStoc1Zsdk1QYytmWFlobTBPM2Z3c1IxRHBzeUphTHMzanN5YnFn?=
 =?utf-8?B?bm42WHVPS1VBVTc1dUtuU2FDNHhTL3dpREdOQzEySW0yY2xYNzdwTVA1amJ5?=
 =?utf-8?B?L08yWDI3QmxIWUgxYU5SakF2SUJUT1BPRjJJcW9IUFE0aC9jS1EwelRvcFB6?=
 =?utf-8?Q?kkD7qeIXi+tCuP4IJd4ImlQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E159A45B8A1894292EDCF9A41F2EDB9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd75615-a1d8-4a68-d56c-08da958289bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 12:21:51.4797
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5KxttijUC3iZjHBCRJC3Alhs3YJhuTImw7cHWVH9/IfLznHy9gnVoKYVDFUF3mnuNb7zCj1yAFYaooMEZTXZ75Mi48OlkOKev6duWwQ+xk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB2247
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEzLzA5LzIwMjIgw6AgMTQ6MDMsIFBldGVyIFppamxzdHJhIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgU2VwIDEyLCAyMDIyIGF0IDAxOjUwOjA2UE0gKzA1MzAsIFNhdGh2aWthIFZhc2ly
ZWRkeSB3cm90ZToNCj4+IEluIGEgc3Vic2VxdWVudCBwYXRjaCwgd2Ugd291bGQgd2FudCB0byBh
bm5vdGF0ZSBwb3dlcnBjIGFzc2VtYmx5IGZ1bmN0aW9ucw0KPj4gd2l0aCBTWU1fRlVOQ19TVEFS
VF9MT0NBTCBtYWNyby4gVGhpcyBtYWNybyBkZXBlbmRzIG9uIF9fQUxJR04gbWFjcm8uDQo+Pg0K
Pj4gVGhlIGRlZmF1bHQgZXhwYW5zaW9uIG9mIF9fQUxJR04gbWFjcm8gaXM6DQo+PiAgICAgICAg
ICAjZGVmaW5lIF9fQUxJR04gICAgICAuYWxpZ24gNCwweDkwDQo+Pg0KPj4gU28sIG92ZXJyaWRl
IF9fQUxJR04gYW5kIF9fQUxJR05fU1RSIG1hY3JvcyB0byB1c2UgdGhlIHNhbWUgYWxpZ25tZW50
IGFzDQo+PiB0aGF0IG9mIHRoZSBleGlzdGluZyBfR0xPQkFMIG1hY3JvLiBBbHNvLCBkbyBub3Qg
cGFkIHdpdGggMHg5MCwgYmVjYXVzZQ0KPj4gcmVwZWF0ZWQgMHg5MHMgYXJlIG5vdCBhIG5vcCBv
ciB0cmFwIG9uIHBvd2VycGMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJl
ZGR5IDxzdkBsaW51eC5pYm0uY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9saW5rYWdlLmggfCAzICsrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25z
KCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9saW5rYWdl
LmggYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbGlua2FnZS5oDQo+PiBpbmRleCBiNzFiOTU4
MmU3NTQuLmI4OGQxZDJjZjMwNCAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9saW5rYWdlLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9saW5rYWdl
LmgNCj4+IEBAIC00LDYgKzQsOSBAQA0KPj4gICANCj4+ICAgI2luY2x1ZGUgPGFzbS90eXBlcy5o
Pg0KPj4gICANCj4+ICsjZGVmaW5lIF9fQUxJR04JCS5hbGlnbiAyDQo+PiArI2RlZmluZSBfX0FM
SUdOX1NUUgkiLmFsaWduIDIiDQo+IA0KPiBMaWtlIG1lbnRpb25lZCBsYXN0IHRpbWU7IEknbSBm
aXhpbmcgdGhpcyAoYnV0IHlvdSdyZSByaWdodCB0byBub3Qgd2FpdA0KPiBvbiB0aGF0KSwgdGhh
dCBzYWlkLCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHdyaXRlIGl0IGxpa2U6DQo+IA0KPiAjZGVm
aW5lIF9fQUxJR04JCS5iYWxpZ24gNA0KPiAjZGVmaW5lIF9fQUxJR05fU1RSCV9fc3RyaW5naWZ5
KF9fQUxJR04pDQoNCkJ5IHRoZSB3YXksIEkgY29tbWVudGVkIHRvIFNhdGh2aWthIHRvIG5vdCB1
c2UgX19zdHJpbmdpZnkoKSBpbiBvcmRlciB0byANCmF2b2lkIGhhdmluZyB0byBpbmNsdWRlIHN0
cmluZ2lmeS5oIGFzIHdlIGFyZSB0cnlpbmcgdG8gbWluaW1pc2UgDQpkZXBlbmRlbmNpZXMgYmV0
d2VlbiBoZWFkZXJzLg0KDQpTZXZlcmFsIG90aGVyIGFyY2hpdGVjdHVyZXMgYWxzbyBkbyBpdCB0
aGF0IHdheS4NCg0KVGhhdCBiZWluZyBzYWlkLCBpdCBjb3VsZCB0aGVuIGJlDQoNCiNkZWZpbmUg
X19BTElHTgkJLmJhbGlnbiA0DQojZGVmaW5lIF9fQUxJR05fU1RSCSIuYmFsaWduIDQiDQoNCj4g
DQo+IFRoYXQgc2FpZDsgd2l0aCBwb3dlciBpbnN0cnVjdGlvbnMgYmVpbmcgNCBieXRlcywgdGhl
IGFib3ZlIGFsaWdubWVudCBpcw0KPiBiYXNpY2FsbHkgbm8tYWxpZ25tZW50LCByaWdodD8NCj4g
DQoNClllcyBpbmRlZWQu
