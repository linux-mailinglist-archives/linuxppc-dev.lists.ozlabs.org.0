Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 728947322DA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 00:47:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dCEWVuXm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhy9d2dT4z3bmN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 08:47:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=dCEWVuXm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60e; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhy8g07l7z305Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 08:46:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxnGpo3f5oP94gd3uH4j03i9QSoJ7ZMvk5qo+PhYb1l8bMX7xREpvAoVnpf4ho9sQECMvAurK97KJLJp7RdTJGKJAlq5rH7Y/ZlJxJbczSfw2owC9o5K26GGxzSZX0c1Q8nxUe6gb74Xa7rMZYQW9WyVbxdfQDrLDhyJQzap0hfpaQvBE1/NDhn8oFOBlUMsa+Ew2cFQSUb/A+TqrwnL40buIAzbWPBcuHp7bigIR6vOnTYYl/VjixAVd3EloZswJ8/wds6ZhtT32A9NvrRhpHk3uEK1qu97EnPDcSYQG9U4cGVwlMevVar/U6YSQXlgH03p7TMBvc+6zLkCeNCY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QLlZKsPQt68yJ19/tLXuNxgzPw2q3M4A8uCKF2HUYSg=;
 b=Dz1mkmnd3J03e+rFuRs55kBmCy3+R1cp4J23wonrxu2695GuJrP6I+7kTK9ik3ucl9EYhQF7yr7Ck+2PptNBSRxxxvC1/mRhwCCQka06dyKJCBaA6qqT+0w0IBhcfDI+wBuhLuzs+xsAynd3Hc8v97g96OlePA9OP+BohVhXtLBvUU/8n80VZ8lGvJ2GXMx5W5vgj/vjS7XFEOTxeDXjNNU0s5ksBfd78roagyaj2SgX/BFXyM+af+z+NSRKDo4gIXfje9J9ym4/ieFeb5dN8m2hbFogJhGwyYHMVbRpHC63pz4GmpExjQSPMuZkjdl4sgPEcdTa5QRQfN5/Oeh7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLlZKsPQt68yJ19/tLXuNxgzPw2q3M4A8uCKF2HUYSg=;
 b=dCEWVuXmjD943EvGm5Rtnk/bY5uP4Id13FX5zmMBP8jEo9C+RRl8uzU4zjeUCwJxHY+5Rmw1244/vnvkMLmUthsDtYjMRMDwbF9Bblv/8waS+J5450yhsfbJ7RTZG0t2Mw/anbIB1g5nwbI2CZwVeK86FySMSVhdYB9D2pAI4Oygt6buJXZn9GQqF0Yapqyk/GiGZYC0qvzERY5cqKd/Q6BSptdA+RSe2hWx8429kYO1vP3GU/xzLhsmN20d69DC4rYGkcMkqcmjSaEGBL3CcBBNBgh4MqLbXTMWELzTxh38sSOcDZTEm1o+gGgDculQ+R778UBuDHRogKiykIDOyQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3301.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:112::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 22:46:34 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6500.029; Thu, 15 Jun 2023
 22:46:34 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Randy Dunlap <rdunlap@infradead.org>, Timothy Pearson
	<tpearson@raptorengineering.com>
Subject: Re: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Thread-Topic: linux-next: Tree for Jun 2 (arch/powerpc/kernel/iommu.c)
Thread-Index:  AQHZlZXapxNyBVCZH0eUrnS8LFu+3K95yjmAgAA79gCAEhOPAIAAAYAAgAACJgCAAAX9AIAAZ+kA
Date: Thu, 15 Jun 2023 22:46:34 +0000
Message-ID: <ac523bab-716a-ed92-ad7d-56a6898a0475@csgroup.eu>
References: <20230602140143.0af52cee@canb.auug.org.au>
 <2d188c87-ef34-3812-7330-a985f756d959@infradead.org>
 <87h6rogjok.fsf@mail.lhotse>
 <586983120.3136676.1685851048873.JavaMail.zimbra@raptorengineeringinc.com>
 <e2b46606-7ebc-c9a4-4f9a-873c0e71da5e@infradead.org>
 <373175504.6295209.1686845130893.JavaMail.zimbra@raptorengineeringinc.com>
 <208f3734-4902-ff5c-3410-5b9cd984dad7@infradead.org>
 <75a27ada-7e88-2f93-48ee-3dc89b7f1a9a@infradead.org>
