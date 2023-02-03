Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0C668A1F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 19:25:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7kbQ47Zdz3f7L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 05:25:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Nd+HIboW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe0c::611; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Nd+HIboW;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0611.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7kZT3wRwz3f40
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 05:24:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANco7Lsm5RzgLxLhO9T2zUBkfc4+eL1mPBlorfI8TdV/MfY6wwzQB7aPIXMgV/AQoG+3OyLTHy7GjzD2GblrNKt4G5CBWZlCH03SEu6lybL0W+FW7lVaYzvSowFi8HIqSgOACxcLstOVE8e1B5OiAItdGo9iupQCrcR7GcDf+yU+2nK3r0U4Erz63oUpB+ocpA42XBzI5l+Hj/o3NhLrKEqffmZdJEViJcTZWVs8mMISO88PB6JN2ZUPaBxd6S9F8DDeQP2CqyJ5iWpKVPR48V81VUgr4//fZ/42RLVN112RkU5zrXgku1Y1bqUkrIIxX7x8QNnJ2GS+QOiYwDan7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riynLx7ETAk/i5RbyDbDqWZDRrCTKdWOsIwCkGsVjNw=;
 b=dhXLTvDK9rbXahC2sHn7cry2VdvE553AeOb+/HYCKC89PPj2i4+vd6CvYUj3rNqm3ylWSwAM+a3OwuuGJ7Z/KEptmIDqh+Bna/Tx0+kWnBfbFJLjxp9XAv5KhMtdQIHc3FUZ9R4CHFTTsJ7rtajoqFsl8UYgKCye6IIzz8nEC2R//Mw0eAM5JXRTY3n1t4FKqyH+c2Mw2TKPA2K4xJ4GGDZeC3RqqVI08qlVNmy17JYUzb3ex6C+MmTGtXWXJEf+Y1VYBWY45G8b0yd0D2GL8kMYAkj6JurXaWXA3i1aw4h7QwJyw4wCvrRf6C1SFlryWbWphCchowqP4IAVlGtYzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riynLx7ETAk/i5RbyDbDqWZDRrCTKdWOsIwCkGsVjNw=;
 b=Nd+HIboW+D1K8KMDxk4t27EC0FNl+DOcWKEFFTYKlVIRIc9mnANN4krDHNEy0aOVLomlNLmZUZbEAo4TjZtY/CxpBM1CQWDrPkuCa2lJNHMYCMGoqeHfE6UZ2IXR7OtmBzs2o34a3pQa55cibRHepVWrUEh7t9WQeIhlP3mXUgIR4Xcmc2gm+PblmrZ08c7xzJUKr/Ge5CJ77NC5pnf+RLYgG57lRb4ao8HrEz0jXN2BLzo9Xyu2rX+wMTFkuZtnc5KpHgK5nT1bqvd39YkX65+JQCXBHtEzlKz5KRafAQDvlm22pBERiRZEjn+x/QNNyuHTL7EYsHpetJN+4VPK0Q==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2983.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.28; Fri, 3 Feb
 2023 18:23:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%6]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 18:23:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v1 3/5] powerpc/64: Replace -mcpu=e500mc64 by -mcpu=e5500
Thread-Topic: [PATCH v1 3/5] powerpc/64: Replace -mcpu=e500mc64 by -mcpu=e5500
Thread-Index: AQHZFFcc+h2aQPE1ekmzRpyBYxxgiq53NtQAgEPPZICAAsp1gA==
Date: Fri, 3 Feb 2023 18:23:57 +0000
Message-ID: <6b67e274-1dca-1db9-6ff9-fdf541551d81@csgroup.eu>
References:  <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <fa71ed20d22c156225436374f0ab847daac893bc.1671475543.git.christophe.leroy@csgroup.eu>
 <20221220201508.b47rg5ii2p6wkrkq@pali> <20230201234649.yxztgdm3efklmoy5@pali>
