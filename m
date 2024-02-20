Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736E85BDA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 14:51:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qrzm067k;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qrzm067k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfLRF32XMz3d2K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 00:51:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qrzm067k;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qrzm067k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfLQV23JYz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 00:50:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708437036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GAc6rry3Nc1ghTKhHNX98UJdceAOZ+259mLdb94DPrE=;
	b=Qrzm067kLWDhKC8o16hwbcIVFHyS31MJiBcsK9Cgf7hIOqXvXoabuyU17u3m7NTIia6RTE
	nKoeycSgqC5nnDh3lZN8KcVp6ZbeE65bihV5NIXEPB+D6rtdQ+GGsVZHXJiSaOGTNPWQDI
	pehkMTJ2H3zKuEuGXxmFtSKlUcEat6I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708437036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GAc6rry3Nc1ghTKhHNX98UJdceAOZ+259mLdb94DPrE=;
	b=Qrzm067kLWDhKC8o16hwbcIVFHyS31MJiBcsK9Cgf7hIOqXvXoabuyU17u3m7NTIia6RTE
	nKoeycSgqC5nnDh3lZN8KcVp6ZbeE65bihV5NIXEPB+D6rtdQ+GGsVZHXJiSaOGTNPWQDI
	pehkMTJ2H3zKuEuGXxmFtSKlUcEat6I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-wGfgPk9mM22_nJxY97dI-w-1; Tue, 20 Feb 2024 08:50:32 -0500
X-MC-Unique: wGfgPk9mM22_nJxY97dI-w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B54D185A782;
	Tue, 20 Feb 2024 13:50:32 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3E25C185C3;
	Tue, 20 Feb 2024 13:50:29 +0000 (UTC)
Date: Tue, 20 Feb 2024 21:50:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH linux-next 1/3] kexec/kdump: make struct crash_mem
 available without CONFIG_CRASH_DUMP
Message-ID: <ZdSuIjknfxg22VSF@MiWiFi-R3L-srv>
References: <20240213113150.1148276-1-hbathini@linux.ibm.com>
 <20240213113150.1148276-2-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213113150.1148276-2-hbathini@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: Dave Young <dyoung@redhat.com>, Kexec-ml <kexec@lists.infradead.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/13/24 at 05:01pm, Hari Bathini wrote:
> struct crash_mem defined under include/linux/crash_core.h represents
> a list of memory ranges. While it is used to represent memory ranges

From its name, it's not only representing memory ranges, it's
representing crash memory ranges. Except of this, the whole series looks
good to me. Thanks for the effort.

> for kdump kernel, it can also be used for other kind of memory ranges.
> In fact, KEXEC_FILE_LOAD syscall in powerpc uses this structure to
> represent reserved memory ranges and exclude memory ranges needed to
> find the right memory regions to load kexec kernel. So, make the
> definition of crash_mem structure available for !CONFIG_CRASH_DUMP
> case too.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
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
> 2.43.0
> 

