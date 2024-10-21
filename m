Return-Path: <linuxppc-dev+bounces-2456-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C30C9A6058
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2024 11:40:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XX9K84tKbz2xn3;
	Mon, 21 Oct 2024 20:40:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729502914;
	cv=fail; b=V6vp6D9eHTHVtWRVQB4ZJ47v70iMNmOOyvkEF5nXWUtdKjCzK9B407W6H1QlAU1x6hG44UTVNnHYygXmpbb1AgWKlceq3C67CZsVhNB26C+C/i7/yjk+hJHl6tKlcNIBFGxcgMzHrnxNEvUuv4CYiP2hNavQRL8eCJJDYUUiyxIoyOViNw92bzyM6c8DBn+kw6u+E5wNsbX+q53nHOdiATlCF1M4So7xXnD9CdGzhVYAm+CQp4ztohtIF4Hwro9HfZ3vrO3B2fuFq/SKVYzMdAOzEa1oVMQjL2gEOHEYSyhX2zlib+z789DGZT5A2kQlpIPq0ONmj9W6r9PBwz4VOw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729502914; c=relaxed/relaxed;
	bh=FDxfTUlM3IhD154zV0/dj0ZpBk8FSvyxpzZUJmUWP04=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FVHhhave8ajAdL3LRqzgdgJ8U22B9zv1feY8Rv5buHMw+olkrpTnsgnNudSMG0ylPoPSE7cKHCj+hyu8xVOZH7EBpAA7mrLwnVkPVvSt/T09PQ622fA4WUUlwanvyd6BGBqz/4jE44iCUEgeJYbwxDLwDG3of8elcvsijp/0C9vpAOg5kCVymm0+DJNGMR+CW2AksAdZQSeGEi4lq4D1RIZ9oOYwZzcDQi1NmT+Z1JjmdyJ97VXkEY10IgBlTfe5wiZcZENdUIPCdlE1VOkGTLRXoTqYWv156MvZt69+SiM29V8ElL2nHXDGybZBQE1HCfqUsguwhB+UKumIqPeg6A==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LxnUi/vr; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LxnUi/vr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XX93M4dmDz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 20:28:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729502912; x=1761038912;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Epds4+2pgtkwhr6rBnNnQTiKg8e55kPAlcatmgRKBL4=;
  b=LxnUi/vrPPVxuUNvYhUSW8Znf5ucKN8GuXaa2ga/uHHrQQAiizAJ3Eoa
   pbZyP5cKuV2+zEdm/4RcqXiuDpHZjU+gf+WwaY6JpcHx68Hi1VGnPQTW+
   SmIc9pWthhREAVN411Ed88Okti/W3L/Gt6jgYo49SxTzLQZb2UFOzN+q4
   kR1WX1a/oz6lV0CF4GeCpWkO5bE1MgxNjfIVl8pD8mWSWbF9ckLWP8kPf
   3Ux0BKI7qG8bAy3tOvxT4OkJPpiJ05FLzJtwJszAnY+XpZMACni3L6wYk
   l7JmMtowcfwBzp8+PHFAoSZUxomN78Jk/A8IKzj1OUl2sf2loYke26xzc
   w==;
