Return-Path: <linuxppc-dev+bounces-16914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMFhEA/MlGluHwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:14:07 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61A14FE6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 21:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFrSq2Dhvz2yFb;
	Wed, 18 Feb 2026 07:14:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=67.231.152.227 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771359243;
	cv=pass; b=GQo6H225LBV2N7N+0EtPZ8SyPtPr2o7/nAOL9QfqjoZls4knwJssiIvdjwo8qj55HR+J+Av/AcKBy5SIfmbaNr1WHR4OM2Nv7QbDKJpE4cuoXBpH1I2lD17M4c9OigG6kn5nJjrh8JOzrheNbzFlsq1Zk3HYZgZxqpoeOZbfOdSNGGVjh6IjqUPbC8ICMKqxxZjMEaaCTMPLEzrUSBXPbXpgg1IEh18KvEpiu8VMrRwOlvVdnsd+TUp+dOZ7k1q1E/54D0uyi2ygBYUItKubdvid4tYvzyNgEgrga5L3iDLBSoj6Uxsu+jZOzvlQT5jyBWiLoVwEgbqxHhKEjmNf7g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771359243; c=relaxed/relaxed;
	bh=afA7c7NKt/h+voqSSXfQqn2lpwisBEFQRi1E6TDrdqk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bTfSd5ZJF2+PAMq8kQ6YxEoSDKhsNmYsFUoNwDbqD6CEjWSq8E52laSU0raxocpnsBDdRmvImgVkTYLDWwrsdHwfHii0C1xqPM5NXuknVB009ugK6TCsRg6i6CROMPRBiESWnpBYbsbEzF0Wcu9oRFULJL3v8/SlonPng6uRwuvEXq7U+/NynMnUud3Ogg3PJk+h744nZE/OC0EbIsrWPz1iGrZlVqq3vHj8OwnBHjaGdP0mmyWVQaUKI9zo2cmCnIUcL+y+HzOCvbxm0kiQrEAgtfSbpVQsGyPyWZpuKVH846oxJdXVMsRDQKYgb2WKp8x5izyjLXMNqFcAONpzVA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com; dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=KBoDIUpy; dkim-atps=neutral; spf=pass (client-ip=67.231.152.227; helo=mx0b-00103a01.pphosted.com; envelope-from=prvs=7508c0b572=mnassiri@ciena.com; receiver=lists.ozlabs.org) smtp.mailfrom=ciena.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ciena.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ciena.com header.i=@ciena.com header.a=rsa-sha256 header.s=06252019 header.b=KBoDIUpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ciena.com (client-ip=67.231.152.227; helo=mx0b-00103a01.pphosted.com; envelope-from=prvs=7508c0b572=mnassiri@ciena.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 186 seconds by postgrey-1.37 at boromir; Wed, 18 Feb 2026 07:14:02 AEDT
Received: from mx0b-00103a01.pphosted.com (mx0b-00103a01.pphosted.com [67.231.152.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFrSp2Wccz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 07:14:01 +1100 (AEDT)
Received: from pps.filterd (m0222748.ppops.net [127.0.0.1])
	by mx0a-00103a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGYu2U2136144;
	Tue, 17 Feb 2026 15:10:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ciena.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=06252019; bh=afA7c7NKt/h+voqSSXfQqn2
	lpwisBEFQRi1E6TDrdqk=; b=KBoDIUpyQlYzXAQ8JobPXgOAF5DQ+5TwepZZcLf
	0PzNeR9kcy6Cv+4ddG+19USYIs2dRAbBbWGV/tIjna5yIhBMg+dO2XXlf5bd/OVS
	o3cyus+gaR+1tZYEHRyPQRjXnhJQZRm+jAdt7S5OI4OeMm5yZyXfqllclO3rH2b/
	viIv3YtADvzWba365dr5XGD364Q9l6Ee9Tot+C/Juz2+vIQS82kaJW36ZR43EFCa
	LV2DBtIQfTsrvLwH+++PTLSvJg4wO0J0klMFM9McMjwqhP+MDPYB/d9E62xH4ayW
	Oe+YIEEDtjxmHF/H3dfDWEshXye1JEyJxM7vhcGlqTRtjag==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	by mx0a-00103a01.pphosted.com (PPS) with ESMTPS id 4ccjbej6yv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 15:10:41 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2o72S87fObwB/YgD76QRTMHDiSMy94E+4oz+iSL7Rp02gK+MXgl9ralMf+38kGnGo67m7v5bzhJw9E5v1oLPk9nvsma/0TFgcRsNSwVZTAe4yGrkO0ByVTT1xX9fBa5V3Ht5/egV2+AVyGrXL1V2YvThxSAUKsgMoOUKwtr+OXGrnz9/j7W3y5PaPrsQph210Xxvt3tO2JDQ1j/RWcD2IfpnNOt+Yz5fgSwTLNO6bdgwVwCu2J6ND4odmdroTpBU7W7WRwTNtdarHTNgFL7JdcGTEdWCTiFR1GCjuvCxoNVn5BIx7ka6TMXF8jJdVhkWsWybdEAroxCXNkfWLq4aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afA7c7NKt/h+voqSSXfQqn2lpwisBEFQRi1E6TDrdqk=;
 b=kwjAWAENO7lYPW1RC8MOfWiVSuL88A2/woSkfHGVceU/u6uUbOzoaeWiTX7oIiW2ocmM36Q+I7hW210MPUaipfAVugI0HCNVg9D384NzFTEpIQNxpo49KWDHKFijjanWkcYbIh7KCjwcN/h+9g/zgv7iSle9qZkdpLFK9U/Nzk7GVBlr0fHsetNOilMmoU92i/g9skmzQeU4Ir0dsePN+RZZFAGIoevfYBips/Z5vFyW/0Yeyz0OC9tJ/s8tk7YfMtxlZ/aVMx4YcFAlgRcGYqns79RDTAU+7pUwUcu22+8kpJMv49+tJQHHs0g+R1oF4QzDrhHLxx/u9d8ZWUMnTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ciena.com; dmarc=pass action=none header.from=ciena.com;
 dkim=pass header.d=ciena.com; arc=none
Received: from CH2PR04MB6821.namprd04.prod.outlook.com (2603:10b6:610:94::20)
 by MN2PR04MB7069.namprd04.prod.outlook.com (2603:10b6:208:1eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 20:10:39 +0000
Received: from CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103]) by CH2PR04MB6821.namprd04.prod.outlook.com
 ([fe80::e0d3:6fd8:6c82:3103%6]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 20:10:39 +0000
From: "Nassiri, Mohammad" <mnassiri@ciena.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
CC: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "srostedt@redhat.com"
	<srostedt@redhat.com>,
        "masami.hiramatsu@linaro.org"
	<masami.hiramatsu@linaro.org>,
        Christophe Leroy
	<christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC vs
 x86
Thread-Topic: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC
 vs x86
Thread-Index: AQHcoEcGeCnVUQeYJUiohhPZh5dZMA==
Date: Tue, 17 Feb 2026 20:10:39 +0000
Message-ID:
 <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR04MB6821:EE_|MN2PR04MB7069:EE_
x-ms-office365-filtering-correlation-id: 43b42c3e-c3f5-4e0c-666a-08de6e609ee4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?bFI3bkhIL21jT0syTnNQQzlxUE40MTk3R2NyWE1UTHZ0SitVM25OODFvTjR2?=
 =?utf-8?B?cTBYc2JJOW9QaDFiVm00VWpOOEJKRi9xRkpVWjFUeVloZXRXYkVjclRETnpt?=
 =?utf-8?B?SFBwRDNpY0pPbDBOUDdzN0JNRGdVNS8zbHp0N25EWHk3K1l2TFQwcUw2UXRU?=
 =?utf-8?B?bEl3MnU2OUovRjBmWTgxSHd3bTRCdFJqc1J1Z0RqbVJJbW51Q0hZN09TZFF5?=
 =?utf-8?B?MjE4MU9UNnpEM1VDdUYvZFpaeTdYeGE5dWxIVC8vUjQ4ZWFQeUZRaUd0QmR4?=
 =?utf-8?B?cHE4MzR1TVBJVXJERUVkSGg3NnhvazR1bGhDMHRiVi84cU9YNE9qVzNTMUJn?=
 =?utf-8?B?Y0o5VjRKN2JmRDdDQlBqNW9uYkM4S3RrbjBZS09sVGs2SXVJYTEvT0xBcVYy?=
 =?utf-8?B?RHp4aFZtZmRoSWNZdmVseHVwbk9NRVo3VUJuT01BMzZHeEtiVkUrK0ptRzZ2?=
 =?utf-8?B?L2NRV2NmeThNTUZaY01icENqSm5aMGxuM0lqam1Sb3U0Tm1yZU9BWEF4SzVT?=
 =?utf-8?B?R3hTRHdKMFV3MTZVSktVdWpoenluTnUrMTlmY3VsYXhHODM3MDYrTWJzcG9N?=
 =?utf-8?B?Z3ZQa05PdWROTWk2ditNSzM0SWlNZzZtdVprMGFaT01CUjlScTZxUm9nNTdj?=
 =?utf-8?B?M21TajlTOCtBRVFCZlFFdzZ4WDlSVCt0MmNvNzF0MExqSlFxcmtDNkdpNFU1?=
 =?utf-8?B?NHBEUTFlL0V5ZnE1ZkNjT0pldkVNaVFISDV6L2FucFJkSmhmcGgyQXMvZGRM?=
 =?utf-8?B?UzJoWUpyTXp3dWx1bUtDWEdMMmxDTWEwdENJTXlHMkx4SDVleEdmZGF1WG0z?=
 =?utf-8?B?OURTSjY3cm9odUNGYkN4djdDdHJrVEZMbXFlQ2N6WitMWVdzVTBVMFhwcDNv?=
 =?utf-8?B?bWNXWVpkcERsL2FoZ1R6ZEx1WjFUcCtNRU5JK215Z2ZCUHhFTDhFR05LSTYw?=
 =?utf-8?B?TkFiS0N2VjZBckFjeFYyRzZYYlh0bVNEZEgwd2w0dk5xckthVExCTjdmS2dq?=
 =?utf-8?B?MkRBRUlpemUxRjBzZVpFa1RBM20wT05mdnZnQThtMnljcFJKNUY3MjAxK3Qv?=
 =?utf-8?B?V1Z3amtGd3JGN3d2Z1hnL0ZPa2JuK3NPeVluT2tvak9zbmEvYjlPTitIb1BX?=
 =?utf-8?B?c1J2eUhiVjB4VmVXSmZqNFVYSHdXTTZvbmI4b3pyczR4QUExemt0NWFoR3hJ?=
 =?utf-8?B?OUpUY1hYT2VveGpibVhVckVKT3luUWZ3aHIwTFF5eVdQRjlRSkkrd0dmOGVS?=
 =?utf-8?B?Ym04OEhGR1R0UzdnOGM0VEpoQU92dFZhd3U4TTdQbjhyTmFEVlNuVTd5bWha?=
 =?utf-8?B?U0pScEtBT3NndjZmRE1lUCtjcDAyWUkvMTJ2RlpBRkx0cjdnRitKaW42Vi9x?=
 =?utf-8?B?Y0pRUHVhdUZSWUFwZkZsU0RPZm9yMXVBNDFBNmxOcEVSU0ErTWZ6NUdCK1ds?=
 =?utf-8?B?VkFHU2Ywc2VtL0hTamFZd3JKL1c2cGpJam5xRjBtUlhweGZlN2hNMVhpWEdM?=
 =?utf-8?B?UzlSK2dtcksyVHZBOEtrUG1VUFhOWHZHVVdTRHZ2dWRmWXIrc0E3LzEvZXZO?=
 =?utf-8?B?WnJOK3ZFUmIrcC9INDg2NTY3Q0FiajIrNEpzZVV6QzBXcmxXMUlUcVY0YW9i?=
 =?utf-8?B?QkVKYVVCV3FZUy9RR3FwT1B0enFhbm9EOHVtZjdUdE1VOGxUVklzaFZSUG5T?=
 =?utf-8?B?WnJDOW9HMnVhMTZuUVVWR2RWQlZUUjdyeFVxRTVBanRVRHl4WEZXMloyUmlG?=
 =?utf-8?B?RUhxTFM2OURWcTlKeGpJY2lta3JhRUtMeEE0OFNEYU1aT0gvSUV2MlI0aGdo?=
 =?utf-8?B?YmhnSzBkb0MrL0h1czZFYm9HRjZUbUJCRWRqVkxRM0hRVTRNZmNyZkhCTW9j?=
 =?utf-8?B?Qi8zRjRCS1NwVnNsOElpWEMyK0Q4bHJGN2VuQkphK1I1WG1HMHQreE9CMEhu?=
 =?utf-8?B?MmRlR3p4b3oyZGFyZnhiVHZVc3JWWnRnTmdYSWJmdXNTMU5XMWlUWmUzT2Rh?=
 =?utf-8?B?VVBvRy9TeHgvR0dHbm5CUk00OFBEZFVTTUV0Wk4rd1FJa1hYZVNHR1Bpc3Js?=
 =?utf-8?B?M0YxYXIxYlg2ZTF1OGROWUFzRVVxZ0o0NXJSR0RUdk9xQ3M1THVjL0ppRU9J?=
 =?utf-8?B?ZzFXMURtekFnVzArUlBZNmdhK0pXOGVKbG5POVdQSk95U1A1cTJBaUl2ME1t?=
 =?utf-8?Q?OkuH0xLPs1ZBcvieRzYeYvE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR04MB6821.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c0FGQmp4WlRzcDUvZjN5VFFMWkdiMmRXOW8wd01DTkhMSjZaMTdOSGpOL2FK?=
 =?utf-8?B?Zm9RT3A4d0RhemdiM1R2SGFETjlKWDJqMjBtU01rQnBiZmN0T3pNQVl2R1g3?=
 =?utf-8?B?bXp2ck56NVk1aE9SQVJ5Ujh3TWZkbEV0VS9maXVlWHJMZEJ5MzdRa1BrVEUv?=
 =?utf-8?B?YVVkeE1OWXhrZ2hKUUNPMnFrQ1VTOGNCcWZSZmlMWjJ5UTF1d0Ird0tBcHZU?=
 =?utf-8?B?YjFiVkxxUU02TGFxWER3RDhoZHIyMk9oWTZrZzFjRVdXZnkxdk5XdlpiOExB?=
 =?utf-8?B?b2dhLzExMG5mb28xZ0xDd3l0SFJKM2dOTmcwb3dGbVdVVnBZRHJUL0lrR0J3?=
 =?utf-8?B?ZUZlNW4xY0xPYi9jSmpPRDgzQ3N6SU5GdnRmOXV1Wm44VmlBSndKZUtQaUMw?=
 =?utf-8?B?T3lJRjk3REFyOVVHVG4vSmRTUUl1OVloRDVia3BaMDVoazhwbmRGMUdCcFRN?=
 =?utf-8?B?aW9HKy9zUFVrQnRDSGF2QVo5OTlGeTNSQ1V1Z1FSbEhMb3RPTlZmdFoxcFQ0?=
 =?utf-8?B?YkN2VWwwcktNVWEwZHRINXBlRmluS2hpSTBib040MXRuWjVsWVY3WFNweXIz?=
 =?utf-8?B?SEw0c21pcWdzcmk2bDZ0R0FyWERqWndoNWVXYmd0NWF1cHZUdjBUUGFISWdy?=
 =?utf-8?B?R3NCanliSUFjZ01wRkdPc084ZTR1TTNqSnhNSHRzZi9kdDVHbnJPMU15MEgw?=
 =?utf-8?B?RExXc3dwRUsweDJudUFjbktDNDhFSEQ3elRGZ2NaaG4yZVU3VHg4NCtBUnVE?=
 =?utf-8?B?UUM2TXZjNjNpWXAvcnpqWkpsdXpmcktDNmhzMGRIYi9KQjNxQWk0NmJXSVFw?=
 =?utf-8?B?QmN0ZXVEU3VCQ2dXaHRURXlsTjUzM2ErRUVGN3lYR2Y0N01yZDU1V056RFhq?=
 =?utf-8?B?d2ZTbHA0VUl5d2s1V2RNZmxIS2YyV1dLakJqMDZQY0JDQWR4bnhjWUZVaHhO?=
 =?utf-8?B?eHRHNmZwL3hHcGRwRjZqQlpXaVo3cmpkZ0NWaGp5VTNPQUtrNC9FTjJVZG9X?=
 =?utf-8?B?aUxCM0NBcm8wTktPbVVxQmppMThzM2JhTzBGWHUzaE5ybVhrdFBOQ3VhQzgw?=
 =?utf-8?B?RGR0MDZZMDlrRERmWDZiQVlNbGpzSDNrYmowRXFnUjJXSlZuZlA1aitCcmxH?=
 =?utf-8?B?czh0TjlhY0h3YVloTnlIMVI4Nm51YlFpRlFGZHgzckMwd0NVNnZDRlFGUFNo?=
 =?utf-8?B?QTFrU2NyM0RjajhVNHJaRnltWkQxcEdnaFRDb245WjJCTVdmRHE4QjEvK0Mx?=
 =?utf-8?B?RWNEczZ5TG5rWWlHMW5ZY2g0Q1pRTk01YzRYTFVpKzlPZklTNmxmdFphdFcy?=
 =?utf-8?B?TS81aFdSZkxGZzA1anNNbUxCVEh1YVVjT3AwdkY4MnREN3I1cTRBek9MY2Q2?=
 =?utf-8?B?ekZYZ1FlcE1EY3Rxcy85RWx2VHhEVDBDTEc2SkloenlUTHVHdnVvYmNDWVdJ?=
 =?utf-8?B?Z25MRFhEc0RLS3VoRDVpSDVJNkhmU0RJL0crMlJNc1c0dkFPdEdrRzBITUVs?=
 =?utf-8?B?V2VoQ252ZFpEZE9wTmhKK21pcDVLb3QvdndPNC9NeVlRMjFEM0RQaHorQ1RT?=
 =?utf-8?B?REhhWmVrczVpMmt3Uml0ZnV0TVVBR1Z2Yld3VEdiMllyUldUamJtWEdmSjJh?=
 =?utf-8?B?dW9KL0RmbmpaY29Wc3hwcUtDR1poOG5TVi96Q0ZqUVhkVURUMTFYd0NkeHdK?=
 =?utf-8?B?ZWdORmtEbi8vMnJTODgyNXc2T1NlK2RQVzZ2ZUJjanJBUUxWQm1DcXlDZTA5?=
 =?utf-8?B?WUZNMFEwWlhvM0tSamhjRVdsN3hBMTRtZFBITUlxTWRubytwbWh2bVRRVUlY?=
 =?utf-8?B?MEs3dDNBTGI4ejZ2VkpIZEtDODM0eDM3VGxmbCtIL3J6Tnp2TWZNYWh3QlZE?=
 =?utf-8?B?K25kcjNnQ2llMGJjSHFPZXVhemc4Zm5ZMVNITUNtbkhSV3diVmtDZHBhQ24w?=
 =?utf-8?B?dDROOVloN3NUR0RFcVJabFB0RWorTTQyWGNPaW42bUlMVzNobFY5VVVOQnhR?=
 =?utf-8?B?WVVwZEd4NUVSQy9VM2sxRCtKeDlUUm5NY2V1YkRYSHpvTHgxdXhDV3pHU2Y3?=
 =?utf-8?B?MytxbTg1NlZHTlFFNkV5ZjkvRzlwN2FpTE1XTU1iYjN1R0p6UGQrN1JQeWhs?=
 =?utf-8?B?N2t4L0NoM09RaVd0dHRPS0NEYXVxbWx4MlNGclc4RnVFeFVYMEVHMHJVZzdh?=
 =?utf-8?B?VXBwTGhmT0ZEU1hkSjFkUEU2QzBMckVJVzloS21sYnYvc0x2MXlJNGVYK0xY?=
 =?utf-8?B?eEhUdGE3REtDVDZ4V01XOXhVa1pZUnY3UjROcXU1d1ljbVNFMWJEcG9maWpR?=
 =?utf-8?Q?HHisTD/UzebDhOkYcK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: ciena.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6821.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b42c3e-c3f5-4e0c-666a-08de6e609ee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 20:10:39.4594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 457a2b01-0019-42ba-a449-45f99e96b60a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UNQpT79B4/2evDLYn3emkAeaHqKP1/zKn3KdnWVl7wpV5y5G/QAblKlWNWzdXv41pss9YFCy6Rkt9hLP1W/wSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB7069
X-Authority-Analysis: v=2.4 cv=N/sk1m9B c=1 sm=1 tr=0 ts=6994cb41 cx=c_pps
 a=3RjCkzAZQHL7PUncwJf+GQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=5AoxzEp_LWBq4ObcYV0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE2NSBTYWx0ZWRfX0FkJmgaG3qGM
 NGwmvnERMgCLTE5W1NewC05hODGeJTSXhvv5+ur/YDBSFt+BmKOnKPxWQWT2TCSc50iK4HKgz3s
 qKqACBQE9/HV19sliKCLb+MHm76on696teSSLD45bBqFvf08SCBiHW268RKI3XsLGpCPPICxk2w
 CtX3hlfOnZwTxfdxu4zDvSNSqFRIgNAzVajBOeQY0VpRiujpzqB67nVWmr30+fPIK6691oTbZ+D
 xOY/pEfMEPZcYvY20CTrO6tYWXiTaC99+JSNofOWpUZIxzvNuZNTkyAmTdAH+nwf42iCjci9ohR
 mfvxggVWIHfsl3Cz28PW8pLBT1+iF65bbiB6cN+fBUGOmynIgHv1AxhimnmtPSBcjt+VOse/31+
 UJwFXiZovyZlgfJcGw/mCRCzWPkurzLdYl08gcbQcU6Bgm7VgQLRWvoSsM+FlL5JImKMeRely66
 3wbQ9d0MX+StlfyXGwQ==
X-Proofpoint-ORIG-GUID: 1uBXI2isDstW6WtvItXgbxA8GZFNajh9
X-Proofpoint-GUID: 1uBXI2isDstW6WtvItXgbxA8GZFNajh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[ciena.com,reject];
	R_DKIM_ALLOW(-0.20)[ciena.com:s=06252019];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16914-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,redhat.com,linaro.org,csgroup.eu,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[mnassiri@ciena.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ciena.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ciena.com:dkim]
X-Rspamd-Queue-Id: DE61A14FE6A
X-Rspamd-Action: no action

SGVsbG8sCgpPbiBQUEM2NCB3aXRoIFlvY3RvIEtpcmtzdG9uZSBhbmQgTGludXggNS4xMC54LCBg
Q09ORklHX0ZUUkFDRV9TWVNDQUxMUz15YCBpcyBlbmFibGVkLCBidXQgbmVpdGhlciBgcGVyZiBs
aXN0YCBub3IgZnRyYWNlIHNob3cgcGVy4oCRc3lzY2FsbCBldmVudHMgdW5kZXIgYC9zeXMva2Vy
bmVsL2RlYnVnL3RyYWNpbmcvZXZlbnRzL3N5c2NhbGxzYC4gT25seSBgcmF3X3N5c2NhbGxzOnN5
c19lbnRlcmAgLyBgcmF3X3N5c2NhbGxzOnN5c19leGl0YCBhcmUgYXZhaWxhYmxlLgoKT24gdGhl
IHNhbWUgYnVpbGQgYW5kIGtlcm5lbCB2ZXJzaW9uIGZvciB4ODZfNjQsIHBlcuKAkXN5c2NhbGwg
ZXZlbnRzIGFyZSB2aXNpYmxlLgoKQ29uZmlncyBvbiBQUEMgaW5jbHVkZToKQ09ORklHX1RSQUNF
UE9JTlRTPXkKQ09ORklHX0VWRU5UX1RSQUNJTkc9eQpDT05GSUdfRlRSQUNFPXkKQ09ORklHX0ZU
UkFDRV9TWVNDQUxMUz15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQoKUXVlc3Rp
b25zOgoxLiBJcyB0aGUgYWJzZW5jZSBvZiBwZXLigJFzeXNjYWxsIHRyYWNlcG9pbnRzIG9uIFBQ
QyBpbiA1LjEwLnggZXhwZWN0ZWQgYmVoYXZpb3VyLCBvciBhbSBJIG1pc3NpbmcgYSBjb25maWcg
b3B0aW9uIHJlcXVpcmVkIGZvciB0aGVzZSBzeXNjYWxsczoqIGV2ZW50cyB0byBiZSBhdmFpbGFi
bGU/CjIuIE9yIHdlcmUgdGhlc2UgZXZlbnRzIG9ubHkgZW5hYmxlZCBmb3IgUFBDIGFmdGVyIE1p
Y2hhZWwgRWxsZXJtYW7igJlzIHN5c2NhbGwgdHJhY2luZyBwYXRjaCBzZXJpZXMgaW4gdjYuMT8g
IAogICBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eHBwYy1kZXYvMTY2NDg4OTg4
Njg2Ljc3OTkyMC4xMzc5NDg3MDEwMjY5NjQxNjI4My5iNC10eUBlbGxlcm1hbi5pZC5hdS8KMy4g
SWYgeWVzIHRvICgyKSwgd291bGQgYSBtaW5pbWFsIGJhY2twb3J0IG9mIHRoZSBQUEMgc3lzY2Fs
bCB0cmFjZXBvaW50IGdlbmVyYXRpb24gY29kZSBmcm9tIHY2LjEgYWxsb3cgNS4xMC54IHRvIHNo
b3cgc3lzY2FsbHM6KiBldmVudHMgaW4gcGVyZi9mdHJhY2U/CgpUaGFua3MsCk1vaGFtbWFk

