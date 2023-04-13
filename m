Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830866E0CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 13:42:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxyNy32Ylz3fRx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 21:42:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CpeNTl/Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7ea9::62d; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=CpeNTl/Y;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2062d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::62d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxyMz3jBtz3cXl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 21:41:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZ3DeGnMEfWNzlplVtiCR9/WfAHwHT7O2KqRRSTJmQDbDT0zebA95Fd1A9+YvIQ3Xr45J7EWdImkfyZoBnRcLFVgS+ajUeeGr+x1Os9FFqTKoNnhftfWrUR8K5CzJteARKFFJ+H91y1aqJhwi99fcawQOCNO2Um3e3UR7M8VuMoW9H+9j1+Kx/X3OFlV8AM/Bz1cMBr4q9tFoqcmzXie3bWb7fh294DlcktuDGLcuKpbz6gTWt6lvdkKIrKXVdooEdCb30Bm7pGK5RVWFcKFUino1Dusj4fNCmr0Pv1WzQF4ljB9UDVranbHsg6y7J+ZZe1aOugjBqzgUyEafJdd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUkrigx83+dTevdRmV5tgiS+SnOZl6n77b8Vj2l+QO4=;
 b=OVvd77DxHoFj7+FIAPs1a4SPRtlYfAP5Yyw63RV1tu+kB6hNiPCgK3YHHHQM4MFK/diDESaO5buHxcgZjSYzaHMuIFppv/ZK51lPutLowoOug3kySPmzkODKxd/sbtNI5UmkNzunFsik8T7F0QzoPysdjw4j6cRAHzpu93RMR+IbTeUH1xSMVc0U9DJnWdQ6m3U8GbvY5YmU3hUk3X8d9H4svmXbyM98R9GQjpr5mEyo45syhLQWtApUm24EFiEG2BPo/cGt+6uDWruJV16/SXXB2cCW3Sl/fk/54uPUAwlB99FcsI8LQ9VjogkZtuDVIPnRchOe48SM4L2KuziRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUkrigx83+dTevdRmV5tgiS+SnOZl6n77b8Vj2l+QO4=;
 b=CpeNTl/YYVXn5cUiM4VWJDq5sn8G7Y6/8G6jVoASLxSYxkxw+6/zXdquJZGlnx/kImudAzyGJO7t/h+7zyr9yfn2eUlMf/zwNFX+kW5dizxEx6q1ewWPvySQSE9sPZteUYNLkNQXglNAEipsXAiLunQ5G9BiSk8VKmNQ3xQ14g8=
