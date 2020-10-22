Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E0295AEB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 10:51:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH1Kv5wLLzDqkR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 19:50:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PfC2Z3yp; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PfC2Z3yp; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH1Hx6RHvzDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 19:49:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603356554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yeg0jT4D/9DqFY66G18hrg55FSffylHedhDgi/OUthM=;
 b=PfC2Z3ypcykyMI3iPtuTFV8vq7xzClzqe75SMCmVR1KbxE2lplC9MHhub/NQ75xwy6l7sF
 Unt862D/MJnKs6HFcjvE6IH2aB8goaKkjs6yvvrCQmljI+pMWLJRVev51TvUEYKGJjk4yV
 BwAaq8W1aGbdE3n1onFMuiWm/FWEF3A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603356554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yeg0jT4D/9DqFY66G18hrg55FSffylHedhDgi/OUthM=;
 b=PfC2Z3ypcykyMI3iPtuTFV8vq7xzClzqe75SMCmVR1KbxE2lplC9MHhub/NQ75xwy6l7sF
 Unt862D/MJnKs6HFcjvE6IH2aB8goaKkjs6yvvrCQmljI+pMWLJRVev51TvUEYKGJjk4yV
 BwAaq8W1aGbdE3n1onFMuiWm/FWEF3A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-xBNzqHeqP4aipoD_ML6qQQ-1; Thu, 22 Oct 2020 04:49:09 -0400
X-MC-Unique: xBNzqHeqP4aipoD_ML6qQQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9A141018F80;
 Thu, 22 Oct 2020 08:49:05 +0000 (UTC)
Received: from [10.36.113.152] (ovpn-113-152.ams2.redhat.com [10.36.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8980C60C04;
 Thu, 22 Oct 2020 08:49:00 +0000 (UTC)
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: David Laight <David.Laight@ACULAB.COM>,
 Greg KH <gregkh@linuxfoundation.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20200925045146.1283714-1-hch@lst.de>
 <20200925045146.1283714-3-hch@lst.de> <20201021161301.GA1196312@kroah.com>
 <20201021233914.GR3576660@ZenIV.linux.org.uk>
 <20201022082654.GA1477657@kroah.com>
 <80a2e5fa-718a-8433-1ab0-dd5b3e3b5416@redhat.com>
 <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
Date: Thu, 22 Oct 2020 10:48:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <5d2ecb24db1e415b8ff88261435386ec@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: "linux-aio@kvack.org" <linux-aio@kvack.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22.10.20 10:40, David Laight wrote:
> From: David Hildenbrand
>> Sent: 22 October 2020 09:35
>>
>> On 22.10.20 10:26, Greg KH wrote:
>>> On Thu, Oct 22, 2020 at 12:39:14AM +0100, Al Viro wrote:
>>>> On Wed, Oct 21, 2020 at 06:13:01PM +0200, Greg KH wrote:
>>>>> On Fri, Sep 25, 2020 at 06:51:39AM +0200, Christoph Hellwig wrote:
>>>>>> From: David Laight <David.Laight@ACULAB.COM>
>>>>>>
>>>>>> This lets the compiler inline it into import_iovec() generating
>>>>>> much better code.
>>>>>>
>>>>>> Signed-off-by: David Laight <david.laight@aculab.com>
>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>>> ---
>>>>>>  fs/read_write.c | 179 ------------------------------------------------
>>>>>>  lib/iov_iter.c  | 176 +++++++++++++++++++++++++++++++++++++++++++++++
>>>>>>  2 files changed, 176 insertions(+), 179 deletions(-)
>>>>>
>>>>> Strangely, this commit causes a regression in Linus's tree right now.
>>>>>
>>>>> I can't really figure out what the regression is, only that this commit
>>>>> triggers a "large Android system binary" from working properly.  There's
>>>>> no kernel log messages anywhere, and I don't have any way to strace the
>>>>> thing in the testing framework, so any hints that people can provide
>>>>> would be most appreciated.
>>>>
>>>> It's a pure move - modulo changed line breaks in the argument lists
>>>> the functions involved are identical before and after that (just checked
>>>> that directly, by checking out the trees before and after, extracting two
>>>> functions in question from fs/read_write.c and lib/iov_iter.c (before and
>>>> after, resp.) and checking the diff between those.
>>>>
>>>> How certain is your bisection?
>>>
>>> The bisection is very reproducable.
>>>
>>> But, this looks now to be a compiler bug.  I'm using the latest version
>>> of clang and if I put "noinline" at the front of the function,
>>> everything works.
>>
>> Well, the compiler can do more invasive optimizations when inlining. If
>> you have buggy code that relies on some unspecified behavior, inlining
>> can change the behavior ... but going over that code, there isn't too
>> much action going on. At least nothing screamed at me.
> 
> Apart from all the optimisations that get rid off the 'pass be reference'
> parameters and strange conditional tests.
> Plenty of scope for the compiler getting it wrong.
> But nothing even vaguely illegal.

Not the first time that people blame the compiler to then figure out
that something else is wrong ... but maybe this time is different :)

-- 
Thanks,

David / dhildenb

