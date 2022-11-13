Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E14B626FAB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Nov 2022 14:18:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9CgC2y85z3dvD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 00:18:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s7E/qaHQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.43; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=s7E/qaHQ;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90043.outbound.protection.outlook.com [40.107.9.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9CfC395yz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 00:17:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DND/cPXzUlFsTkAlF209hNc6M650Tou4WfDwbq4CiNq3x6YSxIKguHwm3UNRPA5tGHOKci8cvXU6if6Q2ObOcXxAXXYGEc3iDO0gFrY8MJG7F3zc5s7yJCE8nbcq2Jpatavq3mHQYZwfb9m6NuPq6zuD2mHfTcUrKPjg/FyYwvLQREH/z4hXr08m7BPUJGc3fkWyiIFd6p3gsw+USO+pvabL/Nb7D7cfNbGK8JM1Cja2cSAoUF9gFpzDWFWW8wG/gNO4HW0wHR4qNAj1ZXlnSM4I8c8d+iMUTRFT7YFQZY4QLi7BNupN2gMU7kNYFYVanHicIhmyDbIBnvWhFmtGxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJC/FLSh1lHtv42iTgfaTk88Au2/c/fYE+FXBZm9FmQ=;
 b=YkzpNDrGEn/R/4IuFvfPHlKytrgONWBzH0cI1QDpuvTOKQ2KeQ49yOI78Ien9995aNcBx5RanLvCeABmWuE6hC5kbVMnWTi2WoorGt3YJ4zrYBzagK20RxHogxVAAqyDd+vA+68YEjteyZueZF8+GKnZDK+bG1+gjNctobxig8spM4YguzneysYkBeoALDwacbe0p1C9WvQ0xIOe4PUWjT7hFGkRZuBlOqNseiJdt0VzTWf4F7TZ8C5JPF7GGf8RskZ9o0YDhTe016qQVj3+4oWaEp7MuUSBz/7ibfJoAzsW72He0e7lqOfkf8CnZcgGL6iNqMmTk6/lwUJmpxS4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJC/FLSh1lHtv42iTgfaTk88Au2/c/fYE+FXBZm9FmQ=;
 b=s7E/qaHQGG/VY98zSuf5gs2d5irYNyrxQGC5Y9xD/IfdDNlm2QLR8zNcbf19AnVi4WUyVYcXDU9lntMsCyo5nZ3yo2zHTpLafEuie9e65DuEiRzsv7oda2HnoODIin+9Hov1EN4xwmOR7PB8qr8XRaV0qX271Tv4FyPhd4+Jtetyv1knJpBtSbn0uE4zCMGREvBE6TouzFSM3vTfUu3CFP5Lgk9Al7e9W9qD56R4brjMYryTg229/SUBqIlrlk2ZsRCblVaUXBFF8xjjBJ5wW7Kd51r0gW7mqW48T1Bte3CmTlvIvjWqBP/cyyMe0UKXHScC/Ho5mXChrpRtAs9GvA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB1859.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:12::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Sun, 13 Nov
 2022 13:17:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.016; Sun, 13 Nov 2022
 13:17:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Subject: Re: [RFC PATCH 1/3] powerpc/bpf: implement bpf_arch_text_copy
Thread-Topic: [RFC PATCH 1/3] powerpc/bpf: implement bpf_arch_text_copy
Thread-Index: AQHY9TS76+os8inDsUa1DeHgBCpKca482gUA
Date: Sun, 13 Nov 2022 13:17:02 +0000
Message-ID: <cd26aa17-962f-aaab-a7bc-203a0d63f6c9@csgroup.eu>
References: <20221110184303.393179-1-hbathini@linux.ibm.com>
 <20221110184303.393179-2-hbathini@linux.ibm.com>
In-Reply-To: <20221110184303.393179-2-hbathini@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB1859:EE_
x-ms-office365-filtering-correlation-id: c5bcd3e6-4768-4d74-cfaf-08dac5795a56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  npUCmeZqEu0NVqw/yRfPvukz2CMdEQVFO36CdD9Qz7/yIsIEGZ62zXgPJVyP6uj2MDwVFzfVRzLG+C7rU+kP+ufB96sdDQDje1vufkNOGRcmq5EiuijptXtwi3BENt9PxCdniE2eKGScU00rza2V+CgnzwWJRYsL4fmTt6LRu1Aj2rtuvYKInZB+DBc5r54ix2m/1Y5fWZoFb4RcwgyrtzJlOQuLjjWKBwBlCEHJk+SSiPFSvDnsjfgz3SPj0Rppyx4kNsWQOBUdUzzrduJHIkl6pT1ukfTNG+P/5RCN1brpyF5KsvTJdAHG2uMW71UlCjWSEeWWFTXHYMKzJo1x17cmbfmf8aJVT+0RHH98IP/kfm2Eiv4c2X7l5uBYqwUFNczyCa5jf27ELhD2Bigmwn1Krp+kLfL6r1xa8HQPopbuI8VC41sAllG1GXdjMAnABC9gX0BSbg2pNZqWOxN9fdRPMhU/KcIPFd9PMMeMQvbz+KCvIqDSu/tPgPF+MbYuZymcWI6Grv749VPzkKBjEO75cFLSZQ/UVdPR3GW4GxDQFX1XJdlYW20RIG3lrTmVkBjH6P0Y446N68D6ZysFKmA9D80KATGIEwsDjQrNEmIYIMYAyZipDGJRDLi65HWvFOz7wyqn8fEwehzeS/qbN49KtoRVvsDThiZ313SFSFE2ykGjOr2aYANTtZjoyFrosoP8sf+UnErOtzoR5duxqPuMn/aJcWPCc+I36pkH713NVwA9+4hmosWhw8kEByNWBy2WrqaFtNL08MPFMfZP7ZmHM+WTmigjBGFTKNliQH/4WxITCBJNX1Wot/xEfuc8na9LvCO3uGtbyIwgryW92A==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39840400004)(366004)(376002)(451199015)(38070700005)(44832011)(186003)(2906002)(38100700002)(122000001)(86362001)(31696002)(66574015)(83380400001)(2616005)(110136005)(26005)(6486002)(6512007)(71200400001)(478600001)(6506007)(41300700001)(66946007)(91956017)(76116006)(4326008)(8676002)(64756008)(66476007)(66446008)(5660300002)(66556008)(8936002)(316002)(54906003)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Zk1vZnNWNXRJMHdqSlRRNHpXVGRNT2hFZC9YTDVJUzZlOXJqM3l5ZHBURVNF?=
 =?utf-8?B?dDBuUUVFMU8zSzFsMzZaRlc5dXhGL25xMUNGRnZpOWRWcTZpdUlqZjl5MXpU?=
 =?utf-8?B?bnpnNXFwdzZKK2NnVVRNMDRUZ0JCOXZkaTB6NVN4TXpyaCtibCttTG5jRjZR?=
 =?utf-8?B?SDIwV2FIU1JLMTBTNnlXRnZSWHZMSC9icmI0MHhvdHVqOUJobE5MQjNnY0Uw?=
 =?utf-8?B?TVo1ayt5SGNobWFycWRkNHFVMWVGWmdjclBlVTRoTCtQSW9TTHhwYlljVnZN?=
 =?utf-8?B?TFlad2VyNDF3NStJa1RZVVg5QnZBRWhybTAvODJZT2NCaVBsUkRsZzZYeHNm?=
 =?utf-8?B?bkM4RXFubG82d2tId0tKZFpqUmhVSUZxSkw2amxDeHMwcExaZ2dlWmVLVTdZ?=
 =?utf-8?B?cWxUMEkyZmI0UmVmWHh2cG1zaVlKYXZ5UkJ1N2M3MTlWcExyaG1zemwzV3pO?=
 =?utf-8?B?WmkxYmFQWU5PUWY5UUQ2b0pMWkJNQTRXODRpc0Q4VXFsSnFxanU5TldhNEl1?=
 =?utf-8?B?eDV5VlpqRnRxWWRoVzQvTGhRQi95NVV6bC9Ba2VYUittaU05UnlFRGt1K0ha?=
 =?utf-8?B?UFk4MVkrRFpmMnc1TnBxM3JXRnR5SHB4VnVrS0RlVkVmMnpaQUxXTDQ1bXly?=
 =?utf-8?B?T2tKd21iaUtjU0VCZkFhWk1aRjFPWDNSQWcwZWd6N05lWjlCTnlIYUV3WnFz?=
 =?utf-8?B?RG5qRGlKeHhGbnlkWTRLbVp3Vm5HMldhOXJ1bUJLYyt4Rit2N0FLbnFvVWtl?=
 =?utf-8?B?c05KakxCTy91dk5mSk1LekpJTU9kajlxc3RPbTlCbnFzMm9hZGt4RlExUzdJ?=
 =?utf-8?B?RHJIV3RRdXlnYlc4b1RKWXRuMGJDYnVrc0VEclpkVzB5TVdTZk9xSkUvT2hl?=
 =?utf-8?B?ejJSRm5OeERQRVhQNlhuMW5GWnF2aDE0U1FIZE5lVEI5b1I2c25pT25SMjQ5?=
 =?utf-8?B?Q3pvVkNIcDhiOHlNcXcwWVF1cjNDTkZXWjI5R2lnRzBQMjAvOXRWZnR1b3Ru?=
 =?utf-8?B?S2htY1RVRjNwMDIzK1gxSWE5Z244Wi8rdlJkZk4yYmo3YWNMSFpKWmx4TW1n?=
 =?utf-8?B?OHcxREpwbzNkQ05lbVMrb0lhTFM2d3F4WXhuTjkvRGhHT2ZxNGNoM1J4enhr?=
 =?utf-8?B?elhuR0xCOTl0NVBQcGF6ektOd1ZOcDQ2Ritxb1NJaHp5b2pES2Q5SkVlZ21q?=
 =?utf-8?B?cFp1d3o1K0ZZOTVjR2s2c2ZQVnAvdlNJZStzazVtOW5zNnpxS2IyTGtpYjlI?=
 =?utf-8?B?V3A5ZEtPOWZnUHlBRndrbjB5RHlHWlJQMk9MT2pNcHU1MUZPM2tWbVBiZ3cy?=
 =?utf-8?B?bE1DTE9zTkNacmRCSFBDS0luQ0lkN0FnSG12aFBGUXZYbTRBSWs0SHVySjFH?=
 =?utf-8?B?dTc2dUtxV2thYVM5TzVCZ3ZpeTRwWlhQQ2xhRjU2Sm01RG9BcStkQmFWeE9i?=
 =?utf-8?B?cjNpVmEySWhrdlMxSVdZQXdFaE1rdzM2Rm9iNnllNjcwenFORVBjdm1QOVNx?=
 =?utf-8?B?d2diTnk2Z0NKMEFYOEJlVURxeUFwV29ONkFSRE82WWY4TmJSWWFwUTdkWHB4?=
 =?utf-8?B?d1FFMWtCemRzZmlMbEZNaXBjTUtPS0FoMmxMejhuRFlGSFdtcFZsTjZMVVQz?=
 =?utf-8?B?YUd3TmVobElsTWJBQjBFc0IrRlAzaFJNR0htNmJIM2hiWWlXTnR5anlaUXhn?=
 =?utf-8?B?L2RlK1RrZWNad3JtQWEzSDR4aWRGMWJCdllXV0txcjZXTlhlRG9BcWFkaGYz?=
 =?utf-8?B?azV4VUZvNXZ1MndQaUhqOFNQVWtsSTNDem1UdGRvdGcxbUdnMXFYUFlCdmUr?=
 =?utf-8?B?V0ZVMkpXWi9iNmJZQ0VVSzBraEpjWFFTSi95RWdqWlBTUFpmMFE3RXZyUk8y?=
 =?utf-8?B?dDhxZVFuRjZwRmlZTVhwc2tseTBCcXpDQ3g2Q0NPaU1zRGFaZHhyNnc0L2pJ?=
 =?utf-8?B?enA5QzVDWWE0TDFGS0NXcW50WDJJTnlnZngrUENiN1JRVFU3UTVVeHhMNnhk?=
 =?utf-8?B?VXhRUS9nN1NTbnNBQk5yK3l0Z2JGbEFzYTRyWjA3cFVTRlNDNXBxU3pnRzlo?=
 =?utf-8?B?TkNORkZ1Q2YrTUlUWmFxNmZoNGFuM0IzMU5EQ1ZLZ1RiNHRaMHllQWppaTVN?=
 =?utf-8?B?Rmd5YTlQRjhuSmViekRtU0hxYVJ3T2lrWnF3bWFmNDFVMncwbHNsVmkyT1Ju?=
 =?utf-8?B?bVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB4F8F5F157FDA4EA00878E2522CFCE1@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bcd3e6-4768-4d74-cfaf-08dac5795a56
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2022 13:17:02.3074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zt6MqeRTGAWq2mjfJKeI9GdABcIXFJdjiqza1VA6i35K+eQLuzP+FsxUgz3Kf+nAuxXwpGB+06gP2Kiubt26xWqsYFf+zAn4k7LUFvh6Zfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1859
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

