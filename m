Return-Path: <linuxppc-dev+bounces-17931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICoEKkoWr2nJNQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:49:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596223ED43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:49:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV5fF6v6hz3c9r;
	Tue, 10 Mar 2026 05:49:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c10d::3" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773082181;
	cv=pass; b=WGyzVdaoSVY46sijTJZjBgeOzTguUnB2v4sXlAoHMZjdCkzT/KsXmEL41hGIlPiFYqHxAS6o9HaGmtYprH5C96K3ovIBEPW7Q4VAO0TQspyJ6pmnqL2/nXgDn8bvi0sXg3Y9G1yrhoBlG0G1rh4QLcTHFeJ7V44+ukTQPeA2OyUuznxHe+xZg2rpebLflITrqpBVT6rHZzawTbVqjTaK42Mk5RjB4dOmT4k94t4Pcx3mBEMQHMWaM5akA+ayTY6r8qnMqw09rmIK5SEssZWDkUus3EgsbYqpTbSh8SxZvYxxJ4lFWYyb/uTvQaX1aqB3v7uoFTdDXwu9k5teMjjrKA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773082181; c=relaxed/relaxed;
	bh=/C5HOj4s+f4jjC2DV4VfpU7e2N9FV8RIJSj9kyBzMOs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2qL1QP7drZwr+jYh2uKNP5tGzAZXQLpr+VY825CzFXYJ7XNhsJhTfbLNrZgl+XWQ73bwPg4T4urKVpouFklGeHuM5/ecbO1A3rZwXOqWKeSYgzYiEOdo3+pf/rrcFG3HTWuirjKVIoSkska98lnKl63XBsXf3kelBB7aZybDysmEQODINTLvgXLk6JHhv3se1Jt6BpC9a+AF5OpB5CL6xC8IdPCjbTHDv4UhvNW9e8iWSUsqYDmL0oMbmyZhUjJpo2Riu4TFEv08GkXY5Vt/DAn1To9NfVI8Rbzne9uU5KbmAu/YtbH3h80qo6AMLUKEdKjlBSA0RT+k1qjss3qNA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZsJ8aav8; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=nicolinc@nvidia.com; receiver=lists.ozlabs.org) smtp.mailfrom=nvidia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ZsJ8aav8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:c10d::3; helo=sn4pr0501cu005.outbound.protection.outlook.com; envelope-from=nicolinc@nvidia.com; receiver=lists.ozlabs.org)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c10d::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV5fD3FFvz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:49:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcdDikIVAyvkgxz13LIXq7Ofg6PiWP6niKfnI7AfLe/zqxUTE/So8QIz4pQzEoscL/gsVq+z0orS1wWQFt0HZlr29YjUffZy8GxBGwVOqmjkpbhcfQfiG5Uel2sy2rbOdGEZe0xgl9mWFclU8psSk+9XCrN1A9gb0AuizYkvjJ+NPeBg4ITlep3A23rboFam19LyleoLlWq/i7E8yJMes3sjYfiKIsoVjwpG0LBMH2P7yAUFZDq+vzdC0q5Rc2m4/rBBaelY/JzkUDJaiPQjG3tumigTj70wqgxc4TrOb77db4D8KIQEyEt69YRTcoz+eBK6nC43tyTBxENlsxmUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C5HOj4s+f4jjC2DV4VfpU7e2N9FV8RIJSj9kyBzMOs=;
 b=Lnuno2hFWznVSab0tKvXX8CLO7GL8gnCtOGRe47uObONszsXjTUAyWfFqd3iDkMjGN6UoaJXEWGkH8GOQsTHTqQKiEOi8puy0rKVf7z3eiFgpkMLFcnlt2L3r0GW89Dw24tGRzIK2AqVD2YbpkdEUVL5rZ/1MbWMj/gW9SZGQF8A0p2QMhSxZEg5ZkOvFtuyoag8BLNMDV59D6VVZXx4Taq0s+Xfhlt9muWT0QoVOY1wLnb0uY1X/2oGjMKLxdl1Kbs9oQ+3AudHc32rPeOtmMwRmyFCv24J3gUUxfNdSKPPuy+ZW74ccxMyZ2T4gCgJYD8abB0ymJMdvJruXmKvkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C5HOj4s+f4jjC2DV4VfpU7e2N9FV8RIJSj9kyBzMOs=;
 b=ZsJ8aav8oOhQHuOimZXV2EPxEUZGrSQ/XrE04TZDllw0nUdR13aKQv/BnUCcV77+iKk0Rm2O+2cOvpsSNJ9q9fDitx4Tp2+lWbEglTfrNy5rLXVrxSe01mrqMkYQ1jR83dZvs22s63cyAZ6Yeu28DIU1nlJKuD6XPO78Vfp8Ox+n5xPWzZ2AdB8B9cOvWNLuP1keo0yn7sfxvQvtKuEiSkpOKtGI2rFhyEmXVqOpRDSQIMkjsJcbHIavIh5m0VPB6UMMW2bIQpUxZuqgoSajTVOV5VWzpFDPc1BT4XOMsE0skYO7KNXFsC6kdNrgP8wgeYhqYtzNAWhHY0WpNXNOfA==
