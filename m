Return-Path: <linuxppc-dev+bounces-1518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAF797E198
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 14:41:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBQjC1VYNz2yG9;
	Sun, 22 Sep 2024 22:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726970880;
	cv=fail; b=asf8Cw1D7JCb+vlJ/si4He0jc5jjiYz54lH8cmi02ywfJVPLujYqu2dpDq/UO+sYS7ZInVswdBjuN7nXKHvdV/EemxOxYBwf8IQ4vq/cOSFrFxZoAbFpN9+IcxtwBeTitJY0LHHXsbCMu0o7Xle9qiGw02ebWcZbIxNm+zAotQ/UpXrgRsAcCDymrmL86sm69K//iN9pZlszs5ITEINh0bsexx4xHkHhqEuNPNbhOpK07he9xmOcJvTvXoecWVetF9aHnzOtrGYOf8tLKxVQKZNceJvYKMNi5ED9L1WVeISRoowW1IzPehfq+Laf2EK/16ayBFpj/Qyl4p4nSJLsBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726970880; c=relaxed/relaxed;
	bh=pV0C966flC/962H6Rh6bfq+p7AsU2Gpehke4kx4Cu6A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ULABCGD+zblTg9rdetxbaMZOlvEurNY/LHMet9O5ZHwhajJzxk/E0pzkGnRcYmJycVjlKt3cTdgYDPeOT8CtpEW402M8/iWFWy+owzHQdalZw3Kq4pr0//3ctuECAviUd4oZLPdL84dQQFz0NcNRbTfRKDCBXr5WyKKgpo1LEykBoBsurAeWADeIZB1OCEmqYH+vQNpj/AATOWfnEnPWpopTpRE+qSus7EbCHtSP5zrV6ec7hzBFS/m5secsjaLvSUxFIclfanm2sVoJqhKhhSj1o024K2UGX9/KfjZHyLlKvMCAj0ZOab2LjK6FXrpci3L1LwJh1T7nWURUptldZg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nuHt6Ccj; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nuHt6Ccj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XB8fQ6xmDz2xsH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 12:07:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726970879; x=1758506879;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=AxQv1JU38c11Bwphg517okxGVwYUap4uIGGRnuQBing=;
  b=nuHt6CcjVRSFYqG1uPI2BDUJCfyV/jbAUa+o2hghCkjdBYa9b06VKTN+
   hLodznFKt0WxYobezEJ+QL65aamGj5V0G3o7IOlNafV02Jhe8FChoIpaL
   mcMeZPJBnuvGvlYi1jFQwITNNp2HREwmSo0TFO04k5jPEDn4JWgE2aGbf
   bT3yiMSHhgA2Q8ct/34uCIZQXQzt5ogfmW2+tGbeCz80ZWlGvTyM0wDBr
   9OHZRYxes0adLjY7vIKqn2TTpZlJH5QQkU06KeeInQ6RdZSJZ8/G73s3w
   Y/hUrfFpCTy9REPH9enBKXdQbuOwcbwk1Z13AnPoIC7vm5vK51eDqY0x9
   A==;
