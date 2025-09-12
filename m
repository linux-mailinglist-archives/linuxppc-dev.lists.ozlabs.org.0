Return-Path: <linuxppc-dev+bounces-12086-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07900B54F94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 15:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNb1p56wlz3dFG;
	Fri, 12 Sep 2025 23:31:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757683918;
	cv=fail; b=NGCBm1MKQD0TRxX5NFzFyP4LLuRBsGMYaBNGjDx2NbCWpGMGfS6k+F+OBtSmv5RAq9GnU42VBzaVYOLNkIP+8WfZR9ZmnoGK4TGkmiI3T6jJNOiJxL6puyPhneQRLfI7xcjpPntzwCepAmk6mwo6gvnhdb7D/ThgHuRS0kJNg5kTT2dVecogUF6Kw0OTSFx0OtgAA6caFl2QCX1ZKZixqy8UBo+JDM3aqZJTZa67NvECroBAe2jA3qKgRxALY6g/hv0zDcAp2TvzxsmiVI/lqjg+cA33YphJJjNqRwXK82rWNBMpvt89VZpoB4kgGQtk9wFAbJ0FK7twmWvdwvkFxQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757683918; c=relaxed/relaxed;
	bh=ZwPdAjTLJxyLByva+c5TZ24W4fB8EmyoWH4Vgtq1h7U=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BCXX06cqhwMVAD2N7stq/HV/rYOyEBNRvJ/2qsCWYuMRRdPvyoOGFUR5BBM28+yFN1YszC2aO60nWfzXtUpV+ZKa22voHZmcSylrsZHw8XpEBngvYi7qRn4ZwwiaF6vAq4lhl4Tt1MIkMEdEcZ0GgBYfa0G0gVof8DqcwSeG3katL4GPnRnowVSy7x2h5pogQbqITmPGq4BvCR3g+zj41b3RWWVWvWOoZsn+g2puJUQ2zNyq5Lh1ieqRrIzxPZvC0XAtpRfiaqzamPi9S0dmhUbRVMS8CqaBMfX3JZRYvh9ktSeYaUgQUNtRstSi4XkFQeS1nrdISzDZFnjHeAFUaA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NIbylPa5; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NIbylPa5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=aleksander.lobakin@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 12 Sep 2025 23:31:56 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNb1m0x2Dz3d8S
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 23:31:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757683916; x=1789219916;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zRRPfs4RhNBw5EWFbk57WvvY6w5RB6p95eaXmoU88R4=;
  b=NIbylPa5C4W3r5oFE01PPadi4BgFktTXtNy/xHcfBKYg7VmF0/BJZF/7
   LrpMnizx2zhNitpDXYMIgMqbs/t7S3pL+DOQybaFUVbeUdS5Y2buCs+Sh
   XekFXGB0kwwxEm1PTr4HJ/EU+XImKVggB1/K6zch1cCFq49b7znEg3wMH
   O2lDtlvW2+G6c/sY10bYY2o6sZ0fFgYe7TiSA9v1GJWjoaagyKL/Z8HhW
   teTo/OLnwA/msxRaq3fw9/Hu0s4aIMSXFdRbVG7XgI5XzF6KXwJbEPzkc
   dAj6NDOMpO6jwc+EqV9E/Bbyk7Ze+4LxEg37TVzJxBL/MOWQCz3P32jxq
   A==;
