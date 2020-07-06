Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDF21545B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 11:08:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0frN2td6zDqYM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 19:08:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0fpq4mVXzDqXP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 19:07:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Y7psF8sm; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B0fpq49M7z8tWg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 19:07:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B0fpq3nP1z9sSd; Mon,  6 Jul 2020 19:07:31 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=dyoung@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Y7psF8sm; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B0fpp6y6Qz9sSn
 for <linuxppc-dev@ozlabs.org>; Mon,  6 Jul 2020 19:07:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594026445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SShJmXGA7atFqGfnITwSEtZ2LmnJMbZjAOdugmKURLE=;
 b=Y7psF8smG7XWsqqJ+CygKBMKRHELM9S0LoWnhlwyTILY6NLe3swpKJv20F66V7JnVrb11q
 aR5uWlp9QKdZ6BbWS72+osgU2Gstf1+LM6rYXMUOlFakYgDQtXRfBdvu4O7V1XSKE8eRu6
 xvcBQxJMOoap9QUXSuzgXYYTei7dxgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Zi_68QkjPGSL8uxCZHp9gw-1; Mon, 06 Jul 2020 05:07:20 -0400
X-MC-Unique: Zi_68QkjPGSL8uxCZHp9gw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5970118A0724;
 Mon,  6 Jul 2020 09:07:18 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-78.pek2.redhat.com
 [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A26BD60BF3;
 Mon,  6 Jul 2020 09:07:10 +0000 (UTC)
Date: Mon, 6 Jul 2020 17:07:07 +0800
From: Dave Young <dyoung@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2 01/12] kexec_file: allow archs to handle special
 regions while locating memory hole
Message-ID: <20200706090707.GA9048@dhcp-128-65.nay.redhat.com>
References: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
 <159371964681.21555.573193508667543223.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159371964681.21555.573193508667543223.stgit@hbathini.in.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vivek Goyal <vgoyal@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/03/20 at 01:24am, Hari Bathini wrote:
> Some architectures may have special memory regions, within the given
> memory range, which can't be used for the buffer in a kexec segment.
> Implement weak arch_kexec_locate_mem_hole() definition which arch code
> may override, to take care of special regions, while trying to locate
> a memory hole.
> 
> Also, add the missing declarations for arch overridable functions and
> and drop the __weak descriptors in the declarations to avoid non-weak
> definitions from becoming weak.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> [lkp: In v1, arch_kimage_file_post_load_cleanup() declaration was missing]
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
> 
> Changes in v2:
> * Introduced arch_kexec_locate_mem_hole() for override and dropped
>   weak arch_kexec_add_buffer().
> * Dropped __weak identifier for arch overridable functions.
> * Fixed the missing declaration for arch_kimage_file_post_load_cleanup()
>   reported by lkp. lkp report for reference:
>     - https://lore.kernel.org/patchwork/patch/1264418/
> 
> 
>  include/linux/kexec.h |   29 ++++++++++++++++++-----------
>  kernel/kexec_file.c   |   16 ++++++++++++++--
>  2 files changed, 32 insertions(+), 13 deletions(-)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index ea67910..9e93bef 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -183,17 +183,24 @@ int kexec_purgatory_get_set_symbol(struct kimage *image, const char *name,
>  				   bool get_value);
>  void *kexec_purgatory_get_symbol_addr(struct kimage *image, const char *name);
>  
> -int __weak arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
> -					 unsigned long buf_len);
> -void * __weak arch_kexec_kernel_image_load(struct kimage *image);
> -int __weak arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> -					    Elf_Shdr *section,
> -					    const Elf_Shdr *relsec,
> -					    const Elf_Shdr *symtab);
> -int __weak arch_kexec_apply_relocations(struct purgatory_info *pi,
> -					Elf_Shdr *section,
> -					const Elf_Shdr *relsec,
> -					const Elf_Shdr *symtab);
> +/* Architectures may override the below functions */
> +int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
> +				  unsigned long buf_len);
> +void *arch_kexec_kernel_image_load(struct kimage *image);
> +int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
> +				     Elf_Shdr *section,
> +				     const Elf_Shdr *relsec,
> +				     const Elf_Shdr *symtab);
> +int arch_kexec_apply_relocations(struct purgatory_info *pi,
> +				 Elf_Shdr *section,
> +				 const Elf_Shdr *relsec,
> +				 const Elf_Shdr *symtab);
> +int arch_kimage_file_post_load_cleanup(struct kimage *image);
> +#ifdef CONFIG_KEXEC_SIG
> +int arch_kexec_kernel_verify_sig(struct kimage *image, void *buf,
> +				 unsigned long buf_len);
> +#endif
> +int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
>  
>  extern int kexec_add_buffer(struct kexec_buf *kbuf);
>  int kexec_locate_mem_hole(struct kexec_buf *kbuf);
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 09cc78d..e89912d 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -636,6 +636,19 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>  }
>  
>  /**
> + * arch_kexec_locate_mem_hole - Find free memory to place the segments.
> + * @kbuf:                       Parameters for the memory search.
> + *
> + * On success, kbuf->mem will have the start address of the memory region found.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int __weak arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
> +{
> +	return kexec_locate_mem_hole(kbuf);
> +}
> +
> +/**
>   * kexec_add_buffer - place a buffer in a kexec segment
>   * @kbuf:	Buffer contents and memory parameters.
>   *
> @@ -647,7 +660,6 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>   */
>  int kexec_add_buffer(struct kexec_buf *kbuf)
>  {
> -
>  	struct kexec_segment *ksegment;
>  	int ret;
>  
> @@ -675,7 +687,7 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
>  
>  	/* Walk the RAM ranges and allocate a suitable range for the buffer */
> -	ret = kexec_locate_mem_hole(kbuf);
> +	ret = arch_kexec_locate_mem_hole(kbuf);
>  	if (ret)
>  		return ret;
>  
> 

Acked-by: Dave Young <dyoung@redhat.com>

Thanks
Dave

