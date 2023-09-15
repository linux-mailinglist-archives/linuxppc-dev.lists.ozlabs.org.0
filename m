Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 434917A12D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 03:16:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=krL6TAjd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmx9h1QRjz3dKJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 11:16:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=krL6TAjd;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmx8q0KVrz3dHk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 11:16:11 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Rmx8n3FBVz4x5q; Fri, 15 Sep 2023 11:16:09 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694740569;
	bh=YzckrsiESf6u7SsWCs6pOtmsPIGKGNPxOZvTvV0A+KM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=krL6TAjdH8VOXZ2VmttCFr6P2GJ2BKJWOq8bQ8mOyqBOY69pea000LWBYcx2jrCrH
	 4x6voVPixujTtJWj3jbG8MonPTE4VfHLJq4ZsDRQ1tq54QXVXh8sCDfN2tBjhRc/VZ
	 f4fsp0Xt6yTy3hX7Ct2TT4yPcySqwCqpfpkL8whJ/xRKDmTlc2lFF7AOndbdnv06gQ
	 HYJZuab4tNXdx51GN9LcK88bp6hokuywzIzxtpiGVXFux1J+S293ts+4/EbAszC5vz
	 01l82oxEoF5e4nvnv7CVwYrI5Qw+7qny0ngC+FwYrMVEHAa+PUbTI2BH2ZNguwI0Vr
	 E8qwkC4tvgEqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rmx8n2RVtz4x5p;
	Fri, 15 Sep 2023 11:16:09 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <E74C5EA6-8720-47D5-ABD4-5AC6CE38BAE7@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
 <87sf7g7uu7.fsf@mail.lhotse>
 <E74C5EA6-8720-47D5-ABD4-5AC6CE38BAE7@linux.ibm.com>
Date: Fri, 15 Sep 2023 11:16:08 +1000
Message-ID: <87fs3g6xt3.fsf@mail.lhotse>
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
Cc: "Aneesh
 Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Aditya Gupta <adityag@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
>> On 14-Sep-2023, at 6:52 PM, Michael Ellerman <mpe@ellerman.id.au> wrote:
>> 
>> Sachin Sant <sachinp@linux.ibm.com> writes:
>>>> On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> wrote:
>>>> 
>>>> Presently, while reading a vmcore, makedumpfile uses
>>>> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
>>>> RADIX MMU or not.
>>>> 
>>>> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
>>>> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
>>>> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
>>>> MMU to be hash MMU.
>>>> 
>>>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>>>> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
>>>> is accessible to makedumpfile, without needing the vmlinux file
>>>> 
>>>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>>>> ---
>>> 
>>> Thanks for the patch. With this patch applied (along with makedumpfile changes)
>>> I am able to capture vmcore against a kernel which contains commit 8dc9a0ad0c3e
>> 
>> I can't find that commit? Was just wondering if it should be referenced
>> in the commit message.
>> 
>
> My bad, I copied that commit id from the email when I first reported this issue
> against linux-next.
>
> The commit should be 
> 368a0590d954: (powerpc/book3s64/vmemmap: switch radix to use a
> different vmemmap handling function)

OK thanks.

Aditya, can you please rephrase the commit message to mention how that
commit broke the previous behaviour.

Also I don't know what pgd_offset_l4 is?

cheers
