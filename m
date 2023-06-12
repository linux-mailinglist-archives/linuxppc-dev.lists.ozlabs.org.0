Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DB72D4B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 00:51:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJtxMjgb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg6PY13YSz30Ps
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 08:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QJtxMjgb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 08:50:52 AEST
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg6NX4W2Zz2yHr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 08:50:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686610252; x=1718146252;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=05a2kHUlacfCcxl/Xe/lhm70MBf44iuCGNiGL6XVzW8=;
  b=QJtxMjgbHYf0+OUfmyx+yYol5y3ZDTs5xcPtTH7zQ0WCv/h1IqpFNt4j
   VXtCflOMjmrgZ9MY9soJOd+xqntnYMVyL/9x6LWGRqg0OAEyGVgZsw3fF
   etJu5vrzMpriDT9r6QM6Kwr3egS+ft9yyQYmA7nPpvlAMAN+USAtHJZXF
   KBrEftSJDc9mYQZ5lAv8kdBzGuViRHlvJnpWfmEX4CQWFe4Dc2GqpkWdZ
   +i9+kg+ignu85AWk4ABT8rZAorY6rlJnCs+rjTqQUtPzYJYNYxILJCzOY
   T5To7q0mJqMU7YLuWAjXqOgwhhhHYd/PwLj71jq/jT2sTDN8wSaLe5S/I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342867587"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="342867587"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711393448"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="711393448"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga002.jf.intel.com with ESMTP; 12 Jun 2023 15:49:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 15:49:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 12 Jun 2023 15:49:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 12 Jun 2023 15:49:36 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 12 Jun 2023 15:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PX7v65l3feNnn68Xiuxx6So6b9dh/pypu8x1/4Ulm7rZaKSbVVEGZTJxbkWcLs9l0vtL7j3ItDyFacvFAWXlDA097mC29LwdHmPXugIZCT/ZLq5cupk39xdHPURp7KlOZX/OUF9YzVxaHMAXJeFK8LW1DbYmFT6IBLWuFhqVvbO7SH7Fmn84IzXmVvS9xyOvFkfAb7FB6hqliM6mZo8r8hcBa0Uil4WSx8GFHPCHzakSde56v9ksXvclI6zrfQxgM+dpV+q3p0pc3S01lsOpsA3850DAvmyFzi7oAig1xwqPt7zKwv+xgMg3xSbDJkUxxUw3N6oycY0Od/FoNkJmkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIKvM3IkJkJZb7RDJXj5GmBWIGrQnRcdMM4QHe0wscI=;
 b=Mtq7QWs41xaxTYq2tDkv5Z9cv8QByvfa0NcJZdDlJ3aimdNLv37BHK0x//V3Gs2z1l8r4TPelHfEqfxGSDMGYvfLAtGTXPPp5GrU61uzJN4TrEJF3frotX2q3q4+AstfcHVMS64XrGHnPcFT4y9Tym0KByGOf41suKz+pxLHl5n2AE7oW0PYJX5WpGbnLQzvQ8+kV065gWZq/JzMoQ11ypF+K5QmQOPEKYlLCDQylyVG4//b8qGHRSGkycQ6AtHIbCdpec9RChjCUVS1ZHzCaCR74OkjPK/HWOx9rOj+592TrycdhM2okFbWOEDbXqYnbEm09Y617WnaD3y6shkiTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 12 Jun
 2023 22:49:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::95c6:c77e:733b:eee5]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::95c6:c77e:733b:eee5%5]) with mapi id 15.20.6455.030; Mon, 12 Jun 2023
 22:49:33 +0000
Date: Mon, 12 Jun 2023 15:49:29 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Terry Bowman <terry.bowman@amd.com>, <alison.schofield@intel.com>,
	<vishal.l.verma@intel.com>, <ira.weiny@intel.com>, <bwidawsk@kernel.org>,
	<dan.j.williams@intel.com>, <dave.jiang@intel.com>,
	<Jonathan.Cameron@huawei.com>, <linux-cxl@vger.kernel.org>
Subject: RE: [PATCH v5 25/26] PCI/AER: Forward RCH downstream port-detected
 errors to the CXL.mem dev handler
