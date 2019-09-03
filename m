Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA62A674B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 13:22:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N4Km1wPFzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 21:22:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N44D50CxzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 21:10:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46N44D4QyNz9sDB; Tue,  3 Sep 2019 21:10:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46N44D1HrJz9s7T;
 Tue,  3 Sep 2019 21:10:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Hari Bathini <hbathini@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: Re: [PATCH v5 10/31] opal: add MPIPL interface definitions
In-Reply-To: <156630272066.8896.14185583668659839717.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
 <156630272066.8896.14185583668659839717.stgit@hbathini.in.ibm.com>
Date: Tue, 03 Sep 2019 21:10:19 +1000
Message-ID: <87tv9tr5yc.fsf@mpe.ellerman.id.au>
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
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index 383242e..c8a5665 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -980,6 +983,50 @@ struct opal_sg_list {
>  };
>  
>  /*
> + * Firmware-Assisted Dump (FADump) using MPIPL
> + */
> +
> +/* MPIPL update operations */
> +enum opal_mpipl_ops {
> +	OPAL_MPIPL_ADD_RANGE			= 0,
> +	OPAL_MPIPL_REMOVE_RANGE			= 1,
> +	OPAL_MPIPL_REMOVE_ALL			= 2,
> +	OPAL_MPIPL_FREE_PRESERVED_MEMORY	= 3,
> +};
> +
> +/*
> + * Each tag maps to a metadata type. Use these tags to register/query
> + * corresponding metadata address with/from OPAL.
> + */
> +enum opal_mpipl_tags {
> +	OPAL_MPIPL_TAG_CPU		= 0,
> +	OPAL_MPIPL_TAG_OPAL		= 1,
> +	OPAL_MPIPL_TAG_KERNEL		= 2,
> +	OPAL_MPIPL_TAG_BOOT_MEM		= 3,
> +};
> +
> +/* Preserved memory details */
> +struct opal_mpipl_region {
> +	__be64	src;
> +	__be64	dest;
> +	__be64	size;
> +};
> +
> +/* FADump structure format version */
> +#define MPIPL_FADUMP_VERSION			0x01
> +
> +/* Metadata provided by OPAL. */
> +struct opal_mpipl_fadump {
> +	u8				version;
> +	u8				reserved[7];
> +	__be32				crashing_pir;
> +	__be32				cpu_data_version;
> +	__be32				cpu_data_size;
> +	__be32				region_cnt;
> +	struct opal_mpipl_region	region[];
> +} __attribute__((packed));
> +

The above hunk is in the wrong place vs the skiboot header. Please put
things in exactly the same place in the skiboot and kernel versions of
the header.

After your kernel & skiboot patches are applied, the result of:

 $ git diff ~/src/skiboot/include/opal-api.h arch/powerpc/include/asm/opal-api.h

Should not include anything MPIPL/fadump related.


> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 57bd029..878110a 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -39,6 +39,12 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
>  				uint64_t PE_handle);
>  int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
>  			uint64_t rate_phys, uint32_t size);
> +
> +int64_t opal_mpipl_update(enum opal_mpipl_ops op, u64 src,
> +			  u64 dest, u64 size);
> +int64_t opal_mpipl_register_tag(enum opal_mpipl_tags tag, uint64_t addr);
> +int64_t opal_mpipl_query_tag(enum opal_mpipl_tags tag, uint64_t *addr);
> +

Please consistently use kernel types for new prototypes in here.

cheers
