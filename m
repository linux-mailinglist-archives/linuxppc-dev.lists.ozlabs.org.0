Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75D261E4B3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 18:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N51F93djkz3dtn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 04:14:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EDspWsOH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.85; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EDspWsOH;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120085.outbound.protection.outlook.com [40.107.12.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N51D83Rvmz3cD2
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 04:13:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXtoNiIrAVPguNxflHsR3qfYutN1cD+aB7c6rhLn4U60ytuSEjcfej2ATKWr7QmZapEUBquhdpOhoo2jcgWCWUBR+R4cRdOoAmZyNsuZepWsZIvMr/A8jSUpPHdWrigV6SKtHEl729GDb8+dibl/BVKLUHjD3z2tdqSxvV9HVswkzdSDxmgwQBxUGVNahj3Y5W14Z/iUrkgEYCRgNQicPzfrrUI5aYoilpbjGxYMSBjmGG7/7aPPAtyrhc1i6Vovg9iFifNmhFwwF+48Ytwm9xK6HKRpzmo7nAkdihyMggmUokgV1/wkz91p8IneNjSmGqWiEjnf8thowiYdqHljjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDiwxYONeMdgST4enqGLBB/WF4C9FLBh+6U/PbKMAoo=;
 b=E8F/7wZMPgyTHl+0ENVlJk94fdA1NeTg9QtKKOeEK9bYm4BD4M6UdNP6JoWo5IAyTYiB7U+CGyWEcP9l8VHSSZrjpqBIjht7yUfU2ijisemfBshIbEuMuZ0SvqmB6+kY7TL93x3F2dqP0rxi/NeB7KupxDnGdQFxrGNzIhKC1PkjUvT3vrN2PmfQ0MONPRuqvAW0raFhZh6WXMLiSdq3Hlm0LekpckH1c6/+pkuU2JScBrS9kF7tGVaqjmiiH0KkbiAdxeJHZyBwmcGa8sE3icfL1qklihw/0CLr7OdSyh8iAWRTIZtG9m9oxdAFqW3e3pTOkDIquYJm123VCwxGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDiwxYONeMdgST4enqGLBB/WF4C9FLBh+6U/PbKMAoo=;
 b=EDspWsOHfXIy3+Pok7ofcIqgdGCWsZWL6pevXM536juYHdD6Psamty0PDfMddGf6Fc2igfNi9K8CnnK+pGCKDVdOGMhQRgcybGi0oGNpP9fcVZaLJeHE6iQeNAXUULtfDDsw6U50MsbOeU4uwYu4w++yK3gpwasHf4ckJef7dbf+Im30CgpoZg5khXr/AS3H/ybt7BmYPNuflJxJbYuxT/u5+CD1pXhRYetCt1wCb1vNcPB6d9KX2ceu87ZnrP2MgdI5cUTF9VBt1aMoBKbydSanuqFlIIqPLpsEEDMQ2RSbjj/zBhLrlI579KG9oKbdVsRyZaBjYuETmAzjlKCnSg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1657.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:169::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Sun, 6 Nov
 2022 17:13:22 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%8]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 17:13:21 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "wangkailong@jari.cn"
	<wangkailong@jari.cn>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "sohu0106@126.com" <sohu0106@126.com>
Subject: Re: [PATCH] macintosh/adb: Fix warning comparing pointer to 0
Thread-Topic: [PATCH] macintosh/adb: Fix warning comparing pointer to 0
Thread-Index: AQHY8fqk6abXbDAQgUagOZgTW4/UDK4yIiEA
Date: Sun, 6 Nov 2022 17:13:21 +0000
Message-ID: <7ad9268e-5c77-84e4-fd30-9a4bc7ad3d27@csgroup.eu>
References: <2ef267c.c4.1844d8ef2d8.Coremail.wangkailong@jari.cn>
 <7924fc05-02d7-a2b3-85e3-d30dfe081da3@wanadoo.fr>
