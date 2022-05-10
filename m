Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5052125F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 12:38:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyDzW74PRz3cMH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 20:38:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org;
 receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyDz70jCPz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 20:38:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4FD5617A1;
 Tue, 10 May 2022 10:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEE5C385C6;
 Tue, 10 May 2022 10:38:17 +0000 (UTC)
Date: Tue, 10 May 2022 11:38:13 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <YnpAlYUsUJAL1fFu@arm.com>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 06:09:45PM -0700, Josh Poimboeuf wrote:
> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
> 
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
> ---
>  arch/arm64/include/asm/asm-bug.h |  4 ++--

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
