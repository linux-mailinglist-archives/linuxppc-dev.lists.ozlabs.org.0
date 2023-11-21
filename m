Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F56D7F2781
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 09:32:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AlrrhHTS;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nuR4x0VU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZHfn3n2Kz3dWF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 19:32:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=AlrrhHTS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=nuR4x0VU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZHdt0cwNz2xQ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 19:31:14 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id E2E3E2197F;
	Tue, 21 Nov 2023 08:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1700555463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VICQCjc11sV2vtKMVzGh6AeAb5iLAJuyDhKvVYHH7O0=;
	b=AlrrhHTSt3cOneCwmcAjRRlLOdkyywiYVP2AJEqBDdQEkDKGGgv2Wb9tLHNK2NbXYW+tOK
	v6cwMtOpZgUPyQUF5cYL84BS6Jb6aY+uI6oTKs4tg1BOMWaUcO7Mo3rk1MxcJBmyU6Jho9
	CvYOXaVNPVBWigtfbNt8zNbz+5xYbCg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700555463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VICQCjc11sV2vtKMVzGh6AeAb5iLAJuyDhKvVYHH7O0=;
	b=nuR4x0VUVvuItg0pB0J8GI7UKruTSGjCd2l8KUy2I7fSCKcIvVbBWbSOkpDYliRV0hLDuH
	fP0U2JJBMBuR4HBg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id ED4A32C146;
	Tue, 21 Nov 2023 08:31:02 +0000 (UTC)
Date: Tue, 21 Nov 2023 09:31:01 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: nathanl@linux.ibm.com
Subject: Re: [PATCH v4 09/13] powerpc/pseries: Add papr-vpd character driver
 for VPD retrieval
