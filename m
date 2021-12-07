Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673846BCAD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:32:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7h6x6bgPz3cCG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:32:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7h2S5Kfjz305L
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:28:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J7h2S4PnHz4xh7;
 Wed,  8 Dec 2021 00:28:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20211124093254.1054750-1-mpe@ellerman.id.au>
References: <20211124093254.1054750-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/6] powerpc/85xx: Fix no previous prototype warning for
 mpc85xx_setup_pmc()
Message-Id: <163888360265.3690807.13968827854789510903.b4-ty@ellerman.id.au>
Date: Wed, 08 Dec 2021 00:26:42 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 24 Nov 2021 20:32:49 +1100, Michael Ellerman wrote:
> Fixes the following W=1 warning:
>   arch/powerpc/platforms/85xx/mpc85xx_pm_ops.c:89:12: warning: no previous prototype for 'mpc85xx_setup_pmc'
> 
> 

Applied to powerpc/next.

[1/6] powerpc/85xx: Fix no previous prototype warning for mpc85xx_setup_pmc()
      https://git.kernel.org/powerpc/c/4ea9e321c27fd531a8dfe0fa1d1b2ee15fc3444e
[2/6] powerpc/85xx: Make mpc85xx_smp_kexec_cpu_down() static
      https://git.kernel.org/powerpc/c/84a61fb43fdfc528a3a7ff00e0b14ba91f5eb745
[3/6] powerpc/85xx: Make c293_pcie_pic_init() static
      https://git.kernel.org/powerpc/c/d9150d5bb5586dc20b6c424e59d5ea29fe1b3030
[4/6] powerpc/mm: Move tlbcam_sz() and make it static
      https://git.kernel.org/powerpc/c/ff47a95d1a67477e9bc2049a840d93b68508e079
[5/6] powerpc/smp: Move setup_profiling_timer() under CONFIG_PROFILING
      https://git.kernel.org/powerpc/c/a4ac0d249a5db80e79d573db9e4ad29354b643a8
[6/6] powerpc: Mark probe_machine() __init and static
      https://git.kernel.org/powerpc/c/ab85a273957eadfcf7906bcd8a0adf5909d802ee

cheers