Received: from CY5P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::37) by
 PH7PR12MB5853.namprd12.prod.outlook.com (2603:10b6:510:1d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 11:41:06 +0000
Received: from CY4PEPF0000C980.namprd02.prod.outlook.com
 (2603:10b6:930:b:cafe::81) by CY5P221CA0027.outlook.office365.com
 (2603:10b6:930:b::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 11:41:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C980.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Thu, 13 Apr 2023 11:41:05 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 06:41:01 -0500
Date: Thu, 13 Apr 2023 13:40:52 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZDfbLF1ZYc3uIC19@rric.localdomain>
References: <20230411180302.2678736-6-terry.bowman@amd.com>
 <20230412220233.GA83215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412220233.GA83215@bhelgaas>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C980:EE_|PH7PR12MB5853:EE_
X-MS-Office365-Filtering-Correlation-Id: 407de9c9-3422-4541-e00c-08db3c13f75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NJCk1gisY/d2zEObFYDOjj/hS5YPbBJoZHJsTBndEkt340+TU7i17fQ269ABsmPmVJYP/2op9WeUT7eJ+eF0ucgx8PMRP9gHw3orgNCl7+gpaU1Yugd9XZzW0nHr/RoK9RvyHKD22Ez+/F1TrrI/pdicMGxnnrYsEc+QA+RoGNEGrAuzl8qA5sO0XA+ZbCFs7DKK9jLbjxRHX8nvNFruSl/QeNerbrC4gxxQ951pneLv9j1oE0EV9hV9jTIyzqIOlVcw/PGUiViUuVPYmeWrPiHWP8U2kZtT5Gj1F0YFcYRDmLiE7ebMWnYorEezQP4KCGvaxF5XbCh6A2cqhmUpI0I7CD1PmemNj1RJJQ/SDXwSD05EPsrjk3LzEdMlzivMySYQzOwnnYuzibSv7Um5yJ+BKcXVfPtCCParOj9JvsNdpgc7gyqsMK1t8Bik03u17Ft0XtIlDIeUs1jXpt//nHjR4Qp660PP1QM3t3RfU1baVYBKjtbokQzdUuJRjP+UudN/aAQUd0y0JFBLtEvrqX6ZRxbEoEykxcmWZQe1mhr7Yfh5rYNKIwaBJqbUWWNmn56ZvZQ3SBxr6Dx3rvYsjPMLD8AM8sKfGuJpR3b6xAOTnmTM1foRRe5V4RISgLjbEupN6T8hagz7kqSAchiaCZp+Mt4moDfpYbxl8W1f7WMgTQwtmdRL6/SboOELmEbv681g/ji+q76S+tFK60Jf342BTl5cD4Znw1Ods/SzML8=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(55016003)(4326008)(5660300002)(81166007)(30864003)(7416002)(8676002)(8936002)(40480700001)(40460700003)(70586007)(82740400003)(41300700001)(82310400005)(70206006)(356005)(6916009)(2906002)(966005)(47076005)(316002)(26005)(54906003)(9686003)(53546011)(426003)(336012)(7696005)(478600001)(186003)(6666004)(16526019)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 11:41:05.4002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407de9c9-3422-4541-e00c-08db3c13f75b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CY4PEPF0000C980.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5853
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan.Cameron@huawei.com, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn,

thanks for your detailed review.

On 12.04.23 17:02:33, Bjorn Helgaas wrote:
> On Tue, Apr 11, 2023 at 01:03:01PM -0500, Terry Bowman wrote:
> > From: Robert Richter <rrichter@amd.com>
> > 
> > In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> > RCiEP, but CXL downstream and upstream ports are not enumerated and
> > not visible in the PCIe hierarchy. Protocol and link errors are sent
> > to an RCEC.
> > 
> > Restricted CXL host (RCH) downstream port-detected errors are signaled
> > as internal AER errors, either Uncorrectable Internal Error (UIE) or
> > Corrected Internal Errors (CIE). The error source is the id of the
> > RCEC. A CXL handler must then inspect the error status in various CXL
> > registers residing in the dport's component register space (CXL RAS
> > cap) or the dport's RCRB (AER ext cap). [1]
> > 
> > Errors showing up in the RCEC's error handler must be handled and
> > connected to the CXL subsystem. Implement this by forwarding the error
> > to all CXL devices below the RCEC. Since the entire CXL device is
> > controlled only using PCIe Configuration Space of device 0, Function
> > 0,
> 
> Capitalize "device" and "Function" the same way (also appears in
> comment below).

Changed that.

> 
> > only pass it there [2]. These devices have the Memory Device class
> > code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> > can implement the handler. In addition to errors directed to the CXL
> > endpoint device, the handler must also inspect the CXL downstream
> > port's CXL RAS and PCIe AER external capabilities that is connected to
> 
> "AER external capabilities" --  is that referring to the "AER
> *Extended* capability"?  If so, we usually don't bother including the
> "extended" part because it's usually not relevant.  But if you intended
> "external", I don't know what it means.

Right, "extended" is meant here, but I will drop it to also fit with
the 'CXL RAS capability'.

> 
> > the device.
> > 
> > Since CXL downstream port errors are signaled using internal errors,
> > the handler requires those errors to be unmasked. This is subject of a
> > follow-on patch.
> > 
> > The reason for choosing this implementation is that a CXL RCEC device
> > is bound to the AER port driver, but the driver does not allow it to
> > register a custom specific handler to support CXL. Connecting the RCEC
> > hard-wired with a CXL handler does not work, as the CXL subsystem
> > might not be present all the time. The alternative to add an
> > implementation to the portdrv to allow the registration of a custom
> > RCEC error handler isn't worth doing it as CXL would be its only user.
> > Instead, just check for an CXL RCEC and pass it down to the connected
> > CXL device's error handler. With this approach the code can entirely
> > be implemented in the PCIe AER driver and is independent of the CXL
> > subsystem. The CXL driver only provides the handler.
> 
> Can you make this more concrete with an example topology so we can
> work through how this all works?  Correct me when I go off the rails
> here:

Let's assume just a simple CXL RCH topology:

PCI hierarchy:

		-----------------
		| ACPI0016      |----------------	Host bridge (CXL host)
		| - CEDT        |		|
   -------------|   - RCRB base |		|
   |		-----------------		:
   |		     |
   |		     |
   |		------------------- 	---------
   |		| RCiEP       	  |.....| RCEC  |	Endpoint (CXL dev)
   |	--------| - BDF       	  |	| - BDF |
   |	|	| - PCIe AER  	  |	---------
   |	|	| - CXL dvsec     |
   |	|	|   (v2: reg loc) |
   |	|	|   - Comp regs   |
   |	|	|     - CXL RAS   |
   |	|	-------------------
   :	:
	
CXL hierarchy:

   :						:
   : 		------------------		|
   |		| CXL root port  |<--------------
   |		|     	   	 |	  
   |----------->| - dport RCRB   |<--------------
   |		|   - PCIe AER	 |		|
   |		|   - Comp regs	 |		|
   |		|     - CXL RAS  |		|
   |		------------------		|
   |	:					|
   |	|	------------------		|
   |	------->| CXL endpoint   |---------------
   |		| (v1: RCRB)	 |
   ------------>| - uport RCRB   |
   		|   - Comp regs	 |
		|     - CXL RAS  |
		------------------

Dport detected errors are reported using PCIe AER and CXL RAS caps in
the dports RCRB.

Uport detected errors are reported using RCiEP's PCIe AER cap and
either the uport's RCRB RAS cap or the RAS cap of the comp regs
located using CXL DVSEC register locator.

In all cases the RCEC is used with either the RCEC (dport errors) or
the RCiEP (uport errors) error source id (BDF: bus, dev, func).

> 
> The current code uses pcie_walk_rcec() in this path, which basically
> searches below a Root Port or RCEC for devices that have an AER error
> status bit set, add them to the e_info[] list, and call
> handle_error_source() for each one:

For reference, this series adds support to handle RCH downstream
port-detected errors as described in CXL 3.0, 12.2.1.1.

This flow looks correct to me, see comments inline.

> 
>   aer_isr_one_error
>     # get e_src from aer_fifo
>     find_source_device(e_src)

e_src is the RCEC.

>       pcie_walk_rcec(find_device_iter)
>         find_device_iter
>           is_error_source
>             # read PCI_ERR_COR_STATUS or PCI_ERR_UNCOR_STATUS

It is an internal error (CIE or UIE).

>           if (error-source)

An early version of the spec did not require the RCEC as an error
source. But this case is not handled with this series.

>             add_error_device
>               # add device to e_info[] list
>     # now call handle_error_source for everything in e_info[]
>     aer_process_err_devices
>       for (i = 0; i < e_info->err_dev_num; i++)
>         handle_error_source

handle_error_source() is called with the RCEC as pci_dev.

> 
> IIUC, this patch basically says that an RCEC should have an AER error
> status bit (UIE or CIE) set, but the devices "below" the RCEC will
> not, so they won't get added to e_info[].

An internal error of the RCEC indicates a CXL dport error.

> 
> So we insert cxl_handle_error() in handle_error_source(), where it
> gets called for the RCEC, and then it uses pcie_walk_rcec() again to
> forcibly call handle_error_source() for *every* device "below" the
> RCEC (even though they don't have AER error status bits set).

The CXL device contains the links to the dport's caps. Also, there can
be multiple RCs with CXL devs connected to it. So we must search for
all CXL devices now, determine the corresponding dport and inspect
both, PCIe AER and CXL RAS caps.

> 
> Then handle_error_source() ultimately calls the CXL driver err_handler
> entry points (.cor_error_detected(), .error_detected(), etc), which
> can look at the CXL-specific error status in the CXL RAS or RCRB or
> whatever.

The AER driver (portdrv) does not have the knowledge of CXL internals.
Thus the approach is to pass dport errors to the cxl_mem driver to
handle it there in addition to cxl mem dev errors.

> 
> So this basically looks like a workaround for the fact that the AER
> code only calls handle_error_source() when it finds AER error status,
> and CXL doesn't *set* that AER error status.  There's not that much
> code here, but it seems like a quite a bit of complexity in an area
> that is already pretty complicated.
> 
> Here's another idea: the ACPI GHES code (ghes_handle_aer()) basically
> receives a packet of error status from firmware and queues it for
> recovery via pcie_do_recovery().  What if you had a CXL module that
> knew how to look for the CXL error status, package it up similarly,
> and queue it via aer_recover_queue()?

The CXL module knows how and where to look for errors, but it does not
receive interrupts (for dport errors). The interrupts land in the
portdrv (the RCEC's pci driver) and the CXL module must be notified by
the portdrv. But the portdrv (AER driver) does not know the CXL module
nor it is always present (e.g. CXL bus must be enumerated first etc.).

aer_recover_queue() is interesting to report AER errors that has been
retrieved outside the PCIe hierarchy, in particular the dport AER cap
in the RCRB (see patch #4). We could collect all the data and just
send it to aer_recover_queue(). I think aer_recover_work_func() must
be extended to also handle corrected errors, otherwise the function is
already almost the same as handle_error_source().

But first, RCEC error notifications (RCEC AER interrupts) must be sent
to the CXL driver to look into the dport's RCRB.

-Robert

> 
> > [1] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> > [2] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> > 
> > Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> > Signed-off-by: Robert Richter <rrichter@amd.com>
> > Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> > Cc: "Oliver O'Halloran" <oohall@gmail.com>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: linux-pci@vger.kernel.org
> > ---
> >  drivers/pci/pcie/Kconfig |  8 ++++++
> >  drivers/pci/pcie/aer.c   | 61 ++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 69 insertions(+)
> > 
> > diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> > index 228652a59f27..b0dbd864d3a3 100644
> > --- a/drivers/pci/pcie/Kconfig
> > +++ b/drivers/pci/pcie/Kconfig
> > @@ -49,6 +49,14 @@ config PCIEAER_INJECT
> >  	  gotten from:
> >  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
> >  
> > +config PCIEAER_CXL
> > +	bool "PCI Express CXL RAS support"
> > +	default y
> > +	depends on PCIEAER && CXL_PCI
> > +	help
> > +	  This enables CXL error handling for Restricted CXL Hosts
> > +	  (RCHs).
> > +
> >  #
> >  # PCI Express ECRC
> >  #
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 7a25b62d9e01..171a08fd8ebd 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -946,6 +946,65 @@ static bool find_source_device(struct pci_dev *parent,
> >  	return true;
> >  }
> >  
> > +#ifdef CONFIG_PCIEAER_CXL
> > +
> > +static bool is_cxl_mem_dev(struct pci_dev *dev)
> > +{
> > +	/*
> > +	 * A CXL device is controlled only using PCIe Configuration
> > +	 * Space of device 0, Function 0.
> > +	 */
> > +	if (dev->devfn != PCI_DEVFN(0, 0))
> > +		return false;
> > +
> > +	/* Right now there is only a CXL.mem driver */
> > +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> > +		return false;
> > +
> > +	return true;
> > +}
> > +
> > +static bool is_internal_error(struct aer_err_info *info)
> > +{
> > +	if (info->severity == AER_CORRECTABLE)
> > +		return info->status & PCI_ERR_COR_INTERNAL;
> > +
> > +	return info->status & PCI_ERR_UNC_INTN;
> > +}
> > +
> > +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info);
> > +
> > +static int cxl_handle_error_iter(struct pci_dev *dev, void *data)
> > +{
> > +	struct aer_err_info *e_info = (struct aer_err_info *)data;
> > +
> > +	if (!is_cxl_mem_dev(dev))
> > +		return 0;
> > +
> > +	/* pci_dev_put() in handle_error_source() */
> > +	dev = pci_dev_get(dev);
> > +	if (dev)
> > +		handle_error_source(dev, e_info);
> > +
> > +	return 0;
> > +}
> > +
> > +static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> > +{
> > +	/*
> > +	 * CXL downstream port errors are signaled as RCEC internal
> > +	 * errors. Forward them to all CXL devices below the RCEC.
> > +	 */
> > +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> > +	    is_internal_error(info))
> > +		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
> > +}
> > +
> > +#else
> > +static inline void cxl_handle_error(struct pci_dev *dev,
> > +				    struct aer_err_info *info) { }
> > +#endif
> > +
> >  /**
> >   * handle_error_source - handle logging error into an event log
> >   * @dev: pointer to pci_dev data structure of error source device
> > @@ -957,6 +1016,8 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
> >  {
> >  	int aer = dev->aer_cap;
> >  
> > +	cxl_handle_error(dev, info);
> > +
> >  	if (info->severity == AER_CORRECTABLE) {
> >  		/*
> >  		 * Correctable error does not need software intervention.
> > -- 
> > 2.34.1
> > 
