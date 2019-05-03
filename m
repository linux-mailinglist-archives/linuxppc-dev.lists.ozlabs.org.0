Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAC1280A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:51:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wN892B5jzDqP1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:51:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wN6g18JCzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wN6f6dqYz9sB8; Fri,  3 May 2019 16:50:02 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c1fe190c06723322f2dfac31d3b982c581e434ef
X-Patchwork-Hint: ignore
In-Reply-To: <20190401060312.22670-1-mikey@neuling.org>
To: Michael Neuling <mikey@neuling.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Add force enable of DAWR on P9 option
Message-Id: <44wN6f6dqYz9sB8@ozlabs.org>
Date: Fri,  3 May 2019 16:50:02 +1000 (AEST)
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org,
 Cameron Kaiser <spectre@floodgap.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-04-01 at 06:03:12 UTC, Michael Neuling wrote:
> This adds a flag so that the DAWR can be enabled on P9 via:
>   echo Y > /sys/kernel/debug/powerpc/dawr_enable_dangerous
> 
> The DAWR was previously force disabled on POWER9 in:
>   9654153158 powerpc: Disable DAWR in the base POWER9 CPU features
> Also see Documentation/powerpc/DAWR-POWER9.txt
> 
> This is a dangerous setting, USE AT YOUR OWN RISK.
> 
> Some users may not care about a bad user crashing their box
> (ie. single user/desktop systems) and really want the DAWR.  This
> allows them to force enable DAWR.
> 
> This flag can also be used to disable DAWR access. Once this is
> cleared, all DAWR access should be cleared immediately and your
> machine once again safe from crashing.
> 
> Userspace may get confused by toggling this. If DAWR is force
> enabled/disabled between getting the number of breakpoints (via
> PTRACE_GETHWDBGINFO) and setting the breakpoint, userspace will get an
> inconsistent view of what's available. Similarly for guests.
> 
> For the DAWR to be enabled in a KVM guest, the DAWR needs to be force
> enabled in the host AND the guest. For this reason, this won't work on
> POWERVM as it doesn't allow the HCALL to work. Writes of 'Y' to the
> dawr_enable_dangerous file will fail if the hypervisor doesn't support
> writing the DAWR.
> 
> To double check the DAWR is working, run this kernel selftest:
>   tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> Any errors/failures/skips mean something is wrong.
> 
> Signed-off-by: Michael Neuling <mikey@neuling.org>

Applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/c1fe190c06723322f2dfac31d3b982c5

cheers
