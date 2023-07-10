Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE074DB77
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:48:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AvDHVDU3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R091Z5TYYz3bpN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AvDHVDU3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::609; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R09010xQfz3bpK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:47:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DLID1r3l+wOCIMqIhBj1v2ip3Dd4CqRgNEw18B6BNprAVX+wdPyBJko8vwTlUoBHJi02KnFX6BADhWZKcFyYRROLo1tis1KiZdfS4vWVK5zLykZ2YUT1oDAzZJA9fy/0kS9GfCzjA/JZLse2HbmNru5WCiUlFco6ainFOJ9wortnwhHjSbYPgvi3jSZWvGFSMXNBqWuOEwfe4/AQEMF/HSQ2v9dsrIR/UFhDc+LqvCSbQw2zzjKqEbnZM327LpcZKq9LnY5N3e5ka8iM7XytSNjKoDo8dMgkk/3vXrP/Mam21S2o2Rtz0LOa+ALdlPm/qRSzuxEQJ/dWvjLZ2R4wVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wm4dpZUDNymZOG/VXIXADq1nRo0ub2XqV8jzflZV/c0=;
 b=O1Ao9FgXxzZK0xKzVfbqk6u2X6Ef9G+W4fu8N79s+Lx50yy1K5BfASPTNGB0snKXwGl/9cksg67FeAKJuIjPTTWyaBVrvcjZ4CH1p0go3h0RSWzLSTVkrWlhcXhsuB4eW2g+m1EDHC64Ilw9q4t4X3vBZE1JB4jQvbOKgiunRcsezkgVnCW6BlXnQVbxXu9YvfY0g5ZHUS5kznpo2U98mjSZzNkVh4iZ9PFKBX1XxO6DAYHEG2sIG4Tm376nL3vYBYhzqLPKWSyQjulDUGy22MeroS0J0+1x7ZcSPvErcvu561ZsY4nISFEYMAdv39riz3CaTsofRx/Xv+m+7IkAgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wm4dpZUDNymZOG/VXIXADq1nRo0ub2XqV8jzflZV/c0=;
 b=AvDHVDU3rhOKS6DWyeW11ne/HO8xoEtyNKGnDUxPZgGkyhUsbP7zw7p7/Kjvf+IDS+PORjoYOUR04OfdYh0LEFTe2TYcvkRwYANe53+UcdT6/cA8x0He2Vy8TVx2VKBh9G/DRP+SAXx/qjVfL8e6e+FK8hgD9RR3ruj2iZ1ReM8=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by AS8PR04MB8850.eurprd04.prod.outlook.com (2603:10a6:20b:42d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 10 Jul
 2023 16:46:51 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::6ca9:18dd:141b:7678]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::6ca9:18dd:141b:7678%6]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 16:46:51 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Azeem Shaikh <azeemshaikh38@gmail.com>, Kees Cook <keescook@chromium.org>
Subject: RE: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with
 strscpy
Thread-Topic: [PATCH] soc: fsl: qe: Replace all non-returning strlcpy with
 strscpy
Thread-Index: AQHZjRxPkY948tZxK0+W/DNElvLIxq9oG5qAgEp4owCAAO0rgA==
Date: Mon, 10 Jul 2023 16:46:50 +0000
Message-ID:  <AM0PR04MB62891F29BB182FA2B24A37098F30A@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230523021425.2406309-1-azeemshaikh38@gmail.com>
 <202305231020.37C95FD@keescook>
 <CADmuW3UAHODqC5YAmjK1sOuo3C56noOa6hsHA+2Es2R9MT36_g@mail.gmail.com>
