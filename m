Return-Path: <linuxppc-dev+bounces-13353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDE9C1199D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 23:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwS9q66G7z303y;
	Tue, 28 Oct 2025 09:00:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=198.175.65.20 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761602431;
	cv=pass; b=mwkOUdtAy4PtTdyMWqQUbCH2pqN82ss9kAWlSzjawah8PBoUxbOK7F4sC/JfykhNfjn47I6EJfwA5NOP4vF7yHHqR/jP2lMpPsudffsv+osYEdIxkcLVE+6vSSJPyzZzoYA0akYtKOlT43AiF1Nwx/GTJbs39DyUF+fdeE6eLyq8iV85rPa1Mz9QlOHLrvusdbr4BG+bBPsLtMr7tpK/MfOREwj0a/nHxO/XADfxP+kHcb3MoCkKZrGyGCN81cU+HLHw4kK5y7XogOydfZ/c1WuDGjfOvxmeRw6h8/LDe2gLJY4GR+4Orgkb+66ShJyGpEUpCheYRRXI2uTqUA2ixw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761602431; c=relaxed/relaxed;
	bh=3uC/bmY8mj7vvZmMONdr+k3H56Avuh5WuYUlZ9JJfaQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oz+Kqr3VaqzH6dMiS7QEFrJODZQa5kbNevk8HORwc4tiilpM0d7u9gZe5C4x0+fChSnJk2dMEVVYDCnlCV6UUfYqjERvoFVmbHuDT52OfsOkd7j8Oaad+yz6jylHm1Vnk1wEJKq9F7/MayPdDuewJQO4R8HgPM0OWKjIsTGAQXCc8fh5ezTwzGkObZ5lDFfo7xLaJteU//nYIJFrZx+tTlNIGSTbbEAzg9z8UdjdJIlY8UZ2tl44QDYVnOt7gXB6EaJMtAelTUF2hx7A69kiC7maJ0lcStsfO9Up8aiZTHkKMWUsNFvP65FaO0guKd4gTKrb1siP6MdnhYiszeT4kw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HjoPT8+x; dkim-atps=neutral; spf=pass (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HjoPT8+x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=kai.huang@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwS9n1Bslz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 09:00:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761602429; x=1793138429;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3uC/bmY8mj7vvZmMONdr+k3H56Avuh5WuYUlZ9JJfaQ=;
  b=HjoPT8+xqrh2CRpAnfaLbG1z79p2l+BCl66t+/PwXRzYUld76EIAv7VH
   SK1clP119d6LUjoYBlxjPxc7a+dEeOaZxtg/8vs45cBQdM9ldg0lA4KH3
   fIZiRy+kbCDFYOGlK5NoL7rdBup9O5t+99X/c6UfX8lXbx3GRLoH5NB/v
   45mEyTt2XFT+BJSSDOA69po1WSEF6IBoUtxS0bS+OwPKFBVe37ee8+pvk
   OCKCfu90jeccoLSplhVkqqC8fMIFr6Y+UzHfmn67++1jVmRFEvvPkIGtf
   nKHqixq0OC6eEtfemil1goCJzEIT9miBb9MclOUTh1/JYjIUnCtiAbBT4
   A==;
