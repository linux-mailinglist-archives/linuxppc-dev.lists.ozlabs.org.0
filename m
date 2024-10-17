Return-Path: <linuxppc-dev+bounces-2348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4EB9A246C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 16:01:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTqJ06Mx6z2yNs;
	Fri, 18 Oct 2024 01:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729173680;
	cv=none; b=ckt1Mi9m2yiU//BD8x4LFD3TIjfIzeOLuFJCQ5YiRpiXK8Vb2WTIvqvfkEF5GYozRt2/Q+vwfyqTh0fq5ZX6hmPf5WQyV/9LJbcdhLG5Qm319FNXaMzHNgLtwLdoIUF6zAWeXSQZ8Gfa3HVrdibbYVHWCA8nhDiP8iI9O6vLIXtDfigY/6geaNNbn5B3EwcnLqkEckYTE5+0ziDgpp1Wh0u6oudTSTaK+A7vCnZMIsyA3sAV+IZEaWzQBshA7gR9D5gI6N014t/Ec1a7Nqo3GNAvkVPKGAPglZcjgNJilz1E21N69qlakmWUKBWjUq3dWX7fO4prjrp9L51wRtDl3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729173680; c=relaxed/relaxed;
	bh=nZuVhJis95dVNimUHudHNvGiNmLlOJXRRB+4qzPMuVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzFtpilslTWQbE9gvqCfua0FgiWv2eSA0y1RO9gqA/NGEdqijeE1kxPdv/RcQfTZp5pKyvtD0axZYOCxj4RSYaHOCg8r3Qn6+CCsG+TzSu23imEzXKqXQ/5l6ukKOkDpFuRpfE6lhxcmhqSWaLViqkXfgn2P/nscmanJ3gcu6wXkyjqYW/EG69n4GU2Ycr3HXv+6JDtAeqU/6q1bveUR7FRgx7n72vSVGIEj2E3z6Wx5AMNgaoGTlFQnJbjEd6lsZflfli5O9Drqr6+htEhZgInztSCkibOKSe+zTW9bmELMI1m2sjb/q3oBlU4DBMV66tTsYaZqWuHcbsh2+hqxlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTqHw63mnz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 01:01:14 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE2BEDA7;
	Thu, 17 Oct 2024 07:01:11 -0700 (PDT)
Received: from [10.57.78.172] (unknown [10.57.78.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F7AB3F528;
	Thu, 17 Oct 2024 07:00:35 -0700 (PDT)
Message-ID: <d68c78cc-1bec-4c44-afb6-66274f831948@arm.com>
Date: Thu, 17 Oct 2024 16:00:33 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/30] arm64: add POE signal support
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org,
 nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
 broonie@kernel.org, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maz@kernel.org,
 mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com,
 npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org,
 skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de,
 x86@kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
 <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
 <20241009144301.GA12453@willie-the-truck>
 <20241014171023.GA18295@willie-the-truck>
 <20241015095911.GA3777204@e124191.cambridge.arm.com>
 <20241015114116.GA19334@willie-the-truck> <Zw6D2waVyIwYE7wd@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <Zw6D2waVyIwYE7wd@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 15/10/2024 17:01, Catalin Marinas wrote:
>> We also still need to resolve Kevin's concern, which probably means
>> keeping the thread's original POR around someplace.
> If we fail to allocate context for POR_EL0 (or anything else), we'll
> deliver a SIGSEGV. I think it's quite likely that the SIGSEGV will also
> fail to allocate context we end up with a fatal SIGSEGV. Not sure the
> user can affect the allocation/layout, though it can change stack
> attributes where the frame is written.
>
> Assuming that the user tricks the kernel into failing to write the
> context but allows it to succeed on the resulting SIGSEGV, POR_EL0
> wouldn't have been reset and the SIGSEGV context will still have the
> original value. I don't think we need to do anything here for 6.12.
>
> However, in for-next/core, we have gcs_signal_entry() called after
> resetting POR_EL0. If this fails, we can end up with a new POR_EL0 on
> sigreturn (subject to the above user toggling permissions). I think this
> needs to be fixed, POR_EL0 only reset when we know we are going to
> deliver the signal.

In the series I've just posted [1], POR_EL0 is reset to "allow all"
before we do anything, so it sounds like we may have a problem there.
However, it does keep track of that state, so I think the fix may be
simple. If any error occurs in setup_rt_frame(), we could call
restore_unpriv_access_state() to restore the original value of POR_EL0,
like in sigreturn(). Otherwise we call set_handler_unpriv_access_state()
to set POR_EL0 to POR_EL0_INIT as we do today. I can make that change in
v2 if that sounds helpful.

Kevin

[1]
https://lore.kernel.org/linux-arm-kernel/20241017133909.3837547-4-kevin.brodsky@arm.com/T/#u

