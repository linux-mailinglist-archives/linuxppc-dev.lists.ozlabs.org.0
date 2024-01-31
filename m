Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41559843EF7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 12:59:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mZUrJJhb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQ0tr1BkTz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 22:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=mZUrJJhb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::601; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQ0t62460z3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 22:58:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hW+bpMQBpBxkXb1F7av+CVjiqYQwHLWjIbAoIMYo01Xv0l/910C4k4r27VpMtx9OwCJl8F2R4RGv5835v6oPaDoflBRz/C1OfYlZjRv3ohwK4W7yfXaISm7wtcH3fWUidRV6mnBYjRpghkPc2Ar/vA8qQ3oo1yMRfC3D7ynQYVR6JygEI3fEP8O7GL47KarYeH53CeUa2rTXT6e8Y0HjEio3cj6KGz+e8go3OtjKAVlzw6k6vZCM2WULChd2lOM9ClS4NnRZWBrhiy8S+ap2KpAtUSWY6gaDTOTwx0bU4sJucwnEOq/eKM/QvD16+/3qsHenadCHoEgoBUpWQowMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Am9qdg1aMVlOzvPJvupSQq1yR3s8KJzdYOuuU9PcG2I=;
 b=Od0F30hrywRQgLLBdV/yh6lINPIxAMGIdBw2LTcdoLjI6mI066joMyfNqi2M/HY8BtJMV6dIw3c1mLeE1E9bGC3DuvxG95QP1skl6jE8t5j7ToPx3c1eL0h1qMXVtthME5fqW9hAoucf9nn2WIZI/rEGK6YTt4fxUarR8OTh6js+2p1/6E1xvxw571HV0e8z8Rq94rg18w+Q4TGPD6SJ4YqlY7PHoEfMsMFEXpa2DRjOJaf2SViqMWFruejlLTuK/uuk1fy2H30+dPhJRm/gya5FVAkmNnoMBQgBZXDtLX+9aJl4M2EyFih5PVCYUSEpRbmVzdDk7a2TmKnwqCmf0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Am9qdg1aMVlOzvPJvupSQq1yR3s8KJzdYOuuU9PcG2I=;
 b=mZUrJJhbEYCSpYwZo1K5MzRerAzsgCaBP2gisbzvddsWrWpXuNE5FOJCAR0Jd6GC3KId0vdt4o6tErK5ZPFcFGhfOerq+9AnnZB/KG5euNBRvkM01Z0ctt6vZQL7tE1XDle3xikdFFrjecLMMaZQvX51muRMOVb/g65RGSIVbrlSGfnL2u9KZ1NrtNDDI0qS7NCJrZivJQ+lnQHqivpdLyP2dJZSSw1KDxN8VmBD7UMvyuFE0ThnbzXqSKeseyWHWQY/sDisT7Cy8nNGRsI0c4MbHOGN7oNxvI5mqIyTxd2R0UdSEgPRJNxSNQOZZxXCJELg5YC94mohVaKKBI4AQQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3289.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:110::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Wed, 31 Jan
 2024 11:58:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::9f77:c0ff:cd22:ae96%4]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 11:58:00 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai
	<wenst@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Topic: [PATCH 1/3] init: Declare rodata_enabled and mark_rodata_ro() at
 all time
Thread-Index: AQHaM+yXNPEoBBWgvUqc5dink/c7D7DxdmEAgADbxgCAAB3agIAAcSGAgAEwfgA=
Date: Wed, 31 Jan 2024 11:58:00 +0000
Message-ID: <46627d92-976a-4126-b261-a4c6575e5a3e@csgroup.eu>
References:  <7b5df1782e94a755b4a18733af44d17d8dd8b37b.1703149011.git.christophe.leroy@csgroup.eu>
 <ZbgGDlgrLhB8tcGI@bombadil.infradead.org>
 <20240130091626.GA3684878@google.com>
 <9e298fa7-a953-462a-96a4-56a1b4316a17@csgroup.eu>
 <CGME20240130174812eucas1p166f62549457fd188fed6ed72b6b4b9cd@eucas1p1.samsung.com>
 <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
