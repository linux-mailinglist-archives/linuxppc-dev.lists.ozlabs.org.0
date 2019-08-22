Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F82994F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:28:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DljM2cQ0zDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:28:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGf5X9rzDrQ3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:08:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGd71RPz9sNk; Thu, 22 Aug 2019 23:08:57 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a6717c01ddc259f6f73364779df058e2c67309f8
In-Reply-To: <20190802192926.19277-2-nathanl@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 1/3] powerpc/rtas: use device model APIs and
 serialization during LPM
Message-Id: <46DlGd71RPz9sNk@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:57 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-02 at 19:29:24 UTC, Nathan Lynch wrote:
> The LPAR migration implementation and userspace-initiated cpu hotplug
> can interleave their executions like so:
> 
> 1. Set cpu 7 offline via sysfs.
> 
> 2. Begin a partition migration, whose implementation requires the OS
>    to ensure all present cpus are online; cpu 7 is onlined:
> 
>      rtas_ibm_suspend_me -> rtas_online_cpus_mask -> cpu_up
> 
>    This sets cpu 7 online in all respects except for the cpu's
>    corresponding struct device; dev->offline remains true.
> 
> 3. Set cpu 7 online via sysfs. _cpu_up() determines that cpu 7 is
>    already online and returns success. The driver core (device_online)
>    sets dev->offline = false.
> 
> 4. The migration completes and restores cpu 7 to offline state:
> 
>      rtas_ibm_suspend_me -> rtas_offline_cpus_mask -> cpu_down
> 
> This leaves cpu7 in a state where the driver core considers the cpu
> device online, but in all other respects it is offline and
> unused. Attempts to online the cpu via sysfs appear to succeed but the
> driver core actually does not pass the request to the lower-level
> cpuhp support code. This makes the cpu unusable until the cpu device
> is manually set offline and then online again via sysfs.
> 
> Instead of directly calling cpu_up/cpu_down, the migration code should
> use the higher-level device core APIs to maintain consistent state and
> serialize operations.
> 
> Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a6717c01ddc259f6f73364779df058e2c67309f8

cheers