TGUgMTAvMTEvMjAyMiDDoCAxOTo0MywgSGFyaSBCYXRoaW5pIGEgw6ljcml0wqA6DQo+IGJwZl9h
cmNoX3RleHRfY29weSBpcyB1c2VkIHRvIGR1bXAgSklUZWQgYmluYXJ5IHRvIFJYIHBhZ2UsIGFs
bG93aW5nDQo+IG11bHRpcGxlIEJQRiBwcm9ncmFtcyB0byBzaGFyZSB0aGUgc2FtZSBwYWdlLiBV
c2luZyBwYXRjaF9pbnN0cnVjdGlvbg0KPiB0byBpbXBsZW1lbnQgaXQuDQoNClVzaW5nIHBhdGNo
X2luc3RydWN0aW9uKCkgaXMgbmljZSBmb3IgYSBxdWljayBpbXBsZW1lbnRhdGlvbiwgYnV0IGl0
IGlzIA0KcHJvYmFibHkgc3Vib3B0aW1hbC4gRHVlIHRvIHRoZSBhbW91bnQgb2YgZGF0YSB0byBi
ZSBjb3BpZWQsIGl0IGlzIHdvcnRoIA0KYSBkZWRpY2F0ZWQgZnVuY3Rpb24gdGhhdCBtYXBzIGEg
UlcgY29weSBvZiB0aGUgcGFnZSB0byBiZSB1cGRhdGVkIHRoZW4gDQpkb2VzIHRoZSBjb3B5IGF0
IG9uY2Ugd2l0aCBtZW1jcHkoKSB0aGVuIHVubWFwcyB0aGUgcGFnZS4NCg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSGFyaSBCYXRoaW5pIDxoYmF0aGluaUBsaW51eC5pYm0uY29tPg0KPiAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jIHwgMzkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRf
Y29tcC5jIGIvYXJjaC9wb3dlcnBjL25ldC9icGZfaml0X2NvbXAuYw0KPiBpbmRleCA0M2U2MzQx
MjY1MTQuLjczODNlMGVmZmFkMiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL25ldC9icGZf
aml0X2NvbXAuYw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jDQo+IEBA
IC0xMyw5ICsxMywxMiBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9uZXRkZXZpY2UuaD4NCj4gICAj
aW5jbHVkZSA8bGludXgvZmlsdGVyLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2lmX3ZsYW4uaD4N
Cj4gLSNpbmNsdWRlIDxhc20va3Byb2Jlcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L21lbW9yeS5o
Pg0KPiAgICNpbmNsdWRlIDxsaW51eC9icGYuaD4NCj4gICANCj4gKyNpbmNsdWRlIDxhc20va3By
b2Jlcy5oPg0KPiArI2luY2x1ZGUgPGFzbS9jb2RlLXBhdGNoaW5nLmg+DQo+ICsNCj4gICAjaW5j
bHVkZSAiYnBmX2ppdC5oIg0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGJwZl9qaXRfZmlsbF9pbGxf
aW5zbnModm9pZCAqYXJlYSwgdW5zaWduZWQgaW50IHNpemUpDQo+IEBAIC0yMyw2ICsyNiwzNSBA
QCBzdGF0aWMgdm9pZCBicGZfaml0X2ZpbGxfaWxsX2luc25zKHZvaWQgKmFyZWEsIHVuc2lnbmVk
IGludCBzaXplKQ0KPiAgIAltZW1zZXQzMihhcmVhLCBCUkVBS1BPSU5UX0lOU1RSVUNUSU9OLCBz
aXplIC8gNCk7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4gKyAqIFBhdGNoICdsZW4nIGJ5dGVzIG9m
IGluc3RydWN0aW9ucyBmcm9tIG9wY29kZSB0byBhZGRyLCBvbmUgaW5zdHJ1Y3Rpb24NCj4gKyAq
IGF0IGEgdGltZS4gUmV0dXJucyBhZGRyIG9uIHN1Y2Nlc3MuIEVSUl9QVFIoLUVJTlZBTCksIG90
aGVyd2lzZS4NCj4gKyAqLw0KPiArc3RhdGljIHZvaWQgKmJwZl9wYXRjaF9pbnN0cnVjdGlvbnMo
dm9pZCAqYWRkciwgdm9pZCAqb3Bjb2RlLCBzaXplX3QgbGVuKQ0KPiArew0KPiArCXZvaWQgKnJl
dCA9IEVSUl9QVFIoLUVJTlZBTCk7DQo+ICsJc2l6ZV90IHBhdGNoZWQgPSAwOw0KPiArCXUzMiAq
aW5zdCA9IG9wY29kZTsNCj4gKwl1MzIgKnN0YXJ0ID0gYWRkcjsNCj4gKw0KPiArCWlmIChXQVJO
X09OX09OQ0UoY29yZV9rZXJuZWxfdGV4dCgodW5zaWduZWQgbG9uZylhZGRyKSkpDQo+ICsJCXJl
dHVybiByZXQ7DQo+ICsNCj4gKwltdXRleF9sb2NrKCZ0ZXh0X211dGV4KTsNCj4gKwl3aGlsZSAo
cGF0Y2hlZCA8IGxlbikgew0KPiArCQlpZiAocGF0Y2hfaW5zdHJ1Y3Rpb24oc3RhcnQrKywgcHBj
X2luc3QoKmluc3QpKSkNCj4gKwkJCWdvdG8gZXJyb3I7DQo+ICsNCj4gKwkJaW5zdCsrOw0KPiAr
CQlwYXRjaGVkICs9IDQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0ID0gYWRkcjsNCj4gK2Vycm9yOg0K
PiArCW11dGV4X3VubG9jaygmdGV4dF9tdXRleCk7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4g
Kw0KPiAgIC8qIEZpeCB1cGRhdGVkIGFkZHJlc3NlcyAoZm9yIHN1YnByb2cgY2FsbHMsIGxkaW1t
NjQsIGV0IGFsKSBkdXJpbmcgZXh0cmEgcGFzcyAqLw0KPiAgIHN0YXRpYyBpbnQgYnBmX2ppdF9m
aXh1cF9hZGRyZXNzZXMoc3RydWN0IGJwZl9wcm9nICpmcCwgdTMyICppbWFnZSwNCj4gICAJCQkJ
ICAgc3RydWN0IGNvZGVnZW5fY29udGV4dCAqY3R4LCB1MzIgKmFkZHJzKQ0KPiBAQCAtMzU3LDMg
KzM4OSw4IEBAIGludCBicGZfYWRkX2V4dGFibGVfZW50cnkoc3RydWN0IGJwZl9wcm9nICpmcCwg
dTMyICppbWFnZSwgaW50IHBhc3MsIHN0cnVjdCBjb2RlDQo+ICAgCWN0eC0+ZXhlbnRyeV9pZHgr
KzsNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiArDQo+ICt2b2lkICpicGZfYXJjaF90ZXh0X2Nv
cHkodm9pZCAqZHN0LCB2b2lkICpzcmMsIHNpemVfdCBsZW4pDQo+ICt7DQo+ICsJcmV0dXJuIGJw
Zl9wYXRjaF9pbnN0cnVjdGlvbnMoZHN0LCBzcmMsIGxlbik7DQo+ICt9DQoNCkkgY2FuJ3Qgc2Vl
IHRoZSBhZGRlZCB2YWx1ZSBvZiBoYXZpbmcgdHdvIGZ1bmN0aW9ucyB3aGVuIHRoZSBmaXJzdCBv
bmUgDQpqdXN0IGNhbGxzIHRoZSBzZWNvbmQgb25lIGFuZCBpcyB0aGUgb25seSB1c2VyIG9mIGl0
LiBXaHkgbm90IGhhdmUgDQppbXBsZW1lbnRlZCBicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKCkgZGly
ZWN0bHkgaW5zaWRlIGJwZl9hcmNoX3RleHRfY29weSgpID8NCg0KQnkgdGhlIHdheSwgaXQgY2Fu
IGJlIG5pY2UgdG8gaGF2ZSB0d28gZnVuY3Rpb25zLCBidXQgc3BsaXQgdGhlbSANCmRpZmZlcmVu
dGx5LCB0byBhdm9pZCB0aGUgZ290bzogZXRjIC4uLi4NCg0KSSBhbHNvIHByZWZlciB1c2luZyBm
b3IgbG9vcHMgaW5zdGVhZCBvZiB3aGlsZSBsb29wcy4NCg0KSXQgY291bGQgaGF2ZSBsb29rZWQg
bGlrZSBiZWxvdyAodW50ZXN0ZWQpOg0KDQpzdGF0aWMgdm9pZCAqYnBmX3BhdGNoX2luc3RydWN0
aW9ucyh2b2lkICphZGRyLCB2b2lkICpvcGNvZGUsIHNpemVfdCBsZW4pDQp7DQoJdTMyICppbnN0
ID0gb3Bjb2RlOw0KCXUzMiAqc3RhcnQgPSBhZGRyOw0KCXUzMiAqZW5kID0gYWRkciArIGxlbjsN
Cg0KCWZvciAoaW5zdCA9IG9wY29kZSwgc3RhcnQgPSBhZGRyOyBzdGFydCA8IGVuZDsgaW5zdCsr
LCBzdGFydCsrKSB7DQoJCWlmIChwYXRjaF9pbnN0cnVjdGlvbihzdGFydCwgcHBjX2luc3QoKmlu
c3QpKSkNCgkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KCX0NCg0KCXJldHVybiBhZGRyOw0K
fQ0KDQp2b2lkICpicGZfYXJjaF90ZXh0X2NvcHkodm9pZCAqZHN0LCB2b2lkICpzcmMsIHNpemVf
dCBsZW4pDQp7DQoJaWYgKFdBUk5fT05fT05DRShjb3JlX2tlcm5lbF90ZXh0KCh1bnNpZ25lZCBs
b25nKWRzdCkpKQ0KCQlyZXR1cm4gcmV0Ow0KDQoJbXV0ZXhfbG9jaygmdGV4dF9tdXRleCk7DQoN
CglyZXQgPSBicGZfcGF0Y2hfaW5zdHJ1Y3Rpb25zKGRzdCwgc3JjLCBsZW4pOw0KDQoJbXV0ZXhf
dW5sb2NrKCZ0ZXh0X211dGV4KTsNCg0KCXJldHVybiByZXQ7DQp9DQoNCg0K
