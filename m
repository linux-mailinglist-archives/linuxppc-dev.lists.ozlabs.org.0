Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592D2223AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:15:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6vrs0RMrzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPY6NRKzDqLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:55:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPX5nyWz9sTF; Thu, 16 Jul 2020 22:55:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200624113038.908074-1-bala24@linux.ibm.com>
References: <20200624113038.908074-1-bala24@linux.ibm.com>
Subject: Re: [PATCH v2 0/6] consolidate PowerPC instruction encoding macros
Message-Id: <159490401620.3805857.3389858911871132386.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:43 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, paulus@samba.org, sandipan@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 24 Jun 2020 17:00:32 +0530, Balamuruhan S wrote:
> ppc-opcode.h have base instruction encoding wrapped with stringify_in_c()
> for raw encoding to have compatibility. But there are redundant macros for
> base instruction encodings in bpf, instruction emulation test infrastructure
> and powerpc selftests.
> 
> Currently PPC_INST_* macros are used for encoding instruction opcode and PPC_*
> for raw instuction encoding, this rfc patchset introduces PPC_RAW_* macros for
> base instruction encoding and reuse it from elsewhere. With this change we can
> avoid redundant macro definitions in multiple files and start adding new
> instructions in ppc-opcode.h in future.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/ppc-opcode: Introduce PPC_RAW_* macros for base instruction encoding
      https://git.kernel.org/powerpc/c/db551f8cc6a33f79cd2d2a6cfd1903f044e828a8
[2/6] powerpc/ppc-opcode: Move ppc instruction encoding from test_emulate_step
      https://git.kernel.org/powerpc/c/1d33dd84080f4a430bde2fc363d9b70f0a010c19
[3/6] powerpc/bpf_jit: Reuse instruction macros from ppc-opcode.h
      https://git.kernel.org/powerpc/c/0654186510a40e7e1fa788cb941d1a156ba2dcb2
[4/6] powerpc/ppc-opcode: Consolidate powerpc instructions from bpf_jit.h
      https://git.kernel.org/powerpc/c/3a181237916310b2bbbad158d97933bb2b4e7552
[5/6] powerpc/ppc-opcode: Reuse raw instruction macros to stringify
      https://git.kernel.org/powerpc/c/357c572948310c88868cee00e64ca3f7fc933a74
[6/6] powerpc/ppc-opcode: Fold PPC_INST_* macros into PPC_RAW_* macros
      https://git.kernel.org/powerpc/c/e4208f1399b1bf7ed84ba359a6ba0979d1df4029

cheers
