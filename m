Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13422C7C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:19:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrty3mQfzDrpp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgF1gJQzDrBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgD2gmsz9sSt; Fri, 24 Jul 2020 23:24:39 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
References: <1594996707-3727-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Subject: Re: [v3 00/15] powerpc/perf: Add support for power10 PMU Hardware
Message-Id: <159559696725.1657499.1923355146159125034.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:39 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, maddy@linux.vnet.ibm.com,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, svaidyan@in.ibm.com,
 acme@kernel.org, jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Jul 2020 10:38:12 -0400, Athira Rajeev wrote:
> The patch series adds support for power10 PMU hardware.
> 
> Patches 1..3 are the clean up patches which refactors the way how
> PMU SPR's are stored in core-book3s and in KVM book3s, as well as update
> data type for PMU cache_events.
> 
> Patches 12 and 13 adds base support for perf extended register
> capability in powerpc. Support for extended regs in power10 is
> covered in patches 14,15
> 
> [...]

Patches 1-11 applied to powerpc/next.

[01/15] powerpc/perf: Update cpu_hw_event to use `struct` for storing MMCR registers
        https://git.kernel.org/powerpc/c/78d76819e6f04672989506e7792895a51438516e
[02/15] KVM: PPC: Book3S HV: Cleanup updates for kvm vcpu MMCR
        https://git.kernel.org/powerpc/c/7e4a145e5b675d5a9182f756950f001eaa256795
[03/15] powerpc/perf: Update Power PMU cache_events to u64 type
        https://git.kernel.org/powerpc/c/9d4fc86dcd510dab5521a6c891f9bf379b85a7e0
[04/15] powerpc/perf: Add support for ISA3.1 PMU SPRs
        https://git.kernel.org/powerpc/c/c718547e4a92d74089f862457adf1f617c498e16
[05/15] KVM: PPC: Book3S HV: Save/restore new PMU registers
        https://git.kernel.org/powerpc/c/5752fe0b811bb3cee531c52074921c6dd09dc42d
[06/15] powerpc/xmon: Add PowerISA v3.1 PMU SPRs
        https://git.kernel.org/powerpc/c/1979ae8c7215718c7a98f038bad0122034ad6529
[07/15] powerpc/perf: Add Power10 PMU feature to DT CPU features
        https://git.kernel.org/powerpc/c/9908c826d5ed150637a3a4c0eec5146a0c438f21
[08/15] powerpc/perf: power10 Performance Monitoring support
        https://git.kernel.org/powerpc/c/a64e697cef23b3d24bac700f6d66c8e2bf8efccc
[09/15] powerpc/perf: Ignore the BHRB kernel address filtering for P10
        https://git.kernel.org/powerpc/c/bfe3b1945d5e0531103b3d4ab3a367a1a156d99a
[10/15] powerpc/perf: Add Power10 BHRB filter support for PERF_SAMPLE_BRANCH_IND_CALL/COND
        https://git.kernel.org/powerpc/c/80350a4bac992e3404067d31ff901ae9ff76aaa8
[11/15] powerpc/perf: BHRB control to disable BHRB logic when not used
        https://git.kernel.org/powerpc/c/1cade527f6e9bec6a6412d0641643c359ada8096

cheers