In-Reply-To: <7924fc05-02d7-a2b3-85e3-d30dfe081da3@wanadoo.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1657:EE_
x-ms-office365-filtering-correlation-id: 0d0f23fb-ebbb-4730-2ba5-08dac01a3520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  R98yGrTqU0qlWn+nxyEMiB6UdJ4KyMJK9NMsyELe5Mj6nxL39sCzzbD1NR22SW89DJNCBegDsFd1flkrxIph4Alv582u4rym6XZqdKlGAU1mfP/RhyYYxoWlB3y/2H6Wb43labXrtKUfkzl2Qp2bN8p8bkbQfKtfpaeEzEkydj0L0a7jfyfGrNq9ZBglqk8rC2HrKEAa8qIlhlNobLbng6gnOVmPXGMhUxgsLemVeiWQulSpS7x/8iRk9jvRxhjHiy6GkP7XyWrk+Bmffnw6hRlWf+yAoCn7ZCtQ+aHy3LxrflvN/2y9byA0EJIOQwsXZN/hlYfQe4Z3BvraQjY8NVHWQMjE1lQFg7yJtjF6l8XWQ7ajJvkYlmwWbSWCll5LY8LV/C8/jNsXI2kYSzWIPINDrk8R5RzskuFqcYHWSSO6CtvOIsWBKPQYTe1jxmFrOPqEru7gpGZISs2Xhe7irrTAwzb9g/SVoSnA5aBQyGM1QOjxo84Jqt4ItxsXURurUnFZT+cZofsAi9d8UPzKfrCzoL08DJZwWH/inUGrE3my7TpsizWbM9cquBGWWVvnxD0dtaIjuli7MxcHKEA9M41N1DxJN51rFwP+IdoBoJZwpsMyoD+vLjTVn2BPerZZ8lUQXWo1M+KU5y8C1pMbY6WSUfHHGGSn++itfUDDhGeR7pl7qwdsS5pUdtYDrNlBewX2Ga2K3IXXKBuN0S0I9/9QZHnmWkTEWixF4u6u1OZab8k44IVl0dB/HAgv1JvY7RJ2tLMFBtxnKGHOzzElrF4TuqNkO5V82HxU6YnCxe8jv2w/mFZ0M+p/4cPREUrgx90aB3r02M0mMwaTha/CW6v3C7U3zJiyteqkv02vTys=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39840400004)(136003)(396003)(346002)(451199015)(83380400001)(66574015)(8936002)(5660300002)(41300700001)(44832011)(86362001)(478600001)(31686004)(31696002)(36756003)(8676002)(6486002)(76116006)(2616005)(91956017)(186003)(26005)(4326008)(966005)(71200400001)(54906003)(6512007)(316002)(110136005)(122000001)(66556008)(66476007)(2906002)(38070700005)(66446008)(6506007)(38100700002)(66946007)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eGFmOGhrUFJZYW1XWEYwQ29nVzAwanFoWjlxZ2hLVktjUFRZdnJqdUNvUCtp?=
 =?utf-8?B?WGZuMHVpZzlnNmtZcFcvN3ZnSnRQWkk2bmlJNVpFdjlZSzdteExoc3FJWFpS?=
 =?utf-8?B?bVhUc1pwN0JrV3owWGtud1BLQnFCZ3kvRzBNZVVBSDBPUFA3bDR6VnlOaXZt?=
 =?utf-8?B?N3hGVVo3TExySTJnaVlaUHBVckdUMU1DY21jQ0hlYXc5QkFzenRtYTYxQWo5?=
 =?utf-8?B?MDZjOWdTZ00xQUxsNXNubWdDZFBqbG1Xc0dtNi9aRzlPbFVrTkNnSjZDWHMx?=
 =?utf-8?B?dmJOYzhsd3d6UlpENTEvUkhDSCs0K2RpSzlTRUYwQzFIMnFRbzU2YXZPckl0?=
 =?utf-8?B?L1FPTVVjWDNwMk1CUzJxUVpjdWJ1U1JEdVpuTm9uUk5CM3kyM0FWMlc1SDUw?=
 =?utf-8?B?MXVNbXpJczEzQktEUktTWFZDa0MrTzlvdlJHWHkyYW5ZNUNOb3pENjAyUGFi?=
 =?utf-8?B?bTAxNDltR3dNYVd3SGZmUFNLN2gxSnpFMlRWbmxXck1sZnlzeDFGenFObDlV?=
 =?utf-8?B?MDZrQ2ZIZlFhL2l5S0lObjlGSFQ2bU5URmRZSmp5V0l4VWJCYktPNzBYRWp3?=
 =?utf-8?B?ak1XUWpqbE5lUktOa29QcU51VTdtc1MyTHVucGFsNzMzNTk1N2g5Q1RMQXhj?=
 =?utf-8?B?Q1RkMGNmYnNUV0NtS0VKaWxlZEw3Rm1iSVpVZGRNLzBmdFdGa1FnOTljUTdM?=
 =?utf-8?B?aU5tZ1FpbzJnK1l4a2l3bFRPdmJ1K1NySnRrclZxdlk1aW13T1pHaWxwNXF6?=
 =?utf-8?B?QzlwVzBieGpQRytsVkJrZks0RktHaUFFTTl4QitEZDU4NERnc0xFaGVUM1Bp?=
 =?utf-8?B?dXhOOFFXRStFVjh4WFVNMkJ1YWtsbktZUkFMN1JEekw4cVh1OXNOY3JKNDFK?=
 =?utf-8?B?YUYydk0vZXh1OG1VYU80aGV2YTg2Zk5LWktoVkdGT05KbksraFRmdlZiaTdS?=
 =?utf-8?B?ZkhTUVMyRWVISjd6WS8rSk5keG1lbkZwazFvTXNnRWFRbFMyWmdxTFk2VWxp?=
 =?utf-8?B?di9HZU9lZ0crNWYzVEtzMld1NjhzMVlGaXNKR21SSUZmVkk4Q0RXamw0ZXg4?=
 =?utf-8?B?OHJuUUVxZ0xjTExDcSt2SElodnBrTnZnK2wxUWg0UTBwNm9JNHVSNnk0L3h3?=
 =?utf-8?B?Q0tlVnFEN0JSZzZ5azZvZzNxVTRuejRqa1hHYUxVOHBneVlzOUlEY0h3NitU?=
 =?utf-8?B?V1FTNmFHVFBYanRuZ3Y3NGRzVG5JYW43MmFJdTUzTStDcldDMHJKRjAwRTRV?=
 =?utf-8?B?N3BoU2FubnpNYk9nTWhvUGliK2g1UUdKTVZCelBaTnN5MVd3R0JFU0RhVm41?=
 =?utf-8?B?QXZrb0J6QjVFZXJTcEJ1SzBxUUdOZWNvNERobHU3MWNxSXBSN2Q1TTkvL2pi?=
 =?utf-8?B?c25kOHRZeHRZQ3dlOVhwRjFMVERlYklROHFoMmVHOW9FbkhYaVIrcHhZRm41?=
 =?utf-8?B?TCtnTFBJS21wbXA1bDM1SWZJZjE0Slh4aUZvblMwMGZrNTZMNXIvMEV2WUty?=
 =?utf-8?B?Vm5nczhkZlJHS1ROZ3JHL3lMamZBRkwrUlNhK2NZdHY4TmVaWlVJWnVJY1lq?=
 =?utf-8?B?VEdoZ1Y3WHUxVkZWOFdEYU1GZVppQ2xQd2QrSFJBdzJiWTJQZUdLZmV5SmtO?=
 =?utf-8?B?RmtVblF4SVNHcVNQM3JVTjBRQlI0TnNKLzh5ZUZjNWtLSURYbVczbVh6NGJO?=
 =?utf-8?B?VnY4MWJITzY3N3Z5QkxtNHVqUUVzMFBPcU9hMW4rRXBSUVQyZjFqbWljL28v?=
 =?utf-8?B?dEZmU0FqajFHTmZ4K1hXQjRHc255R21TMHlQTDllYVpzUFJ1Q3pMdE1EMjVl?=
 =?utf-8?B?aExkOXlxRUNFUm9UQTZDdDVhazA4dUwrTTZ4amcyaWszUGZaOURmdWNiZzRI?=
 =?utf-8?B?MThPZGJWK3FMMzVLNmdBcDgxTGxZSHZpa2hock54L1h1UGZST1NVUzhRbS9B?=
 =?utf-8?B?MU1iejRGem1sYWxCY0xXalZCYitNS2F5TDlHQ0NBbWhmU0VrRm9ZTWc4bi81?=
 =?utf-8?B?Zmo5cVIwVWN5R2xUcXM1Rno2R0tuODBhVVhEeSt0RG9zU1dDMHluSjk1NzBB?=
 =?utf-8?B?N0syUktNZWJ1djh5V1JZR1JTdms5bEJ0TVM2dEpsK1U4c3BzTnJiSU9sZEVT?=
 =?utf-8?B?TDVTeGRYTjgwVXpUdGgxMjlQWHJMN1ZMVDA2UGN3UTZHVHlZdG0yNTdqVGhx?=
 =?utf-8?Q?cXJjls5cFAmaUpjvM3Awbio=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97C3E9542C20FB43A74EA672D60F49E0@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d0f23fb-ebbb-4730-2ba5-08dac01a3520
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2022 17:13:21.9173
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvJ3Oxlcj+xZQGIB5DF3c15E3wuk/HtVsUM4JT/u33TTCTZvC67i+GEtbwrf2Pso8j0K5WoG62KYswwMO2g82bSPr4RbmUCu0uObY0eeuuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1657
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzExLzIwMjIgw6AgMTc6MTIsIENocmlzdG9waGUgSkFJTExFVCBhIMOpY3JpdMKg
Og0KPiBMZSAwNi8xMS8yMDIyIMOgIDE2OjI4LCB3YW5na2FpbG9uZ0BqYXJpLmNuIGEgw6ljcml0
wqA6DQo+PiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6DQo+Pg0KPj4gZHJp
dmVycy9tYWNpbnRvc2gvYWRiLmM6Njc2OjE0LTE1OiBXQVJOSU5HIGNvbXBhcmluZyBwb2ludGVy
IHRvIDAuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogS2FpTG9uZyBXYW5nIDx3YW5na2FpbG9uZ0Bq
YXJpLmNuPg0KDQpXZSBhbHJlYWR5IGhhdmUgc3VjaCBwYXRjaGVzIGF3YWl0aW5nIGZvciBhcHBs
aWNhdGlvbiwgc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4
cHBjLWRldi9saXN0Lz9zdWJtaXR0ZXI9ODM2NDcNCg0KUGxlYXNlIGNoZWNrIHBhdGNod29yayBi
ZWZvcmUgc3VibWl0dGluZyBzdWNoIGZpeGVzIGFzIHRoZXkgbWF5IGFscmVhZHkgDQpleGlzdC4N
Cg0KVGhhbmtzDQpDaHJpc3RvcGhlDQoNCg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL21hY2ludG9z
aC9hZGIuYyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21hY2ludG9zaC9hZGIuYyBi
L2RyaXZlcnMvbWFjaW50b3NoL2FkYi5jDQo+PiBpbmRleCAxYmJiOWNhMDhkNDAuLjA3NjI1MzU5
OWJkNCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvbWFjaW50b3NoL2FkYi5jDQo+PiArKysgYi9k
cml2ZXJzL21hY2ludG9zaC9hZGIuYw0KPj4gQEAgLTY3Myw3ICs2NzMsNyBAQCBzdGF0aWMgaW50
IGFkYl9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCANCj4+IGZpbGUgKmZpbGUpDQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgwqDC
oMKgwqAgc3RhdGUgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgYWRiZGV2X3N0YXRlKSwgR0ZQX0tF
Uk5FTCk7DQo+PiAtwqDCoMKgIGlmIChzdGF0ZSA9PSAwKSB7DQo+PiArwqDCoMKgIGlmIChzdGF0
ZSkgew0KPiANCj4gSGkNCj4gbm8sIHRoaXMgc2hvdWxkIGJlICJpZiAoIXN0YXRlKSINCj4gDQo+
IENKDQo+IA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9NRU07DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiDCoMKgwqDCoMKgIH0NCj4g
