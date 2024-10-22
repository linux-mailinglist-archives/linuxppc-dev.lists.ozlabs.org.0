Return-Path: <linuxppc-dev+bounces-2477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BBC9A9623
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 04:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXbSK1RW4z2yDM;
	Tue, 22 Oct 2024 13:18:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729563489;
	cv=fail; b=NRA+BDJKQq/EXcyqhN+fqk4qSulV+GNuamrR7FMMBI399HIZF+WO1mqrGsFS1Pqt76TBbGy6BwR2BYINBtgCUOWWFoStFB5oDoPjBYcgYCh9+bqv/PrCx/MRGVxlRhl+iECShpx3V5dj+Ml21YODj0SWAzvQjeqSgWTw90FbiCekaVlL+i8cadeeLlgFQ7KmX6qkQaZfsp7YNUWzNCvX59f4tAeWwI6Tlmysy9oPDLPqlVcjdVUp9M2Rzs2b26hwi+xCvBm3jgRxoyN9JIScOJJRDnsYQueWSl4xgUUwAbd05s5NqaqDtNtq2tvYNtWTle5r1PMh4E3vCZxV4/9f1g==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729563489; c=relaxed/relaxed;
	bh=r5riHM0wqGsKYuycMjcMkVDeU+VdnlB3XjyQ9kQ6j3Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QEWIZ+MQNAVEb+OZLJAj/CtzsPHZdCBLf9D+iGeR+8YXA9Ix1UDR1KraCVXlvh31nUG7rZtL2hZp+w1ns8+IRP28Uti0DhMUVmEhNLXhw9zdSvGF1YK3MCAHAbFMIT8JxBhk4jxhqOiBWWztQ8MfNbsO7ncWx4dkYxHyFBjjtjN/2Yz/gmZ1rvh+hk8DLwlEMQriifBU3GojuvmOwteqaSYKHwcL1Z+IEQFynKsk90mW/2gi+O4AVzfIUW6SAqcAwC5GJe2wSHv0r2NqX/0KFHatNfxx/NJTOiLYV66AJ03EZ+BblsMpwxjCAzWTdXu27dDWHiCZK4Frpoku0KF5Rg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB2lWCF5; dkim-atps=neutral; spf=pass (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EB2lWCF5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=yan.y.zhao@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXbSH5Zrfz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 13:18:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729563488; x=1761099488;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=cxXppXtGAKODj/Dz5lVFdrUWwNnxTqAF2wno/AHcOhs=;
  b=EB2lWCF5MTyuXaaxk+5Osjssnd3g8fd6ygC0Hr1LrwGwT2gH9Kilw0Z8
   gNVS6XsPMbkRjy1pp3UvrmuO9UyBwKVNgBd04775LguZEpYaYTxo+hlY/
   jEuvQ+XC3EB0sN5iK+NhJzLz9xzv64tEDIT+V7gwcSDtSitHoFVYKMKFS
   SafR529LXcbLYMoqOYgqj+UC/o8ASWuyifRfv2XKR/F6Z9YVpWSDVEms+
   Dja1kM6lch2owaeqBs9tlMHGGxi8f50RaXgMertbo1Bz7+yul0CwKd0G6
   TEqfnPhDKi2SVgCba5jvxZovx+nZ07c7Vkq113XVPAVWD3LnBeGMJyCf5
   Q==;
X-CSE-ConnectionGUID: xzwznN7ZSdypYbDGZei0+A==
X-CSE-MsgGUID: BWVVqlq0QvSBEMEE/uDCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29187528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29187528"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 19:18:03 -0700
X-CSE-ConnectionGUID: 8Bm0wcxmTWOYXKLCwKQNlg==
X-CSE-MsgGUID: ZXwfsRY+S2SKTe1GOXD1zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; 
   d="scan'208";a="84316920"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Oct 2024 19:17:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 19:17:42 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 19:17:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 19:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIgwSSfJKuhfXzYZDJikaGPbrxZSWs+8zqi7VkNetU0Qay07yXBsnANfPLNIRTwB4/KT4rK3r3Hh4egMYfVr3vDuvVil2y8k872dqUJNz4eYfWed8CM6cZKqXuF+8wCeAqH17YHBZUb/fsUPgnSdq/UUi/CdECX/Qs1UrwgzbFlTSSXHNkqvuCGnmSnZoAJ259aPItxhbmQco/yOBFWpLIl+ljO7NS7Zpv3636txSrypUnVlrrVAFMvLTJNGrEWLEtma+e3cbiBSU+3hc11qwh9BYqc5qmgCfX11jH8+C+iMLGviK0+LcyotFPVexMy+B44gl/bWZ9aezRmDcZeLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WUfe6xPA67zy94ksi3gX5T07DJSxAjjDB/zLQYMCeE=;
 b=MTdOU4/lph3rH9aCLe6xUkVJ3OANtLwWaPbM5jDeF3Ml2Pss9tVPuj/VF5uIhpEh8J/DbAIqpUwwYe8svxgkq9Qjyajc7JoR4lzEzgNx6WwvxePv8bbWP27WNoa7CaeP7ECbZ1MNd1SnJj2E/GDgFZGCAa/S8bazXJioTOKgx4L8mIvIGdU/NlXt4Lwa5DMF3svncEuyamGhYN4TeEIop46ktYCvh7TZk88ghRjp92xZP1+bfFWI8F7zIUaFQG0Qn2hvOiYo7FgmjpqjhoiNwYjyZGgG5CqCM6Vum25F76HBS3T+f9XZh+Qn2h3hdmdwtXzuxCJk7t/OKBU6kNs+SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) by
 SJ0PR11MB6741.namprd11.prod.outlook.com (2603:10b6:a03:47a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.23; Tue, 22 Oct
 2024 02:17:39 +0000
Received: from DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca]) by DS7PR11MB5966.namprd11.prod.outlook.com
 ([fe80::e971:d8f4:66c4:12ca%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 02:17:39 +0000
Date: Tue, 22 Oct 2024 10:15:14 +0800
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
Subject: Re: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
Message-ID: <ZxcKsmvPkKJgsp2l@yzhao56-desk.sh.intel.com>
Reply-To: Yan Zhao <yan.y.zhao@intel.com>
References: <20241010182427.1434605-1-seanjc@google.com>
 <20241010182427.1434605-52-seanjc@google.com>
 <ZxYrYe/WN8XoB+fI@yzhao56-desk.sh.intel.com>
 <ZxakJr_jWkU-Y54e@google.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZxakJr_jWkU-Y54e@google.com>
X-ClientProxiedBy: SG2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:3:18::31) To DS7PR11MB5966.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS7PR11MB5966:EE_|SJ0PR11MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f69f8a1-de78-41da-9118-08dcf23fb3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YYU3xXtJ/axg02ntt+lgXaUZzT7DnWKwNDXi1XmzODAlH4Q1RMBTfUu3KW?=
 =?iso-8859-1?Q?nvqITIVdOc5ugpPEpydofWtNhZucNzImnF/UFuOgYL3AC/NLlqguydMgMG?=
 =?iso-8859-1?Q?cnZyN7or2r23WyTZYY0H0i47pycec7BUbxEqNrosGK+4WnrIoDpEShuMkO?=
 =?iso-8859-1?Q?+QZdHKoXcck55UZuHtQ+6Pxd8K0FNrSQ8q/Z5tUE/YOoDfQtqkf0nHrUFG?=
 =?iso-8859-1?Q?Uokp3j9nwZM3Dc4QeCUxhX4o9R4FtVve70Yg0B0LaWkeVLQY4ibzpD12AV?=
 =?iso-8859-1?Q?+y4awil5ZczImdkd00kphWrXKY9btimib/DVEq0YXyNJTv4ELu6Oe8SO9c?=
 =?iso-8859-1?Q?qOsGO0rIiWaGdN6JLd0ecNkYDkhnQliOqvIgc4xL9wH+luEuDdSATkI63B?=
 =?iso-8859-1?Q?ppspvI4o7EVKgPPpxkz5eW2oFIraLxnnPJqexw//jVi9P0xQiL48U70Bo3?=
 =?iso-8859-1?Q?gf3Mxm/jXLTMDkbz5VFDzH4Tsx4OuPh0fvkzt+3PdsQSDBzTNicJ3DPxQM?=
 =?iso-8859-1?Q?fp3Ooz6K1SdHkxaZr4qKyS8sO7p4v0RZCo6nyTv49qrm2xASqMTw8SBwNN?=
 =?iso-8859-1?Q?loPHBpmaMnYDwjVOiWVOfXimQQEuVuySHisJUfBrj4ZGTN2w/e6uJN2dpE?=
 =?iso-8859-1?Q?Hx6cuu43onGlwsgA8IqaDFYbFMkxyNiEUDOpZhSetTJxaFkA0ZZjMjtDOt?=
 =?iso-8859-1?Q?K+1EQhSuRZkR7NOHrTQ502YNdDh/SI8tZSTJ8vqB331TcxH8WuBe43Z4fX?=
 =?iso-8859-1?Q?vbcJGDd/2avQLd/mbwqLaEf1BfrIPgGZG3dpXXWJzuENdQ0u4oNCZduv3J?=
 =?iso-8859-1?Q?IrlxWHmIyidF9l5nOCj3R8y/nahkkHFvNT42wmmUNhx6y5+5ufbrQqOXgp?=
 =?iso-8859-1?Q?N7DwDescBnbpskMsn4f3GsyuNsc53WdMm5+wr983Q2c+ohuef5+9ZmheE8?=
 =?iso-8859-1?Q?4Jy4PxoAuLrykEGL+6SDyl/U+HJpxP8irSnS5TDV3+ijTcZhxTsEVqHJDn?=
 =?iso-8859-1?Q?Y1m8NWXmFODPvEhI4inow+te6YzAjiZZLub1KcoeNclM0OXfEX/qDuW02J?=
 =?iso-8859-1?Q?Z7ML8+eqcFfX5RCC6Jn7dpZQFmqf96TmtuK2OGIiralrhAjQJcQS0cXewH?=
 =?iso-8859-1?Q?oTvUmGNVmdzsbkRKaxTQr8TEKyFdqEmnuMZxW6stVvBO97rrvmbnrmbkHg?=
 =?iso-8859-1?Q?5SII6Sz6SNnMYeuQGaDsqtr3lTdypWMlPxFNsvhxJhTej/kIFf59qo3qpx?=
 =?iso-8859-1?Q?ow4kr0MHVeLXp/nsE5d9VPohHSJt9AAouBn06myzW8VWRQY/tyltimH3Y4?=
 =?iso-8859-1?Q?S9HUJ6MfCn3UwmQzJ/oxcPsoI3y9GTgzwPyNUMHERNrdNdvsBVm36P1MUC?=
 =?iso-8859-1?Q?Pq8yxQ1vWb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB5966.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6DLUB00Yr6T0mmhI/A4MInP/S2icT36tbm2xcSzOd8iS2ZzWES7KOTckCa?=
 =?iso-8859-1?Q?1A/dQa2fKcPK4Zo2zBpZjsnWRjszpstu+rOYDHWwA5dIfIdRbS40TkTKox?=
 =?iso-8859-1?Q?5SrmqwRhlXUfK5ZlSEwdVTCYD4ebUqDehJlKyQdXMmPddhuSHaJkICDSZ9?=
 =?iso-8859-1?Q?5Hp5vwoHqkK94Dwg0mLwxE+DEYzrGQl/Z+i8RN9DCMCoPsegKd1IOEeCto?=
 =?iso-8859-1?Q?VE6Cl/YsOp56Tq4GoQivjnxT2IzREcLwHvU26ebiZBGfbF+BVjNfLiTJMO?=
 =?iso-8859-1?Q?jXEyNG0MdUFPMsLGp1Q+KF7WdrQvQh/Qso4Jjit5t/TDvS9TPQjQYZWEDA?=
 =?iso-8859-1?Q?poazA/5r2XFoUdVuUiX5hh+lPc+gsrzQteJb9fr+vthGw7dmpa+Y4T/vkz?=
 =?iso-8859-1?Q?tYC1xpoKNRG2ItbrY0kuBzbnhmBRIllfYlN31daSDscZyK7jQWj31WdJkL?=
 =?iso-8859-1?Q?F8FYJODQmMt9/wNiFpRmgZUMNsP9hOzhHHcjJZzqCS7LrU3OE518toTadn?=
 =?iso-8859-1?Q?3SKMsaGGAZrqbw2kh3uUyUc/z1g6BeYauf4p4UscQMD89ktX+iXYwjpbOp?=
 =?iso-8859-1?Q?DEMR0bRPxw6ak93MLP9mvpVSfOLLiGD6PwB60tH/w07VBBBN4J4hGo3dC6?=
 =?iso-8859-1?Q?QKJiWhC69CtR1H+1XofbPOb8mFD6Kv7gyPtPSkqA1G6OuIGAfy4j9XxT6W?=
 =?iso-8859-1?Q?lgeJYeCr+BN3vbKzK/1Eftk6nvO9GhH8vT+YjLfz+Pk8PuC8iw+KsvueDC?=
 =?iso-8859-1?Q?GuVSMfOkR70RVwEimmdPWz7xAFKGaeQB1rzp+1ZBVQdDR+Pym/+nNbpBcl?=
 =?iso-8859-1?Q?6lY7fEibKF5HI6TDSLKvJWZC/iGECHDVciILJmNyRXt/u7rTtOukBDsZCi?=
 =?iso-8859-1?Q?16qm6F4B/k8Fi4yHz7ULW/Q/geJqEGTImL4+nl8FIpsAvlMfW6zt365pZy?=
 =?iso-8859-1?Q?qzlWS1Vk60sGlIdDJ/nKrQhCS3NTdadQHX19n6volOjdd3rsbVowvWIWDi?=
 =?iso-8859-1?Q?rkKhqluUmiJnvEbowDPoWrKr0H76HPKy5YsjJaTYg6vcdvH+FZgBDxZsJU?=
 =?iso-8859-1?Q?gcQNud6fPwEohjE7BiVgexb3pGTRUFCBbddTcLUIOPLlLRpBKMRWp+2ltw?=
 =?iso-8859-1?Q?Sr1Mp+mqSiLukplTsMtK6W7LdtZD4ZpdAslxaaLHJHvwrRc4uPdFOjz4Og?=
 =?iso-8859-1?Q?vd4PXCPdq8P/JQgfAX3v4Chy1L20dW0LyNYtPlwUqi961cUmkb1GZ573G9?=
 =?iso-8859-1?Q?g2E0fdvdIZnzjvCyTtykwa1PSaXW3qGggwkmgHxIqAW8Nmacf0pDKKKYCf?=
 =?iso-8859-1?Q?gMIDIzdqtxHAA1VMOeCK8H+M8MscG/5GakKCJplNm1dJFLO6yg4+Mqur14?=
 =?iso-8859-1?Q?hePGjawAoclqLLH9tMd7g8X3t5y4cjDQ2knaaXt8ZdULcugwVeYarhdtmA?=
 =?iso-8859-1?Q?p1QtI4BafPAiG0sKCh67xOyZNoO1Csh+lLuiN6rHVqTFN1uj1rB+8SfafA?=
 =?iso-8859-1?Q?o02SKbq2U9zToroS5efY6R5OVcAYdh/qVti3ilEFcJ1Lc4v68irfJ56owB?=
 =?iso-8859-1?Q?6XITIgrTFDxQvgjjSlROnozx+VFOiE+I7UFPRg9OmKB1842GHCi5uuSgEO?=
 =?iso-8859-1?Q?9kHDG6rUVxFJ8+HEXxCUhJjzeTRpfsX0ZV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f69f8a1-de78-41da-9118-08dcf23fb3f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB5966.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 02:17:39.6889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWOGmujqE9pfftZiM3RptWupsn9Hkra9RXbmT0ABJCFzCj4Efo1juf86ymRU33+Svpw78BOteFP95/JhnjgZ5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6741
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 21, 2024 at 11:57:42AM -0700, Sean Christopherson wrote:
> On Mon, Oct 21, 2024, Yan Zhao wrote:
> > On Thu, Oct 10, 2024 at 11:23:53AM -0700, Sean Christopherson wrote:
> > > Use __kvm_faultin_page() get the APIC access page so that KVM can
> > > precisely release the refcounted page, i.e. to remove yet another user
> > > of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
> > > page fault, the semantics are effectively the same; KVM just happens to
> > > be mapping the pfn into a VMCS field instead of a secondary MMU.
> > > 
> > > Tested-by: Alex Bennée <alex.bennee@linaro.org>
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> 
> ...
> 
> > > @@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
> > >  		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
> > >  
> > >  	/*
> > > -	 * Do not pin apic access page in memory, the MMU notifier
> > > -	 * will call us again if it is migrated or swapped out.
> > > +	 * Do not pin the APIC access page in memory so that it can be freely
> > > +	 * migrated, the MMU notifier will call us again if it is migrated or
> > > +	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
> > > +	 * should always point at a refcounted page (if the pfn is valid).
> > >  	 */
> > > -	kvm_release_pfn_clean(pfn);
> > > +	if (!WARN_ON_ONCE(!refcounted_page))
> > > +		kvm_release_page_clean(refcounted_page);
> > Why it's not
> > if (!WARN_ON_ONCE(!refcounted_page)) {
> > 	if (writable)
> > 		kvm_release_page_dirty(refcounted_page)
> > 	else
> > 		kvm_release_page_clean(refcounted_page)
> > }
> > 
> > or simply not pass "writable" to __kvm_faultin_pfn() as we know the slot is
> > not read-only and then set dirty ?
> 
> __kvm_faultin_pfn() requires a non-NULL @writable.  The intent is to help ensure
Ah, right.

> the caller is actually checking whether a readable vs. writable mapping was
> acquired.  For cases that explicitly pass FOLL_WRITE, it's awkward, but those
> should be few and far between.
Yes, a little weird though nothing wrong in this case by passing "writable"
without checking its value back :)

> 
> > if (!WARN_ON_ONCE(!refcounted_page))
> > 	kvm_release_page_dirty(refcounted_page)
> 
> Ya, this is probably more correct?  Though I would strongly prefer to make any
> change in behavior on top of this series.  The use of kvm_release_page_clean()
> was added by commit 878940b33d76 ("KVM: VMX: Retry APIC-access page reload if
> invalidation is in-progress"), and I suspect the only reason it added the
> kvm_set_page_accessed() call is because there was no "unused" variant.  I.e. there
> was no concious decision to set Accessed but not Dirty.
Thanks for the explanation.
I asked that because I noticed that the policies for setting Accessed or Dirty
for the APIC access page are not aligned between L1 (only Accessed) and L2 (Dirty).

