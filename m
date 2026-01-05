Return-Path: <linuxppc-dev+bounces-15285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E5CF5714
	for <lists+linuxppc-dev@lfdr.de>; Mon, 05 Jan 2026 20:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlQ8b0rzsz2yF1;
	Tue, 06 Jan 2026 06:58:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=40.107.209.62 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767636379;
	cv=pass; b=W89HRGOWpYvG+2sOiE1WtwUDFAeDLDeEWGTuraUOvFXGKnxqSZwDq8pgotyAsN69TMdt8x6TzpO2tK9YQENrB6tyxx1GCenGNUmj5Vavajo978HwiiSrvh8yy79mDkdpHs2ZwyRLhZL9Zmwv0D1sVc3A0if7ZBE6NONaoD+uYT/SBd6FaAvkXJTdLycZL78JoqYCLvl/WRhPajMtUCVPGS88FGKw6TDT51/QM2UPiWjGOvA1B2z9TQTcj2/y8mxsr4+4qgIZMSctCAl/vHXzEf4anEsQlRoGByygyG7L2LLvpejutWIGoQF1ujRU7ZeQdmQICBW5YiRMZQmpMrN70g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767636379; c=relaxed/relaxed;
	bh=casvrRVRa5faP4zei2U5QAjHPT9Ud4opIZxE6zezSuk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SJAzhg4erPFXKvQuZ7Rp29S5SSAsklZJz02tjS7fOQkcM4eXr/+bhsO1vwhi+RaEkQsletLlSVax8JBfthvnZBTTCWOlqctU8WYXU/4sMW40sWd34cG3JGy7tqfetyHpYWuGB075Z80kyjW7P3eJfvFF66eXiWU6qFZSjc6niDhsMBUEF+eBnSMaXx7JdhKH0KFjU07ZJuJG3pOf1EMX8mfssfV6XQffCS7m+OGb9SQ8aRnY6llxgk9LJ3X59IQjx0dl9QWGPQLkTQSM5J7Vw0iRVT3g8G4Jivrnlzl0TzYAS5xzw3x6MPzXerXVkTbpbYZ2WL6dWH06G/3XERZUhg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hpItik2+; dkim-atps=neutral; spf=pass (client-ip=40.107.209.62; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org) smtp.mailfrom=amd.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hpItik2+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=40.107.209.62; helo=ph8pr06cu001.outbound.protection.outlook.com; envelope-from=brett.creeley@amd.com; receiver=lists.ozlabs.org)
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012062.outbound.protection.outlook.com [40.107.209.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlMgF4NdWz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 05:06:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKhDmFicQMQlSDbONnlH8tNkdB9H00tbEkmtIEehCl9uJArgfLPmxHFF9gbhRGOFwDT71qs8OtadR8ENvYbsEMRhVgv9d8v7jVczcfZRlEZkcQlf/BAcIPug+MPnYLqhBVT1klUAlNB33ZcTziATopQhksM1CNk8Gq1BgnrFwqClmfBriBXpyx93UmuRysDElIXwDMIe+LP6YXMR6vRQNvXMnWrE7W4Ykq3Gl5Js5oCInAbqoR8mkOMY3DVS+e2KhFzaIkXhUmOCGwUhZRT1xIkA/VG/c5WJJP21eLBJiAPpVF0qEWczQ51GrPvpLZz8alyWBavNXgvLYAZIyY1Tog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=casvrRVRa5faP4zei2U5QAjHPT9Ud4opIZxE6zezSuk=;
 b=RaNjcg3Mx6KsXzMADdiYFFlPyDogDik3Y1vuKcY1JNBPs4074e3DN/sePNC3ZHw6wNpKn4Qwv92lSOtEALxhQppRioNBdByQGyODOHCm+nc+7VLaHF1VYPUTh2PrGZ05pPsEz2WKBalYQLQBdIqEVZO941G/H4z3Qj02oeyItD82dnrep8W6aweMyac71rmHK9kaurVYq9CVGXyb1Lpk/+zLkVAp1Z7FrJ+d11G9OmBxmE6MM6gX/8kAnF+Ko7ZlfkLiFEPU/FxL5p5LYy1+gq0HPcZOW2a3qMaLr8BWo34vpmiX9YjnRKiAUa3Z6JTuexvERlUPcUDc8iH98U0Uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=casvrRVRa5faP4zei2U5QAjHPT9Ud4opIZxE6zezSuk=;
 b=hpItik2+AxVNLt76WqKPDrtOTqeFWvBCfJQXOSAXgKTh8OXiqEsrDD2fdQLm3lXyHTNjQdMm4BMoquJGk/XYDLuHf1ULxrseOEzAl8pN0LIXSMiKMOTZ7JHa4EpNimXtNlSJb3NURtB5H/klTYf4sv1zuhj9voyL/GTw8K3+otk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:05:33 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a%5]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 18:05:33 +0000
