Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8F4783AA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 09:13:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fjwnGJPi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVLDX0PYQz2xpj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 17:13:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fjwnGJPi;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVLCf5Y9nz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 17:13:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692688380;
	bh=SJsxQb+2HzJMV+XlszngI2wKeDLW6PxOCQm17ZNiClI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fjwnGJPioT0weeWOqyAkgiI1a71lig5O/DDdgp8N8FfiXBZ4/xA5NSEPXKYR/aQaS
	 bMu5yZinGGG0hTRG+wiJPeM1c8cLc0IxXGmae2uiRShM6m4VR7tpM0YcYJRrYTslBH
	 hOFJJs3aCld4D6dEU8ZW5oCjsyntUZ1A1mFIeY62HL1QDCGnGXGDnNTJeWjKZZiJo0
	 uCmJLvG4Mr4WS2MwGzBs+sPQX+JNZl7IOcXaSAPZ9hXBtXqWiB1s2KzCwbU6Rb0KGa
	 nMLzr/3NhO8sXRhDaJM6C3FdXI9fKvkUZhnsyCiOEs1U54tt21eKaO89fIB/OkI2Q3
	 +PPiMUncW/abg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVLCb2MQ1z4x2n;
	Tue, 22 Aug 2023 17:12:59 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Matthew Wilcox <willy@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the mm tree
In-Reply-To: <ZOQLUMBB7amLUJLY@casper.infradead.org>
References: <20230822095537.500047f7@canb.auug.org.au>
 <ZOQLUMBB7amLUJLY@casper.infradead.org>
Date: Tue, 22 Aug 2023 17:12:55 +1000
Message-ID: <87wmxnv9c8.fsf@mail.lhotse>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Matthew Wilcox <willy@infradead.org> writes:
> On Tue, Aug 22, 2023 at 09:55:37AM +1000, Stephen Rothwell wrote:
>> In file included from include/trace/trace_events.h:27,
>>                  from include/trace/define_trace.h:102,
>>                  from fs/xfs/xfs_trace.h:4428,
>>                  from fs/xfs/xfs_trace.c:45:
>> include/linux/pgtable.h:8:25: error: initializer element is not constant
>>     8 | #define PMD_ORDER       (PMD_SHIFT - PAGE_SHIFT)
>
> Ummm.  PowerPC doesn't have a compile-time constant PMD size?

Yeah. The joys of supporting two MMUs with different supported page
sizes in a single kernel binary.

> arch/powerpc/include/asm/book3s/64/pgtable.h:#define PMD_SHIFT  (PAGE_SHIFT + PTE_INDEX_SIZE)
> arch/powerpc/include/asm/book3s/64/pgtable.h:#define PTE_INDEX_SIZE  __pte_index_size
>
> That's really annoying.  I'll try to work around it.

Sorry, thanks.

cheers