X-CSE-ConnectionGUID: tj5WChULTgCanw3WlRfVNg==
X-CSE-MsgGUID: zAyyYmYTQBecUYIzT0doxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="43461749"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="43461749"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 19:07:53 -0700
X-CSE-ConnectionGUID: kkmAIurXTESqREb4aRXJOA==
X-CSE-MsgGUID: ULoVayGSQieUM9YZbdg1hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="71007120"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Sep 2024 19:07:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 21 Sep 2024 19:07:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 21 Sep 2024 19:07:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 21 Sep 2024 19:07:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsYvo38uSgVTXkvHMunbX36y93VtMxG/GZl5nISXOfR8q6f+qDmUX4pmI+m0HZVpBHsHLq+pGTR51lHTkmxIeMcP51q7l2HYDJYuY8kTmpN9zfqo07ukMBS1iBa+6yukqNgj004TXDA+iiDlUmVcToGhVOFxALOWtyML8fhF4nvo+/jpO65iBNhiqIMJBJtaOqSEOjxvdQUa1DR8hylrlhw+hQHaIBozNdL99L6Wy3nkY9d+52s3/p3+PBlP0VRnmfPwZnhk8PT9fswq98U3uGNrK7/KkNof6MRw2RSO7LwixB61sRgCgM2CS1xyMXmaSf2/y5wVCbHwiYwzRL0BlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pV0C966flC/962H6Rh6bfq+p7AsU2Gpehke4kx4Cu6A=;
 b=TMxesWBB/WDIctknidlLwZYMD71Q4nDjpubPWW8iADV38vzuQlUcnSFTN6lbwHVtTez4wJ2v6ByLZ8aWmqdrJIDfPEeCZtRG9DSUTiGj9ELqXapEDBrlX0Z4IOVtjVXnlyYR9fW2VJTJoZMNHXQvyimiMGvfrHS6kLA3Bbv/ApWLw4f6JpB1NHSQTc+/2TlU9Ylmbu/lZZIk081JkdN9zbBJTK+krlYpjQ0vSeBSP61spn6EVtURjvVgKAeo5zJujBfoM4WQ6lMOtAGc8nxdoDn5aKUoNvxiST94LIpKYYHR8fCMDfGHGShkVF8nnpspe+mqEJFnf1zSRyYHKKLzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Sun, 22 Sep
 2024 02:07:49 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%7]) with mapi id 15.20.7962.027; Sun, 22 Sep 2024
 02:07:49 +0000
Date: Sun, 22 Sep 2024 04:07:44 +0200
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <dan.j.williams@intel.com>,
	<linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>
