Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358F8088EA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 14:12:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HgMbKFm+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmF6s1rDgz3vfK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:12:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HgMbKFm+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::630; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmF5y3mvMz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 00:11:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSd6k8QTLqFxBl4MkXlT4/hY5qSs3mRetX0Jfs3hnmoDFaEjAqBbir738Ds+8Tmhbiwia0bq5DtaCEishn0b3aEkumIDwYBEnU2Q/9E+V32gu+0sYX1wdX4wzmqh3sO26TjZ/mjvxpigrzJKzYnNswR3JHhHBiQ0NQwUGux+pitXDufn2mYuGb0D6Jlhnj8ok6aXYFcOJ82Gk7W5H1ICRz/ca1LpjbPvyCHUQoC7jk9x7Lg+kcPjJdG1PHM4Ife/sd9670lhAIRJMqwN73qlJIMJHeczMr/aaK3B4DGGytF24YKQ5Zsw9AM4quT6s0DKuh3bfMyT9Jto3C8GgWm+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYXQWDkH2VUYWPPnCyS9PYz2QdTqJ6bz6WO7+M8daLI=;
 b=MtAejVn3vb8ByZvP6NlmduHuzLnk4InEc7N1cOCP9c1AV5F/47qDOtp2xItrBKmsumH04FflsZUkZozm0H2MDfBkr9hzmEnGOj7XAHJI5/y4AA2KGChU448gGLxDdrTQNrlwBwMpFUYzCgZ693qsxf96s9sO5AnUuYv0rW+7tYFobHRBFRZfokwzHZfb5vkKYer8Ec3fwYBjwFKLUJR9rW+PhK7VRI359KYLPlKE0p8R/5ElnxtPQfNNjVg1EJ15OOp9y2kmeb6I/KGBlkG5//3vLM+U75cgw+lRkryU09PzSALcNzAHIM5fR69pq4og7AlCjCkxytQg4xyMyenUMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYXQWDkH2VUYWPPnCyS9PYz2QdTqJ6bz6WO7+M8daLI=;
 b=HgMbKFm+js/PLon9eiQSB3JeQJdSASftlAFurJDHW4utGdo35iS5dBNFGzihGF6T9GnV+Mt7pe3cHETHDpFUjm2GyH4KK1OEuTCJUXNj4qz8fXMwes01XRleILHC2q9bDfdMElM8Yo/Zc+Y6z8no85HnUXHUpwSpyQ3IKbc9d2n/KWDHYLm5bL69ftcOvxkLszBt4wTvPUMuWRIk+acVJU214YMHasHRlC7dL5FndIxlDWFlOwmh9mzZXeleSPZeuDtbl4frv1Neh9Z8xSVpS5WM5A8802XkM8RBEwVnxIf8lQGH7SqdB1nWzOq7w4oGQBEFF4HuKaixi/ujLOu2aw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1630.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 13:11:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 13:11:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Daniel Kolesa
	<daniel@octaforge.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
Thread-Topic: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
Thread-Index: AQHZNm7r3WEeVVCCFEa5qktwP246sq8VEVGAgYqfhwA=
Date: Thu, 7 Dec 2023 13:11:14 +0000
Message-ID: <18cd1ce5-ebea-4cb6-a91c-23283f2fc999@csgroup.eu>
References: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>
 <87o7o9b396.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7o9b396.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1630:EE_
