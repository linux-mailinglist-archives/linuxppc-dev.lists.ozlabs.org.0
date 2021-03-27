Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C8034B754
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 14:15:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6zq46yTtz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 00:15:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nABiofRL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nABiofRL; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6zpd2Fbqz2xy7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 00:15:03 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F6zpX6Zfwz9sRf;
 Sun, 28 Mar 2021 00:15:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616850902;
 bh=xls+amKq9a2UqqHe5tYvXJf76OIDuOI+WrJU2CpUwE8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=nABiofRL4eKiuEcFKd/EuCctuw2IxIF5R9r0jvwB74JUobLq3Pg/S2ke2Ob+LBGST
 45L+BlSd5NkLsx4ZhXe6iZsjbpS9BUgpW/r8gdr8x4qbBhAiCWNnPANtDgRLvsnwMe
 3mQCwCHDmY+VGQFKMMh1UeNUGAbae213I6DshWJ1A63W/2PCbDikAGaozMRsUZuEKi
 7EN51eNO/F+XuLDcV9qBk5kw2VQRWyjMPLldIg6M5VUooYsCD1b0kdnxBoC8nFXr2S
 IxZSpijIHnplQ1mHrpdCiZ1uTwKCoZtzafBpSe5IszwgfB/8r4KMCj247fK63h4JBZ
 7XoR2SZ9Z56/w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnaldo <arnaldo.melo@gmail.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage
 cycles using PERF_SAMPLE_WEIGHT_STRUCT
In-Reply-To: <2BAC42AE-6BD3-45EF-8867-1A15F25FE80B@gmail.com>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
 <YFyJr+R24TlrMNrC@kernel.org>
 <YFygSdFOT5B0DwRU@hirez.programming.kicks-ass.net>
 <2BAC42AE-6BD3-45EF-8867-1A15F25FE80B@gmail.com>
Date: Sun, 28 Mar 2021 00:14:56 +1100
Message-ID: <874kgwhh67.fsf@mpe.ellerman.id.au>
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 kjain@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 jolsa@kernel.org, linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnaldo <arnaldo.melo@gmail.com> writes:
> On March 25, 2021 11:38:01 AM GMT-03:00, Peter Zijlstra <peterz@infradead.org> wrote:
>>On Thu, Mar 25, 2021 at 10:01:35AM -0300, Arnaldo Carvalho de Melo
>>wrote:.
>>> > > Also for CPU_FTR_ARCH_31, capture the two cycle counter
>>information in
>>> > > two 16 bit fields of perf_sample_weight structure.
>>> > 
>>> > Changes looks fine to me.
>>> > 
>>> > Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> 
>>> So who will process the kernel bits? I'm merging the tooling parts,
>>
>>I was sorta expecting these to go through the powerpc tree. Let me know
>>if you want them in tip/perf/core instead.
>
> Shouldn't matter by which tree it gets upstream, as long as it gets picked :-)

I plan to take them, just haven't got around to it yet :}

cheers
