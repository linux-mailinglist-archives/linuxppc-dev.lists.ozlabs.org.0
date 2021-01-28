Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 136333078FD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 16:05:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRP0b09VDzDrfX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 02:05:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=B7s+V/O3; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=C2R+z4FC; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRNyZ58m1zDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 02:03:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611846209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3pa4+mcoZX/af+cmbkGDsHxVv4Uv3BVku5OjqWO8aM=;
 b=B7s+V/O3Ts8r7si7lYvoF8CLJDyjZdVrFoaaQeJe47SrMacyGtrudqe1BB6Tqfa40xNPpv
 RT+EodWPIJ4qqhUK8iDMVrgfxac0RlVZOdOTH9DcmWGqA/AZsKB0JglRDpAFQZMM/77/6C
 EOg8TIQbIFQDwfDHfGWHgjDLSbspA6Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611846210;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3pa4+mcoZX/af+cmbkGDsHxVv4Uv3BVku5OjqWO8aM=;
 b=C2R+z4FClL2wDkBPGCsgyb1qkKmAYBDQce6wv20aP2z/hvFcL3MSwJ0x7Bcb9dFfyf6juu
 W8xzdgxu4+JlCvYZYM/o6GpxMPGajgm9+TrV3a6MHmsoJ7r56iBPj8kKgPjF1jf1ARcfYA
 nbRSVPljw1iJnw1W8vhaH2TwLt+gQzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-wNCDGAfCMX-h1YqcRO99JA-1; Thu, 28 Jan 2021 10:03:26 -0500
X-MC-Unique: wNCDGAfCMX-h1YqcRO99JA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0669D879500;
 Thu, 28 Jan 2021 15:03:25 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77A585D720;
 Thu, 28 Jan 2021 15:03:24 +0000 (UTC)
Date: Thu, 28 Jan 2021 23:20:19 +0800
From: Zorro Lang <zlang@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
Message-ID: <20210128152019.GR14354@localhost.localdomain>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
 <20210128031355.GP14354@localhost.localdomain>
 <66061f75-c8de-c1eb-aaaf-9594a31be790@kernel.dk>
 <20210128135220.GQ14354@localhost.localdomain>
 <aedb880b-da2b-ec29-3b66-66f01733be9b@kernel.dk>
 <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <17ae2706-fe95-a5de-b9da-e3480800daf7@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Jens Axboe <axboe@kernel.dk>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 03:44:21PM +0100, Christophe Leroy wrote:
> 
> 
> Le 28/01/2021 à 15:42, Jens Axboe a écrit :
> > On 1/28/21 6:52 AM, Zorro Lang wrote:
> > > On Wed, Jan 27, 2021 at 08:06:37PM -0700, Jens Axboe wrote:
> > > > On 1/27/21 8:13 PM, Zorro Lang wrote:
> > > > > On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
> > > > > > Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
> > > > > > > On 1/27/21 9:38 AM, Christophe Leroy wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Le 27/01/2021 à 15:56, Zorro Lang a écrit :
> > > > > > > > > On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
> > > > > > > > > The fail source line is:
> > > > > > > > > 
> > > > > > > > >     if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
> > > > > > > > >         return SIGSEGV;
> > > > > > > > > 
> > > > > > > > > The is_user() is based on user_mod(regs) only. This's not suit for
> > > > > > > > > io_uring, where the helper thread can assume the user app identity
> > > > > > > > > and could perform this fault just fine. So turn to use mm to decide
> > > > > > > > > if this is valid or not.
> > > > > > > > 
> > > > > > > > I don't understand why testing is_user would be an issue. KUAP purpose
> > > > > > > > it to block any unallowed access from kernel to user memory
> > > > > > > > (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
> > > > > > > > that is what is_user provides.
> > > > > > > > 
> > > > > > > > If the kernel access is legitimate, kernel should have opened
> > > > > > > > userspace access then you shouldn't get this "Bug: Read fault blocked
> > > > > > > > by KUAP!".
> > > > > > > > 
> > > > > > > > As far as I understand, the fault occurs in
> > > > > > > > iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
> > > > > > > > fault_in_pages_readable() uses __get_user() so it is a legitimate
> > > > > > > > access and you really should get a KUAP fault.
> > > > > > > > 
> > > > > > > > So the problem is somewhere else, I think you proposed patch just
> > > > > > > > hides the problem, it doesn't fix it.
> > > > > > > 
> > > > > > > If we do kthread_use_mm(), can we agree that the user access is valid?
> > > > > > 
> > > > > > Yeah the io uring code is fine, provided it uses the uaccess primitives
> > > > > > like any other kernel code. It's looking more like a an arch/powerpc bug.
> > > > > > 
> > > > > > > We should be able to copy to/from user space, and including faults, if
> > > > > > > that's been done and the new mm assigned. Because it really should be.
> > > > > > > If SMAP was a problem on x86, we would have seen it long ago.
> > > > > > > 
> > > > > > > I'm assuming this may be breakage related to the recent uaccess changes
> > > > > > > related to set_fs and friends? Or maybe recent changes on the powerpc
> > > > > > > side?
> > > > > > > 
> > > > > > > Zorro, did 5.10 work?
> > > > > > 
> > > > > > Would be interesting to know.
> > > > > 
> > > > > Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
> > > > > commit(be the HEAD) in 5.10 phase?
> > > > 
> > > > I forget which versions had what series of this, but 5.10 final - and if
> > > > that fails, then 5.9 final. IIRC, 5.9 was pre any of these changes, and
> > > > 5.10 definitely has them.
> > > 
> > > I justed built linux v5.10 with same .config file, and gave it same test.
> > > v5.10 (HEAD=2c85ebc57b Linux 5.10) can't reproduce this bug:
> > > 
> > > # ./check generic/013 generic/051
> > > FSTYP         -- xfs (non-debug)
> > > PLATFORM      -- Linux/ppc64le ibm-p9z-xxx-xxxx 5.10.0 #3 SMP Thu Jan 28 04:12:14 EST 2021
> > > MKFS_OPTIONS  -- -f -m crc=1,finobt=1,reflink=1,rmapbt=1,bigtime=1,inobtcount=1 /dev/sda3
> > > MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/sda3 /mnt/xfstests/scratch
> > > 
> > > generic/013 138s ...  77s
> > > generic/051 103s ...  143s
> > > Ran: generic/013 generic/051
> > > Passed all 2 tests
> > 
> > Thanks for testing that, so I think it's safe to conclude that there's a
> > regression in powerpc fault handling for kthreads that use
> > kthread_use_mm in this release. A bisect would definitely find it, but
> > might be pointless if Christophe or Nick already have an idea of what it
> > is.
> > 
> 
> I don't have any idea yet, but I'd be curious to see the vmlinux binary matching the reported Oops.

OK, I don't have the vmlinux matching that bug report now, I can help to prepare a new one, but
I need lots of time (about 10+ hours).

Thanks,
Zorro

> 
> Christophe
> 

