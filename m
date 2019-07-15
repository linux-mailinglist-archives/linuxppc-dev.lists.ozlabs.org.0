Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FF68236
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 04:25:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n6nv3GZNzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 12:25:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n6lj1zDkzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 12:23:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45n6lh4LPgz9sP0;
 Mon, 15 Jul 2019 12:23:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: mm: Limit rma_size to 1TB when running without
 HV mode
In-Reply-To: <1563155904.2145.1.camel@gmail.com>
References: <20190710052018.14628-1-sjitindarsingh@gmail.com>
 <87o91ze6wx.fsf@concordia.ellerman.id.au> <1563155904.2145.1.camel@gmail.com>
Date: Mon, 15 Jul 2019 12:23:44 +1000
Message-ID: <87d0ic9gsv.fsf@concordia.ellerman.id.au>
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
Cc: kvm-ppc@vger.kernel.org, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
> On Fri, 2019-07-12 at 23:09 +1000, Michael Ellerman wrote:
>> Suraj Jitindar Singh <sjitindarsingh@gmail.com> writes:
>> > The virtual real mode addressing (VRMA) mechanism is used when a
>> > partition is using HPT (Hash Page Table) translation and performs
>> > real mode accesses (MSR[IR|DR] = 0) in non-hypervisor mode. In this
>> > mode effective address bits 0:23 are treated as zero (i.e. the
>> > access
>> > is aliased to 0) and the access is performed using an implicit 1TB
>> > SLB
>> > entry.
>> > 
>> > The size of the RMA (Real Memory Area) is communicated to the guest
>> > as
>> > the size of the first memory region in the device tree. And because
>> > of
>> > the mechanism described above can be expected to not exceed 1TB. In
>> > the
>> > event that the host erroneously represents the RMA as being larger
>> > than
>> > 1TB, guest accesses in real mode to memory addresses above 1TB will
>> > be
>> > aliased down to below 1TB. This means that a memory access
>> > performed in
>> > real mode may differ to one performed in virtual mode for the same
>> > memory
>> > address, which would likely have unintended consequences.
>> > 
>> > To avoid this outcome have the guest explicitly limit the size of
>> > the
>> > RMA to the current maximum, which is 1TB. This means that even if
>> > the
>> > first memory block is larger than 1TB, only the first 1TB should be
>> > accessed in real mode.
>> > 
>> > Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
>> 
>> I added:
>> 
>> Fixes: c3ab300ea555 ("powerpc: Add POWER9 cputable entry")
>> Cc: stable@vger.kernel.org # v4.6+
>> 
>> 
>> Which is not exactly correct, but probably good enough?
>
> I think we actually want:
> Fixes: c610d65c0ad0 ("powerpc/pseries: lift RTAS limit for hash")
>
> Which is what actually caused it to break and for the issue to present
> itself.

Thanks, I used that instead.

cheers
