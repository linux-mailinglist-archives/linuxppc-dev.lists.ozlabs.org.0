Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DC031319A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 13:00:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ4Mk3PmlzDsrW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 23:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ4Fc0PVJzDsrV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 22:54:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bIMZ31HY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DZ4FZ0J3Bz9sS8;
 Mon,  8 Feb 2021 22:54:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612785282;
 bh=ayupSz9F0ZQz5eK88yF/jEd94wAQjskdwnO/gm4cL5A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bIMZ31HYe8O2kJFjXzDXy8zzUnY1Wox065waNTrQZl+aU9j4s9wIkA93ax9uTRn+H
 ZUAU4yPniGzZ8WcTstmTx6qCUZNz71f6N1DO+YHzI/KYFJXvADUCVSubTd3iF4+TvC
 fyNuQ7u4zkXGpEf481LfbQxPcd/TkPiBddaIDX9RAfSXGPevaVRFIhIZY8M6npExdX
 aHnMPXux3QAxrim5nHt4GHyXewQU3VBum7q9hwsviUho8ij+sP4MFn9FdoxvBQhTXz
 /ILku6Ya1Ai3ZJGGm+YoNOd5lVzReDZGXzL7QEefnWEHAP+61KLvZsIUSWp6bohb3L
 4fw7fhRxd9RkQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: ego@linux.vnet.ibm.com, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v7 07/42] powerpc/fsl_booke/32: CacheLockingException
 remove args
In-Reply-To: <20210208100411.GA18820@in.ibm.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-8-npiggin@gmail.com>
 <20210208100411.GA18820@in.ibm.com>
Date: Mon, 08 Feb 2021 22:54:40 +1100
Message-ID: <87wnviojun.fsf@mpe.ellerman.id.au>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gautham R Shenoy <ego@linux.vnet.ibm.com> writes:
> On Sat, Jan 30, 2021 at 11:08:17PM +1000, Nicholas Piggin wrote:
>> Like other interrupt handler conversions, switch to getting registers
>> from the pt_regs argument.
>> 
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/kernel/head_fsl_booke.S | 6 +++---
>>  arch/powerpc/kernel/traps.c          | 5 +++--
>>  2 files changed, 6 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
>> index fdd4d274c245..0d4d9a6fcca1 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -364,12 +364,12 @@ interrupt_base:
>>  	/* Data Storage Interrupt */
>>  	START_EXCEPTION(DataStorage)
>>  	NORMAL_EXCEPTION_PROLOG(DATA_STORAGE)
>> -	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it, pass arg3 */
>> +	mfspr	r5,SPRN_ESR		/* Grab the ESR, save it3 */
>                                                          ^^^^^^^^^^
> Sorry for the nitpick.. Should be "/* Grab the ESR, save it */"

Thanks, I fixed it up.

cheers
