Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318D83BA40
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 07:47:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MWtHp7GI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLBGd2xKGz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 17:47:53 +1100 (AEDT)
X-Original-To: Linuxppc-dev@lists.ozlabs.org
Delivered-To: Linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=MWtHp7GI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261c::601; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261c::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLBFn5czlz2yk9
	for <Linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 17:47:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8p5W//MGSayjwehfr7CQQ8+/MbYT/cJqXbH+DsFKSIDoGGL7Oy6BYM4pC44tav5v8SWFNaDG8qzdkbEjgLLl/3lJ40S4cwU4FiYzxRXB3C7NVcU3RLignEuWbruFKZWj/B7Cq5lQPH7kSzGJb5ykwf7HWX1QKmfrGyPoiM0UE+VH6MFbPxn42meYccMZyU5sKkBeiFrPuHRkBsrhosBwg02j7ALFqmSiI9QjK9h0tkyfBTILHKfTPe24TP4GWr+MNU8fuw+eQojkH4jA3qn1L2eVWDr4KX7KiuXEuDvzJ1gO4d0mRQ+xrlW7ZIVsaeS7xMpufP4O60cEPR/85fCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBmKy8uthcbk/avBjjNqNAlYkLEd+EnTldpVAKShW+k=;
 b=SxomotrJqOGCZ8Of2DdptnIufUDsxu3+OQYb65f6d9bcnYiZCmtbsPUe5wH+a5AGCtBn5Qw1hPpqCszBnY7MTwSZ6B/E5fTPanl0Ikd1XnMWptd/GdyNHQN0bL1/ReeLLSuExM0SJ0LWS8CDe6XfRhXsTqjNRydbHQ5CpsAmuDrnRnDsyDmQHXhDmGETTG+HUlsJU+z9dfsL65kiBR3wina8Ajn0L+tc6XYopcCJziD7tIkMf6L1GF3W4Riz6ORj6r67ljRtAMPmdN605FOSqQEKx5eW05eQvv3mUePPbOShzw8Pk7I0s6I7bqEa/CYuqTszKd+842Eprg515Dj4sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBmKy8uthcbk/avBjjNqNAlYkLEd+EnTldpVAKShW+k=;
 b=MWtHp7GI9Fcy8noz3cSmVnhIqlFJcFb2sJASYrATsd6ovNieaQ58v3CppyBEay1Z9Vpfqvu6lyWLontstoHZvg6Z0xgZJmiAh3Dixv7/556yFvjORrzxfR6hJoGWmHN1fCcGNDOgGpMW9NOMxxvhCJ4GN5W5J7bQLOR8lxuUrenbFs7bgtCzTUcsM2M2sTN9eMKqKDwIE9cVgd/ONnSAANrHFrSyVxJBhkXIJV1DTIZNPQBzi08bNqhoWwsA+DXTd5kjl3PlvxZyPEkDy3+PmTgjPVKa5Gulmw4BHlwYemHMNWu/YQkY0sEdnHp3byGfjl6HYSCSEOy9WLrkmLAShg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2789.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:46:46 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 06:46:46 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: sambat goson <sombat3960@gmail.com>, "Linuxppc-dev@lists.ozlabs.org"
	<Linuxppc-dev@lists.ozlabs.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Geoff Levand <geoff@infradead.org>
