Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D8446FAB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 07:36:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9LlW1LYKz3cG2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 17:36:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HuAweMSI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Lkq3wc5z3bWw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 17:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HuAweMSI; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J9Lkk74ZCz4xRB;
 Fri, 10 Dec 2021 17:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639118145;
 bh=0BDvfT/lwdOWFPr+nWUoB/LHFtw+9sdQTq7qe6HZorY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=HuAweMSI/91u6qoNG9Nr6QgxHHZJNJ3170r1TGwu6xACxU3/yU9dtisbEOX/cxh1k
 IdKUXo/OGZH5WEPAI/fJBXMjdSCkG6ama18Lu+4fxR27mASmwt/rn6hEHT/IUBfAWX
 6wHKeDkzH6H+S0+ucVXnhcO8lpfmcosYxJBydFdKNfBteu2AOBoX0eDZUpUeXU3c8Y
 PTgE+zKkjDCUpFWFNRUrYjQqva+6L4+2tCQ36y4tWNRgTdXvmqf0Ep7C9kAX2zYKVl
 9NPwgCobClTPiZs/6V+4PX9YlX7K71JNO138kn8/S1MG9cwphiI6Kqw8uDwJE/skkz
 IYzzjwujUmYUw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, Kajol Jain
 <kjain@linux.ibm.com>
Subject: Re: [PATCH 0/4] perf: Add new macros for mem_hops field
In-Reply-To: <YbJWVYZg1el9PR1I@kernel.org>
References: <20211206091749.87585-1-kjain@linux.ibm.com>
 <YbJWVYZg1el9PR1I@kernel.org>
Date: Fri, 10 Dec 2021 17:35:41 +1100
Message-ID: <87o85pm0g2.fsf@mpe.ellerman.id.au>
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
 daniel@iogearbox.net, rnsastry@linux.ibm.com, peterz@infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, linux-perf-users@vger.kernel.org,
 alexander.shishkin@linux.intel.com, yao.jin@linux.intel.com, mingo@redhat.com,
 paulus@samba.org, maddy@linux.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 songliubraving@fb.com, linuxppc-dev@lists.ozlabs.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnaldo Carvalho de Melo <acme@kernel.org> writes:
> Em Mon, Dec 06, 2021 at 02:47:45PM +0530, Kajol Jain escreveu:
>> Patchset adds new macros for mem_hops field which can be
>> used to represent remote-node, socket and board level details.
>> 
>> Currently the code had macro for HOPS_0, which corresponds
>> to data coming from another core but same node.
>> Add new macros for HOPS_1 to HOPS_3 to represent
>> remote-node, socket and board level data.
>> 
>> For ex: Encodings for mem_hops fields with L2 cache:
>
> I checked and this hasn't hit mainstream, is it already merged on a tree
> where this is slated to be submitted in the next window? If so please
> let me know which one so that I can merge it on perf/core.

I haven't picked it up. I guess the kernel changes are mainly in
powerpc, but I'd at least need an ack from eg. Peter for the generic
perf uapi change.

Equally the whole series could go via tip.

cheers
