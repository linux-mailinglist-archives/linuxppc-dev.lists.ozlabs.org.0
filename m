Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF87F6A19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 02:24:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKE6+xCT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sby1m3qwYz3dVf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 12:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nKE6+xCT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mgamail.intel.com; envelope-from=yujie.liu@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sby0s01cMz3bTn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 12:23:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700789005; x=1732325005;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=giDLjx1pK5ou4jiCkT18aG2UVNLnT9eo67V5tjtuX/A=;
  b=nKE6+xCTKy5GhFdw43TR9z4SgOu6/cHk7MsCXWZJij6BQGBN4ZJbUjLt
   Dr+e75ZjhXNcKdU7qIOCz3HW2q0aWOOPYyThh70BJPQEk1wVJPgWqoTxe
   UX6GyxM9p6/8a0WFQW/0AMSzrbfSeOzI2boFg0852FWGycPde5MbK/oZv
   imgOzCl9D67DSI3HmLgWw6anhx9ZFgfXB3sBBpVTMNBMC0POYp02N3zgr
   ezY1Nw3vb+dsvPbItgTqUGi5ZI6yX2DcPVh+fOmSKbj9mEyQEaIbC0YrU
   Xw0GM403jcqhDT2bvGVMVrJzkrN3r9frjgny3M9tM6C033Fn/2eD5N0nG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="423481101"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="423481101"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 17:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771104816"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="771104816"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Nov 2023 17:23:17 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 23 Nov 2023 17:23:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 23 Nov 2023 17:23:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 23 Nov 2023 17:23:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csMlEy/sNVgLgV6eVV8mVTCRrNpSoVt4imjbnrH4tBsciMS8RSvFC1c6+ZEZFCe+xWr6Ncevkg5bZ6+d0jzxXGzal8/5ct93Z9M4ukzt5WzpALwND2R+4ohwhNTi8rNYBXhEv9H+YObA4vrj5uRf7iVXXR4Rdt8JnpZ0DK0tJ44T5vuRLD5n7GKOq9C8XADlP/ZznqRdGTaY+w4VHSZcaru/QxmRB587XkntKan8ItVDiCkl1Y6H9TmeY7wtEr0B0nB2cgqci8DfYlf6afk06I+DoEk70oFdO34n5E+EOI8EwVGpkvk8mPDL83A0AmkYhzMxq643JofDboo6PdKpuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD+m0I5nQ0jMzvqRH3BmQXwMn8MaqMiFtwS64hlFCrM=;
 b=iIYy/Ez6ZiGfPQ+vJMc4x/4q2mhhsEMi38rLcJhhs9wKaIznzsAtUgx2bB2yEKpPL/sZxGwGs1g1x1IYoK0NTPWKTLBL6s4VcN03Pcf4xt8qT7nKr9+lgkxVqL4ZGLWOaK5rXoVYbFFCx3Op95tC3/97zshi0YEQ0m/hFcq9ICSn8z6hE6Nxm17Gzyy7n9SPsZ3pGCXBkWBI9EAulEZ3fkSAmFWVnQVqoSGL5+/3Q167FwbD7xr3Ud7Ie0LBX5c0zRkA43fuILvEVIZhYLephexEPyX1xFSCPccDoPCpI7vSCSiCw/VfrC4oADOm/pTKmHkCervmD/cAxr0eIZbvtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12) by
 PH0PR11MB5610.namprd11.prod.outlook.com (2603:10b6:510:e9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.20; Fri, 24 Nov 2023 01:23:07 +0000
Received: from DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219]) by DS0PR11MB6397.namprd11.prod.outlook.com
 ([fe80::e486:f8af:ca6c:7219%7]) with mapi id 15.20.7025.019; Fri, 24 Nov 2023
 01:23:07 +0000
