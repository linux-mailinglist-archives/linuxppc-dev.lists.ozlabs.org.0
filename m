Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA380297024
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 15:16:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHl9J3m9SzDqBK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 00:16:04 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=JB4V0Zu2; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=JB4V0Zu2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHl274VkSzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 00:09:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603458588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72dx+pFNkJMyRa7xo3pnb+kKjqXwelAsFAb2NVCNc3A=;
 b=JB4V0Zu2qmEYQ0DNeO5ABOi+jhYvDYq7YBLnmOtxwThxyadBiUGx8EES/MIvVt9vgFH6D4
 VxsqJ+u6hYbW64JEZUrcYVv+uYA6NXUWUR15cF7WZbkBYd2UmsQAu549girJ5ZdC9hkdIH
 On93bLnouhBBJFKvQMT2mNsTkcntwGg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603458588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=72dx+pFNkJMyRa7xo3pnb+kKjqXwelAsFAb2NVCNc3A=;
 b=JB4V0Zu2qmEYQ0DNeO5ABOi+jhYvDYq7YBLnmOtxwThxyadBiUGx8EES/MIvVt9vgFH6D4
 VxsqJ+u6hYbW64JEZUrcYVv+uYA6NXUWUR15cF7WZbkBYd2UmsQAu549girJ5ZdC9hkdIH
 On93bLnouhBBJFKvQMT2mNsTkcntwGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-Oel3L5QjO_O0-RxNigaJug-1; Fri, 23 Oct 2020 09:09:43 -0400
X-MC-Unique: Oel3L5QjO_O0-RxNigaJug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20A3B1882FA0;
 Fri, 23 Oct 2020 13:09:37 +0000 (UTC)
Received: from [10.36.114.18] (ovpn-114-18.ams2.redhat.com [10.36.114.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AF0A55762;
 Fri, 23 Oct 2020 13:09:31 +0000 (UTC)
Subject: Re: Buggy commit tracked to: "Re: [PATCH 2/9] iov_iter: move
 rw_copy_check_uvector() into lib/iov_iter.c"
To: David Laight <David.Laight@ACULAB.COM>,
 'Greg KH' <gregkh@linuxfoundation.org>
References: <df2e0758-b8ed-5aec-6adc-a18f499c0179@redhat.com>
 <20201022090155.GA1483166@kroah.com>
 <e04d0c5d-e834-a15b-7844-44dcc82785cc@redhat.com>
 <a1533569-948a-1d5b-e231-5531aa988047@redhat.com>
 <bc0a091865f34700b9df332c6e9dcdfd@AcuMS.aculab.com>
 <5fd6003b-55a6-2c3c-9a28-8fd3a575ca78@redhat.com>
 <20201022104805.GA1503673@kroah.com> <20201022121849.GA1664412@kroah.com>
 <98d9df88-b7ef-fdfb-7d90-2fa7a9d7bab5@redhat.com>
 <20201022125759.GA1685526@kroah.com> <20201022135036.GA1787470@kroah.com>
 <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <935f7168-c2f5-dd14-7124-412b284693a2@redhat.com>
Date: Fri, 23 Oct 2020 15:09:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <134f162d711d466ebbd88906fae35b33@AcuMS.aculab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 Al Viro <viro@zeniv.linux.org.uk>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.10.20 14:46, David Laight wrote:
> From: Greg KH <gregkh@linuxfoundation.org>
>> Sent: 22 October 2020 14:51
> 
> I've rammed the code into godbolt.
> 
> https://godbolt.org/z/9v5PPW
> 
> Definitely a clang bug.
> 
> Search for [wx]24 in the clang output.
> nr_segs comes in as w2 and the initial bound checks are done on w2.
> w24 is loaded from w2 - I don't believe this changes the high bits.
> There are no references to w24, just x24.
> So the kmalloc_array() is passed 'huge' and will fail.
> The iov_iter_init also gets the 64bit value.
> 
> Note that the gcc code has a sign-extend copy of w2.

Do we have a result from using "unsigned long" in the base function and
explicitly masking of the high bits? That should definitely work.

Now, I am not a compiler expert, but as I already cited, at least on
x86-64 clang expects that the high bits were cleared by the caller - in
contrast to gcc. I suspect it's the same on arm64, but again, I am no
compiler expert.

If what I said and cites for x86-64 is correct, if the function expects
an "unsigned int", it will happily use 64bit operations without further
checks where valid when assuming high bits are zero. That's why even
converting everything to "unsigned int" as proposed by me won't work on
clang - it assumes high bits are zero (as indicated by Nick).

As I am neither a compiler experts (did I mention that already? ;) ) nor
an arm64 experts, I can't tell if this is a compiler BUG or not.

Main issue seems to be garbage in high bits as originally suggested by me.

-- 
Thanks,

David / dhildenb

