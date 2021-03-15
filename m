Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DB633A9B0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 03:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzLTZ1DhDz3cVW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 13:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IdQMPHQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IdQMPHQw; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzLTB04bRz30LR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 13:48:29 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DzLT65XnBz9sVb;
 Mon, 15 Mar 2021 13:48:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1615776507;
 bh=2a8puDRnJdmt99D4SSF44flRITbs7zaSkUZNQ2VTCp8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=IdQMPHQwM59Ri7P80RhRw4Zayj0FB5q5co0sV+gfV4xQlCfaaUT7f1V0BEOkcHOL9
 T49xv028jzVSKLqYia3oX7BddaZcaPmibtGQ4Sqo5i2H4o/21rPIW/y07dD6j0LvxP
 zbl0XDQR6O/RFaM3y9jnrGaqJQN/C4ywl+8H7uyLJ3kaXnlDRIMdftSwdCtbkPpSQ6
 ov7oaaIHVipgznzOO6rquTVYoJQzbAC0LF+AG5ryjVsHWgQCi+SQutZVr3rMgCgvAF
 gI4j5fmHRisGXspk8rUe9rIxhOlfi9wFfv3NYoVR+Pz0E4cs8jBtfF0HLqtRf+5Q7n
 m2sCnYeP7Fmuw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, Bhaskar Chowdhury
 <unixbhaskar@gmail.com>, benh@kernel.crashing.org, paulus@samba.org,
 akpm@linux-foundation.org, rppt@kernel.org, oss@buserror.net,
 christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: kernel: Trivial spelling fixes throughout the
 file head_fsl_booke.S
In-Reply-To: <f8dc3cbe-54f4-1da1-b14f-4735d28aad13@infradead.org>
References: <20210314220436.3417083-1-unixbhaskar@gmail.com>
 <f8dc3cbe-54f4-1da1-b14f-4735d28aad13@infradead.org>
Date: Mon, 15 Mar 2021 13:48:25 +1100
Message-ID: <87r1kh3zeu.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> On 3/14/21 3:04 PM, Bhaskar Chowdhury wrote:
>> 
>> Trivial spelling fixes throughout the file.
>> 
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  arch/powerpc/kernel/head_fsl_booke.S | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
>> index fdd4d274c245..c6fcfca0b0d7 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -403,7 +403,7 @@ interrupt_base:
>>  	EXCEPTION(0x2900, AP_UNAVAIL, AuxillaryProcessorUnavailable, \
>>  		  unknown_exception, EXC_XFER_STD)
>> 
>> -	/* Decrementer Interrupt */
>> +	/* Decremented Interrupt */
>
> No, the comment matches the macro (or whatever that is).

Right. I dropped this hunk. Please update your script or whatever to not
"correct" that spelling.

cheers
