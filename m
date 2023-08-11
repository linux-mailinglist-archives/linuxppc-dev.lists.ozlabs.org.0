Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FDC7787A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 08:46:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Dnv/fMef;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RMZ853CN2z3cM3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Aug 2023 16:46:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=Dnv/fMef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::610; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RMZ782rXYz2yZV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Aug 2023 16:45:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlsKiqbhaA2KL6FodtE7bwp4COpcC+EicT3zzMf9d6a3PtiNfhSi/UTrWBnSLTIFP+tJDMD8WLXRamhkldI524XU6qflorpK6C8xCLvRIDojKGYM/PhYGD7C/zDwoPI7viCS4rt3DdbHSr+c1rkmyALLne58EHyuj/e4dYwzhACWSx9d4Y/H4bmQ5z8XCgcC4W8WgfV8kqGTKOJKH3kGLTgWNdB6gTP3V7GiOmL3fdGCP0vUIvZPF6A/E7Y+eLPwz9wPMHejf/UkpmfuG9+H79ob/dSP2LptHnHW9ZYqkIFUhtjEvlacbJukxl/zcWZxYKC+mDBdweQEgTkMgC4z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMEzAaz3kAgH1MVLViHG1edmIvcKpoWIgCZF9SUV4V0=;
 b=EB31vcxda8iIuWiKGPrQS8dRL8BQtyEOnyDsebs5PnfZx0zWse0LMrIu3rCv+vH9LhDk3ZkkNFNjaHHNQQw1cAuvO+EO95pRmhcjKaZinRPVDy8FFFkyIOKOrCgndk7P9iKa8lwOYB0Z1/pehAAFgLQJGTVa7b4+6tHg/ajcchuvMnuKtHH4SJrNQeYPSq147aW+PRGQFbxo98zQ7zDAiokh5ex2IZOfwIuU959EkTiCmZU/+FVFsN4yaIwxkrOwxIGZE4DyF8HOrw2MxKZ3xC3wJmDFtpG2ktMOFS09GkiCB76aMxnLpDDfSuX6hpUOb6EJBr+v2UaYvaJ+4z2xyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMEzAaz3kAgH1MVLViHG1edmIvcKpoWIgCZF9SUV4V0=;
 b=Dnv/fMefi6e4EKQOMFQHRFfIh+FxEQROoUSF1LWQNW7Cgzhy1c++B6F5jBizdJ00+ZYiVvgww/WKVp74eMPEpG+nRuR0D/z4nvnIB69KVm/SX9Rg9z9cw0gW5DOVfNEdBKs5jJkhks8j1EmuxGGobOtByAIMZxeozigluQltnc80+C7aUNitp0pPvNVrmAN/dgb8yFi0lr5Q/GmfxVCjJjXv3kyQK5B7cZuFWY3Lr01qY3A6Vo903572B50tSp3V+cAFNxEhmmCrlpOGdE9af7yYTSwsufo2QcnKS2uvfEeqjiHPOa1RxmMXarRp45uSKycbkmbuni0/y9NFrl71dQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1951.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 06:45:14 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2820:d3a6:1cdf:c60e%7]) with mapi id 15.20.6678.019; Fri, 11 Aug 2023
 06:45:14 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Erhard Furtner <erhard_f@mailbox.org>
Subject: Re: KASAN debug kernel fails to boot at early stage when CONFIG_SMP=y
 is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Topic: KASAN debug kernel fails to boot at early stage when
 CONFIG_SMP=y is set (kernel 6.5-rc5, PowerMac G4 3,6)
