Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B6A44BFC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 12:05:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hq27j2gNsz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 22:05:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hq27H45xXz2x9N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 22:04:59 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293478964"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="293478964"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:03:41 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="470340341"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 03:03:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mklO3-005OZh-Va; Wed, 10 Nov 2021 13:03:27 +0200
Date: Wed, 10 Nov 2021 13:03:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
Message-ID: <YYum/7MCMlS+KDlX@smile.fi.intel.com>
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
 <YXwZihLk1njsBNT4@smile.fi.intel.com>
 <c0524c86-fc7e-632a-8b2a-862695529115@csgroup.eu>
 <CAHp75VeB8Dmr6Hrupb1Hj=D=oG1zPyJrhCXu37QtXHNNKdNvZg@mail.gmail.com>
 <064efc28-eb86-b729-0bb0-b1f5ed5bbf60@csgroup.eu>
 <CAHp75VfRv6gL5qhgOQ0xN=kUdGeoQOGK+8-YDzm26SZAoWa06w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfRv6gL5qhgOQ0xN=kUdGeoQOGK+8-YDzm26SZAoWa06w@mail.gmail.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Oct 30, 2021 at 10:28:01AM +0300, Andy Shevchenko wrote:
> On Saturday, October 30, 2021, Christophe Leroy <christophe.leroy@csgroup.eu>
> wrote:
> > Le 29/10/2021 à 22:31, Andy Shevchenko a écrit :

...

> > That means that Michael considered it is not for him.
> >
> > And I think the reason is that in MAINTAINERS you have:
> >
> > FREESCALE QUICC ENGINE LIBRARY
> > M:      Qiang Zhao <qiang.zhao@nxp.com>
> > L:      linuxppc-dev@lists.ozlabs.org
> > S:      Maintained
> > F:      drivers/soc/fsl/qe/
> > F:      include/soc/fsl/*qe*.h
> > F:      include/soc/fsl/*ucc*.h
> >
> >
> > FREESCALE SOC DRIVERS
> > M:      Li Yang <leoyang.li@nxp.com>
> > L:      linuxppc-dev@lists.ozlabs.org
> > L:      linux-arm-kernel@lists.infradead.org (moderated for
> > non-subscribers)
> > S:      Maintained
> > F:      Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> > F:      Documentation/devicetree/bindings/soc/fsl/
> > F:      drivers/soc/fsl/
> > F:      include/linux/fsl/
> >
> Thanks! Now I should understand why get_maintainer hadn’t showed above for
> me.

He-he, there are two bugs in MAINTAINERS.
v2 has been sent with the corresponding fixes and updated Cc list.

-- 
With Best Regards,
Andy Shevchenko


