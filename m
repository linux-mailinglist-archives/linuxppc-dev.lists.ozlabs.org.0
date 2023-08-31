Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B9378F434
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 22:37:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Krod0GZy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcCf81DGCz3cD0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 06:37:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Krod0GZy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Fri, 01 Sep 2023 06:36:58 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcCd62whPz2xJy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 06:36:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693514219; x=1725050219;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0QCJjz+fzkFkR4gl5bgEH/u5dVE0GQYhY7W9qSQhTac=;
  b=Krod0GZya+7+np0JvFBRKKPAW9RGXBm71GCs/kMTbutet2QL1N/eG+fj
   GiJKEDcPEH1yWJUgMI8+x1O45GGvT5CejHHHM1BYHAlddOedKqutebPBD
   B0KWnhwFF55u5ZKuaBSHJUSn2+fY5jZ7NBkGaJEJQX0+YN+wOH+H3nosx
   VK9vZg6T67Zfc5j+H273v9EgtZhN0tLtGqucWQL4uPZ4LgTIKbE840fEI
   i+1k2mKLEQFcNZZ0I0GCZ/CZdr5XmVU9p4fy3DLJpd+2pF0piXFgy/DzH
   MpNZGlIMp2GvnLvrafkOvc1Gu1rVi9N9YYFded6oJoZu+bwH5VHD2ZBIH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="462422623"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="462422623"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 13:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863277176"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863277176"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2023 13:35:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 13:35:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 13:35:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 13:35:45 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 13:35:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SGm91ACJzFtbPR8+4TqUFx5i7uxFuWcm1jGF24bi1zDS/hPh8Zw0xz69b3bsp7LUnh/ly3kqVDYlIf7anA2UoSjuQF5ZD3yxJ2fmi2QrznP1xBxcWg0yaSOhYK0JjT7ZqxrDQ9IBrYf3fgp6awyeHER7Kaq6Gni5dvvexArRvVY4vg4VrsM22OVtpaTK0DBGrudGjC7OtsghSwgvHjZfJb4ph7SLHh/7jm6dfis20foc+dgzTzlxoZsiXRdam1BgYKS3IBno3vF/IdP2S4E/PGz/FhjVbTYqjK0mdzvKsL9jHZDmdoqMRd/Yk8B/Z/Ig77xTsO4OAgHR7m+oQtDinQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wylrD1xLukJUwNcSDA8bfZGt6BP1TcK/dHSH5Z+rYkU=;
 b=mzrxsOiPW6TrbZML0iRUhRyHJ9orNNoqrU9YXw/FQpKNm2O2nD8F5LCcxZGKsuqn3bQE+FMefqWBACFHKu8FV0sBv6tsTwBlPNd6UOe5i9itwSiDAabXbQd2YB355cA4vmOHsZCl9PNKeHbRbQILFkMlbq1nkLCPUrbuSElxVN/gJbgoecPahCaFUjXCAc6eh2tqgWqlluHzzvglb5qTRV+bdkvO7YuSZYz7V+RCsLobRdFJZDJWCY2lclfhagNXkyTK7ouas/wNWmRrjiNr8prL5N8oxlKjemchHLGLhL6POPlnXPya7yBC6W9xNnhR+WZkKspnVAi5hbAM9ymisw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 20:35:41 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 20:35:39 +0000
Date: Thu, 31 Aug 2023 13:35:36 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Terry Bowman <terry.bowman@amd.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <bwidawsk@kernel.org>,
	<dan.j.williams@intel.com>, <dave.jiang@intel.com>,
	<Jonathan.Cameron@huawei.com>, <linux-cxl@vger.kernel.org>
Subject: RE: [PATCH v10 13/15] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <64f0f9984932b_31c2db29461@dwillia2-xfh.jf.intel.com.notmuch>
References: <20230831170248.185078-1-terry.bowman@amd.com>
 <20230831170248.185078-6-terry.bowman@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831170248.185078-6-terry.bowman@amd.com>
