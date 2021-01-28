Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F61630774D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 14:42:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRM8r4kHYzDqCw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 00:42:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=VtHVRhR6; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VtHVRhR6; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRM1C4yg3zDrBG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 00:35:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611840930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+S5tIxljldP+/PAOYaGQBhTwb+w9cPFnDr+HZf8Iz5U=;
 b=VtHVRhR6o1BPbqdK9UL22Z9DcilVwfcFfcy9ZlqdBXzNHMDwrqRgGBotAJQrQ2IhHNqIij
 3PpV9ZedVYgCpbHx9Jy7liMOc/Y+shySBMn7NgxvEmk/JJQADK9GBPz8mFGufKWcRi3eyi
 aJvgBmXCaFOzscdY16sYopR4ns+YbLg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611840930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+S5tIxljldP+/PAOYaGQBhTwb+w9cPFnDr+HZf8Iz5U=;
 b=VtHVRhR6o1BPbqdK9UL22Z9DcilVwfcFfcy9ZlqdBXzNHMDwrqRgGBotAJQrQ2IhHNqIij
 3PpV9ZedVYgCpbHx9Jy7liMOc/Y+shySBMn7NgxvEmk/JJQADK9GBPz8mFGufKWcRi3eyi
 aJvgBmXCaFOzscdY16sYopR4ns+YbLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-yT31034pOSWoPT2JJPir8w-1; Thu, 28 Jan 2021 08:35:28 -0500
X-MC-Unique: yT31034pOSWoPT2JJPir8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 134538030A8;
 Thu, 28 Jan 2021 13:35:27 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 949EE5D9EF;
 Thu, 28 Jan 2021 13:35:25 +0000 (UTC)
Date: Thu, 28 Jan 2021 21:52:21 +0800
From: Zorro Lang <zlang@redhat.com>
To: Jens Axboe <axboe@kernel.dk>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
Message-ID: <20210128135220.GQ14354@localhost.localdomain>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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

On Wed, Jan 27, 2021 at 08:06:37PM -0700, Jens Axboe wrote:
> On 1/27/21 8:13 PM, Zorro Lang wrote:
> > On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
> >> Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
> >>> On 1/27/21 9:38 AM, Christophe Leroy wrote:
> >>>>
> >>>>
> >>>> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
> >>>>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
> >>>>> The fail source line is:
> >>>>>
> >>>>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
> >>>>>        return SIGSEGV;
> >>>>>
> >>>>> The is_user() is based on user_mod(regs) only. This's not suit for
> >>>>> io_uring, where the helper thread can assume the user app identity
> >>>>> and could perform this fault just fine. So turn to use mm to decide
> >>>>> if this is valid or not.
> >>>>
> >>>> I don't understand why testing is_user would be an issue. KUAP purpose
> >>>> it to block any unallowed access from kernel to user memory
> >>>> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
> >>>> that is what is_user provides.
> >>>>
> >>>> If the kernel access is legitimate, kernel should have opened
> >>>> userspace access then you shouldn't get this "Bug: Read fault blocked
> >>>> by KUAP!".
> >>>>
> >>>> As far as I understand, the fault occurs in
> >>>> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
> >>>> fault_in_pages_readable() uses __get_user() so it is a legitimate
> >>>> access and you really should get a KUAP fault.
> >>>>
> >>>> So the problem is somewhere else, I think you proposed patch just
> >>>> hides the problem, it doesn't fix it.
> >>>
> >>> If we do kthread_use_mm(), can we agree that the user access is valid?
> >>
> >> Yeah the io uring code is fine, provided it uses the uaccess primitives 
> >> like any other kernel code. It's looking more like a an arch/powerpc bug.
> >>
> >>> We should be able to copy to/from user space, and including faults, if
> >>> that's been done and the new mm assigned. Because it really should be.
> >>> If SMAP was a problem on x86, we would have seen it long ago.
> >>>
> >>> I'm assuming this may be breakage related to the recent uaccess changes
> >>> related to set_fs and friends? Or maybe recent changes on the powerpc
> >>> side?
> >>>
> >>> Zorro, did 5.10 work?
> >>
> >> Would be interesting to know.
> > 
> > Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
> > commit(be the HEAD) in 5.10 phase?
> 
> I forget which versions had what series of this, but 5.10 final - and if
> that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
> 5.10 definitely has them.

I justed built linux v5.10 with same .config file, and gave it same test.
v5.10 (HEAD=2c85ebc57b Linux 5.10) can't reproduce this bug:

# ./check generic/013 generic/051
FSTYP         -- xfs (non-debug)
PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxxx 5.10.0 #3 SMP Thu Jan 28 04:12:14 EST 2021
MKFS_OPTIONS  -- -f -m crc=1,finobt=1,reflink=1,rmapbt=1,bigtime=1,inobtcount=1 /dev/sda3
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch

generic/013 138s ...  77s
generic/051 103s ...  143s
Ran: generic/013 generic/051
Passed all 2 tests

> 
> -- 
> Jens Axboe
> 

