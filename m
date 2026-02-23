Return-Path: <linuxppc-dev+bounces-17043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCRcFDRInGmODAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 13:29:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610CF1761AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 13:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKKt90P4Vz2yFc;
	Mon, 23 Feb 2026 23:29:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c100::f" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771819098;
	cv=pass; b=fHTJEyHM+4OrdL/uYXOy9pjdfneDxw2X0mDN6RSmpPVZdHzWzjkfddcQXgL4bgyXSA/xk8sv6JnNXaw/idWBl2wByj/Yv3p2u6KmdeaTmaKNBnrph3eLhQU04bQg1Vq8z618aXZLy5iOlmf6GYMmBIzFqCKyZ8gpgFTXQRWC5qbXrChCMk8bjTywAtZeIpkr4Mx7o+kMy4Rnya6Rb5y5ewEl3fFHdTThIp01Oh4t2k78jRY2B8x2jlDmKfL9zahQokVd8teSJfI/YBE3HHHXdiytX7yCZ6VSdRMIRoxDWto7YcL/DWtTP0GFVjMS/K08wW8zgIfzgXkMYLJ6zENiwg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771819098; c=relaxed/relaxed;
	bh=u9o5K80NEExtGnuhqYTl94l/6b3ABfw9u0VNt/4n9l0=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=gArK12mrvePtEX5YrQVndMp4o83uVgMO4lyOsbLI49ldlMhJM1ZZitL0ydrSQZGjo9ksdWNL6M8udQ0kk3vTvw7ws2bR0uQWogyQ2BA+gr4z5ONCQ9ktE1rb6S7Vban9AhZ0IgPz1HFi0TkZdRAbA8Npr8HTD6hCEbnJXGFmGQzL3+gHjxvKPUj9+Fw1SdgsgN+uw7IDrTgaHu+0tdYSvTIVUx8YLE6mRq1eLetcOfpQgmdgjVJTJfbp+0i05cKdoQXyFlszHXI8p+eCp6kRPRXxziaNlvupsLNWC9nrshIVpWZjRq9fe8aBvF5u1FC1T5ORMnUnXUnjDnWG6wExAA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LUuEZmYi; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LUuEZmYi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c100::f; helo=bl2pr02cu003.outbound.protection.outlook.com; envelope-from=mmaddireddy@nvidia.com; receiver=lists.ozlabs.org)
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazlp17011000f.outbound.protection.outlook.com [IPv6:2a01:111:f403:c100::f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fK6X92TmFz2xlv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 14:58:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v40YH2RI2P71bpW0pjdf5KEJK0r2YRfJo7pgpB/82608MTcmpbos3hSyII11AgKlRurX7lOhwqb+VJRadZow0p+4AKhZELz1f699rD7wYc6s5difiGP3BrqFf/6fMrcoKwkkVkI5J7qUWuERIeI9xCGoQhCufkG6EKDweclOiV2gTWg9zvhefdbiHGgFBdzLiJa/Dke4b950/+eAHigRW84rE5Z5TM4GTW6HY1V2+fMTSnBFj+yCUH/AZ8m3J7W6d5+NF10JCOb2pcp7ALKEkQJGDPKxsrIgP8eCfGVDHfwueQjRUPSjLk88wkf5r4pQGU9ASoj71gF4jNfpX/v1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9o5K80NEExtGnuhqYTl94l/6b3ABfw9u0VNt/4n9l0=;
 b=klyzmZlN/ReRo2a7LtRUgcsI7zrkmMjFAdidYn0DJWr4to9FhU70+jnsR+kOCAh0eSyyE51xw4QRjAL2VIpRdTY88hZGpNoHCy1ojn1TcA1THhQeaoLcyVdT0H5f7HxIcQyi1o5huAl6N/G4IAQ9BgVw/z+QwQOq9/tL4ldTU8ioGvvm5twSj8VeTmYHlv8IqAU/pNEw3wqk/AE1sZKkoHV8kXpttrDKcHMzdMeLYX/CYcrZD4y6VzYNkxBWffSOEcnCXLRK/i1W6iC8Uj+mRD9PVydbrhK+GHdcDnZ27K1amUEQu6aGs1BCnezt9G8OQ6qwTyPTj3Fx9y/pHe9Niw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9o5K80NEExtGnuhqYTl94l/6b3ABfw9u0VNt/4n9l0=;
 b=LUuEZmYirwxJSeiUfZGab8IP7L5Gl7tt6hJFiHnt/Cb9ZsawdRWVjLV/TRlCycl+0N5Xxu7j5KB0QNgwXbOksDTHsfGBsq3CB/BiWsqhgY2QS/HqY1h7D6mfKKnkwxODW0dINiVR4eMSEgfATas92Bu0ZlHpRuHb+QUOsA7w4HfMOCiLKQuSipZiPZREGaA1Y+SPsfYPVvPGzYKQX+7KSfmQ11KeIVffE+ew+0ieOy16trA6wqoIGz7fdPIg7cqWuNiBnhgd3cosj73R2LpFe3avGO5sdKjTBxYOy+bCYa/YFfMh/SZP9XxLFQB091dZXpt8lsfp7FRERrlZ0kwMZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 03:57:52 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:57:52 +0000
Content-Type: multipart/alternative;
 boundary="------------psjo7bK24x07fEr6R9ucfnwC"
Message-ID: <81af7f88-b9c1-457f-9a21-a7b15a13d374@nvidia.com>
Date: Mon, 23 Feb 2026 09:27:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] PCI: endpoint: Introduce pci_epc_bar_type
 BAR_64BIT_UPPER
