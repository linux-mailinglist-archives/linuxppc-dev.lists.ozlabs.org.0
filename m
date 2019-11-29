Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFE710D8CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 18:18:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ph6h65MszDr8s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 04:18:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.b="ubBm2VrL"; 
 dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ph4b33CtzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 04:16:30 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id b1so14619249pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 09:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cJUqaft98JUbJoAJGvOcDoZ/xfTmcquNmc0PZ2Qp0uM=;
 b=ubBm2VrLVzUJImie+uq75o/+w+tTc6Z0mrIfJ5WIoRKYN4Pp8UgmXdvLJ0PB+K9IhA
 6HUT780D+oJvXsK4Es3SKuPMCTJ+bOPIxsCqanMKRKhEOgvyTWRTLsgZMTGntNWluwM/
 sQSlPJU7T/UAGC+4gs3t94QQhF6xK6ewMvgJnrFdie8m4ZnRAOC1hjxofhhLNmOj72zP
 ALJLfymTQTKWVuPeIwpJbgFpdCt4C/X+ouBZ2Rdk8NY0VGFuC1qCPqZxFYjFmkVOPkmY
 FhKWyM2KHapwRofvaaFr5pXTPrXWBqblmVbYiI+wa7LRqdAoktrqqnTdSiXEi5NtbYIW
 p77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cJUqaft98JUbJoAJGvOcDoZ/xfTmcquNmc0PZ2Qp0uM=;
 b=PKoDtqCMnxIKMSer+1xDGG0211p/qyh67YCoG49VVYwhab/xA9WTkczTkBRkPs+cJ3
 FmkpjWcCa6Kp12RosJZjWCXZ3yqSE5Zz/JPvlP/tO1eKQrWGCeU9gsNPf1XG+VbRr2b2
 dvqWtPdAh9Duy9DJ/roEAsn8EZ4WIEYi8iRwoeKFy/jG6vB0kX+D19MXYhtKn+W+JI/N
 iY6FGB5xZcBuGg7WgZJafJUDgog9OHtQ59e2y8SGPA/Q3L/TOixc26C9vDcIYoRvfCgB
 5nQlthaXDOjwtIEfvnghlJr31X8T3hZ5eagBVFj+5RjR7lyzps4KnD+BYCdZJwHvm6Qq
 ztxw==
X-Gm-Message-State: APjAAAUjYCe+f5wgS2AfV6Sfob1xG5the0tRvc1qh62rNSncuCTNh4Mj
 FGf1OtMtxTcndBjtdBUWlXehQw==
X-Google-Smtp-Source: APXvYqyuqCP95Pu9EWWsAQwExBzqJ/fW152qbXSCL38YrvQ4EciwmTcFOdOzX21DBAqwizS113OH6Q==
X-Received: by 2002:a63:5104:: with SMTP id f4mr17722304pgb.192.1575047787014; 
 Fri, 29 Nov 2019 09:16:27 -0800 (PST)
Received: from ?IPv6:2605:e000:100e:8c61:c457:26a3:bdc5:9aed?
 ([2605:e000:100e:8c61:c457:26a3:bdc5:9aed])
 by smtp.gmail.com with ESMTPSA id s2sm26042860pfb.109.2019.11.29.09.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 09:16:20 -0800 (PST)
Subject: Re: Build failure on latest powerpc/merge (311ae9e159d8 io_uring: fix
 dead-hung for non-iter fixed rw)
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Pavel Begunkov <asml.silence@gmail.com>
References: <71cf82d5-5986-43b7-cf1c-acba429a89d6@c-s.fr>
 <3a95d445-1f5c-7750-f0de-ddc427800b3b@kernel.dk>
 <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <5389b43a-259d-997c-41e6-5e84a91b012a@kernel.dk>
Date: Fri, 29 Nov 2019 09:16:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4ef71e74-848f-59d4-6b0b-d3a3c52095a0@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/29/19 8:14 AM, Christophe Leroy wrote:
> 
> 
> Le 29/11/2019 à 17:04, Jens Axboe a écrit :
>> On 11/29/19 6:53 AM, Christophe Leroy wrote:
>>>      CC      fs/io_uring.o
>>> fs/io_uring.c: In function ‘loop_rw_iter’:
>>> fs/io_uring.c:1628:21: error: implicit declaration of function ‘kmap’
>>> [-Werror=implicit-function-declaration]
>>>        iovec.iov_base = kmap(iter->bvec->bv_page)
>>>                         ^
>>> fs/io_uring.c:1628:19: warning: assignment makes pointer from integer
>>> without a cast [-Wint-conversion]
>>>        iovec.iov_base = kmap(iter->bvec->bv_page)
>>>                       ^
>>> fs/io_uring.c:1643:4: error: implicit declaration of function ‘kunmap’
>>> [-Werror=implicit-function-declaration]
>>>        kunmap(iter->bvec->bv_page);
>>>        ^
>>>
>>>
>>> Reverting commit 311ae9e159d8 ("io_uring: fix dead-hung for non-iter
>>> fixed rw") clears the failure.
>>>
>>> Most likely an #include is missing.
>>
>> Huh weird how the build bots didn't catch that. Does the below work?
> 
> Yes it works, thanks.

Thanks for reporting and testing, I've queued it up with your reported
and tested-by.

-- 
Jens Axboe

