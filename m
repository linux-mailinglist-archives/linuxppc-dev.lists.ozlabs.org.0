Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29B6E22C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 13:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyZk83mbhz3bfk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 21:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M7nJTo0d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e83::626; helo=nam02-dm3-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=M7nJTo0d;
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e83::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyZjH4T5Mz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 21:58:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QSRN+RPi2znqQHIfynyAILta6PPY+zSa0I1vfxdCGs7UF5LP7uneRgCpp5222y/RdgzNBqTePCPYyn+E0Z5rr1uOHPjnyPoGlD/oCZsOjt/hIZjC0wAwRbJYvYopFM0asZOnoUiCkG2vdGU8OEPc2lJ2quwT+t2sKKLmMYtefnadZUgsGP2gcJoGtMFjM0BJJVPg7L5bFgElSiAv04eyzOqrLni3sp7PWuXPtvFbf0NEgsLXF5VBEPWb5tvqQa0zH5k5kbhs7spdXCtTQjgPqcuXAr2xzb6sMP2c7WZ6W5gRk+qc6rn/3kDADATp/g2WbFCtwBgPzF2lAzhPi2Vb9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYRVmjAAJuBQN7dKooCHbeMiZLODR0jSNHdMW0CizSs=;
 b=Ga10cAOSDRiutC5kBN9yYiAYx7d42Z+XLzewJHb2uH6qCvcjygghMvy0D2wqX7RApLoJNwiR1oCZt+IhosBRkdzquYJNIA2oNpCeKzr8ula+b13w3z9AvatPDY4VrjZOMgtLHBVhBWksap4neEe6cMrbO6X8IVzK1+8miD3n8xE7K98q7/yjXbvWFIpLRgoiURFIlp3PVRCEm3GWyiEotRVcsPDiVCBQQFbygH3afVTYn9j3D0koeSnnmESV3Iuchktuh/Mkjj0h3DdlP0vFkaw3FMIpJ4ONaE6IKYx2bPhBGXv8B2W0bE8WaqYTosZULpv1f4ayqs238sJ/IiWGIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=huawei.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYRVmjAAJuBQN7dKooCHbeMiZLODR0jSNHdMW0CizSs=;
 b=M7nJTo0dOtApsWmJM4/8ya11zfi9uf4KdPPJOreSW/umXFFqHGtDkKJPnmEKtOP4DklEs6pW7DugJ9jNCTPq7lxTgQg30umNS3/w1YZLMga5/QtVftMaDCXaJgzCPG8oZtU0rJWd/+5yNg28BFX8vACBsy1EUKMAdcUq7M5Fk8c=
Received: from DS7PR03CA0175.namprd03.prod.outlook.com (2603:10b6:5:3b2::30)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 11:58:32 +0000
Received: from DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::16) by DS7PR03CA0175.outlook.office365.com
 (2603:10b6:5:3b2::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 11:58:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT108.mail.protection.outlook.com (10.13.172.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.33 via Frontend Transport; Fri, 14 Apr 2023 11:58:09 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 06:58:06 -0500
Date: Fri, 14 Apr 2023 13:58:03 +0200
From: Robert Richter <rrichter@amd.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <ZDk/y/w5IjuRkPyu@rric.localdomain>
References: <20230411180302.2678736-7-terry.bowman@amd.com>
 <20230412212901.GA81099@bhelgaas>
 <ZDgFv6AtCXkVl8IQ@rric.localdomain>
 <20230413180508.00003f13@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230413180508.00003f13@Huawei.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT108:EE_|BN9PR12MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: 96925c5b-7eb7-45ba-4ff1-08db3cdf91ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rEMqKwC5TdmgwdiT1saD6cFvVQCP2NTulKQBMDdD3mYmDHFLI5iIu7Qcp7TYXI18bTE3JxRAmESF7K2iGC5gFOdfjaWkW9Kygz/0XJVZvbSX0BJWeUG8viCqwGrVu6SIqBukTzJLFLJHcdevunf3rspjt85VoDuBbSegakrSiv4JfZUTwyky7tqc7WhBdRjmPifryIC59u1Mb9Jra+gj8JH8YziPPMaArYBD7rSIQ2pIu2kq7XE+4YV4vZnXkytTMdjqmMAl2ZlCuk7N/+ZXOmCH7kKoGu8upECo9zgx5B0FJ1Yha06b5qcvVPhLI4WnMUUud4hrLfqGBfuQdaesCDxyauns/pO9+Ec4Ttli5KcCXIC8EWkWRRj9+h0oVMZ0nU2728N9+hMULCksjagzzdZf3f2uAKewIlG/O/XbJ9ER9amCGs6Tf69RfL/eaeUiMSGdnyRFfR8sFWS2t/vjtWi9xUw0ksQRXBLVpAcxsEunIR6IeugT+uXk9Swkxo5E0bcW9TnyY0YwODiDhC9K7Msb1euOilGKZwkNVsIgTQBKp3lBTRUngERbCUrmpJ04TP7A6ym+AOB6Cnd9fRgTxbJPoy79a8ZnKNaf1nAECFupTEapDxLq7xl8y3gA/R4v4xNkUWG0tooG307dyf27FdDA1jxiJByHhikMBo4cpMAbyLVkJtpzU3VPSOV7X0R/uy37gYJGUcprW0F9R98RwX2fxRtwyOod2isbki0ZqrE=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(336012)(426003)(47076005)(70206006)(83380400001)(70586007)(54906003)(186003)(16526019)(6666004)(478600001)(26005)(7696005)(53546011)(9686003)(2906002)(7416002)(5660300002)(356005)(81166007)(6916009)(4326008)(82740400003)(82310400005)(316002)(41300700001)(8936002)(55016003)(8676002)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 11:58:09.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96925c5b-7eb7-45ba-4ff1-08db3cdf91ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.04.23 18:05:08, Jonathan Cameron wrote:
> On Thu, 13 Apr 2023 15:38:07 +0200
> Robert Richter <rrichter@amd.com> wrote:
> 
> > On 12.04.23 16:29:01, Bjorn Helgaas wrote:
> > > On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:  

> > > With the exception of this function, this patch looks like all CXL
> > > code that maybe could be with other CXL code.  Would require making
> > > pcie_walk_rcec() available outside drivers/pci, I guess.  
> > 
> > Even this is CXL code, it implements AER support and fits better here
> > around AER code. Export of pcie_walk_rcec() (and others?) is not the
> > main issue here. CXL drivers can come as modules and would need to
> > register a hook at the aer handler.  This would add even more
> > complexity here. In contrast, current solution just adds two functions
> > for enablement and handling which are empty stubs if code is disabled.
> > 
> > I could move that code to aer_cxl.c similar to aer_inject.c. Since the
> > CXL part is small compared to the remaining aer code I left it in
> > aer.c. Also, it is guarded by #ifdef which additionally encapsulates
> > it.
> > 
> 
> To throw another option in there (what Bjorn suggested IIRC for the more
> general case..) 
> 
> Just enable internal errors always.  No need to know if they are CXL
> or something else.
> 
> There will/might be fallout and it will be fun.

I left the fun part to others. :-)

If some PCI root port goes crazy it tears down the whole system, would
avoid that.

Since internal error are implementation specific, I would only enable
them once a handler exists. What's why enablement is limited to CXL
RCECs only.

-Robert
