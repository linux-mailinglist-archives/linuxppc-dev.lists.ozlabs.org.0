Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D7698CF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 07:31:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHQ7d6J0Zz3f2n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 17:31:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v3CqQRo7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::62c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=v3CqQRo7;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::62c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHQ6d0w51z3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 17:30:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZiFWvk0vBkUmi353u4/aZf+PkoVCKTAQ3JWOF6YP8KCyaIatqnz+LYL4TAsjTCPIPS6fZvT9Bxde9Z1I4y/zzw7DWxBiBjeQzYPeQro7ZisjTZFUSF3qVMNR789UAChGHjUnWQcdujIKyof7h7ZUrJpIbTuxKcvgMdPDx09gNoEvJW+DJwAlQoKOiD2IK2S5/fCXy4Vo1kqD5q7InEKF4MgKgBu4lk8zRuwuaPjDHfoN1mkyv+d0kMON15D+Nd6+kkJ0JFxLTYVaxrzMEjCSbxRVafEpzq+1h5VBafWAEkuviJC69yJbrPb3hT0gpJ9MUJCRAYXatAmoKMW7OfS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agnGcGZyfGcpVmClmHJNnymlfUdOIYrrnDyvi2spTfo=;
 b=PAVfd3P9zm78VFmoVbd5VtGqpcdgIaalm6HO6Ei6yWFnejqkydwfTAB+b9XtyfeEOYd8BbQ6M2H4KGqHmsZjBPn+OIjqGDKtH3hh2U4+fhLY6uHKtqalbHRncjNw5JePMHzUuEVGVTzjxJT6FPT0vXF1Gvl+HMCJRvS8Z8MDWvidEP1MLaUVCYcNlZbJU6JNezJFRYqK/gHN6UB910zitvMhBRnVuVIGmui8lu1Uz7qAIVg2iKoP5f+Ex/cOp0LJIHGokiFdC/z4GGbRSMeXAn69kV6gGvCtbc9WRVgcUcNg19VyLnfLbMZIXU7C7a6zk+nmkkS1EUIBQpYg7eFzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agnGcGZyfGcpVmClmHJNnymlfUdOIYrrnDyvi2spTfo=;
 b=v3CqQRo73SpjUZ5IVHqVYahl2lVdgQVoAysdl1nwP6ViINFSn7t35k+mxCZW8gbrx0zZTqRsQHO28XhnvGxQPTJijFo79LYd58eZVe4TPr2Kxw/7cQ/4hG0mgLIw4x4YAk7noZ7E0p7TBApWgKhGqgYYHyOw1PDZhnGaE4xiF2v/ONlPdYrPsjWQo0OhpXtVjeQOA9JBheKmzIqFrQQUbq0s8z6XZjp2h6IhcnbOCjksbtZkD5Sn/LPzoLozK7RsiW3VEpBQhv7UAt5InF0KWxuf9kNjQwbhopcbFN2iglJ2/o83XHFZ8lUvEwxcU5Ttr/JCBzbP5WFfigl5FS3H/g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2133.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 06:29:52 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 06:29:52 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard F. <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: 6.2-rc7 fails building on Talos II: memory.c:(.text+0x2e14):
 undefined reference to `hash__tlb_flush'
Thread-Topic: 6.2-rc7 fails building on Talos II: memory.c:(.text+0x2e14):
 undefined reference to `hash__tlb_flush'
