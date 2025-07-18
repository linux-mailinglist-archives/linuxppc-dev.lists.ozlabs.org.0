Return-Path: <linuxppc-dev+bounces-10325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C9CB0A99F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 19:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bkH7w4Mx6z30Qk;
	Sat, 19 Jul 2025 03:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752860300;
	cv=pass; b=I3tt68vjp3uwkElD/WMaqvovkuyEMGWvTzcFHuFtUX3vI2trXtorO/3VPntqLmQr8hbf94aTCJAzvOsEHeyM1ywJgH4gb+PVLHpvarEALmbyufPxI4zmPPtJVYDhrjz4RSNec5JPhbDa3MqlDzGvrFxEebJNVCk4GE8rBwksE9/t61YKaT5Slx1Zt/gaGWkRHNzisqcCifmjp2rw2jR3Yk/qE5h0lfYDh8iCvqfdEn5AekYPJGYTgIT6v0WswxuNAFwhBV5u/d8q7dkSG5E3N4mHxbKFTsXVYBAYc6hg/heoUv8w3jk3syPO/AGtyvkqWt331o54GkGB4Ye08AfAvA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752860300; c=relaxed/relaxed;
	bh=fcFT1uZZQCFDDbZi6aqdHBuWNYBvRi6zg7Q9UHnZEh8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vs3IIS/mBvOlTtXt1zo6Fe5JMDiZxr485pkrqQxxABcOTllVL5C5zxxbVyxk2+9j/CacOpB4MczD4J1D+S1ndygv4TJODF7USJ4q6iiYxIP83pcQ4UwqvzTwUGVfwGwjpdXMwB5sruZqYUx5NV0CssEXBQmUnpiENObWYxZ/IlfNS3QX7+3Fok/5eJwtJIrbNlxjAXQ0xYvcPkVbIGNthrfqjCjRcUESgrVS1l+NWS4bFKEfrwkblVr1aSKdLDMPqcMwIWyqWKtAlzABr4wkwbcIfZiZe+6O1swv+vq8OV6au5ZqxKTu8N7MEpe+f/EjqARJSJKFtbHGd6eEPWCw1g==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oB3gu/Ur; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=tony.luck@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oB3gu/Ur;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=tony.luck@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Sat, 19 Jul 2025 03:38:18 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bkH7t29Xsz2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jul 2025 03:38:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752860299; x=1784396299;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fcFT1uZZQCFDDbZi6aqdHBuWNYBvRi6zg7Q9UHnZEh8=;
  b=oB3gu/UrsbYyCJWsk4pVkeiKg0G/f4FTOGp7nH8m2slrAQh6+noBkaJy
   Dms1fhpydb4amk8OAzFKEmuMqCJ83v7SwzRa56fKAecBSbXQ4GAUx5xqd
   oWKkFG7Lz67fOwvKBQMgBJi1wCR82x4rJWllxvJOkfNBzNkY2DDDD5HFS
   Vah6tgkCEQu518p3tST30ow6pWhrz0gz3eWnSjEa3MrulC9ORqp3BwESY
   cqM8vVvj8cE5Ni0ezb01udgmPWuuSOLKuReVSzZ5wCLOVd+AJb9sG3P5K
   gTqR8izVK64PQZOyvLwZ5IWSyBQ8lruGkmjFaJ1qibypJHT6KU9vZb1Ig
   w==;
