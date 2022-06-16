Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BF54E55C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 16:50:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP4q65DhDz3by1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 00:50:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GddCDKss;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61e; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=GddCDKss;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP4pJ5YWHz3bdB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 00:49:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSXERi08FS/UG0grJYdLNyR/XSXVvDfQp3f6Io3FNu5jFU1ljTdek1QJKCKKdmZ0ww5ZysEc2Az1p5KRvl3RYFTZOHlHhXBTrqE5Tw2NxknECXtitskajhcwUWf90K30Fil/gkw2YN3jnyhxVjWxJTb9Y/Q9jruDSxA9gyTQJfvWGfblLgHjP0K+egXBzwwTrEulGv/zQqMPOnxpXrOFUJIkpfWAijjsDZNNRjfOOZOWsTCp0vuyik5cl9GudecyRBNFYqhUk3Hit4a7C1AeutJ4F/nHqv3uWRXr+fOvZugPMkCZimoP3SnbOF5Ks/f+9qDSWZ3SuC21j6fG9LvBTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5Umk0GCMfA5bLH4vqr/+11CIOgGqybFCrEvB3gtzS8=;
 b=XsRzQqUzOYUEg3dsWBs63tRi2mOHOtf1u4Txfa8H6O/cYq/bjz9ufPqr6mvOMl3yTk2zHcmh2pAlZ22GZVXisycu+K4EUfBN+4wYZr0A5mI/hMibPfPuh+yXc6Iqfx046/uNZuyllRfAEQwijlA1RYI6VyXXtlFVX/RCPGSCIeQ2USnjGTwPm9fumxVME/Z7h7KlO4yo828OD8454+GuJFFXDXLG5oyw602/H+uuatSoBostndcwEpRDtt5rkArcV1U2j9m4+HWoUrNd/B56Cij7GhAvT7vDmPZJvy4wJYrMKMnzYB3fvZU85CTfRj9HffkC3vuuw02BkhUVNpF3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5Umk0GCMfA5bLH4vqr/+11CIOgGqybFCrEvB3gtzS8=;
 b=GddCDKsstyxL+nMz9rRALrYYHOoX9TMCHzA8tHcQJW5Ufd3bRXkkHhP+3VXGAIVgcIXtCuWTVRf95KQYsJydBUpSohlnMiLX74YH+rm49M+JyiAn7RQEz5uKQNUxCrKSJHyfIxOXz6WwGDlB81CrFfkhQG2Dl+xz0zpzycHR3h7iTowbcuZL+Qef8vxyj0Q82yFMAZqvsUXL1tqpODpb5aB6EpiMq/NUD1rnNoKOw96NmB5OC7Qn9637SUfOitk5vqY3eX3n8ScZCz/jvLYI7VGU7lNKjqjdXW51Kipx4ObNsEL7VbGAkrST7/UXRGHBNpQWQQL/RcOK4N9i+mIJ8w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2087.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Thu, 16 Jun
 2022 14:49:36 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Thu, 16 Jun 2022
 14:49:36 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liang He <windhl@126.com>, "oss@buserror.net" <oss@buserror.net>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "paulus@samba.org" <paulus@samba.org>
Subject: Re: [PATCH] arch: powerpc: platforms: 85xx: Add missing of_node_put
 in sgy_cts1000.c
Thread-Topic: [PATCH] arch: powerpc: platforms: 85xx: Add missing of_node_put
 in sgy_cts1000.c
