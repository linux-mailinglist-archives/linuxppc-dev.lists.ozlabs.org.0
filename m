Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB9573C999
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 10:32:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UmIqQJdb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qp6m26ywWz3bwL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 18:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UmIqQJdb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::629; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qp6l5371Kz30Kc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 18:31:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7KHJRYgGkKxsj/D5Q87MHIxmvSnAGup+xQm6EhBVLYhKR2F4khydPzfTBMy0FtsFp3sIlZOxNEQO0HDpxFsWfHfdm/1bs+FZ87DwvmNiWmMmYdbOVjNtn5r6kKzLVGff6F+7fJQ/Z5/GM8qFz4kPmwhpIpzVknAXQm+3l3pWg8ZrsbBWhtCUk9GpcD4NpVi5pMHm0UlpmTyVcydyB8ogjI21t0yItDmzY3MIqeaqwCosd+y0/ev90UW8CBLK4W0j/eXHVrt5idpzuuZMcaK8NurNZ9x+N/sOrAOuTxUjGsj//UKOaDrJUZW8rSwTt9OsOuuHnTfDBqRlxf12hnoCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6Z1M/LFxwDoSL2tkShy/O73sUYqVg2z/8sxbo8GLoE=;
 b=lXU7yALH7trGK12GxgK/sgsvaroGt0trkxb7hCdk36nLodLlreYOMS+3IL/teR6kSbjcsL32DvMrldv1XV/HJ5usFa605pU0myNASK3Kis25VnBUMts56uDsYxP739lK9Fy98NpZmU9sH3cWVlka0Wx4zPLPw32J7wUDxfWRUvVhqvavgdeXJ6YD18dNEm5zV4UTie4MJo46ysvt23oHZN7dVBPL0UVueVU9thS8djaez/WcraOCzSoMJYPWDI/qbdMQK/v4hqUBFyOhbwVsrKZaMiIywXDUCmzgrp6v0iOY8t6WZkCPzmXH95B0w1Vr9BbCENQ5f8hFh8w0TAi3Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6Z1M/LFxwDoSL2tkShy/O73sUYqVg2z/8sxbo8GLoE=;
 b=UmIqQJdblLgmFqLc5x/hWZAx6MIU11qPIP1ljROXvfXEn3OzlCK6GE+hOyFHns/gCeuiiXVAL8FQSP3NzDkb9Ha/DJcgWEmMlN6v0/9kQV2Rlp4x8itxF/UNWrmRmImO4HmqTrMlrWkNyeqHU3jd2FqCnToySTJphFg17MORqGqqbO5BVzVF8ltxdfHsX8GSFDIFmXoak1z66plOKjrXesIgNqTNcsRMKN4k9KapFwuamYYiTbVl4t/8Bf8qYh8BlC18fc2ZQsnoL4z/naeJwtzoVL6cK4JDFSaNnmFWU/eT8zuV379ooTSZ1uMA3YFffB95whVdrgGvhC3flo+usA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1983.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Sat, 24 Jun
 2023 08:30:49 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::802b:33:561c:4217%4]) with mapi id 15.20.6521.026; Sat, 24 Jun 2023
 08:30:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: kernel test robot <lkp@intel.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] objtool: Make 'sec-address' always on
Thread-Topic: [PATCH] objtool: Make 'sec-address' always on
Thread-Index: AQHZpFPzGL/C1oJ21UmOsq1ptiKwsq+Zk6YAgAAQCgA=
Date: Sat, 24 Jun 2023 08:30:48 +0000
Message-ID: <2bd6c377-51ac-e2e2-6fcf-9c9b0f96f9cf@csgroup.eu>
References:  <e7e1de1d01194df3ff4053cb0815fc2ddba33213.1687360711.git.christophe.leroy@csgroup.eu>
 <202306241520.4jIgEhK4-lkp@intel.com>
