Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A483BF3F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 04:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GL0TH3K1Kz3bkj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jul 2021 12:23:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=sqVUCblt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=sqVUCblt; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GL0Sn2G76z2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jul 2021 12:23:02 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id y17so4335813pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jul 2021 19:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=L9ZzMO/peqn6RjqikFr8dYXKCUUURvXv/xvzuiz9Gcg=;
 b=sqVUCblt6YbpHOIC+8fh382fu2yduVloIOccYtsHNuLy2665lyxR/g9GUDe1Vs8ofD
 rNTEBWrbzY8rTWdro1WR+QUkgdghK7JSomCw03NMBMLeBmBbdMWfZ0kMaBVrjUnFFn/J
 FU1RcHjuhD8ylUQJDGUtnTvwx3g+QA4XhcOhCxIyYi603WD91GSzxNFAVmoWdaivaeIy
 T33502MZo28xIZfltFPmhbQjx7010qn0AvjbLVqcXb9b91n44dvvFki8ErUCSJoCi0dK
 3zJaqUxx059uCRPY+5JWgl4dcioI4VYaXheUxR4r0am2vwZ9Ji/RuXSflMzz5+HfPKnm
 ZmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=L9ZzMO/peqn6RjqikFr8dYXKCUUURvXv/xvzuiz9Gcg=;
 b=SzvtKOnDkhpl6bbAv9v5kgDsSiHfcP4rsYvqq3FqY+3DOS7i3wFmKXHFwsHX4zi1N5
 wCuRV2wZCHimhx43KX27zDe08es7M8GumoeKLLQ+mrxhNbExu+Y7ZCsae5/JdkwbnOou
 ScuPhgiOZ4Kq5oxVKK6IQG7uDEKfPAiwHc4cqpeH0KNPDJnPXfhzXImAtKGdUtsZ6Uda
 Cu96qf0GibtlKAqCHcKxF82OU4q5Z8U11c/XofTBkNpXHG9kkurKIMI1kEXWZrL5UKLp
 e3WPA2NhhkkIV96sMr1Vit81jtph4eS9jejaemE7N8SIcl1Q4pC/FvaCGusDoqsbfi7h
 GoaA==
X-Gm-Message-State: AOAM530KD9QMCiaRS8HRdpxauFeNWdYEIjZVyRl4KuTGc+blE9fzL8pz
 B+Gh2L9wgPy7tDAZDu3dlfdwyw==
X-Google-Smtp-Source: ABdhPJxjwp0VZUWtk582B8D83sqx5L5ovUaeeEilDOLIBZHiqCNSo05hlDyZZDoZ78ZHZjAgPKJ/9g==
X-Received: by 2002:a63:1308:: with SMTP id i8mr29514509pgl.19.1625710978256; 
 Wed, 07 Jul 2021 19:22:58 -0700 (PDT)
Received: from [192.168.10.23] (219-90-184-65.ip.adam.com.au. [219.90.184.65])
 by smtp.gmail.com with UTF8SMTPSA id
 j15sm7712642pjn.28.2021.07.07.19.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 19:22:57 -0700 (PDT)
Message-ID: <894b13be-20a3-6855-0136-6419700fa3e9@ozlabs.ru>
Date: Thu, 8 Jul 2021 12:22:53 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:89.0) Gecko/20100101
 Thunderbird/89.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <87zguynhfo.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87zguynhfo.fsf@linux.ibm.com>
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2021 03:48, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> Currently it is vm-$currentpid which works as long as there is just one
>> VM per the userspace (99.99% cases) but produces a bunch
>> of "debugfs: Directory 'vm16679' with parent 'kvm' already present!"
>> when syzkaller (syscall fuzzer) is running so only one VM is present in
>> the debugfs for a given process.
>>
>> This changes the debugfs node to include the LPID which alone should be
>> system wide unique. This leaves the existing pid for the convenience of
>> matching the VM's debugfs with the running userspace process (QEMU).
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

thanks.

Strangely it also fixes a bunch of

BUG: unable to handle kernel NULL pointer dereference in corrupted
BUG: unable to handle kernel paging request in corrupted

I was having 3 of these for every hour of running syzkaller and not 
anymore with this patch.


> 
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 1d1fcc290fca..0223ddc0eed0 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>>   	/*
>>   	 * Create a debugfs directory for the VM
>>   	 */
>> -	snprintf(buf, sizeof(buf), "vm%d", current->pid);
>> +	snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
>>   	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
>>   	kvmppc_mmu_debugfs_init(kvm);
>>   	if (radix_enabled())

-- 
Alexey
