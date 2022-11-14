Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11474627DD6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 13:32:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9pcL6RsZz3bjn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 23:32:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Hx4Kna/E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::623; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=Hx4Kna/E;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9pbR14FXz2xG9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 23:32:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b7aUQ9rmKQ53RX8gltCnOFKUQLj7/DOAgbqLNJdshzOdzwzF1QBgfQtgdxJa20vTLXWCOmZHvUkENSsUnWzqVD3+z1tXYUTXA9sE/H1/WZItpNQI2jBSgzXANh6XbEZMnBXhYx3m94X11Ebmo2I1NnM4WFaimTlaLS5dXStKvf27sCHBw+HE0AlU0wTQq0YJLBYW+21DII/8H+6CvUBZEm8U5iogxrohN0JwPTAbgHeVPfjNyfypzCb4RTboX8QP0cMG9t8OhPU1ykJ0nSTnv97KILi4y7vSHbjxR53D6Zz/l+fnZJcIy4fsqzEDUWYX0YaIpT+jf7V/8bE432D2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fhDm0sTEvGX80VHe+tQAsoATWhW1IQRkmpr0mDPpYb4=;
 b=ZjpyI29MVn0fBieRcFbLud6M4uURqMuwojrzIGX4iVzZXVhoJ4cW5IR0aCFvpYAr5yjtX1OI4VIh2b1APs+CtyBQeI2KqHS5hJlTGRtCPPM7+MNs9lTkcsMsldT8C28KLspr0JqCW4ENObJaCKMAjQpyr6lLnC4hoOCxHvRaxkNeJs8eWk28KzjqR11WHdaK0j+zlbI4F7ejepoKklQE9HzYWZQAoLEdCmp+7rfSYXEOEd96oRhA3IgdQU04kfVdIkptOEDnDRS+0Hr87JItIPKhJZxKjK8WJ/EGrpjou2DTZnX84LDOfTLGEb4+DhxxNs0+sprdM4m+uA6LLCXlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhDm0sTEvGX80VHe+tQAsoATWhW1IQRkmpr0mDPpYb4=;
 b=Hx4Kna/En+cTLFm8XWeFdZ8ULIIaQCmNzNEJNT59076yiRFmNVhXRrSxAohXTqA0I1eSab4t4hDsHNJB8Ihn6SWwMuuKv5bM/O/OXYP5Qjt7oJGEj3fDdeWT5s2tljd4vOM8p8cx6HmnIo0J6saynIMsjqSB7yzGTpcJf5zCYlKUQpwWRqaEcLmM58g8q415rQ4gutdd0yCU14Dkwus1hrh3fStabmXNJipCnG7ZDlIR7p5YzAW0L+Ie3wHblCSRA/TTHwQk1xXoV4QTuqs7mxg4atM0IRADAfykqHxdXoMdTSUG6Jr3ujNh+7kGkQlTbV/rWGHgUBiZ9ZZl5EfLCQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3012.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 12:31:41 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::a85b:a9b6:cb36:fa6%9]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 12:31:41 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Fangrui Song <maskray@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Andy
 Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Thread-Topic: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic
 relocations
Thread-Index: AQHYvKf5WSu8dJNxYk+eVO8ie3qNK63YW3QAgBwgtICASlSggA==
Date: Mon, 14 Nov 2022 12:31:41 +0000
Message-ID: <9ce45cd2-dcd8-11f8-e496-7efe3649e241@csgroup.eu>
References: <20220830193701.1702962-1-maskray@google.com>
 <20220910075316.no72fdyqjvunomwm@google.com>
 <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
