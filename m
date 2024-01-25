Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F206D83BD0F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 10:18:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5hv2Z/4;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5hv2Z/4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLFc96Knlz3cCn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 20:18:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5hv2Z/4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E5hv2Z/4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLFbM4TRQz3bWQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 20:17:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706174252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SDoUkylaVEDmZz6nqfW3ZjNKRZGYGdls3feFdR//5ps=;
	b=E5hv2Z/40goBnQ8rfb/pZezA+FT7u5bkZ6cK8Iu2tm2XSZIcsPnyhBlhqjIJFQg3hj4wKW
	vY/mySs/9CD31puR+sE0g4gHNzPlTxHpgFSoCyo5xXvWbQ+ZGq/qMnL3IcrTR26O4Rupkr
	wt3SujRc82ovEKwzmrCFVC5tnjCU8KI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706174252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SDoUkylaVEDmZz6nqfW3ZjNKRZGYGdls3feFdR//5ps=;
	b=E5hv2Z/40goBnQ8rfb/pZezA+FT7u5bkZ6cK8Iu2tm2XSZIcsPnyhBlhqjIJFQg3hj4wKW
	vY/mySs/9CD31puR+sE0g4gHNzPlTxHpgFSoCyo5xXvWbQ+ZGq/qMnL3IcrTR26O4Rupkr
	wt3SujRc82ovEKwzmrCFVC5tnjCU8KI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-iCprDXE0NJaMkShWq3Qs8Q-1; Thu, 25 Jan 2024 04:17:26 -0500
X-MC-Unique: iCprDXE0NJaMkShWq3Qs8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 701931013682;
	Thu, 25 Jan 2024 09:17:25 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8814F1C060AF;
	Thu, 25 Jan 2024 09:17:24 +0000 (UTC)
Date: Thu, 25 Jan 2024 17:17:21 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Message-ID: <ZbInIQeIoPj6R0kY@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-7-bhe@redhat.com>
 <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
 <ZbHfACpwqi2U9vmK@MiWiFi-R3L-srv>
 <SN6PR02MB4157E138C7EE4A281AB49C10D47A2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157E138C7EE4A281AB49C10D47A2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "piliu@redhat.com" <piliu@redhat.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "hbathini@linux.ibm.com" <hbathini@linux.ibm.com>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01/25/24 at 05:12am, Michael Kelley wrote:
> From: Baoquan He <bhe@redhat.com> Sent: Wednesday, January 24, 2024 8:10 PM
> > 
> > On 01/24/24 at 11:02pm, Michael Kelley wrote:
> > > > diff --git a/arch/x86/kernel/cpu/mshyperv.c
> > > > b/arch/x86/kernel/cpu/mshyperv.c
> > > > index 01fa06dd06b6..f8163a59026b 100644
> > > > --- a/arch/x86/kernel/cpu/mshyperv.c
> > > > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > > > @@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
> > > >  		hyperv_cleanup();
> > > >  }
> > > >
> > > > +#ifdef CONFIG_CRASH_DUMP
> > > >  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> > > >  {
> > > >  	if (hv_crash_handler)
> > > > @@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct pt_regs *regs)
> > > >  	/* Disable the hypercall page when there is only 1 active CPU. */
> > > >  	hyperv_cleanup();
> > > >  }
> > > > +#endif
> > > >  #endif /* CONFIG_KEXEC_CORE */
> > >
> > > Note that the #ifdef CONFIG_CRASH_DUMP is nested inside
> > > #ifdef CONFIG_KEXEC_CODE here, and in the other Hyper-V code
> > > just below.   It's also nested in xen_hvm_guest_init() at the bottom
> > > of this patch.  But the KVM case of setting crash_shutdown is
> > > not nested -- you changed #ifdef CONFIG_KEXEC_CORE to #ifdef
> > > CONFIG_CRASH_DUMP.
> > >
> > > I think both approaches work because CONFIG_CRASH_DUMP implies
> > > CONFIG_KEXEC_CORE, but I wonder if it would be better to *not* nest
> > > in all cases.  I'd like to see the cases be consistent so in the future
> > > someone doesn't wonder why there's a difference (unless there's
> > > a reason for the difference that I missed).
> > 
> > I agree with you, it's a great suggestion. Thanks.
> > 
> > Do you think below draft patch includes all changes you are concerned
> > about?
> 
> Yes, these changes look good as a delta to your original patch.
> 
> But also look at xen_hvm_guest_init().  It looks like your original patch
> does nesting there as well, and it could probably be "un-nested".

Right. I checked them all in arch/x86 this time, hope nothing is missed
again. I can post a v4 to update this x86 patch later if no other
concern. Thanks.

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index f8163a59026b..2e8cd5a4ae85 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -209,6 +209,7 @@ static void hv_machine_shutdown(void)
 	if (kexec_in_progress)
 		hyperv_cleanup();
 }
+#endif /* CONFIG_KEXEC_CORE */
 
 #ifdef CONFIG_CRASH_DUMP
 static void hv_machine_crash_shutdown(struct pt_regs *regs)
@@ -222,8 +223,7 @@ static void hv_machine_crash_shutdown(struct pt_regs *regs)
 	/* Disable the hypercall page when there is only 1 active CPU. */
 	hyperv_cleanup();
 }
-#endif
-#endif /* CONFIG_KEXEC_CORE */
+#endif /* CONFIG_CRASH_DUMP */
 #endif /* CONFIG_HYPERV */
 
 static uint32_t  __init ms_hyperv_platform(void)
@@ -497,9 +497,11 @@ static void __init ms_hyperv_init_platform(void)
 	no_timer_check = 1;
 #endif
 
-#if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
+#if IS_ENABLED(CONFIG_HYPERV)
+#if defined(CONFIG_KEXEC_CORE)
 	machine_ops.shutdown = hv_machine_shutdown;
-#ifdef CONFIG_CRASH_DUMP
+#endif
+#if defined(CONFIG_CRASH_DUMP)
 	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
 #endif
 #endif
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index 1287b0d5962f..f3130f762784 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -826,7 +826,7 @@ void machine_halt(void)
 	machine_ops.halt();
 }
 
-#ifdef CONFIG_KEXEC_CORE
+#ifdef CONFIG_CRASH_DUMP
 void machine_crash_shutdown(struct pt_regs *regs)
 {
 	machine_ops.crash_shutdown(regs);
diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index 09e3db7ff990..0b367c1e086d 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -148,6 +148,7 @@ static void xen_hvm_shutdown(void)
 	if (kexec_in_progress)
 		xen_reboot(SHUTDOWN_soft_reset);
 }
+#endif
 
 #ifdef CONFIG_CRASH_DUMP
 static void xen_hvm_crash_shutdown(struct pt_regs *regs)
@@ -156,7 +157,6 @@ static void xen_hvm_crash_shutdown(struct pt_regs *regs)
 	xen_reboot(SHUTDOWN_soft_reset);
 }
 #endif
-#endif
 
 static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 {
@@ -238,10 +238,10 @@ static void __init xen_hvm_guest_init(void)
 
 #ifdef CONFIG_KEXEC_CORE
 	machine_ops.shutdown = xen_hvm_shutdown;
+#endif
 #ifdef CONFIG_CRASH_DUMP
 	machine_ops.crash_shutdown = xen_hvm_crash_shutdown;
 #endif
-#endif
 }
 
 static __init int xen_parse_nopv(char *arg)

