Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51526587DE5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 16:07:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxxdr31pxz3cYd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 00:07:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m7RtFNwM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.49; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=m7RtFNwM;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120049.outbound.protection.outlook.com [40.107.12.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxxd42cYzz2xJQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 00:07:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Djj3Fu4llXY0NrijRq4s3dAmkTsUrffzRHk9vNIswCL40U+NqxtXTA4yucCfvYw/vTag8AH9r7WrTZSXdbGC9hgK1GfzDuLzj6dtLdL91qO7ENQNyNOi3ImOeCORn/V+wBwf2rthmlCcfp+JAMM0vm7U9ILgmnzjcQPb82WgY36jWcEG9gEnLemynUmlwuwQDcyt5DamwyUl52MlEEqX/L1jcFhHqyU+sCyNxgNs2aBAmPlksfQd25OWSLsBu5cd0USQ675LsZEBD53Drtgm4L9ljePRVoRFOCjRFZVwB2e22QbM0IszYJcpc9nqeK/sqvXzReU59rQbO63btD0aDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8g1Fj2us+iL2QTRXgFksztRVe154G+8BVTMu6LGTAk=;
 b=RJHDXGd+HFlGozcD4bO1pcBNBL9LfAOTtoodwg5zGjynhY7tNn/haw/UMtQKohUtGiPjhPSo1rY+Pk204VwPzWZqKJJVQ+D1dU2pLntdWMqroWv+XndycIk1xhwV6yS9Ys38RwBYZDtETPCZxCGmT7eTWB1VIxI6QB9EPFCnzX8FWQvA2Rk//Y8ews7B9tohPLUYwjJv0kK61tXYDG2bcjUY2+Ik0RAH12zRtKCLhKupa052ibHEAtta4pgkjo0Wd95FDQBNNQ4dAA94NSqlWEzj1IyC68uKzj8dEkye1Ia7I52LuGY3aBnpC+YhqAk4Nu8GL9UBSaOQTD+VeP7gBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8g1Fj2us+iL2QTRXgFksztRVe154G+8BVTMu6LGTAk=;
 b=m7RtFNwMx1ONfx5nRgYNPw/v81oPTUZxCKlZDQgAd3iAgA6qINpczU+gyKgzPeCo7cF/5kRI36BUcM+6bTidLymPVOUbWZ9tnOJ8mvOrFrfuO6YLQgLbUZE3nhPSN/jCNTLMuBVNDmA0707q+5ioca+VnF5RA2VgKFoNKAojKjxivYRkgswpr66YZWOab9LahJVKNCGbYX/FOUrh2+aUneATsB1gBIVB0wCr0r8y2IiMrXuOA0DeeKk1fBWiOxtqI/dwSPk6uYiSPyaJrhVPkoxQLRXrmWAdDiQh5X8Nijcw2gfqWTpWZnSynB2wGAZkjXmJALJbig+rTt1oMgWEVQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB3547.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:160::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Tue, 2 Aug
 2022 14:06:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 14:06:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: shaom Deng <dengshaomin@cdjrlc.com>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>, "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"inux-kernel@vger.kernel.org" <inux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kvm:remove the unexpected word "that" in comments
Thread-Topic: [PATCH] kvm:remove the unexpected word "that" in comments
Thread-Index: AQHYmWk0nZnALZX6hEu02q1LArGHn62bv1wA
Date: Tue, 2 Aug 2022 14:06:43 +0000
Message-ID: <ea0432e4-6cd8-decc-ab65-c611f3aca7f6@csgroup.eu>
References: <20220716165028.17693-1-dengshaomin@cdjrlc.com>
In-Reply-To: <20220716165028.17693-1-dengshaomin@cdjrlc.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44b20dbd-e4b5-437c-7b8b-08da74903a68
x-ms-traffictypediagnostic: PR0P264MB3547:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  v6OZd+lX6+aTPU8D7Oe1IkmbM/xjP3/yN/wro150gii1jBacrhGacaMaE66JpEVzWMohcmhJ8r7VKXDaDTGBqpm/WEoOJWP7AlliVTyxHqvRoms5e33UwPcT2WBavHnC3vhscnS/dBEka4LxavO8thlS73idodKyl9xWwWB3JHJPD5+dxqAa/nP1etJnkUNjggXkkfGEnrLIKjTYK4mEA4KCj/rJYj30gXxnuyJisOQUisc3HbkiYUtsGX3dk3l4W4OxORwefa3YKaXTv9ia6/xjC4BAf2oHbHqhI0Tu/NAtJ2Y4myfNqbwdSc0L/K6C34CSrOLmtaPyqn9A8tPi1nLB0rAZOgISYtnRCMJnaYRTYz0MuzZdgMi4QHvNY/c5WD+C5qP1VCvCQQ9og22m82AZqZFIyj30pYen/ChQyhAr6CCE5zmONtVY0chm8OWhgfL1IRTXV5goX4njDs06SCZIOqSca/WR3lGI4KO47ozH4LYYnHqMh7uc2frPv4oC4keCZqgCBdRnJqmWyApSU3qXE32yErqySbkqA2ZOCljn84aSnVoNRi280Oc7jKUADbM7Wb6erMHEtukGnb8G86IEAtyxUaePn/hcjX0YnSiTfBHaWaSI/San3ip/ntGfpqgLm+OftagjqVv0/6z9Qlw8RkkajmnWImOFzU2zyS6SqtPeUraP5ZdQ5lTcTTWp3BtlqeX2Xp1EedCdVXk5nvBHUR8cfIv9XjgRb/ovjVcziWsQfzcRw7dP8+IywtkhvHztcFzvnWCf8SelWTpCp0FO6Vb0XZKSNUIhwYM+2Tt3zgAnKE6KTY/9YmB5qy1ZXYJcPLi5aAB+aQER8omyiUv3fTVhcPf5iqKRR5KpQmMa+eNikH6A0zfiivoAoUDz
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(136003)(39850400004)(366004)(6512007)(110136005)(41300700001)(86362001)(31696002)(6506007)(26005)(316002)(71200400001)(966005)(6486002)(478600001)(38070700005)(122000001)(38100700002)(66574015)(2616005)(186003)(83380400001)(66476007)(64756008)(8676002)(66446008)(66946007)(91956017)(66556008)(31686004)(5660300002)(2906002)(44832011)(76116006)(8936002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cFV5QjUvWkcyVXI3MUloWE5pWmh4clZrL0FPczJEeVJUZGhTMEp5T2xCRXkv?=
 =?utf-8?B?d01RUjF2LzFiWTBwNmVFdTlKMlpjcFdOQ0tvcURHc2p6UldmVFB5TzI3R2Vw?=
 =?utf-8?B?NmlRQm0xNFArUXQrR3pnTXJrMmYrTnE5UW5xWjZLVW1JWll4Lzh2NWtXanpi?=
 =?utf-8?B?NXVVdFRXSTE5ZzlYVHZMYTVuOGdmWDZPdkR6NXdZTU5Ub0RKQ285N0pjS0tR?=
 =?utf-8?B?TDJkZTRqL3JKWG04cndjMDk1c0VSZlZrc05yMU9JMi9XOUdnQnQ3WW5Uc2N6?=
 =?utf-8?B?aW1EYWlWbDA0SkNOWUl1M0o0c05NZW5LYXBmYkZ6YzViaHNPTGR4RklDM2Jj?=
 =?utf-8?B?a211dXBKT3ViMXFSam12ZmpacXhHeTVJR2JSREYzdWVmT0VyaUcxYjkreTd2?=
 =?utf-8?B?Q1FKVmxHSmxQT1ZGWE9nek1FaGhpZUZndzF5bkxGR0lWb1JKaUxQWFVneW15?=
 =?utf-8?B?YzVCZUVkM2NlWEhpSHZhZDF4eTFMSmRkRUovaU4xaWpIME5ubE1ISjJ2ZGxn?=
 =?utf-8?B?Si9VY0R3RkZrcFRxRGx1SnRUa2JYMEM5QjQ1d1pVQ0FyNGZaZElCc1lnckpr?=
 =?utf-8?B?bmEvc3hpTTljZlVLTnM4dXdxSzEzTDc5aWwxZmt5RWpwRGhLL2d6M0ZNandi?=
 =?utf-8?B?SVhhenFqRVRkNzB1c2dpMFZkVlR1N2xZS2EvTUpKYkh6WHRETjE4ZHIzTFN6?=
 =?utf-8?B?K0gyb2dwK3k3Rnhuait1TkJtTkcyZDY5Ny9IZjUxd0trUGlCOXVSeEo1K0M5?=
 =?utf-8?B?bzFxM2E0RnBvUm9qR1l2YWZaT3BXUDVpZHdSRktSSVJZaSsvcWdWUlJMV1B0?=
 =?utf-8?B?VTNnM2I2YzcvY2hGd09ZRWlSallHZnI3TnhkMUZ2Z2tmYzlzcC9PdGhFQTRx?=
 =?utf-8?B?RWNEQ1VBTlpQN0oxellQOUN6Z3h6Z3JtWkliYlcrYXh5R2I0dU41aWh1MDBN?=
 =?utf-8?B?aWw2ZUl4S0hqL21qZlczQ0ZHRkRCVVIxcUM0WGsrSStXUGhYUE1FK0dtUStI?=
 =?utf-8?B?OXlsQ2Rab0hpWkhlMHEvYW14SndIaUw3cW5FT0NHb1FCWGU3OWVldlBPeVFk?=
 =?utf-8?B?QThMZHhZclBkSFdFcjYxUnE1YXhDakxvYW5LNDVYNVNGdkV6UDBac2x6MVpT?=
 =?utf-8?B?bGR4ZDJmMlBZTm8xbTdMZEtaN2grbTJ2MWd5TDFCeE1nS3c3VG9WeVdRbHpW?=
 =?utf-8?B?aFk3RGV1dzJLZVpWYm9GQ1RCa1QwVUdFMVhnTnVuQkRvdlJTT3hIYVNzb2hR?=
 =?utf-8?B?aU1BbkJZR3pEVTc1Vm5VSStwUFJEMGpJK29OczJrMmwyZ21nVFFlWWorSUgx?=
 =?utf-8?B?bHgvSGJBSmNXNTJWYVAzS2I1UWMwdDV3YitTUkRNM0xJcENKWlIraGVyYlBJ?=
 =?utf-8?B?ZzVMWk45VTQxejZ6dWN2TXR2ODlNd2F2bHk1ZkpqRWYrcnZ1MHpRRWVPb3o1?=
 =?utf-8?B?c0ZiNTFROUt5dEVZR0g5aFM1aXBTREF3UFRVSWhYNldUNGZ4cGpZSkxMU3Vl?=
 =?utf-8?B?STRTLzc2TXc0TWxuQk5aZDg1YVM1eWhNdHNsUldNVWMwamhIdTdhTEpwelhm?=
 =?utf-8?B?UnlyU0RDbTQvTmhZVkU5U25NTjcrang5U3FMei9uaWtvQ3dRUS9Dc2NtSkg3?=
 =?utf-8?B?cExYdGZodFVROTYxU0JBaFNLL3RFVk9TVXBtUFczaTl0RklCeWhHMExuSElB?=
 =?utf-8?B?dEhBc1JWVExyYzI3RVdEeXdLTWdDR1lIamtrdXU3OGZNOXMvdDRuR1gwSEtT?=
 =?utf-8?B?TFBQVnFQT2g4KzAxbVdsQ1ZqNmYwcTlPQ0I3UGJwVjRLV1V5ZU5UMHFzVENh?=
 =?utf-8?B?eWJoMitycis3cTk0eE50a1BpL1M1eDdOZjFpOXNlUzVGUGFma0M2M0c2aHFi?=
 =?utf-8?B?TVVZVXA5VUxHUG8ybWtmcmRTcmZGd0txZGY4cTJSbnhscjJmRGIyYytqck5F?=
 =?utf-8?B?clUrTG83cEp3cVJhVnl0NGFDRzdtK0pjN05pSkRMbis4V0wxTkRERGVyS3ZJ?=
 =?utf-8?B?RVlsME5WcmN4eGdnVnVIYlRQbThMZVg4WHRldEQ5Vkc0d0k0bmFQMzNXUEJ1?=
 =?utf-8?B?YWhnRGJVS0tHN01jVWw3TndiV1QycEZIL29Gd0Z0UHdVVDFVaFhYK1I4U3oz?=
 =?utf-8?B?QzE2TDVoTC9QK1BsbDhFWGRlNXluN0FTVEpQWnQ3bThTZzA1Q1V6UVlMalJK?=
 =?utf-8?Q?nYpxtNe3d9ZzVIC5miJhEqo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <53DD8A59FAC11D488F4461C9DEBE0DA7@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b20dbd-e4b5-437c-7b8b-08da74903a68
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 14:06:43.0228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Tk+0GqbXuUe7qLoAeA0ROi/Y9Bj1jZaEg/o0pcoMs8Dz5y87nQdKsvE4J90eD5HJtzaoMDkfczqjiNSqIMo9ODa8w0iF050U7sA5dnNkdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB3547
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

DQoNCkxlIDE2LzA3LzIwMjIgw6AgMTg6NTAsIHNoYW9tIERlbmcgYSDDqWNyaXTCoDoNCj4gW1Zv
dXMgbmUgcmVjZXZleiBwYXMgc291dmVudCBkZSBjb3VycmllcnMgZGUgZGVuZ3NoYW9taW5AY2Rq
cmxjLmNvbS4gRMOpY291dnJleiBwb3VycXVvaSBjZWNpIGVzdCBpbXBvcnRhbnQgw6AgaHR0cHM6
Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IGRlbGV0ZSB0
aGUgcmVwZWF0ZWQgd29yZCAidGhhdCIgaW4gY29tbWVudHMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IHNoYW9tIERlbmcgPGRlbmdzaGFvbWluQGNkanJsYy5jb20+DQo+IC0tLQ0KPiAgIGFyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5jIGIvYXJjaC9wb3dlcnBjL2t2bS9ib29rM3NfNjRf
bW11X2h2LmMNCj4gaW5kZXggNTE0ZmQ0NWMxOTk0Li43M2M2ZGIyMGNkOGEgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvcG93ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5jDQo+ICsrKyBiL2FyY2gvcG93
ZXJwYy9rdm0vYm9vazNzXzY0X21tdV9odi5jDQo+IEBAIC0xNjAxLDcgKzE2MDEsNyBAQCBsb25n
IGt2bV92bV9pb2N0bF9yZXNpemVfaHB0X2NvbW1pdChzdHJ1Y3Qga3ZtICprdm0sDQo+ICAgICog
aXMgdmFsaWQsIGl0IGlzIHdyaXR0ZW4gdG8gdGhlIEhQVCBhcyBpZiBhbiBIX0VOVEVSIHdpdGgg
dGhlDQo+ICAgICogZXhhY3QgZmxhZyBzZXQgd2FzIGRvbmUuICBXaGVuIHRoZSBpbnZhbGlkIGNv
dW50IGlzIG5vbi16ZXJvDQo+ICAgICogaW4gdGhlIGhlYWRlciB3cml0dGVuIHRvIHRoZSBzdHJl
YW0sIHRoZSBrZXJuZWwgd2lsbCBtYWtlDQo+IC0gKiBzdXJlIHRoYXQgdGhhdCBtYW55IEhQVEVz
IGFyZSBpbnZhbGlkLCBhbmQgaW52YWxpZGF0ZSB0aGVtDQo+ICsgKiBzdXJlIHRoYXQgbWFueSBI
UFRFcyBhcmUgaW52YWxpZCwgYW5kIGludmFsaWRhdGUgdGhlbQ0KDQpZb3UgYXJlIGNoYW5naW5n
IHRoZSBtZWFuaW5nIGhlcmUuDQoNClRoZSBzZW50ZW5jZSBpczoNCg0KLi4uIG1ha2Ugc3VyZSB0
aGF0OiB0aGF0IG1hbnkgSFBURXMgYXJlIGludmFsaWQuDQoNCllvdSBjaGFuZ2VkIHRoZSBtZWFu
aW5nIHRvOg0KDQouLi4gbWFrZSBzdXJlIHRoYXQ6IG1hbnkgSFBURXMgYXJlIGludmFsaWQuDQoN
Cg0KDQpJdCBkb2Vzbid0IG1lYW4gdGhlIHNhbWUuDQoNCg0KPiAgICAqIGlmIG5vdC4NCj4gICAg
Ki8NCj4gDQo+IC0tDQo+IDIuMzQuMQ0KPiA=
