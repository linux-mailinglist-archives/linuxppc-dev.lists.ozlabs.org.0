Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0B162C5E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:06:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8Zc3F2sz3f4k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:06:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJMQj+BI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=ashok.raj@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YJMQj+BI;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8Wx6MvVz3dvN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:03:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668618222; x=1700154222;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2cd/vtvrl0+vH+l7SEwAQkF+Loy3AJNLmub1WN21ow8=;
  b=YJMQj+BI4sdpSysZIOakZBVP45T81ctt4b796xrJhhbxMAhJMDBO2CK8
   2NnFv7AMB6K+mgCxGj7SE9EFLNgCifpnRzLHoGbzTA5GE/tmwkdT4qiqK
   mbvhXy3vOpHoYtm6j5XM4X1+up5nKZQ5vTPlJpgOaHEmjJ82X8KDX5kvj
   iSmXUPA47QXz6wFODIzjlPPKKlNH0uweMUtxu7gOGdTj2IeddeX4+YIoI
   q8VSaMKsda/ILEHXPMW44h/cYTdnt0Sltx8zqJDxOlJ0Z3O5qcnIn/8c1
   1s9rSTMI7I28nb9nLdzwOicnSo2NUB1yNwKKafT7AQgAP4POaiqCucCCo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="310230020"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="310230020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 09:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="670568185"
X-IronPort-AV: E=Sophos;i="5.96,169,1665471600"; 
   d="scan'208";a="670568185"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga008.jf.intel.com with ESMTP; 16 Nov 2022 09:02:44 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:02:44 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 16 Nov 2022 09:02:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 16 Nov 2022 09:02:43 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 16 Nov 2022 09:02:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yg3x6QLfP3o7rwy8juNeTevqormnqo7/2HL0S31Hk5ch3VaOkru241mopzDvAkG7puuTKqdreDR9eExmfurBLTVOqAe4OGJFjehFQmzkHJXNT1VuwSd8JtvTM95bHnmQfuxbX0fGtl+KbVY6FLv4DDPKAiLD8Cz5YrPrh8MQDvtb47TU3xzS6hKkDm8+nfWWVDnP/1CYWjS/W8kN7tuEIidLQA3NT0PWfBLFivR2M+bipM1z8DFrCPmQ9ax53z1BcIB5OOELR4eV6+hUh1c+NEx2fxFkvyZRJ+QzbqhjYIsdaXNQgbXgOaqpxHl1083zS2dEvlGSaMOrYFMIoBNWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vb37Q/2AS5nRYsgCihIXe65HTy1ovUmm23kN55ed8NE=;
 b=mF+LUPSgXszIQAesgfcxshHbctiM5ubjtYjSJnZ1r5fZYCaXON+LSuQgvatBZ2dCW6jbEXq8AayblVsxRhRt3zOvzvmgVeHqVg99gaha1ZRbKBv5YBDAs6IsLRfIEWEuEj87FyvdVKh5pyThlMVkwv5hS17e6Wa5FCDK8VydOL3zUQZrBLCEyq6librzrInk7fKB8JJIEhF1n3DfzhPkOOL3xMgOy3AWQiIRASEulZJkl7vzguu1Nju3J82qG0xcY5hxSf/+UOn7IN3Au5DtOb/NN1ApQmFa/9BFf5RK2MqSQf3FWpcGGWaV2389L4sdO3FOzzJ4oUP8n9kRJUJDHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 17:02:41 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6dd2:a8a3:7f9:ad%4]) with mapi id 15.20.5813.013; Wed, 16 Nov 2022
 17:02:41 +0000
Date: Wed, 16 Nov 2022 09:02:35 -0800
From: Ashok Raj <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 11/39] genirq/irqdomain: Move bus token enum into a
 seperate header
