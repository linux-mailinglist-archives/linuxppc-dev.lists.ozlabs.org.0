Return-Path: <linuxppc-dev+bounces-1565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F005984481
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 13:28:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCd0T2QYnz2yDk;
	Tue, 24 Sep 2024 21:28:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727177321;
	cv=none; b=ZuaCHHaGfAb+jSbfwoHElECKID4Aj6Vq0q3r1zy5bR5Yp0BbNygunJNkAz8acrAqZHZ1rwtot705iGSAlYBbxuSZyrMTvh75Gj8HFbSy4opMHRCxrtCyFyxQEMgO5icGJD7EY1w4PXcW9aeZll+MR4uAmfdwDVAdmBy+K7jyGmEQ2UnGkt6YuF2usda6OIeoqCESa+UwZshm3GJ3YkRAjwZv2Vh5PR+i7ySO89HWAEb7vPrcK8pDaCFm5hQ1LCL/sau653whw+n+mVeLUflEVpoYVhn7iKeHY9oAKMhiL5kwbgqxE3/fhkmJymS5iGGURUZ/Ifw5lfCPxI/yPWZblw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727177321; c=relaxed/relaxed;
	bh=Ng/ShEdaF4U+7lZmzaK6jJFWkWXLGdUo2c/kKpuw1es=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jy80fStsE+8COfFesT0xYVWok/ycN+/fzvXVVtAYPHtn81+JwWpfeQ7+j1s07U4509I0QVnJ8TVsl/Ayk5jU6I5hhMzLtVOzTS84zEVYtYKR1z5eqKjjhcX/6Z6uyQfG3XHH0eEh3cVSiFbMmNR/5XNOV4nMMfEqU7wqs0ryE8g2j3xzlOEeFr0bop1MPD9Kv8Uk/iIwiifjviyFJg6CWLxuHyau4fsCCrfnoXqTGbIhj7MDZKhEpLCc3scPq8+/VPY0BKVCsVWft94/qaTJ3cL7+Glew6t4klISuYoLkcEpAUVD/WMoRBnwmiPiAcpYPoDExsS/QJPACelJDUqM8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCd0S4K52z2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 21:28:38 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EADECDA7;
	Tue, 24 Sep 2024 04:28:34 -0700 (PDT)
Received: from [10.57.76.149] (unknown [10.57.76.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 452493F528;
	Tue, 24 Sep 2024 04:28:00 -0700 (PDT)
Message-ID: <47e1537f-5b60-4541-aed1-a20e804c137d@arm.com>
Date: Tue, 24 Sep 2024 13:27:58 +0200
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
To: Joey Gouly <joey.gouly@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com, akpm@linux-foundation.org, aneesh.kumar@kernel.org,
 aneesh.kumar@linux.ibm.com, anshuman.khandual@arm.com, bp@alien8.de,
 broonie@kernel.org, catalin.marinas@arm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maz@kernel.org,
 mingo@redhat.com, mpe@ellerman.id.au, naveen.n.rao@linux.ibm.com,
 npiggin@gmail.com, oliver.upton@linux.dev, shuah@kernel.org,
 skhan@linuxfoundation.org, szabolcs.nagy@arm.com, tglx@linutronix.de,
 will@kernel.org, x86@kernel.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org
References: <20240822151113.1479789-1-joey.gouly@arm.com>
 <20240822151113.1479789-20-joey.gouly@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20240822151113.1479789-20-joey.gouly@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/08/2024 17:11, Joey Gouly wrote:
> @@ -1178,6 +1237,9 @@ static void setup_return(struct pt_regs *regs, struct k_sigaction *ka,
>  		sme_smstop();
>  	}
>  
> +	if (system_supports_poe())
> +		write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);

At the point where setup_return() is called, the signal frame has
already been written to the user stack. In other words, we write to the
user stack first, and then reset POR_EL0. This may be problematic,
especially if we are using the alternate signal stack, which the
interrupted POR_EL0 may not grant access to. In that situation uaccess
will fail and we'll end up with a SIGSEGV.

This issue has already been discussed on the x86 side, and as it happens
patches to reset PKRU early [1] have just landed. I don't think this is
a blocker for getting this series landed, but we should try and align
with x86. If there's no objection, I'm planning to work on a counterpart
to the x86 series (resetting POR_EL0 early during signal delivery).

Kevin

[1]
https://lore.kernel.org/lkml/20240802061318.2140081-2-aruna.ramakrishna@oracle.com/

> +
>  	if (ka->sa.sa_flags & SA_RESTORER)
>  		sigtramp = ka->sa.sa_restorer;
>  	else


