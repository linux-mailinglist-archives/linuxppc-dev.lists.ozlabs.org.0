Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC7587ACE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 12:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxrz75sG4z3c17
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 20:37:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mYKUJgSA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.52; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=mYKUJgSA;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90052.outbound.protection.outlook.com [40.107.9.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxryQ0nryz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 20:36:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGAFC4yjwK/DgIRExcsbmS1sbAsGOAGjQPvnj3GBo1Qz/8cRJjzdDePNlWRTPU7jNA9zaX4LBTSMpwx9SCc0mhE603HzdYMeaz8gLRpBlVVVswseRya+u7P5AO0omNegec1GbgvjUat1/geI+WcyrDf8nLnW4YOA/XsnRPudlxp5wBJeTJIII+R9b1Z5favktsr2hzDus8iYQVMB0gpl0vqkJmo2mJFMIh0oKVQ80a1BTq31D0pMmkPi4qVBMZyaGVpVv+JXOPyD+5iLg6dpH9u/fOks1MK5imys23001mW1Azw/R7dQr3ZRXdQKfqSRC2JtOLjYodlVxMVzRxgwzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HL524j6dt+K4ytSq8+S9cTz5dmoCeWEHPj14Nl0kI4s=;
 b=FLLyzGNj8CurMDREyAkAkxyd3aKVnjIra+LdF2TIFIOhqowrkH7vHoS1znJ1/sUDjPd9M/Sr7swq31CNTlsaMcp8XOiJPxqW+Hu2TaUv0Bs2OQuwrR1eYGoEBMueWP1vnxwLIZXPaBF8Y0pzNstUi4rhmU3pfycuRVVm8pErRZ9pmC17HJOFXPqMok90KzK9DNaOSXuQj50Qm5Ja8gLcmaOC0ggKNZidN7Pg4NIhO1mA38h2vOfQKpFRLkhLjYPHOAYohSaYnRyRj4n0LdaFrmKIUulFjq7Tti8Ri/sIp1syACnvvwCf5Z2Q5dgRn1tk31JHaWFNbtY8vU8pwAwgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HL524j6dt+K4ytSq8+S9cTz5dmoCeWEHPj14Nl0kI4s=;
 b=mYKUJgSAKoYF3gn3LfIvQ6GwA7ssmeRVWLYAwMAEM+SmC5HgIee53QuOaqA4/rH1q1yb/XVCd/IE8TsS6CV1rpb3EMDDSaE1fMN29u4+gBe/GgzgD8AfEpzX1e6gLwbok53lwCgEtyy9068CzDF5quMCS91uHF94ausIBQLD3uG5gvN+Ug5CyNUOb31fPjeOhomhPzY8yGqQlCvbEivLuOSwZmrLIAwc8YsaxMKXc6XKur5bZ5u5t57IwwH4p0VDWOHhLryDXcv8ldWIC+WSfAxtbsud/t/C3H3ouC39WAT0hxZ7mpDA27ru/UR+n1kXKjCNFWOqoMlK208+pSg7MQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB4196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:42::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10; Tue, 2 Aug
 2022 10:36:26 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e063:6eff:d302:8624%6]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 10:36:26 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Liam Howlett <liam.howlett@oracle.com>, "maple-tree@lists.infradead.org"
	<maple-tree@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v12 33/69] powerpc: remove mmap linked list walks
Thread-Topic: [PATCH v12 33/69] powerpc: remove mmap linked list walks
Thread-Index: AQHYm+FLXx8z6el5bEyF7TxQ/X9k762bf6uA
Date: Tue, 2 Aug 2022 10:36:26 +0000
Message-ID: <230eb1be-180e-997e-ca51-c67cfa2dcb72@csgroup.eu>
References: <20220720021727.17018-1-Liam.Howlett@oracle.com>
 <20220720021727.17018-34-Liam.Howlett@oracle.com>
