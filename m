Return-Path: <linuxppc-dev+bounces-15590-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFBED15310
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 21:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqkLK0JN2z2xKh;
	Tue, 13 Jan 2026 07:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.83.57 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768249304;
	cv=pass; b=PefCMnM4cXbMuyQaMBAgK69R5A1mRQZdaBGBkIxR4eDHfD5TgdH5J4bqgPlP+dSQwsY+V5a6i+MC8/G1RNoq/8ngg/3Mif8p2HSdmpnXKsdHOFC+GEnNPEr/hYC7Reyx/qeOzsDC3NDfa3+ZekBncJrtN/F+tNKF04GaF5MTGntU1HGVRdTKw3qNCAGMqMbMMxlKj+9GkQzox6fj5NEj9lyfKJxzJbcxBfhYYFMcJO96QYno3fnbswtFPB4COW7VM9Y398qyI+KtcTcdM48XFhxhp/5QIimtaAY4DqZdDm1EWr0eqGm3seqE+Rf8tGeBSbrtYpf7TJ+iHAIPqY6bOw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768249304; c=relaxed/relaxed;
	bh=WAN5r1v8OYptJAnYIwJm+c4anvTPXv59QFLdC/CDGQg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E7xinXNLlPmPNnKMiH/f9W29WDTFYOrGdcXXeIr89LrY1nYXlXDhcIVKnlepFI5WLRyP14ci4be0R/rhgOiLa2wjuEOTgDMDGSzHzyuT249fly+L8uJy+9XgfTuV6m2T9W+PY9VwV+AWEjSq4dDRWjqN38GZWLNOje1nJmEb+td4B9rYQdNaAsA8ioBGf2HDTtVgkfoYYbzDwnG/Qz935G2syAXcVQfsy7izA2ZM3DA98MtRMweJL6JNij8HRw2So4UFWLm3CYL8XY1NiyjxZ8WdmAT4LTZDvWLp58Vl+PoCNA6NyTiqvq6bP5EbZMXu8tPiSqpC7M1oAVjygdlO6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=erlRc5LS; dkim-atps=neutral; spf=pass (client-ip=52.101.83.57; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=erlRc5LS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=52.101.83.57; helo=gvxpr05cu001.outbound.protection.outlook.com; envelope-from=roy.zang@nxp.com; receiver=lists.ozlabs.org)
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqkLG5R4sz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 07:21:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPqJch7QevDmOeXnrUyPMZF6+76RIBBO15It4dhvRuRUg8PLOwWZUNFKi1hngxXEzViT16xrRxAlY9eMkxKPUtaTGMRiOy5K1r4X4CNPn6ijxtE0wDpedhBm8oadMlQ3NOpkc4GzMLmQ4ITBoBgBEXyGxBA80nisrbOMfnGuK3fA/mcB5CZJF039EpQDnjPYZH3Wfpljb/daqSeR4EX3FOg84/sxr7DKIx7Hr8AS8+Sz3Gqd49KB90jo6wrB1qBVARaxWClq5CaeVe1G8Ch7KCsvlhl19cb7DY7bFy6DixLslPBxQzIOj9mLqZMYAXAwebfHRSdTOJ2XMokrz8ZN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAN5r1v8OYptJAnYIwJm+c4anvTPXv59QFLdC/CDGQg=;
 b=CDdqcE5g70p9sHaw9tBmBhhoF1Ca3w3Auqw6VCMhJ4Ho+BT3z1U5hI1N6+ZGz8k1zJUPzCrwEIDgGOXWFRQ9QJn17TFdbXVBj7zdYV1Bwjxlr38EykfYt2r5A8bgjFOWDGQlOHPOprFndoT89T635HzViAiugHPv4wuAygpF9SO6T3g/AW4O/ypmOa1A1G4I9rwKVOEk1gBch50gsgbmpQ5UDl+RjkypgNs0q4Oil2IZLB4z6d9P5zhvWC2dEnd/+2AqDbcFSx4hquf/Dc0ChSOjvvZWALSZfob+kEfBw6rqkann/ZUtU2ZQ7LM9XuHYWYfCG9sp67xOvugTBraS8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAN5r1v8OYptJAnYIwJm+c4anvTPXv59QFLdC/CDGQg=;
 b=erlRc5LST+Ug3IVClduDYgdZ74rbEhePI0Zxfmq9pQflP/nvW0cCFR0ykV8nQAo3LCosNZwo9gsMmhxPjEDxiSn5NiGAPVvseWqHSUlFxMI9Rr40j7NyZKH/JrbfZcEVvOaGwNOYes/kwc/VuzWn4s8avfxUTgUGh//YsHMq/C03TG/4QndqwF2liptQ2PR0QYSZNEBYyN+IEKFnlC/B+tcqHVF0qj9nWw2ErPmXMebzkaaboYGvuQLcvt/S6QEZST6IRMG+EyelqUkv8DAO9pAwmYaStZVqssh1kZxm7XGqpRxXwlzN4/F4uzCUgA0YqUjlsjstZrNS6tbTlWk7Gg==
