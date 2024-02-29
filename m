Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B006F86C872
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 12:49:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iuZEuTxf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlqJB2F3Hz3vXb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 22:49:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iuZEuTxf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.182; helo=out-182.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlqHS5rbNz3cZN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 22:48:36 +1100 (AEDT)
Date: Thu, 29 Feb 2024 12:48:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709207294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fynTQbCj+0+8gxWXP+vb+6EeWzkaGPfZJFyS35W4s4=;
	b=iuZEuTxfseoZp4UQoXwPwaJ0a3iWv9B5ZmYjolE1PWpkuPgM0k2tb4r+KsGxNXibCaqSMX
	28xc8TdmgZEjmtE7rA6HjPrfkc5ixF9DXIXKhREpQkx1Bsj671uDxFM1mVEkY7E3EFscsy
	mT5j0z0J3eZ3dlXLE5t1Tns+yX/3RBw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 03/13] treewide: lib/stack: Fix backtrace
Message-ID: <20240229-b470bcfe6538d0fea44ab3e3@orel>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
 <20240228150416.248948-18-andrew.jones@linux.dev>
 <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CZH8V1T0Z3QN.1ZVFAXR4B96BZ@wheely>
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
Cc: lvivier@redhat.com, linux-s390@vger.kernel.org, thuth@redhat.com, nrb@linux.ibm.com, frankja@linux.ibm.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, pbonzini@redhat.com, imbrenda@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 01:31:52PM +1000, Nicholas Piggin wrote:
> On Thu Feb 29, 2024 at 1:04 AM AEST, Andrew Jones wrote:
...
> > diff --git a/lib/stack.h b/lib/stack.h
> > index 10fc2f793354..6edc84344b51 100644
> > --- a/lib/stack.h
> > +++ b/lib/stack.h
> > @@ -11,17 +11,27 @@
> >  #include <asm/stack.h>
> >  
> >  #ifdef HAVE_ARCH_BACKTRACE_FRAME
> > -extern int backtrace_frame(const void *frame, const void **return_addrs,
> > -			   int max_depth);
> > +extern int arch_backtrace_frame(const void *frame, const void **return_addrs,
> > +				int max_depth, bool current_frame);
> > +
> > +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> > +				  int max_depth)
> > +{
> > +	return arch_backtrace_frame(frame, return_addrs, max_depth, false);
> > +}
> > +
> > +static inline int backtrace(const void **return_addrs, int max_depth)
> > +{
> > +	return arch_backtrace_frame(NULL, return_addrs, max_depth, true);
> > +}
> >  #else
> > -static inline int
> > -backtrace_frame(const void *frame __unused, const void **return_addrs __unused,
> > -		int max_depth __unused)
> > +extern int backtrace(const void **return_addrs, int max_depth);
> > +
> > +static inline int backtrace_frame(const void *frame, const void **return_addrs,
> > +				  int max_depth)
> >  {
> >  	return 0;
> >  }
> >  #endif
> >  
> > -extern int backtrace(const void **return_addrs, int max_depth);
> > -
> >  #endif
> 
> Is there a reason to add the inline wrappers rather than just externs
> and drop the arch_ prefix?

Only reason is to avoid duplicating the functions in each arch, but
since they're oneliners which won't likely change, then we could
duplicate them instead, if preferred, but I'm not sure what the
benefit of that over the static inlines would be.

> 
> Do we want to just generally have all arch specific functions have an
> arch_ prefix? Fine by me.

We've been slowly doing that over in 'KVM selftests', which has improved
readability, so slowly adopting it here too in kvm-unit-tests would be
nice.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
> I'm fine to rebase the powerpc patch on top of this if it goes in first.
> Thanks for the heads up.
> 

Thanks,
drew
