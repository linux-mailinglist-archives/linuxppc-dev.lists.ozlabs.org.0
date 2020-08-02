Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F923572B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMcd5qKmzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMSz1h6RzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:34:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMSy4tyQz9sTH; Sun,  2 Aug 2020 23:34:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200728130308.1790982-1-bala24@linux.ibm.com>
References: <20200728130308.1790982-1-bala24@linux.ibm.com>
Subject: Re: [PATCH v4 0/3] Add support for divde[.] and divdeu[.] instruction
 emulation
Message-Id: <159637523431.42190.12694331625913087013.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:34:58 +1000 (AEST)
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jul 2020 18:33:05 +0530, Balamuruhan S wrote:
> This patchset adds support to emulate divde, divde., divdeu and divdeu.
> instructions and testcases for it.
> 
> Resend v4: rebased on latest powerpc next branch
> 
> Changes in v4:
> -------------
> Fix review comments from Naveen,
> * replace TEST_DIVDEU() instead of wrongly used TEST_DIVDEU_DOT() in
>   divdeu testcase.
> * Include `acked-by` tag from Naveen for the series.
> * Rebase it on latest mpe's merge tree.
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/ppc-opcode: Add divde and divdeu opcodes
      https://git.kernel.org/powerpc/c/8902c6f96364d1117236948d6c7b9178f428529c
[2/3] powerpc/sstep: Add support for divde[.] and divdeu[.] instructions
      https://git.kernel.org/powerpc/c/151c32bf5ebdd41114267717dc4b53d2632cbd30
[3/3] powerpc/test_emulate_step: Add testcases for divde[.] and divdeu[.] instructions
      https://git.kernel.org/powerpc/c/b859c95cf4b936b5e8019e7ab68ee2740e609ffd

cheers
