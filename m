Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DBF52F053
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 18:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4X0Z2G9Wz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 02:16:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61d;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::61d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4X024z6rz2xRm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 02:16:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8UIUJlivLa4rnW6TycZAVZ6Giy8S6tOIlcI9vIp51v7t/PV6eTl14BZ+2irjuJ7nX86tApSDsyZXjmpahoWS9g7x7J/htLhqumFKL9IYFLPMdTU9msmauGfaRvSl5xh2kL3KtMogxL1PGFihyyXR5+YkmW0dIkY9wAAP7e6+CeqiLSlBRLKwfx7K8V3rwnxr04DvVFoclHrlljCawbZHTfSudKLr5uiWX2+tXsIY3kSdIBi8Ii13iol7PUcwjK6fL/QsMbb7n5M7LiKshcPS+WO/bqJiDsySYx9V9Yc05dpIXvVW8ioKyOtd089/OUvAW3HYuS59UCob7/jyg49ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmuRJE2lvgI/J/wogaRTcQSHZO1HB275TsR5B7A/VYQ=;
 b=kkQCdo6MzVzCQ5vyoAZKfF991BfkBUkPLH4ezy1ZZZhYDXT7dhmud/N8zxknaM29TvrdYlw7xGY55KxcCa2zFnXPITDo+1hhAnCFhK8JMfd52Z80Hkc3Bdf0c2Khugcj49427bbIpmpiQM9ZdIvKlZzclZUYkwD08Ml6e846OVw70CRZLhHfpAF02PsSnc/Lvs61iSVOUsr7vo2B7hlmC35qT6hsVzlPNhkoJs9zE5aXXUgK0psUXk9asqWN5llOraL29u1glp9IJyMRDP30d363IV5lcC6KWinU4sNjLZYxY0+UDlwlxU/hw/8f9JK0Tqc2e4Bk1zTm3ocMdIAngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1941.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:16::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Fri, 20 May
 2022 16:15:39 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::ad4e:c157:e9ac:385d%8]) with mapi id 15.20.5273.016; Fri, 20 May 2022
 16:15:39 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Laurent Dufour <ldufour@linux.ibm.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "npiggin@gmail.com" <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Don't read H_BLOCK_REMOVE characteristics in
 radix mode
Thread-Topic: [PATCH] powerpc/64s: Don't read H_BLOCK_REMOVE characteristics
 in radix mode