Thread-Index: AQHZy+ViBGkHrlry0EW7JbY0oo0AC6/kpveA
Date: Fri, 11 Aug 2023 06:45:14 +0000
Message-ID: <f8f09049-3568-621d-88ce-1b61fe8b63fe@csgroup.eu>
References: <20230811014845.1bf6771d@yea>
In-Reply-To: <20230811014845.1bf6771d@yea>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1951:EE_
x-ms-office365-filtering-correlation-id: c77b8840-d852-4dbd-0bd7-08db9a368477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mAWgMOgiPRCRGLSMOIoCZ0il5t9lDPT+tDUqCfcfBH5ca1mDep+vuIj0uQmVfPhxnUg9P5QTfFdlcbjh7tZcrIkJWCeLXV2rSV5DZrvcExLhbo0fehTfZBLk19BberVM96iDIsEFwHlzp+CX2K9qzdPFRvet5yDtgx0++nsTWdb7XRlF3WMBWT3TeCDz2fpteo957JaEqe6NkyXOumVHgJ/+5JHDdVJ89YlYCnPRDoRCrvZIDmQ+qWQyODJt/eO5cjZSr0Y0Hz4UDPVJrU6caA9X4vnodSVsEqKupJqaydCY7TBm0HuBy/6GEXenDxwLXP3TD98jgJSZ8s3SekOo3NoVhoWxah5PybhU3DqiYpdKKAqqOiZcDynpCwkr9IN3RIbHsySFetMDanDGO+XGOahXAk6oErQqo1l6euOpodBdQLxfln2+i6K68UuE3wlVzLxngvXrnxcqdymWu/Xvc7TNDbRV5VK4BfZ3D9396cA1GixF3yBjFguA0jFp8+Obm6AgSLXfia+988cKQn0lKTXQMzqLoIxNNWj2TlDqFv9vUxqOpQej5N/2y2F1BjOQ2YUJGS2nL45ADs+bc9pjbpOAf1HyIHGoArI0cWLJjE+NHvpaz860Ax5HFoY1t0gkaG6yd3xgqThp4MexrYlbzJzZSn3/St03K6DMChRK8/g=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(136003)(346002)(39850400004)(1800799006)(186006)(451199021)(6512007)(966005)(4326008)(91956017)(76116006)(6916009)(66946007)(66446008)(66476007)(66556008)(64756008)(316002)(31686004)(6486002)(478600001)(71200400001)(8936002)(8676002)(5660300002)(26005)(6506007)(41300700001)(86362001)(31696002)(38070700005)(44832011)(36756003)(4744005)(2616005)(122000001)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?ekUzcnNWNExUQTU0TzFGS1RCWkJsa1hmRmVYMFUwN3YwblB1WGRSdmZNMjZS?=
 =?utf-8?B?eUtSYk40OFd2RmhLd042T3AwKzlPQ3poM3h1WU9RY0FoMFRDaXVZS0ljQUNS?=
 =?utf-8?B?UUQzd2svcjRoWkxqTDI4OW1qbXI4WFo1ZHEzR1hwUUdCVkxtU2RJMXprcEpN?=
 =?utf-8?B?VWhLbit3Wk1iaVdFVzUyVi95RzBSc3hTSThsbUphTU5aQzA1WmRPTlhTcUNX?=
 =?utf-8?B?aWk3QXJiSDlzbmZGVytOQXVQakc1VTJQOEN4WkpFOFNXOGpJdldCTGNMWm1E?=
 =?utf-8?B?ZTZ1ZGhxNXJXSmh0L1RPbUx0OEVidXM0WGtQWjJXT2c1Q2FJc3BRVDNVRk1X?=
 =?utf-8?B?RG9ZSFFtNFhRVkpLT0RsdVVFRXFFb0krSjFGeDhiYjdaenlQVkVKN25yaEx6?=
 =?utf-8?B?dkRLcmNqZDFLV0pGaEwxdElkMHMyUjdaQ1ZPZkRoWWkyR2k0eDAxN1dFVzhM?=
 =?utf-8?B?T2FZeStpSU9IYWRiYm5EUVpMMjVMbUdjUTl4SUovaFRLZkNKY29lK2t6dCto?=
 =?utf-8?B?dGd5emhyeGRkR2hBR0RVYkNvNHpSQmlrWFhaOFVNMlBMZG10T2xmM0lwWFpN?=
 =?utf-8?B?RWdYdXBKS0M2Q1dacnk2QUYwTjhWY1ZRMkMzcGZaN0ljKzFFMWhjSitBZTBQ?=
 =?utf-8?B?L2RJVWYybW5ha1FXakZIYUR4eXB4Z1FpZzBVMzRWZEVJMHEvVWN6ZFdaVWFY?=
 =?utf-8?B?UGFPNG0vckVzcG00U1pzQkVVYm1aWGZORnFZN3BZQVBad3V6dXJHeVF1OFo3?=
 =?utf-8?B?N1JOVE9RaTVsak5lcElSNjFCODBjYUI1QVN4bHV3ay9Td2ZPbGpWeHc5YW1L?=
 =?utf-8?B?UyswMUFTMjh2Qk9ZQy9CM04xaUpMVnM5c3VqOWxQNWVMc3BkMjRYM2dnRklH?=
 =?utf-8?B?dW9YVHRQVXpsaU1YZEwzZVhyUWowRGZxMzVwWWtVWVJNVkwvdEtiSG83bUc5?=
 =?utf-8?B?a1VFWHYwMmZqMDdhSCtMV2FTTHhFQ1d3ZCtuWmFiTjFTVHVpU2V1R0ZQMXE5?=
 =?utf-8?B?cnM3MmRtM0pxbkxBWDkySW5RNGtoa21HZmdBQU5pUGNiSERabFByc1ZlSkRx?=
 =?utf-8?B?S3Q2eHhwWXcxWmpTSG90UlFUdXNidGVHZmdTZngraFVPcm5yUVNFTzJxU0xM?=
 =?utf-8?B?Yzl6TE5VUG9qVGxiaUFDUFlKbnBMK1Z3K2V6Rm1sT0hJL0RndDhISHdlckxL?=
 =?utf-8?B?YzRxSi9RYzJWTjZwWWthaVRGdzZjZmszMklldDBBbjRkcS9RM2hDMmhkUG5G?=
 =?utf-8?B?VHI1c3lSb1VPbHpuYmpjTitqV3NGbkQ0RUc1MzZLRlpzd2xxL3cxWHNneERO?=
 =?utf-8?B?OVdCVzQwUUpLK2lGMC8vV2tMSEV0R2dTUldjc0t2cy9sektzVndSbnMrcmZ0?=
 =?utf-8?B?bFUxZWhxQWRIVXIzWUxpbWRGYVNnV09RVG80aEZPQy9BOWlqeG01Yk5sTzQ5?=
 =?utf-8?B?dW9sZmdRV2UwZDdvMzhOeVV3UUxzTmgwK0NMNGROK3VwL1NFV0RZNEdyejJo?=
 =?utf-8?B?RmQ5ZzJudG5DMHdWUlJrY0xaQ01OWFdDcVVmY1ZQUU1VeTlrZk56NHl6VTNx?=
 =?utf-8?B?dUtiOXNXeE4ra0ZHTWEvbzhKbm1QMHFuL1YwZlNnbUlidldCMWg2aEUwTUpH?=
 =?utf-8?B?NHFIVVl2dW8rc3c4VTUyVFdYbkFwRzk2UU5USjVNbEh5OHQza2VhWVI0YXFZ?=
 =?utf-8?B?YVFaL2Q4VkZTY2hxL0xXOEw4S2VkTlFTYWtCQk1PYm1FWUM4SEo3b0pzRlpK?=
 =?utf-8?B?MkUrb29ZdWwyazhtbmZ3dk04S0EyT2VMSTh1OGJTOXFVVmREdG1KZER3elMz?=
 =?utf-8?B?RjdYc3RmQ2VJZnpwQ3MrdlcvL2owN2dOcGlzQ1VwMDdCejlZQWc3VGJFdGlk?=
 =?utf-8?B?cjdlL2s5Z1JEbVRqQ0VtL3FEUjdnMVlNc25QR1pBaFEvUDRIYzdMd3VqbjdJ?=
 =?utf-8?B?dEgxZ0FNYlVBZFNiUVVnRlpBZUlLY3EwYXNUSnYyQlN3V0s2dHZTVmdYREx4?=
 =?utf-8?B?eTRZaXpJZWlydzNaMDR0QU1ha2VYdy9TRWFCOXo3UnB0NE9ZdHlXUVAyRU9y?=
 =?utf-8?B?S1REV0FNMFo5YVBENldzM0lBMEVFREUySjRBUUgyT2hOYWlyZ0M1eUh1TE5i?=
 =?utf-8?B?TklEZUdURUsxSlowdDVES1V2RjYwZm96YVNFUHpGeE16cmpDMmJIeG9EUFdi?=
 =?utf-8?B?cGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <626AA06D905B67488F107653D23617BD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c77b8840-d852-4dbd-0bd7-08db9a368477
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2023 06:45:14.3999
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4k7QNTYw1xrZppQ5PeZFFWErbDH1GSP5LkwYyr0M3HagpXnsIGCbrZNcKJi+US7S3AYvIMHAEfKnn4DeAKGYjlWaHd3qn3trTa75m5PiYxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1951
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

