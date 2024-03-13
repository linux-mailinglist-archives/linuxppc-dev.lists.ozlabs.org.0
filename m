Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D141587A048
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 01:49:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRXf3oNH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRXf3oNH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvX304q3Cz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 11:49:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRXf3oNH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KRXf3oNH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvX2H6rzhz3bc2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 11:48:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710290932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/I7rfb7fSwv9EVlLwLZyE6cq/I2crR3JWNIky7ODFU=;
	b=KRXf3oNHfW5pPTXAbQSWjcvpu4V6AWBJRgA56IPubQAdI8QlwwcxRUuwAGPxpUpIJ1ILV4
	MKfjcCwtYh5VcrzsQs7I0PkDhEXnwDRJfTb6/R6N+JPslndAMsz6kWgDXFv369ZB5Rb+Ez
	/eMTNg3KDdMUtPdJfYzDVIn88lfWSwA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710290932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/I7rfb7fSwv9EVlLwLZyE6cq/I2crR3JWNIky7ODFU=;
	b=KRXf3oNHfW5pPTXAbQSWjcvpu4V6AWBJRgA56IPubQAdI8QlwwcxRUuwAGPxpUpIJ1ILV4
	MKfjcCwtYh5VcrzsQs7I0PkDhEXnwDRJfTb6/R6N+JPslndAMsz6kWgDXFv369ZB5Rb+Ez
	/eMTNg3KDdMUtPdJfYzDVIn88lfWSwA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Tx39TiVcPDK1NGuCqWNU_g-1; Tue, 12 Mar 2024 20:48:48 -0400
X-MC-Unique: Tx39TiVcPDK1NGuCqWNU_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAF58800262;
	Wed, 13 Mar 2024 00:48:47 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F7510E47;
	Wed, 13 Mar 2024 00:48:46 +0000 (UTC)
Date: Wed, 13 Mar 2024 08:48:44 +0800
From: Baoquan He <bhe@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: kexec verbose dumps with 6.8 [was: [PATCH v4 1/7] kexec_file:
 add kexec_file flag to control debug printing]
Message-ID: <ZfD37AlznCXJ6P54@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-2-bhe@redhat.com>
 <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, conor@kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jiri,

On 03/12/24 at 10:58am, Jiri Slaby wrote:
> On 13. 12. 23, 6:57, Baoquan He wrote:
 ... snip...
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> ...
> > @@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
> >   static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
> >   #endif
> > +extern bool kexec_file_dbg_print;
> > +
> > +#define kexec_dprintk(fmt, ...)					\
> > +	printk("%s" fmt,					\
> > +	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
> > +	       ##__VA_ARGS__)
> 
> This means you dump it _always_. Only with different levels.

It dumped always too with pr_debug() before, I just add a switch to
control it's pr_info() or pr_debug().

> 
> And without any prefix whatsoever, so people see bloat like this in their
> log now:
> [  +0.000001] 0000000000001000-000000000009ffff (1)
> [  +0.000002] 000000007f96d000-000000007f97efff (3)
> [  +0.000002] 0000000000800000-0000000000807fff (4)
> [  +0.000001] 000000000080b000-000000000080bfff (4)
> [  +0.000002] 0000000000810000-00000000008fffff (4)
> [  +0.000001] 000000007f97f000-000000007f9fefff (4)
> [  +0.000001] 000000007ff00000-000000007fffffff (4)
> [  +0.000002] 0000000000000000-0000000000000fff (2)

On which arch are you seeing this? There should be one line above these
range printing to tell what they are, like:

E820 memmap:
0000000000000000-000000000009a3ff (1)
000000000009a400-000000000009ffff (2)
00000000000e0000-00000000000fffff (2)
0000000000100000-000000006ff83fff (1)
000000006ff84000-000000007ac50fff (2)

> 
> without actually knowing what that is.
> 
> There should be nothing logged if that is not asked for and especially if
> kexec load went fine, right?

Right. Before this patch, those pr_debug() were already there. You need
enable them to print out like add '#define DEBUG' in *.c file, or enable
the dynamic debugging of the file or function. With this patch applied,
you only need specify '-d' when you execute kexec command with
kexec_file load interface, like:

kexec -s -l -d /boot/vmlinuz-xxxx.img --initrd xxx.img --reuse-cmdline

For kexec_file load, it is not logging if not specifying '-d', unless
you take way to make pr_debug() work in that file.

> 
> Can this be redesigned, please?

Sure, after making clear what's going on with this, I will try.

> 
> Actually what was wrong on the pr_debug()s? Can you simply turn them on from
> the kernel when -d is passed to kexec instead of all this?

Joe suggested this during v1 reviewing:
https://lore.kernel.org/all/1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com/T/#u

> 
> ...
> > --- a/kernel/kexec_core.c
> > +++ b/kernel/kexec_core.c
> > @@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
> >   /* Flag to indicate we are going to kexec a new kernel */
> >   bool kexec_in_progress = false;
> > +bool kexec_file_dbg_print;
> 
> Ugh, and a global flag for this?

Yeah, kexec_file_dbg_print records if '-d' is specified when 'kexec'
command executed. Anything wrong with the global flag?

Thanks
Baoquan

