Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C21056092A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:31:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY95q4q3yz3drQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 04:31:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y8xQ0q4B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.79; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Y8xQ0q4B;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90079.outbound.protection.outlook.com [40.107.9.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY9520Fntz3bnh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 04:30:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul/Q+lu+v6uBZRONkvx1HnT76txjWqFMc1Si1DN2+alZA+MaCn6eexUuUS6Iw54YiRH6eHUrE4FVh9fknl4X3yjeHnhKvdknWM2S1PUD4yaEUq5u1+xDQO7qHdFB8bnOzSu8yFkCTvLdyzfPnw/yNDEhBHIF0DdSWFNh6DpcNr1RAimxu8908omTd2pkRI4Ltb+Icvl6gZiyuDf+kBEyKoFIN89455NgjdLnQ0tSAX6Mar2WsflUneGsk9YzNl//umiv2FhOiPPLdwnMiw/ve6Uzxf1y7UuEUYkDZVgJmROOwhZF6OLd+8eJZUhv7cABaevNXeGeZO4PCH7hE6nNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5R/K+KmEXx+fKBDJuVv8iYltGqMPesLo4tLY3NM8P2U=;
 b=I6WBkhjbVBYnUwKFk5lvyjxAjPQU+ETwNm1aC4RJFpx5Cr4W7WRqT4TqcPDJcHWvAhs/1fxby4gcggbsScPzTgqLaVbzfMEBQoyIAofhTppvFuZ4ZZ4HvQxM2nWOG1OqRxUxnVdNfFnBZATfjTyLvXchWNZ6Sizd7gDbcCoY+6TcYqCbOuNg2Te2f+Y4VA5ThUTwW8utZk1pe4pWW2/0DrhSjvl5g14B0dFLV2LFCBciZ8u1datQEPJ4wOH7YxHR3S/oBR8/TOy2hBpNK5QxpeoudysI387P0Tkq384F37t9hJ/Z0BxeU2cIdZgJTNIJ20iMN80B5BxJheGy4wlfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5R/K+KmEXx+fKBDJuVv8iYltGqMPesLo4tLY3NM8P2U=;
 b=Y8xQ0q4BcklLRPggfvFOwe9bGQ/Mvau6TdpynU92DouJP+Oy4/rSygnip4V6z5oZU/jrqlsx0LFxSr1uX/dU0x2LMvYiF4bNu0XrM2W5ELi3OSMZIzmVi+Ix8nMj24GUa8NDxN/N+/aaBEihQnBkTJyEvdRCMJa7xqfQYAIZPaOE+THHOneDvwM8wEvlJr2/vmr/QRlxOgV9RY6vYEUGL+XLBsQJ/dcSe/gAInktKVRorwO906gY+1c4OIQCNmibNKxr0usFR8bUKjdkLBaewBPnEIswPHMasdSJGWjzC05E0WflwZbM1VYv2lHUBYlAkxU/NU9jrY8KaHG8nGvdqA==
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PR0P264MB1660.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:166::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Wed, 29 Jun 2022 18:30:24 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::958f:a26:4984:ffd7]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::958f:a26:4984:ffd7%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 18:30:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>, Sathvika Vasireddy
	<sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from WARN_ON()
Thread-Topic: [RFC PATCH v3 11/12] powerpc: Remove unreachable() from
 WARN_ON()
Thread-Index: AQHYh/kBfzKOa0yAB0m8i9v+dp1MAq1frsEAgAO4OwCAA1WnAA==
Date: Wed, 29 Jun 2022 18:30:23 +0000
Message-ID: <cce19b1c-449a-f306-533a-9edc855049aa@csgroup.eu>
References: <20220624183238.388144-1-sv@linux.ibm.com>
 <20220624183238.388144-12-sv@linux.ibm.com>
 <70b6d08d-aced-7f4e-b958-a3c7ae1a9319@csgroup.eu>
 <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
