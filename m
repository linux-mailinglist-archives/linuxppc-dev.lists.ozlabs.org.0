Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D4346E612
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 11:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8qKB0YRGz3cC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 21:00:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com header.b=MF2Mc2oN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=2a01:111:f400:feab::72c;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=wangqing@vivo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vivo0.onmicrosoft.com header.i=@vivo0.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-vivo0-onmicrosoft-com
 header.b=MF2Mc2oN; dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8qJM2JkRz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 20:59:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nFdChmJPWgpjsNwGA/Q1Idi3Ya7A6q8Kxp6f18Hjb9Rp5kL8ikijwxnHSUSZF2+nurcxaX89EjG5QhCbORPeKNwXthVCkbHTCjB+ADGd586yW1y8lL/SgFimgbXniT6JJsjfrv1zel5Qq2fIDAwHsd67ogxoesWAFVmLgS2D1Xy36wMu6OSaSs5XBW0A6H0N7RJE2oZWBlKX/cnUbmjvGNaDMpWA8Fk8slREDHg/Co0i5yr6iOqQd/OUoW2QhMEzsi00G77olk2DRv3H9QpDb+UllTJyV5I1UoaTwdsR4g7cwbETCxTzJiZ2CJ9bBzXWZZ5SkDaOLUHK/fGzrPF/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84z8k/4eQBTYc7CKXhgpO/uLyH5Ouo+04uiMhCo4hrI=;
 b=BzbpKfy1/BkShsBkl9Vcy2tyRxwpBYrCMdxXGIk5U1wGPmbWSbhbknAB6rVkIR6Z1tOcMYLkNKQCaTiRxZ5PMjCOV5HS8/JdcjaJVawuyCO0lgZrj9KnOZCh0cS2LDP2QRw9ZeO2KvF2+jzXS0IXCWJdwikcG3DrR+JE9T2VRlYEyAcwmFJGsUP+KXmm4mjzaLyZZ7nPq7wu2KEGV/Oo/7MbUP4SYDqs0y3hOuCvERL7GcCRsc4a7pk6fjwWigGT6cmKnyuxKjdhghO3hjAJstQshMGFCY6DasrVPhGLf1oJ7kNdYruYeBPlHs6U0XILSaEwVJcsgRTwne4eWykgLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84z8k/4eQBTYc7CKXhgpO/uLyH5Ouo+04uiMhCo4hrI=;
 b=MF2Mc2oN6PPR454IB8VG5oYH0AxvaejkFi8lG+grueul9xhJnc5kUr7GeMGaEEh28Qf2/0Zg/rRc3p9NS43HS7xjJIb9mZ7pUGrHc8tes0gifVmknIIPvkstxkhW6xJnh4YJiFUvB6QAIOpdao+eeaJBMlulcd4XzXpdpvddKlA=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB2988.apcprd06.prod.outlook.com (2603:1096:100:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Thu, 9 Dec
 2021 09:58:52 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4755.023; Thu, 9 Dec 2021
 09:58:52 +0000
From: =?utf-8?B?546L5pOO?= <wangqing@vivo.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH] sound: fsl: add missing put_device() call in
 imx_hdmi_probe()
Thread-Topic: [PATCH] sound: fsl: add missing put_device() call in
 imx_hdmi_probe()