Message-ID: <Y3UXqw+qDTZYOzmW@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.237221143@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221111122014.237221143@linutronix.de>
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: bdd886b8-a07e-4bf6-858a-08dac7f45ea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EaDuezb69YPMfzWGxV8eghT4CQ3sJC8UHkDwGQWXJiK0LPvihDboVlFo2W5Wa3zYg8gz4jRVkE5vphHqYaKYFXSivyRIzhendUXxeqBrXEhd6rpDmedqayu1aYednwbP8YaMkjfqMKYevBN3kp8Q3k9Y603jgVmeO/ISULcYVfsPpGiGr+MPmO+BBOStPrxyQ9oHyyXCUaPafXJ2tNzWTQe/UaUi1LOYYQeqc+zMuCh0f20oEZS4vr46n1EGLc6NneOQcfIoX1as4NX7vHRfVRxrOgB1pkgCuRbYDhLuuoeLtZnGHcslN3RvdEevvI/bj6/OWWJxPBmFV9Q95ZAaiZyl/6a2nqISuRt7r4L2G+JuoAWnbauzvrByPBh1wemC5g9EufIN7W/MqFOeYSPjjBM3kUru1vysjoMld7MInIHGxbg8M26agdgjzjEr0gIL7s1YT8Z19f7w9xu8NsYtuArS8/ehuTrLaBubMbshlW7w8MW5o2IsCUVykn+jswOdoe41d4dPqhvJfq0trSFoezjZ5NtIIUwWBK4LjvraNMDdkExJSPUfqQhll6fQj3cr3CitdvI0oIivC4Db9OiYeAcrWbIHir+YzlmOO+h5Xs1QTEFU5SeQUNmAGY/N/Lwh0rYlOd3c94Z/GG/k5L61mggoy/w21wGiUhVN4zq3kDtTxHjtL3HObzhAxTjkUps5Os6jZdHq6D/LcvIHsJaKB6XpN3F8nlMnbmWpxFENpUycqM0wvqGUhFlE58xEeGDg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(6916009)(107886003)(6666004)(54906003)(26005)(6512007)(6506007)(8676002)(8936002)(66946007)(186003)(66556008)(66476007)(41300700001)(5660300002)(478600001)(4744005)(4326008)(2906002)(7416002)(6486002)(83380400001)(44832011)(38100700002)(82960400001)(316002)(86362001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wlJ6cFKi5gqDwvHTpSVDtel9oEfCHFOfgeZx5h2vxYKy7Da5EE1BwlI3EhmG?=
 =?us-ascii?Q?3OA6gH8znGyGHjO0mj+S8RqzU4cOBYTs3kW4XLVpGQkJPcTyYUMk44FOeOOO?=
 =?us-ascii?Q?5LDuVQYVVkQ8i80Np7601G0pN0wUr1Zyj+UDYbRoXQupZ0AXWPrSXAchdir/?=
 =?us-ascii?Q?O2a8gxuSBD9w7mfAgUIpXq/FMTQ5velwuK5ZiS2qAtFCPlU46BlQF2U1gilT?=
 =?us-ascii?Q?mlUL1g2FGQN0cCdJxh/uWv4p5pwVkUvFWCnCKbnHrnBPMWBGSZByJ5ND3voo?=
 =?us-ascii?Q?b0prXeBsFJVjMaQAf1WrXT64Y4b/rH6L4r93cTs8WSOJB5ZjBXguXrqWNVT6?=
 =?us-ascii?Q?qM1Pil+i9F3ijDBE3dd7YdJVTFbPZ1XNQU7ECJlxRuPTPBA72ONYZf8CRu73?=
 =?us-ascii?Q?MkU6OGGYvs8O+9aiBzHruChJY0ROgo8MUdOdZJpC304Nu0U3YE9NP3M/+nx3?=
 =?us-ascii?Q?ap4zwm/EJGh8Exwr4E5IvslrfiLES0cMuiUWmL0zm7to6bP3zkKed6o3Pzyj?=
 =?us-ascii?Q?fAxaxZAhPo+HBQpva8UUMufofjwwrpOdKorJgIgByY4+4Hg2N656tp/PaaHg?=
 =?us-ascii?Q?IKPxy5i1vwY8xcwbRYiq1kl3wS0KN975ubHTa8zeH3FZqbRTb7B/H/jwYWuZ?=
 =?us-ascii?Q?g6ckcIHBgLsLNNKrJVBc+GEdNqZzBW1KuVopFPLkbO1IEwoOdSk+RJQ8Ft5+?=
 =?us-ascii?Q?iANyGMROGF9MAElECBjw5Ahrlmu/2zvRdKygO1gBfr63pFSu/eNCEtDl2YTB?=
 =?us-ascii?Q?jfWC2i0ka6GioKpdwuw3Mr6451gLIW8aINkB65/IY6odXbAV2otJS+KFfdAO?=
 =?us-ascii?Q?mNK/j/cQqI98DWEK29QZHfLcmcpwwE5x+7FI24a+O1XYn7wYEcWgVpKDiGj4?=
 =?us-ascii?Q?U4AQAhxVkPOWJrjegXESbGaoounnCFccrTziCAu7ukO/5dUwIjdDt+CERlPy?=
 =?us-ascii?Q?LcBTiKTUMyB7BXPAEOnPwiAgqtwQzZHhl209wLpmzQTEKpY1eDD5rTKtHWVO?=
 =?us-ascii?Q?GI/WsMLIC5/giP2/00VvWnvpYdNoweJFV4YT8ocGYGQJg6lK+MwNclWsGqFi?=
 =?us-ascii?Q?if+eRmiZrN0lRiPtCNB+ajXtDeVb09mij97VpKqUSVYmVbDSTQYCj0lUZD0p?=
 =?us-ascii?Q?GN2sT7lPSPiAmfRNcS4PFE4MgZRmpQD+x/MU6OPPp2JC0KBM0d4u845rMMh2?=
 =?us-ascii?Q?gvtFNX8074Q5SAMTkLJFUE16Y0w0PFv+EAvm654o5wMBYtjYrMW0f1hF+Y5t?=
 =?us-ascii?Q?v3/H41NZFniplflJ2ddZVQGm/TTZMwcIdk2ecKF472rcOI5LQOrX2DVryge/?=
 =?us-ascii?Q?ImccAPKapOftYuszUwOc+wyjg+USP5fQYgvHDOl/9YUV/mKeK03aWVzI/1PI?=
 =?us-ascii?Q?2v6jSl8GCWZOsuDVJ5ldhTthxoky4guxcWGbUPkvxYpn4nwvfwmwKE9gcD1W?=
 =?us-ascii?Q?pXL9r0HznftgHXGVSQ4ONEuzrZTQHlgAHaaNUUPxDuuoWzSNzMdyBgMu10Bt?=
 =?us-ascii?Q?8yOJMO+cbTehhmXHObTOtfcyoGyMx/LawAVoTjCxUTwGurG7FusEupYRl72l?=
 =?us-ascii?Q?1Y7pXeRnaj17Sg0lXtB3J2LQSr8Y6N5GmWXnI5shTvqEBer5wvM5N1dF6mfv?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd886b8-a07e-4bf6-858a-08dac7f45ea7
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 17:02:41.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wKDS01bcbyu7foSCKweR8LdZu1zsk6+TSE5kTuLTbGWisc2pvCt0mUiiJMzQrBrglA9JmFOwFjJmpsBb/h4QKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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

On Fri, Nov 11, 2022 at 02:54:32PM +0100, Thomas Gleixner wrote:
> Split the bus token defines out into a seperate header file to avoid
> inclusion of irqdomain.h in msi.h.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  include/linux/irqdomain.h      |   22 +---------------------
>  include/linux/irqdomain_defs.h |   26 ++++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 21 deletions(-)
> 


for Patches 5-11:

Reviewed-by: Ashok Raj <ashok.raj@intel.com>