In-Reply-To:  <CADmuW3UAHODqC5YAmjK1sOuo3C56noOa6hsHA+2Es2R9MT36_g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|AS8PR04MB8850:EE_
x-ms-office365-filtering-correlation-id: 1ac34424-1b09-4112-7d3c-08db8165426d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  +/bQjnIvtB9EdEC5d9b/HTMl/Xfv1c+OC1tCwwAfTq84vlFdiv/hlk2CbrhLchvArek48Qd19W3i+vlVaJZLJpljukjps3fgR+r3JuTH67xRlflkRyYzn/nPKPfvVxFBVo/K5Ux1pwfTsaEZnPA0gEHBlTcY788pZYWoI8oeY5bnM7y/YGMVLnUrnqGcRnYsnTkOiyNCi6iaxIwqJw7eZM/+ZyqX1dDuJufvdzqnbqWK1x3kJs1Cwe9TXYfZYGn3g5rZncxHR0fotcu19CK5v6falyv3r28Ytr71ChYz5L2PT6gi/EqxsghfT0GDTwmjakZc8iS1JVkdx0YLpa7oF4LXYpcyKWuKEpLiSS+RYbgnm4uGZlBycBYUpZhQXe7emcadCruuDGKtfLgCgvOcDFOuTIk0ubuDag2uAyBlueSROvsUXCl4J6DcgLUYSCnXFj01S+Ntgtcnj1Y19DK44jD93c3RXc4VxvuGWqjRpb2G6r+sT83UALBYaVhgC9q5AY3o8rslJtFyNNX9mU2n5LfeWw8tNIcvR9ygfxwkfmf68I1D6afPCDkJ6HmRU+o9viy6ISIlxsS8En2oxqpURYx2c6UqCKmFByljLPuPbMqTY1SiYLeT4zKJhCtA6PSd
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(66946007)(478600001)(66446008)(8936002)(8676002)(2906002)(66476007)(4326008)(33656002)(76116006)(66556008)(52536014)(316002)(5660300002)(64756008)(55016003)(6506007)(54906003)(41300700001)(966005)(110136005)(9686003)(38070700005)(86362001)(83380400001)(38100700002)(45080400002)(53546011)(7696005)(186003)(122000001)(71200400001)(156123004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dm1neUFJN29iazlhYVI1b2pFMit2UjRpb2JuODhmU0ZMZzJNYU9Ea3JkKzU2?=
 =?utf-8?B?b2lTMXJqOVVnZUxBY3pIRFdUUld2d01qWlRMM0RmY0c2Z2gvTUtybC9ISlZB?=
 =?utf-8?B?MkVROTFWRjl0S1N3R0lHYVJOOTlrNGlCb0dTb25zS2puSVZ5cHBVMDk2WUNh?=
 =?utf-8?B?akczcEJjck4wcGpoUWlxZkNmQzlwOWRFK296RmpxUHVscitHV1lobUN1R1dR?=
 =?utf-8?B?Rmk3V3oxVUhSTUFEWHZzTG5PUE5xNkdZem9VWTJ1MFlVVGFiWFhHZU43SUJV?=
 =?utf-8?B?WCtOTmxwMmtHUW9NYWtmdFQxMVJWMWcrelRIVWRnaVYxVkhJeXdxSklpcnUw?=
 =?utf-8?B?dThUMXJydmJVT1BjeXN0Q2Q2THFzQmhkSnlNRW5hYzNMc095VFQ1TmhqV2RH?=
 =?utf-8?B?cjU5VElVZEZzZ3AyZlZsQWhRelUvY1lqR2lyWFRmeW1Wcng4VElnVWwxQWFO?=
 =?utf-8?B?ZEFFYzE3b0E1QkFFY1hqd0dHaU16UmVMczlNc3hLRHRoSnFMdnlkdy9CcFFz?=
 =?utf-8?B?WnhSWFRTNDUyRzIvUXF3YURtWGo2RnR4emdzL0RHZXRWU010WWUvQzhuLytU?=
 =?utf-8?B?b1VJTW96NXJvUm5mYXFSUWxicDU2WVkyUE1CcWNkcGs0NXg2Um0xMjd5eFhP?=
 =?utf-8?B?K3piV3FPWWZpdkQ3VDljaEJzM3FkajREWTN0MU55K2lRc240S1FPZnN0RlR6?=
 =?utf-8?B?R296TkZ6cGZyRVZ5VnhwQU1ETUVDeFRrOU1MR1NURFN3WldWb0JtUVpKR1Vr?=
 =?utf-8?B?LzRqMWN1aTkrc080dE1BbzZPRUJ2ckc1K1VWSVBiZllQZVVXRjBJclU2ODRT?=
 =?utf-8?B?RnpJM3Q4K2ZyWUQ5dDAyT3BDWkFwaDNLSzMxZ1NiVkxkT1huSEFFS29Rc3lZ?=
 =?utf-8?B?UVBpbUtNNDVRUFh5VzJIaDBUakk1MlRkdXdMYnhBNVYrNE9SU3BSY01yWHVU?=
 =?utf-8?B?NGJMbi9SVndTbVp5OFpsemxiaEkvOEN4TzIwSS9tM3NzT08rY1lBQ1B6SGJL?=
 =?utf-8?B?SzNCRGdSL0Nvc3REL2s0NWpJL3djaVVhQ1E4VE4vZFgycWNiRlVtYVBQOXMr?=
 =?utf-8?B?N3ZYN0xkbVFrQTlqS0krMS90SVZQdjdWNHhuQm8vbjUrT2hzOVUyZFhVTmh1?=
 =?utf-8?B?RmRvcXAxZXJGN201SjlkQ3pGamliM2cyb1RRR1MvWDhVUGhyR0cvSnNKck42?=
 =?utf-8?B?UkNDcXREa21mY1RUS2FFZHBxWXo5MWQ2UEZvMVJJbXBBcWlBU3VUZDFaUUQ0?=
 =?utf-8?B?SWd6ODlyeVZNbTNmRm5rTkVmcnlBZFcyWDRxQ0tyYUJtVzY2VWpQcTJ0MHRm?=
 =?utf-8?B?dGIyZm8zR293ek1BWk1nNHBFV3RKWnNPMGNpdExRRWdzYnNvK3hQS3ZMUzJT?=
 =?utf-8?B?MnBuT05welhHMzhhOFMyVmVQS1o2WndiTE5yZUgyVE04clMwVlRxRmFKWlVr?=
 =?utf-8?B?b1g2NUtqWVo4dXA4M0Q0ZHU3MFkvY29sM2hOS2ZmRlZ0NnFmS3d5QjVIaTFF?=
 =?utf-8?B?aVFRZVBpVmk1bis0Rk5JVTUyY1pwV2VSUmVBNjhtSGdxRzJWS05MRk93M2Vt?=
 =?utf-8?B?VUt1UHhIQ2V1ZkxRVGZQUCtod0pyeWU2K3RvSW4xVkJERnlCZ0lsOGpqQm4w?=
 =?utf-8?B?eCtncEdWTHRpV1NnTytVdnh5V2VmUEFOQnhKYnBVVkhXYS81eGwwd2cvTVZI?=
 =?utf-8?B?Y1BnMk5NVDRrK3JFemMwM0xnZWlHMytsVG85cEc0NVRaeWJOM1Z1MllZUzBK?=
 =?utf-8?B?TE44NW9hTk1IQkdDODlQVnBjR2Y4bG5rWFRIU0tNZHEyWFlZSjdPdTgwdWJ0?=
 =?utf-8?B?MkNCdTlzaUJPcWkvcTFJa2sveGZqVk81K0YyWXJFUzg1V2tna2xFWTZFSjhO?=
 =?utf-8?B?Vm9ZZzlvV2x2TFpSdWJoNlVHUzJwRElVdDJ1RWJPU2VHb1pmWlJqN3Bia0Ju?=
 =?utf-8?B?Zm9GUkN5clg5eHgwclJTbHdaZmxnQmpMa1hTV0Z4d2xpbzZaYVZsLyt0cTJI?=
 =?utf-8?B?SkV3YzhXZmdrTHRCbXU0ZVExaUFXd0IvcmZSQTJkZ09kSHFBeHMzaWxqTFpR?=
 =?utf-8?B?eGlhQUUvM2wvREdXQ3ZQMVFSa0FoU1NkdkRpYkJJT1huWlJEc3paZzAyMW9t?=
 =?utf-8?B?Mzg1cE1UcVBjQ2EvWlcveTAyVERzRVZSSHBoL3BaOEhrUG1PSnNUU2JERHBN?=
 =?utf-8?Q?3OH9LjS2gj5yTlPZA13CdEMu9FWMRRWxYS0ka5B2eDyu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac34424-1b09-4112-7d3c-08db8165426d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2023 16:46:50.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5420oVsltMXjgPeNduw2nRTQwOcYlZ7QMoV24fLGQLfGsVTEcl/56++JfgIVXaVNdYQLeMErkhn9tj0kr5HLsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8850
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXplZW0gU2hhaWtoIDxh
emVlbXNoYWlraDM4QGdtYWlsLmNvbT4NCj4gU2VudDogU3VuZGF5LCBKdWx5IDksIDIwMjMgOToz
NiBQTQ0KPiBUbzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+IENjOiBRaWFu
ZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+OyBsaW51eC1oYXJkZW5pbmdAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgTGVvIExpDQo+IDxsZW95YW5nLmxpQG54cC5jb20+OyBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc29jOiBmc2w6
IHFlOiBSZXBsYWNlIGFsbCBub24tcmV0dXJuaW5nIHN0cmxjcHkgd2l0aA0KPiBzdHJzY3B5DQo+
IA0KPiBPbiBUdWUsIE1heSAyMywgMjAyMyBhdCAxOjIw4oCvUE0gS2VlcyBDb29rIDxrZWVzY29v
a0BjaHJvbWl1bS5vcmc+DQo+IHdyb3RlOg0KPiA+DQo+ID4gT24gVHVlLCBNYXkgMjMsIDIwMjMg
YXQgMDI6MTQ6MjVBTSArMDAwMCwgQXplZW0gU2hhaWtoIHdyb3RlOg0KPiA+ID4gc3RybGNweSgp
IHJlYWRzIHRoZSBlbnRpcmUgc291cmNlIGJ1ZmZlciBmaXJzdC4NCj4gPiA+IFRoaXMgcmVhZCBt
YXkgZXhjZWVkIHRoZSBkZXN0aW5hdGlvbiBzaXplIGxpbWl0Lg0KPiA+ID4gVGhpcyBpcyBib3Ro
IGluZWZmaWNpZW50IGFuZCBjYW4gbGVhZCB0byBsaW5lYXIgcmVhZCBvdmVyZmxvd3MgaWYgYQ0K
PiA+ID4gc291cmNlIHN0cmluZyBpcyBub3QgTlVMLXRlcm1pbmF0ZWQgWzFdLg0KPiA+ID4gSW4g
YW4gZWZmb3J0IHRvIHJlbW92ZSBzdHJsY3B5KCkgY29tcGxldGVseSBbMl0sIHJlcGxhY2UNCj4g
PiA+IHN0cmxjcHkoKSBoZXJlIHdpdGggc3Ryc2NweSgpLg0KPiA+ID4gTm8gcmV0dXJuIHZhbHVl
cyB3ZXJlIHVzZWQsIHNvIGRpcmVjdCByZXBsYWNlbWVudCBpcyBzYWZlLg0KPiA+ID4NCj4gPiA+
IFsxXQ0KPiA+ID4NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3cNCj4gPiA+DQo+IHcua2VybmVsLm9yZyUyRmRvYyUy
Rmh0bWwlMkZsYXRlc3QlMkZwcm9jZXNzJTJGZGVwcmVjYXRlZC5odG1sJTIzcw0KPiB0cg0KPiA+
ID4NCj4gbGNweSZkYXRhPTA1JTdDMDElN0NsZW95YW5nLmxpJTQwbnhwLmNvbSU3QzExZjlkZjFk
ZjFiNTQ0MGU0ZWMxMDgNCj4gZGI4DQo+ID4gPg0KPiAwZWU2NGRlJTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODI0NTUzMzYwDQo+IDM3ODANCj4gPiA+DQo+
IDg4OSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdQ0KPiBNeklpTENKQg0KPiA+ID4NCj4gVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0Mz
MDAwJTdDJTdDJTdDJnNkYXRhPWpjVHkzSUYzN3dxQzENCj4gTVdzU3VGDQo+ID4gPiAlMkY1MVox
dHJRRU1hb3c3QkhrUFNoM2h6SSUzRCZyZXNlcnZlZD0wDQo+ID4gPiBbMl0NCj4gPiA+IGh0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRmdpDQo+ID4gPg0KPiB0aHViLmNvbSUyRktTUFAlMkZsaW51eCUyRmlzc3VlcyUyRjg5JmRh
dGE9MDUlN0MwMSU3Q2xlb3lhbmcubGklDQo+IDQwbngNCj4gPiA+DQo+IHAuY29tJTdDMTFmOWRm
MWRmMWI1NDQwZTRlYzEwOGRiODBlZTY0ZGUlN0M2ODZlYTFkM2JjMmI0YzZmYTkyY2QNCj4gOTlj
NQ0KPiA+ID4NCj4gYzMwMTYzNSU3QzAlN0MwJTdDNjM4MjQ1NTMzNjAzNzgwODg5JTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkDQo+IDhleUpXSWpvDQo+ID4gPg0KPiBpTUM0d0xqQXdNREFpTENKUUlq
b2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMwDQo+IDAwJTcNCj4g
PiA+DQo+IEMlN0MlN0Mmc2RhdGE9QmxyMFcxb1lQSXc1dUR1N0hxbEVrVTd4T3VBbzRiUU5rayUy
QnQlMkJBdUZxYw0KPiBzJTNEJnJlcw0KPiA+ID4gZXJ2ZWQ9MA0KPiA+ID4NCj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEF6ZWVtIFNoYWlraCA8YXplZW1zaGFpa2gzOEBnbWFpbC5jb20+DQo+ID4NCj4g
PiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+ID4NCj4g
DQo+IEZyaWVuZGx5IHBpbmcgb24gdGhpcy4NCg0KU29ycnkgZm9yIHRoZSBsYXRlIHJlc3BvbnNl
LiAgQnV0IEkgZm91bmQgc29tZSBvbGQgZGlzY3Vzc2lvbnMgd2l0aCB0aGUgY29uY2x1c2lvbiB0
byBiZSBub3QgY29udmVydGluZyBvbGQgdXNlcnMuICBIYXMgdGhpcyBiZWVuIGNoYW5nZWQgbGF0
ZXIgb24/DQpodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNjU5MjE0Lw0KDQpSZWdhcmRzLA0KTGVv
DQo=