X-CSE-ConnectionGUID: Qh5KpwsVQ42aQx8Lu1u0cg==
X-CSE-MsgGUID: 6+sbFTSzTDGprRzBleKMRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="77640166"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="77640166"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:30:48 -0700
X-CSE-ConnectionGUID: 1NKim3dtTP2YkmLwVtKobw==
X-CSE-MsgGUID: ticLcat0TtOeTP/ymWjA5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173881739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 06:30:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:30:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 06:30:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 06:30:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R6nI3bW08aNWyfsml68xzO82xPyEOzdMVVUIDNWeLUcqeTurqdreV+b/xH/FBvej9n7pT22NmtI3okHK7OTvHqu7r4cz7YlOlq+glmYwI5CeU1Fo6RMTqX+dAxpcn9x44/svJaCL4xdTm3UdJL2o5fLF+V9WbkAHuO92IdxrPELnEkYYo5B1Z9KU/2l3WBz1860vm+YM6Zfb4koTSliSRVX0pUXROGcXZqGeIayayY7wPcqhbVXB/idUGFJQ6/9PTltnhnZkkryeHi9XKkvEOuMDFhhBoRVE0eONuJGhiJA03BwpL7N73IslGbFSMB10uObq6IwDN7JK2lK3a6kVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwPdAjTLJxyLByva+c5TZ24W4fB8EmyoWH4Vgtq1h7U=;
 b=FZQMj8hMOf1UcTVEXMaCUdaHp0F5Yp2oTzQGwPm/pu6F0YyzKVoyjtAMI4EfP1Oc/3QvM9sh60kYjmsWTEnSOrjU05m8DVofjHN+1GDgkto0elRcIZnjcZOwLGRgMs1+qwMvsAL0/Z4h7fqQreXcQEuVpS5l0f5F9YLDLiiYKSrLnr+kLMZoUYj23CfI/Z24TEo0wHm2/qO+hJj8b3NzGLZoapsY6MdkZp6tE3T8czUdOTvSwj/AQqH/BIZLlXKL6WacmIeqTFjPcZzP0dCfJDr5csi4SZ2ahZgv1FOt8o5UHV3ywQ7z0kg7gwiYqaJfS69K/507FikCNP1wcyM2zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 13:30:43 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::4b3b:9dbe:f68c:d808%4]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 13:30:43 +0000
Message-ID: <440ef1ad-6690-48e9-be02-1ccd69f6623e@intel.com>
Date: Fri, 12 Sep 2025 15:30:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20250912] Build warnings at
 drivers/net/ethernet/intel/idpf/xdp.c:6
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, <michal.kubiak@intel.com>, <ramu.r@intel.com>,
	<anthony.l.nguyen@intel.com>, LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
