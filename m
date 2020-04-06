Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C9919F6D4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:24:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrqD6WxZzDqDX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:24:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrPf2LnzzDr6v
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:05:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrPZ4vwHz9sSX; Mon,  6 Apr 2020 23:05:37 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: a95a0a1654f16366360399574e10efd87e867b39
In-Reply-To: <20200320110119.10207-1-ganeshgr@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/pseries: Fix MCE handling on pseries
Message-Id: <48wrPZ4vwHz9sSX@ozlabs.org>
Date: Mon,  6 Apr 2020 23:05:37 +1000 (AEST)
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
Cc: mahesh@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-03-20 at 11:01:19 UTC, Ganesh Goudar wrote:
> MCE handling on pSeries platform fails as recent rework to use common
> code for pSeries and PowerNV in machine check error handling tries to
> access per-cpu variables in realmode. The per-cpu variables may be
> outside the RMO region on pSeries platform and needs translation to be
> enabled for access. Just moving these per-cpu variable into RMO region
> did'nt help because we queue some work to workqueues in real mode, which
> again tries to touch per-cpu variables. Also fwnmi_release_errinfo()
> cannot be called when translation is not enabled.
> 
> This patch fixes this by enabling translation in the exception handler
> when all required real mode handling is done. This change only affects
> the pSeries platform.
> 
> Without this fix below kernel crash is seen on injecting
> SLB multihit:
> 
> BUG: Unable to handle kernel data access on read at 0xc00000027b205950
> Faulting instruction address: 0xc00000000003b7e0
> Oops: Kernel access of bad area, sig: 11 [#1]
> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
> Modules linked in: mcetest_slb(OE+) af_packet(E) xt_tcpudp(E) ip6t_rpfilter(E) ip6t_REJECT(E) ipt_REJECT(E) xt_conntrack(E) ip_set(E) nfnetlink(E) ebtable_nat(E) ebtable_broute(E) ip6table_nat(E) ip6table_mangle(E) ip6table_raw(E) ip6table_security(E) iptable_nat(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) iptable_mangle(E) iptable_raw(E) iptable_security(E) ebtable_filter(E) ebtables(E) ip6table_filter(E) ip6_tables(E) iptable_filter(E) ip_tables(E) x_tables(E) xfs(E) ibmveth(E) vmx_crypto(E) gf128mul(E) uio_pdrv_genirq(E) uio(E) crct10dif_vpmsum(E) rtc_generic(E) btrfs(E) libcrc32c(E) xor(E) zstd_decompress(E) zstd_compress(E) raid6_pq(E) sr_mod(E) sd_mod(E) cdrom(E) ibmvscsi(E) scsi_transport_srp(E) crc32c_vpmsum(E) dm_mod(E) sg(E) scsi_mod(E)
> CPU: 34 PID: 8154 Comm: insmod Kdump: loaded Tainted: G OE 5.5.0-mahesh #1
> NIP: c00000000003b7e0 LR: c0000000000f2218 CTR: 0000000000000000
> REGS: c000000007dcb960 TRAP: 0300 Tainted: G OE (5.5.0-mahesh)
> MSR: 8000000000001003 <SF,ME,RI,LE> CR: 28002428 XER: 20040000
> CFAR: c0000000000f2214 DAR: c00000027b205950 DSISR: 40000000 IRQMASK: 0
> GPR00: c0000000000f2218 c000000007dcbbf0 c000000001544800 c000000007dcbd70
> GPR04: 0000000000000001 c000000007dcbc98 c008000000d00258 c0080000011c0000
> GPR08: 0000000000000000 0000000300000003 c000000001035950 0000000003000048
> GPR12: 000000027a1d0000 c000000007f9c000 0000000000000558 0000000000000000
> GPR16: 0000000000000540 c008000001110000 c008000001110540 0000000000000000
> GPR20: c00000000022af10 c00000025480fd70 c008000001280000 c00000004bfbb300
> GPR24: c000000001442330 c00800000800000d c008000008000000 4009287a77000510
> GPR28: 0000000000000000 0000000000000002 c000000001033d30 0000000000000001
> NIP [c00000000003b7e0] save_mce_event+0x30/0x240
> LR [c0000000000f2218] pseries_machine_check_realmode+0x2c8/0x4f0
> Call Trace:
> Instruction dump:
> 3c4c0151 38429050 7c0802a6 60000000 fbc1fff0 fbe1fff8 f821ffd1 3d42ffaf
> 3fc2ffaf e98d0030 394a1150 3bdef530 <7d6a62aa> 1d2b0048 2f8b0063 380b0001
> ---[ end trace 46fd63f36bbdd940 ]---
> 
> Fixes: 9ca766f9891d ("powerpc/64s/pseries: machine check convert to use common event code")
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a95a0a1654f16366360399574e10efd87e867b39

cheers
