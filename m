Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2DE8580DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 16:26:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HxCqj7vS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tbwkq0DQVz3vbx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 02:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HxCqj7vS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::700; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20700.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbwk30zCrz3dXf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 02:25:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H6qq+LbWKt9z/EyMvUG/XHAb3mdTXeQXQ5RRPxiEctyBKLtdyEzT1jgQwK+oXmnXXb3QnmFzcdq0h80gWPChNn3TMhBlvGOegAA5Jp/FXQrhqcsD5fFxZZmPr7yySg6bXCoIoy65DvQc73tKyEm5avLvJalYpJC7UAbcTl2J7SMzuufusa5YAVdiS2mxcK3wCfT89XEW5O+zAsREPaVfxaSSJKBs/s8wIopWpCWuq/To1QXVtmi/4/GGXshixpvfE5+EPtBQmnspTXSH0KmqFXKIt/LbDfGNITh5b1xOG7DIFUUFiARiff8Vuu9vaqr1BJSLb6JIYnzwcKm3UWnUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gux1Xu6tmzPAPNlr/UDLjOhuC4ag+3HGClxOmeDCfjM=;
 b=DcNRQndLvx0ETTzuOI1F9bfDPtMrEMToF4GxFR+CPcgKXlFQ6y6993DW7IMsOF6R9kkyOqT26Cx6WRp5Rw/V3Q4Q6QCjaYW45rNbSP0KsOmtY/0+IJaH74DDKuNj+JAS1A/oIFCJX12tONSGJnQAjAmedSN7KNDKfnJ3RvtGeLM452UF2YjRvmPStYj1kv32pTLT0cbkpI21S5X3mrtUCKCurzPmlYs2hzH1dFycT6QS9JF74SFHr9YAuLLkLMQO2tJGjnLeG7RblxNkzfIS+Sxq8h6iIth6UHtvbYAdn66xyjy/ZLBkpmVpdk/g+obo4YQN0wJ6VMzieKoL6cuhMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gux1Xu6tmzPAPNlr/UDLjOhuC4ag+3HGClxOmeDCfjM=;
 b=HxCqj7vSNg+NmP3ahJlb5c/QeV4AufpD79PbK3M2/G0zJfpy9SHcoaj6uqof/byumYWyYEFX90S5v7dw4eaKNFtZS7HNrRXsnluMzdcmzDc/wvcbNhJqiSLS4ArcWSnpm0wwpKglt9J7NEHSGBbIqFkatW48ipmgCMuieRsEmKsNsCA3WgWeYf4RclRanBanvmmzPSX+QAq4MXN9B+JPjIIhWI7rj9kIeAykU5f7Y+CzWEzej2Eb29IBSQPjQIhZEm+HzFf4YlMEf77CPxDl+8IxjrQlijkhdpmmPDE9YhAhF6wNDmv8/2unzVEv0XN34pTd7//LaFVOXmtiZcv8jA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1879.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:9::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.31; Fri, 16 Feb 2024 15:25:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::64a9:9a73:652c:1589%7]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 15:25:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
Thread-Topic: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
Thread-Index: AQHZFFcew88y4g+eo0KJSsqBMOfNja7XuKuAgjf3XQA=
Date: Fri, 16 Feb 2024 15:25:22 +0000
Message-ID: <94d19157-a343-425f-906f-546b1f4def6f@csgroup.eu>
References:  <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
 <873570zxio.fsf@mpe.ellerman.id.au>
