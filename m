Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 550EE83B89A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 05:10:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ks4OYw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ks4OYw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TL6n523mfz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 15:10:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ks4OYw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6ks4OYw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TL6mH3Klpz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jan 2024 15:09:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706155785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWkqIM1QddKJmlHq/W4wKL7ORpJYC0uhF5yya8pqsJ8=;
	b=O6ks4OYwwV82b8+wWMrFFs2WA0+XvtT3oqEeN+agtmj5k9miYKiqfksnMO6n9oRdzHk4cd
	u7xZqxVDFpHfAF2HVSieSBN55uJW9knT2FFgTJF8lBtxihfDFyqw7AhhFDFDIcE0pzaUPP
	WBkC7p9EuIQTYd447s71zw8PijEPYkc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706155785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWkqIM1QddKJmlHq/W4wKL7ORpJYC0uhF5yya8pqsJ8=;
	b=O6ks4OYwwV82b8+wWMrFFs2WA0+XvtT3oqEeN+agtmj5k9miYKiqfksnMO6n9oRdzHk4cd
	u7xZqxVDFpHfAF2HVSieSBN55uJW9knT2FFgTJF8lBtxihfDFyqw7AhhFDFDIcE0pzaUPP
	WBkC7p9EuIQTYd447s71zw8PijEPYkc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-AvLrlMuiMWWq7ooKHP2nsQ-1; Wed,
 24 Jan 2024 23:09:41 -0500
X-MC-Unique: AvLrlMuiMWWq7ooKHP2nsQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7936A38143C1;
	Thu, 25 Jan 2024 04:09:40 +0000 (UTC)
Received: from localhost (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71F7F40C1430;
	Thu, 25 Jan 2024 04:09:39 +0000 (UTC)
Date: Thu, 25 Jan 2024 12:09:36 +0800
From: Baoquan He <bhe@redhat.com>
To: Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH linux-next v3 06/14] x86, crash: wrap crash dumping code
 into crash related ifdefs
Message-ID: <ZbHfACpwqi2U9vmK@MiWiFi-R3L-srv>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-7-bhe@redhat.com>
 <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157931105FA68D72E3D3DB8D47B2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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

On 01/24/24 at 11:02pm, Michael Kelley wrote:
> > diff --git a/arch/x86/kernel/cpu/mshyperv.c
> > b/arch/x86/kernel/cpu/mshyperv.c
> > index 01fa06dd06b6..f8163a59026b 100644
> > --- a/arch/x86/kernel/cpu/mshyperv.c
> > +++ b/arch/x86/kernel/cpu/mshyperv.c
> > @@ -210,6 +210,7 @@ static void hv_machine_shutdown(void)
> >  		hyperv_cleanup();
> >  }
> > 
> > +#ifdef CONFIG_CRASH_DUMP
> >  static void hv_machine_crash_shutdown(struct pt_regs *regs)
> >  {
> >  	if (hv_crash_handler)
> > @@ -221,6 +222,7 @@ static void hv_machine_crash_shutdown(struct
> > pt_regs *regs)
> >  	/* Disable the hypercall page when there is only 1 active CPU. */
> >  	hyperv_cleanup();
> >  }
> > +#endif
> >  #endif /* CONFIG_KEXEC_CORE */
> 
> Note that the #ifdef CONFIG_CRASH_DUMP is nested inside
> #ifdef CONFIG_KEXEC_CODE here, and in the other Hyper-V code
> just below.   It's also nested in xen_hvm_guest_init() at the bottom
> of this patch.  But the KVM case of setting crash_shutdown is
> not nested -- you changed #ifdef CONFIG_KEXEC_CORE to #ifdef
> CONFIG_CRASH_DUMP.
> 
> I think both approaches work because CONFIG_CRASH_DUMP implies
> CONFIG_KEXEC_CORE, but I wonder if it would be better to *not* nest
> in all cases.  I'd like to see the cases be consistent so in the future
> someone doesn't wonder why there's a difference (unless there's
> a reason for the difference that I missed).

I agree with you, it's a great suggestion. Thanks.

Do you think below draft patch includes all changes you are concerned
about?

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

