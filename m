Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0D763603D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 14:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHMmH20b6z3dvP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 00:43:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LKhzoyGz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::616; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LKhzoyGz;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHMlG2YBRz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 00:43:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBHnKuVrXjfJB9yQpeFnDnEeTWRZMmxrC94nta6N+lkkIWsJVLr1CDjK1THNOTbYwG9mympd5BduBq2J40onfGARgONxPAyigdCQEgrT/IkEYNj/zwkDE+64w0BvfOlL9rmNIetJ4HJNdMCe4E5MXmEOIA23oXXACItXkEsyfZcGK7xWW4dil/ILAzIenCa1mMOF04x0crCFrUQ7G6yXTd8WivyjsnGV71RmBOOqWQmp9E8bNY5FQdnW33Q0IKKTLuGzrlmHsk1uF3/WXCqQ/QvSOxal8EaImAhDGlRyMoAD9z8hjp3RSgglEXBoO+GMu31ETAzmZ35E5KjwcrhNwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEiqlej8HuVVVrSSwqIGJW/5qavxKVVFEZPER4Y0AzI=;
 b=VuZkBbf+AoQZCM+Gu3VrTlUEi3DMrP7g+dqahWqDd+tqYAAnDLNi0N+FmgthYQDMqWG3wk/gnFP6k3PCujRQixVc3/J1atR85SkRESj7M646yRTgJOROHKHs5v6V+CnQY0hTbnl126te+vqA+MHeLLAGqj8AnS+QDHrIoUQ6Ue2YNJZgsDfhuB0Rl8/UhgFZGaIx7MOujdrPVC6u4JwstKlkP0duD/NXQX4xS44CWo6kP2AOew43Gcqu1jHb5z38xtr046Oo9/NVnJqnwDxDnwi4/U1B1UB+Jkdn5iGyxYpdY3EQ9/T5EViwA/1zKvcjPnJMbMNMDG+VEINPpoBA5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEiqlej8HuVVVrSSwqIGJW/5qavxKVVFEZPER4Y0AzI=;
 b=LKhzoyGz1aNTb9i1e9XpuvJkIYQc1vmRsBC5Xnxxi9xNQM2Ii4GsZBp5PbPKRjigIOplrLZWR31Luj02MMCpAx66XvuFYk/QiLUnVeFugUT5Y9uWBiUtM8k+unkbS8EL6arW5HmKfReX8A6tFk65arE84dVDf3HTVC2al1hNJpIrzsZU/uw54KVfzxxGxPilL5+q9eQRqlQa/YaHzmhwICuSNmez30gX2QMWaFuV8Yhuqtgzowh8vZwI/SmaommX/WYSx1IGajuL9kXPD4xbjtWPaFd+M/HEw3hFQt//KAXBMk9AWbvbZMkFX4PoCR73PnvnSalMLsJndT/X3j0aQA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1956.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 13:42:42 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 13:42:42 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "zhang.songyi@zte.com.cn" <zhang.songyi@zte.com.cn>, "arnd@arndb.de"
	<arnd@arndb.de>
Subject: Re: [PATCH linux-next] powerpc/cell/axon_msi: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Thread-Topic: [PATCH linux-next] powerpc/cell/axon_msi: replace
 DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Thread-Index: AQHY/0F1k3qkuh4+skin7SOZmxc1iA==
