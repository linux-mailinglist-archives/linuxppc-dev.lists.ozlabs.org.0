Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E02DAC38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 12:46:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwGgq6lTvzDqST
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 22:46:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFPJ22ZDzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 21:49:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFPH4byYz9sVt; Tue, 15 Dec 2020 21:49:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
In-Reply-To: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v5 0/5] powerpc/sstep: VSX 32-byte vector paired
 load/store instructions
Message-Id: <160802921325.504444.16042670854448962581.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 21:49:07 +1100 (AEDT)
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
Cc: jniethe5@gmail.com, bala24@linux.ibm.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 11 Oct 2020 10:39:03 +0530, Ravi Bangoria wrote:
> VSX vector paired instructions operates with octword (32-byte)
> operand for loads and stores between storage and a pair of two
> sequential Vector-Scalar Registers (VSRs). There are 4 word
> instructions and 2 prefixed instructions that provides this
> 32-byte storage access operations - lxvp, lxvpx, stxvp, stxvpx,
> plxvp, pstxvp.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/sstep: Emulate prefixed instructions only when CPU_FTR_ARCH_31 is set
      https://git.kernel.org/powerpc/c/ef6879f8c8053cc3b493f400a06d452d7fb13650
[2/5] powerpc/sstep: Cover new VSX instructions under CONFIG_VSX
      https://git.kernel.org/powerpc/c/1817de2f141c718f1a0ae59927ec003e9b144349
[3/5] powerpc/sstep: Support VSX vector paired storage access instructions
      https://git.kernel.org/powerpc/c/af99da74333b06d97ea6a9a2cd8906244da4bb26
[4/5] powerpc/ppc-opcode: Add encoding macros for VSX vector paired instructions
      https://git.kernel.org/powerpc/c/6ce73ba7691555fd182bc68529dc03cbd4378f72
[5/5] powerpc/sstep: Add testcases for VSX vector paired load/store instructions
      https://git.kernel.org/powerpc/c/35785b293da0070a8df19b0193f0e7de6c9eaecb

cheers
