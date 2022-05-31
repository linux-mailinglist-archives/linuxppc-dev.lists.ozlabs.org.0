Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62866538B3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:14:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC26K25nNz3bfr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::628; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC25m3Fv5z3046
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:13:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDa7fQOShkbWlN6JrU25JWaLbEjdvziYgEP4o30vyvR4e6FiNBkAc+wDaG8k8Hq8wSDVjLzP/YcLHcOw9tkUEzEIvIxqeTjeWab94DAAeCU5wyUHl4BmDVi7uQ+kv/CC8JzNLlQtZvzdGtnFIfjl5M+OYOz/PbhfSIti8CyuubYwYrShewXCKwV96F4LBX4rtqqhfRKAYBHn30AC04qIx1gnBMyIE8z+xdOCxrjfLPcijW/m2igrSJwZXLSRzmggsXP7hyyt2y164lWIOdkbXJPM0k94bP4j09d1MvPkQSX0+OXJy+aVhmtxiUasm+S+Lon8uNesrcP59zfcoVQQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iYbvoipePhyAno1GwlPO87K/IOYXUQr8/dCgdj/AG+U=;
 b=BHk+bFH9X/k8hC3rxHQYrQxrcYOoU/vOpaeCivyTfHSSATDpKVFCSY+YGGBEZ6h2HrTnSHJKQB2AcJMf1dG0VjzuDTw46Jd5em/m3CjK4iI0zY6acjI2j9RHllK6D37CmCy+X9yNCEDM7ct6bUuH8f8c1/uguOUguy/YvDuYVisF6Vbl5f8EepL0qgoxnA/8M8xZ474NKoj788E35jPYN5V4hpGJo1qrFwUXSFVCMBmzydKBb3As5W9NQoyVrNuvmdLWrxB1SECeJ2JliQtrnWYGO9+2e/W+GQC/qg2aktu3wKqJL7uFQ18BOHoARTn0/qzp7NsU8uBPpRbWjbMvVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3188.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 31 May
 2022 06:13:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 06:13:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Fwd: [PATCH 0/4] objtool: Reorganize x86 arch-specific code
