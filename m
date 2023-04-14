Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE706E2CE6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 01:30:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyt3l08kVz3chR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 09:30:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TE+Kpz9G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7eaf::621; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TE+Kpz9G;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20621.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::621])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyt2r3Htfz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 09:29:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzaJl9+pfkBGfJe8UyUdzLuxj18qwv8TRdpkGKKL5Xu3hXIsiGJ9D5rLSuQRMCCXarTkIWCNVXhfSUi0uNYwYPpDW+n4IRw7jZAU7MaVnUIKWt5/ekyHAjfwh5kbi8hDTNIuaK75Oq/GCGxEcK3lIlY7ryf/qhyieyrnbIL2sg3ns1BGx5mZZDEMne4KSeprgOUjUi13YfJticFKdmx/BnXbjv4rl/KgVy2cCMNwZ2e3TSpNSF0F7nzl48C9CeaaVF/iLtUE6MJE/BbwgevoLCboDGlOF4sVzXEBHupMDqUQ+hjQ04Ja5LfU85um5MUdTT1JX4QBmNDpSTY+jg9bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Me3QbxxJ2P71X58gDkzzJUD5WvCy9CwatkCsKkKA3bM=;
 b=A00MUT7XKopYhgJVittaEM3kk4/nZFNk4l/wpb49ulUHGHODb+LvM8dz9dGXrmKu49pYkMsCLwQpcl+Jz1LHVtE+W7hEMtigOUDKTHSokx+c6cKGFc0iIterSfxz0On+Ne6yDM1itiq0azFnRx1knIdZ6zrRoFXqzW7xA9Vmp+3Dh+FYNz3GVepoH1rg7qFGkwPn/JZWrlieVVYMIIRepDVXkHmIuBAbsi8NmSbiP/ew9WbWcuZOT6351KLNs7ybBHhilqtcbk2D13nTHL7domTG9jaE9Vn+KIyLF3hCTTr12tyxNh4DmrrzNQGAZhqFQwtItXa1KUZsPOTFbQPBmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Me3QbxxJ2P71X58gDkzzJUD5WvCy9CwatkCsKkKA3bM=;
 b=TE+Kpz9Gi7K1LCvIw81E/+ZSQqamX/MYA3LMqkYQlt45jgC+wjX7PXAVQ+Acx9+qDXp1LDVe3bo829/djcz3LO0w/us6XiF4iUHfhU0ZTGdoiot4vpxVtP8BYJcNqIm05JVayW9ks3wnTyap3d5AZ+O6J4ULZw8sAJe34Hv3GNY=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 23:29:35 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::8516:ebc7:c128:e69d]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::8516:ebc7:c128:e69d%6]) with mapi id 15.20.6277.038; Fri, 14 Apr 2023
 23:29:35 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Gortmaker
	<paul.gortmaker@windriver.com>
Subject: RE: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Thread-Index: AQHZRi1QkS0YOzFcxEanclAMrMYrvq8qYTnxgAFfAWA=
Date: Fri, 14 Apr 2023 23:29:34 +0000
Message-ID:  <AM0PR04MB628965937FB711C2DA3A20FF8F999@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
 <87o7nr9png.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o7nr9png.fsf@mpe.ellerman.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|VI1PR04MB7104:EE_