In-Reply-To: <202306241520.4jIgEhK4-lkp@intel.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR1P264MB1983:EE_
x-ms-office365-filtering-correlation-id: ef991a02-d4a4-46b9-136d-08db748d5049
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  1NCfPbDs1h84EectXWcI3IfuX77rKurkhcfkcb8CNQMRUkdG1kcs3hXllG+u78DdcdlQNzIGuUwR6IllgI7jjp2f/ho4qCw6FP9H3a/d3nmUGhel3W4RjoELNR99HUuS6PbgtidrXmOpr890WQk7GjsdlATvKzEuiKFVdztUUrmh1YgkpiP4LnTA3DTgAbXYxYbDdFkRdOPY98c3LE4JK/JlHBwfl28LbhdcDpi/KTHJquA89dP/MQcovCL/RohiTkMX+74/M/N16nI+HYX+6ped/YTLBDVR8Asg56r1aqy+cMaDCiwImRA9476vIYH2zbIg4Fdk2O8/+CHDsnBOvCU45s57635UmVDYx+a7wRxblZtq9kKCr6Wyr2Ua70COaAxuqyKoUe9lhyvU/LzLIqNLxy9xs438tdkH10kCIKOIkZNEtDULgRLoQxUAnJR8iapVXIvqJbxTPGN78iwEtaHTg5wC0XUst238pmoGoSlwSufGI9ngozaaSM6qWZtJX4fyLiF0lLOPl41KI3GOnR1aiW9GvcAeF/j3bSlqviJ6ObgijPMfzQ0bC+FqT3Rylxnyju8ou7EzmnnRd0BUgL0IFc4JIB/VdRCSEpjEtIft5nglZFfzTxoMGtlF0wR+bsIf4r6mTGpluHxCxx76gFZtUCbcjTES1/ZtmRDPgwY=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(366004)(39850400004)(451199021)(66446008)(66574015)(966005)(6486002)(478600001)(71200400001)(2616005)(54906003)(110136005)(83380400001)(6512007)(6506007)(186003)(2906002)(5660300002)(44832011)(36756003)(38100700002)(122000001)(76116006)(91956017)(4326008)(66946007)(316002)(31696002)(86362001)(8936002)(8676002)(41300700001)(64756008)(66476007)(38070700005)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WVRYZEt4WUV4WFltTlhxUXN6N25uRXZBVWxjN0xtK2ozZC9VWmd0ZmpCRWdo?=
 =?utf-8?B?ZThpcnVwdXY5NkUwQmVocVZNZU5NRzdoOUVjaVBDbHpwclpDY05Fb0o3ckMy?=
 =?utf-8?B?UnlBeTZLdnJ3QzJOeXNUTXc4TFpCc2VNYVVmOTgvOHBWUHcvbHJIbVYvY1hG?=
 =?utf-8?B?K01RTC91NDY2bVZuK1dwNkMwQUJOVjZyVkxKQ0swQjVsS0hJUXo3bHFDa0Zr?=
 =?utf-8?B?SStYNE83eXY2dGVvNWIxOHd2ZWxhUDhtTHlnanpRekwzQ2ZJZTRpNVdrVjVV?=
 =?utf-8?B?bURTMVdQWVR2QTczNHNTVTlNcmRheHZkSHArWjRFMXlzM3JVZUtmOTFFbTJD?=
 =?utf-8?B?NE5jSzRPb1JWT3M2bUlsMkZhVDhkdUVHR3ZIbVdmYmpvaFRCQVpybkMzVEVT?=
 =?utf-8?B?cG5aUTNHQ0dJZXhqbEJEaDhFS1RxOWw5MExuSWJvZWR3UFpFU21zOGlRam83?=
 =?utf-8?B?TTNBcWFSbHBIZ2hSTENpRk01c3ludU1oYUw3NUNGVE9tU3VoWU9pOXJXdVo1?=
 =?utf-8?B?ZHpqM1ZTMGZOV1BmKzc1Qi9OWG1OWExSSUNjb1I0OThvUG5zNUY5Zmt4NXF4?=
 =?utf-8?B?TTZPVFA0VWF3QjlsUk5XekN6VXVUNnI4R3NPUmIyZlh4WTB6ZDhRQjhqcUEv?=
 =?utf-8?B?bTZUZ3BGckF5UzlmRnhEV0lIVVJzaVQ3eU5BT3J2TnM3dTJNRFJFby9pbHhB?=
 =?utf-8?B?OGJndkQ5RGFoMDFCU2dlYUphZms2SmRGODdvRWN2bkpUS0lXbnpNcXRYV2VV?=
 =?utf-8?B?cHdObEdMY3lTTWNQVjQ5Y1dscTRkSkhEbDlJMVpaSUMwOS92bVIxREVTSFRq?=
 =?utf-8?B?VWIwL0VTN0pHeUpQblRpNFpXbXZ1ZlRLVXFBR2JaV0tWZHFyZlZsQ09aakRP?=
 =?utf-8?B?bjFYK1FBQU01S1BIOXg0MmU0c0pVNUJ4cnl0L3ZPU0dFQXpkNW41UnNiREoz?=
 =?utf-8?B?YWhtV3lPZlpPVW9VcnJSTXF1VGtuWjUxNVM4QzA1cWZxNVpFNHE2Zm1zQkJv?=
 =?utf-8?B?NVRnVTMvVU9WOTJYejVLbnpWNWNxRmVjMlI4cGR5UUY4YXJmMll6ckpTc3V3?=
 =?utf-8?B?bTA4YTBYVFl0NUcwQy9nbUgvUHU2SjdoaG5HNU1iWlBkV0lWRVNHa01nZVMz?=
 =?utf-8?B?cWwwbzd2bTh4eCtYQnFCRDZnK2taZUkrT05JRUNSNi90U1FOV2VzeTdnK2VJ?=
 =?utf-8?B?T3R6UU43YjlWL3dLdks0cFVLY3gzeUVYT044YnNPUnBKaDdFTDNHcmN6UTAy?=
 =?utf-8?B?WUUyb0xlS3ZUQzNRc3ovbkRYdWYyMGtTMjN0Zld0c1dSL3p6WVdvcHdCRmg3?=
 =?utf-8?B?ZVVGay9ZbVB2aWlyUkFLbFk5Y1VEcGIzQVY3RVNENmZVSGhvL0lqcDNub20z?=
 =?utf-8?B?NlVQaVdNSGlvWlZpZXBaWVJZRVk1M0dkbmRqRzFRQkpYSUZYQTcxK0tDTVZr?=
 =?utf-8?B?bU1SaVBGSU5QbFBhd0ZldmJkMGp2UTl1Uk1NR0pUZWFQYjNXdGNwTVc2WXJO?=
 =?utf-8?B?OVhyS2xTT2pTTmdhRDRIZjVVcWdLbmxpQ2JQSCswenU3cWVKbVVCR0pSMGdW?=
 =?utf-8?B?VlBKWHN4bnQvQUhCNFpGbnN2M3hXMThQK3A0cithSFZyMWtnUkZLS2svNVMv?=
 =?utf-8?B?dThLMExNdHk5LzE4cktlcmpMdlhjMWRWbmcwbnFweEdseVZtQTU2RkIxSlo1?=
 =?utf-8?B?Tlp1c3JsenZkdWhXdzV3dXlOTkx1SjVDZ2ZYSHVRaWYxRXlMWVMwRE9yemtW?=
 =?utf-8?B?c0tSWmFWdGphczhxTDB5NXU4QmFZbHRoYWhrZksyYlhBSlhUY0NILzZxa1lt?=
 =?utf-8?B?WlhyYkZUN2I2QzYvcjBKWTVxeThEMDFpSTM5TTFZajlraXFHdFNRVXdIUVps?=
 =?utf-8?B?RmFKUjRxZm9URVAxN0UxWnVhWXRiT1krMCt4NkdnMTJvZ3RqZEV4NWZOUE0r?=
 =?utf-8?B?UVVFckxOT1FLVVFPaVZXRkZTWUxjbzVCeEhIaitmbXEraDJnbzlxSUFwNTZx?=
 =?utf-8?B?Mld6Nmw3RXNTL1VsNWNYMFRvMWhvakdZM3lIUEMxRFNEb2lXRHYrazN2NlZW?=
 =?utf-8?B?M2tYZng2RjE1UUk3c1Z3NEVSTno4Yi9HazRJeENKUmlsNEVUOEQ2LzFNYm9j?=
 =?utf-8?B?ZWhXa1BrTjVHSnNKZGJ2Yit2T2hEMFBGYmhIRE40bm0xekg5WTdKaG1hcjdX?=
 =?utf-8?Q?HgqUHCWR5/3tphQKE7+MObisoaUhHkqOqT2/tw8N9hiE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <30DC03DAC647534C8244CEE39A9ED282@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ef991a02-d4a4-46b9-136d-08db748d5049
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2023 08:30:48.8763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0doLZXrXk2XRObDm+Jh3KxdowCQMdlXfvISrt3qxB1Q3FNT4C9bD5Cm3StHDea/jvu/VlYLOAPi+4PChD9qSvzb2xpPDU/FeVJhmnVZLCdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1983
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzA2LzIwMjMgw6AgMDk6MzMsIGtlcm5lbCB0ZXN0IHJvYm90IGEgw6ljcml0wqA6
DQo+IEhpIENocmlzdG9waGUsDQo+IA0KPiBrZXJuZWwgdGVzdCByb2JvdCBub3RpY2VkIHRoZSBm
b2xsb3dpbmcgYnVpbGQgd2FybmluZ3M6DQo+IA0KPiBbYXV0byBidWlsZCB0ZXN0IFdBUk5JTkcg
b24gbGludXMvbWFzdGVyXQ0KPiBbYWxzbyBidWlsZCB0ZXN0IFdBUk5JTkcgb24gdjYuNC1yYzcg
bmV4dC0yMDIzMDYyM10NCj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3Jvbmcg
Z2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCj4gQW5kIHdoZW4gc3VibWl0dGluZyBw
YXRjaCwgd2Ugc3VnZ2VzdCB0byB1c2UgJy0tYmFzZScgYXMgZG9jdW1lbnRlZCBpbg0KPiBodHRw
czovL2dpdC1zY20uY29tL2RvY3MvZ2l0LWZvcm1hdC1wYXRjaCNfYmFzZV90cmVlX2luZm9ybWF0
aW9uXQ0KPiANCj4gdXJsOiAgICBodHRwczovL2dpdGh1Yi5jb20vaW50ZWwtbGFiLWxrcC9saW51
eC9jb21taXRzL0NocmlzdG9waGUtTGVyb3kvb2JqdG9vbC1NYWtlLXNlYy1hZGRyZXNzLWFsd2F5
cy1vbi8yMDIzMDYyMS0yMzIzMDUNCj4gYmFzZTogICBsaW51cy9tYXN0ZXINCj4gcGF0Y2ggbGlu
azogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9lN2UxZGUxZDAxMTk0ZGYzZmY0MDUzY2Iw
ODE1ZmMyZGRiYTMzMjEzLjE2ODczNjA3MTEuZ2l0LmNocmlzdG9waGUubGVyb3klNDBjc2dyb3Vw
LmV1DQo+IHBhdGNoIHN1YmplY3Q6IFtQQVRDSF0gb2JqdG9vbDogTWFrZSAnc2VjLWFkZHJlc3Mn
IGFsd2F5cyBvbg0KPiBjb25maWc6IHg4Nl82NC1yYW5kY29uZmlnLWMwMDItMjAyMzA2MjIgKGh0
dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDIzMDYyNC8yMDIzMDYyNDE1
MjAuNGpJZ0VoSzQtbGtwQGludGVsLmNvbS9jb25maWcpDQo+IGNvbXBpbGVyOiBnY2MtMTIgKERl
YmlhbiAxMi4yLjAtMTQpIDEyLjIuMA0KPiByZXByb2R1Y2U6IChodHRwczovL2Rvd25sb2FkLjAx
Lm9yZy8wZGF5LWNpL2FyY2hpdmUvMjAyMzA2MjQvMjAyMzA2MjQxNTIwLjRqSWdFaEs0LWxrcEBp
bnRlbC5jb20vcmVwcm9kdWNlKQ0KPiANCj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBh
cmF0ZSBwYXRjaC9jb21taXQgKGkuZS4gbm90IGp1c3QgYSBuZXcgdmVyc2lvbiBvZg0KPiB0aGUg
c2FtZSBwYXRjaC9jb21taXQpLCBraW5kbHkgYWRkIGZvbGxvd2luZyB0YWdzDQo+IHwgUmVwb3J0
ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiB8IENsb3NlczogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Uta2J1aWxkLWFsbC8yMDIzMDYyNDE1MjAuNGpJZ0VoSzQt
bGtwQGludGVsLmNvbS8NCj4gDQo+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkg
Pj4pOg0KPiANCj4+PiB2bWxpbnV4Lm86IHdhcm5pbmc6IG9ianRvb2w6IGlidF9zZWxmdGVzdCsw
eDE0ICgudGV4dCsweDkyYjU0KTogc2libGluZyBjYWxsIGZyb20gY2FsbGFibGUgaW5zdHJ1Y3Rp
b24gd2l0aCBtb2RpZmllZCBzdGFjayBmcmFtZQ0KPiAgICAgdm1saW51eC5vOiB3YXJuaW5nOiBv
Ymp0b29sOiAuYWx0aW5zdHJfcmVwbGFjZW1lbnQrMHgxOWE0OiByZWR1bmRhbnQgVUFDQ0VTUyBk
aXNhYmxlDQo+ICAgICB2bWxpbnV4Lm86IHdhcm5pbmc6IG9ianRvb2w6IGlvdmVjX2Zyb21fdXNl
ci5wYXJ0LjArMHhiMSAoLnRleHQrMHgxYzQ3NzYxKTogY2FsbCB0byBjb3B5X2lvdmVjX2Zyb21f
dXNlci5wYXJ0LjAoKSB3aXRoIFVBQ0NFU1MgZW5hYmxlZA0KPiAgICAgdm1saW51eC5vOiB3YXJu
aW5nOiBvYmp0b29sOiBpYnRfc2VsZnRlc3QrMHgxZSAoLnRleHQrMHg5MmI1ZSk6IHJldHVybiB3
aXRoIG1vZGlmaWVkIHN0YWNrIGZyYW1lDQo+IA0KDQpJIGNhbid0IHJlYWxseSBzZWUgYW55IGxp
bmsgYmV0d2VlbiB0aGF0IHdhcm5pbmcgYW5kIHRoZSBjaGFuZ2VzIGluIHRoZSANCnBhdGNoLg0K
DQpXaGF0ZXZlciwgdGhpcyBwYXRjaCB3aWxsIGJlIGRpc2NhcmRlZCBhcyBwb2ludGVkIG91dCBi
eSBKb3NoLg0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IG9iamR1bXAtZnVuYyB2bWxpbnV4Lm8gaWJ0
X3NlbGZ0ZXN0Og0KPiAwMDAwIDAwMDAwMDAwMDAwOTJiNDAgPGlidF9zZWxmdGVzdD46DQo+IDAw
MDAgICAgOTJiNDA6CWYzIDBmIDFlIGZhICAgICAgICAgIAllbmRicjY0DQo+IDAwMDQgICAgOTJi
NDQ6CWU4IDAwIDAwIDAwIDAwICAgICAgIAljYWxsICAgOTJiNDkgPGlidF9zZWxmdGVzdCsweDk+
CTkyYjQ1OiBSX1g4Nl82NF9QTFQzMglfX2ZlbnRyeV9fLTB4NA0KPiAwMDA5ICAgIDkyYjQ5Ogk1
NSAgICAgICAgICAgICAgICAgICAJcHVzaCAgICVyYnANCj4gMDAwYSAgICA5MmI0YToJNDggODkg
ZTUgICAgICAgICAgICAgCW1vdiAgICAlcnNwLCVyYnANCj4gMDAwZCAgICA5MmI0ZDoJNDggOGQg
MDUgMDIgMDAgMDAgMDAgCWxlYSAgICAweDIoJXJpcCksJXJheCAgICAgICAgIyA5MmI1NiA8aWJ0
X3NlbGZ0ZXN0X2lwPg0KPiAwMDE0ICAgIDkyYjU0OglmZiBlMCAgICAgICAgICAgICAgICAJam1w
ICAgIColcmF4DQo+IDAwMDAgMDAwMDAwMDAwMDA5MmI1NiA8aWJ0X3NlbGZ0ZXN0X2lwPjoNCj4g
MDAwMCAgICA5MmI1NjoJOTAgICAgICAgICAgICAgICAgICAgCW5vcA0KPiAwMDAxICAgIDkyYjU3
Ogk0OCA4NSBjMCAgICAgICAgICAgICAJdGVzdCAgICVyYXgsJXJheA0KPiAwMDA0ICAgIDkyYjVh
Ogk1ZCAgICAgICAgICAgICAgICAgICAJcG9wICAgICVyYnANCj4gMDAwNSAgICA5MmI1YjoJMGYg
OTQgYzAgICAgICAgICAgICAgCXNldGUgICAlYWwNCj4gMDAwOCAgICA5MmI1ZToJZTkgMDAgMDAg
MDAgMDAgICAgICAgCWptcCAgICA5MmI2MyA8aWJ0X3NlbGZ0ZXN0X2lwKzB4ZD4JOTJiNWY6IFJf
WDg2XzY0X1BMVDMyCV9feDg2X3JldHVybl90aHVuay0weDQNCj4gMDAwZCAgICA5MmI2MzoJNjYg
MmUgMGYgMWYgODQgMDAgMDAgMDAgMDAgMDAgCWNzIG5vcHcgMHgwKCVyYXgsJXJheCwxKQ0KPiAw
MDE3ICAgIDkyYjZkOgkwZiAxZiAwMCAgICAgICAgICAgICAJbm9wbCAgICglcmF4KQ0KPiANCg==
