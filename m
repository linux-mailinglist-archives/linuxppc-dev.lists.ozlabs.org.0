Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C30544BF018
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 04:51:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2lbD0x8kz3cGG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 14:51:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQb9yeGi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2lZS2gzzz2yQ8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 14:50:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XQb9yeGi; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K2lZS51kLz4xZq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 14:50:56 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K2lZS4x0Jz4xn3; Tue, 22 Feb 2022 14:50:56 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=XQb9yeGi; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K2lZR5WBWz4xZq
 for <linuxppc-dev@ozlabs.org>; Tue, 22 Feb 2022 14:50:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645501849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lj0FbZ9FLqc2iQfFGRb0wlKHzSaelQx1+/oZYIpuy98=;
 b=XQb9yeGiyCh7M7SPbQxP6UhdevCES++mkYvJxLpmH69hIt5XR0m4Q+R6xD2/UJzRoYp6T7
 JSrxY1yXtZLCV1eBwo5Adg37dXSLHE3ymMz9ZGIkv+e8APdtBD1Y/xFwJGIWTcf0dJWQzf
 tcfgMxBsdSPMudbS9FCXlesb5WFk4l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-vIYDG1iPPzOGAUVKlpee7Q-1; Mon, 21 Feb 2022 22:50:45 -0500
X-MC-Unique: vIYDG1iPPzOGAUVKlpee7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20C621006AA6;
 Tue, 22 Feb 2022 03:50:44 +0000 (UTC)
Received: from localhost (ovpn-12-122.pek2.redhat.com [10.72.12.122])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E615E272;
 Tue, 22 Feb 2022 03:50:29 +0000 (UTC)
Date: Tue, 22 Feb 2022 11:50:22 +0800
From: Baoquan He <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: [RFC PATCH 0/5] Avoid kdump service reload on CPU hotplug events
Message-ID: <YhRdfu++s5dJMS5L@MiWiFi-R3L-srv>
References: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: linuxppc-dev@ozlabs.org, kexec@lists.infradead.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 02/21/22 at 02:16pm, Sourabh Jain wrote:
> On hotplug event (CPU/memory) the CPU information prepared for the kdump kernel
> becomes stale unless it is prepared again. To keep the CPU information
> up-to-date a kdump service reload is triggered via the udev rule.
> 
> The above approach has two downsides:
> 
> 1) The udev rules are prone to races if hotplug event is frequent. The time is
>    taken to settle down all the kdump service reload requested is significant
>    when multiple CPU/memory hotplug is performed at the same time. This creates
>    a window where kernel crash might not lead to successfully dump collection.
> 
> 2) Unnecessary CPU cycles are consumed to reload all the kdump components
>    including initrd, vmlinux, FDT, etc. whereas only one component needs to
>    update that is FDT.

I roughly went through this sereis, while haven't read the code
carefully. Seems the issue and the approach are similar to what below
patchset is doing. Do you notice below patchset from Oracle engineer?
And is there stuff the ppc code can be rebased on and reused?

