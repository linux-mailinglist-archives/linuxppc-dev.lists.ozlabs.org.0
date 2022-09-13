Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7C5B6599
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 04:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRS9g6FX7z3c74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 12:30:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g1UPttfL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRS9454cdz2xr1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 12:29:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g1UPttfL;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MRS923lZzz4x1F;
	Tue, 13 Sep 2022 12:29:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663036183;
	bh=2kKgkgxWpOxUUFPh9l2c0orayKxf5hFL9rZA+mzsv+4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g1UPttfLWR8UvDeUZJSp10k40inOQNAKoG8DhRu4wuJyAWreJNyP7TFq3O15gQROt
	 8mIu9PbCtF8vYWtHlYBMa1/6RQqttT57k1KYgJH59H7H0nUlOiHPJdxg6K8lNR5/cI
	 5YYpZeqcVbjJcetJpZ2+R9Tubr+P8EEZVxoicejxnfHz39+xk5/Dj7ceuZ9WLqV2S2
	 HYQXuk7auxDNk1OgoMC0HmlsnHQi73vjP9y+PJKuD775k0ykOayTYKOSR3VK0gio/9
	 W54wF3bCoAtv58XBELluq/88H/SsCPRgRLeIg/3sDWojrpcuVeRuW/0QHv0n6ep9Kl
	 RMN2qZx/YJKWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Rohan McLure
 <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 09/20] powerpc: Enable compile-time check for syscall
 handlers
In-Reply-To: <CMUCZC1TQBYV.T5VOLUARFB7C@bobo>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-10-rmclure@linux.ibm.com>
 <CMUCZC1TQBYV.T5VOLUARFB7C@bobo>
Date: Tue, 13 Sep 2022 12:29:38 +1000
Message-ID: <87fsgwdn1p.fsf@mpe.ellerman.id.au>
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
Cc: Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
...
>> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.c
>> similarity index 59%
>> rename from arch/powerpc/kernel/systbl.S
>> rename to arch/powerpc/kernel/systbl.c
>> index cb3358886203..99ffdfef6b9c 100644
>> --- a/arch/powerpc/kernel/systbl.S
>> +++ b/arch/powerpc/kernel/systbl.c
>> @@ -10,31 +10,32 @@
>>   * PPC64 updates by Dave Engebretsen (engebret@us.ibm.com) 
>>   */
>>  
>> -#include <asm/ppc_asm.h>
>> +#include <linux/syscalls.h>
>> +#include <linux/compat.h>
>> +#include <asm/unistd.h>
>> +#include <asm/syscalls.h>
>>  
>> -.section .rodata,"a"
>> +#define __SYSCALL_WITH_COMPAT(nr, entry, compat) __SYSCALL(nr, entry)
>>  
>> -#ifdef CONFIG_PPC64
>> -	.p2align	3
>> -#define __SYSCALL(nr, entry)	.8byte entry
>> +#ifdef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
>> +#define __SYSCALL(nr, entry) [nr] = __powerpc_##entry,
>> +#define __powerpc_sys_ni_syscall	sys_ni_syscall
>>  #else
>> -#define __SYSCALL(nr, entry)	.long entry
>> +#define __SYSCALL(nr, entry) [nr] = entry,
>>  #endif
>>  
>> -#define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
>> -.globl sys_call_table
>> -sys_call_table:
>> +void *sys_call_table[] = {
>
> Humour me, the asm version had this in rodata, does this change that or
> does it somehow get put back in there? Should this be const?

Even with const I still see it not landing in rodata for some reason.

$ grep -e start_rodata -e end_rodata -e sys_call_table .build/System.map
c000000000f90000 D __start_rodata
c0000000012b0000 R __end_rodata
c0000000027d51b0 D sys_call_table

vs before the series:

c000000000f80000 D __start_rodata
c000000000f805f0 D sys_call_table
c0000000012a0000 R __end_rodata


cheers
