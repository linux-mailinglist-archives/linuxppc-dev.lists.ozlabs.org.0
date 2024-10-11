Return-Path: <linuxppc-dev+bounces-2088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D9E999ACF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 04:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPrrd40Z3z3bby;
	Fri, 11 Oct 2024 13:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728615441;
	cv=none; b=iK2OBCEAKKLww5w8cMz6o5mW/nsU/1tKPKIx9K4j7GfVlM/8psyIDfngYw2mQbcH23WN2fNikj8LK0QhlTYPZDXKyhaTyr3cdmMgn9BJOhZLyC8GM18q3CXe6fV2GPlaWnd/8jOz6ceXubL1WV6ly1E3CYe1yl6QCinbvxGg6vdDeSiFE39Mr65c5r/+UXw0C8qaaCZWqlc/6GLrdpPr02seKRfUy4GzFysMyPtcxUAcOmcVgoK57t6pmDXeeJI2dt/1vYys/GD6SMIcPbotfZBk/unabSRF/EBWrwWqZjFUkfzr5JGbOvlPthV4G0oCy+8Ow8qTpdov0Ypf66/LNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728615441; c=relaxed/relaxed;
	bh=wpW3iH7IIXlP6/6yKksaYG8NqjTTOAEbPsyVV1ojgxI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k7IYBQlfyfXRYCchhadMippzVWjPx6DlgcC7H36y0gPLIY3ta64VXcjU6ZPIIex3a6a1S61XtTzJ3VRTJTGpwBmqedbUSVLMOKagbohLnfeLoFEKBi74OcfXoDMgtQAI0yDv69vFUI8pnSMRLeHFfGtMQd4IM4v1E21UKmmKghm3CWXk80SrRTGsl1jSu898zMJsphbT+LYJz6qsvzh4jI2/781CM+g/h9eBKOWKUGctDHExvCfMmPWlLxKcpVE/rf0bo7EKhb5HZ+wuGOiChFnvazg2vEpQ7e4i2Vew6utiaFbmKAcm9hYbpRB2WHnrsOrS3OH9fkhHZN67vxsRGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YRzuGY+l; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YRzuGY+l;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPrrb59D2z30VJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 13:57:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728615438;
	bh=wpW3iH7IIXlP6/6yKksaYG8NqjTTOAEbPsyVV1ojgxI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=YRzuGY+lBIuXetsc+qd2jKk7BDPQANtoWEkjLnxJL6R9MnBV1nC2SeOFQ4jhFsYd3
	 843M0cxhsJohxJGCRyfsOiirw3Uq3n6sB6eG/EEpjFZT5FbT2B0SdKZl4KBRTKvw58
	 x4NT9sQA4q7z6BsdMW8lAzl7IkYcYgHdCPhkqgJ8r9SVBo5ktMt/nUWgRD07CxF4sf
	 xIpmhsx1GIX+SX4fQCS2mkg13y/rhZ0OQhGt1MFjRIyZTqftCVobT86Es7hx/iF1CQ
	 QK5sHnJrSBJiy3pvQ/h7WdDMjm2XtENeV0bdWKMAe0SGKt/tKqdErNDcAUljeK6dOD
	 XNjvJMSNmZYWw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPrrZ4VC4z4xPX;
	Fri, 11 Oct 2024 13:57:18 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>, Vishal Chourasia
 <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] powerpc/kvm: Fix spinlock member access for PREEMPT_RT
In-Reply-To: <640d6536-e1b3-4ca8-99f8-676e8905cc3e@redhat.com>
References: <ZwgYXsCDDwsOBZ4a@linux.ibm.com>
 <640d6536-e1b3-4ca8-99f8-676e8905cc3e@redhat.com>
Date: Fri, 11 Oct 2024 13:57:16 +1100
Message-ID: <8734l373eb.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Paolo Bonzini <pbonzini@redhat.com> writes:
> On 10/10/24 20:09, Vishal Chourasia wrote:
>> Hi,
>> 
>> While building the kernel with CONFIG_PREEMPT_RT, I encountered several
>> compilation errors in the PowerPC KVM code. The issues appear in
>> book3s_hv_rm_mmu.c where it tries to access the 'rlock' member of struct
>> spinlock, which doesn't exist in the RT configuration.
>
> How was this tested? I suspect that putting to sleep a task that is 
> running in real mode is a huge no-no.

Yeah.

Even without preempt, spin_lock() can end up in debug/tracing code that
will blow up in real mode.

Vishal, if you look at the history of that file you'll see eg:

  87013f9c602c ("powerpc/kvm/book3s: switch from raw_spin_*lock to arch_spin_lock.")

> The actual solution would have to 
> be to split mmu_lock into a spin_lock and a raw_spin_lock, but that's a 
> huge amount of work probably.  I'd just add a "depends on !PPC || 
> !KVM_BOOK3S_64_HV" or something like that, to prevent enabling KVM-HV on 
> PREEMPT_RT kernels.

Yeah that should work to get something building.

The bulk (or all?) of that file is not used for Radix guests, only for
hash page table MMU guests.

So I think it should be possible to hide that code behind a new CONFIG
option that controls support for HPT guests. And then that option could
be incompatible with PREEMPT_RT. But that will require unstitching some
of the connections between that code and the other ppc KVM code.

cheers

