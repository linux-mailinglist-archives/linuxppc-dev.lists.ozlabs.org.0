Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FAF7AF703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 01:59:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mx8qAzCI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwGtv5b2xz3cCl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Sep 2023 09:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Mx8qAzCI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwGsz0QYWz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Sep 2023 09:58:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695772727; x=1727308727;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wfra2jLiPyiHlESxiT/CZwWVpGtg3pvgEuxDq/qUfpA=;
  b=Mx8qAzCIs+UlHL4S9IGjbhSQPVOHRYI4IRfz4EQk42IgUAdpm1oV7ODZ
   9NnxNV2FLbRez8WHMu7tZXmOXc2ZYq53v1JST8OR6eticRFMjuWFaGvNQ
   aJgYZJvYXEGvd5dAcMv/hiC3W8U0NhxWWtu7vxYDKkp+GTjyXDlcXRQw/
   R+3Mq7WdlnbASg2Bj1ljmRFPAqcpQVbEoVY4GP10fYtumPAuLpSXmcqOy
   0HcFZ72IKvRn0JeR4TXrQVEDKGfbj3nK8W6fbb25Wz2nab8YqxEcYZy/d
   EJCMHBItiy67MmIDskPhLDVhpi87U9ZMKKZGbNiZN24UNTRw/ugadbCDj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361074322"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="361074322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 16:58:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="748990253"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; 
   d="scan'208";a="748990253"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Sep 2023 16:58:36 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:58:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:58:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:58:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/AF8GkX5BlZWE95/+7nHWP32oeQR1a8Hopy4QCmvc1BpGAEgIoGocWKNROaS9Pi31XseiiYHiWpM8QwnoZDJMTSXIMxW2GNUK4HpnkVRMksDZ0WtGskY0cY0Hn5EuQPh1oxC/i8li7mRQjXu4doQgqtNWDtUMsl9ZxxDcsP4hykUcat47l2pnTllGnm0xilvVPWnIV4blbOf0+l8/UZbzx0UmFMHEdSEFHbucfsodF7QZx9DppOGPsTZNmM56czp9H8WnXTZAcuFFWIoy2RGC91mJiopEyyZVn9uYD84fWNnOpGA5TNrBuv64H9aQLKW9zd+FKvZOwpxwGcUdBwdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEBnmpMNjJWWnIsbwtEB2q1X4cIRff9Uc7WrU52jtRY=;
 b=O5WCaUA2oIhz3w0jJpRxJcHJvdNUWcaBZVuOKIuP5/l9zYFS1dY183sdFIgPvLX+Qz1UhApiZfH/VsyxbYhUlfmtXpCbv9FkCLeaZmGR7d9j3y9ZtILfzVrLkorMwlyfrGps3+ZXeZcKyLr+lVEMgJHoDfZYeMlqxyhjiaC2g1XuSpIOnn+yMv25+moVFI4CV1baeZi55kDVDOeHCzOiaG3UG3t1y4iSwFUN6iZa4tYg0FZe+OMjokyOzwAsla0FVdwrMDAcV5hWdKq+GfeAediX+nYpgCjnUS3fWmKcr1ken5NCq1za9Trt/M/1LQiWSxi5G7zumlB3QdspV8qTkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:58:34 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::acb0:6bd3:58a:c992%5]) with mapi id 15.20.6792.026; Tue, 26 Sep 2023
 23:58:34 +0000
Date: Tue, 26 Sep 2023 16:58:30 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Terry Bowman <Terry.Bowman@amd.com>, Dan Williams
	<dan.j.williams@intel.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <bwidawsk@kernel.org>,
	<dave.jiang@intel.com>, <Jonathan.Cameron@huawei.com>,
	<linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v10 13/15] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <6513702648e6_bf9129415@dwillia2-xfh.jf.intel.com.notmuch>
References: <20230831170248.185078-1-terry.bowman@amd.com>
 <20230831170248.185078-6-terry.bowman@amd.com>
 <64f0f9984932b_31c2db29461@dwillia2-xfh.jf.intel.com.notmuch>
 <cfa1aaca-49f1-cb8c-f4d9-f96e5bdc9892@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cfa1aaca-49f1-cb8c-f4d9-f96e5bdc9892@amd.com>
