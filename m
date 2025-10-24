Return-Path: <linuxppc-dev+bounces-13259-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27015C057E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 12:07:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctJVg2N4Gz30RJ;
	Fri, 24 Oct 2025 21:07:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761300459;
	cv=fail; b=V7XDqXkUMhrQ/gQe2m30thSPbMVAFZZ0q40yF++kTUF8yOAlSq9k1vvLERMh1rvW0LeYhFA1WvQbZiz4D8rI+yTeU42fI9OM+phSCoTyxBkt/JDVGZqeD/Mo4lBdiLZBDclEcNNN2iRMi4bZCd4WARj3lFVCevmUybct+mk8hvZ4vq5H85WZsl43lAbrQoWLLpa9CDKon3NPSbKOBwoWhpX0cXh9Jue5rKDf8PNCdT/4iRhp4wz32BqiQTYVQvIuXGvTin5OzhKT75RlgUo6yD1zkZ6T2SK6gQmvo6HzjikFiv7bKDdknlEb4RKGcNTuVDmickHsjxdw8hpJrzwIuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761300459; c=relaxed/relaxed;
	bh=1X132Cfvn42L46oXRmhSZoTI30skrHVdWbLzV3eDUac=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XQ7vmxY/1BOP/YMUDVygVmeYkv9GA7T7thQPSUmpp0KCa/ytU+rpxfSeCNCNqqXvEliv5JmwYuCSyu1q1MWli+zPDC69X18KExEHjGxcp/NcXb0zl4E4qxL1KxH1a9PFZ+VKP/+F2PrioT13udPSaIiszpI/FnFjWKppDwARxBWe1MJZPLMqQqd63v+9GlPF197DT8EYAY3KnUNC8n5kzRsGachhApnygr4/IsYTFHcZKwAwFscs7xpHOdIEEbXGIn9LsrHx0YQOPC7E/H/Dtq2zeGxaheYzzVDRmsKI+t52xg4nav9zvLsxN9GbEgEn4Yr3eZXDXv7ANciUxJWzkg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GK1QJ0xU; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GK1QJ0xU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctJVd5sj6z2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 21:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761300458; x=1792836458;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   in-reply-to:mime-version;
  bh=i3dkJLtQerKfNbYjc1BRFDFl5q4wMbTJkqtQ8qnPsQw=;
  b=GK1QJ0xUQDm2mLubYFbtrHy7n+HBLaQDPV5EaAUv6qmDqOj2uQPfPEVD
   BcSDyfyJFyzq6VLYrLREvw1FU/bBLur4d95ENUMRz7h2Fhg7anpsEv2iH
   Mv/MQHbJU+j26q2o99zKYgf5YCbQ8ebXmiBecwGUmAdShVe/MoBBUMVY4
   7S7JlE+Hxq88iBMuCNmAM0pPQAm8v5SxTDoNNvmMamSx5jhyYU76AOgcM
   GHr14QuvQc/Af0qWNkKaRA6hxi/6WbUTDpSERlglmD0V30AHYI5mjk3tl
   xcvg7rBjhDZUa/1SQYRjInqlAPxK6U+S5Q8eVv+oihJzq6vBpjEDVQabv
   w==;