Thread-Topic: [PATCH 0/4] objtool: Reorganize x86 arch-specific code
Thread-Index: AQHYdJ2vWHZ3jj5PhUqIFxUuJfgJNK04gcAA
Date: Tue, 31 May 2022 06:13:07 +0000
Message-ID: <24887610-45a5-443e-8315-ba935efe03ae@csgroup.eu>
References: <20220531020744.236970-1-chenzhongjin@huawei.com>
In-Reply-To: <20220531020744.236970-1-chenzhongjin@huawei.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d30e2346-4184-4db4-5fe5-08da42cca18b
x-ms-traffictypediagnostic: MR1P264MB3188:EE_
x-microsoft-antispam-prvs:  <MR1P264MB31882C8B0093168C229A10D3EDDC9@MR1P264MB3188.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KpFwpkSDCx4MyM6rsWSB0uzCVYV/np3vykZAAeq59A3OAWQq3qD8lYEc7cJ4khLAEdC6gISkPow3KL0CDRode7K8rLwF16OZNCnrWQXiE7WnR7Xfg3VDsfoYw6ZPfC0trAj+rXkakrwqFCoDTk1+p5TVaQfrZ6nIugxAgy5OFbCoeGZtE95SWVYwjmg+fbwox/aEDtE00vHu3Iws0aWKjKevPOZhiOJIM0x5yry779KZMBHCUVQWqwTaYf25oODmIwPg4Lwp5Pzy7+3ookAIAvjrKbFJVWrtlaWC27ZlKqXaFK+k1nraZEXl05wILg66aabdG8yOFeIFTfaALwPNjy9gA8p5fJsk05SZGbCSEUP9i8Tt8xgo9hSe9HGOcFijStZUPgBQyUW6ZDlndBwswPBPa8E0F735H2Kf0OOapGMugfJ4jG/WXQKcmgwuPs17+ZhhoFgFRcD0o2HVbvvqNwCnk/ZrrRUXtQC4jirX7OPQ6WD/2n+0ObVq7Z9YQN8gHto+m7Df7nFBTqcISU7LyQCbRA7yPpdWV8rnyl3RLUjfYXrVIB0FrAvgRCI03m6r6/D6u/gez01GjDRKlrcUTbt6EspM45NJtCRDAkJrmteS+QaqIWrTgvXD3FT5RUdAPkXE1kxkCYU/GnCkPF84KWiIbuYmx/LIh353MiNwipUC0EFt+tPTB5HTK7apKxTFQerUDFNcMEibBm2JI90q9ftKcRwJh6plUtkW4gf/scPTRwYgsdJSodGPwQsGCq353zK6xYciN8HZ7/vFeNSUQ4XkAfMo4UCDVG5VSpDrtMQ6D9JU0Uae+NfUBSDS0N1YqILccijCSoCxDiGUGC8WX4FwQTwls2rHZLC1NH9o5gU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(6486002)(71200400001)(5660300002)(122000001)(508600001)(8936002)(6512007)(83380400001)(186003)(966005)(2616005)(26005)(38070700005)(2906002)(86362001)(6506007)(31696002)(38100700002)(8676002)(4326008)(91956017)(31686004)(76116006)(66476007)(66446008)(66946007)(316002)(66556008)(64756008)(36756003)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YlVOdXlHV3JKK01BYzNUR29XTjg4M3c3U1QxWkl4cEVNb1FIU1ozOEgxT0NL?=
 =?utf-8?B?Z1A1b0g4QjEvT256VVpkcXZlYmVOcW9UVVdSQktaWGZuWkhNREhydGpzVjdr?=
 =?utf-8?B?dUZWbEdXclRaeWRzaVBCcFV0K3NZekQvRityalpSbjIxd0FtTTJJbUJlT3I1?=
 =?utf-8?B?QytGcG14RmRIQ0tjZEJyb3FJUzhWZHd5SWhaUVd2OER2cTFhU01od0FZUHUy?=
 =?utf-8?B?MDVHYkRZWFZBeEN4Nys1OVBuSVdTdjlONWxVSDhQOWQxVlZja2R3ZUdMN3lN?=
 =?utf-8?B?cFBMaUFtSThjcVN3OGFDM2FnY1ROd1hVRE14TnU0akQxaUNVMW5uR2ZWMy8z?=
 =?utf-8?B?M1plNHZEQkZaL2F0WmU2MkM1UGhHWHUxWXBBOVRKbEt1dmJic2V5ZVAzaEVI?=
 =?utf-8?B?SDM1Mm9uQ2hjSFphRlhqNmJSVDRqaUdBTSsxU3cwVWNuTWJGbXFZQVpzVWVE?=
 =?utf-8?B?MmFIQ2UvUEFWRnU3dUF1RFdhT0V3OHAvNnBJd2RXN0ZDaktTNm5FbTE1THBJ?=
 =?utf-8?B?cjFQcTRveENvVmpQUmk2K2tsSEl2Yld3Qi9KdEZCaHV6bDJHeVBmWHp1OS9h?=
 =?utf-8?B?RVoyTGxxUjNGS0tmM0EyZjBKODZPM0dWNTlaUVFTZGJpTHE3Y1FBbFBZTy8w?=
 =?utf-8?B?ZUZNLy9LSE04aUQwNzliYjV1Zmt4dDBqZVBGcmlvOVBaNGQ3TzRPcTkyRHJZ?=
 =?utf-8?B?bjd3L0lOb0tOV1J5UVozcW9objRUc3REU29NbjBlZHhXSG0yTE1zc0tRUGg3?=
 =?utf-8?B?aGdpeDEvTG5idThNakRpbkNTb1IwcG5uWVNLUGlQcWVUTkVwSVVGZ095T1Jj?=
 =?utf-8?B?TkNra1lWK2R5aGNDczR1WVRnUkRyRlFIWDh3a0V4VC9lTlFNeWRJZExTRko3?=
 =?utf-8?B?WmsxU3FuVFFGcC9JQXZhMnFYTUJKakdkd0tyU054dnpDTDZsWHg4cER0aXc2?=
 =?utf-8?B?OXdodFFFWUNqWUlrcU9mTm9iMzVPblFKS0ZyVktvKytrdkNvbGlMVExZV3VR?=
 =?utf-8?B?Ui8xdmdlVW9uZUZXS1RIOGJ6My9UM0RVZUdrWDkzUGxiM082TjM5L0YxT3ky?=
 =?utf-8?B?MzhRcjhkTTNTZDI3RzZaNjhuUWRKLzdHWllPR1l0cEFQQW43WWJjNUp5azM2?=
 =?utf-8?B?dCtXQTl2WEJVa09XNGVFcnU4TlRBNW91T1U1TmJFZ0g1T2N1NmdnZjBuQ1B4?=
 =?utf-8?B?WmFLb0c0dzROT0pUdzFOQ3FWaUpYSG95M3p3blR3akE0R0lVMTJld2dmamFP?=
 =?utf-8?B?RlF3a3pvczVWWDcwcGNpUVpZeXRGVzErRHk3eEFJVXZ5TW5nYVQ3MTI1bWp0?=
 =?utf-8?B?Z0VuZWN4Y3lncHpqeXMwT01Xcm5ERkdEc2c3WVJvYnppQkFMMHp3WjJNNEdG?=
 =?utf-8?B?N1M1ZEdBZDI1NlowQXhkMXkzTUhsTnduMlUxQ1pnaTRlc1Y1TXlPYVQ4RzY5?=
 =?utf-8?B?OGZ1QkIvN3RGa1lBTWZKckk2V3ExNEdTRFNqb05TRi85QURDUEJUekErdm8w?=
 =?utf-8?B?MmJMQ2xOL3hVTDhnWTBNZWUyWldFK21pSUJ5Q0tpb0FCajZsTHVMczhKd3Nq?=
 =?utf-8?B?TTNGMlBtYnQ5Mjc4VVByYThqQ1pMcVRPUFlveDIzTE9YWklCaGVaZ3NlY3RU?=
 =?utf-8?B?c2RPVWY0TEJzdGpCSkphWGU3YmJaOWlERytMRVI5Uy9NSnU1WjF0S2g5ZFZV?=
 =?utf-8?B?UTZlS3dHcUswcWhreGlOelFROWY4ZjRIamc5VDJldDlOdHl4cXhZbFBYNmJU?=
 =?utf-8?B?UXB4NWc5ZGNGNTl1S0JCZU5wMncxbGxPeHVXclZxR1I1MW9mSkVETFdWdzZM?=
 =?utf-8?B?TFNUT1luK251OUhlVGU3d1JEMjVsZTRZL3hmZnBVTmVjajVqbTRDWGQ3ZWI5?=
 =?utf-8?B?Ny9UQ0ExQ3VUMTdYTVZmU3RRNGNTaHhzNVdwVGNydkZ4eFl5QzhiK2h1UmVN?=
 =?utf-8?B?WmZyTmRBR1h2YWN1L2lSaDJFRGlhRjNTWUN2UFAwd1hBbDFWandxZE1sZG5Z?=
 =?utf-8?B?WkJCTld2bndaZjArbW56KzE1ZVNWbDhrTHF0UytkZU5wOTA4SmxJZWtCc2Vl?=
 =?utf-8?B?aDVTSjB4WmcwOFFJMFFFRUtqRE1lcTU5UXRSRGlncHU5cmdKaTA4dC9YV3Y3?=
 =?utf-8?B?NlhteUdzYVBwZXBmUnJtalNucmxtd0tKek5OQVo4ME4vWGlBSDZ6MlltT1JW?=
 =?utf-8?B?MGc2dDVHSFR5eGV5VkhCbmllUVA4V2UxTXZkMTVXSEhMdktVbTFzZE9Bcm90?=
 =?utf-8?B?NW5DZWx0cTZDamFLNGltSEpSaEUwek11SmlGWHNpdHJYTzQwR25ybzIwSFg4?=
 =?utf-8?B?eDJybkprb0VlQnRiMTlDdDV0em9uV3NRT2tqdE9pN0R4RkpPNVRNTjdVYml0?=
 =?utf-8?Q?Y06Cn19IhhqRr/DInCWjrZuJxY7TrVwy3hZ65?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <269D6946332C194F91116E7BC46408E2@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d30e2346-4184-4db4-5fe5-08da42cca18b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 06:13:07.7062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bwj9fqvgWYgOTgkmhPITJ0lSc6BjSWQdkPXGPCXNyiIRdbelHuSqCTPSm8zlnqIr/grcXY9TvFCalXg4wNQ9E1AcUDePPztbUNpJAlSaw1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3188
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
Cc: Chen Zhongjin <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QWxsIGF2YWlsYWJsZSBhdCANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMjA1MzEw
MjA3NDQuMjM2OTcwLTEtY2hlbnpob25namluQGh1YXdlaS5jb20vVC8jdA0KDQpDaGVuLCBjYW4g
eW91IHBsZWFzZSBjb3B5IGxpbnV4cHBjLWRldiBsaXN0IG5leHQgdGltZSwgYXMgcG93ZXJwYyBp
cyANCmludGVyZXN0ZWQgaW4gb2JqdG9vbC4NCg0KDQotLS0tLS0tLSBNZXNzYWdlIHRyYW5zZsOp
csOpIC0tLS0tLS0tDQpTdWpldMKgOiBbUEFUQ0ggMC80XSBvYmp0b29sOiBSZW9yZ2FuaXplIHg4
NiBhcmNoLXNwZWNpZmljIGNvZGUNCkRhdGXCoDogVHVlLCAzMSBNYXkgMjAyMiAxMDowNzo0MCAr
MDgwMA0KRGXCoDogQ2hlbiBaaG9uZ2ppbiA8Y2hlbnpob25namluQGh1YXdlaS5jb20+DQpQb3Vy
wqA6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFyY2hAdmdlci5rZXJuZWwu
b3JnLCANCng4NkBrZXJuZWwub3JnDQpDb3BpZSDDoMKgOiBqcG9pbWJvZUByZWRoYXQuY29tLCBw
ZXRlcnpAaW5mcmFkZWFkLm9yZywgDQptYWR2ZW5rYUBsaW51eC5taWNyb3NvZnQuY29tLCB0Z2x4
QGxpbnV0cm9uaXguZGUsIG1pbmdvQHJlZGhhdC5jb20sIA0KYnBAYWxpZW44LmRlLCBocGFAenl0
b3IuY29tLCBhcm5kQGFybmRiLmRlLCBha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnLCANCmFuZHJl
eWtudmxAZ21haWwuY29tLCB3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbSwgDQphbmRyZWFsbWVp
ZEBjb2xsYWJvcmEuY29tLCBtaGlyYW1hdEBrZXJuZWwub3JnLCBtY2dyb2ZAa2VybmVsLm9yZywg
DQpjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUsIGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20s
IA0KeWFuZ3RpZXpodUBsb29uZ3Nvbi5jbiwgZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tDQoN
ClRoaXMgcGF0Y2ggc2V0IHJlb3JnYW5pemUgY3VycmVudCB4ODYgcmVsYXRlZCBjb2RlIGluIG9i
anRvb2wsIFsxLTNdIG1vdmUNCmFyY2gtc3BlY2lmaWMgdG8gYXJjaCBmaWxlcyBhbmQgZXh0cmFj
dCBzb21lIGNvbW1vbiBjb2RlcyBhbmQgWzRdIGZpeGVzDQphIGNyb3NzLWNvbXBpbGUgcHJvYmxl
bS4NCg0KSXQgbWFrZSBvYmp0b29sIG1vcmUgYXJjaC1nZW5lcmljLCB3aGljaCBtYWtlcyBvdGhl
ciBwYXRjaGVzIG9uIGRpZmZlcmVudA0KYXJjaGl0ZWN0dXJlcyBlYXNpZXIgdG8gYmUgcmV2aWV3
ZWQgYW5kIG1lcmdlZC4NCg0KVGVzdGVkIG9uIHg4NiB3aXRoIHVud2luZCBvbiBrZXJuZWwgYW5k
IG1vZHVsZSBjb250ZXh0Lg0KDQpSZWJhc2VkIHRvOg0KdGlwL29ianRvb2wvY29yZToyMjY4MmEw
N2FjYzMgKG9ianRvb2w6IEZpeCBvYmp0b29sIHJlZ3Jlc3Npb24gb24geDMyIA0Kc3lzdGVtcykN
Cg0KQ2hlbiBaaG9uZ2ppbiAoMik6DQogICBvYmp0b29sOiBBZGQgZ2VuZXJpYyBzeW1ib2wgZm9y
IHJlbG9jYXRpb24gdHlwZQ0KICAgb2JqdG9vbDogU3BlY2lmeSBob3N0LWFyY2ggZm9yIG1ha2lu
ZyBMSUJTVUJDTUQNCg0KTWFkaGF2YW4gVC4gVmVua2F0YXJhbWFuICgyKToNCiAgIG9ianRvb2w6
IE1ha2UgT1JDIHR5cGUgY29kZSBhcmNoLXNwZWNpZmljDQogICBvYmp0b29sOiBNYWtlIE9SQyBp
bml0IGFuZCBsb29rdXAgY29kZSBhcmNoLWdlbmVyaWMNCg0KICBhcmNoL3g4Ni9pbmNsdWRlL2Fz
bS91bndpbmQuaCAgICAgICAgICAgICAgICAgfCAgIDUgLQ0KICBhcmNoL3g4Ni9rZXJuZWwvbW9k
dWxlLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0NCiAgYXJjaC94ODYva2VybmVsL3Vu
d2luZF9vcmMuYyAgICAgICAgICAgICAgICAgIHwgMjU2ICstLS0tLS0tLS0tLS0tLS0tDQogIGFy
Y2gveDg2L2tlcm5lbC92bWxpbnV4Lmxkcy5TICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KICAu
Li4vYXNtID0+IGluY2x1ZGUvYXNtLWdlbmVyaWN9L29yY19sb29rdXAuaCAgfCAgNDIgKysrDQog
IGtlcm5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQog
IGtlcm5lbC9vcmNfbG9va3VwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI2MSArKysr
KysrKysrKysrKysrKysNCiAgdG9vbHMvb2JqdG9vbC9NYWtlZmlsZSAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstDQogIHRvb2xzL29ianRvb2wvYXJjaC94ODYvQnVpbGQgICAgICAgICAg
ICAgICAgICB8ICAgMSArDQogIHRvb2xzL29ianRvb2wvYXJjaC94ODYvaW5jbHVkZS9hcmNoL2Vs
Zi5oICAgICB8ICAgNSArLQ0KICB0b29scy9vYmp0b29sL2FyY2gveDg2L29yYy5jICAgICAgICAg
ICAgICAgICAgfCAxMzcgKysrKysrKysrDQogIHRvb2xzL29ianRvb2wvYXJjaC94ODYvc3BlY2lh
bC5jICAgICAgICAgICAgICB8ICAgNSArLQ0KICB0b29scy9vYmp0b29sL2NoZWNrLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTIgKy0NCiAgdG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRv
b2wvb3JjLmggICAgICAgICAgIHwgIDE3ICsrDQogIHRvb2xzL29ianRvb2wvb3JjX2R1bXAuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICA1OSArLS0tDQogIHRvb2xzL29ianRvb2wvb3JjX2dlbi5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICA3OSArLS0tLS0NCiAgMTYgZmlsZXMgY2hhbmdlZCwg
NDkxIGluc2VydGlvbnMoKyksIDQwMSBkZWxldGlvbnMoLSkNCiAgcmVuYW1lIHthcmNoL3g4Ni9p
bmNsdWRlL2FzbSA9PiBpbmNsdWRlL2FzbS1nZW5lcmljfS9vcmNfbG9va3VwLmggKDUxJSkNCiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGtlcm5lbC9vcmNfbG9va3VwLmMNCiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IHRvb2xzL29ianRvb2wvYXJjaC94ODYvb3JjLmMNCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRv
b2xzL29ianRvb2wvaW5jbHVkZS9vYmp0b29sL29yYy5oDQoNCi0tIA0KMi4xNy4xDQo=