Received: from BN1PR14CA0022.namprd14.prod.outlook.com (2603:10b6:408:e3::27)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 18:49:11 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com (2603:10b6:408:e3::4)
 by BN1PR14CA0022.outlook.office365.com (2603:10b6:408:e3::27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25
 via Frontend Transport; Mon, 9 Mar 2026 18:48:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Mon, 9 Mar 2026 18:49:11 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 11:48:46 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 11:48:46 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 11:48:45 -0700
Date: Mon, 9 Mar 2026 11:48:44 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Nilay Shroff <nilay@linux.ibm.com>
CC: <iommu@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<joerg.roedel@amd.com>, <jgg@nvidia.com>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	<sbhat@linux.ibm.com>
Subject: Re: [bug report]: iommu WARNING is observed on powerpc system during
 pci enumeration at boot up
Message-ID: <aa8WDIhPyPU45VKB@Asurada-Nvidia>
References: <d5c834ff-4c95-44dd-8bef-57242d63aeee@linux.ibm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d5c834ff-4c95-44dd-8bef-57242d63aeee@linux.ibm.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|DS0PR12MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9a4d43-8144-46e9-c220-08de7e0c8d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	5KwmfQ+0N/wztVMQzA6ShIjEDD8yvtm5gMZq+iX2pjAa6kVcBlM9QSuVNLXjUJNVTrKZ/1k4yPVBgl/VK8HFXwsglwOJgfZVhcywC8cokiXG6l/MtXeWoZH6scVqMvNPVErABU+I5zJPFFh9eTQ+6IR0QysB/cXjXMUKUA7FzcqeHOWoVNh171E/EQCpLbDdb6v7ByGDsnQTc+2LWi2DF5EvHJ4BaZQzeDButVXGXOVtK+k//z3dhXJykVH12rXcQ9EBgPviiQm1tzaIHf4eQ7vOZRD4l9MUN0w4DyLqeH9T7+BSJz80uOHokmQhqkXDzAWUzDciwFgSMoSn56sCkiixOtmKSe5O72NmcpiaC8RwPLjW4US+ZcnpxiVTsdsSQqiM5kFJvIv6l2wD2UB1THfqQJPiNPZD5f/ws1FCsFInjgYNkCcUYVwy14vn9dqjdk0TsgFKiUUsATEuCzrKXck0S0uHPtU7PjP57lbsbl1VkrSAC0X1o77HU+goJbEwyp7XxrredNxgHk5JUPQqEKUBAqZtKc2VLj0Q9HPtGqHznR4JuLUj0D+oip6eotSXOWr7NCCDgxqy9o7tpSdfsfJ/Al1cDHNSrw3/0p7A5IPjWMfXIn0RwdlDkWD57MSTZKwx/gnuuAoGDIMfQNUDkOD6KGumlGqapS3ySJXTrqAAf4BgTxsv4lQfDg2kfYNGbHBjklDwlJt6ugRNFBlcXDXQKduJUxkxVuuCslC9FylHBPQJsMF3kMR/Fu17QpYXDjc3aVwjh2B7UyEAE8Xv+w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ej0mGbkk5nMX7LTaRHprkqtjHnwT45j8n4GLv1V4PzfLFGN4qfIh1mYqfeKifesyvJ2gJYLUwIqXKspW71HGFxVyIluWGFkLmXMxtTBTgobbo5a3mCgvbIuMPPWy59O02/4WPbpyrvST73F5ZzICVg15H9pit8bOfUJYJ+mRlNYjbNHCbTNNIvBJuzkClZGq+k6AYcuXHZUfFxw4+VOMQf+xEH+9Q3HueoS7JpBW7moTdCMB28Dj5ZkeDLlFcP1soMMQ1CxqC9DCR1jS6BI9jqoY2iUykdixbmnyhpFrKAYAxbh6l9XIB0Dat3mksHM5Kln74GOQni5IFZ1yC/LxqQ2Nf7VtUu7fUbHWT9OdEt1gqXBEBRFow9gpWdqy4Fs2ev9KihAOvtRIWup2r169RFBS9G1T25gwvvy9QLdQUvqjvUDXvQg0HVnwuPIaoB41
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:49:11.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9a4d43-8144-46e9-c220-08de7e0c8d81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 4596223ED43
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17931-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FORGED_RECIPIENTS(0.00)[m:nilay@linux.ibm.com,m:iommu@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:joerg.roedel@amd.com,m:jgg@nvidia.com,m:baolu.lu@linux.intel.com,m:kevin.tian@intel.com,m:maddy@linux.ibm.com,m:sbhat@linux.ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nicolinc@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[nicolinc@nvidia.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 11:27:42PM +0530, Nilay Shroff wrote:
> Looking at the warning it seems that this is a regression caused due to
> commit a75b2be249d6 ("iommu: Add iommu_driver_get_domain_for_dev() helper").
> 
> Any help from the iommu expert would be appreciated. Though I am not expert,
> it seems the following patch help fix this warning (I encourage the iommu
> developers to confirm and/or take this forward) :
> 
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 0ce71310b7d9..d122e8447831 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -1159,7 +1159,7 @@ spapr_tce_platform_iommu_attach_dev(struct iommu_domain *platform_domain,
>                                     struct device *dev,
>                                     struct iommu_domain *old)
>  {
> -       struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> +       struct iommu_domain *domain = iommu_driver_get_domain_for_dev(dev);
>         struct iommu_table_group *table_group;
>         struct iommu_group *grp;
> 
> 
> Please let me know if any further information is needed.

Yea, that should be the fix.

Please submit a "PATCH rc" with:

Fixes: a75b2be249d6 ("iommu: Add iommu_driver_get_domain_for_dev() helper")
Cc: stable@vger.kernel.org

Thanks!
Nicolin

