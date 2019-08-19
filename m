Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E53EE9271F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:39:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BxQ06JxTzDqS9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:39:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jMMAgHS3"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BxBG2PGHzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:28:54 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id go14so1055083plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=g1/UhsGpab2huoNPYfjYR7z5xJe4sBwu+dlYxZJw49k=;
 b=jMMAgHS3zoiaNzMEUcmUgjr6gPEABAgsBi6k0p2sQa8P8pHKcQPRrru8ITglJxQ/0X
 zsy/uqPEE8EGDNTSZiugXTzmq1iu2hHO/tCotMqhdESeN1GjUmmq463qCh88MPL0CEVb
 zz36GZCHPW+fhZivXCxUZCmpmsgJfPX4cXT24UtQ2cTwcIBJFySECSx6Z5gaw7D51Eym
 wdu4ZJmpO8t/K1A5F0b/ZqNmsiK88RSUibuOj6D3beExU2y78Bx5wSzd/yww/7HTES4C
 ByXVWplr1NiberP0x8tGeOljLU3aAT7oBhrzuZqQ0OAGw1pyq841e4AMIgazCkv/ikQZ
 u4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=g1/UhsGpab2huoNPYfjYR7z5xJe4sBwu+dlYxZJw49k=;
 b=VLH+5p7/yQxCAkv8CriHMQsnOmlf7J7ymSpspHg1ilv0u5oFrZYqDyiZBn28Jv382k
 /KoXSLLhJYA90fNt4HY5+w1EjDr0PcPUVc5K+B+2/4a1GbaK0RsUKPesULtsnH80KHqL
 gVJfsdJ6ouW0sP+LWOottoEz0+azCiDDaduxS7pug6X2VN9Uf0W79uEfcBm98bU7b1gV
 UtRcCsjGp4pZ8He6xVd9PM+vt37Soj+kay6Qe5ao/aNS3kWl2iw4LUZWsbaoqx5rmAhc
 KaVyVM3GaAj4jVp6yKzu7vwESrkIoquO9z3nd6JqRPTRCCgcafmA2LHl+NnkBJXJA6w3
 zsqQ==
X-Gm-Message-State: APjAAAVThzgmli/qWPWA79dOqj1eaGcBp1LEUIq2xQvVJcu4df+LPp23
 SGNkrsnp/XNNsVEGrxegXSE=
X-Google-Smtp-Source: APXvYqyEjr4b6B13UJoHIE8vvVUqnED+Xe2pkMgDtpPBfdCtsyNSFc3mykM+gLpwYyHA6dXGhvbWGg==
X-Received: by 2002:a17:902:ba14:: with SMTP id
 j20mr13915360pls.84.1566224930295; 
 Mon, 19 Aug 2019 07:28:50 -0700 (PDT)
Received: from localhost (193-116-95-121.tpgi.com.au. [193.116.95.121])
 by smtp.gmail.com with ESMTPSA id k3sm27704498pfg.23.2019.08.19.07.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 07:28:49 -0700 (PDT)
Date: Tue, 20 Aug 2019 00:28:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
To: Linux Kernel <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Santosh Sivaraj <santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
 <20190815003941.18655-7-santosh@fossix.org>
In-Reply-To: <20190815003941.18655-7-santosh@fossix.org>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566224688.g0ntl10a9q.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Santosh Sivaraj's on August 15, 2019 10:39 am:
> From: Balbir Singh <bsingharora@gmail.com>
>=20
> If we take a UE on one of the instructions with a fixup entry, set nip
> to continue execution at the fixup entry. Stop processing the event
> further or print it.

The previous patch added these fixup entries and now you handle them
here. Which in theory seems to break bisecting. The patches should
either be merged, or this one moved ahead in the series.

