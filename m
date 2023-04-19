Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4D6E7C33
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 16:19:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1jZz39gDz3fBk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 00:19:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aPOyfJIX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe59::616; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aPOyfJIX;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1jZ4299mz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 00:18:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/UrsZVNTxrSRmD217QExTJqQ1eH2+HtD/DMGJNVaFeFdl99YR0FxlbzTdwkr9J9oywWBlirGLbJr16MatlBxNSYTpzO/8BtcIr663AVNJygT/f41FyVpBcmH/vH1wL5LUOxrBwQX9cdIqM1KttmrLswAY3N4Uk+A/RI6bkj4K5w65+uGDT8m6gItvZWJ8sWW2rflzT05P8o1mLcXjr8x7EtlUf7NxlyeKyzE4PP3i4IYJZwADpc9z4PklGB56DdFWmNqqKRbIBe9IhCDOcLbyP0zgxd9JykY2duF4KUXyWZ6qhs6URM4qI6OGYTcQTGL9FT7sS56wCHH9PtmRubuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+m4Wi5dg3l9GANgbvJ8QvKfYclSxuRaJckyHL8lh9I=;
 b=WchZoc1ZgGMjmvikeme+V9rk6tEItq86TSJrVTutvoiM7fFvmzzFVVdOpRa1DplVzlAtR6/jkSq0tup4QMYuRXO1pmT9buAwDfXeTBau+62n6YlcfoYQ5nAmnhNNzmkebVQhx7jWvBYNtP8Y7yx2RH1qw002BZ6MvrBCc1zlvioWzcKwQTLMug4904+P+zPbxyRRxRwfIDusMMb+TGiC/En61hsnvcAuhYvu4vVAWG1VC/eYrXbH4x+l0V7lYmyrfKzzeloiXW5Rs6ensp2vkUsatVSIf0Dqe08cSyM78AKq7dyZT6XN9OeePuEQzAJMH0RlxN3ntgnQgvignnbnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+m4Wi5dg3l9GANgbvJ8QvKfYclSxuRaJckyHL8lh9I=;
 b=aPOyfJIXVSTs/jfg8jgPL9Ya+RgHaQzLXgFkmxaUu2ghLCE8xcYVwkX95wyFZ7tze1r0k8E37XxFvPu1qljjOD+4KOF+tHQ9XkrPR5gao/LvCdjR+kzJZ9uK+J91v0qxq74x3Lqxf10YUMqA+/fCDAPCPOPZM9FaGYM2ulpVzDQ=
