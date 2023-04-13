Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A076E0EFB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 15:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py10816GJz3fWm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:39:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PeECwd9+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::619; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=PeECwd9+;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py0z61s9hz3fHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 23:38:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZGMTJweU0b/zM6CpUf/dF9KQiFWOerWcMYnHGz0g1LwGvs43cIo0s2KTNHKKA7bQLQvO8kbQ9wenz/Efc6nnMzrxfwqu4vK59tWKp7tj1zOQEbxattjUceXGvyFw+/fdH2n4YRY0kf15PESw5OggmeLyGyYNblHQTfR0TkEt9768nl2wLG1hqRNOyonRWUsPdX8JylQOtun3YJ+xge/j3Tau4v02EObeURGFnNg+qw/s0TKwM0/X35yGL8KYvWl6ZP7IzRCiPjOfpdko9GAJfqH63lEYN2GaaPBzZF9GuRUZsA2sqIwoTzZm9qXiXvc/yWeDAu4l+vME6hJZC4uMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB2lY+EppsWBuvXz0Ez1gJIr+PQsYM4F9O30TRgLBI0=;
 b=njp7k6C9H0qUO3aDBKlXd+8WwmuaEW55jLBqQQPOgy9NjZLqaiCWXcA1NKuUMRa6brSiaR302V9pNw17JAyNjWDx7albO/2/cebN0ine6zXFTN4PB61UYDsesIzKiwdxw+t33lcA2nCcQ99/6MSD3AzNO8Prdeq9Sdkv2Rtct1M8acDhHQEj8H3ys0zWSVE7w0GQ9/srkn2jyK5YYq//gpojsy0nF+QTWXM+DbxFrDBdr+GNTvq5SvxOlizWP2PEmjzuWiQrz89tNeR3FUiRA+p4ebd8sGe1EfnNsBluuA/oonshfdCFxZd4nYlmAwjzDbwvrrfdWurhjv8QOSGcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB2lY+EppsWBuvXz0Ez1gJIr+PQsYM4F9O30TRgLBI0=;
 b=PeECwd9+FAqu4pxQc0S89rod8ZNK0PZZLN/htkzDYlvQHrLz8hp1LQZIxtTxMQ/77CQdEs/1N6Oyexog7NSULsluh4JeAb8fFCLxpA1tHDAOaGEN/sVyqFt47akfAWbu+fXhBdATkq9QK2utO4zYRatruZ0T5tlLdX5s8vk95rc=
Received: from BN0PR07CA0017.namprd07.prod.outlook.com (2603:10b6:408:141::31)
 by MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Thu, 13 Apr
 2023 13:38:19 +0000