X-CSE-ConnectionGUID: ZXS1ix/FR9OBs+fyEcvCWA==
X-CSE-MsgGUID: yy+/Jqy/QZysYDvY++y9SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63397404"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63397404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:00:23 -0700
X-CSE-ConnectionGUID: Wbn1ClkrQlu1yPC15uQtRA==
X-CSE-MsgGUID: Jku94LviSaquzbZlhwogbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185923435"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 15:00:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:00:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 15:00:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3T+55r6cVpK0BlWn2tOCDvowc6qhha3Qr1aRvY8IDGDIXmGAz2GDxvlYOrP1z7ukKs3vPIY+9HhqcytMyKZ5Rr5lfU48sheyaj55SpJA+Tx5n78O0AQ/jqEVCch2cYbjn/fEiSp1HEodM2ezmqe5tB+BJh8ldjFIZtXToPCmOFROh3V86DllXySkMK3T90IyQscfaLZIBv9O5fk3SmpxEakt1jI/ACSYVU6M+84O16vL79DX3oM2J8kXWE3bpL9Z4KlgXlIqby3dJP/AkNPCJAEgr2HwClhDXJ5wAVeHgLgNy9HoLABihgWw+LVZk7uZ7qrxKft1G9Uin5hgkkSDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3uC/bmY8mj7vvZmMONdr+k3H56Avuh5WuYUlZ9JJfaQ=;
 b=cJro/Uf1nlZP7GmepL36UoJm/dBbzQ8hYq8VA5DVLFkyEqyM6GD1Y+T0MB0yzptn9YP4laOsoYUTEnjhq/q1GgxwmImkwpqGH7rGQgKuCCTWY1W0KR8WkM49ZW2Y0K6ptqmtyHI08H/4UHg+t7OIy1nR04QO3icx0r3PwKMXTTOKC/urtuax3S/ufYuQOZVPqlQVWxk57SsXLnJrFlJ0z+X7RMJvH0Ba8/KmyKfPdIboh6Wi0biGZThEUhudhuBUeHBy42pMVDphqWq5LBFgIUihAyD0WMr87fIPLxIXrLkHbCXRXJyu2mcCjf6LufPBnB3Vs3F89PDIL/rKYgDrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by MN0PR11MB6085.namprd11.prod.outlook.com (2603:10b6:208:3cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 22:00:12 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%6]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 22:00:12 +0000
From: "Huang, Kai" <kai.huang@intel.com>
To: "seanjc@google.com" <seanjc@google.com>
CC: "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "michael.roth@amd.com"
	<michael.roth@amd.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "binbin.wu@linux.intel.com"
	<binbin.wu@linux.intel.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "x86@kernel.org"
	<x86@kernel.org>, "Annapurve, Vishal" <vannapurve@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "maz@kernel.org" <maz@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "Zhao, Yan Y"
	<yan.y.zhao@intel.com>, "frankja@linux.ibm.com" <frankja@linux.ibm.com>,
	"anup@brainfault.org" <anup@brainfault.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "zhaotianrui@loongson.cn" <zhaotianrui@loongson.cn>,
	"ackerleytng@google.com" <ackerleytng@google.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Weiny, Ira" <ira.weiny@intel.com>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"imbrenda@linux.ibm.com" <imbrenda@linux.ibm.com>, "Edgecombe, Rick P"
	<rick.p.edgecombe@intel.com>, "kas@kernel.org" <kas@kernel.org>
Subject: Re: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Topic: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when
 forcing vCPUs out of guest
Thread-Index: AQHcPv2s4f9aAwTczkmNiyIyrEI16LTRHoWAgAVQ6wCAACyqgA==
Date: Mon, 27 Oct 2025 22:00:12 +0000
Message-ID: <741581fad70e5dbfb83c025b8ec481b935aae432.camel@intel.com>
References: <20251017003244.186495-1-seanjc@google.com>
	 <20251017003244.186495-21-seanjc@google.com>
	 <4809644b0ba02d0987ac56f4be7c426d0724cdef.camel@intel.com>
	 <aP_F6tmzomRtdbpU@google.com>
