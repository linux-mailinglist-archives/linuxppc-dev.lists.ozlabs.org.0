Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA280C033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 05:02:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kr8Kvwnz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpSkH15Stz3dRP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 15:02:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kr8Kvwnz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpSjT10Vhz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 15:01:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59B81CE0B6C;
	Mon, 11 Dec 2023 04:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142F1C433C7;
	Mon, 11 Dec 2023 04:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702267285;
	bh=5f+pnIiwqhlNQ1ca5+25Zh7b1thsDYAT5RqL0yc+DLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kr8KvwnzfaXk+DpQ5+JrMYbrF0txJNWuHCTDeo08vTW3cgZlYGPxVpjASqXmbX2mN
	 3MwBjg3n3yhzzBzMLP4hK3TqRYhjfeE+FeiWXO5sSdYB8Jvo/pQBxEoVOp9PjgnFiW
	 g5hdEaoiLv2yavK4NUi11c5fPLzQUh9DNJVLeM3e8rQdxcYJc9dGoYi6bNHDs1VREf
	 XAAn5cPxNzPCOMAMyucSoHQoSImGNduKYlhulcdLHV4hJq8zE1fSV/IKnoIlzSiDNG
	 ObhM+VTrq55UZIQ7LPCnhn2TfJ64pWYclUhWuzlza5GCLNd24xB0IFzUG4KF5rgrrA
	 MnDrs421pFdmQ==
Message-ID: <086fb48f-ea7c-4b4e-b3b5-c930aa74bbb2@kernel.org>
Date: Mon, 11 Dec 2023 09:31:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] KVM: PPC: Book3S HV nestedv2: Do not call
 H_COPY_TOFROM_GUEST
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
References: <20231201132618.555031-1-vaibhav@linux.ibm.com>
 <20231201132618.555031-10-vaibhav@linux.ibm.com> <87sf4dun37.fsf@kernel.org>
 <87jzplmlx5.fsf@vajain21.in.ibm.com>
Content-Language: en-US
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <87jzplmlx5.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, David.Laight@ACULAB.COM, kconsul@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/11/23 9:26 AM, Vaibhav Jain wrote:
> Hi Aneesh,
> 
> Thanks for looking into this patch. My responses inline:
> 
> "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org> writes:
> 
> <snip>
>> May be we should use 
>> firmware_has_feature(FW_FEATURE_H_COPY_TOFROM_GUEST))?
>> 
>> the nestedv2 can end up using the above hcall if it is supported by
>> the hypervisor right? In its absence we will have to translate the
>> guest ea using xlate and then use kvm_guest_read to read location
>> using the guest real address right? That xlate will also involves
>> multiple kvm_guest_read.
>> 
>> 
> Yes, Agreed and thats a nice suggestion. However ATM the hypervisor 
> supporting Nestedv2 doesnt have support for this hcall. In future
> once we have support for this hcall for nestedv2 from the hypervisor
> we can replace this branch with a firmware_has_feature() test.
> 

What I am suggesting is we convert that conditional to firmware_has_feature so that
later when hypervisor supports this hcall all older kernel can make
use of the copy_tofrom_guest without any code change.

>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com> --- 
>>> arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 +++ 1 file changed, 3
>>> insertions(+)
>>> 
>>> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c
>>> b/arch/powerpc/kvm/book3s_64_mmu_radix.c index
>>> 916af6c153a5..4a1abb9f7c05 100644 ---
>>> a/arch/powerpc/kvm/book3s_64_mmu_radix.c +++
>>> b/arch/powerpc/kvm/book3s_64_mmu_radix.c @@ -40,6 +40,9 @@
>>> unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid, 
>>> unsigned long quadrant, ret = n; bool is_load = !!to;
>>> 
>>> +	if (kvmhv_is_nestedv2()) +		return H_UNSUPPORTED; + /* Can't
>>> access quadrants 1 or 2 in non-HV mode, call the HV to do it */ 
>>> if (kvmhv_on_pseries()) return
>>> plpar_hcall_norets(H_COPY_TOFROM_GUEST, lpid, pid, eaddr, -- 
>>> 2.42.0
> 

