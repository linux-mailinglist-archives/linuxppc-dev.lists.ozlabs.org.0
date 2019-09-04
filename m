Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2574A8142
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 13:44:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NhnZ37MqzDqT1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 21:44:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NhlQ1lSFzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:42:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46NhlQ0yqcz9sN1; Wed,  4 Sep 2019 21:42:58 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46NhlP4Q8Vz9sDQ;
 Wed,  4 Sep 2019 21:42:57 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 16/31] powernv/fadump: process the crashdump by
 exporting it as /proc/vmcore
In-Reply-To: <156630276507.8896.7987455476577127053.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630276507.8896.7987455476577127053.stgit@hbathini.in.ibm.com>
Date: Wed, 04 Sep 2019 21:42:57 +1000
Message-ID: <874l1sqoce.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hari Bathini <hbathini@linux.ibm.com> writes:
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index a755705..10f6086 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -41,6 +43,37 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
>  	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
>  }
>  
> +/*
> + * This function is called in the capture kernel to get configuration details
> + * from metadata setup by the first kernel.
> + */
> +static void opal_fadump_get_config(struct fw_dump *fadump_conf,
> +				   const struct opal_fadump_mem_struct *fdm)
> +{
> +	int i;
> +
> +	if (!fadump_conf->dump_active)
> +		return;
> +
> +	fadump_conf->boot_memory_size = 0;
> +
> +	pr_debug("Boot memory regions:\n");
> +	for (i = 0; i < fdm->region_cnt; i++) {
> +		pr_debug("\t%d. base: 0x%llx, size: 0x%llx\n",
> +			 (i + 1), fdm->rgn[i].src, fdm->rgn[i].size);

Printing the zero-based array off by one (i + 1) seems confusing.

> +
> +		fadump_conf->boot_memory_size += fdm->rgn[i].size;
> +	}
> +
> +	/*
> +	 * Start address of reserve dump area (permanent reservation) for
> +	 * re-registering FADump after dump capture.
> +	 */
> +	fadump_conf->reserve_dump_area_start = fdm->rgn[0].dest;
> +
> +	opal_fadump_update_config(fadump_conf, fdm);
> +}
> +
>  /* Initialize kernel metadata */
>  static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
>  {
> @@ -215,24 +248,114 @@ static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
>  		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
>  }
>  
> +/*
> + * Convert CPU state data saved at the time of crash into ELF notes.
> + */
> +static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
> +{
> +	u32 num_cpus, *note_buf;
> +	struct fadump_crash_info_header *fdh = NULL;
> +
> +	num_cpus = 1;
> +	/* Allocate buffer to hold cpu crash notes. */
> +	fadump_conf->cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
> +	fadump_conf->cpu_notes_buf_size =
> +		PAGE_ALIGN(fadump_conf->cpu_notes_buf_size);
> +	note_buf = fadump_cpu_notes_buf_alloc(fadump_conf->cpu_notes_buf_size);
> +	if (!note_buf) {
> +		pr_err("Failed to allocate 0x%lx bytes for cpu notes buffer\n",
> +		       fadump_conf->cpu_notes_buf_size);
> +		return -ENOMEM;
> +	}
> +	fadump_conf->cpu_notes_buf = __pa(note_buf);
> +
> +	pr_debug("Allocated buffer for cpu notes of size %ld at %p\n",
> +		 (num_cpus * sizeof(note_buf_t)), note_buf);
> +
> +	if (fadump_conf->fadumphdr_addr)
> +		fdh = __va(fadump_conf->fadumphdr_addr);
> +
> +	if (fdh && (fdh->crashing_cpu != FADUMP_CPU_UNKNOWN)) {
> +		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
> +		final_note(note_buf);
> +
> +		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
> +			 fdh->elfcorehdr_addr);
> +		fadump_update_elfcore_header(fadump_conf,
> +					     __va(fdh->elfcorehdr_addr));
> +	}
> +
> +	return 0;
> +}
> +
>  static int __init opal_fadump_process(struct fw_dump *fadump_conf)
>  {
> -	return -EINVAL;
> +	struct fadump_crash_info_header *fdh;
> +	int rc = 0;

No need to initialise rc there.

> +	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
> +		return -EINVAL;
> +
> +	/* Validate the fadump crash info header */
> +	fdh = __va(fadump_conf->fadumphdr_addr);
> +	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
> +		pr_err("Crash info header is not valid.\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * TODO: To build cpu notes, find a way to map PIR to logical id.
> +	 *       Also, we may need different method for pseries and powernv.
> +	 *       The currently booted kernel could have a different PIR to
> +	 *       logical id mapping. So, try saving info of previous kernel's
> +	 *       paca to get the right PIR to logical id mapping.
> +	 */

That TODO is removed by the end of the series, so please just omit it entirely.

> +	rc = opal_fadump_build_cpu_notes(fadump_conf);
> +	if (rc)
> +		return rc;

I think this all runs early in boot, so we don't need to worry about
another CPU seeing the partially initialised core due to there being no
barrier here before we set elfcorehdr_addr?

> +	/*
> +	 * We are done validating dump info and elfcore header is now ready
> +	 * to be exported. set elfcorehdr_addr so that vmcore module will
> +	 * export the elfcore header through '/proc/vmcore'.
> +	 */
> +	elfcorehdr_addr = fdh->elfcorehdr_addr;

> @@ -283,5 +407,42 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
>  	fadump_conf->ops		= &opal_fadump_ops;
>  	fadump_conf->fadump_supported	= 1;
>  
> +	/*
> +	 * Check if dump has been initiated on last reboot.
> +	 */
> +	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
> +	if (prop) {

        if (!prop)
                return 1;

And then everything below can be unindented.

> +		u64 addr = 0;
> +		s64 ret;
> +		const struct opal_fadump_mem_struct *r_opal_fdm_active;

  *
 / \
 /_\
  |

> +
> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
> +		if ((ret != OPAL_SUCCESS) || !addr) {
> +			pr_err("Failed to get Kernel metadata (%lld)\n", ret);
> +			return 1;
> +		}
> +
> +		addr = be64_to_cpu(addr);
> +		pr_debug("Kernel metadata addr: %llx\n", addr);
> +
> +		opal_fdm_active = __va(addr);
> +		r_opal_fdm_active = (void *)addr;

Why do we need the r_ version?

We're called early in boot, so we are still in real mode, but that's
fine the CPU will ignore the top bits of the virtual address for us.

> +		if (r_opal_fdm_active->version != OPAL_FADUMP_VERSION) {
> +			pr_err("FADump active but version (%u) unsupported!\n",
> +			       r_opal_fdm_active->version);
> +			return 1;
> +		}
> +
> +		/* Kernel regions not registered with f/w for MPIPL */
> +		if (r_opal_fdm_active->registered_regions == 0) {
> +			opal_fdm_active = NULL;
> +			return 1;
> +		}
> +
> +		pr_info("Firmware-assisted dump is active.\n");
> +		fadump_conf->dump_active = 1;
> +		opal_fadump_get_config(fadump_conf, r_opal_fdm_active);
> +	}
> +
>  	return 1;
>  }


cheers