Subject: Re: ps3_gelic_net.c issue (linux kernel 6.8-rc1)
Thread-Topic: ps3_gelic_net.c issue (linux kernel 6.8-rc1)
Thread-Index: AQHaTymBphtiWAN1lE2kjWj1Or+IALDqFjKA
Date: Thu, 25 Jan 2024 06:46:45 +0000
Message-ID: <71205a49-86f7-48a7-94ce-cfd94e8b103d@csgroup.eu>
References:  <CAC1vu61dspNPx7eVSsV1htnC0d+p4m3pzuv+9jQcyAFJEF4Y3w@mail.gmail.com>
In-Reply-To:  <CAC1vu61dspNPx7eVSsV1htnC0d+p4m3pzuv+9jQcyAFJEF4Y3w@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2789:EE_
x-ms-office365-filtering-correlation-id: dc8da413-64a9-40cb-77a2-08dc1d716602
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  OjimPxGjQ/2aCy2gmZ9LWmcKbykoI+fvcg41rLAl2GpghJiLTXb91VyBaD0ePr/CtaRW20XLjLROWUoOmPcbzq5+CJq42hET2lOTHe7w77zBiokG2qtwVyL+AGizusSK5ePjFsBWqhGu+cb+xydGEkxJ/LXRu/R4jj82ydIoGgYVzGHCoxKgWfl6waTNNf7Jz60ANeRU1Tv5OwHgCphYvlH+WoMzQaAXyZsjJM4q3uFxshE+++hqYvHZE7JpSdfDnO8nMqR91h+PAV4I4ZEq0rOA2qw/dnVniZDcKbDG85WXTpKpXE7MTs4xVl/mOO5K0WRQK6tXpRm+1KahU8nlAgRHJT2rX5YVzEQG4hX9FbxOZOxOL5yXGLlj+Yc14Vu4KI8yHC5zAAnLwVvu7gUROfcQ8aEd+cTouPS06jU+o4BPwTEgfIHCmFE9Tc9BogLuBzSVl0hBhPBWbXVDhPDt0M6F1yHEDWLfMisagYsY+XdK1OB4sU4UyNBQuGTKb1WEz85mSI5/Dc95+rvLFgKfb5uwMl/qFwXt6rJtw5nfcXSf0RN0AujRnkYtsh66z/YxstpwrGDFVWvnIozWHUxOvLfhAM71kV9jY6VXtuu1lKaCf6ZcJvKl5eOvKXhho5mnRQaeKZocTz5HZOVo7ERJI5wmdop/J94yzTitUq5wcUq2AlPxqmsUaVl6rlpGwDG3
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(376002)(39860400002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38070700009)(5660300002)(4744005)(36756003)(41300700001)(2906002)(2616005)(26005)(38100700002)(8676002)(8936002)(71200400001)(31686004)(86362001)(31696002)(6486002)(478600001)(66446008)(122000001)(64756008)(44832011)(316002)(6506007)(66476007)(91956017)(110136005)(76116006)(6512007)(66556008)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?eWNGNzByUEs4Ky9VY1Q3Sm9vc2RNeXNucWE0aGNaWkN3UlIxVU50Q21wYnZa?=
 =?utf-8?B?Qms0WUV6elQ0YlBRUkV1dW9tNXdmOGxKSDFQajFLM1lpakxzU3EyQ2V2NXZx?=
 =?utf-8?B?SGJvb2dEelBtTWFFSkI1UkJuSWRuRHl5OFJhU2dsUk15MVJDSTErTFA4b092?=
 =?utf-8?B?dUNmemxTZXo3cVRzZW4zQk5VQXFSN2F5bjc4MlJ0NkdwYzE0QW5IMEtiWTV3?=
 =?utf-8?B?ZDIzZWRnSklzZTNJY1c0QldDbkQ5MzIxNmhTei9lSFYrUVdqcnhOQzhhNWdk?=
 =?utf-8?B?NndLbndUMHpLeTQwWnBGMGNqbzlYVjFrWkV5YWcycDF3V09LQ0lxMEl4ZWVi?=
 =?utf-8?B?Z0d4M3BxbG1tWGlLSzE2cnBJTWJlbzNjRlE1N2dVUElXSmxobGF1bXVBamNU?=
 =?utf-8?B?WGFxRWdwb1F4QTFUSWI3RE5nVlg1V0Vtb2xhTE81M0ZNNXBHY1pKcmZHb3p4?=
 =?utf-8?B?T21mR0NxdkZMMTMyZzliekxFUDl1dk1XZUtjK0tRU1ZHRTNEQjk2RHdTZjJR?=
 =?utf-8?B?U2dNaXlvRW40K0RpTFFzckp3U0xrdUlPek5EVktDZ0xVa2dXdFl1Q3lsUmNR?=
 =?utf-8?B?Mmt0dENFUkdJS1dWTlUzdXo1OHdYNjhWSjltRWVnNHNlSUNtWXo4OVQzekpS?=
 =?utf-8?B?WnpIU0hEbTd6NFlmbEFycG8wemJDRFVaOVYva0QzTXJ2aEcrT25FSWNJcTNR?=
 =?utf-8?B?UWhzWWU4Uk8vQ1hZUkFXWWhsMEc4YnZDakhxQytJWXhuL3NrSGx4RWJveUNE?=
 =?utf-8?B?a2psUE1uMXlPNXhhYy9aKzRtckN1WHZoQ2I1M01rOWo2SXBJVVliUEVLOUxn?=
 =?utf-8?B?c0Q2Q2xIK0tRWDRlVWxaSFdsZ0JMWUE3NWJyZDNXTVdNcG1qS0t3blpESm9F?=
 =?utf-8?B?MWJySCtMcjBnc0xQTC9ySEVYTlJMQ294RjJFK0R3OHBmcXZ5eEIyYUtEYm11?=
 =?utf-8?B?MUk4ckI1cjBvQjVtSmlMdUlEbUtrb1B6NXo0WEZXRFk0WGY2Tjdld0Rwa0Jt?=
 =?utf-8?B?c0hsTFVjSy83VHU5Vlp0cW9wQThLMlB5bGRRSG5sMDNpSGgyZGx2REZXWFJU?=
 =?utf-8?B?a2RqTy9mcGNNRHNEVlJscnAxajVJOWM2UjN3Q3o1bzZ5Yk53WVpoL0hkL05Q?=
 =?utf-8?B?WGYxaEs3ZGpBMEIxTldwZmZNWllyTTZRRXRJck5VUDQwYlcvWjh3MDdNRGJx?=
 =?utf-8?B?cWZ3MjNzRDJiZEM3SUFQNk13ZXBsUS9nMjVNVzRBSU5naWJOMWRoYXJtUFdU?=
 =?utf-8?B?NmFjeVVxOE1qZldaVSthNjhqK25DT28zSFNCTjQxc2I5RmtOTmlXZjAxdFVE?=
 =?utf-8?B?YXF5REIyU01hd2Q2UmQ1eElIKzJacXhVK3dUWXg2bk9rUU1BZTFYZkk0SlpG?=
 =?utf-8?B?MmtwVmxQRHVwVVNCNWVaajF3R3Zqb3NGaVpYN2FIc0tmc2dPL3hUa2hKbjRU?=
 =?utf-8?B?cVZoN1BDcFI4bG82VjJMellXc3lDOVpBaEFNTzB5dm5VY2JMdCt1RDBZNy9K?=
 =?utf-8?B?aVRya25lR0pvc3V4aC91SlhBc25DRWFQRmVCZy9STjZqTzR6MTYyWW9RNHlr?=
 =?utf-8?B?NGV4cGdsTitQT0hKMklwdWZVbFVmeGRHQlFSZTFXdXM0K01BOEo2RDJXNDAw?=
 =?utf-8?B?c2F5YmowRlpVd0lJYkYxM0dPOVBpQW1hN2NDNytkS0lJcmwxRkVIVkk5YS9o?=
 =?utf-8?B?RlE1alMzaEpBY25oaFlZRUtDK2M3dWI4Qm9sczByZWNMMjgxa1VWL0FmUjFp?=
 =?utf-8?B?bTdoYU9UZ1d6aVBmYk02a3hjS3Y4WEZscjltR2JaWnRDNFExSDU5cjFNUW5j?=
 =?utf-8?B?c0hmL3Nzem05Qi9JQVA0bDFndlJWTjdUdGhFdkQ4ZnlwN1pJMW5jeGRPbW1s?=
 =?utf-8?B?eXEvWVdLNlVBZlV4dEtEQ2YzMTNENmtEenFUM1VpZ0tnSE5MZTlUcExvSXlH?=
 =?utf-8?B?U0tpNjA5Mlp0RjJjOCs0WEdubkZxc3d3Y2Ixbzg5Z0MrNlBkVFFWWmVqR3hM?=
 =?utf-8?B?ZkFmMTRpbitUcnBlUmVyaUNrMERuYVprdkJ2RWFVN0ZVNmVYekltY2g4bHFU?=
 =?utf-8?B?d3hZWHJtS1U4VVlVYll5eSttR3FqWWZQditScHJvZzdxek9oNTR5NWR0NjBv?=
 =?utf-8?B?cExuS0dYUkhGVmN5YU94N1owdEIwTzZiSWR1YjByYy8xVVZUQU5QZm9VcTln?=
 =?utf-8?B?WFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F5D20BDFCB3B1499260679A94FB246A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8da413-64a9-40cb-77a2-08dc1d716602
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 06:46:45.9242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2amo+oMsGjBQatF2MQoHoswAiJywn/eALUKlc02ujhkGzhsXDgZEFeQW2Ba/zuQH6DHJpNT+kFOFiVus3fT5Uegwb5WPmAcE/Ukgg87xYA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2789
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

