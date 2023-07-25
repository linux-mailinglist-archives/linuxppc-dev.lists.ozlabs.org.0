Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 144247621A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 20:41:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R23RYJzz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSIn69pv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9QpS6zPFz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 04:41:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=R23RYJzz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSIn69pv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9QnW5C3mz3bt5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 04:40:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690310411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ss2tzNf07FPnrLqdDtf+Er94L4qFrw/j0drlGJAUJI=;
	b=R23RYJzz5rLqalVJISVNMz4XEb4FrUDC4fnGGteTe2U2iXMsDJUea+HuZ/FHdaUjThNm69
	Aw71ey1xvzwUF3sKKYwy3ksX7mLCouomDeP/hh+DP4s301CfhKEd8OC6SiT3p7BhtlLDmr
	a4uNlMI6Tt+HsfJxM7+jIhnkqDUHEps=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690310412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ss2tzNf07FPnrLqdDtf+Er94L4qFrw/j0drlGJAUJI=;
	b=YSIn69pvwAyZ3JYlybhobQc6T92rzTFidJ4FPLp38mGc5WpsMeKk4SVGh1nW01XKn8c2Wu
	7rbV0H9GjxXx2GHU66iM8LZ4tnsG8lwCJnUCMOFbNl/Tznn8yJaGS+IvJBI/tYxUoSffgQ
	U/X3r840asW/1zt3FJVmNNxh1hmGuRY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-8oo2ft68MBSY5EtXE1nj0w-1; Tue, 25 Jul 2023 14:40:05 -0400
X-MC-Unique: 8oo2ft68MBSY5EtXE1nj0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 844A21C3408F;
	Tue, 25 Jul 2023 18:40:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BBCD4094DC1;
	Tue, 25 Jul 2023 18:39:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com>
References: <87fs5c3rbl.fsf@oldenburg3.str.redhat.com> <cover.1689092120.git.legion@kernel.org> <cover.1689074739.git.legion@kernel.org> <104971.1690300714@warthog.procyon.org.uk>
To: Florian Weimer <fweimer@redhat.com>
Subject: Re: Add fchmodat2() - or add a more general syscall?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <107289.1690310391.1@warthog.procyon.org.uk>
Date: Tue, 25 Jul 2023 19:39:51 +0100
Message-ID: <107290.1690310391@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-api@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@v
 ger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, Alexey Gladkov <legion@kernel.org>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Florian Weimer <fweimer@redhat.com> wrote:

> > Rather than adding a fchmodat2() syscall, should we add a
> > "set_file_attrs()" syscall that takes a mask and allows you to set a bunch
> > of stuff all in one go?  Basically, an interface to notify_change() in the
> > kernel that would allow several stats to be set atomically.  This might be
> > of particular interest to network filesystems.
> 
> Do you mean atomically as in compare-and-swap (update only if old values
> match), or just a way to update multiple file attributes with a single
> system call?

I was thinking more in terms of the latter.  AFAIK, there aren't any network
filesystems support a CAS interface on file attributes like that.  To be able
to do a CAS operation, we'd need to pass in the old values as well as the new.

Another thing we could look at is doing "create_and_set_attrs()", possibly
allowing it to take a list of xattrs also.

David

