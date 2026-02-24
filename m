Return-Path: <linuxppc-dev+bounces-17111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGCaH8CtnWmgQwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 14:55:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324D188138
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 14:55:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKzkL2nkCz3cNV;
	Wed, 25 Feb 2026 00:55:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771941306;
	cv=pass; b=beHUoMHAM7es1vG7LdSdwGDob/XUDzXLxvR9s5yUzw9jix+tUKBnw1X4sroTPrheK+281MYrznBxV9v09tGKivq3HZt8VA3cpmQA4eos+yTWKMJYdRcdAjTboDoohlHle9z0s5oWwXcluChjalQ4XuGkcLx6qdyAIGQJON/YvKwP9sEdCS/UZMmXCzpQeCGykBArUIdHXO+pSO2vsNXzTh8ND4iMiJNcwymDRIlySJHM3DeGTnx/NwWkEKbLWR3tNIAq/w3C5ShlBVN79utHiO+YqjyBh57Ah4yAWwX15+fT6JcV7kWIhHqVNln59o+DVMpxzzCQNGyvmagBNBhWKg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771941306; c=relaxed/relaxed;
	bh=XaW51jJjDmSDfiKtxHpqoySjpn5vkTtYcz3NNtoe3Hc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bhMLzoe5dbUIkqeMqbK6gwnykM/xpolCa5LHQ60ynu6HMCAS3DYgrESlemsxK971p+J90Q7dIs6DLJJN1/VLxwb6Oavhs3KWjfre9HFo8+nDeuTSMhbGkj4eQtDS4jPhfv0wr4NxcWNzei9Hlk4n/ZNPr4+DovgYpvIuCGTcivgPy2ARGfBXIxVAmenuXZWBvgGyGO9orXQtTefRolfBy9+j8BtPtbY/XAVJq/LOHG679t71lJS2Q7lHFEfy6VW0jNt2JPuP+97o49HKlGq3xbn3DnNRF61+2IWlsCIJJupzLKLA7qs67pqxpnmN+1qiKcZYEObvUMzJ+uM+NmcYow==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ogimq42r; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ogimq42r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKzkJ2XG2z3cND
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 00:55:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ0jEeaKEcMGvN6vy4fvB0AzTr0pz+cm9HAv9/GhF3i6eYkps0IDLqdwWNarRXLpIyJF8i162SEAfd8PfRngBCN+z5fsPtIHvgti7obndXz9u44TuN+cLbSLYqlHeUz81cPw49eKzjEI+1V8rVzXlbELMQ0nkwcD5I46uSWI/ToG/HNF58JN40eo5OzxCVPDPHfXm6GcClV8UtGCY6fTeNJ/UMIvNdvXUMzf1Hjf2Y2pAu/5VPKQ2pLvzWQJirx/V97qsFHg3jR0qLjeAObKQ7+dKO5fO5suBe333Q0TZ5+qPx5N7Z1NOhxPxtEuLS9fh/puwHKdPRrLz+C5YRjVeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaW51jJjDmSDfiKtxHpqoySjpn5vkTtYcz3NNtoe3Hc=;
 b=m9rIGaN/nsB35mtY4c87oI0YDjft2o/Kzs4g5INWOhQNfv4YZvu23HnmDJvq44LP6DlLE74xME8BoTM33RMU1xfya0qnJzA0ELPvqwQPnBSMZA8n0vy9nCvrJUC1k3sKWWjMod07/R3umw/yKgqyVMDDdYsSao81a5yyu57CCjF1ZjP+GtiFW52iOVNCSbUN9WRNAcJq5ANMoSUyf0z8GTb7jDTmv43YuUpMoOztjBs4aUFmVba8xrA/8zVKaePK8cMcCSCugRbrjK5a6iLIA3tBBZ8EAYOKqxSH2anorhpkBFO9Mvqfqwu8qAaiRWUtgqTPovQhz22uD3v3iZhpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaW51jJjDmSDfiKtxHpqoySjpn5vkTtYcz3NNtoe3Hc=;
 b=ogimq42rRGg0XNS1yW5LMbHtYqk9K+vFSoBk34Rt8WaZpt4njMpK5qnuAVWSRiGTI+zKE2zK5bguZJrjQX29L+R8QYkgG828zUf1VDrV2cxeHKT6rXQ42GRrlUzNYt2SraJatv87wGD5J3DrDIuurR7dFtgW1w0B+S+Xjr7gja+MWqFKeYRWsyKK9lpdp1Gocw/Ww6w7QydxXghF8im2/GEo52clpM4Q8Wjl3lUBwzeWeLI7UVybSdYacCnyFu9sOHRk7P7wc+511+X3r4QGsmdKpVdOFOr1lhSBxiH9EJEzzFWxPvAh58eWcB+tQjK506/kyyFxGpEV/+0mwEpzoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 13:54:37 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 13:54:37 +0000
