Return-Path: <linuxppc-dev+bounces-1238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5DD974C7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 10:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3YT84fBTz2yT0;
	Wed, 11 Sep 2024 18:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726042924;
	cv=none; b=ZFbjEQwvtxlx4XQxCkpXdWCCZgr1QfMqBFYo1lXftpdoEM0Fw+Ecnk0lDGNiY/Tia5lbjvTvppgAlymDqf3doidYRdwIcX/Ye/HKzVX0XG1UUXvZF01rjlz97bsz4EzvXoIp9y5Ft+wQ+U1XsEvfDRYNnwbIol8/MFBU2Zujt752K+vLUhROBucGnWZD8qZYLQPKrtfxP6Ro7QCHyXQQXIipuV/PRvoM5ldhHwaF76j+bPYO6+vahjzzNRPm7l9YY0/y1iTiYL4GS5FFgZd/npXrHAmu2LABbPTcne3OwXkUb5kBW0NaPk3F+hAIuBfTuZkRc6bEV/VMI5lar8BGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726042924; c=relaxed/relaxed;
	bh=K/VWIG/hvcTo6bq0O/qN91HDvQ0nDTdxNF7MsK1tCQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNw3ah4nOnqnuM/x62iFXmFyyeklFmHsWqKtFk9VXSWbrov+r+ysXkFORCXpbZ7lMvHdUGumxCLl8tlM9HOBPka+yqAZEN5MDs0QP3tW2eIpKHFmWuxGdiHnlNxCn7eej8qqPeLszg83EBwur+4GKQyVnZuDbRjp0TYrUd27tx+7Ad1xZhmQY/8pbZydPRJRASq6YHEu2eMg0GESm75MDdVaJoFzEbe95P0gMSZJdv3p3rZbk7sBcsV+dumwtaBvfJLRCoD9nyrg9H907F5PHzmbxP9S6D4JXeDkvDw+Cp8g0O/OY6Q2uNkR+lpxk1O6YxAePvQ9oFQzb3TgUx3tuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t+AyMumf; dkim-atps=neutral; spf=pass (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=t+AyMumf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.178; helo=out-178.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3YT82fkHz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 18:22:04 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:21:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726042903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K/VWIG/hvcTo6bq0O/qN91HDvQ0nDTdxNF7MsK1tCQY=;
	b=t+AyMumfV9i65niZfYRKpAR2lPpmH6iNk00zAsgE0AsXC6V+SHXS1KVqOGT0NPOxV1flwM
	dRTjnI2A5vdwboFeqJcvLv7ICGEyGcnBoza2+xjSOHdtAZShTkvnR1Vg1+34F16cpx/2At
	Yl4s7zguwXQ8GX5+PRJswJhmqdFkZko=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI
 builds
Message-ID: <20240911-7187cf8364de8a30b0419fac@orel>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-8-andrew.jones@linux.dev>
 <D430XMRU4FZD.1FFPMW6WVWRSD@gmail.com>
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
In-Reply-To: <D430XMRU4FZD.1FFPMW6WVWRSD@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Sep 11, 2024 at 10:21:39AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > clang complains about GNU extensions such as variable sized types not
> > being at the end of structs unless -Wno-gnu is used. We may
> > eventually want -Wno-gnu, but for now let's just handle the warnings
> > as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
> > the warning issued for the initrd_dev_path struct.
> 
> You could also make a variant of struct efi_vendor_dev_path with no
> vendordata just for initrd_dev_path?
> 
> It's taken from Linux or some efi upstream though so maybe it's annoying
> to make such changes here. Okay in that case since it's limited to EFI.

I should have mentioned in the commit message that efi_vendor_dev_path is
a direct import of the Linux code and that we'd rather keep it that way.
I can do that for v2.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
drew

> 
> 
> >
> > Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> > ---
> >  Makefile | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 3d51cb726120..7471f7285b78 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
> >  # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
> >  # starting address
> >  EFI_CFLAGS += -fPIC
> > +# Avoid error with the initrd_dev_path struct
> > +EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
> >  # Create shared library
> >  EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
> >  endif
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

