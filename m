Return-Path: <linuxppc-dev+bounces-16954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDqVIax+l2kOzQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:20:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EC162B78
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 22:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH5rl20rhz2xN5;
	Fri, 20 Feb 2026 08:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain="microsoft.com:microsoft.com"
ARC-Seal: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771509511;
	cv=pass; b=TQ8AZyVR+x0AIT9022KhnF7q4J8CX3gFvTNeyDtYklenZfhqt+bfHu01UOD+bRVZrjQePDC7ApEF/keg3nPDCb6YUofv0T6LsX8DXC0qBuAH0epMqcIECBdWo4G6cWA9xsaMdfefRftK6CbsAYa9Xq4m78Cu7ENEsX9uFsZ3luRoD9veCRhpULXfZuOl/pRXKIn7QS8trOVgravWiYwthUqj30De9mX3E4Fewss5WKeF27KCrtJBiiRTGYvN3pyeMTj/KPk9oN3ZQwmWSfpMo+Eb3ftUg+mCrXG1uUqq7ygv4UL2MWWj8brzGMTna45pIRVRzE7Ui9TsnYWqOGfxJg==
ARC-Message-Signature: i=3; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771509511; c=relaxed/relaxed;
	bh=35mIdSEtfBh6vdA6OFw4a6xWcPEEbHCp50MUOX7oz04=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=itEtBWa/hsDK3mF/ZWP0xRY1HbMh7dHFackWLLzf/55Y5xsGirL8bVAnmerQGiu4WXC/9BOTaym9HCaV+ulWLVh+K2PKB3+oBnINGp05FhUGxzJiPnsQThdlM0VVIgnmTgk7rdJaZtTJ9DD/k0t2Umh5Hqbjs/2ANejJK8h0x1SdnnrVsQg51NTOSmw4hzuAYTO7SBC+JjFkO00vdsDD1KauAK+q75S+VCsO8PG2gbnyPq/3VMpfbEr2S7bVR7wo94X28SeHA9H0DMSoIflvAzojb1+uV6565ogdo7iFwJK5smd7wrwvQVGNpD12K7E0o1s11w/udh951fPh4zdoqA==
ARC-Authentication-Results: i=3; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XQHpKK/Z; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XQHpKK/Z; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=sascha.bischoff@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XQHpKK/Z;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=XQHpKK/Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=sascha.bischoff@arm.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGw2V49WLz2xlj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 00:58:23 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EmdqMZdrxYzFcyTjDWO+pATxkv+mNtBYN/gUkjCnOCX4LZWUBA9oxPYLu7upcEjNZOvM9hKHqOqALflyhkDg4jgW/AqhJwFIYSQsE2Cu/yEBY9pBdYpiJ6pevU2i+Ad28Pel/QVr7DXH/gzXZHpGZEbRzId9GsargalVVO5LODEqzunzx+z9zxfr+Gk4tS+DUzkXMM3tIshOD+SN8oJbWdhmK3G7lMxN9gXXKgHbHZ3oE+4iFrqz9vBZOoe3YWFFZnBbeSxwfrf8AOT3ovHtibyiaHocvDGJSdJwZM5MYx3PHRXCtd1m5bIPIp1c+IPnaVJPsUobgOlj8rlTVIPPHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35mIdSEtfBh6vdA6OFw4a6xWcPEEbHCp50MUOX7oz04=;
 b=Jd3ITROI1sX92cGLilAMmy+m9n5EB2kqDSdbY7zDiZXgQzv4hMoToLvXCfnjktzSCgI3RMJppclV8f0vyiqZRxdBJAb3Tmq2/gxE8nE2B+wrPSX2ljfi58HFxErDy2CT0plydMCA+OIa4to3fizT0abXVWhGKsoEW2TH5MrFewMT6+5xwolWO3VFRXdiHtgtLPS1aosB1quNqyvQbR6nPC3Vj4dxqalhzmipNX4b/N9m7HHgZplhCsCBGPmB5q5FVIMDVFgK2IGB/6m7GuHDeu1NjVN2Qz7qC7drf04K2+5tXAU2D1kSKpYZ4F76vBX5OV6xoBwMouOexAyLgBesZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35mIdSEtfBh6vdA6OFw4a6xWcPEEbHCp50MUOX7oz04=;
 b=XQHpKK/ZbxnKTmh+5cSB3IrR0IE3aImAOh+jc6KiXIogskiRpowj+1/qjAMXT7TmKvM1tEMCqS2lWT9RsjAhXJgws0uGPEUao0RgEgYgBjTU3ho9QW+Jbkd7lYstLy1L9lDssdQT/BwNKPB54yGP9TCbXDx4vg0T8UHANerWiso=
