Return-Path: <linuxppc-dev+bounces-17323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE5HNw+3oGnClwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:11:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FFF1AF812
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 22:11:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMPK824zCz2xNT;
	Fri, 27 Feb 2026 08:11:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c101::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772130370;
	cv=pass; b=Fssm2SQXHJcava4HtnzaweVcZstExh2o/by6wJQZYEi6Nnz9dCD4elYFg2CRK1yMPOImfASIw+ulFPtVgssBC3MVng++TAwMr+XBayqr9MupP6s8Dy5HeX0dHMNuWuxkQFJIT0CLaAaYdV7iN05PWjwgIkfONcdxlsJWYc5rXtlJJII7Z2UOHyoq2wrqE6Hma3m7tVxiX5rGn12rNpoBSfbcpecjyma+6lHxVVjsvnDcqZH9X7NmDFLGK7xSLEh4FRTkvN6pHCpxj1/fCeM2E0e+KvTAiupW1Ku9V7bRd2XJmZQeKLinkOHBQcKigsLirVYBr7KVsoGQqJbWeOgdvg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772130370; c=relaxed/relaxed;
	bh=vPJp5w19Fx+MlYCGTQ73OECtl6RWRLR8f56KXzk5WL0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Re8YGHj/9jLr5Bb6vcoUDiGv7HGIizdLX3QRnVIVygxvZ7UcElM4Vm4DFzGrIBHWMf+t0lV68u62gpWurTRtqyKLNRjpr7DUsNU2XiDP9v9pbVBotTNvanJTVRZ3fuE29qRRx1tRWK5aJSgodVg8ow3Xif1HxHXMMjwEyW7klF6IzYmpqqFTaUxkp1xN3nF/vss5aLpWAspjy1Or4KTF20b3dMWQH90zJMrnDnIj8kLCbghP1N1v902fywlnUrEeT6s9uUUqqJDglVpXkXV9d3/XXyXBc4qHGCtWCzlq34RaO+D4e/xaz9g76pLYSunenEcvicEUCE4E2bXcDRRAZw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T5Rd1Ref; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=mbloch@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T5Rd1Ref;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c101::7; helo=bl0pr03cu003.outbound.protection.outlook.com; envelope-from=mbloch@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazlp170120007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c101::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMKf86HPMz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 05:26:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUduklsZrHkQishuUPheRHmgVXZDZtxmGW/ZDp/KN1jcJEU5FAn+/plxULygOltk5HUm6z/1OENO8oeodgTQMMQZ/xuFzuJnocuX46lG34Bg0pyTrImLEJrhO1moAvlp5pfaK+ntLOB/lXy/jQBFb3jsGnjgl23UQ7IxwqZmESPzrTKC7V7P2ZDGA9rk/JhhsA2PGATemEJYdyA7KrofffH1Fz2yBk4KW9yLcHd/k46BNz9jLB4VVe9eExI7J0a2+9OweDp/qE7fo3Uzii30HJOqlA4SlZOgHIuowTTrxawVVAixzKpiaiE9CzXjVkiG1fMuUtR7rdtGxphbooZwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPJp5w19Fx+MlYCGTQ73OECtl6RWRLR8f56KXzk5WL0=;
 b=jWU5DksezKpEO2lrEqIpywS5iCGg0U/kdTkSE5fSRGQd0VPW1QkZzI4vuFwpZYJGVN72eqQWulR5w3W1+lNoEyoFlWFboQj7XMorTTIFSsKljek/Eq6NeW+LIvd3T4hFLDHI2qeU90kXu0x4jbeFuo9rupuUblhShPpk3+9UGenNrGfSIUdqziliBEzGfjDynkEwnT7wPkAhHLY6njeKpqzecKmrh/Erx1fvMWLQ1HVXhOI2JRUa54J8+6Bawg1B9FUfodWkx/4dDhi2PqUaK8tZp4SsGuZQL3kDQWF98CG7nYb+4rLU2drYgz7n9WlNs2Cu8QaVO91j/oHcT4EIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPJp5w19Fx+MlYCGTQ73OECtl6RWRLR8f56KXzk5WL0=;
 b=T5Rd1RefJz7HEyjGB5AdSupkSAwnPBJ3/dAGQmGJzq+YHWfDIBx0ldTGkENN6GS1JKVxfmV4L9xSUSuqbkHlrZZFQUtrF6f7nE1GpUNjsYx3EPVrJC7LZ5gqJ1HK6qihTn8/ew27NdN5hw5miJABNDDzPDmJzd/k2zaEoXvoPofG7G6NoBQwDsP5W8VeeLcPrTNDOItEOYV+ywmqbD30DcxbMDCG5KiAAVH/lT6+dbWuey230mosgTA6dIUijSC9CEm7i1Jn6/DmNKqaVOEtVcDzxo0V/dKFYy7vYSJ2I/Iah9sW/u426AwhatO/GTY/W/G45l9MCId+4xqVQHU8GA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Thu, 26 Feb
 2026 18:25:41 +0000