X-ClientProxiedBy: MW4PR03CA0164.namprd03.prod.outlook.com
 (2603:10b6:303:8d::19) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: ad52b296-06fd-4484-f658-08dbbeec7dbb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bOFS3zqQskBekW6lSA0ZVaDZYYv9FYd50VihaNjYCHCQWuXfVNmMY5Wz/u+qf9iP9bbucokd78pO6OhzI3LW6oT0hl09aRQ6SG3fBWjdzFJNOgryjfqwlVkArW4nH0ODbRTrrmmvLHDMmVDb8b77A2ksBAFtbIWV8NWxzUspb5tjfQbs4X8grMMQjwDC6LLVfxyLiqpUtQAP2CI9ah+PNtUb8ldXlxMsj4WGEP4oTWzf9DLQd3DQtDiT3GeIFW6buGNwFhovabIdP+nOKrAXa4mpsikOP5apHXSbcxLEJflifUATrs60uK+OowssW/vx2TRfdH+BX59XV+e64PVaBezuT2uXnCdJhTpYqDKREsX6ErLk+A4JExLRCcqise/2tvf6X5o6tx6xzhP1g+LNEb8IV/QK43nt/tmhndfHFS2RA9nlvvBLRixcnIOlBPrF1NydcE5PkhTN3uTnBE+CFRQ0YsMQYW7JNlrQw2/XouPZndMyYUKjowPUiBrcTmRaHomV2LmxPs8b0LyWDP5/WguSDWC/7F0Lq0dAijR4mPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(39860400002)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(2906002)(7416002)(110136005)(5660300002)(66476007)(66556008)(478600001)(966005)(6666004)(6512007)(53546011)(9686003)(66946007)(6486002)(6506007)(26005)(8936002)(8676002)(41300700001)(4326008)(316002)(83380400001)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJjtjNrEjgsRX+cNPSS28CRaNOkr3WBwC5HU78on4WLPAcJBxDd9Kg64IKBF?=
 =?us-ascii?Q?JixpXfr1dqbPCJPEnh5bnIVdYpzsAw53iKfii1TD/+e5AwTXoX65M7UiRSeh?=
 =?us-ascii?Q?14vjC/WsFpJr7fww9qGc4i6jjTAmy1JeXS+2XfpnFwZsHdYcuhCnQClmqwJy?=
 =?us-ascii?Q?Uzq/dnWEhOeI0u6QimO25F2Ac43uyxX9gMtSxRl+UMcrdjzb/aF+eHz6Cmr4?=
 =?us-ascii?Q?UoAxTY/oknvd3hsHdt787jkMw/xICc6qC9i5UHphxDbTMm9Lca4Sl7YwdWX3?=
 =?us-ascii?Q?MrinSKcak+VytrpVjw6Gc/D/WuxKGmUm0x1MAnVmi8j2SchZTNe3sJxP2xN1?=
 =?us-ascii?Q?BXpXdT1TCCFYiJksdQZDVRXdzyG19Xpd7vSSnbWHxIlxepfHrPKSVnJGChfR?=
 =?us-ascii?Q?PbwapD4PEt0BXxrpfblLM+p47Mwnp8zF2TjFumTSUdZEiui7gny2qAvDSl1W?=
 =?us-ascii?Q?Bhu5NIR0GevxqOYQ9kzDuFAyyKws6SVPb49NijTm0huitl/4SrLNwOEJCl1l?=
 =?us-ascii?Q?jWyjF2ki6vS5mgA/Pc3RykOVLkfXpo/+J22evk7zvnqP1Oc1+6jJUGrMt7R6?=
 =?us-ascii?Q?l5CTqRu7Wol3bNOJdU8ru/w1MVak9jVmyi5U98G2tmYxP594X10lVBJ6V11n?=
 =?us-ascii?Q?hBj9SqLnVeSSdVo3aX4MJjd+87USoOA8gCtvmNPPp1Em/9oNNaIrgil5iKO6?=
 =?us-ascii?Q?akzq9rC9DG6N5FfMcqJdN2Pzg+Vr9n+Y+ApNXcLIt2Zd50ouyd7A86WpaiGx?=
 =?us-ascii?Q?zpv0na2HLNpKdOJRWRQ90EoxRw3oiZZN7h2YsvXKc/I6F2corcSZVKndxidv?=
 =?us-ascii?Q?6k85qaqSsvEGhVS7ijRwvizMX0osP8BQFK/xBy/6TVmYKCGF+xC0RwdbX/l7?=
 =?us-ascii?Q?DEIMIjlXsjkEVTS/+qPihw9KHcN4g7FKpOJLkrHGAbvDEj8CyP6+7zt9ITc6?=
 =?us-ascii?Q?BWqy9ibPJzNx0ifTwNDy0418++eHkLaKdi6kuek/0AMzSU6urFGReRcL9+9O?=
 =?us-ascii?Q?KDsNZ7lKLAB5ruK1ZGPGGqupzftghHjWxQNhu1V+r9eDmwqu7N3ekUoK+QF2?=
 =?us-ascii?Q?5S7+cLdFD3I4iKUS3kNfZvgtoQFYcpAs19qNl6VaJzdrhQegF5SINcIvGhyj?=
 =?us-ascii?Q?2EEeBq3gMwvxOEL94/r9y32/CV0uLgPmUyo/8FABPcF7XlFX+qjXhX2Da3Bu?=
 =?us-ascii?Q?bqsP7hEXUy8aBxbVREENlfql5FTdBRxSRhqvLONsz6EZnxDgrHvdhA0mFgDV?=
 =?us-ascii?Q?c29jb/AGZXVITdlh7WZfcxug4gxWuvZoxrarBhndxQH0kWc0WQBr3R/Wc6mC?=
 =?us-ascii?Q?6p3lvGlxup9MXUxpEDjDWG6YVI4tgzjxOpe8efk2wgE1fdpG8Vw3JAvHlUfz?=
 =?us-ascii?Q?UwXeFNuPqCHvNTGkF7rnrXX3JDrk7QcjEZ6yt0O1yeLqa3+/AoLFA8T1zPB6?=
 =?us-ascii?Q?j2lkriATggX+GK/LdLE4a3b3djxFG8KckFzcEn/zF4Xj9nt3hNTnSOilmCs5?=
 =?us-ascii?Q?bwYJR1jWqlH8YimZVhUwXrieUXYEJGHlXN5R5QEjUt518alxOGn/+Ry1hH/G?=
 =?us-ascii?Q?Mt/gc08i1PzTrvj7pkxBiqSpwGSOP1OVoQWG1njwBCG+x+ZdvVA4zQUYbXET?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad52b296-06fd-4484-f658-08dbbeec7dbb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:58:33.5957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4Q6yTiWDO0LmORnGG4pFWFf91UBymDLOLNNaLzZNUdN7OjqMWcWxKCCSAIPIOdgsZJMqfJ8Pt6DYNn9pYV+yNsP/iIssx2jviGKswhkw7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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
