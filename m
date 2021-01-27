Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D971730640A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jan 2021 20:32:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DQtz35wclzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 06:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=WCxXI6l8; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DQtw22CNzzDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 06:29:26 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id g3so1610918plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 11:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3nxLNarXQ29Yg2Hz3t6EeZEp1KHskuPJfvoq2pAdKKo=;
 b=WCxXI6l8hXrKYgGnft+poPr2JNhkp97zieTu9Y+1xounAHsyplYbUQ9AmpxZwhM45O
 M24ssk+uDi6DzGgDlFWFV7TmldyayG43RAfp3IAW0sOnXTmX4s9bFWBB11nhxNbcv+E7
 KI/HMGD90C5fld2q8s3yjReTwcKncuzDIjRj5sz/7sXGHjauOhDMbv3S/81ld8fYSaNS
 yzfdURkF8vSAnGdSml1U1ic6LBCZRAsYzl0S+P9Z5AZyL1ahAPS/0mJUp/vV18uxjj2g
 6FTNp+lW9Rj264fNzApo0lQ9BUXg3r1cHgs1rX4YTcOV6kcXAJ/XOYGUkV43bqrBWHT7
 RxvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3nxLNarXQ29Yg2Hz3t6EeZEp1KHskuPJfvoq2pAdKKo=;
 b=pp1qtYi0pfoIosG2ofbBcBMtDR/Jvugul7TPtLvaYe0YWohiegpwmFXll0hS7iaf8U
 pX+Fuys4iqnjlTzgqnoIK9HOn70iQFoFM3wHUW9VQXZK02WPaZwyMYmANEbZQtRlddeM
 tbzGkC3h8t/nHeGqZWFMsFkZatTeLyc3YmUIn3mWtXWRKpoZZqMMNtJatNroekVSNETI
 +iya9jo6NyRyMibO8vZKjO7P5cAre85MRV90+YipQfCPgWwXHzzkTkVvOV6C+6ZJYllm
 rKV54rBSB/xymp9tYQASVk0LANULuYbgHoyTqtxGPdOBbUM3MTMRaw4SNmYYKhnUUGUq
 iL2w==
X-Gm-Message-State: AOAM533WRZeogzO2bRm1+7cDZop2oPMOuJ5uxWkj0K1b3ADoMpxx5B3Q
 EGBFIUWFy5TipmVJIggpajpmpyQToQZXTQ==
X-Google-Smtp-Source: ABdhPJzjO+Iy7Dzo+tURRCmwALJfN5UkXpRRJ8rrOKGEIelhJIVwbyLSA31pIfVCFbQb/MIWWFEwkA==
X-Received: by 2002:a17:902:a504:b029:da:fbca:d49 with SMTP id
 s4-20020a170902a504b02900dafbca0d49mr13102536plq.72.1611775762415; 
 Wed, 27 Jan 2021 11:29:22 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 30sm3188932pgl.77.2021.01.27.11.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 11:29:21 -0800 (PST)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Zorro Lang <zlang@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
Date: Wed, 27 Jan 2021 12:29:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/27/21 9:38 AM, Christophe Leroy wrote:
> 
> 
> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
>> The fail source line is:
>>
>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
>>        return SIGSEGV;
>>
>> The is_user() is based on user_mod(regs) only. This's not suit for
>> io_uring, where the helper thread can assume the user app identity
>> and could perform this fault just fine. So turn to use mm to decide
>> if this is valid or not.
> 
> I don't understand why testing is_user would be an issue. KUAP purpose
> it to block any unallowed access from kernel to user memory
> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
> that is what is_user provides.
> 
> If the kernel access is legitimate, kernel should have opened
> userspace access then you shouldn't get this "Bug: Read fault blocked
> by KUAP!".
> 
> As far as I understand, the fault occurs in
> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
> fault_in_pages_readable() uses __get_user() so it is a legitimate
> access and you really should get a KUAP fault.
> 
> So the problem is somewhere else, I think you proposed patch just
> hides the problem, it doesn't fix it.

If we do kthread_use_mm(), can we agree that the user access is valid?
We should be able to copy to/from user space, and including faults, if
that's been done and the new mm assigned. Because it really should be.
If SMAP was a problem on x86, we would have seen it long ago.

I'm assuming this may be breakage related to the recent uaccess changes
related to set_fs and friends? Or maybe recent changes on the powerpc
side?

Zorro, did 5.10 work?

-- 
Jens Axboe

