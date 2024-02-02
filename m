Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A897E847700
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 19:03:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZJwRLaik;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TRNtm4VwWz3cND
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Feb 2024 05:03:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZJwRLaik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 03 Feb 2024 05:03:01 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TRNsx1PThz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Feb 2024 05:03:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706896981; x=1738432981;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4nFPKsGcSzualX8MxwksRlAd9fi6rqKt56QZ2cR8BO4=;
  b=ZJwRLaikNOe0UOS/ui8oWsPzq0BtkTA5KiMYNLmRYg/t1mYATW/zlzPm
   +JZNTqZVM5ZPmqEJQ3x0ZHCU9Ors4d9KpxB7IOYTdeM1rtMo9YE1cgjKM
   1O1zvPjVqBfQyTCsFx3RTy2jiXxAPhCZql5V4NPMwe15yP+3qxxxIiUpU
   /LUQgG9TbV97tqYo+Vmj2irzILvM5ZU1zZ6MBvoUSg09dRHA8uwNIFMDn
   2r600ObbvgCSF6TgYOwCuIq/wBJeQDx7E1VVWksm+zQIC5dYoO/msDb6l
   B+GRFO6NXU3x5TCXwP2XyJSmx1HPVwGSR2f3U14kifoDaQ4gkZJg1ci0G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="381514"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="381514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 10:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="453057"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Feb 2024 10:01:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 10:01:49 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 10:01:49 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 10:01:49 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 10:01:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBPUukZGVRpodDpANRnxbMrIb+Zj3bq5Uun/H1BXoGASBnJD1rzxX/ro6g7QD7hONRSxi306UCz3iosYSoFq4OBwXoeGdLTPNIC3hutJ9Bsmu9VYmPpNbnvbKH6xXoLlOEiZzjz+j1Dr1LSZ1WOome1pGb2gugrmH/mp13XJ40uZPLMlmEhLT3hj+FAlX1nUeozHymPf5ZyAGVNwAh7KmSE2vXBuBAsbaX86zQEfg8DGfc7Om7Q/e7P9nCVETPFOdH4dTUcYExS8DVXCBAW91MNk1sdY8p3PeyGz1B+NT4T4sR+MHPzPUwZaEYQnFTK50lnFkpjingxUOZSEmi6W8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tfZYgklJ6Ne9njao3xbYFdXDMmtKd88rwK2t5SPKbOc=;
 b=JMnkS2z4+LgZ/Gcn1y7gaaYEznYIqf+yQa1i1TURQmizDls07LZOp6IVXSmkAl/lUac4W24qysmY02zPA+CXMYW+KSaf8TqXS6RqnK8FujuCS3L2oe/IOkBX0r/3lUVYQjUneqPH/9VjoXFKuuwapWH5gAPR8lfgaLcC7I/BPsQOOljkOIHGQIGGbZbChvPW6tKsT9tvvw8RjDHoQ3nfKtYBzPXhMxw24smfBzZonJT52jokQTG3g4eH7KRLi0mA9zeE/ZWt/vuBzzo4vMAXtASnlQcJR6YTYxIs1ZkXYHxbHhWeGUqf1oj7uy45Tii4OO49K48gXk9C1/HqVAYV7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CH0PR11MB5506.namprd11.prod.outlook.com (2603:10b6:610:d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Fri, 2 Feb
 2024 18:01:45 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6257:f90:c7dd:f0b2%4]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 18:01:45 +0000
Date: Fri, 2 Feb 2024 10:01:40 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: "Wang, Qingshun" <qingshun.wang@linux.intel.com>,
	<linux-pci@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] PCI/AER: Fetch information for FTrace
