Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B90503657A4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 13:36:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPhTZ5KkMz30CX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 21:36:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fossix-org.20150623.gappssmtp.com header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=JG9D83lF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JG9D83lF; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPhT76k3Tz2xfs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 21:35:55 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 em21-20020a17090b0155b029014e204a81e6so1166376pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Fi6+fC+9nI6RI6HCFc2tjwgCOEud/oGFC8Oue8ByrTI=;
 b=JG9D83lFsIg7C0ommTVyRh6YSbmySmLDrh2yrXIykbmpS65HCUTrIbVglu58aipY/D
 uy5y9Fu4Cv6mTtbW+PXLrIVyxDLgOuAbDOXNntTtQWtdjWs6kJmkkQVZeFS7CMzP5vN6
 ztkACpHMHnh93q9qO1loeQLXIcPmPXytbgbMpVrmIFKmKL5ZSH1qEF8SMNGxtqr3kZmw
 +gi1qUN0P4RBv8l9rjq5LbxUtP2O/703U83N3fR7HG622sLJ7utPNxk2y7iRlN8/+/tt
 i9P6iJp0b/pgRzWUBWLJ48MnqWXtP0BZjy+gnatdo55I7SVeT53po/vfYovlMqwvfNhm
 Fnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Fi6+fC+9nI6RI6HCFc2tjwgCOEud/oGFC8Oue8ByrTI=;
 b=kAlLzJEEAQBKPfjnkP/9KbuUY/Wvc+p7FXwxaulUwRjnuKMwfjvAR3nmNZFf2YklAk
 0oB68ruvrLYdCde4FHuMhxq/LcdwSHKtSpvzjh7Y4m65JN0vYw9qbd/khm6K1GzHcgIZ
 7UvUQu0Rqubk0wDA8Tgn6c5TvS1JNnVTiEfof4LxsZWqclXtbxr4tWUY3kqv0XM4OkEP
 7cNQ8GnXYMldfQ/kOrwGsxcXeQ7deKknshSXHVl/XL03/8RIyEyXsZS/BBxIRMLfjoqw
 JOQjhzB3UuC5B5WpQB/nrArHYMlX4+qmScdXp6biZqkrVP54qqYVvjzNnqVAYg6LThJt
 bsbw==
X-Gm-Message-State: AOAM530Ck6t02mBeVK13ek2cBz/HhR+qjynHZ5AAjch7gC85CrjITQAL
 KkL9/HZEXkLlG/JgZDJjKrSt1A==
X-Google-Smtp-Source: ABdhPJz64idVedT1P4xZuROdPcAjglS/ic5tLIgjzuGkWAtcKKfHnlpheN1PKrQs7qPzfIipXhmFig==
X-Received: by 2002:a17:90b:d92:: with SMTP id
 bg18mr4588712pjb.155.1618918551928; 
 Tue, 20 Apr 2021 04:35:51 -0700 (PDT)
Received: from localhost ([103.21.79.4])
 by smtp.gmail.com with ESMTPSA id j13sm14744909pfn.103.2021.04.20.04.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 04:35:51 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Ganesh <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
In-Reply-To: <9b8c7347-47fe-822d-7fae-9365bb7cde7c@linux.ibm.com>
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
 <87bla9zae7.fsf@fossix.org>
 <9b8c7347-47fe-822d-7fae-9365bb7cde7c@linux.ibm.com>
Date: Tue, 20 Apr 2021 17:05:47 +0530
Message-ID: <878s5dyyr0.fsf@fossix.org>
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ganesh <ganeshgr@linux.ibm.com> writes:

> On 4/20/21 12:54 PM, Santosh Sivaraj wrote:
>
>> Hi Ganesh,
>>
>> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>>
>>> When we hit an UE while using machine check safe copy routines,
>>> ignore_event flag is set and the event is ignored by mce handler,
>>> And the flag is also saved for defered handling and printing of
>>> mce event information, But as of now saving of this flag is done
>>> on checking if the effective address is provided or physical address
>>> is calculated, which is not right.
>>>
>>> Save ignore_event flag regardless of whether the effective address is
>>> provided or physical address is calculated.
>>>
>>> Without this change following log is seen, when the event is to be
>>> ignored.
>>>
>>> [  512.971365] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
>>> [  512.971509] MCE: CPU1: NIP: [c0000000000b67c0] memcpy+0x40/0x90
>>> [  512.971655] MCE: CPU1: Initiator CPU
>>> [  512.971739] MCE: CPU1: Unknown
>>> [  512.972209] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
>>> [  512.972334] MCE: CPU1: NIP: [c0000000000b6808] memcpy+0x88/0x90
>>> [  512.972456] MCE: CPU1: Initiator CPU
>>> [  512.972534] MCE: CPU1: Unknown
>>>
>>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>>> ---
>>>   arch/powerpc/kernel/mce.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>>> index 11f0cae086ed..db9363e131ce 100644
>>> --- a/arch/powerpc/kernel/mce.c
>>> +++ b/arch/powerpc/kernel/mce.c
>>> @@ -131,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>>   	 * Populate the mce error_type and type-specific error_type.
>>>   	 */
>>>   	mce_set_error_info(mce, mce_err);
>>> +	if (mce->error_type == MCE_ERROR_TYPE_UE)
>>> +		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>>   
>>>   	if (!addr)
>>>   		return;
>>> @@ -159,7 +161,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>>   		if (phys_addr != ULONG_MAX) {
>>>   			mce->u.ue_error.physical_address_provided = true;
>>>   			mce->u.ue_error.physical_address = phys_addr;
>>> -			mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>>   			machine_check_ue_event(mce);
>>>   		}
>>>   	}
>> Small nit:
>> Setting ignore event can happen before the phys_addr check, under the existing
>> check for MCE_ERROR_TYPE_UE, instead of repeating the same condition again.
>
> In some cases we may not get effective address also, so it is placed before
> effective address check.

Yes, I forgot the last two lines in the changelog after I applied the patch :-)

Thanks,
Santosh
>
>>
>> Except for the above nit
>>
>> Reviewed-by: Santosh Sivaraj <santosh@fossix.org>
>>
>> Thanks,
>> Santosh
>>> -- 
>>> 2.26.2