To: Frank Li <Frank.li@nxp.com>, Niklas Cassel <cassel@kernel.org>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
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
Content-Language: en-US
X-Nvconfidentiality: public
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
In-Reply-To: <aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PN2PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::18) To DS0PR12MB8245.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: e070372b-a5f2-4a35-39bc-08de728fb7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZU9xeXp0UHFHdWdhaE9GckwzRWhnc3pDbFJ0eldLTkpjTXE2VkRGc01zczEr?=
 =?utf-8?B?eGNWLzJObU4wcGQxbURnVno4eE9XakkwNFUwRXhTZm82OEczR3NVVXgzbjJW?=
 =?utf-8?B?QmhPY3I2dmRueUc5NVo5YkFpaGM1cGxSVUZQOHJmMGlXNllNZFUyalcvY0NQ?=
 =?utf-8?B?NlpObWxSeGpJeit3MmF1OGxwS285M0toeE9YSkF4NFZTdVhsTGxpdm4xdlI5?=
 =?utf-8?B?dzJwRXd3czY4eWJtSjMvRjhyRzlKTUpkUExWa2kwZ2VPS0t0OXRtVTNHaDJx?=
 =?utf-8?B?YW15eHVhdHBUdWxuRElPbXh5TEFKLzBpTVNFcUZkdFBLRHB4b0ZNSUlRTG1i?=
 =?utf-8?B?L3RlZzZ2aWp1dmwzYjRlS0xYRWM3UGw2MEdOVXdVdU1YRGpldCtLY212U0I5?=
 =?utf-8?B?OHV3UVE2b1NmUnBpSyt1VngvYXRMcGxKL0lKZ000MjVFSzBubkFrQXdTalRG?=
 =?utf-8?B?WmRKd3NjZE5kRURkcUh6amVXdmxCRWp1bll2QTZmUHFid0ZWRlp4K2ZPMlFi?=
 =?utf-8?B?Y1lxdVdZV2hCMkszTUVVaTVTZnkwb1dIdUE4MnA5UzY1OUdGU01WQ1c3V1Jt?=
 =?utf-8?B?T3ZlVXhQdXJDTlN2Z2d4UklmUjdpL0RuYzlUQkExY29hR2EwVzFId3Zxb3hV?=
 =?utf-8?B?WnVPYWN3QzBFOXVqWHk2SmQ2RGJFTDBwTU9VSG5MSUhURk5jOEs4RkZSNGo2?=
 =?utf-8?B?WHdqZWVIZTdVRzlVUkNGTU5xUWxQbW5qeE5kSmluNTBTU3FxZE5Cd2JjZU9M?=
 =?utf-8?B?bkRFeWt0RUJoNDRybXlqczlmQVlPdXRxZXdpTXpaVUJaNFJJUnYzVkExa01O?=
 =?utf-8?B?WFFQRjRyN2xNbHBhZlBXVFNwc1d3MFovdEx1U29zdnJkZ21CdFBDZ0pwTHA1?=
 =?utf-8?B?a2hvK2l3ZHRVYitnR09oeURZbDZnYlpxZmdsUS9iNXh6b0Nya3lDTkpUaWdj?=
 =?utf-8?B?UnhoRWRlaDIyWHdiN0VvRTFoQ05uUlpVTTkvMDYwSTdyY204cGJGeVhvMGwz?=
 =?utf-8?B?Y0MyTS9RQzAxNlRZdTl2T3RSTHBJS3hJbm53VFBibkJxcUZMYmkxMVdIWEQ1?=
 =?utf-8?B?U29IOERyLzJxY2dqaVprcE0rN2NRbUVNc0FPRkRrS21vaUN2V2duRXZRWXZE?=
 =?utf-8?B?QVVIbjRiWlcxQWFWY3VUMU84NEwxVlFDMzJKSzJkWHdGNHJnYVV3TXZERTlP?=
 =?utf-8?B?OUgwWFl4Mk1lS3IrVEM2ZUVTRkpmalBqMy9zT2tSdUIrczhaamhxOFpkVHVx?=
 =?utf-8?B?ekRydTVRZmJVY3o4TUhZdXFzUnpySU9lU2FGT3BOSS8vWXh6OVk5cG9EVWly?=
 =?utf-8?B?enVkV0w3Mis2K0wzdnpvU0RZSzgrMlhNWCtmS0dneXRnZ1U2aFBYdDUyelBF?=
 =?utf-8?B?RnBlYmI4c01TaDZmREZ4NUJPRzlvTFRCd2xjMkZMdTk4ZjN1VS9VTS9DYWhL?=
 =?utf-8?B?WGx2T0RZc2U5ZXBpcitSaEc5bnUzZXlMdmRBZUFnWEtYcitPNGhxYjY3RVVm?=
 =?utf-8?B?Sldqa05CWGxVdzlvOTMxTEx4UzVBd1ZQM3pxUElwaHBTYUV6UGE1ellURjBH?=
 =?utf-8?B?MzRocDltVzBiTHcrWm0wOEFXVWhlYi9mRFZIRlJYYVZyK0tQMUxDL2djbzls?=
 =?utf-8?B?NkhrSnArZDF6cWtrSkNQUjZzbEdmVGVTV2p1N2lXdCs4aUlXZHhGYmI4SGZk?=
 =?utf-8?B?LzVqU3hlSUc5ZGM0YTNiMHUvS2xnTU1LMHN4N3IySGtTRVdJeGNkVWo1bjBI?=
 =?utf-8?B?YldadUIyOTlKU2w2VkRZYXMxQVJwVzgvMjFYQUtDTW5rYXBMUWh4dm9FbEpM?=
 =?utf-8?B?YXFwcGtTajBpRi81RTY4SGNsYUgxcS9NamlhQjliK2pHR2I1eVJQdE5sUEw4?=
 =?utf-8?B?YTZWUmp2UlhzU3c4WlUwTkhGekx3bDhPa1NyTk1LaTFCS1VWU281bU1Kc2dU?=
 =?utf-8?B?N0ZobkJ5Uk5XN2VLMHFDd3dnUjQvQ2p4cEhrRllqU2t3Zit0V3prV2tncVZl?=
 =?utf-8?B?azZvbUg5U0Uwd09OdEF0Rm1PNzNlM2MrMjM5aDdOS0lRUUtma0psUXJFOWJL?=
 =?utf-8?B?R1d4WGdzMTZjemRLcEI3ZXN2TC8xM05mL2MzeXZrUW05M0daT0FsTUJFQW9v?=
 =?utf-8?Q?ijpo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0FjN1hKdURBc3RnWmwzV2tMTW1QejNlNlhiMmxXai9NdlRRb0s2dmJwRGZR?=
 =?utf-8?B?enFTVUpZYUtBQlN3MHo3SFZwZGtKenZ1UkdaZkszNzFpUzROaFJ3RVVGMHIr?=
 =?utf-8?B?N0E4eENtWnpmR08ybENpUGw4SE9pNUV5QmJXUGNrS3JZaXhjaUkwNEovcTY1?=
 =?utf-8?B?Z0NnemE3NEFPT1JaMWwxWlZSd2VoWk9waW9WSjlqNStyQkRidWdnSzZseHJW?=
 =?utf-8?B?WVRUbUw4V1RzbXlEaDlTWDFaK09zcWIvUkVBMVkyS29JcUR4d0FEZUFHVnFR?=
 =?utf-8?B?cXFaYmE0cC9TMGRHcVgyaUpuQXZ6T0h0NGt2OWlaTUhoRFZtWm4vbmp3bjZ2?=
 =?utf-8?B?M2xvZTQ5UVBLQnBrTUZmei80bXZxam10eGtGb1kzaXBJNFpHT1p3eGM4N28v?=
 =?utf-8?B?WEh1bjhOKzVBZFZwYXU1U0ZLZFRxV1RDdEFtcFdtL0pXT251Y1lRLzBLWXBR?=
 =?utf-8?B?UFFKdnMwUldrK1Z2K0dmeVJJM2syNG9GVnlndHpPdVR3RVZjeVFPeGE4UFlm?=
 =?utf-8?B?MERVbFhiTHRqekZQSkJUQ3B6NEI4dWpnMzBmQU9nRUs0S3B5QXp1TUo4Y2dS?=
 =?utf-8?B?L1QvNVlJUjFhOUF5bVRVUWRWeU1IL2JNcHg5elp2eXNnUEZhYThjVlVYYUUv?=
 =?utf-8?B?TCtZOCtjOVBkcUpwR3d5QnZlVmp3U0RrTHQ0d0FERzNLUDVzb2hJK2ZDSzBr?=
 =?utf-8?B?MlNFOUR4SDdxbG5UcTJnUkxGMXFpbGxza2ppTGtuSW14Yi9xRU8vR0lmcGtu?=
 =?utf-8?B?N21HVExvN2RPL2pqZjdncnhvYXhDcFBxQkVYKzIya3pJMXUza1Uxd0x3R0xs?=
 =?utf-8?B?UXhSb3ByMjVXZnJUODBMK0hleGM3WDY2cHIrTUEzQ0NJZzFnUExCbGhTQ1hr?=
 =?utf-8?B?U0REVFN5cWpteXNrL3dHOUg1ME4xSkhhcytyM051c0t6amVkYlBKQ2xIUW56?=
 =?utf-8?B?WEN5K2RyMGJ0VUFrM25MSmhwcHgwSm9SeVhxRExjZDRYUkR1NU1iYnNIYTdz?=
 =?utf-8?B?aVpERUxBTWZoUVZYVDZha1E2RzBEWVpQMVRkNHNXWmNibDZsNEltUU14ZzVs?=
 =?utf-8?B?ZFVRTW0ramhIbms4Q3FISmw1T1hNMFFMQys5TjlqSW16ZTM4VWNoV3Azb1Ji?=
 =?utf-8?B?cWZMZUdwd3FpVjEvdTV2dXk4YkpFeE9YQmxrbjV2MENQdlpnL2FLYXAvU1VY?=
 =?utf-8?B?QVM0dC9tQUNpbnA2cGZHYllkcHdtUTJ6S0M1S1RzVUxTd0NHL0VqU2F5MXJR?=
 =?utf-8?B?VXhYSjNocW9PWmdkRkJON1B6b0hOWmV4WnVPKysyZ0NhYUdZOE5xdWE0MUNC?=
 =?utf-8?B?ekVSNFRYeUZRRy9SOGY5WThBbWE4TlNISitBd2lrR3orQllpQ2xPVjBWZWov?=
 =?utf-8?B?Vi9JbUw4dDhjSjltNnIxckQ2Zzlmb1UxNU1iMW5wVEVQVWtGZGROZ0RLQzgx?=
 =?utf-8?B?ZFhNYzhDWTJVbEhvWEYzWER1ano4cHZNYWttTVJsZDB1T0tvYzYrZktuU2hi?=
 =?utf-8?B?eHRHZTVreFJlQXQvckMyOGh5S2xDa2dyMmZNRTVRYmJ5ZnNsZDNjVUpHc0s3?=
 =?utf-8?B?T0U3MjJsVTV4R25JTXFYTE9iT2Q0VEN2RmpxM3NyZEl2TmxYSks4aUFWdm4w?=
 =?utf-8?B?VHp2dXNWWmh2cENVVDFNWkJyMEdLMVR2aXRPVXJ2UGprUWJzdTVuWng4VjZv?=
 =?utf-8?B?cEdkaWM2RkJwb2tZVlBqNUVHYTlnQmg4QldaYXRLTktiQkxSanlBbEF5ZElY?=
 =?utf-8?B?blBqN3VBNStYVjkzdWM2UnJvTFBRTnBJY0RwWjNiMkxBTWJuWHpPRk5yUFEx?=
 =?utf-8?B?ckprTnFqZEpDZW42UFRuK2xVN3FKNjJ3WldHZW9iL2N0U2hxd2pPVVNweTFM?=
 =?utf-8?B?UFdOcHBpaEh1TUNFY29idmo5ZjhXWVgvblJXMFlzbXlaWnd0RkRDQ0gwa1lp?=
 =?utf-8?B?cXFHbzdGOUljQkdXMlVOS04rMEtLNTR1Y1V1MzNWL3diek4vQnNKM1RVcVpZ?=
 =?utf-8?B?cklhL1duejlJL0NLYU9qRklGRmlyRDM5V0xGbmlwSG9vNlBndm5rdGtKaUpW?=
 =?utf-8?B?VG5KWDhGL1VSNitBQUJxaE9BRmF0WjhZWGpTRVp4cktEeDJHeEVWakhoZ3BN?=
 =?utf-8?B?dnVKbFBzSFB1alF0UU1QMUxadE85R2JUV0lIdWpiRm1RZHM0RE9YcjhmY3hG?=
 =?utf-8?B?aXp4b0JGS0ZIOXMxdkR2NDR3SzVXZG5HbGZzL3VFbDdiaFloMGZoYWpEbG9F?=
 =?utf-8?B?bWtWMHpwRVBkQ3dZNEZmdzZ4MzJOYVhzT2JUZkRKUWNtRVdEaGpQMkZuSWlj?=
 =?utf-8?B?MnZmY3RGUDY1eFRkUXIvOEhYRXl4YU5NRGg4RmdhZGIzd3d6cFJOTWk2dTJR?=
 =?utf-8?Q?7OzXQTBaUrGK/e4k=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e070372b-a5f2-4a35-39bc-08de728fb7dc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:57:52.5565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoZ9hgDeT+KNSVcRvwsniedgDKgedvcy9ig4i0z0FL2XCbDPO3HngLwKDVJDqmr1P27i1ts3AOEycMP0nL1iSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17043-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:Frank.li@nxp.com,m:cassel@kernel.org,m:minghuan.Lian@nxp.com,m:mingkai.hu@nxp.com,m:roy.zang@nxp.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:srikanth.thokala@intel.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:hayashi.kunihiko@socionext.com,m:mhiramat@kernel.org,m:marek.vasut+renesas@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:kishon@kernel.org,m:den@valinux.co.jp,m:dlemoal@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:thierryreding@gmail.com,m:marekvasut@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.915];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mmaddireddy@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nxp.com,kernel.org,google.com,intel.com,gmail.com,nvidia.com,socionext.com,renesas.com,glider.be,valinux.co.jp,lists.ozlabs.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 610CF1761AB
