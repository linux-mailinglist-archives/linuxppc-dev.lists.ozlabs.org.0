Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E146AD6AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:08:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW3Pr66mXz3f3M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 16:08:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jVS7t3pw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jVS7t3pw;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW3Nx0sX6z300C
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 16:08:00 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id i3so12893312plg.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 21:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678165678;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cerkYXVbu0URi9ccp6U7ta2fpAAN/38HhqncKXgEBM=;
        b=jVS7t3pwHdqAgiQzs/Eu5b3JG44b3/JFrhGyZYuNnfhrmRXE1PfSb8CgZpfDdBQdLH
         1ukxnimSq4CQgqzekXoi5t0rrc4XOXdoTZVCDJFgvv+08bbw8Bn8zDqTjTruvgHLfA+L
         NFZ68BDs5Gxn8aqy7xpbTkVpwfhPBxyVXUNh2Rx1rKKrBZyhJDYMevKRtFVLg8ddwm5X
         8UHPMKiFow2EoSLqcU3bCNu9ZVyZliWEUEDBOWSKOmxt4djxOqqjZH4n3J4+hkVlHQov
         eSAyffmufebu8u7iSamu1b05DYduKq22yrMCXpxkiSxbgaYB4447m9Qjr0QDep/qD3V2
         2vkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678165678;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2cerkYXVbu0URi9ccp6U7ta2fpAAN/38HhqncKXgEBM=;
        b=blgO4HsyIQ4ox1cvOQyjzdIYOsokHk+GNmfEvIzkBRB/bePiF1PHAtooTPPRLY3tRe
         31uCM/58hgP3doNW52YUUIF1+bdpag5F4nxIeBIqZw+JYwdd4UMwVyYVUvPF9i956faK
         7lWg5dgwprFpHnueX6EORmLCwB2edbaqdsqQLvD1KPQ7LVUcmg+H1759gsy1S59YjbHi
         k15swpltU3aOm1s4odl2A1bmVUGH5AmjFMMMxtak3UHRdTHkpVUK7k9nQ8GgWr/uv8fB
         7R+yAguDreJ+VrH2TlDmYLVoeTh0/rmAIbAFBkePQk6POKitJ5HHgf5AWHTvsC1kmo9z
         xjPA==
X-Gm-Message-State: AO0yUKV2u0rpeUquAfj0vZWvsOrMfKbEwS7/djoXPaiBS00MvSK68+XV
	WJF7FbjymEFbF0zE4hju5rA=
X-Google-Smtp-Source: AK7set9NP9z/POyu5+TRI/IlQrppY7U7cLGZI1NUtpVypi/csY/TTejBi6pizXd8hkgDvyO55PA4Jg==
X-Received: by 2002:a17:902:c407:b0:19e:21d0:5b90 with SMTP id k7-20020a170902c40700b0019e21d05b90mr19936752plk.4.1678165678155;
        Mon, 06 Mar 2023 21:07:58 -0800 (PST)
Received: from localhost ([203.220.77.23])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902900800b0019a70a42b0asm7542949plp.169.2023.03.06.21.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 21:07:57 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Mar 2023 15:07:52 +1000
Message-Id: <CQZW2Z6JU55U.2M24IU59IQZ4D@bobo>
To: "Benjamin Gray" <bgray@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [RFC PATCH 05/13] prctl: Define PowerPC DEXCR interface
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20221128024458.46121-1-bgray@linux.ibm.com>
 <20221128024458.46121-6-bgray@linux.ibm.com>
In-Reply-To: <20221128024458.46121-6-bgray@linux.ibm.com>
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
Cc: linux-hardening@vger.kernel.org, ajd@linux.ibm.com, cmr@bluescreens.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 28, 2022 at 12:44 PM AEST, Benjamin Gray wrote:
> Adds the definitions and generic handler for prctl control of the
> PowerPC Dynamic Execution Control Register (DEXCR).

Assuming we'd go with the later prctl patches, this prep patch
is nice way to split out some of the mechanism.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  include/uapi/linux/prctl.h | 14 ++++++++++++++
>  kernel/sys.c               | 16 ++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> index a5e06dcbba13..b4720e8de6f3 100644
> --- a/include/uapi/linux/prctl.h
> +++ b/include/uapi/linux/prctl.h
> @@ -281,6 +281,20 @@ struct prctl_mm_map {
>  # define PR_SME_VL_LEN_MASK		0xffff
>  # define PR_SME_VL_INHERIT		(1 << 17) /* inherit across exec */
> =20
> +/* PowerPC Dynamic Execution Control Register (DEXCR) controls */
> +#define PR_PPC_GET_DEXCR		65
> +#define PR_PPC_SET_DEXCR		66
> +/* DEXCR aspect to act on */
> +# define PR_PPC_DEXCR_SBHE		0 /* Speculative branch hint enable */
> +# define PR_PPC_DEXCR_IBRTPD		1 /* Indirect branch recurrent target pred=
iction disable */
> +# define PR_PPC_DEXCR_SRAPD		2 /* Subroutine return address prediction d=
isable */
> +# define PR_PPC_DEXCR_NPHIE		3 /* Non-privileged hash instruction enable=
 */
> +/* Action to apply / return */
> +# define PR_PPC_DEXCR_PRCTL		(1 << 0)
> +# define PR_PPC_DEXCR_SET_ASPECT	(1 << 1)
> +# define PR_PPC_DEXCR_FORCE_SET_ASPECT	(1 << 2)
> +# define PR_PPC_DEXCR_CLEAR_ASPECT	(1 << 3)
> +
>  #define PR_SET_VMA		0x53564d41
>  # define PR_SET_VMA_ANON_NAME		0
> =20
> diff --git a/kernel/sys.c b/kernel/sys.c
> index 5fd54bf0e886..55b8f7369059 100644
> --- a/kernel/sys.c
> +++ b/kernel/sys.c
> @@ -139,6 +139,12 @@
>  #ifndef GET_TAGGED_ADDR_CTRL
>  # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
>  #endif
> +#ifndef PPC_GET_DEXCR_ASPECT
> +# define PPC_GET_DEXCR_ASPECT(a, b)	(-EINVAL)
> +#endif
> +#ifndef PPC_SET_DEXCR_ASPECT
> +# define PPC_SET_DEXCR_ASPECT(a, b, c)	(-EINVAL)
> +#endif
> =20
>  /*
>   * this is where the system-wide overflow UID and GID are defined, for
> @@ -2623,6 +2629,16 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long,=
 arg2, unsigned long, arg3,
>  		error =3D sched_core_share_pid(arg2, arg3, arg4, arg5);
>  		break;
>  #endif
> +	case PR_PPC_GET_DEXCR:
> +		if (arg3 || arg4 || arg5)
> +			return -EINVAL;
> +		error =3D PPC_GET_DEXCR_ASPECT(me, arg2);
> +		break;
> +	case PR_PPC_SET_DEXCR:
> +		if (arg4 || arg5)
> +			return -EINVAL;
> +		error =3D PPC_SET_DEXCR_ASPECT(me, arg2, arg3);
> +		break;
>  	case PR_SET_VMA:
>  		error =3D prctl_set_vma(arg2, arg3, arg4, arg5);
>  		break;
> --=20
> 2.38.1

