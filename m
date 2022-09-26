Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6A05E9E80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 12:00:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbdXj6YQbz3c3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 20:00:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Aran7/mG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.80; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Aran7/mG;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120080.outbound.protection.outlook.com [40.107.12.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbdWz0dXLz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:59:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WX+45K+2WsZTYqiKjNtxJVPWFfMwldSUHOzAa5hOnz4PIi9cxW57UFBp8kK50WsbxA0h/JoyhlowjHTbF4sL87HsiMFkL5R+W+iGG6yEnbj/gUVrTBqz9RPwXw5WX7kdvGHqn54RBKnBEhkdiV8TOX8hkDsBqgEq1WraFpkvdPDg/in31bVKZY57aQkrAEYk219WxuadHcfwcpEKh1aw4awgKJ/x2bZ6F3gV/45q4wcA4EKWmyFxA+boH+OyfkzB0NU46MMGtl8ZHG/rwqBTH3sXeh1WwywjpDrICm2ccIx3Wp6DhEjkwUxpp9mo4JXYRp46y2H7OXBmWSxXc7KSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6bK1riQNLj1//aFjbDYA5ndW964T6S1PlaxVDhvKxY=;
 b=WzknR1NglA2TkuOwuQr8rqvVX5T9X6WK1HXqj0MLWLyjoZd72U5qr82zKr+/FAggvIseTlOV6rW++v67ewoPqNsV6gycLwh9k5a7tn9YIkvdczueYYVkTNE4bbjgqpr2MV+7UoIUFo6UQT6cbciZcf9lMR6Hg40MDc7gkSc3LORXOQ16j1WpnfuXT7/6FNOvtcFEruCbuwhDyIsQMPwRqZ8K6eBa/GMyy91JepFWJw/BMcu0KnyI807/vwvNlE92JmqiNIy11dKLlmUQBeWvsO4uxIuUlGanFcjGATWkjqoxpoILqbWduOzQEpB+8PVcivblMo9BUl6fBrmedT2UWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6bK1riQNLj1//aFjbDYA5ndW964T6S1PlaxVDhvKxY=;
 b=Aran7/mGc63xIpObPIc+VChmOvgGZxTPV4JKjqFGjCoYAUVuyZSAGcxuUZsRWG4lYVWcq7N5GbkPcPCYggRUqtoJg17cXmg9SP3Qmb2caAo/7miBI89dpaYCoXSDBwLDxry2k3BbNC72s3Qh7gYwBVbnuYF7Lh9bVX7I5ihDX4Svsi4g0fk7CI/H5t0KKJgbz+kS/SIMjaJLimcFutVOKqhpSbdkBvuxmYWsL5RuLMOQ6LAlwFUCYqts8injtzyL1THAkOse+yeeFgsQ/VJ5puBhB9QEH6akuJfBbmP2aEnWBCVaiccwPCWp67ZJkhsYugCdNOeDqs6p1gU/LJc1dQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2300.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:17::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Mon, 26 Sep
 2022 09:59:06 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f4ad:3944:a7f4:fcf3%5]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 09:59:05 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Michael Ellerman
	<mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Scott Wood <oss@buserror.net>, Sinan Akman
	<sinan@writeme.com>
Subject: Re: [PATCH 4/7] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ
 callbacks
Thread-Topic: [PATCH 4/7] powerpc/85xx: p2020: Unify .setup_arch and .init_IRQ
 callbacks
Thread-Index: AQHYtABFiSfaRqv4gUyIp6KoLZqjF63xtTaA
Date: Mon, 26 Sep 2022 09:59:05 +0000
Message-ID: <91e4a220-cbb2-e5aa-47b3-fe3fd87495c3@csgroup.eu>
References: <20220819191557.28116-1-pali@kernel.org>
 <20220819191557.28116-5-pali@kernel.org>
