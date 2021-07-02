Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2D3B9ABD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 04:42:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGKBD2KnLz3081
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 12:42:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=grIzOmYO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.244.61; helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=wesley.sheng@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=grIzOmYO; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGK9h4t8xz2yLp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 12:42:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0TkbUYtx5WZhydjWYmKm2bCztCisV/pSaKYqd3Q9uLRVA7SpAfz5lNLJiv+kdw+EH2+JhthPu3M+uAR2dFgxcaPP09YslQAicw9hMwK5e8MYMnUw7zTR4hyUTosTT2p0UtdFvvAmCh/8It18Ul/rLgpWB2YNHFqWmme9+iiIwCzVzi9Ei2ZypLOeQLZwvFyVPmig+Kt9boFjXmJKxbRJXqSCxd0Qm/zZZOoyeEabnPGoARCLxll5tOlpEFQYsMvhleNAfkOSX+dMLN1N6ryuI4TCrgOSnPg1CKlvRu6EjkLIBOz1fvR1ususlzhKLsnhay8kjhQzN2OsxF3McTh6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmih0ZkrQRtOyKqpwRo6Syp55s5YzsKcF5xym9wFPUk=;
 b=LtS/+pU5uDh2Zmv4N1t2IGKhbGr6StgQvWl+I0pqyrVLDT/bckWNFFe3fRa1rkM0rOBkdOOnyH0OgaLlbgyad9egX1IGDbnHUTIib/9Ze/9oGvILN/EXcaJVcpgNZhRjx0Hhkm4BUdlz1CQP7JFDXoQ8yIURYJLw/b5n0poXm7s7gJz3djYP2Mro3QVsJurCyUljBGmoNb+o76mWwQ73SItOLKSQseMHi5dmpZHaWcYbpDgmiTuCVHOKfDKcjLBiQeUFnHC0tWMUVBIlArfTqTf5AyEmp1abe+3B1+trO2RgbOOzdzWPwfPsqTMsLSLWmMUgM1mY0JReNKSu2ab8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmih0ZkrQRtOyKqpwRo6Syp55s5YzsKcF5xym9wFPUk=;
 b=grIzOmYOY5sKTd4R0TfV7H8i9wBF0ru28JzziDn+QuhUGQ+SXW8a0J9oNcIo4gbFhwv7PyoypLZGZctbK2T0lL3FkaRJs0+Sph0vmc+/nDl3gcPog5Fk4mqwivySm1ud3WHLWaicePg84Z8+fB+9Vai2SF6gj46K4Ld0Va9WR5g=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5357.namprd12.prod.outlook.com (2603:10b6:5:39b::24)
 by DM6PR12MB5518.namprd12.prod.outlook.com (2603:10b6:5:1b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 02:41:53 +0000
Received: from DM4PR12MB5357.namprd12.prod.outlook.com
 ([fe80::9d97:11b:bb35:d2e6]) by DM4PR12MB5357.namprd12.prod.outlook.com
 ([fe80::9d97:11b:bb35:d2e6%5]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 02:41:53 +0000
Date: Fri, 2 Jul 2021 10:41:23 +0800
From: Wesley Sheng <wesley.sheng@amd.com>
To: linasvepstas@gmail.com, ruscur@russell.cc, oohall@gmail.com,
 bhelgaas@google.com, corbet@lwn.net, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: PCI: pci-error-recovery: rearrange the
 general sequence
Message-ID: <20210702024123.GA2714@buildhost>
References: <20210618060446.7969-1-wesley.sheng@amd.com>
 <20210701222231.GA102933@bjorn-Precision-5520>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701222231.GA102933@bjorn-Precision-5520>
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HK2PR06CA0011.apcprd06.prod.outlook.com
 (2603:1096:202:2e::23) To DM4PR12MB5357.namprd12.prod.outlook.com
 (2603:10b6:5:39b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from buildhost (165.204.134.244) by
 HK2PR06CA0011.apcprd06.prod.outlook.com (2603:1096:202:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 02:41:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4beaef6f-8996-4cd9-f933-08d93d02f3c1
X-MS-TrafficTypeDiagnostic: DM6PR12MB5518:
X-Microsoft-Antispam-PRVS: <DM6PR12MB5518AF20E869BAF204A87CCC951F9@DM6PR12MB5518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yd8qLaRHn1Xr2m4pj8NkJbYRYSwiwm8eYoMCNdqOKZQ6hkr3wQb42Y+tjhdPrh5R94nQn91+K6gkHsBWD0oqGo8By3ECZBGO+lAlQcn+XgQqhryOdL+hJP+fnEoY5Z63SB8C1aFmYR7pCehV8IiFq6+ymGBpT1psirGSxWWKFDffsoAEDM9f0FWfSJmsyLAxSIGvi1p2KdpbUOcl5Q6oe765RwcC322LmOEj//MaCnhnwvHGXz6geUWPRufk+Ccf8x/o/vqN4AoaDB0HZnZMQch1O47w/099b0P9dXFNLIQc9vxvq/qH7pmXrhY5DgzvL4u2EFRaNoeCle4e4lc79309M3DXLIfEzNQmxT3eR+5kAbOIVvx2X1WmApULQa/iIVI6YWW/tS9xeE7/59K44ywMLyi93K9TLjmEde+mhpGnW6DKr2QEdA+/MTBiKG2IuW5zIayMZqFcoG27HcETr8udVsXkG/8hTQUmdIBZbjj5jDiRIO5/54i/ObeEZr0KecV+afu6T4HTMwVTtSf6V8PpIwDw/NnIq1llHN1DpBGOVdSTGA9HaYeso/HL03lRBkVBD9ewbfCXrF2/bJgW98mH+xNLWGzYDLSdpLqIvPm/L4uMjCE9pCtRvEEGsYoSUfqZimbzw+tg3+iC8YkjvY+3AycqI9WBi2vYd0Q7dcuQVGSN98YWtrVQ+T4JqAkHrcwDXBWBqtvUdJJ3IB+cQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5357.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(478600001)(1076003)(316002)(33716001)(8676002)(44832011)(7416002)(2906002)(8936002)(4326008)(9576002)(956004)(83380400001)(33656002)(38350700002)(6496006)(52116002)(66556008)(66476007)(86362001)(55016002)(9686003)(5660300002)(66946007)(186003)(6666004)(38100700002)(16526019)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?82VUYWDuV7SC5Y+Df4xDvTlgEXYSy1+5RbPTrNT+cH0dv4mDjJAcLIbR3toD?=
 =?us-ascii?Q?d3GuM8JFYLPI+TMU1iH1GsGPeZd1JvTAluiIICJE4g4NWY9uskindu/m9gwt?=
 =?us-ascii?Q?LoIEY39JJAmALbz3p7Bv1EpyKP0qOFt+91TzNF5RGnRTNa0O6rAzcJsc94Rt?=
 =?us-ascii?Q?KL3moY9D6i4pDf3M+dLzOC6b0Aj/+z1jRN4/Mzm+/iKRTqonCI4rMnkHrBpX?=
 =?us-ascii?Q?DYBSIFEW2EBDDBVKQ/M7FJGg7ozQqyCK0x3UqKE4slM1UnMM8hXTlMGH5rEj?=
 =?us-ascii?Q?oHAzGEoVmDB9MxdqUA/V+v77cHRGw2/mjXNwvXFMNlB8pKPkKLunx7/uWQAH?=
 =?us-ascii?Q?LQciIOFYNj6weBd3kVKnt2shtgTFdXUmq4Z10k2acGzny6PxNJaWvtmSEg4A?=
 =?us-ascii?Q?RwSqRFSRPlXsMrX6WfzqK4XeRI2W1bERwPQA1nX/dS0jOKMflrH67WVB02PG?=
 =?us-ascii?Q?l7OITzWZrJfDCMtAhtcLRfXuYxcLtuFshyEvj5mboBSxZvJf4O4beaNW6vyI?=
 =?us-ascii?Q?f2U4+OPgEyIus8bzjbuEVZLY8mzCn2Jw67CQCIZlb4jYFMkqkhcaONgIHplS?=
 =?us-ascii?Q?71AUP7SNc76TJ/zvXczlxrXjzqO7HUCEKqZB/hLRMKLBTHhmYdOKJ/3Bl+z3?=
 =?us-ascii?Q?lNiz6CfBX++QcIM6j3oalzyxlHtfvyZiTnqTG9izpQtBkhCVEs1fNeAN+wzE?=
 =?us-ascii?Q?D+et/RASs6t889tDKFGWWAPUIgLsgj6bqM4bsNOaVcPj78kD0sOwaoBCBfGZ?=
 =?us-ascii?Q?uBokNAQRUxDfrnLRmIsZA6BI1Y9Z0ly9LUPYWXy0X1GyCjK1Tp4XxpFntWZq?=
 =?us-ascii?Q?+XI+2rb3A/Z5uZvPVhCS2GGa1asdB/MeUTsZl5By+kwB9yRopcU0O2uXXaKa?=
 =?us-ascii?Q?xkMfR1Vbm1Vu4Kcnzvh87foA2zmfDSn262zneqUdX1CSaAUCKJOIGykjLst1?=
 =?us-ascii?Q?JttvJIkNscW5GWp1CV+PqwrP4RuacDg0GSa8Pl13MRZw0lqg2ken8kxMQ+Nc?=
 =?us-ascii?Q?s7iHr//402uYESpwQsfkFMHHocl/N4jHMVAxHwKuFBiAKoDb8/GxtPBTEhc0?=
 =?us-ascii?Q?EFxqLCFe1xw9gw/1+Ac10Kqp9Pq4zJdvUpWwFS/0of+ke5xbJ6H5pUo5yRb6?=
 =?us-ascii?Q?jPYsxAaGFX6Bah5ZlAzronE0RmjXzAmeJo+v+zj9/sAeEEPSZI//maFalJXJ?=
 =?us-ascii?Q?4ILh+5OQdmWawRrAriWiTMfkH+RWkgz34R05cFZTVaMUGvXxAF+K2JxVC0wM?=
 =?us-ascii?Q?zs0vziMsHz3e7C0UX73KLy7cDjGlEtwaZZscTheIrtL3tpADUGQcfJ5op+na?=
 =?us-ascii?Q?D7lYqlIyuUHRXKqOq/wUxvam?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4beaef6f-8996-4cd9-f933-08d93d02f3c1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5357.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 02:41:53.9167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJJ4OZO20CLgBJwfjN3Clo7kGfeiNHRM7LVk4Fpt4LILlmKOJaR32Ap2mXBUKSR3yfU/n8XaZAKNDCoFsV0Aow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5518
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
Cc: wesleyshenggit@sina.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 01, 2021 at 05:22:31PM -0500, Bjorn Helgaas wrote:
> Please make the subject a little more specific.  "rearrange the
> general sequence" doesn't say anything about what was affected.
> 
> On Fri, Jun 18, 2021 at 02:04:46PM +0800, Wesley Sheng wrote:
> > Reset_link() callback function was called before mmio_enabled() in
> > pcie_do_recovery() function actually, so rearrange the general
> > sequence betwen step 2 and step 3 accordingly.
> 
> s/betwen/between/
> 
> Not sure "general" adds anything in this sentence.  "Step 2 and step
> 3" are not meaningful here in the commit log.  It needs to spell out
> what those steps are so the log makes sense by itself.
> 
> "reset_link" does not appear in pcie_do_recovery().  I'm guessing
> you're referring to the "reset_subordinates" function pointer?
>
Yes, you are right.
pcieaer-howto.rst has a section named with "Provide callbacks",
the callback supplied to pcie_do_recovery() was referred to 
reset_link.
 
> > Signed-off-by: Wesley Sheng <wesley.sheng@amd.com>
> 
> I didn't quite understand your response to Oliver, so I'll wait for
> your corrections and his ack before proceeding.
>
OK.
I thought step 2 MMIO Enabled and step 3 link reset should swap sequence.

> > ---
> >  Documentation/PCI/pci-error-recovery.rst | 23 ++++++++++++-----------
> >  1 file changed, 12 insertions(+), 11 deletions(-)
> > 
> > diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
> > index 187f43a03200..ac6a8729ef28 100644
> > --- a/Documentation/PCI/pci-error-recovery.rst
> > +++ b/Documentation/PCI/pci-error-recovery.rst
> > @@ -184,7 +184,14 @@ is STEP 6 (Permanent Failure).
> >     and prints an error to syslog.  A reboot is then required to
> >     get the device working again.
> >  
> > -STEP 2: MMIO Enabled
> > +STEP 2: Link Reset
> > +------------------
> > +The platform resets the link.  This is a PCI-Express specific step
> > +and is done whenever a fatal error has been detected that can be
> > +"solved" by resetting the link.
> > +
> > +
> > +STEP 3: MMIO Enabled
> >  --------------------
> >  The platform re-enables MMIO to the device (but typically not the
> >  DMA), and then calls the mmio_enabled() callback on all affected
> > @@ -197,8 +204,8 @@ information, if any, and eventually do things like trigger a device local
> >  reset or some such, but not restart operations. This callback is made if
> >  all drivers on a segment agree that they can try to recover and if no automatic
> >  link reset was performed by the HW. If the platform can't just re-enable IOs
> > -without a slot reset or a link reset, it will not call this callback, and
> > -instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
> > +without a slot reset, it will not call this callback, and
> > +instead will have gone directly or STEP 4 (Slot Reset)
> 
> s/or/to/  ?
> 
> >  .. note::
> >  
> > @@ -210,7 +217,7 @@ instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
> >     such an error might cause IOs to be re-blocked for the whole
> >     segment, and thus invalidate the recovery that other devices
> >     on the same segment might have done, forcing the whole segment
> > -   into one of the next states, that is, link reset or slot reset.
> > +   into next states, that is, slot reset.
> 
> s/into next states/into the next state/ ?
> 
> >  The driver should return one of the following result codes:
> >    - PCI_ERS_RESULT_RECOVERED
> > @@ -233,17 +240,11 @@ The driver should return one of the following result codes:
> >  
> >  The next step taken depends on the results returned by the drivers.
> >  If all drivers returned PCI_ERS_RESULT_RECOVERED, then the platform
> > -proceeds to either STEP3 (Link Reset) or to STEP 5 (Resume Operations).
> > +proceeds to STEP 5 (Resume Operations).
> >  
> >  If any driver returned PCI_ERS_RESULT_NEED_RESET, then the platform
> >  proceeds to STEP 4 (Slot Reset)
> >  
> > -STEP 3: Link Reset
> > -------------------
> > -The platform resets the link.  This is a PCI-Express specific step
> > -and is done whenever a fatal error has been detected that can be
> > -"solved" by resetting the link.
> > -
> >  STEP 4: Slot Reset
> >  ------------------
> >  
> > -- 
> > 2.25.1
> > 
