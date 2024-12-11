Return-Path: <linuxppc-dev+bounces-3961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 133DB9EC1C1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 02:53:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7JXk3vjdz30QJ;
	Wed, 11 Dec 2024 12:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733882006;
	cv=fail; b=B3SduPtl8Fqki1p2yjZ8LYhHyRS2DQMKP1OSb8dNPjhuMV4ulCYkhZSpyEOyvhbCOoONsdYCad4o4KpCqf6XmV4kf3bJnIoryIf88o2qZhdJP+W/lkKCjIJ/AHbH6epzq7KocX/ak7qpRSQ4X2CEMuxMO0AMFyuFEtghdWhukVJaR39OeKYzXTX7TAlC/K9p9zSwDWWZeYczg5T6HIC3GQNhKoeoLq+u04eq8JFvzpJtUvEI4ruprsfCiKkXZ1fSKKsI+zzLM1LX1lMuRFj7ykEDT7ydZ/r6FivUj4t+pj+7Vql2ijtYLsdddY5lTjivdMLyoYvnLJgtJk2Vaxbh1A==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733882006; c=relaxed/relaxed;
	bh=SUP/ghaauNfeLZhS532Sbebm5Jm46iOmeBbqWDF9UcQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Wds1+b/Nd0Rz4IVZfsuizfgRYVHBZOZJMCEDH4HElswWGIQgAH5+r4IPelcN1R47KPNih3LyrWnovdWRAxZjp7prGHHEn6f81kvNuYwnONSHdnSaI9PgalLkpZsqa2IWXLV3N/GuduNhFZolklopmfHYM6H8NOlVslZMNjT6HyqEMW/X7p8q7muYamov9CaYAoedYorEV4n1QrLT+Em7p7jwqNr/u1R9IQqnxDwGCacR2Io+U3ED7lEan6Lts2VgrOyjCV+G8i21Ptoc+HxWCNxm6O5LJa5soMx7qneRsUZyIC0P87JYPVhMGfzEg5GqLhtp0DdIIHSRJxUgOyzq+Q==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODGeFDRv; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ODGeFDRv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=dan.j.williams@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 69 seconds by postgrey-1.37 at boromir; Wed, 11 Dec 2024 12:53:23 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7JXg2c2Jz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 12:53:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733882004; x=1765418004;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z0WwNj0LkMfidguSOb0CYifmK3e1LR0sDR3XZaWSHWk=;
  b=ODGeFDRv8TnsGAdBk1fi6uy9FRfoNHBvXWZV7UmYpe///T/aWXAcbDxG
   dfy45Y3DVLFzxGCkuMWDWe0iQCx3Wx59ReLzWZYV2+hGwpgG1WFiaLG+T
   vrXhKnXpHWxoKocvkzHVL40M0OoPdyOUrVOKB4JI5dzE1czfcS9D+xXCA
   g/ghOejEYG6Vd3GiozKhMaepP3ACiQuHIkhcp46/l9kTekDO6Ux51UyzD
   x3fp7Lbi5EUR0IwnWUVpA+AJCfbdhgX2q7kPvV5Ztei+IpeBxRJhvRqo2
   vETVql+cqxG6lQYYzTDKBHGz5oCkNCWlpegC3spLw7aeHf6SBjjcCTlF+
   w==;
