Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0EC416A4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 05:07:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFxmS5Wptz307F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 13:07:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=f/eAudsf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=f/eAudsf; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFxlp1hPlz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 13:07:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632452835;
 bh=RPWBYunNraj3DmjmAnxNA2aWqXkyb2HgdH8iknaJy2M=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=f/eAudsfTMv/9LhLxTfvht+PpSbEJgwjCqAKfrgx2IYbo2hleir63Ez63PjFluZDo
 LXf4pRFaA9C4TrNcF5e3WXfVALGb8FBygmPqYxmgy6WsulsvHqhZ+7bJq+YnLolssK
 MHTBKrP+T/S4lXsckgHX0Jz8wVGHdGrTlDXqaLHECn5XJ/Gy0Rk8CWR5nnBV3IpUqV
 vXjFFNpIXSBq4Pj+RlyYlvVa0k43TQwHAF0VG+ScSyvTgPdOvmPHCqECqtvw3xXOYp
 kxfJVkx5EEApZlEvtdxg69mMW1Qtue73kANNr9295KuGQWHhuTmhirTI1tb9aF19OA
 /Q8BdVVMPfdeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HFxll1VGcz9svs;
 Fri, 24 Sep 2021 13:07:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/paravirt: correct preempt debug splat in
 vcpu_is_preempted()
In-Reply-To: <20210923180224.GD2004@linux.vnet.ibm.com>
References: <20210921031213.2029824-1-nathanl@linux.ibm.com>
 <20210922075718.GA2004@linux.vnet.ibm.com> <87ee9gob07.fsf@linux.ibm.com>
 <20210922163351.GB2004@linux.vnet.ibm.com> <87bl4ko1cp.fsf@linux.ibm.com>
 <874kabn40z.fsf@mpe.ellerman.id.au>
 <20210923180224.GD2004@linux.vnet.ibm.com>
Date: Fri, 24 Sep 2021 13:07:11 +1000
Message-ID: <87pmsylli8.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Michael Ellerman <mpe@ellerman.id.au> [2021-09-23 17:29:32]:
>
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> > Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
>> >
>> >> * Nathan Lynch <nathanl@linux.ibm.com> [2021-09-22 11:01:12]:
>> >>
>> >>> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
...
>> >> Or can I understand how debug_smp_processor_id() is useful if
>> >> __smp_processor_id() is defined as raw_smp_processor_id()?
>> 
>> debug_smp_processor_id() is useful on powerpc, as well as other arches,
>> because it checks that we're in a context where the processor id won't
>> change out from under us.
>> 
>> eg. something like this is unsafe:
>> 
>>   int counts[NR_CPUS];
>>   int tmp, cpu;
>>   
>>   cpu = smp_processor_id();
>>   tmp = counts[cpu];
>>   				<- preempted here and migrated to another CPU
>>   counts[cpu] = tmp + 1;
>> 
>
> If lets say the above call was replaced by raw_smp_processor_id(), how would
> it avoid the preemption / migration to another CPU?
>
> Replacing it with raw_smp_processor_id() may avoid, the debug splat but the
> underlying issue would still remain as is. No?

Correct.

Using raw_smp_processor_id() is generally the wrong answer. For this
example the correct fix is to disable preemption around the code, eg:

   int counts[NR_CPUS];
   int tmp, cpu;
   
   preempt_disable()

   cpu = smp_processor_id();
   tmp = counts[cpu];
   counts[cpu] = tmp + 1;

   preempt_enable();


For the original issue I think it is OK to use raw_smp_processor_id(),
because we're already doing a racy check of whether another CPU has been
preempted by the hypervisor.

        if (!is_kvm_guest()) {
                int first_cpu = cpu_first_thread_sibling(smp_processor_id());

                if (cpu_first_thread_sibling(cpu) == first_cpu)
                        return false;
        }

We could disable preemption around that, eg:

        if (!is_kvm_guest()) {
                int first_cpu;
                bool is_sibling;

                preempt_disable();
                first_cpu = cpu_first_thread_sibling(smp_processor_id());
                is_sibling = (cpu_first_thread_sibling(cpu) == first_cpu)
                preempt_enable();

                // Can be preempted here

                if (is_sibling)
                    return false;
        }

But before we return we could be preempted, and then is_sibling is no
longer necessarily correct. So that doesn't really gain us anything.

The only way to make that result stable is to disable preemption in the
caller, but most callers don't want to AFAICS, because they know they're
doing a racy check to begin with.

cheers