Thread-Index: AQHZQZkuL5MkHAY8rkOdX/S6bf/8C67RHPOA
Date: Thu, 16 Feb 2023 06:29:52 +0000
Message-ID: <a2b50c13-6ddc-e310-559e-ee429e96c527@csgroup.eu>
References: <20230216005535.6bff7aa6@yea>
In-Reply-To: <20230216005535.6bff7aa6@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2133:EE_
x-ms-office365-filtering-correlation-id: fa81bc29-5611-464c-e5b4-08db0fe73646
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tOSIekupwx+ce3VrcAVeH9Kede3cHxBkCwgH2WpPF8xoBASle+HX+eudmdqGIVtWmJgA2U9JwwEuMtd5CNCNMevGopv2zZrwa/nSKQNx8uSzD+Uw7A/VHkKj9Q0YPaYcLShAr4K12ZteOjk6GfKNnf8WjZocV0LZCGFce0Bf+oTDIeVWrU/U09sWGYB46SBgCd/JkcsIINVErIxisR0I7D0vKtkZiV37oTAZ1KeCETSngw225hxiENGFJu3kOxHYv48KTMdCcS/XQaL/smIly7HwqGvK4Ot+2aoT/O17DVepbw1NcT/sdQszaU7z2CFLlwrU8WSvnM2QuhUqWpI/nwZ1ziCBjOZwrkISyr9/AU6aejZ+p8BuTfgKcyNS5NoncwMTGW0LUgkOXX2NPh/CuemsmIs8RSZbeFSI2zdt1zfjnKWoOWX3QAd2M3j3zJCaJ+b3ovLgeX2nEZ7wKNVUth7gp/MoFK0yZe40ESPSCF5Iw5yrTm7OjKf/fzexV1zJbVAmaQPPlIHvO/+FpcpyUWX+ecUvl97CIWpd9EuHg5SOJIJV8fjXXWp2C4BXPoIcX+6EdzcAe8KfYKpLphfPUHQsA4qKgHyaxoMFooZYmR9m7/44nEECvVzo115EN0Kyy9byLt+PEmRf5ilE9C9BdUzINmboZGkZxt9/Z/0dw9VW4xPG2Hh6nz0UumNO1QTP0iq/Gn4zHCS14IQlBlMqA1D25urBcY86OuWf11me7RgoAF9+h0SVdYwpHKeUaDIhY1g2Osf1I0s/rWOccOYb49Wrb1oGt+N9D4buiBggQC+K2dPtjBlF1u6naRz40a9C
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199018)(2906002)(31686004)(41300700001)(83380400001)(5660300002)(36756003)(44832011)(86362001)(8936002)(91956017)(38070700005)(64756008)(66946007)(8676002)(66446008)(66556008)(76116006)(4326008)(31696002)(38100700002)(110136005)(66476007)(316002)(122000001)(186003)(2616005)(71200400001)(6512007)(6506007)(66574015)(26005)(6486002)(966005)(478600001)(81973001)(101420200003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ZlA4Lzc2eWt5V2FYNTBHeG8zSzVjRFZ2YS9LQmJJS09iMVBadkI3ekJKbU5P?=
 =?utf-8?B?VlcyeXJ2WWIzUld6bElYTXdIcy9xdFZjanJPSFdUM1pJZnI2TjRjY0gwcGdF?=
 =?utf-8?B?S2Fia0ZST0dWTk84TFJDZ1daTnZKSVljaDJpS2Fra1h0UXdtTHA0NmZnQkp4?=
 =?utf-8?B?ZWZDTEZUWVB6YUNIajN0Y3pseTFqcTRUVWlGTWRsdWQ2cEhPWE9leTAwUFFL?=
 =?utf-8?B?bXM0TnRXblBNd29vQjlmVnY5WkhLc2ZZNnhJTlNiY01TVk1RLy9MZnAvMXlV?=
 =?utf-8?B?dzkwenYxRHAwbkd2UUpBdHRGZUFGWElLNWE4MkVaUXNVemxSOTVZSDVTTElY?=
 =?utf-8?B?YjlSUHhFeGpvbm5GRGpBM2NXTmtUeEI4WmJaNnhRZmRnZHowaUhJODRYTkZt?=
 =?utf-8?B?NVkxLzU5SUE3c0VpQi9BcHFOVDhOQzVOWHpTSG9PVWFrSjJ3M1pHQzRkRlQ2?=
 =?utf-8?B?TElXMEdtNW5HT3BhcGp5UklLY01jMi8rSjVoUExaRG9TU3ZndGV3elhyODUy?=
 =?utf-8?B?dlRRMjd2WW93c0h5TDRtVk5NZTVTL2NaY2dEM0YxWVlpRit2Qy9uTk5tVlN1?=
 =?utf-8?B?U28yQ1BBby9XczNsSWk3SER6UWptM0VoUjZpaXl3UmRISFh3YWtqR2R0bnRY?=
 =?utf-8?B?cWRaaUl5bE55d1QzUEJXMDRkbG0yR1VxOXhEbTFHOVp4SGZaNWtNQkV3WWpC?=
 =?utf-8?B?eU9udTB1Q3kvak9RUXB5ak5PZ1FaZ0tJNmhnVGFLd2hiVURHWjJ1Qk5hbVQv?=
 =?utf-8?B?NkR4RnVRTU5YZHJwZ2xSMzEwNWtzdlNwa1hhOWZteE10V0dtVmJTUU15Qi84?=
 =?utf-8?B?c25nWnd1N0haSnVKdzNoQmZYbWZFTWJJbURlRkN2QStnM2hmdkV1Qk5abG5U?=
 =?utf-8?B?TGRUOVo4aGt1aTZKWEVMbUI5dVBvajVZeGxiak5BQ1ZKQkZoM1ZML3lGRll0?=
 =?utf-8?B?bm94dFpISDM0aGsvTThSL0J4QXRHTlMvc243TjBSM0UrVTJiUnpoNkFDQ1VL?=
 =?utf-8?B?aTNYQWt5Z29hSkVSMnlTZHRtQWxvQnRCVVlYRnMreGZwcEdBblBmY2l4bUR1?=
 =?utf-8?B?VGpVNDFXbGp3QlRhemQxanQyTi9FTG1LakgrQzlNSzhPME5DdU9JdHNNZS9t?=
 =?utf-8?B?WWdwN2RlQmh3bVpOcmhQaUpUN3hkUjVYQmN5VXd0MXlaOVlYTVFqcVQwZkJr?=
 =?utf-8?B?T2hZN1ByUzV5SE10N1gwNk1OMllMcDFZRGhuWHlnZWFDT280UVg1dmVyVWxR?=
 =?utf-8?B?U2hlb3pRUkJaVHJSTE5Ed0s3dEpsd2w3OGtYMTVNVWRoWUxBNzdySkkzSFVo?=
 =?utf-8?B?UXFaRW9UZ0tBK2ZXMENXSUdvbkkvODFtdDVGS3lJQWNHZXNCeTk5VWJsMFhW?=
 =?utf-8?B?OHc5L3ZnUHFNQmNCWmVTdEpaeVBvZ1ZTTGtyRTB3OTRFcmNzVi8rSU1YT3VY?=
 =?utf-8?B?UDYvM2FTTFlTOGhhNlI4UFZ2QWNIK2ZoMGdaeFBYaWEvUXZ3R2puUHkzQVFC?=
 =?utf-8?B?VWEzbm9DZi9XT1NQSXAzTXZ1bW9IbXg2M1VjcVc2N3g4VUQ5KzlHUEJaRHBJ?=
 =?utf-8?B?dU9TVndhdE1ocGFVc1k0Qi82QkwyOG45VlRZYWNFZ0E3bDJCbE1GeXo3eHl0?=
 =?utf-8?B?ZnNsbEZVY3YyUGc3OHhPSGVUYXNwVDNZbW02a2JVYkZGZlBia3B1NTN1VXNu?=
 =?utf-8?B?QW4yMG5LTDJRR2pYSFp2VS9VWnNhYWkxMFUrUThQbFhjcHpJVjBGMFlPUVdp?=
 =?utf-8?B?UWRoNTdibFB1TWRZYTFCTXZNVDdyZkR5Ni9XdnVlYUtqSGQ1Q3RDMy9ZZEtx?=
 =?utf-8?B?Rzk4eUpmbU5iK2F2dVI4ZFg4eWkvYWFSdWkycDZ3QUtrb2JpOHcrWkx6NEdo?=
 =?utf-8?B?SVZ1ZjJ3ZUU1UUZ2SlFNVk50MC9BYjc5MUE1K29ZS0szdEVweitSQVAyd2xU?=
 =?utf-8?B?LzlCYWlNMzdCSHczSnlLb3Y0MklpNTRvbjYrNVRTUjNwaTBGeGlZeG5ZQUR4?=
 =?utf-8?B?ZkVMaGlWamJGYkMxajFETVhqSnhsZkdFL0hLOFFaODczV1VpSCtqcWZ6Z0Rj?=
 =?utf-8?B?NFlaVFhXd1BFVTdpSWlJcHkyenluSlluNW1KNk1LWjdzcmZwclVNK0diTzlQ?=
 =?utf-8?B?T3JGZjNYUkNsMGQzL3FaQmJTTDZwSjNyZHdjbVRzT1JhRzJmSVhuRkFaK1pM?=
 =?utf-8?B?eUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51C36FE8EA1EA647A90C7DB88E36C878@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa81bc29-5611-464c-e5b4-08db0fe73646
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2023 06:29:52.4911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MZSOjaKNVNy/0IBuOvN1HgPb3xGyq4xvnML4vDLRJShfaTHGPp9pzcyyU3DvGe/0CF0SdSDeuEUwmvrJyBKAgEZeY94Cj4bIwqgE+STWRGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2133
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzAyLzIwMjMgw6AgMDA6NTUsIEVyaGFyZCBGLiBhIMOpY3JpdMKgOg0KPiBKdXN0
IG5vdGljZWQgYSBidWlsZCBmYWlsdXJlIG9uIDYuMi1yYzcgZm9yIG15IFRhbG9zIDIgKC5jb25m
aWcgYXR0YWNoZWQpOg0KPiANCj4gICAjIG1ha2UNCj4gICAgQ0FMTCAgICBzY3JpcHRzL2NoZWNr
c3lzY2FsbHMuc2gNCj4gICAgVVBEICAgICBpbmNsdWRlL2dlbmVyYXRlZC91dHN2ZXJzaW9uLmgN
Cj4gICAgQ0MgICAgICBpbml0L3ZlcnNpb24tdGltZXN0YW1wLm8NCj4gICAgTEQgICAgICAudG1w
X3ZtbGludXgua2FsbHN5bXMxDQo+IGxkOiBsZDogRFdBUkYgZXJyb3I6IGNvdWxkIG5vdCBmaW5k
IGFiYnJldiBudW1iZXIgNg0KPiBtbS9tZW1vcnkubzogaW4gZnVuY3Rpb24gYHVubWFwX3BhZ2Vf
cmFuZ2UnOg0KPiBtZW1vcnkuYzooLnRleHQrMHgyZTE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgaGFzaF9fdGxiX2ZsdXNoJw0KPiBsZDogbWVtb3J5LmM6KC50ZXh0KzB4MmY4Yyk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYGhhc2hfX3RsYl9mbHVzaCcNCj4gbGQ6IGxkOiBEV0FSRiBlcnJv
cjogY291bGQgbm90IGZpbmQgYWJicmV2IG51bWJlciAzMTE3DQo+IG1tL21tdV9nYXRoZXIubzog
aW4gZnVuY3Rpb24gYHRsYl9yZW1vdmVfdGFibGUnOg0KPiBtbXVfZ2F0aGVyLmM6KC50ZXh0KzB4
NTg0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaGFzaF9fdGxiX2ZsdXNoJw0KPiBsZDogbW11
X2dhdGhlci5jOigudGV4dCsweDZjNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGhhc2hfX3Rs
Yl9mbHVzaCcNCj4gbGQ6IG1tL21tdV9nYXRoZXIubzogaW4gZnVuY3Rpb24gYHRsYl9mbHVzaF9t
bXUnOg0KPiBtbXVfZ2F0aGVyLmM6KC50ZXh0KzB4ODBjKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byBgaGFzaF9fdGxiX2ZsdXNoJw0KPiBsZDogbW0vbW11X2dhdGhlci5vOm1tdV9nYXRoZXIuYzoo
LnRleHQrMHhiZTApOiBtb3JlIHVuZGVmaW5lZCByZWZlcmVuY2VzIHRvIGBoYXNoX190bGJfZmx1
c2gnIGZvbGxvdw0KPiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUudm1saW51eDozNTog
dm1saW51eF0gRmVobGVyIDENCj4gbWFrZTogKioqIFtNYWtlZmlsZToxMjY0OiB2bWxpbnV4XSBF
cnJvciAyDQo+IA0KPiBBcyA2LjItcmM2IHdhcyBnb29kIG9uIHRoaXMgbWFjaGluZSBJIGRpZCBh
IHF1aWNrIGJpc2VjdCB3aGljaCByZXZlYWxlZCB0aGlzIGNvbW1pdDoNCj4gDQo+ICAgIyBnaXQg
YmlzZWN0IGJhZA0KPiAxNjY1YzAyN2FmYjIyNTg4MmE1YTBiMDE0YzQ1ZTg0MjkwYjgyNmMyIGlz
IHRoZSBmaXJzdCBiYWQgY29tbWl0DQo+IGNvbW1pdCAxNjY1YzAyN2FmYjIyNTg4MmE1YTBiMDE0
YzQ1ZTg0MjkwYjgyNmMyDQo+IEF1dGhvcjogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFu
LmlkLmF1Pg0KPiBEYXRlOiAgIFR1ZSBKYW4gMzEgMjI6MTQ6MDcgMjAyMyArMTEwMA0KPiANCj4g
ICAgICBwb3dlcnBjLzY0czogUmVjb25uZWN0IHRsYl9mbHVzaCgpIHRvIGhhc2hfX3RsYl9mbHVz
aCgpDQo+ICAgICAgDQo+ICAgICAgQ29tbWl0IGJhZjFlZDI0YjI3ZCAoInBvd2VycGMvbW06IFJl
bW92ZSBlbXB0eSBoYXNoX18gZnVuY3Rpb25zIikNCj4gICAgICByZW1vdmVkIHNvbWUgZW1wdHkg
aGFzaCBNTVUgZmx1c2hpbmcgcm91dGluZXMsIGJ1dCBnb3QgYSBiaXQgb3ZlcmVhZ2VyDQo+ICAg
ICAgYW5kIGFsc28gcmVtb3ZlZCB0aGUgY2FsbCB0byBoYXNoX190bGJfZmx1c2goKSBmcm9tIHRs
Yl9mbHVzaCgpLg0KPiAgICAgIA0KPiAgICAgIEluIHJlZ3VsYXIgdXNlIHRoaXMgZG9lc24ndCBs
ZWFkIHRvIGFueSBub3RpY2FibGUgYnJlYWthZ2UsIHdoaWNoIGlzIGENCj4gICAgICBsaXR0bGUg
Y29uY2VybmluZy4gUHJlc3VtYWJseSB0aGVyZSBhcmUgZmx1c2hlcyBoYXBwZW5pbmcgdmlhIG90
aGVyDQo+ICAgICAgcGF0aHMgc3VjaCBhcyBhcmNoX2xlYXZlX2xhenlfbW11X21vZGUoKSwgYW5k
L29yIGEgYml0IG9mIGx1Y2suDQo+ICAgICAgDQo+ICAgICAgRml4IGl0IGJ5IHJlaW5zdGF0aW5n
IHRoZSBjYWxsIHRvIGhhc2hfX3RsYl9mbHVzaCgpLg0KPiAgICAgIA0KPiAgICAgIEZpeGVzOiBi
YWYxZWQyNGIyN2QgKCJwb3dlcnBjL21tOiBSZW1vdmUgZW1wdHkgaGFzaF9fIGZ1bmN0aW9ucyIp
DQo+ICAgICAgU2lnbmVkLW9mZi1ieTogTWljaGFlbCBFbGxlcm1hbiA8bXBlQGVsbGVybWFuLmlk
LmF1Pg0KPiAgICAgIExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMzAxMzExMTE0
MDcuODA2NzcwLTEtbXBlQGVsbGVybWFuLmlkLmF1DQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaCB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspDQo+IA0KDQpDYW4geW91IHRyeSB3aXRoIDoNCg0KZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvdGxiZmx1c2guaCANCmIvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC90bGJmbHVzaC5oDQppbmRleCBkNWNkMTYyNzBj
NWQuLjJiYmMwZmNjZTA0YSAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9i
b29rM3MvNjQvdGxiZmx1c2guaA0KKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2sz
cy82NC90bGJmbHVzaC5oDQpAQCAtOTcsOCArOTcsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdGxi
X2ZsdXNoKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIpDQogIHsNCiAgCWlmIChyYWRpeF9lbmFibGVk
KCkpDQogIAkJcmFkaXhfX3RsYl9mbHVzaCh0bGIpOw0KLQ0KLQlyZXR1cm4gaGFzaF9fdGxiX2Zs
dXNoKHRsYik7DQorCWVsc2UNCisJCWhhc2hfX3RsYl9mbHVzaCh0bGIpOw0KICB9DQoNCiAgI2lm
ZGVmIENPTkZJR19TTVANCg0K