Message-ID: <65bd2e04aed44_2d43c29463@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20240125062802.50819-1-qingshun.wang@linux.intel.com>
 <20240125062802.50819-4-qingshun.wang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240125062802.50819-4-qingshun.wang@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:303:8f::9) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CH0PR11MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: cf3eb480-5998-4d54-f111-08dc241904b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFrYYSoHiSlpr9TzhI9I0hKnSROdlwlosM4aV87dHV/bXmOs+C4HDWQcuVcp6UStf6Qf2wQc+yDMcij4K6rS4vBD2iidI+S8p1MpYQabBl40190yxZ4QXGteoIM1CCG8cKO/k91NUrHbyBNmp0DRTTLoSI70wsRgLKC9JYmQ+QrlONKRtEBJtHYiZ3IYtTmzkZtsSVdrD50a90tPE0X+R7MjrXYrfDBmeUMoc87S6yQgCVUc192RoQ/2M6dRmyB86IY0yXj3UrPwb1PmDdF8F1VY7x6vD6csgjoQsb/+w4NlnmzVXSb3V8w3rGOcnyg8/nPUg/muR7BFv09qOLQMaYhzhinkKHitwJqH3Y6dwo+RImMKKvkaPM1BNHgIG27kVe4Y5wrF2FI+/WaWnhxGbHnt99dDq1vk6fZXNd2UEaepXOy9OFIia6uSWzzE1Yci73ghYuTImbx3nqo50vecwzc0HnYyNi4h+BskzmnLJ/Wu+wc9Fuq9tZTuoa677lyqJT4GtqyVmWWNBk1W9x81aHpDsypOjFK7plP2yTgChHQih8lyryCfwIFs3n2/VKleLSZz1JY7BPNbeYvttagAwqCP1sdgAWgI9CkUetny9Fma3IKs7MOwgWKQnsII3XSr
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(366004)(39860400002)(230273577357003)(230173577357003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(316002)(66556008)(4326008)(54906003)(8676002)(7416002)(8936002)(5660300002)(66946007)(86362001)(66476007)(6666004)(6512007)(82960400001)(38100700002)(6486002)(26005)(83380400001)(478600001)(9686003)(6506007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MmxC5IqBK7VpmiylOz8C5hYmORS6ZQCJDYAOS7p3lFhIUiQuRmVvAJ8oTx2W?=
 =?us-ascii?Q?7gC7RcFx/dNdKaJCMj1azUVcxB+dP1jGdI0+UTpVrsixJATXD1x5d+Q+4Evp?=
 =?us-ascii?Q?RmVkGcRKRt6A7uhenh1SKx3qFhwHfdIn+br36QVOEV+hetOGIl+rvGu/WAds?=
 =?us-ascii?Q?CWuzBqLcHK1g0A3LXklbooA3VNCAB4HePr/9oT65Vw+ksrxc1QPj7UyW1tPU?=
 =?us-ascii?Q?bBC7B0RknQbhTHS9rDzaAecBcs0PuxKKO9GHy0nCifiknlkxDPAD97IUUEaC?=
 =?us-ascii?Q?5fCkw3Lv+CX/r9pfA6aEzRtigOgNkSJS4M3FqaPiBJk4DpgTWbDKVlLGCHnn?=
 =?us-ascii?Q?pKz9Dg+O9sr6JTdPZc8BwsNUBVWKTCH0W1oQnjbwNnZI5iopx61b9HBiyY5D?=
 =?us-ascii?Q?w5naYfI047WeuJRm1dQJzWgra0EtjhA4uzk3aKaTb2V66GtnEOU6rgCbNSS8?=
 =?us-ascii?Q?0EZ4cJGaIG+VxxfSRhmVn4RATx0mK2/CaICsRwRmofd9cUIHijzdA5pAowZg?=
 =?us-ascii?Q?9h5MLG8jwgVXoa6g1KiNaPkFSOnoZVmuoSSCF/CYHX14k5WUE1Yx5V27deLt?=
 =?us-ascii?Q?2eo+A/e3nmxskPP21OMspT4VbLFeBmo1WUYTpgU9F5CBw+wUZSk3whvDOM5h?=
 =?us-ascii?Q?2NRBGNIOlxDHcMpDv5lGYXMfEtj9PMcnXbmaeVUVej8Ig8vCN62hUdCYL1Hk?=
 =?us-ascii?Q?VMP+rUCMvrZjg8sqSuJHiV9bZkz0btJ5XHIPd4czVD0XEDv0LxSWO0v+TLtY?=
 =?us-ascii?Q?Omm8uiFXtK9mrfSU9ScpXqyeTSvrG1OnHmJlk+nBq72BO9TZ5pB5ZzWHazN9?=
 =?us-ascii?Q?s50AoPUOGs/bIISEtdCeJT/jZ+U1qIovqpdsJiIkOudwDUX29ZuJnlRQ0gKB?=
 =?us-ascii?Q?lpyiPgR07kwoeKRapoWxvEYU4er0jlaVOgA9Yp03EY5nuU7ePNaDucJkm8o7?=
 =?us-ascii?Q?nEKvMw/CyDNqpi7KAlTe+RwZfH+PwPXE/GN1oqlU0Nmi2TZJna1cYHM/ec/y?=
 =?us-ascii?Q?WtODf2Z6j1jo83lKBIO7yGJZ7KH1BN7xpHOXav/4ITmngfwKRvFQWtBm9eKb?=
 =?us-ascii?Q?5GRoK2SJeN2vi/j6pg7DJ0iSFLWSuJrAfQP5Whrf83S000W7oRuA9r4nAzau?=
 =?us-ascii?Q?uczcAmOanQ/+pYqGHhIn9HPQdhr23L5m58i0k1luh5U/+begUDyjEaligoVD?=
 =?us-ascii?Q?DxrCHki274KTOFUdp8kzbq2CFCRZ9ng9mkXbkcc8TfdhRVLd65rMWGxBPAec?=
 =?us-ascii?Q?GthtX+vvfv4gr3HY+OOpdiOK6KDErHLjlH9HZULoBA9+wK8VlFNpZfi0qPrS?=
 =?us-ascii?Q?/GSI+fAN35xYqPBmdBisjBj28Nr2ygRTbmG+l9jFw50vfC+ATvzkrH94FUJD?=
 =?us-ascii?Q?ET0u+Kmk0PRERDy/UK7huva5KHesTxp+GXjA5qmNv97w1/fN1hfdYo5w2tSS?=
 =?us-ascii?Q?vyRFsCffWjKAnqFN8PgixccHoudsnW2xv6hQ7Ydb9Mmp6xZVeIHcwQ0MhX38?=
 =?us-ascii?Q?5+cLLXUBqR2NmNFDy7KNURiw2Tafdv4NTnLI+o64OrLm1CXWVfxbmRL1Ioma?=
 =?us-ascii?Q?4gh+KBuRu0aFy8qYpCW3ZdaDN+DK70lVzOA3wbIqAHIOajBRZlvrDivxORhh?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3eb480-5998-4d54-f111-08dc241904b5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 18:01:45.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2Cd9c1VGv7LEosK26C1uvC9rlNP9JVwMX026iF/zzuUoV7qNN4Oyiyrl2GzhgscB4Ldb9938GcQBQZAuRVmui7XdeQ4dBGmwTnXp3jYdXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5506
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Alison
 Schofield <alison.schofield@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, erwin.tsaur@intel.com, Kuppuswamy
 Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, chao.p.peng@linux.intel.com, Ira Weiny <ira.weiny@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, Dave Jiang <dave.jiang@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Smita
 Koralahalli <Smita.KoralahalliChannabasappa@amd.com>, Bjorn
 Helgaas <helgaas@kernel.org>, Len Brown <lenb@kernel.org>, Robert Richter <rrichter@amd.com>, Borislav Petkov <bp@alien8.de>, "Wang, Qingshun" <qingshun.wang@linux.intel.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>, feiting.wanyan@intel.com, Adam Preble <adam.c.preble@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Li Yang <leoyang.li@nxp.com>, Lukas Wunner <lukas@wunner.de>, James Morse <james.morse@arm.com>, qingshun.wang@intel.com, Shiju Jose <shiju.jose@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wang, Qingshun wrote:
> Fetch and store the data of 3 more registers: "Link Status", "Device
> Control 2", and "Advanced Error Capabilities and Control". This data is
> needed for external observation to better understand ANFE.
> 
> Signed-off-by: "Wang, Qingshun" <qingshun.wang@linux.intel.com>
> ---
>  drivers/acpi/apei/ghes.c |  8 +++++++-
>  drivers/cxl/core/pci.c   | 11 ++++++++++-
>  drivers/pci/pci.h        |  4 ++++
>  drivers/pci/pcie/aer.c   | 26 ++++++++++++++++++++------
>  include/linux/aer.h      |  6 ++++--
>  5 files changed, 45 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index 6034039d5cff..047cc01be68c 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -594,7 +594,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
>  	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
>  		struct pcie_capability_regs *pcie_caps;
> +		u16 device_control_2 = 0;
>  		u16 device_status = 0;
> +		u16 link_status = 0;
>  		unsigned int devfn;
>  		int aer_severity;
>  		u8 *aer_info;
> @@ -619,7 +621,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  
>  		if (pcie_err->validation_bits & CPER_PCIE_VALID_CAPABILITY) {
>  			pcie_caps = (struct pcie_capability_regs *)pcie_err->capability;
> +			device_control_2 = pcie_caps->device_control_2;
>  			device_status = pcie_caps->device_status;
> +			link_status = pcie_caps->link_status;
>  		}
>  
>  		aer_recover_queue(pcie_err->device_id.segment,
> @@ -627,7 +631,9 @@ static void ghes_handle_aer(struct acpi_hest_generic_data *gdata)
>  				  devfn, aer_severity,
>  				  (struct aer_capability_regs *)
>  				  aer_info,
> -				  device_status);
> +				  device_status,
> +				  link_status,
> +				  device_control_2);
>  	}
>  #endif
>  }
> diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
> index 9111a4415a63..3aa57fe8db42 100644
> --- a/drivers/cxl/core/pci.c
> +++ b/drivers/cxl/core/pci.c
> @@ -903,7 +903,9 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>  	struct aer_capability_regs aer_regs;
>  	struct cxl_dport *dport;
>  	struct cxl_port *port;
> +	u16 device_control_2;
>  	u16 device_status;
> +	u16 link_status;
>  	int severity;
>  
>  	port = cxl_pci_find_port(pdev, &dport);
> @@ -918,10 +920,17 @@ static void cxl_handle_rdport_errors(struct cxl_dev_state *cxlds)
>  	if (!cxl_rch_get_aer_severity(&aer_regs, &severity))
>  		return;
>  
> +	if (pcie_capability_read_word(pdev, PCI_EXP_DEVCTL2, &device_control_2))
> +		return;
> +
>  	if (pcie_capability_read_word(pdev, PCI_EXP_DEVSTA, &device_status))
>  		return;
>  
> -	pci_print_aer(pdev, severity, &aer_regs, device_status);
> +	if (pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &link_status))
> +		return;
> +
> +	pci_print_aer(pdev, severity, &aer_regs, device_status,
> +		      link_status, device_control_2);

Rather than complicate the calling convention of pci_print_aer(), update
the internals of pci_print_aer() to get these extra registers, or
provide a new wrapper interface that satisfies the dependencies and
switch users over to that.  Otherwise multiple touches of the same code
path in one patch set is indicative of the need for a higher level
helper.