Received: from VI0PR04MB11867.eurprd04.prod.outlook.com
 (2603:10a6:800:31e::21) by PA4PR04MB7728.eurprd04.prod.outlook.com
 (2603:10a6:102:e8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:20:58 +0000
Received: from VI0PR04MB11867.eurprd04.prod.outlook.com
 ([fe80::b1b4:89df:ae71:1ce8]) by VI0PR04MB11867.eurprd04.prod.outlook.com
 ([fe80::b1b4:89df:ae71:1ce8%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 20:20:58 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Minghuan Lian
	<minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Jingoo Han
	<jingoohan1@gmail.com>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: RE: [PATCH] PCI: layerscape: Allow to compile as module
Thread-Topic: [PATCH] PCI: layerscape: Allow to compile as module
Thread-Index: AQHcg/gdl72Cj0Q/nk6gE4ZQzWrsqrVO9g2w
Date: Mon, 12 Jan 2026 20:20:58 +0000
Message-ID:
 <VI0PR04MB11867EAC34C1076F0A36FA2228B81A@VI0PR04MB11867.eurprd04.prod.outlook.com>
References:
 <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
In-Reply-To:
 <20260112-v6-19-topic-layerscape-pcie-v1-1-1cd863fce50e@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB11867:EE_|PA4PR04MB7728:EE_
x-ms-office365-filtering-correlation-id: 89dc0ee7-9553-4513-ec4e-08de521818f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|38070700021|4053099003;
x-microsoft-antispam-message-info:
 =?utf-8?B?YVBYVmZLWSs1NjVUejBOeUlsM1ZTd1NWYktPaHRTVXcrcXhKYS9aYk15TTJS?=
 =?utf-8?B?T2Y2TmQxbXlucCtJYWpicXdWVWxuTWRxUU9sRDhzL3BZTldQUU85QWR5SHBZ?=
 =?utf-8?B?bmpUVXRVcnh2ekNDeTdoeVZaS0ZLOXFIUnpSc1Ftb2p6S1JRenlIVVpUTzIv?=
 =?utf-8?B?aG0zRVgyeFZOcWFnZUtybFJyMWpUQURrSlg5Ty8zcEFYL0ZZWXBKd05lNU5J?=
 =?utf-8?B?aFJjV3FwejNZQnRRZGxDQ2pRamJONzBGa1EvUnZERy9kRGZxcm1qcUQxRUZ1?=
 =?utf-8?B?RUNJU3pOR25PaGh4ZEJ5Zm1odWJKUEE4UjdURHRCM1F6YjIzRTJNb2dzQk9v?=
 =?utf-8?B?YitnYmJVVWZTYnJvdzNGR1B3aUpudzJFaG5KYmRTZWh3V1EybE1aU0dIRjg1?=
 =?utf-8?B?amNUNE15SjVRZUt6b25VVGFib2dENjg3dzQzWmM0dHUvajNlK3JJNUxJMzB0?=
 =?utf-8?B?MWp5c0ZrMVhRZ3drTHNBSGNORkVnbjViRFZ2VjRTLzlFcTM5clBLb2ZjWlpa?=
 =?utf-8?B?RDlBNDMvRWV4Ymk2bnQ1SU16dWJJTnBnZ20yeVB5aWFHbVN2WnAyNFdvcUg1?=
 =?utf-8?B?dUhzelhBR293TEd2SmF5RXhsdFNzM1VyTHBCNnowVDQ2a0M2ZkxtYk1oNmxL?=
 =?utf-8?B?T3dPWThra3duL1RDMjhsREg3VFlUbHVBQ3paMzNCUDhFUlNPV3BJYUxGN0ZI?=
 =?utf-8?B?UmkxSEdHVXBPalBtSCttOVJ4NHpjWGRCSkxvUGppcFRIOE9idWw2QVpST0Vu?=
 =?utf-8?B?NGlTTS9VVlh4bDAxTEQ2eEdhYXovWFhZMjVIZCs3aGZxYzZLbEowVDBXUm9J?=
 =?utf-8?B?a3lvTXB0MEpqQ0RiNWFWTjJHYVphYzZ1TU5FV0FKUVRXVmdvbG1WYlRmU09r?=
 =?utf-8?B?SkFaOVJLOUltTlpyaFhVZnRadVdsRVh4bzZHdnBtQklJTVJFNzFBUG4vNWlQ?=
 =?utf-8?B?UEV2WjdGVElzRFVDL2pCRGxRUlZhbW5jNzVMRENkSHlvdVZpZStpeEpaSzZr?=
 =?utf-8?B?TlcycW9GSDBzdFJMNHhWRTd0Z2t4aVpXSFRUWkVYYUNBZnlsSHMvVGViTUR1?=
 =?utf-8?B?Y2tub3REUnp3SHJCbEMybytqOTFsN0ttU2hMY2NjSGMzVGk2ZmVkUjJZNHhC?=
 =?utf-8?B?RXJVN1hqQ1RXRXFoUmV5QndUZ3pXUVFNU2NwU0pCU0tWelF3SEcxbnV0V05Y?=
 =?utf-8?B?WG9xaFk1V3FqWEs1QnZnekR3dVkrMEgrbnhwY3habGJJaGxickFDWmFCRFU1?=
 =?utf-8?B?NE9LaWJmMzRadlI4SGhjci9oNm1DSEw5M0EvdTZBZU96WTg1b1pOQmMwbGJZ?=
 =?utf-8?B?VHoydFhJZjBsT2xNRkNpOW1Ed3pyR1IzN0NsdXdjRVJYWDlGSGNoaThxellt?=
 =?utf-8?B?UTh1dmxVTVpUU2FJVnRDTFBCcEVSd1JIMXhqK3lqODc1M1RLRWhaSTEvQUt1?=
 =?utf-8?B?bDFZYVVhTkNpVmJiMkFGNCtuV0w3dFRzSUFhbVNkUnZKTFpJdUxKM3N1RTFO?=
 =?utf-8?B?bEhvY0NJTXdqbkU2WkRndVNFWk5ISE8rTVhoaFFkM1pQY09pbXB4Y3V1bjNI?=
 =?utf-8?B?WjJJeFpDbzNkK0NMeWx3d2NCZXBCUnYvb1UxSlo4ME8rS2JndUNKZnQ1bFhW?=
 =?utf-8?B?T2dDWk14YkdpR0Vmd3Y5TTFtWkh5dGFkWUJ5S3Y5RGlHblBBbEpCNkQxcElJ?=
 =?utf-8?B?TWhQNTRVUGp3ZzdEb0Zwc0NXaWNhTzk0UFZLUDFiVEJZZXhGYzhkbENHSFA2?=
 =?utf-8?B?Y0VXTExzRXNOREN2aXpyRE1tTUhmYkVVcmljWTB5eEsvVEpOUHZCelo3a0Jz?=
 =?utf-8?B?d2VyZTcwYmVhTkc2ZFhFTVdHZm55NGc5VFByYVUyaUUxcjZORlVZbzJVSDlE?=
 =?utf-8?B?T3NLWDlQa3Jrd1R5czQyTXlXemcvL1F6UXdLRXpTdHo3SWI0eTJuZFdtSkZ2?=
 =?utf-8?B?ZGl6QWh4dGxXaW5MQ0RWZTQ2ZjVnVjBQRHNUTkM3WXhrQkhobEtHR25tdFZQ?=
 =?utf-8?B?czVLY3ppRWs1MGNnUmNVVUNOUkI1SStIUWxBNDR3YzJPZktNZ0c0VDErRFMw?=
 =?utf-8?Q?9gCESi?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB11867.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(38070700021)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cGs0ZGdwa1JzS0psNTYwdFNwcmQ4bCtKYWFKd3FGRUVRU2loVmdxeVBlUTJa?=
 =?utf-8?B?Z1o1VEhGTnNjZ2Yyc3Bhd0lxVkZlcUNrMkZOYm05VDNVZDA1Sndua3JKQVdx?=
 =?utf-8?B?eXh0MHVlSndBRHZpOXh0NExIRzhXbWlVS2JZZmtWNnFzNS9QWXpQS2IzR1Rw?=
 =?utf-8?B?V3d6SjQxRWYvZ2lzT1c0VzlaLzExcElFdEV1VTJJL3loVE14dlFJWFlYTVdl?=
 =?utf-8?B?SXJGS3VQQ2QwWnR3NFlCMnA5OG1QaFVmbGZqODVQVlpKOEMzV3BxQ1NFbk9O?=
 =?utf-8?B?aHFQcFlhMXVKbUdHV2xMYjNPb2FRVFVRV3Q1dE0rWTdYZ2VhZ0Yzalo1UldK?=
 =?utf-8?B?MnppVU00OUhxaTBiUGxlNy9tQ1Y0VTk4VEJVc1hVT3JDaWJVUUtkdVlMMGxO?=
 =?utf-8?B?aVRVZGVIa1BBakJSYkFsbkhpVmdvMW1FYll1Z201R2t6OFZoRm83Rko1djdF?=
 =?utf-8?B?dUpwWXJOL3c5NGJPOWJQRzZkV0pLaHF4MTJqSVRPdHgxbGpOTklzRExFQXJa?=
 =?utf-8?B?RnFwUTF0bmpxNVUxK2ZLc0Z6ZjhGYmdYQ2FNMGd1RmRETEpndDlveFhqZWNC?=
 =?utf-8?B?WTN2Qk11RGFBY3JLdGZETHJOSUF3eUc5VldHak9nRjNPSnpNL2ZxQnFxTnpO?=
 =?utf-8?B?eldrUm5sZWVkRkZCWC8xNkxGUW9CbkFRQ2NtUTJtS0JUNEYvbUQwbnFGWnVK?=
 =?utf-8?B?d3VhNWNock9TQmJrNzFSQVYrVFdOZlgyenV6NFZId2YrWlZhVk9iLzlhRlBw?=
 =?utf-8?B?UVlWM3VGNmN2eUJwZ1Z2aUkzZWJMRE5yM3pCZE02VVp3M2VoT3AyUHVGcGRQ?=
 =?utf-8?B?QmYwbC8vdmRVS2FTbEUxNGxXMzIybm8yNHMyejlKbW92SFo4dWQ4ZEtFV0Rv?=
 =?utf-8?B?QmdGYzJFQUNWMGhpT250RXF1M3FGQmZNRFNBUUJobkRiaXVhSG5tY1Bqbndp?=
 =?utf-8?B?R1RLdy95Vzd1WnI1czdDZ09wVHFYY3JPOU5VSDdMYi9qS01yOHR6dkU4LzJY?=
 =?utf-8?B?S2phSUdKQ0tXY0N3OHlMTXRjaVJuam1sQ3Y0WjdKdTdXTUZFbnNxdmppcC9E?=
 =?utf-8?B?SWNVOXlsN01iZmNlSktzbXIyaXlkMzd3NkZ0ekdyYlRoUmlZU3JXYkY4TzhE?=
 =?utf-8?B?aHVZNmo3UzdCWDdUSFlReGlOWHh5dnpmMllKNUdsdHQ0WGdZcHU0UDlObXo3?=
 =?utf-8?B?UjdZcDdlSkM4SDBYVWVkc0lGN0I1MDlQV21jZHVuclJDYTJrMmR2QVFXc1lZ?=
 =?utf-8?B?SFAzS0ZZRURlWGdOTHVmNWdrMUxMcVd1NjNhTWZyM2d4QzdhbUkzbDJQbG5B?=
 =?utf-8?B?TjVrMjBadUtzQ2FldVZJMk9qV0I3RE1Hc1o4ZUk4VXdQd3pqY2JMYTVHMThH?=
 =?utf-8?B?dnFUa2xjZXdqb3N1WlBJWGhQQ0VXVGlIbEFWYU9xamtTT1R6aFNEclNaeXJX?=
 =?utf-8?B?aGc2YzdISXRpMnRpaEZaeENaMXJHN0w0L0NPa2RiUkJKejkxS3hCcGFxSlZy?=
 =?utf-8?B?cjN6ek91NjVEZjFSQWlTblBOZkd0UlFJei9BUTFUUlRQNG55WDFxRnlaSDdY?=
 =?utf-8?B?VlVMbjI5S0lmZG4zbmJFbGg5dS9kZUcreE5XSVNuYk1GTzc4ZGJSTFIwS1ZU?=
 =?utf-8?B?SzUvWVduVFYzRkpyWER2NWFvMU8xbHRkU2lIdFBnZGRoNGNtR1p0R0lEbm52?=
 =?utf-8?B?ZkNWTS9CVUlOOS9rZm1WVUlicWtqeGVHNi9iSVVVcm1DUFl5bjBpV2QrVzJT?=
 =?utf-8?B?WmROWkVjS0ovZjlKclZvSjNmL2o3T0JjUGRZc2NrN09EdVlybnIrZzkrVXBm?=
 =?utf-8?B?Um1QczE2N2dkKzRCcTM0SFNOcGNzbDUyK2FadDAwR0thTnRwL3RsQWdFQ0d4?=
 =?utf-8?B?b3NPNFExQlVxQzNTRVI4MHBSTms3bVkvQnY1VHM3UWFUUU5FQmVmaXNpeEtZ?=
 =?utf-8?B?K0xnMCsyclZpTVlHVE9tNXFDOXlBVWZtdmtFZGlNZ2hUZEtXdXFEa0twSmV2?=
 =?utf-8?B?R09iSXNlRDNpVlUyekVXNGpXUW1kSE8wL3FnSktxakRCQzlCZzJkd2tWaHdY?=
 =?utf-8?B?TDBQckVmbjdaWC9VaUtLL3EwVEkzalJWbEdQQi82ZHIzb0hwdXdsSmdkMHVE?=
 =?utf-8?B?ZXEwSkIrQVdNa2h1UU1vT3V4UHA1aHNpb2xIOG5pOVFEY3Z0VkVJekZDaFQ3?=
 =?utf-8?B?SFdFYjJTcERQcTNScjhPRUJXeTBpbWNBenNOVHJHMDdheS9OOWMyWHU4SjJt?=
 =?utf-8?B?YlI3RytVdC9zVHFCUTZZc2lBdWhIbjJMQTZRdTJoRmU1ZkY1dHZwVnBhRGdI?=
 =?utf-8?Q?CiV8gdnudvbP5cMAuI?=
Content-Type: multipart/signed;
	protocol="application/x-pkcs7-signature";
	micalg=SHA1;
	boundary="----=_NextPart_000_01D0_01DC83CE.AA986D10"
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
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB11867.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dc0ee7-9553-4513-ec4e-08de521818f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 20:20:58.4441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jho/WQn8hqgIQxiiGS802fMYZsrf70sG5qruApraDNi69W4tbXhKn4mXAPPDERbAM2AZbMFzeQEtB1Xuwg76nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7728
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

------=_NextPart_000_01D0_01DC83CE.AA986D10
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit


> -----Original Message-----
> From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Subject: [PATCH] PCI: layerscape: Allow to compile as module
>
> From: Sascha Hauer <s.hauer@pengutronix.de>
>
> The layerscape pcie host controller could also be compiled as module.
> Add the necessary infrastructure to allow building as module instead of only 
> as
> builtin driver.
>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---

Acked-by: Roy Zang <Roy.Zang@nxp.com>

Roy

------=_NextPart_000_01D0_01DC83CE.AA986D10
Content-Type: application/pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIhUTCCBaIw
ggOKoAMCAQICCE4Rpu+H69FRMA0GCSqGSIb3DQEBCwUAMGUxIjAgBgNVBAMMGU5YUCBJbnRlcm5h
bCBQb2xpY3kgQ0EgRzIxCzAJBgNVBAsMAklUMREwDwYDVQQKDAhOWFAgQi5WLjESMBAGA1UEBwwJ
RWluZGhvdmVuMQswCQYDVQQGEwJOTDAeFw0yMzA0MjEwNjQzNDVaFw0yODA0MTkwNjQzNDVaMIG2
MRwwGgYDVQQDDBNOWFAgRW50ZXJwcmlzZSBDQSA1MQswCQYDVQQLDAJJVDERMA8GA1UECgwITlhQ
IEIuVi4xEjAQBgNVBAcMCUVpbmRob3ZlbjEWMBQGA1UECAwNTm9vcmQtQnJhYmFudDETMBEGCgmS
JomT8ixkARkWA3diaTETMBEGCgmSJomT8ixkARkWA254cDETMBEGCgmSJomT8ixkARkWA2NvbTEL
MAkGA1UEBhMCTkwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDAWrnSkYP60A8wj4AO
kATDjnbdgLv6waFfyXE/hvatdWz2YYtb1YSRi5/wXW+Pz8rsTmSj7iusI+FcLP8WEaMVLn4sEIQY
NI8KJUCz21tsIArYs0hMKEUFeCq3mxTJfPqzdj9CExJBlZ5vWS4er8eJI8U8kZrt4CoY7De0FdJh
35Pi5QGzUFmFuaLgXfV1N5yukTzEhqz36kODoSRw+eDHH9YqbzefzEHK9d93TNiLaVlln42O0qaI
MmxK1aNcZx+nQkFsF/VrV9M9iLGA+Qb/MFmR20MJAU5kRGkJ2/QzgVQM3Nlmp/bF/3HWOJ2j2mpg
axvzxHNN+5rSNvkG2vSpAgMBAAGjggECMIH/MFIGCCsGAQUFBwEBBEYwRDBCBggrBgEFBQcwAoY2
aHR0cDovL253dy5wa2kubnhwLmNvbS9jZXJ0cy9OWFBJbnRlcm5hbFBvbGljeUNBRzIuY2VyMB0G
A1UdDgQWBBRYlWDuTnTvZSKqve0ZqSt6jhedBzASBgNVHRMBAf8ECDAGAQH/AgEAMEUGA1UdHwQ+
MDwwOqA4oDaGNGh0dHA6Ly9ud3cucGtpLm54cC5jb20vY3JsL05YUEludGVybmFsUG9saWN5Q0FH
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
iDAfBgNVHSMEGDAWgBRYlWDuTnTvZSKqve0ZqSt6jhedBzCCAUYGA1UdHwSCAT0wggE5MIIBNaCC
ATGgggEthoHIbGRhcDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENOPW5sYW1zcGtp
MDAwNSxDTj1DRFAsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049U2VydmljZXMsQ049Q29u
ZmlndXJhdGlvbixEQz13YmksREM9bnhwLERDPWNvbT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0
P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGL2h0dHA6Ly9ud3cucGtpLm54
cC5jb20vY3JsL05YUEVudGVycHJpc2VDQTUuY3Jshi9odHRwOi8vd3d3LnBraS5ueHAuY29tL2Ny
bC9OWFBFbnRlcnByaXNlQ0E1LmNybDCCARAGCCsGAQUFBwEBBIIBAjCB/zCBuwYIKwYBBQUHMAKG
ga5sZGFwOi8vL0NOPU5YUCUyMEVudGVycHJpc2UlMjBDQSUyMDUsQ049QUlBLENOPVB1YmxpYyUy
MEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3VyYXRpb24sREM9d2JpLERDPW54
cCxEQz1jb20/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25BdXRo
b3JpdHkwPwYIKwYBBQUHMAKGM2h0dHA6Ly9ud3cucGtpLm54cC5jb20vY2VydHMvTlhQLUVudGVy
cHJpc2UtQ0E1LmNlcjBRBgkrBgEEAYI3GQIERDBCoEAGCisGAQQBgjcZAgGgMgQwUy0xLTUtMjEt
MTkxNTIwNzAxMy0yNjE1MDQwMzY4LTMwNzY5Mjk0NTgtNjMxMTU5MA0GCSqGSIb3DQEBCwUAA4IB
AQA3/Dd1a+EHwL+AHpwSghyD5OCgILaIgL9W+OgJ2D5EKrOilETssP4FCTzZWMVKS1VWqglY1EiE
Dw30admpZ405aPcBa3Dmf5OnL9FMKL7Akty4U5VOotSeQVwrRazWHPt+GgDmqRtjq+k+wUFtIG+n
Bgo2OeTT3NxQ9PYv9HiIfuYybwHBooiO0v0b0zaVcI1MkajE4Yh4PjU3amwh6T5X4uKpQCJJAZmM
JF9OP+SSq9T7QP6qmtgRd6fVU6jMPHUrOvewel2l7mJKFdeuMw54+PPP7ZLzaxNyHTMSy9ni/6/m
yy3rgQ0z9p0rYpivBqEjJc40ZJqndU/jSchazSpbMIIIOjCCByKgAwIBAgITLQAMpBb3zugcBVYH
WgABAAykFjANBgkqhkiG9w0BAQsFADCBtjEcMBoGA1UEAwwTTlhQIEVudGVycHJpc2UgQ0EgNTEL
MAkGA1UECwwCSVQxETAPBgNVBAoMCE5YUCBCLlYuMRIwEAYDVQQHDAlFaW5kaG92ZW4xFjAUBgNV
BAgMDU5vb3JkLUJyYWJhbnQxEzARBgoJkiaJk/IsZAEZFgN3YmkxEzARBgoJkiaJk/IsZAEZFgNu
eHAxEzARBgoJkiaJk/IsZAEZFgNjb20xCzAJBgNVBAYTAk5MMB4XDTI0MDgwNzE5MzgxMVoXDTI2
MDgwNzE5MzgxMVowgZoxEzARBgoJkiaJk/IsZAEZFgNjb20xEzARBgoJkiaJk/IsZAEZFgNueHAx
EzARBgoJkiaJk/IsZAEZFgN3YmkxDDAKBgNVBAsTA05YUDELMAkGA1UECxMCVVMxFjAUBgNVBAsT
DU1hbmFnZWQgVXNlcnMxEzARBgNVBAsTCkRldmVsb3BlcnMxETAPBgNVBAMTCG54YTIxNzAxMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA55YyjGM+ltxo8NcfzL4FYuNVxTSHoMXQdjHo
ddnsJO77cR5GnfdlRXEOdJUysAKlGhpMxYekUrKBGfuoTXlXthcH/51P1apcmQBioE9kjwMf3qYM
wroBH1wWfKervMVKyVoULgWuN74/CeY7lN0zttUp9x3g1jMKVgKGap9Q2lDVbxFCMzWDieiPRMEM
G8FRcrGUSOKSkQl5j/X7n+VqAvXWZlqvhyzsOyXBFrXJvslOQGCXAAavQXNfrIDRRKy4PS+MSd26
6sEakJlhbOAsIeUcDyP1Rq7tbfuZ+BFrq2w5x0SifHa5ugFi3Z7LBTREB+lsvUtoaFnZX1tQ44v7
ZQIDAQABo4IEWTCCBFUwPAYJKwYBBAGCNxUHBC8wLQYlKwYBBAGCNxUIhYLAfoGO9FWG7YU4guuZ
S5qSVj+F5opuhLXhfgIBZAIBQTATBgNVHSUEDDAKBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCBSAw
DAYDVR0TAQH/BAIwADAbBgkrBgEEAYI3FQoEDjAMMAoGCCsGAQUFBwMEMIGUBgkqhkiG9w0BCQ8E
gYYwgYMwCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBLTALBglghkgBZQMEARYwCwYJYIZIAWUDBAEZ
MAsGCWCGSAFlAwQBAjALBglghkgBZQMEAQUwCgYIKoZIhvcNAwcwBwYFKw4DAgcwDgYIKoZIhvcN
AwICAgCAMA4GCCqGSIb3DQMEAgICADAdBgNVHQ4EFgQUa9VvfI2adDKzdXh2zk0AoaavdmIwHwYD
VR0jBBgwFoAUWJVg7k5072Uiqr3tGakreo4XnQcwggFGBgNVHR8EggE9MIIBOTCCATWgggExoIIB
LYaByGxkYXA6Ly8vQ049TlhQJTIwRW50ZXJwcmlzZSUyMENBJTIwNSxDTj1ubGFtc3BraTAwMDUs
Q049Q0RQLENOPVB1YmxpYyUyMEtleSUyMFNlcnZpY2VzLENOPVNlcnZpY2VzLENOPUNvbmZpZ3Vy
YXRpb24sREM9d2JpLERDPW54cCxEQz1jb20/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNl
P29iamVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50hi9odHRwOi8vbnd3LnBraS5ueHAuY29t
L2NybC9OWFBFbnRlcnByaXNlQ0E1LmNybIYvaHR0cDovL3d3dy5wa2kubnhwLmNvbS9jcmwvTlhQ
RW50ZXJwcmlzZUNBNS5jcmwwggEQBggrBgEFBQcBAQSCAQIwgf8wgbsGCCsGAQUFBzAChoGubGRh
cDovLy9DTj1OWFAlMjBFbnRlcnByaXNlJTIwQ0ElMjA1LENOPUFJQSxDTj1QdWJsaWMlMjBLZXkl
MjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXdiaSxEQz1ueHAsREM9
Y29tP2NBQ2VydGlmaWNhdGU/YmFzZT9vYmplY3RDbGFzcz1jZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
MD8GCCsGAQUFBzAChjNodHRwOi8vbnd3LnBraS5ueHAuY29tL2NlcnRzL05YUC1FbnRlcnByaXNl
LUNBNS5jZXIwPQYDVR0RBDYwNKAgBgorBgEEAYI3FAIDoBIMEHJveS56YW5nQG54cC5jb22BEHJv
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

------=_NextPart_000_01D0_01DC83CE.AA986D10--

