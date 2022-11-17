Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2D762DD76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 15:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NChR80H3Dz3f3V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:01:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLri4GMq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=ashok.raj@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bLri4GMq;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NChQ76cXCz3bP1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 01:00:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668693632; x=1700229632;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NGrpr64So9KvCWHzQ/Tzdh0PIOfHQ7v9O/mDGPZzBdQ=;
  b=bLri4GMqi6mRhEgG3Sw2dHDXZ9nnIf9oZcoZ6QrFYWy4UbRYNq+9lBdB
   l3sH8/QookcTKBErFR96h6Xlot/cOi4o/a8kyAzXs6aAIzeHSWvfjx5ko
   1GeuaNGFxVCiaPgy+HY+SdFaPg0uwtliGbGVEr8Nk+x+0AUH1duNQ6RFT
   /PLfz44Tj6IzCCLWhlQovq+dRCwM3NoXbFwbFHbhvo//9s/Pnyw12c6zs
   LQH0VCmm08xgL7zEMsNlXGWg4dGCYlpO5M45hD5mdvrO96OSXSjQPKQQP
   1fr3MvLIT+SuB5F5/5iqZJMQsKZWBi0liy/pNm6SpEWm1+caQUjOJ7k+a
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="293249134"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="293249134"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 06:00:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="884875936"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="884875936"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 17 Nov 2022 06:00:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 06:00:20 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 06:00:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 06:00:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNl/zVtQAWBmc3SZfBAZYQzgyMpNtp75+04FyTtxUuotfrmwPUtAbttZxtynmmPX8LFKB90bfTgU0GWkAA7qYJB2c8ACOMhVUfTxpO/zjPgArrMU84T+URQj1/Z2uB1VEVIA+epPnwqxKkheiNqDsFSJvJhO4Bt0PBGv7wbeiitMe5c1JRyJOwfrWC7++qBL/0FEQfrDtwAbt7Uj1tmGb/cM2P8kAXhAUQjBaE5NVkV25FMdlRpmO4Y6roRMx3nJ5ErIW9O/7Zp+3zv6QLUt8hF2kLFbQAafIeFBQKh55Twc4G4+br1NFd2df3OmbwB7XEnyqsS6NapPwdoOzhY30w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ta245wnyjXIRgoa6iThaof5sEAbt+zFD7OGFXFsVtEU=;
 b=Y1Y5E60UIvxdsKZJc6x5oN6CtKChzrrD1Ps2SbxvpHZUgaVru+AC0hvSk+9FL5WnTZXaIwLcisKox7lmu2n3x3Rfsq869dxSEPHyErEpyt//jwJZjBpbuLOxDyS/bvnaKY1PAOZxfa4hWYc+QFpmmVPCq5w01bezDUJvYaf2qSzltnyPLJ1rXjF7uy115A+sWXjoyY/Uq+hnNo3+k3ATD45Rnsbrsh9OwAAvbuoQ6D8X4w3dYVJh7zNaXuO4nvPyVMBuMwWuRygvIKHkaKbi/vNmWubsvGzS72WdEQRqAPttn5QsEzdx3w8SGZH1YCaXZY00XzAMHNq/CLPgGYv/Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by LV2PR11MB6046.namprd11.prod.outlook.com (2603:10b6:408:17a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Thu, 17 Nov
 2022 14:00:16 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad%4]) with mapi id 15.20.5813.013; Thu, 17 Nov 2022
 14:00:16 +0000
Date: Thu, 17 Nov 2022 06:00:11 -0800
From: Ashok Raj <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 01/39] PCI/MSI: Check for MSI enabled in
 __pci_msix_enable()