Received: from BLAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:36e::24)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 14:17:57 +0000
Received: from BL02EPF0000C409.namprd05.prod.outlook.com
 (2603:10b6:208:36e:cafe::8a) by BLAPR05CA0019.outlook.office365.com
 (2603:10b6:208:36e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 14:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C409.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.16 via Frontend Transport; Wed, 19 Apr 2023 14:17:57 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 09:17:53 -0500
Date: Wed, 19 Apr 2023 16:17:50 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZD/4Dimu19lsJLyO@rric.localdomain>
References: <ZDfbLF1ZYc3uIC19@rric.localdomain>
 <20230414213254.GA219190@bhelgaas>
 <ZD3BlNYeiXQR2h6+@rric.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZD3BlNYeiXQR2h6+@rric.localdomain>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C409:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 92e20c4b-83b0-4778-a27b-08db40e0dfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1Z8OY3IrofSdpbC5KijyrsIo2h+bYGDkaH3/A5ZI2wxoqtv6JOb9mloUlvBxR1hiKGXyUfiZ1p79D0IAEBqyzRKrrFniMaAd9yQRhjSI4J0IwhuAG3HJQ/es+V33ddMNwS9SqKdZp/plzQ48Jc831WzqvE4bm9c/sy5ONLqZ5LikED4Pqu0qD1Jhnmxru3/wRmuWk3zvhXj7xNIb/4X+miYT2uiX4OMJI8YS5/MehPq+CZHiDBXU9Ht12zlb6YHuPzIMiD9PI6J9kNnkq2W6nxUhenTq+4+mNfOlg8h2C/rbpKnZeuZp0BwxlaiCL1AjdXPsG+HHEdPIqcDegTam+jbohkL9hyctsbwaFy/ykzfkW8+hl5MVbJRRtEn97RvgfM8QGyZjy3bUhAqJv7y60Q0n8BuQgxdKlP86wyEOxc1AY54tT71VkWehuGqiYmOiOhOAfyPi/Xz1qzJWVr3Qb9Tw6jv8D8wIUSJE+WXoK/J8KeshqHIxwri7m+Ix/yt35S9u3XOl8tbd3zJVNKAhfmewM0zAqfB2NOHcAynXu4XbHvYL9FhIULQE5mi2K4LXCPjx5Gpw9Gszv5LVUwmPuEbGLaDFwMFQOI5qHrzW0H/yD4LLYVm/bB7sUf787X9AabNf6tsPV54aGqGdpwbNumQ2dHUXE7TwLPQlMC1PqgCj04NlXoUL5k5Clr6zg1UQ+QrzBDgTtrIExVGtLNOWsdqc9Sz6/CwgQeD+K/0sDUI=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(356005)(82740400003)(478600001)(7696005)(40460700003)(54906003)(55016003)(66899021)(81166007)(2906002)(40480700001)(83380400001)(426003)(336012)(47076005)(186003)(16526019)(53546011)(9686003)(82310400005)(36860700001)(4326008)(5660300002)(316002)(7416002)(70586007)(26005)(70206006)(6916009)(41300700001)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 14:17:57.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e20c4b-83b0-4778-a27b-08db40e0dfb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF0000C409.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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

Bjorn,

On 18.04.23 00:00:58, Robert Richter wrote:
> On 14.04.23 16:32:54, Bjorn Helgaas wrote:
> > On Thu, Apr 13, 2023 at 01:40:52PM +0200, Robert Richter wrote:
> > > On 12.04.23 17:02:33, Bjorn Helgaas wrote:
> > > > On Tue, Apr 11, 2023 at 01:03:01PM -0500, Terry Bowman wrote:

> > I'm mostly interested in the PCI entities involved because that's all
> > aer.c can deal with.  For the above, I think the PCI core only knows
> > about these:
> > 
> >   00:00.0 RCEC  with AER, RCEC EA includes 00:01.0
> >   00:01.0 RCiEP with AER
> > 
> > aer_irq() would handle AER interrupts from 00:00.0.
> > cxl_handle_error() would be called for 00:00.0 and would call
> > handle_error_source() for everything below it (only 00:01.0 here).
> > 
> > > > The current code uses pcie_walk_rcec() in this path, which basically
> > > > searches below a Root Port or RCEC for devices that have an AER error
> > > > status bit set, add them to the e_info[] list, and call
> > > > handle_error_source() for each one:
> > > 
> > > For reference, this series adds support to handle RCH downstream
> > > port-detected errors as described in CXL 3.0, 12.2.1.1.
> > > 
> > > This flow looks correct to me, see comments inline.
> > 
> > We seem to be on the same page here, so I'll trim it out.
> > 
> > > ...
> > > > So we insert cxl_handle_error() in handle_error_source(), where it
> > > > gets called for the RCEC, and then it uses pcie_walk_rcec() again to
> > > > forcibly call handle_error_source() for *every* device "below" the
> > > > RCEC (even though they don't have AER error status bits set).
> > > 
> > > The CXL device contains the links to the dport's caps. Also, there can
> > > be multiple RCs with CXL devs connected to it. So we must search for
> > > all CXL devices now, determine the corresponding dport and inspect
> > > both, PCIe AER and CXL RAS caps.
> > > 
> > > > Then handle_error_source() ultimately calls the CXL driver err_handler
> > > > entry points (.cor_error_detected(), .error_detected(), etc), which
> > > > can look at the CXL-specific error status in the CXL RAS or RCRB or
> > > > whatever.
> > > 
> > > The AER driver (portdrv) does not have the knowledge of CXL internals.
> > > Thus the approach is to pass dport errors to the cxl_mem driver to
> > > handle it there in addition to cxl mem dev errors.
> > > 
> > > > So this basically looks like a workaround for the fact that the AER
> > > > code only calls handle_error_source() when it finds AER error status,
> > > > and CXL doesn't *set* that AER error status.  There's not that much
> > > > code here, but it seems like a quite a bit of complexity in an area
> > > > that is already pretty complicated.
> > 
> > My main point here (correct me if I got this wrong) is that:
> > 
> >   - A RCEC generates an AER interrupt
> > 
> >   - find_source_device() searches all devices below the RCEC and
> >     builds a list everything for which to call handle_error_source()
> 
> find_source_device() does not walk the RCEC if the error source is the
> RCEC itself (note that find_device_iter() is called for the root/rcec
> device first and exits early then).
> 
> > 
> >   - cxl_handle_error() *again* looks at all devices below the same
> >     RCEC and calls handle_error_source() for each one
> > 
> > So the main difference here is that the existing flow only calls
> > handle_error_source() when it finds an error logged in an AER status
> > register, while the new CXL flow calls handle_error_source() for
> > *every* device below the RCEC.
> 
> That is limited as much as possible:
> 
>  * The RCEC walk to handle CXL dport errors is done only in case of
>    internal errors, for an RCEC only (not a port) (check in
>    cxl_handle_error()).
> 
>  * Internal errors are only enabled for RCECs connected to CXL devices
>    (handles_cxl_errors()).
> 
>  * The handler is only called if it is a CXL memory device (class code
>    set and zero devfn) (check in cxl_handle_error_iter()).
> 
> An optimization I see here is to convert some runtime checks to cached
> values determined during device enumeration (CXL device list, RCEC is
> associated with CXL devices). Some sort of RCEC-to-CXL-dev
> association, similar to rcec->rcec_ea.
> 
> > 
> > I think it's OK to do that, but the almost recursive structure and the
> > unusual reference counting make the overall AER flow much harder to
> > understand.
> > 
> > What if we changed is_error_source() to add every CXL.mem device it
> > finds to the e_info[] list, which I think could nicely encapsulate the
> > idea that "CXL devices have error state we don't know how to interpret
> > here"?  Would the existing loop in aer_process_err_devices() then do
> > what you need?
> 
> I did not want to mix this with devices determined by the Error Source
> Identification Register. CXL device may not be the error source of an
> error which may cause some unwanted side-effects. We must also touch
> AER_MAX_MULTI_ERR_DEVICES then and how the dev list is implemented as
> the max number of devices is unclear.
> 
> > 
> > > > Here's another idea: the ACPI GHES code (ghes_handle_aer()) basically
> > > > receives a packet of error status from firmware and queues it for
> > > > recovery via pcie_do_recovery().  What if you had a CXL module that
> > > > knew how to look for the CXL error status, package it up similarly,
> > > > and queue it via aer_recover_queue()?
> > > 
> > > ...
> > > But first, RCEC error notifications (RCEC AER interrupts) must be sent
> > > to the CXL driver to look into the dport's RCRB.
> > 
> > Right.  I think it could be solvable to have aer_irq() call or wake a
> > CXL interface that has been registered.  But maybe changing
> > is_error_source() would be simpler.
> 
> I am going to see if is_error_source() can be used to also find CXL
> devices. But my main concern here is to mix CXL devices with actual
> devices identified by the Error Source ID.

I have looked into reusing is_error_source() and modifying
find_source_device() to also add CXL devices (the RCiEPs) to the dev
list in e_info. The problem I see is that at AER level it is unknown
whether an error happened or not. The downstream port AER capability
also does not reside in a PCI config space header and thus is not
directly bound to a pci_dev. That means the endpoint's AER capability
in pci_dev is not the one we need, instead a CXL aware driver must
lookup the RCRB which contains the AER. Additional, the CXL RAS cap
must be inspected by that driver.

Assuming we add the RCiEP to the dev list the CXL endpoint will be
processed by aer_get_device_error_info(), aer_print_error() and
handle_error_source(). This is done for the endpoint device even if
the source is the dport. Also we need to check the error status of
both caps registers first. This will cause error reports and status
checks of devices not being the error source.

That said, I think the best option is still to delegate the error down
to a CXL handler and do the error status check, reporting and handling
of the CXL specifics there.

I see your point that esp. the pci_dev's refcount handling needs to be
improved. I will address that along with the other review comments in
a next version of this patch series. Let's then revisit this
discussion here?

Thanks,

-Robert