In-Reply-To:  <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3012:EE_
x-ms-office365-filtering-correlation-id: d913b73c-14c6-4f72-c5a6-08dac63c2f39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  xY82cE7UtuCysWcfoOcH0kfUTIzfZaOUxBQOgJWhvH2INmwQzDS4z4i3h2ve8sBifQKxSF/Vk/z9Dwp6so77APm3KjLvCu/AH/o6LyLE4cz/JN+PES3dsswrDeBycu8BDjHncRhFpMYrDGYqdSX5BnmcTpJiUlrTZhwK6SdL4LEM0pk16pYrkbAyAM+Mmhw7dPs4E8HpWffm5Kqb7THe/gcwgxnDkFOKWLHbzJ8GHwB1297M+NeUwC4XltSbQEGts0ghyo7kR3+GauhNHrpEkPW53dmXjHV/Ix/OSjjyQt/GLITsFuHwy34md1j4Mz/9gN5EE/hPAw/3jE9rQgb7t30xCO/tHI+q4/oCHVmtJwILCHCoaOA1m+kxvKhB1lXer1zoEEcBR80+Q/T2dKdtdi4mLmapI96AKHRj5TrAXaeoWGHHGnIMdgdmfag2HsPT+dLw8PyOq5QCJcn+cLFpW3HfABnpP4qu/1LJ8YsRWdU+U/rhuRW+EdSlC7NC0OZBL7i0ZI9z46X+hp/j38+wq8tWpAtf5x/UOZzDDTzHoU3hfoVJftWXM/P2EyV3GA4UmAQhMTCiDXIMd8IzW51Ep3ye+yA7xTf1nNjf0auElRFg78DPnCndDAajoAtdCEtFBuxoppOAlhybGsomzGiJXQKXFrI0Pj9rxKAzz7cKh2Gz/iQFwc1x9cOY8vdWEBqub0IjLeiQcdsKXlpMEDV4AoTuY6hP9rczKObjxSoR1xu6gQlKwDgXyURl7s2AwOoafYdSb2uVPqkd7dLWXSf8cGEkznuR0PG4C+etPpuoy7ad2d3PZ6bef4bvtk9dIcYP2q2dJLD3di1Bo7/wwIKrIQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(136003)(366004)(346002)(396003)(451199015)(2906002)(2616005)(6506007)(316002)(54906003)(53546011)(4326008)(66476007)(8676002)(66946007)(41300700001)(83380400001)(91956017)(36756003)(76116006)(6512007)(26005)(5660300002)(7416002)(8936002)(186003)(66556008)(64756008)(66574015)(38070700005)(44832011)(122000001)(66446008)(31686004)(110136005)(86362001)(38100700002)(6486002)(478600001)(31696002)(71200400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?MWZoSlg2N0phZDBCWmV5WG5SbklCOHNsWjQ4cnYyL0tXODV6NjVCdGtZTlda?=
 =?utf-8?B?MWRHR1Z3anZtNnRvZzFHT1JWdnpBOU5PRTg1d0VBeXh2TVJjTzlTYlVqWSs4?=
 =?utf-8?B?TnhmZHlTOHNxSThQZ21Ba2NtRDVIL2tGbE1sdStjajFwZGdtQmZyNUliZm5K?=
 =?utf-8?B?Q1YvOHNDcUgvWFBhSEZicU9DakNzMVczTFJhaWt3ZkxOWG12bkdiYWVaUjdp?=
 =?utf-8?B?RDROaTlOeFhvTWU5TEJMdDducDhjYTVqYStieG5PS01LMEpxWUE2VmROT1Bu?=
 =?utf-8?B?QkI2Tm96ZCtuUGNULytvSjlTY1gyUlZzbWxWWmtVcU5GV2VUSmU5UEFKVkl2?=
 =?utf-8?B?SE4wSTRlV0lNbnR3OGFBZjIwK2hDZit1ck5BMzNmTVBDWi9vOExoN2gvZFBx?=
 =?utf-8?B?UXk2NkNYNE9Zd1J6NGdRVGRtb2pRdlRERVJiajRsNnRsb0Z5MmoxcG54RzNw?=
 =?utf-8?B?ZkpSeWRpQjdaMU95R2grbHo4MW5LSXlBeTdWUWl3Y1k4RXVDMjRTaGlpK3hm?=
 =?utf-8?B?RGNyYitXK2RFL3ZrN05CVVlVT1o2ckdWQ3VQaUdHbDhyaTVPZkZkWVE3WWRx?=
 =?utf-8?B?MFltY3VmSkVxMGw5QnBiZnZJOXZxTkRsRHNHVlBRYk00T2YzVWxOOFVadUtV?=
 =?utf-8?B?TkQ2QXFKM2ZoeFlTdVA4eTk2MXl6NVcva3JWSklqZ2ZjcEs4OHFmRzNKTzVM?=
 =?utf-8?B?NEMzYzJvYng3NkRRK0tnOUo3OFo2czlIamJYSDNLSFlLekhNT1RwdmxqL2Zn?=
 =?utf-8?B?V3gxd015Y2w3NHd3WEwwRWs1Q2ZQOElJUk5OQVBHOFBQRXRIWm1iWDA3SW5p?=
 =?utf-8?B?YUJGZjU1MGxCa2doLzdoNkVrWmpNOVFVZ3hOK3hSQWNBcmpVdEpvSHBPL24x?=
 =?utf-8?B?SlI1VEFqbEVwU2M5c05EcHlxbjdRcVVFNTZJYzBKbS85OGVrcU54a0RNUG9s?=
 =?utf-8?B?MHFUWlhwenhqNTVHMXJRU3pHNzI2YTRGMklYYUNZUGt0bTMxUkx2MkxzMTBF?=
 =?utf-8?B?MFM3MzZBVUFVRU54enJmQzVyd2pOdys4NWhXd0tPelQxWmlnN1crUDhwdGFy?=
 =?utf-8?B?N2RyWXptSjZWc29LaEtRT0cwNkh5VVJNN3l4MG53K0dhMmQ0OXVIMnlPUmRJ?=
 =?utf-8?B?ZXZ2dndLQ2YrVUxxVVZlNkFwTEYrMWUvRTZBNXU2T0tqQ2hUMy8rcnN6UEY5?=
 =?utf-8?B?cXE5N2UydlFTQ1Foc3VjMFI4enNVeElVU1RybEZ2YytaSlpEdndJMFR2Zkp6?=
 =?utf-8?B?bWg0blMzOU56ZnJ0TFVCTzdnN1h5TThyc0lKZjZOeGhxNWFrTEtzbkVwTi9S?=
 =?utf-8?B?bFBEbUt4eG1iUFI0eCtPcXVKbmxnWGl0RzBJNEdoOHBKLzBLbHFUZ1FnKzNL?=
 =?utf-8?B?MlV0UXBPRVNnYjdEeXYvdmxYWDFQTTlHNkRmdmhURlJYc2ZSTTZhSEJWSjdT?=
 =?utf-8?B?ZFd5L1VGNWU2Sk5zOEpsZFEyVHZXNHFkMXNFYlpSU1NZNHczWXJvRkxRQ3Ix?=
 =?utf-8?B?Vzc2RXUwYmd5SWtHNjRlWDFERTBtbnpkZjlsS05KdGJEUDBFMmtWTjhUbkg2?=
 =?utf-8?B?V09XTUZPUW4rYWNHUFZzTWlzb3NFWnRicUFTZnBSREpLaVZTdi82SC9mUUMw?=
 =?utf-8?B?RkpLcHJRcXQyVnNKU25hZ1VZUGxkbndnbUZNV0RNd1VaWEcyYUVualVXTkFy?=
 =?utf-8?B?V0dNNVZpQkJDQW52eExSa2c5eXJKYjJXUkVHNk9jcHZHTXF2emVicFEyQ29z?=
 =?utf-8?B?Z2hRblNjTEkrM0lVZEJBSDhDN1lZMUs2NEp0TldKbHFnbjNkTFdxUnpSZVJt?=
 =?utf-8?B?MFc4b2tFOG9QT0hFc0FrdXV0Z3lkSjcwQzhvN0FyYWh4aVZpN2xwVDJxV1lt?=
 =?utf-8?B?ZmtjcEZvbjAyWUQ2M3hFV2hpNUtGaWtINEVVR3FjRmJTYXloQ3UwZW8ycjIr?=
 =?utf-8?B?WlFpWW5Dck9LU3RDdUo2c1JRK2Jxb2pjVkFQd28rRUVmOVhuamR5bGprR0t0?=
 =?utf-8?B?bDcyL3UycWIrNC8wVFRuM0JzSHB3ME5RNHVYMFJWa1I1dkdFNmdkQ0hNZGxr?=
 =?utf-8?B?ODM4NFYvWHZmeklUNkpmWk5DNzRncFpSOFR1WWNvTndWUTlzRU1icUllSDA1?=
 =?utf-8?B?QU53V3l2MkErWUhIN0ZiSTl1cHBjajVTK3g3SmtaQ3BLU2EySzY4Uys3akRk?=
 =?utf-8?B?S0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBF60EFD1C52BA4091937D1B5429F0E8@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d913b73c-14c6-4f72-c5a6-08dac63c2f39
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 12:31:41.8530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nbFfF520J68hAcu3vHMJj55r3YndT+ibqCFWfFNT9WdC+9mjGurpADzbXIgYLl+0GINLxWzO95q1n8aPnKH1xmfTiWIrSc4EQbtUShGkWIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3012
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI4LzA5LzIwMjIgw6AgMDc6MjUsIEZhbmdydWkgU29uZyBhIMOpY3JpdMKgOg0KPiBP
biBTYXQsIFNlcCAxMCwgMjAyMiBhdCAxMjo1MyBBTSBGYW5ncnVpIFNvbmcgPG1hc2tyYXlAZ29v
Z2xlLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT24gMjAyMi0wOC0zMCwgRmFuZ3J1aSBTb25nIHdyb3Rl
Og0KPj4+IFRoZSBhY3R1YWwgaW50ZW50aW9uIGlzIHRoYXQgbm8gZHluYW1pYyByZWxvY2F0aW9u
IGV4aXN0cy4gSG93ZXZlciwgc29tZQ0KPj4+IEdOVSBsZCBwb3J0cyBwcm9kdWNlIHVubmVlZGVk
IFJfKl9OT05FLiAoSWYgYSBwb3J0IGlzIG5vdCBjYXJlIGVub3VnaCB0bw0KPj4+IGRldGVybWlu
ZSB0aGUgZXhhY3QgLnJlbFthXS5keW4gc2l6ZSwgdGhlIHRyYWlsaW5nIHplcm9zIGJlY29tZSBS
XypfTk9ORQ0KPj4+IHJlbG9jYXRpb25zLiBFLmcuIHBvd2VycGM2NGxlIGxkIGFzIG9mIDIuMzgg
aGFzIHRoZSBpc3N1ZSB3aXRoDQo+Pj4gZGVmY29uZmlnLikgUl8qX05PTkUgYXJlIGdlbmVyYWxs
eSBuby1vcCBpbiB0aGUgZHluYW1pYyBsb2FkZXJzLiBTbyBqdXN0DQo+Pj4gaWdub3JlIHRoZW0u
DQo+Pj4NCj4+PiBXaXRoIHRoZSBjaGFuZ2UsIHdlIGNhbiByZW1vdmUgQVJDSF9SRUxfVFlQRV9B
QlMuIEFSQ0hfUkVMX1RZUEVfQUJTIGlzIGENCj4+PiBiaXQgbWlzbm9tZXIgYXMgcG9ydHMgbWF5
IGNoZWNrIFJFTEFWRVRJVkUvR0xPQl9EQVQvSlVNUF9TTE9UIHdoaWNoIGFyZQ0KPj4+IG5vdCBj
YWxsZWQgImFic29sdXRlIHJlbG9jYXRpb25zIi4gKFRoZSBwYXRjaCBpcyBtb3RpdmF0ZWQgYnkg
dGhlIGFybTY0DQo+Pj4gcG9ydCBtaXNzaW5nIFJfQUFSQ0g2NF9SRUxBVElWRS4pDQo+Pj4NCj4+
PiBXaGlsZSBoZXJlLCByZXBsYWNlICJlZ3JlcCIgd2l0aCAiZ3JlcCIgYXMgImVncmVwIiBpcyBk
ZXByZWNhdGVkIGluIEdOVQ0KPj4+IGdyZXAgMy43Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
RmFuZ3J1aSBTb25nIDxtYXNrcmF5QGdvb2dsZS5jb20+DQo+Pj4gLS0tDQo+Pj4gWy4uLl0NCj4+
Pg0KPj4NCj4+IFBpbmcuDQo+IA0KPiBQaW5nXjIgOikNCg0KQ2FuIHlvdSBleHBsYWluIHdoaWNo
IEFSQ0hfUkVMX1RZUEVfQUJTIGNhbiBiZSByZW1vdmVkIHdpdGggdGhpcyBjaGFuZ2UgPw0KSG93
IGlzIHRoZSB2ZXJpZmljYXRpb24gZG9uZSBpZiBBUkNIX1JFTF9UWVBFX0FCUyBpcyByZW1vdmVk
ID8NCg==