In-Reply-To: <20220720021727.17018-34-Liam.Howlett@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ec7024b-e4b9-43df-38f8-08da7472da1d
x-ms-traffictypediagnostic: MR1P264MB4196:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  8iOqR8Rz8MTBLX5cbx/dunU4nIloNxxBSd4BuZP874e07LPGQoUwwxWLoPQf+kBaz8kFGrmljSaYgi9YHgJUtU/9qfRbAN8zcdIWujaiwy711DlGkoAO0FHe5S519lhZNngJFaRzQMezRzNFcSfRo2G+pjRh4Qv0AwHf6R1pyZZX1e0tUY233o0L/+P1D7kOS0foUwxGRK2auW/du514/K6cq9d/98/YSh0fHl+61o0An9xnvKgBALYx0lTtFtBa0sF2NL1V4p3LiFgmhpX9CgICUyoLonfqPjjD53/8nXGUrzY5nE2U0JQJk3Ptro6PV1/ZnGd45otE6B+dR5F8KK5hkTPBUEA5mtbjpJQvRCK3nqpRQmw1LGuBSAVYT8A3hz4EI3dZlqE+qEsXfOtfI4WNGxm87z4kgfYL/KTP85I7JR+ThnBFRu9341TKnUpAGqfR5VAqpG20VUj67+TMQMIpcUR23VJlhXXX2tXIT2s2vusvQObRQieWlipZiaBondyYFQg077OMl19hDTtyn+IgDxvXhi05Urh+N5l69k2S0m12WXYMkOxjAEHsisCdbih9d/lsq0BDZomwh0IPoKE4nTgfPZqnZNODNT2iCvPb7x+Qa3JoSSBIn1lalp+7EHhbQeBtcenRN+CoHaYKjvbVTTXlVm8FTdKyHy/JfCXfczHXERxT3vtgp4oT7X0XUDx+8FTWtcBRZyAf9OG5vqFGu8nQZH/+xEdkJaxkmH2u1l2hkz83yz90owc9FhPAs0qyRshCQ0xcsnTjfdoud9qSp2zFIuk9cl/kdp0uV5YDPUaopvS+3yR3y5XMG+6EItQBFhYckWX3I/3CuwNJIjlIg37eNva9KrTsAkcf/4+0N6Z61PW4AHTkkdmUv3tu0YI2RA7etCrT9lrNlXzasw==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(136003)(376002)(39850400004)(41300700001)(31686004)(2906002)(83380400001)(2616005)(54906003)(110136005)(86362001)(6506007)(122000001)(44832011)(36756003)(26005)(6512007)(38100700002)(186003)(6486002)(5660300002)(8676002)(71200400001)(66556008)(66476007)(66946007)(91956017)(8936002)(66446008)(64756008)(478600001)(4326008)(76116006)(66574015)(31696002)(316002)(38070700005)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b0VGTE1IWDV2dmZvTDNUZXBQMkNUcWhINzRQdFpURnUrdEVtb3JZRHBMMDhQ?=
 =?utf-8?B?U2pMSlZpQ0hiMzVQUzJXVHJxb0hPSlVjeGx5ZkhUanVrMzF5WFBnZjdLdkpP?=
 =?utf-8?B?UTRaTEw3SkR4MW9ucHd1K2xETW5XMitvbmV1WU5Hb1R5WE1MbFErcXFHU2ZH?=
 =?utf-8?B?Y001NkFQZnpEMEMwb20vbjNDbUlYWVZvZS9uSlRZOXdSajlPNXBBRjFOR2h4?=
 =?utf-8?B?ZzcwdWt3WFA3UGM2d1F2d0ltYmhBRHRGSEQwRklLK2tCazFOTWNJNXhzbHAr?=
 =?utf-8?B?MGw1TnNvN1REbkxlamQzTkpTYmMreTJjNklEY3ZUaWw4MmtOdnVBcjNrbW9L?=
 =?utf-8?B?VmQ4UHRxMFpiblM3RUI0czIwTG9HUVlpSnNqeHpUTWxJc1hRVmxOM2JjWTBa?=
 =?utf-8?B?U1FsUUdCY1VMUnJQanh0RHFSSW5FVk4wTk1QUkwxbVVKZmdmTGY3TnEwTytq?=
 =?utf-8?B?TnNTV1FUKzlvbmZXYWYvbUZDQzdFWEN0ckFqQjJvRWg0VG5wMXRCK3gxQnBq?=
 =?utf-8?B?c2tLOXkvRW10dm1kc2djRExxMGthMC9LRnJvem1oSVNHZHJWbUxKemVlRVhF?=
 =?utf-8?B?TXZHa3lwSFQvWDErRkwyM0dmOXhadHU5K2NMejlTYm04VWhjcWNPQThxd3lw?=
 =?utf-8?B?emYvUXFIdm9ndmVuNG1HVWRNNjBMSzEvR2RyVkpheTBJYk5vZkxSc2o4cUxu?=
 =?utf-8?B?Q0dRVkhHRWQ0QTJWWDZENlArL2piUGxmd0gxSzVmOEYyYmlzK09lUWNUYXY5?=
 =?utf-8?B?bFp4MEN6YVdjUDh1SmFVbnl0RTIzZ3dSd1hMSnp4djBnaEpxN2pxeXNMTG02?=
 =?utf-8?B?bEwvbEZqb1l2bE8vNCtKbFFqaDZoNU9lTVFsdTlDTHNzeEJlNDVrRDNzUElw?=
 =?utf-8?B?NVJzZzRDcENod05jZUJiNGxBd2tkRTU5YXZwZ1hZalNtVEdkL1lneXBST01G?=
 =?utf-8?B?RjVyZ2k2NWRDSXEyUzFYNW5GaEM1b0NpemR5M3orclhobGtpbndGWHoyOTdp?=
 =?utf-8?B?T0dJaEJnQ25CbTc0UmVRVVlnTmxsb0JxTGdrY1FMZFgyYXhvRHZWVzF6RzZk?=
 =?utf-8?B?YUYza09FTVU0SXg5UDRZNTRWNTFrS09CbzJWNTI4WmFhbWZsc2l2MTFSYU4v?=
 =?utf-8?B?dnRPYTJSNENmSERmM2JJSGZzTHdFRGxCZzlkek9LcWp5OFBpcllhdHBaa0M4?=
 =?utf-8?B?enQwcjBwNHJ3NHVEM1ZqL2Q2a2RqbmxyaDFEalk4alo2NE84aHFBL3RLcnhl?=
 =?utf-8?B?eXhTVDM5OUlRTjNvdWdwcy9LYVBKRHQzckpwUU5zRko4bU9rK0JRSlpERXZO?=
 =?utf-8?B?N3drUGxjYW1OSzFIV2VmQUZvTzVMT1BCdXF3eVZWNzBnZmhlY1k4clZIMnNQ?=
 =?utf-8?B?enJzeHFnYmJwbHFZbDllSjdqQko5ZGttOTlCU082NkN2N2xodlg3bDFYWmVC?=
 =?utf-8?B?OFk3UlFtVmhaQm9jNkFYZ0Q0RlM0UDQwa2dOOWhHOE9jZWMrZnUxNThBRzVM?=
 =?utf-8?B?WklSRzJQY2NYclpmTHo1c0ZLUjgwTHkrR3ZXdkpIdUlyLzcwQTQ5Y3RCa3VD?=
 =?utf-8?B?MzBidWVPcnhpemEraGlYSFRBamd3dnVQeklua1NDc3BDaVkvbFQ4YU1zL2dH?=
 =?utf-8?B?VHlIdVNjLzF4TFppRi9vZFR1MGVsSTU1cG15MjhVYldlQmRNVGVPMEJ4dEdq?=
 =?utf-8?B?QWZLa05yOS8wazdIb0ZMMVRnUmQ3RnZwZ1BBdnp4WFFlZkd5QkVtS1Ntc1cz?=
 =?utf-8?B?R1c1Q1UvZ1BRN3JGZzZSNFpJSlJmcXZzeVoxVk8ybWZYWmdXbkd2VHFNOUZ5?=
 =?utf-8?B?QkpRZmRqT0VqRm5TYkRrTGU4NFczK2VWbWdOdGZzenArakRQeUtoMjhaZUxi?=
 =?utf-8?B?TGUyam93T1U4RHZZaUhqQzJkUjBGQUJpdWxKMFBTdTAxdTBBRkpHZk1JTFlx?=
 =?utf-8?B?OFNMeEZHYjJiNXNTWXF3andYNVBUVVVScEY3bHNvUXpjcTBUUlJ2ZUtYNVVE?=
 =?utf-8?B?WEd6alFtcllwUUhtbVZuY0l5SGU3aXpVM01SaERnZllON2pOZHJVaXNHZEc2?=
 =?utf-8?B?TlNkQ3c0NGpsOVNDaDN2NUljS3haSEluZlpXWVB3K3RFZGZOemV4U2hLOWxB?=
 =?utf-8?B?N2NsdkM2cDN2Ny9Nd2R1RWJqaUI1SzVRYWhjOGtVYnhjUjB0WXoySWZJL2Vs?=
 =?utf-8?Q?Q+uL9AbtxBoag1wlISOvjvE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B580FCF06B8A134D9691DFFCDF491099@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec7024b-e4b9-43df-38f8-08da7472da1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 10:36:26.0476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XTzyKdjLgZLj203mpme1PVgp1JfK7Gig/uQP5uCTslCXwBDSSdXdxHu7b3SvCyiOLxNLxqcknLUUL65YyqZkOQkImBIV2OuiDEmyL1CLTa0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB4196
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Yu Zhao <yuzhao@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDIwLzA3LzIwMjIgw6AgMDQ6MTcsIExpYW0gSG93bGV0dCBhIMOpY3JpdMKgOg0KPiBG
cm9tOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPg0KPiAN
Cj4gVXNlIHRoZSBWTUEgaXRlcmF0b3IgaW5zdGVhZC4NCg0KQ2FuIHlvdSBwbGVhc2UgY29weSBw
b3dlcnBjIG1haW50YWluZXJzL3Jldmlld2VycyB3aGVuIHNlbmRpbmcgc3VjaCBhIA0KcGF0Y2gg
Pw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg0KPiANCj4gTGluazogaHR0cHM6Ly9sa21sLmtlcm5l
bC5vcmcvci8yMDIyMDUwNDAxMTM0NS42NjIyOTktMTgtTGlhbS5Ib3dsZXR0QG9yYWNsZS5jb20N
Cj4gTGluazogaHR0cHM6Ly9sa21sLmtlcm5lbC5vcmcvci8yMDIyMDYyMTIwNDYzMi4zMzcwMDQ5
LTM0LUxpYW0uSG93bGV0dEBvcmFjbGUuY29tDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgV2ls
Y294IChPcmFjbGUpIDx3aWxseUBpbmZyYWRlYWQub3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBMaWFt
IFIuIEhvd2xldHQgPExpYW0uSG93bGV0dEBPcmFjbGUuY29tPg0KPiBSZXZpZXdlZC1ieTogVmxh
c3RpbWlsIEJhYmthIDx2YmFia2FAc3VzZS5jej4NCj4gQ2M6IENhdGFsaW4gTWFyaW5hcyA8Y2F0
YWxpbi5tYXJpbmFzQGFybS5jb20+DQo+IENjOiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRo
YXQuY29tPg0KPiBDYzogU2VvbmdKYWUgUGFyayA8c2pAa2VybmVsLm9yZz4NCj4gQ2M6IFdpbGwg
RGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+DQo+IENjOiBEYXZpZGxvaHIgQnVlc28gPGRhdmVAc3Rn
b2xhYnMubmV0Pg0KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPg0KPiAtLS0NCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28uYyAgICAg
ICAgICAgICAgfCAgNiArKystLS0NCj4gICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzMzIvdGxiLmMg
ICAgICAgICAgfCAxMSArKysrKystLS0tLQ0KPiAgIGFyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9z
dWJwYWdlX3Byb3QuYyB8IDEzICsrLS0tLS0tLS0tLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cG93ZXJwYy9rZXJuZWwvdmRzby5jIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC92ZHNvLmMNCj4gaW5k
ZXggMGRhMjg3NTQ0MDU0Li45NGE4ZmE1MDE3YzMgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvdmRzby5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvdmRzby5jDQo+IEBA
IC0xMTMsMTggKzExMywxOCBAQCBzdHJ1Y3QgdmRzb19kYXRhICphcmNoX2dldF92ZHNvX2RhdGEo
dm9pZCAqdnZhcl9wYWdlKQ0KPiAgIGludCB2ZHNvX2pvaW5fdGltZW5zKHN0cnVjdCB0YXNrX3N0
cnVjdCAqdGFzaywgc3RydWN0IHRpbWVfbmFtZXNwYWNlICpucykNCj4gICB7DQo+ICAgCXN0cnVj
dCBtbV9zdHJ1Y3QgKm1tID0gdGFzay0+bW07DQo+ICsJVk1BX0lURVJBVE9SKHZtaSwgbW0sIDAp
Ow0KPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsNCj4gICANCj4gICAJbW1hcF9yZWFk
X2xvY2sobW0pOw0KPiAtDQo+IC0JZm9yICh2bWEgPSBtbS0+bW1hcDsgdm1hOyB2bWEgPSB2bWEt
PnZtX25leHQpIHsNCj4gKwlmb3JfZWFjaF92bWEodm1pLCB2bWEpIHsNCj4gICAJCXVuc2lnbmVk
IGxvbmcgc2l6ZSA9IHZtYS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydDsNCj4gICANCj4gICAJCWlm
ICh2bWFfaXNfc3BlY2lhbF9tYXBwaW5nKHZtYSwgJnZ2YXJfc3BlYykpDQo+ICAgCQkJemFwX3Bh
Z2VfcmFuZ2Uodm1hLCB2bWEtPnZtX3N0YXJ0LCBzaXplKTsNCj4gICAJfQ0KPiAtDQo+ICAgCW1t
YXBfcmVhZF91bmxvY2sobW0pOw0KPiArDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYyBiL2FyY2gvcG93ZXJw
Yy9tbS9ib29rM3MzMi90bGIuYw0KPiBpbmRleCAxOWYwZWY5NTBkNzcuLjlhZDZiNTZiZmVjOSAx
MDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2Jvb2szczMyL3RsYi5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9tbS9ib29rM3MzMi90bGIuYw0KPiBAQCAtODEsMTQgKzgxLDE1IEBAIEVYUE9S
VF9TWU1CT0woaGFzaF9fZmx1c2hfcmFuZ2UpOw0KPiAgIHZvaWQgaGFzaF9fZmx1c2hfdGxiX21t
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiAgIHsNCj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICptcDsNCj4gKwlWTUFfSVRFUkFUT1Iodm1pLCBtbSwgMCk7DQo+ICAgDQo+ICAgCS8qDQo+IC0J
ICogSXQgaXMgc2FmZSB0byBnbyBkb3duIHRoZSBtbSdzIGxpc3Qgb2Ygdm1hcyB3aGVuIGNhbGxl
ZA0KPiAtCSAqIGZyb20gZHVwX21tYXAsIGhvbGRpbmcgbW1hcF9sb2NrLiAgSXQgd291bGQgYWxz
byBiZSBzYWZlIGZyb20NCj4gLQkgKiB1bm1hcF9yZWdpb24gb3IgZXhpdF9tbWFwLCBidXQgbm90
IGZyb20gdm10cnVuY2F0ZSBvbiBTTVAgLQ0KPiAtCSAqIGJ1dCBpdCBzZWVtcyBkdXBfbW1hcCBp
cyB0aGUgb25seSBTTVAgY2FzZSB3aGljaCBnZXRzIGhlcmUuDQo+ICsJICogSXQgaXMgc2FmZSB0
byBpdGVyYXRlIHRoZSB2bWFzIHdoZW4gY2FsbGVkIGZyb20gZHVwX21tYXAsDQo+ICsJICogaG9s
ZGluZyBtbWFwX2xvY2suICBJdCB3b3VsZCBhbHNvIGJlIHNhZmUgZnJvbSB1bm1hcF9yZWdpb24N
Cj4gKwkgKiBvciBleGl0X21tYXAsIGJ1dCBub3QgZnJvbSB2bXRydW5jYXRlIG9uIFNNUCAtIGJ1
dCBpdCBzZWVtcw0KPiArCSAqIGR1cF9tbWFwIGlzIHRoZSBvbmx5IFNNUCBjYXNlIHdoaWNoIGdl
dHMgaGVyZS4NCj4gICAJICovDQo+IC0JZm9yIChtcCA9IG1tLT5tbWFwOyBtcCAhPSBOVUxMOyBt
cCA9IG1wLT52bV9uZXh0KQ0KPiArCWZvcl9lYWNoX3ZtYSh2bWksIG1wKQ0KPiAgIAkJaGFzaF9f
Zmx1c2hfcmFuZ2UobXAtPnZtX21tLCBtcC0+dm1fc3RhcnQsIG1wLT52bV9lbmQpOw0KPiAgIH0N
Cj4gICBFWFBPUlRfU1lNQk9MKGhhc2hfX2ZsdXNoX3RsYl9tbSk7DQo+IGRpZmYgLS1naXQgYS9h
cmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc3VicGFnZV9wcm90LmMgYi9hcmNoL3Bvd2VycGMvbW0v
Ym9vazNzNjQvc3VicGFnZV9wcm90LmMNCj4gaW5kZXggNjBjNmVhMTZhOTcyLi5kNzNiM2I0MTc2
ZTggMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9ib29rM3M2NC9zdWJwYWdlX3Byb3Qu
Yw0KPiArKysgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvc3VicGFnZV9wcm90LmMNCj4gQEAg
LTE0OSwyNCArMTQ5LDE1IEBAIHN0YXRpYyB2b2lkIHN1YnBhZ2VfbWFya192bWFfbm9odWdlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsDQo+ICAgCQkJCSAgICB1bnNp
Z25lZCBsb25nIGxlbikNCj4gICB7DQo+ICAgCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOw0K
PiArCVZNQV9JVEVSQVRPUih2bWksIG1tLCBhZGRyKTsNCj4gICANCj4gICAJLyoNCj4gICAJICog
V2UgZG9uJ3QgdHJ5IHRvbyBoYXJkLCB3ZSBqdXN0IG1hcmsgYWxsIHRoZSB2bWEgaW4gdGhhdCBy
YW5nZQ0KPiAgIAkgKiBWTV9OT0hVR0VQQUdFIGFuZCBzcGxpdCB0aGVtLg0KPiAgIAkgKi8NCj4g
LQl2bWEgPSBmaW5kX3ZtYShtbSwgYWRkcik7DQo+IC0JLyoNCj4gLQkgKiBJZiB0aGUgcmFuZ2Ug
aXMgaW4gdW5tYXBwZWQgcmFuZ2UsIGp1c3QgcmV0dXJuDQo+IC0JICovDQo+IC0JaWYgKHZtYSAm
JiAoKGFkZHIgKyBsZW4pIDw9IHZtYS0+dm1fc3RhcnQpKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4g
LQl3aGlsZSAodm1hKSB7DQo+IC0JCWlmICh2bWEtPnZtX3N0YXJ0ID49IChhZGRyICsgbGVuKSkN
Cj4gLQkJCWJyZWFrOw0KPiArCWZvcl9lYWNoX3ZtYV9yYW5nZSh2bWksIHZtYSwgYWRkciArIGxl
bikgew0KPiAgIAkJdm1hLT52bV9mbGFncyB8PSBWTV9OT0hVR0VQQUdFOw0KPiAgIAkJd2Fsa19w
YWdlX3ZtYSh2bWEsICZzdWJwYWdlX3dhbGtfb3BzLCBOVUxMKTsNCj4gLQkJdm1hID0gdm1hLT52
bV9uZXh0Ow0KPiAgIAl9DQo+ICAgfQ0KPiAgICNlbHNl
