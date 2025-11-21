Return-Path: <linuxppc-dev+bounces-14407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C5C77AFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 08:24:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCRYT5tjCz2ySq;
	Fri, 21 Nov 2025 18:24:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=192.198.163.8 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763709869;
	cv=pass; b=Iobq2/6lT+qEeCpqY2KR1CyzYqroYQGo15yAv1Qv9/KjDCySCKt8FxMD7lUwfQ+lInY56+nFa0/LUXb2kFRfk2MWZSMnOodIsJOSspDkwLlYetAdbtBBl/sOV6iVntid0kxnTVSBvDsvxlysICDcczWUB+dFF6D6XHyULxc4uX7cI76ilOlGbJWpJAHVyAJnIgIUmHjP7ItZ6Al6tcLsSKlObAXE9t7tHrSgt1GPIMlAmmh8oI1KVn/yOHF3bOYBwb/fzvw++YSwwaW4lYL0iJyHc7zw7rBrd85eht2f+sw29hQe7hTRHqS4RUnzUl/w9UhG6PFVGrJPEMYI4i5uFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763709869; c=relaxed/relaxed;
	bh=Pj/PT+tYzoxx0f0TNN5tSjYv0lABj8sgwyW4K9XMhnw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EZp5VchHsdK6tW2WqRC42SbkZFmGfwYzQ61+R9lxkSnqzaGXkfFeh33jdR8mpmoCPemIRY2VU0bxSyXWN51dla+2Nn6tkpCZZQDWYVf3LYcCNQ0oMFdk/V7dAWvuBMJL0r8EFiW8ZzzbZ2wYsFG2dchdpNo2YRbAsKQLR9EGUMQOO+pGMw5Ix0DkR/wlgNacTorzHAXwvTsKDfIRUVE3PkGf46UNIZaYtzLyU4YIWDnNww+GKi9lqnMR6TmdQVZ7KZ69UzPKihvmZ0NreZRX5yIRKZgl57nWZnKdXYLrqfx+k92GwdNqYp1R7TblW+k4MsZXGDNcZgrFZG3cKYhV1A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDf2PMz/; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EDf2PMz/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=kevin.tian@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Fri, 21 Nov 2025 18:24:27 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCRYR1Jgmz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 18:24:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763709867; x=1795245867;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=umEZrWog2X4NnxJevOsTLZoDQ974Uo/K+XFMLHOZ3+U=;
  b=EDf2PMz/0iFAq77CyTgIGqSDCLoPSZigP7qocFTkWvIswXbhSBA4Mg2Q
   KeXtz8OnMiCNwSoHjBQ0M0oY0Hx4zl9OSBb/8qZGqw0BimovCaB10QIMZ
   QB4+I6oRhNZ8fEkbvz7fye9ttL6qEzBzD0dfVIDjpKHOrwlH+0mabWwoq
   gKz3HQYL2sotHhC5B+AtBRxt2lR3Nw7wC6OIDv5WLnLtIT9KpootDy1cY
   iB3ldjizjXAjFcB7aLku/ySM8QhNJm4pSehmZINzpG56egg1wYc66zdjK
   FiLfZ/0LA264Hq5tgcDboR1QfHQFUMUbVTMXIHpTTK+cPo3Y3eHJmQ4ui
   A==;
