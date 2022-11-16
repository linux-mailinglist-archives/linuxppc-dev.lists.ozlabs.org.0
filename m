Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3262C6F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC9jF0C0hz3fLk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=luPwo0o/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::630; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=luPwo0o/;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20630.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::630])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC9fJ6NKnz3fH2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:54:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fY/+yhsrrrNZxPy82hk7kjYMdNDllwEI8oPxJBvAXgp9sx2FdpsP6UmfNsIpJ/fYGC0x4o0NldENVnKOn4yexJYhuSx5eaVPkerTziapbUH63O3B5b2KM8thbmtbTpx+nrVCnTYnD9B1TKPZKTtrjXPFXsv3Oq+ZG5hYgqfuy020kG4/LSuGh/jsPmpG2A4lL+Rnvq3b+c/DQt+zauMfXDHsWp/9AMql8d9jnCqelfv8DnxJQhW0SdyNnp1LLDcLXlRtCz6UnzcPn+uQEExfGAubHMRm2LBlCf8D9/EJzIlCfyG6ESFU/7KgED269kgjDb2ykdupTmU4Z9Mj3tgp8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38aFJvn5GJRdI2FOXiSTOGnp1q7mu4qNhWBisf7idfI=;
 b=nsTPw3nQTJFhHN5pnzIdawrj3/Q/D2t6+yogG7d3ACFRLFPVRI6hkghgVXa3QWh52svb3ZfZK6OmYsdRxbhiyobU3U5bB0T2PrK8Qh/uRBqStScY6tPKp5WzhwSOk6YQBpwZLFYhs3WRl3UBanXkJouUdHgpePzDvWjanGkdiLWVM/pgLMiklen/GzO1Q3+/iJnGTVnpsQk9oMyfMK8AUK8/WlGUfCpjR9w4bkrd8zJyEBqre2cQOh74sPHrypYwhTB9/jEZD3oe1PoJ/spXJy2FNT3jjRAoD+M+Shq6heRH2+h6VZ/5o6vGINcbXQQFP6At7ZzAkni8+kjzaSHVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38aFJvn5GJRdI2FOXiSTOGnp1q7mu4qNhWBisf7idfI=;
 b=luPwo0o/4G9/cztaZv1awwGMV9cGUEVBxLjT/v/38NNbx607YufY6oeVnMpQUK2pQsOUInPk39lzPhrNzz3zeMSA8qReXEUCQcFyduIPPYc0t6fctYoz+NJXP1dbcSxcsV/j2Xgao6P3CHOWE1mhm/f5WUevQ3AkU7Fabxde2QdCltp0HrF6NbfLzDWrGAnx5pQKN1IpebtXNO2Ixcxfl4tWAe6PlicP8CbmzSt3u6GduA9dH6ZvVY/I7bD6NsDxsHmE18e8HbiGTqyngLh6K31+O7HzgHeD9GLl5qJK51FGrzDFjbfLaU9j+7mJFGtlq1R+RKsFdyJ1IWOikeJTXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CO6PR12MB5395.namprd12.prod.outlook.com (2603:10b6:303:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 17:53:57 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f8b0:df13:5f8d:12a%7]) with mapi id 15.20.5813.017; Wed, 16 Nov 2022
 17:53:56 +0000
