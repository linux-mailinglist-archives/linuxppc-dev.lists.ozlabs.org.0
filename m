Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A2287A33B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 08:11:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFgXzs6T;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D34peqLy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvhWf2grRz3vbH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 18:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PFgXzs6T;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D34peqLy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvhVv3mRfz3dXD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 18:10:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710313842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z9m0flQIeLqxyKbiwOgkeWggQ2qsLzO5+Pi+cvXBRIU=;
	b=PFgXzs6Ty6Y9myj6R/AWEzbjQn0vx02Jz/6uP7UJfEnOUz/yjCLhmskUZey+sghTsRMloB
	OK2MDYOZKbBzxn3/lYsTgtulGQ+p3GmkouN8462oUz3detGjNd5uqRYMTeU0VR4n4DspX1
	lrnH6ikclh9YAK6X1GAOmy/UfX0I2UU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710313843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z9m0flQIeLqxyKbiwOgkeWggQ2qsLzO5+Pi+cvXBRIU=;
	b=D34peqLyFuoW3Hw6+1SpK1xxAmDGXelGALXz8VBnovglqlumCJTw0FjY5RP/MQylJdVTOF
	gv/nc59+zjrZjbvsrRjYRs93qn3BmueNB3FOvKdDaw/2vbOADXT+UCEREX6d+WRNwuqPqi
	VxizUSejthk9hf58j/FVHSV3sHPWlcQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-A_LvjSnQPMGNLRwzgYbMmA-1; Wed, 13 Mar 2024 03:10:38 -0400
X-MC-Unique: A_LvjSnQPMGNLRwzgYbMmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAF9585A58C;
	Wed, 13 Mar 2024 07:10:37 +0000 (UTC)
Received: from localhost (unknown [10.72.116.13])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B65A2022C1E;
	Wed, 13 Mar 2024 07:10:36 +0000 (UTC)
Date: Wed, 13 Mar 2024 15:10:34 +0800
From: Baoquan He <bhe@redhat.com>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: kexec verbose dumps with 6.8 [was: [PATCH v4 1/7] kexec_file:
 add kexec_file flag to control debug printing]
Message-ID: <ZfFRaoOIgQQY46zD@MiWiFi-R3L-srv>
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-2-bhe@redhat.com>
 <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
 <ZfD37AlznCXJ6P54@MiWiFi-R3L-srv>
 <2f8b1b2d-0abb-43f0-8665-0855928f017c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f8b1b2d-0abb-43f0-8665-0855928f017c@kernel.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
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