Received: from BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::1a) by BN0PR07CA0017.outlook.office365.com
 (2603:10b6:408:141::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 13:38:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT068.mail.protection.outlook.com (10.13.177.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 13:38:18 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 13 Apr
 2023 08:38:15 -0500
Date: Thu, 13 Apr 2023 15:38:07 +0200
From: Robert Richter <rrichter@amd.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <ZDgFv6AtCXkVl8IQ@rric.localdomain>
References: <20230411180302.2678736-7-terry.bowman@amd.com>
 <20230412212901.GA81099@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230412212901.GA81099@bhelgaas>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT068:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 971ff201-8f5a-48cf-6aeb-08db3c24579f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iAWb5Cu2UNvAF5W8dnwnlhFE7BxU9byyUrvyMd3iiMW+okY7vNV9AlvYIAX7Tb+CwtJ7UgCQJpGj5SNlkZ7wWX9RfIRphNraBGkHQ9sbDj2qBHmy1FXNVWjEBjU80PRhxCpR00BjWwtQ4CrOiCyMTQGNAxLyf/KAzJ+Tu2C+s+Aq5Ae6ueXhkIkNTBZz3ucL+MgU9wPXDwIxc0AANpMGiUkylq4CCQSQZ3e+fGTHBEs8Z49HgouOyF2GCyPwRXofB8OE4mprpmcAl7b7N6gXOZt42QGOsAvcPJnFfwSdau74Wt/PT9fJtgee10bBD7ZNnfKJhFcHJ40fmZzUiw4mfdExhhCcGKKnzly4Fcp5VCJ/pK+/JjYxubBxrA8qkGjccpCI90K0PLcNbPfKJI5jKleKXD2Fa5KehDcscFsls98bTvFfOA19wBn6no+nxjsVFumnuRJ+NR8cz84fQMd7XFhCbp4twHSvwDUHkD7UqxWw6OaSDRhftb7OZ3VIkXOyAqIM4kIlcaKRR1R+DEUKATPPsavoI49qkq34/kqPEjLa6l7UOn8s9Lo26e+vjT2PFiXvmw6kiQ/GJMwh+1nURGR3EOsjK9JlWq/hbOWwMJKhiIrWZLS/tp3JCbqwHALD9JdisXCZ9b2qcJ2UqGS6N/oubjJ9Sb3kzC3CcWgp5+IfOoSxiXzOUmGKfUoFVQi+WvXupDP8L5M+ZJLJMPxX3GNZjYAiBEzUA/liN6+lZW24doVTSfocz/b4QR2EbWwG1USN3F1GTAdL7wWGJFjiVg==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199021)(46966006)(36840700001)(40470700004)(8676002)(5660300002)(8936002)(55016003)(316002)(478600001)(7696005)(40480700001)(54906003)(7416002)(2906002)(6666004)(40460700003)(336012)(4326008)(6916009)(426003)(83380400001)(36860700001)(70586007)(26005)(70206006)(81166007)(186003)(53546011)(41300700001)(16526019)(47076005)(9686003)(356005)(82740400003)(82310400005)(36900700001)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 13:38:18.9143
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 971ff201-8f5a-48cf-6aeb-08db3c24579f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT068.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
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

On 12.04.23 16:29:01, Bjorn Helgaas wrote:
> On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:
> > From: Robert Richter <rrichter@amd.com>
> > 
> > RCEC AER corrected and uncorrectable internal errors (CIE/UIE) are
> > disabled by default.
> 
> "Disabled by default" just means "the power-up state of CIE/UIC is
> that they are masked", right?  It doesn't mean that Linux normally
> masks them.

Yes, will change the wording here.

> > [1][2] Enable them to receive CXL downstream port
> > errors of a Restricted CXL Host (RCH).
> > 
> > [1] CXL 3.0 Spec, 12.2.1.1 - RCH Downstream Port Detected Errors
> > [2] PCIe Base Spec 6.0, 7.8.4.3 Uncorrectable Error Mask Register,
> >     7.8.4.6 Correctable Error Mask Register
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
> >  drivers/pci/pcie/aer.c | 73 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 73 insertions(+)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 171a08fd8ebd..3973c731e11d 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -1000,7 +1000,79 @@ static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> >  		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
> >  }
> >  
> > +static bool cxl_error_is_native(struct pci_dev *dev)
> > +{
> > +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> > +
> > +	if (pcie_ports_native)
> > +		return true;
> > +
> > +	return host->native_aer && host->native_cxl_error;
> > +}
> > +
> > +static int handles_cxl_error_iter(struct pci_dev *dev, void *data)
> > +{
> > +	int *handles_cxl = data;
> > +
> > +	*handles_cxl = is_cxl_mem_dev(dev) && cxl_error_is_native(dev);
> > +
> > +	return *handles_cxl;
> > +}
> > +
> > +static bool handles_cxl_errors(struct pci_dev *rcec)
> > +{
> > +	int handles_cxl = 0;
> > +
> > +	if (!rcec->aer_cap)
> > +		return false;
> > +
> > +	if (pci_pcie_type(rcec) == PCI_EXP_TYPE_RC_EC)
> > +		pcie_walk_rcec(rcec, handles_cxl_error_iter, &handles_cxl);
> > +
> > +	return !!handles_cxl;
> > +}
> > +
> > +static int __cxl_unmask_internal_errors(struct pci_dev *rcec)
> > +{
> > +	int aer, rc;
> > +	u32 mask;
> > +
> > +	/*
> > +	 * Internal errors are masked by default, unmask RCEC's here
> > +	 * PCI6.0 7.8.4.3 Uncorrectable Error Mask Register (Offset 08h)
> > +	 * PCI6.0 7.8.4.6 Correctable Error Mask Register (Offset 14h)
> > +	 */
> 
> Unmasking internal errors doesn't have anything specific to do with
> CXL, so I don't think it should have "cxl" in the function name.
> Maybe something like "pci_aer_unmask_internal_errors()".

Since it is static I renamed it to aer_unmask_internal_errors() and
also moved it to the beginning of the #ifdef block for easier later
reuse.

> 
> This also has nothing special to do with RCECs, so I think we should
> refer to the device as "dev" as is typical in this file.

Changed.

> 
> I think this needs to check pcie_aer_is_native() as is done by
> pci_aer_clear_nonfatal_status() and other functions that write the AER
> Capability.

Also added the check to aer_unmask_internal_errors(). There was a
check for native_* in handles_cxl_errors() already, but only for the
pci devs of the RCEC. I added a check of the RCEC there too.

> 
> With the exception of this function, this patch looks like all CXL
> code that maybe could be with other CXL code.  Would require making
> pcie_walk_rcec() available outside drivers/pci, I guess.

Even this is CXL code, it implements AER support and fits better here
around AER code. Export of pcie_walk_rcec() (and others?) is not the
main issue here. CXL drivers can come as modules and would need to
register a hook at the aer handler.  This would add even more
complexity here. In contrast, current solution just adds two functions
for enablement and handling which are empty stubs if code is disabled.

I could move that code to aer_cxl.c similar to aer_inject.c. Since the
CXL part is small compared to the remaining aer code I left it in
aer.c. Also, it is guarded by #ifdef which additionally encapsulates
it.

> 
> > +	aer = rcec->aer_cap;
> > +	rc = pci_read_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, &mask);
> > +	if (rc)
> > +		return rc;
> > +	mask &= ~PCI_ERR_UNC_INTN;
> > +	rc = pci_write_config_dword(rcec, aer + PCI_ERR_UNCOR_MASK, mask);
> > +	if (rc)
> > +		return rc;
> > +
> > +	rc = pci_read_config_dword(rcec, aer + PCI_ERR_COR_MASK, &mask);
> > +	if (rc)
> > +		return rc;
> > +	mask &= ~PCI_ERR_COR_INTERNAL;
> > +	rc = pci_write_config_dword(rcec, aer + PCI_ERR_COR_MASK, mask);
> > +
> > +	return rc;
> > +}
> > +
> > +static void cxl_unmask_internal_errors(struct pci_dev *rcec)

