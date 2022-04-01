Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A764EEC4C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 13:23:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVHqW3gWNz3004
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 22:23:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X//nbiVi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVHpr1mXnz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 22:23:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=X//nbiVi; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KVHph28Kcz4x7X;
 Fri,  1 Apr 2022 22:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1648812188;
 bh=HDlJkirehtEQpQAnpFu8zWenNCxtlEjWmjuk2coGwKQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X//nbiViSK+r/sSWVVC8DfMkUstpwhA33m3ZRhsWYUkrvBsMkKU4tARaVpfnniHKa
 Ln9Kv5e9wZjoRBLUC9OwT+c7SGANQAIuAChJX7iZU3S0F74LU7rDagn7cFwNA1Zqpg
 Mnh3K8U0QE71O6O5T3zKPpwCMStqtruMGzpOLDzwSH1onaj1OBoDuJ5mN0EYAsjMPH
 bjghe1U7uYxbwYnyMN2WlxCidJsruOyNBy+cRjYpCU9KdFG63RKUt4ACXbiWTDQLc2
 6iNU5TMd5aDbXvDIYH7m/7toD2f9173be544cz3Qx/C60nPbgrZveX//dk8yRePiWX
 1fFypsBoHwocQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] Revert "powerpc: Set max_mapnr correctly"
In-Reply-To: <34355f36-1122-9c22-e717-73a957a31a3e@csgroup.eu>
References: <20220216121109.157605-1-wangkefeng.wang@huawei.com>
 <b2ff771c-01ef-3f14-f22d-9248735fdc77@huawei.com>
 <87sfr2fjms.fsf@mpe.ellerman.id.au>
 <34355f36-1122-9c22-e717-73a957a31a3e@csgroup.eu>
Date: Fri, 01 Apr 2022 22:23:04 +1100
Message-ID: <87ee2hf3on.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "songyuanzheng@huawei.com" <songyuanzheng@huawei.com>,
 "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 28/03/2022 =C3=A0 12:37, Michael Ellerman a =C3=A9crit=C2=A0:
>> Kefeng Wang <wangkefeng.wang@huawei.com> writes:
>>> Hi maintainers=EF=BC=8C
>>>
>>> I saw the patches has been reviewed[1], could they be merged?
>>
>> Maybe I'm just misreading the change log, but it seems wrong that we
>> need to add extra checks. pfn_valid() shouldn't return true for vmalloc
>> addresses in the first place, shouldn't we fix that instead? Who knows
>> what else that might be broken because of that.
>
> pfn_valid() doesn't take an address but a PFN

Yeah sorry that was unclear wording on my part.

What I mean is that pfn_valid(virt_to_pfn(some_vmalloc_addr)) should be
false, because virt_to_pfn(vmalloc_addr) should fail.

The right way to convert a vmalloc address to a pfn is with
vmalloc_to_pfn(), which walks the page tables to find the actual pfn
backing that vmalloc addr.

> If you have 1Gbyte of memory you have 256k PFNs.
>
> In a generic config the kernel will map 768 Mbytes of m=C3=A9mory (From
> 0xc0000000 to 0xe0000000) and will use 0xf0000000-0xffffffff for
> everything else including vmalloc.
>
> If you take a page above that 768 Mbytes limit, and tries to linarly
> convert it's PFN to a va, you'll hip vmalloc space. Anyway that PFN is
> valid.

That's true, but it's just some random page in vmalloc space, there's no
guarantee that it's the same page as the PFN you started with.

Note it's not true on 64-bit Book3S. There if you take a valid PFN (ie.
backed by RAM) and convert it to a virtual address (with __va()), you
will never get a vmalloc address.

> So the check really needs to be done in virt_addr_valid().

I don't think it has to, but with the way our virt_to_pfn()/__pa() works
I guess for now it's the easiest solution.

> There is another thing however that would be worth fixing (in another
> patch): that's the virt_to_pfn() in PPC64:
>
> #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
>
> #define __pa(x)								\
> ({									\
> 	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);		\
> 	(unsigned long)(x) & 0x0fffffffffffffffUL;			\
> })
>
>
> So 0xc000000000000000 and 0xd000000000000000 have the same PFN. That's
> wrong.

Yes it was wrong. But we don't use 0xd000000000000000 anymore, so it
shouldn't be an issue in practice.

See 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the sam=
e 0xc range").

I guess it is still a problem for 64-bit Book3E, because they use 0xc
and 0x8.

I looked at fixing __pa()/__va() to use +/- a few years back, but from
memory it still didn't work and/or generated bad code. There's a comment
about it working around a GCC miscompile.

The other thing that makes me reluctant to change it is that I worry we
have places that inadvertantly use __pa() on addresses that are already
physical addresses. If we changed __pa() to use subtraction that would
break, ie. we'd end up with a negative address.

See eg. a6e2c226c3d5 ("powerpc: Fix kernel crash in show_instructions() w/D=
EBUG_VIRTUAL")

So to fix it we'd have to 1) verify that the compiler bug is no longer
an issue and 2) audit uses of __pa()/__va().

cheers