In-Reply-To: <75a27ada-7e88-2f93-48ee-3dc89b7f1a9a@infradead.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3301:EE_
x-ms-office365-filtering-correlation-id: 38f3c91e-d524-41f0-9a92-08db6df25ecc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o2qz7D3mDy74V/taiFEZvc4+mQUOn8vTGhyJH9sm2IAgixzBnMn2+hUF2FynFKqv5XGizw3MgaPNX1zsVrILuT040b8j7h4Ee/rv37wcmg0jdM1SfVw7DUaokFkmrRsz7o3rjiaQCilnjo4hPF6nvMb6HQOTyq9g4EzlJEykL/5rYgU/fPf+njE6O/Sr55KTqvdwMFF+/8a9PwoIpo8vUL28pGFuYHX5FEaetz3REyJd1bmkxMr/IExZ/+Y9l7ZDaYKuwE/YJ6Dxpy7VY35iNywJFePixpWrDt+TdLGunKqn4QsN3FcbmdUhTilY4NGZD58YiHXFwpehy5zwpdpRRVlvXiyar0ZDmzkYdqSqfuCAQMbbpWg71jCp0aWgWuFXPv41Aee4zNl5prpDlbngNb/PCbxk/tpx7TqfeLLHU91Sx9qSNthBceIsZvSQ90msY64Q1wqp/Ren/Qb9rLd27hxWVg9BBPVYCGUlDRT9gC4ojH98F0yHqAoSrtMjCHKVwvMrv0I8d3h4JWyULKWYYG6MB7FnXwHe1gip7t4WMpcUDs5DP/ERl1mG2HnSE4MdZcwqnJ77mHZKuWkEOtNpKYzHl6Rm0LyOHgXRn+Yld7/zwtuTZ1BH3tQqbF36KZrIgdy+9XyIw3GzlM1h5x76JjXrntFG5KO2SaiHd8RsKAk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199021)(110136005)(31686004)(54906003)(86362001)(31696002)(41300700001)(8676002)(66446008)(66476007)(8936002)(6486002)(66946007)(316002)(71200400001)(66556008)(64756008)(4326008)(91956017)(76116006)(36756003)(38070700005)(26005)(478600001)(6512007)(44832011)(5660300002)(966005)(83380400001)(53546011)(6506007)(2906002)(186003)(38100700002)(122000001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YUNLbm41MlNPQ0pheTFXZWcrT2d2NTd5RFVQMXhnZXhqWVFncXJMVEpoRy85?=
 =?utf-8?B?TDFyNGVjMzNuM2hSUnlMUCtRUUtIK0NvUXcxZGE3K1V3MWF3L1YxaTFuUWhr?=
 =?utf-8?B?NW5xVGpPTWFkZS8wbk9GT2haL3RuZW9VdU1jYk9jV2phUkEzTGkxbFYwa3Bp?=
 =?utf-8?B?Y3pUV2Z5RlVsMGN6bGZ6cWpXVnpPVEFxcDRnTVVyRnlVWnlXaDVleTd0UzVl?=
 =?utf-8?B?MEhxbzQ2bSsvQW12OUtjUE5Ec3Q3VFpmVHd0VWlHKzFCS2NDM016UEg0WXlO?=
 =?utf-8?B?SUFoZ0hLUUhjQ1J2VVN3aWdEQjZvYVNBYzF0aVZGNTRteUc2TFhGd0EzSU5i?=
 =?utf-8?B?NVV5c0I3SnNsalk3QUFLR3pTOEo2YVlRNENkTWt5K3pTb3VOaTkrTDhrOGV4?=
 =?utf-8?B?cUFzdHg3RklNZjJ1dGt5eGZ2NGJsZ04zRit2L1FaOGV4bE5wbEg3QjFXNUU4?=
 =?utf-8?B?YndtRVkvd1UzK1RvRGoxeTg4eW5jbDBmam80WkxUZXVFVUxyMHN4VUJ0d25F?=
 =?utf-8?B?WVBvNnNyN1owSGRRNWJaWXd5MFBCRUhybTk0SXBCdTBBZUwydGNFMFlPQThu?=
 =?utf-8?B?UktIcFY5OU5Sb25ETjRCb0lRTlZ0UUJCSVM4MStqOFFzM1psSExwcExKS0Z1?=
 =?utf-8?B?eVFyaVROdFV1c0VKVEQyemRCTDZqUHE4NXN5TEVwdlFXUHdQcSsrazdDMWNQ?=
 =?utf-8?B?TVFYSVdEanNIWFpjVGhhTi8zSkdROEhuNVNzaTkrZjJBNEdLS3M1VUc1M2ZD?=
 =?utf-8?B?eThHUTRZYlFHdWQyUm1GNjJ5QWVyc1o5ZGh5bjFEQVpwS1Npam9OK01tQ2x6?=
 =?utf-8?B?M1RveElpNUthRmc2TnlFQWJNbFlvendqTnRwR0tERFAybUtTYWNGMzJiVDVF?=
 =?utf-8?B?aGEvV2wrdXo4WGJuclRHY256RkJvQ2tvU01KeVZQWUF2MkkxRm1Vdmd0WUh3?=
 =?utf-8?B?N0JzOWlkV2t0d2RveTFSQmd6Uy95eXdoZHg1dy9kUzFYUzZCOXo4WHphbkt0?=
 =?utf-8?B?L0V1aVcwNlowdXZJWjZTTXZHdTFrUnBUNjFOUk1wN2NJYTlHWkg3Q0FPWUpJ?=
 =?utf-8?B?eHlNSDkyT2JJaWtNSjZiMW1CY1Ixa1QwdVQ5WWI2SzUyVzl6QlBZcDNOYzV4?=
 =?utf-8?B?OGRLdExLek0yU1YvT2JQREZVekJzL0hYQ0F6L1cxUWM3Q3RzUkZudTh5ekJS?=
 =?utf-8?B?bjVFeEEvN0JwK2RFVzY4SnZ2TXdsY0Q4blZWSWJYdjBOaHlZT29zb1pvTExa?=
 =?utf-8?B?ZEhUZ09MbW5vcFhRU05EU1RzTSt4b1VNNTNNMG5wVlFyTEwwa25pSGtFSkhX?=
 =?utf-8?B?bWYvWXhjaVdhMjkxZ0VZcDlJTWsvMXQ5UEJtMW53dFlNRWZuSi9yU0hndVIy?=
 =?utf-8?B?SkhoVjE3dzgzMjlRNTlXWXZoOUxBSkU0aUpTRlhDSEhTTGh5d1RtMGtieG1r?=
 =?utf-8?B?LzFiYk9PNGMvM3J0NFFFSkY2YURrL3FLditGdTR0OTdBZDE3L2dYKzB0cUV4?=
 =?utf-8?B?MytQZGdZVm5HVEtVRC9HeW54aHJzUGc4SEl6cFQ4cHcrdTRBdytjNlpIYUJ5?=
 =?utf-8?B?blBudnJkcE40Y3F6YmpoeDdrNkJKcjFya2tTcUo3cEZOSjgxdGNaSkFiQzJ5?=
 =?utf-8?B?NjJGWnV2WGJrOHVzRGtuSHEzMFMzdVRDblZRS1lHeXlXbVhVelZsNHpUTWow?=
 =?utf-8?B?dnRmajgxc3dCQ2o3T2FlTG1zTldsQk5wWlFJdjdieEpZNEJyYWhLSm9oNkpE?=
 =?utf-8?B?cnBXRVZqSEtqZmUwbnQ1S29qWlhPSVFIbmNqZHJiRXhNd2diRnFMNzJBWXRN?=
 =?utf-8?B?MnBFV01wamw3ZEhCTjY1U0swd2ZkYTc0RHdaNFBoM203K2hmSDFkUmdoMGFG?=
 =?utf-8?B?bCtPVkRSZHd1QzYwb2pibnFtTEtsN3RuRUFEb3QzKzQzZVNkK0JmalRmb1pl?=
 =?utf-8?B?OHdSaEF0MHVtdUhJU3BqSExROG45UHFnOGV2YnF1V3owYnMxekZNTXVwdUNQ?=
 =?utf-8?B?cHZCZlJjaE5wQ2dPSHRDN1lMVTZPb2VObkxuMkY4OUpPMU04ZFpTTVZkcG9r?=
 =?utf-8?B?Rk5kZGl6NjBuM0htcFQ4KzFoQmFEcE9Va1BVck1IU00ydHdUbFZCcC9MU21k?=
 =?utf-8?Q?8ohO7qVmylbYOfEQDZ/hRBjuk?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EAEC533BDD4F640B3F86792FE168847@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f3c91e-d524-41f0-9a92-08db6df25ecc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 22:46:34.2817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYiJyEPXiXJBTOPKWeV3j2T+v8cmB4dDUh0X31j1kJ4y+W3kecM2gMf6TBX2wTldopN1adYgatKdF31SXmF8FIFA+CFtdEnfrptYm3o4tOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3301
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA2LzIwMjMgw6AgMTg6MzQsIFJhbmR5IER1bmxhcCBhIMOpY3JpdMKgOg0KPiAN
Cj4gDQo+IE9uIDYvMTUvMjMgMDk6MTMsIFJhbmR5IER1bmxhcCB3cm90ZToNCj4+DQo+Pg0KPj4g
T24gNi8xNS8yMyAwOTowNSwgVGltb3RoeSBQZWFyc29uIHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiAt
LS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tDQo+Pj4+IEZyb206ICJSYW5keSBEdW5sYXAiIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+Pj4+IFRvOiAiVGltb3RoeSBQZWFyc29uIiA8dHBlYXJz
b25AcmFwdG9yZW5naW5lZXJpbmcuY29tPiwgIk1pY2hhZWwgRWxsZXJtYW4iIDxtcGVAZWxsZXJt
YW4uaWQuYXU+DQo+Pj4+IENjOiAiU3RlcGhlbiBSb3Rod2VsbCIgPHNmckBjYW5iLmF1dWcub3Jn
LmF1PiwgIkxpbnV4IE5leHQgTWFpbGluZyBMaXN0IiA8bGludXgtbmV4dEB2Z2VyLmtlcm5lbC5v
cmc+LCAibGludXgta2VybmVsIg0KPj4+PiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4s
ICJsaW51eHBwYy1kZXYiIDxsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZz4sICJBbGV4ZXkg
S2FyZGFzaGV2c2tpeSIgPGFpa0BvemxhYnMucnU+DQo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBKdW5l
IDE1LCAyMDIzIDExOjAwOjA4IEFNDQo+Pj4+IFN1YmplY3Q6IFJlOiBsaW51eC1uZXh0OiBUcmVl
IGZvciBKdW4gMiAoYXJjaC9wb3dlcnBjL2tlcm5lbC9pb21tdS5jKQ0KPj4+DQo+Pj4+IEhpIFRp
bW90aHksDQo+Pj4+DQo+Pj4+IE9uIDYvMy8yMyAyMDo1NywgVGltb3RoeSBQZWFyc29uIHdyb3Rl
Og0KPj4+Pj4NCj4+Pj4+DQo+Pj4+PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tDQo+Pj4+
Pj4gRnJvbTogIk1pY2hhZWwgRWxsZXJtYW4iIDxtcGVAZWxsZXJtYW4uaWQuYXU+DQo+Pj4+Pj4g
VG86ICJSYW5keSBEdW5sYXAiIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+LCAiU3RlcGhlbiBSb3Ro
d2VsbCINCj4+Pj4+PiA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+LCAiTGludXggTmV4dCBNYWlsaW5n
IExpc3QiDQo+Pj4+Pj4gPGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPg0KPj4+Pj4+IENjOiAi
bGludXgta2VybmVsIiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJsaW51eHBwYy1k
ZXYiDQo+Pj4+Pj4gPGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPiwgIkFsZXhleQ0KPj4+
Pj4+IEthcmRhc2hldnNraXkiIDxhaWtAb3psYWJzLnJ1PiwgIlRpbW90aHkgUGVhcnNvbiINCj4+
Pj4+PiA8dHBlYXJzb25AcmFwdG9yZW5naW5lZXJpbmcuY29tPg0KPj4+Pj4+IFNlbnQ6IFNhdHVy
ZGF5LCBKdW5lIDMsIDIwMjMgNzoyMjo1MSBQTQ0KPj4+Pj4+IFN1YmplY3Q6IFJlOiBsaW51eC1u
ZXh0OiBUcmVlIGZvciBKdW4gMiAoYXJjaC9wb3dlcnBjL2tlcm5lbC9pb21tdS5jKQ0KPj4+Pj4N
Cj4+Pj4+PiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JpdGVzOg0KPj4+
Pj4+PiBPbiA2LzEvMjMgMjE6MDEsIFN0ZXBoZW4gUm90aHdlbGwgd3JvdGU6DQo+Pj4+Pj4+PiBI
aSBhbGwsDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gQ2hhbmdlcyBzaW5jZSAyMDIzMDYwMToNCj4+Pj4+
Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IE9uIHBvd2VycGM2NCwgYSByYW5kY29uZmlnIGZhaWxlZCB3
aXRoOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vaW5jbHVkZS9s
aW51eC9saXN0Lmg6NSwNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgZnJvbSAuLi9pbmNsdWRl
L2xpbnV4L3ByZWVtcHQuaDoxMSwNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgZnJvbSAuLi9p
bmNsdWRlL2xpbnV4L3NwaW5sb2NrLmg6NTYsDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgIGZy
b20gLi4vaW5jbHVkZS9saW51eC9tbXpvbmUuaDo4LA0KPj4+Pj4+PiAgICAgICAgICAgICAgICAg
ICBmcm9tIC4uL2luY2x1ZGUvbGludXgvZ2ZwLmg6NywNCj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgZnJvbSAuLi9pbmNsdWRlL2xpbnV4L3NsYWIuaDoxNSwNCj4+Pj4+Pj4gICAgICAgICAgICAg
ICAgICAgZnJvbSAuLi9hcmNoL3Bvd2VycGMva2VybmVsL2lvbW11LmM6MTU6DQo+Pj4+Pj4+IC4u
L2FyY2gvcG93ZXJwYy9rZXJuZWwvaW9tbXUuYzogSW4gZnVuY3Rpb24NCj4+Pj4+Pj4gJ3NwYXBy
X3RjZV9zZXR1cF9waGJfaW9tbXVzX2luaXRjYWxsJzoNCj4+Pj4+Pj4gLi4vYXJjaC9wb3dlcnBj
L2tlcm5lbC9pb21tdS5jOjEzOTE6MzY6IGVycm9yOiAnaG9zZV9saXN0JyB1bmRlY2xhcmVkIChm
aXJzdCB1c2UNCj4+Pj4+Pj4gaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UgbWVhbiAnem9uZWxp
c3QnPw0KPj4+Pj4+PiAgIDEzOTEgfCAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkoaG9zZSwg
Jmhvc2VfbGlzdCwgbGlzdF9ub2RlKSB7DQo+Pj4+Pj4+ICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+DQo+Pj4+Pj4gLi4uDQo+Pj4+Pj4NCj4+Pj4+
PiBob3NlX2xpc3QgaXMgaW4gcGNpLWNvbW1vbi5jIHdoaWNoIGlzIGJ1aWx0IHdoZW4gUENJPXku
DQo+Pj4+Pj4NCj4+Pj4+PiBQU0VSSUVTIGFuZCBQT1dFUk5WIGZvcmNlIFBDST15Lg0KPj4+Pj4+
DQo+Pj4+Pj4gQnV0IHRoaXMgY29uZmlnIGhhcyBuZWl0aGVyOg0KPj4+Pj4+DQo+Pj4+Pj4gIyBD
T05GSUdfUFBDX1BPV0VSTlYgaXMgbm90IHNldA0KPj4+Pj4+ICMgQ09ORklHX1BQQ19QU0VSSUVT
IGlzIG5vdCBzZXQNCj4+Pj4+PiBDT05GSUdfSEFWRV9QQ0k9eQ0KPj4+Pj4+ICMgQ09ORklHX1BD
SSBpcyBub3Qgc2V0DQo+Pj4+Pj4gIyBDT05GSUdfQ09NTU9OX0NMS19SUzlfUENJRSBpcyBub3Qg
c2V0DQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IFByb2JhYmx5IHRoZSBzcGFwcl90Y2UgY29kZSBz
aG91bGQgYmUgd3JhcHBlZCBpbiBhbiAjaWZkZWYgdGhhdCBpcyBvbmx5DQo+Pj4+Pj4gZW5hYmxl
ZCB3aGVuIFBPV0VSTlYgfHwgUFNFUklFUyBpcyBlbmFibGVkLg0KPj4+Pj4+DQo+Pj4+Pj4gY2hl
ZXJzDQo+Pj4+Pg0KPj4+Pj4gU291bmRzIHJlYXNvbmFibGUsIEkgd2FzIGdvaW5nIHRvIGxvb2sg
aW50byB0aGlzIGZ1cnRoZXIgb3ZlciB0aGUgd2Vla2VuZC4gIEkNCj4+Pj4+IGNhbiBwdXQgdG9n
ZXRoZXIgYSBwYXRjaCBmb3IgTW9uZGF5IGlmIHRoYXQgd29ya3M/DQo+Pj4+DQo+Pj4+IERpZCB5
b3UgcHJlcGFyZSBhIHBhdGNoIGZvciB0aGlzPyBJIGFtIHN0aWxsIHNlZWluZyB0aGlzIGJ1aWxk
IGVycm9yLg0KPj4+Pg0KPj4+PiB0aGFua3MuDQo+Pj4+IC0tDQo+Pj4+IH5SYW5keQ0KPj4+DQo+
Pj4gWWVzLCBpdCB3YXMgc2VudCBpbiB0byB0aGUgbGludXhwcGMtZGV2IGxpc3Qgc29tZSB3ZWVr
cyBhZ28uICBEaWQgaXQgbm90IGFycml2ZT8NCj4+DQo+PiBJIGRvbid0IGtub3cgLSBJJ20gbm90
IHN1YnNjcmliZWQgdG8gdGhhdCBsaXN0Lg0KPj4NCj4+IEl0J3MgcHJvYmFibHkgc3RpbGwgaW4g
dGhlIHBhdGNod29ya3MgcmV2aWV3IGN5Y2xlDQo+PiBzbyBpdCBoYXNuJ3QgYmVlbiBhcHBsaWVk
IGFueXdoZXJlIHRoYXQgZ2V0cyBpbnRvIGxpbnV4LW5leHQuDQo+IA0KPiBPSywgaXQncyBoZXJl
LCBtYXJrIHdpdGggU3VjY2VzczoNCj4gaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvbGludXhwcGMtZGV2L3BhdGNoLzIwMTU5MjU5NjguMzU0Njg3Mi4xNjg1OTkwOTM2ODIzLkph
dmFNYWlsLnppbWJyYUByYXB0b3JlbmdpbmVlcmluZ2luYy5jb20vDQo+IA0KPiBJIGRvbid0IGtu
b3cgd2hhdCBoYXBwZW5zIHRvIGl0IG5leHQgb3Igd2hlbi4NCg0KSXMgdGhhdCBzdXBwb3NlZCB0
byBmaXggYW55dGhpbmcgPyBJIGRvZXNuJ3QgaGF2ZSBhbnkgRml4ZXM6IHRhZw0KDQpDaHJpc3Rv
cGhlDQo=
