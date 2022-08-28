Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20D5A3C81
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 09:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFlSt1WZ5z3c5p
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Aug 2022 17:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UDxgQQMT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.50; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=UDxgQQMT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120050.outbound.protection.outlook.com [40.107.12.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFlS10DFyz2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 17:23:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDWSNgvUVN2YR7QHUrOIotAWng5isNoWp5S4gMAzpA2tP6rk0r7lSlNF9t5df29P5eQsET4CMl1h7okUwGs9JVChwdOZNAOn4FWHX0VZu0K/dVWfWdRpaS9qpAQO9JA2amqry0i6zyw2nmtppMA+piF84Mxqw2RhxBScBE5lxV5ZYORInXmGPThBGu/ZeJ7ocK/mSuD4JtFNFdPW6n2F3DhW9s5L9XVVF5zYRDtk+KWn94JZhpleqn1J2YRsbiVY5Fr+d4GoYAB+oRUWUzHAlsy3yVIyQfQIWJ7jxgkQJ4u7tiPwFba4N/tFmFMSPkUxyFsgxAKwiJEUYTD7bR+Wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQQckIG+rj1HYdS8U1V1XlNveVb0muKpox1Pj4hfevE=;
 b=iP1jFEMYOJGxXqLvrfff+PmmRlXQdsziY59/Mb2Ig9dDjMZUeRaNZi3X5NaaD6C5BhMCtmoyMx3tiE/UDc4d5wiurXkmuSbJPpMSeQQYVax3WpxDKPnOBT9DxfkhbpxXRfGCmnYG8HpaPwRqBaxWSkUBI2YtLXtI7qA64/h63RAWpvyHEyQwMR6WpzdXp5zGPJaFB6RbXiQU3Efg52NUiznQsJiy3PzAZbvumXNKU2i8hTebKBRK1HRj7xjO2UEfvtNpSCs0PQOJ+9ibhF3tMdHJTjkYKM+A4alpg4PI90lEfjLIr9GHJKQYqifXs/sFe6H2cZkYzrjcXWZDoO/zvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQQckIG+rj1HYdS8U1V1XlNveVb0muKpox1Pj4hfevE=;
 b=UDxgQQMTtnqr8KfClf1vtiCRKITnkEULzS1SOyoaaNGmBiXqhUXOELlxCAcd4vwhPUuO+wsxW3ihkWCrMEWM9yjJP/fCXyiypUyrjWnWrhZRhHr+K4pXWZzjl8nUAabPt3qKNqccUEoLzkbciKtFR/RSfFrTHDQmrDb3iVGa/KTdrq2JCVdRU9fZlV3xCpmsIfGwCa5Swud7M4EUPm0+3+nulqG+h3awpUxzibPfLRo4slcNYsc5kb+V6FLsTTCqwgmlkc+2roJlhxvFLhAKRftizxt83V4rPoRt+krLjJbxVFs8i6oBDAyudoER9j330/LSiEb/VoLLLvWdGBfhpA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1990.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Sun, 28 Aug
 2022 07:23:40 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Sun, 28 Aug 2022
 07:23:40 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>
Subject: Re: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Topic: [PATCH v2] powerpc/boot: Don't always pass -mcpu=powerpc when
 building 32-bit uImage
Thread-Index:  AQHYuhp7k37dhRsWc063Etn2tgkb7a3DAWGAgAABZwCAAA/KgIAAAPcAgAAGu4CAAM+2gA==
Date: Sun, 28 Aug 2022 07:23:39 +0000
Message-ID: <6bf326c6-0c48-fb53-bb5a-3a4c4f45f6d0@csgroup.eu>
References: <20220820105200.30425-1-pali@kernel.org>
 <20220827133900.16634-1-pali@kernel.org>
 <63f4bce4-7965-9bc6-2104-42e26acd0208@csgroup.eu>
 <20220827173610.7bdp7zychwu2u5i6@pali>
 <1da78077-a050-a391-a002-9e25eabc89d1@csgroup.eu>
 <20220827183608.ezljs2houkd32764@pali> <20220827190013.c3odakqxqnqgkzxm@pali>
In-Reply-To: <20220827190013.c3odakqxqnqgkzxm@pali>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c9463ac-e408-4c04-10d1-08da88c63af4
x-ms-traffictypediagnostic: MRZP264MB1990:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  hocvLWkXh7NrHg48dUNGB4qZMwdBDYc+Cl1nAH9aSsaUnKJBxPdG9RAz1dUJUUvYYYYuy8FEQzU9IgQiYMuUKjqIQlk4VLYSJCUtN0l2d4lP2U7ziSsYRMePC7CXvY/tOrQn90ZFchONBkuro4QGEnBK7cvi3yZuCOC90H/dZpHszaotypgOFFYEIB2X7kymKgvE9GU1oCgiFJZClPNrSXa+VHxtlibEfVOc2ZC/EUkUQrg0WlvBM1j7jodKPh5X3TtTkEotOeZMiOzhnJzoDgEqkbvjzWr4FcdoVQGZgvol8PTj+U6JBt9l+IxAQYa/AAxPft8arpqundxyq1cIOboXQp4/R2vR41O8amgVNWCWKNstZpssNPClUuJDXghjGEfOKHuCkRkRVv87iB5vxykKO2w2iO8p1IHZyLfrQjOmVYqvgWn7HpDhvawHvYksYA/qML9sAUuZJmgnM+SJUTrLp4gJ74nOVLyJb9KnRi+2jlGo+xa2SBaXmLqsqHtCdg85ao8zbM+D345zdYH1XHb8MIhwHCf07+Fx3K3rKatgtM5+Gz1G0+PNljWqw0mEN8f+2rRtAAhiberLT3zmdnPcUmCYE12EmiVgMjW/2+/Kbyeit6wsp1NQyB/jvIiqc+azSoRVSIjz+6oPpK1T9WrjRWlbHo5F8kB/NPKSvR8T6I4TT2zu4vmmLY8bfBBlzNKW0ja90aqKRgW43s//a8peOMtevNG1tfovl/e549znbcRyTaRbD/XCfgonmiUThdnDv6KF2zLRiweEIM3a2Qgvr/vfwGGUhtBaK9WXarL0ZwHxoOls4CnRaWIcKujCnTL1ju/rjKnYvoHhQOOzgA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39840400004)(366004)(136003)(376002)(346002)(26005)(6506007)(6512007)(6486002)(478600001)(41300700001)(71200400001)(66574015)(186003)(44832011)(2616005)(2906002)(66476007)(8936002)(5660300002)(54906003)(316002)(6916009)(4326008)(8676002)(64756008)(66446008)(66556008)(91956017)(76116006)(66946007)(38100700002)(86362001)(31696002)(38070700005)(31686004)(36756003)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?cnhHT0ovY2lxR1lNdFdNTmJubkxRODNodlZlV2ZyRTlDOFBxY1p6UThjRU9H?=
 =?utf-8?B?NHBQRDVldG83UEd2N2tkZ2VueGFpZ3Mvd2tqYmVaUlNXSkhiRUg3NCtLbVBD?=
 =?utf-8?B?TXRtL21HT3NVZUV3ZlpONE5OSGo1M2VLKzRuYXNaYWpTWWRCdzFUVFRQa1dx?=
 =?utf-8?B?enRXYXRrN0RKWVhFQTZwcFhmRWRiRzE4MEhTRitndml0WGxqT1hTTkxhV0gz?=
 =?utf-8?B?dDVac01sL3prNUgxUm9iRU1GNGF1OFlINmxycVdMazZHNDN0TWhMdDE5MzZt?=
 =?utf-8?B?emoxQktrZmJLSnRlV3ZBcElsUlk4OG9ybThkR0RTSGZ0OVhoR3ozeHlnYVVn?=
 =?utf-8?B?bThGT3RrbWF6RkV1b2dsbmRiMjhWZjZZQk5aRWNoSEVCNGNpb0xUVEYwMUhq?=
 =?utf-8?B?am1pL21YUkNYV3FQSHpCNmczN1BhMk1EL3c5cDNTMERaTW1TNmZuQUVFTXR3?=
 =?utf-8?B?ZWVTbUZzbzFCZVRyYVhUNThjeFY0c0h2SUd5amg5RXFKOXdsK0REcllySHZh?=
 =?utf-8?B?S3RhRE1mVmFGSENVMUxESlV4VjNiR1VpZ1BYUDhISnlWTkNQdXlONm9EWGQx?=
 =?utf-8?B?a3dadUNSa2t5T1d2aTRQazdZN2RNMUZYY3pHa1BTNlpsaGVuQ0lpY0c2Qncx?=
 =?utf-8?B?U3ZzQyszWXhYWk9qOTlBYjFFajRjYlNlM0V5OW9ESzY5bFNVVjl3aHQ1NklH?=
 =?utf-8?B?a3NjNFJQaVJnVDFNMDBhdWk0Z2UrZmtyU08wU1BGWXNMV2FXZks0cXlwejJY?=
 =?utf-8?B?b3BqbmtiOXp1K21SV2JRcElwZFRrL05qL2FPdVY4NWkyRm5iRkNmTjNYQTNL?=
 =?utf-8?B?Q2dTUDd3bWhNMmNSSEx2cjVwa0VnZWhVT0owL1FPdnE0emVlamdiclFYTmRC?=
 =?utf-8?B?aWd2OHdnaldCc2FhbHRkMGJSZUJzSnV3aGROSlFjdDJPSFZwamM0amVGQmVE?=
 =?utf-8?B?d1VWeUZHTTh5ZUlaOFAyeVRPY3Nlb1VBS0hIblFjQlVOZ21QTVFHNTFDb0VN?=
 =?utf-8?B?NGZRK3pXZGJWUG4zRWxmR0t4WUhGK3d0WTNSUkxOY2VyNkk4OWlmQkJEb3Bq?=
 =?utf-8?B?VHI3cmlnZmZ5bVpQdk1EODJXTEtMc2VNVXdiSldvSzFnUVBNeGNtdk5SaEZN?=
 =?utf-8?B?eEdYZitycGhkSkxSTFcwZzhFRkNtSW1PZ3dvbnlNMCtrazBrTEpPaU5TM3lJ?=
 =?utf-8?B?TUFKcnR1ZGJWRkljM1FBV0d5SDZxSmtyTGJsOHBmQkc4QzNncWFWdDJrVllK?=
 =?utf-8?B?TEdUeHd2WDg1YjZSWUVVN1krNVFvQjhFZXIrd3NQM0xEaU1vdUlnLytrU25P?=
 =?utf-8?B?ZkwvVHNKYVRlRlVqTm5mVTVyQmdFVHVRTkhUK1l5bURyOUtrV2JRTUZmM0Fh?=
 =?utf-8?B?U3BEczBSM2lqcnVGTDYrWjVCU0RUckxsbExIb0F0YThQNktObmw3eWtpNkQv?=
 =?utf-8?B?K0gwWjA3TVIxbUxTUUlNZzNXcnZ2cm1ldUZtb01UUGh0YmhoRVl4ajFKQ05U?=
 =?utf-8?B?amJXT0JLMEt4WGlMVExOSW5xSUR5dExFRE1nc0FVVFNOMFcvLzRMMGsyeTAx?=
 =?utf-8?B?aXhkQVZ5T21JZXhqU3lzamFqR2dVSjlSM0EyVUE0Y3FVQU8xajh4NXYxY2JD?=
 =?utf-8?B?OGQ0Q1o1ZGdvaFozUzZnejhOS055SkRia2ZuN2tab0hESE9ISjZLejFpV3Ax?=
 =?utf-8?B?Q011Ris2VFV0N3lmNG42Y3JaR0ppL0gvUS9wL2wvZE53OUEySitTK09vQ2Nk?=
 =?utf-8?B?S0tYU1NiNFlrL041WXlabUhxb1dCeUdMemVJQnd0MTRGVHlNaml6Tm1yVXpH?=
 =?utf-8?B?a3F1VVU1UzhRcGxaa2M1WFQ5R0NsanhsbEpCeFNxZ1RsR3RDU0V6L2NXRS81?=
 =?utf-8?B?Ymp4T3MwdUw4RTBPeHo0ZFp3Y3hodjZUNDk4NW5aQjNnQUZJYzdDOCtvK3NS?=
 =?utf-8?B?Y0VTV2N1NkFPY2pqeTNyMTI1dlE3WGcrWWVSTFZRcjY0bzQvSFV6SkpkWnoy?=
 =?utf-8?B?MTNyaW8rbW1ScWRuM2s0SXlCSVpEV21PeFg1M0pnWXpjWG9tYlIyNlVKaU54?=
 =?utf-8?B?enNzU0MrS3BZbVNpZkF4NFdmRTVrRVNLemZjVlVwUWwzRW5jcEo0Mks0c0JJ?=
 =?utf-8?B?WGxEUnhTb1JmQzB6NGdwZ0RPU0RoTFVXYWxidUxwSWUzQk1EOGlONEwzYVp3?=
 =?utf-8?B?dFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2534045A6337647AE9BFD6567508557@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9463ac-e408-4c04-10d1-08da88c63af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2022 07:23:39.9698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2hWBrvmGGjl0bi+PlafPce3xoElte6U6alIBEMlUOXJ8OWbdpGPegd/JP9/dJlEwgqsbH/avZDBoGlOtM2xI6DvobLyhx46ZdqwWbNLjfJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1990
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzA4LzIwMjIgw6AgMjE6MDAsIFBhbGkgUm9ow6FyIGEgw6ljcml0wqA6DQo+IE9u
IFNhdHVyZGF5IDI3IEF1Z3VzdCAyMDIyIDIwOjM2OjA4IFBhbGkgUm9ow6FyIHdyb3RlOg0KPj4g
T24gU2F0dXJkYXkgMjcgQXVndXN0IDIwMjIgMTg6MzI6NDIgQ2hyaXN0b3BoZSBMZXJveSB3cm90
ZToNCj4+PiBMZSAyNy8wOC8yMDIyIMOgIDE5OjM2LCBQYWxpIFJvaMOhciBhIMOpY3JpdMKgOg0K
Pj4+PiBPbiBTYXR1cmRheSAyNyBBdWd1c3QgMjAyMiAxNzozMToxMCBDaHJpc3RvcGhlIExlcm95
IHdyb3RlOg0KPj4+Pj4gTGUgMjcvMDgvMjAyMiDDoCAxNTozOSwgUGFsaSBSb2jDoXIgYSDDqWNy
aXTCoDoNCj4+Pj4+PiBGb3IgMzItYml0IHVJbWFnZSB0cnkgdG8gdXNlIENPTkZJR19UQVJHRVRf
Q1BVIG9wdGlvbiBmb3IgLW1jcHUuIFRoaXMgZml4ZXMNCj4+Pj4+PiBmb2xsb3dpbmcgY29tcGls
ZXIgZXJyb3Igd2hlbiBidWlsZGluZyBrZXJuZWwgd2l0aCBwb3dlcnBjIGU1MDAgU1BFIGNhcGFi
bGUNCj4+Pj4+PiBjcm9zcyBjb21waWxlcnM6DQo+Pj4+Pj4NCj4+Pj4+PiAgICAgICAgQk9PVEFT
ICBhcmNoL3Bvd2VycGMvYm9vdC9jcnQwLm8NCj4+Pj4+PiAgICAgIHBvd2VycGMtbGludXgtZ251
c3BlLWdjYzogZXJyb3I6IHVucmVjb2duaXplZCBhcmd1bWVudCBpbiBvcHRpb24g4oCYLW1jcHU9
cG93ZXJwY+KAmQ0KPj4+Pj4+ICAgICAgcG93ZXJwYy1saW51eC1nbnVzcGUtZ2NjOiBub3RlOiB2
YWxpZCBhcmd1bWVudHMgdG8g4oCYLW1jcHU94oCZIGFyZTogODU0MCA4NTQ4IG5hdGl2ZQ0KPj4+
Pj4+ICAgICAgbWFrZVsxXTogKioqIFthcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZToyMzE6IGFy
Y2gvcG93ZXJwYy9ib290L2NydDAub10gRXJyb3IgMQ0KPj4+Pj4+DQo+Pj4+Pj4gRm9yIDY0LWJp
dCB1SW1hZ2UgYW5kIDY0LWJpdCBrZXJuZWxzIHdpdGggMzItYml0IHVJbWFnZSB3cmFwcGVyIHRo
ZXJlIGlzIG5vDQo+Pj4+Pj4gY2hhbmdlLg0KPj4+Pj4+DQo+Pj4+Pj4gU2ltaWxhciBjaGFuZ2Ug
d2FzIGFscmVhZHkgaW50cm9kdWNlZCBmb3IgdGhlIG1haW4gcG93ZXJwYyBNYWtlZmlsZSBpbg0K
Pj4+Pj4+IGNvbW1pdCA0NDZjZGExYjIxZDkgKCJwb3dlcnBjLzMyOiBEb24ndCBhbHdheXMgcGFz
cyAtbWNwdT1wb3dlcnBjIHRvIHRoZQ0KPj4+Pj4+IGNvbXBpbGVyIikuDQo+Pj4+Pj4NCj4+Pj4+
PiBGaXhlczogNDBhNzU1ODRlNTI2ICgicG93ZXJwYy9ib290OiBCdWlsZCB3cmFwcGVyIGZvciBh
biBhcHByb3ByaWF0ZSBDUFUiKQ0KPj4+Pj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUGFsaSBSb2jDoXIgPHBhbGlAa2VybmVsLm9yZz4NCj4+Pj4+
PiAtLS0NCj4+Pj4+PiAgICAgYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUgfCA4ICsrKysrKysr
DQo+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4+Pj4+Pg0KPj4+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJw
Yy9ib290L01ha2VmaWxlDQo+Pj4+Pj4gaW5kZXggYTljZDJlYTRhODYxLi5mNTZhNWY5MGE1ZDgg
MTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvYXJjaC9wb3dlcnBjL2Jvb3QvTWFrZWZpbGUNCj4+Pj4+PiAr
KysgYi9hcmNoL3Bvd2VycGMvYm9vdC9NYWtlZmlsZQ0KPj4+Pj4+IEBAIC00NCw4ICs0NCwxNiBA
QCBlbHNlDQo+Pj4+Pj4gICAgIEJPT1RDRkxBR1MJKz0gLW02NCAtbWNwdT1wb3dlcnBjNjQNCj4+
Pj4+PiAgICAgZW5kaWYNCj4+Pj4+PiAgICAgZWxzZQ0KPj4+Pj4+ICtpZmRlZiBDT05GSUdfUFBD
MzINCj4+Pj4+PiAraWZkZWYgQ09ORklHX1RBUkdFVF9DUFVfQk9PTA0KPj4+Pj4+ICtCT09UQ0ZM
QUdTCSs9IC1tMzIgLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkNCj4+Pj4+PiArZWxzZQ0KPj4+
Pj4+ICtCT09UQ0ZMQUdTCSs9IC1tMzIgLW1jcHU9cG93ZXJwYw0KPj4+Pj4NCj4+Pj4+IFlvdSBj
YW4ndCBkbyB0aGF0LiBZb3UgZ2V0IGhlcmUgb25seSBpZiB1c2VyIGhhcyBzZWxlY3RlZA0KPj4+
Pj4gVE9PTENIQUlOX0RFRkFVTFRfQ1BVLCBpbiB3aGljaCBjYXNlIHlvdSBkb24ndCB3YW50IHRv
IGZvciAtbWNwdT1wb3dlcnBjLg0KPj4+Pg0KPj4+PiBTbyBkbyBJIHVuZGVyc3RhbmQgaXQgY29y
cmVjdGx5IHRoYXQgaW4gdGhpcyBicmFuY2ggSSBzaG91bGQgb21pdCAtbWNwdT1wb3dlcnBjPw0K
Pj4+DQo+Pj4gQ29ycmVjdC4NCj4+DQo+PiBPaywgSSB3aWxsIGZpeCBpdCBpbiB2My4NCj4+DQo+
Pj4+DQo+Pj4+PiAtbWNwdT1wb3dlcnBjIGlzIHNldCB3aGVuIHVzZXIgc2VsZWN0cyBDT05GSUdf
UE9XRVJQQ19DUFUsIGluIHdoaWNoIGNhc2UNCj4+Pj4+IENPTkZJR19UQVJHRVRfQ1BVX0JPT0wg
aXMgc2V0IGFzIHdlbGwuDQo+Pj4+Pg0KPj4+Pj4+ICtlbmRpZg0KPj4+Pj4+ICtlbHNlDQo+Pj4+
Pj4gICAgIEJPT1RDRkxBR1MJKz0gLW0zMiAtbWNwdT1wb3dlcnBjDQo+Pj4+Pg0KPj4+Pj4gU2Ft
ZSwgZm9yIFBQQzY0IEkgdGhpbmsgeW91IGRvbid0IHdhbnQgdGhhdCBlaXRoZXIsIHVubGVzcyB0
aGUNCj4+Pj4+IENPTkZJR19HRU5FUklDX0NQVSBoYXMgYmVlbiBzZWxlY3RlZCBpbiB3aGljaCBj
YXNlDQo+Pj4+PiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIG5vdCBzZXQuDQo+Pj4+Pg0KPj4+
Pj4gV2hlbiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIHNldCBmb3IgUFBDNjQgeW91IGFsc28g
d2FudA0KPj4+Pj4gLW1jcHU9JChDT05GSUdfVEFSR0VUX0NQVSkNCj4+Pj4NCj4+Pj4gSSB1bmRl
cnN0YW5kIHRoYXQgdGhpcyBicmFuY2ggaXMgY2FsbGVkIGZvciBQUEM2NCBidWlsZCB3aXRoIDMy
LWJpdA0KPj4+PiB1SW1hZ2Ugd3JhcHBlci4gU28gaW4gdGhpcyBjYXNlIHNob3VsZCBub3QgYmUg
dXNlZCBUQVJHRVRfQ1BVIGFzIGl0DQo+Pj4+IHdvdWxkIGJlIDY0LWJpdCBhbmQgbm90IDMyLWJp
dCBhcyByZXF1aXRlZCBmb3IgMzItYml0IHVJbWFnZSB3cmFwcGVyLg0KPj4+DQo+Pj4gV2h5ID8N
Cj4+Pg0KPj4+IC1tY3B1PWU2NTAwIC1tMzIgd29ya3MgYXMgZmFyIGFzIEkgY2FuIHNlZS4NCj4+
DQo+PiBIbS4uLiBJIGRpZCBub3Qga25vdyB0aGF0LiBPaywgaWYgeW91IHdhbnQgSSB3aWxsIHB1
dCBpdCBpbnRvDQo+PiAtbTMyIC1tY3B1PSQoQ09ORklHX1RBUkdFVF9DUFUpIGJyYW5jaCB0b28u
DQo+IA0KPiBBbmQgd2hlbiBDT05GSUdfVEFSR0VUX0NQVV9CT09MIGlzIG5vdCBzZXQgYnV0IENP
TkZJR19QUEM2NF9CT09UX1dSQVBQRVINCj4gaXMsIHNob3VsZCBiZSAtbWNwdT1wb3dlcnBjNjRs
ZSBvciAtbWNwdT1wb3dlcnBjNjQgc3RpbGwgcGFzc2VkPw0KDQpOb3Qgc3VyZSwgc28ga2VlcCBp
dCBsaWtlIHRoYXQsIHdpbGwgY2hhbmdlIGxhdGVyIGlmIG5lZWRlZC4NCg0KPiANCj4+Pj4NCj4+
Pj4gQW55d2F5LCBpbiB0aGlzIGNoYW5nZSBJJ20gdG91Y2hpbmcgb25seSBQUEMzMiBidWlsZCwg
c28gYWxsIFBQQzY0IHN0YXkNCj4+Pj4gYXMgaXQgd2FzIGJlZm9yZS4NCj4+Pj4NCj4+Pj4+PiAg
ICAgZW5kaWYNCj4+Pj4+PiArZW5kaWYNCj4+Pj4+PiAgICAgDQo+Pj4+Pj4gICAgIEJPT1RDRkxB
R1MJKz0gLWlzeXN0ZW0gJChzaGVsbCAkKEJPT1RDQykgLXByaW50LWZpbGUtbmFtZT1pbmNsdWRl
KQ0KPj4+Pj4+ICAgICA=