Received: from DU7PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::23) by DU0PR08MB7761.eurprd08.prod.outlook.com
 (2603:10a6:10:3bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 13:57:48 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::58) by DU7PR01CA0010.outlook.office365.com
 (2603:10a6:10:50f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Thu,
 19 Feb 2026 13:57:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 19 Feb 2026 13:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bCMPAHWAT4kuQAJIACOuvcq8IhTd65gguiEdINQkNkUUhh7yhNhFqkFncldB7DSLdeVYRA5JiFtVxCNwQt0sPmL5tCyJD8VpUJBeB5RBlDaCurawPTyGXJwugrxRmNwfpl6TYKpTva5yjuJue/LtOjE3V8p52X+GYLiLG9sP/R8WqnEabteJCc+f7M9OjHshNpvbFfdLHvr3sBiI+ZzSBaVImFGUtxIznQWJP0Wy1vzfu/GZw9zgyQnxq9MujCyLbz77Lyik9jJjlZYjiE863Sav1klNwaf+Uki18LKOsEkmidKYJim71KD1guQJyVCpzpbs2PeSizezXKYbGYPSlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35mIdSEtfBh6vdA6OFw4a6xWcPEEbHCp50MUOX7oz04=;
 b=o6Au7rdnEmnajGKnlbh3rB9DkzOfHuRt95kJd32LLlROdEcRY5xO7J17aAXE/vQltArvl3+msoMDlQLlzBzew4iTlyBqUTxvChXkD84Cgzt77hA/v/GjwOMUn4bfLKmwA3L+43ukRx03GvNUrS9tHMmaahoN7cXpiZg4pcpg/R1BExXHrSDlTXC9IZAPDFSCpZhcpctARp2eBw3YfIWRCIvZ263n/j+DLR0pwWOqJj64a0dOZsLgEH/wrMnSa/Ru2/hqAxBSm+Bk5A9IbqYWaOtYH9lVg3ei7DvrRX/dzsfmkdzIaKV13Ge2WyyaMzSMxpP2xSHycQKdCY5blOUwrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35mIdSEtfBh6vdA6OFw4a6xWcPEEbHCp50MUOX7oz04=;
 b=XQHpKK/ZbxnKTmh+5cSB3IrR0IE3aImAOh+jc6KiXIogskiRpowj+1/qjAMXT7TmKvM1tEMCqS2lWT9RsjAhXJgws0uGPEUao0RgEgYgBjTU3ho9QW+Jbkd7lYstLy1L9lDssdQT/BwNKPB54yGP9TCbXDx4vg0T8UHANerWiso=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by DU4PR08MB11717.eurprd08.prod.outlook.com (2603:10a6:10:643::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 13:56:45 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 13:56:45 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "maz@kernel.org" <maz@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"ioana.ciornei@nxp.com" <ioana.ciornei@nxp.com>, "chleroy@kernel.org"
	<chleroy@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
Thread-Topic: [PATCH 0/6] fsl-mc: Move fsl_over to device MSI
Thread-Index: AQHcoObeSUzmsgo7K06enQvxoD1zRLWKDVsA
Date: Thu, 19 Feb 2026 13:56:44 +0000
Message-ID: <1782efb97a597e750069334bbeddc03b35fca862.camel@arm.com>
References: <20260218135203.2267907-1-maz@kernel.org>
In-Reply-To: <20260218135203.2267907-1-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5687:EE_|DU4PR08MB11717:EE_|DB5PEPF00014B9C:EE_|DU0PR08MB7761:EE_
X-MS-Office365-Filtering-Correlation-Id: f222d80f-0d8b-4a25-9f1b-08de6fbedd19
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aWd2WWxUcEFKQSt1V0hCZjM2U3Z0V0pFZzZvc2FiN3l4R2EvODk4N3R1MU9l?=
 =?utf-8?B?cHpvQjBacENVaVFUQm11TktnV2lONXlEK0xjMitBMjJrMmpXelRNM2t2aTlX?=
 =?utf-8?B?elNCUzBvYVJWN1Z6cjFkeGNXbmxFZjRQQlI0akljRHZiMXNDdVBoZURGSFc4?=
 =?utf-8?B?MG5xV3hrWSt4MVVyamUxTkYwT2M1VSs2b0NIakFCaHdMQXc1MHM3ZTBrWGVR?=
 =?utf-8?B?d1VXKzdPWHhLN0hTSytkSHo4TUdRU2RUV0lZSTV0V1J1MURWa0wwOE5zK2h1?=
 =?utf-8?B?MUpMdEFUMjdWd2ZlTnVraTdvWUVJYXBXbUtNV2trMXJYb2c4RVV4YUJTVWhQ?=
 =?utf-8?B?NXRpME5ER2llQ3o3VFJ6ZS9CQndPdVlhQXJHRWxXTmxhQmh4anhvVFRYWmh4?=
 =?utf-8?B?WWZKaDVGN1FrVTJQckFJYVhPOFlibzBvdWNXQTBFRUZxeDZGZWlsaldmcTgx?=
 =?utf-8?B?MFBKTVBFcVBDa3UvY3V5TVBMNVRPYWZZUEpFUXBwM0VoM2JGNTBoQlpnWGR2?=
 =?utf-8?B?TDFwbmh4RG0raU52aTlBbS9TM21TMTJnUFg1UDlUbk5xb3E5RlZGRlU4MnpW?=
 =?utf-8?B?MmpXa0ZvelRtOXJTUVRDNzVTQVBrMEgzbE56S210KzlQZ2xCanh4QnZFWTBK?=
 =?utf-8?B?Q3dtY3kwWVR2UmdHenJzaHFSYXhqMHhQMndKY2hkc1ZOQkgybWxVdDVWdS9F?=
 =?utf-8?B?NVd6WFRRR0NaeWtDeW5lM3pvYklmSlRqMktWdDk3NEhGMThRZ0dFdDRpakNM?=
 =?utf-8?B?YnNOQUxTbVlPVzh5M052enhZYnI3bW44dVNtT09XQllnZFZGaEFqWFFlV3JQ?=
 =?utf-8?B?cWI1ZXp6QWVBYjBoSGo4VXNpanNYUEZoMGIvajArNE5XdWR5bUJkOXZ0eStG?=
 =?utf-8?B?dTNHNVo4cXllcFJYRmZabzNDbHMvLzZVTk9SK2ZXcytUVG1ENHRVVmZONFRa?=
 =?utf-8?B?M05tRTZNT0lUTTVZSmVVL3FuelFua0ZZb0NkaDhRWFhaZWUzTmhYZ1h3dG8z?=
 =?utf-8?B?UEdGZm9xUzJnSWVCazk0Qzc1QlY4ejVydjZLUGJ3V21oa0hrK1VOTGpzSDNm?=
 =?utf-8?B?SWpHUG53bGxTN2NyZGxxTjNuc1NGeWNjREl5NWYyQ0FjU05sbTNQRWFqL2hk?=
 =?utf-8?B?YTlRdmtiQ1djdUxyRVY0a0JJSWFDNzhSMEZjUGJMRWlhUldCU0pianRsOGR0?=
 =?utf-8?B?UmtLbVNmcHhyZHpic1l3eC91WjNNUjExVll6a3BURVBFRS9ZNFR5WFp6bzZN?=
 =?utf-8?B?K2Z1bUNFbWlZeHhzZi9IcWdoRGNKWmdtOVlmN3k0NjUyNHNqTmNwbVFhb0R1?=
 =?utf-8?B?OVJEb09za2E4bWFDa3ZFRldVV2VCQnV2UDc4TGY4dDFqcGUxVmxNUjUvd0k1?=
 =?utf-8?B?RHdNcjUvaTZVSy8zMEFlblVDeVRUSTNvSDRNUFk4a1J5RnFWaHN0OEx2SGlE?=
 =?utf-8?B?c0NMR1dUSW5pb0ZkSWE5RmszU3FEb1FaK0RoOWV1d0tPNktsNTVtelJpQzMy?=
 =?utf-8?B?aStlTG5DWEVTOVhaRm9QZjduYndnZ0N0VkxlQy9MRmFpWW9tSjJDZy9hN0pL?=
 =?utf-8?B?cGdsZU1yOUtUeFY0WjU3czBNWUJRdEpPODFIendtTkpHVE1Kd0hHVy80SC8x?=
 =?utf-8?B?L01nMGFyZzBJQnFyQmF5OEFrRFAwbzB0NjlwVTQrVFhyWCtNdGhXc2dSbkZm?=
 =?utf-8?B?UFBNVmNTZkN5dEk3amlJWTlaWlliTFplQjR5QStqdEFKMFlta3VON3BPanZ0?=
 =?utf-8?B?OUlKTmNWenc0K0JzSkQrbThCc1Z3T3lFcUpoM3NKSzh0N0lWcVVGdDI1TEk3?=
 =?utf-8?B?SU50VitWeHNGeUxBSTd4WnVXVEE0T2FoUWZDM0lGbU02SmpYdGd2UnhEV3BO?=
 =?utf-8?B?QXU3MTQ4ZXp0T3JnV2s3eVJIL1BoYzd0U2tuK3dlKzBCRHpkQ2ZCbnpKbjY4?=
 =?utf-8?B?d1lmQmo4cVd2cWtXdU5ERzV3NjBCTFVsSDBvOVgwOGhoa2VHYzhMeXBjekht?=
 =?utf-8?B?UlRGMVJoZjZCdERBbTlzUXR2S1BUZEZKRk1iYTBwYTl6b2VyMkRFVnFLa0lH?=
 =?utf-8?B?d1dRdGRkRHlvMCtLSEV1cFBYMkg5MGxBalcxc3czRXNjVnMzejV4RnBHMm1W?=
 =?utf-8?B?aFdYY05hWkd4azJUR1ZFbEVVWTZRN3BZZjhYT0RpZThIaU5wRmVOZUYzU2xB?=
 =?utf-8?Q?pSekxwA57No5k6oBLIcfxv0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6671AED6D323AA4DBAA74AA2AA37B7C5@eurprd08.prod.outlook.com>
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
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11717
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0737aa3d-b4f5-453b-bf8f-08de6fbeb7c8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dnRsakhxaGxna08wTS81dDFrVGRNTkk5S05JWGJkL2pGamJSL0VEWVgzUkYr?=
 =?utf-8?B?OEI4NXZDbXRrcEVxMkdZamtJMnRVbVZTMG5rYklFaUYycVZhbW9HKzVYcmpj?=
 =?utf-8?B?b3dXaVBJZlRwamZHTk1KSUVqcnUxOGN6OVpRN1ZLLzZHejAzWGJ2V0NBZ3d3?=
 =?utf-8?B?dExZcnpIcTN3c1hoYnRCN3pSN3lweEp1QVVBT0ozbUNBUzQ1Y3pkcDdBYVpX?=
 =?utf-8?B?ZStEYTd1MWZoVHRJSVNBRTJ4QnBHQWNXMnV5ZkxuRVNEWnpPZEJtUDFhTXc5?=
 =?utf-8?B?TE9Lc01UTjY4dlh5cjhTZTJuYTBOVHcvRnZHM05IbkVHT1ZKZTNiWjhjdTMw?=
 =?utf-8?B?MEFXQ2haanZTMzFtbXpRK1J5NkJsMFZYckdTcjBCQzVEcWpDLzJ3WFdzMms2?=
 =?utf-8?B?cHRKUUdLaXprM3V2K2d0K2tPZ2xVMEIrekRvQTN3VTBRMHEwdWJpZTMxQkcz?=
 =?utf-8?B?U2FDT2Q4S0VzQzFEQi9RdCtoL2VmWFFoS0drY2VZbnE5Vk5iMzBNbXdxQUxK?=
 =?utf-8?B?YXhiam9VemRYTHFHdUpjRVNWNXNBRy9aRDkzZDRKK0k2SUtEcXJMVFB5UVMy?=
 =?utf-8?B?WVRsNEltMDJIdEtRVWNVbTVleWhaRmIxb1JoSk1qMFpZV3RXZUViUDhXbTIy?=
 =?utf-8?B?RkYxdklIUmlqbkpKTWIzSG4wejFDTlM1OWMxYWc0Vy9zR1RveUorY3h1dEZF?=
 =?utf-8?B?MGIwWGxDV2trZGliWGtsOTRwOWdEYmQxSmxCMXl0VHlUMmh5OGx1eEE1Q1dp?=
 =?utf-8?B?NE9UV05LdW0rUzZXNno1dko1aHl1SWxsN1VhL0dWY2hnWXAxODJkUkYyQ3J3?=
 =?utf-8?B?MUM2SWRBZEZsQldpcmtQUWppL1B6UExqaERjM2FqUVVRL2xrUjZrZjhmSm9Z?=
 =?utf-8?B?bldybTY1K1FTM0dDRVAzRzJFMEhFd29Xc2hDN0FEQTkwckNlUzYzU2ZTTHZM?=
 =?utf-8?B?VWVOZ2ZkaWc1UW5VaStCVmt0b0pyQmtveEtsam5FckJ5a214RUFTV2ZKMG1p?=
 =?utf-8?B?SnM5cmwyRWVOSHNEd0hhK0s5cDFLQUVFWlpqS3QyU205R3R2VmlJaWtOWUpx?=
 =?utf-8?B?QWJkaG5SWE5HSGppNFA4eVFkTnFhaDgzK1YvYXdaM0d2ZHJtOHMvdUh1Yjhn?=
 =?utf-8?B?WDB5OVpUdGNveFhSL2ozblpHVDdheWhBQ2pWYUNPZUJpRGxtbmVhRHJtY0Fj?=
 =?utf-8?B?Q1pBdFJoNEJmYkVaaW5OMFJTaDUycFBEcTdSeGJoa3hQU25RUXFmNFBDaklz?=
 =?utf-8?B?OEhVK29Ga01rOTBxQ3h2WFdpOWxLbCtKWHpEKzhJZmIvdm1oZEtzbG5PZDBJ?=
 =?utf-8?B?Qmc2U0xvVkI3b0VhWGxFcFdFYXE0SlNLbmNBaUVOQW1YMVRVQTlJSjFtcUkz?=
 =?utf-8?B?QlNPMUdlNHVJaDRCWkVSdXdzd2pxQnBmc2tPdERXWkh2Q3lqYnRBWFhWNkJv?=
 =?utf-8?B?UFJtckxvUmJrZ2tOWkdLTjloVnB2RzE4emlBczBLV1AvdkJlWXlRNXZjOExL?=
 =?utf-8?B?ZzZOaG5ibWk5eDlUZm9FOU9mNzhHRUlCZk1LbGRiVlZyeTg5c2dyT3oraDFT?=
 =?utf-8?B?a003aXJkQUwyV0JvL1VkSTllMllZVkdCMzNtYmx5UmExV08waDdSam0xTU9T?=
 =?utf-8?B?ZXR5cEp4TXJUZ2hQT0NYN2lDMTZVYjZSWGlScDBORUdlRzRjVWo5ZDJ1ZlVL?=
 =?utf-8?B?WXBMMEFOZiswUWl5MVVOOVRUZnBJamZBWENHazhacXhvR1o2U3N5RmZKQkJz?=
 =?utf-8?B?RFhseXN6WkNOSEcrYzREWEV3MkZpcms4QUJBU28xVWIxTHExTHlYSlNBbW0x?=
 =?utf-8?B?UzlXUEZsQjJsYzZCSmtsVkI1SVpUUkRYaTBvVnQ1cGErYTN4WUloRXhRNFl6?=
 =?utf-8?B?dWZnajVWazEzMmxtcDR4VnhnU2w3RUZ1NkdPNkRnR0NoemVFMTF1MlNaanBZ?=
 =?utf-8?B?K3dIUWU4Z2hpK0ZETUljSG9YcDR4WHhkeE5GQzQ3S1JOcFUxNy9zUXljOGJD?=
 =?utf-8?B?akkxc2ZJdDFxQ3VwQmFESmEzSzZWVFpJRS9QWTN6WlZLRTJyZVlkYmZvOHUy?=
 =?utf-8?B?clBpbmNtRm4zVzdqYkYwZE5EWTJUWWNGeXJuM1c1MjFOSDVTYUFXelBvRFl3?=
 =?utf-8?B?ck9TOUlYT1A2bS9kMXpOUlRMWjhtb0U2OWlPa1QwVHpRei81NlhmQkozZWtZ?=
 =?utf-8?B?NUVUQnlCS01pZTB0Q29PV3dYTzJ4ZVpDK0wzVVh0NVlqeWk4c2tDT0kzWFJv?=
 =?utf-8?B?MmxnQ05tMHpBYnFndi9Sa1ZlTkJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	By5TdenXiuX7xI17/AtuGmTXpL/DG8ZSdU36USdw3d7m12ZVaCsuPk8DsVi03gbuWh5Q9kEqrB6pT6dYlxY4RTii6UePqgmb2VpL66Yg7NbwLk3Vt9FqAU84T+I8XILUdzT3Fl3Rjdcz3V3UarVTCB/6fpW9YYAABwGUX0fswDvHSO/o7uLbgTjz2YB+EtR5eXpu7NNzb6jYt7P3T7SpRtWKx/0ntQlaUimHycZO0ATUtaX2EP01vlrq3E1WJh+5GpwVA4tGV4+QWXMRicOS8VGb2EOCBXBv+rlFJnNusQOGTd7PLHh3Fd2/v1Y0pTar4Viw88oWc+Ac/QSuwgnFepR4nifgxUMqAa/Z7tGiIOZPUPGaiKd4KCSCjLXFcM7knZWDKV0jBZi2ds9/zp8sEle0yDlZvt8vV7ufjuM+KdR2KZiKre4Q0Dsmq4bibFr0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 13:57:47.6022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f222d80f-0d8b-4a25-9f1b-08de6fbedd19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7761
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.11 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=3];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:tglx@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:nd@arm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Sascha.Bischoff@arm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-16954-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.993];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Sascha.Bischoff@arm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C0EC162B78
X-Rspamd-Action: no action

