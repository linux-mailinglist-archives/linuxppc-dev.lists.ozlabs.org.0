Return-Path: <linuxppc-dev+bounces-2835-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 568329BB860
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 15:58:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhvjn75glz2yN2;
	Tue,  5 Nov 2024 01:58:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730732317;
	cv=fail; b=WO+5WoVds6uHiS14p31gG4m0xC3ZK0gGBxyQticVScWpcn1pmL6deIo0JT+rpdLNnE7bvOTMwDCt6zYRw8vAyIwIH24D30H8M0ITZNNPek2Qdv8r6WTY5BJARxc2Q/vB9t4HtWnm82WUQkr1uNI6VOBiSecR6Vsa8zzt0a4L+4EqZrllForaSNvoxnaZbqeuinhcRjzGnLxXsJrHu7GzSFCSzCmTWLsFhQPqaQ5Ka7YRty6X+H71YVMD1rcYwnBhqKlYPMS8sws81daXCCvoy5/Krf8nBZNyoOviPO5iWBg62aLUvrxZRlvPMUw/iT1NsnK81cOUVp638BLABDCOjg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730732317; c=relaxed/relaxed;
	bh=Tlpneke16S562oLOGPjhcLjZQBBXvKrBo6P7Vj6786o=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZzNIDARqW29tjVAXZf0TDtigaYtPA4Mgr/qc8GWfqmM92oUAiPPtmPebI4ln/CwhcjdrImZhQUtdbNtrQQVQDA+5C4frHr1mS7zdiiqlG3MLXuTHh8FPQItGSY+Alw/Wxlc5dYYbNQffmGHEfiytUchfwHJ9W1xfQrkV1GKi+IXzmRgvM9/cNXK+awLzJxXhNjM9kP2gjkKPHvtL4ZE6izANqZNYNgykjhpJvB7mz9tjNH4Vqj2a9Rzuro4z0lB98XKy1ChYdxtKVkwsaOPIjFtNP1dXsgAHAqRxAoSinU5UdIFo8g4VPMINFEiCyLHS5rDfXFp2gnp2b2QD7OsMsw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U2+vGPO1; dkim-atps=neutral; spf=pass (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ira.weiny@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=U2+vGPO1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=ira.weiny@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Tue, 05 Nov 2024 01:58:34 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhvjk2qbCz2yMb
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2024 01:58:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730732315; x=1762268315;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=O3dJir/KSdlul1WDSa0ZEXg0XB4G6gZesm0ZOB1r3M4=;
  b=U2+vGPO1KBnH/ZoqXm0UpZf26KFe14L4DoELvAc/6z7E5uJahRCc+ggE
   c1OhcvHqWMLxIHIkEY0zGvjfG94s6k3RcPBWQr6SVzm+ArUFgmhF2ZASY
   Dgz2AecsdZECFxUzToAUcHF5ekgO3XP9Avv5+y2hPx6ftdVBeq0StkMWT
   9WRei0qo/UEGrq+rRAdblWrfHMRXXZDPid3uSUGGVn2Z6CMDps7pXhZFh
   8zxE82gIG/Zpwu+Cairmi1v/RGBxvlNqGD5iL3YB3dW3RUBHQzhZkKaVS
   yqiO9+7+HIUCrE7czPWgldID3QiHcI1QxIIylV+couGOVCLWTvXZaUOJu
   Q==;
X-CSE-ConnectionGUID: M88YSWZiTSSVKmO5PIBz4g==
X-CSE-MsgGUID: X86NLnWAQ1yDcSURlkaPTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30284829"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30284829"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:57:21 -0800
X-CSE-ConnectionGUID: TrS2NTCrRIChl9Ysb0Bklg==
X-CSE-MsgGUID: 0u7Un4bCTHW45Zjmg6pMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83198288"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 06:57:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:57:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:57:09 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:57:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aF9gHprkjrW931VLb7NYk4ztMX12dEcgrtJlL0d07if41jIAdJlEuhep6AszQjuHXMx1j502knXhi4cIbJYF4groqcBbc6YnUc/PpHuP/Db7bsxUcUbSP9uxp4GMcyMwmDPNPTE/NetOcOzN7gUJxgaTYdDmrPRfCLzlNlbPnepo3iqBj0i0+bRK7ESL3eTm7WDrOTPaY1eWJJHfsYdk3y5aO7g1+c+jOo9Mk8s8sNt3/uslno4cxu5XeCRvF43IwmVGIujGuo0C3BDDtIXiI23GORePxF4n9Kpbg8Lb6IE6KiGIehHsQN2uCpqdHwJVwOVD0gjdx92s7m0XvdGMew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SsjHU4oKkp3cEqMwqLGTXX+kXj1c66K5N47hwN1nz4=;
 b=ygEZEWxmmqoTHztbcu9TWXJBhqOF93ZO1vF1u+665fJBs4i2n4uhU7COpFI4HBRP6ypoWhOi6F8Kh/50r2J1HDYFgmSVbBZTTyBvL/nqkY6+mNlTwdMaMEm4QkxqI5N9BG4DaYMZB+4RNSgM/SS/b5bCzWKJd9CT8b4fj11DjXi8WNF47W1340LMOvTV97PCj0iI4pyHw1OfA8hxGPQDOInck/DTG5bwVRZyHAJsYTcNHRcRdc5nj/xZgqXKGQWba3mSUHrddTG/6TPj0ARjd4yoKWSbcKS19YfazBiA0rMYktp/8cJM5ghOk3Oxywe0Jt9EesSPorPy2tEMcdMKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6733.namprd11.prod.outlook.com (2603:10b6:806:25c::17)
 by BL3PR11MB6506.namprd11.prod.outlook.com (2603:10b6:208:38d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Mon, 4 Nov
 2024 14:57:06 +0000
Received: from SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57]) by SA1PR11MB6733.namprd11.prod.outlook.com
 ([fe80::cf7d:9363:38f4:8c57%3]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:57:06 +0000
Date: Mon, 4 Nov 2024 08:56:56 -0600
From: Ira Weiny <ira.weiny@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang
	<dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>,
	"Vishal Verma" <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Alex Deucher" <alexander.deucher@amd.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
	<Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Dennis Dalessandro
	<dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, "Naveen Krishna
 Chatradhi" <naveenkrishna.chatradhi@amd.com>, Carlos Bilbao
	<carlos.bilbao.osdev@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Ilpo
 =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, "David E. Box"
	<david.e.box@linux.intel.com>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
	<martin.petersen@oracle.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, "Frederic
 Barrat" <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Logan Gunthorpe <logang@deltatee.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, "Wei
 Liu" <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>
CC: Dan Williams <dan.j.williams@intel.com>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-cxl@vger.kernel.org>,
	<amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
	<linux-rdma@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-alpha@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-hyperv@vger.kernel.org>, Thomas
 =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 05/10] sysfs: treewide: constify attribute callback of
 bin_is_visible()
