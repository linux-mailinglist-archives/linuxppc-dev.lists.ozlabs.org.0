Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A867AE93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 10:44:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1zSh1lnPz3cdQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 20:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=011ANMQv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=011ANMQv;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on2084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1zRh1V7Fz3bTk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 20:43:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO+e8eGX7FveF4WNHoqUAhZHBDIg8WIfz6S8u1RwS2J9+MVi+qkJ2FU5n8NSV8200qkPd/FVL02+Trp01sDxKRMG8+wqUkhcD444FjkRTIkw9m9SK3x6WbTyf5xNFDHZvKv2hTbmPXEtYp+BsBSIGciEd22EoPjIWO/3gG55X84XSKtzq/dajyo9jmrTeGLJGMmKbXFFnChFhlXehuLR5elkO17qw5Z4ab0xTTAlm0VUZl034nqPV80ln8rugKzxUedtWNWvTq0QECd5X2adH3Xv4+22iP2vhmGkIhFqbUiY3xtmOoawbm0lTfmTh2uC+L/UZ9lGw5FZX27BjthIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IP24jkq/FfB7Gm6NdfVKeuOQCPljT0bxBGLPFzSMoy4=;
 b=Zs5QqB7QRYW+SmWF5cmYU4z5lRkcpm0ggUINJS6xu8QSVAsHNANEsxJH1bGOpzKtU7EPv4sNsWd1O8oFr7tBaWs4SMNnNmTP33hSu156mPcquMXYNxkr+7NPFce0771XMqPBDk/EqWMBgQz8Qe9Od+B1u5/Xt5CQpO5wpoMxJAxicIJvTkUaPt28rMZTgL4/bSIEoFjGmJ/aqfLrs77BwcqumqbhDtIFRF3RUAm8PRkg/QKqZhqyZOaprgXUY2+bvOdqJBNfqFm0Us0d3HvwOWI+4EKwvN/7mpz3RopRBrNRF8iRz3nrPStwIuMnWzk5WhcHeG6ncEiIaD7XNDDaOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IP24jkq/FfB7Gm6NdfVKeuOQCPljT0bxBGLPFzSMoy4=;
 b=011ANMQvalSunThoBn5gMLuaqaTZFsKcZGJNXR/4r9Z9PjC9WhmFlVwSkOwu2K9qtJaSWwwf05/XwVy3aNPpuiXfAfdnfDcZWFV8jUVfqWsA6zXC+acD52HKW7HC8jiSE+HpJzuYHRqKeIolIqnhu6lhYARSkT5TvMSeKQ6P9/nznp7kDAFMVtDWOyT7Mj+i/NdwsmfaVSNb1iJfA8aD9ub9CFu5MbGFTB6WWQpbEfgB2el/JaduT9/tjpPwTe8rnAFfZBftBUtsQ1uTuwWeJXjhge2uYpCN+/JE7lW4WXdDKS4siKQWysbiDvYjHETBE4wYb4g5ldegG+jRscaT8g==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2491.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Wed, 25 Jan
 2023 09:43:05 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::2cfb:d4c:1932:b097%4]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 09:43:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Gray <bgray@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Topic: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
