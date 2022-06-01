Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E353AA28
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 17:34:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCtVt4tGZz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 01:34:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2l/CkfEP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::60a; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=2l/CkfEP;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCtV50gMVz2xnN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 01:34:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp7nFVgDN+nK1PSAVkF9MHxk6XUL0zkoFvY3xcSrK9HQiAZQMvH+nsGIzxUI0L3e8f4YmYDZupLxTfq8nVUWPbRVj2HmYICqvKXJo9z/uE2yLF2GSm5u07usIWq2OZRl6NfPor6mrlLWfOE/uPtnLHTlNBhMfwSAkmCrnaemVaf6pRfgaPy3hgc86umJWpmlKe55Bsx/JV9gV5LAblAtkkOnQqV69theyyV6qqXCa3FE8U4WQjEh0WWBbb6yamCX94ne2UFxedafq8OEhhnqEZgAb1UZk3MkU7LqTiGJjawwuJmpSXnWnoiAYm7I3PcgKMcrpklCmdvYOxgrlOccTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJTySZuSWZqk6fItLqjuyGXnrF0g0wfaQF2Rq/cG1+U=;
 b=n8nXM/5OaW+zJMVfq1ez5I/LgYtgRbRIxeLct14VCoMMEUqPiCwass7lPgRzBwU09L6A38HxoCKYHtmGwm6SLb4tETU5P+D+EVG3JPptv+ZCW5ZXypuqpTMTFpy60lduDnjrN5O2Upr2lJ2KtoK6kf7YtPoTsvauKaE/2cpDYPVqvVB7mp4XDmKMbFIBjgB4zjoSGFt2RaqW1EEwoCc4PT+1Tq3MaDL/pjZ8TVl90Dz6rhijJbqSGahr2KFvsDnooxN67WLxrqRCiNsQbd0RPtu1jQNJQo6B3SDhxFktj+GGVIFKItORlzqf1geI1+BitqDqBAy1u94npAu0JFTgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJTySZuSWZqk6fItLqjuyGXnrF0g0wfaQF2Rq/cG1+U=;
 b=2l/CkfEPL4Xhs3PYTnfoHCtvj6JRMpnziZ/Bj4uieWSfnM0HPrIPSTEY5kJbnCpGNwj+TlBveJgiYnbh0/CIBr0ROQxTKnOVZRQGwbv4tDbsdnn5l6ux7UYPSftaKrnEpLMcxEESpWSOf4qatZVHpb1BBaKzCJUkU6Vg7p4MBXicAZycjU6v46XnAgLAjTbFiDu9wSh9IuwkXtWMgId7I2epCLR180h9boklORamlfVyrMTdIo0bpTAMIvwDKLE99XQ+sEUkNZmzhPVsU1aN/tEN4Y/uti78AWBjGPDbMRC15q9wT4Yeb+GYRURL9+5fYJ/w0jGbCLaWxzFqTbINrQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2114.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:11::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 15:33:43 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5293.019; Wed, 1 Jun 2022
 15:33:43 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/irq: Increase stack_overflow detection limit when
 KASAN is enabled
Thread-Topic: [PATCH] powerpc/irq: Increase stack_overflow detection limit
 when KASAN is enabled
Thread-Index: AQHYdEFGF6KZ7IDne0qF7MOozfFi4K04hM8AgAIsoAA=
Date: Wed, 1 Jun 2022 15:33:43 +0000
Message-ID: <72937e28-3474-f958-3f54-a08360208c81@csgroup.eu>
References:  <a07c6616ea19a28e9af6008b58ff6ac6ae90efa1.1653927631.git.christophe.leroy@csgroup.eu>
 <87ee0akys7.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ee0akys7.fsf@mpe.ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 737565fc-1bad-4af2-f5ae-08da43e41c55