Cc: rrichter@amd.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Terry Bowman wrote:
> Hi Dan,
> 
> On 8/31/23 15:35, Dan Williams wrote:
> > Terry Bowman wrote:
> >> From: Robert Richter <rrichter@amd.com>
> >>
> >> In Restricted CXL Device (RCD) mode a CXL device is exposed as an
> >> RCiEP, but CXL downstream and upstream ports are not enumerated and
> >> not visible in the PCIe hierarchy. [1] Protocol and link errors from
> >> these non-enumerated ports are signaled as internal AER errors, either
> >> Uncorrectable Internal Error (UIE) or Corrected Internal Errors (CIE)
> >> via an RCEC.
> >>
> >> Restricted CXL host (RCH) downstream port-detected errors have the
> >> Requester ID of the RCEC set in the RCEC's AER Error Source ID
> >> register. A CXL handler must then inspect the error status in various
> >> CXL registers residing in the dport's component register space (CXL
> >> RAS capability) or the dport's RCRB (PCIe AER extended
> >> capability). [2]
> >>
> >> Errors showing up in the RCEC's error handler must be handled and
> >> connected to the CXL subsystem. Implement this by forwarding the error
> >> to all CXL devices below the RCEC. Since the entire CXL device is
> >> controlled only using PCIe Configuration Space of device 0, function
> >> 0, only pass it there [3]. The error handling is limited to currently
> >> supported devices with the Memory Device class code set (CXL Type 3
> >> Device, PCI_CLASS_MEMORY_CXL, 502h), handle downstream port errors in
> >> the device's cxl_pci driver. Support for other CXL Device Types
> >> (e.g. a CXL.cache Device) can be added later.
> >>
> >> To handle downstream port errors in addition to errors directed to the
> >> CXL endpoint device, a handler must also inspect the CXL RAS and PCIe
> >> AER capabilities of the CXL downstream port the device is connected
> >> to.
> >>
> >> Since CXL downstream port errors are signaled using internal errors,
> >> the handler requires those errors to be unmasked. This is subject of a
> >> follow-on patch.
> >>
> >> The reason for choosing this implementation is that the AER service
> >> driver claims the RCEC device, but does not allow it to register a
> >> custom specific handler to support CXL. Connecting the RCEC hard-wired
> >> with a CXL handler does not work, as the CXL subsystem might not be
> >> present all the time. The alternative to add an implementation to the
> >> portdrv to allow the registration of a custom RCEC error handler isn't
> >> worth doing it as CXL would be its only user. Instead, just check for
> >> an CXL RCEC and pass it down to the connected CXL device's error
> >> handler. With this approach the code can entirely be implemented in
> >> the PCIe AER driver and is independent of the CXL subsystem. The CXL
> >> driver only provides the handler.
> >>
> >> [1] CXL 3.0 spec: 9.11.8 CXL Devices Attached to an RCH
> >> [2] CXL 3.0 spec, 12.2.1.1 RCH Downstream Port-detected Errors
> >> [3] CXL 3.0 spec, 8.1.3 PCIe DVSEC for CXL Devices
> >>
> >> Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> >> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> >> Signed-off-by: Robert Richter <rrichter@amd.com>
> >> Cc: "Oliver O'Halloran" <oohall@gmail.com>
> >> Cc: Bjorn Helgaas <bhelgaas@google.com>
> >> Cc: linuxppc-dev@lists.ozlabs.org
> >> Cc: linux-pci@vger.kernel.org
> >> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> >> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> >> ---
> >>  drivers/pci/pcie/Kconfig | 12 +++++
> >>  drivers/pci/pcie/aer.c   | 96 +++++++++++++++++++++++++++++++++++++++-
> >>  2 files changed, 106 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/pci/pcie/Kconfig b/drivers/pci/pcie/Kconfig
> >> index 228652a59f27..4f0e70fafe2d 100644
> >> --- a/drivers/pci/pcie/Kconfig
> >> +++ b/drivers/pci/pcie/Kconfig
> >> @@ -49,6 +49,18 @@ config PCIEAER_INJECT
> >>  	  gotten from:
> >>  	     https://git.kernel.org/cgit/linux/kernel/git/gong.chen/aer-inject.git/
> >>  
> >> +config PCIEAER_CXL
> >> +	bool "PCI Express CXL RAS support for Restricted Hosts (RCH)"
> > 
> > Why the "for Restricted Hosts (RCH)" clarification? I am seeing nothing
> > that prevents this from working with RCECs on VH topologies.
> > 
> 
> The same option can be used in VH mode. Will remove the RCH reference.
> 
> > 
> >> +	default y
> > 
> > Minor, but I think "default PCIEAER" makes it slightly clearer that CXL
> > error handling comes along for the ride with PCIE AER.
> >
> 
> We found Kconfig entries do not typically list a dependancy and the default 
> to be the same. We prefer to leave as 'default y'. If you want we can make 
> your requested change. 

