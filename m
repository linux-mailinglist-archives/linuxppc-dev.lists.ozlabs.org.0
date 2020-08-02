Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2A9235709
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:17:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKM4D5mGXzDqP3
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:17:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKM1823XRzDqPK
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:14:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZE71Wycl; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BKM0z2dLrz9sSG;
 Sun,  2 Aug 2020 23:14:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596374059;
 bh=l8Vv313rJGqlK2PcaNCVrGcU8SJlDczW2rNrY770DTs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ZE71Wyclmt4MQrTZPs6iY6nA2eek+wB/iYUyHxx7nWlyJbBID58C0vJfORjrDD43E
 wNND8mtfpDbimWptgmYv4VddxYAmX0rHolg1XVT+G8s2w1bA+8uHwFHNUayBhafmGn
 U3RDd9O7hEfPsfEFxg1WUJgbZZ35QUi0zip6yzBRdj0KvzX0aIma+XejtIevU686ru
 HM91WecXmsJTqK1azOcV4OJmJvhTYVRaSfqOgAvj1ip20Yb1FPEAys0j9IKpP3z8BI
 XGg3VJKFsWHrW1MkBYjbjQi72gF9zJZpWvDX1DLzzpzZpzoVYn1bqH1kWqIhbU7xhV
 gtswbHEE4eTGQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 06/15] powerpc: fadamp: simplify
 fadump_reserve_crash_area()
In-Reply-To: <20200801101854.GD534153@kernel.org>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-7-rppt@kernel.org> <87d04d5hda.fsf@mpe.ellerman.id.au>
 <20200801101854.GD534153@kernel.org>
Date: Sun, 02 Aug 2020 23:14:10 +1000
Message-ID: <87o8nt197h.fsf@mpe.ellerman.id.au>
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Hari Bathini <hbathini@in.ibm.com>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mike Rapoport <rppt@kernel.org> writes:
> On Thu, Jul 30, 2020 at 10:15:13PM +1000, Michael Ellerman wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> > From: Mike Rapoport <rppt@linux.ibm.com>
>> >
>> > fadump_reserve_crash_area() reserves memory from a specified base address
>> > till the end of the RAM.
>> >
>> > Replace iteration through the memblock.memory with a single call to
>> > memblock_reserve() with appropriate  that will take care of proper memory
>>                                      ^
>>                                      parameters?
>> > reservation.
>> >
>> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> > ---
>> >  arch/powerpc/kernel/fadump.c | 20 +-------------------
>> >  1 file changed, 1 insertion(+), 19 deletions(-)
>> 
>> I think this looks OK to me, but I don't have a setup to test it easily.
>> I've added Hari to Cc who might be able to.
>> 
>> But I'll give you an ack in the hope that it works :)
>
> Actually, I did some digging in the git log and the traversal was added
> there on purpose by the commit b71a693d3db3 ("powerpc/fadump: exclude
> memory holes while reserving memory in second kernel")
> Presuming this is still reqruired I'm going to drop this patch and will
> simply replace for_each_memblock() with for_each_mem_range() in v2.

Thanks.

cheers
