Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2977D0F5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 19:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=W4FyltKI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQJ8j6hDtz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 03:26:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=W4FyltKI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQJ7k1BM0z30KG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 03:25:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwy+L5b3QVBIF8MjB1OXTzw67U0QI4UDbPqgJiZbXLvUhnViVk81BwPfd6h0nFevTp/mMvGKhxZcfjT7Ak0eE+qrdP4leJmFCB8lRpzBWUVFFX9F7/TeOMnQ5+F1Krie4v764Gj3xEpRq/ffIi0uvRRVEV1rmh89m/V58aBBtVZwt9R9WBSLx/A6OiBkdfiRZoiGEZKeDvH4hl/5kHdO68s+g5SFz0BvENc/6dE9WdwOFhkKC7bznx+fQwuQSeOv0c5YR3r0I/dzosGEmvW4We0BeetV056dMKX5xUfilE/b+rNUk05RxpQ/8JjdPAttcC/1UI1z3uBmTEih8IfqQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1q3Zt0U+UNrucd9bwLSyAkhwh7ljcOkE1gLWtDdUYU=;
 b=lRmQjXZpj1tp9EOUE6sFeI2493ST7sLuflyhcu7UZxQX80E5E8jifnGd3HYS0AHpmlujnNmxlQB9g7tD9/JS1qbfIZHjbju0D5QmQMGgBkJCd/ttc8Yx3CsIItpfdltUBSYJDEuIOOIX7XHr1pYDCrO/++q1hT31XbBxJST4JjlO5sZSEDUW5Cb7fXktdSHnO+3auEsCrLyx/vW54vfBHRaEmbhTAAZcElv4DhI0v0bXGq+0Y29MF5ptMfkcNgwFl/z61xz5lyxB1LiZJGfPrt0t4UeyURDLfwgRAEkzarei4OVX8cLkbtOwr0bvgDR72uxaMMs2wI3dTJ3Wc+Kf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1q3Zt0U+UNrucd9bwLSyAkhwh7ljcOkE1gLWtDdUYU=;
 b=W4FyltKIa9OR7K3b72Nr+LINorQ1dt0L0UnitQHcxDfU2tC+DtiRHoN+TK3zAAGF7eWYQqTwRCpYPFyoBOhuSehGg3o4jcXMi5XhKmOwX1tJeeWgys7EgP1YNnmfVW4WIi36WFNEzkk49DzQXTwO0xxlqjcD2mvCntxaN8Z9W5IZ7d6J1UMaPtDTTe4Gz/Yq/7IUTX4xuvEP60heBCzDdyZDcm6BaBTeXpwK9FdNLewQago7tXSFvUNTD7isqm+Bc8EPI2kBsiijogeuW5W023ppxv/9FXvYqR2tXgpu9moNJuFmDpFyc6CORyVbNTfDCUWwMmSXqxNak9E5TiwzXQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2091.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 17:25:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 17:25:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index: AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveAgAP81YCAAOsxAIAAgoIAgAGRmwA=
Date: Tue, 15 Aug 2023 17:25:13 +0000
Message-ID: <6d710a2b-5cac-9f0a-cd30-0ad18172932b@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
 <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
 <20230813213855.794b3c8f@yea>
 <57bdfad9-cbec-1a9f-aca7-5956d22a8ada@csgroup.eu>
 <20230814192748.56525c82@yea>
