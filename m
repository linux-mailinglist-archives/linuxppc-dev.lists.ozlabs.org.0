Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87B400A53
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 09:58:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1n8V2sFBz2yws
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 17:58:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=xtfl4wl+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=xtfl4wl+; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1n7m44Vwz2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 17:57:21 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id q21so890168plq.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 Sep 2021 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Zg/5AKd9rdTjuzlyeiWM5OX1JBziXc62n7CLuQ994yM=;
 b=xtfl4wl+NWVGH7rOUy0KNcIxiDObzlRzsF3RwGJ8Hq+T5o8wW1yfBMndLkDEbJVuwS
 O96pOsSBunZsOV4VAiMINHYv8fxaJvTapgpafMMiL0EBNA0an0LG4IPFNh1X7stjlEFW
 rMQz7NmuU+NqFWUOy/rFGB9ESbAzgXhpmKkfVMurVfpwSaPl9rTx7pufjGRl3RNHHY37
 K1M8/MoBKxilbApE8WoMNjvplmaFRDZQYIia5IJVpExvnqTjFYa1FdDTR94jbuMNiD4c
 ec4kK9qRrYJw3MC9nyBzBgAD25l+VbN02/zhFK+UDG6NhYNltqu4O7B5E5Kh14QUmmFS
 VLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Zg/5AKd9rdTjuzlyeiWM5OX1JBziXc62n7CLuQ994yM=;
 b=hhPe3jfNPOR3wHYQzaDZg23smbR97jGHyhl692TEyu5cPpb7aqA8YHveaRBz8FClVs
 djm+Cr8KEAfjHHeKz9QvU9orHpaztrmXfm/5dLnqGYlZ1m9ROiGHdu/gn0vItWlVJiMm
 KreRgeg3sNZXtEVe0BS4nVlvNZ4UBdqPnzySk7R0jf5ZKh9pawK++uaMpnYJmJc+dpyo
 /AiAj5TPc9+79012ihsQvO5/o1JCZoK97wrMx29vT9U5KaA3QNvsKCPjqInEQL6lyiFa
 eMNlpClIf+ruSqhVg7e7FWCivtFXT9XwoIAAw0m4EmaoUBm9bQ/tkG26tVMKIe4i05Oy
 bnmQ==
X-Gm-Message-State: AOAM531iSbs89PQE/yzFzz4rZucnYV7MbavPvkZMyqpKE9/Uf6D0MC4+
 klU4Xv5H2xwTGRkknqcdUd/R1w==
X-Google-Smtp-Source: ABdhPJx+UeSZg4JLkZTUSXeiLtdyFeKDx7uVNh7Vt19oevVW0XSdIQYPrdN5KEmR9Wkqd95uZG7KXg==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id
 q39mr2996000pjq.219.1630742237827; 
 Sat, 04 Sep 2021 00:57:17 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id v6sm1506534pfv.83.2021.09.04.00.57.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 00:57:17 -0700 (PDT)
Message-ID: <327b1ca9-f05e-dfc0-7d59-7b7b6bda5394@ozlabs.ru>
Date: Sat, 4 Sep 2021 17:57:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S: Merge powerpc's debugfs entry
 content into generic entry
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210903052257.2348036-1-aik@ozlabs.ru>
 <87v93hens6.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87v93hens6.fsf@linux.ibm.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm-ppc@vger.kernel.org,
 kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 04/09/2021 00:28, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> At the moment the generic KVM code creates an "%pid-%fd" entry per a KVM
>> instance; and the PPC HV KVM creates its own at "vm%pid".
>>
>> The rproblems with the PPC entries are:
>> 1. they do not allow multiple VMs in the same process (which is extremely
>> rare case mostly used by syzkaller fuzzer);
>> 2. prone to race bugs like the generic KVM code had fixed in
>> commit 85cd39af14f4 ("KVM: Do not leak memory for duplicate debugfs
>> directories").
>>
>> This defines kvm_arch_create_kvm_debugfs() similar to one for vcpus.
> 
> I think kvm_arch_create_vm_debugfs is a bit mode accurate?


ah yes, it is better.

>                          ^
>> This defines 2 hooks in kvmppc_ops for allowing specific KVM
>> implementations to add necessary entries.
>>
>> This makes use of already existing kvm_arch_create_vcpu_debugfs.
>>
>> This removes no more used debugfs_dir pointers from PPC kvm_arch structs.
>>
>> Suggested-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> ...
> 
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index c8f12b056968..325b388c725a 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -2771,19 +2771,14 @@ static const struct file_operations debugfs_timings_ops = {
>>   };
>>   
>>   /* Create a debugfs directory for the vcpu */
>> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
>> +static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
> 
> This could lose the 'arch' since it is already inside our code and
> accessed only via ops. I see that we already have a
> kvmppc_create_vcpu_debugfs that's used for some BookE processor, this

Ouch, missed kvmppc_create_vcpu_debugfs(). Good eye :)


> would make:
> 
> kvmppc_create_vcpu_debugfs
> kvmppc_create_vcpu_debugfs_hv
> kvmppc_create_vcpu_debugfs_pr (possibly)
> 
> which perhaps is more consistent.


Or  kvm_arch_vm_ioctl_hv(). I really like having "arch" in the name, 
tells right away what it is about. "kvmppc" might be excessive. Thanks,



>>   {
>> -	char buf[16];
>> -	struct kvm *kvm = vcpu->kvm;
>> -
>> -	snprintf(buf, sizeof(buf), "vcpu%u", id);
>> -	vcpu->arch.debugfs_dir = debugfs_create_dir(buf, kvm->arch.debugfs_dir);
>> -	debugfs_create_file("timings", 0444, vcpu->arch.debugfs_dir, vcpu,
>> +	debugfs_create_file("timings", 0444, debugfs_dentry, vcpu,
>>   			    &debugfs_timings_ops);
>>   }
>>   
>>   #else /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */
>> -static void debugfs_vcpu_init(struct kvm_vcpu *vcpu, unsigned int id)
>> +static void kvmppc_arch_create_vcpu_debugfs_hv(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
>>   {
>>   }
>>   #endif /* CONFIG_KVM_BOOK3S_HV_EXIT_TIMING */

-- 
Alexey
