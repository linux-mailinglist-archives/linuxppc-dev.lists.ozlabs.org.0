Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 654316AD3E7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:31:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVybR2M6jz3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 12:31:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+5u2Exg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+5u2Exg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+5u2Exg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O+5u2Exg;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVyZS3LBwz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 12:30:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678152652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8ahPZDaVvcIaob1vmzodN2QF3Hw6BRjjqbc38rwl/Q=;
	b=O+5u2ExgaOEshTO2YlxXEqsOYa9P8aLq+BzqYmkLgDP4hjQfWutktreaxOZGpZwr43cMke
	9yPlGUQ9I3qKMYepfg9uo34rtnrrRWjhZyV4eYuEaC7QA8N9UrWqm5sPzup6mCSHHMo1Mx
	ZL83l03NTiRK36rVWF+00Z6FDBfOcaE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678152652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8ahPZDaVvcIaob1vmzodN2QF3Hw6BRjjqbc38rwl/Q=;
	b=O+5u2ExgaOEshTO2YlxXEqsOYa9P8aLq+BzqYmkLgDP4hjQfWutktreaxOZGpZwr43cMke
	9yPlGUQ9I3qKMYepfg9uo34rtnrrRWjhZyV4eYuEaC7QA8N9UrWqm5sPzup6mCSHHMo1Mx
	ZL83l03NTiRK36rVWF+00Z6FDBfOcaE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-q-PJP5gANaiVF8sVjYLtpg-1; Mon, 06 Mar 2023 20:30:49 -0500
X-MC-Unique: q-PJP5gANaiVF8sVjYLtpg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9974385CBE0;
	Tue,  7 Mar 2023 01:30:48 +0000 (UTC)
Received: from localhost (ovpn-12-63.pek2.redhat.com [10.72.12.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0E44492C3E;
	Tue,  7 Mar 2023 01:30:47 +0000 (UTC)
Date: Tue, 7 Mar 2023 09:30:43 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some
 architectures
Message-ID: <ZAaTw+841xBsz/m9@MiWiFi-R3L-srv>
References: <20230303102817.212148-1-bhe@redhat.com>
 <20230303102817.212148-3-bhe@redhat.com>
 <87sfej1rie.fsf@mpe.ellerman.id.au>
 <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
 <5dec69d0-0bc9-4f6c-8d0d-ee5422783100@app.fastmail.com>
 <87jzzt1ioc.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jzzt1ioc.fsf@mpe.ellerman.id.au>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/07/23 at 11:58am, Michael Ellerman wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
> > On Sun, Mar 5, 2023, at 10:29, Geert Uytterhoeven wrote:
> >> On Sun, Mar 5, 2023 at 10:23 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>> Maybe that exact code path is only reachable on x86/ia64? But if so
> >>> please explain why.
> >>>
> >>> Otherwise it looks like this series could break that driver on powerpc
> >>> at least.
> >>
> >> Indeed.
> >
> > When I last looked into this, I sent a patch to use ioremap()
> > on non-x86:
> >
> > https://lore.kernel.org/all/20191111192258.2234502-1-arnd@arndb.de/
> 
> OK thanks.
> 
> Baoquan can you add that patch to the start of this series if/when you
> post the next version?

Sure, will do. Wondering if we need make change to cover powerpc other
than x86 and ia64 in Arnd's patch as you and Geert pointed out.