[PATCH v4 00/10] crash: Kernel handling of CPU and memory hot un/plug
https://lore.kernel.org/all/20220209195706.51522-1-eric.devolder@oracle.com/T/#u
> 
> How this patch series solve the above issue?
> --------------------------------------------
> As mentioned above the only kexec segment that gets updated during
> the kdump service reload (due to hotplug event) is FDT. So, instead
> of re-creating the FDT on every hotplug event, it is just created
> once and updated on every hotplug event. This FDT is referred as kexec
> crash FDT.
> 
> 
> How kexec crash FDT is managed?
> -------------------------------
> During the kernel boot, a hole is allocated for kexec crash FDT in the kdump
> reserved region. On kdump service start a fresh copy of kdump FDT
> (created by kexec tool or kernel-based on which system call is used) is
> copied to the pre-allocated hole for kexec crash FDT. Once a kexec crash
> FDT is loaded all the subsequent updates needed due to CPU hot-add event
> can directly be done to kexec crash FDT without reloading all the kexec
> segment again. A hook is added on the CPU hot-add path to update the kexec
> crash FDT.
> 
> 
> How kexec crash FDT is accessed in kexec_load and kexec_file_load system call?
> ------------------------------------------------------------------------------
> Since kexec_file_load creates all kexec segments are prepared in the kernel,
> it can easily access the kexec crash FDT with help of two global variables,
> that holds the start address and the size of the kexec crash FDT.
> 
> In kexec_load system call, the kexec segments are prepared by the kexec tool in
> userspace. The start address and the size of kexec crash fdt is provided to
> userspace via two sysfs files /sys/kernel/kexec_crash_fdt and
> /sys/kernel/kexec_crash_fdt_size.
> 
> 
> A couple of minor changes are required to realise the benefit of the patch
> series:
> 
> - disalble the udev rule:
> 
>   comment out the below line in kdump udev rule file:
>   RHEL: /usr/lib/udev/rules.d/98-kexec.rules
>   # SUBSYSTEM=="cpu", ACTION=="online", GOTO="kdump_reload_cpu"
> 
> - kexec tool needs to be updated with patch for kexec_load system call
>   to work (not needed if -s option is used during kexec panic load):
> 
> ---
> From 37aa38713c163b31d9c6e80ddc059424c9fcd66d Mon Sep 17 00:00:00 2001
> From: Sourabh Jain <sourabhjain@linux.ibm.com>
> Date: Mon, 22 Nov 2021 14:12:52 +0530
> Subject: [PATCH] kexec/ppc64: use pre-allocated memory hole for kexec crash
>  FDT
> 
> Enabled kexec to use the per allocated memory hole for kexec crash FDT
> which is exported via /sys/kernel/kexec_crash_fdt and
> /sys/kernel/kexec_crash_fdt_size sysfs files. Using this pre-allocated
> memory hole for kdump fdt will allow the kernel to keep the kdump fdt
> up-to-date with the latest CPU information.
> 
> In case a pre-allocated memory hole is used for kdump fdt, the kdump fdt
> the segment is not included in SHA calculation because kdump fdt will be
> modified by the kernel.
> 
> To maintain the backward compatibility, we fall back to the old option of
> finding hole for kdump fdt segment if the pre-allocated buffer is not provided
> by the kernel.
> 
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>  kexec/arch/ppc64/kexec-elf-ppc64.c | 11 +++++--
>  kexec/arch/ppc64/kexec-ppc64.c     | 49 ++++++++++++++++++++++++++++++
>  kexec/kexec.c                      |  9 ++++++
>  kexec/kexec.h                      |  4 +++
>  4 files changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/kexec/arch/ppc64/kexec-elf-ppc64.c b/kexec/arch/ppc64/kexec-elf-ppc64.c
> index 695b8b0..8e66ef0 100644
> --- a/kexec/arch/ppc64/kexec-elf-ppc64.c
> +++ b/kexec/arch/ppc64/kexec-elf-ppc64.c
> @@ -329,8 +329,15 @@ int elf_ppc64_load(int argc, char **argv, const char *buf, off_t len,
>  	if (result < 0)
>  		return result;
>  
> -	my_dt_offset = add_buffer(info, seg_buf, seg_size, seg_size,
> -				0, 0, max_addr, -1);
> +        if (kexec_crash_fdt) {
> +                my_dt_offset = kexec_crash_fdt;
> +                add_segment_phys_virt(info, seg_buf, seg_size,
> +				      my_dt_offset, kexec_crash_fdt_size, 0);
> +        }
> +        else {
> +                my_dt_offset = add_buffer(info, seg_buf, seg_size, seg_size,
> +                                          0, 0, max_addr, -1);
> +        }
>  
>  #ifdef NEED_RESERVE_DTB
>  	/* patch reserve map address for flattened device-tree
> diff --git a/kexec/arch/ppc64/kexec-ppc64.c b/kexec/arch/ppc64/kexec-ppc64.c
> index 5b17740..d4385bd 100644
> --- a/kexec/arch/ppc64/kexec-ppc64.c
> +++ b/kexec/arch/ppc64/kexec-ppc64.c
> @@ -24,6 +24,7 @@
>  #include <errno.h>
>  #include <stdint.h>
>  #include <string.h>
> +#include <fcntl.h>
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <dirent.h>
> @@ -373,6 +374,52 @@ void scan_reserved_ranges(unsigned long kexec_flags, int *range_index)
>  	*range_index = i;
>  }
>  
> +void get_kexec_crash_fdt_details(unsigned long kexec_flags)
> +{
> +	int fd, len;
> +	char buf[MAXBYTES] = { 0 };
> +
> +	const char * const kexec_fdt_sysfs = "/sys/kernel/kexec_crash_fdt";
> +	const char * const kexec_fdt_size_sysfs = "/sys/kernel/kexec_crash_fdt_size";
> +
> +        fd = open(kexec_fdt_sysfs, O_RDONLY);
> +        if (fd < 0)
> +                return;
> +
> +        len = read(fd, buf, MAXBYTES);
> +        if (len < 0)
> +                goto err_out;
> +
> +        kexec_crash_fdt = strtoul(buf, NULL, 16);
> +
> +	fd = open(kexec_fdt_size_sysfs, O_RDONLY);
> +	if (fd < 0)
> +		goto err_out;
> +
> +	len = read(fd, buf, MAXBYTES);
> +	if (len < 0)
> +		goto err_out;
> +
> +	kexec_crash_fdt_size = strtoul(buf, NULL, 10);
> +
> +        exclude_range[nr_exclude_ranges].start = kexec_crash_fdt;
> +        exclude_range[nr_exclude_ranges].end = kexec_crash_fdt + \
> +					       kexec_crash_fdt_size;
> +        nr_exclude_ranges++;
> +
> +        if (nr_exclude_ranges >= max_memory_ranges)
> +                realloc_memory_ranges();
> +
> +	goto out;
> +
> +err_out:
> +	kexec_crash_fdt = kexec_fdt_size = 0;
> +
> +out:
> +        close (fd);
> +        return;
> +}
> +
>  /* Return 0 if fname/value valid, -1 otherwise */
>  int get_devtree_value(const char *fname, unsigned long long *value)
>  {
> @@ -804,6 +851,8 @@ int setup_memory_ranges(unsigned long kexec_flags)
>  		goto out;
>  	if (get_devtree_details(kexec_flags))
>  		goto out;
> +	if (kexec_flags & KEXEC_ON_CRASH)
> +		get_kexec_crash_fdt_details(kexec_flags);
>  
>  	for (i = 0; i < nr_exclude_ranges; i++) {
>  		/* If first exclude range does not start with 0, include the
> diff --git a/kexec/kexec.c b/kexec/kexec.c
> index f63b36b..89283f7 100644
> --- a/kexec/kexec.c
> +++ b/kexec/kexec.c
> @@ -62,6 +62,10 @@ static unsigned long kexec_flags = 0;
>  /* Flags for kexec file (fd) based syscall */
>  static unsigned long kexec_file_flags = 0;
>  int kexec_debug = 0;
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +uint64_t kexec_crash_fdt;
> +uint32_t kexec_cras_fdt_size;
> +#endif
>  
>  void dbgprint_mem_range(const char *prefix, struct memory_range *mr, int nr_mr)
>  {
> @@ -672,6 +676,11 @@ static void update_purgatory(struct kexec_info *info)
>  		if (info->segment[i].mem == (void *)info->rhdr.rel_addr) {
>  			continue;
>  		}
> +
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +		if (kexec_crash_fdt && (unsigned long)info->segment[i].mem == kexec_crash_fdt)
> +			continue;
> +#endif
>  		sha256_update(&ctx, info->segment[i].buf,
>  			      info->segment[i].bufsz);
>  		nullsz = info->segment[i].memsz - info->segment[i].bufsz;
> diff --git a/kexec/kexec.h b/kexec/kexec.h
> index 595dd68..48e8b9f 100644
> --- a/kexec/kexec.h
> +++ b/kexec/kexec.h
> @@ -205,6 +205,10 @@ struct file_type {
>  
>  extern struct file_type file_type[];
>  extern int file_types;
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +extern uint64_t fdt;
> +extern uint32_t fdt_size;
> +#endif
>  
>  #define OPT_HELP		'h'
>  #define OPT_VERSION		'v'
> -- 
> 2.34.1
> ---
> 
> 
> Sourabh Jain (5):
>   powerpc/kdump: export functions from file_load_64.c
>   powerpc/kdump: setup kexec crash FDT
>   powerpc/kdump: update kexec crash FDT on CPU hot add event
>   powerpc/kdump: enable kexec_file_load system call to use kexec crash
>     FDT
>   powerpc/kdump: export kexec crash FDT details via sysfs
> 
>  arch/powerpc/Kconfig                         |  11 +
>  arch/powerpc/include/asm/kexec.h             |  10 +
>  arch/powerpc/kexec/core_64.c                 | 318 +++++++++++++++++++
>  arch/powerpc/kexec/elf_64.c                  |  22 +-
>  arch/powerpc/kexec/file_load_64.c            | 239 +-------------
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |   7 +
>  6 files changed, 369 insertions(+), 238 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

