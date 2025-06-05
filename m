Return-Path: <linuxppc-dev+bounces-9159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF4EACE827
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jun 2025 04:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCSSd3nmCz2yb9;
	Thu,  5 Jun 2025 12:04:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749089089;
	cv=fail; b=ZJGoC0MsoBPFqakd9T9RjBCrzctrOVEaceg8XAGg2qTyrHAeBtSacheLtTjK0Djp5k4yEIMaq9mdhrIEVEUPQHumyljNNxnPpz07BbPzNtEdfXWsqGm6/XQv7ZHkHnDrRwZZkgYrbeBRL173Kv9f7JK8gB1AloaHTC8CXefH7QIv4VAGR68ZXdvK9noUdKqyyBLe/h2EZKfemccJPyzxZ+i3CM+B/YF4//cRCQbNWcKALaUa3mCGD6ETugAxyRjKM7GvsGJsHxq+08N+l4FEfDCMDu3XUD8jNqM5ENRXO7NWQsVRrYjDQmeD0kpGTLhRTW6N28ipOXZeXLf4r7wf4g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749089089; c=relaxed/relaxed;
	bh=YVIsnd8y9mTEQzykMTYlKep/DTad4B7wKRqRECe6s/A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SL42bHohAWsbM28qrT7SQxpeRe9is1xXaoSVu+bIUTur5OJsugniJFIfPrcu6XMqPLn59/puQy6FFN56mRlWhcFNSFGc+8g+HzYkT514plkgBJJXgE9CuPWdVfTXpsKekAA2SSwxPbSaxB1smcT+Cjd3QHCIVQ0F8igEvELcFxIKOhdyopAFmGW95799C62xm1FUq4NgBxKaVUTxuEYXZj2G9OmFlJXnH5LNhT1PlMvldJkdaj4DzYe2BaQhQKTwqokJkbHSdgaG34AYd3Zt200kg37dY1zXlKz6NXPbRCsRQuI9QmMuPC1dNf93AsleLAYyuzQDCLkFpvQ9gjaERA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TottaEGt; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TottaEGt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCSSc2zzQz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 12:04:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749089089; x=1780625089;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=7y3dxA8J3xesYiYhw//lZdAvyFAU/muCn8/qB8yzXpA=;
  b=TottaEGtXe4AAMVvGzP0me5HkImMHp0civaOd8mlMh7UvP6kSz3a748Q
   N+Kh/QBpuIB/BENhak6O/QoHrcupvmUM1/lpzzyLDfdz1Oy33FqftY/wS
   MQvCSWRqtjwK6+hGLow3/ZmvIE8GC951Zfx1LibSCxNdlFc/Lo7/e9DCa
   4Psx1ncbVp2FVV3CQ7kZ2YvLCI8JvjBZjvlze9gWQ/lSrLvBuhPRAGNbf
   uC6Mr8yOHG8k1imHRob9+FsLhR69ZuOebqo4mK5+vaHcE5K4N2dyZZroe
   +lMCONCRtrk9vtgg2CkGKbpHlQTxfKMKzUPMelKP+PocszmpgA0nQ7CIF
   g==;
