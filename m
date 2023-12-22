Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3A81C251
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 01:29:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CIMFASL5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sx7TY3Pm5z3cTp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 11:29:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CIMFASL5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sx7Sk0F05z2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 11:28:38 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Sx7Sj31v8z4wbk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 11:28:37 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Sx7Sj2kw3z4wbp; Fri, 22 Dec 2023 11:28:37 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CIMFASL5;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Sx7Sh6RfXz4wbk
	for <linuxppc-dev@ozlabs.org>; Fri, 22 Dec 2023 11:28:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703204912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V469IzZFM/sqWdM4ZH24JLlDB8BfQ7rXz+wlXVI+39A=;
	b=CIMFASL5tVhY406PJmgFqKe7KfAHJ3HKNOQVWdN8rHUjb69a7hTWwBLJ/RvmbcnOWCakn9
	XyWn4ojTQIl/tFXokzNULeeuXyGx9zDQlo3hpsoAkovoAwG4lheR+s6+TH8x9UlMDXyHBd
	Xx1rn6mAGRHxUlA1b1yktTWRhv/x/dA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-l7GbVMzmMVK1MfKz78CCNQ-1; Thu, 21 Dec 2023 19:28:29 -0500
X-MC-Unique: l7GbVMzmMVK1MfKz78CCNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 581E7833945;
	Fri, 22 Dec 2023 00:28:28 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73CE840C6EB9;
	Fri, 22 Dec 2023 00:28:26 +0000 (UTC)
Date: Fri, 22 Dec 2023 08:28:23 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Message-ID: <ZYTYJ6sjdzZwjGpS@MiWiFi-R3L-srv>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
 <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
 <7fe7b62f-d3fc-4035-96fe-1ab0e3e743c0@linux.ibm.com>
 <ZX1wwVlE85FcTxmV@MiWiFi-R3L-srv>
 <67cadf74-6ae6-4f37-8645-af1833b13196@linux.ibm.com>
 <ZX5H+X9Urz8kuiSG@MiWiFi-R3L-srv>
 <cdde877b-e620-45db-ae28-4b691c1ae5b6@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <cdde877b-e620-45db-ae28-4b691c1ae5b6@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, linuxppc-dev@ozlabs.org, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/21/23 at 11:36am, Sourabh Jain wrote:
......
> > > > diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> > > > index 3d5b3d757bed..df6a6505e267 100644
> > > > --- a/include/uapi/linux/kexec.h
> > > > +++ b/include/uapi/linux/kexec.h
> > > > @@ -13,7 +13,7 @@
> > > >    #define KEXEC_ON_CRASH         0x00000001
> > > >    #define KEXEC_PRESERVE_CONTEXT 0x00000002
> > > > -#define KEXEC_UPDATE_FDT       0x00000008
> > > > +#define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
> > > >    #define KEXEC_UPDATE_ELFCOREHDR        0x00000004
> > > >    #define KEXEC_ARCH_MASK                0xffff0000
> > > >    /*
> > > > 
> > > > With my understanding, the kexec flag should be indicating the action,
> > > > the mem/cpu hotplug, but not relating to any detail. Imagine later
> > > > another segment need be skipped on one ARCH again, then another flag
> > > > need be added, this sounds not reasonable.
> > > I strongly agree with you. The KEXEC_CRASH_HOTPLUG_UPDATE kexec flag
> > > should be sufficient to inform the kernel that the kexec tool has been
> > > updated
> > > to support CPU/Memory hotplug for the kexec_load system call. Unfortunately,
> > > we cannot use the 0x00000004 kexec flags bit for KEXEC_CRASH_HOTPLUG_UPDATE
> > > at the moment.
> > I am fine with 0x00000008 and a new flag, it has the same effect as
> > #define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
> > 
> > I am worried about the header file incompatiblity.
> 
> If we are OK to have KEXEC_CRASH_HOTPLUG_UPDATE 0x00000008 as new bit
> to introduce CPU/Memory hotplug feature for kexec_load syscall, we will not
> have
> compatibility issue.
> 
> Let me write next version for this patch with KEXEC_CRASH_HOTPLUG_UPDATE
> 0x00000008
> as new flag bit and show how it will be handled. I will also share kexec
> code for clarity.

It's great we are in the same page about segments excluding done in arch
function. While It's a little unclear to me why we can't reuse 0x00000004
flag value. Then KEXEC_UPDATE_ELFCOREHDR will only exist in v6.6 kernel,
and that bit won't be used in v6.7 and future version.

Except of the existence in kexec-tools utility for XEN, do you see other
barrier? I would like to know so that one day I can explain
KEXEC_UPDATE_ELFCOREHDR to someone else if asked.

