Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF88C425F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 15:46:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QkG5EBcN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdLP16HQVz3cRR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 23:46:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QkG5EBcN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdLNJ51RZz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2024 23:45:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6283CE0EA6;
	Mon, 13 May 2024 13:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EFCC113CC;
	Mon, 13 May 2024 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715607913;
	bh=0OPkApgRov8qvD1jHolUK0luWxRoF9g85rL/jafbLxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkG5EBcNWYeh9tbEoiVl9HJdVNZN4gpae58eTqCEMqen9cDTE2vj9bd46jHtbR0By
	 u8QFCfJJj2Dg91vqbZM6F11LqLJ47YsxvBJmM5XoP4ugHL5OCJS1BzPtu/YjYu5pww
	 vDPo5h3ARLy/u4KGG2WTPImyRWHp9CJ8/E9dMOoD9Bgq1n8ofcbI7pvZPnUvz1ikmL
	 nlmX+6/OoskIslj7kotU0LefHGBdA5lxWKxGVn3W9f0aOEw8HU7SPGuE5tAFaFU9pH
	 3QZGtfpwvRrJiMbYHv4LNaJ/1ntp2/xGTi4s8x3j/zQW76W0KjTWHjevAA9jFLzt4G
	 c93k+dRGKBdSA==
Date: Mon, 13 May 2024 19:14:58 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
Message-ID: <wlslraxtexuncmqsfen6gum4sg4viecu4zx73pvlfztjmwxenl@fcoal5io4kse>
References: <20240513100248.110535-1-puranjay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513100248.110535-1-puranjay@kernel.org>
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
Cc: Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, paulmck@kernel.org, Nicholas Piggin <npiggin@gmail.com>, KP Singh <kpsingh@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, Hao Luo <haoluo@google.com>, puranjay12@gmail.com, Martin KaFai Lau <martin.lau@linux.dev>, linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2024 at 10:02:48AM GMT, Puranjay Mohan wrote:
> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
> return value to be fully ordered.
> 
> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
> BPF_CMPXCHG) return a value back so they need to be JITed to fully
> ordered operations. POWERPC currently emits relaxed operations for
> these.
> 
> We can show this by running the following litmus-test:
> 
> PPC SB+atomic_add+fetch
> 
> {
> 0:r0=x;  (* dst reg assuming offset is 0 *)
> 0:r1=2;  (* src reg *)
> 0:r2=1;
> 0:r4=y;  (* P0 writes to this, P1 reads this *)
> 0:r5=z;  (* P1 writes to this, P0 reads this *)
> 0:r6=0;
> 
> 1:r2=1;
> 1:r4=y;
> 1:r5=z;
> }
> 
> P0                      | P1            ;
> stw         r2, 0(r4)   | stw  r2,0(r5) ;
>                         |               ;
> loop:lwarx  r3, r6, r0  |               ;
> mr          r8, r3      |               ;
> add         r3, r3, r1  | sync          ;
> stwcx.      r3, r6, r0  |               ;
> bne         loop        |               ;
> mr          r1, r8      |               ;
>                         |               ;
> lwa         r7, 0(r5)   | lwa  r7,0(r4) ;
> 
> ~exists(0:r7=0 /\ 1:r7=0)
> 
> Witnesses
> Positive: 9 Negative: 3
> Condition ~exists (0:r7=0 /\ 1:r7=0)
> Observation SB+atomic_add+fetch Sometimes 3 9
> 
> This test shows that the older store in P0 is reordered with a newer
> load to a different address. Although there is a RMW operation with
> fetch between them. Adding a sync before and after RMW fixes the issue:
> 
> Witnesses
> Positive: 9 Negative: 0
> Condition ~exists (0:r7=0 /\ 1:r7=0)
> Observation SB+atomic_add+fetch Never 0 9
> 
> [1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
> [2] https://www.kernel.org/doc/Documentation/atomic_t.txt
> 
> Fixes: 65112709115f ("powerpc/bpf/64: add support for BPF_ATOMIC bitwise operations")

As I noted in v2, I think that is the wrong commit. This fixes the below 
four commits in mainline:
Fixes: aea7ef8a82c0 ("powerpc/bpf/32: add support for BPF_ATOMIC bitwise operations")
Fixes: 2d9206b22743 ("powerpc/bpf/32: Add instructions for atomic_[cmp]xchg")
Fixes: dbe6e2456fb0 ("powerpc/bpf/64: add support for atomic fetch operations")
Fixes: 1e82dfaa7819 ("powerpc/bpf/64: Add instructions for atomic_[cmp]xchg")

> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> Acked-by: Paul E. McKenney <paulmck@kernel.org>

Cc: stable@vger.kernel.org # v6.0+

I have tested this with test_bpf and test_progs.
Reviewed-by: Naveen N Rao <naveen@kernel.org>


- Naveen