x-ms-office365-filtering-correlation-id: c50ac048-83f0-45e3-a3d6-08dbf725fda8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  IuwqnukU4xvUoC3OG/Tc2kKvzvZ5bH1ZaNUHEjL5OWAvHUzC1SKvWwBX86imlNty4fhqDI28VtLZVTaFTieu7iIpJYSAJgtRePEHsi48cpeFczwhIjdBxGCIiD+nZA65JV7KO8ZHKsZkoPjnh1yX+Q85h8e/O4OTZJ+4c7sbgPrAdFSu+rVCTx234lSSuRmZPnlxwIxtbPM0T0ccl0AOTnz7GO17av/vf14bXtrCrMXaqjdghBAH1vrhhTM3LhELwwHrlY/MgwefO5OEk+u1sUnkC9br/jy6TR2bAukQTavEVF/p8IU8QT8hAzO0cpWAqSk0DzQaBhTFdizWJ+cUmUguTYHEF0d38AICxsI8psOn6/fYrxQL2SwjFpGdXRI/RN7fESL8qwlXX0U5QCeOm+7v5GcSvdl26iu0QxgeQjDzLa1RCROLxwvL518rt+ueugEHJ6kHbIwrLfX7dfBS2o6gp7ji6ARVhCzKMTqNtUOaCxWUE9eAl6Gek0r2K6B43uSGErrtvrTRDZwY4eec9mKK6eyFzzkJY/s4rNDwOf3WxRu5zPUNo3QERA3UPbtg+Pd6yFjpvyioZrPXlCQijwgfkmc4KeXdnQBplSQU+ASB4JHi4yJb4uGlvc0u/T3N9ecJAIKFgqH61BiRE2kAhgi2vntOOQH3OA6rf65avo8=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(110136005)(66556008)(64756008)(66446008)(66946007)(91956017)(66476007)(76116006)(54906003)(966005)(36756003)(6506007)(41300700001)(26005)(2616005)(71200400001)(6486002)(38070700009)(478600001)(31696002)(122000001)(38100700002)(86362001)(66574015)(6512007)(44832011)(5660300002)(2906002)(31686004)(8936002)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?L045bWl0ZjkwZVZ2ZExLdGUrcUF6V08xdXl0eDR6ejBkWk9yZ1FpZWIzcmJr?=
 =?utf-8?B?YTE2aE9iMnYyeUUzc0xwREZXZnpnem4rUmI0cE5ZUkMxOHJMT1kzVzVsd1F5?=
 =?utf-8?B?MWt2TkozZzZhS3VQcnI2Sk1QQTArcmRPbkZ1akp3eGFhMHh5eWluWkNTK0VG?=
 =?utf-8?B?SlIyK3lIbWlzUDd3dURWK2NZNFFXaFhJOW1sWmFqRFN6cGlUWFJYV09nK2kv?=
 =?utf-8?B?SWtEeUpXT2NaN1NkMC8vWGpBUndLNlpRLzFhMEViME43b0diUzVMRmNTRjd4?=
 =?utf-8?B?VEFoUXRtZFh0N1hHMkpSWkZnL1BTdDE2YlpQQWFVdWFEWnFrZDVvR0tWdDBB?=
 =?utf-8?B?aExrNWxRVDJoVEdPcGpyUVpWQ3RBRVZuRlU2UGdnQ1NtZUo3Ym5lU24wT0pn?=
 =?utf-8?B?VDlGK2lLQVltbEpXLzVwZTRITjB4RjMzV2Ivbjh3MmF2SVF2SU93clFxKzhQ?=
 =?utf-8?B?YkRwM1FNY0g5WjdhNHk2WEhZNnE1MjlpSC9UTG8yMG15MVlXd1UrZWhFQkNa?=
 =?utf-8?B?SmZUU09VMWdsaUo1SnJMUkdCNWYvMStOWGdLdmRHYTJYQkc4NmM0UkVvaklS?=
 =?utf-8?B?T0Z4RjJZSGtFc2FGRGd5amJLSU5scTREc3A0LzlOZzdiQjBndWpxd2dBNkNt?=
 =?utf-8?B?b3pYK0lIWDRpMDhVVTRNWG51ZVVUaEpyc1dFTGRGNUNCTXpDSkJlZ0ZLUFpM?=
 =?utf-8?B?eUtJcmRNc1FrcHozUFI2TlZUTXpsdWpWM05UalQzTm1pTmZadFBtOHlDajdJ?=
 =?utf-8?B?YnpsN1VSQkhWODlJRnUvQ1dvMEdHM1JFTVRRbm92NlIyTU1qQ1BjdmltQWdw?=
 =?utf-8?B?TDhSdFpwUkUvdVNpL2xWZkk4S3I2anBIS1JvYys1WG1rNFg1TDlUU1BoNm1w?=
 =?utf-8?B?T2orOXNqUkk3SEw5TmczUXprdlZMTjF4Z0VqaEswOVNqTWVSMG5oa1dVdFY0?=
 =?utf-8?B?dU55Wm5MS052Ky9qVFBsY01mbzZ1NXZoTE1aV1J0dStEY1RYWGl5OUV5M3lI?=
 =?utf-8?B?Sy85ZTF6YmMzY1kwdWlvU1UwcEk0dmtiMG9XRDRqOUJzVHFPbmJoTC8zYmJx?=
 =?utf-8?B?b0J0R1BEcWw2QXN1TXFWZnVZSW5tWkRtb0RlYklZekZVMjN4b2FvUnhnejdJ?=
 =?utf-8?B?UnhMaTd6bnFTbDBMVGtxSXBjU3RXUElucU9mUlQyRlFsYXI3RVQ2T3ovcjJU?=
 =?utf-8?B?OFBFaUtZVHduNVUyQXFaYUZuSUJBT1JtOSs1TTVCQlh4QkJHdUV0cndvUGxz?=
 =?utf-8?B?VThKRlY5TldvNThyQ2RDblRVcVlYSUdmdDlpT2RpajNsQiswdnZ5eXFjQ3NI?=
 =?utf-8?B?TEhuek10emEwZjJ0ZFJPSHVQVWdCWFFTUDJKTzlsdVlMRTA4czVyR2FjV2tR?=
 =?utf-8?B?dkllSXR5MWpLRk0yN3dBTzVLRHQ5Tm9obGZYNDJPdjlDZzdlTDNrdUZqWkpm?=
 =?utf-8?B?Q1lYYlkvclkxUDZUOG9rS01XN3BkWmY2WndaaTdFaWdvcDdEVUVYQzR4TVdF?=
 =?utf-8?B?ZkZNR2xTcVJ0WG16VFN6M0xlMkxoT1pnNVFvRVhOQVhwVXU5YWNYSVdBMEkz?=
 =?utf-8?B?RHc4ZHM3aTZJQ0VGdnE5R0ozT1FuaUplRTBKalZ2aWEyQzU3TzRxcHJwSHBF?=
 =?utf-8?B?Ynp4SW4xKzlNZmVXTXRhYzJPckRJMmlRUThCWituNWU1ek1CUVpYR3hwVHh5?=
 =?utf-8?B?OFlQM1lsWFIzem96Yk55RklYU2d6WG4yakYzNnlWSEt2dHVPVlNTazV3WGlu?=
 =?utf-8?B?VldOVnpwNFJiVXc1aUhUdmtzbld3dUFSVkZsMndhSFEvZDdteUQ3aFRtNGV2?=
 =?utf-8?B?a3Jvb3B6d28vVEFpUUFldm9lejg5T2lMbEFaWE9iWnhacXZMOU8vUDVVcXBn?=
 =?utf-8?B?aURYNy80djRJME56RG0zbkpoZGZSbm0xTU9ONjh5d3dnZjBMbWpUV2k1ZWpG?=
 =?utf-8?B?WUJIbXViTGFONERzVUhoend5ZDArdVo0cUhtRWlDOFlOSTM2VnVLZStaME11?=
 =?utf-8?B?a2lsdHdaTHdocFNxQStRdnV4SmlOMlBkdmZidFg4bzIzZVJ1VDZCYmZ2NHUx?=
 =?utf-8?B?c0lmdWNUeVA5bjY3R0hqTnI2Qjh4SDQvREVpOWZXeEVGS0Y3ZFNsKzhlc0lH?=
 =?utf-8?Q?FVTVLchtpSLDwpJF3xJ9yL9gn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7CA7FEB9EE4454E8B0F1C04927E6421@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c50ac048-83f0-45e3-a3d6-08dbf725fda8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 13:11:14.4150
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2fq6+hbc7VwOvEJmqXgJmRsVLrYp0PSLZFcu17ldzSpU25QF463EEjunQD5U0UATX8u9hszzdOHku9bnchPbyTXPPydyXSc8YrRg6K2OX94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1630
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
Cc: "dan@danny.cz" <dan@danny.cz>, "alexdeucher@gmail.com" <alexdeucher@gmail.com>, "tpearson@raptorengineering.com" <tpearson@raptorengineering.com>, "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzAzLzIwMjMgw6AgMTI6NTMsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gIkRhbmllbCBLb2xlc2EiIDxkYW5pZWxAb2N0YWZvcmdlLm9yZz4gd3JpdGVzOg0KPj4gQ29t
bWl0IGM2NTNjNTkxNzg5YiAoImRybS9hbWRncHU6IFJlLWVuYWJsZSBEQ04gZm9yIDY0LWJpdCBw
b3dlcnBjIikNCj4+IGludHJvZHVjZWQgdGhpcyBjaGVjayBhcyBhIHdvcmthcm91bmQgZm9yIHRo
ZSBkcml2ZXIgbm90IGJ1aWxkaW5nDQo+PiB3aXRoIHRvb2xjaGFpbnMgdGhhdCBkZWZhdWx0IHRv
IDY0LWJpdCBsb25nIGRvdWJsZS4NCj4gLi4uDQo+PiBJbiBtYWlubGluZSwgdGhpcyB3b3JrIGlz
IG5vdyBmdWxseSBkb25lLCBzbyB0aGlzIGNoZWNrIGlzIGZ1bGx5DQo+PiByZWR1bmRhbnQgYW5k
IGRvZXMgbm90IGRvIGFueXRoaW5nIGV4Y2VwdCBwcmV2ZW50aW5nIEFNREdQVSBEQw0KPj4gZnJv
bSBiZWluZyBidWlsdCBvbiBzeXN0ZW1zIHN1Y2ggYXMgdGhvc2UgdXNpbmcgbXVzbCBsaWJjLiBU
aGUNCj4+IGxhc3QgcGllY2Ugb2Ygd29yayB0byBlbmFibGUgdGhpcyB3YXMgY29tbWl0IGM5MmI3
ZmUwZDkyYQ0KPj4gKCJkcm0vYW1kL2Rpc3BsYXk6IG1vdmUgcmVtYWluaW5nIEZQVSBjb2RlIHRv
IGRtbCBmb2xkZXIiKQ0KPj4gYW5kIHRoaXMgaGFzIHNpbmNlIGJlZW4gYmFja3BvcnRlZCB0byA2
LjEgc3RhYmxlIChpbiA2LjEuNykuDQo+Pg0KPj4gUmVsZXZhbnQgaXNzdWU6IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzIyODgNCj4gDQo+IEkgbG9va2Vk
IHRvIHBpY2sgdGhpcyB1cCBmb3IgNi4zIGJ1dCB3YXMgc3RpbGwgc2VlaW5nIGJ1aWxkIGVycm9y
cyB3aXRoDQo+IHNvbWUgY29tcGlsZXJzLiBJIGFzc3VtZWQgdGhhdCB3YXMgZHVlIHRvIHNvbWUg
Zml4ZXMgY29taW5nIGluDQo+IGxpbnV4LW5leHQgdGhhdCBJIGRpZG4ndCBoYXZlLg0KPiANCj4g
QnV0IGFwcGx5aW5nIHRoZSBwYXRjaCBvbiB2Ni4zLXJjNCBJIHN0aWxsIHNlZSBidWlsZCBlcnJv
cnMuIFRoaXMgaXMNCj4gYnVpbGRpbmcgYWxseWVzY29uZmlnIHdpdGggdGhlIGtlcm5lbC5vcmcg
R0NDIDEyLjIuMCAvIGJpbnV0aWxzIDIuMzkNCj4gdG9vbGNoYWluOg0KPiANCj4gICAgcG93ZXJw
YzY0bGUtbGludXgtZ251LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rp
c3BsYXlfbW9kZV9saWIubyB1c2VzIGhhcmQgZmxvYXQsIGFyY2gvcG93ZXJwYy9saWIvdGVzdF9l
bXVsYXRlX3N0ZXAubyB1c2VzIHNvZnQgZmxvYXQNCj4gICAgcG93ZXJwYzY0bGUtbGludXgtZ251
LWxkOiBmYWlsZWQgdG8gbWVyZ2UgdGFyZ2V0IHNwZWNpZmljIGRhdGEgb2YgZmlsZSBkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZG1sL2Rpc3BsYXlfbW9kZV9saWIubw0KPiANCj4gZXRj
Lg0KPiANCj4gQWxsIHRoZSBjb25mbGljdHMgYXJlIGJldHdlZW4gdGVzdF9lbXVsYXRlX3N0ZXAu
byBhbmQgc29tZSBmaWxlIGluIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbWwuDQo+
IA0KPiBTbyBldmVuIHdpdGggYWxsIHRoZSBoYXJkLWZsb2F0IGNvZGUgaXNvbGF0ZWQgaW4gdGhl
IGRtbCBmb2xkZXIsIHdlDQo+IHN0aWxsIGhpdCBidWlsZCBlcnJvcnMsIGJlY2F1c2UgYWxseWVz
Y29uZmlnIHdhbnRzIHRvIGxpbmsgdGhvc2UNCj4gaGFyZC1mbG9hdCB1c2luZyBvYmplY3RzIHdp
dGggc29mdC1mbG9hdCBvYmplY3RzIGZyb20gZWxzZXdoZXJlIGluIHRoZQ0KPiBrZXJuZWwuDQo+
IA0KPiBJdCBzZWVtcyBsaWtlIHRoZSBvbmx5IHdvcmthYmxlIGZpeCBpcyB0byBmb3JjZSB0aGUg
a2VybmVsIGJ1aWxkIHRvIHVzZQ0KPiAxMjgtYml0IGxvbmcgZG91YmxlLiBJJ2xsIHNlbmQgYSBw
YXRjaCBkb2luZyB0aGF0Lg0KPiANCg0KQ29tbWl0IDc4ZjA5Mjk4ODRkNCAoInBvd2VycGMvNjQ6
IEFsd2F5cyBidWlsZCB3aXRoIDEyOC1iaXQgbG9uZyANCmRvdWJsZSIpIEkgZ3Vlc3MgPw0KDQpM
ZXQncyBkcm9wIHRoaXMgcGF0Y2ggZnJvbSBwYXRjaHdvcmsgdGhlbi4NCg==
