Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B636F815CE6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 02:00:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9f4CUyl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4St4Pw34lmz30fm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 12:00:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9f4CUyl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4St4P30qzwz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 11:59:51 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4St4P24tR1z4wcj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 11:59:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4St4P24hTTz4xMw; Sun, 17 Dec 2023 11:59:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=L9f4CUyl;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4St4P21Prqz4wcj
	for <linuxppc-dev@ozlabs.org>; Sun, 17 Dec 2023 11:59:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702774786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e3W8IdVtRVYl/cWXGwTDHsX4RheWcnk0i0WUNsOEb6A=;
	b=L9f4CUyl+8gr8y7RLzInFzXm4RqLppoKlXMn0j+dpqfA52D+BhqPjRUrRkz/d7GB3P+Bf3
	mycxKuTLUHfO0XicSLzGuZ6jHPAQMqEt0bXJ1uRfFpvvbQMX+EZ53rs7eJj3jkkck/i5bV
	8JdN89ZAybm33NXeHRYB1B5lSEJdCmc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-Zb8uzx3TPaeqYZIBw01yWw-1; Sat, 16 Dec 2023 19:59:43 -0500
X-MC-Unique: Zb8uzx3TPaeqYZIBw01yWw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ED40101A52A;
	Sun, 17 Dec 2023 00:59:42 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7773E2026D66;
	Sun, 17 Dec 2023 00:59:40 +0000 (UTC)
Date: Sun, 17 Dec 2023 08:59:37 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Message-ID: <ZX5H+X9Urz8kuiSG@MiWiFi-R3L-srv>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
 <20231211083056.340404-4-sourabhjain@linux.ibm.com>
 <ZXu55ZXVSMeQDE/e@MiWiFi-R3L-srv>
 <7fe7b62f-d3fc-4035-96fe-1ab0e3e743c0@linux.ibm.com>
 <ZX1wwVlE85FcTxmV@MiWiFi-R3L-srv>
 <67cadf74-6ae6-4f37-8645-af1833b13196@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <67cadf74-6ae6-4f37-8645-af1833b13196@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On 12/17/23 at 12:27am, Sourabh Jain wrote:
> 
> 
> On 16/12/23 15:11, Baoquan He wrote:
> > On 12/15/23 at 12:17pm, Sourabh Jain wrote:
> > ......
> > > > > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > > > > index 0f6ea35879ee..bcedb7625b1f 100644
> > > > > --- a/include/linux/kexec.h
> > > > > +++ b/include/linux/kexec.h
> > > > > @@ -319,6 +319,7 @@ struct kimage {
> > > > >    #ifdef CONFIG_CRASH_HOTPLUG
> > > > >    	/* If set, allow changes to elfcorehdr of kexec_load'd image */
> > > > >    	unsigned int update_elfcorehdr:1;
> > > > > +	unsigned int update_fdt:1;
> > > > Can we unify this to one flag, e.g hotplug_update?
> > > > 
> > > > With this, on x86_64, we will skip the sha calculation for elfcorehdr.
> > > > On ppc, we will skip the sha calculation for elfcorehdr and fdt.
> > > Yeah, that's what I suggested to Eric. I can do that, but I see one
> > > problem with powerpc or other platforms that need to skip SHA
> > > for more kexec segments in addition to elfcorehdr.
> > > 
> > > `update_elfcorehdr` is set when the kexec tool sends the
> > > `KEXEC_UPDATE_ELFCOREHDR`
> > > flag to the kernel for the `kexec_load` system call.
> > > 
> > > Given that the kexec tool has already been updated to send the
> > > `KEXEC_UPDATE_ELFCOREHDR` flag only when elfcorehdr is skipped from
> > > SHA verification in generic code, now it would be tricky for architectures
> > > to
> > > determine whether kexec has skipped SHA verification for just elfcorehdr
> > > or all segments needed on the platform with the same flag.
> > In kexec-tools, it's judged by do_hotplug to skip the elfcorehdr
> > segment. I am wondering how you skip the fdt segment when calculating
> > and verifying sha, only saw the update_fdt mark.
> 
> In the kexec tool where we loop through all the kexec segments to calculate
> the SHA, there will be a arch call made to determine whether the segment
> needs
> to be excluded from SHA or not.

OK, a arch call will be added to exclude segments in the ARCH. And the
elfcorehdr segment need be excluded in x86 ARCH in case other ARCH later
may not want to exclude elfcorehdr.

> 
> Now in the arch function if decide a specific segment needs to excluded then
> corresponding flag is also set by arch function to communicate same with the
> kernel.

But I don't see how you exclude elfcorehdr and fdt in kernel for
kexec_file codes. It's not happening in kexec-tools.

> 
> > 
> > About the existing KEXEC_UPDATE_ELFCOREHDR, we only rename the macro,
> > but still use the same value, could you think of what problem could be
> > caused between kernel and kexec-tools utility, the old and new version
> > compatibility?
> 
> Just changing the macro name will NOT help because the current kexec tool
> enables the KEXEC_UPDATE_ELFCOREHDR = 0x00000004 kexec flag bit
> if
> the command argument --hotplug is passed to the kexec
> and
> the /sys/kernel/crash_elfcorehdr_size file exists in the system.

As we have discussed, excluding will be done in each ARCH's function
when doing sha calculation in kexec-tools, isn't it?

diff --git a/kexec/kexec.c b/kexec/kexec.c
index b5393e3b20aa..0095aeec988a 100644
--- a/kexec/kexec.c
+++ b/kexec/kexec.c
@@ -701,10 +701,10 @@ static void update_purgatory(struct kexec_info *info)
 			continue;
 		}
 
