Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DE83D56CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 11:46:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GYFSZ2JNHz30B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 19:46:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=andriy.shevchenko@intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 123 seconds by postgrey-1.36 at boromir;
 Mon, 26 Jul 2021 19:46:33 AEST
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GYFS90ZM6z304G
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 19:46:32 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="209079590"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="209079590"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 02:43:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="417001763"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 02:43:10 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1m7x8X-000fh1-Mv; Mon, 26 Jul 2021 12:43:01 +0300
Date: Mon, 26 Jul 2021 12:43:01 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v3 0/5] powerpc: apm82181: adding customer devices
Message-ID: <YP6DpWPhIFpF+j40@smile.fi.intel.com>
References: <cover.1599343429.git.chunkeey@gmail.com>
 <YPsWMRLWQoxHFub6@smile.fi.intel.com>
 <8a8f50d1-b89c-322f-1465-062ed287d491@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a8f50d1-b89c-322f-1465-062ed287d491@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: devicetree@vger.kernel.org, Chris Blake <chrisrblake93@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 24, 2021 at 12:08:30AM +0200, Christian Lamparter wrote:
> On 23/07/2021 21:19, Andy Shevchenko wrote:
> > On Sun, Sep 06, 2020 at 12:06:10AM +0200, Christian Lamparter wrote:
> > > I've been holding on to these devices dts' for a while now.
> > > But ever since the recent purge of the PPC405, I'm feeling
> > > the urge to move forward.
> > > 
> > > The devices in question have been running with OpenWrt since
> > > around 2016/2017. Back then it was linux v4.4 and required
> > > many out-of-tree patches (for WIFI, SATA, CRYPTO...), that
> > > since have been integrated. So, there's nothing else in the
> > > way I think.
> > > 
> > > A patch that adds the Meraki vendor-prefix has been sent
> > > separately, as there's also the Meraki MR32 that I'm working
> > > on as well. Here's the link to the patch:
> > > <https://lore.kernel.org/linuxppc-dev/20200822154045.16036-1-chunkeey@gmail.com/>
> > > 
> > > Now, I've looked around in the arch/powerpc for recent .dts
> > > and device submissions to get an understanding of what is
> > > required.
> > > >From the looks of it, it seems like every device gets a
> > > skeleton defconfig and a CONFIG_$DEVICE symbol (Like:
> > > CONFIG_MERAKI_MR24, CONFIG_WD_MYBOOKLIVE).
> > > 
> > > Will this be the case? Or would it make sense to further
> > > unite the Bluestone, MR24 and MBL under a common CONFIG_APM82181
> > > and integrate the BLUESTONE device's defconfig into it as well?
> > > (I've stumbled across the special machine compatible
> > > handling of ppc in the Documentation/devicetree/usage-model.rst
> > > already.)
> > 
> > I haven't found any traces of this to be applied. What is the status of this
> > patch series? And what is the general state of affairs for the PPC44x?
> 
> 
> My best guess is: It's complicated. While there was a recent big
> UPSET EVENT regarding the My Book Live (MBL) that affected "hundreds"
> and "thousands": "An unpleasant surprise for My Book Live owners"
> (<https://lwn.net/Articles/861235/>). Sadly this wasn't getting any
> traction.
> 
> I can tell that the mentioned Cisco Meraki MR32 (Broadcom ARM SoC)
> got merged. So this is off the plate 😌.
> 
> But APM821xx sadly went nowhere 😕. One reason being that I haven't
> yet posted a V4, V5 and so on...

I will help with testing if needed, please continue this, it's helpful!

> In theory, for v4 I would have liked to know how to handle the
> kConfig aspect of the series: Would it be "OK" to have a
> single CONFIG_APM82181/CONFIG_APM821XX symbol or should there
> be a CONFIG_MBL the CONFIG_MR24 (CONFIG_WNDR4700 and CONFIG_MX60W
> in the future)?

No idea. Not a PPC maintainer here.

> As for the MBL: Well, If you (or any one else) is interested in
> having a more up-to-date Debian. Then I have something:
> 
> A while back, I made a "build.sh". This will build a
> "out-of-the-box" Debian unstable/SID powerpc system image.
> This includes sensible NAS defaults + programs as well as
> a Cockpit Web-GUI. But also makes it easily possible to do
> the DTBs development on the latest vanilla (5.14-rc2 as of
> the time of writing this) kernel for the
> MyBook Live Single and Duo:
> 
> <https://github.com/chunkeey/mbl-debian>

Thanks for the pointer.

> I can't really make one for the MR24 though. Its 32MiB NAND
> makes it difficult to install anything else than OpenWrt
> (and get some use out of the device).

Not interested in MR24, up to you.

> So, how to proceed?

At least send a v4 :-)

-- 
With Best Regards,
Andy Shevchenko