X-ClientProxiedBy: MW4PR04CA0196.namprd04.prod.outlook.com
 (2603:10b6:303:86::21) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ2PR11MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: a50dd91d-7023-4aad-7b8d-08dbaa61d6d2
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 51paQKoF93UxObniFoMDR7N5yGSV4/+RR39cqlqlSFyVuJCOSBmId987LT7CCYlHga+5BDUoBe1vw8n/mAmokXXHnd1jNVOgL6wppCVmuPm7qrQLwCZLEJ8j8YbsEsy3vC65Mt68pmHqFX8q4Z6GiPCZEIvvV7l8xeoJm7DnYEgPnOCyrm2hx65547JM3Cy8Z+YMic37UoEEyhkYXishwzcIadP4TuxorokIvajzSM3iOITO7lAkXQBnPiJwDciKoTSb01/+018Jogg8wuR4uYpD5EY5UT5P1fKtV1lvIhcbhm2PeT0ocuYVNzdYJ70M2zblbYQptrbw6QYrgAHgho4YjokxSwhiICFnmSfsPVRAQNu7YQzHEbgZiy50j+3WSaWmDITVfJwu65QJqUPJTpauRKuyoQMO/9qpQSXpcKwBDzo19mG6k4xqqAhU5bnN0qbVNNbm7xrG6Wcoc+0boZzuo7ctskc6epjVeXabEUidnJ9Zmm98S7ac2PhrHqUigVsVb+utEebeMROI8j6+f1It19xQ3WQ1eZBnqaYkHA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(451199024)(186009)(1800799009)(6666004)(6506007)(6512007)(6486002)(9686003)(7416002)(8936002)(66556008)(82960400001)(5660300002)(4326008)(86362001)(41300700001)(316002)(66946007)(38100700002)(66476007)(8676002)(2906002)(83380400001)(478600001)(966005)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rR/xxPTTU5OCQvuJuignUMFsac/rnN9Jg8d7pPxnW7ioStPy6A1tQeDzNZeS?=
 =?us-ascii?Q?fVSH9z1Ep4SnCQBtXvb0qViJtv08wVdBZxYD1ORmuZHOWSRFaN8TNMylbdKq?=
 =?us-ascii?Q?OSX02f7IelwdPa3RS4I4xOoYdKUaqPVnzEDiGwvrDB9i1bmUGgWt6evz6K+p?=
 =?us-ascii?Q?xBz+vwTlTrQXXoZLKyDMo61eFPf01O8mJhmnVpjOkdZdwL1rX1uzBs0HdFlr?=
 =?us-ascii?Q?w4UYolrNgrF2CBAmmSYQPEcs1f6gI3M0iXf9ipnfv1J3sB0iOZa+AMDZ9MBW?=
 =?us-ascii?Q?Vgh2Fx+vBEGwcQQ1a9XoaI8BtQd1QKPcsE2FSfOEUyP6Mq7q4JBbYOm4bNgR?=
 =?us-ascii?Q?XggnU4KEEfLq1Lu1DLm648WxJcCsbFLAhyc/vnoMn8jHn+9Y6uN1+aBizNgG?=
 =?us-ascii?Q?de/9S63M+wio0vdJ7UWWf/2El/t3skyXl/tWAtFeI3V9251cWlf8zsQYo9uh?=
 =?us-ascii?Q?TSOm2vaPLREDsM2nUjIM28tlHq1wdnLmwYQlAdxdIkraxWmw8vEcPOYTalBz?=
 =?us-ascii?Q?5ffyvXj5gCzTMf6fjQvyU8eRO+mXneUyjgE0nGlwdA4qASMpqOntvXg6h0gJ?=
 =?us-ascii?Q?fkbAdfNErQcD9lEGzRBY6nXSXob9LGIrmcKO0uNXvR2ULP9y0e5JuhiWIcHp?=
 =?us-ascii?Q?V5T3tylf18DVqBKnRg/cPKu2ifDRnLByhQBUaY1LgV2eDr74QBwFbc9ueEGZ?=
 =?us-ascii?Q?AyG9PvwTO6uqOTGfXrQXIB63ljwPdm46oeakUUGIlVGImHXPPOtRAl+MYiUZ?=
 =?us-ascii?Q?ybNuNso88m0NDyROflY8uh6YNvAkBdVh7kE+9HdqdJnYKes8hytUuN0o6ir8?=
 =?us-ascii?Q?ZkvLd/hPv3wu70SM162GkTVu3P9aG8XvLz+adiWFD9QtqObSr3irRwN16iqb?=
 =?us-ascii?Q?U8IIddl7GMlS0r+C+RFP46ZI1tifTl24EvNPdgIqToHpiHhpekb+LQR2dt8L?=
 =?us-ascii?Q?234gUOrj1lZRUysQi9tSNQMR7wjZR+b5D56CCM+M2eCSlfej131HAt12yicP?=
 =?us-ascii?Q?pGvw1IaeMGEn7eOGrcWAmbN5OYR4H26Rrey7KxvWWnK3FfNBwHWlNHSXrL2V?=
 =?us-ascii?Q?wu5s8PTKH4pHtxh+rL+Z9jx+dw8XmyeJAmpyWAHsWIpXb36USmGZ7H3Nbkyz?=
 =?us-ascii?Q?jFaTr59lXm8UcbsjLcMcQ0KRl4cxQxoHCNgU47QzrYASSxLCAmLB/BAlKOf4?=
 =?us-ascii?Q?zyBH4kWZ6dBHiDVJB2ZEBOAy0PSE6q5CZLDPtio9cd2Cp+NTREeRqCDfpTuj?=
 =?us-ascii?Q?ZuQzlNDEWOak5Y+FJ7RnZahzsZQ5Z7God9MgNt0WuVmLZ07bw3L4+is+5sR9?=
 =?us-ascii?Q?mrE/afAdnwveqTBYtqmtrm2+4ebpm4O3jmjZMJWWoBFkfd2c9D85H01U/4QE?=
 =?us-ascii?Q?nZCYs+Ywkdacyx++bCIVJUzRyqcXFl4JE33VGsIRzv/Ufrxaqc8eB1nfJ5Dc?=
 =?us-ascii?Q?EG9Y4eMp5c27nl/zeixOArVBK3K0kiICzY/ZwkpGFT9hXSF0JgK45p2Qm2Si?=
 =?us-ascii?Q?S3IsxX0mP/yPeMk6SmLhoIglKP3qvJory7AN09soZ6jGCGCb7Musx8S/wDrl?=
 =?us-ascii?Q?J/RyjOe4iwYT8VPZVfBX8nv5PS8805V9E4wu6/l6uFYRv11sLbel5SVFz2Vk?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a50dd91d-7023-4aad-7b8d-08dbaa61d6d2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 20:35:39.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x0jXd+WK/NL0bJH6FVG/EoO8HLRmLoCHcx0bnfXI5rP/YzQ85luMCJZtzAeYTBrSovyRBWtYcvMJvM4wX4p4b0aRAV6KWHRbTA9ErVE8mDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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
