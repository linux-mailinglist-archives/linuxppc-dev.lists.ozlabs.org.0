Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E895B8C4AC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 03:09:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nhWdX3An;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VddYs3kHCz3cWR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2024 11:09:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nhWdX3An;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VddY61v68z30TL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2024 11:09:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715648950;
	bh=cJZZq6BaqUzfoKYWBZ/95aiewNAVNaflLJy9ncQn21Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=nhWdX3AnX/lfpTM/3msxKX1vr3ahC0e0aj5/uYWopsMwiOJhDV5Nj/9I89GXiJ3Q/
	 6aWx/cOv3OZ5Xo/4WZgD4+v03yGXP9Y07XFHKiUgCf6W10BmHEh3ar0Z6HIhINcKMB
	 Nvk9huz4bBVvkHluHiCMpZ+lJHDL8VkSbohw0wrxlC3wLUTp0h+L99ji3VJ1t4ZXCl
	 Irb8bpFJpVczlOs7DFojFAjJN7zOYxbbCkp2/BPs86cHpna5tdzFe7teI5Zjk/pgWb
	 lkRs4aODolq4b60AuGvlOMP8nfOQuE2sioi7ZEaPvpXugmAHNmKLhYBf4LxJH1xpS8
	 esjU/uxMK+iMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VddY15HGZz4wc3;
	Tue, 14 May 2024 11:09:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Puranjay Mohan <puranjay@kernel.org>, Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH bpf v3] powerpc/bpf: enforce full ordering for ATOMIC
 operations with BPF_FETCH
In-Reply-To: <mb61pwmnxhfcw.fsf@kernel.org>
References: <20240513100248.110535-1-puranjay@kernel.org>
 <wlslraxtexuncmqsfen6gum4sg4viecu4zx73pvlfztjmwxenl@fcoal5io4kse>
 <mb61pwmnxhfcw.fsf@kernel.org>
Date: Tue, 14 May 2024 11:09:07 +1000
Message-ID: <87h6f1w66k.fsf@mail.lhotse>
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

Puranjay Mohan <puranjay@kernel.org> writes:
> Naveen N Rao <naveen@kernel.org> writes:
>> On Mon, May 13, 2024 at 10:02:48AM GMT, Puranjay Mohan wrote:
>>> The Linux Kernel Memory Model [1][2] requires RMW operations that have a
>>> return value to be fully ordered.
>>> 
>>> BPF atomic operations with BPF_FETCH (including BPF_XCHG and
>>> BPF_CMPXCHG) return a value back so they need to be JITed to fully
>>> ordered operations. POWERPC currently emits relaxed operations for
>>> these.
>>> 
>>> We can show this by running the following litmus-test:
>>> 
>>> PPC SB+atomic_add+fetch
>>> 
>>> {
>>> 0:r0=x;  (* dst reg assuming offset is 0 *)
>>> 0:r1=2;  (* src reg *)
>>> 0:r2=1;
>>> 0:r4=y;  (* P0 writes to this, P1 reads this *)
>>> 0:r5=z;  (* P1 writes to this, P0 reads this *)
>>> 0:r6=0;
>>> 
>>> 1:r2=1;
>>> 1:r4=y;
>>> 1:r5=z;
>>> }
>>> 
>>> P0                      | P1            ;
>>> stw         r2, 0(r4)   | stw  r2,0(r5) ;
>>>                         |               ;
>>> loop:lwarx  r3, r6, r0  |               ;
>>> mr          r8, r3      |               ;
>>> add         r3, r3, r1  | sync          ;
>>> stwcx.      r3, r6, r0  |               ;
>>> bne         loop        |               ;
>>> mr          r1, r8      |               ;
>>>                         |               ;
>>> lwa         r7, 0(r5)   | lwa  r7,0(r4) ;
>>> 
>>> ~exists(0:r7=0 /\ 1:r7=0)
>>> 
>>> Witnesses
>>> Positive: 9 Negative: 3
>>> Condition ~exists (0:r7=0 /\ 1:r7=0)
>>> Observation SB+atomic_add+fetch Sometimes 3 9
>>> 
>>> This test shows that the older store in P0 is reordered with a newer
>>> load to a different address. Although there is a RMW operation with
>>> fetch between them. Adding a sync before and after RMW fixes the issue:
>>> 
>>> Witnesses
>>> Positive: 9 Negative: 0
>>> Condition ~exists (0:r7=0 /\ 1:r7=0)
>>> Observation SB+atomic_add+fetch Never 0 9
>>> 
>>> [1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
>>> [2] https://www.kernel.org/doc/Documentation/atomic_t.txt
>>> 
>>> Fixes: 65112709115f ("powerpc/bpf/64: add support for BPF_ATOMIC bitwise operations")
>>
>> As I noted in v2, I think that is the wrong commit. This fixes the below 
>
> Sorry for missing this. Would this need another version or your message
> below will make it work with the stable process?

No need for another version. b4 should pick up those tags, or if not
I'll add them by hand.

cheers
