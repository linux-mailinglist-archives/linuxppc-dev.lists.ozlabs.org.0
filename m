Return-Path: <linuxppc-dev+bounces-16243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A9OE7KFc2krxAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16243-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 15:29:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F03177104
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 15:29:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyL0D0T4tz30T8;
	Sat, 24 Jan 2026 01:29:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c200::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769178539;
	cv=pass; b=VaeHGF+yUaJ+uNdE548vdjVAMcx32FVtk13xxf5k+TVZ2BKdjmlY1mYK8NMjGLjnymdVv/O1El8R9prKuNs2wZZ0O1F3yLmnbnzbYb5TK1wivzMb1vXkJYBxorHwULSc83HAbWcCytjgeqqdcAduBS3caNM9+f9RKepEqJma1vYeQ0hl58fmPQR+xZgCRuGDjyaQDJBmw8xaaOnU/4Mgp4ylk8ONOaqLeTQgXuwOiEpx3M8Zn6osIT2/5lTY+1jI65G+JfKHUFxmMQ06cEn4pnf54zZEdV7tUiPSJuXAlU8e2uFPa5iT+6tLQMEdxsBniuI7DOCvM00MpQTbCHNflw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769178539; c=relaxed/relaxed;
	bh=QL0Jeq1SdhVXoHX04Q35k5IDjkEaYzVHGsoe3Rn+E3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=StSrnLR5ZxYZf5yZicfI6y2ZCNKiOT92rMScZ5weSOjgmW8O/R8SeDFzsrGFdVn4nZfttK7F7un7/oGCIifapKXhubcb1RDMcER384HONhA0FeuKp6bMCWLTJFHqUJuZNA2nNkdpBFiF3L9cK0sKrhcvY1Xi/KAn/sEkTcC/BielKC6/BCst3LyzihlTbihQ8F4YyMgx4UHJEHHDn7J+fd4db6iSyM0/ywTjgdyei0WVGfc/W99l7T4Em3TatAmQvxs5ZT6mKmjQSyqstsuLZ3+aGiJUn389zDzlpcsA3Jl+p8nO/HXWOkh6W3Zz0W1snvc81QFqjBaHxUThD3Ah6g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QKtDUQBI; dkim-atps=neutral; spf=permerror (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=QKtDUQBI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c200::3; helo=du2pr03cu002.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=lists.ozlabs.org)
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c200::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyL0C0v44z2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 01:28:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vtyo1p/tFIlcEqdv2WqYmv0FG+IJZHrF+7DGrjsK+D/LMrN8wjs+9F7kCXKfhq/KUEDx0v+dWcL1EnpedlQiHeN8VtL9ASQLyPGImRrSPR6Vaklp4B5fu4teP8gr2GaCAseFLp8OOxXp1+8VyG4bJ2RqNLFKqZR+0w0nX/CKodv0mv5hcct/j6DBtP46uhZiCr7Dg90Nn96NdR/lzmq6PsAhjHbNcTEr6RGKig0x0hhFqFMsoUPIAmQbgN6zFsmC8p7Bt4OpO8z7aFezC3NaHHf3PCO+lPOqAmSDXTmqRhwtXq5YsQnP4gcvXCcEyHFwT+iWx63oMJAm2kT4ZL5JBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL0Jeq1SdhVXoHX04Q35k5IDjkEaYzVHGsoe3Rn+E3A=;
 b=rNEWgVUx0pOGRrb/j0yGf0nQIyR70OmFpaU5tqNFjc5KtBKkvcYIUVykJ/GAEP93GqX97D22aOOGi+SaYGo1BzY/FOlXmkMj/nV0xZYAlR3NjZWmJSUkKYGQ5nHtUAu0PFO1Dk1jrwYA1I+o/Po91VBFGgBsL3IpcQfrxKaZE8VFDeTgONBMq/Cb+9LZrYSOtNqHKC3c0Wzm92eCqFkHmRDw1UM54P7YAbmC4398N9eTXUYEPiSKMKxwvN4wDXX/jn3H9ldWLiBkZ5scWBI1CMiVEXr2U/ZHVLClRBaMt4KKtUfngZJKGHzgY6ePDFPLXF2F/wGODKF63ovryxTtew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QL0Jeq1SdhVXoHX04Q35k5IDjkEaYzVHGsoe3Rn+E3A=;
 b=QKtDUQBIqJIHiJVbvmQM2EvcRTsQGgaSAM1iHNR73+JjeHhtinqKF3TVPmNJqzeoSczULIiJb7sDNxdB4okMHoyFE7CzCXyS+cJyleCxw3SG9HQ112H+zd53WZgFVm/A1rYaK35iH0niJ/PZjzUMO2tU3/Hnmn80fCSnxPlXRaFv54Vc00v+Rp5IEYVUiTHXH0gUK/SEBWzGhKeyblug2q9AXmlFZRHugLeVN/UPQ1AUlbSdlQdNGgp3JeXhSkxSssvewUTWyl1Rg1pCKAffIvsKcSQzxewAh1pp0gQ0LKJeAjrzQwEVedGO7BTLqlEjv5t0zTvhAJGUIsd/xeK2vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by VE1PR04MB7245.eurprd04.prod.outlook.com (2603:10a6:800:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 14:28:35 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 14:28:35 +0000
Date: Fri, 23 Jan 2026 16:28:31 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 05/21] bus: fsl-mc: Use default primary handler
Message-ID: <df4yoq5llgrr4gn6eqnnls5ess66xnszfozdnep27fvw764mkb@v74cpgfiyyt4>
References: <20260123113708.416727-1-bigeasy@linutronix.de>
 <20260123113708.416727-6-bigeasy@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123113708.416727-6-bigeasy@linutronix.de>
