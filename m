Return-Path: <linuxppc-dev+bounces-1343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC738978587
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 18:13:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4zrQ3VxTz2yks;
	Sat, 14 Sep 2024 02:13:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2606::62e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726244022;
	cv=pass; b=UI/ChtbBxzFW4ArCLKG7FonTxbE8Ko3GFU0u4g85yS0sYcY7isYLiDMt4UMqCg4YffPiyjNtTDSUciV5T1DfBNS+lxwm5PV3oQamSLuHRQjPoU1oYFCXckxwUnAKEhSOnPPiXqTFhz292ESzAS2Yiz1GuvvWydL4+s37qdUUf/GFDZ9Us+oKniCUpjwkWe47VvqphHwENZTjk79nOuR8o9tfvfcHdj+gMEmGSoFxYG/BxmfTTLB5lxw5MBr3e59G+8qqsYKQGdtXsoHM/X87i8w/kFUpR7CpBTNsxPY1zYJyjR42+ilGvpqs6pS3j1bw5I7ptCPoqntyQibUj5QP9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726244022; c=relaxed/relaxed;
	bh=9R80L5vQnyBzSUtRqXgypO9z18XQgNjYISmLFrvl5ec=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UdM9kuqpQVqFn0KuVWzqW5adDosumq6ZvngXmxWx1hVmHRUjgvXirTAlMbAgY3+UMGWB+H6zY3Bw6G/1wfX5etcWK+3DPKeHPjEbJRR6OzXTP9E6Qodc6waQWk/iQKP2SMxj1Uxws7y1pIKJYkacOqEpJadUU/f5Es7SGrIMQQwGntqpEr+QTlvfRrDKVSCayZiJ1o92rCXNHuTUT6PxaPSaywwPkaB7lf+fj+EAKTXnSv4XCWfkzvVo7hERMyYyN1sIMh1nSEQ3GmUH3T3c97vbLdnTamjyCKT9wXzB94tkSZHRsej7/8hzQKMZGtMpcWOmCBOvx7Uh1v/XsCG4pw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=rmolvz0+; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2606::62e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=rmolvz0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2606::62e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4zrP6vbzz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 02:13:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gfzPpPkylygWgdOCiIwKtxjaDGsL7k2JTUZRgaOrq6CAc6S+oieYTsInqNFDVpoxfo13xjsrG+32vzOp7/p/55mXqQFTYEx45s2liu+gGUP/CC6b9SGKbVCZ+wM12IpP35qjB4P5FLA/gKA7A7oyUyb3lwXxEw5LOUvaGDUgSjqIxEc454F2M5HQSl1G6TzJbrFnYFYD3ZED4W6qxr+ki1D+//+/COm9et7YY4TlTudBXCa3nGUqoXx0icQLY8pUl0l6sbgCBXsv3kNgHsj30RxMtx/n89XPZMk3Tk+m3AdcJQweqvhCRGyUAvaS/0bcCnLHEcY/xmrGIucKpva+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9R80L5vQnyBzSUtRqXgypO9z18XQgNjYISmLFrvl5ec=;
 b=yVmte/zNnPa0V4miOTZzGvp8OBqVYnwVe61jfsANOiFOIqgmdjMZFJonOZ9H6KWZwTTx6a2d+GXi7LU/zr6DqLvEHdQHcqJEpkl6apWZ3SdnkPLOSvze2Vha0/e4T4ZYy6uxh6KWH71BHt1ep/V5craXUyfJtVAZvLx6iRS7P4VnSIeOr53ZGPX8COuyUt+C9CUUo0wGIUXmUfniCz5G9wUhFngzdwC26M/fIa6b/IS1Z72keeCtMSh5lhNThhtU0fBFMU+APOkXbU/Htn4UV0OEjNN6QTVbPJDCi2RhG3At+PnibgP/A0ct28RXxRGZzbd71D+tU4URmtxVP0FwwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9R80L5vQnyBzSUtRqXgypO9z18XQgNjYISmLFrvl5ec=;
 b=rmolvz0+O3tDpGT8osMMwPQLwDE4VJbc7hPJhnfNQdtezGSQrTlxxwdzufu97cljhrCAbJd34ZkIGRFlAh6+NAHSOPRkTwse7VDTDEnw7Mf72eD5+xJp/WFca2VuH2pIao/WfIWh1p3ZqkZSGTQEuUGg2GWjzjd90Fqg+58uCRKW1+AjBpd9wtEh50Y45nVtrXei0khnYPBf8U/G9Py4w4ywdQK7T3ardhvaAiU04YixrAVCPlp2cHHbCeHsnbVKDGDyC9MYxeSXilCMjyzE1wNoCy56VoAtiPKR1NUf5z7LJTwNpt+FxMgksq1OFSHer9UXH21skpTXyIt791NBFg==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by AS8PR07MB8168.eurprd07.prod.outlook.com (2603:10a6:20b:377::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Fri, 13 Sep
 2024 16:13:18 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 16:13:18 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Jakub Kicinski <kuba@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
CC: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Mina
 Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Thread-Topic: linux-next: build failure after merge of the net-next tree
Thread-Index: AQHbBfJ0iiSDxx9vNU2ZWR+1kT0rXrJV3S4AgAAGnIA=
Date: Fri, 13 Sep 2024 16:13:17 +0000
Message-ID: <913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
 <20240912200543.2d5ff757@kernel.org>
 <20240913204138.7cdb762c@canb.auug.org.au>
 <20240913083426.30aff7f4@kernel.org> <20240913084938.71ade4d5@kernel.org>
In-Reply-To: <20240913084938.71ade4d5@kernel.org>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|AS8PR07MB8168:EE_
x-ms-office365-filtering-correlation-id: 78854182-81ce-44e5-2ed5-08dcd40efab1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dTV5K2N4bWtBKzJTUmhlUWlUWkd1MTRDU0l5N1lhbDZ1a0lpWHRZMDNPRi9w?=
 =?utf-8?B?SjFNTGZnY1pBUkxlcVYwS3RscGNDOW5xbkhQV3FNbUkzNlptUFMxS1ROb2Ew?=
 =?utf-8?B?YVhIZ2U1cGN2eWxTVkVWWk1RSkxmVVVkVHFZTDdFdE9LUnhRdEdLbDFhbU1F?=
 =?utf-8?B?bFFrMVk0cmpJaHM0YWFDZDVac210a1JtM2U5cGVTZUYzaWJMNVYwRkZhVFE1?=
 =?utf-8?B?UnV5NEI2Nk9yb2hvWmpUL0pKMHpGVkZmdE5qTHhTbVltNURUQVcwWDBiUkdY?=
 =?utf-8?B?a3pIaXdsNDlOcEd1QXJTWjY0UFlmZ0JyUnQwWnRmTm4vUFhVODQyS0ZPNGpi?=
 =?utf-8?B?Y0FMSWRmRHRKZ05DaW9XZG5RajliOHJnZVdqcll4TTdZbUxQdzE5VFpkc0pp?=
 =?utf-8?B?VmxRajlOczZneHJ4SWRrMUVsbXNXQUlWVVRHbHlpd1R2cmZPNnZhQ1FibG9y?=
 =?utf-8?B?MUpTcEl4ZFlmbklKR3g1RlJBa0wrTXlRclNhQzJLT1kwMmtzU2Z0TGNkbmZ3?=
 =?utf-8?B?alBZalhaK09teUh1SDdHZ3hTTUtSbmVSMFRkMlBDd29Dc1B5TXovUDNoTkJB?=
 =?utf-8?B?ZjZlNFNZNlZBZkdPdlFMWml6bFhYZk84K3NGR1hGdTR6L3Z5cFpYUXFpZ2x5?=
 =?utf-8?B?WlB0eC9iUENxQW9WSFdPNEFvSjZadzBJOEJXWTZZOHJZTkZEUkpRTWVMY1pR?=
 =?utf-8?B?ckZXYXZmWndrQlBNL1RjbUl2OGlqUTFtcW85dHk5QU8xNGhGY0xUNFVLYmc2?=
 =?utf-8?B?dEt0eTc2VVdiT2NvTjIvbStYUGxQNW9icnJ1Yk9LaVpEcVZ4dWU0ZjlSSldE?=
 =?utf-8?B?N3BCUlBTaWJkZW1qTC9YRlRta2JDTnNVWFNlSDc1akowY3RNTTZvZ3RsOTZq?=
 =?utf-8?B?NEpuN3pzS3B3ZDZZczVGSmo4WkM0OHlEa1c5Z1ZaMGFENC9JaTF4ZFNueHNZ?=
 =?utf-8?B?L2tjcVJibGE2b3E3Vk42MDNKUGZmR1I1NTFHakwvV1JMUVYva3IvY1pwand5?=
 =?utf-8?B?ZnNNT0Rwd0trcCtoUDJmQ1RPZCs1S0hKVlZlSllaZGdpWCtlazRsMjk5bjNT?=
 =?utf-8?B?eGtQeEdGWGFCQXJPcjZZdHYzKzJmcUNHQzNJdVZPMFVlWGZZSjY2c0cyemNW?=
 =?utf-8?B?ZWZKYUNtZnBMWkpmZmFXcHQ1eEUrM3ZXK0RneTdoZlBsUE5SQjBVR0piNTRk?=
 =?utf-8?B?NjN3ZVQ1Sk4zbGYweExoL3ozWUJFbzNvQVJObVNGaHBmZGV5SWxTd2MrTGVE?=
 =?utf-8?B?YzduK2lHZ2tRTEFqTEdlS3lhN2d2OVgzbjFzTFlWakxxK2pnVk1XdEQ1ZUE2?=
 =?utf-8?B?SmRTZ0M4emZBSVBVa0ZYRmlwc2RWZkl4bFFCNW9FdXRPODE2MkNnSlRWN3Rp?=
 =?utf-8?B?Y2FSMmFBMlhnbVc5VFloTUU2ZWhvakE3dktORUsxRGtxQ3dwVmZGUzl6aURm?=
 =?utf-8?B?VmJJTWJEcUdHMmNZaDhTSzJGa3NiWVJxRTJpMjlJdkZtc2V6amxnYmg3clNp?=
 =?utf-8?B?QkFwaEZXQlA2bmlpRmJEUXdybGs5NFZXeWVqeDIrOVFkLzN0Nk1NN0VCZm12?=
 =?utf-8?B?S3hZM0pwUXA2Q0h4YytWVEluT2p0QytjWm9oZzFRTWlTTFFmM1EyL3g2WXBC?=
 =?utf-8?B?RmJpZ0VMdTg4QXRyZEhCRytzUlRTRkxFWXBjWDRodDNUVnZNSEVLaXZWd1ZI?=
 =?utf-8?B?WkladWxsa3I4dlk2WGNnYkpnRTlEc3VlOXRBckJSY2tyb2J4ZWFwMHh0amN1?=
 =?utf-8?B?dkFrVTlHQjhvejhEdlBGaWJzM05zLzRqMUhTckZZNU1sbThSUm9rV295QzJD?=
 =?utf-8?B?Y0ppVWVRMW91VjB5RFRDclNuY3hIcVVTdHdBR3RMZ1VDcmRZQUU4T0E5ZVhV?=
 =?utf-8?B?VVJuNEV3VWd6VlVmNkpBS2JaNWtxWHdqTStGMHdrMTA2MXc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFFXbFcrODAvZ0N4RFhzaGMvSXRQcVpjbUVzcEhTYng0ZHFndC9rS08wUDE0?=
 =?utf-8?B?UXdVN3hqamhOSC9XaWFFdG9yZ2ordUxHWUI5NmRQWHE5VVRvaGszQkg0MzV6?=
 =?utf-8?B?TmtLcWFiNWNqei9GeW9qTmxjenM0YmVZVWpqR1IrNW4yemJnc3V1QVZ3R3k5?=
 =?utf-8?B?QzlmUzk1eHRZNXZxUkpiMStlRTJVQm85ZHZpNXB5bzBlcTcwNVFoL0ZDblZn?=
 =?utf-8?B?dHZwcnlaNzdOWGVLRnJjc2psRzhIZkpURU1TTWxpYjZ4aDU2eHVXa2d0SnBo?=
 =?utf-8?B?MllmakZSanhsTlpXaDduL1JySmFYcDk3dXBWamloaDM2cEhMMVVmUDlBT1ht?=
 =?utf-8?B?bUVLb0poWUVWL1FGMDNvTHhGNUwrYXN5a2IxekRERm5uNTZXZXVMSktkM3Nk?=
 =?utf-8?B?WVhId2c1TFFpNzJMNUZxa1NnT0FoR3dxc25Kd3RDdGphc2hCOWRKMlNBS0ox?=
 =?utf-8?B?OHphMUhjKy91TnZhdDcyMTgwNUw1Y1hOMGxUZzRvWFEyc0Z3L1FsZFgzRTRl?=
 =?utf-8?B?b3RMUVNvNEs4a2tIWGpCOU1pZmRPTUZ1WXE2QVN0K3N1SnErdWZaRmVqWkpy?=
 =?utf-8?B?NVVNSjZzd3JLUVB5dGJmSGdRNGZUQkYwc3FCQTl4Y1haa2tQVE1HdEFSeWRy?=
 =?utf-8?B?WjNTRUVhbHhpaFBJdklIaUhJNGZMSXF0ejVEcUQxSmxqc3ZoSWptOElDOXFl?=
 =?utf-8?B?cnMrTTJRakhpNHlGWjQ1OVZvWEhHdldOd3FqSUswQm9YalZHandYTVVPNXAr?=
 =?utf-8?B?TXlwYVZ1TFVLaGMrcE82VWJPdjRET3VkVzVkOXhjOGZuRVF1YVVoSTRqNXFm?=
 =?utf-8?B?REYyalZraHEzaVZ4cTVUTEE3Y2FiSm00UUVlOFhkYTc3bUJqclF4RDIyNEJD?=
 =?utf-8?B?ZVorbmx4eEdLUEFHVWQ0Rm11czR2VlJvcmEvU0ZyQXpoRExpUXJQcno5OVh6?=
 =?utf-8?B?TUFrbnoxT1QwWTNDejFrRUpmNGFTZ3RCNzlVVVBuaVBDOG8xM05MaUhSZ2tJ?=
 =?utf-8?B?SlpyMjlyUzFOM0JKSkswcXJPUGNCNlphbjlZc1QxcHVaQndUd0dheUtkaHNj?=
 =?utf-8?B?dmxsU1NMOG5hWWluVW5MU3N6YTkwN0l0dzRTbFluUlpYUGxRNzlGeU1oZ0dT?=
 =?utf-8?B?TXNiYnl4NG1yekl0QTdONUhaNUcyVFNqZWZJV3FSa3dITms4WXBwUndpN3pZ?=
 =?utf-8?B?S1NUS05HSkJJcFFDYmNmTFgwemFpcWJxNWJ1ZkxvUmp2TG1EbTAwc0ZwMUFO?=
 =?utf-8?B?NE5SL2N4QjRPOUZRWm1WRDBxaEx5WGxYM3lvYWlGY09XWjNJdTgrTTlrSlE2?=
 =?utf-8?B?dFhiUEw0cWdnSlYxNXBJWTAyZTBQbzJrdnk4YkpvYkZ6bnIyMzdXMlIwWi8z?=
 =?utf-8?B?RU9YMGhrV3AyMFNqcjZaTS9UN3ZsOVJjUytNTFVxWjZ4M3QxeEt0ZW8vanEz?=
 =?utf-8?B?Qm9UQ0F0UTRBU1hFYzhoaDlaTXRWWW5LcGFDSzhBMDZETnoyb1Y4Wko0YTcv?=
 =?utf-8?B?dWR1NlRweFhnUDNiM3hrWW1Pdy9nR2c3SjVmUVBpaGZFMi9FMU5HRitwS0VG?=
 =?utf-8?B?Uk5iTkkyVG40Y3JkKzQrbkxQUWhRdzRnQzVpVk1LcFRPUmpRclV3WW5Rc3Zj?=
 =?utf-8?B?UExZKzZ3T0tpTWJmV2QyTWxZZnJmb2V2cVRBTVMwT1dQOHVUMm5kZ0cvb1E0?=
 =?utf-8?B?TktpRC9sUitUWFVuaGYzY1I2QkoxaW4xVFFqOVpDNE1PMDVOaGdJY1ZHOHNq?=
 =?utf-8?B?LzcwL05yRHhtNXMyeVZPVkE3WG10aVdValZZWFY3WktUTWU3RHIwNktXS0NT?=
 =?utf-8?B?K2w1SU1qMzNJcWxaRHFFQWFtZXJMUHVISGtkeXFlZmtRY1A3NGlDNk9FYjBZ?=
 =?utf-8?B?bzVScWpFNEI2MWh4SEJGMGFqbWF0djVhdGZjNEJ2eTRZZlA1V2NzeE5jUGxL?=
 =?utf-8?B?S1cydStISWF2OHNBNVBKNEVNdlBPMlQ5RWZ2dnpTaW9UT2NwK1ZCaU8waFNo?=
 =?utf-8?B?bGtCREdFelE5TzhkVnNNelg2NnNQcFM2VGVhbXZVcmVYZ2lnSHZQZ2xnbEFH?=
 =?utf-8?B?K29zTmM0aWZQQ3lVY1RHSEdxQTE2NW1teXg1ZCtZdXAwbllIYTh4bEYvZjJ0?=
 =?utf-8?B?eHJWM2pYVko3ZkljUFE3amwyUTVjUmxSL1kydmUrbUxOVTdvV0IrQ1ROK25Z?=
 =?utf-8?B?elhTTXJsQ0VLUndUcDkvVzZKQm1YdlZ6aHlHTFR3KzNLZlRmdG9YOTI2NE1C?=
 =?utf-8?Q?4nMywSGzTkI8ZE9ZISz8H0hD5P667cKq8XbywylJEA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61AB939F18B1724FA733F4F5D0E91BC7@eurprd07.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78854182-81ce-44e5-2ed5-08dcd40efab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2024 16:13:18.0104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xxl82t2lRU4qZ4wDjqQrT5tqofJsZGYKLjG5bpcMtq++LG9gGD5Fm/Bwe3fB6Mnr/DT91i6yILfPo8vuM8IFkSNBXEyIk/dGUiFqrii4zzBtiqP2dkdtBxqugCwHtGb3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8168
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS8PR07MB8168.eurprd07.prod.outlook.com

DQoNCkxlIDEzLzA5LzIwMjQgw6AgMTc6NDksIEpha3ViIEtpY2luc2tpIGEgw6ljcml0wqA6DQo+
IE9uIEZyaSwgMTMgU2VwIDIwMjQgMDg6MzQ6MjYgLTA3MDAgSmFrdWIgS2ljaW5za2kgd3JvdGU6
DQo+Pj4gVGhlIHNlY29uZCAiYXNtIiBhYm92ZSAoQ09ORklHX1BQQ19LRVJORUxfUFJFRklYRUQg
aXMgbm90IHNldCkuICBJIGFtDQo+Pj4gZ3Vlc3NpbmcgYnkgc2VhcmNoaW5nIGZvciAiMzkiIGlu
IG5ldC9jb3JlL3BhZ2VfcG9vbC5zDQo+Pj4NCj4+PiBUaGlzIGlzIG1heWJlIGNhbGxlZCBmcm9t
IHBhZ2VfcG9vbF91bnJlZl9uZXRtZW0oKQ0KPj4NCj4+IFRoYW5rcyEgVGhlIGNvbXBpbGVyIHZl
cnNpb24gaGVscGVkLCBJIGNhbiByZXBybyB3aXRoIEdDQyAxNC4NCj4+DQo+PiBJdCdzIHNvbWV0
aGluZyBzcGVjaWFsIGFib3V0IGNvbXBvdW5kIHBhZ2UgaGFuZGxpbmcgb24gcG93ZXJwYzY0LA0K
Pj4gQUZBSUNULiBJJ20gZ3Vlc3NpbmcgdGhhdCB0aGUgYXNzZW1ibGVyIGlzIG1hZCB0aGF0IHdl
J3JlIGRvaW5nDQo+PiBhbiB1bmFsaWduZWQgcmVhZDoNCj4+DQo+PiAgICAgMzMwMCAgICAgICAg
IGxkIDgsMzkoOCkgICAgICAgIyBNRU1bKGNvbnN0IHN0cnVjdCBhdG9taWM2NF90ICopXzI5XS5j
b3VudGVyLCB0DQo+Pg0KPj4gd2hpY2ggZG9lcyBpbmRlZWQgbG9vayB1bmFsaWduZWQgdG8gYSBu
YWtlZCBleWUuIElmIEkgcmVwbGFjZQ0KPj4gdmlydF90b19oZWFkX3BhZ2UoKSB3aXRoIHZpcnRf
dG9fcGFnZSgpIG9uIGxpbmUgODY3IGluIG5ldC9jb3JlL3BhZ2VfcG9vbC5jDQo+PiBJIGdldDoN
Cj4+DQo+PiAgICAgMjk4MiAgICAgICAgIGxkIDgsNDAoMTApICAgICAgIyBNRU1bKGNvbnN0IHN0
cnVjdCBhdG9taWM2NF90ICopXzk0XS5jb3VudGVyLCB0DQo+Pg0KPj4gYW5kIHRoYXQncyB3aGF0
IHdlJ2QgZXhwZWN0LiBJdCdzIHJlYWRpbmcgcHBfcmVmX2NvdW50IHdoaWNoIGlzIGF0DQo+PiBv
ZmZzZXQgNDAgaW4gc3RydWN0IG5ldF9pb3YuIEknbGwgdHJ5IHRvIHRha2UgYSBjbG9zZXIgbG9v
ayBhdA0KPj4gdGhlIGNvbXBvdW5kIHBhZ2UgaGFuZGxpbmcsIHdpdGggcG93ZXJwYyBhc3NlbWJs
eSBib29rIGluIGhhbmQsDQo+PiBidXQgcGVyaGFwcyB0aGlzIHJpbmdzIGEgYmVsbCBmb3Igc29t
ZW9uZT8NCj4gDQo+IE9oLCBva2F5LCBJIHRoaW5rIEkgdW5kZXJzdGFuZCBub3cuIE15IGxhY2sg
b2YgTU0ga25vd2xlZGdlIHNob3dpbmcuDQo+IFNvIGlmIGl0J3MgYSBjb21wb3VuZCBoZWFkIHdl
IGRvOg0KPiANCj4gc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIF9jb21wb3VuZF9oZWFkKGNv
bnN0IHN0cnVjdCBwYWdlICpwYWdlKQ0KPiB7DQo+ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaGVh
ZCA9IFJFQURfT05DRShwYWdlLT5jb21wb3VuZF9oZWFkKTsNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgDQo+ICAgICAgICAgIGlmICh1bmxpa2VseShoZWFkICYgMSkpDQo+ICAgICAgICAgICAg
ICAgICAgcmV0dXJuIGhlYWQgLSAxOw0KPiAgICAgICAgICByZXR1cm4gKHVuc2lnbmVkIGxvbmcp
cGFnZV9maXhlZF9mYWtlX2hlYWQocGFnZSk7DQo+IH0NCj4gDQo+IFByZXN1bWFibHkgcGFnZS0+
Y29tcG91bmRfaGVhZCBzdG9yZXMgdGhlIHBvaW50ZXIgdG8gdGhlIGhlYWQgcGFnZS4NCj4gSSdt
IGd1ZXNzaW5nIHRoZSBjb21waWxlciBpcyAic21hcnQiIGFuZCBkZWNpZGVzICJ3aHkgc2hvdWxk
IEkgZG8NCj4gbGQgKHBhZ2UgLSAxKSArIDQwLCB3aGVuIEkgY2FuIGRvIGxkIHBhZ2UgKyAzOSA6
fA0KPiANCj4gSSB0aGluayBpdCdzIGEgY29tcGlsZXIgYnVnLi4uDQo+IA0KDQpXb3VsZCBpdCB3
b3JrIGlmIHlvdSByZXBsYWNlIGl0IHdpdGggZm9sbG93aW5nID8NCg0KCXJldHVybiBoZWFkICYg
fjE7DQoNCkNocmlzdG9waGUNCg==