Message-ID: <6728e0b819e9_14084029463@iweiny-mobl.notmuch>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-5-71110628844c@weissschuh.net>
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To SA1PR11MB6733.namprd11.prod.outlook.com
 (2603:10b6:806:25c::17)
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
X-MS-TrafficTypeDiagnostic: SA1PR11MB6733:EE_|BL3PR11MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: 394334bb-617c-406a-4a05-08dcfce0f2f6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vJKBUHqLzVwEAEzq733lKf0tp5JwYIBdn0zPoaIPb5prUy9Ut/DhlGgd1e?=
 =?iso-8859-1?Q?ojol/tDSApvJaNPVmBdxq0RoifhlZleKhKnT5adclLryOVD1C7aZcIV8Fz?=
 =?iso-8859-1?Q?GkWVSelyWa2nXLUenHYPPYyg72c3zm66Tq7sFNTf2zDHSicZE8+ZMoC1uP?=
 =?iso-8859-1?Q?tr7iYkaTXug76dxMXnWUevfPZwDZ6SgEvh8ujFUcJlxL4FYxHJTxXlINkd?=
 =?iso-8859-1?Q?W7uxw3WHfulGPuacTuHy82LGmhUHVcKPInMQQNcls1WzH1Q+Yz2j5dJ4Ra?=
 =?iso-8859-1?Q?f3KNxfzIJ5LI7u6KxqB4i7gL0WuzyqbJL0+u+Uy+62CtwlYX4cBlH35+bA?=
 =?iso-8859-1?Q?PV1TOc5t+1a63dHHk09S/Ey3vXvZC2rNS2ea8cdRFhyMTL0v6gy/iJ8N4C?=
 =?iso-8859-1?Q?azAWQ85pDDitoJa5PDKO/4ZoRMwV6llBTNG0SecOcN2XRL18f4d5EHZuNl?=
 =?iso-8859-1?Q?H9MgQubBw71XF0VrDDqfHDKpsuN2f7Obq18lVKod4fkghmIaD9cqEuiYJv?=
 =?iso-8859-1?Q?j033A+Kxpaz3NY+qCRErT+Rl76NjmccrSi93ZQ6Bn81N9uU5Amu6lmlP4k?=
 =?iso-8859-1?Q?QhqAdiGv9ofOYBocsd2nzSP4kAstMB3eSa0wl6ZIZywqJP1J/3S/EwGLsB?=
 =?iso-8859-1?Q?Z8YRBTlX3InZJ0okavTOSn5ZZttvM0i4BUPBjsf+6LS/PbmwUV7QOCeqpx?=
 =?iso-8859-1?Q?ps+FRQQLlYrX5r3t0Hl2ThfTAC0Od6wRgLMb8uHlUD7VHgWAjjpTmtw7Ik?=
 =?iso-8859-1?Q?eCMg8Yb6UA6e4rY2ecZyh191/giB8v85xm856PKX+8stZEbrkNmHM43Lk+?=
 =?iso-8859-1?Q?zwVjYuhVTJUQhvYz+ch0+k6dB6fnCf6ryCEHMwJcp4o3I2vQMC7meRjB4c?=
 =?iso-8859-1?Q?hc02ynucy2pbsLAukNQWhkceAnT4SUUSSWJO5Zr0xgvKocuCAKxcaYFiO8?=
 =?iso-8859-1?Q?EY1PaYi26o3q7Oy2GKCEC1g0TPktx/4BzljYs9cOjqbqt4GsagfeMUgbtw?=
 =?iso-8859-1?Q?j2lVq7YGSFccWvyWv5i7LykNLVQtC0A/m6W4dd5bP8tn9/VVzWbZnK2lFm?=
 =?iso-8859-1?Q?wW/1g6OSre3NLjQsNwgb9/AhusfJpDN0jnirMkjK6cBCSt/KUggKqE3EVt?=
 =?iso-8859-1?Q?nBJKJSnPfBi5KS3BWBis/UfGy00nzDgR1zIFXbyzi+tixBejf/kBDfEfgB?=
 =?iso-8859-1?Q?FHlzK+GmGm+VsR4AcpYhZrBPZOUPPugyiD+ZOhc+MvvOr9Ib4z75hIvhhb?=
 =?iso-8859-1?Q?ypyRIDv0Xy/HpBcQCDCUIWfY/s6TTV5AlW7/aowCCZFSIhmfTReDgtj25H?=
 =?iso-8859-1?Q?bgS0Zk7kTzcdkx15x+e820vAOdh/5baD7S+i5lsHp11JLJVqPUrQeNykQP?=
 =?iso-8859-1?Q?4Su3fUfYSFJrX+X5+wMJflvyUwMaInzyWHga35oBlUh9+T4Vc+0rY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB6733.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?GARdDiJWX5sL1joXISNrkwxtLuwdL8g8wiIIyjdGRlZDwQC6AlSkvunnYB?=
 =?iso-8859-1?Q?qfQ/DE2dKXkItT/Tueu0VxJwRiicYRdxsgrEFtmuKZguIF8cTt99UQhblj?=
 =?iso-8859-1?Q?468ZCVrpADOJ/Zq4P147/4xS7L/jc6y8PLM4adpodgNVoyqNx2mOxnueAP?=
 =?iso-8859-1?Q?nb5FHRDJyBW74y1S4LcVehsIUIjBwyt57HPDTKcPSVgYwASzofggwHdfXr?=
 =?iso-8859-1?Q?wEDOdmyCyVfpE7ddTyu/YLNfUb3Vskd0b+1ShxuhvKqdzRW1atWjV9JcIB?=
 =?iso-8859-1?Q?7UhsttQeav9ujn+m+zrH/xNsHFALF3noifVararFVO9ULptYXkUvdjQKoA?=
 =?iso-8859-1?Q?B7pv/4IYWil7gBsw7GAUx821yTNFBxrvIBYHs8veqSEWZ3MjabdPzoM/df?=
 =?iso-8859-1?Q?Fp4jozEUKdFqddvdPbliGynZeLKOEINQQuoKNcxVJEXnk+jLE7/B0sFuX+?=
 =?iso-8859-1?Q?o9/PBAqt+kWRk44n4CLu58azUk/mTkEPXa7ZBqaY27xlcBNAF0l+OgxfdO?=
 =?iso-8859-1?Q?jUuzEQDiR1a/UdJejJFYoHUv33A4ExyOiFTCuLlrahAM9lwOjzZNoD6GSg?=
 =?iso-8859-1?Q?SE+JbPrDgiismuzjFjN+Mx3/rtwSbEdQDqtVN7g+w2/o6BOM18pFzGfyYF?=
 =?iso-8859-1?Q?uNsXSgSdlvitB4zej8pFraj5iL5NhFMPWo6jiXdULDdEb5UqJDboVNIhEJ?=
 =?iso-8859-1?Q?oeeVMNRyKxv0Va6vHZl2rzagzCW0lt4Ox4AE0+Pf/vFvdvfnM51CczptkS?=
 =?iso-8859-1?Q?nCifu1oMecL/+qglga8zNGsZA8/kGGQP5Duwj6kLcBp+FipZ6DTI7216rY?=
 =?iso-8859-1?Q?f5okT4PwD4co0Vt0qVLhpv9lHHEfB/b25axl0bipXV/k+GLzlpIfSGHSzS?=
 =?iso-8859-1?Q?vYZokP3ETM83bf5WFjeuAunPcxGDnbrV6fM0AKDZGVF9H3c6WtmHG1/Xw1?=
 =?iso-8859-1?Q?cPi9KWN7oiEJ46Q9gmUeVb6+bS3KHDunvVPCPeRdxv5wr0cFSfz0qmQMc9?=
 =?iso-8859-1?Q?zvKtOpou8wsD60F+TfLPCWeAtATSU4svUk8sSHTuV004qnI794piWie6Ky?=
 =?iso-8859-1?Q?QY5bIHXGVXM/9KU2eQJMEcjSePTHtnBdlcl7tdExkQxX4QlzM37NNQMkjE?=
 =?iso-8859-1?Q?NxIAI+WI02XQ7MiIFviqNrbu5a2f5uYb2TURz3n+a7stwyDKfrgiGvg9jc?=
 =?iso-8859-1?Q?9tccF2aTZLCzlRn876lNJGmgs7AahkV0tGCW5HXZ270scxzdlutZAvRvz+?=
 =?iso-8859-1?Q?/TWZhs3nP/dFSAMGJh6OjZn1u/GPNIo0zm6duwi6NQx7o4iVAlQpiIlJew?=
 =?iso-8859-1?Q?u2cDM+7DWOwT71fXysa5fVHErH0H2ZpXC0YMFSLQS+wXnzgT9TtIjmx92e?=
 =?iso-8859-1?Q?Xpsoqc3MTgc+blggAqjtup6rlxz0x1EjuVZZ7FA619YzD+lD5SnKcd8BzZ?=
 =?iso-8859-1?Q?Ua9NP3wVQaCX1M3nQ2invGtYKa7Z5olVSh3qKU+P/MH4wkuuCopIy+XCcC?=
 =?iso-8859-1?Q?lrPa8pYWDAy81twDg8oSmbVHw/2L5yF9ImN37/364/fnwEUzKF9XJ8l7N1?=
 =?iso-8859-1?Q?qnSKPx24dBn/fxB5ZepBmNrNt3/AAllvcs6HYVYthwnCIqb3ADNwvqBixR?=
 =?iso-8859-1?Q?t11PxE+OBNEsUvTgQ8k20eKRHWo9ucIcHm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 394334bb-617c-406a-4a05-08dcfce0f2f6
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:57:06.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk1dpWhHGyReCgCtYvz28Nh10DH2ABl39CsVZtuijEtq6iDAADmiWcbYxY135NfbpszdLILdTdSQ7mlpu9RstQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6506
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.6 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thomas Weiﬂschuh wrote:
> The is_bin_visible() callbacks should not modify the struct
> bin_attribute passed as argument.
> Enforce this by marking the argument as const.
> 
> As there are not many callback implementers perform this change
> throughout the tree at once.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
>  drivers/cxl/port.c                      |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
>  drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
>  drivers/mtd/spi-nor/sysfs.c             |  2 +-
>  drivers/nvmem/core.c                    |  3 ++-
>  drivers/pci/pci-sysfs.c                 |  2 +-
>  drivers/pci/vpd.c                       |  2 +-
>  drivers/platform/x86/amd/hsmp.c         |  2 +-
>  drivers/platform/x86/intel/sdsi.c       |  2 +-
>  drivers/scsi/scsi_sysfs.c               |  2 +-
>  drivers/usb/core/sysfs.c                |  2 +-
>  include/linux/sysfs.h                   | 30 +++++++++++++++---------------
>  12 files changed, 27 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
> index 9dc394295e1fcd1610813837b2f515b66995eb25..24041cf85cfbe6c54c467ac325e48c775562b938 100644
> --- a/drivers/cxl/port.c
> +++ b/drivers/cxl/port.c
> @@ -173,7 +173,7 @@ static ssize_t CDAT_read(struct file *filp, struct kobject *kobj,
>  static BIN_ATTR_ADMIN_RO(CDAT, 0);
>  
>  static umode_t cxl_port_bin_attr_is_visible(struct kobject *kobj,
> -					    struct bin_attribute *attr, int i)
> +					    const struct bin_attribute *attr, int i)
>  {
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct cxl_port *port = to_cxl_port(dev);

For CXL

Acked-by: Ira Weiny <ira.weiny@intel.com>