X-Rspamd-Action: no action

--------------psjo7bK24x07fEr6R9ucfnwC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18/02/26 3:27 am, Frank Li wrote:
> On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
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
>> Signed-off-by: Niklas Cassel<cassel@kernel.org>
>> ---
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
Tested by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
>
>>   drivers/pci/controller/dwc/pci-layerscape-ep.c |  4 ++--
>>   drivers/pci/controller/dwc/pcie-keembay.c      |  6 +++---
>>   drivers/pci/controller/dwc/pcie-qcom-ep.c      |  4 ++--
>>   drivers/pci/controller/dwc/pcie-tegra194.c     |  2 +-
>>   drivers/pci/controller/dwc/pcie-uniphier-ep.c  | 10 +++++-----
>>   drivers/pci/controller/pcie-rcar-ep.c          |  6 +++---
>>   drivers/pci/endpoint/pci-epc-core.c            |  3 ++-
>>   include/linux/pci-epc.h                        |  5 ++++-
>>   8 files changed, 22 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> index a4a800699f89..5a03a8f895f9 100644
>> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
>> @@ -251,9 +251,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>>   	pci->ops = pcie->drvdata->dw_pcie_ops;
>>
>>   	ls_epc->bar[BAR_2].only_64bit = true;
>> -	ls_epc->bar[BAR_3].type = BAR_RESERVED;
>> +	ls_epc->bar[BAR_3].type = BAR_64BIT_UPPER;
>>   	ls_epc->bar[BAR_4].only_64bit = true;
>> -	ls_epc->bar[BAR_5].type = BAR_RESERVED;
>> +	ls_epc->bar[BAR_5].type = BAR_64BIT_UPPER;
>>   	ls_epc->linkup_notifier = true;
>>
>>   	pcie->pci = pci;
>> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
>> index 2666a9c3d67e..5a00b8cf5b53 100644
>> --- a/drivers/pci/controller/dwc/pcie-keembay.c
>> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
>> @@ -313,11 +313,11 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
>>   	.msi_capable		= true,
>>   	.msix_capable		= true,
>>   	.bar[BAR_0]		= { .only_64bit = true, },
>> -	.bar[BAR_1]		= { .type = BAR_RESERVED, },
>> +	.bar[BAR_1]		= { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_2]		= { .only_64bit = true, },
>> -	.bar[BAR_3]		= { .type = BAR_RESERVED, },
>> +	.bar[BAR_3]		= { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_4]		= { .only_64bit = true, },
>> -	.bar[BAR_5]		= { .type = BAR_RESERVED, },
>> +	.bar[BAR_5]		= { .type = BAR_64BIT_UPPER, },
>>   	.align			= SZ_16K,
>>   };
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> index 18460f01b2c6..e55675b3840a 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
>> @@ -850,9 +850,9 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
>>   	.msi_capable = true,
>>   	.align = SZ_4K,
>>   	.bar[BAR_0] = { .only_64bit = true, },
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_2] = { .only_64bit = true, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>>   };
>>
>>   static const struct pci_epc_features *
>> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
>> index 06571d806ab3..31aa9a494dbc 100644
>> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
>> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
>> @@ -1993,7 +1993,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>>   	.msi_capable = true,
>>   	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>>   			.only_64bit = true, },
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_2] = { .type = BAR_RESERVED, },
>>   	.bar[BAR_3] = { .type = BAR_RESERVED, },
>>   	.bar[BAR_4] = { .type = BAR_RESERVED, },
>> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> index d52753060970..f873a1659592 100644
>> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
>> @@ -426,9 +426,9 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>>   		.msix_capable = false,
>>   		.align = 1 << 16,
>>   		.bar[BAR_0] = { .only_64bit = true, },
>> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   		.bar[BAR_2] = { .only_64bit = true, },
>> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>>   		.bar[BAR_4] = { .type = BAR_RESERVED, },
>>   		.bar[BAR_5] = { .type = BAR_RESERVED, },
>>   	},
>> @@ -445,11 +445,11 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
>>   		.msix_capable = false,
>>   		.align = 1 << 12,
>>   		.bar[BAR_0] = { .only_64bit = true, },
>> -		.bar[BAR_1] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   		.bar[BAR_2] = { .only_64bit = true, },
>> -		.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>>   		.bar[BAR_4] = { .only_64bit = true, },
>> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +		.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>>   	},
>>   };
>>
>> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
>> index 657875ef4657..9b3f5391fabe 100644
>> --- a/drivers/pci/controller/pcie-rcar-ep.c
>> +++ b/drivers/pci/controller/pcie-rcar-ep.c
>> @@ -440,13 +440,13 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
>>   	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
>>   	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
>>   			.only_64bit = true, },
>> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
>>   			.only_64bit = true, },
>> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
>>   	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
>>   			.only_64bit = true, },
>> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
>> +	.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
>>   };
>>
>>   static const struct pci_epc_features*
>> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
>> index 068155819c57..8de321e1c342 100644
>> --- a/drivers/pci/endpoint/pci-epc-core.c
>> +++ b/drivers/pci/endpoint/pci-epc-core.c
>> @@ -104,7 +104,8 @@ enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features
>>
>>   	for (i = bar; i < PCI_STD_NUM_BARS; i++) {
>>   		/* If the BAR is not reserved, return it. */
>> -		if (epc_features->bar[i].type != BAR_RESERVED)
>> +		if (epc_features->bar[i].type != BAR_RESERVED &&
>> +		    epc_features->bar[i].type != BAR_64BIT_UPPER)
>>   			return i;
>>   	}
>>
>> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
>> index c021c7af175f..c22f8a6cf9a3 100644
>> --- a/include/linux/pci-epc.h
>> +++ b/include/linux/pci-epc.h
>> @@ -192,12 +192,15 @@ struct pci_epc {
>>    *		   NOTE: An EPC driver can currently only set a single supported
>>    *		   size.
>>    * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
>> + * @BAR_64BIT_UPPER: Should only be set on a BAR if the preceding BAR is marked
>> + *		     as only_64bit.
>>    */
I think another patch is required to handle the set_bar().
Set BARx+1 type as BAR_64BIT_UPPER in set_bar() callback if
the epf_bar->flags has PCI_BASE_ADDRESS_MEM_TYPE_64.
>>   enum pci_epc_bar_type {
>>   	BAR_PROGRAMMABLE = 0,
>>   	BAR_FIXED,
>>   	BAR_RESIZABLE,
>>   	BAR_RESERVED,
>> +	BAR_64BIT_UPPER,
>>   };
>>
>>   /**
>> @@ -207,7 +210,7 @@ enum pci_epc_bar_type {
>>    * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
>>    *		should be configured as 32-bit or 64-bit, the EPF driver must
>>    *		configure this BAR as 64-bit. Additionally, the BAR succeeding
>> - *		this BAR must be set to type BAR_RESERVED.
>> + *		this BAR must be set to type BAR_64BIT_UPPER.
>>    *
>>    *		only_64bit should not be set on a BAR of type BAR_RESERVED.
>>    *		(If BARx is a 64-bit BAR that an EPF driver is not allowed to
>> --
>> 2.53.0

I think below comment should be removed.

  *              only_64bit should not be set on a BAR of type BAR_RESERVED.
  *              (If BARx is a 64-bit BAR that an EPF driver is not 
allowed to
  *              reprogram, then both BARx and BARx+1 must be set to type
  *              BAR_RESERVED.)

--------------psjo7bK24x07fEr6R9ucfnwC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 18/02/26 3:27 am, Frank Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810">
      <pre wrap="" class="moz-quote-pre">On Tue, Feb 17, 2026 at 10:27:07PM +0100, Niklas Cassel wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add a pci_epc_bar_type BAR_64BIT_UPPER to more clearly differentiate
BAR_64BIT_UPPER from BAR_RESERVED.

This BAR type will only be used for a BAR following a &quot;only_64bit&quot; BAR.

This makes the BAR description more clear, and the reader does no longer
need to check the BAR type for the preceding BAR to know how to interpret
the BAR type.

No functional changes.

Signed-off-by: Niklas Cassel <a class="moz-txt-link-rfc2396E" href="mailto:cassel@kernel.org">&lt;cassel@kernel.org&gt;</a>
---
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Reviewed-by: Frank Li <a class="moz-txt-link-rfc2396E" href="mailto:Frank.Li@nxp.com">&lt;Frank.Li@nxp.com&gt;</a></pre>
    </blockquote>
    <font face="monospace">Tested by: Manikanta Maddireddy
      <a class="moz-txt-link-rfc2396E" href="mailto:mmaddireddy@nvidia.com">&lt;mmaddireddy@nvidia.com&gt;</a></font>
    <blockquote type="cite" cite="mid:aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> drivers/pci/controller/dwc/pci-layerscape-ep.c |  4 ++--
 drivers/pci/controller/dwc/pcie-keembay.c      |  6 +++---
 drivers/pci/controller/dwc/pcie-qcom-ep.c      |  4 ++--
 drivers/pci/controller/dwc/pcie-tegra194.c     |  2 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c  | 10 +++++-----
 drivers/pci/controller/pcie-rcar-ep.c          |  6 +++---
 drivers/pci/endpoint/pci-epc-core.c            |  3 ++-
 include/linux/pci-epc.h                        |  5 ++++-
 8 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index a4a800699f89..5a03a8f895f9 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -251,9 +251,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci-&gt;ops = pcie-&gt;drvdata-&gt;dw_pcie_ops;

 	ls_epc-&gt;bar[BAR_2].only_64bit = true;
-	ls_epc-&gt;bar[BAR_3].type = BAR_RESERVED;
+	ls_epc-&gt;bar[BAR_3].type = BAR_64BIT_UPPER;
 	ls_epc-&gt;bar[BAR_4].only_64bit = true;
-	ls_epc-&gt;bar[BAR_5].type = BAR_RESERVED;
+	ls_epc-&gt;bar[BAR_5].type = BAR_64BIT_UPPER;
 	ls_epc-&gt;linkup_notifier = true;

 	pcie-&gt;pci = pci;
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2666a9c3d67e..5a00b8cf5b53 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -313,11 +313,11 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
 	.msi_capable		= true,
 	.msix_capable		= true,
 	.bar[BAR_0]		= { .only_64bit = true, },
-	.bar[BAR_1]		= { .type = BAR_RESERVED, },
+	.bar[BAR_1]		= { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2]		= { .only_64bit = true, },
-	.bar[BAR_3]		= { .type = BAR_RESERVED, },
+	.bar[BAR_3]		= { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_4]		= { .only_64bit = true, },
-	.bar[BAR_5]		= { .type = BAR_RESERVED, },
+	.bar[BAR_5]		= { .type = BAR_64BIT_UPPER, },
 	.align			= SZ_16K,
 };

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 18460f01b2c6..e55675b3840a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -850,9 +850,9 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
 	.msi_capable = true,
 	.align = SZ_4K,
 	.bar[BAR_0] = { .only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .only_64bit = true, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 };

 static const struct pci_epc_features *
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..31aa9a494dbc 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1993,7 +1993,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
 	.msi_capable = true,
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
 			.only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .type = BAR_RESERVED, },
 	.bar[BAR_3] = { .type = BAR_RESERVED, },
 	.bar[BAR_4] = { .type = BAR_RESERVED, },
diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
index d52753060970..f873a1659592 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
@@ -426,9 +426,9 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
 		.msix_capable = false,
 		.align = 1 &lt;&lt; 16,
 		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
+		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
+		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_4] = { .type = BAR_RESERVED, },
 		.bar[BAR_5] = { .type = BAR_RESERVED, },
 	},
@@ -445,11 +445,11 @@ static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
 		.msix_capable = false,
 		.align = 1 &lt;&lt; 12,
 		.bar[BAR_0] = { .only_64bit = true, },
-		.bar[BAR_1] = { .type = BAR_RESERVED, },
+		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_2] = { .only_64bit = true, },
-		.bar[BAR_3] = { .type = BAR_RESERVED, },
+		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 		.bar[BAR_4] = { .only_64bit = true, },
-		.bar[BAR_5] = { .type = BAR_RESERVED, },
+		.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
 	},
 };

diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
index 657875ef4657..9b3f5391fabe 100644
--- a/drivers/pci/controller/pcie-rcar-ep.c
+++ b/drivers/pci/controller/pcie-rcar-ep.c
@@ -440,13 +440,13 @@ static const struct pci_epc_features rcar_pcie_epc_features = {
 	/* use 64-bit BARs so mark BAR[1,3,5] as reserved */
 	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = 128,
 			.only_64bit = true, },