X-ClientProxiedBy: AS4P192CA0006.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::7) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|VE1PR04MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: a49f531e-3e53-4c03-b193-08de5a8bb10e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x0yRiWbr+9EFu66vGPPjuMLmvFY6xOGgX4AJluBPoLnNz6MGnqE9WVgDPyCT?=
 =?us-ascii?Q?DsTHlZxNml4c2DlUK98tijas3Iqz+0PleBe7OmxFM9L5vFfXORz75glmsGLi?=
 =?us-ascii?Q?Csxqq9DkTGqRrdRqXLrZqqoYTpuUGB/o7qnXJILvTXrCvmlrMkO5EurdxZgQ?=
 =?us-ascii?Q?DCTfKUVCrOisATDQ1VQGwHNzSOp1oGPdy1P9p2v6lCLUEL5ht/y6S1dCyCjc?=
 =?us-ascii?Q?/+gvT8fkqj4HoWhCBkG/f/LJgMzNNWFPNF/Sq3LYokgATimRCFqwm1yIGKw/?=
 =?us-ascii?Q?YpIZzx/Eq3q8Qcx4itWVkq4+tlndZLF8PEuKBT4xGaZz4JfqPijkdFTY8e8M?=
 =?us-ascii?Q?x4F4sX5lE8iiD+s6xX+dZM5fr0gKh0mbNrSNB1r9O5OKEfO8O28/wWQ05QU/?=
 =?us-ascii?Q?87qZcqT3HgAZacyj3EmnvHzD+8o7doYgEpOVoumVSjJe3D+8vJilcT9WsOly?=
 =?us-ascii?Q?kCSUlQN8qN8O+hFPF1aLgergDwTENdI7+SsS/4syxpp9L7JVk8/d81CcG5ke?=
 =?us-ascii?Q?2u6wrS2et5S+dGzEPdhalkbvGjoneIRvKTEV6pqa3Jv4FXkkfxGselINcIZs?=
 =?us-ascii?Q?pdTwlebj1twgBjzReah2x1EGTfEYGEP4HXkkPFezRUiG2l8QdMJk1qCoiNG9?=
 =?us-ascii?Q?MlxxoJimAhmaYyzGQjv+ck6qMuceXfHUnNbSr7bDbgPUPblYPpgNWl6falAd?=
 =?us-ascii?Q?aaVJXbGM6VngLd3iNeWoOUNBT0qHhpDVFaKf/pwTPJgdAuL7xjH/uYg2xsJt?=
 =?us-ascii?Q?I6N6hd3c81z/ghh+nvDXAg0FTtgxPd1nap+3LZTooZtoPiWiGkx9ltrnF5yx?=
 =?us-ascii?Q?JK6Ai7d3wYJPnFRpR1j6O/2e3odYJqXnQASD8+29lMx1UVYr337eCJSmCYML?=
 =?us-ascii?Q?7TeT0PS8ioocRNg7KcTYVIYdvYgSEGtkq6jH1TbRRahScdUIOQPxf4WvLLrC?=
 =?us-ascii?Q?ud1Z4NuG0Y7tdnuV+RynEc9wetyQ8erF8H7dOO5zwwb6SluPkDh8zV2w72BJ?=
 =?us-ascii?Q?ns1ADpoVwlBRhX6Xkt6GdITXBpoY+PM/ZJ3belXj65IzBuF6BXBNggqzYxpJ?=
 =?us-ascii?Q?gpj3SsYm1S7fldZ01CJSvbShFbq/XI5orPvQEvNjnq1hcqKzvPYcR9yk+BbD?=
 =?us-ascii?Q?HySnV41+ByFcVPJaU0ryzDBlUeRqGt/v9dcLRCPDqhabbYs1UimTzxmZnnM3?=
 =?us-ascii?Q?Js3jq/iw1TLzyY7NWl920r5u6MxfsfHv/y5Ad3pZ6BahJne7pYs1oa/beg6w?=
 =?us-ascii?Q?Sjju88HXV1rR1tM4fA1hPjx7foP9lU2YCqPhLFNzRivlUzppW8DcR1OFQVta?=
 =?us-ascii?Q?FELKZRsnTEhkvxnDGbquQ3jeqiNvXRSNsdyKgA6mZe/T114wYbDdtcbCUJ2j?=
 =?us-ascii?Q?3TIAgsagE8ry7z+0si/dRAzd6b7FEGmayhEyz/X8uYPmGVUghPgJRD+J6dHV?=
 =?us-ascii?Q?2tc2FHFTCoELaWIMumJdnQoaWjSJqOEgc2IxNgq3RKfwwQ+t1QlbC3Pdj0Rx?=
 =?us-ascii?Q?0r00MJtzjXFIm4qsh9qvtHhYeSSSfzUBjg4D8TKvHFGUmzUBq/Fq6rVeHq+g?=
 =?us-ascii?Q?YZsmT6MZ0mHbqKcy8oo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iYV/cf9pvkAUWBw4hVDfRX3V+TAwptuJeAcpMF/gCKIgCpz6w7n+F4XR56JS?=
 =?us-ascii?Q?I+fbVPKbUYH4FXKWCWtpRcRUjsJKFZcJjumA+WOXAJFJPc9zlZUXnbymG7ni?=
 =?us-ascii?Q?E682r86lWwQsEk0K4Akwiq7GrRTz/b1kUT212lyGUBq3LpF6mN/kqOXjNt2w?=
 =?us-ascii?Q?+8aESigRSZreXA+njcOX9C0aKluTa58n5uM3FO+kf/knsyeIaitQF4sWZna8?=
 =?us-ascii?Q?NYUipVsQX13fUcm2Zzx7PWbuvBjWZiAKSURHSbw48isHb6nAkGSjhAS5vABm?=
 =?us-ascii?Q?GILxSZZ9bngEifm5Hg3fWLJUkvjOT+e96kjSguplmzoPs7B7Oq2XETmOpUSX?=
 =?us-ascii?Q?h+RllSN4Xl5G3ddHsc5gko5LCpHqaib2Pwg4hUSQg3QD+5wTL9MBfRerdjpE?=
 =?us-ascii?Q?10L/BeKl11djK4Ck3MlIJ8Rv+UNxdlLUf5a4/pCecm/o72yDZKaZDWdQhjA6?=
 =?us-ascii?Q?fd2/BZb714gkKWcBa0T1QrH8cfb3knu2cuN1tQN8H+RXUu49255ENArgxidl?=
 =?us-ascii?Q?qYBbckqNjpyJROrTNKR0qFlx81PksDWfElCRXggHHkfPmd/7hFBiWP/10WCi?=
 =?us-ascii?Q?JiaoHc4kC5JTCcnyYDUuf7LYDopxsWMAl3JQigtV4ofjJxJQ8k+jhU4i0KvN?=
 =?us-ascii?Q?Z8qC9H/zRbQi8f8yWVJqojgGm0CZ/WbMahS0UQV5Uvp0bmqSuZnb8/bP8DFG?=
 =?us-ascii?Q?3/k1Q2mvCl9PTaRsjtVOkIcJ73NdtBV3vzOC+R7neGgtTLVOhwLGtv2l6lKe?=
 =?us-ascii?Q?bsnHqKdcc3reoOBFFKqKh0Z9QGOJyCfcnITdPf7TqKgDYo8sbBWYydiEey9/?=
 =?us-ascii?Q?OUkGdGYYCWWNsAugWRSezNzhnZ/8aKXYRx7N/7cKLQnWdPbX69CYEeLESg4a?=
 =?us-ascii?Q?FgAYSGWW0viEr0ffoFnVggn7rX9EAdo2cSB8F9VPbYablfAKZzoA/8Ex/1wC?=
 =?us-ascii?Q?Pu16Cx2UsIDAXDaFJZ5d+PX1i03dRRxzNTrkJ8t0e4PA/iVgK/l/EetDaeyg?=
 =?us-ascii?Q?EHHzPT360G3WZuUBkqOWf5P8MVOgeCo/2672ZfHJ/S3OxFv1mbg5SNgDrXR2?=
 =?us-ascii?Q?dc/SctoDtACbeSL6lfVOvJDUfK7Le00FHtY9cbc+YTB8Fa5N13oQi6B4JR6u?=
 =?us-ascii?Q?a1N8fwfCpH4g3yAEAu67H0FlUGPw23eBrt5cTXux6f0XIRK7kaRLI/J0CPq+?=
 =?us-ascii?Q?by8MdWuDl1HlSYXbd3EVigYbN9yjsNjtJmIt29evLk0wiD9ZiQjLpLc00BUo?=
 =?us-ascii?Q?BJW78njsWDw/Ht8XrCbME9UHzZy9oMzYA1vTp9d82p8jLHjXXk0A+nLR7LB5?=
 =?us-ascii?Q?gkel8WjGmC9flXF+kiqkjP4DP3gbtNKvWzpzTb7b2nwvdZkPg7U70Pm4Ufo6?=
 =?us-ascii?Q?xTDLmCwOfrgD8sMYiCJYzXSX6DxglUpgjuBBEjVaHqKF7kwcjNNyLK4qvzEb?=
 =?us-ascii?Q?4CbnHvYnC/wgZhWyf/mGcicU0bNdNndILxmvZpgPy/GFriXuRACiCo5DFdRW?=
 =?us-ascii?Q?BeZJsz3uc3MI0CwuSbhOPg3kFltOy0Ju0vmA8uuqgbSO4xOpoBxmXMmhXMc3?=
 =?us-ascii?Q?R6ge3tm+kaaOqnWaikeI72FKpQHv4jOnE+4UYGSIXQzNWg+TKGO4tnkUMWYl?=
 =?us-ascii?Q?gNHrjx6aeBi6NC/vXRbAEnJbnJIFMl4vlnMPmRc+fMAx/5kQYdgCahLSfa/J?=
 =?us-ascii?Q?AQLh9s8hWi/X/O7e6MDw9ziTSeKlR3YofIs40pKEvwRLXyxbjq6e7TZ4+X5o?=
 =?us-ascii?Q?/3N6c41MXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49f531e-3e53-4c03-b193-08de5a8bb10e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 14:28:35.2448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+Vc9RnGZ9NstJct2zlTGsKJYjIba6yIU4YHXYbt9bvavU68MMF+8qPsF92a70P+L7IhlaW322mawyW77nP9kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7245
X-Spam-Status: No, score=0.8 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	SPF_HELO_PASS,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bigeasy@linutronix.de,m:linux-kernel@vger.kernel.org,m:linux-rt-devel@lists.linux.dev,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16243-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ioana.ciornei@nxp.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.124];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:email,nxp.com:email,nxp.com:dkim,ozlabs.org:email]
X-Rspamd-Queue-Id: 5F03177104
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:36:51PM +0100, Sebastian Andrzej Siewior wrote:
> There is no added value in dprc_irq0_handler() compared to
> irq_default_primary_handler().
> 
> Use the default primary interrupt handler by specifying NULL.
> 
> Cc: Ioana Ciornei <ioana.ciornei@nxp.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>