In-Reply-To: <92eae2ef-f9b6-019a-5a8e-728cdd9bbbc0@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44417575-acf0-4079-dd52-08da59fd6e57
x-ms-traffictypediagnostic: PR0P264MB1660:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QSMh/p2dKfGGWgNR+vb+O3M4suJsGCzigVUSCTLml04IyWtCwMeupCR6RGB1eLQ/ewAyg3WLwilJFYpjlBDgc25G2xj6KVeUtv63TKpbCFYDBcK/9FP6bPB6Oi0R0UfH3Ft0zJKvJYI9Zjcv5yhqSUr7uaPPFasBLIjDLiaarySam/DMLW72M99morENrYpo2XqwZu+93sttv/rfqK/N4xuiup9ixtHT6sA5Pv1DZoU2FIGKCgbhfoStgyeBrf/FpsWGR79trMTVZbzAYENJsLXbzx14CfnvLisnCGS6pLzY3rTkHKBFlwPUQeblnNgfHiaLE4y0FDDv6V3h7KtqXJM+Wqo0QoCpgrQWvu3ILFvUsYx84DkbxmdyZwcHTzLSlkW9i/z/TJeGAOQeIW9PXP6J0tjTe5zgfObsUFdZu60AP5uQ8rcreKKwMMpIhAhB2GoehBcKWocWE/GIN8Tt3HD1sKeO/B7V0BKuvT9RrMSl3ckk62dT08xAKV1MR8kisIXFNNZ/pZulmtK1nM+M6lAgTBG5wwa1OshvJobWqpJpd0dA2ZjVZfX6/dWf/793tBLIacw+OzwxETbMMhJ+4sAq4GSF7MmIuwI1n/MCfmEP7fNiwChbU8HL3/kd06tR1QvkVNPBC+ekLr1fJwuvA2vOxhThDoilQSu44lhmJJP/df9uWhWGJCVV9dUQcNBPiAeiROxHSXLT5S2f4DtDrXLrNd2jjZgiDtQE2ywKW1ie3TZvkVLnzySpE9bC+pxDHZfPByJ/iewTPSEQPTIqOTqQwmlRj359vXruUHkNufGKd4zllZp8fyo2+BHKdu2jUKDSFZdBnZilGkioXiT9CzfXs9AsfRIIhwqR7TnSCZZoUD5AiiYeacbxRRJ+Lgw/7b13ihJNxdUYfBlu3eT4Rw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(2906002)(91956017)(64756008)(66476007)(4326008)(5660300002)(86362001)(478600001)(31696002)(8676002)(66946007)(7416002)(122000001)(38100700002)(66446008)(66556008)(8936002)(6506007)(41300700001)(76116006)(38070700005)(966005)(6512007)(316002)(54906003)(71200400001)(53546011)(6486002)(186003)(83380400001)(31686004)(66574015)(36756003)(2616005)(26005)(110136005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dHgrN3F1SlBIL2F5RkYwTDlSYkVVaEpram8yZWlnK1c4Z3Ftd1l6NTdTN2hG?=
 =?utf-8?B?NnY1QWJueUhLcGZhRFFDK2V4VTZBRWF6ZGF6Z3JqRkIyd2xGQ1prK3VSMGsr?=
 =?utf-8?B?ZlFjb1hpZ3FyRDd2YTRzc0x4WFMyRGFNQTZGcVRHaWx4akkyaVdSU2RsVFVu?=
 =?utf-8?B?eS9iMm9CcWUyckJ2ZDM0ZEJybUlraFpEUjZIR2NTK3EwSTJJb0pHZ2JpSGR1?=
 =?utf-8?B?TzVXNnRHSHVrMmtBbmlIT0VMYURZeEdWS0o3bENaTkNUUktXblFSdEY1NWpP?=
 =?utf-8?B?VFpPTFA4eUlJL0M3ejdLV3o4dXBXaWNXUTdWS1BSN1RXQWFMeVdDY3pRRGIr?=
 =?utf-8?B?VVUrTGJveFU3a2NVQk9EbEQxOHlnZURXTHpDUnZFUndKbHBzOHBMdXVMeGVE?=
 =?utf-8?B?ek5NR25zZTdTaEZYOUhsUHE5QVE3VVp2SzBPelB0YVJMNU94VGthSzArY1VI?=
 =?utf-8?B?azA5UzlrZjhYZHZXZDUxU3JINllMTWc3cWNFeklzbjExTjE4WWJkMm5mZGgr?=
 =?utf-8?B?dDdMdVczU0JpUWJOenczL0lKRDdhdy9SUlBaOXdpREhsRHU4eUJBK3hTSWdU?=
 =?utf-8?B?UEYyV3VadHJKSEd2c3ZPMVgvUGxLTS9ZWUFpNmVaMjJtTUNydXBlTXd4b255?=
 =?utf-8?B?c1hyMVdCVnE3YmJyL1ZQN1VUUjhSRm9GRVdsZUx4UlhVKzllWkFoVFRhM0w5?=
 =?utf-8?B?blZSRCs1ajBWbkw3QnMrcENMWVdwbnkwbG9FTU9MbGlhRjgvOW9jdm9hcnI1?=
 =?utf-8?B?TjVUZ3lrV0xzSktETEVseGRHZW5yVlBDQXZ4VDdiaFNvNVkrVHlaMmsvcFpS?=
 =?utf-8?B?TTZMQ2phb2puYzN5dHRjZFVlZVoxRGExU3VOcjhZc0U2Uk02bGpSS2lmMllD?=
 =?utf-8?B?bjJhNUxiQjlpcEVORiszZ1VRNkE0bFZvSWNOaTc1VXdYeVJuZDJIMERzdkFD?=
 =?utf-8?B?WStaajRnWTgyTVRFMWlTZEhzbE4yRkx2NkdQemIxaFBaMVhMclltQTU0RGlH?=
 =?utf-8?B?aUtMUWpxazd5U1BuTlFrMW1uQi8ydVVUS1V4YTV2VVVQdlRCektsaTJSRnZj?=
 =?utf-8?B?M0plbmwwRng3REZSTnl3bDFVMmxnMm4venlDeWYxK2FrUFZmT0o3M3Fjb3R4?=
 =?utf-8?B?VjFwN0dhbkVRVnJhNjFxdmpuQTBDNW1wN3lReVN6ZmRPbTZUVEtTWXFPN0JE?=
 =?utf-8?B?Umc3UWlWZm9HZ0t2TnJ3b0lhR1BEQ0pvNDJBeldvT0t4VUZySWpFOXowNjl0?=
 =?utf-8?B?R3c1WTJjT3BQYk9TWlEvUjg2ay9HZmdpZU9zeFhIb1RWSFJkQUZTZXR5YW9l?=
 =?utf-8?B?YWRmbTFyWXJncnFwN0xnZlpYLzVON1pYM2c3NGMxNDkrcGw4Z3ZFTEtiSkxz?=
 =?utf-8?B?clROUE5vNUZDNzZyYTJuamg3QURSd0JVMFllTUpNZENqaXlMUUorNGJxNFJC?=
 =?utf-8?B?V3B4ZVRsd1R1RTh0NkFaU2xUcWZHV2hobEJJWUplZW9URnVWczI5OFBzQXZq?=
 =?utf-8?B?aVEyMlN4NWthTFh2c3MyRjhLL1Q1NjVLdFdHTE4zNlJnOWpOdnhXS2ljeUJp?=
 =?utf-8?B?OWZoOG5ITllZaVJYNGJSR3RmZ2g2QVQ4dEZMb3IzRExWeGVqR3ZSWGNhRktU?=
 =?utf-8?B?TXJGMWViV1FENmVlZVhETUIrRkF4d2l0RFM0WW1XRkUxYjlvbHZHLzY4ODNo?=
 =?utf-8?B?ejkreGljMkJ6M0lFZFRlOU5MTkJleVU5NitReGZvaDlRSlloaks5Ym1ZbTZF?=
 =?utf-8?B?dkRoWGRQN2MrcXY0eEhjeEl3ZDErYlRoTUFLR0F6VTVvTVpWVWZsYnowdzFn?=
 =?utf-8?B?WlNxNG5Gbzc2bW5QRDFodkZ4aVF1V2xwVUlZREsrY1V0M3dNaU9yWUUwbkJF?=
 =?utf-8?B?YlZpZTdtSVRiSGRLTytJcG1PYVlQeDBNcGJOUXhTSUpoUzh3WUZ6M0RvT0ds?=
 =?utf-8?B?bVhNTVNpSnNpRkhieWhVSFh0cE9qN3dhcGVNc1NkdzB0K2tPMDVEcXFOT3k4?=
 =?utf-8?B?VUk0NzgwWkNIUDJob3QvZ3hrQVZtSGNWaHNZL2hjc3lxR1hpcG4zVElYUlB4?=
 =?utf-8?B?SHF3WVpQU1hJcUVPSXYwRWJiRkdaUUxSaTdoY2pWWTVHWFUzdmJBZ1QrNVdo?=
 =?utf-8?B?UUVMbnRSSXZWRHZCRi85WW5QaWlwMlRSYnQ1VURqQmNkUFUvVDBVQ2VaeGdm?=
 =?utf-8?Q?CF9dC0/rwQCYUoRs+gJkjQQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEB29F2EC542F841B7E728744FF26E9A@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 44417575-acf0-4079-dd52-08da59fd6e57
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 18:30:23.8571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hVBGnTGc3k6k0dTqn42Eju7ib5zUlsDcS5v5eAgEOSBPG0Jf0+E1LMu+BucBUWOU1BE5fRHXI7IBFM3FPJCr8McJglEbgT/1YZykXM2W1wA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB1660
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
Cc: Marc Zyngier <maz@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "paulus@samba.org" <paulus@samba.org>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgU2F0aHZpa2EsDQoNCkFkZGluZyBBUk0gcGVvcGxlIGFzIHRoZXkgc2VlbSB0byBmYWNlIHRo
ZSBzYW1lIGtpbmQgb2YgcHJvYmxlbSAoc2VlIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LWtidWlsZC9wYXRjaC8yMDIyMDYyMzAxNDkxNy4xOTk1NjMtMzMtY2hl
bnpob25namluQGh1YXdlaS5jb20vKQ0KDQpMZSAyNy8wNi8yMDIyIMOgIDE3OjM1LCBTYXRodmlr
YSBWYXNpcmVkZHkgYSDDqWNyaXTCoDoNCj4gDQo+IE9uIDI1LzA2LzIyIDEyOjE2LCBDaHJpc3Rv
cGhlIExlcm95IHdyb3RlOg0KPj4NCj4+IExlIDI0LzA2LzIwMjIgw6AgMjA6MzIsIFNhdGh2aWth
IFZhc2lyZWRkeSBhIMOpY3JpdMKgOg0KPj4+IG9ianRvb2wgaXMgdGhyb3dpbmcgKnVuYW5ub3Rh
dGVkIGludHJhLWZ1bmN0aW9uIGNhbGwqDQo+Pj4gd2FybmluZ3Mgd2l0aCBhIGZldyBpbnN0cnVj
dGlvbnMgdGhhdCBhcmUgbWFya2VkDQo+Pj4gdW5yZWFjaGFibGUuIFJlbW92ZSB1bnJlYWNoYWJs
ZSgpIGZyb20gV0FSTl9PTigpDQo+Pj4gdG8gZml4IHRoZXNlIHdhcm5pbmdzLCBhcyB0aGUgY29k
ZWdlbiByZW1haW5zIHNhbWUNCj4+PiB3aXRoIGFuZCB3aXRob3V0IHVucmVhY2hhYmxlKCkgaW4g
V0FSTl9PTigpLg0KPj4gRGlkIHlvdSB0cnkgdGhlIHR3byBleGVtcGxlcyBkZXNjcmliZWQgaW4g
Y29tbWl0IDFlNjg4ZGQyYTNkNg0KPj4gKCJwb3dlcnBjL2J1ZzogUHJvdmlkZSBiZXR0ZXIgZmxl
eGliaWxpdHkgdG8gV0FSTl9PTi9fX1dBUk5fRkxBR1MoKSB3aXRoDQo+PiBhc20gZ290byIpID8N
Cj4+DQo+PiBXaXRob3V0IHlvdXIgcGF0Y2g6DQo+Pg0KPj4gMDAwMDA2NDAgPHRlc3Q+Og0KPj4g
wqDCoCA2NDA6wqDCoMKgIDgxIDIzIDAwIDg0wqDCoMKgwqAgbHd6wqDCoMKgwqAgcjksMTMyKHIz
KQ0KPj4gwqDCoCA2NDQ6wqDCoMKgIDcxIDI5IDQwIDAwwqDCoMKgwqAgYW5kaS7CoMKgIHI5LHI5
LDE2Mzg0DQo+PiDCoMKgIDY0ODrCoMKgwqAgNDAgODIgMDAgMGPCoMKgwqDCoCBibmXCoMKgwqDC
oCA2NTQgPHRlc3QrMHgxND4NCj4+IMKgwqAgNjRjOsKgwqDCoCA4MCA2MyAwMCAwY8KgwqDCoMKg
IGx3esKgwqDCoMKgIHIzLDEyKHIzKQ0KPj4gwqDCoCA2NTA6wqDCoMKgIDRlIDgwIDAwIDIwwqDC
oMKgwqAgYmxyDQo+PiDCoMKgIDY1NDrCoMKgwqAgMGYgZTAgMDAgMDDCoMKgwqDCoCB0d3VpwqDC
oMKgIHIwLDANCj4+DQo+PiAwMDAwMDY1OCA8dGVzdDl3PjoNCj4+IMKgwqAgNjU4OsKgwqDCoCAy
YyAwNCAwMCAwMMKgwqDCoMKgIGNtcHdpwqDCoCByNCwwDQo+PiDCoMKgIDY1YzrCoMKgwqAgNDEg
ODIgMDAgMGPCoMKgwqDCoCBiZXHCoMKgwqDCoCA2NjggPHRlc3Q5dysweDEwPg0KPj4gwqDCoCA2
NjA6wqDCoMKgIDdjIDYzIDIzIDk2wqDCoMKgwqAgZGl2d3XCoMKgIHIzLHIzLHI0DQo+PiDCoMKg
IDY2NDrCoMKgwqAgNGUgODAgMDAgMjDCoMKgwqDCoCBibHINCj4+IMKgwqAgNjY4OsKgwqDCoCAw
ZiBlMCAwMCAwMMKgwqDCoMKgIHR3dWnCoMKgwqAgcjAsMA0KPj4gwqDCoCA2NmM6wqDCoMKgIDM4
IDYwIDAwIDAwwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHIzLDANCj4+IMKgwqAgNjcwOsKgwqDCoCA0
ZSA4MCAwMCAyMMKgwqDCoMKgIGJscg0KPj4NCj4+DQo+PiBXaXRoIHlvdXIgcGF0Y2g6DQo+Pg0K
Pj4gMDAwMDA2NDAgPHRlc3Q+Og0KPj4gwqDCoCA2NDA6wqDCoMKgIDgxIDIzIDAwIDg0wqDCoMKg
wqAgbHd6wqDCoMKgwqAgcjksMTMyKHIzKQ0KPj4gwqDCoCA2NDQ6wqDCoMKgIDcxIDI5IDQwIDAw
wqDCoMKgwqAgYW5kaS7CoMKgIHI5LHI5LDE2Mzg0DQo+PiDCoMKgIDY0ODrCoMKgwqAgNDAgODIg
MDAgMGPCoMKgwqDCoCBibmXCoMKgwqDCoCA2NTQgPHRlc3QrMHgxND4NCj4+IMKgwqAgNjRjOsKg
wqDCoCA4MCA2MyAwMCAwY8KgwqDCoMKgIGx3esKgwqDCoMKgIHIzLDEyKHIzKQ0KPj4gwqDCoCA2
NTA6wqDCoMKgIDRlIDgwIDAwIDIwwqDCoMKgwqAgYmxyDQo+PiDCoMKgIDY1NDrCoMKgwqAgMGYg
ZTAgMDAgMDDCoMKgwqDCoCB0d3VpwqDCoMKgIHIwLDANCj4+IMKgwqAgNjU4OsKgwqDCoCA0YiBm
ZiBmZiBmNMKgwqDCoMKgIGLCoMKgwqDCoMKgwqAgNjRjIDx0ZXN0KzB4Yz7CoMKgwqDCoMKgwqDC
oCA8PT0NCj4+DQo+PiAwMDAwMDY1YyA8dGVzdDl3PjoNCj4+IMKgwqAgNjVjOsKgwqDCoCAyYyAw
NCAwMCAwMMKgwqDCoMKgIGNtcHdpwqDCoCByNCwwDQo+PiDCoMKgIDY2MDrCoMKgwqAgNDEgODIg
MDAgMGPCoMKgwqDCoCBiZXHCoMKgwqDCoCA2NmMgPHRlc3Q5dysweDEwPg0KPj4gwqDCoCA2NjQ6
wqDCoMKgIDdjIDYzIDIzIDk2wqDCoMKgwqAgZGl2d3XCoMKgIHIzLHIzLHI0DQo+PiDCoMKgIDY2
ODrCoMKgwqAgNGUgODAgMDAgMjDCoMKgwqDCoCBibHINCj4+IMKgwqAgNjZjOsKgwqDCoCAwZiBl
MCAwMCAwMMKgwqDCoMKgIHR3dWnCoMKgwqAgcjAsMA0KPj4gwqDCoCA2NzA6wqDCoMKgIDM4IDYw
IDAwIDAwwqDCoMKgwqAgbGnCoMKgwqDCoMKgIHIzLDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDw9
PQ0KPj4gwqDCoCA2NzQ6wqDCoMKgIDRlIDgwIDAwIDIwwqDCoMKgwqAgYmxywqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDw9PQ0KPj4gwqDCoCA2Nzg6wqDCoMKgIDM4IDYwIDAwIDAwwqDC
oMKgwqAgbGnCoMKgwqDCoMKgIHIzLDANCj4+IMKgwqAgNjdjOsKgwqDCoCA0ZSA4MCAwMCAyMMKg
wqDCoMKgIGJscg0KPj4NCj4gVGhlIGJ1aWx0aW4gdmFyaWFudCBvZiB1bnJlYWNoYWJsZSAoX19i
dWlsdGluX3VucmVhY2hhYmxlKCkpIHdvcmtzLg0KPiANCj4gSG93IGFib3V0IHVzaW5nIHRoYXQg
aW5zdGVhZCBvZiB1bnJlYWNoYWJsZSgpID8NCj4gDQo+IA0KDQpJbiBmYWN0IHRoZSBwcm9ibGVt
IGNvbWVzIGZyb20gdGhlIG1hY3JvIGFubm90YXRlX3VucmVhY2hhYmxlKCkgd2hpY2ggaXMgDQpj
YWxsZWQgYnkgdW5yZWFjaGFibGUoKSBiZWZvcmUgY2FsbGluZyBfX2J1aWxkX3VucmVhY2hhYmxl
KCkuDQoNClNlZW1zIGxpa2UgdGhpcyBtYWNybyBhZGRzIChhZnRlciB0aGUgdW5jb25kaXRpb25h
bCB0cmFwIHR3dWkpIGEgY2FsbCB0byANCmFuIGVtcHR5IGZ1bmN0aW9uIHdob3NlIGFkZHJlc3Mg
aXMgbGlzdGVkIGluIHNlY3Rpb24gLmRpc2NhcmQudW5yZWFjaGFibGUNCg0KICAgICAxYzc4OiAg
ICAgICAwMCAwMCBlMCAwZiAgICAgdHd1aSAgICByMCwwDQogICAgIDFjN2M6ICAgICAgIDU1IGU3
IGZmIDRiICAgICBibCAgICAgIDNkMCANCjxxZGlzY19yb290X3NsZWVwaW5nX2xvY2sucGFydC4w
Pg0KDQoNClJFTE9DQVRJT04gUkVDT1JEUyBGT1IgWy5kaXNjYXJkLnVucmVhY2hhYmxlXToNCk9G
RlNFVCAgICAgICAgICAgVFlQRSAgICAgICAgICAgICAgVkFMVUUNCjAwMDAwMDAwMDAwMDAwMDAg
Ul9QUEM2NF9SRUwzMiAgICAgLnRleHQrMHgwMDAwMDAwMDAwMDAwM2QwDQoNClRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhhdCBmdW5jdGlvbiBoYXMgc2l6ZSAwOg0KDQowMDAwMDAwMDAwMDAwM2QwIGwg
ICAgIEYgLnRleHQJMDAwMDAwMDAwMDAwMDAwMCANCnFkaXNjX3Jvb3Rfc2xlZXBpbmdfbG9jay5w
YXJ0LjANCg0KDQpBbmQgb2JqdG9vbCBpcyBub3QgcHJlcGFyZWQgZm9yIGEgZnVuY3Rpb24gd2l0
aCBzaXplIDAuDQoNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHRvIG9ianRvb2wgc2VlbSB0byBm
aXggdGhlIHByb2JsZW0sIG1vc3Qgd2FybmluZyANCmFyZSBnb25lIHdpdGggdGhhdCBjaGFuZ2Uu
DQoNCmRpZmYgLS1naXQgYS90b29scy9vYmp0b29sL2VsZi5jIGIvdG9vbHMvb2JqdG9vbC9lbGYu
Yw0KaW5kZXggNjMyMThmNTc5OWMyLi4zN2MwYTI2OGI3ZWEgMTAwNjQ0DQotLS0gYS90b29scy9v
Ymp0b29sL2VsZi5jDQorKysgYi90b29scy9vYmp0b29sL2VsZi5jDQpAQCAtNzcsNiArNzcsOCBA
QCBzdGF0aWMgaW50IHN5bWJvbF9ieV9vZmZzZXQoY29uc3Qgdm9pZCAqa2V5LCBjb25zdCANCnN0
cnVjdCByYl9ub2RlICpub2RlKQ0KDQogIAlpZiAoKm8gPCBzLT5vZmZzZXQpDQogIAkJcmV0dXJu
IC0xOw0KKwlpZiAoKm8gPT0gcy0+b2Zmc2V0ICYmICFzLT5sZW4pDQorCQlyZXR1cm4gMDsNCiAg
CWlmICgqbyA+PSBzLT5vZmZzZXQgKyBzLT5sZW4pDQogIAkJcmV0dXJuIDE7DQoNCkBAIC00MDAs
NyArNDAyLDcgQEAgc3RhdGljIHZvaWQgZWxmX2FkZF9zeW1ib2woc3RydWN0IGVsZiAqZWxmLCBz
dHJ1Y3QgDQpzeW1ib2wgKnN5bSkNCiAgCSAqIERvbid0IHN0b3JlIGVtcHR5IFNUVF9OT1RZUEUg
c3ltYm9scyBpbiB0aGUgcmJ0cmVlLiAgVGhleQ0KICAJICogY2FuIGV4aXN0IHdpdGhpbiBhIGZ1
bmN0aW9uLCBjb25mdXNpbmcgdGhlIHNvcnRpbmcuDQogIAkgKi8NCi0JaWYgKCFzeW0tPmxlbikN
CisJaWYgKHN5bS0+dHlwZSA9PSBTVFRfTk9UWVBFICYmICFzeW0tPmxlbikNCiAgCQlyYl9lcmFz
ZSgmc3ltLT5ub2RlLCAmc3ltLT5zZWMtPnN5bWJvbF90cmVlKTsNCiAgfQ0KDQotLS0NCg0KSSBh
bHNvIGhhZCBvYmp0b29sIHJ1bm5pbmcgZm9yIGV2ZXIgb24gDQphcmNoL3Bvd2VycGMvc3lzZGV2
L3hpY3MvaWNwLWh2Lm8sIHdoaWNoIEkgZml4ZWQgd2l0aCB0aGUgYmVsb3cgaGFjazoNCg0KZGlm
ZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0K
aW5kZXggNTFiNmRjZWM4ZDZhLi5lZjIzMDNhZDYzODEgMTAwNjQ0DQotLS0gYS90b29scy9vYmp0
b29sL2NoZWNrLmMNCisrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2suYw0KQEAgLTUyOSw3ICs1Mjks
NyBAQCBzdGF0aWMgc3RydWN0IGluc3RydWN0aW9uICpmaW5kX2xhc3RfaW5zbihzdHJ1Y3QgDQpv
Ymp0b29sX2ZpbGUgKmZpbGUsDQogIAl1bnNpZ25lZCBpbnQgb2Zmc2V0Ow0KICAJdW5zaWduZWQg
aW50IGVuZCA9IChzZWMtPnNoLnNoX3NpemUgPiAxMCkgPyBzZWMtPnNoLnNoX3NpemUgLSAxMCA6
IDA7DQoNCi0JZm9yIChvZmZzZXQgPSBzZWMtPnNoLnNoX3NpemUgLSAxOyBvZmZzZXQgPj0gZW5k
ICYmICFpbnNuOyBvZmZzZXQtLSkNCisJZm9yIChvZmZzZXQgPSBzZWMtPnNoLnNoX3NpemUgLSAx
OyBvZmZzZXQgJiYgb2Zmc2V0ID49IGVuZCAmJiAhaW5zbjsgDQpvZmZzZXQtLSkNCiAgCQlpbnNu
ID0gZmluZF9pbnNuKGZpbGUsIHNlYywgb2Zmc2V0KTsNCg0KICAJcmV0dXJuIGluc247DQotLS0N
Cg0KTm93IEkgb25seSBoYXZlIHRoZSBmb2xsb3dpbmcgdHdvIHdhcm5pbmdzOg0KDQphcmNoL3Bv
d2VycGMvc3lzZGV2L3hpY3MvaWNwLWh2Lm86IHdhcm5pbmc6IG9ianRvb2w6IGNhbid0IGZpbmQg
DQp1bnJlYWNoYWJsZSBpbnNuIGF0IC50ZXh0LnVubGlrZWx5KzB4MA0KZHJpdmVycy9jcnlwdG8v
dm14L2Flc3A4LXBwYy5vOiB3YXJuaW5nOiBvYmp0b29sOiANCmFlc19wOF9zZXRfZW5jcnlwdF9r
ZXkrMHg0NDogdW5hbm5vdGF0ZWQgaW50cmEtZnVuY3Rpb24gY2FsbA0KDQpUaGUgZmlyc3Qgb25l
IGlzIGxpbmtlZCB0byB0aGUgaW5maW5pdGUgbG9vcCBJIGhhY2tlZC4gU28gSSBub3cgaGF2ZSB0
byANCnVuZGVyc3RhbmQgd2hhdCB0aGUgcHJvYmxlbSByZWFsbHkgaXMuDQoNClRoZSBzZWNvbmQg
b25lIGlzIGFuIGFzc2VtYmx5IGZpbGUgYWVzcDgtcHBjLlMgd2hpY2ggbGFja3MgdGhlIGNoYW5n
ZXMgDQp5b3UgZGlkIGluIG90aGVyIGFzc2VtYmx5IGZpbGVzIGluIHBhdGNoIDEyLg0KDQpDaHJp
c3RvcGhl