In-Reply-To: <20220819191557.28116-5-pali@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2300:EE_
x-ms-office365-filtering-correlation-id: 7bfc184f-ece4-46f4-0375-08da9fa5bf9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8cxB641cM/tjW1hWC2O9EkAhRGzzA33ZZJSsHJ57Het6chUg6y7zTcAFi1RwoLvJYXGiuy34eacoZ78aVe7DBUo2At6yHiaZPb9t9ReQv9/6XY6uQS+SubPWTFjPaGDuN7RqdyLQiWGnd/9HVQcMMlJAyayiuBh3qK8mlLaPAaW/KQaRkR8QYo5BDRUYtGZWGp+GRxuLPBFlK8Y8R4tQsc2JSuJ9/TuqBKK1+9mRqcqgcSeyeiQR7tvGoMj7OGF2Si25crBXiAah3uo3MoWHZCPpSHlzwJxocdOy1FPrZeTpupUGxYlPs1X8pPvn/j6a4E7vf7tdHYho8BeCT10B2DSHM+rQMqlHJ5xVj9GZJLBJjtrxIk9+9g9C+GkVCz6/9zXKBAx0a3dqgBRiiL0Dbdwopx6boJ6zwhMbEx65c3+G9qOOJmDj3wSnSvtxLlIMlYDSih273dsOe1ToXqAFUYisEl9Y5xW+xQ/SqSuhBZC2LpgLGzMmhyiWX6n5pbrSm+2UggraI+i7B6bE85FxApVUEaN0yP9XBSFg0l24VqdO2PWsJS69kI2ygS4xBjqKlT5gJs8WmUpMRiPHLv8YuhjOI+ogEdljZ9UaA46RU129G9qG2jGkNrp1jPOLhSBZ2PQG4CVs5310MN9bnV+CrWKFK0nE2GH7I6zA0s4B9uCdfKE77X1sZABE/BmdyRjnlhaDIpDU6KbQ8giu6eOGq3+UDcAMTEem54ht3dgSnP4cF/Nz+3UGX4c8AnKrC/UnJHjqcoxDkHOo+1U4hQcmB7tsDDKUE506wTiHDqXoNVSLZPlZyU/U0G1sVu4GZRWmV86F7cxOnpmmQM7N9JbtBNaWHjmt1PIPxrfzuXj7WQ4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(39850400004)(396003)(451199015)(5660300002)(91956017)(478600001)(2906002)(38070700005)(316002)(86362001)(6506007)(6512007)(26005)(38100700002)(8936002)(122000001)(44832011)(36756003)(4326008)(41300700001)(6486002)(110136005)(31696002)(76116006)(66446008)(66476007)(64756008)(66556008)(66946007)(54906003)(2616005)(8676002)(186003)(71200400001)(66574015)(31686004)(83380400001)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?blQ2LzlGSVN3V2JHWkoxL2RrMGV6NkNZVVdaT0NEWlc3L1M4VHJLRkJlaUFl?=
 =?utf-8?B?RnV2dzdvRWhhZTRnNzFFeTluV3RoREkxeFh6NnNPeExIT2x2NG16K3grSEJT?=
 =?utf-8?B?c1lqNzhiamxjTXZZL2ExR1o5VFYvY2k5eWV4RTJJVXVzWjlXd2NiKzdPTUZE?=
 =?utf-8?B?a1UzbGNwaXc5ZnhuOTB4MWNYbEphZVdGQkJLK0U3YlhkZmY3bENCUzFhSmdz?=
 =?utf-8?B?RDhVbXowTUhDMS9YM09BSVpOYVRzb3ZXWjNiVWNxQVBuWVEybmMvRWYxdzJj?=
 =?utf-8?B?dlA3R2xpZDNyZ3ViLzdya0RMQlExTjM5UVI0ZWxlTDRLanhRQ08yZlhGclpB?=
 =?utf-8?B?blNPMGJzeVh2a1hiWU9UY0hqVHI1SFdXSjFuaVhqLzBXYlNUZnJxSW1aTEJr?=
 =?utf-8?B?MVhQN3F4Y2wwenFGWWdhdVFTQWtncFpmeEV6U1MxdjRncjRYb2xTWUw2dFJS?=
 =?utf-8?B?RXNMUzNkWGtCUk5EOUVTUklIN1pJelFhaWozNnh5bkpkRG9DOXQ3REFwejd4?=
 =?utf-8?B?ck9wNEdZdFNiaGNNOUo3Zzh6MnFxWGNUQkpmb0o1RjYxSk55T1paNTJ6ZWJE?=
 =?utf-8?B?Q0FaSFpKMEJHQS9sbG9QZ2x1eW1WNzJWQkFEYzJBaHRWZmo1U2oyZllVY1lL?=
 =?utf-8?B?cTljbWZVcFhtcFdOeEpGWXFQYXFDRnErZU1ZWVBPbHlEZUw2aFFYVmZXYTBP?=
 =?utf-8?B?NTVVMytQODRrUUxhcDk2K1lzLzZMdzdrbXZrUHVQRTd2UWRVWVkzV3ArNFNF?=
 =?utf-8?B?bXdMOUsrZkRlMkk2RkxPdzZWSXhOTCtuVG5uNTZGMEk0Wmp2NGZyZ1l2UmZM?=
 =?utf-8?B?RCthajVWUEYwMmZaMVNxYTduNXVNTVZVdnpJcmxZOWNwK25PQlBiS09uQklT?=
 =?utf-8?B?b1VmWG5CMllxQnVkYkpmNll6aEUrMU9RYmhyMERHWW8yNlVoQzZWOHRQZ1ls?=
 =?utf-8?B?ekRienhBdnBvTEZkcG1nV0FnMWtUV3VpUTc2aGlLZTU3SFoxRlpyTXYxNStZ?=
 =?utf-8?B?SVhGQkowYkFha1pESmNRaWdqTk0yQ3VON3M0K1FScDNkL0tPSU9FYVNBYkxS?=
 =?utf-8?B?eFJuYVkyZEs5SWxTekpxZmJERzVuU0dVWWVwT1VGTWIwK2tWZy9icmg5clpk?=
 =?utf-8?B?a3BWR0w1bk9MNlpVNVlDMTcwa3J2NW14YmJUTFM1TnE4ekFhdDdXZTg5SHEy?=
 =?utf-8?B?ZnlUMHlPN2VOdk9yb1hLeEpSVXFOSHg1cVF3dElmd29Cc21GYlc2Z3llaXZS?=
 =?utf-8?B?cWhxYXpwSlRyK3ltcU5SWDdhdW5CdHhFUjVEZ2pCVHFQa0dJaTNDY2tDRFNn?=
 =?utf-8?B?M3lGNlF6N1VWTVpMdzVSYlJxZkp3Q3JWcmNXc3V3ejZ4MEhzY3p5enA3blNy?=
 =?utf-8?B?eVpCNkRBdFBTRlQvY25GY3ZKR0RjY05qMHdaOXJ0eUdIYjg5amRFVzA4cm1z?=
 =?utf-8?B?TDErT25oL0Z3NStQSUJsN21LY25uVWJhVTlRN1RDUHFxNXhXU3RBQzlKQ3lk?=
 =?utf-8?B?SEJFemF6M3lJbjI0RWd2ZDRTYXlPejJjMjRDRE1KOUZESDFqaXY5UUozK3VV?=
 =?utf-8?B?Wk83eXl6S1M4ZGdCWkt4UDM5Sk02RVpuYjJ5NjNNTzRsdzhLdnQwVHZvTGdX?=
 =?utf-8?B?alk2MXpERXkxaXRTOG1YV0Nobm1QMGNJamZtQzRPLzJvSlpZK0MvNC9tblF4?=
 =?utf-8?B?alJPck9QM29XSW5CcnVGS3BLUU1jZjRORVNjNTQ0OTBVQkVkSm1TV09WVi9q?=
 =?utf-8?B?NkhGSEtWOFpBNFc3MkxZY1czYm4vaUR3aTVQV1JGQ3RZZTFyUXBWTDdqellY?=
 =?utf-8?B?Zm5UYm52VU9ndTkzNFNCMkIvVzNPMTl0dlUwOUZMbk5veFhTZldxQ0dGOGEz?=
 =?utf-8?B?b3VLYTFUcVZlSnlxQXBmZE44UjhwampVZzNoWjFyeXdYR3EvRWkwQS94alZK?=
 =?utf-8?B?QXZQb0xHdEJHcGkvN3VhWlQ2eEtDRkVOa2J4SEFhS1VpZW5KKytaeVV2RFcx?=
 =?utf-8?B?SUZwdlE2MUxnVFNEV2F5dW5oK1gzVXhtajlyVEpna2NGNDRmVmRSR1lkSnNC?=
 =?utf-8?B?Y1o1NzlPRXV5ZC9iWGc2M3RISzdjbC9OajdyQ1pmTUhIbVB3ME0rNXphM2JZ?=
 =?utf-8?B?eGkycDE5SHJEWjU0MWQ3WGNlM0RyR0RPMmFTaEFCcjN4OWV5RFhBd2tINUo0?=
 =?utf-8?Q?3FEs+ySh8mcev6CWX8uRwXs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8281C95915C11F44834316C9F0FC14DD@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bfc184f-ece4-46f4-0375-08da9fa5bf9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 09:59:05.9101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uphc0i4jVoDEmc69oWF1JCmTmu0SFRjQZdKvuHtUDRVKQ3ggOLZf49PgE4KLQu/V/PCVRQuoo4oRmeWO7k+QnEhRUXVacaEIi2bGAyW6lEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2300
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

