Return-Path: <linuxppc-dev+bounces-1148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 614C397065D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Sep 2024 12:04:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X1lv00lTXz2xdw;
	Sun,  8 Sep 2024 20:04:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725789884;
	cv=none; b=JWe20j+HgRYkvcpFwm3h9h+EaFiOA1TmzqhQQ/6op927N5YnbwToeTSO9Spa13zRnj4xM/FqWLhCrNF3NMFovWyt/fyp6Eo6i9KSsuEubuFJqD2RUeMOHeJRSXcvaqaO33SOVgKTkTaUsDYP5L8ioa1buIUSFwiYhJ+a7fbEdaGFZxJx1pxfXYcaFtkYKLHosXP85WAOg2qDNipqr5/1M4miRZW8JPpW3FvZf5OQbtmrTqWgPRiAU75CJ/hKxB/Eszlr8I9FdVlPVfVxtBY3FO5q6PYEiFbafjItpq0OGRNx71q90IQY9XthGonTumbaB10uuG1CbGWlQBwTURhrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725789884; c=relaxed/relaxed;
	bh=H4s6L1b6UTWwXIgN+h2ZkyoLWzDj1bmp+8k4owaes3c=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=NQxpTDrJhXu0KhYyhJLl2AXlsGIX33WEgpBmn7qwHKXg6E44bcrmO3vROdMLccfnZAcTcWt6fLTGxVyLMp+Ht9cZluJTqJtMsR7GFs2mSJrK/VfQ6r6XiJyfIv2/e15Wfjz9l0bcWIM5yQNY/JpDz5UOAAIca3syUsNgcQMOlHMRMLEeTvVf3tbalx8xOuAq9gtfTaWUAMIcv1CXiDwvki7SYNAwfhtUia7evPSr0WBQm6HGssL9Qhl1yPeLsvAJFAoMcK5Ix9YGde3ojXpY+JmMBCK22Etk4xJsSvE1mgCcMMdSneEmVwV1+oDpVOvzOje3kDT+GeJpgzb8/EEP/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iVBtGwtW; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D956TBb0; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iVBtGwtW;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D956TBb0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1ltz3Vqtz2xdX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 20:04:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725789874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H4s6L1b6UTWwXIgN+h2ZkyoLWzDj1bmp+8k4owaes3c=;
	b=iVBtGwtWbb4Kkn21lpzGdFNEvsa69oO5hMK6ywJ8P+qY1duIH7KenQWo/+Y+SW4r/o4ZyI
	I4JVSSCKFjrYEWrPRx38SH+mlgZprRtx7NK/26CVg0tksznBVZlsXiovUWHu6cfKa/xNXz
	JsgHLlNdoiA1eAm5eBaCPo/5RfxnKk4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725789875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H4s6L1b6UTWwXIgN+h2ZkyoLWzDj1bmp+8k4owaes3c=;
	b=D956TBb0VP/dRX/fTJZU8iMhtg1h8plDz2sGZajzobdWrZ/0AhL/nbD3q4/5D5DaGKsswR
	FHNJOs0uoSCerD4Q719euW6oMLDfJKw8UujmdV7zpEz0K4+84I6Ybh+QYl3XxSqLIz9Z+t
	SdraCfgE/VoSB/OUTVbRYc6YpPDdfQU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-ADwoEIdTNxK39xifeSiilQ-1; Sun,
 08 Sep 2024 06:04:33 -0400
X-MC-Unique: ADwoEIdTNxK39xifeSiilQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1466119560AB;
	Sun,  8 Sep 2024 10:04:31 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E6D951956048;
	Sun,  8 Sep 2024 10:04:28 +0000 (UTC)
