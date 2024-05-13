Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC88C44B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2024 18:00:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MxzXKmne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VdPNJ70Lcz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 02:00:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MxzXKmne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VdPMX5HD3z3bnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 02:00:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 704C5CE0F24;
	Mon, 13 May 2024 16:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA2CC113CC;
	Mon, 13 May 2024 16:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715616002;
	bh=k2zBO/pJSJJXeGK42+0QmyGneLPTwY0zTIWbg5TCzdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MxzXKmne4Q0q7RCI54pTOJidMsN+RsKt47FFBV47KtxcReD+agKNZ6QuIZwlpKDFJ
	 r7yNAphTKeaym1EwZwOCBxaOgl5UEw6eU/Wqgt7Az4e/Cb6LQHLV8/zZwH+cr39xBd
	 Zr/NVoF7f5wlVCSibtXWRnuXdQjfxA57MiNn3SE1Hfcot+QSY+2klBOWg35QQTVkgT
	 vcXW86bdIXkeMIMJbvSlybzmJOVEz5qLXccq8tZYcsw1GyYNgEWonvAhs7vSqpAFqV
	 MgdAUAzCSspNpFY3ExqbVGhDRCNGnDaf2xfHBtzPuLk9oRzZN03heKLaKSOCbqjciN
	 WpY42C+27A/yw==
From: Puranjay Mohan <puranjay@kernel.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
In-Reply-To: <wlslraxtexuncmqsfen6gum4sg4viecu4zx73pvlfztjmwxenl@fcoal5io4kse>
References: <20240513100248.110535-1-puranjay@kernel.org>
 <wlslraxtexuncmqsfen6gum4sg4viecu4zx73pvlfztjmwxenl@fcoal5io4kse>
Date: Mon, 13 May 2024 15:59:59 +0000
Message-ID: <mb61pwmnxhfcw.fsf@kernel.org>
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
Cc: Hao Luo <haoluo@google.com>, linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Eduard Zingerman <eddyz87@gmail.com>, paulmck@kernel.org, linuxppc-dev@lists.ozlabs.org, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>, Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Naveen N Rao <naveen@kernel.org> writes:

> On Mon, May 13, 2024 at 10:02:48AM GMT, Puranjay Mohan wrote:
>> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
>> return value to be fully ordered.
>> 
>> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
>> BPF_CMPXCHG) return a value back so they need to be JITed to fully
>> ordered operations. POWERPC currently emits relaxed operations for
>> these.
>> 
>> We can show this by running the following litmus-test:
>> 
>> PPC SB+atomic_add+fetch
>> 
>> {
>> 0:r0=x;  (* dst reg assuming offset is 0 *)
>> 0:r1=2;  (* src reg *)
>> 0:r2=1;
>> 0:r4=y;  (* P0 writes to this, P1 reads this *)
>> 0:r5=z;  (* P1 writes to this, P0 reads this *)
>> 0:r6=0;
>> 
>> 1:r2=1;
>> 1:r4=y;
>> 1:r5=z;
>> }
>> 
>> P0                      | P1            ;
>> stw         r2, 0(r4)   | stw  r2,0(r5) ;
>>                         |               ;
>> loop:lwarx  r3, r6, r0  |               ;
>> mr          r8, r3      |               ;
>> add         r3, r3, r1  | sync          ;
>> stwcx.      r3, r6, r0  |               ;
>> bne         loop        |               ;
>> mr          r1, r8      |               ;
>>                         |               ;
>> lwa         r7, 0(r5)   | lwa  r7,0(r4) ;
>> 
>> ~exists(0:r7=0 /\ 1:r7=0)
>> 
>> Witnesses
>> Positive: 9 Negative: 3
>> Condition ~exists (0:r7=0 /\ 1:r7=0)
>> Observation SB+atomic_add+fetch Sometimes 3 9
>> 
>> This test shows that the older store in P0 is reordered with a newer
>> load to a different address. Although there is a RMW operation with
>> fetch between them. Adding a sync before and after RMW fixes the issue:
>> 
>> Witnesses
>> Positive: 9 Negative: 0
>> Condition ~exists (0:r7=0 /\ 1:r7=0)
>> Observation SB+atomic_add+fetch Never 0 9
>> 
>> [1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
>> [2] https://www.kernel.org/doc/Documentation/atomic_t.txt
>> 
>> Fixes: 65112709115f ("powerpc/bpf/64: add support for BPF_ATOMIC bitwise operations")
>
> As I noted in v2, I think that is the wrong commit. This fixes the below 

Sorry for missing this. Would this need another version or your message
below will make it work with the stable process?

> four commits in mainline:
> Fixes: aea7ef8a82c0 ("powerpc/bpf/32: add support for BPF_ATOMIC bitwise operations")
> Fixes: 2d9206b22743 ("powerpc/bpf/32: Add instructions for atomic_[cmp]xchg")
> Fixes: dbe6e2456fb0 ("powerpc/bpf/64: add support for atomic fetch operations")
> Fixes: 1e82dfaa7819 ("powerpc/bpf/64: Add instructions for atomic_[cmp]xchg")
>
> Cc: stable@vger.kernel.org # v6.0+

Thanks,
Puranjay