Thread-Index: AQHYgSSC7Eezc3FRx0Sqk04i/snhNa1SHk6A
Date: Thu, 16 Jun 2022 14:49:36 +0000
Message-ID: <db681dac-5c42-d659-d0ed-31390b2feb3a@csgroup.eu>
References: <20220615120717.3965164-1-windhl@126.com>
In-Reply-To: <20220615120717.3965164-1-windhl@126.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f4747eae-1c9b-4eef-7e68-08da4fa76f0d
x-ms-traffictypediagnostic: MRZP264MB2087:EE_
x-microsoft-antispam-prvs:  <MRZP264MB20878DD58A68BD07981FC2BEEDAC9@MRZP264MB2087.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Du59EY/VeSblyyGCiq6UXMlONriEiV/NrU9fMLht3e4SPr5U4tvLFUE9ZsNswi2lODRgT61IA8robWp1Y1FlQi+f3hMFwg9OA1XMMmlI1Ghdn7YtMAMsHfrjWlbMR7mBxDPi1zuyp3TeMBMl1gm7aUy5zOnYbwCC9VgbxewRquM0p2wcuR8Cb1OMVh4YmR5IBQa9b2HV+aepYv3Gw5+epMqJUq+/QaKXJmA8o5Mo8uIOR+oNGF2wQx0Dmfkav7ELH+SnbIDfdGqohwFijJiIU/SwixSnjrfxElFKjdBXWOSJU0Bvxj/gsKokPj99vEchuHhkUOAwifbQqHICsnbMg3pq8ACv6y3wTCNGx7OkE+kVCOlV+9bPISJ9DZH1YmPCuTdDQS5llraTzZx9cJgDIb3EZNDn1lEp4lgHM9+VwFXNqmKSSWCQC21dRXRsqXxl5OZYtS/wNBkUYGuZ6px9ljx8M1q+uWA1bqLVEugYPWSYc/X7BfOFNuWZE+VWBORU3DX1OsSCbUYpSd3yVYWmQK4f3C+DAgGHeLxdDGOh8aRr8i0rh1YioQWJHdyHH+t0ZmSU05dz84O6ic+eL3hswKeobAE7raleFc6oiK3IC9L1E1LomqbRtSCR9jCCwPZ2dPnSEvxYMQZY6Fcwq99n1C9YhQpeSkwEPhq5apjQRqX8pzCWIanM3A+eZgya5gIN0oJfctvdlEc8jBzEzw69pocrIpuvKXrCp75XsHec41s4Qkwlg4HJDub9vH/VBk/N1I0Kfd25RL/Ll0T9XlAElA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(31696002)(71200400001)(186003)(38100700002)(6506007)(54906003)(110136005)(38070700005)(66574015)(966005)(6486002)(8936002)(6512007)(5660300002)(44832011)(26005)(508600001)(83380400001)(316002)(4326008)(2616005)(31686004)(76116006)(8676002)(122000001)(36756003)(66946007)(66556008)(64756008)(66476007)(66446008)(2906002)(91956017)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y1ozQTUxQVJtRWJUd0c3R09sRU5MRXdxTFFlRHdYNFRwbTgzK2tPNTJRMVRz?=
 =?utf-8?B?RGtERkR5Y1hwdmozWlJFQURuOGF2M01GN3Q0c0d2TkdWRGxncmJDWnp1Y3Vs?=
 =?utf-8?B?dURUZ0cyTzU1cU9XcVV1TFJWL1c0UFRmVTBmamZ5ZDZNN2ZnTXgrRm1yakdt?=
 =?utf-8?B?QkJrUmNsVjBnOVR2dld4SFJNbnd2d0UwOThuL0gyUHVJTG95QTZNZUQ1RE04?=
 =?utf-8?B?V0VNby9ZQWxVVW1WNnhkMzQ1Q3RhNkZkSU1hSEVrcTFWdE50Rml2N1VONkFM?=
 =?utf-8?B?QmNucE9jUHhMdU41ZUxhaytlZ3A3am1HSXRTQlc4OGVFMkhjdkdGMGc4N0ti?=
 =?utf-8?B?eFZ2U3RaS05GOWpmR3F4S0s5RENiZWdEWHh0SFZPUmgwczhCZVF4UmQrcHh1?=
 =?utf-8?B?U0xya1l4aUxaWlJIdkhqRERUUVdZd0EwNEpGM0gzdmFwR0dQdU83L0lYUzNs?=
 =?utf-8?B?cThibitQOTlab2QvRWFvaURnQWxMd0JjKzkzM2Y5WDZSczR2S2t3RFY0Yldn?=
 =?utf-8?B?U0ZTcjNTdDlscTFlbVlhcjZkUURzeERoODJOV1ZMRklWbzhlNkZ2V2cyaG9K?=
 =?utf-8?B?VGpQQURDOUZMbVFjUXZxanhzNWxuQTBFNXBNQ2NEaW1YbW9ydXBIeURUTUFD?=
 =?utf-8?B?Z2xvWFhFRGZJcWQ4OTdWWFFoZVRXRkNXRHFlZXI5WUJUUkRYSXhvVHcraUMr?=
 =?utf-8?B?ZHQrZk94YjF5MTZ0aEpWZHVMbURlWUpVTWZTd1o1aWd6RC90WllURy9ONkcr?=
 =?utf-8?B?elYxZmRKQW5oYnNEVmJ0aXI4dkh0dHFxT05kT0pmVTh2R1ZrdVY5WEFDZm1L?=
 =?utf-8?B?L09WTkNicTlCUE9MS2U5SjlST0l4R0xiOS9ZM0FOWm5lbTB5WlVsTVBQMEx6?=
 =?utf-8?B?TzJEV3UzZUtpcFBuZi8vLzhNM2NLOFpYUitzaDg4VXJ2R2V2OUhzRFNneDhV?=
 =?utf-8?B?UFdyNGJNZzUyYXcrKzRDZlNGYjlmNHBvd2dYOVpqaGFxbnJCQnRYeGx2WWhv?=
 =?utf-8?B?L3ljOTZMN2xFa2JpcllEWC9HcjkwOUtjMGVPbWdyU3IvUWlaL0V2ZHI3dFI5?=
 =?utf-8?B?eUxJb0xtNG1EUWY2N08zMFBRb2RSRXBjSHk3ODFZL1N5SERMUjV3ckZKV01B?=
 =?utf-8?B?aER4VDc5eU5Xa1lEZ2VSOVM3MXdKRkV4SHlYR1lCQjJkSUZvd3V4M2ZhaEt5?=
 =?utf-8?B?Y25TbTNoLzZqcDV5VzhPNHdRTnJJUlcrK2FGMXY2cXYzcFpOM3h3clMvWWdO?=
 =?utf-8?B?MVNaY0t6ZDBIYTRTUTNrK205d3ZxUU1uTUtqRWhiOEZ2OU4vVWJhSUxSY2Jh?=
 =?utf-8?B?TEtXOC9Lamt3eFZDN3AxTktHQ1luRHVlYzFTRWoxSUlHQnR0ckN3NlUwalgv?=
 =?utf-8?B?THBtVFJXbEJHaEZrOEpzSlEzZ01BZS9LMDhkd0VxMjVUYVNOR1BkY1l4Tk0z?=
 =?utf-8?B?dzV0V2RaVnZLdU9rVms2cFhJdHJUa1VjR1lkcVZmclFlUVlxTjBLMmJvOURt?=
 =?utf-8?B?dnpDZnRNRlI3K2FmalpIclRKVzhCNmZCdlhiRzhIbTFlb1dXUXZrbEdPZHVC?=
 =?utf-8?B?enJSNE5tT1BNY3JVdlB0WFY2N3VsdDBCVkJjRCs2enpZdUY1WGdMb0VFcmxS?=
 =?utf-8?B?dlFoclJMUCtiKzNJa2E5VlltSFVUVE10UlpCa1VIb0l0d2NQSDJOaXNxNVlM?=
 =?utf-8?B?MGQrMkU0ejBQVUx4SUxYN1ZHT2xKckdrMEhOUDFmb3Rpb2J3aVF3SEtreHhI?=
 =?utf-8?B?ak1McGdEaEZQZktiWFdnTm9mNXB0MVFOdHNyd2l5WTFMM3F1ZzdkQVBvblQ5?=
 =?utf-8?B?R1NBWWllQjhoV2I4aW9janhJZnlHSVoxMjJYeEg1enpNVUxMYUhzcWpXNTcz?=
 =?utf-8?B?dVhYRFNhR3lTZnkybDZsNFBrT09Qa3B4VWd5YysybXhRd2l2eklUN3M1OG8z?=
 =?utf-8?B?WDdjaXEvOGZnTWFON09meWhQblA4aEdvNlBaamxGWldrL0tZZW9adkZ2TGtM?=
 =?utf-8?B?Q0oyT2YrZklack5odGY4NjBjQnp4SzdPcVBkMm1zNStaTHpGSjF0aG5xVVVw?=
 =?utf-8?B?M29CZDJCMllBK3cvZEh0ckpwUEI2UDFGaExWZnhnR3FKQjljQVcyYnd3d3Iz?=
 =?utf-8?B?UHZYajFMQ3p4NHR0NDJ5TlpVL0JYdFFOL3BxU3B2Wm90RVczd09kWDFyS2JH?=
 =?utf-8?B?R0NubEk4ZnVtZ2lwaFg3d3c2WFBoQjB0eTk2ZHlGdnZWb25DdDVOL01FcWdF?=
 =?utf-8?B?T0ZncERESmpTRnpmRmc0ZXVsMHhtQjZXWnlhSERwcitidzMzNFlxMU83WTkz?=
 =?utf-8?B?OTFHazZ6ZjZNRjBHTVBvbnhNYW9LcnlOQllhRkNJdU13alVMeVBlK0p3aks0?=
 =?utf-8?Q?egtEDC9Rp9xIdO7RJfzU4YVU3pyKoBeCV3yJl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAD173419697E84EAA7F11E489E8FA04@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4747eae-1c9b-4eef-7e68-08da4fa76f0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2022 14:49:36.7322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /YgYuAOnPQArCC8lJR0D0unbrHCUAsybAIAqp5xqLGuRcqr+fHK7HUPQlToxBH5UOlWOrJMuE/m4fMsqq112vLBbCOUFiiJpjRzKt3UJ3ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2087
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE1LzA2LzIwMjIgw6AgMTQ6MDcsIExpYW5nIEhlIGEgw6ljcml0wqA6DQo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gd2luZGhsQDEyNi5jb20uIExlYXJuIHdoeSB0aGlz
IGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRlbnRpZmlj
YXRpb24gXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGlhbmcgSGUgPHdpbmRobEAxMjYuY29tPg0K
PiAtLS0NCj4gICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvc2d5X2N0czEwMDAuYyB8IDEw
ICsrKysrKysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9zZ3lfY3RzMTAwMC5jIGIv
YXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3NneV9jdHMxMDAwLmMNCj4gaW5kZXggOThhZTY0
MDc1MTkzLi4yYTQ1YjMwODUyYjIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9y
bXMvODV4eC9zZ3lfY3RzMTAwMC5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4
eC9zZ3lfY3RzMTAwMC5jDQo+IEBAIC04NSwxNyArODUsMjQgQEAgc3RhdGljIGludCBncGlvX2hh
bHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICAgICAgICAgLyogVGVj
aG5pY2FsbHkgd2UgY291bGQganVzdCByZWFkIHRoZSBmaXJzdCBvbmUsIGJ1dCBwdW5pc2gNCj4g
ICAgICAgICAgICogRFQgd3JpdGVycyBmb3IgaW52YWxpZCBmb3JtLiAqLw0KPiAgICAgICAgICBp
ZiAob2ZfZ3Bpb19jb3VudChoYWx0X25vZGUpICE9IDEpDQo+ICsgICAgICAgew0KPiArICAgICAg
ICAgICAgICAgb2Zfbm9kZV9wdXQoaGFsdF9ub2RlKTsNCg0KRHVwbGljYXRpbmcgdGhlIHNhbWUg
Y29kZSBhdCBtdWx0aXBsZSBleGl0IHBvaW50cyBpcyBiYWQgcHJhY3RpY2UuDQoNCklmIHlvdSBj
YW4ndCBkbyBhIHNpbXBsZSAncmV0dXJuJyBleGl0LCB5b3Ugc2hvdWxkIHVzZSAnZ290bycgdG8g
YSANCmNvbW1vbiBlcnJvciBwYXRoIGV4aXQuDQoNCj4gICAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gKyAgICAgICB9DQo+IA0KPiAgICAgICAgICAvKiBHZXQgdGhlIGdwaW8gbnVt
YmVyIHJlbGF0aXZlIHRvIHRoZSBkeW5hbWljIGJhc2UuICovDQo+ICAgICAgICAgIGdwaW8gPSBv
Zl9nZXRfZ3Bpb19mbGFncyhoYWx0X25vZGUsIDAsICZmbGFncyk7DQo+ICAgICAgICAgIGlmICgh
Z3Bpb19pc192YWxpZChncGlvKSkNCj4gKyAgICAgICB7DQo+ICsgICAgICAgICAgICAgICBvZl9u
b2RlX3B1dChoYWx0X25vZGUpOw0KPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0K
PiArICAgICAgIH0NCj4gDQo+ICAgICAgICAgIGVyciA9IGdwaW9fcmVxdWVzdChncGlvLCAiZ3Bp
by1oYWx0Iik7DQo+ICAgICAgICAgIGlmIChlcnIpIHsNCj4gICAgICAgICAgICAgICAgICBwcmlu
dGsoS0VSTl9FUlIgImdwaW8taGFsdDogZXJyb3IgcmVxdWVzdGluZyBHUElPICVkLlxuIiwNCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpbyk7DQo+ICsgICAgICAgICAgICAgICBvZl9ub2Rl
X3B1dChoYWx0X25vZGUpOw0KPiAgICAgICAgICAgICAgICAgIGhhbHRfbm9kZSA9IE5VTEw7DQo+
ICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4gICAgICAgICAgfQ0KPiBAQCAtMTEyLDYg
KzExOSw3IEBAIHN0YXRpYyBpbnQgZ3Bpb19oYWx0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ICAgICAgICAgICAgICAgICAgcHJpbnRrKEtFUk5fRVJSICJncGlvLWhhbHQ6
IGVycm9yIHJlcXVlc3RpbmcgSVJRICVkIGZvciAiDQo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICJHUElPICVkLlxuIiwgaXJxLCBncGlvKTsNCj4gICAgICAgICAgICAgICAgICBncGlvX2ZyZWUo
Z3Bpbyk7DQo+ICsgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChoYWx0X25vZGUpOw0KPiAgICAg
ICAgICAgICAgICAgIGhhbHRfbm9kZSA9IE5VTEw7DQo+ICAgICAgICAgICAgICAgICAgcmV0dXJu
IGVycjsNCj4gICAgICAgICAgfQ0KPiBAQCAtMTIzLDYgKzEzMSw4IEBAIHN0YXRpYyBpbnQgZ3Bp
b19oYWx0X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgIHBy
aW50ayhLRVJOX0lORk8gImdwaW8taGFsdDogcmVnaXN0ZXJlZCBHUElPICVkICglZCB0cmlnZ2Vy
LCAlZCINCj4gICAgICAgICAgICAgICAgICIgaXJxKS5cbiIsIGdwaW8sIHRyaWdnZXIsIGlycSk7
DQo+IA0KPiArICAgICAgIG9mX25vZGVfcHV0KGhhbHRfbm9kZSk7DQo+ICsNCj4gICAgICAgICAg
cmV0dXJuIDA7DQo+ICAgfQ0KPiANCj4gLS0NCj4gMi4yNS4xDQo+IA==