Thread-Index: AQHX7NwjmsyYvshZLE+AShkbQYaGZw==
Date: Thu, 9 Dec 2021 09:58:52 +0000
Message-ID: <SL2PR06MB3082D6C1C65786A1E8DD0397BD709@SL2PR06MB3082.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: c94bdbf1-5c89-fee1-b066-326bb565e076
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a8cfea3-90df-48d9-0bce-08d9bafa8135
x-ms-traffictypediagnostic: SL2PR06MB2988:EE_
x-microsoft-antispam-prvs: <SL2PR06MB2988CFEE0652F9D37946DD44BD709@SL2PR06MB2988.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fE+/xL7E8lpBJIaJpmmHnxspX+RyoUI1011dJjGb5KpCYOeNEjpQou19LBYi/4W3k/+oFJK7OE9DomEnM8p3Ne6h2pRIKWrTvnItXC+JFcTpHmVHbJXh92NONoZya5AvNfhsiOTtqj7bIPJ0ZXIkDb/jybE0wIUQjwA3ELkFkZXE6jBO5DRT+oGxYfeWUF0b6W4MMiozJciYO8C2v612bmGufbx5q26s4cEyB6uf/BxC430ut2YTs1iDxgEEm/mb/GuIJyKNGYBXejJnzDZbi/IqKvfegXF4l1vUc8qZ/3Pqm7nd8kDOGwMWMkTDBSzv8bNGNpBL2cYuTg5ZY+nci8sZBbNBCPzt8KoXC2MGG2YA49KN/MttBW0L8UhPZeyFueFgb2YPgMx4pw6bGhdEPzYuzg1KHTOrw44Y/YM4MOhktVYpHaOyjcMkUaDt9XY7sqqpG6ksVnUC6uruQJI2/yxUA0aRohgamEhzvwegB+JM0CMT1ETCxoBF0amDEBps4ywclB9zUtlAXHznGH7zLtQ/VoJ6w7vu8Z1gK3Vq7OlWj5Ie37/rV+ClUo46jrI/w2Z12fbHvpcxOrGDrQHYV7SBq1aqVL/xFUOltB4XcaGGXLJKHbvm+wsO+75lzSBfGkEkTGsHgzudtT1RNgCc40OUmBYkWhH7YotCnroQoVyk8Oxml99VHmpyr5vAnu3F/LjvDhWb1DCgHbaGGpxs0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(71200400001)(76116006)(38070700005)(122000001)(38100700002)(4326008)(186003)(508600001)(91956017)(316002)(52536014)(26005)(8936002)(8676002)(33656002)(4744005)(7696005)(54906003)(5660300002)(55016003)(9686003)(86362001)(66446008)(64756008)(6506007)(66476007)(66556008)(66946007)(2906002)(7416002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T3NteHhEWjZoN1BVVFdZWVh4WjgxQXR6bkdPQnc4b3BHWkVwR1dKRnhRNk9R?=
 =?utf-8?B?c2xaTmZpRFpONlE3UDZ1a05lcG96bitlR0puUFJRakdGVWpZd3RHemoxbjBz?=
 =?utf-8?B?bllBVFE5aTh2Q0FibkkyaXEvUmhmclVOMjRmYnhuaWJIbUs1ODlhMzQvckF5?=
 =?utf-8?B?SDAycDFuYVNiNU9CVUptQ2MrZFRQcWRyTlJ5YjhzdWRIZU93QlZpcEFlRnpL?=
 =?utf-8?B?VHJEVnVzM2VxK0hBK2dGVkdNZVVSN0tCbGlWV3VXUk5XaFhSM1B0WTIwVWlx?=
 =?utf-8?B?SHVCR1lIOHJQSXhVTHVqdmJrbnFBbVFJc0JCdXBjKzgvS2dvbWpKSHlkSnZW?=
 =?utf-8?B?RURkMjNKUzlrNW1QYk1YbEhZYXBWMXlqYk9lay9IQ1RTc1B3djZEZFQ1LzFS?=
 =?utf-8?B?UVJJOXliVFN4Qzc2SmwyUlI5QXlJS2NDZDNXYndlS3JIcytJTUpGTnB2NndK?=
 =?utf-8?B?L1hvNXMzOG56TnBmYWMrVmRHVnVCY3BhajBVTE0wWUxoU0JKOWtXYUt3TXhu?=
 =?utf-8?B?alZHYysvR0pGaXJnZHJYZFJQQnp1cGZLNWRJd3ltT1NicHYxeUpxOXYyTGdy?=
 =?utf-8?B?Zk1oU3FySWhGZzRYeUFlTjQ0MWhyWmNFK09sTmllb0tmY2JiM1loMHQvOGZZ?=
 =?utf-8?B?UFZ1bDlqV1pqQkJNMHp5a0JDQXVJakRRaUE5ZEhSWlhKZytzSlViS2J5ckxN?=
 =?utf-8?B?Q3RXNncyQi92TmlKVXp4NkF3VmlWYmJsbW1RazJOWGJ3aWpHazVOZFpPdmto?=
 =?utf-8?B?S2pRVmcyNEkxWGhlNEJsRWlBaG10Qkt0aUpGMzl1aENrbkgvdnAycFd5SWs5?=
 =?utf-8?B?UE82aFZ6U1pUOFpkVnJlaU9aczdoZ2xEOWpsZExmRzJyUHMzaGluTGwzMGNS?=
 =?utf-8?B?UFkwT0pVQmUrYU40bzZ2b0VOV3dHWHBaaHVrYWt0VERwRkRGQjNCMTZiNVlH?=
 =?utf-8?B?dmQxcUg5dlMxWU9XK2RjOG05Y1RpYXRxVDZHWHdML1RCemhOekpzaDQ1TUxr?=
 =?utf-8?B?ZlBtTTluUHBNYmdQT2FmbmRKUC9jcHdWa1ZZdTFhYndNNTRBUmhGKzJvNTFL?=
 =?utf-8?B?M1hKK2xjckpPNFpDL3ZaMVg1TzloaVRhRnFLa1JWcm85ZnpZOC9RbStOc05R?=
 =?utf-8?B?b3YzaGJrOFdEVlBDN0d2bTRzc2hzNE0veGdBMGN6SURTbUpHeUJBdDdFL3BN?=
 =?utf-8?B?YTRSRkRObjRpOHJJb1hwcUExVzIyR05yb0tVYXBaNnBJOFNZZ1FmSnBJUkdu?=
 =?utf-8?B?dmIrbUlrTzloT0I4V2w3a2FrdlZHZ2tCSndMMlNWYkFMejUvWkhWS1J0QXBP?=
 =?utf-8?B?Qm1JQTJoM09Rc1pBdDcyeStoVG5nVFVHcXNINE5nYnVlK1d5TkZFSFhCMlhj?=
 =?utf-8?B?YmlQZ3VLbjVZVS95dkljYjZwSHFEOEpEeVpxbGZ6NmJuYWE4bDQzaG1uKzhx?=
 =?utf-8?B?YVNpbHRWMUE1UHNSUC9UY2VOVExjM1lBK0FRNWoxUEJ0NHIxSlRGbTU0bVQ2?=
 =?utf-8?B?ekp6cXhBWktrUEpFaWZFWGhCT3UwVzlCWGUzdzR4THRWb01aSTM2SWpSZlBt?=
 =?utf-8?B?TGNyWUlJenNQWXR1Ujk2RloyL0RtSENaVGVIcXhQbnJvdDhOZU1NT2JZQk91?=
 =?utf-8?B?Y3hMN25XRmw0Q0tGTXEvMnhSZDhPMVJMbFFBQnMzVzZNMk0xdHZ5bFU5QmVo?=
 =?utf-8?B?ay8rMkpKUW51bm5vWG83a0VQaW8zV0lxR1lhLzlpTlJRTFArRHp6RDFpeUM0?=
 =?utf-8?B?Zlh2Q1RpZlRqNzM1aUcrUjFacUxsZ1plK3Q5Nkk2cTZoZVZNdDl5cTIzWmtK?=
 =?utf-8?B?RWhsdDZ0aUdjYmxZdDZTN2ZmdFRqOHF6T05ZaXZrLzlGZUx6SUZoV1ZZRHpJ?=
 =?utf-8?B?T0FBSE1PaTdvUU9yYlVzNnA1VnhPRlczQlpHbHlYUzRzczZIYjlMRmVhTmpj?=
 =?utf-8?B?NUVOU2toanNzOUplTDVQeGFFNUJNcjIxOGNjZ1pxakpUdGszNFNPaFJnSFZM?=
 =?utf-8?B?RVh5NG1rK2hnUEZnU0hsbkhVK0NlOTFuWUR5VVlNeVoxWjJOVU1nL2Vhc0sx?=
 =?utf-8?B?aGY2S0N0Tmlsd0g2cXU5dnJNZkhkelpwamxIR2ZaOXJPdHpaNVNYZjh6b1pF?=
 =?utf-8?B?OXFNSWhYTjRNQ3FFeEpMUXAxc0g3aDR1TU1pNjdyL01BeGRnVUpJRXh3RUtZ?=
 =?utf-8?Q?SBSrWJNxUNEhsV2i7v74AkQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8cfea3-90df-48d9-0bce-08d9bafa8135
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2021 09:58:52.0675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xp6jAzUofl4vJBGybp9XsXdGfZvvnx9K01rGEePnRz0gLkY8HUJ4MKajhlPmQ4xApULOkIOEoqpY4WvIuZQ0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB2988
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cj4+IEZyb206IFdhbmcgUWluZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+IAo+PiBvZl9maW5kX2Rl
dmljZV9ieV9ub2RlKCkgdGFrZXMgYSByZWZlcmVuY2UgdG8gdGhlIGVtYmVkZGVkIHN0cnVjdCBk
ZXZpY2UgCj4+IHdoaWNoIG5lZWRzIHRvIGJlIGRyb3BwZWQgd2hlbiBlcnJvciByZXR1cm4uCj4K
Pi4uLgo+Cj4+wqDCoMKgwqDCoMKgwqAgZGF0YSA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBz
aXplb2YoKmRhdGEpLCBHRlBfS0VSTkVMKTsKPj7CoMKgwqDCoMKgwqDCoCBpZiAoIWRhdGEpIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdXRfZGV2aWNlKCZjcHVfcGRldi0+ZGV2KTsK
Pgo+SWYgaXQncyBvZl9maW5kX2RldmljZV9ieV9ub2RlKCkgeW91IG5lZWQgYW4gb2Zfbm9kZV9w
dXQoKSBzaW5jZSB5b3UncmUKPmRyb3BwaW5nIGEgcmVmZXJlbmNlIG9uIHRoZSBPRiBub2RlLgo+
CgpMYWJlbCBmYWlsIHdpbGwgZHJvcCBhIHJlZmVyZW5jZSBvbiB0aGUgT0Ygbm9kZS4KQWxzbywg
cHV0X2RldmljZSgpIGlzIGNhbGxlZCBsYXRlciBleGNlcHQgdGhpcyBicmFuY2gsIAp3ZSBqdXN0
IG5lZWQgdG8gYWRkIHB1dF9kZXZpY2UoKSBoZXJlLgoKVGhhbmtzLApRaW5nCgo+PiAgICAgICAg
ICAgICAgICByZXQgPSAtRU5PTUVNOwo+PiAgICAgICAgICAgICAgICAgZ290byBmYWlsOwo=