-		/* Don't include elfcorehdr in the checksum, if hotplug
+		/* Don't include unwanted segments in the checksum, if hotplug
 		 * support enabled.
-		 */
-		if (do_hotplug && (info->segment[i].mem == (void *)info->elfcorehdr)) {
+		if (do_hotplug)
+			arch_exclude_segments(info, &i)
 			continue;
 		}
 

> 
> Now, let's say an architecture enables this feature in the kernel with the
> assumption
> that the 0x00000004 kexec flag bit is passed from the kexec tool when all
> the required
> kexec segments are skipped from SHA calculation. In this case, the current
> kexec tool,
> which passes the 0x00000004 kexec flag bit only when the elfcorehdr is
> skipped, will
> cause issues for architectures.
> 
> > 
> > If it's about the new header files installed on older kernel, we can
> > change it like below? Fortunately only one release, 6.6 passed.
> > 
> > diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> > index 3d5b3d757bed..df6a6505e267 100644
> > --- a/include/uapi/linux/kexec.h
> > +++ b/include/uapi/linux/kexec.h
> > @@ -13,7 +13,7 @@
> >   #define KEXEC_ON_CRASH         0x00000001
> >   #define KEXEC_PRESERVE_CONTEXT 0x00000002
> > -#define KEXEC_UPDATE_FDT       0x00000008
> > +#define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004
> >   #define KEXEC_UPDATE_ELFCOREHDR        0x00000004
> >   #define KEXEC_ARCH_MASK                0xffff0000
> >   /*
> > 
> > With my understanding, the kexec flag should be indicating the action,
> > the mem/cpu hotplug, but not relating to any detail. Imagine later
> > another segment need be skipped on one ARCH again, then another flag
> > need be added, this sounds not reasonable.
> I strongly agree with you. The KEXEC_CRASH_HOTPLUG_UPDATE kexec flag
> should be sufficient to inform the kernel that the kexec tool has been
> updated
> to support CPU/Memory hotplug for the kexec_load system call. Unfortunately,
> we cannot use the 0x00000004 kexec flags bit for KEXEC_CRASH_HOTPLUG_UPDATE
> at the moment.

I am fine with 0x00000008 and a new flag, it has the same effect as 
#define KEXEC_CRASH_HOTPLUG_UPDATE 0x00000004

I am worried about the header file incompatiblity.

> 
> What about using 0x00000008 for the KEXEC_CRASH_HOTPLUG_UPDATE flag?
> 
> I am aware that we are utilizing two kexec flag bits (0x00000004 and
> 0x00000008)
> for the same feature, but what other options do we have?
> 
> Thanks,
> Sourabh
> > > Code snippet from the kexec tool:
> > > 
> > > main() {
> > >      ...
> > >      /* NOTE: Xen KEXEC_LIVE_UPDATE and KEXEC_UPDATE_ELFCOREHDR collide */
> > >      if (do_hotplug) {
> > >          ...
> > > 
> > >          /* Indicate to the kernel it is ok to modify the elfcorehdr */
> > >          kexec_flags |= KEXEC_UPDATE_ELFCOREHDR;
> > >      }
> > >      ...
> > > }
> > > 
> > > Any suggestion how to handle this with just one kexec flag?
> > > 
> > > Thanks for the review.
> > > 
> > > Thanks,
> > > Sourabh Jain
> > > 
> > > > >    #endif
> > > > >    #ifdef ARCH_HAS_KIMAGE_ARCH
> > > > > @@ -396,9 +397,10 @@ bool kexec_load_permitted(int kexec_image_type);
> > > > >    /* List of defined/legal kexec flags */
> > > > >    #ifndef CONFIG_KEXEC_JUMP
> > > > > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
> > > > > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_UPDATE_FDT)
> > > > >    #else
> > > > > -#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
> > > > > +#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
> > > > > +			KEXEC_UPDATE_FDT)
> > > > >    #endif
> > > > >    /* List of defined/legal kexec file flags */
> > > > > diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> > > > > index 01766dd839b0..3d5b3d757bed 100644
> > > > > --- a/include/uapi/linux/kexec.h
> > > > > +++ b/include/uapi/linux/kexec.h
> > > > > @@ -13,6 +13,7 @@
> > > > >    #define KEXEC_ON_CRASH		0x00000001
> > > > >    #define KEXEC_PRESERVE_CONTEXT	0x00000002
> > > > >    #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
> > > > > +#define KEXEC_UPDATE_FDT	0x00000008
> > > > >    #define KEXEC_ARCH_MASK		0xffff0000
> > > > >    /*
> > > > > diff --git a/kernel/kexec.c b/kernel/kexec.c
> > > > > index 8f35a5a42af8..97eb151cd931 100644
> > > > > --- a/kernel/kexec.c
> > > > > +++ b/kernel/kexec.c
> > > > > @@ -132,6 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> > > > >    #ifdef CONFIG_CRASH_HOTPLUG
> > > > >    	if (flags & KEXEC_UPDATE_ELFCOREHDR)
> > > > >    		image->update_elfcorehdr = 1;
> > > > > +	if (flags & KEXEC_UPDATE_FDT)
> > > > > +		image->update_fdt = 1;
> > > > >    #endif
> > > > >    	ret = machine_kexec_prepare(image);
> > > > > -- 
> > > > > 2.41.0
> > > > > 
> 