X-CSE-ConnectionGUID: +PMUSKjySXyYZfn8kL/HdA==
X-CSE-MsgGUID: pg9anfSYQ52Q2MrEVON1+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28755953"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28755953"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 02:28:09 -0700
X-CSE-ConnectionGUID: beSpOexKStaBOoDPdQyJmA==
X-CSE-MsgGUID: Exur2xPsQA2+9BS/AGT4rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79819252"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Oct 2024 02:28:09 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 02:28:08 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 02:28:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 02:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFy2wIpMlvgQktZxFrmw7VjD6zdjYqOoEuIYP++LPvZl2ttG/XhWboYDvbJbuVfu7pKAkjYjMgfnNUi2HwpmDck1BlGJGUaR1lJl8/6yt5eu5WG2COcdH7z8SCcdP5rCkzwq5pJy2rnMjgCrEIzgCQpUbSJFmGAm3GJV7xWA8AOVzfPWhkfjRbe5OP7hP1Hc3nCHa+fQ3CejEC0EsUocf1EOpVjEW0fZrZ+GAbLv2N4CbtlIns36C1uoUEcuWqqHN1R7/og/XUn+PjBmt0do3IAT9TA73NW3f+y+lUttxblobG9RLijBrypwxeXtGqnse+TuKktSjkmMnwgHKpYMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkgXDOF0scUTiBsHdrGGjuURL3Pf+Tp+TC0z+VbsWM=;
 b=G7l2ggLVVIhPBgLkr7x2FIaN/7d4Cf1Oo6fIaYyBVzZzUQJsdoi4Gd2B55h5nTKEwwDJ1Cw6HGOj91xcHSLtM7cpLZSZwCMZt5YNn2w2xhIMhfnJfhyZmMz58ud09xKqfiPlazSVpLBMRMriGO9udiIH9oAw9JpzVJpKpRluPlmak/estYpOWSNvBDT76dUtJYsEXsCVIHENr54qEc28/YjqCgo3BDO4dE21lLQ0bk80lX3bKlh2dkVDXUJJAimO2/djp4sl1Tuenr9LiLwwDu1SIytnJwatF6gDZPrKwn+8628D3LzEVIbu8DwLKUQHGNIem/MRY24uhZoQ1ZHzFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 DM6PR11MB4532.namprd11.prod.outlook.com (2603:10b6:5:2aa::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.28; Mon, 21 Oct 2024 09:28:06 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%5]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 09:28:06 +0000
Date: Mon, 21 Oct 2024 17:25:40 +0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	"Oliver Upton" <oliver.upton@linux.dev>, Tianrui Zhao
	<zhaotianrui@loongson.cn>, "Bibo Mao" <maobibo@loongson.cn>, Huacai Chen
	<chenhuacai@kernel.org>, "Michael Ellerman" <mpe@ellerman.id.au>, Anup Patel
	<anup@brainfault.org>, "Paul Walmsley" <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank
	<frankja@linux.ibm.com>, "Claudio Imbrenda" <imbrenda@linux.ibm.com>,
	<kvm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <loongarch@lists.linux.dev>,
	<linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, David Matlack <dmatlack@google.com>, David Stevens
	<stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map()
 only when necessary