T24gV2VkLCAyMDI2LTAyLTE4IGF0IDEzOjUxICswMDAwLCBNYXJjIFp5bmdpZXIgd3JvdGU6DQo+
IE92ZXIgdGhlIHBhc3QgZmV3IHllYXJzLCBJIGhhdmUgYmVjb21lIGluY3JlYXNpbmdseSBhbm5v
eWVkIGJ5IHRoaXMNCj4gc29ydCBvZiBtZXNzYWdlcyBpbiBteSBib290IGxvZzoNCj4gDQo+IFvC
oMKgwqAgMC4wNjc4NjFdIGZzbC1tYyBNU0k6IElUU0AweDEwMDEwMDA0MDAwMCBkb21haW4gY3Jl
YXRlZA0KPiBbwqDCoMKgIDAuMDczMzUyXSBmc2wtbWMgTVNJOiBJVFNAMHgxMDAxMDAwNjAwMDAg
ZG9tYWluIGNyZWF0ZWQNCj4gW8KgwqDCoCAwLjA3ODg0MV0gZnNsLW1jIE1TSTogSVRTQDB4MTAw
MTAwMDgwMDAwIGRvbWFpbiBjcmVhdGVkDQo+IFvCoMKgwqAgMC4wODQzMjhdIGZzbC1tYyBNU0k6
IElUU0AweDEwMDEwMDBhMDAwMCBkb21haW4gY3JlYXRlZA0KPiBbwqDCoMKgIDAuMDg5ODE1XSBm
c2wtbWMgTVNJOiBJVFNAMHgxMDAxMDAwYzAwMDAgZG9tYWluIGNyZWF0ZWQNCj4gW8KgwqDCoCAw
LjA5NTMwM10gZnNsLW1jIE1TSTogSVRTQDB4MTAwMTAwMGUwMDAwIGRvbWFpbiBjcmVhdGVkDQo+
IFvCoMKgwqAgMC4xMDA3OTJdIGZzbC1tYyBNU0k6IElUU0AweDEwMDEwMDEwMDAwMCBkb21haW4g
Y3JlYXRlZA0KPiBbwqDCoMKgIDAuMTA2MjgxXSBmc2wtbWMgTVNJOiBJVFNAMHgxMDAxMDAxMjAw
MDAgZG9tYWluIGNyZWF0ZWQNCj4gDQo+IFdoaWxlIHRoaXMgaXMgdXNlZnVsIG9uIGZzbC1tYyBz
eXN0ZW1zLCB0aGlzIGlzIGNvbXBsZXRlbHkgaXJyZWxldmFudA0KPiBvbiA5OS45OTk5OSUgb2Yg
dGhlIGFybTY0IG1hY2hpbmVzLCB3aGljaCBrbm93IG5vdGhpbmcgYWJvdXQgdGhlDQo+IEZyZWVz
Y2FsZSBzdHVmZi4gSW5jbHVkaW5nIGFsbCBvZiBteSBtYWNoaW5lIC0tIGJhciAqb25lKi4NCj4g
DQo+IEdsb2JhbCBNU0kgZG9tYWlucyBzdWNoIGFzIHRoZSBhYm92ZSBoYXZlIGJlZW4gb2Jzb2xl
dGVkIGZvciB0aGUgcGFzdA0KPiB0d28geWVhcnMsIGJ1dCBub2JvZHkgYXQgTlhQIHNlZW1zIHRv
IGhhdmUgZ290IHRoZSBtZXNzYWdlLg0KPiANCj4gVGhlIG9idmlvdXMgc29sdXRpb24gaXMgdG8g
ZGVsZXRlIHNvbWUgY29kZSEgV2hpbGUgbXkgZmlyc3QgcG9ydCBvZg0KPiBjYWxsIHdvdWxkIGJl
IHRvIGp1c3QgJ2dpdCBybSAtciBkcml2ZXJzL2J1cy9mc2wtbWMnIChvbmx5IGtpZGRpbmchKSwN
Cj4gYSBsZXNzIGludmFzaXZlIHNvbHV0aW9uIGlzIHRvIGRyYWcgdGhhdCBjb2RlIGludG8gdGhl
IHByZXNlbnQgdGltZXMuDQo+IFdoaWNoIGlzIHdoYXQgdGhpcyBzZXJpZXMgaXMgZG9pbmcgYnkg
Y29udmVydGluZyB0aGUgd2hvbGUgdGhpbmcgdG8NCj4gZGV2aWNlIE1TSSwgcmV1c2luZyB0aGUg
cGxhdGZvcm0gTVNJIGluZnJhc3RydWN0dXJlIGluc3RlYWQgb2YNCj4gZHVwbGljYXRpbmcgaXQu
DQo+IA0KPiBUaGlzIHJlc3VsdHMgaW4gdGhlIGV4cGVjdGVkIGNsZWFudXAsIGFuZCBraWxscyB0
aGUgbGFzdCB1c2VyIG9mIHRoZQ0KPiBub24tZGV2aWNlLU1TSSBzdHVmZiBvbiBhcm02NC4gWW91
J3JlIHdlbGNvbWUuDQo+IA0KPiBNYXJjIFp5bmdpZXIgKDYpOg0KPiDCoCBmc2wtbWM6IFJlbW92
ZSBNU0kgZG9tYWluIHByb3BhZ2F0aW9uIHRvIHN1Yi1kZXZpY2VzDQo+IMKgIGZzbF9tYzogQWRk
IG1pbmltYWwgaW5mcmFzdHJ1Y3R1cmUgdG8gdXNlIHBsYXRmb3JtIE1TSQ0KPiDCoCBpcnFjaGlw
L2dpYy12My1pdHM6IEFkZCBmc2xfbWMgZGV2aWNlIHBsdW1iaW5nIHRvIHRoZSBtc2ktcGFyZW50
DQo+IMKgwqDCoCBoYW5kbGluZw0KPiDCoCBmc2xfbWM6IFN3aXRjaCBvdmVyIHRvIHBlci1kZXZp
Y2UgcGxhdGZvcm0gTVNJDQo+IMKgIGZzbF9tYzogUmVtb3ZlIGxlZ2FjeSBNU0kgaW1wbGVtZW50
YXRpb24NCj4gwqAgcGxhdGZvcm0tbXNpOiBSZW1vdmUgc3RhbGUgY29tbWVudA0KPiANCj4gwqBk
cml2ZXJzL2Jhc2UvcGxhdGZvcm0tbXNpLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoCA0IC0NCj4gwqBkcml2ZXJzL2J1cy9mc2wtbWMvZHByYy1kcml2ZXIuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDE0ICstDQo+IMKgZHJpdmVycy9idXMvZnNsLW1jL2ZzbC1tYy1i
dXMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstDQo+IMKgZHJpdmVycy9idXMv
ZnNsLW1jL2ZzbC1tYy1tc2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0MiArKystLS0t
LS0tLS0tLS0tLQ0KPiDCoGRyaXZlcnMvYnVzL2ZzbC1tYy9mc2wtbWMtcHJpdmF0ZS5owqDCoMKg
wqDCoMKgwqDCoCB8wqDCoCAyICstDQo+IMKgZHJpdmVycy9pcnFjaGlwL0tjb25maWfCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgLQ0KPiDCoGRyaXZlcnMv
aXJxY2hpcC9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDEgLQ0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLWl0cy1tc2ktcGFyZW50LmPCoMKg
wqAgfMKgwqAgNyArLQ0KPiDCoGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXYzLWl0cy1mc2wtbWMt
bXNpLmMgfCAxNjggLS0tLS0tLS0tLS0tLS0tLS0tDQo+IC0tDQo+IMKgaW5jbHVkZS9saW51eC9m
c2wvbWMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2
ICstDQo+IMKgMTAgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMzIxIGRlbGV0aW9u
cygtKQ0KPiDCoGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12My1p
dHMtZnNsLW1jLW1zaS5jDQo+IA0KDQpJIGhhdmUgdGVzdGVkIHRoaXMgc2VyaWVzIChhcHBsaWVk
IHRvIDYuMTkpIHdpdGggYSBTb2xpZFJ1biBDbGVhckZvZyBDWA0KTFgyIChMWDIxNjBBLWJhc2Vk
KSwgYW5kIGNhbiBjb25maXJtIHRoYXQgdGhlIE1TSXMgYXJlIHdvcmtpbmcgYXMgSSdkDQpleHBl
Y3QgdGhlbSB0by4gVGhlcmVmb3JlOg0KDQpUZXN0ZWQtYnk6IFNhc2NoYSBCaXNjaG9mZiA8c2Fz
Y2hhLmJpc2Nob2ZmQGFybS5jb20+DQoNClRoYW5rcywNClNhc2NoYQ0K