DQoNCkxlIDE5LzA4LzIwMjIgw6AgMjE6MTUsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE1h
a2UganVzdCBvbmUgLnNldHVwX2FyY2ggYW5kIG9uZSAuaW5pdF9JUlEgY2FsbGJhY2sgaW1wbGVt
ZW50YXRpb24gZm9yIGFsbA0KPiBQMjAyMCBib2FyZCBjb2RlLiBUaGlzIGRlZHVwbGljYXRlIHJl
cGVhdGVkIGFuZCBzYW1lIGNvZGUuDQoNCkkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgYmUgc3Bs
aXQgaW4gdHdvIHBhcnRzOg0KDQpGaXJzdCBwYXRjaCA6IENyZWF0ZSBmdW5jdGlvbiBtcGM4NXh4
XzgyNTlfaW5pdA0KU2Vjb25kIHBhdGNoIDogUmVmYWN0b3IuDQoNCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvODV4eC9wMjAyMC5jIHwgOTcgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNjcgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMg
Yi9hcmNoL3Bvd2VycGMvcGxhdGZvcm1zLzg1eHgvcDIwMjAuYw0KPiBpbmRleCBkNjVkNGM4OGFj
NDcuLmQzMjdlNmM5YjgzOCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84
NXh4L3AyMDIwLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L3AyMDIwLmMN
Cj4gQEAgLTQyLDkgKzQyLDggQEANCj4gICAjZGVmaW5lIERCRyhmbXQsIGFyZ3MuLi4pDQo+ICAg
I2VuZGlmDQo+ICAgDQo+IC0jaWZkZWYgQ09ORklHX01QQzg1eHhfRFMNCj4gLQ0KPiAgICNpZmRl
ZiBDT05GSUdfUFBDX0k4MjU5DQo+ICsNCj4gICBzdGF0aWMgdm9pZCBtcGM4NXh4XzgyNTlfY2Fz
Y2FkZShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgaXJxX2NoaXAg
KmNoaXAgPSBpcnFfZGVzY19nZXRfY2hpcChkZXNjKTsNCj4gQEAgLTU1LDM3ICs1NCwyMSBAQCBz
dGF0aWMgdm9pZCBtcGM4NXh4XzgyNTlfY2FzY2FkZShzdHJ1Y3QgaXJxX2Rlc2MgKmRlc2MpDQo+
ICAgCX0NCj4gICAJY2hpcC0+aXJxX2VvaSgmZGVzYy0+aXJxX2RhdGEpOw0KPiAgIH0NCj4gLSNl
bmRpZgkvKiBDT05GSUdfUFBDX0k4MjU5ICovDQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBfX2luaXQg
bXBjODV4eF9kc19waWNfaW5pdCh2b2lkKQ0KPiArc3RhdGljIHZvaWQgbXBjODV4eF84MjU5X2lu
aXQodm9pZCkNCj4gICB7DQo+IC0Jc3RydWN0IG1waWMgKm1waWM7DQo+IC0jaWZkZWYgQ09ORklH
X1BQQ19JODI1OQ0KPiAgIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KPiAgIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKmNhc2NhZGVfbm9kZSA9IE5VTEw7DQo+ICAgCWludCBjYXNjYWRlX2lycTsNCj4g
LSNlbmRpZg0KPiAtDQo+IC0JbXBpYyA9IG1waWNfYWxsb2MoTlVMTCwgMCwNCj4gLQkJICBNUElD
X0JJR19FTkRJQU4gfA0KPiAtCQkgIE1QSUNfU0lOR0xFX0RFU1RfQ1BVLA0KPiAtCQkwLCAyNTYs
ICIgT3BlblBJQyAgIik7DQo+ICAgDQo+IC0JQlVHX09OKG1waWMgPT0gTlVMTCk7DQo+IC0JbXBp
Y19pbml0KG1waWMpOw0KPiAtDQo+IC0jaWZkZWYgQ09ORklHX1BQQ19JODI1OQ0KPiAtCS8qIElu
aXRpYWxpemUgdGhlIGk4MjU5IGNvbnRyb2xsZXIgKi8NCj4gICAJZm9yX2VhY2hfbm9kZV9ieV90
eXBlKG5wLCAiaW50ZXJydXB0LWNvbnRyb2xsZXIiKQ0KPiAgIAkgICAgaWYgKG9mX2RldmljZV9p
c19jb21wYXRpYmxlKG5wLCAiY2hycCxpaWMiKSkgew0KPiAgIAkJY2FzY2FkZV9ub2RlID0gbnA7
DQo+ICAgCQlicmVhazsNCj4gICAJfQ0KPiAgIA0KPiAtCWlmIChjYXNjYWRlX25vZGUgPT0gTlVM
TCkgew0KPiAtCQlwcmludGsoS0VSTl9ERUJVRyAiQ291bGQgbm90IGZpbmQgaTgyNTkgUElDXG4i
KTsNCj4gKwlpZiAoY2FzY2FkZV9ub2RlID09IE5VTEwpDQo+ICAgCQlyZXR1cm47DQo+IC0JfQ0K
PiAgIA0KPiAgIAljYXNjYWRlX2lycSA9IGlycV9vZl9wYXJzZV9hbmRfbWFwKGNhc2NhZGVfbm9k
ZSwgMCk7DQo+ICAgCWlmICghY2FzY2FkZV9pcnEpIHsNCj4gQEAgLTkzLDEyICs3NiwzMCBAQCBz
dGF0aWMgdm9pZCBfX2luaXQgbXBjODV4eF9kc19waWNfaW5pdCh2b2lkKQ0KPiAgIAkJcmV0dXJu
Ow0KPiAgIAl9DQo+ICAgDQo+IC0JREJHKCJtcGM4NXh4ZHM6IGNhc2NhZGUgbWFwcGVkIHRvIGly
cSAlZFxuIiwgY2FzY2FkZV9pcnEpOw0KPiArCURCRygiaTgyNTk6IGNhc2NhZGUgbWFwcGVkIHRv
IGlycSAlZFxuIiwgY2FzY2FkZV9pcnEpOw0KPiAgIA0KPiAgIAlpODI1OV9pbml0KGNhc2NhZGVf
bm9kZSwgMCk7DQo+ICAgCW9mX25vZGVfcHV0KGNhc2NhZGVfbm9kZSk7DQo+ICAgDQo+ICAgCWly
cV9zZXRfY2hhaW5lZF9oYW5kbGVyKGNhc2NhZGVfaXJxLCBtcGM4NXh4XzgyNTlfY2FzY2FkZSk7
DQo+ICt9DQo+ICsNCj4gKyNlbmRpZgkvKiBDT05GSUdfUFBDX0k4MjU5ICovDQo+ICsNCj4gK3N0
YXRpYyB2b2lkIF9faW5pdCBwMjAyMF9waWNfaW5pdCh2b2lkKQ0KPiArew0KPiArCXN0cnVjdCBt
cGljICptcGljOw0KPiArDQo+ICsJbXBpYyA9IG1waWNfYWxsb2MoTlVMTCwgMCwNCj4gKwkJICBN
UElDX0JJR19FTkRJQU4gfA0KPiArCQkgIE1QSUNfU0lOR0xFX0RFU1RfQ1BVLA0KPiArCQkwLCAy
NTYsICIgT3BlblBJQyAgIik7DQo+ICsNCj4gKwlCVUdfT04obXBpYyA9PSBOVUxMKTsNCj4gKwlt
cGljX2luaXQobXBpYyk7DQo+ICsNCj4gKyNpZmRlZiBDT05GSUdfUFBDX0k4MjU5DQo+ICsJbXBj
ODV4eF84MjU5X2luaXQoKTsNCj4gICAjZW5kaWYJLyogQ09ORklHX1BQQ19JODI1OSAqLw0KPiAg
IH0NCj4gICANCj4gQEAgLTEzOCw1OCArMTM5LDIwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBtcGM4
NXh4X2RzX3VsaV9pbml0KHZvaWQpDQo+ICAgI2VuZGlmDQo+ICAgfQ0KPiAgIA0KPiAtI2VuZGlm
IC8qIENPTkZJR19NUEM4NXh4X0RTICovDQo+IC0NCj4gLSNpZmRlZiBDT05GSUdfTVBDODV4eF9S
REINCj4gLXN0YXRpYyB2b2lkIF9faW5pdCBtcGM4NXh4X3JkYl9waWNfaW5pdCh2b2lkKQ0KPiAt
ew0KPiAtCXN0cnVjdCBtcGljICptcGljOw0KPiAtDQo+IC0JbXBpYyA9IG1waWNfYWxsb2MoTlVM
TCwgMCwNCj4gLQkgIE1QSUNfQklHX0VORElBTiB8DQo+IC0JICBNUElDX1NJTkdMRV9ERVNUX0NQ
VSwNCj4gLQkgIDAsIDI1NiwgIiBPcGVuUElDICAiKTsNCj4gLQ0KPiAtCUJVR19PTihtcGljID09
IE5VTEwpOw0KPiAtCW1waWNfaW5pdChtcGljKTsNCj4gLX0NCj4gLSNlbmRpZiAvKiBDT05GSUdf
TVBDODV4eF9SREIgKi8NCj4gLQ0KPiAgIC8qDQo+ICAgICogU2V0dXAgdGhlIGFyY2hpdGVjdHVy
ZQ0KPiAgICAqLw0KPiAtI2lmZGVmIENPTkZJR19NUEM4NXh4X0RTDQo+IC1zdGF0aWMgdm9pZCBf
X2luaXQgbXBjODV4eF9kc19zZXR1cF9hcmNoKHZvaWQpDQo+ICtzdGF0aWMgdm9pZCBfX2luaXQg
cDIwMjBfc2V0dXBfYXJjaCh2b2lkKQ0KPiAgIHsNCj4gLQlpZiAocHBjX21kLnByb2dyZXNzKQ0K
PiAtCQlwcGNfbWQucHJvZ3Jlc3MoIm1wYzg1eHhfZHNfc2V0dXBfYXJjaCgpIiwgMCk7DQo+IC0N
Cj4gICAJc3dpb3RsYl9kZXRlY3RfNGcoKTsNCj4gICAJZnNsX3BjaV9hc3NpZ25fcHJpbWFyeSgp
Ow0KPiAgIAltcGM4NXh4X2RzX3VsaV9pbml0KCk7DQo+ICAgCW1wYzg1eHhfc21wX2luaXQoKTsN
Cj4gICANCj4gLQlwcmludGsoIk1QQzg1eHggRFMgYm9hcmQgZnJvbSBGcmVlc2NhbGUgU2VtaWNv
bmR1Y3RvclxuIik7DQo+IC19DQo+IC0jZW5kaWYgLyogQ09ORklHX01QQzg1eHhfRFMgKi8NCj4g
LQ0KPiAtI2lmZGVmIENPTkZJR19NUEM4NXh4X1JEQg0KPiAtc3RhdGljIHZvaWQgX19pbml0IG1w
Yzg1eHhfcmRiX3NldHVwX2FyY2godm9pZCkNCj4gLXsNCj4gLQlpZiAocHBjX21kLnByb2dyZXNz
KQ0KPiAtCQlwcGNfbWQucHJvZ3Jlc3MoIm1wYzg1eHhfcmRiX3NldHVwX2FyY2goKSIsIDApOw0K
PiAtDQo+IC0JbXBjODV4eF9zbXBfaW5pdCgpOw0KPiAtDQo+IC0JZnNsX3BjaV9hc3NpZ25fcHJp
bWFyeSgpOw0KPiAtDQo+ICAgI2lmZGVmIENPTkZJR19RVUlDQ19FTkdJTkUNCj4gICAJbXBjODV4
eF9xZV9wYXJfaW9faW5pdCgpOw0KPiAtI2VuZGlmCS8qIENPTkZJR19RVUlDQ19FTkdJTkUgKi8N
Cj4gLQ0KPiAtCXByaW50ayhLRVJOX0lORk8gIk1QQzg1eHggUkRCIGJvYXJkIGZyb20gRnJlZXNj
YWxlIFNlbWljb25kdWN0b3JcbiIpOw0KPiArI2VuZGlmDQo+ICAgfQ0KPiAtI2VuZGlmIC8qIENP
TkZJR19NUEM4NXh4X1JEQiAqLw0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfTVBDODV4eF9EUw0K
PiAgIG1hY2hpbmVfYXJjaF9pbml0Y2FsbChwMjAyMF9kcywgbXBjODV4eF9jb21tb25fcHVibGlz
aF9kZXZpY2VzKTsNCj4gQEAgLTIzMCw4ICsxOTMsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBwMjAy
MF9yZGJfcGNfcHJvYmUodm9pZCkNCj4gICBkZWZpbmVfbWFjaGluZShwMjAyMF9kcykgew0KPiAg
IAkubmFtZQkJCT0gIlAyMDIwIERTIiwNCj4gICAJLnByb2JlCQkJPSBwMjAyMF9kc19wcm9iZSwN
Cj4gLQkuc2V0dXBfYXJjaAkJPSBtcGM4NXh4X2RzX3NldHVwX2FyY2gsDQo+IC0JLmluaXRfSVJR
CQk9IG1wYzg1eHhfZHNfcGljX2luaXQsDQo+ICsJLnNldHVwX2FyY2gJCT0gcDIwMjBfc2V0dXBf
YXJjaCwNCj4gKwkuaW5pdF9JUlEJCT0gcDIwMjBfcGljX2luaXQsDQo+ICAgI2lmZGVmIENPTkZJ
R19QQ0kNCj4gICAJLnBjaWJpb3NfZml4dXBfYnVzCT0gZnNsX3BjaWJpb3NfZml4dXBfYnVzLA0K
PiAgIAkucGNpYmlvc19maXh1cF9waGIgICAgICA9IGZzbF9wY2liaW9zX2ZpeHVwX3BoYiwNCj4g
QEAgLTI0Niw4ICsyMDksOCBAQCBkZWZpbmVfbWFjaGluZShwMjAyMF9kcykgew0KPiAgIGRlZmlu
ZV9tYWNoaW5lKHAyMDIwX3JkYikgew0KPiAgIAkubmFtZQkJCT0gIlAyMDIwIFJEQiIsDQo+ICAg
CS5wcm9iZQkJCT0gcDIwMjBfcmRiX3Byb2JlLA0KPiAtCS5zZXR1cF9hcmNoCQk9IG1wYzg1eHhf
cmRiX3NldHVwX2FyY2gsDQo+IC0JLmluaXRfSVJRCQk9IG1wYzg1eHhfcmRiX3BpY19pbml0LA0K
PiArCS5zZXR1cF9hcmNoCQk9IHAyMDIwX3NldHVwX2FyY2gsDQo+ICsJLmluaXRfSVJRCQk9IHAy
MDIwX3BpY19pbml0LA0KPiAgICNpZmRlZiBDT05GSUdfUENJDQo+ICAgCS5wY2liaW9zX2ZpeHVw
X2J1cwk9IGZzbF9wY2liaW9zX2ZpeHVwX2J1cywNCj4gICAJLnBjaWJpb3NfZml4dXBfcGhiICAg
ICAgPSBmc2xfcGNpYmlvc19maXh1cF9waGIsDQo+IEBAIC0yNjAsOCArMjIzLDggQEAgZGVmaW5l
X21hY2hpbmUocDIwMjBfcmRiKSB7DQo+ICAgZGVmaW5lX21hY2hpbmUocDIwMjBfcmRiX3BjKSB7
DQo+ICAgCS5uYW1lCQkJPSAiUDIwMjBSREItUEMiLA0KPiAgIAkucHJvYmUJCQk9IHAyMDIwX3Jk
Yl9wY19wcm9iZSwNCj4gLQkuc2V0dXBfYXJjaAkJPSBtcGM4NXh4X3JkYl9zZXR1cF9hcmNoLA0K
PiAtCS5pbml0X0lSUQkJPSBtcGM4NXh4X3JkYl9waWNfaW5pdCwNCj4gKwkuc2V0dXBfYXJjaAkJ
PSBwMjAyMF9zZXR1cF9hcmNoLA0KPiArCS5pbml0X0lSUQkJPSBwMjAyMF9waWNfaW5pdCwNCj4g
ICAjaWZkZWYgQ09ORklHX1BDSQ0KPiAgIAkucGNpYmlvc19maXh1cF9idXMJPSBmc2xfcGNpYmlv
c19maXh1cF9idXMsDQo+ICAgCS5wY2liaW9zX2ZpeHVwX3BoYiAgICAgID0gZnNsX3BjaWJpb3Nf
Zml4dXBfcGhiLA==