Thread-Index: AQHYbGJpCOPx2yCPH0C9Psf/vrvCGq0n8OuA
Date: Fri, 20 May 2022 16:15:39 +0000
Message-ID: <d87cca6d-8cc9-3347-f74a-28f12889cfe1@csgroup.eu>
References: <20220520155721.10211-1-ldufour@linux.ibm.com>
In-Reply-To: <20220520155721.10211-1-ldufour@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97179a1f-6629-494a-8f1c-08da3a7bfb2f
x-ms-traffictypediagnostic: MRZP264MB1941:EE_
x-microsoft-antispam-prvs: <MRZP264MB19418673D7081E8CBDB2B29EEDD39@MRZP264MB1941.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bi5M7Of9jqWYxzytr4Q9rmUHr7O/nvxxAb/9eMbn4cd8/DvP5yMREoeZEJMdga5FuzwYvthkgULw18fklCSbKx3PH4meDB/ia7Mxpfh8LyuhNUsc+ys/qW1G3Yf/7MgbCSRbeIA4kxNMrGk0iVhzhTfwW7yeyjD+f6bJBuiFFxONXQFWGIob/2j3yfKcCBVsSDIUbP6bxS5WwtuPITjVhlfrE45Sn40emsWsI+G2nd+aR0Lco57ANM8PVjXbFP1Y2s3Uwz8ecXxMowo5m+6Bhdsw5aMNMoChvgFLqhH0g1IGGnP7zaoVRpjRUyaOKVwBKj0M2V4Ru/PnDIpDHSbHN37OEbyZ0V1fUUdaJf5HmDnyChl/ZTFMQjsXkkZ2+0SHbaIoUfpAiTWOL2WGib9poLLaaXzCLyAV2BpLDo9POWkpW1iFGRQaHiT/5OhM9Ow5NHcfjFMCzWcHpRzYPEJN85hnauXlrpDGjHb28afafUTxAbyws9SRxwXN5UcDsR4KPz04U/qLu3tUwkPPt38zelGM/tdtiA+AxjylirsBiMv625uObDQ85Zm925kkGFBVR7Xrp3vY86+nTtxtw1fXLGs5HO3rpdOl/NtlAO3q+7FKsohEVa1Osne3qreMDZoi3I2LrcAWwkQ/P5Akx/M5cV5JCeZs/sWzDVmXyn4vWf98G3zNihOgn2ASCvzDLb3AFleHBd48MIcgCuDkLyie2ppl6fEd8oWbSzifk0MReKJOiCx+TtiDv4VRk/ayL5a/qntQuryJD1vQ40tWkcfUww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(4744005)(83380400001)(38070700005)(38100700002)(31686004)(110136005)(316002)(54906003)(71200400001)(86362001)(2906002)(64756008)(44832011)(66574015)(36756003)(66476007)(66556008)(66446008)(8936002)(508600001)(6486002)(6512007)(6506007)(26005)(8676002)(66946007)(76116006)(4326008)(91956017)(122000001)(5660300002)(186003)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm4wOGgycGhNZVJ4SWFrQUpiUmlXem13MnI1aFJxd09PclhmWnBHT0F6bHpm?=
 =?utf-8?B?VjNvN1UxZlV1WVRORnZkTDEwQ3JQa25MZStqY0p0WkhRV2ZqVHJLaUZnYUxC?=
 =?utf-8?B?emxpd3pucWVvM21XZVdpQmJYSzdNTSs1ZGc2djN2UkkzdFl1TmRUSWxjRzJE?=
 =?utf-8?B?NUh6Q2FwN21PSmlLYWZvc2tkbFRGNEdZRDNMRnBIb01TWkFYY2VQeVdlRElo?=
 =?utf-8?B?N29NY3lKT2RKVDVUaDlDNmh4N3FDUnpmSHpkcUVXamZsOTlzVTFzWEJxS0FE?=
 =?utf-8?B?ZWU0aWphRUpaa01hQVhEQ2FtdVZCV2tWU0I3K0NxUVc4a2MzYWlnMDVUb2ll?=
 =?utf-8?B?R2NrZ3ZKaVlzSFM1T0grYTdYV3dyWldWVW1Td1pLbzdRdmFPRnVQc1B6TzJw?=
 =?utf-8?B?d2JNSnZyOThkcGxEVW1IMlBGMmtmeXRLZ0RtQk1DUU1nbWZUMW96d1FGMVRv?=
 =?utf-8?B?QmlxUU4wTEJhRVVrcmNQZ0NTZ2VlUzl4eDY1MDM3SVkwTFR4NUNYV2c2YnRI?=
 =?utf-8?B?K2lIcTBQYWpGM2MvQXREUW4yUG12UFBOYkdoVnNDOGVDSEViaFRMdXNQRVEy?=
 =?utf-8?B?Z2hsS2RtZjZWdWtuSS9kOTV2YTFvZ1pSZ2c2UE1UOHRjTThnNzdNOHgxbk1O?=
 =?utf-8?B?aCsxVGNLSE51QjJEbGs0WHp6T0g3cmJFTkpjWFFOaWxueXloMktTMVBlZTJN?=
 =?utf-8?B?TTZzWXFLeUJOSC92OWwxd3FXRTZMaFZuTGM3L3NKUldMZUs4VGhIOXNXMGo1?=
 =?utf-8?B?VWk4RWNDS3cvRUtwNWJ1dWt1MGxOZzhwNnprWWFrcERkNHZvMmpvZnYrdGtY?=
 =?utf-8?B?dCtSRytXelVUN21WMlZVN0NjWjFlWUtHRFdKUGk2V3NYaEtxSlNxeS92djFM?=
 =?utf-8?B?UWM0ZHF5SEl4N0M4STR3c0V0ODRLVTVQQ2RhaWJ1d0pJcEtZTkh3TzYvakpv?=
 =?utf-8?B?NndMTWxSVWY4R3ZCclJRVXUwRDdOR0ZaK2xJM2VCd1lmNnViUEhUMG1JeHZM?=
 =?utf-8?B?L0M2MWxXbHJOSEVRMk5KSlpmZXNQSTUwdVNuMCs4YjE0Z25jNzloQ0NpSHF5?=
 =?utf-8?B?UGhMaEExQWVkOGwxZDFJT0tZbGN4MHVxVHRLZkY2RVpRclMzanpPR3o1RFlj?=
 =?utf-8?B?K1F6bHhXbG5BenZsSlo4L3BPRjVaVk1mVWwySWNQeDhENmtNd1JjMHFtTlU3?=
 =?utf-8?B?Q25mS2hlODZnWUc1ZitSak1kUnNIQXVweGljYzdFWEdoOUk5Yno5Q0ZVSkpu?=
 =?utf-8?B?QzhYRElIem02K1VoT2dDaUVSSTNtVU14djROQm1OVWNLMGRnREpvTzMzSlh6?=
 =?utf-8?B?RXBwbExDaE5qTVBjZ3AyQlNJQTl6amllZVRMdE81MytEVHVXUGgvNkFxeHFl?=
 =?utf-8?B?YVlhUm1ucE5VSmwvUVlIN3ZJR0xyY3FKNEFURi91VnhvUGNGZjJtUkJpWWR5?=
 =?utf-8?B?djFOSFI2SXhxcXJlTVFCd2VTMnRaSzM3cUJXV0NZNGdkQWlxSVIyMGNzSW1N?=
 =?utf-8?B?S2xrdEhhcE8rY3hIeTQ1MXdVS2tqdXVEUjR5SFI2VU9nTmFvd1BwUWtNOTN4?=
 =?utf-8?B?em8xWVkyTWR2NmRZSFo5WXJLQ1J6RVR6Tk91Y3NzTFdwd1QrTkpoREMrSm1Y?=
 =?utf-8?B?ZEExNGxCbXA4SGVxNisrWW5JS2dSTlFRTHZXTGtqYzhoWXpkZlVmZjZQdmFE?=
 =?utf-8?B?M0ZRaEp6YkQ3VGU0ZytvL2JSQUphTHpNc1FYVnVnMUgwaFVkeGtuODlzKy95?=
 =?utf-8?B?NitrbWFzay9PUmlMNnBZTEk0c1JjN1czVmcwc2lRWGludG5HRlJ5bzVaT3J0?=
 =?utf-8?B?UkVQcUlNaTNnN3BOWmxyanpGbEZyQ05seG15T0NOQ0JBMUtEMy81a25lNENi?=
 =?utf-8?B?Q01sU2NvNUVkdFA4ellCN0MrdHBnVXVzbWJPSStZZ3lkZk9JYlpWcHdmOHVi?=
 =?utf-8?B?bmdmTkhleUY0bDBwKzlzSXlLOFJ6LzJtRCtBYW15YzZHWHJmRFB5NnlzOVFi?=
 =?utf-8?B?Z0w3aFpqYUllNnFQRUtUVEVDVVBQMHlvOW5XZlQyeWpZVGcxOUxPSGhCTTNq?=
 =?utf-8?B?YnllL21uSU85aDlvTVZ0VUlGWGc0Y0tkajBXV244ZlRIR0d6TWhiQkdJcXE3?=
 =?utf-8?B?TXB0aUhwMWUzdUhuNkNadVhORlJabHVpQk44UnlNYlJDbWV0T3BJVmxaY2s1?=
 =?utf-8?B?a1EvR05ad1VqTE1NREI1TFBqcGlOL25DMlcweC9KMStwemo4bkxtelpXcDFM?=
 =?utf-8?B?SjVqSm85U1VLd0ppS2VSRnlBOXRmd2doc3Q3R2dmWmlUWFFMWmZjQ0hBN1pW?=
 =?utf-8?B?dFhwYzNON2Rray8wdjM1bmZxYmd0VHJueVVSRjFTeS8rUWo2QzhwVmFrVFZP?=
 =?utf-8?Q?WanVBqv58vMbRKOjFUpJ+TtRgKsbd7j8WmvGw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D303744E3FE8545B624ECF0E5B26C9A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97179a1f-6629-494a-8f1c-08da3a7bfb2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 16:15:39.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxRY8paGhAMVJ+FtOviH06vOkzdcGQYpdx+FuDH7RnVgnUQfQ1cgeoS/NHQFEpH3TbEklHGKbxPKu/NpJG/cXkWdqYuGIFaKQVXebH0cM9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1941
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA1LzIwMjIgw6AgMTc6NTcsIExhdXJlbnQgRHVmb3VyIGEgw6ljcml0wqA6DQo+
IFRoZXJlIGlzIG5vIG5lZWQgdG8gcmVhZCB0aGUgSF9CTE9DS19SRU1PVkUgY2hhcmFjdGVyaXN0
aWNzIHdoZW4gcnVubmluZyBpbg0KPiBSYWRpeCBtb2RlIGJlY2F1c2UgdGhpcyBoY2FsbCBpcyBu
ZXZlciBjYWxsZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50IER1Zm91ciA8bGR1Zm91
ckBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzZXJp
ZXMvc2V0dXAuYyB8IDMgKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMv
cHNlcmllcy9zZXR1cC5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3NldHVwLmMN
Cj4gaW5kZXggYzlmY2MzMGEwMzY1Li42NTRkMmI5OTljMjUgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9zZXR1cC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9w
bGF0Zm9ybXMvcHNlcmllcy9zZXR1cC5jDQo+IEBAIC04MDMsNyArODAzLDggQEAgc3RhdGljIHZv
aWQgX19pbml0IHBTZXJpZXNfc2V0dXBfYXJjaCh2b2lkKQ0KPiAgIA0KPiAgIAlwc2VyaWVzX3Nl
dHVwX3NlY3VyaXR5X21pdGlnYXRpb25zKCk7DQo+ICAgI2lmZGVmIENPTkZJR19QUENfNjRTX0hB
U0hfTU1VDQo+IC0JcHNlcmllc19scGFyX3JlYWRfaGJsa3JtX2NoYXJhY3RlcmlzdGljcygpOw0K
PiArCWlmICghcmFkaXhfZW5hYmxlZCgpKQ0KPiArCQlwc2VyaWVzX2xwYXJfcmVhZF9oYmxrcm1f
Y2hhcmFjdGVyaXN0aWNzKCk7DQo+ICAgI2VuZGlmDQoNCkFzIGZhciBhcyBJIGNhbiBzZWUgdGhl
IGZ1bmN0aW9uIGFsd2F5cyBleGlzdHMgc28gdGhlICNpZmRlZiBjYW4gYmUgcmVtb3ZlZC4NCg0K
PiAgIA0KPiAgIAkvKiBCeSBkZWZhdWx0LCBvbmx5IHByb2JlIFBDSSAoY2FuIGJlIG92ZXJyaWRk
ZW4gYnkgcnRhc19wY2kpICov
