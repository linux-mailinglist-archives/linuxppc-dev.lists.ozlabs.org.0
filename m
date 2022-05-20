Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F50452EA23
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 12:47:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4Nj4740Cz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 20:47:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSOl7RAx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSOl7RAx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZSOl7RAx; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZSOl7RAx; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4NhK0X3wz3bgC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 20:46:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653043612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQr+WYXvYH6C2rlkykvpDaH7m2mWgKdo/x6qBJwWRmA=;
 b=ZSOl7RAxwsc7G3XcJqEkaVErmRP5hLvBGcHbfrXaN76EIE/fPUlPJZqA8Yicerw5iP8DTv
 cmN3Mynm1xuxLdXCJYhwB66o6QOd2oEHdtecJ3mpZZz9ZPKvVQUx9dRMqFEWJQE00ztCXZ
 oxKpURP+SvbmPaPS0N8II2V1CSa2Uio=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653043612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQr+WYXvYH6C2rlkykvpDaH7m2mWgKdo/x6qBJwWRmA=;
 b=ZSOl7RAxwsc7G3XcJqEkaVErmRP5hLvBGcHbfrXaN76EIE/fPUlPJZqA8Yicerw5iP8DTv
 cmN3Mynm1xuxLdXCJYhwB66o6QOd2oEHdtecJ3mpZZz9ZPKvVQUx9dRMqFEWJQE00ztCXZ
 oxKpURP+SvbmPaPS0N8II2V1CSa2Uio=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563--yAKilzXP0-I3RfbzJhwrg-1; Fri, 20 May 2022 06:46:46 -0400
X-MC-Unique: -yAKilzXP0-I3RfbzJhwrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34DB8801E80;
 Fri, 20 May 2022 10:46:46 +0000 (UTC)
Received: from localhost (ovpn-12-20.pek2.redhat.com [10.72.12.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1261410DD5;
 Fri, 20 May 2022 10:46:44 +0000 (UTC)
Date: Fri, 20 May 2022 18:46:41 +0800
From: Baoquan He <bhe@redhat.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <20220520104641.GB194232@MiWiFi-R3L-srv>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
 <87ee0q7b92.fsf@email.froward.int.ebiederm.org>
 <YoWySwbszfdZS9LU@MiWiFi-R3L-srv>
 <87bkvt4d56.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkvt4d56.fsf@email.froward.int.ebiederm.org>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/19/22 at 12:59pm, Eric W. Biederman wrote:
> Baoquan He <bhe@redhat.com> writes:
> 
> > Hi Eric,
> >
> > On 05/18/22 at 04:59pm, Eric W. Biederman wrote:
> >> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> >> 
> >> > Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> >> > symbols") [1], binutils (v2.36+) started dropping section symbols that
> >> > it thought were unused.  This isn't an issue in general, but with
> >> > kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
> >> > separate .text.unlikely section and the section symbol ".text.unlikely"
> >> > is being dropped. Due to this, recordmcount is unable to find a non-weak
> >> > symbol in .text.unlikely to generate a relocation record against.
> >> >
> >> > Address this by dropping the weak attribute from these functions:
> >> > - arch_kexec_apply_relocations() is not overridden by any architecture
> >> >   today, so just drop the weak attribute.
> >> > - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
> >> >   Retain the function prototype for those and move the weak
> >> >   implementation into the header as a static inline for other
> >> >   architectures.
> >> >
> >> > [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> >> 
> >> Any chance you can also get machine_kexec_post_load,
> >> crash_free_reserved_phys_range, arch_kexec_protect_protect_crashkres,
> >> arch_kexec_unprotect_crashkres, arch_kexec_kernel_image_probe,
> >> arch_kexec_kernel_image_probe, arch_kimage_file_post_load_cleanup,
> >> arch_kexec_kernel_verify_sig, and arch_kexec_locate_mem_hole as well.
> >> 
> >> That is everything in kexec that uses a __weak symbol.  If we can't
> >> count on them working we might as well just get rid of the rest
> >> preemptively.
> >
> > Is there a new rule that __weak is not suggested in kernel any more?
> > Please help provide a pointer if yes, so that I can learn that.
> >
> > In my mind, __weak is very simple and clear as a mechanism to add
> > ARCH related functionality.
> 
> You should be able to trace the conversation back for all of the details
> but if you can't here is the summary.
> 
> There is a tool that some architectures use called recordmcount.  The
> recordmcount looks for a symbol in a section, and ignores all weak
> symbols.  In certain cases sections become so simple there are only weak
> symbols.  At which point recordmcount fails.
> 
> Which means in practice __weak symbols are unreliable and don't work
> to add ARCH related functionality.
> 
> Given that __weak symbols fail randomly I would much rather have simpler
> code that doesn't fail.  It has never been the case that __weak symbols
> have been very common in the kernel.  I expect they are something like
> bool that have been gaining traction.  Still given that __weak symbols
> don't work.  I don't want them.

Thanks for the summary, Eric.

From Naveen's reply, what I got is, llvm's recent change makes
symbol of section .text.unlikely lost, but the secton .text.unlikely
still exists. The __weak symbol will be put in .text.unlikely partly,
when arch_kexec_apply_relocations_add() includes the pr_err line. While
removing the pr_err() line will put __weak symbol
arch_kexec_apply_relocations_add() in .text instead. 

Now the status is that not only recordmcount got this problem, objtools
met it too and got an appropriate fix. Means objtools's fix doesn't need
kernel's adjustment. Recordmcount need kernel to adjust because it lacks
continuous support and developement. Naveen also told that they are
converting to objtools, just the old CI cases rely on recordmcount. In
fact, if someone stands up to get an appropriate recordmcount fix too,
the problem will be gone too.

Asking this because __weak will be sentenced to death from now on, if we
decide to change kernel. And this thread will be the pointer provided to
others when telling them not to use __weak.

I am not strongly against taking off __weak, just wondering if there's
chance to fix it in recordmcount, and the cost comparing with kernel fix;
except of this issue, any other weakness of __weak. Noticed Andrew has
picked this patch, as a witness of this moment, raise a tiny concern.

