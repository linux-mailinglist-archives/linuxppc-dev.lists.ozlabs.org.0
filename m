Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CD7671714
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 10:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nxfyg5xWBz3Wtp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:06:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MhMfge5R;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MhMfge5R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MhMfge5R;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MhMfge5R;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxfxf13Trz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 20:05:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674032751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4moWFALmL+jvvZ7hSHk+TWPnTGBQGuY1t1l6WXVsh0=;
	b=MhMfge5RumhhzdaM/reqWEjkhpoiw1uPx0R4jzUR2bl0RdbS0Mt62IAUvjCM2PxHf03M8u
	4XT9gGSuEmtJtA/hJDn1e4p20DfdxhC1WMqfaTJ8CbGLIAy0TynnGVxdbfQpaCCxjYgElz
	/OKPTzk1CuasCCZ2kF55Rh8MqjFNeFo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674032751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Z4moWFALmL+jvvZ7hSHk+TWPnTGBQGuY1t1l6WXVsh0=;
	b=MhMfge5RumhhzdaM/reqWEjkhpoiw1uPx0R4jzUR2bl0RdbS0Mt62IAUvjCM2PxHf03M8u
	4XT9gGSuEmtJtA/hJDn1e4p20DfdxhC1WMqfaTJ8CbGLIAy0TynnGVxdbfQpaCCxjYgElz
	/OKPTzk1CuasCCZ2kF55Rh8MqjFNeFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-PwoHsNd1MzGsAVjYpfOIfQ-1; Wed, 18 Jan 2023 04:05:46 -0500
X-MC-Unique: PwoHsNd1MzGsAVjYpfOIfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D5CC85C06A;
	Wed, 18 Jan 2023 09:05:45 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3FA8140EBF5;
	Wed, 18 Jan 2023 09:05:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=whjFwzEq0u04=n=t7-kNJdX0HkAOjAMjmLXDDycJ+j9yQ@mail.gmail.com>
References: <CAHk-=whjFwzEq0u04=n=t7-kNJdX0HkAOjAMjmLXDDycJ+j9yQ@mail.gmail.com> <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com> <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo> <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com> <1966767.1673878095@warthog.procyon.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: Memory transaction instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2496130.1674032743.1@warthog.procyon.org.uk>
Date: Wed, 18 Jan 2023 09:05:43 +0000
Message-ID: <2496131.1674032743@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, dhowells@redhat.com, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> And for the kernel, where we don't have bad locking, and where we
> actually use fine-grained locks that are _near_ the data that we are
> locking (the lockref of the dcache is obviously one example of that,
> but the skbuff queue you mention is almost certainly exactly the same
> situation): the lock is right by the data that the lock protects, and
> the "shared lock cacheline" model simply does not work. You'll bounce
> the data, and most likely you'll also touch the same lock cacheline
> too.

Yeah.  The reason I was actually wondering about them was if it would be
possible to avoid the requirement to disable interrupts/softirqs to, say,
modify the skbuff queue.  On some arches actually disabling irqs is quite a
heavy operation (I think this is/was true on ppc64, for example; it certainly
was on frv) and it was necessary to "emulate" the disablement.

David

