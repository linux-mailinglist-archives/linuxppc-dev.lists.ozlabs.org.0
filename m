Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF2EDD7D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 12:09:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47696864HxzF3Pm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 22:09:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rjwysocki.net (client-ip=79.96.170.134;
 helo=cloudserver094114.home.pl; envelope-from=rjw@rjwysocki.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=rjwysocki.net
Received: from cloudserver094114.home.pl (cloudserver094114.home.pl
 [79.96.170.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47693v0T8WzF214
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 22:07:05 +1100 (AEDT)
Received: from 79.184.254.83.ipv4.supernova.orange.pl (79.184.254.83) (HELO
 kreacher.localnet)
 by serwer1319399.home.pl (79.96.170.134) with SMTP (IdeaSmtpServer 0.83.292)
 id 2c11b88dbf4206f5; Mon, 4 Nov 2019 12:07:00 +0100
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3] cpufreq: powernv: fix stack bloat and hard limit on
 num cpus
Date: Mon, 04 Nov 2019 12:06:59 +0100
Message-ID: <8351130.8dpKiuZLPc@kreacher>
In-Reply-To: <20191031052159.4125031-1-jhubbard@nvidia.com>
References: <20191031052159.4125031-1-jhubbard@nvidia.com>
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
Cc: linux-pm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Preeti U Murthy <preeti@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday, October 31, 2019 6:21:59 AM CET John Hubbard wrote:
> The following build warning occurred on powerpc 64-bit builds:
> 
> drivers/cpufreq/powernv-cpufreq.c: In function 'init_chip_info':
> drivers/cpufreq/powernv-cpufreq.c:1070:1: warning: the frame size of
> 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> This is with a cross-compiler based on gcc 8.1.0, which I got from:
>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/8.1.0/
> 
> The warning is due to putting 1024 bytes on the stack:
> 
>     unsigned int chip[256];
> 
> ...and it's also undesirable to have a hard limit on the number of
> CPUs here.
> 
> Fix both problems by dynamically allocating based on num_possible_cpus,
> as recommended by Michael Ellerman.
> 
> Fixes: 053819e0bf840 ("cpufreq: powernv: Handle throttling due to Pmax capping at chip level")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
> Cc: Preeti U Murthy <preeti@linux.vnet.ibm.com>
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: linux-pm@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> 
> Changes since v2: applied fixes from Michael Ellerman's review:
> 
> * Changed from CONFIG_NR_CPUS to num_possible_cpus()
> 
> * Fixed up commit description: added a note about exactly which
>   compiler generates the warning. And softened up wording about
>   the limitation on number of CPUs.
> 
> Changes since v1: includes Viresh's review commit fixes.

Applying as 5.5 material, thanks!