Also renaming this to cxl_enable_rcec() to more generalize the
function.

> > +{
> > +	if (!handles_cxl_errors(rcec))
> > +		return;
> > +
> > +	if (__cxl_unmask_internal_errors(rcec))
> > +		dev_err(&rcec->dev, "cxl: Failed to unmask internal errors");
> > +	else
> > +		dev_dbg(&rcec->dev, "cxl: Internal errors unmasked");

I am going to change this to a pci_info() for alignment with other
messages around:

[   14.200265] pcieport 0000:40:00.3: PME: Signaling with IRQ 44
[   14.213925] pcieport 0000:40:00.3: AER: cxl: Internal errors unmasked
[   14.228413] pcieport 0000:40:00.3: AER: enabled with IRQ 44

Plus, using pci_err() instead of dev_err().

> > +}
> > +
> >  #else
> > +static inline void cxl_unmask_internal_errors(struct pci_dev *dev) { }
> >  static inline void cxl_handle_error(struct pci_dev *dev,
> >  				    struct aer_err_info *info) { }
> >  #endif
> > @@ -1397,6 +1469,7 @@ static int aer_probe(struct pcie_device *dev)
> >  		return status;
> >  	}
> >  
> > +	cxl_unmask_internal_errors(port);
> >  	aer_enable_rootport(rpc);
> >  	pci_info(port, "enabled with IRQ %d\n", dev->irq);
> >  	return 0;
> > -- 
> > 2.34.1
> > 

Thanks for review,

-Robert
