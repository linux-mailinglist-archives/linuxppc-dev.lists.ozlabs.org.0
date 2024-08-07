Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4594B155
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:32:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnW+LbAg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMKs1cZMz3dLK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nnW+LbAg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfMK92hbvz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 06:31:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723062702; x=1754598702;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/OSVwQdj6WwzyFAEVIiSvfAZgZioE79F9s2KIFSNnEs=;
  b=nnW+LbAgZLJC/lps6bZ75bMCOnUNTG5tj+hJysFMhGbT2gcSlJ/GFXFx
   WpI9uUnaG3dAjbL0WotOUCaA9OVMU96PXKvL0+UC0ckt5opJkOGZU9jI3
   Hn8uIQGAl27ioFIu+gbeyb/qez3KQGwfUksZGbuWg3YcWPU1XtjqBJPFy
   +ktk9cy0+lLiEIpneH7oPKRp7RGhCf305A9Gaet2uVP1oR/B+SnRMf2K0
   0W0bRe75C9qwoxyLtH/Ltp0GCc7RziNts4Z9WgCt0Tojw0eKJDIXo1eJt
   CjJYVCzI8W6Bcx4V1Y4+P0R9S5HvVpjgv0ru+hAUgJ/ValkyTJHJCoSUh
   Q==;
X-CSE-ConnectionGUID: WZpfM4+6RU+bioj2RdmlRQ==
X-CSE-MsgGUID: LszD1rDuRdCvbR+8QWDr2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38663942"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="38663942"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 13:31:37 -0700
X-CSE-ConnectionGUID: gw6vfdAaRnuHvgkCADs0rQ==
X-CSE-MsgGUID: W65tS7N+TMGxhNwEjQpYgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="61915644"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 13:31:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 13:31:36 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 13:31:36 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 13:31:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 13:31:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VF3YJMf+jTkE3ObaglJ2GReIcLoRwpsgpKA2b6S47xi71trIir7XRImW5U+tRbpbMVwpeSG2Cmrm4NoZunG3agdY277FZQmN2DGIJb3phYaUeU03XdD8KLWUqAXaUDtqgZ0YicfvD+P1byxjTTAn2zvo2cPkEttliRM40xWAjXZLqtkVsEzJF0bd9Ja5Kax6Bx320QrHbGoOfOOQBVCEGA5l1tOpXPWRtYeQagnjrh9nB2mTcPJzmt2PbdqEP/EGX3vKd8MWhl2eFvKCvS1GDZGpfFcRF8SbSY1uPglagrbOrYr2XmQUC7DNdyBPWGvlkCKCSr38tGdFOLBV/nmZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iH5sbwNzCnyWPOjrmRWoikmMMTjNffnvgVcEtIBu//Y=;
 b=hm7MaQJBKL2J8VhrJHR+OzCP2hB/X9QaxNvYgh3Dfm0la7v9qX7PGzYfeLRaNGjRVX7nCba00SxiJvKDXqn0oC7a3aBdA+rQYdp9qn654kbYlceqcJ29f9sEzX8QM4I0oHaQ9U4hTKduwg6iQznjpZdGHsKD979x5oImyOYvdviprxTDF+a3bxxEP/+GfVuN831VbOrfuOKQ1iZe1bIT3QToN94VpARWIsVt8CWsBgVM39Lo5rirjNlpcMaZc228wTCRx/T89r+T4MtdHJgF7G5RAdPfhMKzdmrQoQPC49K1fhYp1MAjDWbuJah39uIHdPFqt0Z4+q/SwdicKwWntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SA3PR11MB8120.namprd11.prod.outlook.com (2603:10b6:806:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 7 Aug
 2024 20:31:33 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.7828.021; Wed, 7 Aug 2024
 20:31:33 +0000
Date: Wed, 7 Aug 2024 13:31:30 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Dan Williams <dan.j.williams@intel.com>, Bjorn Helgaas
	<helgaas@kernel.org>, "Fabio M. De Francesco"
	<fabio.m.de.francesco@linux.intel.com>
Subject: Re: [PATCH 2/2] ACPI: extlog: Trace CPER PCI Express Error Section
Message-ID: <66b3d9a24ae9b_2142c2941b@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <20240527144356.246220-3-fabio.m.de.francesco@linux.intel.com>
 <20240806213118.GA78822@bhelgaas>
 <66b3d8ec30e74_2142c2945d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <66b3d8ec30e74_2142c2945d@dwillia2-mobl3.amr.corp.intel.com.notmuch>
X-ClientProxiedBy: MW3PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:303:2a::18) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SA3PR11MB8120:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e15f4f-6c47-4902-ac32-08dcb71fed21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Id6kfSKR4qi9cPKwB3jhbiSs1SNM2ry/zLHdgrdwfbv/lVHjY9lxkyQnt5EG?=
 =?us-ascii?Q?K+T/xNBzWGA+/ujdE1aBGtTSkcEdCHw5wCFWY3G/rmO8Me5Ie4TZoaR1LW8k?=
 =?us-ascii?Q?eKH7+sddBxdXHnUOK2HHgHPiYYOI8FqzeDq7xQVsbZbkkDfr8w8Taeu5TQLN?=
 =?us-ascii?Q?yKMHvW0otITf3KOS3tvDhptFCrJEtE2ehj7WMaAudKnrGoJ6WucpDTCId2xp?=
 =?us-ascii?Q?Bw1lepfZfHZ5578dXJXiwclDr2DovwhOWY7hQEvFcyumwbuUk5+TTGM9os3s?=
 =?us-ascii?Q?NPmsfCyBnAYEdoeo8xGY2n5oHa7J1e/oicMzQyn6JVZpHDiwE7ahW5aUAy+G?=
 =?us-ascii?Q?n8/gYCsq77FI+mEH2O4YvbeCurMJw/4qcqAbYuUScemgqgsL8aMuV+U7wdAt?=
 =?us-ascii?Q?G/b+ktl/rmOkbMSDFwZozo+9xd4430IDaVvfaFIQY8lQxwcd90vIevvGiDsb?=
 =?us-ascii?Q?lO4EgI5CXk267mlK9bHtukLa+UgYAj+uKdqCVamomT63B8Ocvt8USzTThnYd?=
 =?us-ascii?Q?RZmFHUFz8wsKS6vbQ3DVmi7giFqoz08awx8F67YqkYZ7JS+0EKj2nLDS3+Hu?=
 =?us-ascii?Q?W8MrncKLc88xzapXsi/AtQH0lYl4reHkgJ04Zx4B1R+WNiDEzNMO+B5SzRJJ?=
 =?us-ascii?Q?FFSCBUX1vdfp7rt9mU8Tex8xdLmEGnZBZKXN9PUcmQy6RQL2IMGmwDgfN2Rt?=
 =?us-ascii?Q?oAMdBjdA/uX8PUUA4Jr3pPt5sZmokiF0aHkhTMpkJKBzp+okOAm0HDGq/Q5Y?=
 =?us-ascii?Q?fCD+u0t1p0o1NMbvwF09GUEuDSUqtyg+IxnznYs0djT9/Yy15nwutKb30Gm9?=
 =?us-ascii?Q?hoG3kq4E2RJiFasfPCRHHiUPFfrfCWIDLOqE44XdHfCSLI75gxOv+CuZj0ZU?=
 =?us-ascii?Q?2HjT9TLJUx62VnxIUjqVNRyYBqNcWqhPkfIPKTDwRobciceknCyoNoOBY0a3?=
 =?us-ascii?Q?g2Ym/Gz18NenS+McZIwvN97C8xz5I2+IMpOsxot5DeqgMJZuJshWTe5EYG3W?=
 =?us-ascii?Q?fcwaRuJIJGrhUbyEcwJzap7203OmgiIEehf3qWvb5DTANF1kVjt1i1nq7YLR?=
 =?us-ascii?Q?C9zPcE7EpfyDdo5LVY0aqcKlOLHcHP/Gjp4aGa9WNy8ktKYZL1TiGhFhq1P6?=
 =?us-ascii?Q?UIvKCz18PVHu0+lBB2SrvPTvg5hs+Jmtzn1ZTw7C7hg/r2rwsW6v0N77to6U?=
 =?us-ascii?Q?quWF7kx8RESNKDABCGuPGJM8zd/UZ4c7JCtNJBDC6jQMlXALwDlnt9OLym2A?=
 =?us-ascii?Q?2Ydwz9pjmZWCn+JydEFLJuY75V76nluHdibrveXNxG3VwGirp6NmqPHu5Mqr?=
 =?us-ascii?Q?AXgLQD6wpiDaTJ82eSGlJ7mZATUwNhBIL+R4F+INgCWq1g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YUSJzgRv6s/6wqyBulDJhZluxmK+GwSnOlhvUR6Hn/lJtzs/EOrF27Lni3/m?=
 =?us-ascii?Q?4HaLC2JH2bx0Ju61XmsLKL+hl6ZfHqT4WtY0YvJ19OI04NyUNIcP5FDv8b0g?=
 =?us-ascii?Q?xzCMiRDoVIxQ1up79ubnvrpqL96S2kq+ODTuzK489PzeHaDe0dTp+iTAKoW3?=
 =?us-ascii?Q?Qlh7oOxDESjcTjXB0ueidDEU67AIl4TuXH+eywPKwBSR3ZeIGn3YyOYsEuzF?=
 =?us-ascii?Q?w47IcvaBYVKSMOH45GA3x6BnukZaoOd76lRAuyvSjvqIzSTDpgqMF7ysmaGR?=
 =?us-ascii?Q?OdEqf2jzsO9u63dnAhOlbonOv9xjnK5B+35hHLwdSGqz9l8FgxP+AsfyXUH4?=
 =?us-ascii?Q?Hk5RsMfc0gYnCDCrPchW3u2U0rO8wVdIS2ymNR5xAVKhSfpZdhGcGfXtPqY3?=
 =?us-ascii?Q?5mKNoVn7W+jNfowMom/8LJoPWPkjZ7gXavoCouBryUnXQBOnUAMWyjjst9vK?=
 =?us-ascii?Q?VKF12WhEGWKMfQR9R6SHDvO+BuwevTzkEye73PSxNx5a0wvmzghAtQG/abfK?=
 =?us-ascii?Q?tB6wJuBhuK88QDvzdhTJ0zh1zgexfQLAYG4dJizwZj7Qpe1O/jlJ+9Qq1O7V?=
 =?us-ascii?Q?a8nLzQpsIGvXeonM5Lci4d8TGxYsXKoXxOotKsvYxYLzNmnunarZ/vd7VxAy?=
 =?us-ascii?Q?aLnNfS9f60RQ+Fv+9gu7xzc/mHr9dh8foTSBy5PkgoSQrzHbT90cKnVXFRt+?=
 =?us-ascii?Q?GehheRCyomcPCUg8Uu5dgIOqHfNGnpgOQurdptezEybWXWhxSEpQj9QMMr6H?=
 =?us-ascii?Q?ZUjcYTnGDcNuyfkMX54yPwCd5HAXg71JFvZv/tKSj233yZQzrAEySEptAQRA?=
 =?us-ascii?Q?zQqhC0SBbqnwbdlQLbRJWIGkBpdEhVJtIazef0TLAO9oMx9IctQbwrH2J0Ko?=
 =?us-ascii?Q?8kCNhGRPz7o+HJi0MWXpaTxCFJDzux+WA8MoDYwlKoVP6KMol8q2+fr0aAWZ?=
 =?us-ascii?Q?l69x78sr4zmb8wF9hWHhQyQkXk6E7HAS50T3dqQylhyruC3lNKpcoJUpus50?=
 =?us-ascii?Q?k0ln6s0EddaD5aIF9lwVqkL7pvj/iFwcEMThgt//4eUALmaDnp7JophplzGy?=
 =?us-ascii?Q?eVZXfXGS0q+lsFlWlp8Y+gGBdxGfr/fWPbzfCVhn/+ITqmbVEK5iHLbfeOIv?=
 =?us-ascii?Q?nIpZOJ2Bf94v1p3jCObvJjH4TzSrfeKiuGjxY9ET76ISamjZBYk1DYxRV3Ao?=
 =?us-ascii?Q?bhhS7oXs4QI/xkSW0qQRdsNE+CU/8Fv8aLI920t6Vc0ZfuyBIV3RLULmZFX4?=
 =?us-ascii?Q?U4ZUFoUJKTP426e2eQtmkfCwgE4hwyxvFnHuGZkrXcOWjhEdqY67FzCspSUK?=
 =?us-ascii?Q?IdFzZ3W3rY2ci3PcN3vWWLsvup30ZrMZujF/LzGrlt8x8GZihH9VXkjMePDG?=
 =?us-ascii?Q?DPG7eUV6P5VAVcIclFWyBvgtP+ZQ7apYPEOSrnQr3JqzNkOMd3yAPEsFfbED?=
 =?us-ascii?Q?M2JyfswXU/YRj5Zz9ycSNnL7tz8ZiG8Aemn2Gp+JVfiyXLjNZFZ6fHxpvPSn?=
 =?us-ascii?Q?hEBcU2C6cdC5LXT7xC4ekb+iHDqmCDZd8zN88XWLx7AhLULbU1c7tixL11Pd?=
 =?us-ascii?Q?PZTVmqPoW9ffwDtuWwnR42aMSNeiMwWCGYW4bvNG80aQ9aYVeiNJpwaPaiYV?=
 =?us-ascii?Q?JQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e15f4f-6c47-4902-ac32-08dcb71fed21
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 20:31:33.0980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncywLZmv41tVpG5bKnnPCJefhfXoAbOH12SFjwd78nMKbYvIG5smK1AaN2q8KD/7rDZfZ7TMkyIKQfgXueIyl3vxGl6cybfmifg6gPUTOhQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8120
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-acpi@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, bp@alien8.de, Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org, Len Brown <lenb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams wrote:
> [ add Boris ]

