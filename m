Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387D34D0016
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 14:31:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBzr40QZ9z3bdg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 00:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::602;
 helo=fra01-pr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 (mail-pr2fra01on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e18::602])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBzqW3J1fz30Mn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 00:30:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3VASNjEvM8IQiDlcuwAb68CpR1GKxUq1VQFSE5COYQ4ZDZUNkVzJv1xtjHRTZMAVhvUL+VZIMgyawlGUwvK4hnIpxvbKM7GUI1NBPmbDso8kbgNWoOHwEAJKKQ8jJ9KOndyO+GqGgniF51/JNcK3/1BZPlTwlt0UlzLV2/LFX5Fh0EJHKgJMxLbNT3F4Bf8KFje0BBSKAR5ft7C+xJPUPxz8AWSe59TYj/M/RKgOaHyZ1BlfXKps2HYc767VjAia16JnTLuftN+OE6pG88fb8EMhTp1mll47Ii+a+TI0nnRZkztCvNpj6CHC0uFN8hzKdx4f8RyTyXg4qxmSfcpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj7Ys1JDgTEF7Ml8cChvaf4fJjWrYic6c1BEEH4JfaM=;
 b=hqZaaUsuf9Mx2emmkAKdAi5/YFqazszCcGEZK3zRm1fzaTPaHn894ntwurb3DfySV+nZhcTEDD2DvF8wxxB4gKdzlXp5OuUWDS8EfZqN3qr48oLM0z0oYRzMLwW+PlyNovW4H56Du4nffnoHZO7Wz9PK+h/fh5hKvTzJ+eEhBTyu2co3m5qbbrBwBw1zyLDeGNlcaKj0j0ALvWtteetQtwztepRgDHEalg1y0QYN4TjCq0MExiOjrji7KyFtTwy72/xhQCKVScTA0pRBbOOhajjiaZYR2//+uKuNcZ2BPxoSaWkFE7T57iq+2BqyNAOsyqG3DRhX+LjytSHJ+q1PYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::7) by
 PAYP264MB4191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:115::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Mon, 7 Mar 2022 13:30:23 +0000
Received: from MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b4e1:6a58:710c:54f3]) by MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b4e1:6a58:710c:54f3%8]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:30:22 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Topic: [PATCH -next] powerpc/spufs: Fix build warning when
 CONFIG_PROC_FS=n
Thread-Index: AQHYMI/JaxR2O8+ZXk+GW3DAquAf+qyyybCAgAEeq4CAAAWEgA==
Date: Mon, 7 Mar 2022 13:30:22 +0000
Message-ID: <16b319ec-3d87-7ac1-6bc3-d6679e639426@csgroup.eu>
References: <20220305123116.26828-1-yuehaibing@huawei.com>
 <860002a4-4e52-c399-fda6-054fa64df3ce@csgroup.eu>
 <CAK8P3a2p+Yryg1y5h=kTLP72WGYc2d4qctFuW+opR6F=1uYJPw@mail.gmail.com>
