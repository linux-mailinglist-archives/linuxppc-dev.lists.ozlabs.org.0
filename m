Return-Path: <linuxppc-dev+bounces-15725-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14078D1E8EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 12:53:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drkyf2mqGz2yJ5;
	Wed, 14 Jan 2026 22:53:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=52.101.66.135 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768388625;
	cv=pass; b=VxQucE4aXAffmn0UJipXXt5kphpn3GqF31huV9uJFpoJiMVAOogVACO/C4FAxCRXbAomywbbBjePwC/o8cIPnGS5xhMZbH/4WA9LiKI+UJlH7xGvFLiYwl1GF9fEOqlLYkuUgO4b7ACaSvHgKKtxYP0mcUunpNUfostW8YKjAqlIbOTHukQ6uSoNUaW68g8Cz5/bm3M1SRa8TzL6qzvDcRi2V75EREZonXYybCmQn2D9YZDoL+U9Hwe/ViwBABzkovtKa5+scfQiNft6WpPoodK5OPqDKgTw5kDyR5E1gxYPbmr+LlZywCCGFaWpZ9Ay2RhscvK/g3Hmg9UXD2rYPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768388625; c=relaxed/relaxed;
	bh=F+u9hMLsJwpot15jGv+6DuobMLs1jlIWrW7gX77cKIo=;
	h=Message-ID:Date:To:Cc:References:Subject:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cDASU3dW9a6dcgqYaRyrhBKOYNxYbsgrPkfhEE2rE2NR6xZhuu0fl1ORdNEruiRzQnPcGTkq9zqUpvsCXBFnevdxkFFwdzS+lCizgVPuE0TvY3/rXaJpKJ7pYbnxuX8sx8q4E/qZzGd1C3rL43rtlgBAcv6PMOH3VkSd0ZLlQVZAEJ7eXg1Q+Lvd3Dm5F+0ztsPHcmfxuhwIMuSRefp5hlmpKFnIGNsrp/AjBv99MCyFR+SdkAAs/t7SRW1rLMEZWKH2RQ9VPt6SWsrQ5CR4C2YS6tfE10WZZL1Of/QYVGNZfdvHVkWKqMtBxTnc2MTAJNs359Zt1hk3KoXZVSe4/w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com; dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-gocontrollcom-onmicrosoft-com header.b=aOawUrSy; dkim-atps=neutral; spf=pass (client-ip=52.101.66.135; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=maudspierings@gocontroll.com; receiver=lists.ozlabs.org) smtp.mailfrom=gocontroll.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gocontroll.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gocontrollcom.onmicrosoft.com header.i=@gocontrollcom.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-gocontrollcom-onmicrosoft-com header.b=aOawUrSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gocontroll.com (client-ip=52.101.66.135; helo=duzpr83cu001.outbound.protection.outlook.com; envelope-from=maudspierings@gocontroll.com; receiver=lists.ozlabs.org)
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022135.outbound.protection.outlook.com [52.101.66.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drjsW2L2tz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 22:03:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WSQVIdQCnqBYQva2mPOLq6GWThdIrpylB0K+b1iQ+Snx9JbdfxtdTneSobNGBQxjopTX+y8PKdxUOzu64YJb6gbEvccq7RpShpbC17I2BNoaGCKYfS9LADH6z5TCRFnMFTO8ega25UjrNGAklMdo0esAHz0MpWzpD4Jx4kk9y5N14SR+ZN0da5LSLEv1XL0lnb+ON+ff/rEA/apgfjGxIOUfTT3h/LAz501VuaxRCRHiEAivweEXT0zw/5xH+elzdmTH9qe+UqtQzmQT1/RvScfKV5qQmZvd0xHAOzxJG8P7iOiPJBjZbL5keqJMdtT6SM8Fgl8Pezy9dctLSRAt5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+u9hMLsJwpot15jGv+6DuobMLs1jlIWrW7gX77cKIo=;
 b=ZtWnw/xCpvmeONgcaa+VmfcYdQpqLGkN6hbJd0iCs8196yMIVlKJ7kHQmhOmdAgsm3g4c7fZ4LY6lNIwq7h5ud7PyAXOF1qf769WO0RXFKCfVuKf0WAly1tUnRqSTtK/jh+UxeCRQ6pdAcpBn1xnVgnxTP7n93hpNQ5IHEj8QsmRWINcfUKIzzm8lcjncsLB+ydVVRK64fYI6r2COIg8X/P6lXvPGjVDrqqOQIQfdmFhRCkyNb3GlEr2vecjet3u/8al6CecuHZzc0GZ8QhG4bvOzmx9wERW9GwmS2/yKUA0da7gEbxastSUrVbih6CeglPQkGEAJw3cu7Gh3kozIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gocontroll.com; dmarc=pass action=none
 header.from=gocontroll.com; dkim=pass header.d=gocontroll.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gocontrollcom.onmicrosoft.com; s=selector1-gocontrollcom-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+u9hMLsJwpot15jGv+6DuobMLs1jlIWrW7gX77cKIo=;
 b=aOawUrSy+6wGun7WNyqg1M7gCsp1bSUnvYVK8kiqrMZhk13KuelBTegR05SPdAr+L21DkxcBBTN3XQ/x3+TwnCzzFHBC6My+9a8ryZKhGnQsWuSxmR55MzuKCgrob7lvP3dpmiWgT4hWnH/uKZ0/Tjaj/uI7V4L4FgvemYPvgxf57/H0iB7CCQ9Ybpb36xlZ9hFkzngnC22XBML+puN9TLuf3fIhQ1CYiLh6uR0kEflQn9Jzz1pk0j+jJMAKcsWEsOsNWxFnGKM19iUC5hCeIsdarnIM52ocZlVcLwqjnNDwh0gGSrfAfNwl1vSqDwvDpRbVjSubQyZ0QGwjsX+eog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gocontroll.com;
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com (2603:10a6:20b:6f3::7)
 by DU7PR04MB11233.eurprd04.prod.outlook.com (2603:10a6:10:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 11:03:01 +0000
Received: from AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7]) by AMBPR04MB11741.eurprd04.prod.outlook.com
 ([fe80::ee70:7a62:e9f:12b7%7]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 11:03:01 +0000
Message-ID: <8e86fc06-b162-4591-bc8c-e4b2fd487855@gocontroll.com>
Date: Wed, 14 Jan 2026 12:03:00 +0100
User-Agent: Mozilla Thunderbird
To: shengjiu.wang@nxp.com
Cc: Xiubo.Lee@gmail.com, broonie@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, festevam@gmail.com, krzk+dt@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 nicoleotsuka@gmail.com, perex@perex.cz, robh@kernel.org,
 shengjiu.wang@gmail.com, tiwai@suse.com
References: <20260114100655.3885926-3-shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_sai: Add support for i.MX952 platform
Content-Language: en-US
From: Maud Spierings <maudspierings@gocontroll.com>
In-Reply-To: <20260114100655.3885926-3-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::10) To AMBPR04MB11741.eurprd04.prod.outlook.com
 (2603:10a6:20b:6f3::7)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR04MB11741:EE_|DU7PR04MB11233:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e309377-5f6e-4960-ef2f-08de535c7be7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUhsTUFPd3RmdTlLRjNkaGVhOGZsSzExdFE5YkNSOTJlMGFkbFRFSDFsaDRy?=
 =?utf-8?B?RnpkT2tVU0JDa25GQm9hT3U5QmZaVFVBT0VGMnVaS0Z3N2ZXL2JDdUxBOUFP?=
 =?utf-8?B?MGZ2RU1jdE1ON2Z2L0FGalJMcUt3UFZjM0VrUGJvT095MHdjdnRwSm5PQjNi?=
 =?utf-8?B?clEzUlVKdVpUMTd4UTdTQXVaNzM2TnREdFBjaGlKV3lOTkJCbzVwTjFOWFNG?=
 =?utf-8?B?amcwdlJ0dW1iN2lrcGZiRnh1MVQrdXV6anNaMnk4a0dFUVhoMjd3aVZQK1oz?=
 =?utf-8?B?Y1NBWFZFQlp6SGFZaWhWY1Y4WG04ZlJrR01xOEVDVVlteng1Y2RhZ2tnbWdt?=
 =?utf-8?B?b1VMWnJqalE1TWNDQ2hHVk04aXp6Nk5WY2VzNXB0QTV2SXJCV1FMRHVZaHdK?=
 =?utf-8?B?RE1WbTZsTDd1bzlnVkQ1Y3cxOW5KbzZxVVBybVVxOTc5V2hyVHBqUUQ1NWI0?=
 =?utf-8?B?NThNcHd4K0dDc3hjVHF3ZWhxZnY0QWM2L1FGOGlTWm80UU5NU25RMmUvbnlj?=
 =?utf-8?B?MXVqT2RKMEk4N1htMXIyUUtwdTd5ZlVYQzdzbTVud2UxVC9hK0owa3NpNXE1?=
 =?utf-8?B?aEhMdW5lY2UvVWdaMW9KK2RUR1VUU1JjYXMveVVWR2hWQjlYakFtWkJOeSs2?=
 =?utf-8?B?Ylorcm1WOU9WZ1ZXYXBkSjMvQUdNRStXekIxMG9ObEFZNXNydUZjSk1yZzVO?=
 =?utf-8?B?NjV3V3VBZ1ZpMnQrd3BsVTU0SGpYT2xPRmJRcThNY0pEdVNFMFdCSXhKbERL?=
 =?utf-8?B?UjE5SmN1d0NRMUpTS3BscmJOa0FkSXRIa0pVcEdYNnhpMFpycHRYck5QbzBQ?=
 =?utf-8?B?Z0w5ZGVZdzRnUGVQQmJVUjlFZjR1SUx2NHEyYmJ3aUZoNXF0MnV5TzJaNUJH?=
 =?utf-8?B?QldnbU1WZHhvRG5ZOGpCejlHR3ptaC9NR25MQUNZNWJCZmN0djlnR2srRVlo?=
 =?utf-8?B?UGNKVjNxM2owYXpRRFlUVUxNaW1mUHVtVTFQVk14Y2ZMWFlFbDkyVit3VVVp?=
 =?utf-8?B?ZlBBZ2kyam1GYlE1TUFQU2cxQmk5OVJkK1lxZ0pVb3R6WFFtbFBLS1ZWNWpQ?=
 =?utf-8?B?MnNUdVhBUWFZSHdLK1RydHVvSmZwZStVbFc1ZkxmbUFuTHVSSnhwSW9tUEl3?=
 =?utf-8?B?cjdFUkxrRkpvcHhlMXE5U0gvLzdRbFZVakkvcWFrOGJYL0hlb0cwK2xqUzRr?=
 =?utf-8?B?VHN1S05Xa0diS05yeGRuV0svVUs0ZlNXNmM1YWk4VjhCWi9ZVW5GREdjN09R?=
 =?utf-8?B?VEhYTncxcmtHaTg1NUdjLzNVd0Ivay9rc01NRlBiU2ZyVU1PaVgvUThIWmhY?=
 =?utf-8?B?L2xRRElSeFkwTTBUam8wR0c4L2dXcEFVakxkbzE4TmxtRXVkYktQWlNkc3k2?=
 =?utf-8?B?VXB2QkNVcmJYMjh3YmwrQkpTREE4V3ZROVpZVTlXc0FhQU9WbTFSaENvdmZs?=
 =?utf-8?B?bmhiTGhPS2VXOXFvV2RVR3RDc1crTVhJeVFxWTl0MmpFY2pJcmQwbTUyQW5K?=
 =?utf-8?B?ZFJieHhHUWZld0g4bHBIMmZ1THBXaUZZc2ZaRWVxK0FIRDFabGpsQVhKaFhh?=
 =?utf-8?B?TGF5NDR0c1JwOStsTVNKMGlwUnQzb1poSkV3aExXcnBvU01DSnh6dXdRWE0r?=
 =?utf-8?B?ekZTSWp3RzZ6NnF3TjFDdlVjYm1NVU5IMmloOXhhb2NVMGNrTmNFdHB1aFlP?=
 =?utf-8?B?cHdLMjNhUFVuZWpYYWt6dU9DTld4Zi9haVZvdjJPNjFvd0gvT05sc0F3MWJm?=
 =?utf-8?B?SGxjM3dNbVhlazd3SDE5UmZmRVl1b0JLMm1hcmxwUWlmOXcwazZsNFFIM2w5?=
 =?utf-8?B?amZuNEY1TkI5N3N4dnBPTndFelVqai9VS05EMkVTaU5HTWN3WDJ4cDZyOEl6?=
 =?utf-8?B?Tk9zQ3k0L2RwMHBieGltSkk3NXk2c09sbkhkbHJnZDZCWGNYaFVxbENUc0Vj?=
 =?utf-8?B?OWI5UWhON3VTTUgrNFhNZlhObVpHbUVkMVY1VGt3V2ZrTEF4TkNuYXJxQVJK?=
 =?utf-8?B?VEpvL0lSMGhDL3JGc2RaMUNkdXc5Y3llS2h5NlM3akltRjZtT2JhdjQ4Mnpr?=
 =?utf-8?B?Z2dWbVJjdXdveDN6ak9JeVBBc28zcjIvTXdvMmhBNkVUVk5zRTBGU21DbHYx?=
 =?utf-8?Q?yKvY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB11741.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVU3eGk3cDJMRDU0U0xVUUtuMnpWYi8wSW5zYi83Q2g2ZGxOcXp2cm9oRTUy?=
 =?utf-8?B?MmJpdkluaUY4N2JRYUo3NEVvZEg2RWNOc2xtWDhwclIwSUtyc2Y1TU5OUUkw?=
 =?utf-8?B?NTVFR2QrMUo4U0hyRW1CZjRVKzhyY1NNUGdvQVZHK1liS2tnbExNUEludFJu?=
 =?utf-8?B?U1p0VU5sdHZyWWQ3VjdRWmxPaTg1ZEhSZTgvNU1hSk5uemptbjRxWk1GK0Qy?=
 =?utf-8?B?dDdmVHN2SEhDQWV1ZUx2bEluVys1TWFNaWg3TlhYZEtNTWZSWmU0OHU3U0o0?=
 =?utf-8?B?amxhNW91WXdoV0VCZXlyT25FRi9xYWZkam1BMHBHZ1ZvNitxMGxwT2g0bTJC?=
 =?utf-8?B?UDJHR3p4alNJTTgyWVYvckVQdFYxZlFNVTViNWJROVMyWCs4WlRvKzJJdkwv?=
 =?utf-8?B?KzNYMmJib2ROaVVXNlJOQVRueEd1bklpM0ZBWUdhek9rd2ZmUGlmUTlmQkNj?=
 =?utf-8?B?N3d2enlPV0VneU9hNFVZekZ4azkyaU95N1Y1NmVFekZTRG43bk9Cckh2ZFA2?=
 =?utf-8?B?Y08xRnRzbnlsNzNxTTA1YW1SQUpEaDFvUm9GNGFGT1g4UzVubUFsKzkvWFJK?=
 =?utf-8?B?dm5iaXhBSGRMdytxQkpXY3EvcWt5WkpwbFJEMnAyZXcvazY1RGRZUWM4Tk1F?=
 =?utf-8?B?ZzdFcUhHdm1Kd2hWc0JibGZwNjRWaXhzclZGS2YvbGlheGVUTEdpdmM4NDVB?=
 =?utf-8?B?SGlPQnNJMUlSTkNjTXJRV1dFL0h5ZEVSZDZqaGkxMkRlQkMzdjhTZWNxR2dT?=
 =?utf-8?B?cXVTMHNvc1J3L2QrZ0F5NFNhdHNFWitUM2dxSCtnQ1lXZGlEQ3BKbGR4UU5r?=
 =?utf-8?B?c1pjdGhJeGh1SmhyemNaOVZsTkkya3dMNGg2dlorcVl3amw1NGJBbjNadTRr?=
 =?utf-8?B?QnlWQkZ1TitMTzgxaFBPOW5GOHh3UC9NUUlUT0FZbEFTSDVjTnNQUk1nQWIy?=
 =?utf-8?B?WUE3ekFSb0pRbGM2YWtUSVBvdXhkTDNocW93UzQrMnZkREV0S1k0emp5b0tK?=
 =?utf-8?B?TWtqcXpyVjM1ZFJ4NWpCeUd0cDVTL0JjUG0rU1RrdnVCQkcvUzBUdmwzVVVK?=
 =?utf-8?B?UzZtVXpIemZ6eHpCV2lhYzhWN3k5YmcrWGE2TFNicFpGUXN0ZDMvZWpxUUZD?=
 =?utf-8?B?TWpGK2RjSjFpYkFET1hXMkx2NjVWNmdobVN3dDBGSHArbWpEci9DQnNZR2Jo?=
 =?utf-8?B?R1paM0ZzMEpKTWp2Y3dFc0JDWFBSaWtQUjZxZlVEb0UrV1l4ZVBWTTVtMjJ0?=
 =?utf-8?B?MS9PYTNDWDg3VTV3eGlLTitUVGZzT3hVRlhPbm40MDVGN3ZXeTA0WjRHSU9E?=
 =?utf-8?B?RW9hUmxuVXN2a09rQ2NUZlhDUy92MVV1TW1zd3NPdDhUMk9FOXFBZjJMUkdy?=
 =?utf-8?B?RXhFZWpoejY2MVRPOGdPRHplWWJ6MUZ6b2tKMUhUblpyM0gvWWZ2LzRuRkdl?=
 =?utf-8?B?VTlTMHR0YTgwOERmQ2FmLzcyYWo1NUpJdzFPek1YQW55QnRPT3g3azkzVVZD?=
 =?utf-8?B?WENEQU1DR0lwVzVqVXhLS3A5Q0Y1QmtrREN2cXUwcFlFbzhGRFJiZ3lZZTZ5?=
 =?utf-8?B?eGVFcGtiWmZBZVlpNmkyRWcramdYM2hLVnRRR2ZxanF2RG93bnNjc1NGb0pC?=
 =?utf-8?B?Q2FIYlZLTWowZjNJME5EUUU5eWxBdFZBMUdTc2NuNE02U05xeVVEWDY2bnR6?=
 =?utf-8?B?bWd0cEQ1Q0hYYThXVVF4RzE3TCtWRFVtNUxsQXdjSUYrbVZxVUtMNDNZMnJM?=
 =?utf-8?B?WnFhQVNXSmlFNFBjUjJnV0dSZmFnSHgxcTNQUWhvT0ZDVUdiUTA0UzI3TWxs?=
 =?utf-8?B?MzRGZVFpTGNUalB6N2UrbkZPUGRxaEIzd3AwbXZQeGZ2MUcyK0FGZ3JYbTdS?=
 =?utf-8?B?M0w5OXZuWUhuSDFlRDZKNnQ4MEl2eHZ3U0N6eExtVE5xa3RHYmJoUzByWUc0?=
 =?utf-8?B?NUR1NUNGT0wxa0g0M1VXdElhR3VXYlZ5b3hWR2ZqSFBzRmVLYWNBOHMycWY0?=
 =?utf-8?B?aXN2OU54OW5seS9KMVJKSndmSlVWbVFoMjhCZmdINFRBc2plTitKODFHUDk1?=
 =?utf-8?B?TVp0UEl6ZzlGZ0UrWHd2bEhDQzdvL3ZoM2ZhZkRNYzdhY0E3U3crSmhKa2cv?=
 =?utf-8?B?MWtpanY2ZDFkWjdmemY0bHI1Sm1Zb3Y2MUd4Zy9FUUV5MzBqNUkyUG5sdXBP?=
 =?utf-8?B?di8xSG1BSk9jMmN2SzJYcnkzQU8vVFpKL1ROeGhxamlLVUFkL0tpMTF6dzZF?=
 =?utf-8?B?OFdOUDlTK0NKVkl5Z1V0cWQ2N1QzS0huVlNHeUtIMWxsSCtlczVJaWhJRUY3?=
 =?utf-8?B?WTZYaFFKbDZPWEorZDE5QmltUUdUWTBmV1RJV3EzYzdFNXZZRGVLTVRaNGRI?=
 =?utf-8?Q?5k3Yo4H4/FopwUaqeDnbsj9DVyMPkId3uYGzeOCbFHJAC?=