Thread-Index: AQHZMD63caK9kPPNA0eQ1a4ZVMQtPK6u4luA
Date: Wed, 25 Jan 2023 09:43:05 +0000
Message-ID: <ffcd0097-b366-b98c-9853-1d10d78a5666@csgroup.eu>
References: <20230124215424.9068-1-bgray@linux.ibm.com>
In-Reply-To: <20230124215424.9068-1-bgray@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2491:EE_
x-ms-office365-filtering-correlation-id: f25a3389-f438-4068-d50b-08dafeb88f09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  EUW2ZsWlgzNkgq4qDfurZrA/1fxD1JprqkPe5mbfy9KtM0AfgiK6FzO/+JX2dIsT6snLry5Rw71SK7u+JdYyf9bRy2ddhWQwx7cRlxdWjuiLAzcITK1Fxm6lr+umkU7cBuNwd+wZa4rGk7qnb6wJlC3YaOBCAoEuU0iR4aFlwfwIZhwpXmtcaWXYTkQebyZJVLtUJOIxyfJgaUtH45h+/gB/ot9mBo2dOpe2RiwOfyet1S1MkOZ5oTA0W+QQSb+zmQkkI+fVAIeH/Ezk/GthJX/l1kuhxUaetrRy/VXfssimVZX7aeXD06uQT7QSvlwMR0zcC6Ic2gsKV2UcscB0y53GG/2qNVMsqeBsnjVu9Wp2uMe7LUPFBUPR+1uDxZt7/ItpofQIzywSmH0tBIHSIPK+HI7G1rBbawWtfZE4P0RBFtaIn/93tYVit546bgos80nMgU+xH+NJYloJvVotl3nuQ4wXzypH1xqPUFY5sWZTdBG/Pe4zgZU2hgwnfTDyZLO2Yld+RuiAucfZZvstaX5NM/5w/s/QT5LSSD7i5a6zT0HHdNsf5goVYeRILWAT0kBxq+JCEqTYdPZ8wSAHL4amOSzFiYAI20ear4CP5z0hzHQNGrJa2ltXH89CyJu/B3zwhz92tTnG1MWSg/RBh2cjo4dCYd5VWmu6BiSfq7hgVRI0j1QviahvKh38uh8HR2Ks6EjGw16XT0+yBi1WTZQYUkbyhfdc479ms3hSEx9dF6/UeFz8t3RF7Bot0+r6cDUUtqoutDR10fp4DY+y3/WIkE5AezuYgs2tMN+9G1OKVyIw6lmtkziivRZk83sf
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(376002)(39850400004)(346002)(451199018)(76116006)(64756008)(478600001)(2906002)(2616005)(6512007)(966005)(316002)(110136005)(6486002)(6506007)(71200400001)(66574015)(38100700002)(5660300002)(8936002)(122000001)(38070700005)(86362001)(44832011)(8676002)(91956017)(36756003)(66476007)(66556008)(26005)(4326008)(66946007)(186003)(66446008)(31686004)(41300700001)(83380400001)(31696002)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YnZTamxPWGlycndIblQ5ZWlIaXhTaS92SjBHVHF0NDVvODE1T2NONjhqZlVX?=
 =?utf-8?B?NlVYQkc5UWtCT3hXNS9xWC9BcURjQnVhVzJRMG5mUDJZcXU5cGpUMTc1R0FI?=
 =?utf-8?B?bmpXanEyb0NNbkFENFNza2dzdWtPRkRxcCtaNHc4MGc4YytxOGhFbmN6bC9K?=
 =?utf-8?B?Tkh2eHhnQW42RzVkNm51M1lZaTRrQmNUY3NBU3BpcFI0dmI4aDBmRFRiSTJG?=
 =?utf-8?B?MzhKYlJMRWpKNHRpVUxTaGlVY3FHQUxwSXFYZSt4MlRwdEphdFJiRUNIRUta?=
 =?utf-8?B?aHNrY1NkSnAvYmZXd3lacFNQMXBPU0VYelZtZHEvQUNDa0ZNU20yeHAxK0Jk?=
 =?utf-8?B?NHFHVnJyZGFTaXcwT2tjM2pRQmRmbTFQazJ4Q05EUmdsSjNjSmZQQXhvc0F1?=
 =?utf-8?B?QXFoVld4RmdSa1hHMDRyaEhEbXJrSm5QVFJLTHo5YVpiRnUxYkM5Y2w0RStw?=
 =?utf-8?B?bWFreXQrNG5yN1l1cEFzd0QzcGJ3bzdNOGVJbG83L0J5MTV5YnVPOTA0VGYr?=
 =?utf-8?B?WW0za3ZHRHRQc0J5SE9wTzdwZlVCbzd2dCtIbERzZHFMU0hmcTFnbTRQSG8z?=
 =?utf-8?B?VzlwTEhlK2NCeE82TndZRm83eUQ5YTdlSzJIQTMvdm9CLzF0NVArMUFudUVY?=
 =?utf-8?B?dkJqeUgydlhSQ3NvUDd0cklUU2h2cURZT1phVHlxNlU5QWdSa0oycy8rZXRa?=
 =?utf-8?B?VEpHQVRlbTYzU3hySWZnWkZyN21oUTZXTGV6bnlYeTJncHFXT1JMay8zMUxt?=
 =?utf-8?B?WjJEaXgyeDcyTHlJRTMzeGNLTlFwTXhveXRwaGFodEMxRHN5ZnFYdVdXYkph?=
 =?utf-8?B?c3ZOQ3lPbjJzWHpjallJR3kzandjNFRpOTl1ZWhwU0lGUlNFSHlVeGRqOFp4?=
 =?utf-8?B?RWxtZmdwZVNaUmtsTVlhVFZQYVZlZldOZnpMR2tSWUJaNmRnS1J5Mmw1UW5H?=
 =?utf-8?B?amFYa09LdmdKRlg5SDZ2R0NtcUlBYzlpZktzemNFWTlsS0ZMa0dNNTRoWUp0?=
 =?utf-8?B?eU51R2wxRWE3ZmJabHdnRm12Y251YUlpcGlldldBZG1QY0pWQ0VtQWdGYXFN?=
 =?utf-8?B?dHRYWlFsWDBaM0YzTy9kenJTZk1GQlZPd2paZ2UyZWR4UXZ4TlFpMFh0TmNj?=
 =?utf-8?B?c2xWSVlTUDJaM3FDb2ZrTTI4a3IvS2k3cXR3dlAvZXNGWGl1bEROcDJRUmJp?=
 =?utf-8?B?NGJybkcvOXhZeHJQVk9mMk5STFZ3MzF4SkZERVUwaDgxdzA2cVk4TVZ6TzZG?=
 =?utf-8?B?N29BTUMvOHFoR29rWVhKMWtRRG9JRklIbEQ3ZWk1WTByR0lRYlFvaDkwbWpo?=
 =?utf-8?B?TFl3aUUzaWkzOHVrQnMyMEdEYlhhWVpVS1kxMUhNSmV5OEJONGhtdi9iamdz?=
 =?utf-8?B?YlljWjZKQUg5WTUzSm14OStIV09SMTZ1RzcxeGp0eUYxZ2ZobmdSbmdiOHRi?=
 =?utf-8?B?TGFTM2o3NG95L0VXTEZhaHFHTitEWDdhLzU0bjlXMk1JVW9KRCtqM1QyZ3lP?=
 =?utf-8?B?SzZNTm5DM1RLSGYyNTR0aEhUT3VuMEdwMlJveUYwNzIxZk5BVWRhVUkyMUZq?=
 =?utf-8?B?RmVIbXJ2K3h1WDd1NHBBdXhaVy9CRllFYXVUTlpFVVIvSmVDOGJ3b3dFOWFv?=
 =?utf-8?B?eEtrT20wMEhRT2k3VWYwRElpU01nTlNGdGJrRzhWYlRPSVRZUENPd2l0YmZQ?=
 =?utf-8?B?R25sZHozakhlSFhSa2ozOWdSalFjcVV3dGtJWnp3Y0xZMC95bnN4cG5OdXBY?=
 =?utf-8?B?Tzh4blZRYVY1OWx2clF5SVdGTk1wUTV6Qjk0UGdmelo0UkgxUDE5cVAvMHhp?=
 =?utf-8?B?VkdJOHlkMDlhZERtbDd0L3h4TEdkcGdTdGNSU2Vxb3NuNnpLSk1ia3ZScDBm?=
 =?utf-8?B?UVpSM0t1LzhYZFJyakYvQnRpaUM1MU9PUTh1eGprUS9SZnF5NG5Ua05qMUp1?=
 =?utf-8?B?NHZKQ1dqQnczZ05NdFVLclIxRytXUHBNVzFjdGhEOVA4UUpSbVp5b0Jwd3ZZ?=
 =?utf-8?B?bklLNjFTY0hEOGhqTmJjSEIrbkxXdTJySmFaWlFKc0pjRU5lRm5ObldQQ3Z3?=
 =?utf-8?B?TnY3L1VJWXdVSTZmOTZOK1R5cUNzaUQ3VWZpcy9JYjJPT3RsY0FGcEpWYUJM?=
 =?utf-8?B?SnRhUEZHSUY5MHl0cGV3UVQwNitaYW01Vm1YRThtNTNSMk84d0tRcDZQK0Nk?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB4BC739BB915C498C8D586AE19FD6EF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f25a3389-f438-4068-d50b-08dafeb88f09
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2023 09:43:05.3101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJzZYnr7eOcQtgEUnaNLrbpFrAgbPWrEOR3XkaS8O8ixwIQdAsb84YcH67eFfLIukkfFGbGOPxl/zxaVeCmsOGSKc0bSsaiOPq/BhVnhoU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2491
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
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzAxLzIwMjMgw6AgMjI6NTQsIEJlbmphbWluIEdyYXkgYSDDqWNyaXTCoDoNCj4g
Q29udmVydHMgdGhlIEJVSUxEX0JVRyB0byBhIFdBUk4gdG8gYWxsb3cgYnVpbGRpbmcgd2l0aCBh
IGxvdy91bm9wdGltaXNlZA0KPiBjb21waWxlci4NCg0KTm8gbm8gbm8gbm8uIFBsZWFzZSBkb24n
dCBkbyB0aGF0Lg0KDQpUaGF0IGFwcHJvYWNoIGlzIHVzZWQgZXZlcnl3aGVyZSBpbiB0aGUga2Vy
bmVsLCB3aHkgc2hvdWxkIGl0IGJlIGEgDQpwcm9ibGVtIG9ubHkgZm9yIGxvY2FsX2ZsdXNoX3Rs
Yl9wYWdlX3BzaXplKCkgYW5kIG5vdCBldmVyeXdoZXJlIGVsc2UgPw0KDQpSZWFsbHkgaWYgaXQg
ZG9lc24ndCB3b3JrIGl0IG1lYW5zIHRoZXJlIGlzIGEgZGVlcCBwcm9ibGVtIGluIHlvdXIgDQpj
b21waWxlci4gV2UgcmVhbGx5IGRvbid0IHdhbnQgdGhlIG92ZXJoZWFkIG9mIFdBUk4gb3ZlciBC
VUlMRF9CVUcgaW4gDQp0aGUgbm9ybWFsIGNhc2UuDQoNCkJ5IHRoZSB3YXksIGFyZSB5b3Ugc2hv
dWxkIHRoZSBwcm9ibGVtIGlzIHJlYWxseSBCVUlMRF9CVUcoKSA/IExvb2tpbmcgDQphdCB5b3Vy
IHBhdGNoIEkgd291bGQgdGhpbmsgdGhhdCB0aGUgcHJvYmxlbSBpcyBiZWNhdXNlIGl0IGlzICJz
dGF0aWMgDQppbmxpbmUiLiBIYXZlIHlvdSB0cmllZCAnc3RhdGljIF9fYWx3YXlzX2lubGluZScg
aW5zdGVhZCA/DQoNCkNocmlzdG9waGUNCg0KPiANCj4gVGhlIG9yaWdpbmFsIGV4cGVjdGF0aW9u
IHdhcyB0aGF0IGEgY29tcGlsZXIgd291bGQgc2VlIHRoYXQgdGhlIG9ubHkNCj4gdXNhZ2Ugb2Yg
dGhpcyBmdW5jdGlvbiB3YXMgaW4gYSBmdW5jdGlvbiB0aGF0IGlzIG9ubHkgY2FsbGVkIGJlaGlu
ZA0KPiByYWRpeC1vbmx5IGd1YXJkcy4gQW5kIGl0IHdvcmtlZCB0aGlzIHdheSBvbiBHQ0MuIEl0
IHNlZW1zIENsYW5nIGRvZXMNCj4gbm90IG9wdGltaXNlIGF3YXkgdGhpcyBjYWxsIGhvd2V2ZXIs
IHNvIHRoaW5rcyB0aGUgZnVuY3Rpb24gbWF5IGJlDQo+IGludm9rZWQgYW5kIHRyaWdnZXJzIHRo
ZSBidWlsZCBidWcgYXMgcmVwb3J0ZWQgYnkgdGhlIGtlcm5lbCB0ZXN0IHJvYm90Lg0KPiANCj4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGx2bS8yMDIzMDEyMTIzNDguZURrb3d2ZkYtbGtwQGlu
dGVsLmNvbQ0KPiANCj4gVGhpcyBmaXggY29udmVydHMgdGhlIGJ1aWxkIGJ1ZyB0byBhIHdhcm5p
bmcgdG8gYWxsb3cgYnVpbGRzIHdpdGhvdXQNCj4gcmVseWluZyBvbiBwYXJ0aWN1bGFyIGNvbXBp
bGVyIG9wdGltaXNhdGlvbiBiZWhhdmlvdXJzLiBUaGUgd2FybmluZyBpcw0KPiBub3QgcmF0ZSBs
aW1pdGVkIGJlY2F1c2UgdGhpcyBpbXBsZW1lbnRhdGlvbiBzaG91bGQgc3RpbGwgbmV2ZXIgYmUg
Y2FsbGVkDQo+IGFzLWlzLCBhbmQgYW55b25lIHdobyBtaWdodCBpbnZva2UgaXQgbWlnaHQgYXBw
cmVjaWF0ZSBpdCBiZWluZyB2ZXJ5DQo+IG9idmlvdXMgdGhhdCBpdCdzIG5vdCBiZWhhdmluZyBh
cyBleHBlY3RlZC4NCj4gDQo+IEZpeGVzOiAyNzRkODQyZmExZWYgKCJwb3dlcnBjL3RsYjogQWRk
IGxvY2FsIGZsdXNoIGZvciBwYWdlIGdpdmVuIG1tX3N0cnVjdCBhbmQgcHNpemUiKQ0KPiBSZXBv
cnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIEdyYXkgPGJncmF5QGxpbnV4LmlibS5jb20+DQo+IC0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvdGxiZmx1c2guaCB8IDQgKystLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5oIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5oDQo+IGluZGV4IDRi
ZTU3MjkwODEyNC4uNjc1MTk2ODg0NjQwIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vYm9vazNzLzMyL3RsYmZsdXNoLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2Jvb2szcy8zMi90bGJmbHVzaC5oDQo+IEBAIC0yLDcgKzIsNyBAQA0KPiAgICNpZm5k
ZWYgX0FTTV9QT1dFUlBDX0JPT0szU18zMl9UTEJGTFVTSF9IDQo+ICAgI2RlZmluZSBfQVNNX1BP
V0VSUENfQk9PSzNTXzMyX1RMQkZMVVNIX0gNCj4gICANCj4gLSNpbmNsdWRlIDxsaW51eC9idWls
ZF9idWcuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC9idWcuaD4NCj4gICANCj4gICAjZGVmaW5lIE1N
VV9OT19DT05URVhUICAgICAgKDApDQo+ICAgLyoNCj4gQEAgLTgwLDcgKzgwLDcgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLA0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfcGFnZV9wc2l6ZShz
dHJ1Y3QgbW1fc3RydWN0ICptbSwNCj4gICAJCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgdm1hZGRy
LCBpbnQgcHNpemUpDQo+ICAgew0KPiAtCUJVSUxEX0JVRygpOw0KPiArCVdBUk4oMSwgIlVuaW1w
bGVtZW50ZWQgbG9jYWwgVExCIGZsdXNoIHdpdGggcHNpemUiKTsNCj4gICB9DQo+ICAgDQo+ICAg
c3RhdGljIGlubGluZSB2b2lkIGxvY2FsX2ZsdXNoX3RsYl9tbShzdHJ1Y3QgbW1fc3RydWN0ICpt
bSkNCj4gDQo+IGJhc2UtY29tbWl0OiA1M2FiMTEyYTk1MDg2ZDEwZGMzNTNlYTRmOTc5YWJiMDE2
NDRiYmI2DQo=
