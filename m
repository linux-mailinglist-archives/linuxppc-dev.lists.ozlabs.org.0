Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0663AC006
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 02:13:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5fXv2X8bz3c58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 10:13:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMVzzQM2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OMVzzQM2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5fXT0VLtz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 10:13:29 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C22EC613B4;
 Fri, 18 Jun 2021 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623975206;
 bh=nM5X1GSDxCk8rh3UgTy/aR3zlWC0sDSSq0YpILKyEOw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OMVzzQM29lbdahlsKSCVkJIHPNqJWdv46bej0dxQNvHfFZ1lx+2X51jV4n/h5APXr
 6FAoQ57E0/MvTDa7+CQeg8RV0KRnQayjeq3MS/wiDkP5F/ydPJSLV1nqrNRFPJ4hYd
 gm2yBgu4zSYV3TAKzdCYZSBu5ih2hOszRhY5uFzyKioNIvL/5w6vnuiWSGgh7teYx5
 mEqwNwWB/Vm+xbTsOZ6Yi5ETW509W13lkrpSvQyoTu8kkiZRI2S6tz0qobJj/Xvy9x
 11CjCqYHnKB3Ubl663ze8hjxIMC8oG9VCEyiswd7jQh1NnrWoH4N3E2801z1EbiLK1
 TzN+n0ZFCOOnw==
Subject: Re: [PATCH 8/8] membarrier: Rewrite sync_core_before_usermode() and
 improve documentation
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <cover.1623813516.git.luto@kernel.org>
 <07a8b963002cb955b7516e61bad19514a3acaa82.1623813516.git.luto@kernel.org>
 <1939350496.10696.1623943014767.JavaMail.zimbra@efficios.com>
From: Andy Lutomirski <luto@kernel.org>
Message-ID: <678def50-eecd-fb0f-eac0-c0ba1a442574@kernel.org>
Date: Thu, 17 Jun 2021 17:13:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1939350496.10696.1623943014767.JavaMail.zimbra@efficios.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-mm <linux-mm@kvack.org>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/21 8:16 AM, Mathieu Desnoyers wrote:
> ----- On Jun 15, 2021, at 11:21 PM, Andy Lutomirski luto@kernel.org wrote:
> 
> [...]
> 
>> +# An architecture that wants to support
>> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE needs to define precisely what it
>> +# is supposed to do and implement membarrier_sync_core_before_usermode() to
>> +# make it do that.  Then it can select ARCH_HAS_MEMBARRIER_SYNC_CORE via
>> +# Kconfig.Unfortunately, MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE is not a
>> +# fantastic API and may not make sense on all architectures.  Once an
>> +# architecture meets these requirements,
> 
> Can we please remove the editorial comment about the quality of the membarrier
> sync-core's API ?

Done
>> +#
>> +# On x86, a program can safely modify code, issue
>> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE, and then execute that code, via
>> +# the modified address or an alias, from any thread in the calling process.
>> +#
>> +# On arm64, a program can modify code, flush the icache as needed, and issue
>> +# MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE to force a "context synchronizing
>> +# event", aka pipeline flush on all CPUs that might run the calling process.
>> +# Then the program can execute the modified code as long as it is executed
>> +# from an address consistent with the icache flush and the CPU's cache type.
>> +#
>> +# On powerpc, a program can use MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE
>> +# similarly to arm64.  It would be nice if the powerpc maintainers could
>> +# add a more clear explanantion.
> 
> We should document the requirements on ARMv7 as well.

Done.

> 
> Thanks,
> 
> Mathieu
> 

