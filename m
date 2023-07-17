Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F37C9756841
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jul 2023 17:47:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KEpJhk8Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4RKk6JN7z2ytG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 01:47:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=KEpJhk8Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::61c; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2061c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::61c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4RJp4smzz2yFG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 01:46:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFq+WSVVtq+pUvfclBF+FIGxaPLsBV53jw3QbhPt6696ACl8yOButknPP1yYsz0kqwU19eoxGgSQgpfHe6BrBWJkFdkW+24qCQNuLFjiWx0/f5zBCfWWuxkXqgdLcLsARP2xnbwNyV4zh+e/2NttEeVSkLpWypBiiwUi4WIkXdq1GM8BSfNLiqfPES7GiCGhHNDJHjFxtrb5t0Qc7BjwjEkuh9FdbqztkA4AIWs9KHUIkhKzyl/ztbCzH4Cet9n1pMxvkSKk2v/kAOwuYR9iRymZMiJnKthxAcXUzwTFC7FrKugNRbcifSXTwB8w8MPK3P3PNuweQkGDDmwiI0qKSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BC8FDwnHrLBeqBNzQkJb0B3GoCCyB8/SfaHotuCIgww=;
 b=cvJyIwMrT55n5UsmJFaEuFbuO//LAKxn1ucDZUXEqAdXM3d8OqFfwrYX4h3GxUGBvpepZdGFW++DHVyBd5PQk7RGaquuNtnW3jKQs1hdvWUrgmPwsYHQsySZ9l+214uO2m7EsDIrZ/zxOzZWT44esvfZcMkMMha82R8rPDbnl8vL32ivrOAoeRUuwB7BCCI4sRjEsVUVA2LR971A97ciC7TVUwLW4wYe3TFs+x6mGV5ufeY2IfzKA0o+/HiCdslvkLhM2WbSuVIutw/eNyzDHV5OlCIvcvJEqqj0RgGtwssvpoJqmYrvBeY9R+nC2HAiee2gSO17pbzfdxaH3CxpSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BC8FDwnHrLBeqBNzQkJb0B3GoCCyB8/SfaHotuCIgww=;
 b=KEpJhk8QfGkdEdYyHN9oRMnHew+bDRGodRUy37guEJyFL4pCzHJtYTvliCiF4rd6KP+XDq1Qi7DY4AMRYDlOoPKnQZgPyc3g3tBBThNflORcFj0yszz7cMyDMkozUMzZkJRtb//hY4curm6OAO+LnNSZM3NsdtvjD0vdxhxEalGfIoiqqFM1Z+rWZ56s8X2rq8adgE4/XA/S8iMX+VrOWyxq1mMGdiynA3fH8Hq+ETJ739O2oK2jZZf4QBS69wUaVKU+GX3iiAYIKNG2dFRTS11gridXq4BmH+/110oldQ+DubCaboDwtLPlrAqb7UXNRMXDUv3JFZOAbbdNmdVnFg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2228.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 15:46:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::27ce:b19:7bdb:aab3%7]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 15:46:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v5] Revert "powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto"
Thread-Topic: [PATCH v5] Revert "powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto"
Thread-Index: AQHZtMczpK8jdeuLskq9ms31HEOy+a+2JsgAgAdHDYCAALQ4gA==
Date: Mon, 17 Jul 2023 15:46:10 +0000
Message-ID: <794f84c8-f6cd-445f-322e-88f1b806e236@csgroup.eu>
References: <20230712134552.534955-1-mpe@ellerman.id.au>
 <e63b1f49-1022-9485-e555-68d6c4a7879c@csgroup.eu>
 <87a5vvjfn0.fsf@mail.lhotse>
