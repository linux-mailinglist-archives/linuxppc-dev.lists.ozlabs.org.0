Return-Path: <linuxppc-dev+bounces-2217-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B204C99CA65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 14:39:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRxcg3yyBz3bmy;
	Mon, 14 Oct 2024 23:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728909555;
	cv=none; b=Mm2P/oXnaUEUNgzJwfVSe8wZO9sNLF7ei27Yl4m2DhyKFbR/6FdI9m/tGyg19ISdKz7tZWZb90EIFD6Zf7PrDTH9G0PJVWojkKlcDqPjrAq9ogkpxKJN1e/8KXej9aFG3cV6FCAI4fDm+GNiasaMU/AjyfNFCKTvon0SqSxlEf/5rHrzyeHeDQmjZ0QCY/j3zwLB+xh5RMshaAa4Zdsfqbn9TtBSl/JBYijYIawVNi11Lwj0VVtT3icoBBPJcsGvUaJZln/Td+/sRMubB7VYD3Q+5cafZ+Sbw656+4KWOH3LZKpj5sxWXYPFIDwNhZsZrjhVCjZZlJ9haP5lC6aM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728909555; c=relaxed/relaxed;
	bh=JrKFn42xuc1H7J8Te5llpeV6Qi1vNIgovxPBFsGJQa8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=J23NqTGni7UK9257lKQTLXR6Se9em9R4+3jeiV63tBkSFKy1z7ZvV7CQLFeznqGIx5STLlguIqpRhA+H6Ao9Jt7NiYYAFH1LLuYBkbE3UcNhBneQ6ErJjay7oFA6UwQepjxBOXDnUCar4q15pz3iA2gE4LlrYlTNDT6XFhpPg35KhDH6yyn4smeJyGE4ME93gy6ShLis6/SQbXR8gL4Pzqw9TBYkycQJLERAkzHBW9xVmMw6PeQeWcp6djtRrXZkAV7JmVAbp19guROIShCQj19uYJRAMGiZwCjc+78lA6/MUU4q/6WBQbiNTkdYI1UQH6R9OVzl/ehRlalEbh/X2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GDJvVzUF; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GDJvVzUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRxcf39NQz3bgy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 23:39:13 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20cbca51687so17072355ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 05:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728909552; x=1729514352; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JrKFn42xuc1H7J8Te5llpeV6Qi1vNIgovxPBFsGJQa8=;
        b=GDJvVzUFuFpWcRtL5XUfx96R79fVM9ZLiKdW0GP/E6IFWw3uKy+Qo1XkLMkuXyVeEZ
         RXjxJUkKT6pt6BjZwvqc063z4uUDaHaL76ua74e805w8ceSiiy6iIRmgTRWbGuh0cyhw
         xM7cwZJg4CbAVhMll/vNVQauR/QPBZoxU8vHyXUs8a4DFUOYX5oV9Qn7IfAT8CBhtJ5e
         ppTYBzLKGHcu6xxmzfP1hcp4b6Qkdt4hBl4vLgvrQVHWurOblxvYtF1Hy6JeOjJSOzmE
         CUsmwJDwEnHZviDDrgOZA9BZ3xWEO20PaTN4W3tiL7yTUNM6UixnFscJxIe1+cXo7mkP
         zQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728909552; x=1729514352;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JrKFn42xuc1H7J8Te5llpeV6Qi1vNIgovxPBFsGJQa8=;
        b=hZUWihasnebF+T/UbjvPkNYqPkjTfEnPxqNu7sn7GaiZzD7aaT+/ZLNtkznvqd3Z42
         gLUGxQvn1yEX7Oz37b/UjzVk8i2RHMjlSLsVGzk7+H1qO6iEuF35XwQhdhq8gOr+yfpk
         b3VpWEm/bjRe46StRg8gtSseDjF3JqrPJ+N6SjxktuGfBCy9rKOjLLKe11TPMHrvWmqu
         AbHYy03tEpUgRvTAkxFMf5UIpw88g+pK1ROctY1ZeOpk67dVwHgLJoBpDK1nXD1VN3qC
         teVGnflUh6wt80dfK+XidyLJyvEHCcbGMaPrNt9oAJzWIXPQhuAV4P4BagbOa9CkIwzd
         5wpw==