X-CSE-ConnectionGUID: BF+qIaSCTb+UBC8w7LAF6A==
X-CSE-MsgGUID: lTNhTSR9QzG9B9Kl2+O4Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63576808"
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="63576808"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:07:36 -0700
X-CSE-ConnectionGUID: fNSfAazaR46kpB4vrtowJA==
X-CSE-MsgGUID: CAzT8JVFTuSI/+nuUUYKdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="184289341"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 03:07:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:07:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 03:07:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 03:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/vFXNfXwu09nl3A4Cu8E85fJGt1bgH4FuJ8UMdkBWGfLqXmQIksP0lmRoBTP5OeDnIYNzhP46opDAL8jmCHMQp9TYUdtheJn4yFN6MSA/TDrXGG2IubL+iAcVt/mo2DlhV4xK2KWH+CL/2B/0wDK8KvoNV+vXFlWOrHsxn6WB6cixYzLMcgMXIn9U5u3qoqKxhgYaUvBrPzzYNCL/4zyPOSrQ/nSjnfb15ozCG3iYOHxCxaJyhsXIBLwhP1uj9tPKpewf0H/jzfQJz7skhAbA356IRYJ8aOyo5LmFpUMLH0xm8mIV4cPHdDXFr+f0TryOD9K8Lh+/7jtsFpY4QF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1X132Cfvn42L46oXRmhSZoTI30skrHVdWbLzV3eDUac=;
 b=UZneRoyfN9kZPWPFAcWcpDJ4NDqgjtywYsCdffFWOnl1s2OwA4iYxX9+4MaH7DAaje78CS9CiIPaFmyTZ4Etgm++GA/IGfjXm7jIX86928RuKF6DwRchx7iN03mGKpxxgVV0C2JZPgmbKNrZ7hgbtINPmr5R9Lj7vssYdXON1yXKFyRiJGVTzDQLDQ1AOeSsYEjUuIYXD2Ibr4nY0xlVBmzH/B9zkYaheSatrH5HFUEtR5JRNWqgqUHTG9JXTBQuVy5Ji4ViKeFjAg4x8QlpsRdZePnp580dX3LdqKAC2faMuCCmh6jwlNWRBqRkn6ROQY4Q1L+31gPL1Dx4R9BPug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 10:07:25 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 10:07:25 +0000
Date: Fri, 24 Oct 2025 18:05:56 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda
	<imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, "Kirill A.
 Shutemov" <kas@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <linux-coco@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>, Kai Huang
	<kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, Vishal Annapurve
	<vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>
Subject: Re: [PATCH v3 19/25] KVM: TDX: Assert that mmu_lock is held for
 write when removing S-EPT entries