x-ms-office365-filtering-correlation-id: 2e9f6291-d40f-403b-ab48-08db3d401b60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Ff+jxm1cQxYfTUCzxOiRDV/AXv/9ul2sqeTy2eyRgqz3/J6BuDYcMaIxUzPNXD3NG+5w6mtC4QKB9FqkaIAJnS3bg7H6ARHIJ1jcZ913GjHMFfvyyoYJrwURuSStlQfVQ+iUU62qAYuBMHyqnqT+VeqEnelvG3aXp3qYF0lL7wbHu589ANXNLgYoWgJDYbExpje8qWdTQXaNSX9fL6tM72pE7dBOs0146YMA2/eYtPHETA60tkOSWwoDrfkgsO15niOBAPOkbIvBjOcvewvjazWk3VDimNYs2p/YgCO6UIMVRv7h4/I5HGIGN/ytbJ8n0xD0t9KM6RDAZtnOtPR2dCJNQMIv9GeXE7vNSDOqcO88mMDaFJB16dHyFA08sJTXMDaQu62yiId3Rh/sxM0xOsz3NpFEE3L+/ZKiCMfX85bH93nlBaTmxaFIxXlN7XMrR/aArkvq/b0Yb44Fpor4m8Ma/fvqbfwq1E3CbR3kXKnvCDvsA387aFrBHVgEmNC2zAcoKgxm7t/5tz0VrpgetvtZkVUmLKfvaXKXaf5d9bQSbr7M0pWHh3rf1MKxdhT85C9dr90QG0jm/pVHYdGXo9YOvmjhPUbrs4A7hC/jOEgV1SzSRVM6WT2Ie6Le0Bgw
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(66899021)(52536014)(38100700002)(5660300002)(122000001)(38070700005)(8676002)(8936002)(4326008)(76116006)(66476007)(41300700001)(64756008)(66556008)(83380400001)(110136005)(186003)(66446008)(54906003)(66574015)(316002)(55236004)(6506007)(26005)(71200400001)(9686003)(478600001)(86362001)(33656002)(53546011)(7696005)(66946007)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?akloZTBKdEZKMklmRE8rVldDc05kazkvR0gwZHhuTzBzQm9tS2xZSGpaaTR2?=
 =?utf-8?B?RFhMckpIekFobCtoY0UxWWlIdExBUHUzODU4TEVWVjZLZVFudVRVL0VaN1Bu?=
 =?utf-8?B?SU5CRVhweittMDlqSmdMcENNRjVCQSsyZ2s4WVRjdmsvYUJjeFZBc01NSFNC?=
 =?utf-8?B?a3BTR0k2TElOY0JmSGhmVUJyZlJaUlJHQ1l5d2ZhZnAyM2NQMm9GcHJoT3pj?=
 =?utf-8?B?RHNjTElxWFl0TnIrbWhBUjFWdnM5ZDdhalpoT0YwQng1SFpKVncyVUEzMWtt?=
 =?utf-8?B?ZDVVbzlhdUlMSm5NVFFNR3ZkcXNxb05PS0hpSXVSUlNwSkNqZC80WjV0QS9V?=
 =?utf-8?B?MmZDZkRYY2pGQ2JnenRLUk1sb2FGdkUwWG9qNDRqVEZrYzErVUVFUXF3V2Y5?=
 =?utf-8?B?SFhCeTVONG1BYllrRDUxRGM1QnM4SGlsRGtLN1RrSklrTnVUcldZcy9Gb0hC?=
 =?utf-8?B?eVVUUWJkeUZ3ZnVKemVFeHJubkpqTVVyNkxSaGF0V0V3aWw4UDJKVy84Qm5i?=
 =?utf-8?B?L0ttMndSempQZTRVeE0zaENRY0JaR2ZxNXJBTi8wd2FsTUVyVG5JZjN2aThN?=
 =?utf-8?B?ajQwWFhOQ2dtQUcwQ1crZURGSGRzeE80ak9UdkRnU1l3UGJYemJzMnlMVkxo?=
 =?utf-8?B?bGI5SkhyU3JDK1JNdGVCYmplVjVYaWpPRWcrRnk5SzREN0xJVnBCNTBxYU9t?=
 =?utf-8?B?Slg4K0NQczhsNHJFdk5QQkFQMEVLVk1CYWxlZzcvRmNOb09BeEJseDJEZy9r?=
 =?utf-8?B?T1ZTT1pGSkxoTngwZkMvR3M5YWgvZ2ZJN2pDTnhwcUxXc255NkFnQ2FQS3FC?=
 =?utf-8?B?NXcwQy96WFJRQkRYWWxCaFZyT2dnY2c0VmYvbnNqZlpGNVV2cThnSGJ3T0Nk?=
 =?utf-8?B?am1EQVowbmxUSW9vU1BYV01UTGtwWGg1a0NMelhMc3J4OHA4eUc4dHZkTnhE?=
 =?utf-8?B?UjVVQlBIeHJvSGFydzlDeVdZa2ZQQWtKK2FldlN4MW50dXN0TzhhMWZIS3kw?=
 =?utf-8?B?R3RYMDhZTG05dTVUdnhUVEpPUTRmdUQ2bS9BNjgxdklGL25jY0FuOW1nSkRU?=
 =?utf-8?B?UUlKZTdZSzZqai9XSDRyYzJucDRQSzJrZCtMcVVCeElVcWkwNmk1bHp4SHZQ?=
 =?utf-8?B?Q3hJNTZ0cVFtYWpzQ1RLbHVRQUZoUllqa1lteFl5UTlReWdVOFg3OWNLR2pq?=
 =?utf-8?B?Z1FrYktjOXhJSzlMNzN6UzFTMXQxT1poMC81ZzNteURLNytRdTZVWmJKS1FO?=
 =?utf-8?B?Q1BmRUtuNWxVY0w1dnlmZGgxTkZDYURyQnM3ZTR3bndJTWdPditzRHplQ3NL?=
 =?utf-8?B?Z3pYSEplUzBsenJDeW9qMGxhdWVId01WWG1idXN0OE9YMnZLTnhxVTVWTTZ6?=
 =?utf-8?B?eHh1dHpvSHBjdDdtVURtZTUvc0VhVjVxUlhkTjFkM2VrVDNidlhmdi8zYWl4?=
 =?utf-8?B?dm9CZVlWd2R0aUMyaGdCNVFnWDlCOGRybXJOUHcyTHhqamQxNERCMDZXamtt?=
 =?utf-8?B?Q0RPSTNMTXFzYUwwaGh4enkyWjlWNS8yTHI4WTJVMGE1OFJWNHNSTTNTc3Fs?=
 =?utf-8?B?WmRFN3RRMWN2c1BLTmpYb0k0Tnltc1NtSzJjOXN1NUZEOS9RUEcyTEFhUHBL?=
 =?utf-8?B?WDNUOE5WOE9iT0V2L3N2ak1lczJYODhiRDdJN2N1UUVDRnhWL25qY3pjSFdX?=
 =?utf-8?B?Y3RKVm1Lbk9nRWlTTjVaNitWaGVPaUtCNERpYjl2em1ibU1UOG9LaEl4ME0v?=
 =?utf-8?B?Y0JOUmdtVCtobE1CVGtDaU9lVXdIWEVnZFJWNGZNTDNtNjVtemhtSjVTaE4w?=
 =?utf-8?B?eWJWazBxWjJPVUtIdEJPeEJhR0pDeGtnbmpNY1JFL1JPeEt1eXJqT3hTd3lp?=
 =?utf-8?B?KzVGaHRlaXMwbWNBc0RuWm0zRUdtYXlpS1Bodk1OZnZGN2h1Y2lGNUpvWkx1?=
 =?utf-8?B?c3NuTDRNMFd5WEgwOTkzei9HMDVaelZFMUJsU0QrV1VzUEZRakpCbldlUFFs?=
 =?utf-8?B?YjdYYytpY1JQeFpKdEk1OEVxNncwZVd5TTJFNXVqM3NiZXlidjlSUE5obXp4?=
 =?utf-8?B?VGltcGlIaWx2clZ2VXR6L1BhemtqalI0MzZKMzB4ZlIyTUllK0YvVW5wYm5Q?=
 =?utf-8?Q?txlamskmkTAyiwF4yKtBz/HG/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9f6291-d40f-403b-ab48-08db3d401b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 23:29:34.9492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pgu+CMki+NzCwFJIW0AR1aIQEqy35LCq9alIzLDP1lc9KzdSLb/D1+vZ0CqPJfpLYwUocVXcBPAOU1jRMzIb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7104
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
Cc: Scott Wood <oss@buserror.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGFlbCBFbGxlcm1h
biA8bXBlQGVsbGVybWFuLmlkLmF1Pg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMTMsIDIwMjMg
OToxNCBQTQ0KPiBUbzogTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBQYXVsIEdvcnRtYWtl
cg0KPiA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4NCj4gQ2M6IFNjb3R0IFdvb2QgPG9z
c0BidXNlcnJvci5uZXQ+OyBQYXVsIE1hY2tlcnJhcyA8cGF1bHVzQHNhbWJhLm9yZz47DQo+IENs
YXVkaXUgTWFub2lsIDxjbGF1ZGl1Lm1hbm9pbEBueHAuY29tPjsgbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmc7DQo+IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6
IFJlOiBbUkZDIFBBVENIIDAvNF0gUmVtb3ZlIHNvbWUgZTUwMC9NUEM4NXh4IGV2YWx1YXRpb24N
Cj4gcGxhdGZvcm1zDQo+IA0KPiBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+IHdyaXRlczoN
Cj4gPiBPbiBUdWUsIEZlYiAyMSwgMjAyMyBhdCAxOjUy4oCvUE0gUGF1bCBHb3J0bWFrZXINCj4g
PiA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IFtUaGlz
IFJGQyBpcyBwcm9wb3NlZCBmb3IgdjYuNCBhbmQgaGVuY2UgaXMgYmFzZWQgb2ZmIGxpbnV4LW5l
eHQuXQ0KPiA+Pg0KPiA+PiBJbiBhIHNpbWlsYXIgdGhlbWUgdG8gdGhlIGUzMDAvTVBDODN4eCBl
dmFsdWF0aW9uIHBsYXRmb3JtDQo+ID4+IHJlbW92YWxbMV0sIHRoaXMgdGFyZ2V0cyByZW1vdmFs
IG9mIHNvbWUgMTMgLS0+IDIxIHllYXIgb2xkDQo+ID4+IGU1MDAvTVBDODV4eCBldmFsdWF0aW9u
IGJvYXJkcyB0aGF0IHdlcmUgcHJvZHVjZWQgaW4gbGltaXRlZCBudW1iZXJzDQo+ID4+IGFuZCBw
cmltYXJpbHkgbWFkZSBhdmFpbGFibGUgdG8gaGFyZHdhcmUvc29mdHdhcmUgZGV2ZWxvcGVycyB0
byBzaGFwZQ0KPiB0aGVpciBvd24gYm9hcmRzIGFuZCBCU1BzLg0KPiA+DQo+ID4gVGhlc2UgZTUw
MCBwbGF0Zm9ybXMgYXJlIHNpbWlsYXIgdG8gdGhlIGUzMDAgcGxhdGZvcm1zIHRoYXQgdGhleSBh
cmUNCj4gPiBzdGlsbCBiZWluZyBzaGlwcGVkLCB0aGUgdGFyZ2V0aW5nIG1hcmtldCBwcm9iYWJs
eSBjYXVzZWQgaXQgdG8gaGF2ZSBhDQo+ID4gbG9uZ2VyIGxpZmUgY3ljbGUuDQo+ID4NCj4gLi4u
DQo+ID4NCj4gPiBUaGUgZGlmZmVyZW5jZSBoZXJlIGZyb20gdGhlIGUzMDAgcGxhdGZvcm1zIGlz
IHRoYXQgTVBDODU0MEFEUywNCj4gPiBNUEM4NTYwQURTLCBNUEM4NTQ4Q0RTLCBNUEM4NTY4LU1E
UyBhcmUgdGhlIG9ubHkgcmVmZXJlbmNlDQo+IHBsYXRmb3Jtcw0KPiA+IHN1cHBsaWVkIGJ5IHVz
IGZvciB0aGVzZSBTb0NzLiAgV2UgZG9uJ3QgaGF2ZSBhIHNlcGFyYXRpb24gb2YNCj4gPiBldmFs
dWF0aW9uIHBsYXRmb3JtcyB2cyBwcm9kdWN0LWxpa2UgcGxhdGZvcm1zIGxpa2Ugd2UgZGlkIGxh
dGVyLg0KPiA+IFRoYXQgcHJvYmFibHkgbWVhbnMgZXZlbiBpZiB0aGV5IGRvbid0IGxvb2sgbGlr
ZSAiaG9iYnlpc3QiIGZyaWVuZGx5DQo+ID4gdGhleSBhcmUgbW9yZSBsaWtlbHkgdG8gYmUgc3Rp
bGwgaW4gdXNlLg0KPiANCj4gT0suIEJ1dCB3aGF0IGlzIHRoZSBjaGFuY2UgYW55b25lIGlzIGJv
b3RpbmcgdXBzdHJlYW0ga2VybmVscyBvbiB0aGVtPw0KDQpXZSBkbyBzdGlsbCBoYXZlIHRoZXNl
IHBhcnRzIHNoaXBwZWQsIHdoaWNoIG1lYW5zIHRoYXQgdGhlcmUgYXJlIGRlZmluaXRlbHkgYWN0
aXZlIHVzZXJzIG9mIHRoZXNlIHNpbGljb25zLiAgQnV0IGl0IGlzIHJlYWxseSBoYXJkIHRvIHNh
eSBob3cgbWFueSBvZiB0aGV5IGFyZSBydW5uaW5nIGxhdGVzdCB1cHN0cmVhbSBrZXJuZWwuICBJ
TU8sIGlmIHRoZSBuYXR1cmUgb2YgdGhlIGFwcGxpY2F0aW9uIGlzIGNyaXRpY2FsIGl0IGlzIGxp
a2VseSB0aGV5IHdpbGwgbmVlZCB0byB1cGRhdGUgdGhlIGtlcm5lbCB0byBnZXQgYWxsIHRoZSBz
ZWN1cml0eSBmaXhlcy4gIEFuZCB0aGUgcmVmZXJlbmNlIGJvYXJkIHdpbGwgYmUgaGVscGZ1bCBh
cyBhIHN0YXJ0aW5nIHBvaW50IHdoZW4gdGhleSB1cGRhdGUgdGhlIGtlcm5lbC4NCg0KPiANCj4g
SSBhc3N1bWUgbm8gb25lIGF0IE5YUCBpcyB0ZXN0aW5nIHVwc3RyZWFtIG9uIHRob3NlIGJvYXJk
cz8NCg0KVG8gYmUgZnJhbmsgdGhleSBhcmUgbm90IGluY2x1ZGVkIGluIHRoZSByb3V0aW5lIHRl
c3RzIGNhcnJpZWQgb3V0IGJ5IHRoZSBkZXZlbG9wbWVudCB0ZWFtIG5vdyB3aGljaCBpcyBub3Qg
aWRlYWwgdG8gbWUuICBCdXQgSSB0aGluayB0aGUgc3VwcG9ydCB0ZWFtIGFyZSBwcm9iYWJseSB3
aWxsaW5nIHRvIGhlbHAgb24gaXNzdWVzIHdpdGggbGF0ZXN0IGtlcm5lbCB3aGVuIG5lZWRlZC4N
Cg0KUmVnYXJkcywNCkxlbw0K