Date: Wed, 23 Nov 2022 13:42:42 +0000
Message-ID: <9f6a3690-3ac3-8e13-a80c-b0571826c3d7@csgroup.eu>
References: <202211231706198927223@zte.com.cn>
In-Reply-To: <202211231706198927223@zte.com.cn>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1956:EE_
x-ms-office365-filtering-correlation-id: 9ca931e0-1e0f-4a53-9e42-08dacd58985c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pFFkBH+fenNXlgXuZLA+WDtZJnHrk7lUNkfCJKJINReXex0VYJ2fOc1yb/npokHKj7KiIFnIghvTtUhzy5v++4+GYSAhuKdzo2po/Amij+2AhxCFpcbKtggLErc5GdCECrmEedj39DUSldir6WuXE4EiUJtZz9VY395wSVxfMDsAUxlcNldu+jRALd8O3EMCQf3eyV+6fd3d1yx0RDe5ApTFOeXXi/RRRigOTX1CtlLf80oLPlIrzeG1a09bhLJOyAB/y3GnadQ3u5Qzs0k/5iLnxneSHBjo7/l+EOVIbSejylIlG3Xf9GvaPjsSE9WHY/+XniPHBiaQj1KP589agLRborQ3kJJ9uvw0+NQfv8g33Z9xgfYXY0NjFgm9aIXycczepcUJHNRH9uj6RxkKf2k25lGGKoOmrOjyAUGZNS3BhCzPpO1UP7TWhbFvxPOVAjlBmoapDNH9OWqoigJnr1E+RhQHQOFVIK40gWXplIvGqgHMYRcYMALSQQiUIR267l7wxs3TdSE9CoAVbBqRrfvgVfymZI7eXEL+DQaOYa5jW+nHgtnrJNxlwzRCRm1K6nY3wOVvJteY7oI64PezHNOsKTcicATgoMcNx/DleFe8O7wCeWct/htWob21sUSVqVA2rVdBVUPRDCykxXQ12BoNhbQd0MjWSWZ+4Z3rk3Oj5M0jaFU80gqwQ8t8nCotRp6bWECplSGq1lkSOCVhMk/LYmIZsH/9P78qtj8w6x+OnW9i6Gfj9nUeQJOt97WMvUESfviwLMcL3M3Gtl+5icKmAc/8WmHCVS5mC8SQTxo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(451199015)(41300700001)(71200400001)(478600001)(6486002)(31686004)(966005)(110136005)(4326008)(66476007)(76116006)(64756008)(316002)(8676002)(91956017)(8936002)(26005)(66556008)(66946007)(66446008)(186003)(5660300002)(36756003)(6506007)(54906003)(44832011)(2616005)(83380400001)(86362001)(2906002)(66574015)(6512007)(31696002)(122000001)(38100700002)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TjRxZVZjd2xsU1FqTzRhc3lBVi9WSGdRYTFlMUd0U2NBblhZVkFybytNNVli?=
 =?utf-8?B?ZjFpNHZXbEVFVnhBOVI3cndDdndiblBXeEZvY0ppdGtTbjRwNENEeklweHI3?=
 =?utf-8?B?YXA4cUpzenNNZ3NHWlgxb1JFME1helVYOFZKM0kvcmErVWYvdDFtQWNmczhH?=
 =?utf-8?B?NW8wOXkvVEtJbXE4ZWJoeC83bnJaTGhaaGNFV1JsMTY2amRFcEpKa0l1R2V5?=
 =?utf-8?B?VHNaVzV5ZDFqOWtZRXg5NytvRGZoWnZ3alNKazR1Nzh3SThWMGhuQXV6RlRn?=
 =?utf-8?B?N3UrLzNRTEF4RjFjWnJCL1JvWnZ0ZWQ4c3kwRHJNWUJtMTZJYWcwbmRIbTZP?=
 =?utf-8?B?bkNrYURsV25GTFNWK0J5TWRPSVdIYVFJUmJmQ05ZZjYvcU5rTzZOV1pMTkY5?=
 =?utf-8?B?dWpPK1hTZHhLTm5JUURDQW1pY1k0NThkalJRTHNCWElPVStWSTRCY29wN2dN?=
 =?utf-8?B?eWFBdUF1RkNnUE9UdXF6SmNWNkpYOHlzYUU0dFZqaUNFYmJRZDVEWDBVejZt?=
 =?utf-8?B?bjBqUVozYll5ZnVmenhJcXREeDNua1pIQzh5bUhQb05NbFZOTDl2NzQ2ZGRK?=
 =?utf-8?B?MmFnZ1ZkY1laNHBIV05PaWVleFRxMnEyWWE2OVdPbm5GSW1uV052cmZrQXZS?=
 =?utf-8?B?SmltNkhGbVBVN3NPNW9VM2hoRVpoc1ZrVkF6ak1kUDZjMG9JMXVqVVdLa2dX?=
 =?utf-8?B?LytSa05jRUFWc2FNUVVKQlNSY2hLQzZadGF4eFN0YXNXNkszbGg3anNvMmZI?=
 =?utf-8?B?UW1hQXNGL1Q0TGpZNndWd3ZKVWczMy9sVllUaER6cXEwWXRnSVhadXVZTmI1?=
 =?utf-8?B?eFd2OGVXa2JERTNETERQazQwRlNnTHVrNEpxRGpMbW5XeGtydUR3ak11TzBB?=
 =?utf-8?B?bVJiWm9xdlQ3dVZzaXFQTkRMeXp0ZkpvVjlkYzREU1pDQjJza3NObWdhY3hK?=
 =?utf-8?B?dVpGVTV4SjdwcmNiMTczMEtCbjhLRG5HVUtlVlMweHZTeERuNWJBSW5kRXdN?=
 =?utf-8?B?V3JLOXRMY1pKKzYyV1crNnlScWRCZEtiZlcxcm1odldZZENWc0F5QUhpa3pP?=
 =?utf-8?B?RUxTSmZtb3hvOGJUWEZjU1VsRFNra0d5TksySk1JOE5UbWo2NTlEcktmc0Ni?=
 =?utf-8?B?bGRtbENyK0lNanp1VWZydmlFcGphbjBEbW5QL1E2eFhtdCtrQm1IT2ZDbUtC?=
 =?utf-8?B?SzVlMGpHRDNNTWE0T2haNkhlN2RjdjRoa0NHWUFOT2Irb1ZTbEx6YlRvTmJ5?=
 =?utf-8?B?a25iNUhSNzRTTjVUeU9LSHVvelRLYmxtVmZ0U3BOZE15MVdWNlBDVStjS2Q1?=
 =?utf-8?B?SSs1bFpZaE1hNURlY1l6NjFEaDBhM056UWFiL3pVVU4xUXFLOVRidThtNVdu?=
 =?utf-8?B?d0dWWWliVUc2c0dPa1dxbTE4c2tZWTc4NW1IZlVwR1RqK1Jlc0czbEM3UFJX?=
 =?utf-8?B?QWIxYjdlSUkralRXSno1OTdZZjBJdHEwNG50dUV3bHB5VUdkK2hJMFdsbitK?=
 =?utf-8?B?c0Rxdy9qSVljai9NYTk0Z2w5bmxjNXB6eGozWFpJZzJ4bjJTcFF5RUluVnQx?=
 =?utf-8?B?YjJ5cDA0QUxrazFxcU8wT2hUdHFjMTJYdzBxZFMzZ1gwMWtFa2p6K3RDQkFM?=
 =?utf-8?B?Vmt2em9aMFA2aUlMUzVuWFVFME9qVG9KMUg0QkFkdzBXZlNQaW5heGwvWmtY?=
 =?utf-8?B?Q2Exc0diRVJxZEpmSGljUUFvN0pJbHZSamtLbUhmQ0lkb01VWWZRb3gyZmdK?=
 =?utf-8?B?bFRTd2VRRzM2dG01ZG85UXRKMDdiWVhaVUI5OU1ocDJQRnVtbWZNSEorWWcz?=
 =?utf-8?B?SnVXeDd6Y0xrcy9RNS95V3dDWVZUV0hrNmNYRmluZTU4OUpGVjZ1NVNFQ0hK?=
 =?utf-8?B?U0hVTThhcGV5NDVydU1Oa3ZhWTJML0RsZm9WNmFQWTBqbUxZMXBnRllrS3ln?=
 =?utf-8?B?NXpkWHF6MlBqLzdCYnNEWGVlSTFpelVEQVlCMmlKT1MyQzJ4a2VSN1BkMEJa?=
 =?utf-8?B?czFhdU5oNkNxTzVqeDJkb3FMMDFicjgwcUpEdmJIUUZTUUZqTFFFZHkvWGNI?=
 =?utf-8?B?YzRuVFFQeGlKeVpHV3QyajRNQW1lNU5Sajg3dGc0Z0Q3djV6S2hWM0N6TlRo?=
 =?utf-8?Q?SQjQUdyP+JRdt4AHMVvOpu9pw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <48EA998326A461408069FB62180FB974@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca931e0-1e0f-4a53-9e42-08dacd58985c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 13:42:42.2900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YEaOhTPc3kdIqldK9EbykxUv5UD3DYO0NLS3Gk1H5qtV9wN5VSbiUk1y8ustYGEDVyemx7C//lUU2s8Lw0AOjtumrFM1C9E9m564LFNx2T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1956
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGksDQoNCkxlIDIzLzExLzIwMjIgw6AgMTA6MDYsIHpoYW5nLnNvbmd5aUB6dGUuY29tLmNuIGEg
w6ljcml0wqA6DQo+IEZyb206IHpoYW5nIHNvbmd5aSA8emhhbmcuc29uZ3lpQHp0ZS5jb20uY24+
DQo+IA0KPiBGaXggdGhlIGZvbGxvd2luZyBjb2NjaWNoZWNrIHdhcm5pbmc6DQo+IC9hcmNoL3Bv
d2VycGMvcGxhdGZvcm1zL2NlbGwvYXhvbl9tc2kuYzo0NTc6MC0yMzogV0FSTklORzoNCj4gZm9w
c19tc2ljIHNob3VsZCBiZSBkZWZpbmVkIHdpdGggREVGSU5FX0RFQlVHRlNfQVRUUklCVVRFDQoN
CldoYXQncyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgbmV3IHBhdGNoIGFuZCB0aGUgb25l
IHRoYXQgaXMgYWxyZWFkeSANCmF3YWl0aW5nIGFwcGxpY2F0aW9uIGhlcmUgOiANCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvcGF0Y2gvMjAyMTEyMjIw
OTA2NTUuNDg0NTUxLTEtZGVuZy5jaGFuZ2NoZW5nQHp0ZS5jb20uY24vIA0KPw0KDQpUaGUgb25s
eSBkaWZmZXJlbmNlIEkgc2VlIGl0IHRoYXQgdGhlIGFscmVhZHkgZXhpc3RpbmcgcGF0Y2ggaGFz
IGEgbW9yZSANCmNvbXBsZXRlIGRlc2NyaXB0aW9uIG9mIHRoZSBjaGFuZ2UsIHNvIHVubGVzcyBJ
J20gbWlzc2luZyBzb21ldGhpbmcgaXQgDQp3b3VsZCBiZSBuaWNlIHRvIGF2b2lkIHNlbmRpbmcg
dGhlIHNhbWUgY2hhbmdlcyBhZ2FpbiBhbmQgYWdhaW4uDQoNClRoYW5rcw0KQ2hyaXN0b3BoZQ0K
DQoNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogemhhbmcgc29uZ3lpIDx6aGFuZy5zb25neWlAenRl
LmNvbS5jbj4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9jZWxsL2F4b25fbXNp
LmMgfCA1ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
YXhvbl9tc2kuYyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvY2VsbC9heG9uX21zaS5jDQo+IGlu
ZGV4IDViMDEyYWJjYTc3My4uYWIwODBiNTAyMmZmIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2Vy
cGMvcGxhdGZvcm1zL2NlbGwvYXhvbl9tc2kuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvcGxhdGZv
cm1zL2NlbGwvYXhvbl9tc2kuYw0KPiBAQCAtNDU0LDcgKzQ1NCw3IEBAIHN0YXRpYyBpbnQgbXNp
Y19nZXQodm9pZCAqZGF0YSwgdTY0ICp2YWwpDQo+ICAgICAgICAgIHJldHVybiAwOw0KPiAgIH0N
Cj4gDQo+IC1ERUZJTkVfU0lNUExFX0FUVFJJQlVURShmb3BzX21zaWMsIG1zaWNfZ2V0LCBtc2lj
X3NldCwgIiVsbHVcbiIpOw0KPiArREVGSU5FX0RFQlVHRlNfQVRUUklCVVRFKGZvcHNfbXNpYywg
bXNpY19nZXQsIG1zaWNfc2V0LCAiJWxsdVxuIik7DQo+IA0KPiAgIHZvaWQgYXhvbl9tc2lfZGVi
dWdfc2V0dXAoc3RydWN0IGRldmljZV9ub2RlICpkbiwgc3RydWN0IGF4b25fbXNpYyAqbXNpYykN
Cj4gICB7DQo+IEBAIC00NzUsNiArNDc1LDcgQEAgdm9pZCBheG9uX21zaV9kZWJ1Z19zZXR1cChz
dHJ1Y3QgZGV2aWNlX25vZGUgKmRuLCBzdHJ1Y3QgYXhvbl9tc2ljICptc2ljKQ0KPiANCj4gICAg
ICAgICAgc25wcmludGYobmFtZSwgc2l6ZW9mKG5hbWUpLCAibXNpY18lZCIsIG9mX25vZGVfdG9f
bmlkKGRuKSk7DQo+IA0KPiAtICAgICAgIGRlYnVnZnNfY3JlYXRlX2ZpbGUobmFtZSwgMDYwMCwg
YXJjaF9kZWJ1Z2ZzX2RpciwgbXNpYywgJmZvcHNfbXNpYyk7DQo+ICsgICAgICAgZGVidWdmc19j
cmVhdGVfZmlsZV91bnNhZmUobmFtZSwgMDYwMCwgYXJjaF9kZWJ1Z2ZzX2RpciwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtc2ljLCAmZm9wc19tc2ljKTsNCj4gICB9DQo+
ICAgI2VuZGlmIC8qIERFQlVHICovDQo+IC0tDQo+IDIuMTUuMg0K
