Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8198F59D4B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 10:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBjYM3JMwz3c2g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 18:48:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=6Nk/nz0V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.79; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=6Nk/nz0V;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90079.outbound.protection.outlook.com [40.107.9.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBjXX6Mjlz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 18:47:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtASntnUWtou0wn2pGxNYpWcE8FtHpxIGDPXLp3xg4ddFIT6REiiuYHpnAzLTeTDv0XQX0WV+2tEdobU0Exhym8yr1ezEICk94jFcshtntsviN9eA09khORk6pkTv1Ucx6JXOn+gMl2XT52CEOiLUIxlW/4Ar1p10VsQ5yUqUJsY22LFt8ndDSHn0MKZmlh443khZ9xhbcXTQcGxskLrw9AWOr0xH9KeE+NQ6lgwu9OIH4jY2zcFEQtF7SssP1395JLsPmuc+TvnvYbGL/CrlwDoHEuWK73itrFxUBYKrfQbwC1O8LcSkOEYgCr9cyGt9Fru8Z+0tWhd7uORGocT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixOPQbibFO2Tu0ORmrav4usvJRE3NY3TUKXoNk5SdbQ=;
 b=MgIqtgpaheKcwz67Tz+qjC17KzuEyKeNPlevBMHqlHQWjBghH2C5KJhCaXFR06xEGLQCfhwGZGdXkV0TpkKh32e05/Ynbm0SZ2DC3hqymh7iuZsDBDDaSw/OvZD1qCgRoMa3pT+c8PzTCLUXmHYhIKY0As1LLsy3v15Lilp7lXFRgV8TGYRs3Uzr6EDccFizKvKL9XNehV7zgygpEqs9Cky3EPQguQZ2jgc6jX9aIeWbG1iOLGRT4sUS7LJgVbhXVznGb0AcZ9NNsNZRpBvw/co8chTDeU8dgu4iuS/QeecXOYCr7IGnxaaSM4j3InO3v6YVcbHMwfDtp3wfd6IyCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixOPQbibFO2Tu0ORmrav4usvJRE3NY3TUKXoNk5SdbQ=;
 b=6Nk/nz0VAACrHqZtH3NDmEDLRzDJfFTk+9M0ZiSUwsgICWOUfmZSdTzEe9Bt+lt9gz1E41Iike/Xd+hm7emV/ndsZ20i35BbTPNU2IIu8CwjQL5SOZLHfQO4LCLj9KQ9PMnz4WZzVCRG9CcqY2qCXxLGpi55Q7aH/Yla3uJQc7scnzVMVOfvY5gXbuOvTUiGUtXjMhrhA3Xhkk1ChnJnfgq+JvlDP1vVYTiUbQYKK1NO3V8ulyevS3PWeEAD9OYzcugdRvVG+Lr5q2V5eRlcqV9RUpy1yH4mnnS+KhfgyOfVFPgRtSM/qPCGIUUR17DSYrm2fUnxjxZO2GCWIONYwA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1544.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5546.17; Tue, 23 Aug 2022 08:47:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 08:47:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "atrajeev@linux.vnet.ibm.com"
	<atrajeev@linux.vnet.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "rcu@vger.kernel.org"
	<rcu@vger.kernel.org>
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Topic: [PATCH linux-next] powerpc: disable sanitizer in
 irq_soft_mask_set
Thread-Index: AQHYtPl0/VA1s9ADPEeW7qUGdddrzK28LAUAgAAD2oA=
Date: Tue, 23 Aug 2022 08:47:02 +0000
Message-ID: <0d7b55bc-4dd2-7de1-8ca5-353b1a044caf@csgroup.eu>
References: <20220821010030.97539-1-zhouzhouyi@gmail.com>
 <87edx7l5px.fsf@mpe.ellerman.id.au>
In-Reply-To: <87edx7l5px.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b475834-8cb4-45a9-6617-08da84e40c62
x-ms-traffictypediagnostic: MRZP264MB1544:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aZ/+9ofjD1WYSApJj4ExkXcXC79spqc/jx8NQrXHV36oD0NtNEb3nh20NfjEeOT86uWJtDQ8rvL5I0vbfyKs4ljbCON+tYpdrvLYwvs3NShJJutIqAvWisZvXi+2V0kPWm64g1eyj9JEJSCICQ4ChadfLJjEks9VZ6FDaqkU+rU8xK7WonC8zLcbeo0htZ3O5ke1ohod/P//hqwpqDdjsa7Ivy8WRPM0S/6DMd/t53DsQ/+V9zAZk/5e6uiGObcJ/lZM1D/BgPSLZH/r1nPMvOfc/m0SuYF8M+ueo/lYdbJ6GXanEzAODuE9Un+OImHQIB6yJvtiFIDw9XSIX7LdHZ3qH2tC7H1K2V0jd54T77Xjf7zS1su5CqEmoLYqWZ9Pk5DmV1+nTHgcuaL1OXUAabVZGYpP8q6cHL5qwBAtw/uhdFEU9zJ0E6/mshd42N5Bdr5ctbYPKx6FdHiwJ7sdZSgY+vetGXFsQXL1dfuEV4PlWBfXAGVwcWxG4LNJK9WTKGs13bqVgyyc+pyzchU2nD5k/E2mvH1Y9F0j08MSVURQxF9hpMPUSvubGczoUjhAL3lIBkNBltdOPWTH5dVhonp7M4XtWpQHV1WkC5J2xr1tziQMj2qbBhw2kYhvHsIL8VmQvlg+vdJI6wmcUHuAleAwcUvjSwJaucQ4zpdl85kPJwZLZubYaK62CqKotEBG8n1ZHY3PUPp47jLfWHIIejSXpLoNQL1vu5roBQpdxGepvB8UtDL3dRW/MAXLQJJK4BthdxbcNzrhN64G/UZHZXgQb9JnWRf6C1yzPvTRDBuH3DQpoyFpVaR92D5WvK/nhdaqYwmaz76sQerYf3gjEA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(8676002)(2906002)(31686004)(316002)(66446008)(64756008)(66556008)(91956017)(110136005)(76116006)(38100700002)(66476007)(8936002)(5660300002)(44832011)(66946007)(478600001)(36756003)(86362001)(122000001)(6506007)(38070700005)(71200400001)(6486002)(31696002)(66574015)(186003)(26005)(83380400001)(6512007)(41300700001)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Z2FWejl1QTY2ODdoSzFwMWdQR1lBUFY5VzhoSVBOTXVHcXZFL2VvcjR5bUJ4?=
 =?utf-8?B?VVF4bGNHbDZkVmJUUUQ1eVZSVWlFNGVhTTcyNzJLU3JFaWxRMmlZWE5acUJR?=
 =?utf-8?B?VndXblNLSlVhaDIrOTlUY1pkdUg0ZWxVcXc4M2hKWFRPa1ZWL3VVWDVxVURl?=
 =?utf-8?B?MWx6OUJNcjc4aTVaSkJQdDVnU2xJeUROVUJWb0lCVHlVSXhiRUg2UW00WnpJ?=
 =?utf-8?B?NysrRHRZYTB4VGwvNHJnVnRBcVlNd3l3M2dWS0F5R2N5UGRwWGRvQ0U2ZHZ6?=
 =?utf-8?B?QTNiWnk4YWNydGN2OHdoVWYxRTBDK3VpdFBxLytrLys5anNFeVowanR3d1k2?=
 =?utf-8?B?dmdudDl1MVVRWXhSd3ZFbGxwTEdmaThIZjZ3TzlaY2ZpbzdUR2xqTXhvaS9x?=
 =?utf-8?B?K0xYVDFsNUFITDBaNk1rbGhnaFFiUlRHRHZ2NXRZTGxUaENLZmgwbXp3U3Ix?=
 =?utf-8?B?WmpXVWNwMkExcDFsQ0NnR0c0andNMXErSEk4UFlrVVI0cHpZWCsyN3pvaGpM?=
 =?utf-8?B?QzAyOEJmeUt1MDRHL0MwdlpxMzV5MldDcXFBRXNtaWVvSENvODhPQ1dRNHNE?=
 =?utf-8?B?RlNQN2RZeEJuVkpSQ0MwSVRSN0xkTmljRmk0eXNhM3BvYTJVMDA0b0k3aXFC?=
 =?utf-8?B?bW80RG1VbmlKcTlsV0FuT3lYT1lyT1hpbFR2RHJyRWdKbzFuOTRvVitRNmIz?=
 =?utf-8?B?b2NlR2k2OHRGRFk4UDNaL0sza3hWNkJrc2VhRnBjbEtQR2ZkeGtSdDFFUGtS?=
 =?utf-8?B?UFp6RHdMWTFHMWdndXpEcld2T3JuWG14WjJkZE94SUFJWHdLenVLTFc4dVo3?=
 =?utf-8?B?cWtqenVDWkw1SE9DY01aT2VBdFdSYWthOVlqNk4wT0EvOEhpbWRZemo3ZnFO?=
 =?utf-8?B?NlBaWDFreVNrYlBLZGtVbFlNTDFRMVBwanlkMVhyUS9naThuZWcyNTZSUW45?=
 =?utf-8?B?alFoMHYwa2t0YTJsME54ZmhIRnhvRHI1REdrZ1ZNR0N5bHVuV3lzdGN1QWtL?=
 =?utf-8?B?b2NZaEY0ZjczMzZtOURhbG5taTBlbGNZNUZORXVFQVdHbVY4K0VaME9ZRjdk?=
 =?utf-8?B?Qzk4MjNYVXpWQlg0WW5KbUI1b1JOVHlPSzhQMTlLWExDd3B0OGUyeEt0UEpr?=
 =?utf-8?B?NTlNZjN4OU1zdWpCUGFackdDeHN4S0dBc0Nsd0ZUSDNiN2x3VVpvbFFVRHkv?=
 =?utf-8?B?NUo0dXBnU2dyRmNoSk53SHl2TE9tTEZCUndJY29TSFhZRkNxYTZlZGUyZWpO?=
 =?utf-8?B?Zjkvd2NQai9LcHBmTmh0VTdnNXkwdVp3SXkwYm5HbWJjcHVZSHI0VlRIOUph?=
 =?utf-8?B?SEE5TW9LdGdKMGdCUVAySTd2VysyZ1Z4Vys5MmNKM2c1YVQ2WGJrTW1SZ0I0?=
 =?utf-8?B?OVdCWjFYU0tWdG9RSE0ybHIrZlgzcUs4YnRhamJiUTBUYWdKZVFkOThML3Nx?=
 =?utf-8?B?ZU9sUkRUbjZwR2Yyd0NyMllESW1sUDlJd0w0V3RsK1F1TlZzRFArQjR3OC9J?=
 =?utf-8?B?bDdDVjJRVjdRYmxNMzdsaXFsSjRVb2p0ZTBRM0JIQUhMOS9hSURXR2gxUERz?=
 =?utf-8?B?RkRFUTk0Rnc1YjQ1cCtlS1NrSWFMekN1a2FuUGQ5aURLLzAzUjV4N3VScFBY?=
 =?utf-8?B?VS91b2ZaME1Qa0NqbEtTSS8yTjArQjVqZFMyb3Q3SUFRN2lrWnp6ci9BNERa?=
 =?utf-8?B?TGlLNVlPTXJHQUdHNnNxclJSMWo2MEtjNEN1MDU2VkRhRk1INU1pZWtrL3h3?=
 =?utf-8?B?dFJRMmVINldkdDBLZHp2TUEvTFZXcjRFeUxUc2dEcWI2NlprVDVhUlU0TXBX?=
 =?utf-8?B?UE9hTWpWaCtaenhkMUtJOHBUQ0d3OURCS1J3cVNWdXBRa0k5eUpqVGMvNjZn?=
 =?utf-8?B?R05IM3o2YmpZSWNNSzdRR0FsV3dSSHJlWlBrSFdaOVN2WlJCNWJ3bEV1QnlJ?=
 =?utf-8?B?TVoyc3hWTWVMbDJjSDlmckFiSWp0YUl5TXY3YjZQd0w2ZzZkVEpXbkIyN0dX?=
 =?utf-8?B?YWg3RnRhRVlPS053ak40eXpVeHQ4OU9CTFFmbk1OUm1LRzIzL21uUUkzaGd5?=
 =?utf-8?B?K0Jsc2E1SU5lU2s3MmVZK3grOVNwZGh4SUowZWRscGswd3V3NnE1Y25UWnEv?=
 =?utf-8?B?a1RWaFpKTzEzRjFZWVkwcmFZV0tjUXgvcTRQNkJjSkZrcjAvUzV0a1E5YkY4?=
 =?utf-8?Q?YwCh/5YKiTLrzFvdYGcuMyo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EEDC222B5B0B5A4486920B72DBD43EC5@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b475834-8cb4-45a9-6617-08da84e40c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 08:47:02.0906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AoxQe2dW8pBDyHAkTlXN0RFZZ7uAQlW7ZfPCJz/3rbYwt6Gj6fXLEHFqu48w1ftYR1cUAnBrThHR+znkKTkKE5JWoute/6FhVtzd7BJCAk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1544
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIzLzA4LzIwMjIgw6AgMTA6MzMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gWmhvdXlpIFpob3UgPHpob3V6aG91eWlAZ21haWwuY29tPiB3cml0ZXM6DQo+PiBJbiBwcGMs
IGNvbXBpbGVyIGJhc2VkIHNhbml0aXplciB3aWxsIGdlbmVyYXRlIGluc3RydW1lbnQgaW5zdHJ1
Y3Rpb25zDQo+PiBhcm91bmQgc3RhdGVtZW50IFdSSVRFX09OQ0UobG9jYWxfcGFjYS0+aXJxX3Nv
ZnRfbWFzaywgbWFzayk6DQo+Pg0KPj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiMCA8KzA+OglhZGRp
cyAgIHIyLHIxMiw3NzQNCj4+ICAgICAweGMwMDAwMDAwMDAyOTVjYjQgPCs0PjoJYWRkaSAgICBy
MixyMiwxNjQ2NA0KPj4gICAgIDB4YzAwMDAwMDAwMDI5NWNiOCA8Kzg+OgltZmxyICAgIHIwDQo+
PiAgICAgMHhjMDAwMDAwMDAwMjk1Y2JjIDwrMTI+OglibCAgICAgIDB4YzAwMDAwMDAwMDA4YmI0
YyA8bWNvdW50Pg0KPj4gICAgIDB4YzAwMDAwMDAwMDI5NWNjMCA8KzE2PjoJbWZsciAgICByMA0K
Pj4gICAgIDB4YzAwMDAwMDAwMDI5NWNjNCA8KzIwPjoJc3RkICAgICByMzEsLTgocjEpDQo+PiAg
ICAgMHhjMDAwMDAwMDAwMjk1Y2M4IDwrMjQ+OglhZGRpICAgIHIzLHIxMywyMzU0DQo+PiAgICAg
MHhjMDAwMDAwMDAwMjk1Y2NjIDwrMjg+OgltciAgICAgIHIzMSxyMTMNCj4+ICAgICAweGMwMDAw
MDAwMDAyOTVjZDAgPCszMj46CXN0ZCAgICAgcjAsMTYocjEpDQo+PiAgICAgMHhjMDAwMDAwMDAw
Mjk1Y2Q0IDwrMzY+OglzdGR1ICAgIHIxLC00OChyMSkNCj4+ICAgICAweGMwMDAwMDAwMDAyOTVj
ZDggPCs0MD46CWJsICAgICAgMHhjMDAwMDAwMDAwNjA5Yjk4IDxfX2FzYW5fc3RvcmUxKzg+DQo+
PiAgICAgMHhjMDAwMDAwMDAwMjk1Y2RjIDwrNDQ+Oglub3ANCj4+ICAgICAweGMwMDAwMDAwMDAy
OTVjZTAgPCs0OD46CWxpICAgICAgcjksMQ0KPj4gICAgIDB4YzAwMDAwMDAwMDI5NWNlNCA8KzUy
PjoJc3RiICAgICByOSwyMzU0KHIzMSkNCj4+ICAgICAweGMwMDAwMDAwMDAyOTVjZTggPCs1Nj46
CWFkZGkgICAgcjEscjEsNDgNCj4+ICAgICAweGMwMDAwMDAwMDAyOTVjZWMgPCs2MD46CWxkICAg
ICAgcjAsMTYocjEpDQo+PiAgICAgMHhjMDAwMDAwMDAwMjk1Y2YwIDwrNjQ+OglsZCAgICAgIHIz
MSwtOChyMSkNCj4+ICAgICAweGMwMDAwMDAwMDAyOTVjZjQgPCs2OD46CW10bHIgICAgcjANCj4+
DQo+PiBJZiB0aGVyZSBpcyBhIGNvbnRleHQgc3dpdGNoIGJlZm9yZSAic3RiICAgICByOSwyMzU0
KHIzMSkiLCByMzEgbWF5DQo+PiBub3QgZXF1YWwgdG8gcjEzLCBpbiBzdWNoIGNhc2UsIGlycSBz
b2Z0IG1hc2sgd2lsbCBub3Qgd29yay4NCj4+DQo+PiBUaGlzIHBhdGNoIGRpc2FibGUgc2FuaXRp
emVyIGluIGlycV9zb2Z0X21hc2tfc2V0Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFpob3V5aSBa
aG91IDx6aG91emhvdXlpQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gRGVhciBQUEMgZGV2ZWxvcGVy
cw0KPj4NCj4+IEkgZm91bmQgdGhpcyBidWcgd2hlbiB0cnlpbmcgdG8gZG8gcmN1dG9ydHVyZSB0
ZXN0cyBpbiBwcGMgVk0gb2YNCj4+IE9wZW4gU291cmNlIExhYiBvZiBPcmVnb24gU3RhdGUgVW5p
dmVyc2l0eSBmb2xsb3dpbmcgUGF1bCBFLiBNY0tlbm55J3MgZ3VpZGFuY2UuDQo+Pg0KPj4gY29u
c29sZS5sb2cgcmVwb3J0IGZvbGxvd2luZyBidWc6DQo+Pg0KPj4gWyAgMzQ2LjUyNzQ2N11bICBU
MTAwXSBCVUc6IHVzaW5nIHNtcF9wcm9jZXNzb3JfaWQoKSBpbiBwcmVlbXB0aWJsZSBbMDAwMDAw
MDBdIGNvZGU6IHJjdV90b3J0dXJlX3JlYS8xMDBeTQ0KPj4gWyAgMzQ2LjUyOTQxNl1bICBUMTAw
XSBjYWxsZXIgaXMgcmN1X3ByZWVtcHRfZGVmZXJyZWRfcXNfaXJxcmVzdG9yZSsweDc0LzB4ZWQw
Xk0NCj4+IFsgIDM0Ni41MzExNTddWyAgVDEwMF0gQ1BVOiA0IFBJRDogMTAwIENvbW06IHJjdV90
b3J0dXJlX3JlYSBUYWludGVkOiBHICAgICAgICBXICAgICAgICAgIDUuMTkuMC1yYzUtbmV4dC0y
MDIyMDcwOC1kaXJ0eSAjMjUzXk0NCj4+IFsgIDM0Ni41MzM2MjBdWyAgVDEwMF0gQ2FsbCBUcmFj
ZTpeTQ0KPj4gWyAgMzQ2LjUzNDQ0OV1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4NzZjMF0gW2MwMDAw
MDAwMDBjZTJiNjhdIGR1bXBfc3RhY2tfbHZsKzB4YmMvMHgxMDggKHVucmVsaWFibGUpXk0NCj4+
IFsgIDM0Ni41MzY2MzJdWyAgVDEwMF0gW2MwMDAwMDAwMDk0ODc3MTBdIFtjMDAwMDAwMDAxNzEy
OTU0XSBjaGVja19wcmVlbXB0aW9uX2Rpc2FibGVkKzB4MTU0LzB4MTYwXk0NCj4+IFsgIDM0Ni41
Mzg2NjVdWyAgVDEwMF0gW2MwMDAwMDAwMDk0ODc3YTBdIFtjMDAwMDAwMDAwMmNlMmQ0XSByY3Vf
cHJlZW1wdF9kZWZlcnJlZF9xc19pcnFyZXN0b3JlKzB4NzQvMHhlZDBeTQ0KPj4gWyAgMzQ2LjU0
MDgzMF1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4NzhiMF0gW2MwMDAwMDAwMDAyY2YzYzBdIF9fcmN1
X3JlYWRfdW5sb2NrKzB4MjkwLzB4M2IwXk0NCj4+IFsgIDM0Ni41NDI3NDZdWyAgVDEwMF0gW2Mw
MDAwMDAwMDk0ODc5MTBdIFtjMDAwMDAwMDAwMmJiMzMwXSByY3VfdG9ydHVyZV9yZWFkX3VubG9j
aysweDMwLzB4YjBeTQ0KPj4gWyAgMzQ2LjU0NDc3OV1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4Nzkz
MF0gW2MwMDAwMDAwMDAyYjdmZjhdIHJjdXRvcnR1cmVfb25lX2V4dGVuZCsweDE5OC8weDgxMF5N
DQo+PiBbICAzNDYuNTQ2ODUxXVsgIFQxMDBdIFtjMDAwMDAwMDA5NDg3YTEwXSBbYzAwMDAwMDAw
MDJiOGJmY10gcmN1X3RvcnR1cmVfb25lX3JlYWQrMHg1OGMvMHhjOTBeTQ0KPj4gWyAgMzQ2LjU0
ODg0NF1bICBUMTAwXSBbYzAwMDAwMDAwOTQ4N2NhMF0gW2MwMDAwMDAwMDAyYjk0MmNdIHJjdV90
b3J0dXJlX3JlYWRlcisweDEyYy8weDM2MF5NDQo+PiBbICAzNDYuNTUwNzg0XVsgIFQxMDBdIFtj
MDAwMDAwMDA5NDg3ZGIwXSBbYzAwMDAwMDAwMDFkZTk3OF0ga3RocmVhZCsweDFlOC8weDIyMF5N
DQo+PiBbICAzNDYuNTUyNTU1XVsgIFQxMDBdIFtjMDAwMDAwMDA5NDg3ZTEwXSBbYzAwMDAwMDAw
MDAwY2Q1NF0gcmV0X2Zyb21fa2VybmVsX3RocmVhZCsweDVjLzB4NjReTQ0KPj4NCj4+IEFmdGVy
IDEyIGRheXMgZGVidWdnaW5nLCBJIGZpbmFsbHkgbmFycm93IHRoZSBwcm9ibGVtIHRvIGlycV9z
b2Z0X21hc2tfc2V0Lg0KPiANCj4gVGhhbmtzIGZvciBzcGVuZGluZyAxMiBkYXlzIGRlYnVnZ2lu
ZyBpdCEgT19vDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9o
d19pcnEuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19pcnEuaA0KPj4gaW5kZXggMjZl
ZGUwOWM1MjFkLi5hNWFlOGQ4MmNjOWQgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vaHdfaXJxLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9od19p
cnEuaA0KPj4gQEAgLTEyMSw3ICsxMjEsNyBAQCBzdGF0aWMgaW5saW5lIG5vdHJhY2UgdW5zaWdu
ZWQgbG9uZyBpcnFfc29mdF9tYXNrX3JldHVybih2b2lkKQ0KPj4gICAgKiBmb3IgdGhlIGNyaXRp
Y2FsIHNlY3Rpb24gYW5kIGFzIGEgY2xvYmJlciBiZWNhdXNlDQo+PiAgICAqIHdlIGNoYW5nZWQg
cGFjYS0+aXJxX3NvZnRfbWFzaw0KPj4gICAgKi8NCj4+IC1zdGF0aWMgaW5saW5lIG5vdHJhY2Ug
dm9pZCBpcnFfc29mdF9tYXNrX3NldCh1bnNpZ25lZCBsb25nIG1hc2spDQo+PiArc3RhdGljIGlu
bGluZSBub3RyYWNlIF9fbm9fa2NzYW4gX19ub19zYW5pdGl6ZV9hZGRyZXNzIHZvaWQgaXJxX3Nv
ZnRfbWFza19zZXQodW5zaWduZWQgbG9uZyBtYXNrKQ0KPj4gICB7DQo+PiAgIAkvKg0KPj4gICAJ
ICogVGhlIGlycSBtYXNrIG11c3QgYWx3YXlzIGluY2x1ZGUgdGhlIFNURCBiaXQgaWYgYW55IGFy
ZSBzZXQuDQo+IA0KPiBNeSB3b3JyeSBpcyB0aGF0IHRoaXMgd2lsbCBmb3JjZSBpcnFfc29mdF9t
YXNrX3NldCgpIG91dCBvZiBsaW5lLCB3aGljaA0KPiB3ZSB3b3VsZCByYXRoZXIgYXZvaWQuIEl0
J3MgbWVhbnQgdG8gYmUgYSBmYXN0IHBhdGguDQo+IA0KPiBJbiBmYWN0IHdpdGggdGhpcyBhcHBs
aWVkIEkgc2VlIG5lYXJseSAzMDAgb3V0LW9mLWxpbmUgY29waWVzIG9mIHRoZQ0KPiBmdW5jdGlv
biB3aGVuIGJ1aWxkaW5nIGEgZGVmY29uZmlnLCBhbmQgfjE3MDAgY2FsbHMgdG8gaXQuDQo+IA0K
PiBOb3JtYWxseSBpdCBpcyBpbmxpbmVkIGF0IGV2ZXJ5IGNhbGwgc2l0ZS4NCj4gDQo+IA0KPiBT
byBJIHRoaW5rIEknbSBpbmNsaW5lZCB0byByZXZlcnQgZWY1YjU3MGQzNzAwICgicG93ZXJwYy9p
cnE6IERvbid0IG9wZW4NCj4gY29kZSBpcnFfc29mdF9tYXNrIGhlbHBlcnMiKS4NCg0KQ291bGQg
eW91IHJldmVydCBpdCBvbmx5IHBhcnRpYWxseSA/IEluIGV4dGVuc28sIHJldmVydCB0aGUgDQpS
RUFEL1dSSVRFX09OQ0UgYW5kIGJyaW5nIGJhY2sgdGhlIGlubGluZSBhc20gaW4gaXJxX3NvZnRf
bWFza19yZXR1cm4oKSANCiAgYW5kIGlycV9zb2Z0X21hc2tfc2V0KCksIGJ1dCBrZWVwIG90aGVy
IGNoYW5nZXMuDQoNCj4gDQo+IEl0IHdhcyBhIG5pY2UgbG9va2luZyBjbGVhbnVwLCBidXQgdGhv
c2UgbG9hZHMgbXVzdCBub3QgYmUgaW5zdHJ1bWVudGVkDQo+IGJ5IEtBU0FOLCBidXQgd2UgYWxz
byB3YW50IHRoZW0gaW5saW5lZCwgYW5kIEFGQUlDUyB0aGUgb25seSB3YXkgdG8NCj4gYWNoaWV2
ZSB0aGF0IGlzIHRvIGdvIGJhY2sgdG8gaW5saW5lIGFzbS4NCj4gDQoNCkl0J3MgYSBwaXR0eS4N
Cg0KV291bGQgaXQgYmUgYWNjZXB0YWJsZSB0byBoYXZlIGl0IG91dCBvZiBsaW5lIHdoZW4gS0FT
QU4gaXMgc2VsZWN0ZWQgYW5kIA0KaW5saW5lIG90aGVyd2lzZSA/IEluIHRoYXQgY2FzZSB0aGVy
ZSBpcyBfX25vX3Nhbml0aXplX29yX2lubGluZQ0KDQpDaHJpc3RvcGhl