Message-ID: <efd07d25-4db1-4fdc-a6d9-f6f16ae8a37b@nvidia.com>
Date: Tue, 24 Feb 2026 19:24:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>,
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
 Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Koichiro Den
 <den@valinux.co.jp>, Damien Le Moal <dlemoal@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-12-cassel@kernel.org>
 <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810>
 <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
 <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <CAMuHMdVTY=tV_3qq3gDuAHPjXnexT0Qq9SK39V-U2ACbvLRsaw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 06af6719-362e-47e1-aeea-08de73ac3f63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDNtVEhBQVJpMC9zVnpUNjdnV3UxOFNqMVBUdTRMV2FEd1ZvQkdpSzE3NVNL?=
 =?utf-8?B?aWRDNW1GNHlSMTVGaktVcElCVHU3ZDZPdWc2RlUxNG9yMXE3OWR5azAxeTZt?=
 =?utf-8?B?cGJxZWdxVHZ0MzkyaWhhVTdsLzk4bjJSamFTbkRkaW5DWlBEbkF2UVd6VFJp?=
 =?utf-8?B?bzFhdEwzUzR2STRBWDJ5VkIycnIzdUtRMVQ2QTR6VStxMTVFRG90SndsMjRa?=
 =?utf-8?B?VWMvcVhYaDQ1VXM1T0ZLM2t3VFNIdmEvVU9YdnR5N0hJWlAzOW81OTBXdWFK?=
 =?utf-8?B?ODlXMCszNXBSaUZ1dmNuVmgwN0VuNEIyZXJWREdUYnlhR1ZWVC9pSWg2azBV?=
 =?utf-8?B?S0tEbzU2NWJJbEQ2d3g4emRmQmltQm1zM0taQ0VlUzFDV0RGVFdCaU90VEh1?=
 =?utf-8?B?RldBdGlRcGxDb0s1VGo0TW5jeDlIeUlKY0wzSDZoZEw2QzNBT3JzbVpHZGxF?=
 =?utf-8?B?Y2p6ZWY0V2JINTkwbFFUblA0S0FvTU1Eek5sVUVHTC96Qm94WDIxNG50WkdL?=
 =?utf-8?B?UXRzUU8reTMzZThGdWpLbGJIVnhBMTBZUXN5ZXN5SVIvVEVqRXlaZkZJNU5r?=
 =?utf-8?B?ekM5Z25aRGpaOU93bTNCbloyNnNUeklJYzZGNUxYQTFUd01rOEc0bXNWVmtT?=
 =?utf-8?B?azJVVWswUFhnbi90WUZDV25HNzluUnZsMzV0NldXUko5UTh1cUM3THptVllk?=
 =?utf-8?B?VjdhM0tBbEJkTURPdWx6QmN3UkQvTXFrMkd2bkd1aWRXNjNSS3VZRDNjR0Nr?=
 =?utf-8?B?bGpBUVRyWFZScTgwenlIZTBMLzlaSlNnTlNielJmTm9kME56YWtlREEyZCs0?=
 =?utf-8?B?WUpqVnNzcFQzZFhwTndPRGRCZGNGdHkzM3k0VFJQNW9CSGZ1K2l6dG9TUnlO?=
 =?utf-8?B?U3ZpQUk5TVM5SlRXU2JCUTQ2eXMvVGFmUXZNK1hGY1gvL0ZKbWRnamRHSmMv?=
 =?utf-8?B?Rkc0RS9BdlFEb0lsUmtHZTJTZVpjcEFoam92RGVFY3ovK1FBZmNvWmhyLzg3?=
 =?utf-8?B?b25pbFY5YlZTM0NDVm01RGNFRThmak50alBTZVNKMzNmOGVQZmM5UjVOcGtv?=
 =?utf-8?B?SmxwZm42dWZ1SStQU0R5UXR2UDFHRjhhaUlaVWFFNmJGbWRHY0hFazl6eWFM?=
 =?utf-8?B?d1pCMmUrdENUTGpTcGxVOXdWSzc5Nk5LdHRqK09kWjY4UjVkWXBmK21wM2pw?=
 =?utf-8?B?V01qV1BWZDlYT3VJbk03MWxKWWZkazcxbGRsdS83cFE2WjVGeUM1d3dzaVN2?=
 =?utf-8?B?MitoQ0RPOE1xNldGcUVEY0JuYU9LQzlKTm8zcUwwN1dOcnMrSGVNNXVidkFt?=
 =?utf-8?B?V3hEeW1yZkdVRDFNaTVucnZ3S2xkTTltNWlnQWVTcGthRmZCTmdhYjhQRGtn?=
 =?utf-8?B?VVBhcmZJbW82YkRwNVMrcVh0ODN4QUJUWUVsUWlrSjlXK2pUZjI5QVpZMUZL?=
 =?utf-8?B?QmFxeVcweGZrNTJoeXRETUpRWENldGJvVjhpV0xaS0I3RHhMY3Brb2EwMmN4?=
 =?utf-8?B?b081dkI0bkNia1RZTklvTS90bS9JRGh4S2RaM0ZFSkRoUnBrZ3U2Uy9JS1pC?=
 =?utf-8?B?TjNSTTBKbnhMaUZLVkdqNzZGWk1GSDg4a3pzc1V5VnAxWDBnUzVWWDJXNXdW?=
 =?utf-8?B?cEUyTUdNM0hsbzRvSldKODNoTzJ1V2c2SHU5S2E0Z0VZUW93UmI5ek9VS2lp?=
 =?utf-8?B?VEpyUUhON3ROSG9jWmp1RitxaWFnS1BUeWNDVkFxMzltVGFnWm5oME5nc3d0?=
 =?utf-8?B?NVF0TFU2SmdjdnJETVZDbFVNWTlCeEtVVDRUVHR0Z1FyU2dyS3JNZWw5NjFl?=
 =?utf-8?B?S2hzQ3IwekVTVmdkdzQvS2dWNzU4ZXZuYXIySmR0U2VmWlBDMzhyZEFPaWNE?=
 =?utf-8?B?VEpLWkdDNjM0SDNYS0p6MHM4RjZtcGlyNGR0ejVlc0MrZjhxNE5kRlBCbURG?=
 =?utf-8?B?ajdOQjNHZ1RsQm5QWmVYZWRybjVGS0NRZE5FY05PbEJpdXR2VTQ1ZzR0YU5E?=
 =?utf-8?B?SG5veTJBaEJJREw5WjE2blVlcnlRSTFPUjNPckd3MkRFTjREWGUrMXBFTmd1?=
 =?utf-8?B?T1R2Zk5KK2tvMnBxTnp1MHJPVlY2ZWphMGhtUEh4MjVMSm0zRFZGSHdrdUZP?=
 =?utf-8?Q?zqjI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXk0dzF4dEphYk5ManZKOTkxQ3hhb2QrdEpHWUhnT1c3M1ExMUZuMGJ3amFs?=
 =?utf-8?B?THc1NzQ0S1JLUVFVR1lndnBvRldNVzdPelJqbzd5bW5ISnBUaVp2dERxejB0?=
 =?utf-8?B?a1JDRGF1cUx4dXF4MjBCYytiWHJuaVNPQ2NnanZiSFhGWDVzZWxXSXlZeGRE?=
 =?utf-8?B?YXI1U1A0dndyNjNoZTNGTkw1dFlzN1pJeERBd1hzOFExMngzVFg4MW9uOVF0?=
 =?utf-8?B?anpJZWJuL1JITEt2a09rUHlLcUdKd0EyN0RQOHBjNWJxV1ZwVUwwakVnMVRU?=
 =?utf-8?B?L0tCQWRXcmJ6YS93RVFIb2prUEtJYzhLMDU2OFJkaTk4TExzY2Q3dGl5TUU0?=
 =?utf-8?B?QVp4SkVOeVFRelQ0S3VXa2l1b00wQkZzSmxQMmdvNVozdG5xYnhsWlJlckg1?=
 =?utf-8?B?WWV1TU04Y1hOa3gyaXluaWVtNXBJZU1SRkhHT1V4Y1NrTXh4NDR0a3B0eHFK?=
 =?utf-8?B?RHRHYU5Ec0YwM0JaRFhIYXVqaFpxSVlPMkg2bktKVmROUnVWRUtnblRzaGdW?=
 =?utf-8?B?MkQvdzJ6RmhDNHRJU2JIYkpIMm9WM202NXJvTlJjTXRucUVYdEdTalc2LzM0?=
 =?utf-8?B?T213d0FzOVpBVDkwNGhObStyM3ZNeFhSVCt5SGlxb0toeCtXNVA3V2x2Tk9J?=
 =?utf-8?B?eTR0UVdFSVNtZHhSS0thU0xKbTZhaU5iMlVIYkpvZGdhL0Q3Si80eWh0NDdU?=
 =?utf-8?B?ajVvblFNZVJjbWgrc0IyeGNuZm5lcGF3dnc2N282ZkJmVEhqb1FUb2QwLzQ0?=
 =?utf-8?B?REJrRmJTcTFXeVdodGtWVzAxT1FzSTN2a3VNWm1rcURiSnk4Y28yV1E4WHVm?=
 =?utf-8?B?aTlSK3pSUHUyRDdTZFEvNlRSV0h0aVczeTBkaEloTUFDUjMvTjBQbS8zY3Zh?=
 =?utf-8?B?ZlpjL2Z3MWVqRjQ0QTF1Z3NzbGcrQ2h3NVh2cnptZVJYVExEVnVVT1ZlWDR1?=
 =?utf-8?B?UUhYZEUzam1BQUpaYTQvNXlBcmxzNUlFTlhVRHcrNUxqWk05SFh6dHlsUTZJ?=
 =?utf-8?B?WGpuK2MrVkxtYmVXN2lCMmZBUVpVeHRWeUpXRGdWbm5hTkZiU2RXNEJ2b2V1?=
 =?utf-8?B?YWQxN2I2emp4SXhVaGJyVURDS0VvOVNpWWNZNlZKK2JZdlVNSjlicE5hU24y?=
 =?utf-8?B?R3BHTFp2S3NXQzhzb0lkWVAxZ1dId1dIUEFoNUdDRllUTDNDRE4zTS9HS2RZ?=
 =?utf-8?B?SDNmKzF2bjZBYThGaTFwQ2MzSitkN1lYZC9tZ1AwM3hTZnFPc21SaE8xSG5T?=
 =?utf-8?B?WkJLVmpNSG9iT2JTS05pbmNRNVFkaXJTUmc4eWRFTi8yYkpCWWVOQzBDUEl0?=
 =?utf-8?B?bWhPMU1jcmd3NTFneElIekVSOWpUK21Nbm05eEppTlFtWnhnYmFZbHg1QkFo?=
 =?utf-8?B?bW5xU0l6NnpRbG83NUYvM1p3YlZ2RXZBamVuaTFINXNEVW5ZTmxGcmlIK1pO?=
 =?utf-8?B?U21SeGJFUHBnN1Mrdm5icVd6akJ3eENtN3dtclZLNXc0NytOSkpTTTRnd00x?=
 =?utf-8?B?cFJ1cGN2U3Ywb214c1pmR1VTK25DSEFWbWwxM0pLYVBVNEpISWl2aHJMNHhS?=
 =?utf-8?B?SURoQ1JIU0ZpR2tIbUtUMCtPWWI5OHVxaHY4eGVsQ1VDdDhFUGVnWjR2dzI2?=
 =?utf-8?B?VkE0TWJndzNGK1UvcE5WYW5zOWhmdmJSdVJiSkVMK0JxR21NRzdVbFc1aXp5?=
 =?utf-8?B?UzRiZWtKY0NaYkdRSGpqTldtNENScUtJdldUazRZSmlWTndhQXNpNzR6TXpk?=
 =?utf-8?B?QkRQNGpkeUNOb3RkOFFkNWJ5OGgxa0JWMkZEdHo4QWhCZE40dmJjWjhjb0Rv?=
 =?utf-8?B?SnpycmVUNFk1eDNKWmN0dGVDaTNBbG1JNk56ZXYrZHo3b3pjTTJzOTZDSUxn?=
 =?utf-8?B?eVpVNzlwZmJPcnE2R1lJTGN5R3JYV3BZY3FSVkw5V201M29ONnMzVlNmYU1V?=
 =?utf-8?B?Rm5Eb1dTS0J5dWFqeWdYRlB1UGNQRHRTWnNkSENlWlFscENncXp6dFZVRDBQ?=
 =?utf-8?B?VWlEVXpnZC9GaEM3Si9vOFlqbU9yQkFMalgrVE5Zdlh6WllwZjJveHM1L2dp?=
 =?utf-8?B?TzdNRGorWWJBY1dyU2N3REw1RnFWcHd1UlNwQUlQZnJXNEpRaTFBYnJHNUYy?=
 =?utf-8?B?a1dXQmdRc2YzVE9IK1BHb0l4VjhRZ2N4ZUREWXFlTUxiSTNNaVNJRlJqd3VX?=
 =?utf-8?B?ZHU3VVJFTkswMUxORkdHUFlOQ3BqSUtBZ094Rll0dnNwR2x0dGg0dTBnWitO?=
 =?utf-8?B?M1YxVUVVdXVlL2FmUitORkFjYkpvTjRxWU10cU1KUnlaWm0rZXhkVW1Uc05R?=
 =?utf-8?B?UCsxNlpNQUNaZlRDZFVwS1BrbDd2cVhCd2hWMitEcCtiaCtXVDFiUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06af6719-362e-47e1-aeea-08de73ac3f63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 13:54:37.2309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0dYdaVXNRux2WfutKSwNRGL3AnqGhqXnl88kTXhRyJRfNAk1FYkGLY33DDHrhLq3vVQbm+5RGFtanfhc+XZw0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17111-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:Frank.li@nxp.com,m:cassel@kernel.org,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:srikanth.thokala@intel.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kishon@kernel.org,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 9324D188138
X-Rspamd-Action: no action



On 23/02/26 3:44 pm, Geert Uytterhoeven wrote:
> Hi Manikanta,
> 
> On Mon, 23 Feb 2026 at 04:57, Manikanta Maddireddy
> <mmaddireddy@nvidia.com> wrote:
>> On 18/02/26 3:27 am, Frank Li wrote:
>>
>> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
>>
>> Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
>> BAR_64BIT_UPPER from BAR_RESERVED.
>>
>> This BAR type will only be used for a BAR following a "only_64bit" BAR.
>>
>> This makes the BAR description more clear, and the reader does no longer
>> need to check the BAR type for the preceding BAR to know how to interpret
>> the BAR type.
>>
>> No functional changes.
>>
>> Signed-off-by: Niklas Cassel <cassel@kernel.org>
>> ---
>>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>
>> Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> 
> [...]
> 
> Please do not send HTML emails to the list, as they are rejected.
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Apologies, I failed to realize that compose as html is checked in
my thunderbird client. I fixed it now.

Thanks,
Manikanta

-- 
nvpublic