References: <22ac36cb-1ba5-429b-85e0-4e3f2da1f87f@linux.ibm.com>
From: Alexander Lobakin <aleksander.lobakin@intel.com>
Content-Language: en-US
In-Reply-To: <22ac36cb-1ba5-429b-85e0-4e3f2da1f87f@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::17) To DS0PR11MB8718.namprd11.prod.outlook.com
 (2603:10b6:8:1b9::20)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB8718:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d401f6e-b47c-4654-7ce6-08ddf20092b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S095aDBYaEhIVGcrZWZNc01McFdoYzBqbGZvSXJaRUl4R2VjUlVUZDlWa2ln?=
 =?utf-8?B?Uk9kUUVESFdHSE56RGRiY0RYYkNDa3kzNXEwanlQalVuWncvWjFLNzRTWlo5?=
 =?utf-8?B?SUFUVXFObzBLOUVCZ1FFcUpsK0c0TDVqV2xtakt0WDJhYkYxVDk5Z0c1eUJV?=
 =?utf-8?B?SWN2WTFzMUEzRVgyYmxQTzdQOEpMdGNxRkZGWklQZzA2cEt5Tmllb3AyRUZV?=
 =?utf-8?B?WDNnS1pHc2Z2VUozSStzR3ZSc0h0RHVoMXI2bDkreWIxaWpvT2tSNU4wOThE?=
 =?utf-8?B?MTFwYzE3RGJoNWtReUtUK1JZWVFUS0U0TmkxM0xkUk1BbjRsRkgreUM3aXNN?=
 =?utf-8?B?bFBhb1pXNDNvUGlWdjl5bHg0Z0RaSXpNS08rS2pZR1hiZkxnL2QzMTZ2ZHpV?=
 =?utf-8?B?QWxyQXQwalowMHNQY2YxV3FGVm1MeGVVVVc0Y2h3K2RqODJIUnJmczFwWkVy?=
 =?utf-8?B?WThNL0tnZ1FNV1E2bHFsUEJ1NnJoL1ZFaUN4TzBhaVc5aDFZNzE4THR0dGwv?=
 =?utf-8?B?Mi9OUnJQWnhZenhSNnhicnl2YU9JMHR4NWdNZUJOd01zWVM0VWdxaENtT2xk?=
 =?utf-8?B?V1hhYzlGamJYN3ZTRFZiYVhQNXVNdkpzeGI5cUdUdmF3SWJsQlhnUTl2dU5W?=
 =?utf-8?B?ZktHME95TEp6SkRCQU5uZnJJOWRjWGRjZ0tPTGkvM3h5UGU1dXN0bXFxV0d0?=
 =?utf-8?B?QzFhbUlycVBzWjlYSUxNbjdRYnIrYnNxTHJmY0lKZGlCYnp6RXl1QVZ6cFAx?=
 =?utf-8?B?ZFV0aWx0ZW9uZ3UxMHE1QWU2aUltTjB2dFBGU25ObS93VXpUN1NQd29lRFBs?=
 =?utf-8?B?VnFReXJua0Yzc0JNcFhZMkJEYjVRYU9JRWtQQ25JTVRtajBXVmEyMVNraVk1?=
 =?utf-8?B?dTcwZGNmK0tZVmZrd0x5dkZ4TFl3TDA4M21ORDFZdjZvRElTZWx2VXA0MWpz?=
 =?utf-8?B?YzAweUhveXFFYUh2ODNWYjhzOVF3b3dUNmxMY2ZweUxjZ2dRY2dmMUR2VER1?=
 =?utf-8?B?Znl6S1N2eC9tR3pXdmJ3bUNQa05Nc2pGdTlDQVc0cVljUHJuODlFc0xpaUNO?=
 =?utf-8?B?TmsvTzFQclVxQ2RoS1M3dmNTcTZSd0Qxbk15UGZqV3A3ZjJ0ZzBMT2YwVUVG?=
 =?utf-8?B?aytQZkh4TGtzSjl2U0w2Zmd4ODFudkNVYnNjancwMVpwRHROTE55WGtGWVVC?=
 =?utf-8?B?Nll4NHJWZ2ZVdmtjTi9tTDJyM2l0dDFscUZtcVVEMkdhelZOR01BeWZ6WWN4?=
 =?utf-8?B?V2NXWGtNdW9FSWFQU3pkVWxQTVpRU3RJTG1UV3FuUjJJYlFxNjhZVGYrUlNF?=
 =?utf-8?B?L0tPKzBIZE9aNGNJVUhRZDhUN3RwaXc3dDNSSTdZTitBSjdtcjRqUW9ZSmpK?=
 =?utf-8?B?OXMxMkVNZ3dtZnJ1U3JmMVlaekhPRUhVTWcvMkpkQUhadUZMUjJ6VkFPUnkr?=
 =?utf-8?B?NndSbkZxQUF3UWY3QXJlS3NkTGJPSW9yTmFMQnE2WnRkcm9HTlNQdHJLd2o2?=
 =?utf-8?B?eWM3Q2lpUWgwaHJSeUZJQUNINjlzcEM2NXFvVEMxLzlEUForbFBCbmVOL0tw?=
 =?utf-8?B?cGNYTXltTU10SUMrQVBoelVPMFoySm1qdGE4d2x5Y3JOVno3SHZDVVBVV2RQ?=
 =?utf-8?B?UGdDS0l6RTBlakFEdWlIUDhnT3o5VVZtZ2xQUElaNHNYcWxNaDlPU0RQL1B5?=
 =?utf-8?B?RXR0YVFSc3lGNWJoeEJZRUs3UytJMUR0NEJad2FvSDlNdkdFOGR1cTIvVTVM?=
 =?utf-8?B?MUZTZndpdEJsb2t0TnU2VElUaUtSQjdyamlPQW50MjFWWnRpMkN0VnlTc1JP?=
 =?utf-8?B?bHVmbnRCUGw5TE5jZFVmODNzMUEwS0p3SHBubWFwQVJHeURaQktBeFNNdnNH?=
 =?utf-8?B?SndDaTRya3FiMEdQd3BIN3U0bGRtV3dCcGx1Umh4ZzViSGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8718.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qmg1SjZnb2I3YzNQdjNiOWxwSG5EM0kydkEwd3RHMEZVSlJ3bFhVeVF2UGRr?=
 =?utf-8?B?QUdZV1BGRFB2dFdGcVhSaTJPak1lM25ZRDJBUXQyRVZTNWJRbFd4TFltUTE4?=
 =?utf-8?B?WGl0QjNIRUFLa0ZpQjc2cmZ3OGhHQ0NvVkpOZlBnU2ZQNWVYUWMzdSs4b0Ry?=
 =?utf-8?B?NzFUQXpJMmQyUEdib3JhOERwQTJJcEhuM1lWT1p5dlJjcEdFUWYzM3cxdE5R?=
 =?utf-8?B?WXl4QUtkQndRcWJZRlJNT3gycDhCR09yL1ZaM2UzRzVtUkhHd1pvbjlTVW9v?=
 =?utf-8?B?b0pSQzJVL0ZjMW9jTUp1QmZwUXJKSHJIWC92aFhyQXJmV2lBWFV2MjNmd0pF?=
 =?utf-8?B?Nlcxa01GbGxLQjQ2alh5ZE1HYUFxdVBVbDVIaER5bDNXZU1YRGJLeTcwdGhX?=
 =?utf-8?B?Z1ZWK0U4UWlHUHJCQ2tLdGdNazA3MkZvelVQZjZKWEZzWWlZQlZuNllpeGRt?=
 =?utf-8?B?ZTZzMkpNd25PdnpuUlVWQlVrNTRZcXhURklSNm4zS2J6akxEQm9pSFZkdGlB?=
 =?utf-8?B?WERCUWltUHVoNzZoOG55UmFuRHpWTTQyMUNQRFdYRVprTFhxZ2ZGcTRVaDNB?=
 =?utf-8?B?eWJjOTMwS3lGT2l2UWU5blp3V0R3a1BHRTZKY1REY0tnK3kwSlpMQWpWTXRu?=
 =?utf-8?B?OWY2dEMrYlFJSGw4TzlnTUdtVGVycXZBekRxS0FKMVc5QzVrb0l3dGdzV3FT?=
 =?utf-8?B?dDZuUlk5TVlDUVkrSUNhM01uVVZBTWdYUW9TTmtZWnZWVU1kRDJZb3hrMkth?=
 =?utf-8?B?Q3hQbVRXNHhob2ZoZlBSelhleFloRFZtejU2Mmg0ekFFc3U0Lyt2cGNJNDgv?=
 =?utf-8?B?R0N4Qkhpbi9lYzlGYjlaRjR0MmlLTDNBcTUxZStCSW1PRC9WekUyMzhJQVFN?=
 =?utf-8?B?NmVCMmYvZkJqTlNVM1c4ZUliL2gwejRlMjAxRkFqb2pvWnVDU3Q4WDAzbW8r?=
 =?utf-8?B?U2ljMVRKOVY1ZStzc0RZTVNabVNrMkRRbXhaeVJpbnFTeWdHa1dobzlXVkZE?=
 =?utf-8?B?bFBIeFdHWFVzSFpCbHRrbm4xNjhENWlCRy90czNpd0RiNUdKajR0MGZIeS90?=
 =?utf-8?B?cmtkLzRMTmo0UkNib3RCQVMvZGY2bGhxYU5YdHkrWFcwOEJHcnN1cmlucWNk?=
 =?utf-8?B?NGxVZTIwcnhlcktjdngrWWM0Ym5jWXVwZGtLVmJPbGtRQlJmbG8yRTRBYlla?=
 =?utf-8?B?WEVxRklVUk0zZHdZODlJYWxXaGUxa2dPMVgzcVpQeFA1dFNwdDdRaUtaU3kw?=
 =?utf-8?B?OVovTkpmY3JBWWVBL21UeS9oV1N6OVdWbzJtdWpaMEFyNGNJd3g5OXdlNGFJ?=
 =?utf-8?B?Q1B4OHA0cUloaVIxenZuMFZxajgvbkh0Q1FoUk43eGdMdUx5enlYQXEyNDFq?=
 =?utf-8?B?RGVaL28xM2tTQWlPZ01iS0M5b082U2pzMzE5ZnVtUUIrdE16eDRTanlwQVNK?=
 =?utf-8?B?YWR2a1F6c3hWMEJTTm9tSmpyb0JwM3dwTndXRENnbzI2dWkxZmNsdlVNVGE1?=
 =?utf-8?B?N05HSTdqSVpGKzdGSFd4S3VaenpoTi9QNVVaeEkzbHI2eUczWmRocGZtMENv?=
 =?utf-8?B?MytZbXNvNmxHajZEWERHTzBHY3hPL2pzYU0ySjhxajhhNDVRNGhEQjVjNW9N?=
 =?utf-8?B?YW1VSlViWmQ4NjI5NUVIdlppUEdvTG5BU1h0TlRJTDdGZHMrdGlnVjRyY0tw?=
 =?utf-8?B?UnFsakZxK01ubU4wK25rUDI2UHhTZnM4ZmxOc2pHOWIwdlkrZ2F4UkV4cHM5?=
 =?utf-8?B?SmtxUTdlSGN4VEdtRHVqTFJTNWhEUUI1U1phUTZqYVBiNWJ1S0YybStJQmll?=
 =?utf-8?B?cXd3REhFMlBXWVVXOWpLVHh5cmZGcE4rSGgrc1M4T0cySG1WLzBKcVd2dW9M?=
 =?utf-8?B?QlFEeUVjWnhJc1FBeVVkWDRTQ1RORWRHeHY3MU5aS3hwMnI5bEs1VXNoU3NU?=
 =?utf-8?B?S2o3bkVrN2NyQWRWVU9JVWYyN28zQjZTbEF1YlpmY2I1MHRQWkVMSE84NTJh?=
 =?utf-8?B?cjArNnJjbjhjcVpRSWhyc21NVVZlRmpDNDI4eGtMbHlMd1JiV2JHMFhVN3lr?=
 =?utf-8?B?RWZPaWJXYU5LYjhHNy9LNnVXUGUyOU1JcFZKVjNaalBOOEQrS3FPb2ptRTB0?=
 =?utf-8?B?SHNFM1EyUVFiTTVpeTNzSGRtb2NVN0tzaGhuR0xNTHVCSkdxYnB2QTF4UjYy?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d401f6e-b47c-4654-7ce6-08ddf20092b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 13:30:43.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LirIY5EtJeXYsjFajff1lyNQ7yiD0VfTdoYKq2a/Tt+KmxAOmQq+VaZmwU+/mwSKrYaEma7+Ufz5TbfBHopO/e+g4CNr+2OUBrY/hV92FrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Date: Fri, 12 Sep 2025 18:39:33 +0530