x-ms-traffictypediagnostic: MR1P264MB2114:EE_
x-microsoft-antispam-prvs:  <MR1P264MB21145E4B711BA21B83E0F862EDDF9@MR1P264MB2114.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  G2mTjspZrTIv3Gm7OixwNQTltnAg24sCmL+Vs5GDXFYMPBSNJlf1PX6ivBY11bWP7zISHHgzZc4eHW6Pc8JF/Wsp71+2YmuIAFBMGFSYZEOh+7mVmWa6f1n1PuDoSQUjibQp0e2hV6Bl9mZ//KOOTWbSEvurFQIToWGQz0Ah3S8ycMDQHZ5i2M/hiLUy+I6808vflhwUStX2MSavdUhP7bpeiqixfOdKbNwNUIK9C7c2mC2vxHWdyuN9Yk26+301yKeIXXdviOBaPL8CFtBT9QqvWPln+jQHDrNjxhUON61uOJ+Nrlw/tAAIjMsgDTRd0uOLCOXvsR7oqWEMAz7q98uNpOHP0mk4qqyRIf3h4DKqrWTIOj20+rMsc9qm9tsrHfoVVWSjIL+seqCj3nBo1p3P1oFFh9p3TOMQHXgwZMcEMigL8zEPVLruGFjalY5q29Er8r6x0G2FmqQhT7CkW6zpy4bzNfOyaQGgLEPucOym991cLYDKpmO7+sODiw1SzzLvOSnlIHq0f6mhK9I3/YtR3A6Leg9MtSAZ547Yw316i00mk7uzoupPghR49/Oo0XPS19AJWilTcBj6MtgLrr2queIS+yFTlugI8t/Jlbs+zNI4ZEZHbeYAkq0iAkKbYy+Ny8ljB99nZQWOPQQIRWY8boHdGZIL/XPsOvUMQpUQH2wdatCV7rw00ao7Q5xueO1v/7nH4WKPDYBmvswOKnY6C4I4PwSFZ/enIMDHipbZ6kMlYeM3xA99rSLXeHds875vuf42/LqAJkdHN4ZHMw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(6506007)(86362001)(2906002)(26005)(110136005)(316002)(38070700005)(19627235002)(66946007)(36756003)(66476007)(8676002)(4326008)(66556008)(66446008)(64756008)(76116006)(38100700002)(91956017)(31686004)(8936002)(54906003)(6486002)(44832011)(45080400002)(6512007)(186003)(2616005)(66574015)(122000001)(508600001)(5660300002)(83380400001)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bUErU29Xai9tMlJwYmFDbW1NODBqa2YrYndyVmk3WXBEOUdlc3N0b3RUQnpy?=
 =?utf-8?B?NERvaHB6OTMyejIzRGtuZlJ4eVgvc3ZsUmxxblFwSTlXS1B0S3UzckxMWWZ6?=
 =?utf-8?B?TTlWTHpvSHdHVG8rYjBmZ2JRSGRvWVVPVFFaZW8rMjlyeTJJaU56MG5YSnYz?=
 =?utf-8?B?TXhRZUM5SGxPSVRnelcrMUV5dFlRRkUrVGNoK1J3ZWxGNDgzWWM2c0dYQjNr?=
 =?utf-8?B?WHJIR2RKSEp0ay8yV1dhcUpEb1JobndscjlKc3RSYTFLSXdPbC9vcnQ1VU45?=
 =?utf-8?B?MmpTYXdKcDVMaE5UdnRTVWxrb2NSbks1ZjVtcEl5Z3NrMU5nQWJaVkxEblNi?=
 =?utf-8?B?eDVpZnd4SkJOM1AzVWZoMmZBb3QxNXBJU2lCUW01YzZlZGdOOTkxbzcwdnFk?=
 =?utf-8?B?dXIvdE05ZnRibXdybDVCbUl2TTFuaTBKSmw5RWRlT0RrS1JNSnZvV3Y1SGpt?=
 =?utf-8?B?M2hwOFJBdDZHV0luWmRxV0FOZ29rZE92OER2am14QmtKTUQvSnZ1MGNCTGlo?=
 =?utf-8?B?eXR0WElHUk9QbnRPTDR5d1p6ZzVtR3FjczVhbnhXTXBkcmdjdWxaZklHOWhB?=
 =?utf-8?B?RnhUVVJ3a1liYzRQSHB3T0l4SmQ5R3pad3ZzS241Q0Yvd2ZlbkVicVVCaTh5?=
 =?utf-8?B?R3dWNTZSMlo2TlA4cWRzMTY0S2RpcVViR1FHbUpXTWNqaGtnaFhubUtycmQw?=
 =?utf-8?B?UnE2YTRwL0tyRm91S3Nrb3RZQ0pxeVFnY2NQdTBaOUFEUG1NMThZcVlxQmtu?=
 =?utf-8?B?TGc0OCtmb3NsRjRIZkpXN0Z2dkNzTGk4Sk43UzRlSjZodFYyTjEySnZtUmdw?=
 =?utf-8?B?TVZ6d0orVU5uWCtCQ2JhNDM4SmxDMzhkbDl3WERubENzTDZINEdQRldPV0xL?=
 =?utf-8?B?QVljVXZ6WHU1Vkl5MElhdUlZOU9RTExLYUZDM3BJTDdxU1RxaVIrMml6aUd0?=
 =?utf-8?B?NVVaNVdZTmhLU0N5ejdtZjliN1BaR2ZoSC8zWVdWSzZaWEJDeXVFWENkdzBK?=
 =?utf-8?B?aCtMUi9xQUJlZS9aQlYwL3JRR3pFR2hKZzV4NWtKQmtpNC9nd25YSmNiNll2?=
 =?utf-8?B?MEp1TWJ1QXVZd1RRWXhKMXIxR3Q1dWFLNTJpc3RVNG1TZE1UTUIvS1VkNEI3?=
 =?utf-8?B?WGszNVBZRG9UdlhocUFkTk1uTE9JdVVkVEZXNnIrS1o4alpaSDF0emhoS1V2?=
 =?utf-8?B?QXlqMEovZEY1dzZFbVJFcmtSUlBkSjlzdzNqZ09RMEtrdVJMZlZFb1NUdXdm?=
 =?utf-8?B?ME82TFRnd3ZlMzJNbDgrWnpHSFlHUUltUERIaW1yaFQrQ2hIQVZJR0VzLzRO?=
 =?utf-8?B?dzltZHRRMXdmY0RIRjBQZ1dqc1QyR25zQ3c1TkFQdEtaSXlPZFZEYXg4bUFy?=
 =?utf-8?B?YzZ4M1ZPYUpMaWR0a29XRkxjZ1VSWUdMcnJTNnV2cXRjSHNOSFB6d2N5eVFV?=
 =?utf-8?B?OUQvVnJvUVEyMHRuaWF5MStPdEhVQkU5KzJFVlpSV2RZbllNd1F0YW1zaCs5?=
 =?utf-8?B?L0dEdk1TbW5ralZ2L2NHZVl0MzdGL2ZjQVM1amxUSVFVMTYrbkFHck40ZWxR?=
 =?utf-8?B?ZEJrbWhxM3BQNkVud01TdmNTT2w2U2RmNzdmOVZmQURlUmo4SDZMSVpyRFJX?=
 =?utf-8?B?ZzZyeFUrS04yTVhIY1gvdEQzb2ZWNVE4cFNlRk81TEpiaDB4YTAweEVaVkkx?=
 =?utf-8?B?aGp2dy90bXhFdnMxNVRsalB3NXJGUGVWRExZUW1mcFc2TDV1aDNvVXBwSzZx?=
 =?utf-8?B?TFFud3ZZYnRiR1U2enN6elFHTlBCcE1zZGl3T2NCVlR5dnhvU0QwemlqZUpU?=
 =?utf-8?B?UXJHc0s1a2tReEtiQ0tuZWdEUjVsdHJZbm1JM2t6Z0JjbkhmL0hIbHRiR2w2?=
 =?utf-8?B?R29JY2MyZDgwaklKOEFkdXFiNGxvd25PQzJDbVE2WnpXSU9JeG1FQnVrZEwz?=
 =?utf-8?B?R2xLdGRQUXp0UW9LdmZpTXdXcGt5N2lMSVlWeHBVdWNrY0twSVk2UUlzWkVa?=
 =?utf-8?B?UzVkbDdCUG91a0JvZWZiRlEvVXlmT3J1VS82L0hwSTNIU0dBbXArN1FFNEFO?=
 =?utf-8?B?a0hqTERUbTQ1cmlBZ05IOWxBRE9kd2ttcnFtdGgycGhjY2RuWTR2SkhSZVNT?=
 =?utf-8?B?Z3U0emRIdkFrWmhhNG9BRXlzd1NUSHVBelF5UzZUd0tNS2R6ZmZtV0M1ZndM?=
 =?utf-8?B?WkFwSWxPSmVGcWtYTmpYMVQ2T0daYXZ6ano1QWl2em5ERVhvS0J4TDZzSWR6?=
 =?utf-8?B?ZmxMTi9VY21mRjMvd29MUzd0NDJrSGliNWdiNmxBVmVTYklJZFNzaGgydGh4?=
 =?utf-8?B?cGVMcEdQVjVaYzVaMGxMa0FENUtZKzVncHhhRUh4WXhNeHYydGlBV2doN1pt?=
 =?utf-8?Q?efkQJGQaFBT//eR5G0fPG/A2VYrF3FvJRkois?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5253EA8AE7B08C43BBD6392B94A61C75@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 737565fc-1bad-4af2-f5ae-08da43e41c55
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2022 15:33:43.3190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: emFhspNfwsXU6h5E5VDvaXtbZKLljjYswYOUHYvALvsL4qs2EH8xQbtD/xIudqrnCIV294+e0eHkeLjZQP6ZXdRx9412E5DmHzYVDNK5YjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2114
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDMxLzA1LzIwMjIgw6AgMDg6MjEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+PiBXaGVuIEtBU0FOIGlzIGVuYWJsZWQsIGFzIHNob3duIGJ5IHRoZSBPb3BzIGJlbG93LCB0
aGUgMmsgbGltaXQgaXMgbm90DQo+PiBlbm91Z2ggdG8gYWxsb3cgc3RhY2sgZHVtcCBhZnRlciBh
IHN0YWNrIG92ZXJmbG93IGRldGVjdGlvbiB3aGVuDQo+PiBDT05GSUdfREVCVUdfU1RBQ0tPVkVS
RkxPVyBpcyBzZWxlY3RlZDoNCj4+DQo+PiAJZG9fSVJROiBzdGFjayBvdmVyZmxvdzogMTk4NA0K
Pj4gCUNQVTogMCBQSUQ6IDEyNiBDb21tOiBzeXN0ZW1kLXVkZXZkIE5vdCB0YWludGVkIDUuMTgu
MC1nZW50b28tUE1hY0c0ICMxDQo+PiAJQ2FsbCBUcmFjZToNCj4+IAlPb3BzOiBLZXJuZWwgc3Rh
Y2sgb3ZlcmZsb3csIHNpZzogMTEgWyMxXQ0KPj4gCUJFIFBBR0VfU0laRT00SyBNTVU9SGFzaCBT
TVAgTlJfQ1BVUz0yIFBvd2VyTWFjDQo+PiAJTW9kdWxlcyBsaW5rZWQgaW46IHNyX21vZCBjZHJv
bSByYWRlb24oKykgb2hjaV9wY2koKykgaHdtb24gaTJjX2FsZ29fYml0IGRybV90dG1faGVscGVy
IHR0bSBkcm1fZHBfaGVscGVyIHNuZF9hb2FfaTJzYnVzIHNuZF9hb2Ffc291bmRidXMgc25kX3Bj
bSBlaGNpX3BjaSBzbmRfdGltZXIgb2hjaV9oY2Qgc25kIHNzYiBlaGNpX2hjZCA4MjUwX3BjaSBz
b3VuZGNvcmUgZHJtX2ttc19oZWxwZXIgcGNtY2lhIDgyNTAgcGNtY2lhX2NvcmUgc3lzY29weWFy
ZWEgdXNiY29yZSBzeXNmaWxscmVjdCA4MjUwX2Jhc2Ugc3lzaW1nYmx0IHNlcmlhbF9tY3RybF9n
cGlvIGZiX3N5c19mb3BzIHVzYl9jb21tb24gcGtjczhfa2V5X3BhcnNlciBmdXNlIGRybSBkcm1f
cGFuZWxfb3JpZW50YXRpb25fcXVpcmtzIGNvbmZpZ2ZzDQo+PiAJQ1BVOiAwIFBJRDogMTI2IENv
bW06IHN5c3RlbWQtdWRldmQgTm90IHRhaW50ZWQgNS4xOC4wLWdlbnRvby1QTWFjRzQgIzENCj4+
IAlOSVA6ICBjMDJlNTU1OCBMUjogYzA3ZWIzYmMgQ1RSOiBjMDdmNDZhOA0KPj4gCVJFR1M6IGU3
ZmU5ZjUwIFRSQVA6IDAwMDAgICBOb3QgdGFpbnRlZCAgKDUuMTguMC1nZW50b28tUE1hY0c0KQ0K
Pj4gCU1TUjogIDAwMDAxMDMyIDxNRSxJUixEUixSST4gIENSOiA0NGExNDgyNCAgWEVSOiAyMDAw
MDAwMA0KPj4NCj4+IAlHUFIwMDogYzA3ZWIzYmMgZWFhMWMwMDAgYzI2YmFlYTAgZWFhMWMwYTAg
MDAwMDAwMDggMDAwMDAwMDAgYzA3ZWIzYmMgZWFhMWMwMTANCj4+IAlHUFIwODogZWFhMWMwYTgg
MDRmM2YzZjMgZjFmMWYxZjEgYzA3ZjRjODQgNDRhMTQ4MjQgMDA4MGY3ZTQgMDAwMDAwMDUgMDAw
MDAwMTANCj4+IAlHUFIxNjogMDAwMDAwMjUgZWFhMWMxNTQgZWFhMWMxNTggYzBkYmFkNjQgMDAw
MDAwMjAgZmQ1NDM4MTAgZWFhMWMwYTAgZWFhMWMyOWUNCj4+IAlHUFIyNDogYzBkYmFkNDQgYzBk
Yjg3NDAgMDVmZmZmZmYgZmQ1NDM4MDIgZWFhMWMxNTAgYzBjOWEzYzAgZWFhMWMwYTAgYzBjOWEz
YzANCj4+IAlOSVAgW2MwMmU1NTU4XSBrYXNhbl9jaGVja19yYW5nZSsweGMvMHgyYjQNCj4+IAlM
UiBbYzA3ZWIzYmNdIGZvcm1hdF9kZWNvZGUrMHg4MC8weDYwNA0KPj4gCUNhbGwgVHJhY2U6DQo+
PiAJW2VhYTFjMDAwXSBbYzA3ZWIzYmNdIGZvcm1hdF9kZWNvZGUrMHg4MC8weDYwNCAodW5yZWxp
YWJsZSkNCj4+IAlbZWFhMWMwNzBdIFtjMDdmNGRhY10gdnNucHJpbnRmKzB4MTI4LzB4OTM4DQo+
PiAJW2VhYTFjMTEwXSBbYzA3ZjU3ODhdIHNwcmludGYrMHhhMC8weGMwDQo+PiAJW2VhYTFjMTgw
XSBbYzAxNTRjMWNdIF9fc3ByaW50X3N5bWJvbC5jb25zdHByb3AuMCsweDE3MC8weDE5OA0KPj4g
CVtlYWExYzIzMF0gW2MwN2VlNzFjXSBzeW1ib2xfc3RyaW5nKzB4ZjgvMHgyNjANCj4+IAlbZWFh
MWM0MzBdIFtjMDdmNDZkMF0gcG9pbnRlcisweDE1Yy8weDcxMA0KPj4gCVtlYWExYzRiMF0gW2Mw
N2Y0ZmJjXSB2c25wcmludGYrMHgzMzgvMHg5MzgNCj4+IAlbZWFhMWM1NTBdIFtjMDBlOGZhMF0g
dnByaW50a19zdG9yZSsweDJhOC8weDY3OA0KPj4gCVtlYWExYzY5MF0gW2MwMGU5NGU0XSB2cHJp
bnRrX2VtaXQrMHgxNzQvMHgzNzgNCj4+IAlbZWFhMWM2ZDBdIFtjMDBlYTAwOF0gX3ByaW50aysw
eDljLzB4YzANCj4+IAlbZWFhMWM3NTBdIFtjMDAwY2E5NF0gc2hvd19zdGFjaysweDIxYy8weDI2
MA0KPj4gCVtlYWExYzdhMF0gW2MwN2QwYmQ0XSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4OTANCj4+
IAlbZWFhMWM3YzBdIFtjMDAwOTIzNF0gX19kb19JUlErMHgxNzAvMHgxNzQNCj4+IAlbZWFhMWM4
MDBdIFtjMDAwOTI1OF0gZG9fSVJRKzB4MjAvMHgzNA0KPj4gCVtlYWExYzgyMF0gW2MwMDA0NWI0
XSBIYXJkd2FyZUludGVycnVwdF92aXJ0KzB4MTA4LzB4MTBjDQo+IA0KPiBJcyB0aGlzIGFjdHVh
bGx5IGNhdXNlZCBieSBLQVNBTj8gVGhlcmUncyBubyBzdGFjayBmcmFtZXMgaW4gdGhlcmUgdGhh
dA0KPiBhcmUgS0FTQU4gcmVsYXRlZCBBRkFJQ1MuDQo+IA0KPiBTZWVtcyBsaWtlIHRoZSAySyBs
aW1pdCBpcyBuZXZlciBnb2luZyB0byBiZSBlbm91Z2ggZXZlbiBpZiBLQVNBTiBpcyBub3QNCj4g
ZW5hYmxlZC4gUHJlc3VtYWJseSB3ZSBqdXN0IGhhdmVuJ3Qgbm90aWNlZCBiZWNhdXNlIHdlIGRv
bid0IHRyaWdnZXIgdGhlDQo+IGNoZWNrIHVubGVzcyBLQVNBTiBpcyBlbmFibGVkLg0KDQpJIG1h
ZGUgc29tZSB0ZXN0IG9uIFBQQzMyLg0KDQpXaXRob3V0IEtBU0FOLCBJIGNhbiBjYWxsIGR1bXBf
c3RhY2soKSB1bnRpbCB0aGUgc3RhY2sgaGFzIGF0IGxlYXN0IDExMjANCiAgYnl0ZXMgYXZhaWxh
YmxlIG9uIHN0YWNrLg0KDQpXaXRoIEtBU0FOIEkgY2FuIGNhbGwgZHVtcF9zdGFjaygpIHVudGls
IHRoZSBzdGFjayBoYXMgYXQgbGVhc3QgMjA5NiANCmJ5dGVzIGF2YWlsYWJsZSBvbiBzdGFjay4N
Cg0KPiANCj4+IC4uLg0KPj4NCj4+IEluY3JlYXNlIHRoZSBsaW1pdCB0byAzayB3aGVuIEtBU0FO
IGlzIGVuYWJsZWQuDQo+Pg0KPj4gV2hpbGUgYXQgaXQgcmVtb3ZlIHRoZSAnaW5saW5lJyBrZXl3
b3JrIGZvciBjaGVja19zdGFja19vdmVyZmxvdygpLg0KPj4gVGhpcyBmdW5jdGlvbiBpcyBjYWxs
ZWQgb25seSBvbmNlIHNvIGl0IHdpbGwgYmUgaW5saW5lZCByZWdhcmRsZXNzLg0KPiANCj4gSSdk
IHJhdGhlciB0aGF0IHdhcyBhIHNlcGFyYXRlIGNoYW5nZSwgaW4gY2FzZSBpdCBoYXMgc29tZSB1
bmludGVuZGVkDQo+IGFmZmVjdC4NCj4gDQo+PiBSZXBvcnRlZC1ieTogRXJoYXJkIEZ1cnRuZXIg
PGVyaGFyZF9mQG1haWxib3gub3JnPg0KPj4gQ2M6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGNzZ3JvdXAuZXU+DQo+PiAtLS0NCj4+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9pcnEuYyB8IDE2
ICsrKysrKysrKystLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwv
aXJxLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2lycS5jDQo+PiBpbmRleCA4NzNlNmRmZmI4Njgu
LjVmZjRjZjY5ZmMyZiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMN
Cj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvaXJxLmMNCj4+IEBAIC01Myw2ICs1Myw3IEBA
DQo+PiAgICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9w
Z3RhYmxlLmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9zdGF0aWNfY2FsbC5oPg0KPj4gKyNpbmNs
dWRlIDxsaW51eC9zaXplcy5oPg0KPj4gICANCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3Mu
aD4NCj4+ICAgI2luY2x1ZGUgPGFzbS9pbnRlcnJ1cHQuaD4NCj4+IEBAIC0xODQsNyArMTg1LDcg
QEAgdTY0IGFyY2hfaXJxX3N0YXRfY3B1KHVuc2lnbmVkIGludCBjcHUpDQo+PiAgIAlyZXR1cm4g
c3VtOw0KPj4gICB9DQo+PiAgIA0KPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBjaGVja19zdGFja19v
dmVyZmxvdyh2b2lkKQ0KPj4gK3N0YXRpYyB2b2lkIGNoZWNrX3N0YWNrX292ZXJmbG93KHZvaWQp
DQo+PiAgIHsNCj4+ICAgCWxvbmcgc3A7DQo+PiAgIA0KPj4gQEAgLTE5MywxMSArMTk0LDE0IEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBjaGVja19zdGFja19vdmVyZmxvdyh2b2lkKQ0KPj4NCj4gDQo+
IFdvdWxkbid0IGl0IGJlIGNsZWFuZXIgdG8ganVzdCBkbzoNCj4gDQo+ICNpZmRlZiBDT05GSUdf
S0FTQU4NCj4gI2RlZmluZSBTVEFDS19DSEVDS19MSU1JVCAoMyAqIDEwMjQpDQo+ICNlbHNlDQo+
ICNkZWZpbmUgU1RBQ0tfQ0hFQ0tfTElNSVQgKDIgKiAxMDI0KQ0KPiAjZW5kaWYNCj4gDQo+PiAg
IAlzcCA9IGN1cnJlbnRfc3RhY2tfcG9pbnRlciAmIChUSFJFQURfU0laRSAtIDEpOw0KPj4gICAN
Cj4+IC0JLyogY2hlY2sgZm9yIHN0YWNrIG92ZXJmbG93OiBpcyB0aGVyZSBsZXNzIHRoYW4gMktC
IGZyZWU/ICovDQo+PiAtCWlmICh1bmxpa2VseShzcCA8IDIwNDgpKSB7DQo+ICAgDQo+ICsJaWYg
KHVubGlrZWx5KHNwIDwgU1RBQ0tfQ0hFQ0tfTElNSVQpKSB7DQo+ICAgDQo+IEFuZCB0aGVuIHRo
ZSBjb2RlIGNvdWxkIHN0YXkgYXMgaXQgaXM/DQo+IA0KPiBjaGVlcnMNCj4gDQo+PiAtCQlwcl9l
cnIoImRvX0lSUTogc3RhY2sgb3ZlcmZsb3c6ICVsZFxuIiwgc3ApOw0KPj4gLQkJZHVtcF9zdGFj
aygpOw0KPj4gLQl9DQo+PiArCS8qIGNoZWNrIGZvciBzdGFjayBvdmVyZmxvdzogaXMgdGhlcmUg
bGVzcyB0aGFuIDIvM0tCIGZyZWU/ICovDQo+PiArCWlmICghSVNfRU5BQkxFRChLQVNBTikgJiYg
bGlrZWx5KHNwID49IFNaXzJLKSkNCj4+ICsJCXJldHVybjsNCj4+ICsJaWYgKElTX0VOQUJMRUQo
S0FTQU4pICYmIGxpa2VseShzcCA+PSBTWl8ySyArIFNaXzFLKSkNCj4+ICsJCXJldHVybjsNCj4+
ICsNCj4+ICsJcHJfZXJyKCJkb19JUlE6IHN0YWNrIG92ZXJmbG93OiAlbGRcbiIsIHNwKTsNCj4+
ICsJZHVtcF9zdGFjaygpOw0KPj4gICB9