-	.bar[BAR_1] = { .type = BAR_RESERVED, },
+	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_2] = { .type = BAR_FIXED, .fixed_size = 256,
 			.only_64bit = true, },
-	.bar[BAR_3] = { .type = BAR_RESERVED, },
+	.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
 	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256,
 			.only_64bit = true, },
-	.bar[BAR_5] = { .type = BAR_RESERVED, },
+	.bar[BAR_5] = { .type = BAR_64BIT_UPPER, },
 };

 static const struct pci_epc_features*
diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
index 068155819c57..8de321e1c342 100644
--- a/drivers/pci/endpoint/pci-epc-core.c
+++ b/drivers/pci/endpoint/pci-epc-core.c
@@ -104,7 +104,8 @@ enum pci_barno pci_epc_get_next_free_bar(const struct pci_epc_features

 	for (i = bar; i &lt; PCI_STD_NUM_BARS; i++) {
 		/* If the BAR is not reserved, return it. */
-		if (epc_features-&gt;bar[i].type != BAR_RESERVED)
+		if (epc_features-&gt;bar[i].type != BAR_RESERVED &amp;&amp;
+		    epc_features-&gt;bar[i].type != BAR_64BIT_UPPER)
 			return i;
 	}

diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
index c021c7af175f..c22f8a6cf9a3 100644
--- a/include/linux/pci-epc.h
+++ b/include/linux/pci-epc.h
@@ -192,12 +192,15 @@ struct pci_epc {
  *		   NOTE: An EPC driver can currently only set a single supported
  *		   size.
  * @BAR_RESERVED: The BAR should not be touched by an EPF driver.
+ * @BAR_64BIT_UPPER: Should only be set on a BAR if the preceding BAR is marked
+ *		     as only_64bit.
  */</pre>
      </blockquote>
    </blockquote>
    <font face="monospace">I think another patch is required to handle
      the set_bar().<br>
      Set BARx+1 type as&nbsp;<span style="white-space: pre-wrap">BAR_64BIT_UPPER in set_bar() callback if</span><br>
      <span style="white-space: pre-wrap">the </span>epf_bar-&gt;flags
      has PCI_BASE_ADDRESS_MEM_TYPE_64.</font><br>
    <blockquote type="cite" cite="mid:aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
 enum pci_epc_bar_type {
 	BAR_PROGRAMMABLE = 0,
 	BAR_FIXED,
 	BAR_RESIZABLE,
 	BAR_RESERVED,
+	BAR_64BIT_UPPER,
 };

 /**
@@ -207,7 +210,7 @@ enum pci_epc_bar_type {
  * @only_64bit: if true, an EPF driver is not allowed to choose if this BAR
  *		should be configured as 32-bit or 64-bit, the EPF driver must
  *		configure this BAR as 64-bit. Additionally, the BAR succeeding
- *		this BAR must be set to type BAR_RESERVED.
+ *		this BAR must be set to type BAR_64BIT_UPPER.
  *
  *		only_64bit should not be set on a BAR of type BAR_RESERVED.
  *		(If BARx is a 64-bit BAR that an EPF driver is not allowed to
--
2.53.0
</pre>
      </blockquote>
    </blockquote>
    <p>I think below comment should be removed.</p>
    <p>&nbsp;*&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; only_64bit should not be set on a BAR of type
      BAR_RESERVED.<br>
      &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (If BARx is a 64-bit BAR that an EPF driver is not
      allowed to<br>
      &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; reprogram, then both BARx and BARx+1 must be set
      to type<br>
      &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; BAR_RESERVED.)</p>
    <blockquote type="cite" cite="mid:aZTkLiUaMTC7H1kB@lizhi-Precision-Tower-5810">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------psjo7bK24x07fEr6R9ucfnwC--