SGksDQoNCkxlIDI0LzAxLzIwMjQgw6AgMDk6NDEsIHNhbWJhdCBnb3NvbiBhIMOpY3JpdMKgOg0K
PiAJDQo+IEhpLA0KPiBJJ3ZlIGp1c3QgdGVzdCBpdCBhbmQgZmluZCBiZWxvdyBjb2RlIG5vdCBw
cm9wZXIgaW4gZnVuY3Rpb24gDQo+ICJnZWxpY19kZXNjcl9wcmVwYXJlX3J4IiwgbGluZSAzOTgu
DQo+IGl0IGNhdXNlcyBlcnJvciBhcyBteSBhdHRhY2hlZCBmaWxlLg0KPiANCj4gZGVzY3ItPnNr
YiA9IG5ldGRldl9hbGxvY19za2IoKmNhcmQtPm5ldGRldiwgcnhfc2tiX3NpemUpOw0KPiBpZiAo
IWRlc2NyLT5za2IpIHsNCj4gZGVzY3ItPmh3X3JlZ3MucGF5bG9hZC5kZXZfYWRkciA9IDA7IC8q
IHRlbGwgRE1BQyBkb24ndCB0b3VjaCBtZW1vcnkgKi8NCj4gcmV0dXJuIC1FTk9NRU07DQo+IH0N
Cj4gZGVzY3ItPmh3X3JlZ3MuZG1hY19jbWRfc3RhdHVzID0gMDsNCj4gZGVzY3ItPmh3X3JlZ3Mu
cmVzdWx0X3NpemUgPSAwOw0KPiBkZXNjci0+aHdfcmVncy52YWxpZF9zaXplID0gMDsNCj4gZGVz
Y3ItPmh3X3JlZ3MuZGF0YV9lcnJvciA9IDA7DQo+IGRlc2NyLT5od19yZWdzLnBheWxvYWQuZGV2
X2FkZHIgPSAwOw0KPiBkZXNjci0+aHdfcmVncy5wYXlsb2FkLnNpemUgPSAwOw0KPiBkZXNjci0+
c2tiID0gTlVMTDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0tLS0+
bGluZSAzOTgNCj4gDQoNCkxvb2tzIGxpa2UgYSBjb3B5L3Bhc3RlIGVycm9yIGZyb20gZ2VsaWNf
ZGVzY3JfcmVsZWFzZV90eCgpIGluIGNvbW1pdCANCjNjZTRmOWMzZmJiMyAoIm5ldC9wczNfZ2Vs
aWNfbmV0OiBBZGQgZ2VsaWNfZGVzY3Igc3RydWN0dXJlcyIpLCB0aGUgDQp3aG9sZSBibG9jayBp
cyB3cm9uZyBJIGd1ZXNzLCBub3Qgb25seSB0aGUgZGVzY3ItPnNrYiA9IE5VTEw7DQoNCkdlb2Zm
LCBjYW4geW91IGZpeCBpdCA/DQoNCkNocmlzdG9waGUNCg==