In-Reply-To: <873570zxio.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1879:EE_
x-ms-office365-filtering-correlation-id: 8a0ff17d-ac7b-4318-e31f-08dc2f037e0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VEUaqb7/l2xteYDbseZ5OMu/xON7DzNn3HTDXrf4daWCnjIN8ebwVmUZDfNMSXA43Mw21Nrnn/h21luiSQ9uGl2tNFIm/3vsTMDAPCRcLvgKZQ1sVcHCknhsqQxlctcxaqLeP3f8aoiJCDgylSTferAgSa/13fhUpPfsS5SxqNej6zLzXWaH9hLdYT7gDAJtFN3wOuFlrKWEbXyPwX0Oo404MHbLeP3BPB6Lb7OG6M4Vw4k4kur0SQ/F1iMIe6gY+kliAi2bPvgOyNZgFtWFR0J+4iiA4APpWKZWWZMP4OTpOBeI3sxfcNbkyWMV2mLddymp34MUhh9hklkc8INzUsm9n8x7h7jy15oNsVjBZEfhkoJ5Eodn1FSTZCzGWavqEjpmA0tAR+zgiqM3mJ3RNvvfoxtvvMZmlOz0cOXSOvPRcow0MTAIKrZXrIrmnpeMOZ2+AyN6tE5F/J16l1WXBoyP9FSM70j4Yf73iC19x7XWgaMIAiqiFVtHXwWz5jDOhWPdLXP6cAB38/lBe+M8r/tDhUoG94UIU1bzKusSvwEjJWIUMUbtShl+1wNoyJEdsn0u4j1o7GM4m9bHhUxAuuTMa/z+JTa7wXSRSwl3v+yrqkPpPVLcV029ePUBAIWM
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39850400004)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38070700009)(4326008)(2616005)(8936002)(8676002)(66446008)(83380400001)(66574015)(6916009)(66946007)(76116006)(66476007)(66556008)(64756008)(6512007)(316002)(71200400001)(6506007)(478600001)(54906003)(6486002)(122000001)(38100700002)(36756003)(31696002)(86362001)(41300700001)(26005)(5660300002)(2906002)(44832011)(31686004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?STVrS01RUVVCQTR1a09UODhxcENMUUdGRmo5em9KZkhDdXdjSWpjL3U5NEt5?=
 =?utf-8?B?WEtRYTRKV3ZKYXl3cEZoZTM4VEQrYnJCRWhOWVQ3VlBPcVd3eHd0S2dXbkFQ?=
 =?utf-8?B?Y0cwK0tUUFk1ZjNMcXgxQXZHaWdtVUVDc0VCNjNxaUJPb09zQnpWdjUyKzJT?=
 =?utf-8?B?MEV4Q3oxMU1aelk3TWpIUDB5ekFVT3hpWnFxUzFsa1ZWY0M3Z1hYcVkveGFj?=
 =?utf-8?B?TXAra3pTZWJZU3dyWW1wOWNSTEZpcUNrb1Rqc3R3MGdYN1NaZVh0QjlaZHJt?=
 =?utf-8?B?cnZVWlBBSDZ4L3ZhME9Zb25lS3Jwelhldi91REJIWGtyNHY0RVZlV3VrbDBM?=
 =?utf-8?B?N0srV3NGVUV6Uk4xUUpLK1NyWkk3dTJiRWJpR0xNdTA2SHFiUHlPSVl0dmtr?=
 =?utf-8?B?eGVGRFA3WVZVUjVpUUtsb1R6SHpJT0p0SmlRRG4xNTJUY003aWQ1cDdPQm0z?=
 =?utf-8?B?eFJOTmlYRTBnK2h3djJQcm92K3JWSWI0aXF3UDVqWi9YN051NFNwN0didFc5?=
 =?utf-8?B?OGRKbENrb2RlUTNwTFBNQnMyVTJvWUZuN0FGcnFmcHUxejhPbmpXZHpCWnhm?=
 =?utf-8?B?NlNOcjFYNCtkb0NXL2g3STlMTkNDbDlhVXQwRDJtSWh0bzBDWis4amZBbGgz?=
 =?utf-8?B?ODNUc0hxWEJEWmdzZFR2L3ZONVZObjFTODJPK1RjN0tycmtETjZPdnBkQXhh?=
 =?utf-8?B?K2IxM0tmNi90N2xUSmVaOHhqc0MzK3VtSFprNmRxVUZBZGRQamNPaUFXMnNz?=
 =?utf-8?B?SHkvcTdoeTJpdlZOQkdpVlJqQ1VHekhYWGtQTVBlazh3RVIzQ3lSZjhMeW9B?=
 =?utf-8?B?QnA2N0VrSWtmaWRqdTRzQlplWWJDb0ZNMDhPRlR1T1g0cU5Hb3gzMk5TdHhG?=
 =?utf-8?B?TDg1K2ZudGVTbzBXaHA4cW0xNzBhTFdYamZaYUcwZk14RWE1UTJhRXd6NExX?=
 =?utf-8?B?TW1PZWR4YTNudTZhcytjUDJ1c09GMCt3UHdESTNNUVBtaWV5MnJ3dVArdmds?=
 =?utf-8?B?Sm5vclVyTWs2MzRMNmdyWWVEckU2VXl2WERwMUFtMm8yYmRzQ0gxT3RCWW84?=
 =?utf-8?B?T2RtaDhWWitmMVh5cFRhUWZYcjFtem9yTFkwSG5CYk5NVjgwbkJWTEZuYllt?=
 =?utf-8?B?Y0pob1Q1NitxS2tkbVE4aThmbEI5OG56eHhET0d5dVI0LzVkbFBsWTJFNk5w?=
 =?utf-8?B?eGRxVVVwZUgzd004NlRLcFl6MW1LRDlKekI1a29SVEdDbnNoSHNCV1VZUy9k?=
 =?utf-8?B?NThmdEJvWURkZld6VWNralZmc25vbW9rTjcwbGNqZVp3RWh1WUs3VDZpaVJT?=
 =?utf-8?B?YkVZdXJZWGZIRUo1V0U0amhKU050TXgzYmZmbEkvTWhsUklaYS9yRkMzenhH?=
 =?utf-8?B?UlRKZ2FoOFFBeUdValdCWHNYR1dDbUpMVXhnVFQ0Rmh6a0VDcjVQUzJaUklj?=
 =?utf-8?B?ckR0ZFM2Rm5RcTlCbUJ6emFUL3VwdXJ2OEZYbENqelFVR0k5Tm1GVnRiQ1ly?=
 =?utf-8?B?UVgyWXpwaUpOS0ZqMW4wYVU5aHpEQ2JMMTd3L042QlBoZ3hzSEY5ZjBkckZu?=
 =?utf-8?B?UmpPRWpCMWxnMXRnN2ZwZ2FjbWI4TmgrY3VCcDZwN0Q5K0xRYm1vYWJsSnor?=
 =?utf-8?B?dDF1WkZNSytzUlN6eW1BOW96NTNzVXc1UUVwSlR5V0ZnejV4b0pFSTJhbGV5?=
 =?utf-8?B?ZGVwWkt3NDl3ZktxQnROOVY3eXNhaThkRXhnekhiS0ZCdGp2TFBKMVJFRUg1?=
 =?utf-8?B?cVhvVE1PVWY2YXpsbkRJenlGQXF0SjhDSTAyT29VTmg0Y2xSRm1QaXB1N3hw?=
 =?utf-8?B?dERzWVY3SDNDYTFvNjJncU1sSm5yWlhuWUVzMHo1ZTVwR2xrL09PbHpUOHZJ?=
 =?utf-8?B?dzBoU2Q1c3hXNmtjNE9RRHhFb0tDaG5Wai91SHV0d0hvMGpBZmlreUN3NnF0?=
 =?utf-8?B?R3o2eS9ITUpIeUlVL1RySEZ3d01LaHQxaVVZbG0xQTZBUnhFNGtycUZoaGE0?=
 =?utf-8?B?WlZiV3pqR0ZLV0NGTlJtUnZuYXBMWVV5U1lNTGpxU0drUUpaY0Q0RTh6UUhQ?=
 =?utf-8?B?SFJabCtHRU80SUM2SlpYalB1ekVQd0YrQTNxcVAvelV4ZWVCQk9zR0trckpk?=
 =?utf-8?Q?16HTLLVxIYEUyMrQq1ga5E0Mo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAE9344643E31640964F3D2C268FC68A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a0ff17d-ac7b-4318-e31f-08dc2f037e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 15:25:22.5377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +35M3L4Vuxdp1B7TXHTDNjAFlu/i7vX6jE1MQuN2//X7X6eYQuyWiZKp9tF+1CW+8u+qqnXLlVh04gG+IhuW1UqbMu0qRWitVQSr1wIzOmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1879
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "jbglaw@lug-owl.de" <jbglaw@lug-owl.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzAyLzIwMjMgw6AgMDc6MDAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBjcHUtYXMteSBpcyB0aGVyZSB0byBmb3JjZSBhc3NlbWJsZXIgYnVpbGRpbmcgb3B0aW9u
cy4NCj4+IEJ1dCB0aGVyZSBpcyBubyBuZWVkIGZvciB0aGF0LiBHY2MgaXMgcGFzc2VkIHRoZSBu
ZWNlc3NhcnkNCj4+IG9wdGlvbnMgYW5kIGl0IGF1dG9tYXRpY2FsbHkgcGFzcyB0aGUgYXBwcm9w
cmlhdGUgb3B0aW9uIHRvDQo+PiBHQVMuDQo+Pg0KPj4gR0NDIGlzIGdpdmVuIC1tYWx0aXZlYyB3
aGVuIHJlbGV2YW50LCBzbyBubyBuZWVkDQo+PiBmb3IgLVdhLC1tYWx0aXZlYyBpbiBhZGRpdGlv
bg0KPj4NCj4+IEFuZCAtV2EsLW1hbnkgaXMgd3JvbmcgYXMgaXQgd2lsbCBoaWRlIGlubmFwcm9w
cmlhdGUNCj4+IGluc3RydWN0aW9ucy4gQmV0dGVyIHRvIGRldGVjdCB0aGVtIGFuZCBoYW5kbGUg
dGhlbSBvbiBhDQo+PiBjYXNlIGJ5IGNhc2UgYmFzaXMuDQo+PiAtV2EsLW1hbnkgd2FzIGFkZGVk
IGJ5IGNvbW1pdCA5NjBlMzAwMjk4NjMgKCJwb3dlcnBjL01ha2VmaWxlOg0KPj4gRml4IFBQQ19C
T09LM1NfNjQgQVNGTEFHUyIpIGluIG9yZGVyIHRvIGZpeCBhbiBpc3N1ZSB3aXRoDQo+PiBjbGFu
ZyBhbmQgdGhlIHBhc3NlZCAtV2EsLW1wb3dlcjQgb3B0aW9uLiBCdXQgd2UgaGF2ZSBub3cNCj4+
IHJlbW92ZWQgaXQgZXhwZWN0aW5nIHRoZSBjb21waWxlciB0byBhdXRvbWF0aWNhbGx5IHBhc3Mg
dGhlDQo+PiBwcm9wZXIgb3B0aW9ucyBhbmQgaW5zdHJ1Y3Rpb25zIGJhc2VkIG9uIC1tY3B1PXBv
d2VyNA0KPiANCj4gSSB3YW50ZWQgdG8gYXBwbHkgdGhpcyBvbmUsIGJ1dCBpdCBjYXVzZWQgYSBs
b3Qgb2YgYnJlYWthZ2UgZm9yIGJpZw0KPiBlbmRpYW4gQm9vazNTLTY0IGJ1aWxkcyAtIHdoZXJl
IHdlIGJ1aWxkIGZvciBwb3dlcjQgYnV0IGhhdmUgbG90cyBvZg0KPiBjb2RlIHRoYXQgdXNlcyA+
PSBwb3dlcjUgaW5zdHJ1Y3Rpb25zLg0KPiANCj4gSSdsbCB0cnkgYW5kIGdldCB0aG9zZSBhbGwg
Zml4ZWQgYW5kIHBpY2sgdGhpcyB1cCBmb3IgdGhlIG5leHQgbWVyZ2UNCj4gd2luZG93Lg0KPiAN
Cg0KcGluZyA/DQo=