In-Reply-To: <30ddedc9-0829-4a99-9cb1-39190937981c@samsung.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB3289:EE_
x-ms-office365-filtering-correlation-id: 63a971bd-f746-41e4-64a5-08dc2253df9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DZid39y5WHHNlEtHWHxfazP5UtfFZydawTsqDmI77T/Q6Nuf/5tLUsaKHIA4RTh7BqQC7MehUACgLqlIXdQEtv3XzY34t1iRY1ByG7kCgrnvEjxr2z+dfEShA0pZBSVZLbiUAFd7X1Uva9sqLhYQDFra8RwAdMD8WeiZWpFJ4cPBrtTsex6+lCWGW5zbSZ3slSuFmk6dg8wN70JHZF8nF5/U7m/Pix30EthP19eNuuuppYmE0c8YB/dVMMn83DtAoOF6G93yY3UOnb4uOSxCa5Dhi9+ULvxLZrhrorM5n6wHKZDa92AnLP5s66RX3o+/8BkNf7w/Ha/ogxLivFObH1Ta2pPZL78TVU17RhzJme1yn/E6TW2tIT8kOLizeHD32maRbongyD7mtm4eIsZM0SFIRkaHzoxIRKSJ+3/wgHHV2pX0/UvipApcjp0DAoIXF7B5Q2H9GIHP3BP9xU+8BEFu1xHmbKaZ9B20exmYFrmyupGDZMLu7PqwqDUqVIlTVbYhy0yI9z+c9RWEYP+MvtIKNLt8ahF8bpzBAtrnXOqyzZErwHiP1j97aWCk/Ta83k500hy7HsuMJhkS1wcQdfWaYxc2tUOqmJcv/6cQE0LCKVHN+iOCMZeojK4w1W+987EbmQ3ha98gTl9H/WTOKnUGi3Lw9WWVqAlCsW+9B3F2hz8hSNF5whzObsuD+Vbz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39850400004)(346002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6506007)(53546011)(4326008)(44832011)(8676002)(8936002)(6486002)(966005)(6512007)(38100700002)(110136005)(2616005)(31686004)(66946007)(5660300002)(316002)(2906002)(76116006)(66556008)(66446008)(64756008)(54906003)(122000001)(66476007)(71200400001)(66574015)(83380400001)(31696002)(36756003)(26005)(38070700009)(478600001)(86362001)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?RFFoMG1PZTlnY3F6YzI5QUEya1JCcWRaRERZb3cxcmJjeHBlVWxudUhOeW9K?=
 =?utf-8?B?b2pIdWxTM3gvSzRrbllLb0N2bnNhMUNrRXJvSzFYblB4WnozVGMycHVCcjNa?=
 =?utf-8?B?VHlmK2RQVkl3YzNpNmk0d2lrb2R0T1V3YXBIMUNKeldycW9hSHgyRDIxYXky?=
 =?utf-8?B?ejlFUS83WGVTL3NoSzZud0dTTHdYRGUrOXRZNDRML251QllxZ0JzYzdsZ0Nz?=
 =?utf-8?B?cFd1dWpEVTJrTzFwMDFXWUcyTGhlN2xLYnVENUJCNU1qYzJFdUFESGlKb0JQ?=
 =?utf-8?B?NElMNW5nZjlQNE53L051VFMzcU5rTXE0TDdBYU1RSlhBSU5pWFA1UEl1T1l4?=
 =?utf-8?B?MlZ6YTlRVDloZFlFUjIxSFBVb0p5QTJZYm5vd3lGbW14b2VEVUFTR1VsOWY4?=
 =?utf-8?B?emlRWUNiNFI4T0JrRmpLTEZTbDFxNnIwbi9lRkVWNFNqZTF1SmlOY1ZCYkNu?=
 =?utf-8?B?WUYrL1A3VHJ3cXBQeFJNRWdCM2tyb3p1T0thMlpwc3NKeGJ5ZGs5MUsvRWtG?=
 =?utf-8?B?WVNQVjRJMWhYbUlOeDFDcVFEVXYyTjlrRVJGeGZPZ2didTVwRVc1alNOODFH?=
 =?utf-8?B?cUh2Q3htaHdveWZuRDFSK2Z5SzZwbmVNRUZMazZOSVJ3TllaNXNtek9nOEVs?=
 =?utf-8?B?QWVwYkh6bXk3Y1pqTU40RHR1YURGSDNFZ3ZnVjlDUUx0UllWQkowbjQ0NDZG?=
 =?utf-8?B?TUdzMzhYU1p1WEJlVU5CZXVtYlBIb1diZkMrSC9qZy9jVUN2Y0lpWDRtaktY?=
 =?utf-8?B?UFM1RU9XRVdCTytSSVhoSWN1VXQvdS9NYTlSUHdTTEEyeE4rYVJQRmV0SVQy?=
 =?utf-8?B?ZU5VM0o4aDdvak45VW84YW5TVHJ6cXN6dFVROGNrT0hvQ3FHSGNidFdkWTlK?=
 =?utf-8?B?M3o5cW5TSktabmJpLzhTZTFZOWpHRE1yL3NQdnduaElydk54L1Y4UFJMbGFv?=
 =?utf-8?B?bFRWYXQ4VmVQemh3VDMvOTNpb3Vja2VlYTZwbTRHR0RMRHliNmVyaHFZOTNh?=
 =?utf-8?B?RVR5WDVRRmNHSmo3djJBd0hRR0FLbmNoNkNkSUptWUhQeXdtZFEwK2pjUlZq?=
 =?utf-8?B?ejNpTTJITVM2WDdJdUZBTWV5YkJSNk40bnNrNkQvM3B6RkM5azAzNTYrL3pZ?=
 =?utf-8?B?VHRET0cyc1JmWXZYcTRHcHNIc09TRHV6QkZpSkhROXdFby9Ha2ZEaG1KNmU1?=
 =?utf-8?B?ZWhJeS9aZHRibkJ2UnBLSm13MWVQc1BvR1pITnk1RjZCRXo2em9rRXFhRU1N?=
 =?utf-8?B?bml4TlZyT2lyQWw1cHlrMzQrc2E5QnVoSzJvZmgzRXhVVW1lTmd4Z2l6ZE1W?=
 =?utf-8?B?WWtSK0NVWEthSlE0RnBkNm5nYVVISytNUHNsQkt6RC9YQjFOR2NYVXkxSGxZ?=
 =?utf-8?B?SXVQTnNKbk9uanVnQzk3RDVaR1NvSEVvd2pxaEZGYjRwbzRsOXV2TFVmL3dB?=
 =?utf-8?B?TVR5M2o0QWJrMS9ZQ0VHM2tWK0M2RHZ1bkNVaTlxUEc0cHMrL0w0dWdQUHY4?=
 =?utf-8?B?WHVnM05wL1NMS3JCcFVDVlBvSUpNcy9BdVZzb0hvOHBvblF5T1p4UDFjRXIw?=
 =?utf-8?B?MTV6anV4bSs3aFh4Zkx3ZlVHSXp0Z01aS3dCNUhXNGxLTWZnemp6RUh5NWs3?=
 =?utf-8?B?L2FxTnlDMkN0MTduZ2h6SGFvSTZHQ1B1SVF4cjlxMWtkUlozMHdIQTVRa0JU?=
 =?utf-8?B?aE5nRlBXRUhWQ2xrMGFlS0xWUnA3aldnVU8yYVlwVjhrb1cyREVpalhBSkYz?=
 =?utf-8?B?dWdHTERXSmF2S1RkZ2haY2p6NmZlMmozcUF3WnF1WUlTOEgraU54RkhaVnZn?=
 =?utf-8?B?OGJhTFovSUdVZDl4bFJHWWlpVS9TWFVBc2RRUUVFR0JoRVdzYm5BbFdONHpv?=
 =?utf-8?B?ZHFWZEJvdEpXZ2I5OXVTRnR2TFVCeDB4cVB6cU4rODJCMWR0NlFxTjFxdWlL?=
 =?utf-8?B?VTluSzhiZng3SzNtdWZodk1iLzQ0VXNxNXYyRnQzMnFtbzJpUXc2NkppVkRl?=
 =?utf-8?B?dS8xL3Nod3ZlNFp6L0Z4VkIvTGlLV3Y3MmtrNndxeUJrYW5Cc0JOek84YUZ1?=
 =?utf-8?B?c3pDT1FxQWJ2M1gxem1rMG1KQm9TU2E2YzBUQWpxNnc0bE1FZDA3QWVKazl4?=
 =?utf-8?Q?kw+8fmAQRf1FgG5R8pZt8KIZJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <55329A14A323C9488E13C1811A3257B3@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a971bd-f746-41e4-64a5-08dc2253df9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2024 11:58:00.8731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SV3uxmVQrowVSIAys3/auhqlEZ2idEwcatHQ/AecS1God3pQizDkwX2hBO0j/J7BGe7RkldOQMTDrbn+FnvwlMwOHMM2fVbO6zRBid8Yl8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3289
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
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDMwLzAxLzIwMjQgw6AgMTg6NDgsIE1hcmVrIFN6eXByb3dza2kgYSDDqWNyaXTC
oDoNCj4gW1ZvdXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgbS5zenlw
cm93c2tpQHNhbXN1bmcuY29tLiBEw6ljb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFu
dCDDoCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiAN
Cj4gRGVhciBBbGwsDQo+IA0KPiBPbiAzMC4wMS4yMDI0IDEyOjAzLCBDaHJpc3RvcGhlIExlcm95
IHdyb3RlOg0KPj4gTGUgMzAvMDEvMjAyNCDDoCAxMDoxNiwgQ2hlbi1ZdSBUc2FpIGEgw6ljcml0
IDoNCj4+PiBbVm91cyBuZSByZWNldmV6IHBhcyBzb3V2ZW50IGRlIGNvdXJyaWVycyBkZSB3ZW5z
dEBjaHJvbWl1bS5vcmcuIEQ/Y291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgPyBo
dHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPj4+DQo+Pj4g
T24gTW9uLCBKYW4gMjksIDIwMjQgYXQgMTI6MDk6NTBQTSAtMDgwMCwgTHVpcyBDaGFtYmVybGFp
biB3cm90ZToNCj4+Pj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6MDI6NDZBTSArMDEwMCwg
Q2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4+Pj4+IERlY2xhcmluZyByb2RhdGFfZW5hYmxlZCBh
bmQgbWFya19yb2RhdGFfcm8oKSBhdCBhbGwgdGltZQ0KPj4+Pj4gaGVscHMgcmVtb3ZpbmcgcmVs
YXRlZCAjaWZkZWZlcnkgaW4gQyBmaWxlcy4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4+IFZlcnkg
bmljZSBjbGVhbnVwLCB0aGFua3MhLCBhcHBsaWVkIGFuZCBwdXNoZWQNCj4+Pj4NCj4+Pj4gICAg
ICBMdWlzDQo+Pj4gT24gbmV4dC0yMDI0MDEzMCwgd2hpY2ggaGFzIHlvdXIgbW9kdWxlcy1uZXh0
IGJyYW5jaCwgYW5kIHRodXMgdGhpcw0KPj4+IHNlcmllcyBhbmQgdGhlIG90aGVyICJtb2R1bGU6
IFVzZSBzZXRfbWVtb3J5X3JveCgpIiBzZXJpZXMgYXBwbGllZCwNCj4+PiBteSBrZXJuZWwgY3Jh
c2hlcyBpbiBzb21lIHZlcnkgd2VpcmQgd2F5LiBSZXZlcnRpbmcgeW91ciBicmFuY2gNCj4+PiBt
YWtlcyB0aGUgY3Jhc2ggZ28gYXdheS4NCj4+Pg0KPj4+IEkgdGhvdWdodCBJJ2QgcmVwb3J0IGl0
IHJpZ2h0IGF3YXkuIE1heWJlIHlvdSBmb2xrcyB3b3VsZCBrbm93IHdoYXQncw0KPj4+IGhhcHBl
bmluZyBoZXJlPyBUaGlzIGlzIG9uIGFybTY0Lg0KPj4gVGhhdCdzIHN0cmFuZ2UsIGl0IHNlZW1z
IHRvIGJ1ZyBpbiBtb2R1bGVfYnVnX2ZpbmFsaXplKCkgd2hpY2ggaXMNCj4+IF9iZWZvcmVfIGNh
bGxzIHRvIG1vZHVsZV9lbmFibGVfcm8oKSBhbmQgc3VjaC4NCj4+DQo+PiBDYW4geW91IHRyeSB0
byByZXZlcnQgdGhlIDYgcGF0Y2hlcyBvbmUgYnkgb25lIHRvIHNlZSB3aGljaCBvbmUNCj4+IGlu
dHJvZHVjZXMgdGhlIHByb2JsZW0gPw0KPj4NCj4+IEluIHJlYWxpdHksIG9ubHkgcGF0Y2ggNjc3
YmZiOWRiOGEzIHJlYWxseSBjaGFuZ2UgdGhpbmdzLiBPdGhlciBvbmVzIGFyZQ0KPj4gbW9yZSBv
biBsZXNzIG9ubHkgY2xlYW51cC4NCj4gDQo+IEkndmUgYWxzbyBydW4gaW50byB0aGlzIGlzc3Vl
IHdpdGggdG9kYXkncyAoMjAyNDAxMzApIGxpbnV4LW5leHQgb24gbXkNCj4gdGVzdCBmYXJtLiBU
aGUgaXNzdWUgaXMgbm90IGZ1bGx5IHJlcHJvZHVjaWJsZSwgc28gaXQgd2FzIGEgYml0IGhhcmQg
dG8NCj4gYmlzZWN0IGl0IGF1dG9tYXRpY2FsbHkuIEkndmUgc3BlbnQgc29tZSB0aW1lIG9uIG1h
bnVhbCB0ZXN0aW5nIGFuZCBpdA0KPiBsb29rcyB0aGF0IHJldmVydGluZyB0aGUgZm9sbG93aW5n
IDIgY29tbWl0cyBvbiB0b3Agb2YgbGludXgtbmV4dCBmaXhlcw0KPiB0aGUgcHJvYmxlbToNCj4g
DQo+IDY1OTI5ODg0Zjg2OCAoIm1vZHVsZXM6IFJlbW92ZSAjaWZkZWYgQ09ORklHX1NUUklDVF9N
T0RVTEVfUldYIGFyb3VuZA0KPiByb2RhdGFfZW5hYmxlZCIpDQo+IDY3N2JmYjlkYjhhMyAoIm1v
ZHVsZTogRG9uJ3QgaWdub3JlIGVycm9ycyBmcm9tIHNldF9tZW1vcnlfWFgoKSIpDQo+IA0KPiBU
aGlzIGluIGZhY3QgbWVhbnMgdGhhdCBjb21taXQgNjc3YmZiOWRiOGEzIGlzIHJlc3BvbnNpYmxl
IGZvciB0aGlzDQo+IHJlZ3Jlc3Npb24sIGFzIDY1OTI5ODg0Zjg2OCBoYXMgdG8gYmUgcmV2ZXJ0
ZWQgb25seSBiZWNhdXNlIHRoZSBsYXR0ZXINCj4gZGVwZW5kcyBvbiBpdC4gTGV0IG1lIGtub3cg
d2hhdCBJIGNhbiBkbyB0byBoZWxwIGRlYnVnZ2luZyB0aGlzIGlzc3VlLg0KPiANCg0KVGhhbmtz
IGZvciB0aGUgYmlzZWN0LiBJIHN1c3BlY3QgeW91IGhpdCBvbmUgb2YgdGhlIGVycm9ycyBhbmQg
c29tZXRoaW5nIA0KZ29lcyB3cm9uZyBpbiB0aGUgZXJyb3IgcGF0aC4NCg0KVG8gY29uZmlybSB0
aGlzIGFzc3VtcHRpb24sIGNvdWxkIHlvdSB0cnkgd2l0aCB0aGUgZm9sbG93aW5nIGNoYW5nZSBv
biANCnRvcCBvZiBldmVyeXRoaW5nID8NCg0KZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUvc3Ry
aWN0X3J3eC5jIGIva2VybmVsL21vZHVsZS9zdHJpY3Rfcnd4LmMNCmluZGV4IGExNGRmOTY1NWRi
ZS4uZmRmODQ4NDE1NGRkIDEwMDY0NA0KLS0tIGEva2VybmVsL21vZHVsZS9zdHJpY3Rfcnd4LmMN
CisrKyBiL2tlcm5lbC9tb2R1bGUvc3RyaWN0X3J3eC5jDQpAQCAtMTUsOSArMTUsMTIgQEAgc3Rh
dGljIGludCBtb2R1bGVfc2V0X21lbW9yeShjb25zdCBzdHJ1Y3QgbW9kdWxlIA0KKm1vZCwgZW51
bSBtb2RfbWVtX3R5cGUgdHlwZSwNCiAgCQkJICAgICAgaW50ICgqc2V0X21lbW9yeSkodW5zaWdu
ZWQgbG9uZyBzdGFydCwgaW50IG51bV9wYWdlcykpDQogIHsNCiAgCWNvbnN0IHN0cnVjdCBtb2R1
bGVfbWVtb3J5ICptb2RfbWVtID0gJm1vZC0+bWVtW3R5cGVdOw0KKwlpbnQgZXJyOw0KDQogIAlz
ZXRfdm1fZmx1c2hfcmVzZXRfcGVybXMobW9kX21lbS0+YmFzZSk7DQotCXJldHVybiBzZXRfbWVt
b3J5KCh1bnNpZ25lZCBsb25nKW1vZF9tZW0tPmJhc2UsIG1vZF9tZW0tPnNpemUgPj4gDQpQQUdF
X1NISUZUKTsNCisJZXJyID0gc2V0X21lbW9yeSgodW5zaWduZWQgbG9uZyltb2RfbWVtLT5iYXNl
LCBtb2RfbWVtLT5zaXplID4+IA0KUEFHRV9TSElGVCk7DQorCVdBUk4oZXJyLCAibW9kdWxlX3Nl
dF9tZW1vcnkoJWQsICVweCwgJXgpIHJldHVybmVkICVkXG4iLCB0eXBlLCANCm1vZF9tZW0tPmJh
c2UsIG1vZF9tZW0tPnNpemUsIGVycik7DQorCXJldHVybiBlcnI7DQogIH0NCg0KICAvKg0KDQoN
ClRoYW5rcyBmb3IgeW91ciBoZWxwDQpDaHJpc3RvcGhlDQo=