Message-ID: <641c55d4-5c18-4b81-be04-404e6bb3fbb1@amd.com>
Date: Mon, 5 Jan 2026 10:05:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] PCI/MSI: Conservatively generalize no_64bit_msi into
 msi_addr_mask
To: Vivian Wang <wangruikang@iscas.ac.cn>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-1-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: "Creeley, Brett" <bcreeley@amd.com>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-1-05a6fcb4b4c0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0042.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::17) To PH0PR12MB7982.namprd12.prod.outlook.com
 (2603:10b6:510:28d::5)
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
X-MS-TrafficTypeDiagnostic: PH0PR12MB7982:EE_|IA1PR12MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 840fb2c8-782b-461a-aeb3-08de4c85051f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TEd6SDYxWDZmeWRUM251Q3hMYzdwQitYU3dYZG1XL2N0b05IRnBoWHhKdmh4?=
 =?utf-8?B?ejJmUDl5WDI1bjgxMzk3cWVYRm1DUS9LQWQrcDh0dUNacmtpclMrUW9YNjgy?=
 =?utf-8?B?MWtGczRqQ2t3V3NoeHJJNjA4MzYrc01VQ1NkMDVpL05NS2VzR1NBMG43dkI0?=
 =?utf-8?B?L3FQK1RZQUtsVmFHajVXdUtCSWtjMVRKY3krd29QSVZwQlh3clFqbTErcFNl?=
 =?utf-8?B?aEhKUnArK2QyZGplQVRJZmVYc1pCYnRhMUxPaTQ3UXJZY1dyZG5QNFdqYTdI?=
 =?utf-8?B?UjY0TlN1OENCdGtHMXdCTHN2cWxORUlDNlBkWGw2Nkh5OVJFaUQ2bGNNekhW?=
 =?utf-8?B?TkVkcUVHcEJuTzRMRHZnWUNBcFFlSmVHWmtZVm5sVkpmUi9NMExGdzVrMnBo?=
 =?utf-8?B?aWxCZ3FnL0dqMTdydTJ6L3NBb0xVLzBwWFNUNHJ1WXRaQ1RXZElsV3FXVm53?=
 =?utf-8?B?MW9EY3dkR1JKT010TEQ3ek5wN0lWbW0rVWJ6MUJJeHBxT2dNUy96bWNGTExh?=
 =?utf-8?B?M1pMK0V6ZDBpUS9jc3dvRGM2ejRmbXBZTGlBZDhKWGlncC9BTHYrK3lRR24z?=
 =?utf-8?B?YVFQb3RTVHZHelhOclVyTUhDQWRMOTd1L1lSM2FtM1huRzlYaXhNdCtuT2Mx?=
 =?utf-8?B?a2tITkhjMXZSR0JYQVJUU1FtM1pYZFljc21UNUgyVXpGVzhDdnQ0SWFxRnVR?=
 =?utf-8?B?Q29PU25Yc3UwRlFqckhkM3BMQjRRbDg0Zm9qU1ZJNVpWNm03VFlicm16UWw4?=
 =?utf-8?B?bEJtaHBKTXBpY2pPd2VvMno1OTFSTjIwY0JGTkQzUXVYRyttRnpWemNodFdy?=
 =?utf-8?B?UzQrMzl1L3pJekZYUklzQVhxbHQ0UTh4clExbnZyZWc4a2xncVpiT3AyYzVT?=
 =?utf-8?B?OExxVGVPZzZJQnhRdFB1Rm5zWURNK3BVcnk4cDVqNU94dE90Kzhic1FQbGZD?=
 =?utf-8?B?Z2htU2NGQllGWS9DbXB5ekVJYkl0UnQyc0dMcXRobjRRUmVjTDVpamFRWU9L?=
 =?utf-8?B?QkU5MC85RUJXNy9HNzNKR2MxanVyb0kxeVE3bFhyaThvSGlZNEpaVkduQ1Y0?=
 =?utf-8?B?cG5aOWJoNDFsTmc5NWs3NndmYmlpVktHVmZ2VUZqOG00R2U1ZWJWZEdQUURS?=
 =?utf-8?B?bmkrM0dsR09GZzlaeXNsSjVLUXU3VW5ob3RGN2Mya1dqUzhqdmZGeUFOV1NI?=
 =?utf-8?B?KzRXbXlYeURjYkJlSnd2ZEI2Z0MrODRaQXdhUzhHMXNwZkRSaGU0S0VqSnQ3?=
 =?utf-8?B?YkQxK3hlbmcwckd3Yk9tNXk1Y0ZPQ1JmUDk2S01jVUlVQkVsaTVmM3Fud1py?=
 =?utf-8?B?YlFHNkFmcEN6TVcyZ0ZSMkYzTzcxS3E5THYzbWhTY0h5cUtUbXZycDVvazZj?=
 =?utf-8?B?R1BmVm40THRmaG11Zmp4REZEc0t5YVU5RUtkWTBhdU96YmVHYzdrMVR6dFFv?=
 =?utf-8?B?OFloZ045MjlHTHYrdkVVZ0krV1dkTU9KcG9kc1VvTkRuUzJpcm81R0ZneTFl?=
 =?utf-8?B?Q2V3bWdpUDNSSUl4LzI0Qi9Kd2VQeCtUZU9iMnZaTmRBZnVHT05qRTBIRzVp?=
 =?utf-8?B?R3IyWldpSkdrbUNjYi90a2lIN0lSN0JyUFVxb0J4YWZMclBOYjFENHJ3eC9q?=
 =?utf-8?B?cnVsbTY5QzY3R0Q4WlAvUFovVElJRUZnY2w2MHhldEpkWHV4ekJWMDNUZTBI?=
 =?utf-8?B?VEtZSHUwcldCQ3RCMFlzTzBTbGx5L1pMdnIyaDJPbVZ2RHR5NGwySEp0TURv?=
 =?utf-8?B?V2pMUGRIbmlROXQzRmdoUEtVdE1tc2VxMGc1TThBdFUwV2lDa1g2NHBnL0Z5?=
 =?utf-8?B?eXBNZWx3ZTdWS3Nqb0F6T3dDYXI2MllXQmdNY3FnalNIQzFXNGdhN1ZiOGxT?=
 =?utf-8?B?OUF5VEVSZHF5a3JTdXo2NHVlWmJ6ZXQyYmlPV2ViRVlrbWQxTk11VmYwOWpv?=
 =?utf-8?B?Q0lZalYzeEVRRUo5TjNUdmg1VnFkMnpNRXdQb2xVRmlsNmROc3dmaUIvM0ZM?=
 =?utf-8?Q?SD6RzicCOfWWWQHq3ntlpKZj+nJJco=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7982.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0cvYU9oMEhBd0FsZlY3M3dSUDZWT3J0R0ZwV21xUWt6OWRhY3lpOVdRNDFL?=
 =?utf-8?B?WURneFp2YWlrMElYQW1IbVFjZ0xFMURrelpGcVVSVy9vVWdkZUtpc2tlazJB?=
 =?utf-8?B?T2hzVDkyQldCK0ZVSkNSSkpmdC9ieGQ2b1UrYmVONmNmUFFaM1ZGck5hcHlS?=
 =?utf-8?B?M1VhOFhrVHlIMFVySnZKUGtodGJjdHpaQUs1MkNKZDFhVjNlR1QxRUpUMzBM?=
 =?utf-8?B?UmRCaHp4UU0vWlBqa3JKa1g5c08rcHdMOWYvdEtsd2IwOVVnaUh5VG1NV2JZ?=
 =?utf-8?B?enIxUFM5NjVoeVlvajdkL3JtVy90TmRiM0tIaDNGa0ZXOGhsTHNMdWdUZy8x?=
 =?utf-8?B?R25hanpGQ3J0VGNTcDRmWlczY0M2YjlpT25INUJQUWMwUmdlVDBMYzZHK0Jo?=
 =?utf-8?B?V0V0eG9sZzNqVjUySEZhL0JYNWVMOUpycEU0dmtrMmRnbmxQTHN4QzhIM296?=
 =?utf-8?B?MkFnN1Z0OHFXdXA5anZtaWJRM3ZTcUg1UzQzU3Znb29tanp5RUFNandteW9I?=
 =?utf-8?B?d0hXc3o3NGJrOGIxc045YW91YVNOcDdXeU9OSkxBQ2lYYkZycHJpZmZNb3Jv?=
 =?utf-8?B?T3ExOWJnUkUyUU5LbmVRNGVJdUxsbk85MUE3c2xZVVpYVzlEQmxnbC9VUFNV?=
 =?utf-8?B?U1FoYUtBZERWWDZsd09qMWI4SEtzOHdtYXd5WDF1K0YxV1VEOWtabkUxcENm?=
 =?utf-8?B?S01yQ2htelh4aGlEcldKOUhNc0RzYUJHVTVHTkpPTkE3YzhCN0tSOElOd2Jv?=
 =?utf-8?B?RC9BSk5CSzJrbmNIMVVmTEdIRWxhQThZeG5lZWwyZzh4MVNnbVAraGQ2YS82?=
 =?utf-8?B?WWVPbzZCY0t2OGIranhIYnY1OGhZc2xWczByNjRVNHhLKytPZ0x3WXJ6WGEv?=
 =?utf-8?B?bkp4Sm9sb3g5RnVFVHUwNWJWYzNzQXJQakNCU081ZE9OMnhYb1h3cU1tWVdk?=
 =?utf-8?B?dk9ialFWaWVLQTJJZmJkYnBRVnowS203YXB4OHprSlFKZCtjL0FXNjhPSC9D?=
 =?utf-8?B?bWJlaU9Rd2NTRlE0RjZCK2dCTTdxVEM2ZGxnSjlDM1h3cHZtWWlzbjd2WjY5?=
 =?utf-8?B?UktCMTZ1RVBTQ1RvVlQvTS94Qmp4T2M4a25wVlhWQ2dZdkN2NEFNSFdDcTBr?=
 =?utf-8?B?K2w1a2lZWUdDejNkWXdFU3YzczZlTm1hZ1hVaFRRY3F1UUxRQ2g2OWRPYU92?=
 =?utf-8?B?MFZoM05Vb3U1SEFneGFvc1ltTzVtMlNYVGJxTTU5MlpJeHU2OEFVQTNHVUtq?=
 =?utf-8?B?REZaZ0Zyd2d2VU1JaHZQekFHOFJjSDI3a1hBVFkvOXlRV045MDZZUUk1Q0No?=
 =?utf-8?B?d1JHVStSeVdPWE9ybTBCTmxjQnM1MmpqUVdIczI1OVFnUjE4bUszUlNBdlAy?=
 =?utf-8?B?cGs2amNWSndhZGNNUk45UVQ2Vkd3bjRuY1M0VmlnUFdTTWgwN095UUdWUlZN?=
 =?utf-8?B?RFJaV2dGbERwL21vajVhS2hIUldidWdIcDRpMUpoZGF6aXJhUnlpUXV1UnVm?=
 =?utf-8?B?aTMxV1E2bm1qZy9RS2lpb3MyZjVFUTRMbFZ3S2I3L2NPb0ZBdjVkWERaTFA1?=
 =?utf-8?B?QkRoM3VxOUI3VFMveExHTDB6U2tDRUljb0l5TW5XWC9DNVlDYjloWGpmVk5K?=
 =?utf-8?B?cVdFaFVLYXBSVEFRQ21ZUDU4UjJBMTZsWFRkTUY1Q21qNWJGT1ZCcTZVMnJF?=
 =?utf-8?B?N1lLQUsrNGRJUERJMXA2WTFSMUx1U3hocVhuZG5oMnZBVE5xSUR0WGVjVENU?=
 =?utf-8?B?N3UwWG9tN0tYRXpqQWd6cVVjdlFxMnVuKzZlQVZDMVJCTlcxdlBXOFQ0VU5J?=
 =?utf-8?B?V1BQMTN3eVkvak41MlU2R0ZWbVVDbmFQeFRKenZvSnNFNnFMdlVESllNUmli?=
 =?utf-8?B?SmhOL3VsM3k0WjliQmxXUEQrQnk1TWRsd1VkWWdEMGgzOElOakdOUmJyRHJi?=
 =?utf-8?B?R3BCd0FPY3BJWXVJRlh6KzJmdS9KOTk2bWZ2SGJOMnZOWkxrbkZTeHNRNEpM?=
 =?utf-8?B?ejQvSFRtQkQzV3hxUjFlR0dYeXpjVDBPL3dYZlZLOWp5S0lTbWNNRUZqR24x?=
 =?utf-8?B?eGJnOVhLU3BWU0t3Slo3bGZ1TGhCcVdXWkRtcllzU0FwNWdTUFlTOGs4VEtx?=
 =?utf-8?B?N2Y0NlE5V0VEYmxpMStUS0N4UDZHanZHcUtVVXFpaytSVy9McnlFdFhrUzlK?=
 =?utf-8?B?MExpTjEvOVJuMTc1ZkRjSUVBdm9LVkJSTlpVcHd3S0NkelRTYzZIVmJ3MzRs?=
 =?utf-8?B?NGdqenFqdndRUFloM0xTamgxUDU1WTVlU2l3UFFaR21UYlB2RHV0d21GNmVR?=
 =?utf-8?B?UllhRGNTd0dEaVN0UDhpdnQ0WDBJMFVtamZxNjBUZ0ZRUmFvQkp0Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 840fb2c8-782b-461a-aeb3-08de4c85051f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7982.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:05:33.5120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEEs1226PqPjW2706R99A6qdoLLIYIz8F9Kz/PauoreFAiQX/nHWGZpE7M0QZTY61h1TmxSsvNVqS4ntJ3bChg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/23/2025 7:10 PM, Vivian Wang wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> implement less than 64 address bits. This breaks on platforms where such