Cc: rrichter@amd.com, terry.bowman@amd.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Terry Bowman wrote:
> From: Robert Richter <rrichter@amd.com>
> 
> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> RCiEP, but CXL downstream and upstream ports are not enumerated and
> not visible in the PCIe hierarchy. [1] Protocol and link errors from
> these non-enumerated ports are signaled as internal AER errors, either
> Uncorrectable Internal Error (UIE) or Corrected Internal Errors (CIE)
> via an RCEC.
> 
> Restricted CXL host (RCH) downstream port-detected errors have the
> Requester ID of the RCEC set in the RCEC's AER Error Source ID
> register. A CXL handler must then inspect the error status in various
> CXL registers residing in the dport's component register space (CXL
> RAS capability) or the dport's RCRB (PCIe AER extended
> capability). [2]
> 
> Errors showing up in the RCEC's error handler must be handled and
> connected to the CXL subsystem. Implement this by forwarding the error
> to all CXL devices below the RCEC. Since the entire CXL device is
> controlled only using PCIe Configuration Space of device 0, function
> 0, only pass it there [3]. The error handling is limited to currently
> supported devices with the Memory Device class code set (CXL Type 3
> Device, PCI_CLASS_MEMORY_CXL, 502h), handle downstream port errors in
> the device's cxl_pci driver. Support for other CXL Device Types
> (e.g. a CXL.cache Device) can be added later.
> 
> To handle downstream port errors in addition to errors directed to the
> CXL endpoint device, a handler must also inspect the CXL RAS and PCIe
> AER capabilities of the CXL downstream port the device is connected
> to.
> 
> Since CXL downstream port errors are signaled using internal errors,
> the handler requires those errors to be unmasked. This is subject of a
> follow-on patch.
> 
> The reason for choosing this implementation is that the AER service
> driver claims the RCEC device, but does not allow it to register a
> custom specific handler to support CXL. Connecting the RCEC hard-wired
> with a CXL handler does not work, as the CXL subsystem might not be
> present all the time. The alternative to add an implementation to the
> portdrv to allow the registration of a custom RCEC error handler isn't
> worth doing it as CXL would be its only user. Instead, just check for
> an CXL RCEC and pass it down to the connected CXL device's error
> handler. With this approach the code can entirely be implemented in
> the PCIe AER driver and is independent of the CXL subsystem. The CXL
> driver only provides the handler.
> 
> [1] CXL 3.0 spec: 9.11.8 CXL Devices Attached to an RCH
> [2] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> [3] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> 
> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> Signed-off-by: Robert Richter <rrichter@amd.com>
> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-pci@vger.kernel.org
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  drivers/pci/pcie/Kconfig | 12 +++++
>  drivers/pci/pcie/aer.c   | 96 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 106 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> index 228652a59f27..4f0e70fafe2d 100644
> --- a/drivers/pci/pcie/Kconfig
> +++ b/drivers/pci/pcie/Kconfig
> @@ -49,6 +49,18 @@ config PCIEAER_INJECT
>  	  gotten from:
>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
>  
> +config PCIEAER_CXL
> +	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"

