Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A2964E851
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 09:51:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYNB81QHSz3bg9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 19:51:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LUHwCDvz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.73; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LUHwCDvz;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2073.outbound.protection.outlook.com [40.107.9.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYN941CcVz3bSm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 19:50:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xarl9bhtRJVsZfhMPjzuCCnWm6cKJtFlj6oUD/ck3C6dc3t9zmO72eO8ZnNCEulMAtxXcFoQOKgyfZjGlTi6H6W49hNKCiBjb/Nt8PEyK0XOoleCq4aK6uSWHq8hLGouGhkiMB07T8CiZLiZVW7uE2b9PFV2IA0Z2qwviDdZlXznCWmAab8Mn2CjhrIWd7HAmOCXIM6C5njyadEsYJhttWE+tAIDspd8tZjI1RaQ61aNl62HTzhoYO3JniagsyCQahVitY/u6COJxpWizu9nXZ1RIlBDTe+UiqkbEYuZv5icHh+CVS1ddhh0/GuTQ64n3aX4b/wr4XXLFOS1KedPSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHHOcTHqsMbmyntcb7jGVlNr+yUfM7iwfLu2Usx60kU=;
 b=lgsqpUXOGHkqOmyPTCys/5thzdlvFWunMBPrgc6y++2V+pVDKgg5bVoh4Rp4+05/O7MmUSICwuj49oFGq3J2qKn37ZPaqICNY9TQ+DmzFDV5XaEbHZ1Zdt9oTmawRu9edE/iomOm1eF4EjJx3YmehD5v65dEt1b4BuVwXX2TQ5xJEFpC7gaM9KlxSkawdxy7oFwMVN8klh4q58mOLynaGC+MTW+UCgb9lsYfaIx6ukYHwnOlbXeS1ZgMGyA8fehBcVCkxuzavG7eil4Rb5UaGrCZpkxr2l3VA1eSjTDSidLBelh93y5CbcI3HJmvyqbxuDx/MB2SNT9/O/SCo3XTKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHHOcTHqsMbmyntcb7jGVlNr+yUfM7iwfLu2Usx60kU=;
 b=LUHwCDvzFs6sfldPDN7is18XKgrRIp69f3ZVwegQC3B/W38+45qnTAnQe97wyWH83Q2lNvBePNkYv2eVfxuQwgdqgurziBHBL6ZU6DU2/IuClWtPaiW7UocgFvxoNBgoVqZQw0/AUkF2akuQU4+Nje4vchEbkEXuFv+2hO3qSjRWYd6Z53PnsjuOXkrFZYOfED718jud9425BZl5al+0BAtQbQ9n4Ofsyh0e106Qlj9BRITUNk7zH5NnW34Oixvl7fJVaYQOOP6U0ZyYB9if3KCb/qSh2GMOznU4E915YKOPWwhMqaNrVie5asn/HwABdg8Z+AspCHZ2l1lT85rzKQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB1769.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:168::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Fri, 16 Dec
 2022 08:50:10 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::8e8b:856e:12eb:ff9d%7]) with mapi id 15.20.5880.021; Fri, 16 Dec 2022
 08:50:10 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] powerpc: Pass correct CPU reference to assembler
Thread-Topic: [PATCH] powerpc: Pass correct CPU reference to assembler
Thread-Index: AQHZERtuSiLjtnU5uEO3Vstu+PLAHq5wKKaAgAAIzgCAAAMigA==
Date: Fri, 16 Dec 2022 08:50:09 +0000
Message-ID: <88d5fe52-2390-f29b-d3fa-aed773416130@csgroup.eu>
References:  <176b0f41a8b9e9f1191bf2b8857d121887c4fbe5.1671171965.git.christophe.leroy@csgroup.eu>
 <202212161638.VBZyfyMO-lkp@intel.com>
 <20221216083856.rla4sfga2akjxno6@lug-owl.de>
