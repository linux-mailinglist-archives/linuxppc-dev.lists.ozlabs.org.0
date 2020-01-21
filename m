Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAD814362D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:23:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wQM2TVVzDqQL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:23:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wNT75HDzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:22:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R5/TPcQ4; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wNT5KPQz9sNx; Tue, 21 Jan 2020 15:22:01 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 481wNT0xcpz9sNF;
 Tue, 21 Jan 2020 15:22:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579580521;
 bh=pvfq9znufitCPnK5AoQJmCyQcVAQIpGzNjSX9H1iM4Q=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=R5/TPcQ4g8CFMvAFyDMmIeVCSJQs49JXsmiQ7gbIcIxeA3+7OO/Gn1Hu2AukQGcW0
 Di5VUAJ8zhkPLE4BsxJ8VYbuqoWtIEBj5JzqaB14J0TpCPhBTsF97YJhZ18d3NBVbq
 CUt7XMd9LxE/GzYHqg/PR/bgJfasKGUPlRYfyNdaueEVLVx/BVDmVnHqfPiduCxkhU
 D5bNe02eZWuvfoMx8kMNqQiD5MUSUJBYOXh/EjDJ+qLAMUdNXCJaQ1m8qrrQb2YAlS
 eNjPYbdiHl1GfIq/o6GSG9TQ00noQlEZ8gJpqDWxJhpc3cdHVUDICeC7bUf1VbXBiL
 3ErPi+zV/7Lzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [RFC PATCH 9/9] powerpc/configs/skiroot: Enable some more
 hardening options
In-Reply-To: <CACPK8XfyVmhiBTj9JnYv_H5zNsg4pA4=LW73nRFHW8=ejtw=-g@mail.gmail.com>
References: <20200116014808.15756-1-mpe@ellerman.id.au>
 <20200116014808.15756-9-mpe@ellerman.id.au>
 <CACPK8XfyVmhiBTj9JnYv_H5zNsg4pA4=LW73nRFHW8=ejtw=-g@mail.gmail.com>
Date: Tue, 21 Jan 2020 15:21:58 +1100
Message-ID: <87wo9ligm1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Stanley <joel@jms.id.au> writes:
> On Thu, 16 Jan 2020 at 01:48, Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Enable more hardening options.
>>
>> Note BUG_ON_DATA_CORRUPTION selects DEBUG_LIST and is essentially just
>> a synonym for it.
>>
>> DEBUG_SG, DEBUG_NOTIFIERS, DEBUG_LIST, DEBUG_CREDENTIALS and
>> SCHED_STACK_END_CHECK should all be low overhead and just add a few
>> extra checks.
>>
>> Unselecting SLAB_MERGE_DEFAULT causes the SLAB to use more memory, but
>> the skiroot kernel shouldn't be memory constrained on any of our
>> systems, all it does is run a small bootloader.
>
> Why do we unselect it?

The help text pretty much explains it:

config SLAB_MERGE_DEFAULT
	bool "Allow slab caches to be merged"
	default y
	help
	  For reduced kernel memory fragmentation, slab caches can be
	  merged when they share the same size and other characteristics.
	  This carries a risk of kernel heap overflows being able to
	  overwrite objects from merged caches (and more easily control
	  cache layout), which makes such heap attacks easier to exploit
	  by attackers. By keeping caches unmerged, these kinds of exploits
	  can usually only damage objects in the same cache. To disable
	  merging at runtime, "slab_nomerge" can be passed on the kernel
	  command line.


So unselecting it uses a bit more memory but has some
security/robustness benefit.

I should probably also mention that it essentially has no effect because
we're also enabling SLUB_DEBUG_ON, and that causes some of the flags in
SLAB_NEVER_MERGE to be set, which also disables merging.

cheers
