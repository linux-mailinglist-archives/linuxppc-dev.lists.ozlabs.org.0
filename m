Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30F19A7D8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 10:52:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sg2263mYzDr4q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 19:52:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1NQnvn8m; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sfwz1Ng4zDqyY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 19:48:18 +1100 (AEDT)
Received: by mail-ed1-x541.google.com with SMTP id o1so10452663edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AtwLbCqmqvz42BIBfrvBd67JNfGvzVf9CtVg6xG0MDo=;
 b=1NQnvn8mdX9DuQU55yHb6kM7GOE2cZXTLfXFTFxLhUegcVz4S1+s3ZBa57yNaFgaL3
 Of91mzhfbjU3BHyMXm/x0yEhWTDO4TAOYRaNkO6T/LWY+pOTfeJwuvMM0Q/2Rk8OpA6d
 zFut98XrtA7J3P7P5yZ9wWZX1Gipxb4iC8phf5nmrtY6ZT+vPhTZtKBXAjVkEzVudyB2
 Hwz+whcmlJFAQ+A7PQcCxI9lhP5nffN9YpWYUM+Yg9pko1uKyCswbkhh+OOE189UCQGC
 mCDxtwyiXRmrVvL9V5gXcvmE1Qs1WIfL7JJwQvOCX/zR4/bV+SuAmYsH06eTMp1FGEL9
 05GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AtwLbCqmqvz42BIBfrvBd67JNfGvzVf9CtVg6xG0MDo=;
 b=P0vx4V8pjVjQUUvwwxiuLjJgjwJXLRnv9mZYh2MpvBWMwZdcNgZz1fPGB2Mi2jkI3T
 kiy3lvcSxUdfU2hTumhxVmM1yGZ/hBWNcgIV9yhrNP/umsvChfVDp9NC6nRPYOU6CSzj
 CbPrBmOerKIxwUPHdMrCfQechdEfnl0FhMnBmto339cGtnmy1d2Oetm0O1wphqVpf5ZB
 xcZ+1wyCt3lubbr3alxkKqlv4kSIDobb5Qz2cIuKmy7WS17OZ7E8LDr8TyCnijvQitGb
 mMrpOtA+ViDWWWEQN9Uml2/y2ImKuhLGCXa7ZC7l3EgRxBHa0n2a4bjCtgb/CG+q6de7
 D+YA==
X-Gm-Message-State: ANhLgQ0B3f4gTfAL3qofb9yxgFoTCOg+LpbPYEReq3AgvnBHMKTpoLRj
 9NwJILh9gjJEX+S6GkmjeE1rTUjN6W3atODq5isRLA==
X-Google-Smtp-Source: ADFU+vuJwhmchfCPkTtH5Ynz0giXt5bXNBUEx5wVctahGqCgUow/QrKV4szBeXwU2Z8TB249fauEQ8jxV+fGCd1JPZA=
X-Received: by 2002:a05:6402:1c8b:: with SMTP id
 cy11mr7881800edb.102.1585730894443; 
 Wed, 01 Apr 2020 01:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-2-alastair@d-silva.org>
In-Reply-To: <20200327071202.2159885-2-alastair@d-silva.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Apr 2020 01:48:03 -0700
Message-ID: <CAPcyv4hX9RTWKSLB8OcYY6MK-z5u5WWSaYSGa-8oqPbWU7st8w@mail.gmail.com>
Subject: Re: [PATCH v4 01/25] powerpc/powernv: Add OPAL calls for LPC memory
 alloc/release
To: "Alastair D'Silva" <alastair@d-silva.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 29, 2020 at 10:23 PM Alastair D'Silva <alastair@d-silva.org> wrote:
>
> Add OPAL calls for LPC memory alloc/release
>

This seems to be referencing an existing api definition, can you
include a pointer to the spec in case someone wanted to understand
what these routines do? I suspect this is not allocating memory in the
traditional sense as much as it's allocating physical address space
for a device to be mapped?


> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/opal-api.h        | 2 ++
>  arch/powerpc/include/asm/opal.h            | 2 ++
>  arch/powerpc/platforms/powernv/opal-call.c | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
> index c1f25a760eb1..9298e603001b 100644
> --- a/arch/powerpc/include/asm/opal-api.h
> +++ b/arch/powerpc/include/asm/opal-api.h
> @@ -208,6 +208,8 @@
>  #define OPAL_HANDLE_HMI2                       166
>  #define        OPAL_NX_COPROC_INIT                     167
>  #define OPAL_XIVE_GET_VP_STATE                 170
> +#define OPAL_NPU_MEM_ALLOC                     171
> +#define OPAL_NPU_MEM_RELEASE                   172
>  #define OPAL_MPIPL_UPDATE                      173
>  #define OPAL_MPIPL_REGISTER_TAG                        174
>  #define OPAL_MPIPL_QUERY_TAG                   175
> diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
> index 9986ac34b8e2..301fea46c7ca 100644
> --- a/arch/powerpc/include/asm/opal.h
> +++ b/arch/powerpc/include/asm/opal.h
> @@ -39,6 +39,8 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
>                                 uint64_t PE_handle);
>  int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
>                         uint64_t rate_phys, uint32_t size);
> +int64_t opal_npu_mem_alloc(u64 phb_id, u32 bdfn, u64 size, __be64 *bar);
> +int64_t opal_npu_mem_release(u64 phb_id, u32 bdfn);
>
>  int64_t opal_console_write(int64_t term_number, __be64 *length,
>                            const uint8_t *buffer);
> diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
> index 5cd0f52d258f..f26e58b72c04 100644
> --- a/arch/powerpc/platforms/powernv/opal-call.c
> +++ b/arch/powerpc/platforms/powernv/opal-call.c
> @@ -287,6 +287,8 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,             OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
>  OPAL_CALL(opal_sensor_read_u64,                        OPAL_SENSOR_READ_U64);
>  OPAL_CALL(opal_sensor_group_enable,            OPAL_SENSOR_GROUP_ENABLE);
>  OPAL_CALL(opal_nx_coproc_init,                 OPAL_NX_COPROC_INIT);
> +OPAL_CALL(opal_npu_mem_alloc,                  OPAL_NPU_MEM_ALLOC);
> +OPAL_CALL(opal_npu_mem_release,                        OPAL_NPU_MEM_RELEASE);
>  OPAL_CALL(opal_mpipl_update,                   OPAL_MPIPL_UPDATE);
>  OPAL_CALL(opal_mpipl_register_tag,             OPAL_MPIPL_REGISTER_TAG);
>  OPAL_CALL(opal_mpipl_query_tag,                        OPAL_MPIPL_QUERY_TAG);
> --
> 2.24.1
>