X-CSE-ConnectionGUID: UEEtWiqzRjO5akeC3vwbaw==
X-CSE-MsgGUID: mJGTLXz6SDy7obmWzbDLdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54852713"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="54852713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:04:40 -0700
X-CSE-ConnectionGUID: cqgM76XcTR+siKFdBxDcaA==
X-CSE-MsgGUID: 118nHMKfT8yD5kWsHhLIOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; 
   d="scan'208";a="146298980"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 19:02:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 19:02:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 19:02:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.70) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 19:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBoRBazUpotngTB2DswS561QonY+Y/ZzoXTWaSwRMju3lj9itEyUQFGs3idwYfgENJ45sgYIjqB3TN0mssAGOwZi0tNP3NWQw0HoHsipLFMkRkCE7HP4v0DLUV+xmwledZzHhc3awfp1XqvpWRHu2xat2dRxSlKocWddXAzckyuBsQ2Bz+i79w+7G+WECwlmy183Y9HgU9A1bhtvWeCKQLz3gL218qLVMTCBGbfN+20Z7JbTQf2ARET02uKcDeQnmW7Ao6aFHJ3+X5pDC2qJleV+Jih/D0IZDN2iZG2RN0BJG3dYBeuKTzoioJU5c4pPV1AMiGMWEQSyL3yY1ww7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVIsnd8y9mTEQzykMTYlKep/DTad4B7wKRqRECe6s/A=;
 b=uDVLDI0eph82QVjhpsGhKZRcTMgtd5NehnybOETG5lzkO8JF1zxJYl6NIa9PBCPPl1UbR3zVmYpHTJqPnqItF/OxQ4X0z6GBuqVfp05tFkYd6weIp0eIf8JpmDF9iVfU3RfFvdTEEVPxWlcbQeuSGoWVcFivBfD6fzpXTH9AVy7Y4nh4sx+bVtiHrrB7JC89PD3YRXmFXJWWyzMc9iWQf0L64SbD7bJHLgPkfy7Kx/lnjxXYqzqmLJW9CUbBVIUgPBd7LjyZhwnYLCWVOx5FONjTIbBol5UAj9CqE5QKWQRvyyejlKjswSWbpI8iMNyB9ko/9VqbvIq8lzo5yBgAxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by MW3PR11MB4604.namprd11.prod.outlook.com (2603:10b6:303:2f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 02:02:27 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Thu, 5 Jun 2025
 02:02:27 +0000
Date: Wed, 4 Jun 2025 19:02:24 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <gerald.schaefer@linux.ibm.com>,
	<dan.j.williams@intel.com>, <jgg@ziepe.ca>, <willy@infradead.org>,
	<david@redhat.com>, <linux-kernel@vger.kernel.org>, <nvdimm@lists.linux.dev>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<zhang.lyra@gmail.com>, <debug@rivosinc.com>, <bjorn@kernel.org>,
	<balbirs@nvidia.com>, <lorenzo.stoakes@oracle.com>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-cxl@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<John@groves.net>
Subject: Re: [PATCH 04/12] mm: Convert vmf_insert_mixed() from using
 pte_devmap to pte_special
Message-ID: <6840faaff197a_24911007d@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171c8ae407198160c434797a96fe56d837cdc1cd.1748500293.git-series.apopple@nvidia.com>
X-ClientProxiedBy: SJ0PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::20) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
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
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|MW3PR11MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: b587d396-9805-4370-50c7-08dda3d50538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sFEza5/+kxd1MXVAvAspWt7+XTp4+brAKFLZjNsCkFuK5npSif9r9Pnenkr9?=
 =?us-ascii?Q?XJ9l7f8QN3ZeHwfdCGgPN+93CDDsySY8faQwM2Oil15YlFtRR7yujbrplLCV?=
 =?us-ascii?Q?jmzvZ5q2fo74DW/t/1fpyjSxYbJEJ3tp/s6b12Kv2zOm/994Pay5NfBcY6YH?=
 =?us-ascii?Q?LkOm/3cxWGuAQlhzvqEUjmVAItkuk2aiiSWG+pVTgJdBvunY9Lp47idoLRRA?=
 =?us-ascii?Q?RH5TTvSk+F0vSEXcQBB7cZgHJWhE+LTkzRvBJ10x+tTssEr3doZ6K6O298ws?=
 =?us-ascii?Q?vI9BuRdedyfuTtJ1aL5Jfrr5ROKoP5fXRDfkkk/VvIb0eSvl1y3wFwRZpeum?=
 =?us-ascii?Q?vtuYbL5kyWCJb04iA8wb6M78QVS2sbQCofzR4ClFoMscVvavzFdol77zVVAc?=
 =?us-ascii?Q?ZcVS4EmLcCWFnyc5LqSF5Bbvl7cgRbLAPodIAS8SYY00CX1A1OiEHOeOwmYf?=
 =?us-ascii?Q?04whc5WEmNRTMpPKj6oFLgQIJvCUJGjxHf0zwOf3ba5E3jchAzKaGlPvZ0aV?=
 =?us-ascii?Q?bwLa4CthRY2jY5lhn+r9Rn2Zl28m5a9bDhXd0aSzvy9gd6oG/f0vM7tcYOaf?=
 =?us-ascii?Q?nvs7nSMjqH+m+jUDstGKMy2LbTI7r/kp0/a54qRPHkJABaQpayoVvYvarBxi?=
 =?us-ascii?Q?XzTir3Jk5J0ZLoHrzID8M2AxEw3bsj4cIoI18u0vmxr2Y90e5kUSnWdJtA3y?=
 =?us-ascii?Q?kQO4mKmrtwBtHtfB/IsbXQc6x8ZOANmNAtTCThi87lJ6xe74vVJzHJ1RzY7H?=
 =?us-ascii?Q?+MJHFES03HsOvmjvcy8rILEGHyNvD3R9yhaAf75sxDYbgYCxhRqSYOFfBbco?=
 =?us-ascii?Q?eqH9tdth/0EtiGv6yG+1SBazKeQ7MjSwfhJj6VUTNloFnGkV77rYDXWqceKk?=
 =?us-ascii?Q?JSHGK//W0YWEJms3imKyiXChkMUyUvGHG1l2a+ioFZXGdm/kbwClcMQ/yKCY?=
 =?us-ascii?Q?5QQv5VyIHhvrZ2ebwYUwK0X2Ee3WAPQcDH8Pcbn0FfNU9O91D94gK9/N8+C3?=
 =?us-ascii?Q?p9NB0fsIgqn7v2PNqz4Qs8mofXJ7bf+/tHuyB+KOTUX3lU+qH1m/u87q/RYl?=
 =?us-ascii?Q?jy1cvyUj8xJSembxXx+rtuBftYpjbyvyhCy94pTBo237ov2EPJnSFUtsaXgU?=
 =?us-ascii?Q?Us1OzMuoC5P9g/wcns2q7+pMEwXJfN9sNDQV8oAKAkt3JGL5VPEYrDlKJgRS?=
 =?us-ascii?Q?O0WeqTDJBdZQP/sVJLAxq9cVrH0vUgnt9jtPFH28BaGqCp7vyEoUEEP1LhL7?=
 =?us-ascii?Q?ZL6/KImXP+Amjz8oDZvgHL9n64sCFGxNAsVrTP7v+K4Pb0u8aYE/3wheR/8K?=
 =?us-ascii?Q?LGdd7bF/eI0Nglmy0cQ+rjOb3wUU5fZEvFGY+FP9qjln997SvILcPsdqQEGx?=
 =?us-ascii?Q?FWQ3mmf1ACF3dV6iw7OV1kf3Mcs4uY6hUFxZugbghZxmOip09zOnLOEjCiJM?=
 =?us-ascii?Q?GCSxjsg/CXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEKK2h45XYObxBcT4vooGVeXjA01uYGS4DviP04N3sbB+2evApabG2Fasd48?=
 =?us-ascii?Q?IDc7jeUzOWl0+waLtcu6YMUcrHYhInL/k95Yb6e/agQ2kbZe9Kr2YTQ3OvJ6?=
 =?us-ascii?Q?OFSOi5spKGEm354Mih8o/eO00GYuBZQ+SzuhSGEPD0lt2KobKSH/iuAEpdB4?=
 =?us-ascii?Q?2xPhduhVYTy8wbTYtE1fmMUjskLiwK4VteDOfjR6ePBb7RzK/tBTyW5E+p14?=
 =?us-ascii?Q?15hFg/BPHza2GiHBuhEgXLMTwvatw4GU93rrrFVKHhAlx99606DCGgtMJeF8?=
 =?us-ascii?Q?zteXiKX1SMivoMRbloO/aCXzgeIuFoKITR9kmgYxZwk19hsGhPhIiYKbqGY+?=
 =?us-ascii?Q?ubHeIEwXza7PWnpJhycWMECSI7veFMu9dDPbPnrup2kIsIGFFDcFF2sSwP7c?=
 =?us-ascii?Q?8C9VbDkIO6hGrwH8TVcUFSQmmkoEL9d8QzbsGNCoce6WGqInexKq8qJpXD2P?=
 =?us-ascii?Q?DzA3LFU82tHrGaRS9TtSXmyMp/YQ/bvZxvMXORlV1dv9wmMLUQZCMDW/P2DN?=
 =?us-ascii?Q?ZgN2mz0AlN9zgpEcanRurEaydWvvPZnv0H+0CeDj08ZpHJuyAq3gQTVJfhx8?=
 =?us-ascii?Q?g6to2dNm4l33WW02w1eota3aEoveJKRHNGm4f4VP6IxyHpOv3t7T/jroZWWb?=
 =?us-ascii?Q?JBnIlzVDt3b1u7DcxByA1CzgdBaS6zRdZ9kqeWGqZJRW5zNdYxA1PsowKbAe?=
 =?us-ascii?Q?SoYL9TsA0pBHU4VvUU9sFaszaUJMMHKQbbr3RVaPb/I9NZNc2W5HUe4IuRMz?=
 =?us-ascii?Q?Dj+h+4QHPG/KMHsgl1cVEalIweDjFRhiBD5gN6FoEDB82clc7akItPKHLXIS?=
 =?us-ascii?Q?aMejloRRWGFR4kbR/CjpHBIW5d+eMtAeaopVBXpGuAeHBwrHK0Qw0AbiV+16?=
 =?us-ascii?Q?9mcjhWQHA7DlO+aHFhQOEVV5vJl6k1JFYFyx1+oKcWTBUlwF9BnR7esYvLJz?=
 =?us-ascii?Q?SXXkNFBXIvcWL2P1FAoxF2hcPuzcXMeZnakThAEuS3ehNTN4K+nRVUld/XrN?=
 =?us-ascii?Q?7wr73DtUVkW9PxaWxykFYD3rZyC2Tfqbub9IRSq26dIfenA3s0wipNaR6UwD?=
 =?us-ascii?Q?Xi7a/lSi/PjA56hKcXUWPZS4U8qNx46krnWqGcU8e86K8FAlQL8N8SuNkFyc?=
 =?us-ascii?Q?qc/nudN2c9ShqaaM0ZS+rNI1hcjg07tE0kWAnCy0cHRHLlmN/+Log3k4PD4U?=
 =?us-ascii?Q?nAe6fvWQwApyTLDL3caAS1la9qKWwuNFeXju6eFzVJPuUL2sQ9eqj+pOPm2P?=
 =?us-ascii?Q?D1xQIuvfjr5Ntob3ObNguBtREn2EKoK/9eBF9OC951FuZtehQZOM0ttsNgpU?=
 =?us-ascii?Q?l49j2IiRQP3ZKghp7AFWpdygFn+JGh7ZUpA4s+UtrXchbkPjQgvd5kFK+wtT?=
 =?us-ascii?Q?pBj2tVJrwDX/B2EBrU3PlHiie7seeCmuHrhpcM8HCbpezTThA79Pp3KQZwec?=
 =?us-ascii?Q?KQEe6Vl5XtoKyW45esS9MnLlg45eHnHrKkwQUxLFYnApnWVqjdOPVc1bzDgt?=
 =?us-ascii?Q?VyvMAeTyu7X7v2T17sWVmKuMKtBPoIye7nJ913sSdVAUfeVCsz/FX8lfWtIz?=
 =?us-ascii?Q?R/0T40Vcy+TIznRpe+CfpOcaBKkWSiuB+Pmxmf2NkflYj3BOC6p3t7t8LFva?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b587d396-9805-4370-50c7-08dda3d50538
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 02:02:26.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEqwRu1gHkZgYqLlhhcNaDumsojCbtGS0veyG/qTZxy/UN0QQyRcQV/u2axeNyBcuxfj9kgPHuzgTokXyh0orad2gHrgXl+Kccs/29cQ7KA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4604
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.4 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Alistair Popple wrote:
> DAX no longer requires device PTEs as it always has a ZONE_DEVICE page
> associated with the PTE that can be reference counted normally. Other users
> of pte_devmap are drivers that set PFN_DEV when calling vmf_insert_mixed()
> which ensures vm_normal_page() returns NULL for these entries.
> 
> There is no reason to distinguish these pte_devmap users so in order to
> free up a PTE bit use pte_special instead for entries created with
> vmf_insert_mixed(). This will ensure vm_normal_page() will continue to
> return NULL for these pages.
> 
> Architectures that don't support pte_special also don't support pte_devmap
> so those will continue to rely on pfn_valid() to determine if the page can
> be mapped.

Looks good,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