X-CSE-ConnectionGUID: YmHYm6TuQwGISgzTXYsvYw==
X-CSE-MsgGUID: DjbTTOqZR/aD/tOUbB3OHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54873371"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="54873371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 10:37:10 -0700
X-CSE-ConnectionGUID: MpmVSVegSSGMMEfC2InRPg==
X-CSE-MsgGUID: hmVf6G3LRweqFX0kbIqZcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="162392779"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 10:37:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 10:37:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 10:37:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 10:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owJbG9YhMbd/lNSYm1GF6pLnJYY7cWQC+I+JPsbwVgvx1+r6mtQSbIMIQgO3Z2Pxl83MoYGoMoKj7Kaobxl6QPmb2FyLFPO19G0Pn9RRAmyK4pf+EP1RTa0em7Cu7kyXsRVpjeTcihySuOTvylksHzM/+4+qXsxrZGI34VDlORVyGRnZzGBGFJJuCHlbplG8hiduwh7JlZoB2ePNNdDutMVi22kSOFWUXbh603kQ2LLYK/bFDjcZAfPhmpj6ix00CyvtmHcgFYBXCGpKAf79UO5emDT7avJ7Y1CyWghN9AfQmVLF4ds4rmcyM28godaAe8CJq6PykIYSccALIWBqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcFT1uZZQCFDDbZi6aqdHBuWNYBvRi6zg7Q9UHnZEh8=;
 b=X9OO4VS87GeISdqPBxCPi5Pk1ESQCQIupjYinu2QrE06Ch1wqpBW0ut8I4P5XWcgBKCyIZC8d62l6AXE8A7Z+p+ZBOlHyZuc/ZAqXVZ/Dyi9qXQWDybulyoMsEnWwnXH/buMvQ2o5s6Zkqx6Bpf+hKlVe3GtgDDqlBnbnqUyDNGwFNj7SBT1jwoY/pQzj7rPF/lrmBCp23PU/IhYCPVxOw+RMmtBvgd8sbw60FZ+htMoaFvkyVaMBwzijnZ26Wq8hADKMDVRjFcTnJqN35M4SancD9rRmpSt5hA3FUCtAFAGSUce6WEF60rzDE0HnbnecGFzyK3hd3Ds1P7FvQb3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ5PPFF330187AB.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::860) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.37; Fri, 18 Jul
 2025 17:36:50 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%4]) with mapi id 15.20.8901.021; Fri, 18 Jul 2025
 17:36:50 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Breno Leitao <leitao@debian.org>, "xueshuai@linux.alibaba.com"
	<xueshuai@linux.alibaba.com>, "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>,
	"oohall@gmail.com" <oohall@gmail.com>
CC: Borislav Petkov <bp@alien8.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, "Moore,
 Robert" <robert.moore@intel.com>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "acpica-devel@lists.linux.dev"
	<acpica-devel@lists.linux.dev>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "osandov@osandov.com" <osandov@osandov.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH] ghes: Track number of recovered hardware errors
Thread-Topic: [PATCH] ghes: Track number of recovered hardware errors
Thread-Index: AQHb9OBy0msNHAJLb0CCMVEuXQ5eELQx2rEAgAAFjlCAAAGCAIAEniKmgAAVGSCAAX5vgIAAFdQQ
Date: Fri, 18 Jul 2025 17:36:50 +0000
Message-ID: <SJ1PR11MB6083D08A2F94FAEE5261AA6CFC50A@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org>
 <20250714171040.GOaHU6EKH2xxSZFnZd@fat_crate.local>
 <SJ1PR11MB6083C38E6DA922E05E1748D6FC54A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20250714173556.GQaHU__LL6IUIPCDIW@fat_crate.local>
 <aHWC-J851eaHa_Au@agluck-desk3>
 <kw7mwmca3ir4nfyofumqiack5sht3aisdchevykdtmlio6xo7z@5xbdibpqvqix>
 <SJ1PR11MB6083CEAB23FCE85937DC5403FC51A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <mazejvrglvtqdfsevduahqxvlvjv6hlo3apivossn2jnxpsuds@os6kxmmsq3xt>
