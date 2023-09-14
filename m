Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F947A0579
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 15:23:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYwqG0S4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmdLg4JFKz3dFm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 23:23:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dYwqG0S4;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmdKY3lBwz3cHf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 23:22:41 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RmdKY3G76z4wxn; Thu, 14 Sep 2023 23:22:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694697761;
	bh=gnFzTyK8fiLRwAoQxhAcoaL9fMXugaJoRU7fA0C8J3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dYwqG0S4AvQUFvuYJ3f+zVUCD1XM3zAsS9pvOebIKx1IoyLTnYGvWKfZTyzc+THMZ
	 9LmfVqiZqvhxnxjhxFndXEvMh7Ks3P6VCHr9p1HxuDED2NB5UsTEO+9mQJmuYlhT/J
	 fT4CPl8Cpq4x2+LWS0BjV4YYHJndJhkuB4Zxt1SLoTtW5K4n8BdbAt8l0z9F9ZXQwD
	 /kMXMJD5txPfGPxrE3VRvWVgrakwwTpV7ZAWjIUTlqtSI7DA/JCTPv3eYxwv8a1M6b
	 QlNuqic2VaSQfVQkkMH7VVlhlDYwJzVX4G+FVmQMfsden/8Nl7NAVhlBGNoALJ1ix5
	 rYBUg3kUQxPAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RmdKY2S5dz4wxf;
	Thu, 14 Sep 2023 23:22:41 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>
Subject: Re: [PATCH] powerpc: add `cur_cpu_spec` symbol to vmcoreinfo
In-Reply-To: <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
References: <20230911091409.415662-1-adityag@linux.ibm.com>
 <A4BD07EC-C0B1-4957-9201-35C15706F40B@linux.ibm.com>
Date: Thu, 14 Sep 2023 23:22:40 +1000
Message-ID: <87sf7g7uu7.fsf@mail.lhotse>
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sachin Sant <sachinp@linux.ibm.com> writes:
>> On 11-Sep-2023, at 2:44 PM, Aditya Gupta <adityag@linux.ibm.com> wrote:
>> 
>> Presently, while reading a vmcore, makedumpfile uses
>> `cur_cpu_spec.mmu_features` to decide whether the crashed system had
>> RADIX MMU or not.
>> 
>> Currently, makedumpfile fails to get the `cur_cpu_spec` symbol (unless
>> a vmlinux is passed with the `-x` flag to makedumpfile), and hence
>> assigns offsets and shifts (such as pgd_offset_l4) incorrecly considering
>> MMU to be hash MMU.
>> 
>> Add `cur_cpu_spec` symbol and offset of `mmu_features` in the
>> `cpu_spec` struct, to VMCOREINFO, so that the symbol address and offset
>> is accessible to makedumpfile, without needing the vmlinux file
>> 
>> Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
>> ---
>
> Thanks for the patch. With this patch applied (along with makedumpfile changes)
> I am able to capture vmcore against a kernel which contains commit 8dc9a0ad0c3e

I can't find that commit? Was just wondering if it should be referenced
in the commit message.

cheers
