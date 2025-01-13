Return-Path: <linuxppc-dev+bounces-5105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B24A0AD48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 03:10:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWbMf4FBqz30QJ;
	Mon, 13 Jan 2025 13:10:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736734254;
	cv=fail; b=DVlAJAGlhYyNHixZCFHDeEMwi54ODya7v2+N8/QvUDrtW1JvHkIVRRSDlbOL4XSSd1bSZbpUrM7AmE1fg6Nwg+PdXAzvC4gn2G1cSiMhPSkTas80yXF81atBFqY0V9+OkD4HROjZL5HcXoY9rXkzdqaIaEL5gg5OYC1AxjOFfAfOTVO9Hu2su0pdg1mw0Hg/fAdNvkHNR9CZUVWf2HwqvUyih3JthjfSphCNdhitbCr3vdSaDmypIUPMaf1fJQEiA0N+wYmIB3syG0CyHW608IThb8mH6pFgsXnMqjUxUg6Y+5KpEpgQb81JUkYPuBF88abiSqEekEx0N3nNni28uA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736734254; c=relaxed/relaxed;
	bh=+fLOt2fIG+loidnVM152IklkXHiBdttWfK8V5+Fvnbc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DfXQ+YrZeO5NDaOQmN1+NKxoPXjsSdeKLfuBjcy80OGtVuR5OfEfUdC2pQiFkAg9OENCqlJcHUhVGcVQjnA2PvgPKLCmU6SBEHR/P6OlhtTUL/Kb9HXvJzHBZFrTedsHnKr57ZMkw4okvti/w9HRUHyLROufPfI+JKFBX7YXDno2qhHIFRpHEaJrm8sPRefsXAj+5sIhoOAXMGuClQ/ViqNHdtYnJCIgyra9Qo7dVn7tYKkaSIPiPaImydj3TVWLslQ209h0tV7cTfQZrcpKJy81B88T0fHaBUyEmm3ICLl88+rIMmHQwj7GLnuQvtlYt5tKCXg47+2m3KGGgjwmIQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePysVL/k; dkim-atps=neutral; spf=pass (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=chao.gao@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ePysVL/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.8; helo=mgamail.intel.com; envelope-from=chao.gao@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Mon, 13 Jan 2025 13:10:52 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWbMc0Xf8z30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 13:10:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736734252; x=1768270252;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=44qVJ8JQQunPl/5DJY6lMrOqR1rHAF9jJeyesp7f8Ng=;
  b=ePysVL/k2vHnjWuY+Z8JOumYo2G69I0GczsY3Yd00kyN3w0DOwczaeCF
   i0b81QnmVGUYz6FvJwlic8KXICyq3pihZbJBXgONacq4WJ0NhI+sy0lbU
   oYw0dGv7l/O+hac3FXFLbjBNBxvnAVZdvudawGXZepK/uFkI8/QhpR/5l
   QHLmznplSNjF4PvTarIsWwXzIzoL/4e+79FFARjtaa5PVIEpLdNM07Kuw
   LVeprmT3Z7o1x8ls/mWo7D5S/3HoZa8xIn9kHSChX5v+QMnKFqU5DTzDD
   qG3+JtmrG5B2+biAREp3CIZrHUxOOoEugTkooMkHltueY6x41rp61rIoM
   A==;
X-CSE-ConnectionGUID: YeUpwwQNS02fMCxGm5XzSw==
X-CSE-MsgGUID: 96CuBJypRZ2J1AELjM4iUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="54522349"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="54522349"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 18:09:41 -0800
X-CSE-ConnectionGUID: d8MipuyXTcKtRhl1qTs8BQ==
X-CSE-MsgGUID: Ap2StcoKR7ywckdRsdRHGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="135141764"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2025 18:09:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 18:09:40 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 18:09:40 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 18:09:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuSYMmfFqXazjTXHv0/hJaXeRvTG4hpGsItDip1xpjwD7NJLN5YKtTwlgf7JWX4oTgzfNh1k7bjzHXKuc1hVa/fQZ9eRuJTHLyH5QowXc46xlSce4ppxv/oZAceLBBxbO2+Qi+6LjsZfa4J7z0JmL18BNprWtmPy8KKmqHRWFIuRUgfK7R5uClqLLZyGRFp11K/9KfTZD/3tYdzyLMgndCoKy+r1zsV0DqsHdbz19I/Rqd/TbHQf9yQycYI7GnunTjGbM8rzUTMpuYSg3B6PXSC7qCv82iMu2rUCADmrDiHK2q3ZneZBJ5syTb+1iVxDmFamMYJdsqI//IH8P5tYcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+fLOt2fIG+loidnVM152IklkXHiBdttWfK8V5+Fvnbc=;
 b=AGw0ZNKH6XElsWPrFiDxW9NtBOf5ih88McokO8LDGsgkfvb1xJrShFtSxZaVn3h8+ARLQFOXRtb+vCJDCOdbxme5SC5bBzGnDsYcB1HdYdgdQ3ZhC08HrVXd2QxF7MpfJQpsOHc8LOLvV7rIhcPAhsJiPxBuMwByrvQqBUakxuzveHqlmXVdfFzVi5BNdv3ScwhtSd5HM1VPtlT38Ive/0snv2LAmfKkNgUj4VVFvKnx6YwKB07a6nl/BB8omCr/sUIHgmKc7b9nUwCpEJyd8jHoYTNM4ZGL3KsbCBapfH9+srpEjc/bCC9C8SgOO69/MxWGrL2YkYxGxe64hicYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 02:09:38 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 02:09:38 +0000
Date: Mon, 13 Jan 2025 10:09:28 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	"Oliver Upton" <oliver.upton@linux.dev>, Michael Ellerman
	<mpe@ellerman.id.au>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] KVM: Add a common kvm_run flag to communicate an
 exit needs completion