In-Reply-To: <20230814192748.56525c82@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2091:EE_
x-ms-office365-filtering-correlation-id: 821be889-38dd-4806-a121-08db9db4960d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ogCTaherj5xDA2uwxt7YnjOxI+hEAmsemm0d2ndn4R57ZjMW+ZvA5dv5Sp1nBo0zPF4LDmx/+1Ks7mZwliAOUJTzNEpPzzG73E/ZUgW9eewle0etZn6M3ghnymhxA4I+aA+FbND6fi3qvgckLPONX5X8fxPZKGDYWEwH89w46VfiNvVulrCb5TTK27hlHgXbOONG0dkH7VApXv/UGRRV1dHBS1YW0z8MHTiqhNQYD4tjdykRqUN0S6MWvTeJjw/6W/7MXpBChN7wrnXZJzPK3CMPVpxdY1O/BPTQw+uVpLRa+06dO1L06FXTYh1eUW+PDrVQCciZN96PVkrrTFj1riOTEXI5IG/L3FQi0cuE4wZpy5SloV7oC2jo8zyNukdobTq1YZBdthqjvmvXATl4seFIqJHAG68JqzrwlmXnXXWGGDWOZK2D3G/mX3tcHxSzOys2TYTdD4ntzmAi44VipFI26mlHLrVspBtwcX8A39YKiVs7XDLvvWGxivzodMlvnRrMLEpKU6RMoEXC5Auj0RbEB/5bnG4ZzGVQtab+Juqe1Wmll1AnJ3FddQgatAGvCBvGa2LUfvWTcmudjHyexfvyPOkgNA+TIej2hmnG/5tNgk1wWlTsDnMUuCFQOhjVDoZkKuSQuF4ckrcJsJcVN895I72j/W592s7XIpCkDcPLDG9aObjo7D+dWtjorGDO
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(366004)(39850400004)(451199024)(1800799009)(186009)(44832011)(6916009)(66574015)(6512007)(38070700005)(36756003)(76116006)(8936002)(86362001)(4326008)(31696002)(2906002)(64756008)(71200400001)(26005)(122000001)(316002)(83380400001)(6506007)(2616005)(478600001)(31686004)(38100700002)(5660300002)(6486002)(8676002)(66556008)(66476007)(91956017)(66446008)(66946007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YnhoOTkvbVdBSGhGN25oZU0vd0lFWHJMT003WkNRM0tVRFZTTEFGWnFVSXlk?=
 =?utf-8?B?MG5FN2ZnQ3Vhak1DTjg4M0lvVEN6eDRBOWx2MDNlc0V6S3NaQU52Q0VvcGJo?=
 =?utf-8?B?eDJkMHdYVk1WL0VSWVhacFZjOTluS0VzbzFZYWRXaWI1elB3ejNrZVU5alRJ?=
 =?utf-8?B?amJOcE9TRGplYmFuY0g5UmliSDJPUEVESzlVQkV0Zk5CRDl1Z1IvRmVJcDk5?=
 =?utf-8?B?cVBoN0NNN0QwcDUrbnMvSUdlVXRWaEgrdnpndzlMYTVKZWtkNDBHWHk5dkQx?=
 =?utf-8?B?a1RYQ25aN0hCcGFrNk11ek5OVTJsWk1Sb0NRRDJFVGVzQ2UwdUtmenh2Tkp1?=
 =?utf-8?B?ZlA4Y2tJR1RoamxXL2o1VGRnNmlZN0Q3Tmh1UDczVVl5SkQ3TS8vSmFJSWQ5?=
 =?utf-8?B?STJOMGtsNXdnZWJtTnhBSWJJaG0zSlBpTXd6L3VuUkJxVFAvbWdxYXBaZzdX?=
 =?utf-8?B?RFJ1d0NDdW9GMEhLMEhuRElLeXFrQ3RrZHlDd2lwOSt1UEJXMEJrS21ZU0s2?=
 =?utf-8?B?MUZ1QW1sNmFkQ0l4WndjbUVBRXUwVlF1N0tpRyswTEhjODQwWWZHdWVqbjhU?=
 =?utf-8?B?aEVjKzZMVzZlczhENjMwMnhBQ0R2VWo5Nk1mSmtRMWljaWExUG51bHVGNmt1?=
 =?utf-8?B?NlhYT29sZk1DSS9iZmR0cXlBREI5TGxaVDdVVEhsSzdOVmI5bG5Tc3V6UVh0?=
 =?utf-8?B?S01YOTFQUTZiTGpyUjhYUWJYNTR1OEltVFdBQzlseVhXZS84dFZFN29QUjRI?=
 =?utf-8?B?aXRXTGphOU5kYzYrdWw2NVdKZXJFellxTXpIb3QrOHg1enB0TUtFdkRubTBx?=
 =?utf-8?B?V0hVWTN1RU1PRi9nV3NpdjJaOURJZTgwdUNBRER6eGphK0Yyc2tZRVdnKysz?=
 =?utf-8?B?RXBLdm03UEE3RGFNbzA2ZnZRYVBBQ1d1WDg5UnZnZ3pycngrRDFMMnlpNUpS?=
 =?utf-8?B?OHVYaWthb3dVdTJtblJLelR1ZzBzckUxTXBOZDVmMzBxOW9ib0RrNTNwS2cx?=
 =?utf-8?B?b0xVYndFT0VPalQzRDVyaW1BV1pra1FNZ1pyQVpnOHNYSVJLUUFJRmlMeHo2?=
 =?utf-8?B?ZDlaNEwyaG5ZeUpvN1JXM01OaDhVUnMyVnNHbGV3eVU2L1A1eTQ5K1A1QzRS?=
 =?utf-8?B?TzVtVy9hOWU3WmZCOUFYcEoxWlZjRUpsUzk4YUx2U0xMV1R1ZDZFa2h6RGdN?=
 =?utf-8?B?Nmx6d2xsamxDQkdKTlBTcHRnWUdEOEJXVlliRDVYd1RvUlFSblZwaGFTVWV6?=
 =?utf-8?B?cFMxRjUxT3BMKzVtTEVkSkNBbVE4QW8rOXJSZ09XSW5KbXZMZk02eFp1dVdF?=
 =?utf-8?B?MTFtQWQ5b09BNFZiVG5RMU4vYXR0RjJaQUMyN1J6NHQ1YVFVOXl1QlNIaHBJ?=
 =?utf-8?B?bVp2V0Z4NGU0bFF6MWE1TkFyeUxjWVA1VmlyakxOQVkvY1dhMlp5bE83N1BV?=
 =?utf-8?B?Y3RJVy9hK3BSSmd3cHo2T3VXWHVpWEVPV1hMV2VQQjZrM2FsQkdZOU1qaEhj?=
 =?utf-8?B?NG1BamIyTlpwYVFuckRuNFdnbEFjbWczNUdSRzU4L1hkUmt6MkdCODNRYmhK?=
 =?utf-8?B?K2wvMEVDd09oTGFtWmM3SXNOS1dXaDVuRU9BRDVrc3c0d0QvZnNMQ3AvemVu?=
 =?utf-8?B?S2RmOThpQUhEdDBjbm9xSUpUWDFvcUpreXgxZTVsSGtGL1laMjhNck1nZWR6?=
 =?utf-8?B?Q3VybXIrdVArRkt2OWpoRGFldkN5d3ZOLytwQVovZ3JCUkJ4dGtZWGFQS1Yr?=
 =?utf-8?B?eVB4NFJYaTJ4aE0xQ3VNMzFUMG8yUDNiZ3dqSmRRcmJuTWg0a1lKTkQxdko1?=
 =?utf-8?B?YXl3TkRyQmMyK1EzcmZ3OWtWbGQybkhPcHFQWGVXbld2RTE3Rzk0SE9MNllp?=
 =?utf-8?B?Vzdmem5rL3N3Qm9xVU9TTVE5RCtQODhUNXhNSDVNMHlIMTRyRE5lUjliUk1i?=
 =?utf-8?B?Qkt3cGNSemxuYWlMT0ZLbys3bDdWMkNxd2JsQ2V6czA2UGVlMWNzWjA4M1VZ?=
 =?utf-8?B?eWRSbVNNQ1FoZHJpc3F2UDVvb3IvV2tGQms1azRkalJqOFM5RHJhNkV2cXpB?=
 =?utf-8?B?WXJoVThaaXB4dkYvUzhETVBKWTdPdHpncVRlamJqU0tLWlFLb0VFdG03eE95?=
 =?utf-8?Q?m8P9gP0j7PFqQOqWkynowQQqq?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49CDF7B042C3404BB0A9999A499C7002@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 821be889-38dd-4806-a121-08db9db4960d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 17:25:14.0008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IXo8JkGRtFaok73oAE0rafwxmTV4lT1OsHtyPKRfJefD3vJ6p3as0d1AGe5pbVymLr+r5XIygHvnN5ZPL7jD7lPQAXnPrbqzt5988KS3GjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2091
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA4LzIwMjMgw6AgMTk6MjcsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgMTQgQXVnIDIwMjMgMDk6NDA6NDQgKzAwMDANCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+PiBJbnRlcmVzdGluZy4g
VGhhdCBtZWFucyB3ZSBnZXQgc3R1Y2sgc29tZXdoZXJlIGFyb3VuZCAgTU1VX2luaXQoKQ0KPj4N
Cj4+IFdlIGtub3cgdGhhdCBNTVVfaW5pdF9odygpIGlzIGNhbGxlZCBhbmQgcnVucyBhdCBsZWFz
dCB1bnRpbDoNCj4+DQo+PiAJcHJfaW5mbygiVG90YWwgbWVtb3J5ID0gJWxsZE1COyB1c2luZyAl
bGRrQiBmb3IgaGFzaCB0YWJsZVxuIiwNCj4+IAkJKHVuc2lnbmVkIGxvbmcgbG9uZykodG90YWxf
bWVtb3J5ID4+IDIwKSwgSGFzaF9zaXplID4+IDEwKTsNCj4+DQo+PiBCdXQgd2UgbmV2ZXIgcmVh
Y2ggdGhlIHByaW50IGluIHNldHVwX2t1YXAoKSB3aGljaCBpcyBpdHNlbGYgY2FsbGVkIGJ5DQo+
PiBzZXRfa3VwKCk6DQo+PiAJcHJfaW5mbygiQWN0aXZhdGluZyBLZXJuZWwgVXNlcnNwYWNlIEFj
Y2VzcyBQcm90ZWN0aW9uXG4iKTsNCj4+DQo+Pg0KPj4gQ291bGQgeW91IHRyeSB0byBuYXJyb3cg
bW9yZSB0aGUgaXNzdWUgYnkgc3ByZWFkaW5nIHByX2luZm8oKSBhdCBwbGFjZXMNCj4+IGluIHRo
ZSBjb2RlIGJlbG93IGFuZC9vciB0aGUgY2FsbGVkIGZ1bmN0aW9ucyA/IEVpdGhlciB3ZSBuZXZl
ciBjb21lDQo+PiBiYWNrIGZyb20gTU1VX2luaXRfaHcoKSwgb3Igb25lIG9mIG1hcGluX3JhbSgp
IGJ0ZXh0X3VubWFwKCkNCj4+IGthc2FuX21tdV9pbml0KCkgZmFpbHMuDQo+Pg0KPj4gU28gdGhl
IHBpZWNlIG9mIGNvZGUgd2UgYXJlIGludGVyZXN0ZWQgaW4gaXMgbG9jYXRlZCBpbg0KPj4gYXJj
aC9wb3dlcnBjL21tL2luaXRfMzIuYyBhbmQgaXM6DQo+Pg0KPj4gCS8qIEluaXRpYWxpemUgdGhl
IE1NVSBoYXJkd2FyZSAqLw0KPj4gCWlmIChwcGNfbWQucHJvZ3Jlc3MpDQo+PiAJCXBwY19tZC5w
cm9ncmVzcygiTU1VOmh3IGluaXQiLCAweDMwMCk7DQo+PiA9PT4JTU1VX2luaXRfaHcoKTsNCj4+
DQo+PiAJLyogTWFwIGluIGFsbCBvZiBSQU0gc3RhcnRpbmcgYXQgS0VSTkVMQkFTRSAqLw0KPj4g
CWlmIChwcGNfbWQucHJvZ3Jlc3MpDQo+PiAJCXBwY19tZC5wcm9ncmVzcygiTU1VOm1hcGluIiwg
MHgzMDEpOw0KPj4gCW1hcGluX3JhbSgpOw0KPj4NCj4+IAkvKiBJbml0aWFsaXplIGVhcmx5IHRv
cC1kb3duIGlvcmVtYXAgYWxsb2NhdG9yICovDQo+PiAJaW9yZW1hcF9ib3QgPSBJT1JFTUFQX1RP
UDsNCj4+DQo+PiAJaWYgKHBwY19tZC5wcm9ncmVzcykNCj4+IAkJcHBjX21kLnByb2dyZXNzKCJN
TVU6ZXhpdCIsIDB4MjExKTsNCj4+DQo+PiAJLyogRnJvbSBub3cgb24sIGJ0ZXh0IGlzIG5vIGxv
bmdlciBCQVQgbWFwcGVkIGlmIGl0IHdhcyBhdCBhbGwgKi8NCj4+ICNpZmRlZiBDT05GSUdfQk9P
VFhfVEVYVA0KPj4gCWJ0ZXh0X3VubWFwKCk7DQo+PiAjZW5kaWYNCj4+DQo+PiAJa2FzYW5fbW11
X2luaXQoKTsNCj4+DQo+PiA9PT4Jc2V0dXBfa3VwKCk7DQo+IA0KPiBJIGFkZGVkIGEgcHJfaW5m
bygpOyByaWdodCBhZnRlciBNTVVfaW5pdF9odygpOyBhbmQgYW5vdGhlciBvbmUgcmlnaHQgYWZ0
ZXIgc2V0dXBfa3VwKCk7Lg0KPiANCj4gT3V0cHV0IG9mIFBQQ19FQVJMWV9ERUJVRyBjaGFuZ2Vz
IHNvIHRoYXQgSSBnZXQgYW4gYWRkaXRpb25hbCBibGFjayBibGFuayBsaW5lIGFmdGVyDQo+IFsg
ICAgMC4wMDAwMDBdIHByaW50azogYm9vdGNvbnNvbGUgW3VkYmcwXSBlbmFibGVkDQo+IFsgICAg
MC4wMDAwMDBdIFRvdGFsIG1lbW9yeSA9IDIwNDhNQjsgdXNpbmcgNDA5NmtCIGZvciBoYXNoIHRh
YmxlDQo+IA0KPiBhbmQgdGhlIGZyZWV6ZSBhZnRlcndhcmRzLiBTbyBpdCBsb29rcyBsaWtlIHdl
IHJldHVybiBmcm9tIE1NVV9pbml0X2h3KCkgYnV0IG5vdCBmcm9tIHNldHVwX2t1cCgpLg0KDQpJ
IGp1c3Qgc2VudCBhIHBhdGNoIHdpdGggYWRkaXRpb25hbCBwcl9pbmZvKCkgaW4gb3JkZXIgdG8g
aGVscCBsb2NhdGUgDQp0aGUgaXNzdWUsIHBsZWFzZSBwcm92aWRlIG91dHB1dCB3aXRoIHRoYXQg
cGF0Y2guDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
