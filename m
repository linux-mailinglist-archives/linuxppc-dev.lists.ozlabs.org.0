Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE36E17BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 00:53:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyFHW3rhBz3fTD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 08:53:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdwP9df0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IdwP9df0;
	dkim-atps=neutral
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PyFGc3Tqtz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 08:52:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681426376; x=1712962376;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=BRE/ClVAQ/w/h997vW5X0Gfrg2XOa7yQokIQACN6DZ8=;
  b=IdwP9df0ll92L+ALrlwvDlEcqlFB5rr/DNF9h67VUW379eYR1RS7ZSCD
   SdffwKZk5mKPKzzn/WGNgRWcEupN0V9Ema0iSZZ6/S3MBmDxQl5cF7i9U
   3wdt8qgl9Z0GOvS9P4d57wacf/fZeuYXOlR4rmxNhiSWtzynzvjb4K1Uy
   Eyi4Cq7Cm8TvsLHBTlyq6U9XZzH4aJZdk2qwyZHhOMQFhhqe0LKFIKqpj
   knO/nV+SQV5wGLnDyYQK8SfMAi9PHPTltwBPoXwF2YUYOTIdCDiqEXs7g
   xhVOsrp9Xl+6HWcPhCStgNPFq9QfG8yYcgaC4B9/ugKfWtzppP0Zb9z+l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="347036152"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="347036152"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 15:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="813639369"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="813639369"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 15:52:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 15:52:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 15:52:46 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 15:52:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DkYScwv9V7ln9EAhVMPsW4eFYmTBsfXMJRzvHEEGl5J+zPAu0OY2e/CVVEtsWHqTZ98/eADVyYQIjN7ggM6RQjbJ9uFwqMf0pu3SrO6sA2c1l1myxqiFxMGfPfJhD1pho0dTbSUF50J74MyPHPH7hgOghOdKo6mSsx0Uoe6vJyyiTijrP+7jwUyBAI7735OboELHcmOigqDEAuagzjcvev7CImNFz8nYD0Au6m2CgvS6lHuGAhFcJ87gcyMVz7Dkgxdjxif2zkzKmXFFh9o5nJy0Pjw9xemB1vab3Vl96OSB3EooPzN0FigOE4DbkPRrBZRa9WmHtjYuz7Ge2XixFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L7Q9qwU/6K5X0Mto+0oZG1VdBhYO/Sx/YbZKdveyYrE=;
 b=NsZ2VCCVjimYwIX9GR9ahrzxC4WcHqsF4DejKeDaGPXS2VldrGCMlCcZgCFJGPWFsHfrX9iHkQhRIAj4oeVp6jjMFFdUwoGVVBY168jG1aInWfvdORCbS6oMfGHYakMHgo2LIUMV3MI7rhoYedIPyV/LhTxrF2A5zzTuxcRxfIIhBbum52362TmG4YeXKHKu8G9dS2FA+B33TMiTMvK0kG6fUJmle8CrVFgaEYJmtEuei6Gby95bd4wls590hshSCmTLQk0pn3/MeitLtahz9gaeZ7/qu+pxaF8Zq88tn5m8MKORDPqmJbuWxZC1k7zuEify2sGmEail5sBb821L0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by IA1PR11MB6345.namprd11.prod.outlook.com (2603:10b6:208:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 22:52:41 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::4fe2:e207:596b:d145]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::4fe2:e207:596b:d145%5]) with mapi id 15.20.6298.028; Thu, 13 Apr 2023
 22:52:41 +0000
Date: Thu, 13 Apr 2023 15:52:36 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Helgaas
	<helgaas@kernel.org>
Subject: Re: [PATCH v3 6/6] PCI/AER: Unmask RCEC internal errors to enable
 RCH downstream port error handling
Message-ID: <643887b44b2d4_3a1882949d@iweiny-mobl.notmuch>
References: <20230411180302.2678736-7-terry.bowman@amd.com>
 <20230412212901.GA81099@bhelgaas>
 <20230413180122.00007471@Huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230413180122.00007471@Huawei.com>
