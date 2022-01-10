Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8566048A3FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 00:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXrG53C6Wz30MT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jan 2022 10:51:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ItfE+s4n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ItfE+s4n; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXrFD2mYVz30Cr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jan 2022 10:51:11 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso2582537pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 15:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=g4elZEGZLbtyoXvKlR1aoQZ5uI6OqTEZ0ihc5xTsWHM=;
 b=ItfE+s4nge1QQhJwmD9D/rdEqltMHF12wvZaPS8mrC5P0AfKtOnkchOoqnXnZBifON
 2z91S6wROPs07mjG33MJo4E1GGPBBJBfKgkDX7eCJFnOhtkTcSvIvlJh0kPcrtXInEWh
 C7tUwT3v7e4qw+9i3eEpNNQwEQhjCocgK0HQSkqnW8Bz7Xu6G7qJOz5hfomibP1HVOAD
 5udnVVxeCHsIiiHSXYXGeYbL65owzDTmK9D932PPoCJrjHBOjpKAuu5EBswTi+hMdZkz
 hnQy5qefk5l8yw6kq0T7ZOZQ3phWmKJ+e74GKwpQeDHAhZNWz1EnDbv6lOi+buVOwHfS
 OpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=g4elZEGZLbtyoXvKlR1aoQZ5uI6OqTEZ0ihc5xTsWHM=;
 b=qfMFjlIGpOapbZruqF3kGb2eTnMRZeJkuELUu+0tSwqndms8R976iO4NA8W9piyPJe
 NEUFgEJCTl64D2O61IDEK71siOJD+1FzHCurEqcj5KndoLDXCNIjtdP+pr7vhNtqUiz3
 aNfDpjhuzxhj0JzTPvqyW9bFZ0Cz2dUIiowXpgHBSdwTCJF27xUyHFrepwvd2/bIBdUD
 oCJEkSWDmIk7PnU7tMLioW3ZCmWt91ZqsXSeg9L2mjM3FwDzX/TaP2XykcwjZzOM1qtz
 RXRz1WCVbMzRSsS7wkwpSiWf9P4yHOzXBLDf5U1z521jQknf8KECcUWrKVLTbFfJ+kU5
 b6rg==
X-Gm-Message-State: AOAM532dRzQVbfIjQGqiWluhK5trlR3BWzBqpU2KOo8ONqzCP9ggXwal
 ZCQaU7AIEtksBmdMclB20iw6Mg==
X-Google-Smtp-Source: ABdhPJz3Oz+IIfqsYM3c7rT02Fu1G6CWKBEK2E2E7ymL5UvrtkLHrNNpLQcnI6qolCJ+dps09CJ8Bw==
X-Received: by 2002:a05:6a00:1693:b0:44c:64a3:d318 with SMTP id
 k19-20020a056a00169300b0044c64a3d318mr2041347pfc.81.1641858667919; 
 Mon, 10 Jan 2022 15:51:07 -0800 (PST)
Received: from [192.168.10.24] (203-7-124-83.dyn.iinet.net.au. [203.7.124.83])
 by smtp.gmail.com with ESMTPSA id
 l13sm37253pgq.34.2022.01.10.15.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 15:51:07 -0800 (PST)
Message-ID: <bf61f021-15b3-7093-f991-cdcda93d059d@ozlabs.ru>
Date: Tue, 11 Jan 2022 10:51:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH v3 5/6] KVM: PPC: mmio: Return to guest after emulation
 failure
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas
 <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20220107210012.4091153-1-farosas@linux.ibm.com>
 <20220107210012.4091153-6-farosas@linux.ibm.com>
 <1641799578.6dxlxsaaos.astroid@bobo.none>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <1641799578.6dxlxsaaos.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/10/22 18:36, Nicholas Piggin wrote:
> Excerpts from Fabiano Rosas's message of January 8, 2022 7:00 am:
>> If MMIO emulation fails we don't want to crash the whole guest by
>> returning to userspace.
>>
>> The original commit bbf45ba57eae ("KVM: ppc: PowerPC 440 KVM
>> implementation") added a todo:
>>
>>    /* XXX Deliver Program interrupt to guest. */
>>
>> and later the commit d69614a295ae ("KVM: PPC: Separate loadstore
>> emulation from priv emulation") added the Program interrupt injection
>> but in another file, so I'm assuming it was missed that this block
>> needed to be altered.
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   arch/powerpc/kvm/powerpc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 6daeea4a7de1..56b0faab7a5f 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -309,7 +309,7 @@ int kvmppc_emulate_mmio(struct kvm_vcpu *vcpu)
>>   		kvmppc_get_last_inst(vcpu, INST_GENERIC, &last_inst);
>>   		kvmppc_core_queue_program(vcpu, 0);
>>   		pr_info("%s: emulation failed (%08x)\n", __func__, last_inst);
>> -		r = RESUME_HOST;
>> +		r = RESUME_GUEST;
> 
> So at this point can the pr_info just go away?
> 
> I wonder if this shouldn't be a DSI rather than a program check.
> DSI with DSISR[37] looks a bit more expected. Not that Linux
> probably does much with it but at least it would give a SIGBUS
> rather than SIGILL.

It does not like it is more expected to me, it is not about wrong memory 
attributes, it is the instruction itself which cannot execute.

DSISR[37]:
Set to 1 if the access is due to a lq, stq, lwat, ldat, lbarx, lharx, 
lwarx, ldarx, lqarx, stwat,
stdat, stbcx., sthcx., stwcx., stdcx., or stqcx. instruction that 
addresses storage that is Write
Through Required or Caching Inhibited; or if the access is due to a copy 
or paste. instruction
that addresses storage that is Caching Inhibited; or if the access is 
due to a lwat, ldat, stwat, or
stdat instruction that addresses storage that is Guarded; otherwise set 
to 0.
