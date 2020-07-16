Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3696B22247E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:59:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wpZ5NmTzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:59:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vQ26GWQzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPs1fvFz9sT6; Thu, 16 Jul 2020 22:56:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200713144623.508695-1-maddy@linux.ibm.com>
References: <20200713144623.508695-1-maddy@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/perf: Add kernel support for new MSR[HV PR]
 bits in trace-imc
Message-Id: <159490401759.3805857.5732304624752324949.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:56:01 +1000 (AEST)
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
Cc: Anju T Sudhakar <anju@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jul 2020 20:16:23 +0530, Madhavan Srinivasan wrote:
> IMC trace-mode record has MSR[HV PR] bits added in the third DW.
> These bits can be used to set the cpumode for the instruction pointer
> captured in each sample.
> 
> Add support in kernel to use these bits to set the cpumode for
> each sample.

Applied to powerpc/next.

[1/1] powerpc/perf: Add kernel support for new MSR[HV PR] bits in trace-imc
      https://git.kernel.org/powerpc/c/77ca3951cc37727ae8361d583a30da7a1b84e427

cheers