X-ClientProxiedBy: SJ0PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::6) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|IA1PR11MB6345:EE_
X-MS-Office365-Filtering-Correlation-Id: 055190b3-132e-4432-9998-08db3c71c926
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLne1JHsqol01vjtGstF7bAvfa1Ako0oVVgY8gdNXoUnGBQf3ndWSvlkld3k24BoRAmtQ5Bf3i8CrLIU/l6e0IdQlGn9ABkvf0l+neis0iuChuduHLNxkIinZGOF0KA/YNxcIp8akQOc46YO6XhQrb29k21NGu0H0f4/OpQNu8Ran6BJQyrxvkSBjg4ulUPSePewoJuUufH/BhLKAeWrqXRLSQrYmFN4/1KLiqw1Y3pJr1+rB/eSuU4u+bO7DFErlcJrlvzmDHEelU02NHwixmrifEqcYnxmp7/C7XG7G5KdMdMSKONG1chQhf7Mk9mvuINcfbXKARjymLimCFoapIk3PGcHqOVcR4cv/ncTOWjva4OpTdoK9aLkghIOLfWPN8bP3ZN/miysub3bVwLsWjZxmNhkA7P9xCCjwYzZWL3NZ4SdI4Bd81NLainhr7zzTjKzD05PqjGC0XSzIy70AM5fD5xb4bx6xwmR9DFO5ySSZlby9AQ8Pl0FNe4TzFcp2BkjPJh3o82exWLgVFwlAd0fBYy/XNCPSSyCf9g+4KED6xWkPipmTrd5R6aqH/UL2+Lgc8iObrdR69Zh1ZMjMRm3O0cIjcDyL3mm4LzEQxnUAP4VDOy/vL/m54RtNYfAt1jEKsp9lUQzd79L0bXImw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199021)(9686003)(26005)(6512007)(6506007)(54906003)(186003)(66899021)(83380400001)(966005)(6486002)(6666004)(5660300002)(41300700001)(82960400001)(316002)(8676002)(8936002)(86362001)(38100700002)(478600001)(4326008)(66946007)(66476007)(66556008)(2906002)(7416002)(44832011)(110136005)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o53MbmW2rX3D9GllqCUtRKAWo+Pj8oiPGuPp9d5kAfcHtxZUTZLCIuNAVwHj?=
 =?us-ascii?Q?0tkYDvC9kzhyRMteeIXMrFDfWWUgwumYU4zAbotWyUVEPyOHbtXWbWTCKnJR?=
 =?us-ascii?Q?Rks1VDpSRM9pqVU9y+BIrdLXTOVlLILaAju2cvBj6OLOF6bg0KkCJFuA31Hv?=
 =?us-ascii?Q?wlSSylZNIWQpaBhtOyLbJjTn/uwb/8Ses8pdW3hFwi7nnxjC30Ed2Ev9d5fa?=
 =?us-ascii?Q?DE8OC3NFtRcWyr7JsNLdizE4EGWhKNDkvjTXrqBBmCBWf+QIRmuqykvbXo0X?=
 =?us-ascii?Q?3cmxrZtznPRTaO8uKnDvX/hG5sYzOkfzgSavBj7QJJBMU443cCGKBObrkavL?=
 =?us-ascii?Q?rzfZ/KLBEqcQcyINcE+ppTqy8gQ/5hRru+Nr349bEhq+E17GCV8OTMPBgNp+?=
 =?us-ascii?Q?Cg5OfyZvCTo+zkETqWYcEEB6xoacMyMQUGCsIRN+yre5r+lV3Ir9A23LYiLD?=
 =?us-ascii?Q?pkDbXUW4Yc8KpEutmje1GjXuA77FmLBjOOry/hOZUglq7kFJTDiMUY/FmrEl?=
 =?us-ascii?Q?MJB/IWtnrfvz/I/i7HLkLxZ8h/P4Jq/AejQTT9CDttFxfiCLX9rmrYI68Ppd?=
 =?us-ascii?Q?owGrnyvP7c67c09my20IV7dhvseQf9xdbxxh7rNY/NDkzC90rFKIhgeGs/ER?=
 =?us-ascii?Q?Mox8FRTQtG9TQuHR5hAOOJnPdvJvMsaNaf+jhY7LQIhQG2YpcboOuhAkSuef?=
 =?us-ascii?Q?TwDs9lqbQqqhrYKvGyLE/Ej1wCwhulmLAn7z9AeZoeq/af2V0JA5XRkOByX1?=
 =?us-ascii?Q?1dJbJr9Vi1JHAsgSUZpM043+s0oipOJTGlLuanf/3xmckzEsVqL2GiTeP+3x?=
 =?us-ascii?Q?CqHbTosE7wxFf728iYCNu2q+G6phPhkLvbMqCakUYSY/MGC0UumS3htJioWC?=
 =?us-ascii?Q?o6+GFjogvwnaH5m/e1LzoHdJ0DB1AEMJy+2BcruZKQnfjRZPlhGD26cw2/TW?=
 =?us-ascii?Q?s4UFajRSsFxmI57+Z8ttrhjajswig3B+SjpncjbOWUt8tY54G3Yy1cC+/z7w?=
 =?us-ascii?Q?DObd0QV8tKOQKmUzbyHLgy6VftzMA5XFmVgg6JCz5HSrFW8q/LsjmsCOpNek?=
 =?us-ascii?Q?V5HuCa7nzCRWcs9d7/z0BGfi37AwGcaDBbF8pI2siHgOGyt3dMGAquQn+auc?=
 =?us-ascii?Q?MV5AahVAKWa+FK8X58DZto3UZHVnJFYwikB3Q5rN3OEJ47z06tggmUUKT+B9?=
 =?us-ascii?Q?mCr9svpUjRIUfAIDHUgxuTti5QfGA/dvAKbdKWu2JQsdkwbsH/s4vp9Kfym3?=
 =?us-ascii?Q?ndIa/PBds4cVhNfFLNsRoOq3xlS3D4+IRBorADqhAD4+TG1bvJcCIPgs5Uiq?=
 =?us-ascii?Q?qM0Z65IPz0odQ/fG2eZUgHNB+zISo/Ijd4oSD4sBfhntqCCOyZ+6nJjpzdIK?=
 =?us-ascii?Q?7E42XAGJRefEV0x0yPE2rwFhZRjZkwDaD3c6SxhcQ093CT89dZP+il0G7rKW?=
 =?us-ascii?Q?XJwqbyReIvzNrZByyQWI1RPgTN0K63qBQucJRIOGL+DkhYmdzMLaIYW/hvDM?=
 =?us-ascii?Q?92RT/Zw/rvABJKhwsqNB4DLtO5AjwlxJZUvRmwKBPZrNc1PO9nuH29+WWW7Q?=
 =?us-ascii?Q?2Pvctfh7UqIhPgOpBQiTH+nRZ/TkBXkJASPld8Nl?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 055190b3-132e-4432-9998-08db3c71c926
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 22:52:41.0661
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nl88+Zl6KgPbVgu/WfP/X15kfsXRJe+I8Sb+417QPlv+wg64CYrlAActEGYXA8zekuicD9UvXsLS3bUE7PSNwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6345
X-OriginatorOrg: intel.com
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
Cc: alison.schofield@intel.com, dave.jiang@intel.com, rrichter@amd.com, Terry Bowman <terry.bowman@amd.com>, vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, bhelgaas@google.com, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, bwidawsk@kernel.org, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jonathan Cameron wrote:
> On Wed, 12 Apr 2023 16:29:01 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > On Tue, Apr 11, 2023 at 01:03:02PM -0500, Terry Bowman wrote:
> > > From: Robert Richter <rrichter@amd.com>
> > > 
> > > RCEC AER corrected and uncorrectable internal errors (CIE/UIE) are
> > > disabled by default.  
> > 
> > "Disabled by default" just means "the power-up state of CIE/UIC is
> > that they are masked", right?  It doesn't mean that Linux normally
> > masks them.
> > 
> > > [1][2] Enable them to receive CXL downstream port
> > > errors of a Restricted CXL Host (RCH).
> > > 
> > > [1] CXL 3.0 Spec, 12.2.1.1 - RCH Downstream Port Detected Errors
> > > [2] PCIe Base Spec 6.0, 7.8.4.3 Uncorrectable Error Mask Register,
> > >     7.8.4.6 Correctable Error Mask Register
> > > 
> > > Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> > > Signed-off-by: Robert Richter <rrichter@amd.com>
> > > Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> > > Cc: "Oliver O'Halloran" <oohall@gmail.com>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > > Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: linux-pci@vger.kernel.org
> > > ---
> > >  drivers/pci/pcie/aer.c | 73 ++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 73 insertions(+)
> > > 
> > > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > > index 171a08fd8ebd..3973c731e11d 100644
> > > --- a/drivers/pci/pcie/aer.c
> > > +++ b/drivers/pci/pcie/aer.c
> > > @@ -1000,7 +1000,79 @@ static void cxl_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> > >  		pcie_walk_rcec(dev, cxl_handle_error_iter, info);
> > >  }
> > >  
> > > +static bool cxl_error_is_native(struct pci_dev *dev)
> > > +{
> > > +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> > > +
> > > +	if (pcie_ports_native)
> > > +		return true;
> > > +
> > > +	return host->native_aer && host->native_cxl_error;
> > > +}
> > > +
> > > +static int handles_cxl_error_iter(struct pci_dev *dev, void *data)
> > > +{
> > > +	int *handles_cxl = data;
> > > +
> > > +	*handles_cxl = is_cxl_mem_dev(dev) && cxl_error_is_native(dev);
> > > +
> > > +	return *handles_cxl;
> > > +}
> > > +
> > > +static bool handles_cxl_errors(struct pci_dev *rcec)
> > > +{
> > > +	int handles_cxl = 0;
> > > +
> > > +	if (!rcec->aer_cap)
> > > +		return false;
> > > +
> > > +	if (pci_pcie_type(rcec) == PCI_EXP_TYPE_RC_EC)
> > > +		pcie_walk_rcec(rcec, handles_cxl_error_iter, &handles_cxl);
> > > +
> > > +	return !!handles_cxl;
> > > +}
> > > +
> > > +static int __cxl_unmask_internal_errors(struct pci_dev *rcec)
> > > +{
> > > +	int aer, rc;
> > > +	u32 mask;
> > > +
> > > +	/*
> > > +	 * Internal errors are masked by default, unmask RCEC's here
> > > +	 * PCI6.0 7.8.4.3 Uncorrectable Error Mask Register (Offset 08h)
> > > +	 * PCI6.0 7.8.4.6 Correctable Error Mask Register (Offset 14h)
> > > +	 */  
> > 
> > Unmasking internal errors doesn't have anything specific to do with
> > CXL, so I don't think it should have "cxl" in the function name.
> > Maybe something like "pci_aer_unmask_internal_errors()".
> 
> This reminds me.  Not sure we resolved earlier discussion on changing
> the system wide policy to turn these on 
> https://lore.kernel.org/linux-cxl/20221229172731.GA611562@bhelgaas/
> which needs pretty much the same thing.
> 
> Ira, I think you were picking this one up?
> https://lore.kernel.org/linux-cxl/63e5fb533f304_13244829412@iweiny-mobl.notmuch/

After this discussion I posted an RFC to enable those errors.

https://lore.kernel.org/all/20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com/

Unfortunately the prevailing opinion was that this was unsafe.  And no one
piped up with a reason to pursue the alternative of a pci core call to enable
them as needed.

So I abandoned the work.

I think the direction things where headed was to have a call like:

int pci_enable_pci_internal_errors(struct pci_dev *dev)
{
	int pos_cap_err;
	u32 reg;

	if (!pcie_aer_is_native(dev))
		return -EIO;

	pos_cap_err = dev->aer_cap;

	/* Unmask correctable and uncorrectable (non-fatal) internal errors */
	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, &reg);
	reg &= ~PCI_ERR_COR_INTERNAL;
	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_COR_MASK, reg);
	
	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, &reg);
	reg &= ~PCI_ERR_UNC_INTN;
	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_SEVER, reg);
	
	pci_read_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, &reg);
	reg &= ~PCI_ERR_UNC_INTN;
	pci_write_config_dword(dev, pos_cap_err + PCI_ERR_UNCOR_MASK, reg);

	return 0;
}

... and call this from the cxl code where it is needed.

Is this an acceptable direction?  Terry is welcome to steal the above from my
patch and throw it into the PCI core.

Looking at the current state of things I think cxl_pci_ras_unmask() may
actually be broken now without calling something like the above.  For that I
dropped the ball.

Ira
