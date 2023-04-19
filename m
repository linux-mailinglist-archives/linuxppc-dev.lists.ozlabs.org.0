Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A9D6E7AE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 15:32:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1hXn5nvYz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 23:32:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q7pKthUX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:fe5b::609; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Q7pKthUX;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1hWr6FSFz3cFr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 23:31:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NohCA1IhVMTivkxMzy/PhcyqGJ0YpaOxuPUH9Su8bF7/T6jdiR1q+zRFd6qV8vWLTMKuGTRFaDeOBNydIoB5HLHcLVuDMvigKqXP+dxNAlC0wIVaXJp25De/duzsz1zJ88jg4YVnfW/RfdML4XAMxjvRGvMc13PjLqeTws5bI2pjsOiR0G8/2RdR8IGiwICYiyxPitizDHtoUMBooAAEniZxZxY+0VOpS428GYd6G6isQFs9cTdrVZNE5qqz77QUrdO8eIFfnW8wRHNuSoLvDJjnrgnbIoDLSJNOBG5SLkG2BmULHNY0OJuifFPM80UhQsHVc4PXZgYiPmtxIwIahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6F+4ysU5/5/FFdlExw7qltnFdImzF8oF6ZaNEXkTao=;
 b=Eec6MVsB6pr/A2QQgh5BPv8edq8GnOHTZm6yOLocGZGN/0Zucd5ENsMYjT/a4NI5xdqhGXeAq/k603lf14CEjiklC2g+uDMv/ZC1m7b4TueXfUx3Y/AHgKRS3/vFsxNN+LlfPeBihzpliXuk5wqnZLsgV5X3W2UysN/3gzAQTMIf3NYIHw8sYSYxePW9MN64eLIJeItmCPcTVwp0GGsgnpvD421m3iZwtqNF17rvqD3iRxeBq7HmMNTc+uzZkya0AoKH8snIHo9pTpNtj45c246paW3MIQpGF9hZNVkxlscQg8785sV/IsO4Fn1gDFh7XUhlox45VT9/FSMYQ6ZNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u6F+4ysU5/5/FFdlExw7qltnFdImzF8oF6ZaNEXkTao=;
 b=Q7pKthUXd9GF9lJABRN+J7FFfK3UiInyP69l9X+2SkA+BXWrVbFLhuo3o40FlXlU+cnxhixsSElTE/C0cjNjc8H2YxJD/IuakZnzceCG/MHfp0Ho9c02Yvoql8ZoJlC6T+xAnUazy2zDwsqWGLaatfBamHhDCysK5jFAfrDm2fg=