X-CSE-ConnectionGUID: Bgx42alIQ3KIHCZWNDRPXA==
X-CSE-MsgGUID: HnSpdwTKSreCNwDpz9e8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83420540"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83420540"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:23:18 -0800
X-CSE-ConnectionGUID: Y1PPV0lWS+uw9+abkEg5Hg==
X-CSE-MsgGUID: pRVyEMR7SZKULpaigk2Z6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="195788501"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:23:18 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:23:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 23:23:17 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:23:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWVU6cYfiBKICPE4ImZEgNApc7c7+/mUTwLPsBH4Ym1R9mUbbQIZ1RjkFf7Xyaiv+zrrsu8j0XZQ985kyhwmg6RxPadINjaT0JPGpWrtGfZRD8MWwVBKrJN3KAJlAS9nbt6o74C48WTOJ8+9yuWKte8V+2Zy1h9IET8dSrl2NJ6lQIfZ+PpE1DWpEOsz215pj80rZXiMtDgqCC+9Bv4/02I8GO9uh9jVxtMH87x78GU3xqD4Luszq4wYS9rXdTyGwz9MGecc3ObKOnJ5Cjth8L6vu3BLVTZG50+ZlNXYvP2RhrWro01mpWRmxC2R/9VBDD+LG66D3qg4EaSWvkgVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pj/PT+tYzoxx0f0TNN5tSjYv0lABj8sgwyW4K9XMhnw=;
 b=kCXREElPcky99QycZVywMGSuMZzZ0X10S0o5PChum6rydHkaSDkksxkknn7jiXgKb4wZcFhjYGQz5OCJWya65QsWyA2ZPN12QqHlFRHFRxQLQzsRR8C/JiSu6NDoKDKOohOyONrQM1m265jiFXnKiN4KH6aKhWoUCb6/9llBwpd7ZixlcZ/XGc4GVdpbqkHmG1dJ+yTa/bTiQBkkL6qJTL7KOuUKfX+zSW/KTLkaP2wiF0xfTWWk5nTwa5MvTysDyrIqoDVY5jFkk9JUgN8R5MamtqWClpmwBcgyfKnhZHRsoNiVsknn7fhfb+ySppxOewFsIK9yUB3cslB7ue/6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB6822.namprd11.prod.outlook.com (2603:10b6:806:29f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:23:10 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 07:23:10 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Joerg Roedel <joerg.roedel@amd.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "Madhavan
 Srinivasan" <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
CC: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>, lkp <lkp@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, Vasant Hegde <vasant.hegde@amd.com>
Subject: RE: [PATCH] powerpc/pseries/svm: Make mem_encrypt.h self contained
Thread-Topic: [PATCH] powerpc/pseries/svm: Make mem_encrypt.h self contained
Thread-Index: AQHcWi9rJxRWwRm/OU+gCRPOSn98NbT8uvQQ
Date: Fri, 21 Nov 2025 07:23:10 +0000
Message-ID: <BN9PR11MB5276FE83349768D01834C8888CD5A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
In-Reply-To: <0-v1-672b61acd916+1449-ppc_mem_encrypt_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB6822:EE_
x-ms-office365-filtering-correlation-id: 18957910-5720-4c8f-6be5-08de28ced306
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?6XPypfvMZzlgpqSZAua3PDjZCjGKFctJV0uQYDU9F6U8ZXkXykTyC2cI0NKM?=
 =?us-ascii?Q?MgARsWfbBToew0yfx9Nk57YEJWI3BsN1ncuzEqgIjS8iz1gcv+AqvI8n/bv5?=
 =?us-ascii?Q?/fLCSRN80YGnAnxW5pRXPREj0m9z6TrUrPT04KXWJou5ckWa3PaTUs61J7kN?=
 =?us-ascii?Q?gLepFlXtzmE5ndFJpUnfzezbtTWIZJkCoWN56YqnuCShLy8YQr4htZmmgO3G?=
 =?us-ascii?Q?1lRLar4hlNhHO9ldE/tjx0yrgtaAybkFDY8CxImJe/yKs5P4Hxu/Bh+f1W9j?=
 =?us-ascii?Q?TmBxzHwGutWMEzZ5iB5NvpawEbmYztC9VTylANd215YnDr8XxDL/4PGS2+jd?=
 =?us-ascii?Q?RLa0OQOmLcqtGM6sGk4NCiCAjBsXUDROXdbwnLk0ZzEr79Up3yw1YeAufo13?=
 =?us-ascii?Q?NMvoQmLZkp+Wx4Ws9b9JXxI/5TPmMTQDBth3AGBqYHPQ5J2TWuiip9FW3ikT?=
 =?us-ascii?Q?ajrq4nNm0tCnU6Dx9y6HfpZ46yxRnVlYBKS5rnX2I3CiyOpu0b7Y2w1ucMvS?=
 =?us-ascii?Q?VUtiJCntEp0p5/Ihro5RAOnpOcxwY/68GFbQDlrubAeCxtwJPkYnsD8b+Erg?=
 =?us-ascii?Q?GgzXEhZLuI7PQeaZ6XJyyYue2pVuZs0qS+LmFpJw+W9kVJ3JaP61nD1Uw2Fp?=
 =?us-ascii?Q?M8C/IF9YrjeKBzivUNovTxY+LkZ8QgmyNRL4Egk25/67T308Ca9FsLn3Uu34?=
 =?us-ascii?Q?bq2VzlyDY+Bt+vVFseJK36aNJ0AK9d8F4DOa5U0vGiSpB14c8Z3I0RjJOAMO?=
 =?us-ascii?Q?pGTO69EwYSugtO7Wu0/Jbx2+uSIq+5VngEx43r4RzpIg23dZG51N/t3QWwBW?=
 =?us-ascii?Q?mY2oMMq5NcGiisWM/o8glzpSc4cEfCIe83GMc6XqznaUDP5BhyYOv1i6fuWv?=
 =?us-ascii?Q?Y9tJOyV9AR49cFuCrbi9N0m2nnNt8mo3tnxoU/ceaxlTuFi/uJg9IaI5V8y9?=
 =?us-ascii?Q?XsKcu3eNqsuZsni8X4gGKXEIJdrOtWi5uMzN1OqhyXW21Z63uo1E7eX9s0PE?=
 =?us-ascii?Q?v8ZxxRN4FDSOik6BXlkshZyaKdLbGayAYzBsJaSQDk41Y5gTUDTLUJ1XyObV?=
 =?us-ascii?Q?Pl9Nx7jVx1eRRY+TazYds3D0+8BfdGMxukOLObKl28mErzXEkQ9Fvi5qAAmj?=
 =?us-ascii?Q?DkQCz1ppPDfCvdMAKo9wFL4Psp1v/EXmln395qbZLtjLW0qkE8UrxGSmCWH+?=
 =?us-ascii?Q?qH1yLr9JMuQ2sPP1uKjtVUC10+YfRUM0x5R/VwB7auWM0VYvjis7tZEcAZlB?=
 =?us-ascii?Q?42sO8SOh68XXB/DrdXSKnuvnrkSztdILAbuVcErQiPjheZWN/S6H9aVPT5wG?=
 =?us-ascii?Q?8WUZGX9s5vA5xSyP3ud0owuJooskspwmLELvAngyKBB4ehuK3zbXh8T/1RVO?=
 =?us-ascii?Q?5ARNiQCt8iB6ocIR0ZLe/63Tstugi8okX/A23I9OpvtHa+EehHsKFF8BmO7Q?=
 =?us-ascii?Q?i2YZtZ7UeOXqRIvmskYwm6YRZWHw2y0rkkG7zSMRKCzGY6OZtk6zBZZQ+1Ic?=
 =?us-ascii?Q?wIdFlEUNmX7rgXLpaKh8nZukVlBEAqn7rNDP?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r1sjp49UX0z4teQqm+pvmBRShfSvx9QtoeB5KK5wN0o6L7SFtCqGrzYxgVav?=
 =?us-ascii?Q?blN8I/8tKDM7fHgWqV/WxbuSOlM8FVC2BBbk3dqoxI897LQg8iHacwSx+YIV?=
 =?us-ascii?Q?VyYrXZ2Xra/3iUvjJlwATkNYPhRHM7kSMru1y/nIEQfA8oDPHhKZlHbCOJ7D?=
 =?us-ascii?Q?crq3BpUUNYExiQhmKbXu6112BlE2+8SZLOXvLe0Zz7niC3RDMu5hNpwhleuN?=
 =?us-ascii?Q?Gt0FTh5X8xCHd3ZZmJ6EqsbNUalyL6dvsyRs1xQLtdq3qhL+O9OfpH1x0LRe?=
 =?us-ascii?Q?uXNL98zZ4pPDXH3MooWFH11oYByPFUM9cNTtr4ztN7HMuMOSuKfJOvd+Wx2b?=
 =?us-ascii?Q?HYIhkI+DsW9p2vC2IuvjA3bNvvawNni5jXbtVqnqZHmSLAZTxw4O+1F5WcIb?=
 =?us-ascii?Q?sQQX8ZUdwIo1Y6A0As/Hg2VJMJZFXP3xHWgjEDES4hrZh0YVO6AFuzq4xD6k?=
 =?us-ascii?Q?ZJI7+Rj1jDLiWPzs7djyfTAPz5u/rHUmAp8sWO8ncQfR6NFRHgFFwmrVS3g4?=
 =?us-ascii?Q?Eq7xo7RBPAD5NCk9/RwzqxK8ECcfZVYla/iDl7++Wfun50AtKcb15gwspXOX?=
 =?us-ascii?Q?ZXbhnfp+yenpwXtsc2oLOjnBAVuLSAf/4M4E5GYGJ4yRfrH7DNl0pc1laARB?=
 =?us-ascii?Q?KA2RVnSaUEPjYvSndlFmD08iS2atF2JycSj2e+ALiMaFCI0+klNL4G2fyMDT?=
 =?us-ascii?Q?xaavdEJY8CY1MHvQYxus7R7F0S9wPbYM4Ed00QnE8f1N3cSZy4Gji1seANUv?=
 =?us-ascii?Q?0ocZi+EQBbFQjUQg5BB42J3ZFV9dlpVodN/fB/ATbmF69ijeoRKAArLwVOzz?=
 =?us-ascii?Q?nSsFbD39l0eNa9+kExWAIrEJ7FV0EFJmcc2v+j0oX1KD9o/B+XfTCwMUlc3B?=
 =?us-ascii?Q?RaVrpAaOPaUwvrxDeoxkmEToYaSv2lxXR1OUYAu4Ttyu153zc25ox1dBuG5b?=
 =?us-ascii?Q?/hc+FYCSlWqBavjX6piKDnSQvb0jfbUUxU2FaFx6PsbRCGh0mSHv3S+QyTbH?=
 =?us-ascii?Q?b6M9w1oxpmyLQXU6BVqCwwxJGydiWSbdwpRni1d7DD2PbqvUwvtzAz/7o8+a?=
 =?us-ascii?Q?KLsxOipPTottJWKgskZmgu8qzqlkua2XGz/a1eb3huZDF1YeftIDsE1ue1/7?=
 =?us-ascii?Q?3XZeReQCkY2ZmoF9rwtHDrCu6NOzLEPaIbTslXalqkD8Yq06cyvffFw4xBu7?=
 =?us-ascii?Q?SKGlXl4IByfhZU6vhfvRzeOkdgFJAUtmV2GaWldbIHtemVsz+h5kvNjBbAQj?=
 =?us-ascii?Q?vwxGt/sdblMJueiQHCribIDVbQR8jJM8/g4DPaTfZtgWupFAw1TzbFWKz/6v?=
 =?us-ascii?Q?8oxWdfvZLwfRwLpiGaBxZMRt5jWHSe62X8eY/Zu/N3oJObfqxpG5IciVDBz6?=
 =?us-ascii?Q?SUs54I1hQD8IUJ9ZTkDcThPxvvhOAhYE2ZN+Mm1JljEgv8mrBVXkvmuij+5h?=
 =?us-ascii?Q?5YngMyNvyh+jhWy10lWUQN6vpAH7kpIj42HuvMcjz6+jNFRgms3k+tNXqeY3?=
 =?us-ascii?Q?eYdGxDK0SmMzUjqx/tKWyolrpQZZWa2fgCVnTcbzBqTe8vguHkcr5L0knRXz?=
 =?us-ascii?Q?YmCi2W3C0HizinJc4znfXWBOKtZEk2BKRiEJx9Mu?=
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
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18957910-5720-4c8f-6be5-08de28ced306
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 07:23:10.1566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oVJHB3JbE0Lk47HxxyvxMwEHiehMme9KPG+MtIemZgBkAyj3wyPzNuwJCfh6Eu4mfJBYDw4sNbF8hrutIZbHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6822
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, November 20, 2025 11:07 PM
>=20
> Add the missing forward declarations and includes so it does not have
> implicit dependencies. mem_encrypt.h is a public header imported by
> drivers. Users should not have to guess what include files are needed.
>=20
> Resolves a kbuild splat:
>=20
>    In file included from drivers/iommu/generic_pt/fmt/iommu_amdv1.c:15:
>    In file included from drivers/iommu/generic_pt/fmt/iommu_template.h:36=
:
>    In file included from drivers/iommu/generic_pt/fmt/amdv1.h:23:
>    In file included from include/linux/mem_encrypt.h:17:
> >> arch/powerpc/include/asm/mem_encrypt.h:13:49: warning: declaration
> of 'struct device' will not be visible outside of this function [-Wvisibi=
lity]
>       13 | static inline bool force_dma_unencrypted(struct device *dev)
>=20
> Fixes: 879ced2bab1b ("iommupt: Add the AMD IOMMU v1 page table
> format")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511161358.rS5pSb3U-
> lkp@intel.com/
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

