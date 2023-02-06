Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 907C168B726
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 09:15:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9Jw52lHkz3f3C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Feb 2023 19:15:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2XFfoMtg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:fe1f::612; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2XFfoMtg;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Jv85w5xz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Feb 2023 19:14:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8gYlffG8cNnKbiUeyrSSyp15ueEXcymlLjuptVSqRc5yfBCm9w7XJBMUDvKq5NqkpppQB5Rb3f27lwb2p4b+tk/B50/Wscd0+Z0EZ725T7xvOq8ADgfQFDnYLWm33g4to2hb2Y0W6I2puMw4NvQx1vZuoVEersnuCYns+bwy4OEhXl5nsWYM4RihBWHXSUkpC2C7bMQj+ged/jiDJQEwGFd7yQtaRduuf57yQhYd6GlQkRYnFe6ELYHyCGHsLFXGdlThGoDHNJU9yQiH8d2nstjP4PlNWRDiolZcdx8WkKLxWnOXF/N5Xu34DoshxyF2q/wSNzE9sNFaRVB03N65w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOzSMfpE7MDPbSYDlWBgusJqt2AHymMvhO6ZM+Ht19A=;
 b=cvhTHfRyA1WWA8bUUZ6zKA63wlvb7ox5piZwq3lFF/F2kXmDfzZes7k05xw6uLT2b9nS1WlyPWz+o82jhSewt47icYqK0cCJ9Rmho1EDc2JcixZRcFAOb4zL2QcAcO9zyFUOXrmrtBCbXC87J+3sVu0BWsMlzW27uYsLUvFWdefOxzG9JjKT5nJiP6jPwYFfS5GEEA+xfvMglDmHlil6G0ZusReM96lTsxxZiOHecZPrSL7qwG+IPiWTh4Dr9Gd3fqRyAazEJ3cw8KUpdcOdYKabNFzxxT+dEOBN4fY4HffB5fXUvnuAGC8KssF21i3L6ISxe/yrLN9oCmmbldA8/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOzSMfpE7MDPbSYDlWBgusJqt2AHymMvhO6ZM+Ht19A=;
 b=2XFfoMtgnKb+FqbPgnJbGhGDEKhqO48dpAdI/h0DKwCgkPjRa4pUtVZGDEiRO3Rmh0QAJZDUGtn8Me//X/TGfEp8Jp0DdHmmO55nEoJb2a/jpxNwRp1BQFmATodR6pRt6Ath0vY0jxEP0OOi6p7nG5rYvoSfIr72SlUuGq8xrhq3qmsHxSaYbNkAVOkLGepaXrZ5dn5B09LgbJs/p347A5H7Dy89XNhj7AsTmk5T0jWpIiJ1z5AYEaZ4x9/X2J9b2VldZF9dl4dlibfj02vNmlfO/Irs8DSVbd8E0mhnuVcmRM1rMy8JV56GDIkgHIUSpgFMSV29XuXX4pWjvA1CZA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1738.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 08:13:53 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 08:13:53 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Rohan McLure <rmclure@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v3 5/5] powerpc: kcsan: Add KCSAN Support
Thread-Topic: [PATCH v3 5/5] powerpc: kcsan: Add KCSAN Support
Thread-Index: AQHZOdIKjFuXx+mCtk23aR+qwXHSa67BkkKA
Date: Mon, 6 Feb 2023 08:13:53 +0000
Message-ID: <636251cf-7c4a-53cb-dab7-a11e65863f30@csgroup.eu>
References: <20230206021801.105268-1-rmclure@linux.ibm.com>
 <20230206021801.105268-6-rmclure@linux.ibm.com>
