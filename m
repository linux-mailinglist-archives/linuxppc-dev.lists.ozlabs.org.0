Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF30F30786C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 15:45:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRNYc4HPbzDr1b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 01:45:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vDr7vr6O; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRNVm6ZtdzDqRw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 01:42:54 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id m6so4123299pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5a4uTyJR6tH/MisvtHoe49j7dovtao7TKoFUu5ETskg=;
 b=vDr7vr6O3ZNzK48d09VehcJgMFut3I9ybEmQoYIbp2bGd+G5g4Md5q1wq+bXG/PTT9
 51WYBdLOVh8tk2nTibX0v0VVBjzDO321V5dGb+ceOrlMQ0IUJVc14N3Q2/+i+5Mj8MXh
 N6zPQOepuCHai/z2JenoJMKeqobcI+pw7jlSJPCCuxmst3eDI+EV9T6ETrT6JQhhNaQ5
 +Q9oD9w6Rra+5+fc9B5i9X5IJRF62pyvshbVDseS0en20DJzAgSz6Jv/6ywikprdDbFh
 wy8Ekp+SSNQaXyy3Hq7CystoQDGnV/ivSxWNIBa6tEkolKTtrIJpCHlkmhNB++Phj+S1
 QxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5a4uTyJR6tH/MisvtHoe49j7dovtao7TKoFUu5ETskg=;
 b=UeT0aBT45j70jry3d+xOOV8lJH3+f+osEOyElgpspbuCXQC7zVYyUvrMTsKxT5Vptg
 ZTVRjTeu3bDLPqPVdJAmQcy378Q5EmE8lOji9SIk6CFGH4lamig696hF9hzi2bWvkxFP
 D0iHKAZp+vy3W7+gOWTka6LUay9/LT+bJ/SGvI0rY11+sJR20mCaxNF4k1iULlUVA4Tf
 n0f/dLgegzou9lMs28Ci5C93xuVO5ZCFb6usjAVKn8qUeA2q9+BHq3ydGlOLUfP+H6FM
 scqgfSnhHCh0h/nn8afN//nw/e6445eusPfaG1ybq1eUCjBXKSxVzgy+QlAb9MwpI7OW
 AnVQ==
X-Gm-Message-State: AOAM531wJc0flgl8glHephPNS/HUTjU1aycqcN323k76a2oAxKKYdwEf
 TD9oBCdpwPhaMPQKPiS6KoqrBsp0AuXXSQ==
X-Google-Smtp-Source: ABdhPJwhICEooDTZXvDlVCczV8sS2HveKnccXE6P4VEprOAxkphuk+NWsZXEgzff/fzTzW26Uih4fA==
X-Received: by 2002:a63:7b03:: with SMTP id w3mr5287968pgc.16.1611844970824;
 Thu, 28 Jan 2021 06:42:50 -0800 (PST)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 k31sm6390379pgi.5.2021.01.28.06.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:42:50 -0800 (PST)
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Zorro Lang <zlang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
Date: Thu, 28 Jan 2021 07:42:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210128135220.GQ14354@localhost.localdomain>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/28/21 6:52 AM, Zorro Lang wrote:
> On Wed, Jan 27, 2021 at 08:06:37PM -0700, Jens Axboe wrote:
>> On 1/27/21 8:13 PM, Zorro Lang wrote:
>>> On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
>>>> Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
>>>>> On 1/27/21 9:38 AM, Christophe Leroy wrote:
>>>>>>
>>>>>>
>>>>>> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
>>>>>>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
>>>>>>> The fail source line is:
>>>>>>>
>>>>>>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
>>>>>>>        return SIGSEGV;
>>>>>>>
>>>>>>> The is_user() is based on user_mod(regs) only. This's not suit for
>>>>>>> io_uring, where the helper thread can assume the user app identity
>>>>>>> and could perform this fault just fine. So turn to use mm to decide
>>>>>>> if this is valid or not.
>>>>>>
>>>>>> I don't understand why testing is_user would be an issue. KUAP purpose
>>>>>> it to block any unallowed access from kernel to user memory
>>>>>> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
>>>>>> that is what is_user provides.
>>>>>>
>>>>>> If the kernel access is legitimate, kernel should have opened
>>>>>> userspace access then you shouldn't get this "Bug: Read fault blocked
>>>>>> by KUAP!".
>>>>>>
>>>>>> As far as I understand, the fault occurs in
>>>>>> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
>>>>>> fault_in_pages_readable() uses __get_user() so it is a legitimate
>>>>>> access and you really should get a KUAP fault.
>>>>>>
>>>>>> So the problem is somewhere else, I think you proposed patch just
>>>>>> hides the problem, it doesn't fix it.
>>>>>
>>>>> If we do kthread_use_mm(), can we agree that the user access is valid?
>>>>
>>>> Yeah the io uring code is fine, provided it uses the uaccess primitives 
>>>> like any other kernel code. It's looking more like a an arch/powerpc bug.
>>>>
>>>>> We should be able to copy to/from user space, and including faults, if
>>>>> that's been done and the new mm assigned. Because it really should be.
>>>>> If SMAP was a problem on x86, we would have seen it long ago.
>>>>>
>>>>> I'm assuming this may be breakage related to the recent uaccess changes
>>>>> related to set_fs and friends? Or maybe recent changes on the powerpc
>>>>> side?
>>>>>
>>>>> Zorro, did 5.10 work?
>>>>
>>>> Would be interesting to know.
>>>
>>> Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
>>> commit(be the HEAD) in 5.10 phase?
>>
>> I forget which versions had what series of this, but 5.10 final - and if
>> that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
>> 5.10 definitely has them.
> 
> I justed built linux v5.10 with same .config file, and gave it same test.
> v5.10 (HEAD=2c85ebc57b Linux 5.10) can't reproduce this bug:
> 
> # ./check generic/013 generic/051
> FSTYP         -- xfs (non-debug)
> PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxxx 5.10.0 #3 SMP Thu Jan 28 04:12:14 EST 2021
> MKFS_OPTIONS  -- -f -m crc=1,finobt=1,reflink=1,rmapbt=1,bigtime=1,inobtcount=1 /dev/sda3
> MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch
> 
> generic/013 138s ...  77s
> generic/051 103s ...  143s
> Ran: generic/013 generic/051
> Passed all 2 tests

Thanks for testing that, so I think it's safe to conclude that there's a
regression in powerpc fault handling for kthreads that use
kthread_use_mm in this release. A bisect would definitely find it, but
might be pointless if Christophe or Nick already have an idea of what it
is.

-- 
Jens Axboe

