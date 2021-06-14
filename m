Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA33A5B96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3Fpq138nz308t
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=HhtuhMAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HhtuhMAj; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3FpM19kfz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:32:10 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id l184so7455129pgd.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=gvGBV8fyT3L+Y1nmH23oV05tZbLCqLFMAy8FkCnq2vk=;
 b=HhtuhMAjpw2pdsY/Ty8DB+bd5Z2gdJI97g8cNGGeudJtzXj47058io73WQPMpGO7WH
 julHd4mpHIkOnCkLyrVT2V2W9l0bTuYvqllV+mA21FXbDxznRNRnqugKUT8s55nCOtor
 qG51XTdtNIJAlZZPqt+0VDrjG8V3ldXxrriKNtx0+eCrzu8hCHWC1CdlWJ+5Qz2hg4kl
 /BXTb8KKRegz0qHsYCvjQcSRDZISqqbyAjN5qE8o4RXeTbjLNMYBOdRCA5W+cjP3t8pw
 lurUs8/5J7KbaRCpdT4csgGbtxWKTu2RJjvokFxe5ZpStZcTta1lTmvSAFSftOwzWyl+
 IvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=gvGBV8fyT3L+Y1nmH23oV05tZbLCqLFMAy8FkCnq2vk=;
 b=mFPKs8yhOAOWL5JFFF2jBI6aY4d7khLbDyxVEqM3wv+lklcH4hUozGVazs0UY8xXMM
 7POrvJItKeF8+Enix5tPAjQml4vvi85SX+cFEB64M8cy9mYKMNhdEAWpL1fD2MUbPkPZ
 nsBQdw2FbSrLjBPhSQVaLjitqA1NoNfaCpZLosIeWB4faWWF0/aJ9rW5pPpMwJpoN0dq
 R1W3GNyojztnPIM6WH5Makd/NEQBzbCWgUBpt6jxQAFB9Kj2UyxclwI8mzZCItnx+v4X
 25a/B9oihP4DUdaYEOlAVYUnxPvuEnkDNO+68wLe57W4wHJgMq//TA8gPMu1G54+mXDu
 9IRA==
X-Gm-Message-State: AOAM531wL4cHssIavYxBTm0+884OoJTfkEg0SNfi2sKI+j60erSBb0NN
 K2lr88zVgjxWjy2Hzusp3vo=
X-Google-Smtp-Source: ABdhPJx3mh2op8hP5h+kCZ9U+Ht+vpK2wEM3wQzPjlxJlZrxJJdLZHVePrjcn3WdJFOX1aM93BO9Rg==
X-Received: by 2002:aa7:82cb:0:b029:2e6:f397:d248 with SMTP id
 f11-20020aa782cb0000b02902e6f397d248mr19863836pfn.52.1623637926387; 
 Sun, 13 Jun 2021 19:32:06 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id t14sm11154757pgk.21.2021.06.13.19.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:32:06 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:32:01 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 08/17] powerpc/pseries/vas: Define VAS/NXGZIP hcalls
 and structs
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <2355e34fbffcf0a5e846bd63d9d7bef89100ddfe.camel@linux.ibm.com>
In-Reply-To: <2355e34fbffcf0a5e846bd63d9d7bef89100ddfe.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623637767.dmlgvd88am.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of June 13, 2021 8:59 pm:
>=20
> This patch adds hcalls and other definitions. Also define structs
> that are used in VAS implementation on PowerVM.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

I haven't got the specs to verify it against, but previous comments on=20
naming etc are resolved or withdrawn.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick


