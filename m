Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E1F498D337A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 11:46:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=H9OMX+Dg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4B35ZVYz79QN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 19:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=H9OMX+Dg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq49J2Kk6z3vZV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 19:39:46 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNtoUlNgCKIEmzt0Dc3LlUZy4XozFvgDd8F4fDz0TfBORiemakuL//dr9hELYwIBRi9KKubw6CT4/OLZFjqUtuJyjm4pNCemh0JkVoe8CPX+Godr/6KIiFwwu90z7dVxAe3dV+8IMQc8aRMfRSVxh00/rhqQG8C2WQkMWQZNDUKsAWQ6oqY7CCHLXqWzQGDRsZeAXb96Hbxa2rMAiP+A+abQFP9HPQfcuVKd+RICWaU6cYhYUjqnKye/ZW+AMia1WfQM0Vt51gnSBoz0im03cPgoK1b8pkJ/nOAxAnTAtxQZ2IhpppMc28iWDwA2sFT/B+qpht7PEVmzPBFuJdnTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A9OfcMcp5tszU3+JD1XwMW3km1UmE5ZYEAwMDD+w0ws=;
 b=Co9zZJX5HMP7ZxCVYaE02sce3vqg3hyz2P21G/jLqFqQgZAhaXvG2917s79RpCPq4wNxxm7vc3VmWAeluYw96b5aaRSTRkLCBLVyNG44dXm5bQV48hr//W7OET5ceMm+NWXWSKTOOSFBM65R/Dp2KjpjY9jMZp8pd2qweRKNBq8AxGMnuRF9FB1T4UDVUCGqNBJPjY7lvzIvGllyfVicLP3U8nyc4/NHqnT7/m3MwDagNB+AZKLU0RbThmwSlNdTupUxr0nwMUqbyzOR4qlb3d2tQMCwdLvZDG8Q1vFRPazB4urBD3gW8zS8Uw9F3n3CSg96BKionldXPDjAhTmpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9OfcMcp5tszU3+JD1XwMW3km1UmE5ZYEAwMDD+w0ws=;
 b=H9OMX+Dgv/vHKa63yDYVta23jCLTokYjVVH0dvScZYc98vUzfIuZXhvb+cpn316VyrFQN3cmbcpnypczITRf9v8KsZfl2DDnv+RUMm6FF0yGxVV0ZSASUWwzpEcAW2ikzBGK+mLRZVZUAhMwVPjykgaBVWcsKWcbIECaiYyUkQK0eKHKMpTjWU0dTYK32VhdNkwHsaKiHTpXfl5S96sCUB82QR8eIhbgJHYsYXXxFL8+YubFGifvHA+okEZTQ9c9MCVW1V0un9GU2vbua5+poaExSsIF8PHdd7ecL96+MqR7wBn/gErzUR11jISGQ2dDu2YSYw0sKeFJWeJ1yzVXYQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR0P264MB4890.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:4e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 09:39:19 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 09:39:19 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.com>
Subject: Re: [RFC PATCH v4 08/16] powerpc/8xx: Rework support for 8M pages
 using contiguous PTE entries
Thread-Topic: [RFC PATCH v4 08/16] powerpc/8xx: Rework support for 8M pages
 using contiguous PTE entries
Thread-Index: AQHasDoUObZkztk3OUysC6yIw8DEjLGt3MEAgAAa8QA=
Date: Wed, 29 May 2024 09:39:19 +0000
Message-ID: <fe6caf5a-785c-48ea-ae33-dbce6be442e6@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <c592d725af6c1a3b81090fd8b25676612430b24d.1716815901.git.christophe.leroy@csgroup.eu>
 <ZlbhLJF5w59BQIoK@localhost.localdomain>
