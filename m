Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86752868E17
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 11:54:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DqQp1fsY;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DqQp1fsY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkZ9K19Fsz3dVB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 21:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DqQp1fsY;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DqQp1fsY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkZ8Y4WMwz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 21:53:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709031193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/R0zYYMzMrd102J3JgHM4IsC1fahdOwS+2IaXy3PeY=;
	b=DqQp1fsYQXx1Ps65gJDZ4VtMIEJYfFgekbn7c6xRxaf3SGpu9MhLgmxD6kTo45k8yYUR3t
	SL5DLjHejfxWzzvw02skR8IjVeKv3V0Q2zue4IsXQ38y7htP8RYYxzdzNIL2OxFphTfhPB
	24PhEVXsECTJ5xxIl3EAZH6tHYtd4h0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709031193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1/R0zYYMzMrd102J3JgHM4IsC1fahdOwS+2IaXy3PeY=;
	b=DqQp1fsYQXx1Ps65gJDZ4VtMIEJYfFgekbn7c6xRxaf3SGpu9MhLgmxD6kTo45k8yYUR3t
	SL5DLjHejfxWzzvw02skR8IjVeKv3V0Q2zue4IsXQ38y7htP8RYYxzdzNIL2OxFphTfhPB
	24PhEVXsECTJ5xxIl3EAZH6tHYtd4h0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-3FvsOudxP5y2P_M0yYeEmA-1; Tue,
 27 Feb 2024 05:53:06 -0500
X-MC-Unique: 3FvsOudxP5y2P_M0yYeEmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A73F33C1E9C4;
	Tue, 27 Feb 2024 10:53:05 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74B271C06713;
	Tue, 27 Feb 2024 10:53:01 +0000 (UTC)
Date: Tue, 27 Feb 2024 18:52:57 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH linux-next v2 1/3] kexec/kdump: make struct crash_mem
 available without CONFIG_CRASH_DUMP
Message-ID: <Zd2/CRHtB4kETwtp@MiWiFi-R3L-srv>
References: <20240226103010.589537-1-hbathini@linux.ibm.com>
 <20240226103010.589537-2-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226103010.589537-2-hbathini@linux.ibm.com>
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
Cc: Dave Young <dyoung@redhat.com>, Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/26/24 at 04:00pm, Hari Bathini wrote:
> struct crash_mem defined under include/linux/crash_core.h represents
> a list of memory ranges. While it is used to represent memory ranges
> for kdump kernel, it can also be used for other kind of memory ranges.
> In fact, KEXEC_FILE_LOAD syscall in powerpc uses this structure to
> represent reserved memory ranges and exclude memory ranges needed to
> find the right memory regions to load kexec kernel. So, make the

We may be able to refactor code to make struct crash_mem only used for
crash handling, or get another data structure for loading kexec kernel.
Anyway, for the time being, this is the simplest way we can take. Thanks
for the work on ppc to make crash split out from the kexec code.

Acked-by: Baoquan He <bhe@redhat.com>

> definition of crash_mem structure available for !CONFIG_CRASH_DUMP
> case too.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> * No changes in v2.
> 
>  include/linux/crash_core.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index 23270b16e1db..d33352c2e386 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -8,6 +8,12 @@
>  
>  struct kimage;
>  
> +struct crash_mem {
> +	unsigned int max_nr_ranges;
> +	unsigned int nr_ranges;
> +	struct range ranges[] __counted_by(max_nr_ranges);
> +};
> +
>  #ifdef CONFIG_CRASH_DUMP
>  
>  int crash_shrink_memory(unsigned long new_size);
> @@ -51,12 +57,6 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>  /* Alignment required for elf header segment */
>  #define ELF_CORE_HEADER_ALIGN   4096
>  
> -struct crash_mem {
> -	unsigned int max_nr_ranges;
> -	unsigned int nr_ranges;
> -	struct range ranges[] __counted_by(max_nr_ranges);
> -};
> -
>  extern int crash_exclude_mem_range(struct crash_mem *mem,
>  				   unsigned long long mstart,
>  				   unsigned long long mend);
> -- 
> 2.43.2
> 

