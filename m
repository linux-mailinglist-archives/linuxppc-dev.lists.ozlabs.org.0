Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B510066C19E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 15:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwYtJ3nRsz3fKv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 01:14:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpvDRkgD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpvDRkgD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpvDRkgD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TpvDRkgD;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwYlY4Tg8z3fKS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 01:08:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673878100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBR6LpmTfuNlZNPZuo1jcAuw8ZocBo9TD/tE524PhVg=;
	b=TpvDRkgDnjJJuCgd/eCfTvn7+FX8qjytZnbWE6v4JVX2wdewrMPmhZv0cfN+5FGg+ivHNf
	63KCYu1D4y79vpI9fPH6SrOuHhgbn5ZwVCDiuKFJQ2nl/gpA4KfmqExDALcyNJletp32J+
	gQwISOGJkjzrKHzc57iHsiMVHUaF0e0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673878100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBR6LpmTfuNlZNPZuo1jcAuw8ZocBo9TD/tE524PhVg=;
	b=TpvDRkgDnjJJuCgd/eCfTvn7+FX8qjytZnbWE6v4JVX2wdewrMPmhZv0cfN+5FGg+ivHNf
	63KCYu1D4y79vpI9fPH6SrOuHhgbn5ZwVCDiuKFJQ2nl/gpA4KfmqExDALcyNJletp32J+
	gQwISOGJkjzrKHzc57iHsiMVHUaF0e0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-zpzJXMjQNt-1IH2FUjaqQg-1; Mon, 16 Jan 2023 09:08:19 -0500
X-MC-Unique: zpzJXMjQNt-1IH2FUjaqQg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CA7438123BE;
	Mon, 16 Jan 2023 14:08:18 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 778DF40C2064;
	Mon, 16 Jan 2023 14:08:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
References: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com> <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com> <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com> <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Memory transaction instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1966766.1673878095.1@warthog.procyon.org.uk>
Date: Mon, 16 Jan 2023 14:08:15 +0000
Message-ID: <1966767.1673878095@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Hi Linus,

I'm not sure how relevant it is to the topic, but I seem to remember you
having a go at implementing spinlocks with x86_64 memory transaction
instructions a while back.  Do you have any thoughts on whether these
instructions are ever likely to become something we can use?

I was looking specifically at the skbuff queue stuff which does {
spin_lock_irq, add to list, inc count, spin_unlock_irq } and thinking that
might be a good place to use such a thing.

David