In-Reply-To: <ZlbhLJF5w59BQIoK@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR0P264MB4890:EE_
x-ms-office365-filtering-correlation-id: 519b73a6-d7a2-44cc-be82-08dc7fc3369a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?NTEwZm9pSk5ocEVFS0t4bG9yQkg3cFp1VVNaTmFTNURUSi9OZkhKM2pEZ1dB?=
 =?utf-8?B?eUllcGFMcnl1YzRNSkJuaGV5bnpDTUFkeXR2YTVUbXlOckpSS3RqWG9abGN3?=
 =?utf-8?B?RThrZ3FvM0dTMjB0cHBldUZPOTdPcnlzaENqeHNkeC9ITHJqU2JyUHdvZWtv?=
 =?utf-8?B?SmZ0a2JmM1NtRU1NbUZlbXNlZU9NWmphV0tvajM2NUkvQkJsOG52eDF5Uk9E?=
 =?utf-8?B?NkJOTVNkTkR6ZzlrSnFKcTFPTlRvU3RKRXExQkdWcHZyYXVmczU0a05PTlJm?=
 =?utf-8?B?MXIxUzBac3JHSVZPUTVvUjEyNFZzVmJXczkvTVhVZlp1RStvMWFaajRFYXZG?=
 =?utf-8?B?N2Z6enNVbnQrRTU0UURXYmRnNU16ekU4aHNmbnpmbjBEWlQyUnlJSSt5MUNI?=
 =?utf-8?B?dzE5cWpvY0lpeUNJVGxJc05wZUxSQUFLbFZrUW9wYzN1WnFXWXVuNUdzSmUw?=
 =?utf-8?B?aTdGYklWUFRnVGFISEpFekhETFhuOStKdkFNTVYyd3JIQk00U3ZINzVacEQw?=
 =?utf-8?B?VHh1Nk4wRTNCblRCalBCY2pBR3h2VGNYSkVhMnJCT3RHWVJndTViU3RKNHNx?=
 =?utf-8?B?NWZFL1dLR2c3dzBkTk9mdmN0b1VsSGVyQWFTTFdXdHgrM244cTNVckM4ZElm?=
 =?utf-8?B?aGtMVXVjOEN6TkIzbUM1bnhVTUtZYVNWNVlGTHp2dVhxV1dXZy9GM3JBdG8y?=
 =?utf-8?B?RVBGcktjaGlXY05iNWl5U25pK0cvY2NjNHM2b3lBTSszenJVd0RXRkNjNGF6?=
 =?utf-8?B?Wm9LajdtdE1JaWp3NmxON1U3c2NaRUMxZnVkaVlidDN0M1ZiNTF1R0FtUjQr?=
 =?utf-8?B?S2IzbGJOTU5VU1JPeFlOaU9SY3UxeHoyUnJveXIvS09pWldJSy9vQjF1ODBl?=
 =?utf-8?B?WGNUc1JENGxRWkNPejI0U2ZIYUgyMGhORnlydVFBOVhycmI5bmlVVFQ5NTBa?=
 =?utf-8?B?Z1VUbkVaWWwva2xSSys1N2o0TUNqdWhlUUt4ajBOcDRiZVF3cHRycnBuem5w?=
 =?utf-8?B?WGVmaThFZjRmbXhjL2NzaUpReklxM2lVYjZjUjM0UDVpZGRKV2tYU2VhVTQx?=
 =?utf-8?B?SlhyZDNGVnc5MmFXem5WL3VDVGNKMncwVUFPMzRDUjdkSVZjbnlQdjdLMEk0?=
 =?utf-8?B?OGhUWDFiK0tDTGZQNlVwMVB5MFlGdHIwcXFpbDFNSlNZbkRRbVdndGo4TitW?=
 =?utf-8?B?eG8vM25uRmFhTFd3MUZHbHRjWTZzVXd2SE85UExyY2V3RWk5YUxKamgwS2xn?=
 =?utf-8?B?Y0tGK1NFQVhVa2IxWVQ5VW5nSkNwNjR0RWRIOTJrMSs3UlhydXdNcHo4RmlX?=
 =?utf-8?B?dTVUampYMEdZYVNwb2tNb0NyZ0RnR1Y1MFg4d0ZRRG15S3ZOdElKKytiOUhV?=
 =?utf-8?B?Z2JteSt6MHdYSjNoUzNvcnpyUE0wR3ZJTG9MbEhmK2ZnclY5VUNiYUk4Y3U2?=
 =?utf-8?B?bzZmVm4zQythd3hERkdwd3FVV1FlRTdXbjhLV21OWDhVSjhRd2dpQlJYYUNt?=
 =?utf-8?B?NTY5aHRRUWFMUEFRN3dzcHdnK05nSU1oUGVNVnVnMTh4YnVjNVJKOFgrblVN?=
 =?utf-8?B?cVQxZWpYd2tlMVFEZFpkZWp2UTQ1UVprN1lGSVZqNGZPdlBFSUtuRy9nalJC?=
 =?utf-8?B?c01rSXNXWGNiS3NuWjg1dU1WM0RvN2dybkhLWmgwbVM2dXg2RkpoSGdIZTY5?=
 =?utf-8?B?UTc1ZERTN0Vma0tKNEpqR2p5aEpxYU9BNU41M0lrSHNUWlhPaWxqM3Z4ZFpz?=
 =?utf-8?B?QTY1dGkxK0l6bGxRT1gwWU9zRWJIRlk2eW1adGdzTkpOVGVLUnRab2hUejZU?=
 =?utf-8?B?ZGY5MEQ0aTEvQ01SbHpKdz09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aC96OG9GQ3FnRVNsRllOY1M4aHlNbkd6VFQzT2Z4UG5sa3NrY3hHUmdTaWpR?=
 =?utf-8?B?YnF3M1NZNW1NeXV1VFA0U1RJU1IxbGNiN1dYZmJRTHdyMXVWdno5TDZzQi9i?=
 =?utf-8?B?VG1NaTBpR3BRVEwzT2cxcEJqYUp5dC9wM0J4RC9JTlpsZjFqdnZndDQ1MFBN?=
 =?utf-8?B?TG5POVEwSDhjQlE5SXVsazFlMWhJWFEzMFkvdEJ4UXE5ODB1RDg1QURwK1hP?=
 =?utf-8?B?aUJaQkNnNzJGUG9nWjdXYlRrQmI1S1NEMWdUVlNWM3BwQmR0WGtiRHQweWx2?=
 =?utf-8?B?MlpjdU9JZ1QzL0tMVTRJOG5BZGxBNEQ3TGNma2FCQ1JZREtsR2dhTVJOYjBE?=
 =?utf-8?B?ZlIrWm4rbHErYU82aU82NUxkdlVnTEVMMTFGbEpVbG5zbUVVMkxsT2VpM3FR?=
 =?utf-8?B?RS9vVk9MSjhVVDI5SFNFc1lLek9QbmRsc1BERDR4RnMySTVwSXNZdkhFR3dO?=
 =?utf-8?B?MXhXTkU4OFlUamx1cVRmWnBid0wwcmszbG0wdGNNVzVNaFdlVjArYm5EdnVK?=
 =?utf-8?B?eURKWjRKcTh6ODd0RnB2VXE0UXo4ZVRwZER2ZExCaFNYSjVJZ1BhcFQySWlj?=
 =?utf-8?B?cU1EQlJTeXVMUDFPU2pSdFljRTZmNnBQcUNtODB3WDMrT2tKUHdJSEx6S0Va?=
 =?utf-8?B?QUdQaFBXMW1zZlFwVWU0dEVhZWJYMnRIVEhCWWYrcE41NktnenlJWkh6ZUlT?=
 =?utf-8?B?cTBDNnkxelNBcWQvNEM4YmhTQjZ1WTJQUitxdlBhMnJ4bzRsbDVyVm1vZmhi?=
 =?utf-8?B?OGhURXcrZjBKMTl4RldweURkWFJjYzh5OHdHOWVhREZVZzkzMzdMMUcvZ3JB?=
 =?utf-8?B?YjU5NUwwVkZTVUJpT21XaU1KOC9CSDE1MkdQSGttdXhxeXk0VmFHcnVPb0xH?=
 =?utf-8?B?NFF5MCtoOFU4OUEvUkEwdzJmbUpxRFluZ3NUL0hOQXcxZWcyUVI2QkppM1pG?=
 =?utf-8?B?dTJUSWFORWI1V1p0Y0lSVU04RXd0S2MwSzRhRVprcm9HazUvZS9kVGxIL3dj?=
 =?utf-8?B?NkVGS2QzQ0FpMFhuTytFVFZNdnU5U1p3akNRVGZWL1huNXQxVHYyTDc1TE5p?=
 =?utf-8?B?ZWZrWEc3M1VOdFFzdloxdXlITWVGdktYYnM4Nkg3TlkwS09hZmh4QUdrN3hK?=
 =?utf-8?B?MzdEbU1mbTZqRVZ5T0FUcWRNSVhCTU5yMGV4eFFQOFZVaUZPcWRqbnNmUDRj?=
 =?utf-8?B?di9hODFPMnZra1hhSUFqVEljVjVkSTBiRGl1dUhoWkhjL3BSeVJUTUYvNlh4?=
 =?utf-8?B?V2xpZjVJYU5aZ1NIb3QzanpRS1E2Ym1JZTZTTHNpaGFtVFhNemRvbzJNeld4?=
 =?utf-8?B?S0I2UHlKWmZuSWhEM0VKcU5EMlhJRkwzRkNocGdqSVlEamZXQ0s0T25ibC9i?=
 =?utf-8?B?L1VmWVRObHVpNmlqWmo0NFgwNWdkUlN3WS9teVdaek5lWlZhMHNTSEZVVmpG?=
 =?utf-8?B?OU1DbmFwaVVOQjV2QXI1TFN2SWg1Z1VhTlhvVHlKOEM3VlUxQVVWRWdKZEsv?=
 =?utf-8?B?VkY4Y2NTblF3d2wvVmltckRPVXRPRlBNUExtVXdQUGs3NFNtOFd6NWVKeWVk?=
 =?utf-8?B?RzBKTkhqZzhPdm00ZS9iS0pFOWZTeTE4Zi9kalp1dGxhZUVPZG54V2s1Zmtl?=
 =?utf-8?B?VUxsZVhheGZubVF2aWxWSjk3SWpZMVhscE1zOUMrSHVzNW5SY2k5cG11YWpj?=
 =?utf-8?B?Nkh3VVdSaUp0bUFocEx5MnR0VlVxNmN2TjlBSjJrcmlUZ1hXNG0xb3RGS2Q4?=
 =?utf-8?B?dUc1RExvZHgxckRnZVpma2c4WXhWVjByVlRtek0rQ1FSQjRoUjgxcDhHYzF6?=
 =?utf-8?B?WWxad01vaWx3MjhtUW5pY0NmQnBNSUNyTDByZlBpa3ZUaVJNUHJ2NFFSdTR4?=
 =?utf-8?B?bG4wQUJYdVRNV3ZONy84a2RwOFZuVm9KMURDZU9lSFBxMkFKc3FJbnlrOUdz?=
 =?utf-8?B?YnVrOVg0Sk1GaC9HWG5HRDFnN05TMEFDWVRhRTZOYjNEYysxOFdhb3NCd3R1?=
 =?utf-8?B?VmVHMkFqY0FwMS9sOGdZUTY2NE5xL2hHSEc2L3JXemRRU0oyRTJTUzJET2RS?=
 =?utf-8?B?bzYwczFXSkNTVjBqb1hJVGhqa05oSDNIU1FnRnNwZHR5QkFnaXRMTTlQQUNF?=
 =?utf-8?Q?KGQjjlLqXkvPv2VBSbgRZLa/m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A2DE822CD7439449A0D59F85040271D@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 519b73a6-d7a2-44cc-be82-08dc7fc3369a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 09:39:19.0786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6HRTS6xIDgckIzD6uUnCJIOD8en7ppwu70fdWXW0/54npDHuzDscKAivE49jGkbbzrCIip0g/b+qf1sCGfHVTopfEUJarocdHePmP4kexp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR0P264MB4890
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA1LzIwMjQgw6AgMTA6MDIsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IFtWb3VzIG5lIHJlY2V2ZXogcGFzIHNvdXZlbnQgZGUgY291cnJpZXJzIGRlIG9zYWx2YWRvckBz
dXNlLmNvbS4gRD9jb3V2cmV6IHBvdXJxdW9pIGNlY2kgZXN0IGltcG9ydGFudCA/IGh0dHBzOi8v
YWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBNb24sIE1h
eSAyNywgMjAyNCBhdCAwMzozMDowNlBNICswMjAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0K
Pj4gSW4gb3JkZXIgdG8gZml0IGJldHRlciB3aXRoIHN0YW5kYXJkIExpbnV4IHBhZ2UgdGFibGVz
IGxheW91dCwgYWRkDQo+PiBzdXBwb3J0IGZvciA4TSBwYWdlcyB1c2luZyBjb250aWd1b3VzIFBU
RSBlbnRyaWVzIGluIGEgc3RhbmRhcmQNCj4+IHBhZ2UgdGFibGUuIFBhZ2UgdGFibGVzIHdpbGwg
dGhlbiBiZSBwb3B1bGF0ZWQgd2l0aCAxMDI0IHNpbWlsYXINCj4+IGVudHJpZXMgYW5kIHR3byBQ
TUQgZW50cmllcyB3aWxsIHBvaW50IHRvIHRoYXQgcGFnZSB0YWJsZS4NCj4+DQo+PiBUaGUgUE1E
IGVudHJpZXMgYWxzbyBnZXQgYSBmbGFnIHRvIHRlbGwgaXQgaXMgYWRkcmVzc2luZyBhbiA4TSBw
YWdlLA0KPj4gdGhpcyBpcyByZXF1aXJlZCBmb3IgdGhlIEhXIHRhYmxld2FsayBhc3Npc3RhbmNl
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVy
b3lAY3Nncm91cC5ldT4NCj4+IFJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9y
QHN1c2UuZGU+DQo+PiAtLS0NCj4gLi4uDQo+PiArI2RlZmluZSBfX0hBVkVfQVJDSF9IVUdFX1BU
RVBfR0VUDQo+PiArc3RhdGljIGlubGluZSBwdGVfdCBodWdlX3B0ZXBfZ2V0KHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwKQ0KPj4gK3sNCj4+ICsg
ICAgIGlmIChwdGVwX2lzXzhtX3BtZHAobW0sIGFkZHIsIHB0ZXApKQ0KPj4gKyAgICAgICAgICAg
ICBwdGVwID0gcHRlX29mZnNldF9rZXJuZWwoKHBtZF90ICopcHRlcCwgMCk7DQo+IA0KPiBZZXMs
IHlvdSBhcmUgcmlnaHQgdGhhdCB0aGlzIHNob3VsZCBoYXZlIGhhZCB0aGUgYWRkciBhbGlnbmVk
IGRvd24uDQo+IA0KPiBJIGNhbiBzcGVhayBmb3Igb3RoZXJzLCBidXQgZm9yIG1lIGl0IGlzIG1v
cmUgY2xlYXIgdG8gdGhpbmsgb2YgaXQgdGhpcyB3YXk6DQo+IA0KPiAxKSBjaGVjayBpZiBwdGVw
IHBvaW50cyB0byB0aGUgZmlyc3QgUE1EIGVudHJ5IGZvciBhZGRyZXNzDQo+IDIpIGlmIGl0IGRv
ZXMsIHdlIGtub3cgdGhhdCB0aGUgUE1EIGRlc2NyaWJlcyBhIDhNQiBodWdlcGFnZQ0KPiAzKSBy
ZXR1cm4gdGhlIFBNRA0KDQpCdXQgaXQgaXMgbm90IGV4YWN0bHkgdGhlIHdheSBJIHNlZSBpdCwg
bWF5YmUgSSdtIHdyb25nIGJ1dCBmcm9tIG15IA0KcG9pbnQgb2YgdmlldzoNCjEpIGNoZWNrIGlm
IHB0ZXAgcG9pbnRzIHRvIHRoZSBmaXJzdCBQTUQgZW50cnkgZm9yIGFkZHJlc3MNCjIpIGlmIGl0
IGRvZXMsIHdlIGtub3cgdGhhdCB0aGUgUE1EIHJlbGF0ZXMgdG8gYSA4TUIgaHVnZXBhZ2UNCjMp
IFJldHVybiB0aGUgZmlyc3QgUFRFIGluIHRoZSBwYWdlIHRhYmxlIHBvaW50ZWQgYnkgdGhlIHNh
aWQgUE1EIGVudHJ5Lg0KDQo+IA0KPiBUaGF0IGlzIHdoeSBJIHRob3VnaHQgdGhhdCBkaXJlY3Rs
eSBjYWxsaW5nIHBtZF9wYWdlX3ZhZGRyKCkgZ2F2ZSBhIG1vcmUgY2xlYXINCj4gb3ZlcnZpZXcu
DQo+IA0KPiBOb3csIGZlZWwgZnJlZSB0byBpZ25vcmUgdGhpcyBpZiB5b3UgdGhpbmsgdGhpcyBp
cyBub3QgY2xlYXIgb3IgYWRkcyBjb25mdXNpb24sDQo+IEkganVzdCB3YW50ZWQgdG8gZ2l2ZSBt
eSBpbnNpZ2h0IHJlZmxlY3Rpbmcgb24gd2hhdCBJIGNvbnNpZGVyZWQgbW9yZQ0KPiBsb2dpY2Fs
Lg0KDQpGb3IgbWUgdXNpbmcgcHRlX29mZnNldF9rZXJuZWwoKSBtYWtlIGl0IG1vcmUgY2xlYXIg
dGhhdCB3ZSB3YW50IGEgUFRFIA0KaW4gYSBwYWdlIHRhYmxlLCBhbmQgbm90IHNvbWUgcmF3IGlu
Zm9ybWF0aW9uIGF0IGEgZ2l2ZW4gYWRkcmVzcyBwb2ludGVkIA0KdG8gYnkgYSBodWdlLVBNRC4N
Cg0KQW0gSSB3cm9uZyA/DQoNCj4gDQo+IA0KPiAtLQ0KPiBPc2NhciBTYWx2YWRvcg0KPiBTVVNF
IExhYnMNCg==
