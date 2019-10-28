Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49DE7545
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 16:35:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471zLV1pxRzDrQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 02:35:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rjwysocki.net (client-ip=79.96.170.134;
 helo=cloudserver094114.home.pl; envelope-from=rjw@rjwysocki.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
X-Greylist: delayed 386 seconds by postgrey-1.36 at bilbo;
 Tue, 29 Oct 2019 02:33:01 AEDT
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 471zHx0MXszDr61
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 02:33:00 +1100 (AEDT)
Received: from cust-east-parth2-46-193-72-114.wb.wifirst.net (46.193.72.114)
 (HELO kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id b9bc03ccfbeada10; Mon, 28 Oct 2019 16:26:16 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: powernv: fix stack bloat and NR_CPUS
 limitation
Date: Mon, 28 Oct 2019 16:26:16 +0100
Message-ID: <3664438.dB2cPXlXpS@kreacher>
In-Reply-To: <20191018050712.qr2axffmbms5h4xb@vireshk-i7>
References: <20191018045539.3765565-1-jhubbard@nvidia.com>
 <20191018050712.qr2axffmbms5h4xb@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-pm@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, October 18, 2019 7:07:12 AM CET Viresh Kumar wrote:
> On 17-10-19, 21:55, John Hubbard wrote:
> > The following build warning occurred on powerpc 64-bit builds:
> > 
> > drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> > drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> > 
> > This is due to putting 1024 bytes on the stack:
> > 
> >     unsigned int chip[256];
> > 
> > ...and while looking at this, it also has a bug: it fails with a stack
> > overrun, if CONFIG_NR_CPUS > 256.
> > 
> > Fix both problems by dynamically allocating based on CONFIG_NR_CPUS.
> > 
> > Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
> > Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> > Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> > Cc: Viresh Kumar <viresh.kumar@linaro.org>
> > Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> > Cc: linux-pm@vger.kernel.org
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> > 
> > Changes since v1: includes Viresh's review commit fixes.
> > 
> >  drivers/cpufreq/powernv-cpufreq.c | 17 +++++++++++++----
> >  1 file changed, 13 insertions(+), 4 deletions(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> 

Applying as 5.5 material, thanks!




