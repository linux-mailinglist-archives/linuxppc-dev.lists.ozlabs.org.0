Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A7A3AA39C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 20:53:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4vTg22G9z3bx5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 04:53:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZdUJ7KXN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZdUJ7KXN; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4vTC1Bkcz3021
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 04:53:02 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E38DA613B4;
 Wed, 16 Jun 2021 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623869579;
 bh=Yqry3gXTN7L5llHGJ5LYioszkeOqgnImNugNlvlJamM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZdUJ7KXNhkuKNAUX1x7Dbc4PeUFd1RBBDmKso0XmPrKjdsmddGAwUrigYr/JM82Wg
 QZYY1HboE2uqd3aDHbef4mKiID3gsuvm5EVze2dABZvbyZheNWkpSQusDL9vvTKeTZ
 llgpyzsvBgZGHBlVCUTvm9DEzi6Hvbi5dJZInB6zEXy5rjMxcXqZdGesyqHMQpTlGH
 9vnvX5X6f8YAkbV0xff+6rjr3kuqkpugsrxF/ZBh7JF/BjFyZohG2TevhZq78dCe75
 ZbfCX4ngCfJiMjfS5mqXkORZczgWyrHbvJC4IDDJol6JXrj9FBaLWKtCUNktRtFrtB
 Ewqj3p90Zv/OQ==
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Nicholas Piggin <npiggin@gmail.com>, x86@kernel.org
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <1623818343.eko1v01gvr.astroid@bobo.none>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <1e248763-9372-6e4e-5dea-cda999000aeb@kernel.org>
Date: Wed, 16 Jun 2021 11:52:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623818343.eko1v01gvr.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Will Deacon <will@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Dave Hansen <dave.hansen@intel.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/15/21 9:45 PM, Nicholas Piggin wrote:
> Excerpts from Andy Lutomirski's message of June 16, 2021 1:21 pm:
>> The old sync_core_before_usermode() comments suggested that a non-icache-syncing
>> return-to-usermode instruction is x86-specific and that all other
>> architectures automatically notice cross-modified code on return to
>> userspace.

>> +/*
>> + * XXX: can a powerpc person put an appropriate comment here?
>> + */
>> +static inline void membarrier_sync_core_before_usermode(void)
>> +{
>> +}
>> +
>> +#endif /* _ASM_POWERPC_SYNC_CORE_H */
> 
> powerpc's can just go in asm/membarrier.h

$ ls arch/powerpc/include/asm/membarrier.h
ls: cannot access 'arch/powerpc/include/asm/membarrier.h': No such file
or directory


> 
> /*
>  * The RFI family of instructions are context synchronising, and
>  * that is how we return to userspace, so nothing is required here.
>  */

Thanks!
