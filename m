Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2661754730B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 11:08:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKsS5054dz3cgC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 19:08:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tMftKJXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::619; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=tMftKJXM;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on0619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKsRK0qKYz2xB1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 19:07:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEcXK+wnCR5exEXWIOWLGJQzjdM/E8jDscRG8aNBPnDIeVxc0BUTA2oNVQWCy6PWfgM3c8MsLp4+1I21BbRjWJKdBmGriNewAq//eTu7r2/BwkohJ15oCYxeQuV1OjZ827RbNn3E+t9mZj/3ev1jJGBNR2qZZR64gLTefDEyVw302h2qVcTMr7WkgoGwU6epNPOPoT8UzjrefHi7thh46sKk/YRrLi90f2Z6EgZfaqVt2f9f4l0d6az7cX7CrszAXMdV8a6XUn2dCs1Dwf1c+W/VdK4QdlQtE24hcnEeSWIpnYVh/edLI/hDKAXmcYu3MFPnjOm/A8kMSLGj8bzRZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9TvVJCRqHwPpaZqt0kJwLfirV4aD6kIA4Bnhw5ksrc=;
 b=CFgqT76NzE+XzF1TKbMVDYL/kKyRJnz2Yqb2kQaBZiVxLhEwkcr+CCxAGy/nzA06ao44FetHxJ/sUgei5yKDHvDo/iS6/Bbyp/cWaZ2G3r9RRTlZPD8+8FKXl5RlSk9s4PdlmExUmvI2aXtmRwJXAgz6b92VESHrjLGm06E7Wvs0JVLsXF4gr3DTIDefmqJAkyIpV1Xwe2/9dKOhIygYSeZ+3nx0w3fJdPuOpDRBr7olk14EnJFGnEXwkjG3YiyGLmpCqNFaNR0M5tXhsjg63y6vEpYayqmW3y3DQJ76DZbDymh/25Cr+LLAgZ65AypTBD//pWz//rYT3CwVPrCoNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9TvVJCRqHwPpaZqt0kJwLfirV4aD6kIA4Bnhw5ksrc=;
 b=tMftKJXMHq7LmXQAgScQUStT9HopqxPaF35qWgxj/xP/tsYuT+Zgn9XRkIQDxfRz33gG8bM86ctA5vBkDD75kgigOu6d66PiiR1an2NQBiUtgZyOodXx8SAp1f2qrxxfRP7E88uM2GhxAcw3eShA7T+Q6EKSjWXLaWVGrjc18/wHY1b4+m1jEtLcd4HeDaTg2xEluKMWLpQiHgvA1wr8PVH/2tvYP9SBlG70juk464j6K8kPTMACrLk4LoYqqitQmO4rbzoLMDsYLKiNCtxcM4VjgICKXlY5mbb2BCCl+bUIWdB8SuVphL2/fnGOaERD7KV2gx5Z8lNQc+tJuSvMZg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3225.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Sat, 11 Jun
 2022 09:07:02 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.016; Sat, 11 Jun 2022
 09:07:02 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Ariel Miculas <ariel.miculas@belden.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "christian.johannes@belden.com"
	<christian.johannes@belden.com>
Subject: Re: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Topic: [PATCH] powerpc/ptrace: Fix buffer overflow when handling
 PTRACE_PEEKUSER and PTRACE_POKEUSER
