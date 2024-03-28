Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F92F890851
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 19:31:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=tIDs0u8+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5BvH2QlGz3vdP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 05:31:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=tIDs0u8+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=2607:5300:203:b2ee::31e5; helo=smtpout.efficios.com; envelope-from=mathieu.desnoyers@efficios.com; receiver=lists.ozlabs.org)
Received: from smtpout.efficios.com (smtpout.efficios.com [IPv6:2607:5300:203:b2ee::31e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5BtV3wRnz3fQR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 05:30:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1711650630;
	bh=lk8dC9gKsJV/AcTmMyh8lji2TjUF7O+n96I5er4a4zc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tIDs0u8+IOZ+ZrDN59yyuphpve3soMx6ZF8m4GIf00AfVdDZsI2b16/bOWuzh1LVj
	 Y8jHyX9y5b+QBmGpqDeOk/NqxAvTEOm6h50Wcb9z2K5exeCH/YoEwvKl0v/CVEtR2v
	 jWbzrruevXZ8952C0iez3iQLclnOBoB9jRhIwYo5KMiqYngjcHrQAGM5lod5rRbnoE
	 Km4KfTCt72HW69gv2OnF+ItWOgaNQ1+5o1SclYb8yFLPbD+7Vfn11u4mYAUc6bTsbR
	 wRVjiGR/rMiUj0FaW6bQ2voqvH6k6pjsZ7p9u44xr5e2wK/RzcdaEBHUeQGljokzVC
	 igTrOUnV4c0Rg==
Received: from [172.16.0.134] (192-222-143-198.qc.cable.ebox.net [192.222.143.198])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4V5BtF68Gpznrq;
	Thu, 28 Mar 2024 14:30:29 -0400 (EDT)
Message-ID: <4fb4f78e-69b6-4c34-b7c7-28b6b4b17b33@efficios.com>
Date: Thu, 28 Mar 2024 14:30:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Appropriate liburcu cache line size for Power
To: Nathan Lynch <nathanl@linux.ibm.com>, paulmck <paulmck@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
References: <19c3ea76-9e05-4552-8b93-6c42df105747@efficios.com>
 <87jzlqqcdl.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <87jzlqqcdl.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-03-25 16:34, Nathan Lynch wrote:
> Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
>> In the powerpc architecture support within the liburcu project [1]
>> we have a cache line size defined as 256 bytes with the following
>> comment:
>>
>> /* Include size of POWER5+ L3 cache lines: 256 bytes */
>> #define CAA_CACHE_LINE_SIZE     256
>>
>> I recently received a pull request on github [2] asking to
>> change this to 128 bytes. All the material provided supports
>> that the cache line sizes on powerpc are 128 bytes or less (even
>> L3 on POWER7, POWER8, and POWER9) [3].
>>
>> I wonder where the 256 bytes L3 cache line size for POWER5+
>> we have in liburcu comes from, and I wonder if it's the right choice
>> for a cache line size on all powerpc, considering that the Linux
>> kernel cache line size appear to use 128 bytes on recent Power
>> architectures. I recall some benchmark experiments Paul and I did
>> on a 64-core 1.9GHz POWER5+ machine that benefited from a 256 bytes
>> cache line size, and I suppose this is why we came up with this
>> value, but I don't have the detailed specs of that machine.
>>
>> Any feedback on this matter would be appreciated.
> 
> For what it's worth, I found a copy of an IBM Journal of Research &
> Development article confirming that POWER5's L3 had a 256-byte line
> size:
> 
>    Each slice [of the L3] is 12-way set-associative, with 4,096
>    congruence classes of 256-byte lines managed as two 128-byte sectors
>    to match the L2 line size.
> 
> https://www.eecg.utoronto.ca/~moshovos/ACA08/readings/power5.pdf
> 
> I don't know of any reason to prefer 256 over 128 for current Power
> processors though.

Thanks for the pointer. I will add a reference to it in the liburcu
source code to explain the cache line size choice.

Mathieu


-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