In-Reply-To: <mazejvrglvtqdfsevduahqxvlvjv6hlo3apivossn2jnxpsuds@os6kxmmsq3xt>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ5PPFF330187AB:EE_
x-ms-office365-filtering-correlation-id: c5410c68-fc63-4168-9d0f-08ddc621adaf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+bqXEhnWPXB+OyrnEw/xbljBAArePy99djTZZm/A98qrEa6EkAkqsxQtfCIv?=
 =?us-ascii?Q?LW5kAMrxEuqnTMglPLwkf0agFqrlnAqJyyp5BuP8hjR/RlZVW8/A2Y4PTQGA?=
 =?us-ascii?Q?WsHvvTd8HScZ3eI0GXFQt4ti1o5tsihhe+XFszcdN0hsT98JIPMpV3uEBRXG?=
 =?us-ascii?Q?3VE6m9IoPHo9sSLGCZ6KegzLpxVEgbIDkWXetw+6/IJ4ZZcmGGfOeZAm3xZp?=
 =?us-ascii?Q?9PFc/rXj7I/XY8sck3wyk3nIdIYYsTTGDphTiH5aQJzw/8O63d6nlM1dEEJV?=
 =?us-ascii?Q?1k/P70Jh80F1K4TR/IqNjx51n2w54O59/apf/3n7RcsTTP6qYm6H6Jjhbsy7?=
 =?us-ascii?Q?DDuGOyV0w+36lymQnIZHPCegHkqliFdwd9jFK8cX33PklPiFdD+TFlvd2dBA?=
 =?us-ascii?Q?4VFQA/aMLmAwn5Q/yxWUcqIUyU0nmIutKX2h/ilcA2X4V+c8mt+z4sjJIT7/?=
 =?us-ascii?Q?/jQCu20uSImzFqErpVlCoQMJMzbHCwmVFk9ocfqcrgWJiwlK87RfFgnsNb2X?=
 =?us-ascii?Q?DzDvV0meDynObSXkU1K0yCT65vP8ZPrhTkaaplP1HYD5ULXer88L5re0Bw2v?=
 =?us-ascii?Q?tWYLQ6XB9dx9rqWpq39dy0yAf4GFav9TpLh4sGNQ8GNggyXrRhi4VUlsDF7h?=
 =?us-ascii?Q?B0cdMwbHWSnUolXlMW7mzmz3JXSo5NVsO3f3jiUI67Fln/mIAtve4sEvFMNI?=
 =?us-ascii?Q?g9D16YJ059Rluck9EnL1Dm++xwOr3MCUqBO+SLBzIrFyZhauUtwpbYAkQB63?=
 =?us-ascii?Q?Zbgy1014Dbs6zlxNRbXIofn4lwdvJF8f9omOQrxq3YHvDfbxu5lrlofr52Zn?=
 =?us-ascii?Q?qBqTEfJqZ27iUa7hWLBUH+/2DBpQvJoz+QNT74mRcMM5TS13EMhp6fc4428r?=
 =?us-ascii?Q?WDUwoBa7Bl0lb1Wvw+BramIEr29rjbYcwgpoOzWRjPKToAYL+As2ICHQeeSe?=
 =?us-ascii?Q?uM1T6geBipCNJfvCOxiS6hS2t+gwH9LdFp0KGnfe29UqN0Fookb7SFQqpNRx?=
 =?us-ascii?Q?TC/ia3cSycye2BeTbpd9T2GLE2uG5zQNx7tp+YOr/tmYf8yQjH2GIWpTaQNb?=
 =?us-ascii?Q?0PZ085aHbBkirRhmOtG9OuxLMg9cszBHEe7bJwKjw5/Bfqji4CQ1HhA38eTr?=
 =?us-ascii?Q?jFoEDQzsVZesc84mdvNfEWmHRaEwXejPw5nfU+6qFl2rIQeORdGvPDbaSNtf?=
 =?us-ascii?Q?04UMCjt6mM7TBJQ4So2sarf671agCwCtAxHNke5zhwSAFt0mAxNSPTsyxhzO?=
 =?us-ascii?Q?R5ihcmivpusixDX5s12ZwWsZe/rybadD/VnR5wZwepOGpDskRt4oF+8RC+0q?=
 =?us-ascii?Q?dSb2uzZ7qC78/kxKwcg9fQxBRHJI5+IbF2Quva32UIsw3qdhkWusw/00H5QE?=
 =?us-ascii?Q?7jwQXM+YHbt/ghE3MbWxASRHZDximqURSpHGAsmeljV6swz1x+pNgSJ4TlvM?=
 =?us-ascii?Q?p9Iwls05y1A7WsbALqM9+mNv/ln9o8WDq/WvplHhHXoCcYHgd4EHEg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/hiW/exmPBrsCZjQqVAfyrWvH62XY7KvzXxufkbcxX6NpATYj7YwGNWD58qi?=
 =?us-ascii?Q?GcGkcQdpAYwAqJg6WgjBo7tMEy5SU3daVinRymKaLvw8PMf2Xv3pexDY+Hwj?=
 =?us-ascii?Q?Ff94lyVQVasXivFZiLJa36Q6b0iMRUNsFMNt30rUXDTx1MP0ui3czpShF5IO?=
 =?us-ascii?Q?553AHOXsVjwv5YcGCeCMIrkphI27dv2NYRC1/I4b4tSe+yKSTM+fgA5SLl2t?=
 =?us-ascii?Q?Am8WZgL6pM7lNTT60lzucZ2Oi2tOS0yQJbjyJJWYq/qG83RhRktdNa7tijko?=
 =?us-ascii?Q?VAgDJ6auFG+a729NMGaJ4omQxh4LwCE2qUqPCAOjNbCkJZ/G+XXCr1p2hpt/?=
 =?us-ascii?Q?b6eGlZmK2H0HU34/cvRnIq9xQrb57V7BmtRDYphcjm8w7paxqg7DknzD7fgT?=
 =?us-ascii?Q?RUHRDDayf1s7Vs9q50Xf64iFOZbl6mz9dg9u/r2Lw8Evl6fG4Y92s1vQl2Ac?=
 =?us-ascii?Q?CfpZEnfEOSyszBpnJhAoYgw6tpei6sgppm5U3YJagCG6t2EcYeLOKQQc9H6q?=
 =?us-ascii?Q?4tjygi9PqOXr4aHe5/rnfKY3KCtI8T7G6g6f3DOiPj3YVqW5tvQqV8t5yGOG?=
 =?us-ascii?Q?WrNQZhmwEiYcuK+W9c1O+dCxUMOEL2Hr3qt+PeMT86s3h41gLDckSE6MuwW1?=
 =?us-ascii?Q?bQxVTAgXL/IhchjUYPK29nljaEXSvNSQDwEdRMVucF0u49XKzAQKPj3mnEYd?=
 =?us-ascii?Q?WGNx3uw3mBZm7mHQ1rDmwoUv1km8vPoA6LqWgzLpTz3JI361FHVw/kbm4AYR?=
 =?us-ascii?Q?e7+2g/7L/Y4zKgd7hjLgvEitaxqIA49GtvyI7S3g0PVJRouPs/62Vi5YTRmg?=
 =?us-ascii?Q?pYKck3NYFQW67Ab2zHSf0J4DzrIPZoyiBAxg9Av91TGr17Vcb9OpzaGKPk5s?=
 =?us-ascii?Q?qGMlGsDfisZXt7OlB9iwS1RAtKrabGilurkjAy6cdZKY8SC10BBgQLdV+vx4?=
 =?us-ascii?Q?+qZJXbee9C9g6zGS8tnY2e/hgdqd0vO3zCt2A1w6DrGcWnzBNq4QTD97mfIn?=
 =?us-ascii?Q?zLwLKNVNQxmXDV85ZkRhwm7/DqFTMNQvECbl6WX12zjZcntPFLsa/1pPTz9g?=
 =?us-ascii?Q?15BqMaSUfRsrW34S00YuTp6efZ4+2Pc9IUVsIMNOY/P34Ve459Y2SgmAW2iw?=
 =?us-ascii?Q?GtcVJmSM+lPumfNq6jtnaWzFzc8ZmD1i2J3A2uGj4709aNJmEAcbFaJ3hw+i?=
 =?us-ascii?Q?6tifX8FD5q7zKElAG+ckquWSDiHLZiINXjlmNhsvQLkuw3btRTEnRirLgLoP?=
 =?us-ascii?Q?Wb1ifPDqOtPK9KqLvhW+7+WWX0Lcdf5B4Fq+Mzxq0bDzs8Jf6Z/qgTigYTU5?=
 =?us-ascii?Q?+u3xCco7Ksy5/t5I+xgNIdrcq95BKSfhuLsjKsfTDirLdEkRZAvm6PHUlV5B?=
 =?us-ascii?Q?slPkM5qfyV3QurWJBsSGXHu1jpqeG66ZfF3FjUKELWlq7bV9no2qMoNmQAEk?=
 =?us-ascii?Q?+phKRGbZDkEU+geyhnYU36Lc7xv16UP74bUF/Ai8+9asryj3XogTz62aqH4Q?=
 =?us-ascii?Q?lSV3BlDEsJyxaGBjDkLMArDIr//muCJ/By+5JmcX05IaRJ01F+KI92fDzGRC?=
 =?us-ascii?Q?TBMofPlyRZL4IlvsJCQzp6ZGAuoQI+AlZSBe50Px?=
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
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5410c68-fc63-4168-9d0f-08ddc621adaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 17:36:50.6328
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nGxifywlINCAaWxlhSE5Y6wwMvh/BxgVtOJ9P5Y1UApKV0N7CoS5vqlpqev+UO0cy33wZGLwibut0W5InovcYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF330187AB
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> I found that I don't need to expose the metrics in vmcore info at all to
> be able to read them from vmcore, given crash/drgn can read those
> symbols.
>
> Global variable hwerror_tracking will be write-only during kernel
> run-time, and only read during post morten analyzes. I am still not sure
> if the compiler might not get rid of them completely, given no on reads.
> I am wondering if I should EXPORT_SYMBOL_GPL(hwerror_tracking) to avoid
> any optimization there.

Thanks for fleshing this out into a patch. It looks very much like I
imagined.

I'd be amazed if a compiler did elide all this code and data because it
noticed it was written but never read.

Is the spinlock when logging really helping anything? You weren't
worried about locking/atomics in your original patch because users
mostly care about zero vs. non-zero (or maybe vs. "many"). If the
count is slightly off when many logs happen, it may not matter.

The spinlock doesn't help with the timestamp part at all.

> Anyway, this is the patch I am using and it solves the problem I am
> interested in. Any opinion?

-Tony

