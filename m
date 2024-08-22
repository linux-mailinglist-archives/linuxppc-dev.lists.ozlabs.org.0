Return-Path: <linuxppc-dev+bounces-298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18595ADB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 08:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqD8b1Y3tz2xMW;
	Thu, 22 Aug 2024 16:39:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:260e::600" arc.chain=microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=yhydGEf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260e::600; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqD8Z4fwBz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 16:39:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cIoMPFDwr9WCDTl1a41szCRTbbTGXDpwmPi4FA8XcFbNGJEPcXSskrDLHUUx5hPN43HDemS1CDcTwGhRM5IHAu71+3GRxPPiCgDO/0VJp8SjZBdpKmcurckimYjUGZ4wjgTqKXatMhbOFeb5mVhuFPsDBF+TI1i1/2QB3m9poSuP2LHAT/LEPb+7ewVg+ZphgOwSCOmyYUjmEMGxIuxDLfboYpTQ2OLM5wH6jvefFwo34RHcrygqwym5b/2yw4P3xvpjRB3eAg2OS34hfnTB1WSRBe9sbgOqC6XXD93W2W/aKWg7+4rPBOHr0PywKGM8uKN1k47ofFCFp9CN/UNYjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZyaGALLsur7j8LTHomwbTgCX8BImeihkDfZTebAe+w=;
 b=MGEsFm6Z9GxnykApSdwZAl/qW2uwFPsQdBzRGcfH8gA/deqvl99dVMfdhGh/xvqprJ3vnYGEg/7lPRBowfd9AgP+vW6lKu9SRAM3cRHulIZW8U77U0V0s+X+001PLW1f+TKVJbflUK62YYih9Fc/LwZrVhTs8WywJTzioule8EjqoRg/Mp8fGhMRMUuTlwraHpjVrd+ve1iC9uYsVQype+yaYQxsM78+VCTqRpEi1K14GZCK3RhVCEyfGLoh4UpF74L0ecUsdZCH8dPyPAgNbKJamvHCl9Qtzk23HrC2Uw6+uQIQYggYCK3np0xsXQDcFb0L96TOeC3vt2kPFo8LYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZyaGALLsur7j8LTHomwbTgCX8BImeihkDfZTebAe+w=;
 b=yhydGEf/er/N8pKIwLg2qYAxAwIbU9C+Tbe5vpIo5S0E/WrkxNZls8RKJK7LF3NQlpb7vo69k/0mQGnpp9E6U19jjSVUzZPrnjWkksMusU1INXje8WrQcjc15SBwULkJ4lXU2oxb0qBSuAuxAdQBe2vNF/OEmUOb6IhQYG7gZ00VGNL7/Vhnsgf9hZH/KoVLDpg2badpfmE94qbtSvZyMLpAygpZJVC1oQhnGIA23ucmlaZ2GcujBtH2eK0drfaUJoiLRg5p4JRKj0845kL3bA/Cp4nRkhjeUuA62qEyCQvaDO5zLd9IY/qfb2Nm8+bXpctJHwvXoNMjwdIpIube+A==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AM7PR07MB6214.eurprd07.prod.outlook.com (2603:10a6:20b:13a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:39:33 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 06:39:33 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Christoph Hellwig <hch@lst.de>
CC: Christian Lamparter <christian.lamparter@isd.uni-stuttgart.de>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	Michael Ellerman <mpe@ellerman.id.au>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Stan Johnson <userm57@yahoo.com>, Finn Thain
	<fthain@linux-m68k.org>
Subject: Re: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Thread-Topic: [PATCH v2] powerpc: warn on emulation of dcbz instruction in
 kernel mode
Thread-Index: AQHa9Br4BDSvPR8oAEC/NyES9AV4E7IyvxcAgAACGQCAABKwgA==
Date: Thu, 22 Aug 2024 06:39:33 +0000
Message-ID: <e6acf664-5ebd-4273-9330-cbec283ede23@cs-soprasteria.com>
References:
 <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
 <17fa6450-6613-4c34-804b-e47246e7b39c@isd.uni-stuttgart.de>
 <9dbf73fe-a459-4956-8dbc-e919d9728f5e@cs-soprasteria.com>
 <20240822053238.GA2028@lst.de>
In-Reply-To: <20240822053238.GA2028@lst.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AM7PR07MB6214:EE_
x-ms-office365-filtering-correlation-id: 418be740-9aec-408b-2295-08dcc2752ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUpNUGFEVmtZelpROEdaWHZUZ0FXL24rY055WVJ0cHZxVkVnQlFWd2YrckFl?=
 =?utf-8?B?ejRBUlVOQlpuVXY2eTB5djhvRHgyRGlLVTFxOEFLZG4vTDRJemRlbEY3VWlF?=
 =?utf-8?B?RVNSMWx2SE8zaUMraElScmtDcjBpekZFb0Y5NHJERnZuak5JZkd5NDJKTVBY?=
 =?utf-8?B?NFNpUVJRdk9nSnM1c05xTEhPUG45NWxiK0JUOGtib2NPcmxQc05SeGF3bEEy?=
 =?utf-8?B?RzUrYVhBa1ZJV2RmRzhLaGZ4VDl6MXNMZHh0QzUyVmlhZmp5QXFQRkNvZW9j?=
 =?utf-8?B?clA0KzJvTnVPc001SkJOTUNVSEIwTzd6Um5PTzdSZysxbkRabS93alNYK2hl?=
 =?utf-8?B?Z2plMEQ2aUNaZVdDQjBsZnJZOXZCejIvbVgvUXQycEZVS0Q3NmlERWlTUWho?=
 =?utf-8?B?bzl0SlI2K1VkQTFzM25hekdPMFcxaG92MU00T0E4WnFJNlBXWmtSZGZqalhB?=
 =?utf-8?B?OGtTUFlNU1RHWkJFVE1JKzhJalM0dnUrT3JvZWRhOWgwMzl4TnB0NFFDdFBS?=
 =?utf-8?B?dmtlMDBjV2JuSGttZU5hRWNlekI3VERFeFhIbzB3LzN2V1p3MnI3UDF4c1hB?=
 =?utf-8?B?WDRIaU9DUnpNNm9NbEhZa3NRVXQwYkpKRGliRS9RWFJzWWZheU43cExvTVl3?=
 =?utf-8?B?TVo1eXRrRVNoVVVNekhzUmtvVzBWTzNuNkQvdlJCMm5CM1dxeXVyNUIrbzZL?=
 =?utf-8?B?TUs5SGlpTkF1RHlTUDR0Rk9yR1NWa2tQM3FTMlBhckdkWlVEclIxNzhqak83?=
 =?utf-8?B?TE5DbGRVOUVUK3B3dUxmbTdjWlhuSzI3WnB6SDNZNHlEK3lQeUxaTnlEMm8y?=
 =?utf-8?B?Qm0xMXpmTmhCQ3l1Z0VsOGhuNnVKUWJDVXpPMkx4bW5ka0xnSjNxNUV2V1Z0?=
 =?utf-8?B?eXcwV29HdjlCTFhIbTRsYmd6T1I3bDlYWTMzSUdDMDlrUDhEVUI3UlVsTXBK?=
 =?utf-8?B?S0R3NDFkYnBWc2hqdmd4YmVuekp5cW1mR0pkSkdJQlU0a1JpTjh6dzk3dHZz?=
 =?utf-8?B?S0Mrcjl3YjhYczZjODZQUHlMeDhBZ1M5N01xYzJBdFFZZXNTWUlsWjlEUHZy?=
 =?utf-8?B?K3FCSStmSEhsSTdhRkRTM2xVbndjNjZtakJqeW4wRCsyOUNRNy8wMFR2M3RB?=
 =?utf-8?B?Nm9rdnhZWGkxdWtnVzhOR1hDNTljY3REU0VRNE5LN20wSmt4NXZ1OXZFVTV6?=
 =?utf-8?B?M2xUWHRrN2VPUjBVL0xvdkVIQkZUcGQ5UnUrTjFmQ0pZZmYrL0J0ZWlPNjZO?=
 =?utf-8?B?U3lSY0xmMnlpOUFiQytablJlcllrTUdXV0VSc1lWazUzL2MvVDJrS29kUUM2?=
 =?utf-8?B?WjdmaHpqYlNDR0NPMXZzVUdCVnUvK2U5NU1oV2FSVHdyeWEzak1zeFZiaDVR?=
 =?utf-8?B?ZnBkV0kxVkdYQ1lEdzJvYTZiK2tuUzQ2UHB4TmNzQlZiRW9SUmVPOHpmQkRR?=
 =?utf-8?B?Mnd1NFFzaDgrbzQ3dHprT2hBY3dNY2o1TWxGbWgzZTNlSEt0dThXYm9DS2VW?=
 =?utf-8?B?UlhmVmFENXhTdC9ZZFpFWXN4SDFDWFp0WTB0dDNnMjdjWUtpRFYzenFWZWM0?=
 =?utf-8?B?RXJKdDBFMFR4Q3ZDVkl6MjZiK0tGek1BQUFoR3lzZGg2UVNLMGUvQU1BU2s0?=
 =?utf-8?B?QzN3VWc0NDhoOTJJQmdwUUZKQ2t5N21WR1RNWStyTFhWRWNIMlhvczB2MnVu?=
 =?utf-8?B?ZnpReS9POUhWeDB0eEZ6elRHV3pYOUVNMUpaTEtUTXMxNmIrQ3hZanJNRjds?=
 =?utf-8?B?alhMRUQ1SXFZTi9PZ3hVdXJFcTNyODhXemF3K214QWVEN1RvNUh0UEFLQlhS?=
 =?utf-8?B?b2c0dTdMMW1BRFI4b2JTMjNHb3BWbmYxaGZCdTN5ZXlMTWxTQzNIeERUNXJt?=
 =?utf-8?B?Q014WnBnRlg1cVdHeS91cENxVVpZbWJUbWh3cFlTdUhLaXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEo3QTZKS3BnaHEwSzlqRElKc3Bwd2VEdE9tdHZpNis1aXYzTDN2T2hXc0JL?=
 =?utf-8?B?YldVY2xNQkxjTW5wcTl1Z1JNeG83cExZT2o5UGlvSTBkbUkxNUJraGlZZUNX?=
 =?utf-8?B?VVVJblVqZUtqb01HL1htL0s3QU5kbEQyNmdjNG9ET0xOQ3gyUlcxcnhYSllk?=
 =?utf-8?B?WUd0dEZ3ajJnNjlpWGxlY3c3UDJlMURMUlhCQ1NHalpNcFljc01DUjEvUzJE?=
 =?utf-8?B?dThxQ3l6L2VTUktBbUh3blM5SlV5WG0reW1PK3FBTDF2cUdzaC9HRzdsSjdU?=
 =?utf-8?B?YTBua0pLZXhmWWdwc1NGV3RHbEVRVVhkRmtzWjJoWXJOMmJ0ekQwOHdQcHdL?=
 =?utf-8?B?dEZmOFBEZEVBa2EyNmFkbmRINkduaVR6QmNJVDFkODBINDh0MlhHSUpCZjc1?=
 =?utf-8?B?czk4NkhNUGJzblFsa3p5RE9VTW04d3FEcDNaRkZqR25QRWQ0V2JmRzgvRmlF?=
 =?utf-8?B?QytmVnlaMTJGbE80K1llV1l2dlNyRUxZbFJVcmJqQ054R1NMZTM2TU9lUVgx?=
 =?utf-8?B?TzJua0NhVzJBa0lsNnZZSjBPeEtOVGxLUzRpRVJzTWpFR0w3TWVQRmYrTnE1?=
 =?utf-8?B?Z3RNVVU5N3M3eGgvQVdqa0ltT3pldDQrQzJ1YXMvUmJ0UWc4STRvb2hOTGhp?=
 =?utf-8?B?bTZiUS83Vy9MRE5pbkdLb0o2a2pSL3BKWnZKcDZUTkRiMEJ4VlJaTVBhSW1Z?=
 =?utf-8?B?RkZhRW5LWjlqKzZzVDNOUXhmS04rbFlwdEJucmloWTU3dUZGVmgyTVdsS1Rn?=
 =?utf-8?B?V250SzhpMFIxOEMySTJiYW1jbTMzWlVVeGFqR0EyaXkzNFVQZEdKcTZNYTV5?=
 =?utf-8?B?bVhMMThTdHp0QzJWakxLT29NTy9jaGlaMTlGcktmV3ppc1JTR0Q1aUxmNFNM?=
 =?utf-8?B?UisveUovM1lGbWFnNHptb3pha2Npb2s5bGVObDh0RzJnZHpqRW5BWmFzWmFV?=
 =?utf-8?B?L1hnQ2NjSVM1L0paZUFMTVRlTlgwbnNwc0dGMVJrWkZ1L0Z1N2MvTnpnMkx4?=
 =?utf-8?B?OHJVYzQ4ZEpIbFRsSDNxc0NWVUFWM0s4SU9ueFlmWXQ5dUhNUy93VWlxajla?=
 =?utf-8?B?YWlzNTF3NFpFR001K1ZPbkEyNnYwSTRjeW90ZzYzTlpZY0ZvbUtVSjhCQ3Mz?=
 =?utf-8?B?UTlPUXhjTjZMdkxRV2xVYmtNMHQva0hVV3hXM0ZvRDJnMnFXT01nbmZqRCsw?=
 =?utf-8?B?cGVReGpMYW5NYkx6SU1SZGpSZTQxbW42bFZYRkV1VlF4N0RWblJkdDdTQ0JI?=
 =?utf-8?B?WDJGbHg4NUowc1RZbWRPV3BVWTdEWmpZYVBTR3dWQlRoVWszcDljUGJ6NHJi?=
 =?utf-8?B?RjZOV1ljWWZRZThYMzBxWlFmcVowblg3bnBjN2FFdlZQRElydGRsQU5YRzM2?=
 =?utf-8?B?S3BFZ0RQb2hXaHd4aDBLZWIvNmNoMXBIVzBoYUViYlh1QUh5WTJCaXEyd0lN?=
 =?utf-8?B?MHcxeHBkNTV4d2NpeWZNVU1GSXNDSTNKNkgwcVVINDZlRDNVeDJSUUZGMW9G?=
 =?utf-8?B?cU5Vb0dRV1dhcmlicmZUZFN0RERXN3FueXZ6YnRGYU51WDlZMFZEdmxBdU85?=
 =?utf-8?B?V3RqanRrMnBUZWR5a1JUWE1VdHlIMkRHUnhaTHFXNncxWnl2L2xaSGhreFd1?=
 =?utf-8?B?MlhVQmlITjh0b2VTOXNLREZWelBkbTZ4Vi9HUGIzRGE2Z1JTc1h2elFRRHc0?=
 =?utf-8?B?NzEvNkMxd0hnRTNPOHBpekJ3TkRmTmU5Mi9Sa2k5aktQYjZOek9hSnFmZTZt?=
 =?utf-8?B?YUVLZFMrYXgzaWplcXFTUzFjYWdGOVN5R2VlWmJrRWw4QTlJNmpUV1dPanEr?=
 =?utf-8?B?d2VPTlNSamtyQVNrV0piTzFBejlRMWhrNkYweDBwbGJTczF0d09pODhhSlZB?=
 =?utf-8?B?bG5hN0h1QnE3TFRYcUgvUFU5bkorM1NhbFJmQU5Bb2VOWWxWQi9IL1pZdWJO?=
 =?utf-8?B?MDJzZDJyaTJ6b1JtOGtRTnFRVlkvT2h3MDVjWFI4SDB0cWdRSlFNcU1pUlpT?=
 =?utf-8?B?NVZTU0VEVmdPdHhRMi9jbkdQWU5qOWNxdjFqZVNodGhTZGNGQVRaNzBqa1p2?=
 =?utf-8?B?d3JuMFdoT08vd044QUNmZVIxakw0SjNYSTgvQXcyN0VzeW1palFRc0xmc0JE?=
 =?utf-8?B?bnBXbmxsNnFwaFJQYjNJNGg1SUtDVVRqYmlIYmZ2VGRDcUorQzlNT252UXdS?=
 =?utf-8?Q?upAEYDY9RX/93SU0ZQDwPgs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B20A4D153FBD5D49B40239B2A357B9ED@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 418be740-9aec-408b-2295-08dcc2752ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2024 06:39:33.3984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/4ozI7I7ynjEfBnbRWZco8luwxzc+yy5QeIRpZfil+mmj0BCUe7VqFhMYArcw3X9XNult9LdCWPMeiVGQ6WJ0zBa2cPmMJx/QyXB3man/aNNZ4TZrXJy/xgbGVNUCTw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6214
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 88.124.70.171
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AM7PR07MB6214.eurprd07.prod.outlook.com

DQoNCkxlIDIyLzA4LzIwMjQgw6AgMDc6MzIsIENocmlzdG9waCBIZWxsd2lnIGEgw6ljcml0wqA6
DQo+IE9uIFRodSwgQXVnIDIyLCAyMDI0IGF0IDA1OjI1OjEwQU0gKzAwMDAsIExFUk9ZIENocmlz
dG9waGUgd3JvdGU6DQo+Pj4gYW5kIHRoaXMgcmVzdWx0cyBpbiBhIGNhbGwgdG8gZG1hX2RpcmVj
dF9hbGxvY2F0aW9uKCksIHdoaWNoIGhhcyBvbmUNCj4+PiBpbm5vY2VudCBsb29raW5nIG1lbXNl
dCgpOg0KPj4NCj4+DQo+PiBtZW1zZXQoKSBjYW4ndCBiZSB1c2VkIG9uIG5vbi1jYWNoZWQgbWVt
b3J5LCBtZW1zZXRfaW8oKSBoYXMgdG8gYmUgdXNlZA0KPj4gaW5zdGVhZC4NCj4gDQo+IE5vLCB3
ZSB1c2UgbWVtc2V0IG9uIHVuY2FjaGVkIG1lbW9yeSBhbGwgdGhlIHRpbWUuICBOb3RlIHRoYXQg
dW5jYWNoZWQNCj4gbWVtb3J5ICE9IF9faW9tZW0gbWVtb3J5LCBmb3Igd2hpY2ggeW91IERPIGhh
dmUgdG8gdXNlIG1lbXNldF9pby4NCj4gDQoNClRoZW4gd2UgaGF2ZSBhIHN1YmplY3QgaGVyZS4N
Cg0KcG93ZXJwYyBoYXMgYSBtYWdpYyBpbnN0cnVjdGlvbiAnZGNieicgd2hpY2ggY2xlYXJzIGEg
ZnVsbCBjYWNoZWxpbmUgaW4gDQpvbmUgZ28uIEl0IGlzIGZhciBtb3JlIGVmZmljaWVudCB0aGFu
IGEgbG9vcCB0byBzdG9yZSB6ZXJvcywgYW5kIHNpbmNlIA0KMjAxNSBtZW1zZXQoMCkgaGFzIGJl
ZW4gaW1wbGVtZW50ZWQgd2l0aCB0aGF0IGluc3RydWN0aW9uIChjb21taXQgDQo1YjJhMzJlODA2
MzQgKCJwb3dlcnBjLzMyOiBtZW1zZXQoMCk6IHVzZSBjYWNoZWFibGVfbWVtemVybyIpKQ0KDQpC
dXQgdGhhdCBpbnN0cnVjdGlvbiBnZW5lcmF0ZXMgYW4gYWxpZ25tZW50IGV4Y2VwdGlvbiB3aGVu
IHVzZWQgb24gDQpub24tY2FjaGVkIG1lbW9yeSAod2hldGhlciBpdCBpcyBSQU0gb3Igbm90IGRv
ZXNuJ3QgbWF0dGVyKS4gSXQgaXMgdGhlbiANCmVtdWxhdGVkIGJ5IHRoZSBrZXJuZWwgYnV0IGl0
IG9mIGNvdXJzZSBsZWFkcyB0byBhIHNlcmlvdXMgcGVyZm9ybWFuY2UgDQpkZWdyYWRhdGlvbiwg
aGVuY2UgdGhlIHdhcm5pbmcgYWRkZWQgYnkgY29tbWl0IGNiZTY1NGM3Nzk2MSAoInBvd2VycGM6
IA0Kd2FybiBvbiBlbXVsYXRpb24gb2YgZGNieiBpbnN0cnVjdGlvbiBpbiBrZXJuZWwgbW9kZSIp
LiBVbnRpbCBub3cgaXQgDQpoZWxwZWQgaWRlbnRpZnkgYW5kIGZpeCB1c2Ugb2YgbWVtc2V0KCkg
b24gSU8gbWVtb3J5Lg0KDQpCdXQgaWYgbWVtc2V0KCkgaXMgZXhwZWN0ZWQgdG8gYmUgdXNlZCB3
aXRoIG5vbi1jYWNoZWQgUkFNLCB0aGVuIEkgZG9uJ3QgDQprbm93IHdoYXQgdG8gZG8uIEFueSBz
dWdnZXN0aW9uID8NCg0KQ2hyaXN0b3BoZQ0K