Message-ID: <ZxYeFKl2KbZ3Ila1@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-35-seanjc@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010182427.1434605-35-seanjc@google.com>
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To DS7PR11MB5966.namprd11.prod.outlook.com
 (2603:10b6:8:71::6)
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|DM6PR11MB4532:EE_
X-MS-Office365-Filtering-Correlation-Id: 59c9706a-6f7c-43d2-4905-08dcf1b2ab8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?63GSDnQpMLyG4vDxagETWz//ScdtoD7cdrBW0mv/3z/dtRmgG+WANa8ib3?=
 =?iso-8859-1?Q?qvmCwhDQg8quxg3xceghLuw3LTIl3m6KEmrsk5m8kFRDZx+6Ouh6xoVY/Y?=
 =?iso-8859-1?Q?EPL1X1ROzqGxwbDjyLyEp8UWMgwWRTN3/I256caJLeFpWQKJhd8AJ1iIlW?=
 =?iso-8859-1?Q?aoXI5n8TnniyTKj194HoHC2/eBCC6icEzcqezmeSqHJsAlEfyOihltcbXX?=
 =?iso-8859-1?Q?v9xNAlhkvVy7IpZNs4Ms+TlPt+N+0yK0awhAfMOa84kHNbu+XvJ30s8JCP?=
 =?iso-8859-1?Q?4PngkZcpgHWHUEl4Wog9DE8tNfvQ3XDLq0zKd9ImO9PfAfa8rGXZ6THeG5?=
 =?iso-8859-1?Q?4etlGk/LhPzf3dgFBvqUPHVLAWuwqcSLCqEWfpBrlgnsg4YW9px8s4GZFi?=
 =?iso-8859-1?Q?+baBOpJnyJCY6rk/VfzKEPUpaMN61Cfg/5qSJKYrfdftQ3bMT/f9I26XOe?=
 =?iso-8859-1?Q?QydYlKfHbCkNBOdMl1sT0YiXvGFsIyTHmbx3AaJydbmgbHUDiFCyrOW/MM?=
 =?iso-8859-1?Q?41V2zs/TW038dEdKtdfvH0O4RvPWo/lUVJ4lUVPVDdwUF6tVXzzCeX/vCq?=
 =?iso-8859-1?Q?V9xV4O21oqn3/HJgmIIBxAZ7+NZqGXomxuAGySy/iQisTbMobhmEZO6Moz?=
 =?iso-8859-1?Q?DdAeOkBeRYyPzQBRuYnkj9U790LSMt/g66f1kJIORBI6/pnGpATh/yWiYB?=
 =?iso-8859-1?Q?VVehzl+ag+dzBmqwZPrH6peyNvsrZSDejVRAxQZgtQAMnFQzRHQUk6uLn8?=
 =?iso-8859-1?Q?P11y+/bTZmTjbpHaruQj4UeNpHFk0o+8ourWvK5OniRS5rLkslAWtiyxT9?=
 =?iso-8859-1?Q?zRqEluBAZmLcxmTYi5rJpTsHw8BIcNlEgYTKpe/lDATnHnjo0IVBhK5OaF?=
 =?iso-8859-1?Q?95FDQ8Bu5PP4uUDezhMrgcLGHmkjlkBy4qf7ywT/rYHyiKJLKIc6D4Ioga?=
 =?iso-8859-1?Q?wpWxHAeIsITLsDjcsoPtT9y7OlseE22105+ZilFOCkuM5GFSZREW0x8hW/?=
 =?iso-8859-1?Q?jlxVCeEOhNnAFTpsxXKIYKEm0IcJhqQiXFIey9nVtf3qOQCr05riva+gi1?=
 =?iso-8859-1?Q?Abitw30s6bT2p31g82pn7vEPv/lqEM2bfvnS5A207xsiZ6OJlJmVo1DjTJ?=
 =?iso-8859-1?Q?lFRTf+A8tHhOFjPSn2Q8QfECbipJZ5LZ95jyEGDx6g0tS/bJHOsO+3kC9a?=
 =?iso-8859-1?Q?PbxUU4c9r6GOrTokLjkuru/wjmsHEK/ouzrPY3DCPNtPGnAZ75hgUbgG59?=
 =?iso-8859-1?Q?RPSe6k9XJcSCQJ/2SAwOyeifCKyiYSRv3LV4w3PvbQJ64RoeviVOclXG+S?=
 =?iso-8859-1?Q?isDU9158mRW6t0rNTjA2/2jZ/URSjOX/qsSaUplUzBpMN7o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1ouk1zxM0cFvlg5i6PlS5Gfl846MLwAVu04bDdanHF2oGS/Y1ytsLsF3P+?=
 =?iso-8859-1?Q?pBlfRmKQLnNNQQP8LkX/6emf+89e7IM3x2czOFALrSTHiMA0ehwjmnWPm9?=
 =?iso-8859-1?Q?qPZ+0voDwS0ObswHJMgHETB3KLRR2Evap0opWa7EgicSBXlihS2ThOFg5k?=
 =?iso-8859-1?Q?Ut56wLqWC3WIp3mlAM2XdqSKffGA9tBMWrM1+B4GNJh0eMTgpUhvelhZrW?=
 =?iso-8859-1?Q?svOoGkkbl5nF4kD3OJcQVcfn4CmYMUpSkGqA5gQ7mQSKkZWXRI1MhzozAF?=
 =?iso-8859-1?Q?7oVC5lSTGjeblPhd4+iwMXk8FSHtGlcp/4rFOL6bEjmZakb/qxnI1j6pZ1?=
 =?iso-8859-1?Q?FRiJnuXfT9W1gaZ9nVcbBt0OR2X3OfRybKul4QzSumF8/C6M1LhVjOvfnn?=
 =?iso-8859-1?Q?Il7DcOJv/5M9YfdJGWTJG4qC649MyW/rtFr+bUdxdDSoiVBzA/VB7eWNYA?=
 =?iso-8859-1?Q?1LQfXfX2V9sXCUCbq1vVvV8+0pRV0rtddC/H8UiwKMJsi9FWu1ev/W5PDp?=
 =?iso-8859-1?Q?b/Hc77xUsJNjullQJPl+LL2fXBVNhD0dWkf7WOi9mdVx3A4tb5nx4uL88t?=
 =?iso-8859-1?Q?GIb2EurAtbDC9eWhg4md3EJTM6HGByY7L+9rDESA5EMCjtKBFgaSXgIzf4?=
 =?iso-8859-1?Q?tzcBf9lrAEuQCkjv40aapbbMbOPzgNv3JlAHtgv7EpEh7k9CWE6bxjd5TP?=
 =?iso-8859-1?Q?SHQieafY7ovs4MNCxqCcyebvVHmTmZ9GbmPNsNy+jo4zL6zmupTg/GvOkW?=
 =?iso-8859-1?Q?QLd0/9LK/hWtdtCKoA1RLAOJJ/V9MpMJ+JJDmp15h6PIEWvTXPF2PBWucS?=
 =?iso-8859-1?Q?iLY8gh2828fDcM533Ry4eN/ASTHISDG4RATVnl+goqXzN3Ux1o3VnhhoD/?=
 =?iso-8859-1?Q?++5xj17lECd0k2I2U+5pQbAP0XBKQgz6kHFzSNN4tlxtT69qLh7MRcEEFj?=
 =?iso-8859-1?Q?Cx2XGAqkADiFul4WRCkQlXm6tskKeDKuZfeLhtlu7s1g7krfnNQZI9pS+/?=
 =?iso-8859-1?Q?gkWWHJzG7PwKQsFsQBVHbZdSiGkY4VTfIQp9mgi33f1oT2+RAdoyEdlDX+?=
 =?iso-8859-1?Q?EZVDRlwQtbqgCKScMXPpYzVCw89x4VOsKFb9uRENMWeSdRtMH/T4uTH1gn?=
 =?iso-8859-1?Q?R8S5V+d+4g8kDAIwo/2If8ouLC3kXT2jUowx4/inHWoC6E3JXz8K7zmNGy?=
 =?iso-8859-1?Q?7Yy5Vpe08vS+QL/VezYSOLVopv/rangoe+Amn1WpRcw5yaLuGNQuA6TZdU?=
 =?iso-8859-1?Q?gE9Yc4Xe0cA3Kg90RDbAAK3KI5WnSzcnA5ld50VVgzzMFkxIURBWR9W9Vh?=
 =?iso-8859-1?Q?+7pTR/wJqwftm0o+dK0Maf4crMJQ33w4swkAGLMgSw7hFZYofbPNHETKkB?=
 =?iso-8859-1?Q?fn5y7iA8l/WVGQstVHToYMBmY8Z/9szgV+akRIVjinL8DsMeFGsNRKaxwb?=
 =?iso-8859-1?Q?NrGbfZgsrjkvLhUzX/V449Bwk2O9zwNfic81iBB/VUTT9nEOXUlBTguOTE?=
 =?iso-8859-1?Q?GxZO8Az851UWfC16pp1doEIijgVJpf7FYCSh4dL+CabVSx4ur/Vb0Gi+EG?=
 =?iso-8859-1?Q?J6xdmbHBCBHwYTvnla7Yii34vnpGOc0XWeWc2FJW6R/81KTavdgNeS8XSH?=
 =?iso-8859-1?Q?BbxhP8hxcYTA64HoE6QAWhCrCAF9ZL4cec?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59c9706a-6f7c-43d2-4905-08dcf1b2ab8e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 09:28:06.5947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a8vFIqIIcO/JeYMeI9XYx0f2oNHcbxflot6Nu1kY4QHtjO6daUpQhBJdOqeMhopyQca1AHBa2SOnxO/AuJJkdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4532
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 11:23:36AM -0700, Sean Christopherson wrote:
> When creating a memory map for read, don't request a writable pfn from the
> primary MMU.  While creating read-only mappings can be theoretically slower,
> as they don't play nice with fast GUP due to the need to break CoW before
> mapping the underlying PFN, practically speaking, creating a mapping isn't
> a super hot path, and getting a writable mapping for reading is weird and
> confusing.
> 
> Tested-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  virt/kvm/kvm_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 080740f65061..b845e9252633 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -3122,7 +3122,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
>  	struct kvm_follow_pfn kfp = {
>  		.slot = gfn_to_memslot(vcpu->kvm, gfn),
>  		.gfn = gfn,
> -		.flags = FOLL_WRITE,
> +		.flags = writable ? FOLL_WRITE : 0,
>  		.refcounted_page = &map->pinned_page,
>  		.pin = true,
>  	};
When writable is false, could we set ".pin = false," ?

Also not sure if ".map_writable = NULL" is missing.

