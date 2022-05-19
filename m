Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3690C52C9F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 05:00:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3ZN13t9Bz3cHs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 May 2022 13:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQsoWTBt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQsoWTBt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UQsoWTBt; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQsoWTBt; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3ZMJ5dTjz2y7V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 12:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652929155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kzeoZApr8FUKk2j/pFGghwvpVuJdLnN2byvPzMd2Qg=;
 b=UQsoWTBtR115NcULcy/xo0pG5/CTEiaIhiAZdqNBW83EZPXJeMfiLW5P4zwKY6Ma9UP5zS
 rsVuSuysb6li9iYPHEUgwLngNOK7xoS4T0Eh2Eq8baht7BDDeuey55azKyBN1y5bQkbTXw
 vbO+ytXryv6zE3pZCphs9s8zZ7lmp/4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652929155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5kzeoZApr8FUKk2j/pFGghwvpVuJdLnN2byvPzMd2Qg=;
 b=UQsoWTBtR115NcULcy/xo0pG5/CTEiaIhiAZdqNBW83EZPXJeMfiLW5P4zwKY6Ma9UP5zS
 rsVuSuysb6li9iYPHEUgwLngNOK7xoS4T0Eh2Eq8baht7BDDeuey55azKyBN1y5bQkbTXw
 vbO+ytXryv6zE3pZCphs9s8zZ7lmp/4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-b9Br-tgWP4aKMJ2HLUzw3A-1; Wed, 18 May 2022 22:59:10 -0400
X-MC-Unique: b9Br-tgWP4aKMJ2HLUzw3A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 024A0185A7A4;
 Thu, 19 May 2022 02:59:06 +0000 (UTC)
Received: from localhost (ovpn-13-136.pek2.redhat.com [10.72.13.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 23C551121314;
 Thu, 19 May 2022 02:59:04 +0000 (UTC)
Date: Thu, 19 May 2022 10:58:19 +0800
From: Baoquan He <bhe@redhat.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Subject: Re: [PATCH] kexec_file: Drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <YoWySwbszfdZS9LU@MiWiFi-R3L-srv>
References: <20220518181828.645877-1-naveen.n.rao@linux.vnet.ibm.com>
 <87ee0q7b92.fsf@email.froward.int.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee0q7b92.fsf@email.froward.int.ebiederm.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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

Hi Eric,

On 05/18/22 at 04:59pm, Eric W. Biederman wrote:
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
> 
> > Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> > symbols") [1], binutils (v2.36+) started dropping section symbols that
> > it thought were unused.  This isn't an issue in general, but with
> > kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
> > separate .text.unlikely section and the section symbol ".text.unlikely"
> > is being dropped. Due to this, recordmcount is unable to find a non-weak
> > symbol in .text.unlikely to generate a relocation record against.
> >
> > Address this by dropping the weak attribute from these functions:
> > - arch_kexec_apply_relocations() is not overridden by any architecture
> >   today, so just drop the weak attribute.
> > - arch_kexec_apply_relocations_add() is only overridden by x86 and s390.
> >   Retain the function prototype for those and move the weak
> >   implementation into the header as a static inline for other
> >   architectures.
> >
> > [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> 
> Any chance you can also get machine_kexec_post_load,
> crash_free_reserved_phys_range, arch_kexec_protect_protect_crashkres,
> arch_kexec_unprotect_crashkres, arch_kexec_kernel_image_probe,
> arch_kexec_kernel_image_probe, arch_kimage_file_post_load_cleanup,
> arch_kexec_kernel_verify_sig, and arch_kexec_locate_mem_hole as well.
> 
> That is everything in kexec that uses a __weak symbol.  If we can't
> count on them working we might as well just get rid of the rest
> preemptively.

Is there a new rule that __weak is not suggested in kernel any more?
Please help provide a pointer if yes, so that I can learn that.

In my mind, __weak is very simple and clear as a mechanism to add
ARCH related functionality.

Thanks
Baoquan