I'm still not entirely happy with the ignore_event thing, but that's
probably more a symptom of the convoluted way machine check handling
and reporting is structured. For now it's probably fine.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/mce.h  |  4 +++-
>  arch/powerpc/kernel/mce.c       | 16 ++++++++++++++++
>  arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
>  3 files changed, 32 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mc=
e.h
> index f3a6036b6bc0..e1931c8c2743 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -122,7 +122,8 @@ struct machine_check_event {
>  			enum MCE_UeErrorType ue_error_type:8;
>  			u8		effective_address_provided;
>  			u8		physical_address_provided;
> -			u8		reserved_1[5];
> +			u8		ignore_event;
> +			u8		reserved_1[4];
>  			u64		effective_address;
>  			u64		physical_address;
>  			u8		reserved_2[8];
> @@ -193,6 +194,7 @@ struct mce_error_info {
>  	enum MCE_Initiator	initiator:8;
>  	enum MCE_ErrorClass	error_class:8;
>  	bool			sync_error;
> +	bool			ignore_event;
>  };
> =20
>  #define MAX_MC_EVT	100
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index a3b122a685a5..ec4b3e1087be 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -149,6 +149,7 @@ void save_mce_event(struct pt_regs *regs, long handle=
d,
>  		if (phys_addr !=3D ULONG_MAX) {
>  			mce->u.ue_error.physical_address_provided =3D true;
>  			mce->u.ue_error.physical_address =3D phys_addr;
> +			mce->u.ue_error.ignore_event =3D mce_err->ignore_event;
>  			machine_check_ue_event(mce);
>  		}
>  	}
> @@ -266,8 +267,17 @@ static void machine_process_ue_event(struct work_str=
uct *work)
>  		/*
>  		 * This should probably queued elsewhere, but
>  		 * oh! well
> +		 *
> +		 * Don't report this machine check because the caller has a
> +		 * asked us to ignore the event, it has a fixup handler which
> +		 * will do the appropriate error handling and reporting.
>  		 */
>  		if (evt->error_type =3D=3D MCE_ERROR_TYPE_UE) {
> +			if (evt->u.ue_error.ignore_event) {
> +				__this_cpu_dec(mce_ue_count);
> +				continue;
> +			}
> +
>  			if (evt->u.ue_error.physical_address_provided) {
>  				unsigned long pfn;
> =20
> @@ -301,6 +311,12 @@ static void machine_check_process_queued_event(struc=
t irq_work *work)
>  	while (__this_cpu_read(mce_queue_count) > 0) {
>  		index =3D __this_cpu_read(mce_queue_count) - 1;
>  		evt =3D this_cpu_ptr(&mce_event_queue[index]);
> +
> +		if (evt->error_type =3D=3D MCE_ERROR_TYPE_UE &&
> +		    evt->u.ue_error.ignore_event) {
> +			__this_cpu_dec(mce_queue_count);
> +			continue;
> +		}
>  		machine_check_print_event_info(evt, false, false);
>  		__this_cpu_dec(mce_queue_count);
>  	}
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_po=
wer.c
> index e74816f045f8..1dd87f6f5186 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -11,6 +11,7 @@
> =20
>  #include <linux/types.h>
>  #include <linux/ptrace.h>
> +#include <linux/extable.h>
>  #include <asm/mmu.h>
>  #include <asm/mce.h>
>  #include <asm/machdep.h>
> @@ -18,6 +19,7 @@
>  #include <asm/pte-walk.h>
>  #include <asm/sstep.h>
>  #include <asm/exception-64s.h>
> +#include <asm/extable.h>
> =20
>  /*
>   * Convert an address related to an mm to a physical address.
> @@ -559,9 +561,18 @@ static int mce_handle_derror(struct pt_regs *regs,
>  	return 0;
>  }
> =20
> -static long mce_handle_ue_error(struct pt_regs *regs)
> +static long mce_handle_ue_error(struct pt_regs *regs,
> +				struct mce_error_info *mce_err)
>  {
>  	long handled =3D 0;
> +	const struct exception_table_entry *entry;
> +
> +	entry =3D search_kernel_exception_table(regs->nip);
> +	if (entry) {
> +		mce_err->ignore_event =3D true;
> +		regs->nip =3D extable_fixup(entry);
> +		return 1;
> +	}
> =20
>  	/*
>  	 * On specific SCOM read via MMIO we may get a machine check
> @@ -594,7 +605,7 @@ static long mce_handle_error(struct pt_regs *regs,
>  				&phys_addr);
> =20
>  	if (!handled && mce_err.error_type =3D=3D MCE_ERROR_TYPE_UE)
> -		handled =3D mce_handle_ue_error(regs);
> +		handled =3D mce_handle_ue_error(regs, &mce_err);
> =20
>  	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
> =20
> --=20
> 2.21.0
>=20
>=20
=