X-Gm-Message-State: AOJu0YyeUB40XqRQs1W6d4V5qPQ75mqQpWA26RmrLOZPtqKMNXm/UFPx
	AJ/oIUpBlyVX/5iqQTkenkB7y7HvrmWePHtcCpghxKDYmGjxPEK5
X-Google-Smtp-Source: AGHT+IE+bM7+WY+9RLsixhECD+emhDXilhTCLtkjvV3sehkEtjOAqtlL8CRTc0dajOpGcaehvXLwtQ==
X-Received: by 2002:a17:902:f708:b0:20c:79bf:6793 with SMTP id d9443c01a7336-20cbb1a9697mr111971195ad.3.1728909551714;
        Mon, 14 Oct 2024 05:39:11 -0700 (PDT)
Received: from dw-tp ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea748b036bsm3396987a12.0.2024.10.14.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 05:39:11 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: drivers/nx: Invalid wait context issue when rebooting
In-Reply-To: <ZwkbOJN5Jmjy_wkJ@linux.ibm.com>
Date: Mon, 14 Oct 2024 17:54:44 +0530
Message-ID: <87a5f6zxbn.fsf@gmail.com>
References: <ZwjjXJ5UtZ28FH6s@linux.ibm.com> <87wmif53iw.fsf@mail.lhotse> <ZwkbOJN5Jmjy_wkJ@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Vishal Chourasia <vishalc@linux.ibm.com> writes:

> On Fri, Oct 11, 2024 at 09:37:27PM +1100, Michael Ellerman wrote:
>> 
>> I don't see why of_reconfig_notifier_unregister() needs to be called
>> with the devdata_mutext held, but I haven't looked that closely at it.
>> 
>> So the change below might work.
>> 
>> cheers
>> 
>> diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
>> index 35f2d0d8507e..a2050c5fb11d 100644
>> --- a/drivers/crypto/nx/nx-common-pseries.c
>> +++ b/drivers/crypto/nx/nx-common-pseries.c
>> @@ -1122,10 +1122,11 @@ static void nx842_remove(struct vio_dev *viodev)
>>  
>>  	crypto_unregister_alg(&nx842_pseries_alg);
>>  
>> +	of_reconfig_notifier_unregister(&nx842_of_nb);
>> +
>>  	spin_lock_irqsave(&devdata_mutex, flags);
>>  	old_devdata = rcu_dereference_check(devdata,
>>  			lockdep_is_held(&devdata_mutex));
>> -	of_reconfig_notifier_unregister(&nx842_of_nb);
>>  	RCU_INIT_POINTER(devdata, NULL);
>>  	spin_unlock_irqrestore(&devdata_mutex, flags);
>>  	synchronize_rcu();
>> 
> With above changes, I see another similar bug, but what's strange is
> swapper does not hold any lock and still this bug is being triggered

Looking at the below stack, it looks like you discovered a new problem
after the above problem was fixed with the above changes.
(So maybe you could submit this fix along with [1])
Also looking at the history of changes, seems the above problem always
existed. Not sure why it wasn't caught earlier then?

[1]: https://lore.kernel.org/linuxppc-dev/ZwyqD-w5hEhrnqTB@linux.ibm.com/T/#u

I am not much aware of the below code paths. Nor it is evident from the
stack on why "Invalid wait context". Maybe you can give git bisect a try
for below issue (or can also wait for someone to comment on below stack).
(But you might have to keep the nx-common-pseries driver disabled for git bisect to work). 