On 03/13/24 at 06:58am, Jiri Slaby wrote:
> Hi,
> 
> 
> On 13. 03. 24, 1:48, Baoquan He wrote:
> > Hi Jiri,
> > 
> > On 03/12/24 at 10:58am, Jiri Slaby wrote:
> > > On 13. 12. 23, 6:57, Baoquan He wrote:
> >   ... snip...
> > > > --- a/include/linux/kexec.h
> > > > +++ b/include/linux/kexec.h
> > > ...
> > > > @@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
> > > >    static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
> > > >    #endif
> > > > +extern bool kexec_file_dbg_print;
> > > > +
> > > > +#define kexec_dprintk(fmt, ...)					\
> > > > +	printk("%s" fmt,					\
> > > > +	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
> > > > +	       ##__VA_ARGS__)
> > > 
> > > This means you dump it _always_. Only with different levels.
> > 
> > It dumped always too with pr_debug() before, I just add a switch to
> > control it's pr_info() or pr_debug().
> 
> Not really, see below.
> 
> > > 
> > > And without any prefix whatsoever, so people see bloat like this in their
> > > log now:
> > > [  +0.000001] 0000000000001000-000000000009ffff (1)
> > > [  +0.000002] 000000007f96d000-000000007f97efff (3)
> > > [  +0.000002] 0000000000800000-0000000000807fff (4)
> > > [  +0.000001] 000000000080b000-000000000080bfff (4)
> > > [  +0.000002] 0000000000810000-00000000008fffff (4)
> > > [  +0.000001] 000000007f97f000-000000007f9fefff (4)
> > > [  +0.000001] 000000007ff00000-000000007fffffff (4)
> > > [  +0.000002] 0000000000000000-0000000000000fff (2)
> > 
> > On which arch are you seeing this? There should be one line above these
> > range printing to tell what they are, like:
> > 
> > E820 memmap:
> 
> Ah this is there too. It's a lot of output, so I took it out of context,
> apparently.
> 
> > 0000000000000000-000000000009a3ff (1)
> > 000000000009a400-000000000009ffff (2)
> > 00000000000e0000-00000000000fffff (2)
> > 0000000000100000-000000006ff83fff (1)
> > 000000006ff84000-000000007ac50fff (2)
> 
> It should all be prefixed like kdump: or kexec: in any way.

I can reproduce it now on fedora. OK, I will add kexec or something
similar to prefix. Thanks.

> 
> > > without actually knowing what that is.
> > > 
> > > There should be nothing logged if that is not asked for and especially if
> > > kexec load went fine, right?
> > 
> > Right. Before this patch, those pr_debug() were already there. You need
> > enable them to print out like add '#define DEBUG' in *.c file, or enable
> > the dynamic debugging of the file or function.
> 
> I think it's perfectly fine for DEBUG builds to print this out. And many
> (all major?) distros use dyndbg, so it used to print nothing by default.
> 
> > With this patch applied,
> > you only need specify '-d' when you execute kexec command with
> > kexec_file load interface, like:
> > 
> > kexec -s -l -d /boot/vmlinuz-xxxx.img --initrd xxx.img --reuse-cmdline
> 
> Perhaps our (SUSE) tooling passes -d? But I am seeing this every time I
> boot.
> 
> No, it does not seem so:
> load.sh[915]: Starting kdump kernel load; kexec cmdline: /sbin/kexec -p
> /var/lib/kdump/kernel --append=" loglevel=7 console=tty0 console=ttyS0
> video=1920x1080,1024x768,800x600 oops=panic
> lsm=lockdown,capability,integrity,selinux sysrq=yes reset_devices
> acpi_no_memhotplug cgroup_disable=memory nokaslr numa=off irqpoll nr_cpus=1
> root=kdump rootflags=bind rd.udev.children-max=8 disable_cpu_apicid=0
> panic=1" --initrd=/var/lib/kdump/initrd  -a
> 
> > For kexec_file load, it is not logging if not specifying '-d', unless
> > you take way to make pr_debug() work in that file.
> 
> So is -d detection malfunctioning under some circumstances?
> 
> > > Can this be redesigned, please?
> > 
> > Sure, after making clear what's going on with this, I will try.
> > 
> > > 
> > > Actually what was wrong on the pr_debug()s? Can you simply turn them on from
> > > the kernel when -d is passed to kexec instead of all this?
> > 
> > Joe suggested this during v1 reviewing:
> > https://lore.kernel.org/all/1e7863ec4e4ab10b84fd0e64f30f8464d2e484a3.camel@perches.com/T/#u
> > 
> > > 
> > > ...
> > > > --- a/kernel/kexec_core.c
> > > > +++ b/kernel/kexec_core.c
> > > > @@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
> > > >    /* Flag to indicate we are going to kexec a new kernel */
> > > >    bool kexec_in_progress = false;
> > > > +bool kexec_file_dbg_print;
> > > 
> > > Ugh, and a global flag for this?
> > 
> > Yeah, kexec_file_dbg_print records if '-d' is specified when 'kexec'
> > command executed. Anything wrong with the global flag?
> 
> Global variables are frowned upon. To cite coding style: unless you
> **really** need them. Here, it looks like you do not.

I see your point, will consider and change. Thanks again.