Message-ID: <6487a0f9d58dd_1433ac294d@dwillia2-xfh.jf.intel.com.notmuch>
References: <20230607221651.2454764-1-terry.bowman@amd.com>
 <20230607221651.2454764-26-terry.bowman@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230607221651.2454764-26-terry.bowman@amd.com>
X-ClientProxiedBy: MW4P221CA0019.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::24) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e10693-f7e1-42a0-3dcb-08db6b9749ee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wgE4Ip3lmOUWijyG+nAIphh2+8C8qIwrQgs3sxCOPgtg+6kHHzH3cDT4bq/zqiUjdtr3XasXWFxKSmOSEYTz8j0eKWZq/bM8d3D2wFzWAuIL6mqBdmudOUPxfTcoquF2t9Nut9rhwPaUXOfzh40H3vYFPYFVvgXhUdo9p3pDOQEb/l+tvxBFV65BwudW7n/4KZI4KwxCGtY0YCoGIcnrP523iFP8qR+wPBFOJhoSPUjB5/K+mYd1zZyCYM4uKC8+Vv2VAS71vxmjUyjgKINQBN5rJoSPoKoZWcqiTOfCz8aDTwo0KbYB4YCbC1GSP0vNjhIuZn9be3h9JjfZ3TNAQN7jocbkLZV9XLi9USVf1nnCY1lDxqyREVjJ9ONh5aJMwqpKbNcghOq9M6fvItGMmmgk9JSlxaagbd3SIIz9sYdYGzkDjN7a4OJJJ++Xkj37CeUc6ckPASh7XyOqqvpMRf68tHj91iBu72J+kUqF3F6J8nXfYVwkUtRaATMQ7vdquZpyi80Mqka0wLUAi3IX8lfB24OnXMkZcsD8vsYwgXp/rmEARnVf2DlDGplYtqavQ6tyHvwEFe0jMeY0cEn4O/fd6BDgNxlqcFOArj0sZLc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(9686003)(6512007)(26005)(966005)(6506007)(83380400001)(186003)(6666004)(66946007)(6486002)(82960400001)(66556008)(66476007)(2906002)(41300700001)(8936002)(38100700002)(5660300002)(8676002)(478600001)(7416002)(86362001)(316002)(4326008)(309714004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NvXrgxy2834nZaEmfqunPbiVLR89QmMg2STEgIwQEd0o2nXxaNpopmndlFKr?=
 =?us-ascii?Q?Mo6PCqf6kQAsos0TiJh5cEcrFR+uG4tE/obZ60t22KGWJ8RezTmZnS5WSDdR?=
 =?us-ascii?Q?MA5E886cCpytgvOL6AbIs3EN0DRzBqkVzJ6DJAMpUl2EUZjHEf35O52IQS7I?=
 =?us-ascii?Q?/iv60JfUrMUwMM/l5CJJpiAUTBkqQTxXbdEu3ZG98huBSmmUVGQakLw2Zdmi?=
 =?us-ascii?Q?yRHeOehRi79QdkpyJcdFhWjdSA0gUPYfrBdjdaVWjizzkdle1eThIumTKeu7?=
 =?us-ascii?Q?Qw2a/azoErJZ9kXEpcc07rFa6y+4C+2v0Hvr+6DhUnvHNdxS5ijLLCaVzo//?=
 =?us-ascii?Q?BBKsgpvRvnwW7w7tRjwwjw3ROUWZwpCkAEaxfzyEcs7fanaqwZ+EVEi+VKui?=
 =?us-ascii?Q?VYRiV1uBhWGRIF7R1anP4aiBBFJo7Btx1I2fnzauGexbqsuMvwm/Nes3zwcK?=
 =?us-ascii?Q?69qsORdHH61WlSh6Y1HxWlO4TO1TRm/pnZjkBn4GYhLwdfO74K7GUkr+dTbG?=
 =?us-ascii?Q?5X/egrjiX8nDy1k/hFfIkrxFqT92mlgVIm/8V2L6p+GvTgwMWEDEN5eO71T4?=
 =?us-ascii?Q?NtOVUza2SR6DQXsKV0i8Pek2sAkr2SO9LAtYXtQCgqvfZWrYybjn6w9t6X48?=
 =?us-ascii?Q?v3UwlBv0ziFUFMSxI4XK69cAKsLe4jpCaBDDC1KdLgnqfZkVoghbqFZsYynE?=
 =?us-ascii?Q?GMDjECFcJNfDdaR/Q8/PAQvMJzmU83o1xCzkXabUPLVppjp1IZlf85wyLxWM?=
 =?us-ascii?Q?+acneJ9LPttzpHWsvswVqWXPS+/flxf3ab0u1EcuC/3p5m+pEj2XNaXlElhK?=
 =?us-ascii?Q?HlqeCk55EJ5qrvUhLfnTaXz7JhQ9MrAl1P1pxzJUgBS69zaZz2rgejtPaYY9?=
 =?us-ascii?Q?/ZtRPH1LFeBl35ZNUERd4VguUXIExRovjvjoKMVddQxlagKOqs+2q51k/o2N?=
 =?us-ascii?Q?JwQwxc23T+p69Lv82zROxwsYVc/oYBoe09n72uPIPgPsTk0GpzInszCl6H5C?=
 =?us-ascii?Q?FZ9fXCPIJP7AHPq9VvpBSk9zlKlZ5aTvQHm5foEX47tiIwIC83HZ/BtAOcdL?=
 =?us-ascii?Q?bEfWmng3yQN4yUOylxMblBlJ+IHNfckbBjY0brBWiS1gwDmAFQiqOx3R4+nt?=
 =?us-ascii?Q?kdYrokwqrBVWh93ITHbclLQX3rlyS4742D3BdezDNe7ZSQ2kB1ppz24CElA4?=
 =?us-ascii?Q?LulwRSVWYHxWzx7BXcxC8/5rkleMjpoX5YV0iZym6IJ9mDxELjPioOr8km9s?=
 =?us-ascii?Q?TJKKXy3YfMzQwNC1sIPjMDNvpRbZO51BZ8rftwKRYfvnN/OxnZUL7nOAysVg?=
 =?us-ascii?Q?lG02/tez1wqoGqi090QHy21I0uRNUZVZPLk4XidD98Xn7FdCs0Fa/QhjexpF?=
 =?us-ascii?Q?ImQGuGqcanjqhmR7je2l0HNZYnGgkHNHOUdTOZYHdwZlh27nGnVNjZVjoaYK?=
 =?us-ascii?Q?pecaingYaQYcCG4ehtli/wx5shQO9IRVbTeLb6oTIbTR88KXbAG0ZhGf0C+E?=
 =?us-ascii?Q?ftiInetASNXstpyJCXEouM6Ndm4XSOdLa+HPGBMMVWC8OeSQs6BdFhmqHwrM?=
 =?us-ascii?Q?xXNunf0nDYt25FdqEBEyCr1inYqag0ca054Q2gD8+uyURsoWRzaLc/lGSCCX?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e10693-f7e1-42a0-3dcb-08db6b9749ee
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 22:49:33.0930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxs0rSS/5Vhs5M0/DXi/OQ4BYPA1XPBDcE0pcnE295lCAw8j7Zm4puy5R6mipvBEhtI36MEOYETha8s+t7r/6GXGuxm05B8GDBphYv8dPbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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
> Requster ID of the RCEC set in the RCEC's AER Error Source ID
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
> +	default y
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

I think this is ok for now, but I expect it will want to be something
like dev->is_cxl in the future where that is the cached result of:

        dev->is_cxl = !!pci_find_dvsec_capability(dev, PCI_DVSEC_VENDOR_ID_CXL,
                                                  CXL_DVSEC_PCIE_DEVICE);

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

If I understand the RDPAS implementation note correctly, 

"Probe all CXL Downstream Ports and determine whether they have logged an
error in the CXL.io or CXL.cachemem status registers."

A VH topology would want to do something similar for root port error
events that get routed to an event collector. Now I do not think the VH
case needs to be solved in this patchset, but I believe this function
can be called cxl_rcec_handle_error(), and not need to be specific about
the topologies it is handling.

Other than that naming quibble, this patch looks good to me.
