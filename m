Return-Path: <linuxppc-dev+bounces-6174-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13819A357BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 08:18:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNgY4Qskz30WF;
	Fri, 14 Feb 2025 18:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739517497;
	cv=none; b=ExgJUB4TeULnA1NX1WWTM0oY0Ze+E/0Z/uzSA2j/irc0ejRw7Hx3lZDZh7Ib3oXitPU7dqcEhuHA/yZc/2CAJdThyYJIvXm99TCMhKjf6vKqbuh0NwfOwGt60qgkRvhYWGQf3MpaD+UnibDZ/0MPljLk3Z31W5mBWyn024uLOcHtrCc0/awOEqk0fHlb9i/1Nf/TSgL4uFDZRkjHqHqRNvP80gTS5GKlck161UCwNF+6l5UOVlOkSPf1bBl1+YzRZtG7uWQUN0Xuua1a2sC1Ql4Gmri/eknz1/+udqNHDCmXHVScB4GU81nMWnWx6AfpqGrMzVzGAOCUa7jdMC6EdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739517497; c=relaxed/relaxed;
	bh=5liOe1ZfB0Q57IX2e/O41rSLKkELnsqj5ECCxID4SXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1Bx/jMtx/BRBAdfD4rmNSCpgzue3DVitrADT0sZXX50XdhK3JXw5voMDpT3W3mR3FsNBDnB3Nn9HN70s/jUO/HRp3I6X1V8QCn1bPH8FNF4fsm+kO7xDBwvi9ZchVq84ojOsdK7UxwIolvfH+hledOFkn0Rny1WsR+3TgyXZXBNG4R507b668dd/g4UhAG6gXMYgkJz5DAApsCRrgWhzifG31UWKm0D5gMpR94rKwbVrYcdDmjI2AZxmehRK7RQUaEiHKgy+k7TaEtJN6ygSJ78POGWWeid4jcsw17M8zSEkAfRFgaXOhRjZt2ghIDmsi5XfoPlfmQ6w2XROK9DIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvNgX633Dz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 18:18:15 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D429D113E;
	Thu, 13 Feb 2025 23:18:03 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8453F58B;
	Thu, 13 Feb 2025 23:17:34 -0800 (PST)
Message-ID: <e7f80acd-623b-4fda-9292-6f8344d0f185@arm.com>
Date: Fri, 14 Feb 2025 12:47:31 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/13/25 13:08, Christophe Leroy wrote:
> 
> 
> Le 13/02/2025 à 05:09, Anshuman Khandual a écrit :
>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>> is confusing as they sound very similar and does not differentiate between
>> platform's feature subscription and feature enablement for ptdump. Rename
>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>> readability.
> 
> For me GENERIC_PTDUMP is more explicit and similar to GENERIC_IOMAP or GENERIC_IOREMAP or GENERIC_GETTIMEOFDAY: The arch provides the necessary helpers to use the generic implementation.

I do realize that GENERIC_ is another method for achieving shared
feature across multiple platforms via providing necessary helpers.
But I guess there might be a difference - it might not have other
similar but separate dependent configs ?

> 
> For me ARCH_HAS_PTDUMP just mean't that an architecture implements PTDUMP, it doesn't mean it does it by using the generic infrastructure.

ARCH_HAS_XXX indicates that an architecture subscribes to a generic
feature XXX, by implementing all necessary helpers. But the feature
in itself is a generic and a shared one.

If the platform were to implement a feature on its own without any
generic component, it could do that via a separate platform specific
config without requiring ARCH_HAS_XXX based subscription indication.

> 
> For instance, arm32 implements PTDUMP but without using the generic one so I would say that arm32 has PTDUMP and expect it to select ARCH_HAS_PTDUMP

Actually it does not need to select ARCH_HAS_PTDUMP, as it does not
subscribe into generic PTDUMP. Let's see PTDUMP configs on arm (32)

ARM_PTDUMP_CORE
ARM_PTDUMP_DEBUGFS	--> select ARM_PTDUMP_CORE
ARM_DEBUG_WX 		--> select ARM_PTDUMP_CORE

The platform has a self contained PTDUMP implementation which does
not depend on generic PTDUMP at all. Hence all these ptdump configs
are marked as ARM_ etc as they are platform specific.

