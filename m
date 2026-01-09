Return-Path: <linuxppc-dev+bounces-15455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B3FD0A0FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 09 Jan 2026 13:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dnhYw4hZvz2xgv;
	Fri, 09 Jan 2026 23:54:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767963284;
	cv=none; b=YnSK9FP6D2q+NxKQivTOxuPR4SUKSh7nzfS01MCIXjU5SLf//T7mUXHTIL9X59x9gDrTG4ixuRsAvUmXVVClU/HVZ2iC2NlkmjB3Mmon+5w/IZ+knVcGgNcvXINKtgIIZ0S2pLhGqkUlHC6DI/2iMcgHken56LENNjQvg/49YrCVo87LN67SMUVwiGq/FZb7XUp+WlGpKl6FpfNWtnVk2vax0v6uvneUr1c0e0i9QdLiUcwf+Kxnc5h9YzyW7pG5ZTk1yF5kVn7VJlAo8RfXf55T9ADh9WwiClQDeiXmbG7S/yDAY7MDgOowXLgVu9ztmAympfuDFz5quo7BQlcp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767963284; c=relaxed/relaxed;
	bh=xd4/4nTe3bqvCXdwZfxKgNJZ44GCWQQ0Owd6YaGF0AM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ib2iSf61DPrWQNFi9aRTAn0+rCs5CypbMj4Cur9okjgvIRVWX+OE3B1Cvd9ul6KgXoagA7ZxHU8R5ypIgASBM5JGu9m1Pj00WI8gLjEVfWEd6teQOMQMRfuKN8gRR88TeFFuUqSkigsE+OkF2uqIYwKM1pBYOd4C7akIneM+XZskB1RwsXFooOLQSff4LWu27RWSew5/MrDt4kqtNG3F2XCreCCE3mAgosFBEafhBpZluTNi7vZsjwKxq3IXRjCbm72h8C7pdXL+MC4rBZGvtkMEMgLm/cp/s3asDzcan9l9nVDX4/B9pI5pghi7/2ZtH1oomhceS1McepwUL0Hd/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJqTBR3O; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJqTBR3O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnhYv4BbLz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 23:54:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A47CB40C43;
	Fri,  9 Jan 2026 12:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E00C4CEF1;
	Fri,  9 Jan 2026 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767963251;
	bh=/jSn7D7gYks/WiVctkdadSm4g9WcWCWBKKGC88gdReI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJqTBR3OJiA8fsJwCRuRysPDMeQ68a9epeJqavR+Wunf9b7uAqT0+aexwoExnYnXm
	 jZRfD0C4sebk/wO5AbiwAZQWaQKCU1hgZ4cACmuX0vCKxsdfjNC6YhoH50zy1FuvS7
	 F1Qz0oQY2LK/WZnhdmgmm2HnceDiYi9BY26XMW4k9WjQf7j86ujaO1I1l0Vu6lhrtG
	 5jsg0D49lkTPIQWnsNRQs7rR++bAvJlMKP1oFXGUWg6m1aEskVH9+t+0nQM/5yIofs
	 8H4QaWFpuN9n4dtYKZgAWMmvp8vijPvCA6861nhNkZ9jZIV7mpJALhIVujPqlzqqf8
	 7v5QV8FEGV1LQ==
Message-ID: <336d274e-c831-4af9-ae65-42908b3c2c61@kernel.org>
Date: Fri, 9 Jan 2026 13:54:06 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] powerpc: Fix kuap warnings
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: riteshh@linux.ibm.com, linux-kernel@vger.kernel.org,
 hbathini@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rostedt@goodmis.org, mhiramat@kernel.org, Nicholas Piggin <npiggin@gmail.com>
References: <20260109064917.777587-1-sshegde@linux.ibm.com>
 <a42acab4-274b-4e5e-804b-bb07a26058c7@kernel.org>
 <fe9b9c66-d1cd-4570-91fa-54329d8c6a37@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <fe9b9c66-d1cd-4570-91fa-54329d8c6a37@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Shrikanth,

Le 09/01/2026 à 13:19, Shrikanth Hegde a écrit :
> Hi Christophe.
> 
> On 1/9/26 1:41 PM, Christophe Leroy (CS GROUP) wrote:
>>
>>
>> Le 09/01/2026 à 07:49, Shrikanth Hegde a écrit :
>>> Recently stumbled upon these kuap warnings. This happens with
>>> preempt=full/lazy kernel with function tracing enabled. What irked
>>> me was kernel compilation was getting failed when i had tracing
>>> enabled. It doesn't fail everytime. While running stress-ng memory class
>>> it threw same warnings. So that helped to narrow it down.
>>> So one possible way is to disable tracing for these enter/exit
>>> vmx_usercopy. That seems to fix the bug/warnings. But that will make
>>> them as non trace-able. If there is a better way to fix these warning 
>>> while
>>> keeping them as trace-able, please let me know.
>>>
>>> Anyone with insights on amr, vmx and tracing, please advise.
>>
>> The main principle with KUAP is to not call subfunctions once 
>> userspace access enabled. There are a few exceptions like 
>> __copy_tofrom_user() that are allowed in order to optimise large 
>> copies. However this needs to be handled very carefully, and in 
>> principle we don't expect __copy_tofrom_user() to call other functions.
>>
> 
> I didn't understand. My knowledge is quite limited in this space.
> Could you please explain how this will help us avoid the warnings?
> or are you saying we have more callsites which needs to worked upon.

Read tools/objtool/Documentation/objtool.txt section "Objtool warning" 
item 9.

Unfortunately powerpc doesn't yet implement objtool to detect it, but 
the principle applies anyway.

> 
>> So it might require wider rework but we should narrow as much as 
>> possible the period during which access to userspace is opened, with 
>> something like:
>>
>> raw_coy_to_user_power7()
>> {
>>      enter_vmx_usercopy();
> 
> I think the problem is when it comes here, it has some AMR state, but
> it is preemptible. So shouldn't call schedule IIUC.

See commit 00ff1eaac129 ("powerpc: Fix reschedule bug in KUAP-unlocked 
user copy")

The problem is because enter_vmx_usercopy() is called _after_ 
allow_write_to_user() which changes AMR.

If you call enter_vmx_usercopy() _before_ allow_write_to_user() and call 
exit_vmx_usercopy() _after_ prevent_write_to_user() the problem is solved.

> 
>>      allow_write_to_user(to, n);
>>      ret = __copy_tofrom_user_power7();
>>      prevent_write_to_user(to, n);
>>      exit_vmx_usercopy();
>>      return ret;
>> }
>>
>> raw_copy_to_user()
>> {
>>      if (cpu_has_feature(CPU_FTR_VMX_COPY))
>>          raw_copy_to_user_power7();
>>
>>      allow_write_to_user(to, n);
>>      ret = __copy_tofrom_user(to, (__force const void __user *)from, n);
>>      prevent_write_to_user(to, n);
>>      return ret;
>> }
> 