Received: from MW4PR03CA0312.namprd03.prod.outlook.com (2603:10b6:303:dd::17)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Wed, 19 Apr
 2023 13:30:52 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::43) by MW4PR03CA0312.outlook.office365.com
 (2603:10b6:303:dd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22 via Frontend
 Transport; Wed, 19 Apr 2023 13:30:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.22 via Frontend Transport; Wed, 19 Apr 2023 13:30:52 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 19 Apr
 2023 08:30:48 -0500
Date: Wed, 19 Apr 2023 15:30:32 +0200
From: Robert Richter <rrichter@amd.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZD/s+E53CKHh+Pab@rric.localdomain>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
 <20230411180302.2678736-6-terry.bowman@amd.com>
 <643debf5af445_1b66294f4@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <643debf5af445_1b66294f4@dwillia2-xfh.jf.intel.com.notmuch>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: c96d7f2d-5400-4e60-18ea-08db40da4bf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jF+d8IdbgSiiRfHEqJITKv/IHB2HVqzjv0PKRUUwnI/+/k+HWrF0enqxwNaWWkqa1QW+PRLaBAWzB9zNt4aRCBc7AVN6bqrCNqR/+WAaU6h8c1W526KxvPn0u9vMJdSqw6xHJCZ/Zql1+elS8scS4tY/LlUkyVbM9UYfpMGjucLuamH8KW5ASMTO0J7hbtlsZ3E1URbI5JpK5ptKYOOLJDuzqzhifR4ZlvGMSbra7rPRxgL1SVrjBQw4HqTTL7e1wfIK6zYNnNjNX2tQFWaR/kSKXleumTIncctvxOZ9yARIblXE0VpmjOy2H8436NmzTMrmtP6WrMqfZx23cotvqxWKASuEXyAoy8DtXAU0V/c5fWWInWYdVuJnqGEsHHGdFja4d26ZnKqDkeyoYiM0cuRy0zLPQIihHQo8HIeqtXBdAWVC7COAd1pTiWyTX4ukoxb/mXnAztgel/JnzHJL4y5MfbereUyHi8/Yq2AJh9iTtQMJP+c1Fl3Rx5iEpCht6kmoFLRdZTcVR/hS0/dvDhssF5ZeRx2ldNKowAhGdHrNC6VK+EUFoJXiiQCBNu+I6e4cqZxbtu645RrOYL6WUGb7oFU4ZlCy5lHMOQWxORYocuFCUCybKKNePtpk8dN5iTnSOlh2dYfTDM0Bd5jxQKkuCB6FlJHt6Jge4hfMBX31YF37L768yllhNyFIwjh1GTvbiXiguULMeZE5cLzsLwrPytxjYTJyAWqqrpaLCQk=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(966005)(7696005)(40460700003)(478600001)(2906002)(4326008)(70206006)(6916009)(70586007)(7416002)(8936002)(81166007)(41300700001)(6666004)(82740400003)(316002)(356005)(82310400005)(8676002)(55016003)(40480700001)(54906003)(9686003)(26005)(336012)(426003)(53546011)(36860700001)(16526019)(47076005)(186003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:30:52.2871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c96d7f2d-5400-4e60-18ea-08db40da4bf7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan.Cameron@huawei.com, bwidawsk@kernel.org, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan,

thanks for review, see comments inline.

On 17.04.23 18:01:41, Dan Williams wrote:
> Terry Bowman wrote:
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
> > 0, only pass it there [2]. These devices have the Memory Device class
> > code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> > can implement the handler. In addition to errors directed to the CXL
> > endpoint device, the handler must also inspect the CXL downstream
> > port's CXL RAS and PCIe AER external capabilities that is connected to
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
> > 
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
> 
> This part feels broken because most the errors of concern here are CXL
> link generic and that can involve CXL.cache and CXL.mem errors on
> devices that are not PCI_CLASS_MEMORY_CXL. This situation feels like it
> wants formal acknowledgement in 'struct pci_dev' that CXL links ride on
> top of PCIe links.

There is already rcec->rcec_ea that holds the RCEC-to-endpoint
association. Determining if the RCiEP is a CXL dev is a small check
which is exactly what is_cxl_mem_dev() is for. I don't see a benefit
in holding the same information in an additional cxl_link structure.

And as you also said below, for RCRB handling a CXL driver is needed
which is why is_cxl_mem_dev() with the class check is used below.

> 
> If it were not for RCRBs then the PCI core could just do:
> 
>     dvsec = pci_find_dvsec_capability(pdev, PCI_DVSEC_VENDOR_ID_CXL,
>                                       CXL_DVSEC_FLEXBUS_PORT);
> 
> ...at bus scan time to identify devices with active CXL links. RCRBs
> unfortunately make it so the link presence can not be detected until a
> CXL driver is loaded to read that DVSEC out of MMIO space.

In a VH topology those errors can be directly handled in a pci driver
for CXL ports, if the portdrv handles that the check could be useful.
But this is not subject of this patch series.

> 
> However, I still think that looks like a CXL aware driver registering a
> 'struct cxl_link' (for lack of a better name) object with a
> corresponding PCI device. That link can indicate whether this is an RCH
> topology and whether it needs to do the RCEC walk, and that registration
> event can flag the RCEC has having CXL link duties to attend to on AER
> events.

For CXL awareness of the AER driver the simple checks from above could
be used, either called directly for the pci_dev (VH mode), or by
walking the RCEC. IMO, a 'struct cxl_link' and a function to register
it are not really needed here.

> 
> I suspect 'struct cxl_link' can also be used if/when we get to
> incoporating CXL Reset into PCI reset handling.
> 
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
> 
> 
> I assume this also needs to reference the RDPAS if present?

That is subject of a follow-on patch.

Here I see, why you may need a struct cxl_link. But that list must not
reside in the pci_dev, instead a CXL aware driver can look up a
self-maintained list of RDPAS mappings (RCEC-to-Downstream Port
assosiations) to decide whether to lookup the dport's AER and RAS
capablilities.

> 
> CXL 3.0 9.17.1.5 RCEC Downstream Port Association Structure (RDPAS)
> 
> > +
> > +	/* pci_dev_put() in handle_error_source() */
> > +	dev = pci_dev_get(dev);
> > +	if (dev)
> > +		handle_error_source(dev, e_info);
> 
> I went looking but missed where does handle_error_source() synchronize
> against driver ->remove()?

Right, the device_lock() is missing in handle_error_source() while
accessing pdrv and calling the handler. Will send a fix.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> 
> Naming suggestion...
> 
> Given that the VH topology does not require this scanning and
> assoication step, lets call this cxl_rch_handle_error() to make it clear
> this is only here to undo the awkwardness of CXL 1.1 platforms hiding
> registers from typical PCI scanning. A reference to:
> 
> CXL 3.0 9.11.8 CXL Devices Attached to an RCH
> 
> ...might be useful to a future reader that wonders why the CXL RCH case
> is so complicated from an AER perspective.

Ok.

Thanks,

-Robert
