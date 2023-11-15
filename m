Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45B7EBABC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 01:59:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U9eqYY3B;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U9eqYY3B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVPvM22Lgz3cTN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 11:59:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U9eqYY3B;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U9eqYY3B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVPtV5hs6z2yNX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 11:58:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700009918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zlBf98ARjkQaX/S5kQ5snEY5GoQGl3AvBs2Ts5bz28=;
	b=U9eqYY3BZoF9kYmE5mB4TjKIRnwL4VSDtcntiBkFPAXtR9ilphfbatZ4JnqPoxWjgIWMJf
	XGslX6/WFU1YS1+ClFl9nbtOcJ4qL8TGD4/KVh0tdOyjUI3DSXAx1KC+6LulF346DveOKr
	JkZxPCgP8JN3VtGEEzyKSL36w1QFtlo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700009918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zlBf98ARjkQaX/S5kQ5snEY5GoQGl3AvBs2Ts5bz28=;
	b=U9eqYY3BZoF9kYmE5mB4TjKIRnwL4VSDtcntiBkFPAXtR9ilphfbatZ4JnqPoxWjgIWMJf
	XGslX6/WFU1YS1+ClFl9nbtOcJ4qL8TGD4/KVh0tdOyjUI3DSXAx1KC+6LulF346DveOKr
	JkZxPCgP8JN3VtGEEzyKSL36w1QFtlo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-MZ5tl1akPnSAAv4ds1nyfQ-1; Tue, 14 Nov 2023 19:58:35 -0500
X-MC-Unique: MZ5tl1akPnSAAv4ds1nyfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8873B185A781;
	Wed, 15 Nov 2023 00:58:34 +0000 (UTC)
Received: from localhost (unknown [10.72.112.9])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1C892166B26;
	Wed, 15 Nov 2023 00:58:33 +0000 (UTC)
Date: Wed, 15 Nov 2023 08:58:30 +0800
From: Baoquan He <bhe@redhat.com>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/7] kexec_file: add kexec_file flag to control debug
 printing
Message-ID: <ZVQXthHraBBVeNy2@MiWiFi-R3L-srv>
References: <20231114153253.241262-1-bhe@redhat.com>
 <20231114153253.241262-2-bhe@redhat.com>
 <1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/14/23 at 08:03am, Joe Perches wrote:
> On Tue, 2023-11-14 at 23:32 +0800, Baoquan He wrote:
> > When specifying 'kexec -c -d', kexec_load interface will print loading
> > information, e.g the regions where kernel/initrd/purgatory/cmdline
> > are put, the memmap passed to 2nd kernel taken as system RAM ranges,
> > and printing all contents of struct kexec_segment, etc. These are
> > very helpful for analyzing or positioning what's happening when
> > kexec/kdump itself failed. The debugging printing for kexec_load
> > interface is made in user space utility kexec-tools.
> > 
> > Whereas, with kexec_file_load interface, 'kexec -s -d' print nothing.
> > Because kexec_file code is mostly implemented in kernel space, and the
> > debugging printing functionality is missed. It's not convenient when
> > debugging kexec/kdump loading and jumping with kexec_file_load
> > interface.
> > 
> > Now add KEXEC_FILE_DEBUG to kexec_file flag to control the debugging
> > message printing. And add global variable kexec_file_dbg_print and
> > macro kexec_dprintk() to facilitate the printing.
> > 
> > This is a preparation, later kexec_dprintk() will be used to replace the
> > existing pr_debug(). Once 'kexec -s -d' is specified, it will print out
> > kexec/kdump loading information. If '-d' is not specified, it regresses
> > to pr_debug().
> 
> Not quite as pr_debug is completely eliminated with
> zero object size when DEBUG is not #defined.
> 
> Now the object size will be larger and contain the
> formats in .text.

Ah, I didn't realize that. Thanks for telling. I didn't take pr_info()
and pr_debug because I want to avoid printing the pr_fmt() string in
each file.

> 
> []
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> []
> > @@ -264,6 +264,18 @@ arch_kexec_apply_relocations(struct purgatory_info *pi, Elf_Shdr *section,
> >  	return -ENOEXEC;
> >  }
> >  #endif
> > +
> > +extern bool kexec_file_dbg_print;
> > +
> > +#define kexec_dprintk(fmt, args...)			\
> > +	do {						\
> > +		if (kexec_file_dbg_print)		\
> > +			printk(KERN_INFO fmt, ##args);	\
> > +		else					\
> > +			printk(KERN_DEBUG fmt, ##args);	\
> > +	} while (0)
> > +
> > +
> 
> I don't know how many of these printks exist and if
> overall object size matters but using

Not too much because they are spread in different arch.
> 
> #define kexec_dprintkfmt, ...)					\
> 	printk("%s" fmt,					\
> 	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
> 	       ##__VA_ARGS__)
> 
> should reduce overall object size by eliminating the
> mostly duplicated format in .text which differs only
> by the KERN_<PREFIX>

Sure, the new one looks great to me, I will update code to take it.
Thanks a lot for your great suggestion.

Thanks
Baoquan