DQoNCkxlIDExLzA4LzIwMjMgw6AgMDE6NDgsIEVyaGFyZCBGdXJ0bmVyIGEgw6ljcml0wqA6DQo+
IEkgd2FudGVkIHRvIGZpcmUgdXAgbXkgUG93ZXJNYWMgRzQgTUREIChEdWFsIENQVSkgd2l0aCBh
IEtBU0FOIGRlYnVnIGJ1aWxkIG9mIGtlcm5lbCA2LjUtcmM1IGZvciB0ZXN0aW5nIHB1cnBvc2Vz
LiBCdXQgdGhlIGtlcm5lbCBmYWlscyB0byBib290IGF0IGEgdmVyeSBlYXJseSBzdGFnZS4gSSBv
bmx5IGdldCBhIHdoaXRlIHNjcmVlbiByZWFkaW5nDQo+ICJkb25lDQo+IGZvdW5kIGRpc3BsYXk6
IC9wY2lAZjAwMDAwMDAvQVRZLEFsdGVyYWNQYXJlbnRAMTAvQVRZLEFsdGVyYWNfQkAxLCBvcGVu
aW5nLi4uIg0KDQpDYW4geW91IHRyeSB3aXRoIENPTkZJR19QUENfRUFSTFlfREVCVUcgYW5kIHNl
ZSBpZiB5b3UgZ2V0IG1vcmUgDQppbmZvcm1hdGlvbiBvbiB0aGUgc2NyZWVuID8NCg0KQ2hyaXN0
b3BoZQ0KDQoNCj4gDQo+IFdoZW4gSSB1c2UgdGhlIHNhbWUga2VybmVsIC5jb25maWcgYnV0IGRp
c2FibGUgU01QIHRoZSBtYWNoaW5lIGp1c3QgYm9vdHMgdXAgZmluZSB3aXRoIHRoZSBLQVNBTiBl
bmFibGVkIGtlcm5lbC4NCj4gDQo+IFBlcmhhcHMgYSBzaW1pbGFyIGlzc3VlIHRvIGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE2MTkwID8NCj4gDQo+IEtlcm5l
bCAuY29uZmlnIGFuZCBmdWxsIGRtZXNnIGF0dGFjaGVkLg0KPiANCj4gUmVnYXJkcywNCj4gRXJo
YXJkIEYuDQo=