Thread-Index: AQHYfLtD1L0epwxqF02+tf7Oyl9A9K1J68MA
Date: Sat, 11 Jun 2022 09:07:02 +0000
Message-ID: <2aebbf5c-3754-4da1-9474-4106ddd3ab81@csgroup.eu>
References: <20220609095235.37863-1-ariel.miculas@belden.com>
In-Reply-To: <20220609095235.37863-1-ariel.miculas@belden.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 973b0e10-08e5-4ca6-001f-08da4b89bf9d
x-ms-traffictypediagnostic: MRZP264MB3225:EE_
x-microsoft-antispam-prvs:  <MRZP264MB322513A314B6888F3E7D6B63EDA99@MRZP264MB3225.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  auYTIuSteDfmjGIBjSQ829HHFeiqI6Ojf0NyZ0Vk5zXJJgmfjg5yVu0KgGre5UxKBipuGO/s0WS4lZjAM9pazjvxdUpMQPXetHsfPDTPjw6cU7rRtQ7YVoldEBKNYVG8aftEGrBJWT+NwvZ5TSOxFRfulUUkTvl2H68luiIsFW0c8+MFRA6XOl4rCbFvAjpsjdOEsfhz3/64L7PX3uqGTtcBcXMsNakgQeA8EhpXIdQsAxx0fYG03xjr7hW++elC/ts3V/ro7kmDIYZ/hcx/kcE6f/Kdor30dQSNUZ69KMokcED4DlVmG+LdcLXqaMQ3Jwqt45uX4M/Rpd7PAfsDbuppnJ3dvpifOGBq719M/0NSNHSgriedwMUOqPgJZWrZR5rg3XKSx4vmI5yeoDWp+08jryH2jutk3GX9aQ2bxyEAdQVYqnvxvyZdqeG8T9P7Vef2jpkLCLL96WAQKIOytiAzfO2Sl9cS41OLqi++0+cqU8Pf6pULyoRvBZKKjIe3h5WzQvrP81XAJILFI70jYgjCyPf2FcRh06Mtl3Ya6v5HTXMTAA0Qjf2F8MRxFzdv/PcBBhwA/8FTlHULp8mKGjsd4hpCJC8kSBPUDAuG9dmZV+bkoJF4s5maWT8ca1EfT/hVO3Q413y2hyeCqVJ/XIDZacX79Jjb06f3oM+lDPYHGDtZIXr+kpvCNg6aJXdo0RW0HuvRDf6vns4diYhM4QkMkgRVoa31NAzJi6wLiUQ8n7xow0KESTrLsr/RUGQ1Cc9pUSORYhkGqK7HLBsnn9P6VQF/9EzN/QiIey9xOugEQ20Y+MqyCpFTbX7dr5MvcEisiUXQmtFDkkfUCUPvEkh8SwsPY0ubu9XEff0cUiQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(83380400001)(71200400001)(5660300002)(44832011)(86362001)(6506007)(31696002)(508600001)(186003)(2906002)(122000001)(966005)(8936002)(6486002)(26005)(6512007)(38100700002)(8676002)(31686004)(316002)(110136005)(2616005)(36756003)(38070700005)(91956017)(66476007)(66446008)(66574015)(66556008)(76116006)(66946007)(64756008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TmNRUE1QV3R0ZUk2cTVnR2U2UkIzQ25Ld3Q2KzhsaXpSNjYzKzJHb0srcW03?=
 =?utf-8?B?b2lpcU5JaDZ2V2hEV29adWRkOFBqU3p1emxvK09nWlhVb3EwMTI5eWJCdTBs?=
 =?utf-8?B?NGVRSU15K2Z0S0xJTjNpNVgxZG1kanhqc1BjOURINVF4N09qcW9ZSnozVEFa?=
 =?utf-8?B?NHRwdnJYZ3M4YUxSQStsbGhhanNzYlpiRW1oZVdSMjRzZkhqUUlkanpqNCtk?=
 =?utf-8?B?ODEzRkZLQWlSQXdxTTI2bHhVc0lEdWY5QjlWbENaV2RKZXRiSDZnWHdwNkVH?=
 =?utf-8?B?bmVNejlZYW8xcE5mVERhK2dUakZyMXB1c1pDdWNmZUM0R0xFako4YjVkeU9H?=
 =?utf-8?B?RVdxNWh4eWpTdmdXQ1RMTk9MTWZzNnZETlZIK1ptZjJFdllJYkFuVkQ2OWpn?=
 =?utf-8?B?aEVXRHpkR3lmLy9VUnhjTGFoQlVBSngwbktPOW4zT29sM3B0RklMNjVOUi9E?=
 =?utf-8?B?WFV4akdwV0w2aHVOaEQ2YTFweFIra3pwN2p6VWRuMnc4MnV5WTIxTzFySXRz?=
 =?utf-8?B?am82MThoZmM1ejlYVUIrZE9jemJBZHNBeHVwTDlRV3Jhc21TaEVreTl3WnF4?=
 =?utf-8?B?WGZBYWRKeHlISTVBLzdjcWUrRmVaeDVMNHhObVE4UUFhemlXd3c2RHNVeVVv?=
 =?utf-8?B?S0FGbXpmYTM0cVI1OUxRaDJlc2V4RmJlME9pYmZ5cWhCM2JEdTB5L1Fjc3pP?=
 =?utf-8?B?RlNacG1vYS9JcU43MW10Ujk2clZ1YnVoSUdMZVhTOGN4VU56WE5YS2kyNUtO?=
 =?utf-8?B?OVk1VWZEb3ZHR3pua1U5dzN3R090U0NVOUIyK21oRkZqdlBvbVoyUXhBbW9Z?=
 =?utf-8?B?UmhvT3Y3T21nMDBlcU1OcS9EVExiRFJCLzQ0YW1jYWkzbTNIWTQydTJwUkU2?=
 =?utf-8?B?MWUxZHNhR21VMzhCT1Z5b2VPeHhkdm5tZWxWTzZzYzJWVUtYanRDcFRRbmh3?=
 =?utf-8?B?b0E4Y1V4OVFhaUR5L21tY0pycGxENWJudTRhY0xwR0hlVXNOSGJZL0ZUWktM?=
 =?utf-8?B?T1ZrTzFWUlBueTZSVll5RWpZbW9STEVQSEdBei9GUThDZHhGbkZUekRDSlVq?=
 =?utf-8?B?TmlpVjJ4a2JHdDJUZWRpQjlaYUh5R3pobmh1c3pDMzZraFpXY1BEaVVoVUo3?=
 =?utf-8?B?aWgvVk9vNUVnZDVHUDhaWE1KNll2enRiL0FEcEhOUjN1ekFnLzRzZTNpMHVT?=
 =?utf-8?B?Si93S0V3MkxRckllTlpWa3RDMDBCbmN3Q0NKUVF0ekNJWGVFNjdFdzVlaWhh?=
 =?utf-8?B?bEJSYUJkSnpBZWhnUi9vdVJYL0d0MFNCeStWVzA5MEc4VDM2OXh2MHlZNi9x?=
 =?utf-8?B?SmpDblp1RzhKSjNua3ZTU2s0c25wWWpLSElHMW9CU01GZktHNzU2akI1bUZ0?=
 =?utf-8?B?YThNM0VKZEpSZks3c25EalNqL05vSmtpbFZVQ0tDdmdsSzl3RHNVeHRQNFpq?=
 =?utf-8?B?OHJTclM5QVQ5WWsyL3hTSjAwbnN5eTRLMzVTYS9VV0dOdEFNeG1ZTXlDQzJE?=
 =?utf-8?B?R0JaWm1KemR4WkRLVjJONW5LeHVEbHRMa2h6OUdDSVIvYlFWdThKMFd0WXMw?=
 =?utf-8?B?RDRnN0JYUWl0eUF2VzdSMTBNdXhOLyswOUJRQ1B6K2I2VmVNVStRVjJzYU1i?=
 =?utf-8?B?S0ZVYVlibmxKTmFNNFU1UjYzWnpWa1RqcURhOUQyWGZvck5kS0l4VHBOd2M1?=
 =?utf-8?B?SVJpbTE3dUVqWXZOdUxZSXMzKy9yUG42RGJEbjJmei9Va2liZStZQ1FscXBq?=
 =?utf-8?B?cEZ6YjZiNU1uTXRUUnJLVzIrUTFtV1A0T0RzZm5COExUaVNHU2RCNnc1RndW?=
 =?utf-8?B?QnJPQmszMktqYS82MSs1akZieE11ejNaR2xibmRXbkhLZlpQU2NrbHdOUFhV?=
 =?utf-8?B?eUlDRHgxN1FBaXUxOG81aU5uMzkxSDQ5SFQveUwyU2xveVMzM25zNHVSWTZW?=
 =?utf-8?B?VmJ2bDVWU1MydzlYV2FDRkY1eWtSczY2YXdIRVlacEV4Z1lKcEQyS2xsVllT?=
 =?utf-8?B?RjFOMGlPUFNieVk4U2FHYU8zNERDQmNOb1UxTityeCsreE52WXR1S1ZDUTBi?=
 =?utf-8?B?MDZQLzhYSndVTEc4anR5aU10QytXTGhheWYxT085ZVpaV2NYYUU2bjFiQ3pQ?=
 =?utf-8?B?SFJFZWVnTm5JZTZUejd3SWErMDlkWGZRcTd4clRYaUh4ZXprOE5BaHBYOXY3?=
 =?utf-8?B?NE5vV0lrQXc2d3g0aWYrWVhPRHNFYUJaUVVjKzZGYkc1a25FUThvVHhRaFdy?=
 =?utf-8?B?aTUvamRSUTRmaVVjS1Jka2xTcEo2b2VjdlEyQ3kzZGR2Y1VLaXBhcFJwNEtO?=
 =?utf-8?B?UFZ4S2FhWWFjZWwvZFh6UXVhdDFwb0RGS0FUOGtVR09Tc2lXK0J5QW9ZNlpj?=
 =?utf-8?Q?/fG15i816HyOrKZopeiBpKvOhO3WeFl5lTbUh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7E9A1D083C12D4F8401F233FAF0054D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 973b0e10-08e5-4ca6-001f-08da4b89bf9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2022 09:07:02.3374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sWbEp/TRVgXtC7+Gn5Tteltyu1klJvuNk4tBQEymjDNSD+vCci9AsOPIWUDdZbRGjBX5s8WNjl15Gxrfh499bDiYuGI2GiuUVzE24cCy390=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3225
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA5LzA2LzIwMjIgw6AgMTE6NTIsIEFyaWVsIE1pY3VsYXMgYSDDqWNyaXTCoDoNCj4g
VGhpcyBmaXhlcyB0aGUgZ2Ric2VydmVyIGlzc3VlIG9uIFBQQzMyIGRlc2NyaWJlZCBoZXJlOg0K
PiBMaW5rOiBodHRwczovL2xpbnV4cHBjLWRldi5vemxhYnMubmFya2l2ZS5jb20vQzQ2RFJlazQv
ZGVidWctcHJvYmxlbXMtb24tcHBjLTgzeHgtdGFyZ2V0LWR1ZS10by1jaGFuZ2VkLXN0cnVjdC10
YXNrLXN0cnVjdA0KPiANCj4gT24gUFBDMzIsIHRoZSB1c2VyIHNwYWNlIGNvZGUgY29uc2lkZXJz
IHRoZSBmbG9hdGluZyBwb2ludCB0byBiZSBhbg0KPiBhcnJheSBvZiB1bnNpZ25lZCBpbnQgKDMy
IGJpdHMpIC0gdGhlIGluZGV4IHBhc3NlZCBpbiBpcyBiYXNlZCBvbg0KPiB0aGlzIGFzc3VtcHRp
b24uDQo+IA0KPiBmcF9zdGF0ZSBpcyBhIG1hdHJpeCBjb25zaXN0aW5nIG9mIDMyIGxpbmVzDQo+
IC8qIEZQIGFuZCBWU1ggMC0zMSByZWdpc3RlciBzZXQgLw0KPiBzdHJ1Y3QgdGhyZWFkX2ZwX3N0
YXRlIHsNCj4gdTY0IGZwclszMl1bVFNfRlBSV0lEVEhdIGF0dHJpYnV0ZSgoYWxpZ25lZCgxNikp
KTsNCj4gdTY0IGZwc2NyOyAvIEZsb2F0aW5nIHBvaW50IHN0YXR1cyAqLw0KPiB9Ow0KPiANCj4g
T24gUFBDMzIsIFBUX0ZQU0NSIGlzIGRlZmluZWQgYXM6IChQVF9GUFIwICsgMiozMiArIDEpDQo+
IA0KPiBUaGlzIG1lYW5zIHRoZSBmcHIgaW5kZXggdmFsaWRhdGlvbiBhbGxvd3MgYSByYW5nZSBm
cm9tIDAgdG8gNjUsIGxlYWRpbmcNCj4gdG8gb3V0LW9mLWJvdW5kcyBhcnJheSBhY2Nlc3MuIFRo
aXMgZW5kcyB1cCBjb3JydXB0aW5nDQo+IHRocmVhZHNfc3RydWN0LT5zdGF0ZSwgd2hpY2ggaG9s
ZHMgdGhlIHN0YXRlIG9mIHRoZSB0YXNrLiBUaHVzLCB0aHJlYWRzDQo+IGluY29ycmVjdGx5IHRy
YW5zaXRpb24gZnJvbSBhIHJ1bm5pbmcgc3RhdGUgdG8gYSB0cmFjZWQgc3RhdGUgYW5kIGdldA0K
PiBzdHVjayBpbiB0aGF0IHN0YXRlLg0KPiANCj4gT24gUFBDMzIgaXQncyBvayB0byBhc3N1bWUg
dGhhdCBUU19GUFJXSURUSCBpcyAxIGJlY2F1c2UgQ09ORklHX1ZTWCBpcw0KPiBQUEM2NCBzcGVj
aWZpYy4gVFNfRlBST0ZGU0VUIGNhbiBiZSBzYWZlbHkgaWdub3JlZCwgdGh1cyB0aGUgYXNzdW1w
dGlvbg0KPiB0aGF0IGZwciBpcyBhbiBhcnJheSBvZiAzMiBlbGVtZW50cyBvZiB0eXBlIHU2NCBo
b2xkcyB0cnVlLg0KPiANCj4gU29sdXRpb24gdGFrZW4gZnJvbSBhcmNoL3Bvd2VycGMva2VybmVs
L3B0cmFjZTMyLmMNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFyaWVsIE1pY3VsYXMgPGFyaWVsLm1p
Y3VsYXNAYmVsZGVuLmNvbT4NCj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL2tlcm5lbC9wdHJhY2Uv
cHRyYWNlLWZwdS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1mcHUuYyBiL2FyY2gvcG93ZXJw
Yy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1mcHUuYw0KPiBpbmRleCA1ZGNhMTkzNjEzMTYuLjkzNjk1
YWJiYmRmYiAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wdHJhY2UvcHRyYWNl
LWZwdS5jDQo+ICsrKyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvcHRyYWNlL3B0cmFjZS1mcHUuYw0K
PiBAQCAtNiw5ICs2LDE2IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgInB0cmFjZS1kZWNsLmgiDQo+
ICAgDQo+ICsjaWZkZWYgQ09ORklHX1BQQzMyDQo+ICsvKiBNYWNyb3MgdG8gd29ya291dCB0aGUg
Y29ycmVjdCBpbmRleCBmb3IgdGhlIEZQUiBpbiB0aGUgdGhyZWFkIHN0cnVjdCAqLw0KPiArI2Rl
ZmluZSBGUFJOVU1CRVIoaSkgKCgoaSkgLSBQVF9GUFIwKSA+PiAxKQ0KPiArI2RlZmluZSBGUFJI
QUxGKGkpICgoKGkpIC0gUFRfRlBSMCkgJiAxKQ0KPiArI2RlZmluZSBGUFJJTkRFWChpKSBUU19G
UFJXSURUSCAqIEZQUk5VTUJFUihpKSAqIDIgKyBGUFJIQUxGKGkpDQo+ICsjZW5kaWYNCg0KSSBj
YW4ndCBzZWUgdGhlIGJlbmVmaXQgb2Ygc3VjaCBtYWNyb3MgaWYgdGhleSBhcmUgb25seSBmb3Ig
UFBDMzIuDQoNCj4gKw0KPiAgIGludCBwdHJhY2VfZ2V0X2ZwcihzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KmNoaWxkLCBpbnQgaW5kZXgsIHVuc2lnbmVkIGxvbmcgKmRhdGEpDQo+ICAgew0KPiAtI2lmZGVm
IENPTkZJR19QUENfRlBVX1JFR1MNCj4gKyNpZiBkZWZpbmVkKENPTkZJR19QUENfRlBVX1JFR1Mp
ICYmICFkZWZpbmVkKENPTkZJR19QUEMzMikNCj4gICAJdW5zaWduZWQgaW50IGZwaWR4ID0gaW5k
ZXggLSBQVF9GUFIwOw0KPiAgICNlbmRpZg0KDQojaWZkZWZzIHNob3VsZCBiZSBhdm9pZGVkIGFz
IG11Y2ggYXMgcG9zc2libGUuDQoNCj4gICANCj4gQEAgLTE3LDEwICsyNCwyMCBAQCBpbnQgcHRy
YWNlX2dldF9mcHIoc3RydWN0IHRhc2tfc3RydWN0ICpjaGlsZCwgaW50IGluZGV4LCB1bnNpZ25l
ZCBsb25nICpkYXRhKQ0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfUFBDX0ZQVV9SRUdTDQo+ICAg
CWZsdXNoX2ZwX3RvX3RocmVhZChjaGlsZCk7DQo+ICsjaWZkZWYgQ09ORklHX1BQQzMyDQoNCkhl
cmUgeW91IGNvdWxkIHVzZSBJU19FTkFCTEVEKENPTkZJR19QUEMzMiksIGl0IHdvdWxkIGFsc28g
YXZvaWQgdGhlIA0KYWJvdmUgI2lmZGVmLg0KDQo+ICsJLyoNCj4gKwkgKiB0aGUgdXNlciBzcGFj
ZSBjb2RlIGNvbnNpZGVycyB0aGUgZmxvYXRpbmcgcG9pbnQNCj4gKwkgKiB0byBiZSBhbiBhcnJh
eSBvZiB1bnNpZ25lZCBpbnQgKDMyIGJpdHMpIC0gdGhlDQo+ICsJICogaW5kZXggcGFzc2VkIGlu
IGlzIGJhc2VkIG9uIHRoaXMgYXNzdW1wdGlvbi4NCj4gKwkgKi8NCj4gKwkqZGF0YSA9ICgodW5z
aWduZWQgaW50ICopY2hpbGQtPnRocmVhZC5mcF9zdGF0ZS5mcHIpDQo+ICsJCVtGUFJJTkRFWChp
bmRleCldOw0KDQppZiBJIHVuZGVyc3RhbmQgRlBSSU5ERVgoaW5kZXgpIGNvcnJlY3RseSwgYXQg
dGhlIGVuZCB3ZSBoYXZlIA0KRlBSSU5ERVgoaSkgPT0gaSwgc28gSSBjYW4ndCBzZWUgdGhlIHBv
aW50Lg0KDQpNaWNoYWVsJ3MgcGF0Y2ggc2VlbXMgZWFzaWVyIHRvIHVuZGVyc3RhbmQuDQoNCkkg
dGhpbmsgaWYgb25lIGRheSB3ZSB3YW50IHNvbWV0aGluZyBjb21tb24gdG8gcHBjMzIgYW5kIHBw
YzY0LCB3ZSBuZWVkIA0KdG8gdXNlIGEgbmV3IG1hY3JvIHNpbWlsYXIgdG8gVFNfRlBSKCkgYnV0
IHRoYXQgcHJvcGVybHkgdGFrZXMgcHBjMzIgDQppbnRvIGFjY291bnQuIFBheSBhdHRlbnRpb24g
dG8gbm90IGNoYW5nZSBUU19GUFIoKSBhcyBpdCBpcyB1c2VkIGluIA0Kb3RoZXIgcGxhY2VzIHdo
ZXJlIGl0IGlzIHZhbGlkIGZvciBib3RoIFBQQzMyIGFuZCBQUEM2NC4NCg0KDQo+ICsjZWxzZQ0K
PiAgIAlpZiAoZnBpZHggPCAoUFRfRlBTQ1IgLSBQVF9GUFIwKSkNCj4gICAJCW1lbWNweShkYXRh
LCAmY2hpbGQtPnRocmVhZC5UU19GUFIoZnBpZHgpLCBzaXplb2YobG9uZykpOw0KPiAgIAllbHNl
DQo+ICAgCQkqZGF0YSA9IGNoaWxkLT50aHJlYWQuZnBfc3RhdGUuZnBzY3I7DQo+ICsjZW5kaWYN
Cj4gICAjZWxzZQ0KPiAgIAkqZGF0YSA9IDA7DQo+ICAgI2VuZGlmDQo+IEBAIC0zMCw3ICs0Nyw3
IEBAIGludCBwdHJhY2VfZ2V0X2ZwcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKmNoaWxkLCBpbnQgaW5k
ZXgsIHVuc2lnbmVkIGxvbmcgKmRhdGEpDQo+ICAgDQo+ICAgaW50IHB0cmFjZV9wdXRfZnByKHN0
cnVjdCB0YXNrX3N0cnVjdCAqY2hpbGQsIGludCBpbmRleCwgdW5zaWduZWQgbG9uZyBkYXRhKQ0K
PiAgIHsNCj4gLSNpZmRlZiBDT05GSUdfUFBDX0ZQVV9SRUdTDQo+ICsjaWYgZGVmaW5lZChDT05G
SUdfUFBDX0ZQVV9SRUdTKSAmJiAhZGVmaW5lZChDT05GSUdfUFBDMzIpDQo+ICAgCXVuc2lnbmVk
IGludCBmcGlkeCA9IGluZGV4IC0gUFRfRlBSMDsNCj4gICAjZW5kaWYNCj4gICANCj4gQEAgLTM5
LDEwICs1NiwyMCBAQCBpbnQgcHRyYWNlX3B1dF9mcHIoc3RydWN0IHRhc2tfc3RydWN0ICpjaGls
ZCwgaW50IGluZGV4LCB1bnNpZ25lZCBsb25nIGRhdGEpDQo+ICAgDQo+ICAgI2lmZGVmIENPTkZJ
R19QUENfRlBVX1JFR1MNCj4gICAJZmx1c2hfZnBfdG9fdGhyZWFkKGNoaWxkKTsNCj4gKyNpZmRl
ZiBDT05GSUdfUFBDMzINCj4gKwkvKg0KPiArCSAqIHRoZSB1c2VyIHNwYWNlIGNvZGUgY29uc2lk
ZXJzIHRoZSBmbG9hdGluZyBwb2ludA0KPiArCSAqIHRvIGJlIGFuIGFycmF5IG9mIHVuc2lnbmVk
IGludCAoMzIgYml0cykgLSB0aGUNCj4gKwkgKiBpbmRleCBwYXNzZWQgaW4gaXMgYmFzZWQgb24g
dGhpcyBhc3N1bXB0aW9uLg0KPiArCSAqLw0KPiArCSgodW5zaWduZWQgaW50ICopY2hpbGQtPnRo
cmVhZC5mcF9zdGF0ZS5mcHIpDQo+ICsJCVtGUFJJTkRFWChpbmRleCldID0gZGF0YTsNCj4gKyNl
bHNlDQo+ICAgCWlmIChmcGlkeCA8IChQVF9GUFNDUiAtIFBUX0ZQUjApKQ0KPiAgIAkJbWVtY3B5
KCZjaGlsZC0+dGhyZWFkLlRTX0ZQUihmcGlkeCksICZkYXRhLCBzaXplb2YobG9uZykpOw0KPiAg
IAllbHNlDQo+ICAgCQljaGlsZC0+dGhyZWFkLmZwX3N0YXRlLmZwc2NyID0gZGF0YTsNCj4gKyNl
bmRpZg0KPiAgICNlbmRpZg0KPiAgIA0KPiAgIAlyZXR1cm4gMDs=
