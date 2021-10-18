Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C0430E6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 05:47:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXjVV4lCKz2ypf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 14:46:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JMHchNrz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXjTr2VV1z2yQL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 14:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JMHchNrz; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXjTn3q3Hz4xbb;
 Mon, 18 Oct 2021 14:46:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634528783;
 bh=GOtut4lMGzs2qzyZ65KTwOJYjfGYz9zHALN0yg+X+/Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JMHchNrzOTUkxCl+BdvdSLLICSmbzkyyoAk3TULnCBr5nWi7Qav68ikqmpNA8rSlN
 q/+QyOJdg0KqaVGZiB7ia0Jf7FecSBTxKmLqGHFsTA90U12o8ls6IHTtYbjlS43kLa
 RvSnCRdg6zdwnSNjT6pO0CaT9srSHvuPj+qQal12hLND5/9J0E1NkU2ijFCILwsRdg
 tTx0vOKUNO3woGskvM4XkJthoy7NNdvY63goNxz+vYZp3FAmQuf6dNYE1b5C+wP0XV
 EPuKlQA4j0iKD/y1z+/fSAGSCpPFTy8L7v8XiVzj7tRrdprQoF7XgiWs61y8xjt+gS
 0kdLnDUYVGkSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] Add mem_hops field in perf_mem_data_src structure
In-Reply-To: <20211007064933.GK174703@worktop.programming.kicks-ass.net>
References: <20211006140654.298352-1-kjain@linux.ibm.com>
 <20211007064933.GK174703@worktop.programming.kicks-ass.net>
Date: Mon, 18 Oct 2021 14:46:18 +1100
Message-ID: <87pms3c7w5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: mark.rutland@arm.com, atrajeev@linux.vnet.ibm.com, ak@linux.intel.com,
 daniel@iogearbox.net, rnsastry@linux.ibm.com,
 alexander.shishkin@linux.intel.com, linux-kernel@vger.kernel.org,
 acme@kernel.org, ast@kernel.org, linux-perf-users@vger.kernel.org,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org,
 maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Wed, Oct 06, 2021 at 07:36:50PM +0530, Kajol Jain wrote:
>
>> Kajol Jain (4):
>>   perf: Add comment about current state of PERF_MEM_LVL_* namespace and
>>     remove an extra line
>>   perf: Add mem_hops field in perf_mem_data_src structure
>>   tools/perf: Add mem_hops field in perf_mem_data_src structure
>>   powerpc/perf: Fix data source encodings for L2.1 and L3.1 accesses
>> 
>>  arch/powerpc/perf/isa207-common.c     | 26 +++++++++++++++++++++-----
>>  arch/powerpc/perf/isa207-common.h     |  2 ++
>>  include/uapi/linux/perf_event.h       | 19 ++++++++++++++++---
>>  tools/include/uapi/linux/perf_event.h | 19 ++++++++++++++++---
>>  tools/perf/util/mem-events.c          | 20 ++++++++++++++++++--
>>  5 files changed, 73 insertions(+), 13 deletions(-)
>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> How do we want this routed? Shall I take it, or does Michael want it in
> the Power tree?

It's mostly non-powerpc, so I think you should take it.

There's a slim chance we could end up with a conflict in the powerpc
part, but that's no big deal.

cheers