In-Reply-To: <CAK8P3a2p+Yryg1y5h=kTLP72WGYc2d4qctFuW+opR6F=1uYJPw@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 071d888b-e77f-451e-4255-08da003ea1bb
x-ms-traffictypediagnostic: PAYP264MB4191:EE_
x-microsoft-antispam-prvs: <PAYP264MB41916AA7AC2F5D60B5FC22DDED089@PAYP264MB4191.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j262ZTi+QHUf1DWvLyB7wQUHK60gPKh0e7M5QeUYDPjBHuqMmB8tQxanS+erqO3ftM30PM/8WgI9UbktC4pi5D4mmgKVNo9KG9mWq90iPOHOO1WtK5HQ9ng+hcPSORPUzwVCS/kgGi47jRZJrsuiVXN9QG16ftj2IffM2fi8CSUnZoEecZJc7fLyNNVL/EoChXbJj+R8KvcA8IlX72Wl2RhgLOZzqRtf0PY4WGN7moZV6zQyqGF+LJ1bcYo9LDAkLBTKPRvm2QBM7VwJuUOsUdVRJexhbgFq8ed22qC5hFDkBw5UP8RR9nMqiW1SA4Wo17oDo0KqeOAMgVTQaIX00oV0AJMImXTMjE6w2s1Ho0oEixeys/ouNfW5X8f3DuBzKSim+PXyHjYozOusr1X4nj8rBenZd5dYmmutyHtPfu4BejyhhO1ZeTeYjyG2odIl0B3jCKIvNO5XCXok9C83ttOw0UttMXKfuFU38o7a9tShxOrrMLi4PfTxHDQwgPGdygJnRpnk2v3yBqbsB+DBgPTYH+ovIW/w6+Y0HttnlA3EMijZJNgVzcg3d86f0Ks1e3mG5H/rcsLDNxccYfUmCokb5zSzVuhBx5LDm9W2b6mkzAKXWdQmKRPK8VWSkcmC/qC4067SXrfayaWDP2TZy0zfbxmMjfxGecAnbM6no+i3ZWsgpp4VP6b27bH9W5xAMcuGjLGXmxEE5luE8SAaTwnIeFpwRe5mA7XPbdsDRGcuc2TO14A7CHpOKTja79WUEkaIp59pWCdFcYPKH3PvKQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(44832011)(71200400001)(8936002)(53546011)(5660300002)(83380400001)(6506007)(2616005)(2906002)(66574015)(86362001)(31696002)(26005)(186003)(4326008)(31686004)(6486002)(54906003)(91956017)(66446008)(76116006)(316002)(66476007)(66946007)(8676002)(64756008)(6916009)(66556008)(122000001)(508600001)(38070700005)(36756003)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djZ0SUtJS1pBNENtcmdSOTBGSGZHNFBOby95NUIxK2h3Sk1ONGhpMDhVL0Fj?=
 =?utf-8?B?Nmg2L2FoZEhRRnFTbGJiT0RlbTV5U0JPdkdNYUR1d1hLc3RkZUZndWV6REpY?=
 =?utf-8?B?SWZGUWtuMG1SQllmSmlDdi9ubGZvQWhCRE40YzlJMGhkRWZWVFBZaTQzeVNr?=
 =?utf-8?B?S1puVW4wYVNHNWRkNFBTVXBoeG9XWlk4aDBRWFRCUi9wc2FJZTRWTjhrM2sy?=
 =?utf-8?B?NUJBa25HWmhRTFM0M3hZREIvN0tib2xjY1VsNEgzQjc1dmF0VkZET2E3d3Ns?=
 =?utf-8?B?WkhPQkF6RjJkZExSSFFCbWtQWkQveHM1ZW1vMWRRay9qVUtWOU5rT3c2eGZj?=
 =?utf-8?B?TlViMmN4NVhaeDZXQm5uZ2NjS1BjTi94U1o0dCtWb0lqOW83clpoaURtZk94?=
 =?utf-8?B?YmdYRzFqT0RmcTBrd0hhcE8wZ1FDYmYyVkthcWtTZnBOUjRSbmVuTi93Rnlr?=
 =?utf-8?B?ckoxMENpRk1vdW9pYU8wbktEeGVtVHJBMVFxVUo2eENIQU1wUy80UTlDTEJL?=
 =?utf-8?B?M1N5NGJNSlNyNXVRRGRsZ294VHpLRXNmbzBvV2FTajVhUDEwb08vdEFldk5s?=
 =?utf-8?B?N0xVYW5JVmFSbjVROThYQ0JxZFlKOSt2S2g4Mk0xZ0VwRzhBN241Zm95SFJZ?=
 =?utf-8?B?clplRm9RZmFNWG5aVXZBOE93eFhHbXhacUhDeENja1ZJQ3hnL1RJbDJQa2FF?=
 =?utf-8?B?UnBKTEdtZmZTQ3ZlUjBNejlZRnBRSlFvT1pVNmVnVncvcmdmZGNCV3Rob2s2?=
 =?utf-8?B?QjFtTTFoRHZ3RDNoVjlvMERJeWxYR3U5MHh0NWl6RXBKV1ZGUG16b3ozaThI?=
 =?utf-8?B?Vm1KZWhaMkJiZ0xSZis4U2tJQ0grenJaYjlMVzNqdWFjaGNadmgzMFdKVlVC?=
 =?utf-8?B?TkwvM3B2ZkhiTkRrVmcxaXZwc2ZIUjFVN0xVSUZQaWN6dVVOTUtKMURyZExW?=
 =?utf-8?B?cnlmQ3A4ZUYvUzRBNzZscHc2RXVETkRkd1dIaUxHOEdXRGNhQmQ4Z2RpSEVP?=
 =?utf-8?B?T090OUIyU2EzNWVlWGUzRk5MaCtsbHJJZU15K2xjWWI1VzllV2RYY0JLNTNG?=
 =?utf-8?B?QVg3emROQUp3Q3dmYThtczRQeVFiS1kvNGdPbmJMQy9CUWdBd0IrWS9zbjE5?=
 =?utf-8?B?M2hENmF4eXFFbWFnNm5GSjNYVkpSL1RjWWJVMkJiNjgySTZaQVkveTNQeDF2?=
 =?utf-8?B?Q2h1SzllZGJLTWMyV2tNbnhrVEFpa1lxSkw0SFJjdzNaT3R0ZUlwNEJEb1cw?=
 =?utf-8?B?UVNEMGlORlFoR01XdW9YYzdYRk5uL1JKa1ZwQjh1TDc5SE11dkVPblc3ZkJL?=
 =?utf-8?B?bURUREE2YVExKzJXRm82ZnJudmVrNnVKb3JXOGNSbkIzZWtvZ21FY0dadGE3?=
 =?utf-8?B?SmxRd0Y2RVdKcTFpQTRSbjQ2ckhYOU1FRG5iYXhqRTA5UXhIT2VLTUcrSWFm?=
 =?utf-8?B?ejJoUENpVnlXMDBldWtuTnF6MU5qQ0NMdFZZY0ZyQ2FjbUlVR3FOL0tubm1j?=
 =?utf-8?B?ckRxWmpFc2NudDdxTFZGRHFPbVJDNHFFb3E4TndiU25DZGRwYXYrRFhUZXlN?=
 =?utf-8?B?TkVjZmVMY2twYW0wTUdEbUxWRHI0UksvSHhZUWZBVVNPOVJBbDBoRGp5QXBM?=
 =?utf-8?B?alRwUGwvM0gweHNyLzBybHd4eWxrTFRnQjgxU25IWEs4eXprV0psdmdCSTRz?=
 =?utf-8?B?OXhSeG9nY0VXMXljSk5XemVlNVQ1ZkhONEpIRUhQQXF6aEplTWtxNFRXNmRW?=
 =?utf-8?B?eWFBQmtUQlRtdWwrbXh2My9LTmVhV2pOa2VYeTVna0FGQmlOb3MwYmk0dVZY?=
 =?utf-8?B?R3Q5RDY2Q1FQM3UySmhpanNuQzBHTGkzcFAvQ1dEbUo4aXRUdmozYnhIOFRN?=
 =?utf-8?B?SmtVbHhlYVNDcFNmNlowMTlOeUl6bC9hZ2lKV0J4QWkxUElvOGltdmpXelZs?=
 =?utf-8?B?Y21BM0lkUENYVWpoNnZ4a1JNcXREdkF6SUJBanV6ejJYekN3T2IvMVFPZlk0?=
 =?utf-8?B?SmpkMXJJY3RpdlJWNFdNK2VIbGplNzdPMXRBdFBsTUVYYXkxeFVUc1NCODNy?=
 =?utf-8?B?eEp5M3FqaHpQOStqc2lRTmtxTlpRSG01NVk3TGs0VE9IS3Zyd0o2azZ1ZHJ5?=
 =?utf-8?B?RkdNU2Zyb2hQdG95alJYRTVueEZDc3FrRURGeDVQSUNOQjRvbDl1NUpKcFp4?=
 =?utf-8?B?VGpUaUdLV0dQL28wbzdYOTE1N1lxVkUvbUhaVTdETURWaDRKTTlnb3VVbTc4?=
 =?utf-8?Q?LbApPMiIV6TwFrwYiF0s1HnJ4f+Oqh8ryK6gwsNsVI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <876826C49C26A9458D50525A03BA00CF@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB2980.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 071d888b-e77f-451e-4255-08da003ea1bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 13:30:22.6785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oWA+eQoZktcE5ZqVwnTM8LzmXlPWWa8FXOb0NleMaByD7iHORjD4yae6ayasQ2ZmnDrmZoXye4GZe4m/FO02rTj8XvGWQZdpnMaUi6stpRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAYP264MB4191
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
Cc: YueHaibing <yuehaibing@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "paulus@samba.org" <paulus@samba.org>, "jk@ozlabs.org" <jk@ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzAzLzIwMjIgw6AgMTQ6MTAsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXTCoDoNCj4g
T24gU3VuLCBNYXIgNiwgMjAyMiBhdCA5OjA0IFBNIENocmlzdG9waGUgTGVyb3kNCj4gPGNocmlz
dG9waGUubGVyb3lAY3Nncm91cC5ldT4gd3JvdGU6DQo+PiBMZSAwNS8wMy8yMDIyIMOgIDEzOjMx
LCBZdWVIYWliaW5nIGEgw6ljcml0IDoNCj4+PiBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL2NlbGwv
c3B1ZnMvc2NoZWQuYzoxMDU1OjEyOiB3YXJuaW5nOiDigJhzaG93X3NwdV9sb2FkYXZn4oCZIGRl
ZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0NCj4+PiAgICBzdGF0aWMgaW50
IHNob3dfc3B1X2xvYWRhdmcoc3RydWN0IHNlcV9maWxlICpzLCB2b2lkICpwcml2YXRlKQ0KPj4+
ICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fg0KPj4+DQo+Pj4gTWFyayB0aGlzIGFzIF9f
bWF5YmVfdW51c2VkIHRvIGZpeCB0aGlzLg0KPj4NCj4+IE1hcmtpbmcgaXQgYXMgX19tYXliZV91
bnVzZWQgZG9lc24ndCBmaXggaXQuIEl0IGp1c3QgcHVzaGVzIHRoZSBkdXN0DQo+PiB1bmRlciB0
aGUgY2FycGV0Lg0KPj4NCj4+IHByb2NfY3JlYXRlX3NpbmdsZSBtYWNybyBzaG91bGQgYmUgZml4
IHRvIGF2b2lkIHRoYXQgd2FybmluZy4NCj4gDQo+IFdlIGRpc2N1c3NlZCB0aGF0IHdoZW4gcHJv
Y19jcmVhdGVfc2luZ2xlKCkgd2FzIGludHJvZHVjZWQsIGJ1dCBlbmRlZCB1cA0KPiBub3QgZG9p
bmcgaXQgdGhhdCB3YXkgYmVjYXVzZSB0aGVyZSB3ZXJlIGFscmVhZHkgYSBsb3Qgb2YgZmlsZXMg
dXNpbmcgYW4gI2lmZGVmDQo+IGFyb3VuZCB0aGUgZnVuY3Rpb24gZGVmaW5pdGlvbnMuIFRvIGNo
YW5nZSBpdCBiYWNrLCBvbmUgd291bGQgaGF2ZSB0byBhdWRpdA0KPiBldmVyeSB1c2VyIG9mIHBy
b2NfY3JlYXRlX3NpbmdsZSgpIGFuZCByZW1vdmUgdGhlICNpZmRlZnMuDQo+IA0KDQpGYWlyIGVu
b3VnaC4NCg0KSW4gdGhhdCBjYXNlLCBJJ2QgcHJlZmVyIHRvIGdvIGZvciBhICNpZmRlZiBhcyB3
ZWxsIGZvciANCnNob3dfc3B1X2xvYWRhdmcoKSBpbnN0ZWFkIG9mIGdvaW5nIGZvciBhIF9fbWF5
YmVfdW51c2VkIGZsYWcuDQoNCkNocmlzdG9waGU=
