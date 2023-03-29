Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E0E6CF75A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 01:34:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn2vB6WVTz3fR4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 10:34:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QRVF0USK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::61f; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=QRVF0USK;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2061f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::61f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pmrqf74mNz3fsP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 03:00:27 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwuOYPcqsF1jq+r3Pv4xcn3T6uQ9Vfp+TGeZG7SEHb/qIAXV8gpzMD3NwUHCmCuYa39nEdBwQ1jhbfFg8/bRTnZuwIRDX10cy15gkETOOaHw6K4q6l++glQSPK8mf91B1EB6N5MtSaZqJDBRfftyvYsIk6VvM3lgorhBcKNG/lsIKBgFnK9Vv48+ghFdOkoBWSRX4DMRco2rtYaBt+S02AFwzYD3JOzAcMA6UM8FyvgBElDVl2J6TPKjBRmQ3a4NlORBzpG/qa+UxnmuThEB8q/691RtMSzGXGkHUjlcMAoK0kwicmiI1zQUdjHfMcmdcB91toluHejDE2ClaGqZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IzTMCj6XqJuPKvMAINOCQ6Dx1LWIB46PBhf6uZX1m4=;
 b=Z7d8xoTlzMivbiza1q8rQtStANmBErkzGAvpH7C7TS5JyvzPjM0tRb+GbgFhjMwU+Nl535SI4jm/Y7nOPJlKr4gi6YulB4E9o7BYYDS6g98NFAH5nyvPTmbS/JQAMlRUU2lh9X6slpROQu5ZdHomIDMPMUUPvTzAqq3Wc5wBZ2mcIdfJ/Un2iED5cQLQH9mS2gRy6eu05aDGRXppAIC1QZTnLjtEgdmvKO10Xo1FIkaFjdG8ALuv/MSIKt9bRk9YeuTm6GXC5nqU/YBs+KOIWOSNMAklvU/I4ExUIJ+JNQyTxSa5fMBJlaH+obCOQDloWM0CU7xGd3C/bJPYvnVbHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IzTMCj6XqJuPKvMAINOCQ6Dx1LWIB46PBhf6uZX1m4=;
 b=QRVF0USKCbfTCcsy/GwsU9OPp1H30yXsdMJ7g6r7DmAG3jTs3kWdcsq4U+gll/cuFuy+sgDA5Xe3K/H/DVAWmdtp+jVYyRPYFVhgzEtsVfeaZtUhtYHpbRvhU8qS1TDDRYcjrFFdL854b1UHxe3i0HGteKGUJpcLPTvbPBc/1co=