>
> =============================
> [ BUG: Invalid wait context ]
> 6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty #84 Not tainted
> -----------------------------
> swapper/2/0 is trying to lock:
> c000000004062128 (&xibm->lock){....}-{3:3}, at: xive_spapr_put_ipi+0xb8/0x120
> other info that might help us debug this:
> context-{2:2}
> no locks held by swapper/2/0.
> stack backtrace:
> CPU: 2 UID: 0 PID: 0 Comm: swapper/2 Not tainted 6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty #84
> Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
> Call Trace:
> [c000000004ac3420] [c00000000130d2e4] dump_stack_lvl+0xc8/0x130 (unreliable)
> [c000000004ac3460] [c000000000312ca8] __lock_acquire+0xb68/0xf00
> [c000000004ac3570] [c000000000313130] lock_acquire.part.0+0xf0/0x2a0
> [c000000004ac3690] [c0000000013955b8] _raw_spin_lock_irqsave+0x78/0x130
> kexec: waiting for cpu 2 (physical 2) to enter 2 state
> [c000000004ac36d0] [c000000000194798] xive_spapr_put_ipi+0xb8/0x120
> [c000000004ac3710] [c000000001383728] xive_cleanup_cpu_ipi+0xc8/0xf0
> [c000000004ac3750] [c0000000013837f4] xive_teardown_cpu+0xa4/0x100
> [c000000004ac3780] [c0000000001d2cc4] pseries_kexec_cpu_down+0x54/0x1e0
> [c000000004ac3800] [c000000000213674] kexec_smp_down+0x124/0x1f0
> [c000000004ac3890] [c0000000003c9ddc] __flush_smp_call_function_queue+0x28c/0xad0
> [c000000004ac3950] [c00000000005fb64] smp_ipi_demux_relaxed+0xe4/0xf0
> [c000000004ac3990] [c0000000000593d8] doorbell_exception+0x108/0x2f0
> [c000000004ac3a20] [c00000000000a26c] doorbell_super_common_virt+0x28c/0x290
> --- interrupt: a00 at plpar_hcall_norets_notrace+0x18/0x2c
> NIP:  c0000000001bee18 LR: c0000000013867a8 CTR: 0000000000000000
> REGS: c000000004ac3a50 TRAP: 0a00   Not tainted  (6.12.0-rc2-fix-invalid-wait-context-00222-g7d2910da7039-dirty)
> MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 22000242  XER: 00000001
> CFAR: 0000000000000000 IRQMASK: 0
> GPR00: 0000000000000000 c000000004ac3cf0 c000000001e37600 0000000000000000
> GPR04: 0000000000000000 0000000000000000 0001dc4f97750361 0000000000010000
> GPR08: 00000000000000c0 0000000000000080 0001dc4f97750554 0000000000000080
> GPR12: 0000000000000000 c0000007fffee480 0000000000000000 0000000000000000
> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR20: 0000000000000000 c000000002ebf778 0000000000000000 00000043a215d824
> GPR24: 0000000000000000 c000000000ec0f80 c000000002ebf778 0000000000000000
> GPR28: 0000000000000000 0000000000000001 c0000000021a2300 c0000000021a2308
> NIP [c0000000001bee18] plpar_hcall_norets_notrace+0x18/0x2c
> LR [c0000000013867a8] check_and_cede_processor+0x48/0x80
> --- interrupt: a00
> [c000000004ac3cf0] [0000000000982538] 0x982538 (unreliable)
> [c000000004ac3d50] [c000000001386874] dedicated_cede_loop+0x94/0x1a0
> [c000000004ac3da0] [c00000000138584c] cpuidle_enter_state+0x10c/0x8a8
> [c000000004ac3e50] [c000000000ec0f80] cpuidle_enter+0x50/0x80
> [c000000004ac3e90] [c0000000002ba9c8] call_cpuidle+0x48/0xa0
> [c000000004ac3eb0] [c0000000002cec54] cpuidle_idle_call+0x164/0x250
> [c000000004ac3f00] [c0000000002cee74] do_idle+0x134/0x1d0
> [c000000004ac3f50] [c0000000002cf34c] cpu_startup_entry+0x4c/0x50
> [c000000004ac3f80] [c0000000000607d0] start_secondary+0x280/0x2b0
> [c000000004ac3fe0] [c00000000000e058] start_secondary_prolog+0x10/0x14

-ritesh