Subject: Re: [PATCH 06/12] huge_memory: Allow mappings of PUD sized pages
Message-ID: <66ef7bf0b1dfd_10a032946e@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <cover.9f0e45d52f5cff58807831b6b867084d0b14b61c.1725941415.git-series.apopple@nvidia.com>
 <3ce22c7c8f00cb62e68efa5be24137173a97d23c.1725941415.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3ce22c7c8f00cb62e68efa5be24137173a97d23c.1725941415.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR03CA0192.namprd03.prod.outlook.com
 (2603:10b6:303:b8::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: b778510f-7a98-4f5a-a4da-08dcdaab5b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DA6OXHbqFH6omg26JbUv48HSJD+ZufTy5Oy2XFD5kKhBvddcF2gxZl5eqoU3?=
 =?us-ascii?Q?wS4qz0nu9fPFZnhaKXopHElWY1FDbmDu009g7fPWlZpNJ6pY8aqPzqB2TWDd?=
 =?us-ascii?Q?quFCFedLfdJ0bqBBA3ICx9Fm3zL51gvXjqeH5jN2MKRpQtJ/JElrTfIykkm3?=
 =?us-ascii?Q?PVPNzjHNZQ/FZ79GDH+VQ2BntOc/cmGl5Um9Ser2DQ6JfOK7uJv/0m7848n+?=
 =?us-ascii?Q?nk+4O9X+2aNxn1/uz+XPuR1xFSlvRSVshMphMEmWiMx9JYSuv+l8K/vfqXbD?=
 =?us-ascii?Q?RnX7YIPwF/RWKrQV7hwx6dtUdNB6RxKEfbQQmDbuCkdHn+P8sQ4vbIJjXrIG?=
 =?us-ascii?Q?+oc0NDP4KUPOBZQSVNUvDt1fvNIrm7AOA/v//LZCAZxyyORty7vOBHNzRNLR?=
 =?us-ascii?Q?xS/lq/SYC+tS4HN61jdFETNXbKlH3IYx+1gMCdNKghaPzW6NJZydZjQR73U2?=
 =?us-ascii?Q?m9e9IBGytfq0psc4juU2Esfk0K+CcL1dEtfHHQJ7rzMMAtFZgsXXYHzD2iJ3?=
 =?us-ascii?Q?Vbu5IPDvFrQC3pVrMOFV5DUgMIMOaBzMvKi3jcbp6zt/wBeIT032BnU++I2m?=
 =?us-ascii?Q?MZVTggujvGcQATk5TYO+YUfEab6ukNiKS/ev6Ou3v0enoVbUWunbccpjVvEN?=
 =?us-ascii?Q?FH+QjeI6eVFK3MNaGFciiUAKQN3qoyLLlUYADmhInbya2jtGmLMr+13piEe8?=
 =?us-ascii?Q?YqA1sMP6UEXGiIVxedmiPXGl2gdOdLRZO2SVZ0ijhVOxzfyXBoC1tZgXbcLw?=
 =?us-ascii?Q?3VwRy3e+5jicyw+s0tos1/nHxTdTpUVT6SIwqL2TZ8nKSjW1Y8980dVTXaNY?=
 =?us-ascii?Q?HQAfmlqKjsf/6v6l7vbRDs1J0XMH2ashQBut9wJOsVvhozl0VatsvTqYvJ2v?=
 =?us-ascii?Q?sr6TAQjvUDo8GW6OyHh4fYHeUQlajYEy8/ViKzmkSvQWJGA320EGwVCiqyR0?=
 =?us-ascii?Q?ZuQoYbdYQzH6aHqaUe1dkh9dKQGM02WN0kIMfxq+J9I4pxzaLUiDw/GlG8v1?=
 =?us-ascii?Q?gkdXDwQjmNySeVhrusqglOPmsjwCCc8uiSCtQIWmrv1Gta3tmdsXzYlHU86O?=
 =?us-ascii?Q?d9p3xv075jPM7w32L6vAlcqcLcnFfYCBubXvpL4+d3zFh4yTWwkGJMndaPek?=
 =?us-ascii?Q?pKZl+Ed8vFygVkUQdNJ4sojHaDz9mgeOIkwFC6u8cttZ4a0JNVPXZTEgxQNo?=
 =?us-ascii?Q?MnibCwYDZfxDbSSNjMA8lbP4a72nof8+9tudOQ1+8Ou/WNEeT6R6M2rhFalg?=
 =?us-ascii?Q?SYZCnirEaPmF7KhHw18hRnJZZEGMmR7sKJlO3I4TNA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R7xbtulsK+sxAyNsEkFsj61JZhDbeTQxHJehmSWT0U9KIB2cnklXCHUzQpkW?=
 =?us-ascii?Q?s0FOCw/iQhZhm3rgby2oOAjUG0pT8rbyKI0J9zwDvHRukRHfEwi5gm+rzkNd?=
 =?us-ascii?Q?LhVIwXCtkmYbPBEGOYj4s4DtQ1zzYqJg1H/ogPCjaKq2Lhd5kKCVGjl9CUEL?=
 =?us-ascii?Q?5Pu8TndXmIdAzHhKflNacOBG2HgVWfU7y+uGC1BXB7K55r6/26dhF8jt/sgE?=
 =?us-ascii?Q?Oo9n9tzhBLEOS963eXi8X2u6jvuUlJc7woO5+HpKT+Yeg148EiHwlJgKz4Cq?=
 =?us-ascii?Q?FtSjKfPlxgiKCfx65qmGUmjKfnI7Q92PbAtpw2awAL5gtBhBCyWvji/37Csu?=
 =?us-ascii?Q?q8fuNtXUzfLAuTkjPedDb7Cdh3cogMQX6W4NEwX+RYSSl+PQG4qscKqj/hjp?=
 =?us-ascii?Q?PWIiuQ9PMJAmau3yYW7OICgkT5Mo4o31OubdmQQG4D5GqJ6RxdZZDNDvRtIT?=
 =?us-ascii?Q?GR5XRJvmaSA41UUaFzWm1SUnfTLZAEzzaozT0CUVD+jszne+Jy9UV7/r3fW/?=
 =?us-ascii?Q?LsnWa+Hnn7zS0IzS1maTREqSWWRlyTURFZGU7JAyR3TG5CRhAjHIxWdbY9E5?=
 =?us-ascii?Q?QdK6xdu0A/6HGNOEI9xpxDFyChlV6W7GsJDLubfA7CEH22T0VUGeBQtea77B?=
 =?us-ascii?Q?UbfVAstr9CttQX6GxIMFk/IqN2cu4DeP+uqZZ5pNUH75w0LuXEbdnm3uFE0s?=
 =?us-ascii?Q?YkC1Gw6HDXNwNWCovLqdvkZwPnVg59u8gCJKbRUJPi/8aE/xwJXWJLiLgBbJ?=
 =?us-ascii?Q?yFZheVQt6PflRIXQHEr4lMQUtyrXwQHWdvNY3Hs0duNFgzXCIi5xKpOGY/dc?=
 =?us-ascii?Q?JsKyK5JTCZ06b1Eqgza44afyISAAS1oeKB2MJWcC1Iyt4T7lyejk+GsHCxNX?=
 =?us-ascii?Q?6+qs/LjBbS940fJf6k4Uyq9PhnUWlMtzKUXmsXFSHvVpu249Q+jIcKSUsWrY?=
 =?us-ascii?Q?llVdUk2o/QWdshFyZ26pqTYeKyUg3PoHkX/Kf28GsK1BfPybQMg1ITNwTj8n?=
 =?us-ascii?Q?jG9M8oVRN80oBG7Od7vg4sgjnqM9hRbWsn9LKaNLmUjwYF0FNoOOgKDBOS+o?=
 =?us-ascii?Q?ikICjiOUiAXCa09ewVnHmVoUqtQnA9CnyIcI7cDf0ZmxrvaV8TZA/8DpltLH?=
 =?us-ascii?Q?dFzIZXYkleSDiI+DGY4InOC7PyXeDAcOYuuq9C0y1viTp6N0yOjV1zNXEiDW?=
 =?us-ascii?Q?V4yaU+NOOvv4sIy+juRMctCrSMpK4pEr2kHPZS7im0YulD3IrU06TGGKBvrZ?=
 =?us-ascii?Q?ZP7ARfn7uC60bH+qEkit3gQYCHa+9P6NNRg2ADq5+/oNXwbEPL0P0j1HETO8?=
 =?us-ascii?Q?qxTwv66lz0M43J4Gxwirssn3tkkD0vvcQAFHUV/fE78I7QOAnq0y7l1j8oMA?=
 =?us-ascii?Q?8AH+/Gz7pIcRqk+NyN31NCqVMatYHsjybbVw/Y7X9LAjdTFVAAPcvGslKRpx?=
 =?us-ascii?Q?JZY+ZaKIUaKt3qpUHpcMo7X/AuVoc0lcRYs4a7Rhs6DNJbH5KjXvpu8zQtqA?=
 =?us-ascii?Q?0MDBu+yBqXuc+6Gr4dafSg+8bCM4Y8b9OxDxAZwFT8+LX2SiB0A3BbM0FXq3?=
 =?us-ascii?Q?JpkKGNGTjOLCdQyKunCq46wrGpuHwWFKbzwkiWxHQEO8O7krY7uWrI+TxhRP?=
 =?us-ascii?Q?hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b778510f-7a98-4f5a-a4da-08dcdaab5b6f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 02:07:48.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnsOs3d7avElvfMWZJ2/lPoYIVgKYJbhWiZ9xP9Nkm49dy8UKNOQezMMko51orKxyGvBcp0cfLBeDZ75lWhb/y5C43y9rkzxeTSI5KwxDvI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
X-OriginatorOrg: intel.com

Alistair Popple wrote:
> Currently DAX folio/page reference counts are managed differently to
> normal pages. To allow these to be managed the same as normal pages
> introduce dax_insert_pfn_pud. This will map the entire PUD-sized folio
> and take references as it would for a normally mapped page.
> 
> This is distinct from the current mechanism, vmf_insert_pfn_pud, which
> simply inserts a special devmap PUD entry into the page table without
> holding a reference to the page for the mapping.

This is missing some description or comment in the code about the
differences. More questions below:

> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  include/linux/huge_mm.h |  4 ++-
>  include/linux/rmap.h    | 15 +++++++-
>  mm/huge_memory.c        | 93 ++++++++++++++++++++++++++++++++++++------
>  mm/rmap.c               | 49 ++++++++++++++++++++++-
>  4 files changed, 149 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 6370026..d3a1872 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -40,6 +40,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  
>  vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
>  vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
> +vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
>  
>  enum transparent_hugepage_flag {
>  	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
> @@ -114,6 +115,9 @@ extern struct kobj_attribute thpsize_shmem_enabled_attr;
>  #define HPAGE_PUD_MASK	(~(HPAGE_PUD_SIZE - 1))
>  #define HPAGE_PUD_SIZE	((1UL) << HPAGE_PUD_SHIFT)
>  
> +#define HPAGE_PUD_ORDER (HPAGE_PUD_SHIFT-PAGE_SHIFT)
> +#define HPAGE_PUD_NR (1<<HPAGE_PUD_ORDER)
> +
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  
>  extern unsigned long transparent_hugepage_flags;
> diff --git a/include/linux/rmap.h b/include/linux/rmap.h
> index 91b5935..c465694 100644
> --- a/include/linux/rmap.h
> +++ b/include/linux/rmap.h
> @@ -192,6 +192,7 @@ typedef int __bitwise rmap_t;
>  enum rmap_level {
>  	RMAP_LEVEL_PTE = 0,
>  	RMAP_LEVEL_PMD,
> +	RMAP_LEVEL_PUD,
>  };
>  
>  static inline void __folio_rmap_sanity_checks(struct folio *folio,
> @@ -228,6 +229,14 @@ static inline void __folio_rmap_sanity_checks(struct folio *folio,
>  		VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PMD_NR, folio);
>  		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PMD_NR, folio);
>  		break;
> +	case RMAP_LEVEL_PUD:
> +		/*
> +		 * Asume that we are creating * a single "entire" mapping of the
> +		 * folio.
> +		 */
> +		VM_WARN_ON_FOLIO(folio_nr_pages(folio) != HPAGE_PUD_NR, folio);
> +		VM_WARN_ON_FOLIO(nr_pages != HPAGE_PUD_NR, folio);
> +		break;
>  	default:
>  		VM_WARN_ON_ONCE(true);
>  	}
> @@ -251,12 +260,16 @@ void folio_add_file_rmap_ptes(struct folio *, struct page *, int nr_pages,
>  	folio_add_file_rmap_ptes(folio, page, 1, vma)
>  void folio_add_file_rmap_pmd(struct folio *, struct page *,
>  		struct vm_area_struct *);
> +void folio_add_file_rmap_pud(struct folio *, struct page *,
> +		struct vm_area_struct *);
>  void folio_remove_rmap_ptes(struct folio *, struct page *, int nr_pages,
>  		struct vm_area_struct *);
>  #define folio_remove_rmap_pte(folio, page, vma) \
>  	folio_remove_rmap_ptes(folio, page, 1, vma)
>  void folio_remove_rmap_pmd(struct folio *, struct page *,
>  		struct vm_area_struct *);
> +void folio_remove_rmap_pud(struct folio *, struct page *,
> +		struct vm_area_struct *);
>  
>  void hugetlb_add_anon_rmap(struct folio *, struct vm_area_struct *,
>  		unsigned long address, rmap_t flags);
> @@ -341,6 +354,7 @@ static __always_inline void __folio_dup_file_rmap(struct folio *folio,
>  		atomic_add(orig_nr_pages, &folio->_large_mapcount);
>  		break;
>  	case RMAP_LEVEL_PMD:
> +	case RMAP_LEVEL_PUD:
>  		atomic_inc(&folio->_entire_mapcount);
>  		atomic_inc(&folio->_large_mapcount);
>  		break;
> @@ -437,6 +451,7 @@ static __always_inline int __folio_try_dup_anon_rmap(struct folio *folio,
>  		atomic_add(orig_nr_pages, &folio->_large_mapcount);
>  		break;
>  	case RMAP_LEVEL_PMD:
> +	case RMAP_LEVEL_PUD:
>  		if (PageAnonExclusive(page)) {
>  			if (unlikely(maybe_pinned))
>  				return -EBUSY;
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index c4b45ad..e8985a4 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1336,21 +1336,19 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
>  	struct mm_struct *mm = vma->vm_mm;
>  	pgprot_t prot = vma->vm_page_prot;
>  	pud_t entry;
> -	spinlock_t *ptl;
>  
> -	ptl = pud_lock(mm, pud);
>  	if (!pud_none(*pud)) {
>  		if (write) {
>  			if (pud_pfn(*pud) != pfn_t_to_pfn(pfn)) {
>  				WARN_ON_ONCE(!is_huge_zero_pud(*pud));
> -				goto out_unlock;
> +				return;
>  			}
>  			entry = pud_mkyoung(*pud);
>  			entry = maybe_pud_mkwrite(pud_mkdirty(entry), vma);
>  			if (pudp_set_access_flags(vma, addr, pud, entry, 1))
>  				update_mmu_cache_pud(vma, addr, pud);
>  		}
> -		goto out_unlock;
> +		return;
>  	}
>  
>  	entry = pud_mkhuge(pfn_t_pud(pfn, prot));
> @@ -1362,9 +1360,6 @@ static void insert_pfn_pud(struct vm_area_struct *vma, unsigned long addr,
>  	}
>  	set_pud_at(mm, addr, pud, entry);
>  	update_mmu_cache_pud(vma, addr, pud);
> -
> -out_unlock:
> -	spin_unlock(ptl);
>  }
>  
>  /**
> @@ -1382,6 +1377,7 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
>  	unsigned long addr = vmf->address & PUD_MASK;
>  	struct vm_area_struct *vma = vmf->vma;
>  	pgprot_t pgprot = vma->vm_page_prot;
> +	spinlock_t *ptl;
>  
>  	/*
>  	 * If we had pud_special, we could avoid all these restrictions,
> @@ -1399,10 +1395,52 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
>  
>  	track_pfn_insert(vma, &pgprot, pfn);
>  
> +	ptl = pud_lock(vma->vm_mm, vmf->pud);
>  	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
> +	spin_unlock(ptl);
> +
>  	return VM_FAULT_NOPAGE;
>  }
>  EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
> +
> +/**
> + * dax_insert_pfn_pud - insert a pud size pfn backed by a normal page
> + * @vmf: Structure describing the fault
> + * @pfn: pfn of the page to insert
> + * @write: whether it's a write fault

It strikes me that this documentation is not useful for recalling why
both vmf_insert_pfn_pud() and dax_insert_pfn_pud() exist. It looks like
the only difference is that the "dax_" flavor takes a reference on the
page. So maybe all these dax_insert_pfn{,_pmd,_pud} helpers should be
unified in a common vmf_insert_page() entry point where the caller is
responsible for initializing the compound page metadata before calling
the helper?

> + *
> + * Return: vm_fault_t value.
> + */
> +vm_fault_t dax_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
> +{
> +	struct vm_area_struct *vma = vmf->vma;
> +	unsigned long addr = vmf->address & PUD_MASK;
> +	pud_t *pud = vmf->pud;
> +	pgprot_t prot = vma->vm_page_prot;
> +	struct mm_struct *mm = vma->vm_mm;
> +	spinlock_t *ptl;
> +	struct folio *folio;
> +	struct page *page;
> +
> +	if (addr < vma->vm_start || addr >= vma->vm_end)
> +		return VM_FAULT_SIGBUS;
> +
> +	track_pfn_insert(vma, &prot, pfn);
> +
> +	ptl = pud_lock(mm, pud);
> +	if (pud_none(*vmf->pud)) {
> +		page = pfn_t_to_page(pfn);
> +		folio = page_folio(page);
> +		folio_get(folio);
> +		folio_add_file_rmap_pud(folio, page, vma);
> +		add_mm_counter(mm, mm_counter_file(folio), HPAGE_PUD_NR);
> +	}
> +	insert_pfn_pud(vma, addr, vmf->pud, pfn, write);
> +	spin_unlock(ptl);
> +
> +	return VM_FAULT_NOPAGE;
> +}
> +EXPORT_SYMBOL_GPL(dax_insert_pfn_pud);
>  #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
>  
>  void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
> @@ -1947,7 +1985,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  			zap_deposited_table(tlb->mm, pmd);
>  		spin_unlock(ptl);
>  	} else if (is_huge_zero_pmd(orig_pmd)) {
> -		zap_deposited_table(tlb->mm, pmd);
> +		if (!vma_is_dax(vma) || arch_needs_pgtable_deposit())
> +			zap_deposited_table(tlb->mm, pmd);

This looks subtle to me. Why is it needed to skip zap_deposited_table()
(I assume it is some THP assumption about the page being from the page
allocator)? Why is it ok to to force the zap if the arch demands it?

>  		spin_unlock(ptl);
>  	} else {
>  		struct folio *folio = NULL;
> @@ -2435,12 +2474,24 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
>  	arch_check_zapped_pud(vma, orig_pud);
>  	tlb_remove_pud_tlb_entry(tlb, pud, addr);
> -	if (vma_is_special_huge(vma)) {
> +	if (!vma_is_dax(vma) && vma_is_special_huge(vma)) {

If vma_is_special_huge() is true vma_is_dax() will always be false, so
not clear to me why this check is combined?

>  		spin_unlock(ptl);
>  		/* No zero page support yet */
>  	} else {
> -		/* No support for anonymous PUD pages yet */
> -		BUG();
> +		struct page *page = NULL;
> +		struct folio *folio;
> +
> +		/* No support for anonymous PUD pages or migration yet */
> +		BUG_ON(vma_is_anonymous(vma) || !pud_present(orig_pud));
> +
> +		page = pud_page(orig_pud);
> +		folio = page_folio(page);
> +		folio_remove_rmap_pud(folio, page, vma);
> +		VM_BUG_ON_PAGE(!PageHead(page), page);
> +		add_mm_counter(tlb->mm, mm_counter_file(folio), -HPAGE_PUD_NR);
> +
> +		spin_unlock(ptl);
> +		tlb_remove_page_size(tlb, page, HPAGE_PUD_SIZE);
>  	}
>  	return 1;
>  }
> @@ -2448,6 +2499,8 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
>  		unsigned long haddr)
>  {
> +	pud_t old_pud;
> +
>  	VM_BUG_ON(haddr & ~HPAGE_PUD_MASK);
>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PUD_SIZE, vma);
> @@ -2455,7 +2508,23 @@ static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
>  
>  	count_vm_event(THP_SPLIT_PUD);
>  
> -	pudp_huge_clear_flush(vma, haddr, pud);
> +	old_pud = pudp_huge_clear_flush(vma, haddr, pud);
> +	if (is_huge_zero_pud(old_pud))
> +		return;
> +
> +	if (vma_is_dax(vma)) {
> +		struct page *page = pud_page(old_pud);
> +		struct folio *folio = page_folio(page);
> +
> +		if (!folio_test_dirty(folio) && pud_dirty(old_pud))
> +			folio_mark_dirty(folio);
> +		if (!folio_test_referenced(folio) && pud_young(old_pud))
> +			folio_set_referenced(folio);
> +		folio_remove_rmap_pud(folio, page, vma);
> +		folio_put(folio);
> +		add_mm_counter(vma->vm_mm, mm_counter_file(folio),
> +			-HPAGE_PUD_NR);
> +	}

So this does not split anything (no follow-on set_ptes()) it just clears
and updates some folio metadata. Something is wrong if we get this far
since the only dax mechanism that attempts PUD mappings is device-dax,
and device-dax is not prepared for PUD mappings to be fractured.

Peter Xu recently fixed mprotect() vs DAX PUD mappings, I need to check
how that interacts with this.

