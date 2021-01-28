Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A9306B4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 03:58:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR4t20JZYzDrTf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 13:58:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=zlang@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=i8Swo0dz; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=i8Swo0dz; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR4rV4j8zzDrRQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 13:57:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611802628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYmXlXLVjm9NsqCmEBM0cH6uOOydJIg4zzsLiZV7yNk=;
 b=i8Swo0dzAoQmsgjaLcz5CEl9XsPOmAeCU1VMGFZ1Tffp+xTkvybbGIX+6p+eMEO99qiM49
 rHA6O1kJXmOJPSYCNytoIvHPD1LzpD8VilOukaofRq9RUW5xbxHMHOOXtw4cCEiaxmvInR
 G8kggOC1x4XgrB3mD5kSEPxxAXOZZW4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611802628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYmXlXLVjm9NsqCmEBM0cH6uOOydJIg4zzsLiZV7yNk=;
 b=i8Swo0dzAoQmsgjaLcz5CEl9XsPOmAeCU1VMGFZ1Tffp+xTkvybbGIX+6p+eMEO99qiM49
 rHA6O1kJXmOJPSYCNytoIvHPD1LzpD8VilOukaofRq9RUW5xbxHMHOOXtw4cCEiaxmvInR
 G8kggOC1x4XgrB3mD5kSEPxxAXOZZW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-bwwsmxRkOSKbczqLZIWKBA-1; Wed, 27 Jan 2021 21:57:04 -0500
X-MC-Unique: bwwsmxRkOSKbczqLZIWKBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40283802B40;
 Thu, 28 Jan 2021 02:57:03 +0000 (UTC)
Received: from localhost (unknown [10.66.61.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C3E65C1C2;
 Thu, 28 Jan 2021 02:57:01 +0000 (UTC)
Date: Thu, 28 Jan 2021 11:13:56 +0800
From: Zorro Lang <zlang@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
Message-ID: <20210128031355.GP14354@localhost.localdomain>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
 <1611792928.nw4g8h8kj4.astroid@bobo.none>
MIME-Version: 1.0
In-Reply-To: <1611792928.nw4g8h8kj4.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Thu, Jan 28, 2021 at 10:18:07AM +1000, Nicholas Piggin wrote:
> Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
> > On 1/27/21 9:38 AM, Christophe Leroy wrote:
> >> 
> >> 
> >> Le 27/01/2021 à 15:56, Zorro Lang a écrit :
> >>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
> >>> The fail source line is:
> >>>
> >>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write)))
> >>>        return SIGSEGV;
> >>>
> >>> The is_user() is based on user_mod(regs) only. This's not suit for
> >>> io_uring, where the helper thread can assume the user app identity
> >>> and could perform this fault just fine. So turn to use mm to decide
> >>> if this is valid or not.
> >> 
> >> I don't understand why testing is_user would be an issue. KUAP purpose
> >> it to block any unallowed access from kernel to user memory
> >> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
> >> that is what is_user provides.
> >> 
> >> If the kernel access is legitimate, kernel should have opened
> >> userspace access then you shouldn't get this "Bug: Read fault blocked
> >> by KUAP!".
> >> 
> >> As far as I understand, the fault occurs in
> >> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
> >> fault_in_pages_readable() uses __get_user() so it is a legitimate
> >> access and you really should get a KUAP fault.
> >> 
> >> So the problem is somewhere else, I think you proposed patch just
> >> hides the problem, it doesn't fix it.
> > 
> > If we do kthread_use_mm(), can we agree that the user access is valid?
> 
> Yeah the io uring code is fine, provided it uses the uaccess primitives 
> like any other kernel code. It's looking more like a an arch/powerpc bug.
> 
> > We should be able to copy to/from user space, and including faults, if
> > that's been done and the new mm assigned. Because it really should be.
> > If SMAP was a problem on x86, we would have seen it long ago.
> > 
> > I'm assuming this may be breakage related to the recent uaccess changes
> > related to set_fs and friends? Or maybe recent changes on the powerpc
> > side?
> > 
> > Zorro, did 5.10 work?
> 
> Would be interesting to know.

Sure Nick and Jens, which 5.10 rc? version do you want to know ? Or any git
commit(be the HEAD) in 5.10 phase?

Thanks,
Zorro

> 
> Thanks,
> Nick
> 