In-Reply-To: <aP_F6tmzomRtdbpU@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|MN0PR11MB6085:EE_
x-ms-office365-filtering-correlation-id: 5a557aa9-7b4d-409e-737f-08de15a43414
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TitXL3VvaHJuQ0hKVTVDMUFQSTVqUjhucVlFeTA4R3MydUFYZHc0OHdTb0Qw?=
 =?utf-8?B?aUFOWXVDRkY1TUxDYmtpZ210RGdSWTliRWVMODBMc3pjL3JjcVRzVlhjcVAv?=
 =?utf-8?B?a1ppalZaS1VjazFoa3N4Y1ZwL2g3bDY4RkZTZXYwSUwyUTQxcG9wNmVuc1VR?=
 =?utf-8?B?VzhjU29OaEtnMFFXVkZRMkJnV29rMzFySExjcm0yUWppWmEzcW10Zk1ldkxI?=
 =?utf-8?B?dUpEdSsvbkVjTkNnb1pQU2RmMVdaNmwzQzhHTHZJbjhiQVE5RllXd1E3NHA1?=
 =?utf-8?B?RFFCMFgweHlpR3NLSW44Mzl3cVBXTm5mcWpqV2liUzB2MWdnRFBrN2NqcVJs?=
 =?utf-8?B?aE1uZHZ0eWhhK1JuSlA2OE5wOWpsbDdLdE1wdVh4cDZTTjBpRUE2RmpnSDhI?=
 =?utf-8?B?ODNKN2JIbDNyM3ZvVmYxQ2J1U0lhVkcvY3YrVXgxTU95TXY1S05MeERHaCtO?=
 =?utf-8?B?Z0lZMVZZcVhMTEUwLzBqeG93cmIrUGtZOElkYXJIdHc0RTk5dXZOSG1NU0Fx?=
 =?utf-8?B?enpkNitFb0dOUmFBUWZEa1dPNVJSV2Z4U2xHODYrTUIxZkRnWE5lQzJEWnpj?=
 =?utf-8?B?QVN5ZFRiOHpkSDJGMFZqL29DdHZmK2w2S3kwdVl0akxUbUJaZWdSclFPbjIz?=
 =?utf-8?B?RkN2YkV0cE5QTmJLZnREQTVxUHBwRGdNbnJqdXZuK3V3dE52T1F0WWpBb1U3?=
 =?utf-8?B?eDBhS01yUUoxdVpPZFBQbVVGc2NNcGM5NWdlcWNkb1hmMG5mWjBLdURRVmNE?=
 =?utf-8?B?Sk9NMnJQais3Mm4vUGV2enM3SFg5UjduL3kycnBSYVYxdDZIV3dmejh6LzJv?=
 =?utf-8?B?cHk1bGtYVEIvcEphdjJlVHRIOFZyVU9OVnl6RW5JR1dPcVFMWCtrRmQ5Vi9O?=
 =?utf-8?B?RGhPdDRwbkNvRjNLb0ZVUlBUaEMvWThJUkpQQzd1MzJ6Zi9ZcjU1eUptekho?=
 =?utf-8?B?SEtzUjBxSENWdTVGVEZCRGtJM3VYbHZEUkxqZGZpY3d5OFREaCt6TjkvdGls?=
 =?utf-8?B?ZnRjSGdjc2t6eVdzcEV6SWtPSzI4aXA3RHlIYUpLT09VNElrS3V2Ty9EQ2xY?=
 =?utf-8?B?TUtBOUM0NkFycUJGT09zeFRkdnBIdlRnTnNHRFhFMmRTdmc1dmdEVy9ncFlq?=
 =?utf-8?B?cG1JeDFnWUQ0YzY5M1VtSEIrYVcvQytJeURLS0s3WW5mV3ZJem5qMjRLMGs2?=
 =?utf-8?B?ZStSUDJZSzliSm5Rb2V5bkpUY0FVOU5xTTJqT2szbGd5VjNlSXV1MzdEQVRU?=
 =?utf-8?B?UnQzK3ZTZzQzSUpkVUZ2RlJNTEJVUnMvYlhMQVBiMTlvM2JzbS9GWFViNlVZ?=
 =?utf-8?B?VjFjVmNUTHQxbzRva3V3NzljSnpBSnIzS2ZSbW5xNTVWRXdXQ2VtL1hkc2RF?=
 =?utf-8?B?S09UYVNlRDkrTmZDOFc4K3hQeUdQdUt4Ymg0blliM2MyM29HS0l6VzVLMnFn?=
 =?utf-8?B?UEJ1ZmZaMGt2aHBDdktOTjNlbkVFR2xDUkpoblRRUXUwaEgvUSt1OG13Ui9O?=
 =?utf-8?B?aXJibndOalZGU0xrNWZqZThUY3dsbDhYK1U0YjZrMm1aTmF0UDNRa1R5cStk?=
 =?utf-8?B?NU5MNmdydkQvVkM2cUNURWxpcWtWeGRXaWxCZ2xSVFRIb1ErbGhrN2EyazQz?=
 =?utf-8?B?SG4zZmJIVk5RTjY1Z1YrV0YwWERjWWlieVFpVDAwWkdjYTN3V1dsWTNXNCtB?=
 =?utf-8?B?UTRLOFNUaE4xQmdXdHJnWWl0MTh2RUorYjVaMHhWb2gvZ3FmYlMrN2FvL1g1?=
 =?utf-8?B?aWxvN2VOYTdDV0tPTkl2eTdRYUo5RTlMR1FLdUoxOGNzQnVwT2hsZlBNc3Va?=
 =?utf-8?B?TU5KNm5DUU50bllmUjVWTzltckoxd2hjVkZJWERyWnJIL2FZcGdVekpISitH?=
 =?utf-8?B?b1I0L0h2Y2RTNnZxbE9jSmFBc1pXR2ltVlUyYXR0QXYveWR6M0JmaTY3V2Nj?=
 =?utf-8?B?cWp4SkozUitNWmhVVmlZUGt6bFZIWFFUamdHWmxNNnNIUVlvQXRSQ1RkdVd5?=
 =?utf-8?B?NUNpdFRWN1lWZnM4ZjhuWGlKQWFPOUhmZnJvYlBXVytScWcyWDQ1QUZWSXFU?=
 =?utf-8?Q?21LNMM?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5525.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d29XeTUzUHlQUm5UVmNFa0FDb1B2bjRrNVl6dTZKc1pXSVV6QytIYnFuYWdy?=
 =?utf-8?B?TkpHRk5tOFVPMnVwOUJCd0RDRWlnWHptN0szOW5HY3JiTmZKdzZSQ2ZNUXJX?=
 =?utf-8?B?SzJLSG82WEJrVElVQmgranh6WG85bEVzTGltWE1EK2tjdFpETUhHMnltVUY5?=
 =?utf-8?B?NWRQaGtWTExjRkhoZzloODcydEVYTi9mSDBPaVVnSUZPdVBQYjJpUytSVWZi?=
 =?utf-8?B?cHNSbkxoRGNvUDd1RkVWUFNYUjdCMUVxMmlJc2EzNVVyY3dOcG5sb3FDbDlq?=
 =?utf-8?B?a2VaNllYT0FKc3NEUWgzUHkvT2pWRU81Si9pZ0JGbXV4WlRWWHF5UTFTNkNS?=
 =?utf-8?B?RzY1aFlSM2hKMVFDSFFKNjNpbTRGcnpBcHQ2bmNzQlUyM1BOQjhHUEVrbFR0?=
 =?utf-8?B?SmNjZC9aRUFra3JkTHlYd0tIVjM3YTVobWlPSWpoY1hiMnFKZ2paSElCS2dx?=
 =?utf-8?B?MUJRdnZLalB2KzZ5UGdRNDZ0Y1EzV050WmxqY1M2OFRhQm1uYVoyUEZBTEpy?=
 =?utf-8?B?YmhRWm1lSDZoNk9ZZFhSKzNNSUc1bzg0aWhTNHZUcmg3ZnRISGwvZ2tIYTJY?=
 =?utf-8?B?bE16OHh2Ym1kUHBROWpzZHZsOVBLaU9xVG8vWEJzZDJCKzllaGxCT1g2SXJC?=
 =?utf-8?B?bk5tN1ZPZ1hSb1draytCQ2QvYktZS2tNbGJzd2Q3K1A2UGlFSlNadzZqbGhk?=
 =?utf-8?B?cmF5WktCZ045RG10bG15RW9WaEZLKzVpOW0yK0wrUFQ5aEtjK3JKOG1jblBl?=
 =?utf-8?B?NU1Fd1lPTXppaVErenpET0RxY0dHc24zL2dvWmxFVGZDVDZNblZDU21CM0h1?=
 =?utf-8?B?ck5zNHROVWJ4WlRDOUxHQWQwY013K0dyZXFpT285VzVac0tiNC9XQjJMVlVH?=
 =?utf-8?B?b2VCN281UmpPa0tobGo4TGxQMlBUVUU5K0V0MDdwMlRlaVhlcVBQR0FxTjdl?=
 =?utf-8?B?dzVCMU1TREFVQW40aXFQUUttZjdpZ2cxdkVOakpoZytRZlZqRjl5dzRINXJV?=
 =?utf-8?B?M01SZzczbWlhcUhGUGY3aHZiNHJGTlZnbUphcXl5OWNySUZncGp4RnB3Nzda?=
 =?utf-8?B?cjgzMGlJdE1aaG9VUGcvSXdQMDNMWCsyRFR6bG51MEViWlN2Ulc2V3lrM2Jo?=
 =?utf-8?B?TG0vTFpZU2p6bEFEWHdTeU81UzFTY1Y3aUR1blZqOXJUU011bENYYlhEeDRP?=
 =?utf-8?B?ckdpTWxzSXQ1R2FIcytPSFhOMkVMQXRxY1R5WVUvM25ta3ZHL3orREJHamIz?=
 =?utf-8?B?bmZNL3dJOWhNaGkrRGlWVHZZZ2FtcXNESHBuR3ltT1VubUl1aXQ0SC9nVU1K?=
 =?utf-8?B?ek5KNkM4bzlPNHlTNWZPYXltWEJjVGNLV0J3QjBSek1PWmc4a2ZvOHFFbWhW?=
 =?utf-8?B?aGtISktkQm1rRnZOdXkwNTFPOTlEWlpkY29sL3RYR3crYTM5V0Q5R1NXYXJ4?=
 =?utf-8?B?MW9yYUlzL0I5eEdIVjB3OEpXVDBjM0k2T0xBU1BkVDBUbG1XaUtxUEFHdms1?=
 =?utf-8?B?RDd3MXZ5cmRaMWNoSDhETlhCem5iTXMrMjRHb1loZ085bnVZYW96WmNpQjkr?=
 =?utf-8?B?NVpxRjV5VncyNGUycXRST3ZWdnBXTy9HTVlIY1JRbXVidUNQb0dvYlRmcGt2?=
 =?utf-8?B?dGppRytsQ2s3aEhUQTJobWg1dTlMVFJrZHhVYlVjeWd1ZmxzZFZXN2xPM3B1?=
 =?utf-8?B?elFCNE1FUVpkc3FwT3VSUEFHaG9Ia0xpWFkxWVcyeXpUek9wNWR0RURDa1Bu?=
 =?utf-8?B?MU1OZ0xqZWRHeG85bWgxcHRrajRKYThCTHE0alNoajFNUGNOOGNrTmRtNERQ?=
 =?utf-8?B?L1M2RnJyUnV4QU1FaXRadEkweHlsNkJWRmw1V0hhU3h5bXdkbE40Q0wvVWR0?=
 =?utf-8?B?SnpOUDJkaWVlMTNEeXNIRlF4OWxzak9sY1pSZ1hoY2pUMHR1ZnJGYnBURElI?=
 =?utf-8?B?ZVZFOGxhSjhHeVdqcitkT0M1T2tiSTRVZ2g4bmxBQVhpS0R6Q2xRK1FnYlBS?=
 =?utf-8?B?SDhHRXlDQzhFNlluR0VXS1F4VUNnNEFLMitBWHllK3d4aU5JNTNDNzNYd3V6?=
 =?utf-8?B?Lyt1cWYraFlaQndZOWVGcVdCTnEzVmFRQndobEQ4WFZWL0k0SWg4OUlUSDhv?=
 =?utf-8?Q?wyisifJcIlwE7EB1++UN3z9Cj?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <206B24455B9A574986EC76A18378A3E3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
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
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a557aa9-7b4d-409e-737f-08de15a43414
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 22:00:12.5487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FvqUgkYA1f97kkdjsMmBF+x6XmiLVLF7TcE6GY4kT/XvGalpnapq0ZbBUccn3CmAQis4c8UiVbK/QohVNJ//zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6085
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