Message-ID: <20231121083101.GK9696@kitsune.suse.cz>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-9-b794d8cb8502@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Level: *************
X-Spamd-Bar: +++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=none;
	spf=softfail (smtp-out1.suse.de: 149.44.160.134 is neither permitted nor denied by domain of msuchanek@suse.de) smtp.mailfrom=msuchanek@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [13.91 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DMARC_NA(1.20)[suse.de];
	 R_SPF_SOFTFAIL(4.60)[~all:c];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RWL_MAILSPIKE_GOOD(-1.00)[149.44.160.134:from];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MX_GOOD(-0.01)[];
	 NEURAL_SPAM_LONG(3.50)[1.000];
	 VIOLATED_DIRECT_SPF(3.50)[];
	 NEURAL_SPAM_SHORT(2.92)[0.972];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[ellerman.id.au,gmail.com,lists.ozlabs.org,linux.ibm.com];
	 RCVD_COUNT_TWO(0.00)[2];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Score: 13.91
X-Rspamd-Queue-Id: E2E3E2197F
X-Spam-Flag: NO
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
Cc: gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Fri, Nov 17, 2023 at 11:14:27PM -0600, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
> 
> PowerVM LPARs may retrieve Vital Product Data (VPD) for system
> components using the ibm,get-vpd RTAS function.
> 
> We can expose this to user space with a /dev/papr-vpd character
> device, where the programming model is:
> 
>   struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
>   int devfd = open("/dev/papr-vpd", O_RDONLY);
>   int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
>   size_t size = lseek(vpdfd, 0, SEEK_END);
>   char *buf = malloc(size);
>   pread(devfd, buf, size, 0);
> 
> When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
> the file contains the result of a complete ibm,get-vpd sequence. The
> file contents are immutable from the POV of user space. To get a new
> view of the VPD, the client must create a new handle.
> 
> This design choice insulates user space from most of the complexities
> that ibm,get-vpd brings:
> 
> * ibm,get-vpd must be called more than once to obtain complete
>   results.
> 
> * Only one ibm,get-vpd call sequence should be in progress at a time;
>   interleaved sequences will disrupt each other. Callers must have a
>   protocol for serializing their use of the function.
> 
> * A call sequence in progress may receive a "VPD changed, try again"
>   status, requiring the client to abandon the sequence and start
>   over.
> 
> The memory required for the VPD buffers seems acceptable, around 20KB
> for all VPD on one of my systems. And the value of the
> /rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
> consistently 300KB across various systems I've checked.
> 
> I've implemented support for this new ABI in the rtas_get_vpd()
> function in librtas, which the vpdupdate command currently uses to
> populate its VPD database. I've verified that an unmodified vpdupdate
> binary generates an identical database when using a librtas.so that
> prefers the new ABI.
> 
> Note that the driver needs to serialize its call sequences with legacy
> sys_rtas(ibm,get-vpd) callers, so it exposes its internal lock for
> sys_rtas.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
>  arch/powerpc/include/uapi/asm/papr-vpd.h           |  22 +
>  arch/powerpc/platforms/pseries/Makefile            |   1 +
>  arch/powerpc/platforms/pseries/papr-vpd.c          | 536 +++++++++++++++++++++
>  4 files changed, 561 insertions(+)

> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
> index 1476c5e4433c..f936962a2946 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -4,6 +4,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
>  
>  obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
>  			   of_helpers.o rtas-work-area.o papr-sysparm.o \
> +			   papr-vpd.o \
>  			   setup.o iommu.o event_sources.o ras.o \
>  			   firmware.o power.o dlpar.o mobility.o rng.o \
>  			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
> diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
> new file mode 100644
> index 000000000000..2bc52301a402
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/papr-vpd.c
> @@ -0,0 +1,536 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#define pr_fmt(fmt) "papr-vpd: " fmt
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/build_bug.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/string_helpers.h>
> +#include <asm/machdep.h>
> +#include <asm/papr-vpd.h>
> +#include <asm/rtas-work-area.h>
> +#include <asm/rtas.h>
> +#include <uapi/asm/papr-vpd.h>
...
> +/**
> + * papr_vpd_retrieve() - Return the VPD for a location code.
> + * @loc_code: Location code that defines the scope of VPD to return.
> + *
> + * Run VPD sequences against @loc_code until a blob is successfully
> + * instantiated, or a hard error is encountered, or a fatal signal is
> + * pending.
> + *
> + * Context: May sleep.
> + * Return: A fully populated VPD blob when successful. Encoded error
> + * pointer otherwise.
> + */
> +static const struct vpd_blob *papr_vpd_retrieve(const struct papr_location_code *loc_code)
> +{
> +	const struct vpd_blob *blob;
> +
> +	/*
> +	 * EAGAIN means the sequence errored with a -4 (VPD changed)
> +	 * status from ibm,get-vpd, and we should attempt a new
> +	 * sequence. PAPR+ R1–7.3.20–5 indicates that this should be a
> +	 * transient condition, not something that happens
> +	 * continuously. But we'll stop trying on a fatal signal.
> +	 */
> +	do {
> +		blob = papr_vpd_run_sequence(loc_code);
> +		if (!IS_ERR(blob)) /* Success. */
> +			break;
> +		if (PTR_ERR(blob) != -EAGAIN) /* Hard error. */
> +			break;
> +		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
> +		cond_resched();
> +	} while (!fatal_signal_pending(current));

this is defined in linux/sched/signal.h which is not included.

> +
> +	return blob;
> +}
> +
> +static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t size, loff_t *off)
> +{
> +	const struct vpd_blob *blob = file->private_data;
> +
> +	/* bug: we should not instantiate a handle without any data attached. */
> +	if (!vpd_blob_has_data(blob)) {
> +		pr_err_once("handle without data\n");
> +		return -EIO;
> +	}
> +
> +	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
> +}
> +
> +static int papr_vpd_handle_release(struct inode *inode, struct file *file)
> +{
> +	const struct vpd_blob *blob = file->private_data;
> +
> +	vpd_blob_free(blob);
> +
> +	return 0;
> +}
> +
> +static loff_t papr_vpd_handle_seek(struct file *file, loff_t off, int whence)
> +{
> +	const struct vpd_blob *blob = file->private_data;
> +
> +	return fixed_size_llseek(file, off, whence, blob->len);
> +}
> +
> +
> +static const struct file_operations papr_vpd_handle_ops = {
> +	.read = papr_vpd_handle_read,
> +	.llseek = papr_vpd_handle_seek,
> +	.release = papr_vpd_handle_release,
> +};
> +
> +/**
> + * papr_vpd_create_handle() - Create a fd-based handle for reading VPD.
> + * @ulc: Location code in user memory; defines the scope of the VPD to
> + *       retrieve.
> + *
> + * Handler for PAPR_VPD_IOC_CREATE_HANDLE ioctl command. Validates
> + * @ulc and instantiates an immutable VPD "blob" for it. The blob is
> + * attached to a file descriptor for reading by user space. The memory
> + * backing the blob is freed when the file is released.
> + *
> + * The entire requested VPD is retrieved by this call and all
> + * necessary RTAS interactions are performed before returning the fd
> + * to user space. This keeps the read handler simple and ensures that
> + * the kernel can prevent interleaving of ibm,get-vpd call sequences.
> + *
> + * Return: The installed fd number if successful, -ve errno otherwise.
> + */
> +static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
> +{
> +	struct papr_location_code klc;
> +	const struct vpd_blob *blob;
> +	struct file *file;
> +	long err;
> +	int fd;
> +
> +	if (copy_from_user(&klc, ulc, sizeof(klc)))
> +		return -EFAULT;

This is defined in linux/uaccess.h which is not included.

Same for the sysparm driver.

Tested-by: Michal Suchánek <msuchanek@suse.de>

> +
> +	if (!string_is_terminated(klc.str, ARRAY_SIZE(klc.str)))
> +		return -EINVAL;
> +
> +	blob = papr_vpd_retrieve(&klc);
> +	if (IS_ERR(blob))
> +		return PTR_ERR(blob);
> +
> +	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
> +	if (fd < 0) {
> +		err = fd;
> +		goto free_blob;
> +	}
> +
> +	file = anon_inode_getfile("[papr-vpd]", &papr_vpd_handle_ops,
> +				  (void *)blob, O_RDONLY);
> +	if (IS_ERR(file)) {
> +		err = PTR_ERR(file);
> +		goto put_fd;
> +	}
> +
> +	file->f_mode |= FMODE_LSEEK | FMODE_PREAD;
> +	fd_install(fd, file);
> +	return fd;
> +put_fd:
> +	put_unused_fd(fd);
> +free_blob:
> +	vpd_blob_free(blob);
> +	return err;
> +}
> +
> +/*
> + * Top-level ioctl handler for /dev/papr-vpd.
> + */
> +static long papr_vpd_dev_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
> +{
> +	void __user *argp = (__force void __user *)arg;
> +	long ret;
> +
> +	switch (ioctl) {
> +	case PAPR_VPD_IOC_CREATE_HANDLE:
> +		ret = papr_vpd_create_handle(argp);
> +		break;
> +	default:
> +		ret = -ENOIOCTLCMD;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static const struct file_operations papr_vpd_ops = {
> +	.unlocked_ioctl = papr_vpd_dev_ioctl,
> +};
> +
> +static struct miscdevice papr_vpd_dev = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = "papr-vpd",
> +	.fops = &papr_vpd_ops,
> +};
> +
> +static __init int papr_vpd_init(void)
> +{
> +	if (!rtas_function_implemented(RTAS_FN_IBM_GET_VPD))
> +		return -ENODEV;
> +
> +	return misc_register(&papr_vpd_dev);
> +}
> +machine_device_initcall(pseries, papr_vpd_init);
> 
> -- 
> 2.41.0
> 
