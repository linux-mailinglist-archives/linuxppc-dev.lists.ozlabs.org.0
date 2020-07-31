Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F9234498
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 13:34:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ4tk6D0gzDqfN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 21:34:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ4qB1NTzzDqNT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 21:31:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=j9+9K8UJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ4q64xhRz9sTM;
 Fri, 31 Jul 2020 21:31:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596195074;
 bh=sEHXx5GmyjktVn/nBfOnSByax6uQ2hzqiMlXONEK7HE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=j9+9K8UJvsoOJPGC52wJJ8GBd4ZXcwaQdD4S6QXKl+SpP33BYz+OKTOgncwB/iZtu
 0LNW01IfHgVvOx+w8gEc6alSQjNJ5V5TxgzBAznm57vQ2SkKu0SdfqxriJ2r6l/JV4
 C2a0u0/P78Yn3f9bp7/4RhsG52eLOQDoizTdx5BoZCHMFMnYtjm4zlMS0KLiyi11tn
 Fsqcr3rpPQE1YFPQoTrFzcAyG/y5MJ9G25Zn0KyOVtXuMuCtmi9pOxTPWWqaDvosMo
 sipNLZxyMiDxo4S6hkVJai1hutnkrmhOsz6PK2WIQU/IOjYcMkB8+ZFmkYPoWQoR5v
 oW5m3k+uPQs9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 07/10] Powerpc/numa: Detect support for coregroup
In-Reply-To: <20200731091859.GG14603@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-8-srikar@linux.vnet.ibm.com>
 <8736585djw.fsf@mpe.ellerman.id.au>
 <20200731091859.GG14603@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 21:31:13 +1000
Message-ID: <87r1sr53b2.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2020-07-31 17:49:55]:
>
>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> > Add support for grouping cores based on the device-tree classification.
>> > - The last domain in the associativity domains always refers to the
>> > core.
>> > - If primary reference domain happens to be the penultimate domain in
>> > the associativity domains device-tree property, then there are no
>> > coregroups. However if its not a penultimate domain, then there are
>> > coregroups. There can be more than one coregroup. For now we would be
>> > interested in the last or the smallest coregroups.
>> 
>> This still doesn't tell me what a coregroup actually represents.
>> 
>> I get that it's a grouping of cores, and that the device tree specifies
>> it for us, but grouping based on what?
>
> We have just abstracted the fact that we are creating a sub-group of cores
> within a DIE. We are limiting to one sub-group per core. However this would
> allow the firmware the flexibility to vary the grouping. Once the firmware
> starts using this group, we could add more code to detect the type of
> grouping and adjust the sd domain flags accordingly.

OK. That's good info to have in the change log.

>> I think the answer is we aren't being told by firmware, it's just a
>> grouping based on some opaque performance characteristic and we just
>> have to take that as given.
>> 
>
> This is partially true. At this time, we dont have firmwares that can
> exploit this code. Once the firmwares start using this grouping, we could
> add more code to align the grouping to the scheduler topology.
>
>> But please explain that clearly in the change log and the code comments.
>> 
>
> Okay, I will do the needful.

Thanks.

cheers