Received: from CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::b710:d6a1:ab16:76de]) by CH3PR12MB7548.namprd12.prod.outlook.com
 ([fe80::b710:d6a1:ab16:76de%5]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 18:25:41 +0000
Message-ID: <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
Date: Thu, 26 Feb 2026 20:25:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
 <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
Content-Language: en-US
From: Mark Bloch <mbloch@nvidia.com>
In-Reply-To: <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To CH3PR12MB7548.namprd12.prod.outlook.com
 (2603:10b6:610:144::12)
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
X-MS-TrafficTypeDiagnostic: CH3PR12MB7548:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7bee03-677f-4c20-7d11-08de75647295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	9PsqS6ngW9OR79WvmoGbuLJT/Njq9tmn1Y4kvWKFRcHaqMXldP8HOWVYX46z8WeonfN8WfJUoVu82cTYacwuOgeqjFg2iX8mrd2TTwQTkl4KQKDMNN4CVErLry1dFopRS4rv4TntRLONZni2EQ8hVZ4uM64SHN0/hmx30g75xcs3CBS3ycUBWburJCmxM2xX4bonbAE1cfG3c6Xp6Shtx6/EwR+O4K21WVLphuRuQlcaw20fRpFe43mOG4g6P6tpqnRrr5QmiTKK9Tcm6A45A+nI1WRchacp4w0zkZPeN7ZcOpw8SWCeO1Qw7jmgU5kTDwmw1KTo9wsUAWjWeaGwrZYlg4Le6w++ekYYYVVd74QD/J1IvIQBOHMLhJrbr911iHYuLbXHvv56hT1bmaSaiYMfAEABEImTpp3TIYVEL3yB7sqAzOoSm1vvR9S5ozVhI8vMXqQO5Zeq02Bq1ORu/gPHjlDYHgNW9zTFUaQgFti4b+raO4CO8CL8gijpCzwVb6/qpuOJ98kh9Ty6vyh+DS4ygtC7grkJlORQsOceyiMrQQ8L6k791Uf2wTai+HMW+V432jJqkZdMs60jpUTIYmU1spudUBf1G/J2KY76FG6fw2RBsN0kJ9FwJoHBPuH/nvHpPOsdXVV2nUMig1EKk50lzeyrJfAkU+S2Y6wISuPx0Sw/8xXMNnZBlSecidU7H6Px9Kg/6CZt6DXIW+ZC9bGwtwWiYZa05uQAHUktPdmVHbP4p51UEIXYyTdmy+CjfzNomScronvuYkoyA3FWhd0PDkj4ATclX/WqjqoNUMM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB7548.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFdERFpreHJzMy8xL3kxTG5rcXp2S3JKa2FCRzRDOVp6bDBaa1dPZUtyYVMw?=
 =?utf-8?B?SWpJUXhxbTRsNGUzTW0xV09uamF6UzRIN2wvSklpTEFOWW1CK0E3cUJ6c1V3?=
 =?utf-8?B?cGpoU21vMDRaRDdnUG1nSy9ocXpaNS9zV293NkdsZ1ZWakE0bEFrRVZNdS96?=
 =?utf-8?B?SEEzYWdDc3Y0emh2cDRhWVJ6bHFhdmVaR1BSMGZVc2dPRUNmMGozdWx0TVpV?=
 =?utf-8?B?b3NWTkkzNTE3d2REdXZjL1dnOXE4eDFTbUZMSHBWalFrSUE2aFNXWituYVFQ?=
 =?utf-8?B?cXFwVGhxc1JvRDR2NUhHb0NJQ3pEdHlqUmliU0xOMm80dk56eVh0TzJEOXNM?=
 =?utf-8?B?SkpXZ205QXhvbTRjN2I0TWxYcTJIbER1bFVoVlZnN2cra2x0U1JZL3ZGcFRs?=
 =?utf-8?B?cG1QWE9JMGF5bXJsZkhWeEEwVng4RmJHZC9kZGRON2tiUmhkOXJ5eGk2ZzJ0?=
 =?utf-8?B?dGE2SlhJc25VMTgzRkJUZisxVGNiL0tiOW5oV2JwMXZGMHo4dDN6TXdPT2Zh?=
 =?utf-8?B?WEZQaWl5UndNYXkyQ3FwR3U5djNQUjVCeC8zdmtBOHcrVzgzaHJiL0VSQnND?=
 =?utf-8?B?TWNsT1ZGcE9MT3NCNXhvbkRyUUt5dWZzWThOQm5sc3IydWdGUDlZbXljcnVo?=
 =?utf-8?B?QWxhbC90ZG1CK25nM1p0QVZKTUp1OFZPU2ZSSGVON0d3bFVYZmlkQU9QYk1U?=
 =?utf-8?B?cVZJc2pDR1RlcnFmSDBoUjZBemF6ZnFDTFNoSGNGd3VIWFFrdGUxUzhHcnBx?=
 =?utf-8?B?Rmk0dEJNRy9qdStZdUNZQUVrRDVKODZQN3luS0tpKzVCZ0hVenpJS0IzOHFZ?=
 =?utf-8?B?dGpuazBBYnBlM2h2aWhNS2RqZGU5MzF1TktoYzFoN1ArcjFGYkVzVThTZXlp?=
 =?utf-8?B?U2pnNGJQL1IrZkkrSEFtNURkTktNVGJYcjVUUU15YmN1OWY5N1NjdWExOVN0?=
 =?utf-8?B?UnZtWUF2MjB6MnJSTzVjOWVaVkJreUtkaHgycGJRNTVmUiswMGpTS1BYSXNM?=
 =?utf-8?B?aTJOUnh4VTlrUmpHQmdrVGU0SnlXUktJQlVjaUFtdzhZSXQxcFdHZEZCMTU2?=
 =?utf-8?B?V2tBbnJJdjNFNFRJb3NkSEM1K1k0VEhWRlErRDFXdkIwYThPOW9zamRFQW9G?=
 =?utf-8?B?RlY5RnV4cFpKVmkxWWgxSHN1UTRzbjJXVURMMmJHMXYvUmNHN0o5THBzQ0tB?=
 =?utf-8?B?aVUreWhHY2xjbk84NFJmSlpQYUthZmhGd2xIbUUwSHgxRkN3b2IzMDlTNERN?=
 =?utf-8?B?Qk85YXF1dkYyRGE5TmQ4c3F1T0wxdW5aaDg1Y0FETjYvZlVPUWhLSm92R0Ft?=
 =?utf-8?B?TVdqY2crRno5Ym43VHl1NHl3djZVYjR3amE3ZElsT2d3ekdZQ0xDaE1tNDhs?=
 =?utf-8?B?bHdFOEpSMFNMRm0yRFpPTG9iS2ZqdWd3MjNuTzNDeXdjMDNMamZySXVCakdk?=
 =?utf-8?B?K0VDK0xKMVJucjlsTlhhWFJtN3N4ZSthVnNEZE5maElxOC9XVGFJNnNENzZP?=
 =?utf-8?B?dUF3djh2WDNmNXkyT3VsYkdHZTcrTjB5UU81ekpyWHl0WXROVTNpd08zU09L?=
 =?utf-8?B?ZHZLS0RQVmU5SjJXU3RwUDBiMjQrZDZPM2pNdkR4WC85MWNqNzlPQ1pYM0Fv?=
 =?utf-8?B?TlNlVDhwM2dZeHpKSStpSTJ0TFA5YU80UUNkSWtuVHpNQzMxMnp6QjMvZHNj?=
 =?utf-8?B?eVp2cnh4clY2MEtCRk0xRXhUZ2FtVTBvUGRseEdkcVJ0cG51R2NESjNRUkZt?=
 =?utf-8?B?bU9GazZZTFYxRFl3dlkxaEtjTzNwazdGWFRqWWRpUWdacFhGVm43cHFnUFRj?=
 =?utf-8?B?NWFRTklybTY1YU53aWNXWTBvdUdkdy9SdldQOTgxQTVCcW9GKy9vZlB0cnJX?=
 =?utf-8?B?eGlMZTl2TWg2SlZqOEhNRzFwUEx3QjErb2paY1VOeC9HZGZEY0VJNC9nQ0sw?=
 =?utf-8?B?Rm9NRDBrTyttRVlyT1NCbzFKdUxuMVlWOTR3RW81MXlUeEpzNkRucU54T3pR?=
 =?utf-8?B?ZWNjNkx6SFJPb3oxTWdLTFJ3emp6S2pnK1Jkbko5Wk54OEYxbXFMd0xwRTJQ?=
 =?utf-8?B?VlBtMERxbVRPKzhicjl1enM2b3M0T2FGZU9KWXNFWHQ1SnNuS2NzbXdta21G?=
 =?utf-8?B?dmVZYU1rQi9nZnduYzhjRm5IaSsvcEZMY1lDQVovY3BweUdNazBsa0xsR0dt?=
 =?utf-8?B?Y2Y5cnhSTG90YXZPMElQTVdadnRNUGgvUkFyTVNiYWNYUFF0REJPZHdMWklS?=
 =?utf-8?B?NkJYS2wweWgwT2VEc1BEVkREY3ZCRll5SmZ3WkZydnp3d1FFbEpnVnI2RElk?=
 =?utf-8?B?RXV2TVd0ZG5YV24xbTF2QVEycFpwV2h1dDMvQnRtenVSV1RkQUhNQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7bee03-677f-4c20-7d11-08de75647295
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB7548.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 18:25:41.4895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlFLm3GZ1y9vpyXQeLQV0YKwzzLKC23HIr14pChwyB7Gy2h2Z79whxlIAx9Hcgzrm4pA4z5E1CcLKN7aJgyqPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	FORGED_SENDER(0.00)[mbloch@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:brett.creeley@amd.com,m:gaohan@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:maorg@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17323-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mbloch@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,amd.com:email,nvidia.com:mid,suse.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E6FFF1AF812
X-Rspamd-Action: no action



On 29/01/2026 3:56, Vivian Wang wrote:
> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> implement less than 64 address bits. This breaks on platforms where such
> a device is assigned an MSI address higher than what's reachable.
> 
> Currently, the no_64bit_msi bit is set for these devices, meaning that
> only 32-bit MSI addresses are allowed for them. However, on some
> platforms the MSI doorbell address is above the 32-bit limit but within
> the addressable range of the device.
> 
> As a first step to enabling MSI on those combinations of devices and
> platforms, conservatively generalize the single-bit flag no_64bit_msi
> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> with msi_mask.)
> 
> The translation is essentially:
> 
> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
> 

Hey Vivian,

We are seeing issues while reloading mlx5 on a PPC64 platform.
We see the following messages in dmesg:

mlx5_core 0000:00:08.0: mlx5_load:1266:(pid 1283): Failed to alloc IRQs
mlx5_core 0000:00:08.0: E-Switch: cleanup
mlx5_core 0000:00:08.0: probe_one:1959:(pid 1283): mlx5_init_one failed with error code -19
mlx5_core 0000:00:08.1: lsa_required: 0, lsa_enabled: 0, direct mapping: 0
mlx5_core 0000:00:08.1: lsa_required: 0, lsa_enabled: 0, direct mapping: 0
mlx5_core 0000:00:08.1: firmware version: 16.35.4506
mlx5_core 0000:00:08.1: 0.000 Gb/s available PCIe bandwidth (Unknown x16 link)
mlx5_core 0000:00:08.1: Rate limit: 127 rates are supported, range: 0Mbps to 97656Mbps
mlx5_core 0000:00:08.1: E-Switch: Total vports 2, per vport: max uc(128) max mc(2048)
mlx5_core 0000:00:08.1: Flow counters bulk query buffer size increased, bulk_query_len(8)
mlx5_core 0000:00:08.1: mlx5_load:1266:(pid 1283): Failed to alloc IRQs
mlx5_core 0000:00:08.1: E-Switch: cleanup
mlx5_core 0000:00:08.1: probe_one:1959:(pid 1283): mlx5_init_one failed with error code -19

We've bisectedthe issue to this patch.
We've pointed some AI tool to look at the reproducation script and this patch and it came
up with the following idea:

"
The bug is a missing initialization of msi_addr_mask on PPC64LE, caused by a PPC-specific PCI device creation path.
On most architectures, PCI devices are enumerated via the standard path:
> pci_scan_device() -> pci_alloc_dev() (kzalloc) -> pci_setup_device() -> pci_device_add()
But PPC has its own device-tree-based PCI enumeration in arch/powerpc/kernel/pci_of_scan.c.
The function of_create_pci_dev() does this:
 
pci_of_scan.cLines 215-235
 
    dev = pci_alloc_dev(bus);       // kzalloc -> all fields zeroed, msi_addr_mask = 0
    // ... manually sets vendor, device, class, dma_mask, etc.
    // ... does NOT call pci_setup_device() !!!
    pci_device_add(dev, bus);       // calls pci_init_capabilities -> pci_msi_init

Inside pci_msi_init(), the code only sets msi_addr_mask = DMA_BIT_MASK(32) when 64-bit MSI is not supported.
If the device does support 64-bit MSI (like mlx5), it leaves msi_addr_mask untouched -- meaning it stays at 0 from the kzalloc.
"

We tried a patch that moved dev->msi_addr_mask = DMA_BIT_MASK(64) from pci_setup_device()
to pci_alloc_dev() and it solved the issue we were seeing (don't know if this is the proper fix).

Can you please have a look?

Mark

> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) are
> used, no functional change is intended. Future patches that make use of
> intermediate values of msi_addr_mask will follow, allowing devices that
> cannot use full 64-bit addresses for MSI to work on platforms with MSI
> doorbell above the 32-bit limit.
> 
> Acked-by: Takashi Iwai <tiwai@suse.de> # sound
> Reviewed-by: Brett Creeley <brett.creeley@amd.com> # ionic
> Reviewed-by: Thomas Gleixner <tglx@kernel.org>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> ---
> v4: Patch message rewording (Thomas)
> 
> checkpatch complains about the comment include/linux/pci.h, which I have
> formatted similarly with other comments in the vicinity.
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>  arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>  drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>  drivers/pci/msi/msi.c                               | 2 +-
>  drivers/pci/msi/pcidev_msi.c                        | 2 +-
>  drivers/pci/probe.c                                 | 7 +++++++
>  include/linux/pci.h                                 | 8 +++++++-
>  sound/hda/controllers/intel.c                       | 2 +-
>  9 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index b0c1d9d16fb5..1c78fdfb7b03 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
>  		return -ENXIO;
>  
>  	/* Force 32-bit MSI on some broken devices */
> -	if (dev->no_64bit_msi)
> +	if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>  		is_64 = 0;
>  
>  	/* Assign XIVE to PE */
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..7473c7ca1db0 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>  	 */
>  again:
>  	if (type == PCI_CAP_ID_MSI) {
> -		if (pdev->no_64bit_msi) {
> +		if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
>  			if (rc < 0) {
>  				/*
> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>  		if (use_32bit_msi_hack && rc > 0)
>  			rtas_hack_32bit_msi_gen2(pdev);
>  	} else {
> -		if (pdev->no_64bit_msi)
> +		if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
>  		else
>  			rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index 9961251b44ba..d550554a6f3f 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>  	 */
>  	if (rdev->family < CHIP_BONAIRE) {
>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -		rdev->pdev->no_64bit_msi = 1;
> +		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>  	}
>  
>  	/* force MSI on */
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 70d86c5f52fb..0671deae9a28 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  
>  #ifdef CONFIG_PPC64
>  	/* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
> -	pdev->no_64bit_msi = 1;
> +	pdev->msi_addr_mask = DMA_BIT_MASK(32);
>  #endif
>  
>  	err = ionic_setup_one(ionic);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 34d664139f48..48f5f03d1479 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
>  {
>  	struct msi_desc *entry;
>  
> -	if (!dev->no_64bit_msi)
> +	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>  		return 0;
>  
>  	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
> index 5520aff53b56..0b0346813092 100644
> --- a/drivers/pci/msi/pcidev_msi.c
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>  	}
>  
>  	if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -		dev->no_64bit_msi = 1;
> +		dev->msi_addr_mask = DMA_BIT_MASK(32);
>  }
>  
>  void pci_msix_init(struct pci_dev *dev)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 41183aed8f5d..a2bff57176a3 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
>  	 */
>  	dev->dma_mask = 0xffffffff;
>  
> +	/*
> +	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
> +	 * if MSI (rather than MSI-X) capability does not have
> +	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +	 */
> +	dev->msi_addr_mask = DMA_BIT_MASK(64);
> +
>  	dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
>  		     dev->bus->number, PCI_SLOT(dev->devfn),
>  		     PCI_FUNC(dev->devfn));
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..0fe32fef0331 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -377,6 +377,13 @@ struct pci_dev {
>  					   0xffffffff.  You only need to change
>  					   this if your device has broken DMA
>  					   or supports 64-bit transfers.  */
> +	u64		msi_addr_mask;	/* Mask of the bits of bus address for
> +					   MSI that this device implements.
> +					   Normally set based on device
> +					   capabilities. You only need to
> +					   change this if your device claims
> +					   to support 64-bit MSI but implements
> +					   fewer than 64 address bits. */
>  
>  	struct device_dma_parameters dma_parms;
>  
> @@ -441,7 +448,6 @@ struct pci_dev {
>  
>  	unsigned int	is_busmaster:1;		/* Is busmaster */
>  	unsigned int	no_msi:1;		/* May not use MSI */
> -	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
>  	unsigned int	block_cfg_access:1;	/* Config space access blocked */
>  	unsigned int	broken_parity_status:1;	/* Generates false positive parity */
>  	unsigned int	irq_reroute_variant:2;	/* Needs IRQ rerouting variant */
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 1e8e3d61291a..c9542ebdf7e2 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
>  
>  	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
>  		dev_dbg(card->dev, "Disabling 64bit MSI\n");
> -		pci->no_64bit_msi = true;
> +		pci->msi_addr_mask = DMA_BIT_MASK(32);
>  	}
>  
>  	pci_set_master(pci);
> 


