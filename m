Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9580D59AEA5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 16:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M90zP4MmPz3c9Z
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Aug 2022 00:16:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WgiJG9dO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.55; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=WgiJG9dO;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90055.outbound.protection.outlook.com [40.107.9.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M90yd5mdtz3bhQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Aug 2022 00:15:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3XkFMvtDSbajb6kgbg7hKQJxsrYBSwBgN3H7wqnkpV6gvN51tpI6PhYrQGC+OcnEoVkNrwWpJ/VajHlNkqtoJVoA47hRNiRqCMFXW0NJRiDTgU+ZAtRnUup7F+jq0JIN9ttpsOlZVTLZF50HzchUgaQqJ19yyMptWczZp6jCgQkV/D93n3WqKlK6La/khJzCRxYICo4VmMu862GroEmbRJl6f9GQ9BvdLZ8Tz61fuy7uhC+sn8fIIQ45AgpZ7HaMAJJ5T7xJWGOHp4KLOZKPiLdJboWALqisNLSbTcMFc96bI6G4N7tnP3mvWe3W601dZD+T6CdeQS4rl9bAfH1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2N67XauqhwSJp/8AF8AhJRJvlSTaaA1UCUOIj6Ob8Y0=;
 b=RGw6/Byi5EIW37IJ+/1KCTvm0cQjm7wAtab8tN/jPjzKC/gMWEmC6/GXNHyzblW/cjmjs+xao0Z4hDKMFrYXTjT9rud4jlfN0BT/36NeHln3G4T6vE36nfnuavvUkTZm7pP+e6EqX0ZQlsEDfRnrUiSnFZKF7WultjIvSWpXRDsxIKUMS64CWCPu3/r77PVoKkpNYVh3D9WLW6aTJOeDjEuepDK3douN55awy3Ys5+htDp259DbgFOkYXEu1WhdJCdBVfF6kQuhJJ/c5vru+lOM2lhC9P0gHHZz+7xQ+ulQLyg6JV5nOfhTokMOhCpoDBX6lTUut7vu5tFxx7yN4gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2N67XauqhwSJp/8AF8AhJRJvlSTaaA1UCUOIj6Ob8Y0=;
 b=WgiJG9dOZSDZpio/SR6USnb70Bx7N/oUSykjMPzM+oJeuq8HpWcuTwTXeZUBcfO6AlYi9oYKAN3B8p1qaOb6hqp5y4EzRvGmvyCjrkoPxHTysE2ru5OjDqXPEVvlGxkS9nJz9XP6aWx0yoSmDxuxFTMrbbdfWmIfXXH7+XxEyWlAg5IbrAEaM+Jme1D77yF2TqRxZWzB09euZVCrRzF3T/dAgykAJzaNuGN0nKty8ABav323M0HD4dSAhvP00/Rm9zuKFZTTMMyR0f/Nqr3ttDDFUO0gxSDzzXkyxDCzwcUwhi3yHQZEestwgqytSYIC2eXweLPPwPKpidV9cJMYSA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAYP264MB4141.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:118::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Sat, 20 Aug
 2022 14:15:18 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5546.021; Sat, 20 Aug 2022
 14:15:18 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Topic: Build/boot problem with 7b4537199a4a (Re: [PATCH v6 02/10]
 kbuild: link symbol CRCs at final link, removing CONFIG_MODULE_REL_CRCS)
Thread-Index: AQHYtHvmHBMhgvHYdkutxUw4JYFhKa23vj4AgAAXVgA=
Date: Sat, 20 Aug 2022 14:15:18 +0000
Message-ID: <ad12004e-1eef-cc77-97ee-ef1738cfa141@csgroup.eu>
References: <20220513113930.10488-1-masahiroy@kernel.org>
 <20220513113930.10488-3-masahiroy@kernel.org>
 <38605f6a-a568-f884-f06f-ea4da5b214f0@csgroup.eu>
 <CAK7LNATKh4DrgSeN+E1r7xmh1YL6mwWL_g2zL-rz=NYuzXT1bA@mail.gmail.com>
In-Reply-To:  <CAK7LNATKh4DrgSeN+E1r7xmh1YL6mwWL_g2zL-rz=NYuzXT1bA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b469426-5de0-46ee-9c77-08da82b6690f
x-ms-traffictypediagnostic: PAYP264MB4141:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  7ZOESbBFAScQYw2GcyrcgRchDryOdg3pJU5NQH9lqYZgd3SnZlMXOa87vtxSGeEkqqUnqH6UvX60EcBocRmlsNzhBB0LBjkY4bk36DaEM42j+gdrP/S2Oq8iLUdRdJXxhP5XW7AJwSJyi9dIGsJnzEdebchmR8/W2eJMiOUK+K0lAVSYNSKSRxAi84BXZqvdC+52GL2ESk/8nkBkRzYz2IH8xhzCvtH6K83eiX+KsMVrCPp6snmd12wTjsneRcm0xhC0uWWgNyYArLCwFiFv/Ax7rhyiwWzqdG/Ebxt1KCEXPSvZ5WOTqtpszoRI/t4F606i451v/bU1sBN1TULTgxSsCqdC42Qh0FzrTfhyAiTqP/3J4HPC/J9lSrcZhuQcSttafwClXugEdcuhLUKmugT9bXfl0wMRCI15ZFVuGLE1KDWd6oIgM/MT1fp6Ftr48Uvf83lmfCujqP2FeaGi7D433GBdrKe65FN9L1zm4MDTj55ciQ9hX2bKioLlLUJ279W7DTu0MozWQJ0VaY/MZnVc6rxD4FiI2Nz4st3iwgM6nE9YusVimNrvvLVwlvO/Nnj/+/Gugs53BcViZkRH5hIt8EZk93c/CylIxyixfPRVK7jaw3oi3t9FygcvnfLybo1niX2mhX1Y0KKUjP60vzPs4V6qJr5YGFTeRKkXjlPYX7eEZxBFCgun/pOjasS4G/AB5wVaBiQBBIKl+3pum3LDeJjrvN1Hzb/+Q0M24ocrkvDAfGWSYVssmR+FOdhiY960IbDqcHsEw/vo4i3PBHHjvcK7N3NcGvrtou2zqWcMEhCPtm9vRYzV+bs3C5S5krwFUDW1RVvhQmwRfBaNwA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(136003)(39850400004)(346002)(376002)(91956017)(31696002)(76116006)(83380400001)(66446008)(66556008)(66946007)(64756008)(66476007)(8676002)(4326008)(2906002)(38100700002)(38070700005)(8936002)(44832011)(7416002)(5660300002)(6486002)(6512007)(26005)(31686004)(122000001)(71200400001)(54906003)(6916009)(41300700001)(36756003)(53546011)(86362001)(478600001)(316002)(6506007)(66574015)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MEhOMllublVwREtYV2k5ZkErL3FVNjl4QTRsUitFRGdMVnJXQTdCSThNYzZC?=
 =?utf-8?B?REFQSHB4VytsTmJUYk1MK3hJZ2ZIYzBjUlVjbHp1cUJaSFllL043cXBlcXNJ?=
 =?utf-8?B?T2pCUGJZZ2FITmw5bmFzTmRVa2NvMlN5WFR3QXB5YlhrWVhPaDVTN1JnMTBZ?=
 =?utf-8?B?Kyt5d1FtWnh5K1l2TUIxUUo3akg1SUFiYUJicnExcFZ1bnpxMXZCd2dhbFVv?=
 =?utf-8?B?WEsvS3ZrZDUvajR6WUhsMStsRnVCUXB3enhsdVBaNG82UU1HdWNKNmlRTFov?=
 =?utf-8?B?N2gyMW1vUmRadEZIQmNNYVlocm5FelVlcUxYdGkzM1hUQUlOaGhxc3BxL3ln?=
 =?utf-8?B?dTA2RGgwK3M2bDZFMkdtOFFseHE3TnhkUjhURGZ0RTluWkpESVVCbllNeXh2?=
 =?utf-8?B?bkVkSVp5K0hsQmJZOUFiQ09BcmtNaGdoNW15c0o4M3BrM3pxaXBrdmNJci9l?=
 =?utf-8?B?dTZNbGpoWjhMWWl4cjlTZEV5ODhtZkFSeXBJTWRPQW9EbFNpdy9RdCtUZ3ox?=
 =?utf-8?B?L1VOSURuRkpuWEZKTkVFSUVpOHUvSG9NTlFxaWl4Nzc1SHArc04yM2kyeG1u?=
 =?utf-8?B?eHd6Z3pmSDMwVVlWMVU1NXltaiswU3hyL0xsWFJHTDd0ZDBvZEg5aUtjZlNF?=
 =?utf-8?B?dk1CNGEwelpZckZVUXJNRVNBVldmeGZoR1A0dzVwclB5V1QvVVd4TzJ6WlNV?=
 =?utf-8?B?MlFGaWROV21zRDMvbEF4OGpqeFE1UWl1Ry9oUzFpbU1seDBJaHNvR2NlcXg1?=
 =?utf-8?B?V1pFZDN0WVpydXMzZE9kbGlZQUo4OXhwRXdTRmg2MGVTSWVQSGtyNUxDUjd1?=
 =?utf-8?B?N2xCZTRNL28rYTdsbURJQmx3NG1STTN0Yk9ETmdCNmxKRXdOcFk1UC9PVzNt?=
 =?utf-8?B?Y25FLzR0bXY2a2xXelZFM2VJamdITWVvZXdoQnRvL3RGd1hzTms1dmE4bzc5?=
 =?utf-8?B?ZGJDM09OdWZSdEhzR2todHp1VnoyUm9xR0lmcHdNbzZaYU9KUE1nUE9KQ1VZ?=
 =?utf-8?B?dnF5OU4xR2MvMVB0MlR6dnMxSG9EQTNUdHJlSDJFR0xMRmpsMlF0M0l3MDQ2?=
 =?utf-8?B?clM1eEdoRExzdldsMzJjb2IwU1FVb3RiSzMxMVdsMi9Jd2FVdi9FcUllTGdW?=
 =?utf-8?B?dmZCMTBIZDRBMlRGVU5XWCsrQm5abGtKYm9uQStFWEtPM00wMkhuNE5mK2Zo?=
 =?utf-8?B?WmtSQ3E1M3pkK2FjdEk0blhiNnViUTZvMU5sb3pWTnZOeWFydUR1Qi9SRzFp?=
 =?utf-8?B?cW84UFphdm1VZG9qOERtWlhQZ21aRTFMYmdvMW9LMDNBVHcvd3dwRGc3Sk1h?=
 =?utf-8?B?dmNsK2QwMFhERDF0MVlvRlpXWldaVkllalhuYk4zdHJWOTBhYS85dTVxUXp4?=
 =?utf-8?B?UnVCVkNIUWp3b3BFQTg4WlRsd1dORjhGTXFxL3JYS3A4VDdkdU5zMTVpMTg2?=
 =?utf-8?B?cHN0NlovYllGWHVGK2g5aHppaGM5WU9FUTRqZi9vZ1Z0SlVaS0hyU3FJbEps?=
 =?utf-8?B?MGlyNWdFYTh0UFpMQWowK3AxSEE5M2U2RTVWNDhrMC8yd2JZWUljK2QyLzRo?=
 =?utf-8?B?N2Y3U0ZtamxQbDRBR0tsaWdQZEwwbnZtdlZjcGxaQVY3Nmg1dmNOZ1FYQmJa?=
 =?utf-8?B?MG5hNkNXSFphQ2lOK0FsbkFOdDBVem42VmZrNk81UWZNZ2YxY2xKZGUwSHJm?=
 =?utf-8?B?cHl3ZFZja0pLTExlRWFKazRUTEdLRWMrVzVmdFMwQzVOa0d1ZXZRbHIza0p6?=
 =?utf-8?B?UnpPakRXcVBTaDRIV2drcThNWGZ4QmJLd2xSQmlBVzB2Y1VqdzQwUTQ1dWgr?=
 =?utf-8?B?TlFKTk4wc0tCc3BqVTVqNkxNdHFiaFdsLzhBWERJbjdDdnE1dVdJUG53ZmNY?=
 =?utf-8?B?Wmc1UEJocmhOZElpUHdtL1k5WXMvV1VROE52eFl5SXNzbFVNY1ViQlQzMXNh?=
 =?utf-8?B?RHVPdkcwbm15SFBHaTBQRjg0UkZ3M0ovUnZ6Q1p1WHN2YUJRUXZ2eWlmcTlp?=
 =?utf-8?B?Sk1kM05WSXZWOGFSMm4yUVJLUlpoR1ZQb3Jmbng4cDNXQ3Z5cW9GWEFaT2px?=
 =?utf-8?B?bm9uY3VQMkNIclczVjJ4RjdmU3FMY1huSmlzcFRTMlNvUjI5ZzRGbFZtMzRR?=
 =?utf-8?B?VWdJTm1yYVVoNm5rTHRLbjN1OUx6YXZRYUZnMmQ4akpwdERVM3VDOGNJb2Yv?=
 =?utf-8?B?bXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0B9DEFE4E8B45943842CA9E5F2B43925@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b469426-5de0-46ee-9c77-08da82b6690f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 14:15:18.4167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iU1Gmu63j8xesf+c3BFMLdwZHr+pspQluhXtouMh6LYJuFT9a8x3M4SzomHc3QQkXcUQCbuJoYcFbmr/wd80sIJyC4ijlXoUw1cD5UrI9tg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4141
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, "Kirill A .
 Shutemov" <kirill.shutemov@linux.intel.com>, Sami Tolvanen <samitolvanen@google.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA4LzIwMjIgw6AgMTQ6NTEsIE1hc2FoaXJvIFlhbWFkYSBhIMOpY3JpdMKgOg0K
PiBPbiBTYXQsIEF1ZyAyMCwgMjAyMiBhdCA3OjAyIFBNIENocmlzdG9waGUgTGVyb3kNCj4gPGNo
cmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+Pg0KPj4gSGksDQo+Pg0KPj4gTGUg
MTMvMDUvMjAyMiDDoCAxMzozOSwgTWFzYWhpcm8gWWFtYWRhIGEgw6ljcml0IDoNCj4+PiBpbmNs
dWRlL3tsaW51eCxhc20tZ2VuZXJpY30vZXhwb3J0LmggZGVmaW5lcyBhIHdlYWsgc3ltYm9sLCBf
X2NyY18qDQo+Pj4gYXMgYSBwbGFjZWhvbGRlci4NCj4+Pg0KPj4+IEdlbmtzeW1zIHdyaXRlcyB0
aGUgdmVyc2lvbiBDUkNzIGludG8gdGhlIGxpbmtlciBzY3JpcHQsIHdoaWNoIHdpbGwgYmUNCj4+
PiB1c2VkIGZvciBmaWxsaW5nIHRoZSBfX2NyY18qIHN5bWJvbHMuIFRoZSBsaW5rZXIgc2NyaXB0
IGZvcm1hdCBkZXBlbmRzDQo+Pj4gb24gQ09ORklHX01PRFVMRV9SRUxfQ1JDUy4gSWYgaXQgaXMg
ZW5hYmxlZCwgX19jcmNfKiBob2xkcyB0aGUgb2Zmc2V0DQo+Pj4gdG8gdGhlIHJlZmVyZW5jZSBv
ZiBDUkMuDQo+Pj4NCj4+PiBJdCBpcyB0aW1lIHRvIGdldCByaWQgb2YgdGhpcyBjb21wbGV4aXR5
Lg0KPj4+DQo+Pj4gTm93IHRoYXQgbW9kcG9zdCBwYXJzZXMgdGV4dCBmaWxlcyAoLiouY21kKSB0
byBjb2xsZWN0IGFsbCB0aGUgQ1JDcywNCj4+PiBpdCBjYW4gZ2VuZXJhdGUgQyBjb2RlIHRoYXQg
d2lsbCBiZSBsaW5rZWQgdG8gdGhlIHZtbGludXggb3IgbW9kdWxlcy4NCj4+Pg0KPj4+IEdlbmVy
YXRlIGEgbmV3IEMgZmlsZSwgLnZtbGludXguZXhwb3J0LmMsIHdoaWNoIGNvbnRhaW5zIHRoZSBD
UkNzIG9mDQo+Pj4gc3ltYm9scyBleHBvcnRlZCBieSB2bWxpbnV4LiBJdCBpcyBjb21waWxlZCBh
bmQgbGlua2VkIHRvIHZtbGludXggaW4NCj4+PiBzY3JpcHRzL2xpbmstdm1saW51eC5zaC4NCj4+
Pg0KPj4+IFB1dCB0aGUgQ1JDcyBvZiBzeW1ib2xzIGV4cG9ydGVkIGJ5IG1vZHVsZXMgaW50byB0
aGUgZXhpc3RpbmcgKi5tb2QuYw0KPj4+IGZpbGVzLiBObyBhZGRpdGlvbmFsIGJ1aWxkIHN0ZXAg
aXMgbmVlZGVkIGZvciBtb2R1bGVzLiBBcyBiZWZvcmUsDQo+Pj4gKi5tb2QuYyBhcmUgY29tcGls
ZWQgYW5kIGxpbmtlZCB0byAqLmtvIGluIHNjcmlwdHMvTWFrZWZpbGUubW9kZmluYWwuDQo+Pj4N
Cj4+PiBObyBsaW5rZXIgbWFnaWMgaXMgdXNlZCBoZXJlLiBUaGUgbmV3IEMgaW1wbGVtZW50YXRp
b24gd29ya3MgaW4gdGhlDQo+Pj4gc2FtZSB3YXksIHdoZXRoZXIgQ09ORklHX1JFTE9DQVRBQkxF
IGlzIGVuYWJsZWQgb3Igbm90Lg0KPj4+IENPTkZJR19NT0RVTEVfUkVMX0NSQ1MgaXMgbm8gbG9u
Z2VyIG5lZWRlZC4NCj4+Pg0KPj4+IFByZXZpb3VzbHksIEtidWlsZCBpbnZva2VkIGFkZGl0aW9u
YWwgJChMRCkgdG8gdXBkYXRlIHRoZSBDUkNzIGluDQo+Pj4gb2JqZWN0cywgYnV0IHRoaXMgc3Rl
cCBpcyB1bm5lZWRlZCB0b28uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGlybyBZYW1h
ZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPg0KPj4+IFRlc3RlZC1ieTogTmF0aGFuIENoYW5jZWxs
b3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KPj4+IFRlc3RlZC1ieTogTmljb2xhcyBTY2hpZXIgPG5p
Y29sYXNAZmphc2xlLmV1Pg0KPj4+IFJldmlld2VkLWJ5OiBOaWNvbGFzIFNjaGllciA8bmljb2xh
c0BmamFzbGUuZXU+DQo+Pg0KPj4gUHJvYmxlbSB3aXRoIHY2LjAtcmMxDQo+PiBQcm9ibGVtIHdp
dGggdjUuMTkNCj4+IE5vIHByb2JsZW0gd2l0aCB2NS4xOA0KPj4NCj4+IEJpc2VjdGVkIHRvIDdi
NDUzNzE5OWE0YSAoImtidWlsZDogbGluayBzeW1ib2wgQ1JDcyBhdCBmaW5hbCBsaW5rLA0KPj4g
cmVtb3ZpbmcgQ09ORklHX01PRFVMRV9SRUxfQ1JDUyIpDQo+Pg0KPj4gVGhlIGFib3ZlIHBhdGNo
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgcHJvYmxlbSBidWlsZGluZw0KPj4gbXBjODV4eF9kZWZj
b25maWcgKyBDT05GSUdfUkVMT0NBVEFCTEUNCj4gDQo+IA0KPiANCj4gSXMgdGhpcyBiZWNhdXNl
IHRoZSByZWxvY2F0aW9uIGltcGxlbWVudGF0aW9uIG9uIHBwYyBpcyBpbmNvbXBsZXRlPw0KPiAo
YW5kIGlzIGl0IHRoZSByZWFzb24gd2h5IHJlbG9ja19jaGVjay5zaCBleGlzdHM/KQ0KPiANCj4g
YXJjaC9wb3dlcnBjL2tlcm5lbC9yZWxvY18zMi5TIGRvZXMgbm90IHN1cHBvcnQgUl9QUENfVUFE
RFIzMg0KPiANCj4gDQoNCk1pZ2h0IGJlIHRoZSByZWFzb24uDQoNCklzIGl0IGV4cGVjdGVkIHRo
YXQgeW91ciBwYXRjaCBhZGRzIGFuIHVuc3VwcG9ydGVkIHJlbG9jYXRpb24gPw0KDQpXaHkgd2Fz
IHRoYXQgcmVsb2NhdGlvbiB0eXBlIHVubmVlZGVkIGJlZm9yZSA/DQoNClRoYW5rcw0KQ2hyaXN0
b3BoZQ==
