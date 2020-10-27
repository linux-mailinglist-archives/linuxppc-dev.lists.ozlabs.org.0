Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF4729A1FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 02:01:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKtgq4pmfzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 12:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=DV6OWsJ8; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKsWX50GMzDqBS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Oct 2020 11:09:11 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id j18so7147300pfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Oct 2020 17:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LsJlRjdqhDVAHhw47g/atIos95r5K18qubNura+3fzc=;
 b=DV6OWsJ8YTis4RWe74HnMoSPHx2wnbbnih3F0P+HiF57IXnyKrAIcBplDa0TuQW0fe
 aii8O67y5CuNtSNcN0q+CPIFocqT+ma+us4RoqX4TC6tMgaGBGUnwVHQJ/N6qPZoUIZl
 N8PZQaTFtDJvhHp2KmiMn99XHribiQTVBqggOOByg6ZsC+AIdPeSZ7IIhzJWtbXj8peQ
 vUIkbSwJfbOC01KBcysHUuhejsj0lkLWHowENLgMtxCKJmsxzr5jKuNTtJsywdn514eT
 kI7wIhvyoH92wMz2QHWzCBEBrmMggfxor976qEm1YW1xHPKbqwPNkX7lWR3OAQC8rWrk
 OKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LsJlRjdqhDVAHhw47g/atIos95r5K18qubNura+3fzc=;
 b=lTx+BqH1ZCfKRsyMVxEjXoJRW7t0e8L8flkgxat028RwKd5hszIX2ktJT6qz5CtLct
 fYwVnEsMjMCYzSY4+PHWYA/I9IoRpyuK/neM+h6pn9NiJAOlhZlZJrTqAIQIV/TDo+wX
 YOLbHS/ll3ry4wWThHIQotvV8fqFLfIPju56/QYaLvv1NAAbwga3Zilcf0ifNIKhCrTs
 BXpQ7MSqkCFVL26J+z31D1N7XKb3fb3hWeF/4zQ7QDnRsXz+D0QMe7MDn8Hrjaf1+HHd
 FGryX7pYW31U7+GaAl6K53N6FGWQ5hIiKqwQtfnA7sp01s886As7w/mu8YF1lXcM5/fS
 +Wnw==
X-Gm-Message-State: AOAM533wo8zwlQ4/ZpjhI9lmGfR1G/A19uFKC+VztfP2fucd+DGDFY5e
 Ncw+3TwOKUUZPuPh9l5k1/7Pmg==
X-Google-Smtp-Source: ABdhPJzyk1CokDb3PmPO6AYN5WbyxmkTO2goVocCEnl70vwlgJZot7evNIwwh9o3S+Q92QVwXSE2HA==
X-Received: by 2002:a65:5c02:: with SMTP id u2mr18125891pgr.173.1603757348944; 
 Mon, 26 Oct 2020 17:09:08 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id e16sm13676837pfh.45.2020.10.26.17.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 17:09:08 -0700 (PDT)
Subject: Re: [REGRESSION] mm: process_vm_readv testcase no longer works after
 compat_prcoess_vm_readv removed
To: Al Viro <viro@zeniv.linux.org.uk>
References: <CAP045Aqrsb=CXHDHx4nS-pgg+MUDj14r-kN8_Jcbn-NAUziVag@mail.gmail.com>
 <70d5569e-4ad6-988a-e047-5d12d298684c@kernel.dk>
 <20201027000521.GD3576660@ZenIV.linux.org.uk>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0127a542-3f93-7bd0-e00d-4a0e49846c8f@kernel.dk>
Date: Mon, 26 Oct 2020 18:09:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027000521.GD3576660@ZenIV.linux.org.uk>
Content-Type: text/plain; charset=utf-8
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-security-module@vger.kernel.org,
 Robert O'Callahan <robert@ocallahan.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Kyle Huey <me@kylehuey.com>,
 "open list:FILESYSTEMS \(VFS and infrastructure\)"
 <linux-fsdevel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/26/20 6:05 PM, Al Viro wrote:
> On Mon, Oct 26, 2020 at 05:56:11PM -0600, Jens Axboe wrote:
>> On 10/26/20 4:55 PM, Kyle Huey wrote:
>>> A test program from the rr[0] test suite, vm_readv_writev[1], no
>>> longer works on 5.10-rc1 when compiled as a 32 bit binary and executed
>>> on a 64 bit kernel. The first process_vm_readv call (on line 35) now
>>> fails with EFAULT. I have bisected this to
>>> c3973b401ef2b0b8005f8074a10e96e3ea093823.
>>>
>>> It should be fairly straightforward to extract the test case from our
>>> repository into a standalone program.
>>
>> Can you check with this applied?
>>
>> diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
>> index fd12da80b6f2..05676722d9cd 100644
>> --- a/mm/process_vm_access.c
>> +++ b/mm/process_vm_access.c
>> @@ -273,7 +273,8 @@ static ssize_t process_vm_rw(pid_t pid,
>>  		return rc;
>>  	if (!iov_iter_count(&iter))
>>  		goto free_iov_l;
>> -	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r, false);
>> +	iov_r = iovec_from_user(rvec, riovcnt, UIO_FASTIOV, iovstack_r,
>> +				in_compat_syscall());
> 
> _ouch_
> 
> There's a bug, all right, but I'm not sure that this is all there is
> to it. For now it's probably the right fix, but...  Consider the fun
> trying to use that from 32bit process to access the memory of 64bit
> one.  IOW, we might want to add an explicit flag for "force 64bit
> addresses/sizes in rvec".

Ouch yes good point, nice catch.

-- 
Jens Axboe

