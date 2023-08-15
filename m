Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B2E77CB4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 12:46:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8ovVRAo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ7Gm1HMkz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 20:46:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=n8ovVRAo;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ7Ft5dWqz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 20:45:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692096320;
	bh=ZyKq2ZClCOeYiMbItIk4ip+/+X634+gPGWCXK7C4M6A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8ovVRAotvT0TUkDs1kyQW5Hj/1SWHSL8+YWLwTwJ1wXZK9BEgkQBWhj3Zp3yGZpL
	 qv9MctJ+JljgV6o5pUG8MV6XQO6LBRGvu8bZMtK7EHJv0fW+guQ8jXXzzWugGqv+fE
	 GLFgEV9nJK9yodHRD5jRPo+jl+p2ucT+Z5/u8g5CafGnQ51honVIdz/b9ze2N5Ccqu
	 hDIrUrXkEw6q087HQk25hDGVHdfjc5bYo9uw1hcD+hA4pJZTtn4kH9Ow8l8jXK3338
	 lsX5wvlRmdmlT4HouM2WX0LDRBmlu+wwnJznThIbsulz/ZA1re14mZ0civ6pY2gonC
	 CQaub8iAMxcVA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RQ7Fr3SBbz4wZn;
	Tue, 15 Aug 2023 20:45:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/6] KVM: PPC: Book3s HV: Hold LPIDs in an unsigned long
In-Reply-To: <CUS477NDPEQI.27SBUCRNYD0XG@wheely>
References: <20230807014553.1168699-1-jniethe5@gmail.com>
 <20230807014553.1168699-5-jniethe5@gmail.com>
 <CUS477NDPEQI.27SBUCRNYD0XG@wheely>
Date: Tue, 15 Aug 2023 20:45:14 +1000
Message-ID: <87ttt0d1ol.fsf@mail.lhotse>
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
Cc: mikey@neuling.org, kvm@vger.kernel.org, sbhat@linux.ibm.com, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, kvm-ppc@vger.kernel.org, kconsul@linux.vnet.ibm.com, vaibhav@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Nicholas Piggin" <npiggin@gmail.com> writes:
> On Mon Aug 7, 2023 at 11:45 AM AEST, Jordan Niethe wrote:
>> The LPID register is 32 bits long. The host keeps the lpids for each
>> guest in an unsigned word struct kvm_arch. Currently, LPIDs are already
>> limited by mmu_lpid_bits and KVM_MAX_NESTED_GUESTS_SHIFT.
>>
>> The nestedv2 API returns a 64 bit "Guest ID" to be used be the L1 host
>> for each L2 guest. This value is used as an lpid, e.g. it is the
>> parameter used by H_RPT_INVALIDATE. To minimize needless special casing
>> it makes sense to keep this "Guest ID" in struct kvm_arch::lpid.
>>
>> This means that struct kvm_arch::lpid is too small so prepare for this
>> and make it an unsigned long. This is not a problem for the KVM-HV and
>> nestedv1 cases as their lpid values are already limited to valid ranges
>> so in those contexts the lpid can be used as an unsigned word safely as
>> needed.
>>
>> In the PAPR, the H_RPT_INVALIDATE pid/lpid parameter is already
>> specified as an unsigned long so change pseries_rpt_invalidate() to
>> match that.  Update the callers of pseries_rpt_invalidate() to also take
>> an unsigned long if they take an lpid value.
>
> I don't suppose it would be worth having an lpid_t.
>
>> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
>> index 4adff4f1896d..229f0a1ffdd4 100644
>> --- a/arch/powerpc/kvm/book3s_xive.c
>> +++ b/arch/powerpc/kvm/book3s_xive.c
>> @@ -886,10 +886,10 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
>>  
>>  	if (single_escalation)
>>  		name = kasprintf(GFP_KERNEL, "kvm-%d-%d",
>> -				 vcpu->kvm->arch.lpid, xc->server_num);
>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num);
>>  	else
>>  		name = kasprintf(GFP_KERNEL, "kvm-%d-%d-%d",
>> -				 vcpu->kvm->arch.lpid, xc->server_num, prio);
>> +				 (unsigned int)vcpu->kvm->arch.lpid, xc->server_num, prio);
>>  	if (!name) {
>>  		pr_err("Failed to allocate escalation irq name for queue %d of VCPU %d\n",
>>  		       prio, xc->server_num);
>
> I would have thought you'd keep the type and change the format.

Yeah. Don't we risk having ambigious names by discarding the high bits?
Not sure that would be a bug per se, but it could be confusing.

cheers