Date: Fri, 24 Nov 2023 09:18:28 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: "bhe@redhat.com" <bhe@redhat.com>
Subject: Re: [PATCH 2/7] kexec_file: print out debugging message if required
Message-ID: <ZV/55OkN7bV02LY8@yujie-X299>
References: <20231114153253.241262-3-bhe@redhat.com>
 <202311160431.BXPc7NO9-lkp@intel.com>
 <ZVcvBft/T3cbRBWr@MiWiFi-R3L-srv>
 <39ccb4fda795a76996cf6d1c3b25909692358211.camel@intel.com>
 <ZVdyLdAzgNBXfjiW@MiWiFi-R3L-srv>
 <ZV9YYEK4L160ECQ+@MiWiFi-R3L-srv>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZV9YYEK4L160ECQ+@MiWiFi-R3L-srv>
X-ClientProxiedBy: SG3P274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::21)
 To DS0PR11MB6397.namprd11.prod.outlook.com (2603:10b6:8:ca::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6397:EE_|PH0PR11MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: be219e76-a4bb-4b89-244b-08dbec8be9b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TiCikscQSMD1iTaarxAD/5cTl8Cwdd2f4LdV5zKNfBWFEuOCplGKM22wKuWxTElYPGGEU/CqhYLTR+voPwa2yx6hoyg5tdCDZoLKmwP57KTHdVGsrYe7onQ0mDHXX9FqgxF/M+xk8Q1ptrvvMWuqk6oJQyvTpzOaqxp1vWF7s9ALEch+nJPi3wdYFXksDiIB9zZdf8R/Z93Zk7nje7r6tOc/W50x/DR6QHgq0aiKJ9V6NYF3NTkYETJa6CCwPOebAapYiQCKRU1HkSQRG/fTxs8NngrCrTnXZkp8SM67ZLk6rjeVCOEELnO/Vjcgf2kKi3+YwCda8/9c9pgt5B/OU1UfqXXAXGpfwtCqp/bWqMHE7+bRgU1GJqbRHD6GzbSYBqGx80P5kuTYumZPFBGAj1IXkvBE77nLwdEuRERkVtmc8HM4nIwlrwT95/AeR1Fqt5IwVuFfZ8mfhlb1oaEc3nv95qNsJmBPhE3K5JU54etXb/ycVtkaYhpZqmwioUc5vaelcJZ68q/xX7fQfz25ahmriBOcWVxbCQ0yHyqcMQrKe9m4K4MCVZCoILdZR3+r5gZZ2eHPN68rgbSITESt3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(39860400002)(136003)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(7416002)(15650500001)(2906002)(4001150100001)(44832011)(41300700001)(8676002)(8936002)(4326008)(5660300002)(316002)(66476007)(66556008)(54906003)(6916009)(86362001)(966005)(6486002)(6666004)(478600001)(83380400001)(6506007)(9686003)(6512007)(66946007)(26005)(33716001)(82960400001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Kgji6FxfbMwf6om+C9KcMa/brpUq8Waq6ZM9hSisGicV2kWuzntJdDcIwW?=
 =?iso-8859-1?Q?IWLkyOoPT3JVnYEbYakiqq6gnWoZ/wIQwgUpfHVOyNjFb4XNdTe8LMO3KC?=
 =?iso-8859-1?Q?bswku3yJ3xZdWrdvDBKU/D8r5EXrwP48R8qRCeczI6APApAx2a9UaRLV9J?=
 =?iso-8859-1?Q?3/4WcLcKMbLvS/NIuto4ZELQpwoBwVcCKwUJYOLFkPl7q1o+DeLMAkIbEh?=
 =?iso-8859-1?Q?u3WMQqdh8YWybANHeSi2JHyVkwPGm2j+l1wq+iO1ySO1MWVVaFSSCg0t0C?=
 =?iso-8859-1?Q?nL1vrfhQh5zhCMx962T/XF6hy10cr+1ETrWJrQYnw1mEFJ902V/FlW1NXU?=
 =?iso-8859-1?Q?Yy3cT2BSdHjjix8DkQmggY7soC/rCqNrZVuknbYOle0AJ0CjuW9wIfOpzt?=
 =?iso-8859-1?Q?yWGhLDmifULXShzcx8dmqnlQAU+EcLUPyUPLHz7klfRquSoIDq8t2ZI3rc?=
 =?iso-8859-1?Q?ATT6KzxKj9lMENaXrYcYiTcnk2PS0YAsAxaOOUWUTspJEHpuFEHIisxdkV?=
 =?iso-8859-1?Q?Xl/ANvfrkmSxQEfmh9zTnHalbvmyXDJXqXo+kKmebKWk8ePyFskI8U++9R?=
 =?iso-8859-1?Q?OLzMDS8juAcUggupo2Xyl2sXe/IsktgBXSnsZHyZQn1L0ePcelAHNSv14t?=
 =?iso-8859-1?Q?9fx9YqLuRwX0Ar/qyChV8xwzd645LOJWBt2smfKODUCPydIr4OxWUs8CG0?=
 =?iso-8859-1?Q?+2w97oTWiBdsDzBNfNNEgD2Z/ZS8b98/NTXxhDjcxkuei6qRoHfwsqvaVC?=
 =?iso-8859-1?Q?rxVsbWuqhKunbBmFn6FIkmqQwfr7DY5xdfT/hVnQHyZN6er8I2WYoNDRYM?=
 =?iso-8859-1?Q?GlontphZlsZLI3qa+IXuec5mU/iehmKe54JZhkNq+8Q0KNsADciIPunK3U?=
 =?iso-8859-1?Q?wvI3p4u5poUl3Rmji5GfHM9w4IGavkUNcfYdbSzRROpQKNOjk9UsSVdXQf?=
 =?iso-8859-1?Q?vwUI4isLAg1mEeAElAAFEoplJ6+ZAp5TaXJc1Ijkyd8z9M6XsGQklfHxpQ?=
 =?iso-8859-1?Q?inpl3S873NsFUzzHak7iqDEqbQgrnhATOJdSgTb+pXRVeAKa/V5nYMvfGO?=
 =?iso-8859-1?Q?IDNb3hZtoEdpPN52FEIKySd5jkRg4fqIQVhub0POL+QLyAgXNXWzHhzYrP?=
 =?iso-8859-1?Q?UeONDTVjNGCqsRGRas4hNrPruPeWz6xqHYG3AyHbvk1ntZ3HBg9goGX/Du?=
 =?iso-8859-1?Q?iWV46gbv1sx0pz/nZJCmV1HObu+MFlE+32sKXo8txkGDX0TrBHQPS49tYE?=
 =?iso-8859-1?Q?pwh2CTYJi25DDx5aJk5wy+BTlDZnj6i/ZL7EWi6b1QLimwiSAT2+R5Ni6F?=
 =?iso-8859-1?Q?uzTajsJF6kgUu9/Uf70w9ZV1CqLtVJDeeNh+Errg3HKsp6SY8RHZcEYDu7?=
 =?iso-8859-1?Q?76ORtYuys9VT7w8h+K+LBAehTM7Lo3A8sS5lXDUzj9mAM7LjLMaH6+3YKw?=
 =?iso-8859-1?Q?jUVo+SddD+jHWcUwm2NoSoVBGTWhmPrNWb5BF3SznjEzF0XkKu6O/1Zils?=
 =?iso-8859-1?Q?SZl00tJwwpc+/mpBCd5dJUIULSL62XPwrMRZhLtb6s316Ge+APObBHb7mR?=
 =?iso-8859-1?Q?cEPeKWQehbIrpJDLPuCHIb87uGCx1re47rLZo9dAy900xIT6HpIkR8pqQp?=
 =?iso-8859-1?Q?kwEqVeTX4sAZ1LuKJjTx3co+RUL3nny9jp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be219e76-a4bb-4b89-244b-08dbec8be9b8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 01:23:07.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sV/YbkV8w1kluPULThxwkFnQVDpSyR5rxxcGE5D07ZKr5naTp2wFcBlGAGn4kRXs4fbJmNMx2SQW7Yyh0aeL6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5610
X-OriginatorOrg: intel.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>, lkp <lkp@intel.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 23, 2023 at 09:49:20PM +0800, bhe@redhat.com wrote:
> On 11/17/23 at 10:01pm, Baoquan He wrote:
> > On 11/17/23 at 09:37am, Liu, Yujie wrote:
> > > Hi Baoquan,
> > > 
> > > On Fri, 2023-11-17 at 17:14 +0800, Baoquan He wrote:
> > > > Hi,
> > > > 
> > > > On 11/16/23 at 05:04am, kernel test robot wrote:
> > > > > Hi Baoquan,
> > > > > 
> > > > > kernel test robot noticed the following build errors:
> > > > > 
> > > > > [auto build test ERROR on arm64/for-next/core]
> > > > > [also build test ERROR on tip/x86/core powerpc/next powerpc/fixes linus/master v6.7-rc1 next-20231115]
> > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > > > 
> > > > > url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_file-add-kexec_file-flag-to-control-debug-printing/20231114-234003
> > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> > > > > patch link:    https://lore.kernel.org/r/20231114153253.241262-3-bhe%40redhat.com
> > > > > patch subject: [PATCH 2/7] kexec_file: print out debugging message if required
> > > > > config: hexagon-comet_defconfig (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/config)
> > > > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160431.BXPc7NO9-lkp@intel.com/reproduce)
> > > > > 
> > > > 
> > > > Thanks for reporting.
> > > > 
> > > > I met below failure when following the steps of provided reproducer.
> > > > Could anyone help check what's wrong with that?
> > > 
> > > Sorry this seems to be a bug in the reproducer. Could you please change
> > > the compiler parameter to "COMPILER=clang-16" and rerun the command? We
> > > will fix the issue ASAP.
> 
> Any update for the reproducer? I would like to post v2 with the fix. I
> doubt it's the same issue as another report on this patch, while not
> quite sure.

Setting "COMPILER=clang-16" is exactly the correct fix and should
reproduce the issue in this report. We've fixed the steps of reproducer
but this will only take effect in future reports.

Thanks,
Yujie

> > 
> > Here you are. Thanks for your quick response.
> > ------------------------------
> > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-16 ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > Compiler will be installed in /root/0day
> > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-16.0.6-x86_64.tar.xz
> > /root/linux                                                                             
> > tar Jxf /root/0day/./llvm-16.0.6-x86_64.tar.xz -C /root/0day
> > PATH=/root/0day/llvm-16.0.6-x86_64/bin:/root/.local/bin:/root/bin:/usr/lib64/ccache:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
> > make --keep-going LLVM=1 CROSS_COMPILE=hexagon-linux- LLVM_IAS=1 --jobs=128 KCFLAGS=-Warray-bounds -Wundef -fstrict-flex-arrays=3 -funsigned-char -Wenum-conversion W=1 O=build_dir ARCH=hexagon olddefconfig
> > make[1]: Entering directory '/root/linux/build_dir'
> >   GEN     Makefile
> >   HOSTCC  scripts/basic/fixdep
> >   HOSTCC  scripts/kconfig/conf.o
> >   HOSTCC  scripts/kconfig/confdata.o
> >   HOSTCC  scripts/kconfig/expr.o
> >   HOSTCC  scripts/kconfig/lexer.lex.o
> >   HOSTCC  scripts/kconfig/menu.o
> >   HOSTCC  scripts/kconfig/parser.tab.o
> >   HOSTCC  scripts/kconfig/preprocess.o
> >   HOSTCC  scripts/kconfig/symbol.o
> >   HOSTCC  scripts/kconfig/util.o
> >   HOSTLD  scripts/kconfig/conf
> > #
> > # configuration written to .config
> > #
> > make[1]: Leaving directory '/root/linux/build_dir'
> > 
> > > 
> > > > [root@~ linux]# COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
> > > > Compiler will be installed in /root/0day
> > > > lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/
> > > > get1: /pub/tools/llvm/files/: files/: Is a directory
> > > > Failed to download https://cdn.kernel.org/pub/tools/llvm/files/
> > > > clang crosstool install failed
> > > > Install clang compiler failed
> > > > setup_crosstool failed
> > > 
> > > 
> > 
> 
