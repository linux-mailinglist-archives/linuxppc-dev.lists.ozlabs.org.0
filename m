Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD038FB3EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 15:37:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5MUdjtS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vts8s0qwCz3cYR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 23:37:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c5MUdjtS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (unknown [IPv6:2001:41d0:1004:224b::b6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vts832PhBz3cRy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 23:36:43 +1000 (AEST)
X-Envelope-To: thuth@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717508174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VSUx8HBtycvTGXY09hNGvaNW48lkTHHSidcjdBZAQTA=;
	b=c5MUdjtSaSzL5wKb5gCPz/p8gGG3ZAhHmjp+GUfKQDpd5pdZ4tj9/WgMAr0kqKU3O/sFP/
	NBA8AW7g3JY5hnVjZXuTOGt4vF3EgHjI6dd4S8tdD+w7fRoXSCuVqJVR24bTZLUZji7/hi
	Xs9cqC3hGjkj5SkThrbCniW4BS61m4U=
X-Envelope-To: npiggin@gmail.com
X-Envelope-To: lvivier@redhat.com
X-Envelope-To: linuxppc-dev@lists.ozlabs.org
X-Envelope-To: kvm@vger.kernel.org
Date: Tue, 4 Jun 2024 15:36:10 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v9 29/31] powerpc: Remove remnants of
 ppc64 directory and build structure
Message-ID: <20240604-92e3b6502a920717bec7d780@orel>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-30-npiggin@gmail.com>
 <15d6ae85-a46e-4a99-a3b9-6aa6420e0639@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15d6ae85-a46e-4a99-a3b9-6aa6420e0639@redhat.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2024 at 12:49:51PM GMT, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > This moves merges ppc64 directories and files into powerpc, and
> > merges the 3 makefiles into one.
> > 
> > The configure --arch=powerpc option is aliased to ppc64 for
> > good measure.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/powerpc/Makefile b/powerpc/Makefile
> > index 8a007ab54..e4b5312a2 100644
> > --- a/powerpc/Makefile
> > +++ b/powerpc/Makefile
> > @@ -1 +1,111 @@
> > -include $(SRCDIR)/$(TEST_DIR)/Makefile.$(ARCH)
> > +#
> > +# powerpc makefile
> > +#
> > +# Authors: Andrew Jones <drjones@redhat.com>
> 
> I'd maybe drop that e-mail address now since it it not valid anymore.
> Andrew, do want to see your new mail address here?

No need to change to my new email address. We can either keep it as is for
historical records, and as part of faithful code move, or just drop it.

Thanks,
drew

> 
> Apart from that:
> Acked-by: Thomas Huth <thuth@redhat.com>
> 