Date: Wed, 16 Nov 2022 13:53:54 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 15/39] PCI/MSI: Get rid of PCI_MSI_IRQ_DOMAIN
Message-ID: <Y3UjsjX0T6+03RzL@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.467556921@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.467556921@linutronix.de>
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CO6PR12MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: c5196369-b94f-4963-f1fd-08dac7fb8805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	i2A11gWFgEt25RQhX3+rek5hxzTBnPwcEKXBiSHlsAkzyA4lE7wbpzmY/+DQdBaON5boAOeWuFaUaFjnSofw25N0Hx2pjKawnXMFt8WVr/omnc1SFnZ7lgw0vLaBwLwLUseBUQt2WRMfZUFdXIZkKutSV9ueMVV/ec329PaOjAmLL7i+oCvr9XjDV+tLhAxhmlmC68moTynGqAo56xRrG8yXL3aWamz8Kt4oHYeGWif1Yg2LNaBVHdTB4eb2nov5W9W8GviJq9bwVztmnrxL3ZYen/2Eg0S7jt3Z4Ac3B5kw2Tvc1X6sXPHodNYOvpjnRB1kmUk/h0foF4HaFS/fprsAdJYM0r6eQk6S3CrdfWWBAVvKtBf+ZLVHEArcpq0sHYprADhrtGBolSDuSTJcdtLxVXdQuwy462JtGZs35z0GtQzB0GnEY69CQV7xm8XynuMWUdstBLGfU3CxB87FjufJbPJrKDz7PYctiv6IHSnV7u4/QScgEsUVrYrkgCiDXmI6k2Eg8dSt61cX8c9voaQqTVU0pYGMBknBp6mlqGNIBSUBjdLOF+wzIO3OFt5NN3JmmdIeMmY4pJxBr0bdzUuzSc0rb71H142XzpYwBwXySKuAQBGDeQA7VbJP7QD6qMMshpV4zaZ9Nt9pOZAn1DvCShI5x6T88Qsk1LDdmtBfLWucF/53kGV0UQKSMMvEx48ycfyHyq3hxUl7HXwZqbI6DO0VjMswZ19rjI2GDBJRbrE5ACT5Vp6rlROgcF3FVl1UyTfv53+SD49ZQoo7rQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(38100700002)(86362001)(6486002)(478600001)(5660300002)(7416002)(8936002)(6506007)(316002)(8676002)(66476007)(66946007)(6916009)(4326008)(66556008)(41300700001)(54906003)(186003)(83380400001)(2616005)(2906002)(6512007)(26005)(36756003)(26583001)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?tNwFY6BYuLhArcCcpmOSe51jpoRfyXRZjUlcD6X5LfZREH/di95ydUJMsEyy?=
 =?us-ascii?Q?kKGtbnc1uGgxutuTOfxTc8t5NjIROCGmsN7nA30PW4B+tIrSOkYmLE1prtCS?=
 =?us-ascii?Q?SFyH11RM1H8DpjEvwL8GX6KdHpJfhREjdbDYhdgxsmeb9UlSUlOvw5ZKZ9dN?=
 =?us-ascii?Q?cmxgo1tN4Dt74p8+jZRlNCPbtVriFG0OWXLMAijryFsQg/FyhgDP9VP3BEud?=
 =?us-ascii?Q?D6+i9Ty8vzB6K2Ke3c7jGkbx4LUGktuWTQz2JUMaKUXVCeksGQp0jTAx20Oa?=
 =?us-ascii?Q?vA8u3h/c+gppGjVirbM6jk0uWUi5GL3t1zBHNTRc1nCrHg6O0Oi1pzcD/O1Q?=
 =?us-ascii?Q?0V78c+w6xC0iTe1CzfqhjG+hM7bhU4AHrw3sv6XPMO2YLkBdb2AVtKmiXUKa?=
 =?us-ascii?Q?0ChA6BaRCzXQyWHDbjKpTauNi/Miu21mPTQWNu51NFgZ4wiLsADhw5lsge20?=
 =?us-ascii?Q?yi+sS5Yyj6cUiLIhiCCcr0KRbB7xBCzNWP/z3jgt81EaQA4gC/uVoEmPP+Vf?=
 =?us-ascii?Q?bsvLZOiRJ5eY9dnFqby0dnZaiKtSb9936snRn3Q5JhwiQo3BlweIQ35pHY0i?=
 =?us-ascii?Q?yJQvsN5I/nKXJajKRCuuo50/VZCsxlt0IYtJew/hRuYXEFMlmHz3UmQKPHwA?=
 =?us-ascii?Q?R5ov2JArsv3bSK0DShMr64DNJyoi0xHkQ1zOPLJ1asGi+sUBA7iLLcGszRHT?=
 =?us-ascii?Q?2s8XbgrEXEMnKyG2UVQXdCdW1aacoPZMJCLRK8lc+DHCpq8M811kYDTJQwP7?=
 =?us-ascii?Q?4z4UoNmgQWgn/DC5SrJnQKnXF5LKmAB5tmvc5HuCul+/y2SiPmH/zdGaQ0CU?=
 =?us-ascii?Q?0DskMeBNHgCLJnBCDt8w6e3uGdP0K5ez/5mMx3VOa8Pn2z9Gx2n67Pz5Ii/n?=
 =?us-ascii?Q?NfA5BPW5kcpcunKn49sfV/xPiWv1H/VYya1NHFT35TiZP6E3smEUqpsz6mSk?=
 =?us-ascii?Q?TBCk3hfwM8srYD6DYGoT2KbcqB8t6V2vPCkSH5Waw7FlL8yQGKKWqv5qqow3?=
 =?us-ascii?Q?JVu1hmd3oKcDCMx8u7L/e+WbivrfEYfgmQeI6HjN3bB2eLMJ1EyMLmc5Nda/?=
 =?us-ascii?Q?6+EAMlNZSxJtEtGFL1u/91VAQbyD7FvgU9utHsJDGbdn7ecePI7ruo09wqF1?=
 =?us-ascii?Q?A9mDK8LpXv5qcX8f3McLeY/V0sQgyhPnUoyYgs04ch1jgTvJBVKEI+qfzoA8?=
 =?us-ascii?Q?98vO1PphF/RDoqPkMpBkH8XWwRbR0MXfg7JKBN9amrvGzkUydropDOpvn7Wl?=
 =?us-ascii?Q?ampE6Vx8VqmNZhalCBLB2JaU0+S5aIJZq7mwB8bX5SSyZ+ElCh7Bh2qu4+45?=
 =?us-ascii?Q?Lp3OHZB756o247nbM000I8UXDkVEN05r8BJdSLcMThFV1BH1edDbPFdAKw6P?=
 =?us-ascii?Q?PXBI97zEmgrMZl5V7Um/4mvJse2cPzd57bErZ8EMikIpHvqRozdy2q6iXKvk?=
 =?us-ascii?Q?uTgIqDePYerWaZRG3fj9YYrg4Me5Js5r0WEQDewpEECeGjlw2L0GoebQk4fn?=
 =?us-ascii?Q?jWGzC18P5sjQ50iV/txfI2GcEjRxJDGah7P+imWpEmQ6F0tPq4VL7MCpfslO?=
 =?us-ascii?Q?NPaivbmtCAQY91K3oSn/XP9JqFQGksPiid43BsqM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5196369-b94f-4963-f1fd-08dac7fb8805
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:53:56.1432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bD8qOJ55SNPLDsCaQABFJqzlCovuYGKSUnA8iXvq4ENjhe59QHyS0V8zFPUyxhhi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5395
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:54:38PM +0100, Thomas Gleixner wrote:
> What a zoo:
> 
>      PCI_MSI
> 	select GENERIC_MSI_IRQ
> 
>      PCI_MSI_IRQ_DOMAIN
>      	def_bool y
> 	depends on PCI_MSI
> 	select GENERIC_MSI_IRQ_DOMAIN
> 
> Ergo PCI_MSI enables PCI_MSI_IRQ_DOMAIN which in turn selects
> GENERIC_MSI_IRQ_DOMAIN. So all the dependencies on PCI_MSI_IRQ_DOMAIN are
> just an indirection to PCI_MSI.
> 
> Match the reality and just admit that PCI_MSI requires
> GENERIC_MSI_IRQ_DOMAIN.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  arch/um/drivers/Kconfig                 |    1 
>  arch/um/include/asm/pci.h               |    2 -
>  arch/x86/Kconfig                        |    1 
>  arch/x86/include/asm/pci.h              |    4 +-
>  drivers/pci/Kconfig                     |    8 +----
>  drivers/pci/controller/Kconfig          |   30 +++++++++-----------
>  drivers/pci/controller/dwc/Kconfig      |   48 ++++++++++++++++----------------
>  drivers/pci/controller/mobiveil/Kconfig |    6 ++--
>  drivers/pci/msi/Makefile                |    2 -
>  drivers/pci/probe.c                     |    2 -
>  include/linux/msi.h                     |   32 ++++++---------------
>  11 files changed, 56 insertions(+), 80 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
