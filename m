Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E756E51F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 22:37:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0f4j5bzpz3fLT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 06:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yVrgBT3x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7e88::60d; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=robert.richter@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yVrgBT3x;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0f3p1zQ2z3c7l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 06:36:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JS28PVnp961N/HpmBp0Q194FLof3VlXlgKBRb/h5Qzv5LIW7ONT0n6eQBBV8HMTdSddv+z/Y5FUQyPP+QeGO1mdUvyeJt6kp7FcK8Dr56ej2HeLP4LVtYa2qfh2fnRfmzbkjkOnRk280PszWtaadW8QHcaczYJTCZucmErvubpLuzAgEbkHFz8MvI1GzZ7h7CELWHXt3L9GIJZo+w54pedFDontPrK60xwKMcLmE2KdDTE7lLrwI273UkOjdeE5vwdWjWkSOM8KvxO4cbOk/vv3J0ld/T+6biBKYfoiZJQUj89wkRU3OXiiPr31z17xv5F65opcato41w32Ny3rTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwbzdqeGM8mPlbye6W3zxBHnZMfZTFXqSe3qlQnQ1mk=;
 b=Tzv6RpkN4HhO5pqUq+UNFY30Cxy2Maam/rrOstOVyC/KPaYn6oIMTuGXdkk7xTl1szvs4fBw5KTp3t6sFuWLw6lkClLuqJQBcpXZU68q/kp5Bdi9ifFqWHiBCUjAVag0U+vSm+r0Orbjy6KWmR50yoFW4eWRlTN1rbfvug/vgJmAl22ro5OiEYkH9YY/dfT5LRcyE4G2qJQbg7ZQAnf12BvDVZFufGfeHtJTyxizwJCLILccQyqnk4DPFF97yVMiTcy4BI/9GQ9kcpI1915PQtbOnf38+2Ym2/sSTVfFv/FWJWD6bMwUcqJg0HWUafIWiXTsWgjMN2gdMLknAgNsQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=huawei.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwbzdqeGM8mPlbye6W3zxBHnZMfZTFXqSe3qlQnQ1mk=;
 b=yVrgBT3xrK38C6KS4HZnwttPZg91HyxLC+QHpUjIh3PIU6qOMChlru+CmZWsSpEMxWKUmVye+3Uvkh/nBhUUIdD7o14bqgJbzxRZAKdAtkBJcnSZsWzNW1UeTBBDxyzbU9TeafqjCKZX0uEj1wIo9s2AH5OXjaaes7uHoAtqeAc=
Received: from DS7PR03CA0029.namprd03.prod.outlook.com (2603:10b6:5:3b8::34)
 by BL1PR12MB5272.namprd12.prod.outlook.com (2603:10b6:208:319::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 20:36:25 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b8:cafe::40) by DS7PR03CA0029.outlook.office365.com
 (2603:10b6:5:3b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 20:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Mon, 17 Apr 2023 20:36:24 +0000
Received: from rric.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 15:36:21 -0500
Date: Mon, 17 Apr 2023 22:36:18 +0200
From: Robert Richter <rrichter@amd.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v3 5/6] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <ZD2tY8VqjY9kB+y6@rric.localdomain>
References: <20230411180302.2678736-1-terry.bowman@amd.com>
 <20230411180302.2678736-6-terry.bowman@amd.com>
 <20230414131950.00006e76@Huawei.com>
 <ZDlkmcsbwsNv/t8+@rric.localdomain>
 <20230417175431.00004ab5@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230417175431.00004ab5@Huawei.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|BL1PR12MB5272:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f77158-f62b-4565-5d1f-08db3f8369ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	oHn1ftwkuRyeA9H+LnUrz5rirzW73iLZXj1/n3OHmZ73IRK3z0Ju5g8s34CNPita5SCEDgyl6GYF7ztZPtaM98xjwh4WUeC9F2PH50krN3HYiHplgeHwJOLM0XpYQNPrH2tN2gahUE9Q+WT8WOTNm/N2AwZzQ3/HwkiqFD1CdWdsOFIzcWP67JWANDAa7FL6U54dh5Cr6smXEWWhgymCKUomlNIAYVekeIjdWm4s4kfvb3WPoPwVo84w70aLVt3a5w3zE0iLkxmprHmCnP/DkEzpx9J0iiAPKUb5mYJqzouylN43LPncZq/gtskaRlvCj7tiC3ZiW4lhvTVaZzLrMi5Wvr+0esGczmLVuM7jmwJVAvhhHB2qepMEbBk5ALEgPzYiGf/WomB9Wr0YZN5uLV27cZTr9Jlbmfg4lwASbMazp+a5x7IU/sMDf33O9dzuWT/JU8ubedIYkbvl2I6yrU50SMTsGgQzTN8DuZtmfLDO3zBFVnVfYa71noLbM6X5Er36VmDmpP9FPBY7x2nLLu5y/YyQ11lViyllYBzMtIl2A5zQizm/TO/9m2xE5BbN69/udLDA3zGyIy6EoKXDP8jm/A7p1U569FJLDRlKftwip7y5ELdK7X2CTlfNVh/z9weTpUPE9wYX73T70nQA6Gjh/iPLgmAxTahDM3O8duFEBAnyOdd+6Dnm5h23V8m8BSyhsjfn94ERyu/9EHlST/IXgTWpw31wViyME/PMpMIzNoqLlqi3+13x4vOohta9SijVJX6P9c7d1t8aiir/1Q==
