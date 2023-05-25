Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3794711A2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 00:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QS2mN4GHlz3fGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 08:29:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xW201YYM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xW201YYM;
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QS2lV6Fl5z3bsS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 08:28:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D8yrN1EaQyCXTGolvCtrsxM4uGR7m3UCO/PKaoMKeuCMRR2YpkaFsKdhkgeultyZWr//7yC7jDEvg/YNUA3SxhZ7uUe0gLV+ChLMmDJyT1Va9CEMyxWxuPXW4KCQ8uOcqL3ycFYz0iSwzWS9HH/xJMj7EjilrKNFn8gIWyTM1+KHbwzqHZYWkLFhcVf4ghODXbBm+7HUt3gZ7wAKlMnBuMqgm3MGMMCnP7wVDHzWwPSchaKfQY9W15nUh6YtdLy+xoX87KWpDQL4dBjqdA4mgyDq4dPujb4ZLBJIFTAPqWQ9xLhwcyHz8rEzkNDh1aD9k+H1MR6ZTY+zpB0Ezw559A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FF/Ye6RWxvPnpimLd36vOyyLA5FHmU4aXZwbzPI+/u4=;
 b=Sk3CptWiN++cl95q1MwwEb5N2NeYDAewXZCg1RuO50B0ujkYYQHFiafCUIhtkS3+jSzJgljy1ZgXIk9tCCCZPsDDVq4BGYGV68BQGP9I/gv8vesWbBs0Hy5rGtmJnzWTm7z5faRZd9o/7akJQkfmzEHCd3y10I5skLJ2Rw2gN+jaRfOgDKBUMjrWMoU3modBmo11tR+fb5gxB9zvBBSV+tWZIrEVpuURt901w/Kh5vZDbHQcNCOCgnM9HOHBAGuN5weNLXSPqHVpoypUMVChxLMJwabRhWxtmrJAcHli12Xh7Cn2ulJN/TbEn+EzTg1y07POkppnI9Qm4032OpmXKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF/Ye6RWxvPnpimLd36vOyyLA5FHmU4aXZwbzPI+/u4=;
 b=xW201YYM2MpLPdcofgACFbTVQBnWyexwTyrPZjtRrdg9xW5qEw++wb3rP151CxuUrhej1uA58Caf6T7/XkRg4VTTJ8izfHOMXrs5/B1eDX9b8UoRuKKe4TrYYUio8gQ6hQayFGETGtK4MIOP1wNXflrEsyzgG+2DLXgH+QWmGPo=
