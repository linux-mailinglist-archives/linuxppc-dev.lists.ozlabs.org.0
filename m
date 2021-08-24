Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 616C13F59EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 10:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gv2Z223dfz2yPv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 18:38:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=UN1hqkTU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=UN1hqkTU; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gv2YG14mQz2xnd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 18:37:33 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id j187so17696582pfg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B2gKm6chBsv5r3i/L80Y3/d7t6I2kPU5f7xacAN/16I=;
 b=UN1hqkTUde+ZVmSeDs02KLaAqXx+Udsm8mkh6v/GeeQMKx9dUk3As7xnfnzTCdVvIT
 8GAdUxoIa2yNJ1CT23mGdkZgZoRYCn396OF0ASku2oEgxzklDtMa3azVrL+49MbiuVHe
 Ys8qNpa5mE9KrEsMezYUpgiC64AkYaXleghP6Semde5mheftJcQQrlAR4pC+Nx9xyKXf
 FzwkfCFrBnkSP0X2SY4coE8htycrioioGpxj5zPfjnEGzdH+4UoCrU7FL6CH7N/yFTgC
 ZtsmHIBe/Qx4Sbwxq0IRDLLHF0Rdh+F4nMlSZdlz2ZyMiYY54IiujG06xWqKWly7QcUT
 4Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B2gKm6chBsv5r3i/L80Y3/d7t6I2kPU5f7xacAN/16I=;
 b=G/6kX4hlWWHbjkLqGlbCjdJ1RBYQznD3JZHpUAHyllHL4k0usNeAGWBl/nllmOoH4p
 +mFUQIgy/LuLE3xklBbkUNHj4jZcdgKJmOpjTLGg7xTXpUdtto1Uu8+Lo1/Q8eHpz79G
 Zbmac1GGfShoEtNemuX9SCzqwRDNj8Vg4Ancb7xaBOYeUivfhNnFVqvj2e+hPzknO0YG
 xSHK/RalWQfvu7xPt6qThxbgvnJoJ1IMREUhbV0bwWy5OVakWKEBZ9Fy+DXb/1BwsoDO
 u8UvkVD49gNIqHMXG2yhyaTwyaoDbPCEeU2YThZIlKy83HkFi4Aiz6iwKJ96g2MDrU4d
 lhXQ==
X-Gm-Message-State: AOAM531WTffY8H7HKi5feqqfNzxjSvDHC/qZU2xdwUhhN7VO8S3SdgJO
 KLMeEYd+M5uXVdNMKdAafL+MIg==
X-Google-Smtp-Source: ABdhPJwm8/hDWjBO4m0jD9d+GUvfnpaDVbH4ZheRLKmoA8ju9VtsRmFdyxMMuVmlFA/NmuXdBO1Ygw==
X-Received: by 2002:a62:9712:0:b029:3be:3408:65a9 with SMTP id
 n18-20020a6297120000b02903be340865a9mr38537843pfe.63.1629794250637; 
 Tue, 24 Aug 2021 01:37:30 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with UTF8SMTPSA id ds6sm1700529pjb.32.2021.08.24.01.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 01:37:30 -0700 (PDT)
Message-ID: <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
Date: Tue, 24 Aug 2021 18:37:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
 <87pmubu306.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87pmubu306.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/08/2021 08:20, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> On 07/07/2021 14:13, Alexey Kardashevskiy wrote:
> 
>> alternatively move this debugfs stuff under the platform-independent
>> directory, how about that?
> 
> That's a good idea. I only now realized we have two separate directories
> for the same guest:
> 
> $ ls /sys/kernel/debug/kvm/ | grep $pid
> 19062-11
> vm19062
> 
> Looks like we would have to implement kvm_arch_create_vcpu_debugfs for
> the vcpu information and add a similar hook for the vm.

Something like that. From the git history, it looks like the ppc folder 
was added first and then the generic kvm folder was added but apparently 
they did not notice the ppc one due to natural reasons :)

If you are not too busy, can you please merge the ppc one into the 
generic one and post the patch, so we won't need to fix these 
duplication warnings again? Thanks,



>>> ---
>>>    arch/powerpc/kvm/book3s_hv.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>> index 1d1fcc290fca..0223ddc0eed0 100644
>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
>>>    	/*
>>>    	 * Create a debugfs directory for the VM
>>>    	 */
>>> -	snprintf(buf, sizeof(buf), "vm%d", current->pid);
>>> +	snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
>>>    	kvm->arch.debugfs_dir = debugfs_create_dir(buf, kvm_debugfs_dir);
>>>    	kvmppc_mmu_debugfs_init(kvm);
>>>    	if (radix_enabled())
>>>

-- 
Alexey