X-CSE-ConnectionGUID: XR13T5hiRMi+7gBDr2LGbg==
X-CSE-MsgGUID: xnTEgOswS46gwz3GcK2ZDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34389608"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34389608"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 17:52:07 -0800
X-CSE-ConnectionGUID: bj+MSHbuSnGm7rNWga3ZTQ==
X-CSE-MsgGUID: NYSVBgN0QDiPcAFgZc22kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100422499"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 17:51:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 17:51:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 17:51:22 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 17:51:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q94nk7CeHSpV0MoRvUbug80MTKKfa86F1TsgtAoZCBaSg1v2CLAizqx8jMxWw9cf8FkT2Sw95mug2dwlwWwIckyAegdS8SkRz32tvMa10sE5MjW2l6tzAWLO1QrXVr3pb6JAIMG7CiCrLOOoA7Dn4VTE0zMRA6dkJV4SPrnMyaIb85JBPeF8K/LsFghxawLgxO7TTi2kfcA1tKnAhVt2nLxTtQKoY3wKVUN8dr8ZOq3ziMzhv7va53XtjIaJp+/vYZyCDGQ7oMPN3ajpXzYIgX5kqr8BddAMIPo3zEANvMBsmUoRsoGHt6Spb/jxrNOcmT10zeQYOZ6HKVbs1UmzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUP/ghaauNfeLZhS532Sbebm5Jm46iOmeBbqWDF9UcQ=;
 b=gcWqKag35icam2U77twbO0uDgMXEuC3iWWDFOS0z1JCAgO4ZD1xhwfssdj5FI3LIgT/qAf143ZqJtzt42AvgOO1JSGE2oWlS+qbb5cnJTMMQzW/vcWMaRsou3XyrKvGkINR7Pz6EBj4TKhEPDdR4Vr9FQls/ygkLx/Gu1+j+Wk+2JbqOoOsNRoVXodn7xtTwiGD7cFKtCjFK8Mvmh7Yk0pVQhM/MlOukWDJ44Jt3Hi05fXECAdp2NInlSlKpv1RNrx8lQsSx6RkTEDVMr7E9g4SA9U5LDmmFSrp/z0WnBXpXcPCa5+dUrBwBvDf5pktoxKARt3ou1+47AjQnpb4XsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Wed, 11 Dec
 2024 01:51:18 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8230.010; Wed, 11 Dec 2024
 01:51:18 +0000
Date: Tue, 10 Dec 2024 17:51:15 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran
	<oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-acpi@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 2/2] ACPI: extlog: Trace CPER PCI Express Error Section
Message-ID: <6758f013b5459_10a0832941e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240527144356.246220-1-fabio.m.de.francesco@linux.intel.com>
 <20240527144356.246220-3-fabio.m.de.francesco@linux.intel.com>
 <66b27fe8d73fe_c144829438@dwillia2-xfh.jf.intel.com.notmuch>
 <8286502.jJDZkT8p0M@fdefranc-mobl3>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8286502.jJDZkT8p0M@fdefranc-mobl3>