Message-ID: <Z4R12HOD1o8ETYzm@intel.com>
References: <20250111012450.1262638-1-seanjc@google.com>
 <20250111012450.1262638-4-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250111012450.1262638-4-seanjc@google.com>
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To CH3PR11MB8660.namprd11.prod.outlook.com
 (2603:10b6:610:1ce::13)
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
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 924063fc-7ee4-4ece-bb59-08dd3377554e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tIwtRKj3YMqEOtTSxd60+tXOslhIYWeoE06xToSy0iJ21XBr4BGu9q9nz2Nl?=
 =?us-ascii?Q?jMuZyd2yAuEgew3rbjOEq3a6PW2ZawPG40JJVJWJT0FgDOCHTaGE5Jz4ONGE?=
 =?us-ascii?Q?RDyGfRHg5F5rSK0QjXjY8r03gDhA2Zph4bPt9ERZMIOH0FbQ/5TcrjklmQdb?=
 =?us-ascii?Q?QnOKNLO50p22Vu5wrvPpwVT8JSLRQe+wrGKb/GYo+GVTuoonlnnxnhG5GB5f?=
 =?us-ascii?Q?ImHXwPRSGlkqrBGxOZwknD7hRw2Ge7hEd7Et/Cr+ywpa4WdPmvgsf2Du9Hdl?=
 =?us-ascii?Q?x1dBd2hUCG6Vb0pmMCI3KyPBIgHGdqANkbFeRze0n+gWidBpByNsZ2hLgHQf?=
 =?us-ascii?Q?1gpokTuLB0YhZXYJ8e73yyD9bjJ+O9Azz87xRoj0DKFsD8FlEBLSpDlMHA5u?=
 =?us-ascii?Q?V+bRNHDvWP37kXlyiairIlH1IsMnSsOEub9SD8X6e73WoVd4ZmPF1YRo5t9t?=
 =?us-ascii?Q?DbFbZMQauVJZ44R9WMoctPdpdzu0mhGXoN20wEKxNc714mV+E6mfNMrrYMAu?=
 =?us-ascii?Q?LZarpwjM5f3MovIqfhdPFmbbUyIgR9yogks1Kl5s3HYR6ktS4P/Zi5E8lUui?=
 =?us-ascii?Q?n1wWgoslStDABMAbNBuw4BlAooFFpRBRN/w6t7dgqL6Wpeb7fn59XXqzLYC/?=
 =?us-ascii?Q?W/u6uZH6CodXtEfABCOgHs0YI0sTbA5xRQGYrnUcGg4bhxKrdJIlxDFcvLH2?=
 =?us-ascii?Q?A0iVgAnMEroLO7eIU3EMcAS/nDXn4HT2ddmspzn/MssSKEnBeKDmRn5NxNC5?=
 =?us-ascii?Q?9VIdyn88iR2+E0LmqIH8kQy2bLKnWwUXIbSRRyIj3xIllxCLVRRnZHgReIzG?=
 =?us-ascii?Q?afhTIhvNxlG57vvgNgtgnWzXWUldiwbCjcPkK1Idnz+Qlxq+HxBtlmGG82bl?=
 =?us-ascii?Q?ehbfuUBq7CJZn4JfTiPkiruIsgEA6O8IFKqsyaR7/lzBzn/VzTnIwcDVHJZF?=
 =?us-ascii?Q?DMz/Dn9lBnzLpp9JoGUP1wuSy760WQIgVgm6EkGFwnEfLgCUoM6bBPYibIPP?=
 =?us-ascii?Q?9EuP2iPSFyiYsyOjnYHl3jzcAPxDEqH3NvFTcC46oKmzzwmhQCY7/YwpVEZ7?=
 =?us-ascii?Q?HqZF7CJuUGpRNVIAT4uOTNQiEY7eS4842MwkxtE/csKNmCt36J5Z5AQF6stU?=
 =?us-ascii?Q?mdOcFERgpvoSUJsi+Edv7HBQ/7Y1SYXVFdkNoSVbANn09ZV9wMsAmS0i8w2S?=
 =?us-ascii?Q?HdH+Vu7ysst5X6dkkvMK4kf3Kuyb2LCEOx/Xpy/SxjSo93XOtVtPnlFP1Ijb?=
 =?us-ascii?Q?uX4eqxBcaDSSzPdG9h1zwNmNpPrpy4HUE7Ay7wG/R8lM77M21BKNyAb6KBTj?=
 =?us-ascii?Q?HF+8XRBOLbzT/N362t/twOAsYVeyOjSbMuzI+BFVIJ2t1zl8DLdp+laPOpku?=
 =?us-ascii?Q?08PI4wl0UOkSExmySTZTwdrKFHy9Bistns0ykxVF4AhI8RP84g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97MGEL9BwQHanUn183vEd2mKI8HaG6qTNp/95tOoT+sLcEmoseRlqjZO/LD9?=
 =?us-ascii?Q?8I72gzPtfZKf6vmU80/+YRtdTZyw5YeCaUw0pB8p51iXOq+ZzlUrjUh2QIPN?=
 =?us-ascii?Q?pc732JW3QVTsWmLqrEkYPfbkgP7rYZNoFzcmpj+qYV/76Uv5pzJQ8n2WGocW?=
 =?us-ascii?Q?VA4dpg4Z3sec6Ru1ZqF8teTHYCS5e6WMwCyfK5zBAZJcPxgIZ73L/y9pwvwO?=
 =?us-ascii?Q?ed+J61mfQLxoDr3Cy3kKiyvOZ0JN7oeAVYZvASpOvAjHTKN0QGgX+tp+bn2n?=
 =?us-ascii?Q?2hqhRZYph8LIUOPxky/Z4TskmYaAmKf6p5XS/j3VukXIxjt1GtCasxrWJUIq?=
 =?us-ascii?Q?LReyBO8iaaKlP2OKUMFGrmdizMIt6PqUPuSngl4AFRd71j00SwM+HNVBsBBZ?=
 =?us-ascii?Q?pRoJdQdqIKy/TgvPAMaLD3PM734AdWPRXyWjTSB0JTbnrVPdmPa1Ojcfy3f0?=
 =?us-ascii?Q?PbrBbsF7V5mX6CBjRHF7R30wkZJOyw8rz4IKWmdJjbfpWK7mjbYkIEJM3i3u?=
 =?us-ascii?Q?2kPXJYLQ4NEi6gKh1iC0k91aIgYo+ocl9jwCAlJ3+ju20MYQEiYvIB8sfdI4?=
 =?us-ascii?Q?N8ueHtpdhw0+jrTqUksb1t2tcRMdEAQ8tj2G3ntlC+iI/Kz19IV1DviaQQk0?=
 =?us-ascii?Q?6QQL+G7dbP7JBZjSSkESu/MT3ILEktK1s+Bqe9q18EImgXPELV5NRvRNLNHC?=
 =?us-ascii?Q?7vpHbsDSrsHO7FbTaxHnpGibEF4S9v+J3Cf5CsmpSuuAtEeiYrEJDLBTdMd6?=
 =?us-ascii?Q?0oYB1TsJMI6GB6fqiF4dGx7tr9V+yCqAKPOdEJIKNPzu6SdTPSquhkuWp8EN?=
 =?us-ascii?Q?F6/nS2B4yXxNZMA2jH7oN9u3btW62hRFTWqoCSihZxKI1RgplwzhF+/b7qXF?=
 =?us-ascii?Q?7O/TL0D976o0nr5aktsbrB4rXBEmsdyA575AghKb1USdWz2VkiG7a9e5m+wc?=
 =?us-ascii?Q?JHbjn7plOiHbTu4iy/eXznCAsXV2Ap/p1/Pw/5hPWR0ht8VIt4eSfHF2mQBv?=
 =?us-ascii?Q?AktOEhf7akPeOMBYg1PJ92zECKhfv9JFg9jy5JzLeTjZrpYAfUc4EWgYcoiH?=
 =?us-ascii?Q?J6oiJAzYAQcva5rP+ka/ReyhHrxVilmfAG6jMtDJUPTDLtvr7kuIf+S7IVpF?=
 =?us-ascii?Q?kgbVualTZaordJQK3gIlT1KUxiW9niilPLSDgMlGLSSXQhAymv0cWmdPud/1?=
 =?us-ascii?Q?t44Uys1EV4yj1BovpQN7FpXSBAbmWV1RQd2cC48nRAypSdjlBZFO9qfiK4Zo?=
 =?us-ascii?Q?NiUrqVRUyRxqPcNgyAMD02s2yMFbKM8+RiRgQQujqc+mOuR0eJJuyO089hHb?=
 =?us-ascii?Q?8kpbrxohUWdDMbTyOLaLwTZRDC4UbKslnaZjseiAASXOaW4fqnW8uBjFbwZX?=
 =?us-ascii?Q?u/aw1khiiMaVKwfgpHKNgQZ0Se9YRvMcpdVwLwasJSLLLKS+/eCi9dYb9aka?=
 =?us-ascii?Q?n91UXqPWHoaZo8esXQUMQWELqKkL5kvG+L0V5che51r3gHAkkpRYQd89FDJr?=
 =?us-ascii?Q?xrq8d50bALd/aowvf5qSucoY8bUYskLAp4rasYm4/hJqnYcogNFQcdsTcb6D?=
 =?us-ascii?Q?ZEsIMedK2C/tnHJc0HrPtIiOMZjnuudxO1ltLNF+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 924063fc-7ee4-4ece-bb59-08dd3377554e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 02:09:38.5529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XKex/+Tuny4IS5mEjJcMnwWb8ew/lL98JNob89kCjjGxDNuaqPpSExMHCLnMrSyzBZMg9civN4uwFKuE1Egz/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.8 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 05:24:48PM -0800, Sean Christopherson wrote:
>Add a kvm_run flag, KVM_RUN_NEEDS_COMPLETION, to communicate to userspace
>that KVM_RUN needs to be re-executed prior to save/restore in order to
>complete the instruction/operation that triggered the userspace exit.
>
>KVM's current approach of adding notes in the Documentation is beyond
>brittle, e.g. there is at least one known case where a KVM developer added
>a new userspace exit type, and then that same developer forgot to handle
>completion when adding userspace support.

This answers one question I had:
https://lore.kernel.org/kvm/Z1bmUCEdoZ87wIMn@intel.com/

So, it is the VMM's (i.e., QEMU's) responsibility to re-execute KVM_RUN in this
case.

Btw, can this flag be used to address the issue [*] with steal time accounting?
We can set the new flag for each vCPU in the PM notifier and we need to change
the re-execution to handle steal time accounting (not just IO completion).

[*]: https://lore.kernel.org/kvm/Z36XJl1OAahVkxhl@google.com/

one nit below,

>--- a/arch/x86/include/uapi/asm/kvm.h
>+++ b/arch/x86/include/uapi/asm/kvm.h
>@@ -104,9 +104,10 @@ struct kvm_ioapic_state {
> #define KVM_IRQCHIP_IOAPIC       2
> #define KVM_NR_IRQCHIPS          3
> 
>-#define KVM_RUN_X86_SMM		 (1 << 0)
>-#define KVM_RUN_X86_BUS_LOCK     (1 << 1)
>-#define KVM_RUN_X86_GUEST_MODE   (1 << 2)
>+#define KVM_RUN_X86_SMM			(1 << 0)
>+#define KVM_RUN_X86_BUS_LOCK		(1 << 1)
>+#define KVM_RUN_X86_GUEST_MODE		(1 << 2)
>+#define KVM_RUN_X86_NEEDS_COMPLETION	(1 << 2)

This X86_NEEDS_COMPLETION should be dropped. It is never used.

