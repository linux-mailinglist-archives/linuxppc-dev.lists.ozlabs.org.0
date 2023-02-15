Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6D697281
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 01:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGdkB7401z3ccs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 11:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PDTsE1Qh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=ira.weiny@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PDTsE1Qh;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGdjC3C1tz3bbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 11:09:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676419743; x=1707955743;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KG+G8kT5KNH7fYZFaN0Rz+45V8REuKC8ggYjGTRnNSI=;
  b=PDTsE1Qhakzyab7MpvBASeIivDYLdtVLWT8jgy6Fc7hCiMGNmzNugUDH
   dlUQLWXiobWLjI6tnciWQgc4DcTKPbXdhu58BzDpv/KdX6KztW866e/Eu
   PxspO5o+Tu/wpN88tY1aj82MQz8CY5kvl4EQnRhOmhBVBDt3qIsI52SE9
   6dpWSUbZ7wsB5CbzuDgCzvhg3kmxhN1tOsuCQg2Xg4Cv0+KOmPM10lIT1
   Zb1xpAYtt6zMqjDYSi4sCGpuH2cuVUQXZjqwvJjkhmHIHu9rjQmeqhJhI
   V6lIpJULJnk2PLuWAJvmLTbFf8fx7vAiQh02ImfWd3e5MnYSf3Fgulkif
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="329933497"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="329933497"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 16:08:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="758192682"
X-IronPort-AV: E=Sophos;i="5.97,298,1669104000"; 
   d="scan'208";a="758192682"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Feb 2023 16:08:59 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 16:08:58 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 16:08:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 14 Feb 2023 16:08:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2if6SWq3/2CwQsvT5fCrhFBN0rst0myyuJ4hLHrOSVwZTtol3mh+i3tKJAB3uUlzvMDGJ+tQ5Zin3js57rPTBI6LYFhZr96yyDSmqCqLxTvDHeQwY0AZ6OdrC6jJm3xaKYxEVOILT5XaVNmKTDkiczWDzxUOj72hdqq94eRRHbI9RqVd4nip7JZlh6/1kb27H795F9QCj2/pJr7p9kIlDarVCqfF2aineFpJQ0nGMn6Zi18gfmWPe27UdwNoBpDHizpg3+7TnsQmwWDjFxyPs/b2RT/HTXg9u1h+05lT1V5h+uNYw+iUCDXIsLEYHiIhmzY8iAqkWpfsUkSvH+AFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVXzK7y63GkrPcRgVDhK4UBNXRMg0g0mU0KjASFhZRo=;
 b=BJt8sjfvkL2FaFM9UFGYQBtPU2mf8Allkl12WsOgdGa3DeklQqH0o963uO+oT3KHFXMkDQf2yGoNLv72s39vwCcJoip1kZ/EE9WztmuYPmCA2STkhyLJVrDsNMxXA1ltPF2eCjHXzHvXVGYWAOVzIvdprrZdzudPHzLlNDuPouS/j8d8OVBVEQzQ0UM0yCDnIUyjU2mokDogUTc5+zsdpStAmhFdtuDgxR6Qrw8/0iyRKeuXOvK0RGA2rvnRMHo3Co4GJuZPiN9foEMttSdgsuw0xBjYnCDkWzrlPqdQ512QQPg6gP8of0ftNPDUGnX3ziKs7fM28ggccjzSCP5I3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BY1PR11MB8080.namprd11.prod.outlook.com (2603:10b6:a03:528::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 00:08:55 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6851:3db2:1166:dda6]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::6851:3db2:1166:dda6%8]) with mapi id 15.20.6086.024; Wed, 15 Feb 2023
 00:08:49 +0000
Date: Tue, 14 Feb 2023 16:08:43 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH RFC] PCI/AER: Enable internal AER errors by default
Message-ID: <63ec228bc5466_185fd22947@iweiny-mobl.notmuch>
References: <20230209-cxl-pci-aer-v1-1-f9a817fa4016@intel.com>
 <20230213213820.GA2935044@bhelgaas>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230213213820.GA2935044@bhelgaas>
