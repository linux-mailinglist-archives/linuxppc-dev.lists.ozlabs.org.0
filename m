Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE3D2AD197
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:47:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVhMT0SwTzDqjd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:47:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gSn+R8Pv; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVhKR5hG2zDqL5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:46:03 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id h6so9572711pgk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=G12SAfGo9zxDhW2sfOaoLT7Ktw6spyrLizVoU+CQKHg=;
 b=gSn+R8PvB0P75cPhWXK+AsCwd1kW9Tg0e7bVX8Adq5UK5mqsZ/vFjOW+uF4KBrQuTa
 zC3NG8kF2qe106t3HxD3K+16SQ41jWl2CcbDYzg2g64RRjTNKDpATn4oEexEuWLnNiZB
 wCoZdjyFdjKvKEqxx7z+MgDSO763uFB305vnamPJ1Wm1mZZzcwpMf+faPFMtRIMWJHkW
 0V1g4n0bpfbW6BHapxmZFJZfz1Qo8zxafu0RbuS+yD8xLX+ZfKpOqQZDTUoI9vvufVjW
 LePiITZ5+cPkb0/mVZ9QLJr6afGgijF0L8M52WvfTTz1IwZvzZlv1Mmg9cEsgNaG7Eak
 kiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=G12SAfGo9zxDhW2sfOaoLT7Ktw6spyrLizVoU+CQKHg=;
 b=e0TAgFiVfXF/7mOifmpg45YJl8B9yH6+ON/YlQcheUITwfbUFrE2Z76F/fMRSCCsp8
 4I5WDuQFCHgpV66egJ9PaUunSMB+iGKsddp+5dsMAYWnwCvfW6WrkdzXfdEfH9hbjpKJ
 WlykzshzerlkaqWF6F/+1OpgE6Ajs1gUAwVXplryLElEqylfN0O1zEt8a3Jr+7nvC7/T
 cSqGGeXlJkAo29IWZlQc6jL6dNyowz6TN6G/4qVBeyhC/NzEhnS3RzLQjXwr5RfxMsne
 KguvmPWHNL+MAhZ3W9ZAcFxTVvtjNxATcjS6EIzIrMLtRKcQ8AS77IQiHRQagrskRknN
 dAIw==
X-Gm-Message-State: AOAM530ZWpJ6XZG40+EFx8WnlBeoOvAfBD032q8fz247Hu5cFgwgT5K3
 1gORY/3v6arGE9BHU3bm4eU=
X-Google-Smtp-Source: ABdhPJx3np16kym1rMkDTZ30+yq2VJ/D3E5goHBnPjVIZz1lnC6ahLzpM+leXGVqEKHqMwYhBOGxrQ==
X-Received: by 2002:a17:90b:b12:: with SMTP id
 bf18mr3642616pjb.205.1604997959304; 
 Tue, 10 Nov 2020 00:45:59 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id c9sm13577108pfc.197.2020.11.10.00.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 00:45:58 -0800 (PST)
Date: Tue, 10 Nov 2020 18:45:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/3] powerpc/64s: Replace RFI by RFI_TO_KERNEL and
 remove RFI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1604997906.z9qht3tf9f.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 9, 2020 2:57 am:
> In head_64.S, we have two places using RFI to return to
> kernel. Use RFI_TO_KERNEL instead.
>=20
> They are the two only places using RFI on book3s/64, so
> the RFI macro can go away.

Looks good to me.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/ppc_asm.h | 1 -
>  arch/powerpc/kernel/head_64.S      | 9 +++++++--
>  2 files changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/as=
m/ppc_asm.h
> index 511786f0e40d..bedf3eb52ebc 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -495,7 +495,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_C=
ELL_TB_BUG, 96)
>  #endif
> =20
>  #ifdef CONFIG_PPC_BOOK3S_64
> -#define RFI		rfid
>  #define MTMSRD(r)	mtmsrd	r
>  #define MTMSR_EERI(reg)	mtmsrd	reg,1
>  #else
> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.=
S
> index 1510b2a56669..ecf9a88988ff 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -41,6 +41,11 @@
>  #include <asm/ppc-opcode.h>
>  #include <asm/export.h>
>  #include <asm/feature-fixups.h>
> +#ifdef CONFIG_PPC_BOOK3S
> +#include <asm/exception-64s.h>
> +#else
> +#include <asm/exception-64e.h>
> +#endif
> =20
>  /* The physical memory is laid out such that the secondary processor
>   * spin code sits at 0x0000...0x00ff. On server, the vectors follow
> @@ -829,7 +834,7 @@ __secondary_start:
> =20
>  	mtspr	SPRN_SRR0,r3
>  	mtspr	SPRN_SRR1,r4
> -	RFI
> +	RFI_TO_KERNEL
>  	b	.	/* prevent speculative execution */
> =20
>  /*=20
> @@ -966,7 +971,7 @@ start_here_multiplatform:
>  	ld	r4,PACAKMSR(r13)
>  	mtspr	SPRN_SRR0,r3
>  	mtspr	SPRN_SRR1,r4
> -	RFI
> +	RFI_TO_KERNEL
>  	b	.	/* prevent speculative execution */
> =20
>  	/* This is where all platforms converge execution */
> --=20
> 2.25.0
>=20
>=20
