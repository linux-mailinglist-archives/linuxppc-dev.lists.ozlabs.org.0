Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0CF86C098
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 07:19:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C9OlH+RA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlgzX0Ptmz3dfg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 17:19:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C9OlH+RA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlgyq4zPQz3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 17:18:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709187517;
	bh=3rPcoNkAXcpWZ8q00u4PWHD9ZMXVCcKe51zCGK/zmmM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C9OlH+RAEQUYEF7CvXeN3khlG4AxZoOiNYU73WWD1H8X2VDBDwqNgHd0etKpmeWrN
	 SHdXc29fjfrEbAQdqE6vY0Cn1myrZKg8MCNPvP5MQjeJ5yWkKVPRSIymIuM4z5fLEF
	 2BDqpFy21V/Ph3RHC+BXNb2i2D6pEwU0yM+FNBC4ET6af7hAS7D9njOCl//qbQzrEw
	 fNDlDc3jr0BQdJQFj1Z9GRrPZgefCXIk6xk75bgo1lWtkbCPTjAjpa03+Q+18mxCy0
	 SKuauHA6gl+sszlKKoGImJTBepG+q7ueFWHzJyOJfsp9y2bMw7Wf90712sQKWIE1Rg
	 trl7/rdZQ1c/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tlgyh4k9sz4wc5;
	Thu, 29 Feb 2024 17:18:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Kunwu Chan
 <chentao@kylinos.cn>, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
In-Reply-To: <87bk80kjup.fsf@kernel.org>
References: <20240125092624.537564-1-chentao@kylinos.cn>
 <87h6hva4b0.fsf@mail.lhotse>
 <f3b53f0e-58ce-4b2d-ba91-f347da73f9f3@kylinos.cn>
 <87jzmq5tjr.fsf@mail.lhotse> <87bk80kjup.fsf@kernel.org>
Date: Thu, 29 Feb 2024 17:18:32 +1100
Message-ID: <87wmqng5dz.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@kernel.org> writes:
> Michael Ellerman <mpe@ellerman.id.au> writes:
>> Kunwu Chan <chentao@kylinos.cn> writes:
>>> On 2024/2/26 18:49, Michael Ellerman wrote:
>>>> Kunwu Chan <chentao@kylinos.cn> writes:
>>>>> This part was commented from commit 6d492ecc6489
>>>>> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
>>>>> in about 11 years before.
>>>>>
>>>>> If there are no plans to enable this part code in the future,
>>>>> we can remove this dead code.
>>>> 
>>>> I agree the code can go. But I'd like it to be replaced with a comment
>>>> explaining what the dead code was trying to say.
>>
>>> Thanks, i'll update a new patch with the following comment:
>>>      /*
>>>      * No CPU has hugepages but lacks no execute, so we
>>>      * don't need to worry about cpu no CPU_FTR_COHERENT_ICACHE feature case
>>>      */
>>
>> Maybe wait until we can get some input from Aneesh. I'm not sure the
>> code/comment are really up to date.
>
> How about?
>
> modified   arch/powerpc/mm/book3s64/hash_hugepage.c
> @@ -58,17 +58,13 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
>  		return 0;
>  
>  	rflags = htab_convert_pte_flags(new_pmd, flags);
> +	/*
> +	 * THPs are only supported on platforms that can do mixed page size
> +	 * segments (MPSS) and all such platforms have coherent icache. Hence we
> +	 * don't need to do lazy icache flush (hash_page_do_lazy_icache()) on
> +	 * noexecute fault.
> +	 */

Yeah thanks that looks good.

It could say "see eg. __hash_page_4K()", but that's probably unnecessary
as it mentions hash_page_do_lazy_icache(), and anyone interested is just
going to grep for that anyway.

cheers
