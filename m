Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF56E5489
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 00:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0gzs3CxQz3fWv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 08:03:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c89LFxZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::607; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=c89LFxZZ;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0gxH2JRfz3fBk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 08:01:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mz6Muy6/icCmKk62aGbXSiQ/3Csg5Lc194yTH9HN0/Tmro0xChP16LuAulZC1HUNARczakHMtoaChRpmgyBL0g9AzlUnxspZz2Jw5nG8b6MdD5QuJN/sdQO/b4RpnCPgHQ3sp0RmEk8w/7xQfNFiKQHg1kX4Iw7MFZF8bwlEVb+/f5Ayv6JdyYUaGJ0LjIJgd69LjPA4m8F1kmTcodMAZckur3kWaI6rdpco059gjg163V2UDc3xa4AC0ucYXB8wxRz+QBCXxsNC84jXCvcG2h8BPxZlYqI1qaO8y1Qp7zQ17jXdSbifSGX8TrXaz3CE1hCl+48//+tr0gLA/HzDTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+VXDqx85CWhE058p0FVK2atK2FQX10YkS7ew166++s=;
 b=V/8GaaoH2d+JYqKms3qCjrVgRJzT3SG/dg6Qd5if3HKzqxh+oEp5J8PMHP+biETTguApJb7MQVm1QFcNN0N8OdQCyhH7QpgQjzcCylVDiJzJFLaT6FaYTNjhjzpqH3iGCJFaEEn8cMYAUidv27UO7V2qVLmRm3Uq78qzzOnsGFtBBIr2wIEwRNiXggqIzDZqqQGQGylA27GQ3z8tfqOJc7X+eBqMH/gJy+H8VwB0D6EycGwhVxuo+xpjhZIIxxtRGT2mZIJ/5jPfZgwOvnCVg5hrKuZy0WC7GWqMlb9eLDCNk3xxkoyUfafXPV1dMutrcweNtrcySpw/Kw3kz0rrXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+VXDqx85CWhE058p0FVK2atK2FQX10YkS7ew166++s=;
 b=c89LFxZZQFwPBKirbErOCCvw/9aOLkzHNy9A3/qjwae80bnO+7wP9kYApu5193KMSaPuZeLslfYMmtmsTLiLaHltmsy98z6i4YCEPRA1TyQQf1+EfeP0m+cGdN3c1q/+V3WLC7f9/HYe/2FMlfyQa29670h3cIpKQMGDQZ/NcL0=