X-ClientProxiedBy: MW4P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::9) To PH8PR11MB8107.namprd11.prod.outlook.com
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
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c5d59d-3d3b-447c-b912-08dd19864e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHh3czVPZlpTZWxrREwzVXlFWkVBZ2xEVlNiaUFXa05tZ1FGZ3pTSzMrMUNC?=
 =?utf-8?B?RjFGN0VCN2ZUbkh4SUlkSXp3N0QwbWlPc2RUV2Q5anlZcTVFMzMzVW1kaVFj?=
 =?utf-8?B?blJ0aEV1My8vWklVVzRkajYzTE1WbUt5Vm1wRVVmMWxWanFPSllBdXVYL0J3?=
 =?utf-8?B?ZUdRaG1jUFk2eHp4TkF3S2ZSZGowb2RGVVdoaWVxWTF4NmdHV3JHU2FVcGpm?=
 =?utf-8?B?TUVFeHVBbGE4NlVJZVhGSHlrckJUcDZKeDlxR0xHZUo5dms0bG9QYnp5Zlpp?=
 =?utf-8?B?cEJqbE5XZXZzZnJGRExXRzJaT3FnK080dlFFaWthdUhQcUJqWnlodHVXWjha?=
 =?utf-8?B?TXBmM0F5MnBEeUlLZnZFdnpMRVBMNkNsbGN6Z0JWRjJoOFpURFBodFlHTGhF?=
 =?utf-8?B?bHFiZEc4b3Y2OUtsdmozV1hWWURnbm5ybUxEVUVaK000OVdIK0NWQmY2UWVx?=
 =?utf-8?B?UGp1MDlkSW1CRDhUUmg5WUJES3AzbUlQbnF3dnlSNHVEUVRRcEJUQzJsLzRH?=
 =?utf-8?B?bHQzeWhvVXVkNklHV1hhcnJDbE1hQTdwWG5qRDZaMzcxWmZLOXpKdnpNa3hw?=
 =?utf-8?B?aGlDZzgrTEJIQlZZN1c3V0ZDZ1pVSG94R3VTc3JVL0ZHR3FhZVA1UHVZWXdZ?=
 =?utf-8?B?cTRBRGllYy9xK096c3FaOGpoS2Q4bjNYeTZGVlJJUitwUG54bnpaY1h5SExx?=
 =?utf-8?B?clZpbHpFYXBtZFlKRXFMTzJSdkZqTnZEZ2tKaEVaRGZOTjZWckZvV01BY1hz?=
 =?utf-8?B?ZERMN2RLVHp6R1VUbjZrekUxR3BwSVdlUHdXcnJFMVJGRDRwVGhXZXNjSVVx?=
 =?utf-8?B?ajV4SWwzQThyam12MXFQMnVOaHo0cEVmSktlZURCMzd3QmNPK1haZklzYW9a?=
 =?utf-8?B?NjdWcEkrWGdsMGdqOGpFTzlRNzBPUndHaEZKanRqVmNrdFBYcC9ZUUloRWJL?=
 =?utf-8?B?T2NGSTJaUzRPUzRNZHIxcVRDUVVjd1pxdzg0MlNoNDd4Q1Vva05ReGRTTXR4?=
 =?utf-8?B?WVluNXMxSlltM2pPWjlaZjVxc054b0VvZjNQazJ0NGdyT2ZaUWJjMTJ6VFpB?=
 =?utf-8?B?NU9lSUV0cFZ5YlplU0JremhTMkp5SnJtVGpJeXBheDhud1VDUVpoM0dFaUNQ?=
 =?utf-8?B?TnBKU2Z6RjVKaG1CQ0F5aXZLZEUvWlJxUnBpNzc2Z0h4MUdnT1pTQ3lZQzd3?=
 =?utf-8?B?emNRaUNCaEtSN21mR3dCRW9WR1U5c2dXQjIzNW1vQlV4elZjOFFMOFlkTmNv?=
 =?utf-8?B?aStONFc1YkxkRVN5TDZrS2NDNXZmVXY3L1c1cy9CeTVJaUp3eEIxWkIzVHUr?=
 =?utf-8?B?b1RERTNWcjUwUkNuWklVRGtobGk3bTM2UlB2UWpWaFgvRTkxTEhObW8rZm1F?=
 =?utf-8?B?aW1JSXJZWXpieHhpb0hqQUNtQXBjd3kwTlR0bWV1dmtRSlE0dWdsU1piZmw1?=
 =?utf-8?B?ZGd5a0Mzd0grTzEwRGgyS0FFenR5WTFhamNQNjB2N25lbTRpMGRVeThtcktn?=
 =?utf-8?B?UUZQbS9UdW1QVU9mUU03dUN0MmxnZWlSMytSQXVzTDdkcENRNFFIWStGMlFk?=
 =?utf-8?B?QzRDM2Yxbk00aDBUTnZ0NnVaNnFEN0xCck5qdlE3YjJNZWVIQ0xEeXp0RFUw?=
 =?utf-8?B?ZGl0NHJhSjA5OUg3SUJaeC9URkxlcmI5R2RrbVYrclZORnE1b1ZsOWlWMDFz?=
 =?utf-8?B?R0RnbHZISGhQaTNUa25sR2gyUWdicFprUjlqb0VmU0JBb3llcUV4cGU4QWgv?=
 =?utf-8?B?VGp3V1RJNUVWUXlsRTR4ZHY4UzFwWmxkV0lraVBCekN5UFEycm9FWm0vaWQ4?=
 =?utf-8?B?VGdnVSt6eVlQTklaclFlQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk1GUE1CdFBYamFiYk5rTFRFZ2drV29rOWd1MWV5K0NpNDhoSWFUbjU1d3FD?=
 =?utf-8?B?MjU1WmE3cnhWSk81K0I3NzVGQ2dNQkw3bGFvSG5VMksyMHQ0R2xPOElma09N?=
 =?utf-8?B?ZUVzaVJJKzJCWlRhWGZpaWkyWnVEQ1pKQUovRVh0elJEYlZEd0hqQ0JWaGlP?=
 =?utf-8?B?YVIrYnc0OUQ5YmxhaFFyMkU2QWRyRGs0YWVWYUhhcGx6dE5iNWhOa3JZOTZz?=
 =?utf-8?B?UmtnVklkZUw0STdwY2JaeCs0Q2cxVkcreHBSdkJMejNyeXB1V09ieTF1ekVF?=
 =?utf-8?B?UWtrUzN5cm40Ylk0RGdMbEhhcDdsZ3VlSCtQTk93WTdtSng3eGlEeWlxV29M?=
 =?utf-8?B?WURJOXpQOHExWUYyNWVjMmMrQjI4ZEpNY1RCak92RTZEWnFUL1pyY0E2Q0pQ?=
 =?utf-8?B?R0tFSTVodUVwT1RKT2ZxM1RLRFFKSjRRWHh1eWxaTUJINmt3cEo5K1VVS202?=
 =?utf-8?B?WUxMbDNVRDU3bjlhZ2Z2TzBVQTlVQ2lUdk1OTGkvOXprQmR5NG9zWjh0d2k2?=
 =?utf-8?B?bG4yQXIxL1FmSHM0MU5LVHo1ZmVqVkpQUWp1TW1KKzFWMGdUTDBueG9Obkxr?=
 =?utf-8?B?dytSR09Pc0FWQWV4V3c1UitBcFNZWjVoaUU0aXc2bFlvYk9waWlOOTBVQnY1?=
 =?utf-8?B?bVdUdlR1VExhQWQvM2t6ZFc5Y1Jrc2VlR3lMYWtBRTcrbXFiOHZPVGdhZndh?=
 =?utf-8?B?UGwrRzlPTDRWQlc2S0EyTm93ZDcvRmV4a2ZTOHpJUEQ2NWlscTdHUTd0ZzBm?=
 =?utf-8?B?SldueE1zeGV6eHVPTDZ0OUxXSXcvNytxUUlzbmdqQzFnMkZKd1h5MkhyU3NK?=
 =?utf-8?B?V2pIUUlJZWpzWVdhWFJkOWJ1cVY4VTJCbzV2T2hsVDFjbFRIK0MzRHhkekdv?=
 =?utf-8?B?ZmdmTkx3Z3RNMmFkOTFtbGhUM25Tb3ppa1c2MEpFYmd4N0p2MHRCQklGNW1x?=
 =?utf-8?B?M2dna1lOYk1GQ1NKb3VEZ1JFeElSVGQyeTBSemhWK2VuK2hjSmRzUTdUakhM?=
 =?utf-8?B?N1psTFdJSmNXVmlsM3MyczBobUZZRWIxbFQ3bHV1OC81andHQ3BQWlF6a2RD?=
 =?utf-8?B?MnpvTzh1eUZJa20vcGI5WjhsbXhGRk5YdzREdEczZE5NV3E4TnE2eVpCeVFG?=
 =?utf-8?B?UGdidWtyd1o3SlNIMTc2ZlZaWnRrUFRuWEEzOE5SWVVTcjVIU2ZXdlBGbGlZ?=
 =?utf-8?B?RTNHTENsalViVktLQmkzbVBiSFJTTUM3MCs0Ym5iWHZtdFZFL0RmM2x4Tk9F?=
 =?utf-8?B?VTlBeklxcTdGVk1UR1pQQWViN3NVWGJFbUtkbWF4RnF4dExPaEc3dnI2bmV0?=
 =?utf-8?B?U0dhY0hDUTJ2NkExU3h3UFlIaHVwRGRIWUptQTJTL0RJWENPZEpSM045ZmV3?=
 =?utf-8?B?YlJWL2VVc0x5SDhSdUtmb0h5dk1FQVpVMUNDaDRRNzhKSSttbE13MW5HeEN6?=
 =?utf-8?B?dmtnQ1dMVHY0aU1DUkZPYWo5NFE1VjNIejFMRFU2clBsTTVYOXBzVmpqNHZu?=
 =?utf-8?B?ZkRPSCtBeE0ycm9vVHoxekFmRzMzU25ZRDZPeDBmUExqMnlxUFVWMVlZVGNt?=
 =?utf-8?B?dzlaQmVuNHkrWkFrSmRtZ3ViaFNMc2JVSnJyR2M1bTZyenFRdjVrTzZTaUJn?=
 =?utf-8?B?TFdlRzNuM3d0UTlkTHhEUUFEM1BBWjkrZE1zZjZHbzdGaFlzQk5XVGQ3ZmM1?=
 =?utf-8?B?S0Y3ZXB4M2hlQjU1aU9HSWczRFRVQitWb0hXTmtLUzFibmtGTURYaVRwK0ZO?=
 =?utf-8?B?dTd4K0hSSXRWYUFwa010SHEwRmlYMHFtbDFVV285TzRpempRS0N5M1VMVFhT?=
 =?utf-8?B?TDNlQXZ5RGdPZ2Y4dTRVNTBnMzMyTFRjM2NsODRiWkZHTCtzT29jQW9ncWlS?=
 =?utf-8?B?TGxYeU1QbytrM2xKQUgzTnNYQS9WYy8wMTFJYVJONE42c0p3YUF5ZVJVbXgz?=
 =?utf-8?B?bGlnaEdKTVhuYnZPaFRGRHJCK2I0ZTFiWk1Vb3RxZFhOV3pJNnhpdmxGUmpy?=
 =?utf-8?B?RWV1aXVpTHF2ZnJranBnUlg4RGFjUUFhdmVLLzlYd0V6YVowVHZReWZYcFRB?=
 =?utf-8?B?Rnk0RGNLTHVLVnNySEtaTTg3SVJRNC85RzRNRUwvSXNwckg3TU1oWnhiRkIv?=
 =?utf-8?B?c2NNVWFYRTlVSFA5UWpTRTBHMTFOdFVkbjVKMlljSkUxdEFPZ2ZVcGhyMGha?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c5d59d-3d3b-447c-b912-08dd19864e1a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 01:51:18.5267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdGxwWAf3f4gYIMvHmY7AVf/3fg38ATokfF6xrsndxhpdMgxbe8ki+3l5o4OKHiJEAqWfG80yYuSwkyX6Vlk9u/9ggRgja2Co25te257FSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Fabio M. De Francesco wrote:
