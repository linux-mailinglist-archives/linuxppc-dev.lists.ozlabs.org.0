Return-Path: <linuxppc-dev+bounces-1510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6997E036
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 07:49:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBFYx5RN0z2xfq;
	Sun, 22 Sep 2024 15:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726984165;
	cv=none; b=dWbPs5m79fNB+9S2BR2gH39pzxNAXExrAEo6rTmK6rvMeLJDdq7fFYlUsi7tI3zDrnVRJoZ3/Px5lawuQnaXlZCb2wT22H280Q1tiVtj++lOtrJN7LvFIuVQcy1zZh/PN4xY5EXEgh09LDsEmgnREVLB1t8svCm/jrc0sFWjpOrnl9GXciLxVho932GrRL7qhzkZeVRoHR90Hri7CFND9nCLZ4wbEMMa2foIORITfWeJvnGrAR/NeGagTOmZbeJyuX/j6C7BRqFG2LOuqCUsn0j10bgogMjfXR3KzyozvUk3XsJBKZETplUKuFzBtsrtraAVKBMxt6MIw8EecryH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726984165; c=relaxed/relaxed;
	bh=KJ8GAuvRoBE4TDtP68hjGmNnnkm8bz6sL6UDzZVIijI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eV+HAa1uVte533m0HFK9wNw2GD7BImpare705jP7b5WsC6cm/bj36dUxgSkSfgj65yN/Y96NE1nE5qZ9ndTR6VZccLDBmtG2aFQQ+uSDdIm2efO9Z3vrIAHSjPlVNAoGPaJPTM4Fn+jfLGBzMhFOWyUnlbg8g+e7wwc/f3uM6pwDFIxR/qmAYOUyyOht0SDDvUuYbemZFDdqXBENoYBdzSBPp9XCFP46ZEQmu4lFmpyVE6tZOtIcNsD0hbdJtgNierAqy79zlEexnKcRyQ10w0Cy5CmAtpxwzCd4ueeyHBYTQrlb0ESkkSC+bmWcDwL/y6hlAjU4cHh2lSxs+OLH6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GMzlE5wf; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GMzlE5wf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBFYx16pxz2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2024 15:49:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F4D45C4BF4;
	Sun, 22 Sep 2024 05:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85BBC4CEC3;
	Sun, 22 Sep 2024 05:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726984160;
	bh=jJW9B3d+KU2/i9btemTRtY7T483RJ0ApDaKU8HYkSB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GMzlE5wf59FKARtlJgGs2n6P5kt5vtAqTeuh9OzKTGqWA0YNUSM/use4EZK3Gg3TN
	 0xlIRGf6HUJRm/EOzi9BsTj8f3/JaQhU76dvvIGb5K+P3oQvXr5gC260w+FOMGsqGA
	 B0dLfWBFoen4Sdr91RK2j18kS7kz6ve/pGOnaB0vdKo9NItHCOlavdg5GfnPWwZwk4
	 w2kQ6rNTlWA26ls+omY8Jj5l7bg1VpYAwB/dHmY31O0qpj0ekunANrkaW1UVsxvc9O
	 lIdu08TLrfzzxfRfV24zyAboJdh0Avrop6trmGiu2sl5KLRNbDjmyNWFk/bdqVRukb
	 gdn7eRvixtCOA==
X-Mailer: emacs 31.0.50 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com, bp@alien8.de, broonie@kernel.org,
	catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org, maz@kernel.org, mingo@redhat.com,
	mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com, npiggin@gmail.com,
	oliver.upton@linux.dev, shuah@kernel.org, skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com, tglx@linutronix.de, will@kernel.org,
	x86@kernel.org, kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 06/30] arm64: context switch POR_EL0 register
In-Reply-To: <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-7-joey.gouly@arm.com>
 <425b8f8c-b6b5-422a-b5f4-41dd2d1ae3bb@arm.com>
 <6c8ad091-a56b-41ba-b403-2e3c2e578100@intel.com>
Date: Sun, 22 Sep 2024 11:19:05 +0530
Message-ID: <yq5awmj4tezy.fsf@kernel.org>
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

Dave Hansen <dave.hansen@intel.com> writes:

> On 9/11/24 08:01, Kevin Brodsky wrote:
>> On 22/08/2024 17:10, Joey Gouly wrote:
>>> @@ -371,6 +382,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
>>>  		if (system_supports_tpidr2())
>>>  			p->thread.tpidr2_el0 = read_sysreg_s(SYS_TPIDR2_EL0);
>>>  
>>> +		if (system_supports_poe())
>>> +			p->thread.por_el0 = read_sysreg_s(SYS_POR_EL0);
>> Here we are only reloading POR_EL0's value if the target is a user
>> thread. However, as this series stands, POR_EL0 is also relevant to
>> kthreads, because any uaccess or GUP done from a kthread will also be
>> checked against POR_EL0. This is especially important in cases like the
>> io_uring kthread, which accesses the memory of the user process that
>> spawned it. To prevent such a kthread from inheriting a stale value of
>> POR_EL0, it seems that we should reload POR_EL0's value in all cases
>> (user and kernel thread).
>
> The problem with this is trying to figure out which POR_EL0 to use.  The
> kthread could have been spawned ages ago and might not have a POR_EL0
> which is very different from the current value of any of the threads in
> the process right now.
>
> There's also no great way for a kthread to reach out and grab an updated
> value.  It's all completely inherently racy.
>
>> Other approaches could also be considered (e.g. resetting POR_EL0 to
>> unrestricted when creating a kthread), see my reply on v4 [1].
>
> I kinda think this is the only way to go.  It's the only sensible,
> predictable way.  I _think_ it's what x86 will end up doing with PKRU,
> but there's been enough churn there that I'd need to go double check
> what happens in practice.
>


that is also what powerpc does. 

/* usage of kthread_use_mm() should inherit the
 * AMR value of the operating address space. But, the AMR value is
 * thread-specific and we inherit the address space and not thread
 * access restrictions. Because of this ignore AMR value when accessing
 * userspace via kernel thread.
 */
static __always_inline u64 current_thread_amr(void)
{
	if (current->thread.regs)
		return current->thread.regs->amr;
	return default_amr;
}


-aneesh