[ actually add Boris ]

Boris, see below, thoughts on deprecating acpi_extlog...

> Bjorn Helgaas wrote:
> > On Mon, May 27, 2024 at 04:43:41PM +0200, Fabio M. De Francesco wrote:
> > > Currently, extlog_print() (ELOG) only reports CPER PCIe section (UEFI
> > > v2.10, Appendix N.2.7) to the kernel log via print_extlog_rcd(). Instead,
> > > the similar ghes_do_proc() (GHES) prints to kernel log and calls
> > > pci_print_aer() to report via the ftrace infrastructure.
> > > 
> > > Add support to report the CPER PCIe Error section also via the ftrace
> > > infrastructure by calling pci_print_aer() to make ELOG act consistently
> > > with GHES.
> > > 
> > > Cc: Dan Williams <dan.j.williams@intel.com>
> > > Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> > > ---
> > >  drivers/acpi/acpi_extlog.c | 30 ++++++++++++++++++++++++++++++
> > >  drivers/pci/pcie/aer.c     |  2 +-
> > >  include/linux/aer.h        | 13 +++++++++++--
> > >  3 files changed, 42 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/acpi/acpi_extlog.c b/drivers/acpi/acpi_extlog.c
> > > index e025ae390737..007ce96f8672 100644
> > > --- a/drivers/acpi/acpi_extlog.c
> > > +++ b/drivers/acpi/acpi_extlog.c
> > > @@ -131,6 +131,32 @@ static int print_extlog_rcd(const char *pfx,
> > >  	return 1;
> > >  }
> > >  
> > > +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> > > +			      int severity)
> > > +{
> > > +	struct aer_capability_regs *aer;
> > > +	struct pci_dev *pdev;
> > > +	unsigned int devfn;
> > > +	unsigned int bus;
> > > +	int aer_severity;
> > > +	int domain;
> > > +
> > > +	if (pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID &&
> > > +	    pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO) {
> > > +		aer_severity = cper_severity_to_aer(severity);
> > > +		aer = (struct aer_capability_regs *)pcie_err->aer_info;
> > > +		domain = pcie_err->device_id.segment;
> > > +		bus = pcie_err->device_id.bus;
> > > +		devfn = PCI_DEVFN(pcie_err->device_id.device,
> > > +				  pcie_err->device_id.function);
> > > +		pdev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> > > +		if (!pdev)
> > > +			return;
> > > +		pci_print_aer(pdev, aer_severity, aer);
> > > +		pci_dev_put(pdev);
> > > +	}
> > 
> > I'm 100% in favor of making error reporting work and look the same
> > across GHES and ELOG.  But I do have to gripe a bit...
> > 
> > It's already unfortunate that GHES and the native AER handling are
> > separate paths that lead to the same place (__aer_print_error()).
> > 
> > I'm sorry that we need to add a third path that again does
> > fundamentally the same thing.  The fact that they're separate means
> > all the design, reviewing, testing, and maintenance effort is diluted,
> > and error handling always gets too little love in the first place.
> > I think this is a recipe for confusion.
> > 
> >   ghes_do_proc                                        # GHES
> >     apei_estatus_for_each_section
> >       ...
> >       if (guid_equal(sec_type, &CPER_SEC_PCIE))
> >         ghes_handle_aer
> >           cper_severity_to_aer
> >           aer_recover_queue
> >             kfifo_in_spinlocked(&aer_recover_ring)    # add to queue
> >           aer_recover_work_func                       # another thread
> >             kfifo_get(&aer_recover_ring)              # remove from queue
> >             pci_print_aer
> >               __aer_print_error         <---
> > 
> >   aer_irq                                             # native AER
> >     kfifo_put(&aer_fifo)                              # add to queue
> >   aer_isr                                             # another thread
> >     kfifo_get(&aer_fifo)                              # remove from queue
> >     ...
> >     aer_isr_one_error
> >       aer_process_err_devices
> >         aer_print_error
> >           __aer_print_error             <---
> > 
> >   extlog_print                                        # extlog (x86 only)
> >     apei_estatus_for_each_section
> >       ...
> >       if (guid_equal(sec_type, &CPER_SEC_PCIE))
> >         extlog_print_pcie
> >           cper_severity_to_aer
> >           pci_get_domain_bus_and_slot
> >           pci_print_aer
> >             __aer_print_error           <---
> > 
> > And we also have CXL paths that lead to __aer_print_error(), although
> > it seems like they at least start in the native AER (and maybe GHES?)
> > path and branch out somewhere.  My head is spinning.
> > 
> > Do I *object* to this patch?  No, not really; it's a trivial change in
> > drivers/pci/, and Rafael can add my
> > 
> >   Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > as needed.  But I am afraid we're making ourselves a maintenance
> > headache.
> 
> To be honest, I am too. Upon discovering that extlog_print() behaves
> differently than ghes_do_proc(), I had the snarky thought "great, can we
> now just go ahead and deprecate the extlog path, it's just a source of
> maintenance pain.".
> 
> So *if*we keep acpi_extlog it then I definitely think it should be
> consistent with other CPER handlers (needs this patch). But, I am also
> open to entertaining "deprecate it".
> 
> To me, the fact that ras_userspace_consumers() is only honored for
> acpi_extlog is clear evidence that the kernel has already painted itself
> into a confusing user ABI corner and maybe the proper path forward at
> this point is to cut acpi_extlog loose.