T24gTW9uLCAyMDI1LTEwLTI3IGF0IDEyOjIwIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBPbiBGcmksIE9jdCAyNCwgMjAyNSwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+IE9uIFRo
dSwgMjAyNS0xMC0xNiBhdCAxNzozMiAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToN
Cj4gPiA+IEFkZCBhIG1hY3JvIHRvIGhhbmRsZSBraWNraW5nIHZDUFVzIG91dCBvZiB0aGUgZ3Vl
c3QgYW5kIHJldHJ5aW5nDQo+ID4gPiBTRUFNQ0FMTHMgb24gLUVCVVNZIGluc3RlYWQgb2YgcHJv
dmlkaW5nIHNtYWxsIGhlbHBlcnMgdG8gYmUgdXNlZCBieSBlYWNoDQo+ID4gPiBTRUFNQ0FMTC4g
IFdyYXBwaW5nIHRoZSBTRUFNQ0FMTHMgaW4gYSBtYWNybyBtYWtlcyBpdCBhIGxpdHRsZSBoYXJk
ZXIgdG8NCj4gPiA+IHRlYXNlIG91dCB3aGljaCBTRUFNQ0FMTCBpcyBiZWluZyBtYWRlLCBidXQg
c2lnbmlmaWNhbnRseSByZWR1Y2VzIHRoZQ0KPiA+ID4gYW1vdW50IG9mIGNvcHkrcGFzdGUgY29k
ZSBhbmQgbWFrZXMgaXQgYWxsIGJ1dCBpbXBvc3NpYmxlIHRvIGxlYXZlIGFuDQo+ID4gPiBlbGV2
YXRlZCB3YWl0X2Zvcl9zZXB0X3phcC4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU2Vh
biBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBh
cmNoL3g4Ni9rdm0vdm14L3RkeC5jIHwgNzIgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDQ5
IGRlbGV0aW9ucygtKQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3Zt
eC90ZHguYyBiL2FyY2gveDg2L2t2bS92bXgvdGR4LmMNCj4gPiA+IGluZGV4IGY2NzgyYjBmZmE5
OC4uMmUyZGFiODljOThmIDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC94ODYva3ZtL3ZteC90ZHgu
Yw0KPiA+ID4gKysrIGIvYXJjaC94ODYva3ZtL3ZteC90ZHguYw0KPiA+ID4gQEAgLTI5NCwyNSAr
Mjk0LDI0IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0ZHhfZGlzYXNzb2NpYXRlX3ZwKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkNCj4gPiA+ICAJdmNwdS0+Y3B1ID0gLTE7DQo+ID4gPiAgfQ0KPiA+ID4g
IA0KPiA+ID4gLXN0YXRpYyB2b2lkIHRkeF9ub192Y3B1c19lbnRlcl9zdGFydChzdHJ1Y3Qga3Zt
ICprdm0pDQo+ID4gPiAtew0KPiA+ID4gLQlzdHJ1Y3Qga3ZtX3RkeCAqa3ZtX3RkeCA9IHRvX2t2
bV90ZHgoa3ZtKTsNCj4gPiA+IC0NCj4gPiA+IC0JbG9ja2RlcF9hc3NlcnRfaGVsZF93cml0ZSgm
a3ZtLT5tbXVfbG9jayk7DQo+ID4gPiAtDQo+ID4gPiAtCVdSSVRFX09OQ0Uoa3ZtX3RkeC0+d2Fp
dF9mb3Jfc2VwdF96YXAsIHRydWUpOw0KPiA+ID4gLQ0KPiA+ID4gLQlrdm1fbWFrZV9hbGxfY3B1
c19yZXF1ZXN0KGt2bSwgS1ZNX1JFUV9PVVRTSURFX0dVRVNUX01PREUpOw0KPiA+ID4gLX0NCj4g
PiA+IC0NCj4gPiA+IC1zdGF0aWMgdm9pZCB0ZHhfbm9fdmNwdXNfZW50ZXJfc3RvcChzdHJ1Y3Qg
a3ZtICprdm0pDQo+ID4gPiAtew0KPiA+ID4gLQlzdHJ1Y3Qga3ZtX3RkeCAqa3ZtX3RkeCA9IHRv
X2t2bV90ZHgoa3ZtKTsNCj4gPiA+IC0NCj4gPiA+IC0JbG9ja2RlcF9hc3NlcnRfaGVsZF93cml0
ZSgma3ZtLT5tbXVfbG9jayk7DQo+ID4gPiAtDQo+ID4gPiAtCVdSSVRFX09OQ0Uoa3ZtX3RkeC0+
d2FpdF9mb3Jfc2VwdF96YXAsIGZhbHNlKTsNCj4gPiA+IC19DQo+ID4gPiArI2RlZmluZSB0ZGhf
ZG9fbm9fdmNwdXModGRoX2Z1bmMsIGt2bSwgYXJncy4uLikJCQkJCVwNCj4gPiA+ICsoewkJCQkJ
CQkJCQlcDQo+ID4gPiArCXN0cnVjdCBrdm1fdGR4ICpfX2t2bV90ZHggPSB0b19rdm1fdGR4KGt2
bSk7CQkJCVwNCj4gPiA+ICsJdTY0IF9fZXJyOwkJCQkJCQkJXA0KPiA+ID4gKwkJCQkJCQkJCQlc
DQo+ID4gPiArCWxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUoJmt2bS0+bW11X2xvY2spOwkJCQlc
DQo+ID4gPiArCQkJCQkJCQkJCVwNCj4gPiA+ICsJX19lcnIgPSB0ZGhfZnVuYyhhcmdzKTsJCQkJ
CQkJXA0KPiA+ID4gKwlpZiAodW5saWtlbHkodGR4X29wZXJhbmRfYnVzeShfX2VycikpKSB7CQkJ
CVwNCj4gPiA+ICsJCVdSSVRFX09OQ0UoX19rdm1fdGR4LT53YWl0X2Zvcl9zZXB0X3phcCwgdHJ1
ZSk7CQkJXA0KPiA+ID4gKwkJa3ZtX21ha2VfYWxsX2NwdXNfcmVxdWVzdChrdm0sIEtWTV9SRVFf
T1VUU0lERV9HVUVTVF9NT0RFKTsJXA0KPiA+ID4gKwkJCQkJCQkJCQlcDQo+ID4gPiArCQlfX2Vy
ciA9IHRkaF9mdW5jKGFyZ3MpOwkJCQkJCVwNCj4gPiA+ICsJCQkJCQkJCQkJXA0KPiA+ID4gKwkJ
V1JJVEVfT05DRShfX2t2bV90ZHgtPndhaXRfZm9yX3NlcHRfemFwLCBmYWxzZSk7CQlcDQo+ID4g
PiArCX0JCQkJCQkJCQlcDQo+ID4gPiArCV9fZXJyOwkJCQkJCQkJCVwNCj4gPiA+ICt9KQ0KPiA+
IA0KPiA+IFRoZSBjb21tZW50IHdoaWNoIHNheXMgInRoZSBzZWNvbmQgcmV0cnkgc2hvdWxkIHN1
Y2NlZWQiIGlzIGxvc3QsIGNvdWxkIHdlDQo+ID4gYWRkIGl0IHRvIHRkaF9kb19ub192Y3B1cygp
Pw0KPiANCj4gKzEsIGRlZmluaXRlbHkgbmVlZHMgYSBjb21tZW50Lg0KPiANCj4gLyoNCj4gICog
RXhlY3V0ZSBhIFNFQU1DQUxMIHJlbGF0ZWQgdG8gcmVtb3ZpbmcvYmxvY2tpbmcgUy1FUFQgZW50
cmllcywgd2l0aCBhIHNpbmdsZQ0KPiAgKiByZXRyeSAoaWYgbmVjZXNzYXJ5KSBhZnRlciBmb3Jj
aW5nIHZDUFVzIHRvIGV4aXQgYW5kIHdhaXQgZm9yIHRoZSBvcGVyYXRpb24NCj4gICogdG8gY29t
cGxldGUuICBBbGwgZmxvd3MgdGhhdCByZW1vdmUvYmxvY2sgUy1FUFQgZW50cmllcyBydW4gd2l0
aCBtbXVfbG9jaw0KPiAgKiBoZWxkIGZvciB3cml0ZSwgaS5lLiBhcmUgbXV0dWFsbHkgZXhsdXNp
dmUgd2l0aCBlYWNoIG90aGVyLCBidXQgdGhleSBhcmVuJ3QNCj4gICogbXV0dWFsbHkgZXhjbHVz
aXZlIHdpdGggdkNQVXMgcnVubmluZyAoYmVjYXVzZSB0aGF0IHdvdWxkIGJlIG92ZXJraWxsKSwg
YW5kDQo+ICAqIHNvIGNhbiBmYWlsIHdpdGggIm9wZXJhbmQgYnVzeSIgaWYgYSB2Q1BVIGFjcXVp
cmVzIGEgcmVxdWlyZWQgbG9jayBpbiB0aGUNCj4gICogVERYLU1vZHVsZS4NCg0KTEdUTS4gIE5p
dDogaXMgaXQgbW9yZSBjbGVhciB0byBqdXN0IHNheSB0aGV5IGNhbiBjb250ZW5kIHdpdGggVERY
IGd1ZXN0Pw0KDQogICBBbGwgZmxvd3MgdGhhdCAuLi4sIGJ1dCB0aGV5IGFyZW4ndCBtdXR1YWxs
eSBleGNsdXNpdmUgd2l0aCB2Q1BVcw0KICAgcnVubmluZywgaS5lLiwgdGhleSBjYW4gYWxzbyBj
b250ZW5kIHdpdGggVERDQUxMIGZyb20gZ3Vlc3QgYW5kIGZhaWwgd2l0aA0KICAgIm9wZXJhbmQg
YnVzeSIuDQoNCj4gICoNCj4gICogTm90ZSwgdGhlIHJldHJ5IGlzIGd1YXJhbnRlZWQgdG8gc3Vj
Y2VlZCwgYWJzZW50IEtWTSBhbmQvb3IgVERYLU1vZHVsZSBidWdzLg0KPiAgKi8NCj4gIA0KPiA+
IEFsc28sIHBlcmhhcHMgd2UgY2FuIGp1c3QgVERYX0JVR19PTigpIGluc2lkZSB0ZGhfZG9fbm9f
dmNwdXMoKSB3aGVuIHRoZQ0KPiA+IHNlY29uZCBjYWxsIG9mIHRkaF9mdW5jKCkgZmFpbHM/DQo+
IA0KPiBIZWgsIHRoaXMgYWxzbyBjYXVnaHQgbXkgZXllIHdoZW4gdHlwaW5nIHVwIHRoZSBjb21t
ZW50LiAgVW5mb3J0dW5hdGVseSwgSSBkb24ndA0KPiB0aGluayBpdCdzIHdvcnRoIGRvaW5nIHRo
ZSBURFhfQlVHX09OKCkgaW5zaWRlIHRoZSBtYWNybyBhcyB0aGF0IHdvdWxkIHJlcXVpcmUNCj4g
cGx1bWJpbmcgaW4gdGhlIFVQUEVSQ0FTRSBuYW1lLCBhbmQgZG9lc24ndCB3b3JrIHdlbGwgd2l0
aCB0aGUgdmFyaWFkaWMgYXJndW1lbnRzLA0KPiBlLmcuIFRSQUNLIHdhbnRzIFREWF9CVUdfT04o
KSwgYnV0IFJFTU9WRSBhbmQgQkxPQ0sgd2FudCBURFhfQlVHX09OXzIoKS4NCj4gDQo+IEdpdmVu
IHRoYXQgUkVNT1ZFIGFuZCBCTE9DSyBuZWVkIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUsIGdl
dHRpbmcgdGhlIFREWF9CVUdfT04oKQ0KPiBjYWxsIGludG8gdGhlIG1hY3JvIHdvdWxkbid0IGJ1
eSB0aGF0IG11Y2guDQoNCkFncmVlZC4gIFNlZW1zIGl0IHNvdW5kcyBuaWNlIGluIGNvbmNlcHQg
YnV0IG5vdCBpbiBwcmFjdGljZS4gOi0pDQo=