> On Tuesday, August 6, 2024 9:56:24 PM GMT+2 Dan Williams wrote:
> > Fabio M. De Francesco wrote:
> > > Currently, extlog_print() (ELOG) only reports CPER PCIe section (UEFI
> > > v2.10, Appendix N.2.7) to the kernel log via print_extlog_rcd().
> > 
> > I think the critical detail is is that print_extlog_rcd() is only
> > triggered when ras_userspace_consumers() returns true. The observation
> > is that ras_userspace_consumers() hides information from the trace path
> > when the intended purpose of it was to hide duplicate emissions to the
> > kernel log when userspace is watching the tracepoints.
> >
> > Setting aside whether ras_userspace_consumers() is still a good idea or
> > not, it is obvious that this patch as is may surprise environments that
> > start seeing kernel error logs where the kernel was silent before.
> >
> > I think the path of least surprise would be to make sure that
> > pci_print_aer() optionally skips emitting to the kernel log when not
> > needed wanted.
> 
> Sorry for replying so late...
> 
> I'm not entirely sure that users would not prefer to be surprised by 
> _finally_ seeing kernel error logs for failing PCIe components. I suspect 
> that users might have been confused by not seeing any output.

2 notes:

* New KERN_ERR prints are often found to be unwelcome. When the kernel starts
  printing new error messages it causes sysadmins to scramble.

* The future of RAS is trace-events. Any new RAS messages to the kernel
  log need to ask the question, "is userspace better served by
  registering for a RAS trace event, rather than parsing kernel log
  messsages".

[..]
> I need to be sure that I understood...
> 
> void pci_print_aer(char *level, struct pci_dev *dev, int aer_severity,
>                    struct aer_capability_regs *aer)
> {
>         [...]
> 
>         if (printk_get_level(level) <= console_loglevel) {
>                 pci_err(dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n",
>                         status, mask);

No, the code would be:

    pci_printk(level, dev, "aer_status: 0x%08x, aer_mask: 0x%08x\n", status, mask);

...i.e. just pass @level rather than open code "if
(printk_get_level(level) <= console_loglevel)".