> a device is assigned an MSI address higher than what's reachable.
>
> Currently, we deal with this with a single no_64bit_msi flag, and
> (notably on powerpc) use 32-bit MSI address for these devices. However,
> on some platforms the MSI doorbell address is above 32-bit but within
> device ability.
>
> As a first step, conservatively generalize the single-bit flag
> no_64bit_msi into msi_addr_mask. (The name msi_addr_mask is chosen to
> avoid confusion with msi_mask.)
>
> The translation is essentially:
>
> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>
> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
> used, no functional change is intended. Future patches that make use of
> intermediate values of msi_addr_mask will follow, allowing devices that
> cannot use full 64-bit addresses for MSI to work on platforms with MSI
> doorbell above 32-bit address space.
>
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>
> ---
>
> checkpatch complains about the comment include/linux/pci.h, which I have
> formatted similarly with other comments in the vicinity.
> ---
>   arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>   arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>   drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>   drivers/pci/msi/msi.c                               | 2 +-
>   drivers/pci/msi/pcidev_msi.c                        | 2 +-
>   drivers/pci/probe.c                                 | 7 +++++++
>   include/linux/pci.h                                 | 8 +++++++-
>   sound/hda/controllers/intel.c                       | 2 +-
>   9 files changed, 22 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index b0c1d9d16fb5..1c78fdfb7b03 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
>                  return -ENXIO;
>
>          /* Force 32-bit MSI on some broken devices */
> -       if (dev->no_64bit_msi)
> +       if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>                  is_64 = 0;
>
>          /* Assign XIVE to PE */
> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
> index a82aaa786e9e..7473c7ca1db0 100644
> --- a/arch/powerpc/platforms/pseries/msi.c
> +++ b/arch/powerpc/platforms/pseries/msi.c
> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>           */
>   again:
>          if (type == PCI_CAP_ID_MSI) {
> -               if (pdev->no_64bit_msi) {
> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSI_FN, nvec);
>                          if (rc < 0) {
>                                  /*
> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *pdev, int nvec_in, int type,
>                  if (use_32bit_msi_hack && rc > 0)
>                          rtas_hack_32bit_msi_gen2(pdev);
>          } else {
> -               if (pdev->no_64bit_msi)
> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_32MSIX_FN, nvec);
>                  else
>                          rc = rtas_change_msi(pdn, RTAS_CHANGE_MSIX_FN, nvec);
> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> index 9961251b44ba..d550554a6f3f 100644
> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>           */
>          if (rdev->family < CHIP_BONAIRE) {
>                  dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
> -               rdev->pdev->no_64bit_msi = 1;
> +               rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>          }
>
>          /* force MSI on */
> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> index 70d86c5f52fb..0671deae9a28 100644
> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>
>   #ifdef CONFIG_PPC64
>          /* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
> -       pdev->no_64bit_msi = 1;
> +       pdev->msi_addr_mask = DMA_BIT_MASK(32);

I know this is just an intermediate commit in the series, but does this 
retain the original intent?

Thanks,

Brett
>   #endif
>
>          err = ionic_setup_one(ionic);
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 34d664139f48..48f5f03d1479 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -322,7 +322,7 @@ static int msi_verify_entries(struct pci_dev *dev)
>   {
>          struct msi_desc *entry;
>
> -       if (!dev->no_64bit_msi)
> +       if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>                  return 0;
>
>          msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi.c
> index 5520aff53b56..0b0346813092 100644
> --- a/drivers/pci/msi/pcidev_msi.c
> +++ b/drivers/pci/msi/pcidev_msi.c
> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>          }
>
>          if (!(ctrl & PCI_MSI_FLAGS_64BIT))
> -               dev->no_64bit_msi = 1;
> +               dev->msi_addr_mask = DMA_BIT_MASK(32);
>   }
>
>   void pci_msix_init(struct pci_dev *dev)
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 41183aed8f5d..a2bff57176a3 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2047,6 +2047,13 @@ int pci_setup_device(struct pci_dev *dev)
>           */
>          dev->dma_mask = 0xffffffff;
>
> +       /*
> +        * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
> +        * if MSI (rather than MSI-X) capability does not have
> +        * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
> +        */
> +       dev->msi_addr_mask = DMA_BIT_MASK(64);
> +
>          dev_set_name(&dev->dev, "%04x:%02x:%02x.%d", pci_domain_nr(dev->bus),
>                       dev->bus->number, PCI_SLOT(dev->devfn),
>                       PCI_FUNC(dev->devfn));
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..0fe32fef0331 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -377,6 +377,13 @@ struct pci_dev {
>                                             0xffffffff.  You only need to change
>                                             this if your device has broken DMA
>                                             or supports 64-bit transfers.  */
> +       u64             msi_addr_mask;  /* Mask of the bits of bus address for
> +                                          MSI that this device implements.
> +                                          Normally set based on device
> +                                          capabilities. You only need to
> +                                          change this if your device claims
> +                                          to support 64-bit MSI but implements
> +                                          fewer than 64 address bits. */
>
>          struct device_dma_parameters dma_parms;
>
> @@ -441,7 +448,6 @@ struct pci_dev {
>
>          unsigned int    is_busmaster:1;         /* Is busmaster */
>          unsigned int    no_msi:1;               /* May not use MSI */
> -       unsigned int    no_64bit_msi:1;         /* May only use 32-bit MSIs */
>          unsigned int    block_cfg_access:1;     /* Config space access blocked */
>          unsigned int    broken_parity_status:1; /* Generates false positive parity */
>          unsigned int    irq_reroute_variant:2;  /* Needs IRQ rerouting variant */
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 1e8e3d61291a..c9542ebdf7e2 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -1905,7 +1905,7 @@ static int azx_first_init(struct azx *chip)
>
>          if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
>                  dev_dbg(card->dev, "Disabling 64bit MSI\n");
> -               pci->no_64bit_msi = true;
> +               pci->msi_addr_mask = DMA_BIT_MASK(32);
>          }
>
>          pci_set_master(pci);
>
> --
> 2.51.2
>