X-ClientProxiedBy: MW4PR04CA0276.namprd04.prod.outlook.com
 (2603:10b6:303:89::11) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BY1PR11MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 22f9e7d5-91ab-4e8c-f005-08db0ee8cffe
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2pM1OLl8vtTyjC1i4YwnGePguJaEbqKANlel7NdWSs0U6z5HgbSPD/ycVqAKpAPcfGLkae3FdI9n6iLi6lbsm8nJ9HiaFp9lp57b+cwszC12QnTS3MveGYUeGLCJIdndpku2SWMmQYoNl2ISWq/3yV7bRs0XwVEvgMzZ3F7X55Zqhbw4zVoeWl5uMLOO7waAA1C4kiX2HCmO1iNOv4jb3TTfdBVKqHCyPiUfeU93iqDt1VXX0N1pJXjbBXtlA5QsPgTD76d9I8k7sR9w9CY+xQHpZMyDRvtGdpwOOg87FC/1UBnnnl0iD9c8GlXwmEBwaJRr1J09HhvWpsFmNE+DuicrIKoOQ7X15Tn5ymm39RreOmKnkw63zPjXPNN86DHyYjkv37xFqOcAF0vLY2HTLJF9lT1qRzfqeAm1vYj5M+J8OPC7F4/lgr82RPKMkiKI4th+FoAzfKR/N34GZ1GDCKdQlh8BWv6USK+w55GiTfF/HxyEIFXbKFnzq//aPnEmnO1fi7mGCPNOdFQ4Ikcs4YCjJZkqqlapnfbAktaAmLLhz5UkEjwPn9IATiyIoL+RVfeP5MFvHQmuCUJP4TczOUKIw0IobbbKVWW5gajrPtvGwrltzv92lp1BolyH/0pC6nQb6CfgmITpqaHnuHy3mA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(316002)(110136005)(83380400001)(82960400001)(86362001)(38100700002)(186003)(26005)(54906003)(6512007)(6506007)(9686003)(6666004)(6486002)(478600001)(2906002)(41300700001)(44832011)(7416002)(5660300002)(8936002)(66476007)(4326008)(8676002)(66556008)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3nczTZ5sc+eICwqdw7KexJ9wgoasQai3UPQ2hFZG066MDd4IqgqB3oMyAfG9?=
 =?us-ascii?Q?76CGgpgx4A8h2ShDbHURQ3ZY5ClTN+IqzNTv+zgT5fh1qFqAKx20R6DMjjG+?=
 =?us-ascii?Q?OnMOH5nrwJjQj1mSqhR+/UGXnCkDAYgWuQxj1oY5igV3ybSGyicyLJ4E4zhS?=
 =?us-ascii?Q?ZgZ+Gl3BWrqU2G1F11CrHbqa7TVhcjC56w/FPAYktGBmu/ystJ0I17zQIpgZ?=
 =?us-ascii?Q?B2lcrxU8+r8Y6tpuoaN6qHyade3EiymSu7fnkjprsCNYT9U+qJqNZMlTVInx?=
 =?us-ascii?Q?bEY7GzeUjtCS/wVPhVvcfOMqilFjdyuZubGdlJLpddyZoGP33raUSo4Sgqd+?=
 =?us-ascii?Q?cg8ZsrRaFHLXrZ8cPW+FksSRKv2x35I1tO61dzASNVW6Ltj/50T30TSPWSrl?=
 =?us-ascii?Q?G6WTmr3bJjpeQ+nfKyE6L4Q+iYS4rlMAr+exE1eR8wiOEKOpQCDRn3u76+PL?=
 =?us-ascii?Q?x8EgYWghN21t+pU4XbaCoKoba1rDAWzShA8BbRsswnyC67T73FRmZiiaYAaS?=
 =?us-ascii?Q?Sk/XciyL5c8Kf7rnIhRlLdFFu7tLd60olIML9XxEDPBfgZdRn1ojRDJTrey+?=
 =?us-ascii?Q?b2tl/B9ItiK/LFn9Iurq+Wa2T2sL0ZIL6hfgPC3loI6KCrHwCaSS5pF1KMAL?=
 =?us-ascii?Q?RzWibI5FkYmNRAWTMEWVoe3vpqkaRTEH1NFQ6M1dJI0JiPO5McXLvl/rmHRL?=
 =?us-ascii?Q?Wzu3M/PUGpqfD7OpyUMo+mluWOmbTwYVA89loOlvADqJOCx8RA1wwoILF1QD?=
 =?us-ascii?Q?7T5LBfHFC7ol1hQEV2aW+bE7eJVpAmL9LYGAznjq6Jh957BGc63/m9HeK8Ut?=
 =?us-ascii?Q?YEox6UC3H7HQxhMzuwU/oJnEZGDby28L+uc9RpWIjf7kMIczA3PitrY3AzmF?=
 =?us-ascii?Q?h0+S1QGHXA8JXU84HXR5zp0qL+4bgoCZF14X0iWJjdFB8KWAR5bwrS6XRc+f?=
 =?us-ascii?Q?MZmpke062yh7qvu44YwD2pyeUhNQiZmhD5GlifO9+iFMZvJBdV2HRXeGc7q+?=
 =?us-ascii?Q?4MKHLZml7gNCTfa0emsgN9yeSum+30LY3GM7+3jfYTN1xOtlUEVR3o3Ss63M?=
 =?us-ascii?Q?f0C9vznU8P0VqJxH0qORx9sbr5VD2OpGj3RxQhJJpfxW+6qKEUkeSZ8G9bLm?=
 =?us-ascii?Q?Pyq6Cpx3X5cOnI2CH6rezwg7Ex7k6Kr1uFvU2K7Ez/fJqfz6w+APJJNpQ1d2?=
 =?us-ascii?Q?HiePVmAaAEu6S1kRJvMVqO9LKq3nGBgsFFN5MBjB3GR0hVltQWySB6O+/fwr?=
 =?us-ascii?Q?s46ZQH88H3ZG2TATlFmzc5TmnUyFioUwxWrTEuDnxErfYAP/hbZ1XG+L8oh6?=
 =?us-ascii?Q?UVOKe+7UOyDX/1/Uxd4UNshSrtWTaW4Zh7lnSDolN7XLlxLwWUGxBPbrbhTN?=
 =?us-ascii?Q?YZpQ6rSLCKCGzOMfHbZbkUfbvZkioJtngrGTZVAsh8LZ/5g0EFHzcvTgnVvR?=
 =?us-ascii?Q?eEpa7jy3HfOV5sRGjQaH9qQsD42iJ0JwycXcbCUTqtZZxjoq4JNeAwHrctaG?=
 =?us-ascii?Q?eHu/iB/0qz0c+gsWwDuQzuNHX2U9qsm0tcGqv3Ti9Xk1S9NLzs6r7tmNk65V?=
 =?us-ascii?Q?ikLwAp57XKGE/itDk0aTRbwaywUMkmiEIBXE5mBR?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22f9e7d5-91ab-4e8c-f005-08db0ee8cffe
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 00:08:49.0349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs44lGDIO/lQ+MLjPez9vOeQ/QVXJuHKnGgAGLPufhSzyosVjo+ygY1aOHUvY5bMMgiyZ9Btz9JjpepvTKI1gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8080
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
Cc: Alison Schofield <alison.schofield@intel.com>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, Ben Widawsky <bwidawsk@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Stefan Roese <sr@denx.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas wrote:
> On Fri, Feb 10, 2023 at 02:33:23PM -0800, Ira Weiny wrote:
> > The CXL driver expects internal error reporting to be enabled via
> > pci_enable_pcie_error_reporting().  It is likely other drivers expect the same.
> > Dave submitted a patch to enable the CXL side[1] but the PCI AER registers
> > still mask errors.
> > 
> > PCIe v6.0 Uncorrectable Mask Register (7.8.4.3) and Correctable Mask
> > Register (7.8.4.6) default to masking internal errors.  The
> > Uncorrectable Error Severity Register (7.8.4.4) defaults internal errors
> > as fatal.
> > 
> > Enable internal errors to be reported via the standard
> > pci_enable_pcie_error_reporting() call.  Ensure uncorrectable errors are set
> > non-fatal to limit any impact to other drivers.
> 
> Do you have any background on why the spec makes these errors masked
> by default?  I'm sympathetic to wanting to learn about all the errors
> we can, but I'm a little wary if the spec authors thought it was
> important to mask these by default.
> 

I don't have any idea of the history.

To me 'internal errors' is a pretty wide net and was likely a catch all
that the authors felt was mostly unneeded.

CXL is different because it further divides the errors.

I've enlisted some help internal to Intel to hopefully find some answers.
But in the event no one knows it would be safe to to with my alternate
suggestion and add a new PCIe call to enable this specifically for the
drivers who need it.

Ira
