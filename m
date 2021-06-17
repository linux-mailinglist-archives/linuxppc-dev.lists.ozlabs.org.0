Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3132F3ABF5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 01:28:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5dX23Gdhz3c3y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 09:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sg64B7iT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sg64B7iT; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5dWb3H4Vz3bsG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 09:27:38 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so6829387pjo.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 16:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mJE3vn89L8/9BwSz8wTo8P/yLsaHXdWdVlVTB99IrQw=;
 b=sg64B7iTgVNF2/ubNs03b6i+SVZXHydv7axmVRMwFRLRGF2IFM2KivPII5dDie5zy0
 EfdXmAPhpMcvldd/Nh+3mb7P7uZbYIADKya9+r9m6AnDtQkpqffuDmCniEzYLEGRAF6B
 fac4Bj9yol6KYAWtKBSKpIxTzGswqt4xIdA1NNhgUfhQKBHPa7PgC3OKmUZVCg2lXOfO
 eXZlRyyFnJzw+xx90sC+gamRkDfnqMsxcfXcMcTlzJEI3FXqkaoablzm6GWPAE7lOyPq
 TxbtyoqnTAxlg92kwLm1Og4e3FnS2wY3sqVxXAmbSwvuXs9InJywUcQVLhpzmP3BqRTC
 irwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mJE3vn89L8/9BwSz8wTo8P/yLsaHXdWdVlVTB99IrQw=;
 b=AliiSg7wJad7tlqWRTMBbxOD94L4LTmOqWH2iShtbE5MMRtIcgYnm1ah+27pKgCdEW
 gbaVil6fKxgWrdzsVp4Ss4uI0FU77vfuMLgkUNbB/7QF4f/+XpJjOVlVkRErBSGxML7L
 DCOQqP1WzZXL2YFTiWG5F3qga7D9tEC2pVjjd7yvRdBZTdCBbRiw+Q9jLQ3wqwWIy9+M
 bpwH6ZLJTL0G+peJeWNIyVb4xJUM5g0seoEARtw8jdfyRQFt2fa81JXcmKQI6TzfgBOm
 Gg5YG65ET8aUikiP/tjwftzLvUw2mmSrR5dw7mRaOvHkxyOtHzOZ98fezb/AHvvBlufM
 ALtw==
X-Gm-Message-State: AOAM530ogs1gYOWrg9z3fsz3QEYc4caz9Wiek344ak5R++KS55i+UCAi
 woXy6Nnt2z+z3B5S3XDkelY=
X-Google-Smtp-Source: ABdhPJy0y2W8C9jd99x+VfO8xyAJhEj7y9qnJvlWDxqtHyZv6oruEfG1SDhlGUe0iEVohuMpX/RW2Q==
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr6421593pjh.76.1623972455763; 
 Thu, 17 Jun 2021 16:27:35 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id f7sm6084744pfk.191.2021.06.17.16.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 16:27:35 -0700 (PDT)
Date: Fri, 18 Jun 2021 09:27:29 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 04/17] powerpc/vas: Add platform specific user window
 operations
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
 <f85091f4ace67f951ac04d60394d67b21e2f5d3c.camel@linux.ibm.com>
In-Reply-To: <f85091f4ace67f951ac04d60394d67b21e2f5d3c.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623972363.whor4uwn96.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 18, 2021 6:31 am:
>=20
> PowerNV uses registers to open/close VAS windows, and getting the
> paste address. Whereas the hypervisor calls are used on PowerVM.
>=20
> This patch adds the platform specific user space window operations
> and register with the common VAS user space interface.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/vas.h              | 16 +++++--
>  arch/powerpc/platforms/book3s/vas-api.c     | 53 +++++++++++++--------
>  arch/powerpc/platforms/powernv/vas-window.c | 45 ++++++++++++++++-
>  arch/powerpc/platforms/powernv/vas.h        |  2 +
>  4 files changed, 91 insertions(+), 25 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 6076adf9ab4f..163a8bb85d02 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -5,6 +5,7 @@
> =20
>  #ifndef _ASM_POWERPC_VAS_H
>  #define _ASM_POWERPC_VAS_H
> +#include <uapi/asm/vas-api.h>
> =20
>  struct vas_window;
> =20
> @@ -48,6 +49,16 @@ enum vas_cop_type {
>  	VAS_COP_TYPE_MAX,
>  };
> =20
> +/*
> + * User space window operations used for powernv and powerVM
> + */
> +struct vas_user_win_ops {
> +	struct vas_window * (*open_win)(int vas_id, u64 flags,
> +				enum vas_cop_type);

Thanks for changing that to not pass down the struct passed in by the=20
user. Looks good.

Thanks,
Nick

