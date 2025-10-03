Return-Path: <linuxppc-dev+bounces-12649-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57ABB6634
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 11:39:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdNsL076bz3cYV;
	Fri,  3 Oct 2025 19:39:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759484341;
	cv=none; b=PN92RqhUigK445vVFH0t4+sMetsCr0ar4PO9rbR5ABGc6CK7JFhGxIZVEEaTVzWv9ysJdztGTCogbTkFD0USqpujvHiOW6pnwDW/Aen4U1R++aeJFHO9/bXBvO3d1HH1Nfuzwd4A4mn7CQYYTU0I+OT1AwK1LeA6aj5dI+IHvFd/WwV8cxrDS13Wbc40AMrKIyRwHbHImGycqbNXMk81I8pXLAkLqx/rFT1iik80rKPRe1AnY69aDiDc4OcxDhciLf9M4J3+kjJRcbH+PP3neiNDbOZdQ23Hw9FsUwLdKb99Tc4WPVgtOHoAaCvYzPpKeH2d0FsMLhj+QmDek44lgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759484341; c=relaxed/relaxed;
	bh=OAZW+va4UGdHzF5Qa4jr29c8OlUqqDN5Q2sbkibpf+Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwMRxWQO26SVNiNRRwYkaCfyOWj1ZpR+w3E54GGvqsmQiS3X2iTxb1WgqKf9SotnbRSnRSIFTThB91N+RudifnRHeH/XUMYcGT5Gqgt0xOXugvh+3yJwlfJnDBREr1XrLbtQoIgG/KVb+gXE/AEnNqKgXUaKyjYabEWCuL1EgErw2mgxZjtqqXYNErLK90Palr444rM4cuhvAmltd1fqjlquTeM+ECPTahPmrBriIuJofYab1oOG9I1BKHqyzMb864+bZRhAn57lmG4w6ZT6sEeTiIj+JlEujyiIuJrOwjoeHxp/muiUGp1HqGIME+zpx0IeklA4PwbRJJATcylekw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cdNsJ0PVHz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 19:38:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2D271655;
	Fri,  3 Oct 2025 02:38:17 -0700 (PDT)
Received: from [10.44.160.83] (e126510-lin.lund.arm.com [10.44.160.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FC5C3F66E;
	Fri,  3 Oct 2025 02:38:24 -0700 (PDT)
Message-ID: <ef5d851b-0f67-410e-9479-0f6d344fa17b@arm.com>
Date: Fri, 3 Oct 2025 11:38:21 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] powerpc/64s: Do not re-activate batched TLB flush
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <8625a1d97dcf4ae499b4bb341e27346f768a7248.1749747752.git.agordeev@linux.ibm.com>
 <aFGFl9Dvb9zdC3JS@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <aFGFl9Dvb9zdC3JS@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/06/2025 17:11, Alexander Gordeev wrote:
> On Thu, Jun 12, 2025 at 07:36:13PM +0200, Alexander Gordeev wrote:
>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>> Therefore, the batch re-activation code is never called, so remove it.
>>
>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>  2 files changed, 27 deletions(-)
> Hi All,
>
> (I trimmed non-ppc mailing lists/people).
>
> The whole series does not seem to make it, but this patch alone is still
> applicable and makes sence, if I am not mistaken.

Yes, I agree. I arrived at the same conclusion working on the next
version of the nested lazy_mmu series [1]. May I include this patch in v3?

- Kevin

[1]
https://lore.kernel.org/all/20250908073931.4159362-1-kevin.brodsky@arm.com/