Why the "for Restricted Hosts (RCH)" clarification? I am seeing nothing
that prevents this from working with RCECs on VH topologies.


> +	default y

Minor, but I think "default PCIEAER" makes it slightly clearer that CXL
error handling comes along for the ride with PCIE AER.

> +	depends on PCIEAER && CXL_PCI
> +	help
> +	  Enables error handling of downstream ports of a CXL host
> +	  that is operating in RCD mode (Restricted CXL Host, RCH).
> +	  The downstream port reports AER errors to a given RCEC.
> +	  Errors are handled by the CXL memory device driver.
> +
> +	  If unsure, say Y.
> +
>  #
>  # PCI Express ECRC
>  #
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index d3344fcf1f79..c354ca5e8f2b 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -946,14 +946,100 @@ static bool find_source_device(struct pci_dev *parent,
>  	return true;
>  }
>  
> +#ifdef CONFIG_PCIEAER_CXL
> +
> +static bool is_cxl_mem_dev(struct pci_dev *dev)
> +{
> +	/*
> +	 * The capability, status, and control fields in Device 0,
> +	 * Function 0 DVSEC control the CXL functionality of the
> +	 * entire device (CXL 3.0, 8.1.3).
> +	 */
> +	if (dev->devfn != PCI_DEVFN(0, 0))
> +		return false;
> +
> +	/*
> +	 * CXL Memory Devices must have the 502h class code set (CXL
> +	 * 3.0, 8.1.12.1).
> +	 */
> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> +		return false;

Type-2 devices are going to support the same error flows but without
advertising the CXL class code. Should this perhaps be something that
CXL drivers can opt into by setting a flag in the pci_dev? It is already
the case that the driver needs to be attached for the error handler to
be found, so might as well allow the CXL AER handling to be opted-in by
the driver as well.

> +
> +	return true;
> +}
> +
> +static bool cxl_error_is_native(struct pci_dev *dev)
> +{
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +
> +	if (pcie_ports_native)
> +		return true;
> +
> +	return host->native_aer && host->native_cxl_error;
> +}
> +
> +static bool is_internal_error(struct aer_err_info *info)
> +{
> +	if (info->severity == AER_CORRECTABLE)
> +		return info->status & PCI_ERR_COR_INTERNAL;
> +
> +	return info->status & PCI_ERR_UNC_INTN;
> +}
> +
> +static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
> +{
> +	struct aer_err_info *info = (struct aer_err_info *)data;
> +	const struct pci_error_handlers *err_handler;
> +
> +	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
> +		return 0;
> +
> +	/* protect dev->driver */
> +	device_lock(&dev->dev);
> +
> +	err_handler = dev->driver ? dev->driver->err_handler : NULL;
> +	if (!err_handler)
> +		goto out;
> +
> +	if (info->severity == AER_CORRECTABLE) {
> +		if (err_handler->cor_error_detected)
> +			err_handler->cor_error_detected(dev);
> +	} else if (err_handler->error_detected) {
> +		if (info->severity == AER_NONFATAL)
> +			err_handler->error_detected(dev, pci_channel_io_normal);
> +		else if (info->severity == AER_FATAL)
> +			err_handler->error_detected(dev, pci_channel_io_frozen);
> +	}
> +out:
> +	device_unlock(&dev->dev);
> +	return 0;
> +}
> +
> +static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	/*
> +	 * Internal errors of an RCEC indicate an AER error in an
> +	 * RCH's downstream port. Check and handle them in the CXL.mem
> +	 * device driver.
> +	 */
> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> +	    is_internal_error(info))
> +		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);

This would seem to work generically for RCEC reported errors in a VH
topology, so I think the "_rch" distinction can be dropped.

> +}
> +
> +#else
> +static inline void cxl_rch_handle_error(struct pci_dev *dev,
> +					struct aer_err_info *info) { }
> +#endif
> +
>  /**
> - * handle_error_source - handle logging error into an event log
> + * pci_aer_handle_error - handle logging error into an event log
>   * @dev: pointer to pci_dev data structure of error source device
>   * @info: comprehensive error information
>   *
>   * Invoked when an error being detected by Root Port.
>   */
> -static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
> +static void pci_aer_handle_error(struct pci_dev *dev, struct aer_err_info *info)
>  {
>  	int aer = dev->aer_cap;
>  
> @@ -977,6 +1063,12 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
>  		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
>  	else if (info->severity == AER_FATAL)
>  		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
> +}
> +
> +static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
> +{
> +	cxl_rch_handle_error(dev, info);
> +	pci_aer_handle_error(dev, info);
>  	pci_dev_put(dev);
>  }
>  
> -- 
> 2.34.1
> 


