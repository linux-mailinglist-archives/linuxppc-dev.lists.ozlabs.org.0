Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8554D7C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 04:04:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNlqP1dWtz3drD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 12:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lp/MyymF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lp/MyymF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lp/MyymF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Lp/MyymF;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNlph2D7Bz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 12:04:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655345045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6r1G8PKJO7+Y7DI4HGnIM2AF5wLt599saHsPkMasHA=;
	b=Lp/MyymFGRMEFST7wk9R3p6c2ysUCVTx0NSNEU6CvzJ/SDEDDKOZ5xTGMvA/jvLIZDHl9f
	KPIPe4GTywhi2pqZhgyB0OlPdNirm1cO8lI+6pae2vwa4okdi+Gu/GEepDi6AMnmx3F6pc
	BKWFezqJY/IzJVGM0kmIZNVZGRAHTE0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655345045;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6r1G8PKJO7+Y7DI4HGnIM2AF5wLt599saHsPkMasHA=;
	b=Lp/MyymFGRMEFST7wk9R3p6c2ysUCVTx0NSNEU6CvzJ/SDEDDKOZ5xTGMvA/jvLIZDHl9f
	KPIPe4GTywhi2pqZhgyB0OlPdNirm1cO8lI+6pae2vwa4okdi+Gu/GEepDi6AMnmx3F6pc
	BKWFezqJY/IzJVGM0kmIZNVZGRAHTE0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-vekuOx0TNhespHrQtMhD6g-1; Wed, 15 Jun 2022 22:04:02 -0400
X-MC-Unique: vekuOx0TNhespHrQtMhD6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB4973801149;
	Thu, 16 Jun 2022 02:04:01 +0000 (UTC)
Received: from localhost (ovpn-12-237.pek2.redhat.com [10.72.12.237])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18CFE2166B26;
	Thu, 16 Jun 2022 02:03:57 +0000 (UTC)
Date: Thu, 16 Jun 2022 10:03:53 +0800
From: Baoquan He <bhe@redhat.com>
To: Li Chen <me@linux.beauty>
Subject: Re: [PATCH] kexec: replace crash_mem_range with range
Message-ID: <YqqPiU+tkCh+vXC/@MiWiFi-R3L-srv>
References: <18165bf7271.d72aa7571639569.7041635736718062250@linux.beauty>
MIME-Version: 1.0
In-Reply-To: <18165bf7271.d72aa7571639569.7041635736718062250@linux.beauty>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bhe@redhat.com
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
Cc: kexec <kexec@lists.infradead.org>, Paul Mackerras <paulus@samba.org>, Eric Biederman <ebiederm@xmission.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/14/22 at 10:04pm, Li Chen wrote:
> From: Li Chen <lchen@ambarella.com>
> 
> We already have struct range, so just use it.

Looks good, have you tested it?

> 
> Signed-off-by: Li Chen <lchen@ambarella.com>
> ---
>  arch/powerpc/kexec/file_load_64.c | 2 +-
>  arch/powerpc/kexec/ranges.c       | 8 ++++----
>  include/linux/kexec.h             | 7 ++-----
>  kernel/kexec_file.c               | 2 +-
>  4 files changed, 8 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index b4981b651d9a..583b7fc478f2 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -34,7 +34,7 @@ struct umem_info {
>  
>  	/* usable memory ranges to look up */
>  	unsigned int nr_ranges;
> -	const struct crash_mem_range *ranges;
> +	const struct range *ranges;
>  };
>  
>  const struct kexec_file_ops * const kexec_file_loaders[] = {
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 563e9989a5bf..5fc53a5fcfdf 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -33,7 +33,7 @@
>  static inline unsigned int get_max_nr_ranges(size_t size)
>  {
>  	return ((size - sizeof(struct crash_mem)) /
> -		sizeof(struct crash_mem_range));
> +		sizeof(struct range));
>  }
>  
>  /**
> @@ -51,7 +51,7 @@ static inline size_t get_mem_rngs_size(struct crash_mem *mem_rngs)
>  		return 0;
>  
>  	size = (sizeof(struct crash_mem) +
> -		(mem_rngs->max_nr_ranges * sizeof(struct crash_mem_range)));
> +		(mem_rngs->max_nr_ranges * sizeof(struct range)));
>  
>  	/*
>  	 * Memory is allocated in size multiple of MEM_RANGE_CHUNK_SZ.
> @@ -98,7 +98,7 @@ static int __add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
>   */
>  static void __merge_memory_ranges(struct crash_mem *mem_rngs)
>  {
> -	struct crash_mem_range *ranges;
> +	struct range *ranges;
>  	int i, idx;
>  
>  	if (!mem_rngs)
> @@ -123,7 +123,7 @@ static void __merge_memory_ranges(struct crash_mem *mem_rngs)
>  /* cmp_func_t callback to sort ranges with sort() */
>  static int rngcmp(const void *_x, const void *_y)
>  {
> -	const struct crash_mem_range *x = _x, *y = _y;
> +	const struct range *x = _x, *y = _y;
>  
>  	if (x->start > y->start)
>  		return 1;
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 58d1b58a971e..d7ab4ad4c619 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -17,6 +17,7 @@
>  
>  #include <linux/crash_core.h>
>  #include <asm/io.h>
> +#include <linux/range.h>
>  
>  #include <uapi/linux/kexec.h>
>  
> @@ -214,14 +215,10 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>  /* Alignment required for elf header segment */
>  #define ELF_CORE_HEADER_ALIGN   4096
>  
> -struct crash_mem_range {
> -	u64 start, end;
> -};
> -
>  struct crash_mem {
>  	unsigned int max_nr_ranges;
>  	unsigned int nr_ranges;
> -	struct crash_mem_range ranges[];
> +	struct range ranges[];
>  };
>  
>  extern int crash_exclude_mem_range(struct crash_mem *mem,
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 8347fc158d2b..f2758af86b93 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -1183,7 +1183,7 @@ int crash_exclude_mem_range(struct crash_mem *mem,
>  {
>  	int i, j;
>  	unsigned long long start, end, p_start, p_end;
> -	struct crash_mem_range temp_range = {0, 0};
> +	struct range temp_range = {0, 0};
>  
>  	for (i = 0; i < mem->nr_ranges; i++) {
>  		start = mem->ranges[i].start;
> -- 
> 2.36.1
> 
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