In-Reply-To: <87a5vvjfn0.fsf@mail.lhotse>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2228:EE_
x-ms-office365-filtering-correlation-id: 3a0d6541-66dd-48e5-becd-08db86dcf137
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  vXlVDHNLn0uJvjLRAhGbqDyeH0V8A4IhoezQlqJFWR7gmdgN5du3enYcsAQjNUU3JYGT0UqLn9V2rnoMQkvsOYPxYXCQAqHL0pk6QzJE7zFpCRuprealVTzmC3fFKlC6I1j9EtldyqI1CB9ixSC01jdkWmNN9cu9fKVK2cuYz49ZDal59CkWUCHtzxdSApTlS7yARhYCJvOhGBAx/yfYQ5KRrCnBPxCWgR1Yl8owt1GBqZnPIQZ8BPsdmypUXJ7x5/xhRvOgA3F0KbjCa5GNJkSUPiE4yo61rNtcb54v/gzQ4FqeH/SiKM6vtK4BjUrrwMPRb99PzdkKzO6NHocz7fLDI1IE25HFIMF00DdkDiY5joHiXvjDa3VnVVdW3wahnOZZthScRqW3/oAlneyfc/VHnp9R5s5QMIHkoNvIdjyGlp5xiaOtsj1twQQrd4IK8QwtX2U0PwxSZB0vIneNgPaIaKVokvhfmr6Oy/1RynXo/R+rOXu0e1z2YGJdb7wxSWmJB0BkR2wBbUIwjb9/oNasSwOMt2/XVQ6NrZzSWxHa1m+LfFrkh/omNXtXs5AKe1nCOZpmz4x9BpYPxKxiFWOFpWBzD6wDaeqqo5CqOjdD82HLaFffDEbYD42/8QgB4nnwfeKewszv4pu2yaA8EYtKMC0QCpPKGLGjvdXhaeNZv31uuNWMzSD1i/DqieNR
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(451199021)(31686004)(31696002)(86362001)(2906002)(36756003)(38070700005)(44832011)(6512007)(186003)(66574015)(83380400001)(6506007)(38100700002)(6486002)(122000001)(110136005)(71200400001)(91956017)(316002)(5660300002)(66476007)(76116006)(66446008)(64756008)(66946007)(66556008)(2616005)(4326008)(478600001)(41300700001)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RVhJcU1TOFl1RCttOUlHMUVXUHl3R3ZQMzJtRXRZQ29Fd2pNdTB3bGd3dnpi?=
 =?utf-8?B?WDJGcC9qckpkZjU2dDdrRkV5TjdyR3Zjc014Z29DaEFEN1dvM3A2cmxIaFBz?=
 =?utf-8?B?aVNxR1pNMkxEK2U1MzRudmcrOGxGdS9salgzcG43TVNSNXk2V1ExUVk0MUJv?=
 =?utf-8?B?WmtGOTF4MExMc05DNzVFQm10UjdGMlo5bkFZOVAwcjdOcUpHNWVId01nN200?=
 =?utf-8?B?Ynp3eWVSLzFnYndlMVQ1ZXg3a3UwU0hzaG5KYTdxZC9nUEhYOUpBc3o2MHNM?=
 =?utf-8?B?dzkrRnpsWlhaVTV2V0tWVW9ZY1QyOE0rUDhpUDNZZ2RWOHZaZ0lDVUNUdC9I?=
 =?utf-8?B?SU1XNU5RcXdRMk9kZStPYTdSWW5jMlBxRUZKTzBXMlQrTG5VcmpubEw4QnFl?=
 =?utf-8?B?ZHFrTmxjYmFNRGoyeU1QS1djMTlGYzFkYUIxUEtubkxaYzhWWENKc3A0eUpM?=
 =?utf-8?B?anFoMnB1Y1FpdzBwd2xjS3o5eDI1bXlJbWFsd1NkRVRUQk9vWkNydGRyMjZq?=
 =?utf-8?B?SVlGUm8wU3ZwbFdEYnNSMHI3U1FTNFVzbFhLYWZ1eTBVZTY5Y3V1UzkwK1pr?=
 =?utf-8?B?N3E2V2ZZcVkyTC9KdFlsSml0S1BJMngrSUF6RHN0UGFqa0ZkNTg1YTNITFdH?=
 =?utf-8?B?TTRLK25WTjM5UlkwWnRnaTYyaG9iWVdxZEd0MHdGc0M3SVBqZ05XL3hQVGh0?=
 =?utf-8?B?bG5rZXpZQkRtZk5rM0psek80d2oyb1I5YTM2Q1lYNFNuTVlCbUllM1dNVGpX?=
 =?utf-8?B?WXgvMHdIR2FJSENLNUFLTU5PTUpMQ1ZjaHROZTgybjdBeDNKeHlrcFc3Z2Ry?=
 =?utf-8?B?RzFkbThTMWlIdmVnU3RyNFk4VFBVK2J2ZjhEMHkvN2h1bWIzNHlxTzF5TDgx?=
 =?utf-8?B?RjJlaTRsWmFLYVZxemVLTFFWZGw4TE9ZMTFER1FYWDk0b1I4Y1UwQThLMXha?=
 =?utf-8?B?anNGb2lzM0NLSWE3dGtjczE0TzFIVWNhZUlsWTNLbHdIbTFxeGo3bTFWQXhM?=
 =?utf-8?B?LzFXVkJtdjVKTGVtZ1YvbkNhNytYMElTdjQ2ZEZ2TTVPeTB6UGdLVFR1bm8r?=
 =?utf-8?B?NjdkNGZEamJDYVBlRGFrVk1tTGFkRkZxNWRJNlNrYzFidkNWNWF4OEkyeUg4?=
 =?utf-8?B?VkR3THRxSk1oeWp4bkpGU1lZT3FFMFJhRFpvcGZ1Y24rNjByUkV0a1oyZlIz?=
 =?utf-8?B?TE1LanhnR0p4RzVDTFZYQnN6dElZMFY0d1BRQkVXL2VVZ2o4WlJSRU1DTzAz?=
 =?utf-8?B?UmxrQW9pM2pxUHNkUjVqdCtPTFpGOUhBbjZBWHl6bno3TUNsR0lwOEt2VWpS?=
 =?utf-8?B?cEFpOEw3eGtHL3RYUlB2dUxnSDFEeHdhR1pHb1JoZzdSWVZCbVFTcDNsTVBu?=
 =?utf-8?B?MmNHOEsvRmp2VWoxUlpvajNvc0dBaUhNN21oWXlYWGVjMm1BSytOWnl0WHVN?=
 =?utf-8?B?TzZYZkF0MzNBTVVmd1FDaHU2azhuV1ViM3VEWkJndGZXOTNDWFE2UVRUQkNJ?=
 =?utf-8?B?dkJzdjFlV1BWU1k1NGJHcmJSNEc5NHpQNG1ST3F4WHJQMXlTc3ZXSUVOaTE0?=
 =?utf-8?B?WjM3M1l5aWNnUU9SanAzUDQ5Y2tmQXhLemNYaGU0SGJUYzVXRzNHTm9mdXAz?=
 =?utf-8?B?KzMzUVpneEROcUQxcGpLQ3RYNmlkeThsOGxuZ3ZtcUt2TDc3bHBjcXZySGFh?=
 =?utf-8?B?dDNFRWxWb1dXclVLVzV5STJKSy9jQzBRMzdOdXF0ZEdLQW8vcEVnckdVNW5P?=
 =?utf-8?B?M2I3Q1hrM1A5eTV4Y1lSTzRFay9nbFpXdHhZUGpreTRKQzg1SnZWVVNKQVh4?=
 =?utf-8?B?bXI1WW44ZGQ3RlZTWWFWVkhIWCsva0UwbzBrb2NVcXNpR0NUU2VrNThqdjVU?=
 =?utf-8?B?eWJ3Qyt6Z2tVOGd6K1YxbXVmZEdRYk83Rk1tem1wTlR0anRUR1FFbkgwYkUy?=
 =?utf-8?B?alF2anNibkRkckxjdFVqWlozVmlPUFRZZG40b015NXA0SzlCY0Y4QVFuS0xD?=
 =?utf-8?B?NkZtZDE5MWNJNkJyZlN5UlM0ZjlYakxVcUNSOGYrZUdMNk5yaWRWaDhvVnVZ?=
 =?utf-8?B?ekxBSFlNT0MybXN5b0FkMzB6SGVkV3NNdDE1ZjJiUndKbkpTOE5ocGcwY2Iy?=
 =?utf-8?B?NHc5eVlsd2xuVjlyRmd1aHZtRkpKa1B2dWllN2ZFL3VnNjNVSXdWVGlXUFFk?=
 =?utf-8?B?TlI3bExvWGxHTHpmNlpJc3NMSUdrQWRkNzlxMmc0MllaRHh1azRFR3VrTTdE?=
 =?utf-8?B?MUVOTVJ3VVVaamU1VXdZV1oyTk5RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CFE8626D63209E41965CF70FFD07CFA9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0d6541-66dd-48e5-becd-08db86dcf137
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 15:46:10.0424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 06OjEZqtcyTe8Ffg7SIut9efcgvUj9Ax22KRwU0wWjESI5q963j2agNupmBnL53/vVSDjyxp8mK+qUE1vapnuRm+9Sb4V4Bd/MhkjUV20UA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2228
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
Cc: "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE3LzA3LzIwMjMgw6AgMDc6MDEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBMZSAxMi8wNy8yMDIzIMOgIDE1OjQ1LCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6
DQo+Pj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1
Pg0KPj4+DQo+Pj4gVGhpcyBwYXJ0bHkgcmV2ZXJ0cyBjb21taXQgMWU2ODhkZDJhM2Q2NzU5ZDQx
NjYxNmZmMDdhZmM0YmI4MzZjNDIxMy4NCj4+Pg0KPj4+IFRoYXQgY29tbWl0IGFpbWVkIGF0IG9w
dGltaXNpbmcgdGhlIGNvZGUgYXJvdW5kIGdlbmVyYXRpb24gb2YNCj4+PiBXQVJOX09OL0JVR19P
TiBidXQgdGhpcyBsZWFkcyB0byBhIGxvdCBvZiBkZWFkIGNvZGUgZXJyb25lb3VzbHkNCj4+PiBn
ZW5lcmF0ZWQgYnkgR0NDLg0KPj4+DQo+Pj4gVGhhdCBkZWFkIGNvZGUgYmVjb21lcyBhIHByb2Js
ZW0gd2hlbiB3ZSBzdGFydCB1c2luZyBvYmp0b29sIHZhbGlkYXRpb24NCj4+PiBiZWNhdXNlIG9i
anRvb2wgd2lsbCBhYm9ydCB2YWxpZGF0aW9uIHdpdGggYSB3YXJuaW5nIGFzIHNvb24gYXMgaXQN
Cj4+PiBkZXRlY3RzIHVucmVhY2hhYmxlIGNvZGUuIFRoaXMgaXMgYmVjYXVzZSB1bnJlYWNoYWJs
ZSBjb2RlIG1pZ2h0DQo+Pj4gYmUgdGhlIGluZGljYXRpb24gdGhhdCBvYmp0b29sIGRvZXNuJ3Qg
cHJvcGVybHkgZGVjb2RlIG9iamVjdCB0ZXh0Lg0KPj4+DQo+Pj4gICAgICAgIHRleHQJICAgZGF0
YQkgICAgYnNzCSAgICBkZWMJICAgIGhleAlmaWxlbmFtZQ0KPj4+ICAgICA5NTUxNTg1CTM2Mjc4
MzQJIDIyNDM3NgkxMzQwMzc5NQkgY2M4NjkzCXZtbGludXguYmVmb3JlDQo+Pj4gICAgIDk1MzUy
ODEJMzYyODM1OAkgMjI0Mzc2CTEzMzg4MDE1CSBjYzQ4ZWYJdm1saW51eC5hZnRlcg0KPj4+DQo+
Pj4gT25jZSB0aGlzIGNoYW5nZSBpcyByZXZlcnRlZCwgaW4gYSBzdGFuZGFyZCBjb25maWd1cmF0
aW9uIChwbWFjMzIgKw0KPj4+IGZ1bmN0aW9uIHRyYWNlcikgdGhlIHRleHQgaXMgcmVkdWNlZCBi
eSAxNmsgd2hpY2ggaXMgYXJvdW5kIDEuNyUNCj4+Pg0KPj4+IFdlIGFscmVhZHkgaGFkIHByb2Js
ZW0gd2l0aCBpdCB3aGVuIHN0YXJ0aW5nIHRvIHVzZSBvYmp0b29sIG9uIHBvd2VycGMNCj4+PiBh
cyBhIHJlcGxhY2VtZW50IGZvciByZWNvcmRtY291bnQsIHNlZSBjb21taXQgOTNlM2Y0NWEyNjMx
ICgicG93ZXJwYzoNCj4+PiBGaXggX19XQVJOX0ZMQUdTKCkgZm9yIHVzZSB3aXRoIE9ianRvb2wi
KQ0KPj4+DQo+Pj4gVGhlcmUgaXMgYWxzbyBhIHByb2JsZW0gd2l0aCBhdCBsZWFzdCBHQ0MgMTIs
IG9uIHBwYzY0X2RlZmNvbmZpZyArDQo+Pj4gQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFPXkg
KyBDT05GSUdfREVCVUdfU0VDVElPTl9NSVNNQVRDSD15IDoNCj4+Pg0KPj4+ICAgICAgIExEICAg
ICAgLnRtcF92bWxpbnV4LmthbGxzeW1zMQ0KPj4+ICAgICBwb3dlcnBjNjQtbGludXgtbGQ6IG5l
dC9pcHY0L3RjcF9pbnB1dC5vOihfX2V4X3RhYmxlKzB4YzQpOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGAuTDIxMzYnDQo+Pj4gICAgIG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS52bWxp
bnV4OjM2OiB2bWxpbnV4XSBFcnJvciAxDQo+Pj4gICAgIG1ha2VbMV06ICoqKiBbL2hvbWUvY2hs
ZXJveS9saW51eC1wb3dlcnBjL01ha2VmaWxlOjEyMzg6IHZtbGludXhdIEVycm9yIDINCj4+Pg0K
Pj4+IFRha2luZyBpbnRvIGFjY291bnQgdGhhdCBvdGhlciBwcm9ibGVtcyBhcmUgZW5jb3VudGVy
ZWQgd2l0aCB0aGF0DQo+Pj4gJ2FzbSBnb3RvJyBpbiBXQVJOX09OKCksIGluY2x1ZGluZyBidWls
ZCBmYWlsdXJlcywga2VlcGluZyB0aGF0DQo+Pj4gY2hhbmdlIGlzIG5vdCB3b3J0aCBpdCBhbGx0
aG91Z2ggaXQgaXMgcHJpbWFyaWx5IGEgY29tcGlsZXIgYnVnLg0KPj4+DQo+Pj4gUmV2ZXJ0IGl0
IGZvciBub3cuDQo+Pj4NCj4+PiBtcGU6IFJldGFpbiBFTUlUX1dBUk5fRU5UUlkgYXMgYSBzeW5v
bnltIGZvciBFTUlUX0JVR19FTlRSWSB0byByZWR1Y2UNCj4+PiBjaHVybiwgYXMgdGhlcmUgYXJl
IG5vdyBuZWFybHkgYXMgbWFueSB1c2VzIG9mIEVNSVRfV0FSTl9FTlRSWSBhcw0KPj4+IEVNSVRf
QlVHX0VOVFJZLg0KPj4NCj4+IEluIHRoYXQgY2FzZSwgc2hvdWxkIHdlIGtlZXAgX19FTUlUX0JV
R19FTlRSWSBhbmQgYWxzbyBrZWVwIHRoZSBjaGVjaw0KPj4gdGhhdCBtYWtlcyBzdXJlIG5vYm9k
eSB1c2VzIEVNSVRfQlVHX0VOVFJZIHdpdGggQlVHRkxBR19XQVJOSU5HID8NCj4gDQo+IEkgZGlk
bid0IHRoaW5rIGl0IHdhcyB3b3J0aCBpdCwgbm93IHRoYXQgaXQncyBub3QgYSBjb3JyZWN0bmVz
cyBpc3N1ZS4NCj4gDQo+IEkgdGhpbmsgdGhlIGJldHRlciBvcHRpb24gd291bGQgYmUgdG8gaGF2
ZSBFTUlUX1dBUk5fRU5UUlkgYWRkDQo+IEJVR0ZMQUdfV0FSTklORyBpdHNlbGYsIHJhdGhlciB0
aGFuIHRoZSBjYWxsZXIgaGF2aW5nIHRvIHBhc3MgaXQuDQo+IA0KDQpPayB0aGF0J3MgZmluZSBm
b3IgbWUuDQoNCkknbGwgZG8gdGhhdCBpbiBhIGZvbGxvdy11cCBwYXRjaCBvbmUgZGF5Lg0KDQpD
aHJpc3RvcGhlDQo=