In-Reply-To: <20221216083856.rla4sfga2akjxno6@lug-owl.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB1769:EE_
x-ms-office365-filtering-correlation-id: 80f7bae8-bfae-4866-c0de-08dadf4289de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NcHzBvQdLJUbSuNBK+px9+wmu6rM2wvh889Bt3WZAmhj6HzJuyb79ieTlEFxoepX9xv1jIPjk0LwGNxF9Rl4Mr/gaOIqwTGLshyGNaZYrB5Ow00kh+GVfNAvTAVhPqRUo+Y2nPgUZACrRsszA8WFWgxQ5Pt9+Hv6WukomjIzo2Op1aCk+2/K0oHkQCZXRdL+KAbDTQolBVw808bopzIDfQ1TCunewR6X6m0UFWO8mzOUbpNcB/0uT/0a3FMqZhziJNNM1hKQZiVEcmNpkW8V4MvVKxKb4qrl7o9cFMT3YOK0YNI8cotooFwcujPeNrMP9dlGhT93CJbTu5JhpQ9sW2lGTbXyQaLtv5W7Tw6W9FM7YA+99pOg5Ipb2pbjamvUkd6aUU3zHtMJk6Nkg04dYHzk5tUdvrYniRMpH7LGGMyWADE7v6sL/YzeBpzPrk5P73w3/AmugsBUJQMLYtjEy7TO1o0Im40khv54AvgvT3twAUP52RnMKD4RKqInsQK6xpE1148mBJZgmnwhm+6ceuiNX2wDq71W94UItEdNFGZiz72SwO3E26DIa0lj9EvXatCNnZ9U7+wMUYenTcHhabQwDr8RH8r4GrEnFJAGlBmWAST64g6QNgL3qKT+aitGXraeM0ZYAFQ1JfJzKK3pRJvoCR9x3lcsUnm9ch0tWcSPU+GwEX2DJE5r8tNzFZT7VivTjVcIsGNC0qNiaWpfksN4Eufcc/GJ4b+3oqxoEQ8E8CptqI/WB0OJ3LrJRY4sbQAlNKABX0ES8XlWhCoL0ZtV7qXdbOHTDuloXzxwoTG6x+YH52qnxVHaUZL0Tnjb
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199015)(36756003)(38070700005)(2906002)(8936002)(41300700001)(5660300002)(4001150100001)(83380400001)(122000001)(38100700002)(86362001)(31696002)(31686004)(54906003)(478600001)(6486002)(966005)(110136005)(71200400001)(44832011)(76116006)(4326008)(26005)(91956017)(64756008)(316002)(2616005)(66556008)(66446008)(66946007)(6506007)(66476007)(8676002)(186003)(6512007)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?M2FQZjZnbHBsMnR0YXRFODdsYWp6SlBkYXdyTGl1VUVNUnk4STFTcldibmRD?=
 =?utf-8?B?bFFXS2NUbSsvdGxJa1daZWM5cmdlbzJVbmd4em1xVVgrVktGbUowbTJmYWhJ?=
 =?utf-8?B?K1pSRks1Q0dtR3BRajF1WlZiOGQ4YWZqdGR1NmRMQ1orcktXWjIvQkhMUTVG?=
 =?utf-8?B?U2FHVTkxeGQrWWdWSFdCc2k5aTVYV2xjazNxeEEzNWhBME5zS0lMR0lkNjRJ?=
 =?utf-8?B?YWF3U3d5Q3JxZ1NxNVJBazM3b0hodUFORUFodVBDSU9WOU9WUTB4U1NGUHU4?=
 =?utf-8?B?L0JKSzBNQVJNYlQ2d0dCcU1lYVRWaXBxUDh1WkdXU2lzYTh2RGRocTQ5TVdM?=
 =?utf-8?B?OHdGeUI1TGpnMG4zcU1iSXdVWThaQVFJNFBRZXhRdlBXS3ZLWUFuTDdRMGgz?=
 =?utf-8?B?U1hMdEMxWHNJMHJQVFJRT0kvNW1veEJvYkxWaXJ3OFJMa0hvUmtmSnZNNVZI?=
 =?utf-8?B?ZGRleS9vQk9RSVNCVmxDWlh4U3A2WjJ4R3h1U0lUUjgyZFNtZ1JENkVKalZw?=
 =?utf-8?B?SzhMWUV3V2FxaFlic1pmanltZG5pK0ltdGl4UCt5M0kwMUNCT0t3SDhiOFpD?=
 =?utf-8?B?TlJqOE1ULzkzNm5EckI0ckp2aUZvUnlSTkl6QlJVdlBwNXNrZ0ZQTFhUNFl0?=
 =?utf-8?B?QUxnR2wyTWs2dzNrcHFLWVNkYkJ6T1BqdWM4NEVmL0NLRTE4MmZWTVVYUitn?=
 =?utf-8?B?WjQrNkRVRnppblFSakpObWhyeVVjSEEvUThrTWZ4NXdNaWVEODNtd3pIakoz?=
 =?utf-8?B?YldQc2wrczhTeGx2S214TU1IQ25ScytzV1VyZmxTbVRkT1JUMVd6WTVTOG1N?=
 =?utf-8?B?SVoxZVlSQXEyWnV6VWIzcmZXVWd4Tmh6L0dMek42SFRYQXVJOUp4V3pkWm1s?=
 =?utf-8?B?TW9WWG9PV3NCS2pBdEJidmU5aDk2MURKZTJPSDJWNTJ0cFB0TkRKSnoxaUhu?=
 =?utf-8?B?NXVZM25meHBqTkxrMUs1c3p5Lzk0THB2R0xHeUlkV2FWdldHUmVxOUNZM2Zi?=
 =?utf-8?B?VFgwSWhtM3FVN0QrZzZ0RFN0bzNsdVZxdVFzeVg0RS9CNHBXU0JjUVB3NlhG?=
 =?utf-8?B?clc5cFhMKytUaDBzK0R6L3RmNWdCelZRNkVaVjRVMTJ5MkZkY2lPKzcvYjhW?=
 =?utf-8?B?NEorSTJteFU2bnZnRDJTcWNKTVJYZFhudmcwbHZEYjRaYjF2ZTBSNGFCdE54?=
 =?utf-8?B?cWF6Smkrdk53ajRUeG5QT0RuMW1PamJ4NVFhVUcwdDA4dFJma1B1VGk5THhs?=
 =?utf-8?B?ZzNRRVRsSEVSeDJ2Ukk0QVhER0lOeG5aL3hHaWxmVFg3bEptaVFhdmlUV2NJ?=
 =?utf-8?B?aFhpY1JKYTNwUU1XUW1tOW5jSVVMbGZIYkYrQ1RFYTJEMHkzY3E5NXNrdVZj?=
 =?utf-8?B?ZXNOaGhPN3YxQWRwR0dxZ2FaRU0zVGI1dWZocW1BcUttSkJRSk1vM010elVQ?=
 =?utf-8?B?NlUzOWhoaC9kZ05UQm1ZSStOczNvZVFENmt2TWJjR0ZiMksvaXhUdkpZdWoz?=
 =?utf-8?B?WnB6N2dFNlE4a0dzNG5Sa3lZcUdVOFdZOEJCUmw5ZjZMenJtUUhlWGduUHJo?=
 =?utf-8?B?cHJKbjhPcTZwY3JuWUlYTVFXeVNIOGI0UXdvajRjdFB5RndLWDkwYTVZbEdK?=
 =?utf-8?B?VTRxTmJYS1NMM1MrMEIyQklPMGIwamZOQ3FPeVlsODVTRDJtZEJ5S2IxcDVs?=
 =?utf-8?B?KzBuMUo5NmxHT3l4NDRERmhwb293NndGRm9XODJIUVQzblNsU21VTGxYdkly?=
 =?utf-8?B?REtnOHpIcndVeHFWZldmOVNpdVFENXBDblhvNThwNjltWUovb0NrRGtpdWlk?=
 =?utf-8?B?T2xXa0hpU2ZYUmVDZGNiTitZVUN6c2kyREVNaElpelZGMHZnYXhlU0NLYlVK?=
 =?utf-8?B?dEs2dWFrUTZ6VUNIZUJ5VjdDV2dPNlRDY0swakRaaHY5MGtLcTJ5NkxHV09t?=
 =?utf-8?B?V21UNzJxRk9hYUE0THEvTW92MHMvUlI5Tzk5SVlNeHU1eUFxbHk1YU91KzFi?=
 =?utf-8?B?MkhxbWd2NW5oc2dNNUIyQzJ3NmltVlMvbXNOdk00WTVsUkFaa0g4b1ZrcktY?=
 =?utf-8?B?MDNxeU1GWnJGWHBEY25SK0wzbjFXTHBhcGlHSC9heEYwa0lRblkwaHFHeElz?=
 =?utf-8?B?SWZQUldIQ2JoWlNhVnh3UXMzeDQ4c25rTldaVGhUV0NIdW9qc0YrcnZ3elJC?=
 =?utf-8?B?emc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76DD40F0065F9F49B0F4BD45738C31F7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f7bae8-bfae-4866-c0de-08dadf4289de
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2022 08:50:10.0102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B493//h9ltyix5LhIcqGHyhzB8I52A6y1eOGHpdzSJ9zn7mCWpWa41k+fL8Fv68hhOIFNStANXj2GTHXPIiaUISJhSCIkQMYJRd8pW3k0mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1769
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE2LzEyLzIwMjIgw6AgMDk6MzgsIEphbi1CZW5lZGljdCBHbGF3IGEgw6ljcml0wqA6
DQo+IE9uIEZyaSwgMjAyMi0xMi0xNiAxNjowNzoyNSArMDgwMCwga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+IHdyb3RlOg0KPj4gSGkgQ2hyaXN0b3BoZSwNCj4+DQo+PiBJIGxvdmUg
eW91ciBwYXRjaCEgWWV0IHNvbWV0aGluZyB0byBpbXByb3ZlOg0KPiANCj4gWy4uLl0NCj4gDQo+
PiBJZiB5b3UgZml4IHRoZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnIHdoZXJlIGFw
cGxpY2FibGUNCj4+IHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwu
Y29tPg0KPj4NCj4+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToNCj4+DQo+
PiAgICAgQXNzZW1ibGVyIG1lc3NhZ2VzOg0KPj4+PiBFcnJvcjogaW52YWxpZCBzd2l0Y2ggLW1w
b3dlcnBjDQo+Pj4+IEVycm9yOiB1bnJlY29nbml6ZWQgb3B0aW9uIC1tcG93ZXJwYw0KPj4gICAg
IG1ha2VbMl06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNTA6IHNjcmlwdHMvbW9kL2Vt
cHR5Lm9dIEVycm9yIDINCj4+ICAgICBtYWtlWzJdOiBUYXJnZXQgJ3NjcmlwdHMvbW9kLycgbm90
IHJlbWFkZSBiZWNhdXNlIG9mIGVycm9ycy4NCj4+ICAgICBtYWtlWzFdOiAqKiogW01ha2VmaWxl
OjEyNzE6IHByZXBhcmUwXSBFcnJvciAyDQo+PiAgICAgbWFrZVsxXTogVGFyZ2V0ICdwcmVwYXJl
JyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPj4gICAgIG1ha2U6ICoqKiBbTWFrZWZp
bGU6MjMxOiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+PiAgICAgbWFrZTogVGFyZ2V0ICdwcmVwYXJl
JyBub3QgcmVtYWRlIGJlY2F1c2Ugb2YgZXJyb3JzLg0KPiANCj4gSSBzZWUgc2ltaWxhciBmYWls
dXJlcyBmb3IgbWFueS9tb3N0IChhYm91dCA0LzUgb2YgdGhlbSkgZGVmY29uZmlncy4NCj4gTmVl
ZHMgc29tZSBtb3JlIHRlc3RpbmcsIGJ1dCBJIGFsc28gdGhpbmsgdGhhdCdzIHRoZSByb3V0ZSB0
byBnby4gOikNCg0KSW4gZmFjdCBmb3IgbW9zdCBDUFVzIHdlIGNhbiBkbyAtbWNwdT1YWFggYW5k
IC1XYSwtbVhYWA0KQnV0IGZvciB0aGUgc3BlY2lhbCBjYXNlIG9mIC1tY3B1PXBvd2VycGMsIGl0
IGlzIC1XYSwtbXBwYy4NCg0KSSBzZW50IHYyIGEgZmV3IG1pbnV0ZXMgYWdvLg0KDQo+IA0KPiAg
ICBJSVJDIHRoZXJlIHdhcyBhbm90aGVyIHBhdGNoIG1lbnRpb25lZCB0aGF0IG5lZWRzIHRvIGJl
IGFwcGxpZWQgYXMNCj4gd2VsbCwgbWF5YmUgdGhhdCdzIGFscmVhZHkgdGhlIG5lZWRlZCBmaXgg
YWxvbmcgd2l0aCB0aGlzIG9uZT8NCj4gDQoNClRoZSBvdGhlciBwYXRjaCBpcyBuZWVkZWQgZm9y
IHBwYzY0ZV9kZWZjb25maWcsIGl0IGlzIGF0IA0KaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8zZmQ2MGMyZDhhMjg2NjhhNDJiNzY2YjE4MzYy
YTUyNmVmNDdlNzU3LjE2NzA0MjAyODEuZ2l0LmNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldS8N
Cg0KDQo=
