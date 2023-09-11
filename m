Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C279A73C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 12:32:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdZph2Gi;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdZph2Gi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rkjhq2MZGz3cK4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Sep 2023 20:32:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdZph2Gi;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gdZph2Gi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rkjgv5qSvz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Sep 2023 20:31:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694428310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scL+PN7rvFW0rRtuvyrop8LP1MAlxFU5fgMf6KSanRA=;
	b=gdZph2GiQL+olU3AsRE3qpoTTwM1AVLIAHdd57DqJoDmYtPczBqmls0dm8c+n2fXmFpIlV
	2PkvBY5XcJSgqpTFhUgszTZgBx5IJjPfts1Ghyt/s2RwoPlKv0lT1nb/iS4R91jAJmZ6kx
	KeZNoZmgkL1lL8rW7W8vZtk9itpaBGg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694428310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=scL+PN7rvFW0rRtuvyrop8LP1MAlxFU5fgMf6KSanRA=;
	b=gdZph2GiQL+olU3AsRE3qpoTTwM1AVLIAHdd57DqJoDmYtPczBqmls0dm8c+n2fXmFpIlV
	2PkvBY5XcJSgqpTFhUgszTZgBx5IJjPfts1Ghyt/s2RwoPlKv0lT1nb/iS4R91jAJmZ6kx
	KeZNoZmgkL1lL8rW7W8vZtk9itpaBGg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-bOa0vEtiPUa0zpz8zjb7vQ-1; Mon, 11 Sep 2023 06:31:44 -0400
X-MC-Unique: bOa0vEtiPUa0zpz8zjb7vQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 662A5382254A;
	Mon, 11 Sep 2023 10:31:44 +0000 (UTC)
Received: from localhost (unknown [10.72.112.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB1F40C200A;
	Mon, 11 Sep 2023 10:31:42 +0000 (UTC)
Date: Mon, 11 Sep 2023 18:31:39 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/3] vmcore: allow fadump to export vmcore even if
 is_kdump_kernel() is false
Message-ID: <ZP7si3UMVpPfYV+w@MiWiFi-R3L-srv>
References: <20230905183604.568996-1-hbathini@linux.ibm.com>
 <20230905183604.568996-2-hbathini@linux.ibm.com>
 <8734zltc6z.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734zltc6z.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/11/23 at 05:13pm, Michael Ellerman wrote:
> Hari Bathini <hbathini@linux.ibm.com> writes:
> > Currently, is_kdump_kernel() returns true when elfcorehdr_addr is set.
> > While elfcorehdr_addr is set for kexec based kernel dump mechanism,
> > alternate dump capturing methods like fadump [1] also set it to export
> > the vmcore. Since, is_kdump_kernel() is used to restrict resources in
> > crash dump capture kernel and such restrictions are not desirable for
> > fadump, allow is_kdump_kernel() to be defined differently for fadump
> > case. With that change, include is_fadump_active() check in functions
> > is_vmcore_usable() & vmcore_unusable() to be able to export vmcore for
> > fadump case too.
> ...
> > diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
> > index 0f3a656293b0..de8a9fabfb6f 100644
> > --- a/include/linux/crash_dump.h
> > +++ b/include/linux/crash_dump.h
> > @@ -50,6 +50,7 @@ void vmcore_cleanup(void);
> >  #define vmcore_elf64_check_arch(x) (elf_check_arch(x) || vmcore_elf_check_arch_cross(x))
> >  #endif
> >  
> > +#ifndef is_kdump_kernel
> >  /*
> >   * is_kdump_kernel() checks whether this kernel is booting after a panic of
> >   * previous kernel or not. This is determined by checking if previous kernel
> > @@ -64,6 +65,19 @@ static inline bool is_kdump_kernel(void)
> >  {
> >  	return elfcorehdr_addr != ELFCORE_ADDR_MAX;
> >  }
> > +#endif
> > +
> > +#ifndef is_fadump_active
> > +/*
> > + * If f/w assisted dump capturing mechanism (fadump), instead of kexec based
> > + * dump capturing mechanism (kdump) is exporting the vmcore, then this function
> > + * will be defined in arch specific code to return true, when appropriate.
> > + */
> > +static inline bool is_fadump_active(void)
> > +{
> > +	return false;
> > +}
> > +#endif
> >  
> >  /* is_vmcore_usable() checks if the kernel is booting after a panic and
> >   * the vmcore region is usable.
> > @@ -75,7 +89,8 @@ static inline bool is_kdump_kernel(void)
> >  
> >  static inline int is_vmcore_usable(void)
> >  {
> > -	return is_kdump_kernel() && elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
> > +	return (is_kdump_kernel() || is_fadump_active())
> > +		&& elfcorehdr_addr != ELFCORE_ADDR_ERR ? 1 : 0;
> >  }
> >  
> >  /* vmcore_unusable() marks the vmcore as unusable,
> > @@ -84,7 +99,7 @@ static inline int is_vmcore_usable(void)
> >  
> >  static inline void vmcore_unusable(void)
> >  {
> > -	if (is_kdump_kernel())
> > +	if (is_kdump_kernel() || is_fadump_active())
> >  		elfcorehdr_addr = ELFCORE_ADDR_ERR;
> >  }
> 
> I think it would be cleaner to decouple is_vmcore_usable() and
> vmcore_usable() from is_kdump_kernel().
> 
> ie, make them operate solely based on the value of elforehdr_addr:
> 
> static inline int is_vmcore_usable(void)
> {
> 	elfcorehdr_addr != ELFCORE_ADDR_ERR && \
> 		elfcorehdr_addr != ELFCORE_ADDR_MAX;

Agree. I fell into the blind corner of thinking earlier. Above change
is better.

> }
> 
> static inline void vmcore_unusable(void)
> {
> 	elfcorehdr_addr = ELFCORE_ADDR_ERR;
> }
> 
> 
> Then all we need on powerpc is a way to override is_kdump_kernel().
> 
> cheers
> 