> ---
>  arch/powerpc/include/asm/hvcall.h    |   7 ++
>  arch/powerpc/include/asm/vas.h       |  30 +++++++
>  arch/powerpc/platforms/pseries/vas.h | 125 +++++++++++++++++++++++++++
>  3 files changed, 162 insertions(+)
>  create mode 100644 arch/powerpc/platforms/pseries/vas.h
>=20
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index e3b29eda8074..7c3418d1b5e9 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -294,6 +294,13 @@
>  #define H_RESIZE_HPT_COMMIT	0x370
>  #define H_REGISTER_PROC_TBL	0x37C
>  #define H_SIGNAL_SYS_RESET	0x380
> +#define H_ALLOCATE_VAS_WINDOW	0x388
> +#define H_MODIFY_VAS_WINDOW	0x38C
> +#define H_DEALLOCATE_VAS_WINDOW	0x390
> +#define H_QUERY_VAS_WINDOW	0x394
> +#define H_QUERY_VAS_CAPABILITIES	0x398
> +#define H_QUERY_NX_CAPABILITIES	0x39C
> +#define H_GET_NX_FAULT		0x3A0
>  #define H_INT_GET_SOURCE_INFO   0x3A8
>  #define H_INT_SET_SOURCE_CONFIG 0x3AC
>  #define H_INT_GET_SOURCE_CONFIG 0x3B0
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 1acf2b18c2d1..eefc758d8cd4 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -160,6 +160,7 @@ struct vas_tx_win_attr {
>  	bool rx_win_ord_mode;
>  };
> =20
> +#ifdef CONFIG_PPC_POWERNV
>  /*
>   * Helper to map a chip id to VAS id.
>   * For POWER9, this is a 1:1 mapping. In the future this maybe a 1:N
> @@ -225,6 +226,35 @@ int vas_paste_crb(struct vas_window *win, int offset=
, bool re);
>  int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_t=
ype,
>  			     const char *name);
>  void vas_unregister_api_powernv(void);
> +#endif
> +
> +#ifdef CONFIG_PPC_PSERIES
> +
> +/* VAS Capabilities */
> +#define VAS_GZIP_QOS_FEAT	0x1
> +#define VAS_GZIP_DEF_FEAT	0x2
> +#define VAS_GZIP_QOS_FEAT_BIT	PPC_BIT(VAS_GZIP_QOS_FEAT) /* Bit 1 */
> +#define VAS_GZIP_DEF_FEAT_BIT	PPC_BIT(VAS_GZIP_DEF_FEAT) /* Bit 2 */
> +
> +/* NX Capabilities */
> +#define VAS_NX_GZIP_FEAT	0x1
> +#define VAS_NX_GZIP_FEAT_BIT	PPC_BIT(VAS_NX_GZIP_FEAT) /* Bit 1 */
> +
> +/*
> + * These structs are used to retrieve overall VAS capabilities that
> + * the hypervisor provides.
> + */
> +struct hv_vas_all_caps {
> +	__be64  descriptor;
> +	__be64  feat_type;
> +} __packed __aligned(0x1000);
> +
> +struct vas_all_caps {
> +	u64     descriptor;
> +	u64     feat_type;
> +};
> +
> +#endif
> =20
>  /*
>   * Register / unregister coprocessor type to VAS API which will be expor=
ted
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> new file mode 100644
> index 000000000000..3a798102de93
> --- /dev/null
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright 2020-21 IBM Corp.
> + */
> +
> +#ifndef _VAS_H
> +#define _VAS_H
> +#include <asm/vas.h>
> +#include <linux/mutex.h>
> +#include <linux/stringify.h>
> +
> +/*
> + * VAS window modify flags
> + */
> +#define VAS_MOD_WIN_CLOSE	PPC_BIT(0)
> +#define VAS_MOD_WIN_JOBS_KILL	PPC_BIT(1)
> +#define VAS_MOD_WIN_DR		PPC_BIT(3)
> +#define VAS_MOD_WIN_PR		PPC_BIT(4)
> +#define VAS_MOD_WIN_SF		PPC_BIT(5)
> +#define VAS_MOD_WIN_TA		PPC_BIT(6)
> +#define VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR | \
> +				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
> +
> +#define VAS_WIN_ACTIVE		0x0
> +#define VAS_WIN_CLOSED		0x1
> +#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
> +/* Process of being modified, deallocated, or quiesced */
> +#define VAS_WIN_MOD_IN_PROCESS	0x3
> +
> +#define VAS_COPY_PASTE_USER_MODE	0x00000001
> +#define VAS_COP_OP_USER_MODE		0x00000010
> +
> +/*
> + * Co-processor feature - GZIP QoS windows or GZIP default windows
> + */
> +enum vas_cop_feat_type {
> +	VAS_GZIP_QOS_FEAT_TYPE,
> +	VAS_GZIP_DEF_FEAT_TYPE,
> +	VAS_MAX_FEAT_TYPE,
> +};
> +
> +/*
> + * Use to get feature specific capabilities from the
> + * hypervisor.
> + */
> +struct hv_vas_ct_caps {
> +	__be64	descriptor;
> +	u8	win_type;		/* Default or QoS type */
> +	u8	user_mode;
> +	__be16	max_lpar_creds;
> +	__be16	max_win_creds;
> +	union {
> +		__be16	reserved;
> +		__be16	def_lpar_creds; /* Used for default capabilities */
> +	};
> +	__be16	target_lpar_creds;
> +} __packed __aligned(0x1000);
> +
> +/*
> + * Feature specific (QoS or default) capabilities.
> + */
> +struct vas_ct_caps {
> +	u64		descriptor;
> +	u8		win_type;	/* Default or QoS type */
> +	u8		user_mode;	/* User mode copy/paste or COP HCALL */
> +	u16		max_lpar_creds;	/* Max credits available in LPAR */
> +	/* Max credits can be assigned per window */
> +	u16		max_win_creds;
> +	union {
> +		u16	reserved;	/* Used for QoS credit type */
> +		u16	def_lpar_creds; /* Used for default credit type */
> +	};
> +	/* Total LPAR available credits. Can be different from max LPAR */
> +	/* credits due to DLPAR operation */
> +	atomic_t	target_lpar_creds;
> +	atomic_t	used_lpar_creds; /* Used credits so far */
> +	u16		avail_lpar_creds; /* Remaining available credits */
> +};
> +
> +/*
> + * Feature (QoS or Default) specific to store capabilities and
> + * the list of open windows.
> + */
> +struct vas_caps {
> +	struct vas_ct_caps caps;
> +	struct list_head list;	/* List of open windows */
> +};
> +
> +/*
> + * To get window information from the hypervisor.
> + */
> +struct hv_vas_win_lpar {
> +	__be16	version;
> +	u8	win_type;
> +	u8	status;
> +	__be16	credits;	/* No of credits assigned to this window */
> +	__be16	reserved;
> +	__be32	pid;		/* LPAR Process ID */
> +	__be32	tid;		/* LPAR Thread ID */
> +	__be64	win_addr;	/* Paste address */
> +	__be32	interrupt;	/* Interrupt when NX request completes */
> +	__be32	fault;		/* Interrupt when NX sees fault */
> +	/* Associativity Domain Identifiers as returned in */
> +	/* H_HOME_NODE_ASSOCIATIVITY */
> +	__be64	domain[6];
> +	__be64	win_util;	/* Number of bytes processed */
> +} __packed __aligned(0x1000);
> +
> +struct pseries_vas_window {
> +	struct vas_window vas_win;
> +	u64 win_addr;		/* Physical paste address */
> +	u8 win_type;		/* QoS or Default window */
> +	u32 complete_irq;	/* Completion interrupt */
> +	u32 fault_irq;		/* Fault interrupt */
> +	u64 domain[6];		/* Associativity domain Ids */
> +				/* this window is allocated */
> +	u64 util;
> +
> +	/* List of windows opened which is used for LPM */
> +	struct list_head win_list;
> +	u64 flags;
> +	char *name;
> +	int fault_virq;
> +};
> +#endif /* _VAS_H */
> --=20
> 2.18.2
>=20
>=20
>=20