In-Reply-To: <20230206021801.105268-6-rmclure@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1738:EE_
x-ms-office365-filtering-correlation-id: a0912fdb-fefa-4606-d576-08db081a160e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mGmlVqysMAKgEqDnza/4aOu+Cp7XPyMNuEs3mUXnW1LEpCRQqEliiNLFuatEMa1ABVBxuwuAblz/jwYYkzcbzpEh27Iq/LBsGeVlkjv4wZovGqtQYGheWnslIRNn5Im2V0BdlpsukbqT9kU33k4x0+MSVOsQmZES3fjkwwe8BHQZLifMZ/lazLygfxVlG9xIrIPpFfD7JIIEVWN3DA1dRNbN4rZJE1KP0FZ+c98jJEuAJGI12izjohIirtiiAmIz+37xm5HJF+SRhvEJzcR13N4zUlpNDEKWNtPGCtl7TFtzbPYCdNRPFOlyO4CIGDWEKTHHbc/5GVR+NzY7fMzP6kZd7C9XxIDjAfGhTAsf4IkcFeIbo3ig7PxA0kKLeM5lwg7yD9x5CGXq95UX7CMNrF5CFX3Sib9RrE4OdNaTWlExd4y/jkq3Q77zSDpOV34y7+9Vh98GGpnnOSJDAolEo1oIPLZQ01ffOrMd3GzToCCruSCENEUoNco3qbkWxaWWdh6uIK1sXHXZ+a+ZkR13wWUXjWQk6s7kOlPo7/te5h1DVQCMtFPrWFZd0BUR3RlwM0gQAuLYratXKydbKow8p4NtyVttVRk7Higlvmldnzg6QDrl/LFnYCLM0CyNGjSP8hY/D1VhkAv3UrDi2Er89//9FsvXMHmVdwKNT0spATxc5Id3dfGJRlEGUTVw9aAeBUz+sqTscbIxILbG8vWiAz0zG6i6W6y5PM+BPbWNUnBxWiVwHtw6IeHs+FLOIr9lmDcHSk7+Ooboyf+TojX6TQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(451199018)(38070700005)(38100700002)(122000001)(86362001)(31696002)(36756003)(5660300002)(66476007)(4326008)(2616005)(8676002)(66446008)(8936002)(91956017)(66946007)(41300700001)(110136005)(64756008)(316002)(76116006)(44832011)(2906002)(6486002)(478600001)(186003)(71200400001)(6506007)(26005)(66556008)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TVlUN0lxMllBaHZhbHk1Y0lRL3B4cm5qUklvVFZxTzhPazdSbFBJQUhtNEFV?=
 =?utf-8?B?bnJ5UUhXdGJHcEhGTm9aeE5rcHdSajliMnkyZC9hNXJBR3F2OXhEb3NuUHp1?=
 =?utf-8?B?N1FHcHZaaExhaW5xNS82eHovU2g3bktkZ0trdnA1UWxQNFN4djJHUUJ2OGFJ?=
 =?utf-8?B?OTRlaFVBVzlKRGF4SjBFL2hrQ3NJZWkzM0NiVldOeE1qMVhnbVlNWG13YlFs?=
 =?utf-8?B?SE1saUlTU1VqZDdWTTI5MkF5Q3AxSG5ENkNleUFXN0FyOVR4NkgrRzdYOFlU?=
 =?utf-8?B?ZTFpaHRKazU3c2s3NFFZQXRuSHpqcnFwOGVpcFVqSzBzQWh4U2x3WW9WTFpu?=
 =?utf-8?B?ZnJqVVJ1bjdGMmExWEU0VXBXVkx6dEg0VjhKSCszc3AwRVN5M2JlZlErQUtW?=
 =?utf-8?B?S1hqQVV3Tk1NYlJGWDg4NG1vaDJKNXc0SGI3NTRkbFNXWTFib3YzZGdUMjhY?=
 =?utf-8?B?U3hkaTFZUS9XcUM4QXEvR01NZVE5MS9YOFB3SnZPSHZwZFk3a3FDQ1JnQ0NL?=
 =?utf-8?B?MDJab1E4V1NRUGVPc1I5NXpkVFFaV1ltTDhIbXR5NkFVUG9BaVBqZjR6V3pT?=
 =?utf-8?B?QjFFa1NiNmVxejJ3WlY0SUtUekFqZkhKbGs5aUt4Y1dPT0JYVjhJdVA1ekNp?=
 =?utf-8?B?c0hXaWpTZ1NRRWc3VlBXeW01RVlxZzkzV1duVXNkcHd3MFkwWmNGWjBiN0xi?=
 =?utf-8?B?SFQxeG8zdlNJb3pkNWpnbW1aRmQ5alUvUEEyYmZ2RE8zeHNkL3AxN2F2MWVX?=
 =?utf-8?B?Uk9aOFV3aU9HZmhneEFjbXYxUWk0QzQ4cHdtZlZVL2hkNVA4b084emF4cmZN?=
 =?utf-8?B?TDYrN3d3RXZhdW13YlJ1eHBvWURkdTJKOVA1djFjRHA1eU1xeE1mQjh1aUd5?=
 =?utf-8?B?b3BlNVpZQmNtdlBMZml3ejBSQkZkWGMrRHowMzRoMWE1Q3JlNExoTmZ0Qm9q?=
 =?utf-8?B?NUEyR3VLV2tTako1emhCeVBMLzRNN1FVa0YvU2FQWjhxcGIvUDZwMG1VRHN6?=
 =?utf-8?B?bEFFWUk4R3JteXZCTHV2RC9rQXhCRmxieVlWVVk5YTkyM0J0ZzNxRHJ3dDZp?=
 =?utf-8?B?WmU4SFQ5aFJESmJWbTZncVJ2VkViSllCWU1YbDZoQTgwOHBpQnRBY2FYMTZh?=
 =?utf-8?B?bmc3bHJPaENtZFl5Z3BINU5rOVd0VlFtU1ZGZVNpd1E5NTFqUVBiWUF5TWow?=
 =?utf-8?B?WEVkRm9kMlFnamYrcll4c01VdTVteWFZWEd4WlVRTW8zUVVHU3ZtQTFMOUZt?=
 =?utf-8?B?OEJUa3pJb016UGxwNTBZZzNYeDlBL2lEcXppMS92VFlBbnJ6aERUWGNGeXla?=
 =?utf-8?B?RU41WnNBZE5zQ2JvN1VzVWJhNzZuS0NnWng0VHE3SWRGbGR2V1dmRld0ZGtk?=
 =?utf-8?B?THhEODhXN3RCUDZSMTJCRHFGS1NVd1FmTjlwRDFJOFJtaGV3SGRJY0F5YVpy?=
 =?utf-8?B?Ym5lNlBRbm0zdG1NOHJubFpzaHhMMjY1MDNtSlM2Vnc1Y0R3RFMyK0NqeHRp?=
 =?utf-8?B?ZlQ5V2NvNE5iUWwxdVpzaENPeERZL1RORVZ5Ui94NDh1MzExQXhRZVhlM1hq?=
 =?utf-8?B?OVJoSjZ6QmN3QTNvSVgwdmFPTHgxUE5MSnVXZ0lWTDRjamhHUkZDaFZXajYv?=
 =?utf-8?B?L28xWTcrVmljRHpYMWRjdHc4RGJZcGpuVHRvd0F2YjcwYy8zZENqNmhjVGwy?=
 =?utf-8?B?T0tZMm9RYlVBZW1RQ25yN2xwYi9hUC9TZjVWVWdJbTZmQjBxMUloeXJwT1JP?=
 =?utf-8?B?UzduZ2JCUzZkNTFBRzlRcm5CTFBSbktNd1hCdHR6NFBMb0g4cjBzTCtpaXV4?=
 =?utf-8?B?aGFqVTJKV1BMb0YxaEh6MlgvdFFIdm1na2hJdUFTalpCeFQ4S2k0V1RsUjNj?=
 =?utf-8?B?WnNlcDJ3Qm5XMmV1aUx6L1JURGFLQmpGZWFuenJjT1hFTHcyMzhVREtLTFdD?=
 =?utf-8?B?SlExdFpRakJPSmpLejRlMnNONm84WDlWWTI1R0VEK3lhMSsrRmRpU2tXZllm?=
 =?utf-8?B?VlJ0WXFVdjdlbWYyZWY2bTVFWFZQVGVqTjZHTGpoaTB6cmxrMENlU2ZBUkVq?=
 =?utf-8?B?ajhxM3J6aUI4Q3c0a254MnA4L1NSNHJxSG1tcVpPbzliMWdmblk2dWdvaEw2?=
 =?utf-8?B?ZXBxK08rc2RMNzNVNHFnaWlaWS9rMXdXYkhYNWdJWWVNRHRMTzJZYk44cks0?=
 =?utf-8?B?RVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E0DE69410D98C4ABC364E0B833DD6DB@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a0912fdb-fefa-4606-d576-08db081a160e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 08:13:53.4987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4zh9Kf6BbaG0SkklQ7PV+DCd8/hgwnqrZyVv+I8GCjXblz9U7uReuh57CJUg0AUuteZSO6lZFWFDoMAiq4a7hMWK7SZeA1AG/GbcNhGI5iI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1738
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
Cc: "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzAyLzIwMjMgw6AgMDM6MTgsIFJvaGFuIE1jTHVyZSBhIMOpY3JpdMKgOg0KPiBF
bmFibGUgSEFWRV9BUkNIX0tDU0FOIG9uIGFsbCBwb3dlcnBjIHBsYXRmb3JtcywgcGVybWl0dGlu
ZyB1c2Ugb2YgdGhlDQo+IGtlcm5lbCBjb25jdXJyZW5jeSBzYW5pdGlzZXIgdGhyb3VnaCB0aGUg
Q09ORklHX0tDU0FOXyoga2NvbmZpZyBvcHRpb25zLg0KPiBLQ1NBTiByZXF1aXJlcyBjb21waWxl
ciBidWlsdGlucyBfX2F0b21pY18qIDY0LWJpdCB2YWx1ZXMsIGFuZCBzbyBvbmx5DQo+IHJlcG9y
dCBzdXBwb3J0IG9uIFBQQzY0Lg0KPiANCj4gU2VlIGRvY3VtZW50YXRpb24gaW4gRG9jdW1lbnRh
dGlvbi9kZXYtdG9vbHMva2NzYW4ucnN0IGZvciBtb3JlDQo+IGluZm9ybWF0aW9uLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUm9oYW4gTWNMdXJlIDxybWNsdXJlQGxpbnV4LmlibS5jb20+DQo+IC0t
LQ0KPiB2MzogUmVzdHJpY3Qgc3VwcG9ydCB0byA2NC1iaXQsIGFzIFRTQU4gZXhwZWN0cyA2NC1i
aXQgX19hdG9taWNfKiBjb21waWxlcg0KPiBidWlsdC1pbnMuDQoNClN1cHBvcnQgZm9yIFBQQzMy
IHNob3VsZCBiZSBrZXB0Lg0KDQpTZWUgY29tbWl0IDcyNWFlYTg3MzI2MSAoInh0ZW5zYTogZW5h
YmxlIEtDU0FOIikNCnh0ZW5zYSBpcyBhIDMyIGJpdHMgYXJjaGl0ZWN0dXJlLCB0aGV5IGhhdmUg
aW1wbGVtZW50ZWQgc3R1YnMgZm9yIDY0LWJpdCANCmF0b21pY3MuDQoNCk1heWJlIHRob3NlIHN0
dWJzIHNob3VsZCBiZSBtYWRlIGdlbmVyaWMgYnkgbW92aW5nIHRoZW0gaW50byANCmtlcm5lbC9r
Y3Nhbi8gYW5kIGJ1aWxkaW5nIHRoZW0gZm9yIGFsbCAzMiBiaXQgYXJjaGl0ZWN0dXJlcy4NCg0K
Q2hyaXN0b3BoZQ0KDQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9LY29uZmlnIHwgMSArDQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL0tjb25maWcgYi9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiBpbmRleCBiOGM0YWM1NmJk
ZGMuLjU1YmMyZDcyNGM3MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4g
KysrIGIvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gQEAgLTE5OCw2ICsxOTgsNyBAQCBjb25maWcg
UFBDDQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4JCQlpZiBQUENfUkFESVhfTU1VDQo+ICAg
CXNlbGVjdCBIQVZFX0FSQ0hfS0FTQU4JCQlpZiBQUENfQk9PSzNFXzY0DQo+ICAgCXNlbGVjdCBI
QVZFX0FSQ0hfS0FTQU5fVk1BTExPQwkJaWYgSEFWRV9BUkNIX0tBU0FODQo+ICsJc2VsZWN0IEhB
VkVfQVJDSF9LQ1NBTiAgICAgICAgICAgIGlmIFBQQzY0DQo+ICAgCXNlbGVjdCBIQVZFX0FSQ0hf
S0ZFTkNFCQkJaWYgQVJDSF9TVVBQT1JUU19ERUJVR19QQUdFQUxMT0MNCj4gICAJc2VsZWN0IEhB
VkVfQVJDSF9SQU5ET01JWkVfS1NUQUNLX09GRlNFVA0KPiAgIAlzZWxlY3QgSEFWRV9BUkNIX0tH
REINCg==
