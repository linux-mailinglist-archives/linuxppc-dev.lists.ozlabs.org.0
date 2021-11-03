Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE81443B09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 02:28:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkTgh27cpz2yPY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 12:28:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20210112.gappssmtp.com header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=fY4Xy+5H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20210112.gappssmtp.com
 header.i=@kernel-dk.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=fY4Xy+5H; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HkTg11l7Hz2xBP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Nov 2021 12:28:10 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id s14so937062ilv.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Nov 2021 18:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6py8bgQ0B5/+fIXWiAKE7dARK0paBlJ7XzGDJcrhlUo=;
 b=fY4Xy+5HpEK8ZhIkUmNH1j3a9zqOyiBHtuJicBDonOsEEWvYTzx9H5pDPgOWuIZFPR
 gqYcIlgwXR27OtzPc+K6hZMh8BxvcAmq2TC9oMlEXlzeFnfuyroynIjynj844KdajEzr
 aj7umF/qQgApkedlFSqpjrB8YtmYWXJMn0TZryPNtobrhoKLPZbstgJWO/WT2obWdP6+
 xGeASjXcTPUIMfM3qftKOY5NgzVzS+2dMQtAEEOYwog/HU4iF84L6ggDijD7fR4gCH/N
 wLbIvSaoVm7hDUYbkSJMPmopfK02pXiCoJliqU6efpVekD43pTkO9y07oo7CZxfykj3n
 RqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6py8bgQ0B5/+fIXWiAKE7dARK0paBlJ7XzGDJcrhlUo=;
 b=KELoKRW248rYK2gU3XQRcmw599ckTKvoM0jnAZBt6w2LtC1/FUFlL05zouG2z8qtKZ
 wJeKwaZo1GVTDhEcG3HBO3KXHDBriobLsM0b83b/t0Oov9zAP/c1j4fcSTA54mlUHGpq
 df6J5Z8hTFV14Y1sMVYf0viNu1XXsMb/QZhH6dtjGpddIf1B18D4Ja/CB5b/NfbKfKEv
 gdNP1FL5+jX0pXzWtdJF55rJrR8zvA8Qv2odeS1B6cNjvkt7VESAO8wuZMCCmAV28w+8
 kldxeDoR+n0J4+RtMJwqWBzxE+2wKZssWTFkwa2yUbxtEOz8hQJXnzcSjD9MCXaVMC9l
 jcXw==
X-Gm-Message-State: AOAM533CNSEjiYM1cjlq8zWSwkP0lp6prZJ/6jPAGoEisrrT1fKSZFAO
 l4FnVgRUP+TGn5t2waBb2VS1qg==
X-Google-Smtp-Source: ABdhPJwO1JGTdFIdOfS6rJRB6NOgCNJYxGHsGlwnV1pIOoBRAmgNDLSmAlVORwzRNUcJ3aKtd2J9Zw==
X-Received: by 2002:a05:6e02:190b:: with SMTP id
 w11mr2361219ilu.211.1635902887266; 
 Tue, 02 Nov 2021 18:28:07 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id k11sm446896ilv.66.2021.11.02.18.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 18:28:06 -0700 (PDT)
Subject: Re: [PATCH 06/13] nvdimm/blk: avoid calling del_gendisk() on early
 failures
To: Dan Williams <dan.j.williams@intel.com>,
 Luis Chamberlain <mcgrof@kernel.org>
References: <20211015235219.2191207-1-mcgrof@kernel.org>
 <20211015235219.2191207-7-mcgrof@kernel.org>
 <CAPcyv4j+xLT=5RUodHWgnPjNq6t5OcmX1oM2zK2ML0U+OS_16Q@mail.gmail.com>
 <YYHTejXKvsGoDlOa@bombadil.infradead.org>
 <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <51f86768-04ca-bc7d-c17c-3d0357d84271@kernel.dk>
Date: Tue, 2 Nov 2021 19:28:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4h1dqBm71OQ_A5Qv4agT3PhV7uoojmSB1pEpS-CXaWb5w@mail.gmail.com>
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
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, vigneshr@ti.com,
 linux-nvme@lists.infradead.org, Paul Mackerras <paulus@samba.org>,
 miquel.raynal@bootlin.com, "Weiny, Ira" <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>, Dave Jiang <dave.jiang@intel.com>,
 Sagi Grimberg <sagi@grimberg.me>, Minchan Kim <minchan@kernel.org>,
 Vishal L Verma <vishal.l.verma@intel.com>, Nitin Gupta <ngupta@vflare.org>,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Geoff Levand <geoff@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jim Paris <jim@jtan.com>, senozhatsky@chromium.org,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/2/21 6:49 PM, Dan Williams wrote:
> On Tue, Nov 2, 2021 at 5:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>>
>> On Fri, Oct 15, 2021 at 05:13:48PM -0700, Dan Williams wrote:
>>> On Fri, Oct 15, 2021 at 4:53 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
>>>>
>>>> If nd_integrity_init() fails we'd get del_gendisk() called,
>>>> but that's not correct as we should only call that if we're
>>>> done with device_add_disk(). Fix this by providing unwinding
>>>> prior to the devm call being registered and moving the devm
>>>> registration to the very end.
>>>>
>>>> This should fix calling del_gendisk() if nd_integrity_init()
>>>> fails. I only spotted this issue through code inspection. It
>>>> does not fix any real world bug.
>>>>
>>>
>>> Just fyi, I'm preparing patches to delete this driver completely as it
>>> is unused by any shipping platform. I hope to get that removal into
>>> v5.16.
>>
>> Curious if are you going to nuking it on v5.16? Otherwise it would stand
>> in the way of the last few patches to add __must_check for the final
>> add_disk() error handling changes.
> 
> True, I don't think I can get it nuked in time, so you can add my
> Reviewed-by for this one.

Luis, I lost track of the nv* patches from this discussion. If you want
them in 5.16 and they are reviewed, please do resend and I'll pick them
up for the middle-of-merge-window push.

-- 
Jens Axboe

