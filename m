Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 466116E25DF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 16:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyfCN1SRvz3fWd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Apr 2023 00:36:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kYVuN1Ch;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=kYVuN1Ch;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyfBM65Vfz3f5P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Apr 2023 00:35:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YEZy4kHq7xQ5xPpl/dilmpBhc+CQcXVygNIn9pervE4LriDaQ/dGcwT8ON/3KMogm8Vx/lPQos/KL62f0TosJhMjpWIkZzU2h6nxwCt4SFX/kt+AQZ3pgITSMXcjH4XeGVMQLjTVVFVwbFGrIoUIuem86h/RPh9GDtVZ82RvrMMmCeuYt0obnc7S7onNRzS8sth4vlJKeXYmHcGwCEXFlV/sDg8D6qsDmbh9MaCQyqy69cwlXAI0fwxXsTmqVSYKEzbPIFPSijpFukUwZme/kuQwMM/0HJqx82IUdSrsszc/qB3OgzkVeTz2NEkKxRje3scFSOiVcVoS7YB8stH7aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNB41rgdSESIMC0B4DDOyXntT+vdFiAMPBc+j2qmZ/M=;
 b=Gr6PNwIYB8hSht+tBhxJGtaiwF+AUES7YK82sc9k5UT9ClIgpv2avfRpjkrCcuxEFAgvEquI0gJ+AxvS+YplO8ocLyqMYj2jQFwWNRKAYuZ3MjvMXUyQbBfpWzdEjq1+LAy84sQnvqPLHrwYldImKNkM8u5peJe0fAvBm4opD+3dR8vAlF/P25Hs5gxeYgmrBr5TZkOckIVP4UVq2pKTJe92g7T32i3PIAbd1ueYolO+eLaJ6Rma9S/Um/mphyfxL5WH+xRrYidwaiB/5Gqpd/OfEZmt8WFo4dKIwLvcMe76KO1Mx7WKkNEmllK/VSNk87v467kkCroSUE9lOCTdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=huawei.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNB41rgdSESIMC0B4DDOyXntT+vdFiAMPBc+j2qmZ/M=;
 b=kYVuN1ChKBjQQuAI+G14cnq/6u0cv9/x2JrNLYBXfOdYOYJqJvCQucuE7nkpG1wB9VARkbi7bX8goduPCB2PU3qVUbRrUQbxx/jXbU/WnOUWXrK3kMm6CS6sSADq3sFwvvN8bd9UTODa+JiMyAeVwWZx/6iuxHZMag6njmmQUyU=
