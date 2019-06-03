Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C7E32FDB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:41:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZRM5dFbzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 22:41:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZFv73SQzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 22:32:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45HZFv4jpmz9sNm; Mon,  3 Jun 2019 22:32:51 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a3bf9fbdad600b1e4335dd90979f8d6072e4f602
X-Patchwork-Hint: ignore
Content-Type: text/plain; charset="utf-8";
In-Reply-To: <155791470178.432724.8008395673479905061.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix xive=off command line
Message-Id: <45HZFv4jpmz9sNm@ozlabs.org>
Date: Mon,  3 Jun 2019 22:32:51 +1000 (AEST)
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
Cc: pavrampu@in.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?utf-8?b?Q8Op?= =?utf-8?q?dric?= Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-15 at 10:05:01 UTC, Greg Kurz wrote:
> On POWER9, if the hypervisor supports XIVE exploitation mode, the guest OS
> will unconditionally requests for the XIVE interrupt mode even if XIVE was
> deactivated with the kernel command line xive=off. Later on, when the spapr
> XIVE init code handles xive=off, it disables XIVE and tries to fall back on
> the legacy mode XICS.
> 
> This discrepency causes a kernel panic because the hypervisor is configured
> to provide the XIVE interrupt mode to the guest :
> 
> [    0.008837] kernel BUG at arch/powerpc/sysdev/xics/xics-common.c:135!
> [    0.008877] Oops: Exception in kernel mode, sig: 5 [#1]
> [    0.008908] LE SMP NR_CPUS=1024 NUMA pSeries
> [    0.008939] Modules linked in:
> [    0.008964] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.0.13-200.fc29.ppc64le #1
> [    0.009018] NIP:  c000000001029ab8 LR: c000000001029aac CTR: c0000000018e0000
> [    0.009065] REGS: c0000007f96d7900 TRAP: 0700   Tainted: G        W          (5.0.13-200.fc29.ppc64le)
> [    0.009119] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000222  XER: 20040000
> [    0.009168] CFAR: c0000000001b1e28 IRQMASK: 0
> [    0.009168] GPR00: c000000001029aac c0000007f96d7b90 c0000000015e8600 0000000000000000
> [    0.009168] GPR04: 0000000000000001 0000000000000000 0000000000000061 646f6d61696e0d0a
> [    0.009168] GPR08: 00000007fd8f0000 0000000000000001 c0000000014c44c0 c0000007f96d76cf
> [    0.009168] GPR12: 0000000000000000 c0000000018e0000 0000000000000001 0000000000000000
> [    0.009168] GPR16: 0000000000000000 0000000000000001 c0000007f96d7c08 c0000000016903d0
> [    0.009168] GPR20: c0000007fffe04e8 ffffffffffffffea c000000001620164 c00000000161fe58
> [    0.009168] GPR24: c000000000ea6c88 c0000000011151a8 00000000006000c0 c0000007f96d7c34
> [    0.009168] GPR28: 0000000000000000 c0000000014b286c c000000001115180 c00000000161dc70
> [    0.009558] NIP [c000000001029ab8] xics_smp_probe+0x38/0x98
> [    0.009590] LR [c000000001029aac] xics_smp_probe+0x2c/0x98
> [    0.009622] Call Trace:
> [    0.009639] [c0000007f96d7b90] [c000000001029aac] xics_smp_probe+0x2c/0x98 (unreliable)
> [    0.009687] [c0000007f96d7bb0] [c000000001033404] pSeries_smp_probe+0x40/0xa0
> [    0.009734] [c0000007f96d7bd0] [c0000000010212a4] smp_prepare_cpus+0x62c/0x6ec
> [    0.009782] [c0000007f96d7cf0] [c0000000010141b8] kernel_init_freeable+0x148/0x448
> [    0.009829] [c0000007f96d7db0] [c000000000010ba4] kernel_init+0x2c/0x148
> [    0.009870] [c0000007f96d7e20] [c00000000000bdd4] ret_from_kernel_thread+0x5c/0x68
> [    0.009916] Instruction dump:
> [    0.009940] 7c0802a6 60000000 7c0802a6 38800002 f8010010 f821ffe1 3c62001c e863b9a0
> [    0.009988] 4b1882d1 60000000 7c690034 5529d97e <0b090000> 3d22001c e929b998 3ce2ff8f
> 
> Look for xive=off during prom_init and don't ask for XIVE in this case. One
> exception though: if the host only supports XIVE, we still want to boot so
> we ignore xive=off.
> 
> Similarly, have the spapr XIVE init code to looking at the interrupt mode
> negociated during CAS, and ignore xive=off if the hypervisor only supports
> XIVE.
> 
> Fixes: eac1e731b59e ("powerpc/xive: guest exploitation of the XIVE interrupt controller")
> Cc: stable@vger.kernel.org # v4.20
> Reported-by: Pavithra R. Prakash <pavrampu@in.ibm.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a3bf9fbdad600b1e4335dd90979f8d60

cheers
