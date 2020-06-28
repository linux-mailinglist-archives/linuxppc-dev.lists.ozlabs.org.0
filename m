Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC2D20C56B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 04:30:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vZMr6bPMzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 12:30:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vZLJ3KsnzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 12:28:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=J8SOs+gS; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49vZLJ1zjpz8t4p
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 12:28:40 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49vZLH73r7z9sQt; Sun, 28 Jun 2020 12:28:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=J8SOs+gS; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49vZLH20R2z9sDX
 for <linuxppc-dev@ozlabs.org>; Sun, 28 Jun 2020 12:28:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593311314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ZFRO/u+x4EdsO5u8emjhqCb2/M7dbDUc3NXXTSf+Fs=;
 b=J8SOs+gSM+bnRPSvmC+aBF7mTKPemUU65QN7KpSjyjXAhTI6zUuaWVHjvBsIqXVVINVd1j
 53tBfXAlEUK/kGSMxMIxADs8POHxs39pZr5viJnozeS5IBSAvLC9loVL9jm8Idq5Qd3D8W
 1fzFY6m0HBuj/PcQ07VKxJf0NcZmIdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-vtl253alMKOLKF33rfYbEg-1; Sat, 27 Jun 2020 22:28:30 -0400
X-MC-Unique: vtl253alMKOLKF33rfYbEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8343A804002;
 Sun, 28 Jun 2020 02:28:27 +0000 (UTC)
Received: from [10.72.8.17] (ovpn-8-17.pek2.redhat.com [10.72.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 768C71C94D;
 Sun, 28 Jun 2020 02:28:18 +0000 (UTC)
Subject: Re: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
From: piliu <piliu@redhat.com>
Message-ID: <ed94a357-16aa-9f17-aa5f-5aab6617ed68@redhat.com>
Date: Sun, 28 Jun 2020 10:28:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Kexec-ml <kexec@lists.infradead.org>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

If in [4/11],  get_exclude_memory_ranges() turns out to be unnecessary
,then this patch is abundant either. As my understanding, memblock has
already helped to achieved the purpose that get_exclude_memory_ranges()
wants.

Thanks,
Pingfan

On 06/27/2020 03:04 AM, Hari Bathini wrote:
> Some archs can have special memory regions, within the given memory
> range, which can't be used for the buffer in a kexec segment. As
> kexec_add_buffer() function is being called from generic code as well,
> add weak arch_kexec_add_buffer definition for archs to override & take
> care of special regions before trying to locate a memory hole.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  include/linux/kexec.h |    5 +++++
>  kernel/kexec_file.c   |   37 +++++++++++++++++++++++++++++++++----
>  2 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 1776eb2..1237682 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -195,6 +195,11 @@ int __weak arch_kexec_apply_relocations(struct purgatory_info *pi,
>  					const Elf_Shdr *relsec,
>  					const Elf_Shdr *symtab);
>  
> +extern int arch_kexec_add_buffer(struct kexec_buf *kbuf);
> +
> +/* arch_kexec_add_buffer calls this when it is ready */
> +extern int __kexec_add_buffer(struct kexec_buf *kbuf);
> +
>  extern int kexec_add_buffer(struct kexec_buf *kbuf);
>  int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>  
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index bb05fd5..a0b4f7f 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -669,10 +669,6 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>   */
>  int kexec_add_buffer(struct kexec_buf *kbuf)
>  {
> -
> -	struct kexec_segment *ksegment;
> -	int ret;
> -
>  	/* Currently adding segment this way is allowed only in file mode */
>  	if (!kbuf->image->file_mode)
>  		return -EINVAL;
> @@ -696,6 +692,25 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
>  	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
>  
> +	return arch_kexec_add_buffer(kbuf);
> +}
> +
> +/**
> + * __kexec_add_buffer - arch_kexec_add_buffer would call this function after
> + *                      updating kbuf, to place a buffer in a kexec segment.
> + * @kbuf:               Buffer contents and memory parameters.
> + *
> + * This function assumes that kexec_mutex is held.
> + * On successful return, @kbuf->mem will have the physical address of
> + * the buffer in memory.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int __kexec_add_buffer(struct kexec_buf *kbuf)
> +{
> +	struct kexec_segment *ksegment;
> +	int ret;
> +
>  	/* Walk the RAM ranges and allocate a suitable range for the buffer */
>  	ret = kexec_locate_mem_hole(kbuf);
>  	if (ret)
> @@ -711,6 +726,20 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>  	return 0;
>  }
>  
> +/**
> + * arch_kexec_add_buffer - Some archs have memory regions within the given
> + *                         range that can't be used to place a kexec segment.
> + *                         Such archs can override this function to take care
> + *                         of them before trying to locate the memory hole.
> + * @kbuf:                  Buffer contents and memory parameters.
> + *
> + * Return: 0 on success, negative errno on error.
> + */
> +int __weak arch_kexec_add_buffer(struct kexec_buf *kbuf)
> +{
> +	return __kexec_add_buffer(kbuf);
> +}
> +
>  /* Calculate and store the digest of segments */
>  static int kexec_calculate_store_digests(struct kimage *image)
>  {
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