Received: from BN0PR04CA0156.namprd04.prod.outlook.com (2603:10b6:408:eb::11)
 by BY5PR12MB4854.namprd12.prod.outlook.com (2603:10b6:a03:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 14:35:15 +0000
Received: from BL02EPF000145B8.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::96) by BN0PR04CA0156.outlook.office365.com
 (2603:10b6:408:eb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 14:35:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145B8.mail.protection.outlook.com (10.167.241.208) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.27 via Frontend Transport; Fri, 14 Apr 2023 14:35:13 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 09:35:07 -0500
Date: Fri, 14 Apr 2023 16:35:05 +0200
From: Robert Richter <rrichter@amd.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZDlkmcsbwsNv/t8+@rric.localdomain>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
 <20230411180302.2678736-6-terry.bowman@amd.com>
 <20230414131950.00006e76@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230414131950.00006e76@Huawei.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B8:EE_|BY5PR12MB4854:EE_
X-MS-Office365-Filtering-Correlation-Id: a89d91b2-daa1-41b3-912a-08db3cf57562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0GBci7T9AQ8PzKgt8e1KLgHWcenKNaQ7p3QOttlEROa235i4AN953P05nNo7SwGjSHyICZblxqsig6ikCTmkcRKIkL20B5q8jP+iRxWGVf+YgU/iQux5G7+OLo/SzGvEXzedOyiDm8jPbgJswpxN3jJnV7Dhj/osWO1H0+lKdD3OiHAzNlUJMQMrf5Co+qqI3vDXObpnEzQwVkupNEX0+8whru7Geyrn6Xqbm3JgaZF+oReBJJOoKaJKlxaW/9YieAfjUjO1ThS30oVQGhrZabYtNYZOJE173B9Mp3xZzzR+QCffZaPbkC9IXPoQn45yybgDpY11AWFj828vvoSZyFEnhtGH8OG6UbN9xqCkn04zJY/84iRBTprqAVYoYKQ1/Esglp5jjt1pMSEtCCEEMKZ7HfvYDhULM8PODAEgbTW4Hzpity3jAvBwr/TfV7mxXzjydMz1brKQ9SxLdYW+Kh4kaaVbt/QW3nkAAC9lWksufHsan/H451uC1Q+i8ux52P0dhZTfXFujRFRw4cQxIxg0F+KRlTfAGSWj960pw7SilQthhHaAYjOLOAls0c0kM+9VFQKPc7kDjEKgF61XcYWJ272rbu29Gry+5Zxn/kdKGUo4CsuqhKBugpLVDf2gJ7DozQrG/p77rIsDdoDYxU/HZNzH/Gsy/znkcij3uIY3qSRwoR5xaWpSi8J4W/4+bhoGMDdlQceltXlRcdBtoOVKh04FBRnNSf6K3h01XsQ=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(346002)(376002)(451199021)(40470700004)(36840700001)(46966006)(478600001)(7696005)(40460700003)(47076005)(83380400001)(356005)(81166007)(82740400003)(6916009)(55016003)(426003)(36860700001)(336012)(40480700001)(82310400005)(2906002)(5660300002)(966005)(316002)(53546011)(9686003)(26005)(16526019)(186003)(7416002)(41300700001)(8676002)(8936002)(4326008)(54906003)(70586007)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 14:35:13.6636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a89d91b2-daa1-41b3-912a-08db3cf57562
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BL02EPF000145B8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4854
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14.04.23 13:19:50, Jonathan Cameron wrote:
> On Tue, 11 Apr 2023 13:03:01 -0500
> Terry Bowman <terry.bowman@amd.com> wrote:
> 
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
> > can implement the handler.
> 
> This comment implies only class code compliant drivers.  Sure we don't
> have drivers for anything else yet, but we should try to avoid saying
> there won't be any (which I think above implies).
> 
> You have a comment in the code, but maybe relaxing the description above
> to "currently support devices have..."

It is used here to identify CXL memory devices and limit the
enablement to those. The spec requires this to be set for CXL mem devs
(see cxl 3.0, 8.1.12.2).

There could be other CXL devices (e.g. cache), but other drivers are
not yet implemented. That is what I am referring to. The check makes
sure there is actually a driver with a handler for it (cxl_pci).

> 
> > In addition to errors directed to the CXL
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
> 
> Generally looks good to me.  A few trivial comments inline.
> 
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
> 
> Description makes this sound too general. I'd mentioned restricted
> hosts even in the menu option title.
> 
> 
> > +	default y
> > +	depends on PCIEAER && CXL_PCI
> > +	help
> > +	  This enables CXL error handling for Restricted CXL Hosts
> > +	  (RCHs).
> 
> Spec term is probably fine in the title, but in the help I'd 
> expand it as per the CXL 3.0 glossary to include
> "CXL Host that is operating in RCD mode."
> It might otherwise surprise people that this matters on their shiny
> new CXL X.0 host (because they found an old CXL 1.1 card in a box
> and decided to plug it in)
> 
> Do we actually need this protection at all?  It's a tiny amount of code
> and I can't see anything immediately that requires the CXL_PCI dependency
> other than it's a bit pointless if that isn't here.
> 
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
> 
> That's not true in general.   Definitely true that CXL protocol
> error reporting is controlled only using this Devfn, but
> more generally there could be other stuff in later functions.
> So perhaps make the comment more specific.

I actually mean CXL device in RCD mode here (seen as RCiEP in the PCI
hierarchy).

The spec says (cxl 3.0, 8.1.3):

"""
In either case [(RCD and non-RCD)], the capability, status, and
control fields in Device 0, Function 0 DVSEC control the CXL
functionality of the entire device.
"""

So dev 0, func 0 must contain a CXL PCIe DVSEC. Thus it is a CXL
device and able to handle CXL AER errors. The limitation to the first
device prevents the handler from being run multiple times for the same
event.


> 
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
> 
> Make this comment more specific (to RCH I think).

Right, same here, this is restricted mode only.

Thanks for review.

-Robert


> 
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
> 
