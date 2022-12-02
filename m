Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 610EF640181
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 09:03:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NNln9227tz3bfN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Dec 2022 19:03:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaYPUx/z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=chao.gao@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaYPUx/z;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NNlm84rGvz3bTq
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Dec 2022 19:02:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669968152; x=1701504152;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3u2qa+K5LwgLmrP2NXT4ZlvDi8zcqYjGUVfvrsyKUvQ=;
  b=IaYPUx/zVhrmPUPSEWuUfFp5UyuSF2GQu95/zSl2Hd5HZE1NLZ0et8Kc
   unzNijpZPWtp37z/j4CCTheyM7NDFIilngojhRLX3Ns4ofP79ZelmYZ81
   4T1fljW/k3Ydh3POMGPsANf5xm+h8qqScuFnoeNIWBgKJULpmEP/rRXmX
   dEAsjYl9xs8VbdbHL/z+8ge9gPmcc+ddUMKp4U/3/21miF4CC7liKglf+
   7rxjXTKuoCFnxNm21w47r+yF1MFSskKdOioqd5Ivm4qlUSgSyBYaf3UPv
   2uzeV99RVczUY+J7fd1m+3vo56LPzj593EiIPp6oddryAhGG/XUdI16oT
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317043497"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="317043497"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 00:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="644944361"
X-IronPort-AV: E=Sophos;i="5.96,210,1665471600"; 
   d="scan'208";a="644944361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2022 00:02:22 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 2 Dec 2022 00:02:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 2 Dec 2022 00:02:21 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 2 Dec 2022 00:02:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzQl5CWDZa8m6h+Vkt3R3wLFqCLiutyWIX/+qnRGXXbPVItfCdoltudzASRQS5nLU7/x30aOz8pe4wS9P2oDdPReUVSCE9nRm05FxI3ktZHojOLvLFaKk130TRhzYUtKhLIQRfmRKS6xO+++jeCnNvd/+jEpqYJ5pzf/7ToMd/ipfLnW04mOmHnlW0+byZ7IoPGoxfh1DDlVGjas57doqhePDhVRa7/o5gpitK9SMorjKZ4G/gyEf5oiEWvJg2OR2brfCCR/mw2nlaf8gSP3cafi+Ai4GFZH4gcUkDucNjARIbEiKx3MsJfYu36JspJoWGIINtMX8+wGToEQyCq+Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0JkCnL5yuhNfcpLiZP+8v2mEy/roPie5pXq2WAmow8=;
 b=XKuvNJhZUnWc1lm3GJ3lTqfLTA9ctlw1E3URpisHMzN7GiyxEGkOmV00VHaXDN6xzmvV3V1otHoEbUfrVR5AL3ttYdocxElDdZDub8A/DA0nYZKG7Q2Fs3HR1A4c/AMErFWtWXXhuFWHmRmKwthzAFa4XeZqx8WpVgLW+5DaIzzYggTHv45RX1ygbqf7eYiiwvShLUusqaf8aqZyTRRenlbMdPQyKTxxKUJajjCmZpPO0ETFYNTQTuzTbMSxK4RMXElTOxYtN4o7WNSGLxAT4ZQHChT8LKzck18yCSBH5dYXUnXgfoVdM/797itHaIBxc9S28toTKhQbMvbd14mGaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR1101MB2221.namprd11.prod.outlook.com
 (2603:10b6:301:53::18) by DS7PR11MB6200.namprd11.prod.outlook.com
 (2603:10b6:8:98::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 08:02:18 +0000
Received: from MWHPR1101MB2221.namprd11.prod.outlook.com
 ([fe80::5cf5:bbad:8442:f2b4]) by MWHPR1101MB2221.namprd11.prod.outlook.com
 ([fe80::5cf5:bbad:8442:f2b4%2]) with mapi id 15.20.5880.008; Fri, 2 Dec 2022
 08:02:17 +0000
Date: Fri, 2 Dec 2022 16:02:08 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 00/50] KVM: Rework kvm_init() and hardware enabling
Message-ID: <Y4mxACzVOsJpiIow@gao-cwp>
References: <20221130230934.1014142-1-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
X-ClientProxiedBy: SG2PR01CA0117.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::21) To MWHPR1101MB2221.namprd11.prod.outlook.com
 (2603:10b6:301:53::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2221:EE_|DS7PR11MB6200:EE_
X-MS-Office365-Filtering-Correlation-Id: c20b277e-aa52-4a09-4a90-08dad43b87ce
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5xmtXBOmYTCqEx9bsI8AUQs3eNgQ2GZUAVGu6LRKAX0xc1Qj44QoJBoklyfveJQWZKj5xz23rpesJfsZmfreis+UDof52Cc8DJ8N2nXruTl/oEgLMOkQ9GvXldP3jGXqTXNn7lb4vie/pWcjTrdNVq8mDRxTgCKo1t7zAW+kLInY7yfUXnGHl7LFadVIUJTL1qKgwWFF8bAm84/o3L5BzSctXvwjvVTiDedcjHmZ6wntvmJxI/VsjdJNMhIxiaDNyPoiOHQwAANXEuwK+7DX8MkQb6bLm9oDZayakNSbo6Ib645KZI9VmUF+7HiARmc0G6ea/DNwoLPXAsvf/AA/cWbB3KkEU9QMt7u2+yAaILLrUJbdYgvdrQRqPdk+dGQATaUfQzDR2E6yf3VEC7Arvh8rWp/hH2Xw2C5w/BZWKyI7yg5iG12zK8vsiCO8h2OS2nPteAjJp3iRmW1wa9+V+/nQ8dhyT3Cw+tKkhI5Skc3cntYE9l49FF2QQG81R7yxy7W8c75xY3VEnzMarkofrybxZ0IHSngXbhFj15Q0UIdmmJn8vWC9MgultcpHz8GUgQfaPlQzxiZstGEcV4ouid9D9Au+uXeWMkScJ4R9BmG8gk8xPHJJwII45gzJpeGVp3snN8H5krdA5FXAej4byw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1101MB2221.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199015)(44832011)(86362001)(83380400001)(6486002)(2906002)(4326008)(41300700001)(82960400001)(66476007)(7406005)(7416002)(4744005)(66946007)(54906003)(33716001)(9686003)(186003)(8936002)(5660300002)(6666004)(8676002)(6506007)(6512007)(478600001)(6916009)(26005)(66556008)(316002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4aTDGEDazO5skc343i07bjXay2Tuul8oazjDHUA1A/JfGWCFPMwYTQJ+JvgW?=
 =?us-ascii?Q?hA8t8h+m51BPyIAT3S1iMiCiN3CkdparD209+/1oh5Qq2KauTTmiZpomrAxH?=
 =?us-ascii?Q?hEduUzhEJG/DRdCXVvyVbahMqWHPhkOxbnFZjtBIR/ctVRY+se7GdJHDQBG6?=
 =?us-ascii?Q?62tvTS6Q1WCvLc9fy+UpRtYRgRbbH/eZdiVsjsrPc03DmQO/bdY50vG1EYGo?=
 =?us-ascii?Q?YZIQd6tZOO1vS1JFWucDGAiHLwFd3Jdbc/6MgjogvBin+pa0nYpEJJBvmTwK?=
 =?us-ascii?Q?h6rMyI92Ljbda+u6sfox2MVgMDE7v6mWcAipzy9zDYlaSlUNsW1b1wgKzbjU?=
 =?us-ascii?Q?aUOgbFoEOL2t9X5sTcImVDKSXY64pQWUyU+4aeWbT+FNwgz/p2YO1bZoq3qJ?=
 =?us-ascii?Q?l2g7Rt98Gw/w3qBQpbSrThMvz0kQR856z8kshu8mse3jTAqiZ15zGSuO1SNY?=
 =?us-ascii?Q?VNqpK/qAskNcGg2d6E6BuvMGlYp423n/LwmFNBwu4VnccRI2KbvEr3Ds+oCn?=
 =?us-ascii?Q?+LQ7or4TeLNRxiv9EXjEuKxz7f5SdDnKsY0eK5lVTH7Qh4+ygTeTAt+ZWvtb?=
 =?us-ascii?Q?fpXwGhzo0+M1w0cPioY1YG4vjwlKrqMXzKEZQrOyS/up+VqaelbVf36XU74L?=
 =?us-ascii?Q?AfPz9RUutwWk/XsMiDxwK7IBbkZ33a8NBkfcFuSheIYLV3q67noyHjFJlNtU?=
 =?us-ascii?Q?/me04jpnXwys8nmswofJou/cOQH4xvlXP3Bh8xjTqVuxIQkMEj6ktM9Okd+7?=
 =?us-ascii?Q?SSZVnLiZEn6nmFQKh6Xu7H38A8jIH7VcBkjDZYiA75/XcZ//04WJfpIlIVzu?=
 =?us-ascii?Q?iNj07e32/oI9PvK1WIFO4QyRZKRSBfnLrNO2zHLFV+6qo50/ioCFX8RdYygQ?=
 =?us-ascii?Q?7P/6V9kIW3vXL6CwbVwRWP0lYeJU8i0iuQvzsjHN+PF5MxBMTrsy3Jtcg/TT?=
 =?us-ascii?Q?s1uu8g0YU2YYvNtVTyDO3/rfoxWjB22Qvb02Uvt+J3CqJ0VLfTdgQO2zGtEC?=
 =?us-ascii?Q?UQmbSgzyDl2VIbUS3q9ObwzQazXqOcB164p2jjUWUtgiCrotBJTJTC0pXwqG?=
 =?us-ascii?Q?Vd6Aje2H2bK/n6w2VnIlqo+oWWvyu2UGgPZ2j40E9fqA1RqTz1hnSrfeDqUK?=
 =?us-ascii?Q?aWa8FxEVtyOiQZO2W8eMXhXBIAJszGSP1jhdvsHNKRZ+Unvg8hyqEBnpHsHZ?=
 =?us-ascii?Q?TgLbstsfgZRYOvoXgPS/Y1wf2ph1r1HyfJYE3mXkatMQvDy76WnGZPUrV5K0?=
 =?us-ascii?Q?5bnfTRBShZ04E51jCM+G5lj/URvVuXN1TGksN4NGbTv5mPXRPgumHCxYD940?=
 =?us-ascii?Q?yF/+5iJSK5AVjnzaKSHTBAH9h3+U5Z3YJ5jn3Mn3826wUIh4Diy1j5ll/IKO?=
 =?us-ascii?Q?qh+2Ug9aG8/UP0z9AKpuxOjU3CYkHed4eEl7VabyNqz8jxXLwzT7ScqyD9C0?=
 =?us-ascii?Q?eMVgJpP2TGdHDDMg8AYAaGSypjORJy0Qbs0VdFW+Dkf/CJHrhCbETKeW8SKB?=
 =?us-ascii?Q?HV915oWtsJCErpNao5m2FQKcUz6L3NnAdcbkkgHwmnzDQ8Rd+6ol5M7kkgWm?=
 =?us-ascii?Q?4Xlh3HwhOS6Z8v4db9/2bXbn++y9SQqy99Pq4ory?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c20b277e-aa52-4a09-4a90-08dad43b87ce
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2221.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 08:02:17.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +TB7Hg1KC+iwn+xMHCoWoyNmmlW0zsHSz+FUqqBX2lPsaFKz6NB6QLwHghDdpkwgEVyAvRm39dMj1iqc9ONgfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6200
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>, Yuan Yao <yuan.yao@intel.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, David
 Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, James
 Morse <james.morse@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, David Woodhouse <dwmw2@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 11:08:44PM +0000, Sean Christopherson wrote:
>The main theme of this series is to kill off kvm_arch_init(),
>kvm_arch_hardware_(un)setup(), and kvm_arch_check_processor_compat(), which
>all originated in x86 code from way back when, and needlessly complicate
>both common KVM code and architecture code.  E.g. many architectures don't
>mark functions/data as __init/__ro_after_init purely because kvm_init()
>isn't marked __init to support x86's separate vendor modules.

Applied this series and verified that an attempt to online incompatible
CPUs (no VMX support) when some VMs are running will fail.
