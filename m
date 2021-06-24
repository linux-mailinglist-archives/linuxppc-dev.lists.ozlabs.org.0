Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E28433B30C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 16:01:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9hdT4cQjz3cFn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 00:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9hbM6FdGz3btr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 23:59:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G9hbF25YMz9sX1; Thu, 24 Jun 2021 23:59:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
In-Reply-To: <20210602040441.3984352-1-npiggin@gmail.com>
References: <20210602040441.3984352-1-npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9
 and POWER10 processors
Message-Id: <162454315598.2927609.4257910816986735296.b4-ty@ellerman.id.au>
Date: Thu, 24 Jun 2021 23:59:15 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Jun 2021 14:04:41 +1000, Nicholas Piggin wrote:
> The POWER9 vCPU TLB management code assumes all threads in a core share
> a TLB, and that TLBIEL execued by one thread will invalidate TLBs for
> all threads. This is not the case for SMT8 capable POWER9 and POWER10
> (big core) processors, where the TLB is split between groups of threads.
> This results in TLB multi-hits, random data corruption, etc.
> 
> Fix this by introducing cpu_first_tlb_thread_sibling etc., to determine
> which siblings share TLBs, and use that in the guest TLB flushing code.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors
      https://git.kernel.org/powerpc/c/77bbbc0cf84834ed130838f7ac1988567f4d0288

cheers