Received: from MW4P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::23)
 by IA1PR12MB6043.namprd12.prod.outlook.com (2603:10b6:208:3d5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 22:28:30 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:80:cafe::8d) by MW4P223CA0018.outlook.office365.com
 (2603:10b6:303:80::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17 via Frontend
 Transport; Thu, 25 May 2023 22:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.17 via Frontend Transport; Thu, 25 May 2023 22:28:29 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 17:28:26 -0500
Date: Fri, 26 May 2023 00:28:23 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v4 22/23] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZG/hB8cOuTkWT3g9@rric.localdomain>
References: <ZG/TKOgMTSljryHN@rric.localdomain>
 <ZG/anZ78FukSpERs@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZG/anZ78FukSpERs@bhelgaas>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|IA1PR12MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a047ada-2b65-4c22-4cd5-08db5d6f5dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dFWcjiSOb7AMofT4cGIHRdJhsPkMG9nn9TBWyfeBKOS+F+/ebnyLOBR7WctkpoRN4DgZePTTU3kZR6Da8J2NnZs3fmnKObsuAgW1bl80uwaQwPpXLv9721d9vqCzjHo7f7lQ3QLAmXrhAD5E0EjL5DlDuOkM0flgkkC3sxWdtumJWCdqjJM3oTI8zw96wWuG1higsH+zFHstwXJIIquvku6EU6L+iYb/ylC9WRU02WlU6nbT5+G+1aGaroJGU5VXTzs1AL52Vy7OJk1ooD6xe6dLyu+xLYfUbfFV0Fq38GkqTuC1kteq4MoDzy+RlkM704S6yuv1pzI8z5HxkvUC6nGuFqH50aT4pO+PgXl6MDGmSA/SB3FuJAKhjHAnBSNfbrO7oqq7NI2J2w7kCr/cBojkHHfyVR6UTBroVoHCfFST5TWZuj4CUikIo4k3/LnZ60Xj8gyyTFbLhRfuKAF7kWO4tE19+r14qGPNRE72Mm/7IMwly3YfFPjLaxtk4CeeXlMZv0R4+/DB/mYQ0JD23JSKyrChrFlKnKWrD1utxiBQEhC/4cAFGUfWUMMOxQ5StyPs6H8qXu+acD/jNUUuYcDo/BsvMXuWT7zYKrqhLZJDa0lQr0UcT3zTGnkdXyYhhT/QVus957zyPDNx6+NfzYhakXTi+iCbFqK5SEd9ldId34Z7jygw0Z3ZcP6hR3w8xJDjC5hdipKl0EGNZoRq+o11BJTU2C6j0ppSoHhBd3HSo8gHsP20cyW72vonMCjCQSMRLkTo+zu4ZTsn0Se17g==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(6666004)(82740400003)(356005)(4326008)(6916009)(70206006)(81166007)(70586007)(478600001)(54906003)(316002)(7696005)(41300700001)(82310400005)(40460700003)(8936002)(5660300002)(8676002)(7416002)(40480700001)(55016003)(36860700001)(26005)(9686003)(53546011)(426003)(336012)(2906002)(186003)(16526019)(47076005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 22:28:29.7091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a047ada-2b65-4c22-4cd5-08db5d6f5dbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6043
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, ira.weiny@intel.com, Terry Bowman <terry.bowman@amd.com>, linux-pci@vger.kernel.org, Jonathan.Cameron@huawei.com, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, bwidawsk@kernel.org, Oliver O'Halloran <oohall@gmail.com>, vishal.l.verma@intel.com, bhelgaas@google.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25.05.23 17:01:01, Bjorn Helgaas wrote:
> On Thu, May 25, 2023 at 11:29:58PM +0200, Robert Richter wrote:
> > eOn 24.05.23 16:32:35, Bjorn Helgaas wrote:
> > > On Tue, May 23, 2023 at 06:22:13PM -0500, Terry Bowman wrote:
> > > > From: Robert Richter <rrichter@amd.com>
> > > > 
> > > > In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> > > > RCiEP, but CXL downstream and upstream ports are not enumerated and
> > > > not visible in the PCIe hierarchy. Protocol and link errors are sent
> > > > to an RCEC.
> > > >
> > > > Restricted CXL host (RCH) downstream port-detected errors are signaled
> > > > as internal AER errors, either Uncorrectable Internal Error (UIE) or
> > > > Corrected Internal Errors (CIE). 
> > > 
> > > From the parallelism with RCD above, I first thought that RCH devices
> > > were non-RCD mode and *were* enumerated as part of the PCIe hierarchy,
> > > but actually I suspect it's more like the following?
> > > 
> > >   ... but CXL downstream and upstream ports are not enumerated and not
> > >   visible in the PCIe hierarchy.
> > > 
> > >   Protocol and link errors from these non-enumerated ports are
> > >   signaled as internal AER errors ... via a CXL RCEC.
> > 
> > Exactly, except the RCEC is standard PCIe and also must not
> > necessarily on the same PCI bus as the CXL RCiEPs are.
> 
> So make it "RCEC" instead of "CXL RCEC", I guess?  PCIe r6.0, sec
> 7.9.10.3, allows an RCEC to be associated with RCiEPs on different
> buses, so nothing to see there.

Yes, nothing special. This makes it more difficult to check if the
RCEC has CXL devices connected, but still it is feasible.

> 
> > > > The error source is the id of the RCEC.
> > > 
> > > This seems odd; I assume this refers to the RCEC's AER Error Source
> > > Identification register, and the ERR_COR or ERR_FATAL/NONFATAL Source
> > > Identification would ordinarily be the Requester ID of the RCiEP that
> > > "sent" the Error Message.  But you're saying it's actually the ID of
> > > the *RCEC*, not the RCiEP?
> > 
> > Right, the downstream port has its own AER ext capability in
> > non-config (io mapped) RCRB register range. Errors originating from
> > there are signaled as internal AER errors via the RCEC *with* the
> > RCEC's Requester ID. Code walks through all associated CXL endpoints,
> > determines the dport and checks its AER.
> > 
> > There is also an RDPAS structure defined in CXL but that is only a
> > different way to provide the RCEC to dport association instead of
> > using the RCEC's Endpoint Association Extended Capability. In the end
> > we get all associated RCHs and check the AER of all their dports.
> > 
> > The upstream port is signaled using the RCiEP's AER. CXL spec is
> > strict here: "Upstream Port RCRB shall not implement the AER Extended
> > Capability." The RCiEP's requestor ID is used then and its config
> > space the AER is in.
> > 
> > CXL.cachemem errors are reported with the RCiEP as requester
> > too. Status is in the CXL RAS cap and the UIE or CIE is set
> > respectively in the AER status of the RCiEP.
> >
> > > We're going to call pci_aer_handle_error() as well, to handle the
> > > non-internal errors, and I'm pretty sure that path expects the RCiEP
> > > ID there.
> > > 
> > > Whatever the answer, I'm not sure this sentence is actually relevant
> > > to this patch, since this patch doesn't read PCI_ERR_ROOT_ERR_SRC or
> > > look at struct aer_err_source.id.
> > 
> > The source id is used in aer_process_err_devices() which finally calls
> > handle_error_source() for the device with the requestor id. This is
> > the place where cxl_rch_handle_error() checks if it is an RCEC that
> > received an internal error and has cxl devices connected to it. Then,
> > the request is forwarded to the cxl_mem handler which also needs to
> > check the dport now. That is, pcie_walk_rcec() in
> > cxl_rch_handle_error() is called with the RCEC's pci handle,
> > cxl_rch_handle_error_iter() with the RCiEP's pci handle.
> 
> I'm still not sure this is relevant.  Isn't that last sentence just
> the way we always use pcie_walk_rcec()?
> 
> If there's something *different* here about CXL, and it's important to
> this patch, sure.  But I don't see that yet.  Maybe a comment in the
> code if you think it's important to clarify something there.

The importance I see is that internal errors of an RCEC indicate an
AER error in an RCH's downstream port. Thus, once that happens, all
involved dports must be checked. Internal errors are typically
non-standard and implementation defined, but here it is CXL standard.

-Robert
