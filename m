Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EF4252B9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 14:10:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQ9Bl2qSzz3bj5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 23:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m2/G8kMU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQ9B63zgVz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 23:10:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=m2/G8kMU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQ9B33ZZVz4xbG;
 Thu,  7 Oct 2021 23:10:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633608603;
 bh=tswv+agAP+nnPM54GdkkHLQx92C+XyC1JE/Fs7lTGyo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=m2/G8kMULgmsBv28Dx1cZGzAssVHNfTAM2YUOcnLeVqOCvqmkxyqu77mP1mz+RLUZ
 YuEjqv0UedwK5dkV5HTp9VFRmkT5ErMR9bs69/cfXjM5UcXIvHbOBMT5LLlihY8idz
 Tq/cgMPx/pWyOBAm3LEIZy6MQqsu6oprY7Lqv237QlDJdNw8jLTyHYcV79FWPCpUn2
 6TCixppwtaQ/j5WI7Bgys4OkIz8hSCbyWMITmAWTap1M5xasZ8pJyfRYk97/1xJmDq
 2uaF/Kl+hgZIwbBvCqAyf+scXFG56yCqW97c3HI8Uk/2wkr6TvqKpMVODMCslIgiuG
 bnxQrAvol+0kQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mce: check if event info is valid
In-Reply-To: <4f9431fd-74b0-2ce4-807e-9796b326d729@linux.ibm.com>
References: <20210806132307.367688-1-ganeshgr@linux.ibm.com>
 <4f9431fd-74b0-2ce4-807e-9796b326d729@linux.ibm.com>
Date: Thu, 07 Oct 2021 23:09:59 +1100
Message-ID: <87ily9nii0.fsf@mpe.ellerman.id.au>
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:
> On 8/6/21 6:53 PM, Ganesh Goudar wrote:
>
>> Check if the event info is valid before printing the
>> event information. When a fwnmi enabled nested kvm guest
>> hits a machine check exception L0 and L2 would generate
>> machine check event info, But L1 would not generate any
>> machine check event info as it won't go through 0x200
>> vector and prints some unwanted message.
>>
>> To fix this, 'in_use' variable in machine check event info is
>> no more in use, rename it to 'valid' and check if the event
>> information is valid before logging the event information.
>>
>> without this patch L1 would print following message for
>> exceptions encountered in L2, as event structure will be
>> empty in L1.
>>
>> "Machine Check Exception, Unknown event version 0".
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>
> Hi mpe, Any comments on this patch.

The variable rename is a bit of a distraction.

But ignoring that, how do we end up processing a machine_check_event
that has in_use = 0?

You don't give much detail on what call path you're talking about. I
guess we're coming in via the calls in the KVM code?

In the definition of kvm_vcpu_arch we have:

	struct machine_check_event mce_evt; /* Valid if trap == 0x200 */

And you said we're not going via 0x200 in L1. But so shouldn't we be
teaching the KVM code not to use mce_evt when trap is not 0x200?

cheers
