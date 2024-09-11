Return-Path: <linuxppc-dev+bounces-1237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA025974C61
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 10:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3YQh4FkRz2yXm;
	Wed, 11 Sep 2024 18:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726042796;
	cv=none; b=I1sDD8BbmQAbR1N6xmdXJQvBgC1/7Bf48Btr9ji41CDb1XtK8BOrr5kIlQdYdt4f/20pc+yqnI4CCKaZE/OvzOuibu38vFbcvSNnoJ2LX0QPNNUBzN7QsIkWJ7aiw/gzow0YrJfPm+hXmKYgKhTI7LMfg/0WtgyE2XpsOfIrJOx+O9k3Gyja7ro3padd7F/i1lPNwz4yyTSW9Fd1Dc8/SVOABxma1Ntply23H8ofocxvojAjUuYLEGWMRYa41G/kR3mcAA0RpytDu85RaQ64xZPfz/vsS1DqkVH1rX/fs04bKFZWjN4yBAsQav4z2KStwTJZ4uKIpr440ULl/w0moQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726042796; c=relaxed/relaxed;
	bh=Xawjdg9z4iOS4w17C67FyLrAjZ6VCLSaCQ0vlpCF4cQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=galCurKZWe0+CStVvoaIh/4LdYwgglpYjU+JzYisvl91xnDfB7EKLDGqPjmGy6faXmHzTWxKk5N+GqeVjs0OIPqZXiKiZ9KG7rbS/BFgi19e+42rtLFqv+sOzYbDRMxTgZ0HSv8L5oJ27JDRI0wNhFZQr4lI1HV6nx6cGCd6ZmBheV9iEPkvl2gjUHTngSmU2gczBpohtRHnIUC8Delhzi7+6TduwdOkISZcrIViqp7plytJntN2fJoQOVB955Luus92XfhnfAmh/WPo03CC+cy5lraJqHt8FOe592PTDhyx2RCLmKKRvhNxUNMk5VY6/2/k8fR0wwZma+1yQU7usQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mOgc2X16; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mOgc2X16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b2; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [IPv6:2001:41d0:203:375::b2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3YQh298tz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 18:19:55 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:19:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726042767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xawjdg9z4iOS4w17C67FyLrAjZ6VCLSaCQ0vlpCF4cQ=;
	b=mOgc2X16DMniSSg5raKMj4rMI4P5mn/hmJoO4dhq78qFcth9aXmLURlGx3a9wvb/xx3GZV
	xZ4p1ifKJZnphmltqmAInC3jPjDJ1plx7dRNLiTvGa4ZBWwKQn+ruszwkrQKp5BFNWhLFa
	imaAtwoItwF0hl/nnckK9zeluUh+I/0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH v2 1/4] riscv: Drop mstrict-align
Message-ID: <20240911-b5b62a907e90fabe4c701930@orel>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-7-andrew.jones@linux.dev>
 <D430NH4TXH15.KR19KPMT2APE@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D430NH4TXH15.KR19KPMT2APE@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Sep 11, 2024 at 10:08:23AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > The spec says unaligned accesses are supported, so this isn't required
> > and clang doesn't support it. A platform might have slow unaligned
> > accesses, but kvm-unit-tests isn't about speed anyway.
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  riscv/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/riscv/Makefile b/riscv/Makefile
> > index 179a373dbacf..2ee7c5bb5ad8 100644
> > --- a/riscv/Makefile
> > +++ b/riscv/Makefile
> > @@ -76,7 +76,7 @@ LDFLAGS += -melf32lriscv
> >  endif
> >  CFLAGS += -DCONFIG_RELOC
> >  CFLAGS += -mcmodel=medany
> > -CFLAGS += -mstrict-align
> > +#CFLAGS += -mstrict-align
> 
> Just remove the line?
> 
> Or put a comment there instead to explain.

I'll add a comment.

Thanks,
drew