Message-ID: <aPtPhGcE3nqtMDNK@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
 <20251017003244.186495-20-seanjc@google.com>
 <aPnbIDxGlcAyI9vy@yzhao56-desk.sh.intel.com>
 <aPpGPF8McvI3-OO7@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aPpGPF8McvI3-OO7@google.com>
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e7e64f-80ce-4090-b6e8-08de12e5212b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LyrEcY/BufKQmK5xX9M9O1GutqmFLx0DsawrPlgrl7b5MdSOD6tzFzNrXLxW?=
 =?us-ascii?Q?eDy1Tz+nsm9jPsYcLaVN+brIkhxW/6RDYg8GVojUwD8I1x/FAFPVspc2EzUe?=
 =?us-ascii?Q?Igo28PY/lLfyGv+iTKI5G0QqPBYx7UhShCv+1JtelTrjBm4wkRr868jZpBn8?=
 =?us-ascii?Q?focQoLybD/cBQZfNHgQ+RaLkui8qJqU8cN3ncIzRxAsmrGn1M7t+J8FoN6ds?=
 =?us-ascii?Q?zvkNgI1Tno2mappj5VKlXIiDtCs1hRblwePC+ilCV661lnNl6iwl/ZksLEXU?=
 =?us-ascii?Q?/LERw/jFpowpAAMXo5rGMZg4r6lLWUG/hHvvJ51uhJwzJsfpXLzVJD1Fp99o?=
 =?us-ascii?Q?XOK/v3YNQNBXmEbDQlBYaGx/4GgC7N5TJNJIHexbyw3d2BOLOoirFkus/ptp?=
 =?us-ascii?Q?fJH53KI3HS/6mGW+yFueONhFXmvxqgeRhYxn51/8srtnGp5X5TDBWeh9aC8M?=
 =?us-ascii?Q?PU3JHTI5JpWBAUPUxmNuEXBgugliDOmPwxjcHRiIVvt5bDR1i1hVUpz4sO6s?=
 =?us-ascii?Q?eB67iaIcQW0dyRvL4UDU9yCVVNvXHr7D0h1iFkgv7y2NcsKZ7F4ua98gu46b?=
 =?us-ascii?Q?s6VwHzEbZPN/RvtpsHn+QkOCQCRkWsMSzzFHhyaq6djZZVZCugyM8vFE4X8Q?=
 =?us-ascii?Q?eg2cw4b2lxg1/2niPt26bDI7Yjfeh2XJ5TvqsD4zg0wq0oH2GR2r+ObqT/ZL?=
 =?us-ascii?Q?CKyDMEh4CF5sZii/VoGU50xdDz0tLU6YdBUuFE2KiYAHgoBzSM7grXwwjYEy?=
 =?us-ascii?Q?wnzUxkisgJSO+PIZKNDYBRachgUPEYBrXC6Ow7trVQYNi2jX/pQUrldu8hnf?=
 =?us-ascii?Q?crbD7KG7KIJSxZeHqw8dKKATJ12Whmov35VPZmRN3LfKo13fioamXKzze0AD?=
 =?us-ascii?Q?fWm+F5hwVvn5XT+MxhsYsiwDs4fMkcUgPC9D3OEcM9oKihjgN/PaWeuKVn4m?=
 =?us-ascii?Q?0d1KeqUzaeeGTcra/C68RV/6Z6EToz4l0ZpCcMRN9CeZ4OSc3K7nuJsdkeKp?=
 =?us-ascii?Q?SIUvz3sIfJn2INI+0qYToOBJCLSLKv7K7qFzVO6G8RazqtaLVz/ADf7vc7Rl?=
 =?us-ascii?Q?5ggD9RSVW6VFp5a/1IqnQCzozsMipv7cYsgQVoWNC8JT9BNr6A16q3RqP2Hk?=
 =?us-ascii?Q?u1kpKj2W+nh6IL6vkv+fSdRnekaDz5KI5CmStis5eHbP5FZ/yOuP+lx31dJq?=
 =?us-ascii?Q?CMutej8jDoGIZ7L+Wdf5o84HkXlT/bYUcwTCl5qcfaO1D7DPxpOLtoScgdU3?=
 =?us-ascii?Q?22kwbgP0PM9v56qC9/UkBxLf3MMsjVIdb39NPKnbXhyWr5rVtkgKHZ59OX1p?=
 =?us-ascii?Q?gxMKDk+L4NOphUSWrCd80hob6JS2ePIAjXEjuclzDYzwag2y9glkctBXQWq0?=
 =?us-ascii?Q?vtwzByHmW2UHALK6dlFVjeRpLc3Kg2ZT1uGE00RjQOzxu+RrE/nWdfHbSvmt?=
 =?us-ascii?Q?SocEA/tqrFqZwNr85GtBlYUPWKDs0N1d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JF5+wICiIL0K1HykthAcb+48rf8uMWUl05Z915ayGDLcQgeQz+BcUQo9TxGw?=
 =?us-ascii?Q?a483dGCJQlc0AoxSL0Cn7ZRO0QrZrWILsknuxlIU7emXg/TPA4sy0EYdrn6o?=
 =?us-ascii?Q?TXJD4WARTiWDvyuucyLF2igU6rq8RZj8M0lE0nX7eaPEf37rAziRswaUjnSQ?=
 =?us-ascii?Q?Kkmqp8JBydho0/Ydq5SZl0HwaJL9Jtke5Q1OluGAJCjookg1CsiDyyOwJzVC?=
 =?us-ascii?Q?AaTCMAJozy8AHx5vpoSl+Cf4eOn41PSkznRfuEAF8nmPLgRr3fqWuD0zahK4?=
 =?us-ascii?Q?8J3CWWPy5O0WPdx7Z7l/2Xt9OAXObw94keNEvbnTRssdOPTj+EQCh7r27a2I?=
 =?us-ascii?Q?Kx8QeqrIhXv3ZUuUHnxjm7ZPKR0KXzIZJjseAYeWFIVFl3pMV4CINMPwZYPP?=
 =?us-ascii?Q?LVo88FmWbi916qpRO3ilvEZQMzn1OMkN7YHyHI+qtEof/tzgk1q0FQajj/yk?=
 =?us-ascii?Q?zVFdMxtlwDuQgQO457NSS4sHt2dbh7u4Szb0RRB+DTOzbYdwQCaMp76QW3K5?=
 =?us-ascii?Q?+wmnLIeHcr46ye9zZoJf/jmme0ogiT52BW3Pjxk84EE9dZ9rqla54qeGjMdF?=
 =?us-ascii?Q?uarRNkksHfLOfnbfUrji0FRxaKNWA0J619FnE5MwvE+gKADiYKkyh5w28pNV?=
 =?us-ascii?Q?V8XfDhYQcUKQiLfR/KpZ1WBPS/lOfxEvxhMozo7tnNDmbKQMWgVQ1YT9OR/b?=
 =?us-ascii?Q?PxPk4Un5Pw6azxqSLHu0RM2R/ZFVMraC96w325vSlkLuluvxibjTcREzXpSX?=
 =?us-ascii?Q?GMz1Sb0hQaWphvSyv1kklXtEZWZvvm1EUeYLNnN+XFYlzOs0mgXgudARsFE+?=
 =?us-ascii?Q?1KYovyYbLauAeT2hMIOvv8cfJhzFOBlg24Iqerf4iEGfVQzHphYBkAPhizxV?=
 =?us-ascii?Q?8XnfONJWLdqltxvIj0z78IpgS+qpzCaIhWLS3ZbTrYZU6K5G8InpQGw2fvOa?=
 =?us-ascii?Q?rATklF8++yGB9v90vhRYZAVBZBodVZp0qswbrwwrx4lLK2t6RlcWQufxjrXu?=
 =?us-ascii?Q?4DJcoceLlFBG0xENn78VJ2xaWTOxqf8KASVRhmJZvNJ0E0ClEcpEamop+WAw?=
 =?us-ascii?Q?rHUPj5GSdGgiN5kDO0SeEdHTKDjwn5bC0Y7zc6QtImFrSJg7cN4yVRpd02cC?=
 =?us-ascii?Q?YYgQ81o5rumGHn2YY176kLFKc6SCGJYEc59j81luNYjxMjYR79F8kX2kSqoY?=
 =?us-ascii?Q?GylBtwW3zpcqqo94/PWBbHUWjT/ZivVfAjhab/AWemQDy0eFyOVADcn66eu3?=
 =?us-ascii?Q?uuLEGZLjjavhX6L5eiLAf8bSGffH77Q2qy26wTwyrHkMFpL090E8lE1kkqLI?=
 =?us-ascii?Q?1xiBYfjWiYZfHlRZpc6qx9ZL9xcaWOvIog0ScT0b8xmyWsCo7SrerYlDrlIE?=
 =?us-ascii?Q?8I5arL/18OWm7TIDxJAYWjRT6rkRh7mxFYV2bwkUVlJSBpDzGyyHhaWrVqnx?=
 =?us-ascii?Q?LqHqs+FsgCfVJ5L1xsnmFAt77E9ZvwaI+CpRiTzYO+0pKpkNibpnu06xkZG+?=
 =?us-ascii?Q?uzfsx1+KUgy8pxCYmWIzDMY1wnbkqIrHTe/tIJJ1GGeAN41veHDd1csQj0pR?=
 =?us-ascii?Q?2Gn+6quwKKEAO4GH6cGKipWO4HSvAJjw6pzIcjtY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e7e64f-80ce-4090-b6e8-08de12e5212b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 10:07:25.0373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWkTrEBqAYH6ib/s+pLOFV2g+/dhacD3ZJcEpl1/4aZ73Vq0VVSeTc5MiafrbYB9ZdCuXbfvrTfNq9eApgrBpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 08:14:04AM -0700, Sean Christopherson wrote:
