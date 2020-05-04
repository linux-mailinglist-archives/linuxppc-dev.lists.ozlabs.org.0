Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338331C374C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 12:55:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0Bh41HRzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 20:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G08B0H1nzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 20:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o4bjIqjI; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49G0895rZ8z9sSd; Mon,  4 May 2020 20:53:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49G08949jLz9sRf;
 Mon,  4 May 2020 20:53:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588589609;
 bh=CJlMcAKGR6GgtqYpe4MFYJD3+LhPIGLYjq5fAuok7ik=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o4bjIqjIviROt6vuX4sF4btAmjI0rlIfKMEgZE/6fJuPHddo5XR/lZVcRYUs4o3oa
 vM163Urt464MW8YkWAWBT03tHNuvm6vHc3aStBe+Vla7iJcEfikUCvhqqouaWGkhOI
 MaGqInv+MShDee5gHJ9juYdMgatz+rbacRgPNQsZkiPIzgaLlDzTYYh5tmrMXgcI/Z
 Hs2EgM/Pa2O8sAvEO6SHfE3XN8NcHKrv7Y7SrWYiNstzvP6Y391WQuQ5W28xGvPn1T
 dCkmUdf7RBJXPjSrXDZfes5Tyf4BhlFd/GA6mF+eC0uhiPnhHyep6XbcUNkOl5thEN
 y7LhiddJct6OQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH] powerpc/64s: Fix unrecoverable SLB crashes due to
 preemption check
In-Reply-To: <alpine.LSU.2.11.2005030008400.1557@eggly.anvils>
References: <20200502143316.929341-1-mpe@ellerman.id.au>
 <alpine.LSU.2.11.2005030008400.1557@eggly.anvils>
Date: Mon, 04 May 2020 20:53:47 +1000
Message-ID: <87a72odl8k.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, hughd@google.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hugh Dickins <hughd@google.com> writes:
> On Sun, 3 May 2020, Michael Ellerman wrote:
>
>> Hugh reported that his trusty G5 crashed after a few hours under load
>> with an "Unrecoverable exception 380".
>> 
>> The crash is in interrupt_return() where we check lazy_irq_pending(),
>> which calls get_paca() and with CONFIG_DEBUG_PREEMPT=y that goes to
>> check_preemption_disabled() via debug_smp_processor_id().
>> 
>> As Nick explained on the list:
>> 
>>   Problem is MSR[RI] is cleared here, ready to do the last few things
>>   for interrupt return where we're not allowed to take any other
>>   interrupts.
>> 
>>   SLB interrupts can happen just about anywhere aside from kernel
>>   text, global variables, and stack. When that hits, it appears to be
>>   unrecoverable due to RI=0.
>> 
>> The problematic access is in preempt_count() which is:
>> 
>> 	return READ_ONCE(current_thread_info()->preempt_count);
>> 
>> Because of THREAD_INFO_IN_TASK, current_thread_info() just points to
>> current, so the access is to somewhere in kernel memory, but not on
>> the stack or in .data, which means it can cause an SLB miss. If we
>> take an SLB miss with RI=0 it is fatal.
>> 
>> The easiest solution is to add a version of lazy_irq_pending() that
>> doesn't do the preemption check and call it from the interrupt return
>> path.
>> 
>> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit logic in C")
>> Reported-by: Hugh Dickins <hughd@google.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Thank you, Michael and Nick: this has been running fine all day for me.

Thanks Hugh.

cheers
