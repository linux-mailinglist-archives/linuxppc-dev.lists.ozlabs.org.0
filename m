Return-Path: <linuxppc-dev+bounces-9155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A41CDACE60B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 23:12:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCKzN16qdz2yRD;
	Thu,  5 Jun 2025 07:12:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.18 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749047169;
	cv=pass; b=GlkSE/zR1gBdNC7bHXYQWqwVkxrOM1LuVc5HLeQgzYzwBMxJDec5wdXVHeyDxI01RZlUto8A5yOBuIzymIHUdGLjpcKBCh5f0ZtOH+OX4CbAlDBUOYOR8V4BGiF0+KsEr4D+1OAm6tur5tI8DQqqXHrgxZo1BLF4tS17CCLUDO+I24NRO83aaAjHIdEtBrR3/HarPJC/i00AQvpa2hLR9UPTUtt8ekckmwDWGisVEpBJGcZr/fNr0T1bA5i9Iwgq2JJ9wYReP9lzoOGLWE7TdpVzKekR7wSFU6UsHDmFCQ3NWLURUd+ef6gV4oLb7YWNl7QcHYzxFePs1zpnUzu66w==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749047169; c=relaxed/relaxed;
	bh=ZbDm3LdtVZ7EFAQhYZmIdDn+nok4DMn7Qkv0Q7y5ukc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XhrlyfoSbWhWvQcJxSuw8Boan7n2jqISJRUplaY9Lgp+EVDX8Kv+uwZXZq35xOnQt8dLhDGJxp0F6YQ26Veu/tv7Z/5ZsiK26mjukPPbYkjd9/Nz0xl5WRW4QoxysUEli2AI/nao1K1xQ4O54st/nDVug+AZRO87ZuGbMO7V4dSqwGgW8L6hknU0/qXVt+/l3DcAUch6PZ34HY+W5gAJYwAUG6Ioeu01myGaKxOKGDc4xR0pA5F9H4VhUwuwzF5NOmzdz1IVQHogmNswIIecdIUqB/u4c2zbnxjBCDWFtoaQAa27Piam8wMnYH6x+Oyxdt9WsQGtDAkJjTNRS7w++Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DztXOTkA; dkim-atps=neutral; spf=pass (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=qiuxu.zhuo@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DztXOTkA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.18; helo=mgamail.intel.com; envelope-from=qiuxu.zhuo@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC8yN2zDyz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 00:26:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749047165; x=1780583165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CMdACvG14OV6mcJPjJQhnozDlfdk/thvlJavRPEDgCs=;
  b=DztXOTkAao9Dlx175aFbfZ2yeDiWojmRkwTvw147ub9zZ5CPdMulp/eK
   uMDg+KxzgWa1+tpkURO6Up5STDMHUvr+2V+fvFGyfNkceANZ3Xcgqy70w
   TKSPYrQvMmbdMfyzsE89dhGG/2WGF1EutQo/ZhSazLzDS6s2A7N3u6mb1
   L5P2JRRbpXkV+knWQRrcss7bqxMahwXkig4DTF4t+II/odnZU3Q+FC5Yp
   ppy/Wlh0Biz9P3hWiXtUxrgt4e7eFLxyr45yjRWWkg1+DS7our+tWGbK7
   8/fRSLKnHT21k+wHjnzUNrOuOwzRJnWR3Ne61Yhj4PiYBl4Lwi97Irk6A
   w==;
X-CSE-ConnectionGUID: nTZTC1h/QUK1kjXDr1fkLQ==
X-CSE-MsgGUID: OGSI73jWSOCsur4gqE131w==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50373314"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="50373314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:25:57 -0700
X-CSE-ConnectionGUID: PJVRKgL5R46JJSnWhLBJ2g==
X-CSE-MsgGUID: 6d+5LLYCRqmxytflJ0isGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176168244"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:25:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 07:25:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 07:25:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 07:25:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKWBIdCczEM74vLO7Vwao2qC0ETiY5AfGfQV6oFtM6KcseAX+5sQli+xBHdATs0hNogOIrNKBXb2WuOHn0C1dAIZOslt82cO3J6iImegp7xt9/8P6uZDOchxjuURI2Wg+GmHSNZRgEaOLmk6Ua0YLabNdON1jup7USPmlAUfMCNtfkie1+QvU2l4s/FvrKuHE3lbBZUuO4gjnMr0qFQf8hjTodg7PZdCST00KFGIBo3/CIqgZNJIvDG0qqsdz0Mi5zbOUCxShxvPxDdaVcVl+52m92Hr/LzHROFtse/7MRDpHh5PBXe7VdvsXSi7uJwYvdKe/tn0r3dfiiOK5BLuxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbDm3LdtVZ7EFAQhYZmIdDn+nok4DMn7Qkv0Q7y5ukc=;
 b=VkZJGVNLob3W2GCIU0wgTkeXIwsHI2oVfVu1zZi/Nxr8j9aU5vnHATzDLTrPEyrReN966vGYKkk/MvF4wPPj4VxzpXYuAOYmnGntlYIFvxE9riI4S1uEBfA9bzh/u8l7iw3bi5fLaoU5jr4qKqh2w1JBkq/GOxU8cvAUxc4Z3EwBu5X7HbYxR1L4S8FBniFI2KY52uylzqaJx+hVcGmcbjiNLvN0luso/60thA5clh1oCwMxIIUYR9EBAgBQpFVxPfXQrFLib4eU28FPP23M433OUmPumqSj6X9B/s0OkrKhYGJM7g6O5/J9m8AFlJLU/zXQVyKIfyy7N9zUKkF+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7134.namprd11.prod.outlook.com (2603:10b6:930:62::17)
 by LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Wed, 4 Jun
 2025 14:25:50 +0000
Received: from CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d]) by CY8PR11MB7134.namprd11.prod.outlook.com
 ([fe80::cd87:9086:122c:be3d%5]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 14:25:50 +0000
From: "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Davidlohr Bueso
	<dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Schofield, Alison"
	<alison.schofield@intel.com>, "Verma, Vishal L" <vishal.l.verma@intel.com>,
	"Weiny, Ira" <ira.weiny@intel.com>, "Williams, Dan J"
	<dan.j.williams@intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	"Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>
CC: Yazen Ghannam <yazen.ghannam@amd.com>
Subject: RE: [PATCH 3/4 v3] ACPI: extlog: Trace CPER PCI Express Error Section
Thread-Topic: [PATCH 3/4 v3] ACPI: extlog: Trace CPER PCI Express Error
 Section
Thread-Index: AQHb1KAatJFCpAJRJUKKaiGMRfbdfrPzC7VA
Date: Wed, 4 Jun 2025 14:25:50 +0000
Message-ID: <CY8PR11MB7134BFAE1A4E54EE0C539CCA896CA@CY8PR11MB7134.namprd11.prod.outlook.com>
References: <20250603155536.577493-1-fabio.m.de.francesco@linux.intel.com>
 <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
In-Reply-To: <20250603155536.577493-4-fabio.m.de.francesco@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7134:EE_|LV8PR11MB8607:EE_
x-ms-office365-filtering-correlation-id: e7fc1c6e-d7d1-46f8-cddc-08dda373b4b5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018|921020;
x-microsoft-antispam-message-info: =?us-ascii?Q?B/FOpAYLHPDHXhbIAHoA8XtFgHPvFttRl+K8La/tHc19MybpoyybbXSoUXiU?=
 =?us-ascii?Q?Zrg0emXqqIYUsdxzUfvE1rZ+p6q4Adi8tQxG2zxfs4CLmjdtEg5jnm5nLT7r?=
 =?us-ascii?Q?k+wGDeYhpmauWdUq543T4wfTuQITKSO7AtJxs8IG4nqCsa0JleXhFbytTr8a?=
 =?us-ascii?Q?jwegybLu5zgGplE5te/St4xaMY8y1iGP1IGnMao+XCbw9JSQE7y5HETYB12Z?=
 =?us-ascii?Q?XZZdvHTd3dKJiG/Z6VvW1x/EI3jbclodZENbun4qmwVgTa0DkBO6WNe3XumB?=
 =?us-ascii?Q?CEcic4Lh008MEP1J/mDdCawwA1UVHNgeUnHcKLz59UGuhtYr53VyvGlWDQCl?=
 =?us-ascii?Q?zdX383UYXTeggkFbZXnPgPH7UlnW2hd5NbQpogo1+rR81igEPrfEBF2ykL4l?=
 =?us-ascii?Q?KPbnIBqzN3zsLMKAyFGdtCBoZ1HzFc0vrExSS+OeNGVDK8jgJno82TJ9bZHM?=
 =?us-ascii?Q?W1sAIk/ZnZcByGXXD1zPZJmWu2mdOFdb+2iNyDAQUbfXhI1rx+gzwUZ3wqWR?=
 =?us-ascii?Q?TDgEgVLlRWWxdKS3R/glCy4upMhS/jHIDNhoSNWBZZwmlnJRuroko0XN5SaA?=
 =?us-ascii?Q?wxUBZPU5alX5K3QsCyHLhYA09QTADXUl0o+eIjEe6mJYDMbJj9o80GXf8MrP?=
 =?us-ascii?Q?opb+ixaJTE/q7w3Z5NV39Vzw6BaaFeeuUuGKAxWq78toDXTHx10BfaWPBd3f?=
 =?us-ascii?Q?821KHZHu86mH1JGtEAnvo9hZoyO4tOTyd0ceKo/ZzHQwuuUtenOBtLhR+eAr?=
 =?us-ascii?Q?QqAmIi47wrIA4WLsOxBEhXtSl2UfHC7TARaH9xx/xcs7bHGUPHgrgc/8ISWu?=
 =?us-ascii?Q?iVvnOTzfkz4etYYNqc4eIkY731Kz0Nz7gwqylGO8hjNx9Qa3bPZUXHxPA+yg?=
 =?us-ascii?Q?KfPfRCsEDsA1ULmuXBKuXdqfUiA9l7VikEogmUQFEzzdIc6EOcjm44tOJNu9?=
 =?us-ascii?Q?DBjA2E/uNsX21XiSAqsNTjHB3n4dLP0eSbIGPMHOZeBoc3uNVIgJbxm4N4Nm?=
 =?us-ascii?Q?2O2hC1eElDSgHcggDmqxrmGYjSSdqagR0TmgQlW4F5iQJknJiGzna/nP6GAQ?=
 =?us-ascii?Q?ys3tTfY9ieE8EGI1l7CrMzFjwsiLaMs5ggvUuF1+Ae7IZtDTVa66IeIqVFgg?=
 =?us-ascii?Q?gxV6NFvdwP8O7vGBKYy7CW2WVtdrHGxyTmVnvaM62n/NMMlzBgwrg1XUwP5d?=
 =?us-ascii?Q?VMUTlLvJdVetuRU+StKMpgGLjdWBICWQWEKnaihIOXs4Tj+XQoaVUHzj+Cac?=
 =?us-ascii?Q?F2m92LXHUZT6KD7wTcGS3/vwBb5KQRvLex1S4L4/AHPQPCuKXYQB0/ktDviJ?=
 =?us-ascii?Q?JuhHq5F7mxsOrLx2snVD0H41+LC48Lv5+pegEimlY3RV1wvzSB+0t+y4t1fd?=
 =?us-ascii?Q?VYeRB5WJgrmjZb7Tr3DkPiHeV3Um+wPJhigpgpxzqy+6MOhFb3zcQQrVZ7y0?=
 =?us-ascii?Q?/3KKGUxG7dr4JEpO2ly3Ho+NRq7pq+JYnqaA7eAS2hiULXVtdrPamOef1D7H?=
 =?us-ascii?Q?5jn9JJBV6EFTIek=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7134.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?81UKyJNVJpAH7aFVyERzUjEQh2/N+lZGi2yDhgtKPtqwIHrrGwSnfPFRRg8X?=
 =?us-ascii?Q?9yV9VLE7j8UpVKNLThLogddj9mhQjB+bFHtkGTJJz/WBfnx/X4W2pmqPXyPO?=
 =?us-ascii?Q?cqArxH0hHSUbft8nRM/veadslNKpJMBk2zWMJPqn57T8W7A9CPOY9r6k+SLP?=
 =?us-ascii?Q?R11mLZ6sdlWt7iOKBV2jLoJdPXK1Sjhcvaj4me+JaaG7LXgnhBWh21ikEisJ?=
 =?us-ascii?Q?jojBgIpAq+AZR1SEEcCEyzKPMgNzyXNIwQJWYd35Q8GhNotI2XZQtxrt4Zol?=
 =?us-ascii?Q?UGYEs3LoMisQZu/RhVsaaB9lwPwyQGIVyVJDzmABWOvyunsttYFBnO9D8HXZ?=
 =?us-ascii?Q?3svpeVqSAI/Xs3PDYnUejZHz7k+O2RShiStr6YZyNvg3jM+mYNOvYB+aDSWi?=
 =?us-ascii?Q?2hFFWjNjRkmnfTn7tKyvB5KOeB1+lBguyBvYUO7wla4FOnjwCysbO6hQy7y2?=
 =?us-ascii?Q?iALNxTh9fL8E3SkhS1C09rA5hB/Mx8g+Aep2olpYtzT/A+qUv6NS8f/cEzdi?=
 =?us-ascii?Q?OodsLfikXe/c8AXZXPqtO/5wxDzRhO/yUfQeHIVYgwDOAHHFbC7es3gbDtCA?=
 =?us-ascii?Q?YVx9WnFXKvCvN8hWo+4wMBWdh6euWcKXp8ZEE9EjmC/xVoLWHs4rLDPenC/k?=
 =?us-ascii?Q?472qEFnRPHZ70ZQrC1yzQpWD591bLty6WYgmm++r++M6qg/iUsOtrUJfjxdV?=
 =?us-ascii?Q?zs+cYa2/877/mty9qK9jW24kSMP2Obh++6Fkf8FVwJ6a0s6z6Kf5J4eid0xn?=
 =?us-ascii?Q?Ca+3/mNTVyA6cyFK8URrh5OJAN770rUJbDZYAyK8vCnsje47d6ZRlDJuYEK8?=
 =?us-ascii?Q?tpaV49VrailYeQv8gOc2ERU8vzbbVN/iwmkL8FZunui/2XSd+dORcho2kXb6?=
 =?us-ascii?Q?LJSF9jfojOr8XiuLxAJ+kuD+PYHUOd0ObO4r3aeN+tCHwoWR6CNE2kpxP4pY?=
 =?us-ascii?Q?d/xpoQ6Vd91y3jMnfezDBaBlBRE/IEYEOSV86U6uHZXSv9q7r+vJ7OS8Yoc4?=
 =?us-ascii?Q?ZpOpsR+bHVpeK4g1jylMO7f3esYMFY21NJjw7EZ/Cik1UFQPsOcBAhCR6K3x?=
 =?us-ascii?Q?cc0qACwYsQgXHM7InAr6suEORWjbmIgvURDJIpC6MZRdn8ZQxhTDHnatyDz5?=
 =?us-ascii?Q?6GFnQCqY2ITrtdiFGMQ2syXUx0mIeEZFAckWKkleQ8U5FXskssi5zStOjsZU?=
 =?us-ascii?Q?qxrFUddAjI4nd76oiVqnGb7ZZeZYYcVXqOWi0Btkd5OoUhgshhjr94Hcx+Kt?=
 =?us-ascii?Q?u3td//NSqiJsIhYEMsj61ghl19irwMeAgoN/c7K9fOlv0m59c2EqPaz/l26v?=
 =?us-ascii?Q?Uamy8gclGlhwq8HR5JAT5htTP6HnmVP0oXlUAhnxIaRubfqnnAb83z8k0fgA?=
 =?us-ascii?Q?ouvb2NCcQXxkrwpdx0F05TuPESLaXHoCe4MXHkUM5MAFaxYroTap1Swsj2il?=
 =?us-ascii?Q?k3FQziPmYYFcQ/fA67szPz9mU72BjuNPH8BeR8j6iK0BGZpV4OTFRecFU1lz?=
 =?us-ascii?Q?zI48PelZPHw3gIfdWIN5VqaGd5qKtzUrELr2VRGzsn4WEL5KP7BiqdFKzaNb?=
 =?us-ascii?Q?t+7y9/P+Q8uFzJAlzsYsQh0r3TT+kTThfTamJYCw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7134.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fc1c6e-d7d1-46f8-cddc-08dda373b4b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 14:25:50.4831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DhFLHu8TQKS2tEKy8UKwF3YmNnlaIgCwnBSrdcElwQPEqkQHobu1CEoXCH/v65ezTkD7MNjI2XANaTdbJGq4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> From: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
> [...]
> Subject: [PATCH 3/4 v3] ACPI: extlog: Trace CPER PCI Express Error Sectio=
n
>=20
> I/O Machine Check Architecture events may signal failing PCIe components =
or
> links. The AER event contains details on what was happening on the wire
> when the error was signaled.
>=20
> Trace the CPER PCIe Error section (UEFI v2.10, Appendix N.2.7) reported b=
y
> the I/O MCA.
>=20
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Fabio M. De Francesco
> <fabio.m.de.francesco@linux.intel.com>
> [...]
> --- a/drivers/acpi/acpi_extlog.c
> +++ b/drivers/acpi/acpi_extlog.c
> @@ -132,6 +132,34 @@ static int print_extlog_rcd(const char *pfx,
>  	return 1;
>  }
>=20
> +static void extlog_print_pcie(struct cper_sec_pcie *pcie_err,
> +			      int severity)
> +{
> +	struct aer_capability_regs *aer;
> +	struct pci_dev *pdev;
> +	unsigned int devfn;
> +	unsigned int bus;
> +	int aer_severity;
> +	int domain;
> +
> +	if (!(pcie_err->validation_bits & CPER_PCIE_VALID_DEVICE_ID ||
> +	      pcie_err->validation_bits & CPER_PCIE_VALID_AER_INFO))
> +		return;
> +
> +	aer_severity =3D cper_severity_to_aer(severity);
> +	aer =3D (struct aer_capability_regs *)pcie_err->aer_info;
> +	domain =3D pcie_err->device_id.segment;
> +	bus =3D pcie_err->device_id.bus;
> +	devfn =3D PCI_DEVFN(pcie_err->device_id.device,
> +			  pcie_err->device_id.function);
> +	pdev =3D pci_get_domain_bus_and_slot(domain, bus, devfn);
> +	if (!pdev)
> +		return;
> +
> +	pci_print_aer(KERN_DEBUG, pdev, aer_severity, aer);

Is there any reason not to use "KERN_ERR" log level?

> +	pci_dev_put(pdev);
> +}
> +=20