Date: Sun, 8 Sep 2024 18:04:23 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>, kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH] [RFC] crash: Lock-free crash hotplug support reporting
Message-ID: <Zt12p/eOCO0D5/e6@MiWiFi-R3L-srv>
References: <20240823115226.835865-1-sourabhjain@linux.ibm.com>
 <641be54a-440f-475b-a62d-fac157ecbbcb@linux.ibm.com>
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
In-Reply-To: <641be54a-440f-475b-a62d-fac157ecbbcb@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/07/24 at 10:30am, Sourabh Jain wrote:
> Hello Baoquan,
> 
> Do you think this patch would help reduce lock contention when
> CPU/Memory resources are removed in bulk from a system?
.....snip...
--
> >   include/linux/kexec.h | 11 ++++-------
> >   kernel/crash_core.c   | 27 +++++++++------------------
> >   kernel/kexec.c        |  5 ++++-
> >   kernel/kexec_file.c   |  7 ++++++-
> >   4 files changed, 23 insertions(+), 27 deletions(-)
> > 
> > diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> > index f0e9f8eda7a3..bd755ba6bac4 100644
> > --- a/include/linux/kexec.h
> > +++ b/include/linux/kexec.h
> > @@ -318,13 +318,6 @@ struct kimage {
> >   	unsigned int preserve_context : 1;
> >   	/* If set, we are using file mode kexec syscall */
> >   	unsigned int file_mode:1;
> > -#ifdef CONFIG_CRASH_HOTPLUG
> > -	/* If set, it is safe to update kexec segments that are
> > -	 * excluded from SHA calculation.
> > -	 */
> > -	unsigned int hotplug_support:1;
> > -#endif
> > -
> >   #ifdef ARCH_HAS_KIMAGE_ARCH
> >   	struct kimage_arch arch;
> >   #endif
> > @@ -370,6 +363,10 @@ struct kimage {
> >   	unsigned long elf_load_addr;
> >   };
> > +#ifdef CONFIG_CRASH_HOTPLUG
> > +extern unsigned int crash_hotplug_support;
> > +#endif
> > +
> >   /* kexec interface functions */
> >   extern void machine_kexec(struct kimage *image);
> >   extern int machine_kexec_prepare(struct kimage *image);
> > diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> > index 63cf89393c6e..3428deba0070 100644
> > --- a/kernel/crash_core.c
> > +++ b/kernel/crash_core.c
> > @@ -30,6 +30,13 @@
> >   #include "kallsyms_internal.h"
> >   #include "kexec_internal.h"
> > +#ifdef CONFIG_CRASH_HOTPLUG
> > +/* if set, it is safe to update kexec segments that are
> > + * excluded from sha calculation.
> > + */
> > +unsigned int crash_hotplug_support;
> > +#endif
> > +
> >   /* Per cpu memory for storing cpu states in case of system crash. */
> >   note_buf_t __percpu *crash_notes;
> > @@ -500,23 +507,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
> >    */
> >   int crash_check_hotplug_support(void)
> >   {
> > -	int rc = 0;
> > -
> > -	crash_hotplug_lock();
> > -	/* Obtain lock while reading crash information */
> > -	if (!kexec_trylock()) {
> > -		pr_info("kexec_trylock() failed, elfcorehdr may be inaccurate\n");
> > -		crash_hotplug_unlock();
> > -		return 0;
> > -	}
> > -	if (kexec_crash_image) {
> > -		rc = kexec_crash_image->hotplug_support;
> > -	}
> > -	/* Release lock now that update complete */
> > -	kexec_unlock();
> > -	crash_hotplug_unlock();
> > -
> > -	return rc;
> > +	return crash_hotplug_support;


I may not understand this well. Both kexec_load and kexec_file_load set
hotplug_support, crash_check_hotplug_support and
crash_handle_hotplug_event are to check the flag. How do you guarantee
the cpu/memory sysfs checking won't have race with kexec_load and
kexec_file_load?

And here I see taking crash_hotplug_lock() is unnecessary in
crash_check_hotplug_support() because it does't have race with
crash_handle_hotplug_event().

> >   }
> >   /*
> > @@ -552,7 +543,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
> >   	image = kexec_crash_image;
> >   	/* Check that kexec segments update is permitted */
> > -	if (!image->hotplug_support)
> > +	if (!crash_hotplug_support)
> >   		goto out;
> >   	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
> > diff --git a/kernel/kexec.c b/kernel/kexec.c
> > index a6b3f96bb50c..d5c6b51eaa8b 100644
> > --- a/kernel/kexec.c
> > +++ b/kernel/kexec.c
> > @@ -116,6 +116,9 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> >   		/* Uninstall image */
> >   		kimage_free(xchg(dest_image, NULL));
> >   		ret = 0;
> > +#ifdef CONFIG_CRASH_HOTPLUG
> > +		crash_hotplug_support = 0;
> > +#endif
> >   		goto out_unlock;
> >   	}
> >   	if (flags & KEXEC_ON_CRASH) {
> > @@ -136,7 +139,7 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
> >   #ifdef CONFIG_CRASH_HOTPLUG
> >   	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> > -		image->hotplug_support = 1;
> > +		crash_hotplug_support = 1;
> >   #endif
> >   	ret = machine_kexec_prepare(image);
> > diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> > index 3d64290d24c9..b326edb90fd7 100644
> > --- a/kernel/kexec_file.c
> > +++ b/kernel/kexec_file.c
> > @@ -378,7 +378,7 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >   #ifdef CONFIG_CRASH_HOTPLUG
> >   	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
> > -		image->hotplug_support = 1;
> > +		crash_hotplug_support = 1;
> >   #endif
> >   	ret = machine_kexec_prepare(image);
> > @@ -432,6 +432,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
> >   		arch_kexec_protect_crashkres();
> >   #endif
> > +#ifdef CONFIG_CRASH_HOTPLUG
> > +	if (flags & KEXEC_FILE_UNLOAD)
> > +		crash_hotplug_support = 0;
> > +#endif
> > +
> >   	kexec_unlock();
> >   	kimage_free(image);
> >   	return ret;
> 