In-Reply-To: <20230201234649.yxztgdm3efklmoy5@pali>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2983:EE_
x-ms-office365-filtering-correlation-id: 2ac531c8-ad57-4dd2-4313-08db0613d08a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hSR3A4ZsK2LhlWtS/WRlcwuQNBAznqeitVLDk2gc/xOmRwlNXfXHf685K1QI0IYfifpCsHgWuOCKOkC0T8KwgTfqNlbd0U4bJNV98gN9GvxxlFEI8dsk/jLL2JoK1/BhqUy9iFch/ak8qLJI/OoJVZCGlSdkW7nXqBGVnh4XDUe/D6w7YmVyFD5TqX72ia/BXA2+UhU9JwlY2X6NZ0lI3un5err/wN2B3zgCgKk19ZYI7u0PGYntO6W/29ery/A9dHbwIf0CeZbKrO95ZVN/NwiMpLYe3uyi4Ts8i+e2Dvs8X96sG8tM/gNhxyEyU6Z8qt5YEqAluK8fXeE38XGQfAFT0NF4eeQdqXpWDqX5SEugoCEXunSzOAOYJcDpy8BLQfR9KwOX7zTxDcpFSvwGquDziUZaLBp1rcUbwkiy0S0N4GGDmHq9E+Tk0loGRCUCkLREM84Te6uCW9I5ccI8WngQArSVaM/5r5+FOD2jgkxWmJsxyJ7zhlujKIOrY1wK2iGLi5zMeaWulwFKOuQPCPb7om/7alxEQYmbhOnKJ9Ig8J5wF/T4w4fWGgxns9zGytfyI3B+ptay6ILAKT30cv6x/uT8TGGGWGogb6lxKCNx8HR//FFP0Pjgo10RWLzxCVMeQ0ptPZ+8ERaXCexOLwsRTuRiR2qzgG7uQ2Nwqwyv2Wval3YoMzchD2Oz4J6Fj1hMcW3vf44omCNAUWRYZy2p3j6zQo2uUFf+8FVb7PLJhIPMC1nl1ih5TKyXqrb6em7/8t13AjYpUUGz/Jc4/9u51swYDoBAoPI1L468Rzo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39850400004)(376002)(366004)(451199018)(2906002)(5660300002)(44832011)(38070700005)(31696002)(2616005)(66574015)(86362001)(122000001)(38100700002)(71200400001)(83380400001)(6506007)(186003)(6512007)(26005)(6486002)(966005)(36756003)(478600001)(76116006)(66946007)(66556008)(66476007)(316002)(41300700001)(31686004)(64756008)(66446008)(91956017)(4326008)(54906003)(6916009)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MVVnM0hITHVHR3Jmc0toY1A0bkZNQXJseCtjUUNNZ0pYb01PSHV4SUhzMlJl?=
 =?utf-8?B?dXQ1YXdOVW5LdWdsSXgvUFFYQ0xaY0cxYngvN1E5N05yL2pFbHRCUkd0Snk4?=
 =?utf-8?B?c3UrVjI0MUpBODBRZFYyeEIweG5vcEljdGpTZVRMKzl3bkxJU3Y3K3ZmM0JP?=
 =?utf-8?B?T1FGMjk0bFpjVk82NkN2cVVya3VJRlRIajdPZVhxczhzZmhIZHo1ZjVPTDdU?=
 =?utf-8?B?RFRFOFYwalJqUC9RcE4rdWlEK3NaSUZMbGpXbmxBSzg3SDBFVVRqNzZzVitR?=
 =?utf-8?B?NFd5TC9FakovTGM4ckZydnlidFJwK2Q3V3FHV3JONkU4LzhnQVVNc05nK05B?=
 =?utf-8?B?QnZvT0FxUFBBK2I0aEFJczZuMEF5MFNTZWJKSk8vY1N0M0FKMlg4azdjK3c3?=
 =?utf-8?B?cGh0T3NCTENPSnhtMXBPaHliakxvbFdpcWV2SU4yeFVZSXZ6cEROUWRMRGRS?=
 =?utf-8?B?UThRcHVlWi9pTkZCYnBiM1BqeFJhZktPc3M3eFhZUFIzTEdhN0R2cXhvdFgx?=
 =?utf-8?B?QmRmNTNqSlBpWFBDdUlxTVZvRFI2ZHNPdWFzOEtOWjlpdHZvK1Q5eEtMbXVl?=
 =?utf-8?B?bWhGRXhNdUY3MFVHQzBjNTJWNTc4eDRseTJTR3krYTRscXFUQzJMdDAwU1NR?=
 =?utf-8?B?NnUzdk9vMis2T21mdlJTaFVjUENlN3hteTVCWkJ0UmlXc2lnODdlY0I1QXo5?=
 =?utf-8?B?RHZ3WkU1TzZkMk05V3dqN29PWEUwbmdlRXoxVzNJZTI1MTNIWHdIQ0o3NlJY?=
 =?utf-8?B?eU0waUJMUEo4ZVozU0I4ZUtRaHh0YUg1WEdJclZzbFlPTVhNQUdXTnEwblQv?=
 =?utf-8?B?R3Zqcys3cEZRKy82NlFiNjBvMWY4b2IvZWY5VjYzamFNeU1YdWUySERRblM4?=
 =?utf-8?B?b0JMM3pnbDBVdld0MCtNV0IvMS81V1BsTVNPSlR2ZlJYSzhydUp6b21ZQzZS?=
 =?utf-8?B?aHNGL281Z01kWU1wTXlXcmRJYVBwdExxR1Q2Q2Q4ZHZqYzFPNlpLb0twQ1Vs?=
 =?utf-8?B?cWtsRElZNWQ4eXl2bTJ6OUdpNk90eHY2dVdmMkwvaVZCZ2IrOGVjVTVzakJq?=
 =?utf-8?B?V0s0V01hNGtaaEtvbDZJd2VEd0daRVdqbTU4MUJxNUlRK09EN1VyWks3V2lL?=
 =?utf-8?B?SFNIZzcxaHN0aDg1UjNQK0R5bG9YM2lVRDFqb21UbU5BYUJNN1J4bjFmQjUw?=
 =?utf-8?B?Ynp3Z1RqOWt2cFVicWhpaEpqaVNtbXV3ZWZMbWVIcEpRcDFMb3ZUYUxLZWpj?=
 =?utf-8?B?Z01HWlVxTHpwMGw0K1dhL1JpSWkvRkt5VDZoTVc1bDQ2dFprUU5qTUpId1Y1?=
 =?utf-8?B?aGh2enBuTHF1RFByQ3VVTVJPbFhJR2dwQ2lXYW14eE9XUzFnd1Byam9SdjZQ?=
 =?utf-8?B?Njc3Ym1aOFFyaFFpeDc5NEN6Q2E1b0VRTnpsNmF2eC8rRDA2QlU3MzBmbHRX?=
 =?utf-8?B?emEwWFNJTFVuL210bW4xYWExL1dKZTFSOFVNeENvT1FUenlFeFZ1MEsvM2xz?=
 =?utf-8?B?dzc2UEo0L29QN05vcE84VjZUSG44MHhYQlBUdVh5M1ViQnFvYitUTDdCbis4?=
 =?utf-8?B?VUlPR3QwSStBVng2UzZmOGdZVTZiZ0NPVndsb29MR3NabkFhd3lObEVlekp4?=
 =?utf-8?B?NXhUZWZmN3BQU2hGdStLZGtENjlMNjhNdExreExwdHZ4b1lQd01rVDZMM2hi?=
 =?utf-8?B?L3dLTGI1TXF4Z1YvZXoxdmhJSmpSeDVCalFQcE5kb1hIZnFkazRjY1NrUjRG?=
 =?utf-8?B?aStnQ3pTZUF5eHBHT2cxa29EVnhRYXZROFQ0VjhGUmdHc0VQMUJwckVJT1lT?=
 =?utf-8?B?RGNFT1JiYzRWaUs2SHo0cGtST1JuWmRUNXB0dFpDMmRGZjF5RW9nTHovL1NK?=
 =?utf-8?B?MXd4TFFQUVROUlA2cEZ6S3ozVkpwTW85Nk5qa08yTDhIdXlYdWxtSHNheXVt?=
 =?utf-8?B?MXZLK2dDaWJVWitjaGFMR2Q4UUdGWG9aTWRlOEd6MUJNMm1EWVJxWWJYMHdH?=
 =?utf-8?B?MWhmZ0RLN3NqTW9xMTlDYnVyNFAvL2ZzbzBad2xJWHJzMGdQSEMyVis0NDlw?=
 =?utf-8?B?eFl4dC9ib1ZoUXFKQzRkNFdSZjJwZWNVY3ZlWTNlU3ZpZ2swRjQrRDNoSGVy?=
 =?utf-8?B?Q0I5dzhBNVJMbmNraEpDRDhKL3ZsSVR5N1ZFN2xWblNhYXRLWE51dURsWHRU?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43ADE467D8453F47AF5F04BB4FED0DF4@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac531c8-ad57-4dd2-4313-08db0613d08a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2023 18:23:57.5299
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FBMhk7fFyI6UTNdj0txdlkXKgTd1/ymrzs8AzXro2JMI4L7zAQMCvPaRtMk7WrTrvrrVR9+k1JLXlTRCC9sRncrukE03y3h3kShCu7iNWZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2983
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "jbglaw@lug-owl.de" <jbglaw@lug-owl.de>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzAyLzIwMjMgw6AgMDA6NDYsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFR1ZXNkYXkgMjAgRGVjZW1iZXIgMjAyMiAyMToxNTowOCBQYWxpIFJvaMOhciB3cm90ZToNCj4+
IE9uIE1vbmRheSAxOSBEZWNlbWJlciAyMDIyIDE5OjQ1OjU4IENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6DQo+Pj4gRTUwME1DNjQgaXMgYSBwcm9jZXNzb3IgcHJlLWRhdGluZyBFNTUwMCB0aGF0IGhh
cyBuZXZlciBiZWVuDQo+Pj4gY29tbWVyY2lhbGlzZWQuIFVzZSAtbWNwdT1lNTUwMCBmb3IgRTU1
MDAgY29yZS4NCj4+Pg0KPj4+IE1vcmUgZGV0YWlscyBhdCBodHRwczovL2djYy5nbnUub3JnL1BS
MTA4MTQ5DQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3Rv
cGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pg0KPj4gQWNrZWQtYnk6IFBhbGkgUm9ow6FyIDxwYWxp
QGtlcm5lbC5vcmc+DQo+Pg0KPj4+IC0tLQ0KPj4+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9L
Y29uZmlnLmNwdXR5cGUgfCAyICstDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxh
dGZvcm1zL0tjb25maWcuY3B1dHlwZSBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvS2NvbmZpZy5j
cHV0eXBlDQo+Pj4gaW5kZXggMzFjZWEyZWViNTllLi4yOWQ2YmUwMzM1NzYgMTAwNjQ0DQo+Pj4g
LS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9LY29uZmlnLmNwdXR5cGUNCj4+PiArKysgYi9h
cmNoL3Bvd2VycGMvcGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZQ0KPj4+IEBAIC0yNDksNyArMjQ5
LDcgQEAgY29uZmlnIFRBUkdFVF9DUFUNCj4+PiAgIAlkZWZhdWx0ICJwb3dlcjgiIGlmIFBPV0VS
OF9DUFUNCj4+PiAgIAlkZWZhdWx0ICJwb3dlcjkiIGlmIFBPV0VSOV9DUFUNCj4+PiAgIAlkZWZh
dWx0ICJwb3dlcjEwIiBpZiBQT1dFUjEwX0NQVQ0KPj4+IC0JZGVmYXVsdCAiZTUwMG1jNjQiIGlm
IEU1NTAwX0NQVQ0KPj4+ICsJZGVmYXVsdCAiZTU1MDAiIGlmIEU1NTAwX0NQVQ0KPj4+ICAgCWRl
ZmF1bHQgImU2NTAwIiBpZiBFNjUwMF9DUFUNCj4+PiAgIAlkZWZhdWx0ICJwb3dlcjQiIGlmIFBP
V0VSUEM2NF9DUFUgJiYgIUNQVV9MSVRUTEVfRU5ESUFODQo+Pj4gICAJZGVmYXVsdCAicG93ZXI4
IiBpZiBQT1dFUlBDNjRfQ1BVICYmIENQVV9MSVRUTEVfRU5ESUFODQo+Pj4gLS0gDQo+Pj4gMi4z
OC4xDQo+Pj4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgdGhhdCB0aGlzIHBhdGNoIGlzIGFsc28gbWlz
c2luZyBpbiBwb3dlcnBjIHRyZWUuLi4NCg0KVGhlIGVudGlyZSBzZXJpZXMgaXMgbm90IHRha2Vu
IHlldCBpbmRlZWQsIG9ubHkgcGF0Y2ggMSBpcyBpbiB0aGUgcGlwZSANCmJlY2F1c2UgSSBzdWJt
aXR0ZWQgaXQgYXMgYSBmaXggaW4gcGFyYWxsZWwuDQo=