> On Thu, Oct 23, 2025, Yan Zhao wrote:
> > On Thu, Oct 16, 2025 at 05:32:37PM -0700, Sean Christopherson wrote:
> > > Unconditionally assert that mmu_lock is held for write when removing S-EPT
> > > entries, not just when removing S-EPT entries triggers certain conditions,
> > > e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> > > Conditionally asserting implies that it's safe to hold mmu_lock for read
> > > when those paths aren't hit, which is simply not true, as KVM doesn't
> > > support removing S-EPT entries under read-lock.
> > > 
> > > Only two paths lead to remove_external_spte(), and both paths asserts that
> > > mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> > > handle_removed_pt() via KVM_BUG_ON()).
> > > 
> > > Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> > > that wait_for_sept_zap is guarded by holding mmu_lock for write.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/vmx/tdx.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> > > index e517ad3d5f4f..f6782b0ffa98 100644
> > > --- a/arch/x86/kvm/vmx/tdx.c
> > > +++ b/arch/x86/kvm/vmx/tdx.c
> > > @@ -1711,8 +1711,6 @@ static void tdx_track(struct kvm *kvm)
> > >  	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
> > >  		return;
> > >  
> > > -	lockdep_assert_held_write(&kvm->mmu_lock);
> > Could we also deliberately leave lockdep assertion for tdx_track()?
> 
> Can do.
> 
> > This is because if we allow removing S-EPT entries while holding mmu_lock for
> > read in future, tdx_track() needs to be protected by a separate spinlock to
> > ensure serialization of tdh_mem_track() and vCPUs kick-off (kicking off vCPUs
> > must follow each tdh_mem_track() to unblock the next tdh_mem_track()).
> 
> Does this look/sound right?
LGTM. Thanks!

