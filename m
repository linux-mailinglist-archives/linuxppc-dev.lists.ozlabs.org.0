Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B69B72CD0DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 09:12:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmpVN3W2QzDqyk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 19:12:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lMaPLf/q; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmpSl0T9jzDqlQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 19:11:03 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id l11so725264plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 00:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WqpmGp9OJGa7queCMLR4o4rlv6uqQKlUfzBEIFliW54=;
 b=lMaPLf/qeYe513b9i/NDgee0tJGlWsj3uqu1UFB69A7Sy/ihXjEaUTKVgIwCUymhWH
 680QQWZ6jW6Tg32UeXaiTb40VG7MFZT00uul4s/nyhFYZ32ehfywk5XD8WXG+ZDzpYlg
 URyfPMOf8LGrwQvjzSXaD4Reysn5iVV4Cs1wJAHLxwnKJ4h6mky4FpZqKhBCTiJ7jBhD
 UxoPmHpK2vr03tRjNjcNDUpvf0TY/WVMdJdONhB1rtiKeM8/QHneDwxkQ4jYfzczahsO
 OFg0wgnO7wKE2yalQk4ZCdbwMNlv7iCJZDlLLXt6Ra8DQqjIcV5ww6yqXsg84NHemJYF
 1DRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WqpmGp9OJGa7queCMLR4o4rlv6uqQKlUfzBEIFliW54=;
 b=GqWGdSWd8qTIxKJNJeNxYlvbHt41NKTw9vvUMZdaIIOp9AZAAyBWKAfvx4Us3DA5XO
 1YG7cMkgbKTOxtuoQRiMqVsBGt6KYAqACDmLhIyH/RghFumI2kjsbzNAhuCzw/hWxkHZ
 pLFTILStPq2s3zfN+lmuxbp34kRAgnkv55P26OOK2CHdA/giqztORKWTrjV29thyOm4C
 XhX/M6OpdedRcCieewbef2FP1PT3cBZXeoLEGmUjDLWXw1dkNXa/3vB/16dPlWWpUMCP
 ZLuAJQpBibbG2cmaGeIo1DMUIR4WjGTRA24s2P8/+NOwTrds3B/05ZxlBd4Mu0KOALtR
 ar8w==
X-Gm-Message-State: AOAM530/SdyKmMjHwGYbgqsZsFBSojotlAKqtNWM4nFpDghud/+oKITT
 WTAFYyCQig8HekKbqtEDAxQBAg==
X-Google-Smtp-Source: ABdhPJx1tAGj8azpAhacSPJraYo0mLhvYk07kUAKPPgBISNw6S3+cD+kLRPqMxu4gRVOxvjw+Om+Jw==
X-Received: by 2002:a17:90b:1645:: with SMTP id
 il5mr2049483pjb.15.1606983059591; 
 Thu, 03 Dec 2020 00:10:59 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id
 l17sm639007pjy.29.2020.12.03.00.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 00:10:58 -0800 (PST)
Subject: Re: [PATCH kernel v2] powerpc/kuap: Restore AMR after replaying soft
 interrupts
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20201203054724.44838-1-aik@ozlabs.ru>
 <87zh2vjsxg.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <b095472b-e7d2-65e0-0936-f3b018c12367@ozlabs.ru>
Date: Thu, 3 Dec 2020 19:10:54 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <87zh2vjsxg.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/12/2020 17:38, Aneesh Kumar K.V wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> When interrupted in raw_copy_from_user()/... after user memory access
>> is enabled, a nested handler may also access user memory (perf is
>> one example) and when it does so, it calls prevent_read_from_user()
>> which prevents the upper handler from accessing user memory.
>>
>> This saves/restores AMR when replaying interrupts.
>>
>> get_kuap/set_kuap have stubs for disabled KUAP on RADIX but there are
>> none for hash-only configs (BOOK3E) so this adds stubs and moves
>> AMR_KUAP_BLOCK_xxx.
>>
>> Found by syzkaller. More likely to break with enabled
>> CONFIG_DEBUG_ATOMIC_SLEEP, the call chain is
>> timer_interrupt -> ktime_get -> read_seqcount_begin -> local_irq_restore.
> 
> Can you test this with https://github.com/kvaneesh/linux/commits/hash-kuap-reworked-2

Yup, broken:

[    8.813115] ------------[ cut here ]------------ 

[    8.813499] Bug: Read fault blocked by AMR! 

[    8.813532] WARNING: CPU: 0 PID: 1113 at 
/home/aik/p/kernel/arch/powerpc/include/asm/book3s/64/kup.h:369 
__do_page_fault+0xd
34/0xdf0 

[    8.814248] Modules linked in: 

[    8.814459] CPU: 0 PID: 1113 Comm: amr Not tainted 
5.10.0-rc4_aneesh--hash-kuap-reworked-2_a+fstn1 #61
[    8.815075] NIP:  c0000000000a4674 LR: c0000000000a4670 CTR: 
0000000000000000
[    8.815632] REGS: c00000000d44f530 TRAP: 0700   Not tainted 
(5.10.0-rc4_aneesh--hash-kuap-reworked-2_a+fstn1)



> We do save restore AMR on interrupt entry and exit.

This is nested interrupt. we get interrupted while copying to/from user. 
The first handler has AMR off, then it goes to strncpy_from_user, 
enables AMR, page fault happens and another interrupt arrives - and if 
the new interrupt also wants strncpy_from_user/co, it will enable AMR 
again (which is ok), do copy and then disable AMR; and then we go back 
and resume the first strncpy_from_user which thinks AMR is enabling 
while it is not. I just see how strncpy_from_user is called while 
strncpy_from_user is running. Nick understands the mechanics better.

I can give you an initramdisk which crashes in a millisecond, ping me in 
slack.


-- 
Alexey