Message-ID: <Y3Y+a/s/lq0sd2Ej@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.653556720@linutronix.de>
 <Y3UEFBJW1toFJZGn@a4bf019067fa.jf.intel.com>
 <87cz9ln2zu.ffs@tglx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cz9ln2zu.ffs@tglx>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|LV2PR11MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0a2fcb-fd23-49ed-7d35-08dac8a40d40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5hSR6eBBL0PQ5eOfKfEcpEmay6I1M+pg+LC2oS83BcIZ9/Mi84ek2t5xHagYHn8+6hw3SMEO1j86ci9Qr/BaXDqjAHZ+rytMurQYA2eJZifQhf6m1niYpRnL5fRfuEWSMMGmaGydeIUVHhQmlS5L4NBsDo1tHLjzp//qV1o45ZZlLtB6B6ajCv/A3A31ZG4DvWBxY3SlQrPrY2MLxwv9vXNUUDB/2TbPBW6LJioiKO1r93G0BZI5FxKWgMU//NH/uAI85yumaRdB/e1Iv1aUBUM4jlKIFleNcYe57lJPwiTFkJdwChpI2GSJOUjcVoTz6k3CTRHqw9Z00EwUqxhJoxPp2Htx9lN+NSYytgi88ZPF+tuZvXmmC+2aUZXWM0YlmMTc7I/4xoa0F3buDwJoJ0wLHiqyJNArDnrDc1IMSQoHOVR2TlkGEIVuRoXYt3GKLpDMOJP2E1vAPbv3fmqYndufKcovvYVjTPU/yIn+YFKukwA/Cwz4xSvlSucnqwvgA5P4O+ynW7wQN6cfOVlKa/HOvC9gG9kSE/hSRd1Ir8K61w1e4CF8TAZK4R0raoDQtLXWGoRNL2al4nl31YLXJ3eqqGn1z9SyzcPXuoGpzwcAnmTSoKx99mw1QVLKPG4T7v1fMmU6A6XwdemWskW9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(39860400002)(376002)(136003)(346002)(366004)(451199015)(107886003)(6666004)(6506007)(26005)(6512007)(6486002)(186003)(478600001)(83380400001)(38100700002)(82960400001)(86362001)(2906002)(8936002)(7416002)(4744005)(41300700001)(66476007)(66556008)(66946007)(5660300002)(54906003)(8676002)(44832011)(4326008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3rY8XKpPg/F81iisymsi5efNwldOflosUqH6jObcWQVQG1J0BivDpx+GqrBK?=
 =?us-ascii?Q?SkyKN/wx5Vq5VOB8LBL+p+Dp5Xp8rEHTaPAUiklRF/HpAJcDft3j8vGlRrVt?=
 =?us-ascii?Q?KIBCSHhFKA93McEXlO6dSDmSlMnlATVBLeX6UKaXtXzlQy9AZ4ligo4W0Gmt?=
 =?us-ascii?Q?xCgF037mSAKXas+7BC9qvKrubdAJz2FHNH/8B3wjr4Kw3vmD241fr7h7FjWi?=
 =?us-ascii?Q?ipnPH5yAnl12tkydxlgCMQcP8u1iAEm7QYcahB363oN0dNtc2enM6f+39La0?=
 =?us-ascii?Q?6Oxh4ypgjUizKlYk86ZV8HkTlvQwczrvmt3ZA1iRkyH9uJmR9KE/gb8S7yU9?=
 =?us-ascii?Q?EZtLKVMjYPzbLlelpFq9u2ZXgD817T4npvr6fR1s+5+3ca5B0PtYCXfTUaYx?=
 =?us-ascii?Q?jafmx4Xom6qqY4aOA2Ae/QQqdyr1I9d9NE6ZYWcoIeea7I70Sn4f6moMsM1C?=
 =?us-ascii?Q?5krdg/8c0BZk4AZHKx2fl1e+ExxK+rf80VDNC+XYa7nBWmD/y29SkrZCboyl?=
 =?us-ascii?Q?sXNLW34j3ApNvAXVmuZTCUl3L9mmpuq7z9PeWABT834/gM2VDtAuXEnJtr9l?=
 =?us-ascii?Q?8h41WYsTDxy7cygT6Um6iFJpC5V3yxLSg6eY4if7HD7eilv/1bNNnIsVZNA7?=
 =?us-ascii?Q?2Vl34g6rLyOXjUH8y9id/xV1drRQp0a12+BiuwoRhGzTXNUMdKiYd0tGVqng?=
 =?us-ascii?Q?MW1QB/bxGcfqiQ3aRXVTN7nYIYCkRB4NTHp1Is1y6xBwSzUTem43QOQS8lmC?=
 =?us-ascii?Q?xYt2Zk0AigdZfrAQZxmwkJZ56HlsI7DIQS850L041nWI6A2I2tkQQ4vYbt63?=
 =?us-ascii?Q?3dpax2eF1nBk64iLfcXAjyysVHupLkojQL4pSczcnuXaOdtNzAsFjrBfrCVU?=
 =?us-ascii?Q?Isp8JSFJq/civ+9TJ6T9rCFeQJvX0hRSCADqCijpcJo+2aOqlIgTESeNlRSG?=
 =?us-ascii?Q?XscZJUMNVne/V6ulNxvPKaNeaQZ39CNY9IxN9/ASJ0hfKqVSbzXrE7+h3UIc?=
 =?us-ascii?Q?PVGIFNSQurtzS5+L+oHS/Gk7895Ycf6k9Jxc5mZ3ONKjv3WvBOvR9SYFKs9v?=
 =?us-ascii?Q?L7Dm+U1NYXR3tTDMMTVWgzeUslNVv5/IZcvpemyfbEuA+uzmZmwrCkq4+JLc?=
 =?us-ascii?Q?acePW9R14ODaEKXr+vMNP/tNoaUka4Eaq9Psaf+AVxqpQPYvtKywBPvA3y1M?=
 =?us-ascii?Q?AISL7LjhvCGIRxvXeNJwv1viy77FlSYhpOejHaqdoMmCCHRGYRqjEnpF9TOW?=
 =?us-ascii?Q?ltvqXVYqwRTVH5yYNVBGZambj/tUEUPItKkhAbDSfkD2Ch0IgzXTlJGJLaRF?=
 =?us-ascii?Q?E73xnZI57944Qno/r3ARss1mOeHLGhezXE0EQlyPlMsOSbqsufLUItw91toZ?=
 =?us-ascii?Q?RAyUvHe993aQ/p5fgxLOLbpWOTpRAZo4JWz6CyRcCyq/DZ4VflvVyg7lyQ1R?=
 =?us-ascii?Q?neols6tyVaLTl96di4AOFzZE011Ao9AIBbWPCe4aK0nXARvdnj6qK2j5RMsq?=
 =?us-ascii?Q?WnsY34cNMMkYQDzwdWnijbeINrDkuSHEO0UecItajY1U1b8IDW6PQIVP2u0V?=
 =?us-ascii?Q?6Fwz5jICRORBsBjTdkkp+VdSGljnB1NAmh+rmbWWrK4H3pagw82Q0nxXuaMr?=
 =?us-ascii?Q?9g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0a2fcb-fd23-49ed-7d35-08dac8a40d40
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 14:00:16.6849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moF8mpSVxQV10VEdC/aU9aJqocHNQsQq9MhKplG4zn1E1k2v6a+nVfUpXe+ttfbjgXCFsnhaM83BOm97QxNY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6046
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 02:07:33PM +0100, Thomas Gleixner wrote:
> On Wed, Nov 16 2022 at 07:39, Ashok Raj wrote:
> > On Fri, Nov 11, 2022 at 02:54:15PM +0100, Thomas Gleixner wrote:
> >
> > Can the pre-enabled checks for msi and msix be moved up before any vector
> > range check?
> >
> > not that it matters for how it fails, does EBUSY sound better?
> 
> Does any caller care about the error code or about the ordering in which
> the caller stupity is detected?

No, I don't think so. That's why I prefixed it with "not that it matters" :-)

Just thought it would be good hygiene, but doesn't change anything functionally.