X-Forefront-Antispam-Report: 	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(46966006)(40470700004)(36840700001)(54906003)(55016003)(40480700001)(6666004)(478600001)(7696005)(70586007)(81166007)(316002)(83380400001)(356005)(41300700001)(82740400003)(6916009)(426003)(336012)(4326008)(47076005)(36860700001)(186003)(16526019)(26005)(53546011)(9686003)(70206006)(5660300002)(7416002)(2906002)(8936002)(8676002)(40460700003)(82310400005)(67856001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 20:36:24.9362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f77158-f62b-4565-5d1f-08db3f8369ba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5272
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

Hi Jonathan,

On 17.04.23 17:54:31, Jonathan Cameron wrote:
> On Fri, 14 Apr 2023 16:35:05 +0200
> Robert Richter <rrichter@amd.com> wrote:
> 
> > On 14.04.23 13:19:50, Jonathan Cameron wrote:
> > > On Tue, 11 Apr 2023 13:03:01 -0500
> > > Terry Bowman <terry.bowman@amd.com> wrote:
> > >   
> > > > From: Robert Richter <rrichter@amd.com>
> > > > 
> > > > In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> > > > RCiEP, but CXL downstream and upstream ports are not enumerated and
> > > > not visible in the PCIe hierarchy. Protocol and link errors are sent
> > > > to an RCEC.
> > > > 
> > > > Restricted CXL host (RCH) downstream port-detected errors are signaled
> > > > as internal AER errors, either Uncorrectable Internal Error (UIE) or
> > > > Corrected Internal Errors (CIE). The error source is the id of the
> > > > RCEC. A CXL handler must then inspect the error status in various CXL
> > > > registers residing in the dport's component register space (CXL RAS
> > > > cap) or the dport's RCRB (AER ext cap). [1]
> > > > 
> > > > Errors showing up in the RCEC's error handler must be handled and
> > > > connected to the CXL subsystem. Implement this by forwarding the error
> > > > to all CXL devices below the RCEC. Since the entire CXL device is
> > > > controlled only using PCIe Configuration Space of device 0, Function
> > > > 0, only pass it there [2]. These devices have the Memory Device class
> > > > code set (PCI_CLASS_MEMORY_CXL, 502h) and the existing cxl_pci driver
> > > > can implement the handler.  
> > > 
> > > This comment implies only class code compliant drivers.  Sure we don't
> > > have drivers for anything else yet, but we should try to avoid saying
> > > there won't be any (which I think above implies).
> > > 
> > > You have a comment in the code, but maybe relaxing the description above
> > > to "currently support devices have..."  
> > 
> > It is used here to identify CXL memory devices and limit the
> > enablement to those. The spec requires this to be set for CXL mem devs
> > (see cxl 3.0, 8.1.12.2).
> > 
> > There could be other CXL devices (e.g. cache), but other drivers are
> > not yet implemented. That is what I am referring to. The check makes
> > sure there is actually a driver with a handler for it (cxl_pci).
> 
> Understood on intent. My worry is that the above can be read as a
> statement on hardware restrictions, rathe than on what software currently
> implements.  Meh. Minor point so I don't care that much!
> Unlikely anyone will read the patch description after it merges anyway ;)

I have updated the description ...

> > > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > > index 7a25b62d9e01..171a08fd8ebd 100644
> > > > --- a/drivers/pci/pcie/aer.c
> > > > +++ b/drivers/pci/pcie/aer.c
> > > > @@ -946,6 +946,65 @@ static bool find_source_device(struct pci_dev *parent,
> > > >  	return true;
> > > >  }
> > > >  
> > > > +#ifdef CONFIG_PCIEAER_CXL
> > > > +
> > > > +static bool is_cxl_mem_dev(struct pci_dev *dev)
> > > > +{
> > > > +	/*
> > > > +	 * A CXL device is controlled only using PCIe Configuration
> > > > +	 * Space of device 0, Function 0.  
> > > 
> > > That's not true in general.   Definitely true that CXL protocol
> > > error reporting is controlled only using this Devfn, but
> > > more generally there could be other stuff in later functions.
> > > So perhaps make the comment more specific.  
> > 
> > I actually mean CXL device in RCD mode here (seen as RCiEP in the PCI
> > hierarchy).
> > 
> > The spec says (cxl 3.0, 8.1.3):
> > 
> > """
> > In either case [(RCD and non-RCD)], the capability, status, and
> > control fields in Device 0, Function 0 DVSEC control the CXL
> > functionality of the entire device.
> 
> > """
> > 
> > So dev 0, func 0 must contain a CXL PCIe DVSEC. Thus it is a CXL
> > device and able to handle CXL AER errors. The limitation to the first
> > device prevents the handler from being run multiple times for the same
> > event.
> 
> Fine with limitation.  Text says "device is controlled only using".
> That is true for what you are controlling here, but other aspects of the
> device are controlled via whatever interface they like.
> 
> Perhaps just quote the specification as you have done in your reply. Then it
> is clear that we mean just these registers.

... and comments.

Thanks,

-Robert
