Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73A761DE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 17:59:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=griUMn1q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKC+T8h9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9MDN3lNKz3cQs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 01:59:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=griUMn1q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AKC+T8h9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9MCS1lXnz2ygG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 01:58:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690300733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCrVdTZAI+0vQC3PoQE4vcBJ0YMLagHeZdYmArSL1lk=;
	b=griUMn1q4eeP1zmcvhaRXefAef156UStd0wpGMerGjloMA7xTAqBRTVLqWG2n5Q3Iz1vPd
	n8lQ4HZqrT9ySAl47rq1+AlnpzBwcFFDujv8Yh05RM4LXljUHJsHmGcCRyRYOKSOd7UXbZ
	U68Ohtncgb0upf2l7gQlT84Y2nSRisg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690300734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DCrVdTZAI+0vQC3PoQE4vcBJ0YMLagHeZdYmArSL1lk=;
	b=AKC+T8h9RwiWpakAD+oF4qSMen3scsdNgjSE9JHf4vh4WlLXhifO/9fZCk5/+ft1Ly/HZt
	lC2W+qruSMGIfnYhBy9vpSbZED9syovHQtyXzFTP2D501gtfst39NFWKnRraAoa/tiMKlS
	XzziHCahZk0KSRGRYkQjCM7SpcM1MQg=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-WI-G73yFMfKYvUZh17UjEQ-1; Tue, 25 Jul 2023 11:58:46 -0400
X-MC-Unique: WI-G73yFMfKYvUZh17UjEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD0281C16600;
	Tue, 25 Jul 2023 15:58:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.242])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D7BA0201EC58;
	Tue, 25 Jul 2023 15:58:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <cover.1689092120.git.legion@kernel.org>
References: <cover.1689092120.git.legion@kernel.org> <cover.1689074739.git.legion@kernel.org>
To: Alexey Gladkov <legion@kernel.org>
Subject: Add fchmodat2() - or add a more general syscall?
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <104970.1690300714.1@warthog.procyon.org.uk>
Date: Tue, 25 Jul 2023 16:58:34 +0100
Message-ID: <104971.1690300714@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, alexander.shishkin@linux.intel.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, James.Bottomley@HansenPartnership.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, Arnd Bergmann <arnd@arndb.de>, ysato@users.sourceforge.jp, deller@gmx.de, linux-sh@vger.kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, geert@linux-m68k.org, catalin.marinas@arm.com, jhogan@kernel.org, mattst88@gmail.com, fweimer@redhat.com, gor@linux.ibm.com, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, linux-m68k@lists.linux-m68k.org, ink@jurassic.park.msu.ru, viro@zeniv.linux.org.uk, luto@kernel.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, axboe@kernel.dk, dhowells@redhat.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.ker
 nel.org, linux-api@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than adding a fchmodat2() syscall, should we add a "set_file_attrs()"
syscall that takes a mask and allows you to set a bunch of stuff all in one
go?  Basically, an interface to notify_change() in the kernel that would allow
several stats to be set atomically.  This might be of particular interest to
network filesystems.

David