> Greetings!!!
> 
> 
> IBM CI has reported a build warning on IBM Power Server, on linux-
> next20250912 kernel.
> 
> 
> gcc version 11.5.0 20240719 (Red Hat 11.5.0-2) (GCC)
> 
> GNU ld version 2.35.2-54.el9
> 
> 
> Attached is the .config file.
> 
> 
> Warnings:
> 
> In file included from drivers/net/ethernet/intel/idpf/xdp.c:6:
> drivers/net/ethernet/intel/idpf/xdp.h: In function ‘idpf_xdp_tx_xmit’:
> drivers/net/ethernet/intel/idpf/xdp.h:28:20: note: the ABI of passing
> aggregates with 16-byte alignment has changed in GCC 5
>    28 | static inline void idpf_xdp_tx_xmit(struct libeth_xdp_tx_desc
> desc, u32 i,
>       |                    ^~~~~~~~~~~~~~~~

Yes, I do pass 16-byte variables/structures directly.

I would say this warning makes no sense, due to the following reasons:

1. IIRC the minimum required GCC version for building the latest kernel
   is way above 5.
2. This warning should appear only with `-Wabi`, which the upstream
   kernel never sets.
3. Kernel is a self-contained project, this function is not uAPI, so we
   shouldn't care in general about backward ABI compatibility for purely
   in-kernel stuff.

We have plenty of functions, mostly generic, which either passes or
returns >= 16-byte objects, but I see this warning for the first time.
Despite that my repo is attached to the open Intel CI bots infra which
does daily builds on a good bunch of different architectures and
toolchains (inc. GCC 8+).

> 
> 
> Git bisect is pointing below commit as the first bad commit.
> 
> 
> first bad commit: [cba102cd719029a10bda1d0ca00ed646796f1f21] idpf: add
> support for XDP on Rx

Thanks,
Olek