> From: Sean Christopherson <seanjc@google.com>
> Date: Thu, 28 Aug 2025 17:06:17 -0700
> Subject: [PATCH] KVM: TDX: Assert that mmu_lock is held for write when
>  removing S-EPT entries
> 
> Unconditionally assert that mmu_lock is held for write when removing S-EPT
> entries, not just when removing S-EPT entries triggers certain conditions,
> e.g. needs to do TDH_MEM_TRACK or kick vCPUs out of the guest.
> Conditionally asserting implies that it's safe to hold mmu_lock for read
> when those paths aren't hit, which is simply not true, as KVM doesn't
> support removing S-EPT entries under read-lock.
> 
> Only two paths lead to remove_external_spte(), and both paths asserts that
> mmu_lock is held for write (tdp_mmu_set_spte() via lockdep, and
> handle_removed_pt() via KVM_BUG_ON()).
> 
> Deliberately leave lockdep assertions in the "no vCPUs" helpers to document
> that wait_for_sept_zap is guarded by holding mmu_lock for write, and keep
> the conditional assert in tdx_track() as well, but with a comment to help
> explain why holding mmu_lock for write matters (above and beyond why
> tdx_sept_remove_private_spte()'s requirements).
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/tdx.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index dca9e2561270..899051c64faa 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -1715,6 +1715,11 @@ static void tdx_track(struct kvm *kvm)
>  	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
>  		return;
>  
> +	/*
> +	 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
> +	 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
> +	 * tracking epoch hasn't completed.
> +	*/
>  	lockdep_assert_held_write(&kvm->mmu_lock);
>  
>  	err = tdh_mem_track(&kvm_tdx->td);
> @@ -1762,6 +1767,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
>  	gpa_t gpa = gfn_to_gpa(gfn);
>  	u64 err, entry, level_state;
>  
> +	lockdep_assert_held_write(&kvm->mmu_lock);
> +
>  	/*
>  	 * HKID is released after all private pages have been removed, and set
>  	 * before any might be populated. Warn if zapping is attempted when
> 
> base-commit: 69564844a116861ebea4396894005c8b4e48f870
> --

