Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AA120BEFA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 08:32:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49v3ng6StdzDr7V
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 16:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49v3lt02RTzDr08
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 16:30:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49v3ls4PxTz9Ch5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 16:30:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49v3ls3xF0z9sSS; Sat, 27 Jun 2020 16:30:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49v3lr2df7z9sRW
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 16:30:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49v3ld5TcGz9v021;
 Sat, 27 Jun 2020 08:30:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tCD-gMIER6eu; Sat, 27 Jun 2020 08:30:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49v3ld3tDjz9v01x;
 Sat, 27 Jun 2020 08:30:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 89E108B772;
 Sat, 27 Jun 2020 08:30:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XpRoYDrHEWkv; Sat, 27 Jun 2020 08:30:22 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 688C18B75B;
 Sat, 27 Jun 2020 08:30:21 +0200 (CEST)
Subject: Re: [PATCH 01/11] kexec_file: allow archs to handle special regions
 while locating memory hole
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <9a976370-caef-1beb-d172-bcb0b17e9b78@csgroup.eu>
Date: Sat, 27 Jun 2020 08:30:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <159319828304.16351.6990340111766605842.stgit@hbathini.in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/06/2020 à 21:04, Hari Bathini a écrit :
> Some archs can have special memory regions, within the given memory
> range, which can't be used for the buffer in a kexec segment. As
> kexec_add_buffer() function is being called from generic code as well,
> add weak arch_kexec_add_buffer definition for archs to override & take
> care of special regions before trying to locate a memory hole.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>   include/linux/kexec.h |    5 +++++
>   kernel/kexec_file.c   |   37 +++++++++++++++++++++++++++++++++----
>   2 files changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/kexec.h b/include/linux/kexec.h
> index 1776eb2..1237682 100644
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
> @@ -195,6 +195,11 @@ int __weak arch_kexec_apply_relocations(struct purgatory_info *pi,
>   					const Elf_Shdr *relsec,
>   					const Elf_Shdr *symtab);
>   
> +extern int arch_kexec_add_buffer(struct kexec_buf *kbuf);
> +

extern keywork is useless here, please remove (checkpatch also complains 
about it usually).

> +/* arch_kexec_add_buffer calls this when it is ready */
> +extern int __kexec_add_buffer(struct kexec_buf *kbuf);
> +

same

>   extern int kexec_add_buffer(struct kexec_buf *kbuf);
>   int kexec_locate_mem_hole(struct kexec_buf *kbuf);
>   
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index bb05fd5..a0b4f7f 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -669,10 +669,6 @@ int kexec_locate_mem_hole(struct kexec_buf *kbuf)
>    */
>   int kexec_add_buffer(struct kexec_buf *kbuf)
>   {
> -
> -	struct kexec_segment *ksegment;
> -	int ret;
> -
>   	/* Currently adding segment this way is allowed only in file mode */
>   	if (!kbuf->image->file_mode)
>   		return -EINVAL;
> @@ -696,6 +692,25 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>   	kbuf->memsz = ALIGN(kbuf->memsz, PAGE_SIZE);
>   	kbuf->buf_align = max(kbuf->buf_align, PAGE_SIZE);
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
>   	/* Walk the RAM ranges and allocate a suitable range for the buffer */
>   	ret = kexec_locate_mem_hole(kbuf);
>   	if (ret)
> @@ -711,6 +726,20 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
>   	return 0;
>   }
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
>   /* Calculate and store the digest of segments */
>   static int kexec_calculate_store_digests(struct kimage *image)
>   {
> 

Christophe