The tie breaker would be to follow whatever the local precedent is.
Indeed, it looks like "depends with default y" is consistent with other
drivers/pci/pcie/Kconfig entries. So I retract my comment.

> 
> >> +	depends on PCIEAER && CXL_PCI
> >> +	help
> >> +	  Enables error handling of downstream ports of a CXL host
> >> +	  that is operating in RCD mode (Restricted CXL Host, RCH).
> >> +	  The downstream port reports AER errors to a given RCEC.
> >> +	  Errors are handled by the CXL memory device driver.
> >> +
> >> +	  If unsure, say Y.
> >> +
> >>  #
> >>  # PCI Express ECRC
> >>  #
> >> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> >> index d3344fcf1f79..c354ca5e8f2b 100644
> >> --- a/drivers/pci/pcie/aer.c
> >> +++ b/drivers/pci/pcie/aer.c
> >> @@ -946,14 +946,100 @@ static bool find_source_device(struct pci_dev *parent,
> >>  	return true;
> >>  }
> >>  
> >> +#ifdef CONFIG_PCIEAER_CXL
> >> +
> >> +static bool is_cxl_mem_dev(struct pci_dev *dev)
> >> +{
> >> +	/*
> >> +	 * The capability, status, and control fields in Device 0,
> >> +	 * Function 0 DVSEC control the CXL functionality of the
> >> +	 * entire device (CXL 3.0, 8.1.3).
> >> +	 */
> >> +	if (dev->devfn != PCI_DEVFN(0, 0))
> >> +		return false;
> >> +
> >> +	/*
> >> +	 * CXL Memory Devices must have the 502h class code set (CXL
> >> +	 * 3.0, 8.1.12.1).
> >> +	 */
> >> +	if ((dev->class >> 8) != PCI_CLASS_MEMORY_CXL)
> >> +		return false;
> > 
> > Type-2 devices are going to support the same error flows but without
> > advertising the CXL class code. Should this perhaps be something that
> > CXL drivers can opt into by setting a flag in the pci_dev? It is already
> > the case that the driver needs to be attached for the error handler to
> > be found, so might as well allow the CXL AER handling to be opted-in by
> > the driver as well.
> > 
> 
> At the momment type-2 devices are unsupported and the drivers are not 
> available. The absence of CXL class information in type-2 devices will present 
> a challenge in identifying here. We would like to defer making change here 
> and address this in a future a patchset. 

Fair enough.

> 
> >> +
> >> +	return true;
> >> +}
> >> +
> >> +static bool cxl_error_is_native(struct pci_dev *dev)
> >> +{
> >> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> >> +
> >> +	if (pcie_ports_native)
> >> +		return true;
> >> +
> >> +	return host->native_aer && host->native_cxl_error;
> >> +}
> >> +
> >> +static bool is_internal_error(struct aer_err_info *info)
> >> +{
> >> +	if (info->severity == AER_CORRECTABLE)
> >> +		return info->status & PCI_ERR_COR_INTERNAL;
> >> +
> >> +	return info->status & PCI_ERR_UNC_INTN;
> >> +}
> >> +
> >> +static int cxl_rch_handle_error_iter(struct pci_dev *dev, void *data)
> >> +{
> >> +	struct aer_err_info *info = (struct aer_err_info *)data;
> >> +	const struct pci_error_handlers *err_handler;
> >> +
> >> +	if (!is_cxl_mem_dev(dev) || !cxl_error_is_native(dev))
> >> +		return 0;
> >> +
> >> +	/* protect dev->driver */
> >> +	device_lock(&dev->dev);
> >> +
> >> +	err_handler = dev->driver ? dev->driver->err_handler : NULL;
> >> +	if (!err_handler)
> >> +		goto out;
> >> +
> >> +	if (info->severity == AER_CORRECTABLE) {
> >> +		if (err_handler->cor_error_detected)
> >> +			err_handler->cor_error_detected(dev);
> >> +	} else if (err_handler->error_detected) {
> >> +		if (info->severity == AER_NONFATAL)
> >> +			err_handler->error_detected(dev, pci_channel_io_normal);
> >> +		else if (info->severity == AER_FATAL)
> >> +			err_handler->error_detected(dev, pci_channel_io_frozen);
> >> +	}
> >> +out:
> >> +	device_unlock(&dev->dev);
> >> +	return 0;
> >> +}
> >> +
> >> +static void cxl_rch_handle_error(struct pci_dev *dev, struct aer_err_info *info)
> >> +{
> >> +	/*
> >> +	 * Internal errors of an RCEC indicate an AER error in an
> >> +	 * RCH's downstream port. Check and handle them in the CXL.mem
> >> +	 * device driver.
> >> +	 */
> >> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC &&
> >> +	    is_internal_error(info))
> >> +		pcie_walk_rcec(dev, cxl_rch_handle_error_iter, info);
> > 
> > This would seem to work generically for RCEC reported errors in a VH
> > topology, so I think the "_rch" distinction can be dropped.
> > 
> 
> The pcie_walk_rcec() filters on PCI_EXP_TYPE_RC_END devices. As a result this 
> iterator will not apply to VH mode devices (PCI_EXP_TYPE_ENDPOINT, PCI_EXP_TYPE_ROOT_PORT,
> PCI_EXP_TYPE_DOWNSTREAM). This series is focused on RCH mode. VH mode port error 
> handling will be addressed in future patchset. 

True, yeah, makes sense. My concern was potential cases where there is
an RCEC that needs to be consulted on VH protocol errors, but that can
be addressed as you say in a future patchset.
