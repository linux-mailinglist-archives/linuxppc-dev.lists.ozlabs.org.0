Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C528820C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:21:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6ycz3331zDqZx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFN3g30zDqX0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:04:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFM0DcZz9sVK; Fri,  9 Oct 2020 17:04:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200922080254.41497-1-srikar@linux.vnet.ibm.com>
References: <20200922080254.41497-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_reboot_notifier
Message-Id: <160222339682.867048.18221941051626910806.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:04:06 +1100 (AEDT)
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 22 Sep 2020 13:32:54 +0530, Srikar Dronamraju wrote:
> The patch avoids allocating cpufreq_policy on stack hence fixing frame
> size overflow in 'powernv_cpufreq_reboot_notifier'
> 
> ./drivers/cpufreq/powernv-cpufreq.c: In function _powernv_cpufreq_reboot_notifier_:
> ./drivers/cpufreq/powernv-cpufreq.c:906:1: error: the frame size of 2064 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>  }
>  ^
> cc1: all warnings being treated as errors
> make[3]: *** [./scripts/Makefile.build:316: drivers/cpufreq/powernv-cpufreq.o] Error 1
> make[2]: *** [./scripts/Makefile.build:556: drivers/cpufreq] Error 2
> make[1]: *** [./Makefile:1072: drivers] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:157: sub-make] Error 2

Applied to powerpc/next.

[1/1] cpufreq: powernv: Fix frame-size-overflow in powernv_cpufreq_reboot_notifier
      https://git.kernel.org/powerpc/c/a2d0230b91f7e23ceb5d8fb6a9799f30517ec33a

cheers
