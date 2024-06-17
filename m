Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDECD90B8BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 20:00:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ir10U5iH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2yNQ5FtLz3gBX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 04:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ir10U5iH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2yMj6Kr8z3g4s
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 04:00:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EC2661328;
	Mon, 17 Jun 2024 18:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3765C2BD10;
	Mon, 17 Jun 2024 17:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718647199;
	bh=Fl8N33BSDXmjPLYlGtTOYOXsRe7b1h7E4wgQlsyNPsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ir10U5iH00YM4E6DJFSawBRv11YAMt1t616rq8exNErIilitiQl2KAK4GChDaCGFs
	 jF9Q9wklZJC41Vs5s7JJF2n9wSLuKdj7/cgn8GgLX7SeHUtKYVgqS3kT2fwl7dDjLd
	 y0LTJiv+bN1vQODvMX71qHjRxTekJHk7Y/12fMJOMPIdV/BUMpbXV3GWDneFgi2Z2R
	 V474KXPLWPZWaiA2pZj0Lz6CiztVsJLE78j5hjCCR98ZggbDkCvfSiw1lKO5bZjq/S
	 bmGqfXFEez2PEislZhX2dvoYAf4jNvqtCzzuWlHBuLVGzH20MGWjko54QW0BJh9+we
	 TbfsNj5u+qWCg==
Date: Mon, 17 Jun 2024 10:59:59 -0700
From: Kees Cook <kees@kernel.org>
To: Anjali K <anjalik@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Whitelist dtl slub object for copying
 to userspace
Message-ID: <202406171053.F72BF013@keescook>
References: <20240614173844.746818-1-anjalik@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614173844.746818-1-anjalik@linux.ibm.com>
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
Cc: naveen@kernel.org, christophe.leroy@csgroup.eu, gustavoars@kernel.org, npiggin@gmail.com, vishalc@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 11:08:44PM +0530, Anjali K wrote:
> Reading the dispatch trace log from /sys/kernel/debug/powerpc/dtl/cpu-*
> results in a BUG() when the config CONFIG_HARDENED_USERCOPY is enabled as
> shown below.
> 
>     kernel BUG at mm/usercopy.c:102!
>     Oops: Exception in kernel mode, sig: 5 [#1]
>     LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
>     Modules linked in: xfs libcrc32c dm_service_time sd_mod t10_pi sg ibmvfc
>     scsi_transport_fc ibmveth pseries_wdt dm_multipath dm_mirror dm_region_hash dm_log dm_mod fuse
>     CPU: 27 PID: 1815 Comm: python3 Not tainted 6.10.0-rc3 #85
>     Hardware name: IBM,9040-MRX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NM1060_042) hv:phyp pSeries
>     NIP:  c0000000005d23d4 LR: c0000000005d23d0 CTR: 00000000006ee6f8
>     REGS: c000000120c078c0 TRAP: 0700   Not tainted  (6.10.0-rc3)
>     MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 2828220f  XER: 0000000e
>     CFAR: c0000000001fdc80 IRQMASK: 0
>     [ ... GPRs omitted ... ]
>     NIP [c0000000005d23d4] usercopy_abort+0x78/0xb0
>     LR [c0000000005d23d0] usercopy_abort+0x74/0xb0
>     Call Trace:
>      usercopy_abort+0x74/0xb0 (unreliable)
>      __check_heap_object+0xf8/0x120
>      check_heap_object+0x218/0x240
>      __check_object_size+0x84/0x1a4
>      dtl_file_read+0x17c/0x2c4
>      full_proxy_read+0x8c/0x110
>      vfs_read+0xdc/0x3a0
>      ksys_read+0x84/0x144
>      system_call_exception+0x124/0x330
>      system_call_vectored_common+0x15c/0x2ec
>     --- interrupt: 3000 at 0x7fff81f3ab34
> 
> Commit 6d07d1cd300f ("usercopy: Restrict non-usercopy caches to size 0")
> requires that only whitelisted areas in slab/slub objects can be copied to
> userspace when usercopy hardening is enabled using CONFIG_HARDENED_USERCOPY.
> Dtl contains hypervisor dispatch events which are expected to be read by
> privileged users. Hence mark this safe for user access.
> Specify useroffset=0 and usersize=DISPATCH_LOG_BYTES to whitelist the
> entire object.
> 
> Co-developed-by: Vishal Chourasia <vishalc@linux.ibm.com>
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> Signed-off-by: Anjali K <anjalik@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index 284a6fa04b0c..cba40d9d1284 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -343,8 +343,8 @@ static int alloc_dispatch_log_kmem_cache(void)
>  {
>  	void (*ctor)(void *) = get_dtl_cache_ctor();
>  
> -	dtl_cache = kmem_cache_create("dtl", DISPATCH_LOG_BYTES,
> -						DISPATCH_LOG_BYTES, 0, ctor);
> +	dtl_cache = kmem_cache_create_usercopy("dtl", DISPATCH_LOG_BYTES,
> +						DISPATCH_LOG_BYTES, 0, 0, DISPATCH_LOG_BYTES, ctor);
>  	if (!dtl_cache) {
>  		pr_warn("Failed to create dispatch trace log buffer cache\n");
>  		pr_warn("Stolen time statistics will be unreliable\n");

Are you sure you want to universally expose this memory region? It
sounds like it's only exposed via a debug interface. Maybe it'd be
better to use a bounce buffer in the debug interface instead?


diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index 3f1cdccebc9c..3adcff5cc4b2 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -257,6 +257,22 @@ static int dtl_file_release(struct inode *inode, struct file *filp)
 	return 0;
 }
 
+static inline int bounce_copy(char __user *buf, void *src, size_t size)
+{
+	u8 *bounce;
+	int rc;
+
+	bounce = kmalloc(size, GFP_KERNEL);
+	if (!bounce)
+		return -ENOMEM;
+
+	memcpy(bounce, src, size);
+	rc = copy_to_user(buf, bounce, size);
+
+	kfree(bounce);
+	return rc;
+}
+
 static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
 		loff_t *pos)
 {
@@ -300,7 +316,7 @@ static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
 	if (i + n_req > dtl->buf_entries) {
 		read_size = dtl->buf_entries - i;
 
-		rc = copy_to_user(buf, &dtl->buf[i],
+		rc = bounce_copy(buf, &dtl->buf[i],
 				read_size * sizeof(struct dtl_entry));
 		if (rc)
 			return -EFAULT;
@@ -312,7 +328,7 @@ static ssize_t dtl_file_read(struct file *filp, char __user *buf, size_t len,
 	}
 
 	/* .. and now the head */
-	rc = copy_to_user(buf, &dtl->buf[i], n_req * sizeof(struct dtl_entry));
+	rc = bounce_copy(buf, &dtl->buf[i], n_req * sizeof(struct dtl_entry));
 	if (rc)
 		return -EFAULT;
 

-- 
Kees Cook