Received: from BN8PR15CA0057.namprd15.prod.outlook.com (2603:10b6:408:80::34)
 by DM4PR12MB5054.namprd12.prod.outlook.com (2603:10b6:5:389::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 16:00:06 +0000
Received: from BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::3c) by BN8PR15CA0057.outlook.office365.com
 (2603:10b6:408:80::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 16:00:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT112.mail.protection.outlook.com (10.13.176.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.22 via Frontend Transport; Wed, 29 Mar 2023 16:00:05 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 11:00:01 -0500
Date: Wed, 29 Mar 2023 17:59:58 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 4/5] cxl/pci: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZCRgfoXxsx8jHVCu@rric.localdomain>
References: <ZCIPuPM+LZsOFIIZ@rric.localdomain>
 <20230328172104.GA2897826@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230328172104.GA2897826@bhelgaas>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT112:EE_|DM4PR12MB5054:EE_
X-MS-Office365-Filtering-Correlation-Id: c10b1d08-6390-4885-a989-08db306ea9fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	68/dFVhbT5Pv0chLN0UC68ndbXEQLNDXKQHYhawaqMeBp0h9za3aEZB4KTVwsz4bymBbnfpMV3PsYn6Xjv+jrFF5gGy53ZLHqYS59+wLjMLyq4KZlK7fGovY84yvUKzQa4BHs+8yyYHR7ZvtlwzSNo/V/64hY4T5Y3/UsB3q4ySdZ94KL6XcADe8mOw+Pk0v/UazBRq08IT2eK1QQqr7rLdzVhleGlzoLKsoty/eA5zi58+pKI/HXOoeWU0hl9YmjoEnGTU8OF8BMdq4dEMGW/dkLJCD+7j94I295Vwr31obCYByTUwe/UfpP5BJf4FWJqyda7N/BOrEmTlKTfnF61iFVR/ReV58o3sL1D5uMGsmQkpLNvC0VOhh5S/RAK1k/2oXlltYCzxaTDvzCXrvhb2BsBKvvERAnvo1dQA8kz3ezUpL3KhxU5lvWvZyNqmR+8A/C6B+IvBTRCuCJJNI8hh3CPUIDr3BT6v8a5ihaJ/hwZWYG0VsXT+i6T6eaYfD75g1oY1qa2HQlQdZ0STqm6HNRdEYlReO88pR+cnzrhTuunvUg1qXJYWpH3rtb2dPlmLjzwgTvz54cHF83Pkp8+h3II22eVpmZ+QvNv0FYsguXFCTbu/aqwPgfethDjuZ8BQzM+eJKBJlegJlChJnh24UlpNbGwBDh0X54DORc4xO0uMOW5wJUhCHWmfMX5Bh7l7K2QMidNvt15wFsacXBFoo3311EROSN5uSWn8LCe0=
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(36840700001)(40470700004)(46966006)(2906002)(7416002)(8936002)(336012)(5660300002)(426003)(47076005)(82310400005)(36860700001)(356005)(55016003)(40480700001)(7696005)(82740400003)(966005)(40460700003)(81166007)(41300700001)(6916009)(4326008)(8676002)(83380400001)(70206006)(186003)(16526019)(54906003)(316002)(70586007)(26005)(9686003)(53546011)(6666004)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 16:00:05.9032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c10b1d08-6390-4885-a989-08db306ea9fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT112.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5054
X-Mailman-Approved-At: Thu, 30 Mar 2023 10:33:05 +1100
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

On 28.03.23 12:21:04, Bjorn Helgaas wrote:
> [+cc linux-pci, more error handling folks; beginning of thread at
> https://lore.kernel.org/all/20230323213808.398039-1-terry.bowman@amd.com/]
> 
> On Mon, Mar 27, 2023 at 11:51:39PM +0200, Robert Richter wrote:
> > On 24.03.23 17:36:56, Bjorn Helgaas wrote:
> 
> > > > The CXL device driver is then responsible to
> > > > enable error reporting in the RCEC's AER cap
> > > 
> > > I don't know exactly what you mean by "error reporting in the RCEC's
> > > AER cap", but IIUC, for non-Root Port devices, generation of ERR_COR/
> > > ERR_NONFATAL/ERR_FATAL messages is controlled by the Device Control
> > > register and should already be enabled by pci_aer_init().
> > > 
> > > Maybe you mean setting AER mask/severity specifically for Internal
> > > Errors?  I'm hoping to get as much of AER management as we can in the
> > 
> > Richt, this is implemented in patch #5 in function
> > rcec_enable_aer_ints().
> 
> I think we should add a PCI core interface for this so we can enforce
> the AER ownership question (all the crud like pcie_aer_is_native()) in
> one place.

Do you mean, code around functions rcec_enable_aer_ints() should be
moved to aer.c and the cxl handler then just assumes it is enabled
already? That looks feasible.

> 
> > > PCI core and out of drivers, so maybe we need a new PCI interface to
> > > do that.
> > > 
> > > In any event, I assume this sort of configuration would be an
> > > enumeration-time thing, while *this* patch is a run-time thing, so
> > > maybe this information belongs with a different patch?
> > 
> > Do you mean once a Restricted CXL host (RCH) is detected, the internal
> > errors should be enabled in the device mask, all this done during
> > device enumeration? But wouldn't interrupts being enabled then before
> > the CXL device is ready?
> 
> I'm not sure what you mean by "before the CXL device is ready."  What
> makes a CXL device ready, and how do we know when it is ready?

The cxl_pci driver must be bound to a device which then further
creates a CXL mem dev. With that binding we can determine the
connected CXL dports from the cxl endpoints (which are seen as PCIe
endpoints) to inspect the CXL RAS caps (in the CXL component reg
space) and the PCIe AER caps (in the RCRB of the dport).

> 
> pci_aer_init() turns on PCI_EXP_DEVCTL_CERE, PCI_EXP_DEVCTL_FERE, etc
> as soon as we enumerate the device, before any driver claims the
> device.  I'm wondering whether we can do this PCI_ERR_COR_INTERNAL and
> PCI_ERR_UNC_INTN fiddling around the same time?

Yes, if the CXL device is not yet bound, there is no handler attached
and AER errors are only handled on a PCI level. Though, we need to
make sure the status is cleared.

> 
> > > I haven't worked all the way through this, but I thought Sean Kelley's
> > > and Qiuxu Zhuo's work was along the same line and might cover this,
> > > e.g.,
> > > 
> > >   a175102b0a82 ("PCI/ERR: Recover from RCEC AER errors")
> > >   579086225502 ("PCI/ERR: Recover from RCiEP AER errors")
> > >   af113553d961 ("PCI/AER: Add pcie_walk_rcec() to RCEC AER handling")
> > > 
> > > But I guess maybe it's not quite the same case?
> > 
> > Actually, we use this code to handle errors that are reported to the
> > RCEC and only implement here the CXL specifics. That is, checking if
> > the RCEC receives something from a CXL downstream port and forwarding
> > that to a CXL handler (this patch). The handler then checks the AER
> > err cap in the RCRB of all CXL downstream ports associated to the RCEC
> > (not visible in the PCI hierarchy), but discovered through the :00.0
> > RCiEP (patch #5).
> 
> There are two calls to pcie_walk_rcec():
> 
>   1) The existing one in find_source_device()
>   2) The one you add in handle_cxl_error()
> 
> Does the call in handle_cxl_error() look at devices that the existing
> call in find_source_device() does not?  I'm trying to understand why
> we need both calls.

In case of a dport error, e_info will only contain the RCEC's id after
running find_source_device(). Thus, only the RCEC's handler would be
called. The portdrv is already bound to the device and currently
doesn't have a handler attached.

As described, due to cross dependencies between cxl and the portdrv,
instead of implementing a handler in the portdrv, we decided to
forward errors to the CXL endpoint driver and handle it there. So now,
in handle_cxl_error(), we check if the error source is an RCEC
attached to a CXL bus and we forward everything directly to the CXL
endpoint handler. pcie_walk_rcec() is used for that.

> 
> > > > +static bool is_internal_error(struct aer_err_info *info)
> > > > +{
> > > > +	if (info->severity == AER_CORRECTABLE)
> > > > +		return info->status & PCI_ERR_COR_INTERNAL;
> > > > +
> > > > +	return info->status & PCI_ERR_UNC_INTN;
> > > > +}
> > > > +
> > > > +static void handle_cxl_error(struct pci_dev *dev, struct aer_err_info *info)
> > > > +{
> > > > +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> > > > +	    is_internal_error(info))
> > > 
> > > What's unique about Internal Errors?  I'm trying to figure out why you
> > > wouldn't do this for *all* CXL errors.
> > 
> > Per CXL specification downstream port errors are signaled using
> > internal errors. 
> 
> Maybe a spec reference here to explain is_internal_error()?  Is the
> point of the check to *exclude* non-internal errors?  Or is basically
> documentation that there shouldn't ever *be* any non-internal errors?
> I guess the latter wouldn't make sense because at this point we don't
> know whether this is a CXL hierarchy.

It is described in CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected
Errors.

We do not handle errors other than internal ones, this is what the
check is for. In theory, an RCEC could also throw other kind of
errors. But, as per spec, once internal error are received from the
RCEC, the CXL dports need to be inspected.

> 
> > All other errors would be device specific, we cannot
> > handle that in a generic CXL driver.
> 
> I'm missing the point here.  We don't have any device-specific error
> handling in aer.c; it only connects the generic *reporting* mechanism
> (AER log registers and Root Port interrupts) to the drivers that do
> the device-specific things via err_handler hooks.  I assume we want a
> similar model for CXL.

With device specific I mean implementation defined and not described
in a specification. The CXL handler is sort of generic as it is
(solely) implementing the CXL spec. Hope that makes sense.

Thanks,

-Robert

