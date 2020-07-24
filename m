Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 772A422C48F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 13:51:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCnbb0jx1zF0cD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 21:51:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCnYN2qK9zF09S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 21:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OKD0aO22; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BCnYL48LKz9sR4;
 Fri, 24 Jul 2020 21:49:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595591368;
 bh=Jm16wXXOJz29zgLTxQ66zNlgrNonoBxdXFQ47j6OoU8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OKD0aO22ftYxqtxpLN7ym5Linly8SinS9ZdMZdKhpglYvMg7k91HCZI05aXLrP00E
 E6JdaP5I7dd+cZZe1q/zTwBks41cW87FI7GVAeMfUQeCyuWNEeW027BkYclkpTfCUr
 CRw0U+C7Cvcal1/BmfQQbkmBhLXGkhJe+KybttDACKP87htk3G0dXHz0702LNL2odS
 F/bMvKKQvpf0JhYKafMikmIAvOirqetCFfIXMkbDzKyqhIfBR0GeZ1wBUP78PAuYn7
 +1KwavyNBAK8rsTy7GqYc2CZp8+gOAshFsIpSKBhCH9eHdeForTBDokK8HPyujgS+6
 ayotUffbSNR+Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: RE: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
In-Reply-To: <20200722074929.GI7339@oc0525413822.ibm.com>
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
 <875zags3qp.fsf@mpe.ellerman.id.au>
 <20200722074929.GI7339@oc0525413822.ibm.com>
Date: Fri, 24 Jul 2020 21:49:23 +1000
Message-ID: <87pn8lp1z0.fsf@mpe.ellerman.id.au>
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
Cc: ldufour@linux.ibm.com, aik@ozlabs.ru, kvm-ppc@vger.kernel.org,
 bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ram Pai <linuxram@us.ibm.com> writes:
> On Wed, Jul 22, 2020 at 12:06:06PM +1000, Michael Ellerman wrote:
>> Ram Pai <linuxram@us.ibm.com> writes:
>> > An instruction accessing a mmio address, generates a HDSI fault.  This fault is
>> > appropriately handled by the Hypervisor.  However in the case of secureVMs, the
>> > fault is delivered to the ultravisor.
>> >
>> > Unfortunately the Ultravisor has no correct-way to fetch the faulting
>> > instruction. The PEF architecture does not allow Ultravisor to enable MMU
>> > translation. Walking the two level page table to read the instruction can race
>> > with other vcpus modifying the SVM's process scoped page table.
>> 
>> You're trying to read the guest's kernel text IIUC, that mapping should
>> be stable. Possibly permissions on it could change over time, but the
>> virtual -> real mapping should not.
>
> Actually the code does not capture the address of the instruction in the
> sprg0 register. It captures the instruction itself. So should the mapping
> matter?
>> 
>> > This problem can be correctly solved with some help from the kernel.
>> >
>> > Capture the faulting instruction in SPRG0 register, before executing the
>> > faulting instruction. This enables the ultravisor to easily procure the
>> > faulting instruction and emulate it.
>> 
>> This is not something I'm going to merge. Sorry.
>
> Ok. Will consider other approaches.

To elaborate ...

You've basically invented a custom ucall ABI. But a really strange one
which takes an instruction as its first parameter in SPRG0, and then
subsequent parameters in any GPR depending on what the instruction was.

The UV should either emulate the instruction, which means the guest
should not be expected to do anything other than execute the
instruction. Or it should be done with a proper ucall that the guest
explicitly makes with a well defined ABI.

cheers