Received: from DM6PR03CA0050.namprd03.prod.outlook.com (2603:10b6:5:100::27)
 by PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 22:00:59 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::ca) by DM6PR03CA0050.outlook.office365.com
 (2603:10b6:5:100::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 22:00:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 22:00:58 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 17:00:55 -0500
Date: Tue, 18 Apr 2023 00:00:52 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZD3BlNYeiXQR2h6+@rric.localdomain>
References: <ZDfbLF1ZYc3uIC19@rric.localdomain>
 <20230414213254.GA219190@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230414213254.GA219190@bhelgaas>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|PH8PR12MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 29cdd5eb-70ed-4357-7b83-08db3f8f3a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Z5tyjY27oGYY/OZfOpjsxb+0tF+x9fpr4J02HP6X3KrYJ/NSa8yLuKg+7oIo13EOoPx8thvSW4a0DmJRT2QUwgOovvW05D734jJu1UjmDoL1Wp+zvRLwuTMX3IaRMm0S0Dz++iomTe/uNfGMpEqUdOVfOZ457q+P4HzYb9dFiCiF7z740K8vi/PgPjjM5FHfQCnnywdF7kCHyBx61vwXl6UYC9qvvYmhgp/liYCiLloQ4umqoc4n0teF40CABSJu20SWfwSMkBGS9T64a6QX0rDEa9fMymetJbc5+tFh1WusQ3+MCVYCm07Ik6GGMOguXs9XtetOtxCyPw4q3uq3ZCPs9Wl4gbzUeCrR8AFpclt7B+D1STpHCdptJzBY+BBcdN7FXnapCJslNNvZUgO+HNgQpKSiZdC9YYr6ucQZeVgUBW1lUBjNt6QxFZr6p9AuebgiEJo79o0ITl8HRmJZrStRsp+i0tAGRucL753xMfTqT7crY8g1xCFfXqEc/IlhoM518kJjm6tRXiaK+eJDsmi+8pg4U8bLQwBHEV+HPQS+iBYG7xub1zHh3VyvE5cikzlEF8tCwvmZGicMX+7wZNA1NnUWKnrBMlLP45alauzU216GEe9tSSGiOz5x6tWEQW1FPMG+t6I8mWnRL2izqs/OvF2gaVQT5zurC1NLO0Pa5R7nGCXh1t2UfAcsboqbBNT50zoQ2Vc8eefCQex8lZZdy77JVm4xrBgKEI1uLuM=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(46966006)(40470700004)(36840700001)(16526019)(36860700001)(40460700003)(336012)(426003)(47076005)(54906003)(70586007)(186003)(70206006)(83380400001)(6666004)(478600001)(26005)(9686003)(7696005)(53546011)(7416002)(81166007)(316002)(356005)(5660300002)(2906002)(6916009)(82310400005)(8676002)(82740400003)(4326008)(41300700001)(40480700001)(55016003)(8936002)(66899021)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 22:00:58.8324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29cdd5eb-70ed-4357-7b83-08db3f8f3a01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7326
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, ira.weiny@intel.com, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, vishal.l.verma@intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.04.23 16:32:54, Bjorn Helgaas wrote:
> On Thu, Apr 13, 2023 at 01:40:52PM +0200, Robert Richter wrote:
> > On 12.04.23 17:02:33, Bjorn Helgaas wrote:
> > > On Tue, Apr 11, 2023 at 01:03:01PM -0500, Terry Bowman wrote:
> > > > From: Robert Richter <rrichter@amd.com>
> 
> > ...
> > Let's assume just a simple CXL RCH topology:
> > 
> > PCI hierarchy:
> > 
> >               -----------------
> >               | ACPI0016      |--------------       Host bridge (CXL host)
> >               | - CEDT        |             |
> >    -----------|   - RCRB base |             |
> >    |          -----------------             :
> >    |               |
> >    |               |
> >    |          -------------------     ---------
> >    |          | RCiEP           |.....| RCEC  |     Endpoint (CXL dev)
> >    |  --------| - BDF           |     | - BDF |
> >    |  |       | - PCIe AER      |     ---------
> >    |  |       | - CXL dvsec     |
> >    |  |       |   (v2: reg loc) |
> >    |  |       |   - Comp regs   |
> >    |  |       |     - CXL RAS   |
> >    |  |       -------------------
> >    :  :
> >       
> > CXL hierarchy:
> > 
> >    :                                        :
> >    :          ------------------            |
> >    |          | CXL root port  |<------------
> >    |          |                |        
> >    |--------->| - dport RCRB   |<------------
> >    |          |   - PCIe AER   |            |
> >    |          |   - Comp regs  |            |
> >    |          |     - CXL RAS  |            |
> >    |          ------------------            |
> >    |  :                                     |
> >    |  |       ------------------            |
> >    |  ------->| CXL endpoint   |-------------
> >    |          | (v1: RCRB)     |
> >    ---------->| - uport RCRB   |
> >               |   - Comp regs  |
> >               |     - CXL RAS  |
> >               ------------------
> > 
> > Dport detected errors are reported using PCIe AER and CXL RAS caps in
> > the dports RCRB.
> > 
> > Uport detected errors are reported using RCiEP's PCIe AER cap and
> > either the uport's RCRB RAS cap or the RAS cap of the comp regs
> > located using CXL DVSEC register locator.
> > 
> > In all cases the RCEC is used with either the RCEC (dport errors) or
> > the RCiEP (uport errors) error source id (BDF: bus, dev, func).
> 
> I'm mostly interested in the PCI entities involved because that's all
> aer.c can deal with.  For the above, I think the PCI core only knows
> about these:
> 
>   00:00.0 RCEC  with AER, RCEC EA includes 00:01.0
>   00:01.0 RCiEP with AER
> 
> aer_irq() would handle AER interrupts from 00:00.0.
> cxl_handle_error() would be called for 00:00.0 and would call
> handle_error_source() for everything below it (only 00:01.0 here).
> 
> > > The current code uses pcie_walk_rcec() in this path, which basically
> > > searches below a Root Port or RCEC for devices that have an AER error
> > > status bit set, add them to the e_info[] list, and call
> > > handle_error_source() for each one:
> > 
> > For reference, this series adds support to handle RCH downstream
> > port-detected errors as described in CXL 3.0, 12.2.1.1.
> > 
> > This flow looks correct to me, see comments inline.
> 
> We seem to be on the same page here, so I'll trim it out.
> 
> > ...
> > > So we insert cxl_handle_error() in handle_error_source(), where it
> > > gets called for the RCEC, and then it uses pcie_walk_rcec() again to
> > > forcibly call handle_error_source() for *every* device "below" the
> > > RCEC (even though they don't have AER error status bits set).
> > 
> > The CXL device contains the links to the dport's caps. Also, there can
> > be multiple RCs with CXL devs connected to it. So we must search for
> > all CXL devices now, determine the corresponding dport and inspect
> > both, PCIe AER and CXL RAS caps.
> > 
> > > Then handle_error_source() ultimately calls the CXL driver err_handler
> > > entry points (.cor_error_detected(), .error_detected(), etc), which
> > > can look at the CXL-specific error status in the CXL RAS or RCRB or
> > > whatever.
> > 
> > The AER driver (portdrv) does not have the knowledge of CXL internals.
> > Thus the approach is to pass dport errors to the cxl_mem driver to
> > handle it there in addition to cxl mem dev errors.
> > 
> > > So this basically looks like a workaround for the fact that the AER
> > > code only calls handle_error_source() when it finds AER error status,
> > > and CXL doesn't *set* that AER error status.  There's not that much
> > > code here, but it seems like a quite a bit of complexity in an area
> > > that is already pretty complicated.
> 
> My main point here (correct me if I got this wrong) is that:
> 
>   - A RCEC generates an AER interrupt
> 
>   - find_source_device() searches all devices below the RCEC and
>     builds a list everything for which to call handle_error_source()

find_source_device() does not walk the RCEC if the error source is the
RCEC itself (note that find_device_iter() is called for the root/rcec
device first and exits early then).

> 
>   - cxl_handle_error() *again* looks at all devices below the same
>     RCEC and calls handle_error_source() for each one
> 
> So the main difference here is that the existing flow only calls
> handle_error_source() when it finds an error logged in an AER status
> register, while the new CXL flow calls handle_error_source() for
> *every* device below the RCEC.

That is limited as much as possible:

 * The RCEC walk to handle CXL dport errors is done only in case of
   internal errors, for an RCEC only (not a port) (check in
   cxl_handle_error()).

 * Internal errors are only enabled for RCECs connected to CXL devices
   (handles_cxl_errors()).

 * The handler is only called if it is a CXL memory device (class code
   set and zero devfn) (check in cxl_handle_error_iter()).

An optimization I see here is to convert some runtime checks to cached
values determined during device enumeration (CXL device list, RCEC is
associated with CXL devices). Some sort of RCEC-to-CXL-dev
association, similar to rcec->rcec_ea.

> 
> I think it's OK to do that, but the almost recursive structure and the
> unusual reference counting make the overall AER flow much harder to
> understand.
> 
> What if we changed is_error_source() to add every CXL.mem device it
> finds to the e_info[] list, which I think could nicely encapsulate the
> idea that "CXL devices have error state we don't know how to interpret
> here"?  Would the existing loop in aer_process_err_devices() then do
> what you need?

I did not want to mix this with devices determined by the Error Source
Identification Register. CXL device may not be the error source of an
error which may cause some unwanted side-effects. We must also touch
AER_MAX_MULTI_ERR_DEVICES then and how the dev list is implemented as
the max number of devices is unclear.

> 
> > > Here's another idea: the ACPI GHES code (ghes_handle_aer()) basically
> > > receives a packet of error status from firmware and queues it for
> > > recovery via pcie_do_recovery().  What if you had a CXL module that
> > > knew how to look for the CXL error status, package it up similarly,
> > > and queue it via aer_recover_queue()?
> > 
> > ...
> > But first, RCEC error notifications (RCEC AER interrupts) must be sent
> > to the CXL driver to look into the dport's RCRB.
> 
> Right.  I think it could be solvable to have aer_irq() call or wake a
> CXL interface that has been registered.  But maybe changing
> is_error_source() would be simpler.

I am going to see if is_error_source() can be used to also find CXL
devices. But my main concern here is to mix CXL devices with actual
devices identified by the Error Source ID.

Thanks,

-Robert