X-MS-Exchange-AntiSpam-MessageData-1: FF9cJrVkJvgP6MocSq6hTV91Cd0yMRouqBA=
X-OriginatorOrg: gocontroll.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e309377-5f6e-4960-ef2f-08de535c7be7
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB11741.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 11:03:01.5370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4c8512ff-bac0-4d26-919a-ee6a4cecfc9d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9az+ATJjfOEBcALWHzL9Vwqy5ldZL0wlVRmUPS2ozF8M5FxvZ5KwP8uCbo6mm2Gq8ul8A8nmNW0KLDna+NfL3TSQuH+09n7J5x547JM1b9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11233
X-Spam-Status: No, score=0.0 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> 
> Add compatible string and specific soc data to support SAI on i.MX952
> platform.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 2fa14fbdfe1a..c025041dc079 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1765,6 +1765,18 @@ static const struct fsl_sai_soc_data fsl_sai_imx95_data = {
>  	.max_burst = {8, 8},
>  };
>  
> +static const struct fsl_sai_soc_data fsl_sai_imx952_data = {
> +	.use_imx_pcm = true,
> +	.use_edma = true,
> +	.fifo_depth = 128,
> +	.reg_offset = 8,
> +	.mclk0_is_mclk1 = false,
> +	.pins = 8,
> +	.flags = 0,
> +	.max_register = FSL_SAI_MCTL,
> +	.max_burst = {8, 8},
> +};
> +
>  static const struct of_device_id fsl_sai_ids[] = {
>  	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
>  	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
> @@ -1778,6 +1790,7 @@ static const struct of_device_id fsl_sai_ids[] = {
>  	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mn_data },
>  	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
>  	{ .compatible = "fsl,imx95-sai", .data = &fsl_sai_imx95_data },
> +	{ .compatible = "fsl,imx952-sai", .data = &fsl_sai_imx952_data },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_sai_ids);
> -- 
> 2.34.1

scratch my comment on patch 1, drop this patch. the new data struct is 
the exact same as the imx95 one.

Keep the fallback compatible and let it match against that instead of 
introducing a new one in the driver.

Kind regards,
Maud

