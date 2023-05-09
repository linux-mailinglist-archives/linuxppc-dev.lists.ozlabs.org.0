Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE326FBD41
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhwl70rkz3fL3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:31:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f+UVcYNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=f+UVcYNA;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhvt1C4Yz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:30:17 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-24e1d272b09so3933927a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683599415; x=1686191415;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQBPI70dx62myFNxrFTSto1g2tMRWLj+RSa0sf0haqc=;
        b=f+UVcYNAdS6OXZKrn0IK6vR5X3JrYoUzrrMYqsSxKJPKH9BaHyHuVFCC7nbEQwwocP
         zkBiUkWprAW9t2ntj3kSAQ8bqJp1FQaomcwK4NdnGfVVfkDKHGcegpoA563AP7+VHcTc
         gEmsiRCKKDWY0h0eYZkUaFQpDMdrWAhCd2xUQaLhb6koRu8eJiZJCSav3sWYr+n6m390
         iY/3D4GckAYDpq/PI4n9vJ0BSXGuoT6LKwAUOkatfKKEjIh4C1+3ac8Cp//D1qBxrCcV
         dastQ0Fo42C7rz+1tpUY+vxX1uqtlBVmTcgIclkF1txlQwtKJNfCdStmH/LMrC8qVqBU
         JwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683599415; x=1686191415;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQBPI70dx62myFNxrFTSto1g2tMRWLj+RSa0sf0haqc=;
        b=Z1p92iwHEEV4q4bicKEOFObXfxr/TI6u1aXkbEaOjQRcgUVjPpyuDDsz0WGeydyZJe
         NDJopnrrVp9z5syYbDDTlexz3igD6YX3iQJmMNlDT6DAt5uZXcjXY4/N4aVbIRgRIp4U
         5A6CEhrxgXp28lYc79PDZVXuZV578Yfo2jyad876ObJMUGsopz32uqe3bQcWfkiZ2JrR
         Xqc1zfhzIjl2XUmczk+maol1XnD/O7NsPapF5Q1jeMhNYfi0dTQIvkklyamzIMQtGd4l
         NvEIzB9SwIXE45nJTRjUO0g//tl0dJz1I3l7267419HGou8jqMCLSWFMFK/DplGRq5fn
         BK2Q==
X-Gm-Message-State: AC+VfDy6uhfK4eBn8V7SrAHfHsaLLkrUln3OeVG2SZv4YKR/vlwYE+9y
	xgbZ+v+BzA8RqEXzyAObMSU=
X-Google-Smtp-Source: ACHHUZ6wICurxjnr/Y2HmGI9WDPlcq7iAm7BCv9AaXNmd1NAJH4GuSe6py3ZFURNqWepflruKhKEAw==
X-Received: by 2002:a17:90b:1d10:b0:23d:4229:f7cf with SMTP id on16-20020a17090b1d1000b0023d4229f7cfmr12882216pjb.41.1683599415140;
        Mon, 08 May 2023 19:30:15 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id bx15-20020a17090af48f00b00246f9725ffcsm18588353pjb.33.2023.05.08.19.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:30:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:30:08 +1000
Message-Id: <CSHE6J2OCIAI.2G4GIJFTX3JDR@wheely>
Subject: Re: [PATCH 09/12] powerpc: Mark writes registering ipi to host cpu
 through kvm
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-10-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-10-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> Mark writes to hypervisor ipi state so that KCSAN recognises these
> asynchronous issue of kvmppc_{set,clear}_host_ipi to be intended, with
> atomic writes.

How about READ_ONCE for the read side of host_ipi?

Thanks,
Nick

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kvm_ppc.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/as=
m/kvm_ppc.h
> index bc57d058ad5b..d701df006c08 100644
> --- a/arch/powerpc/include/asm/kvm_ppc.h
> +++ b/arch/powerpc/include/asm/kvm_ppc.h
> @@ -548,12 +548,12 @@ static inline void kvmppc_set_host_ipi(int cpu)
>  	 * pairs with the barrier in kvmppc_clear_host_ipi()
>  	 */
>  	smp_mb();
> -	paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 1;
> +	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 1);
>  }
> =20
>  static inline void kvmppc_clear_host_ipi(int cpu)
>  {
> -	paca_ptrs[cpu]->kvm_hstate.host_ipi =3D 0;
> +	WRITE_ONCE(paca_ptrs[cpu]->kvm_hstate.host_ipi, 0);
>  	/*
>  	 * order clearing of host_ipi flag vs. processing of IPI messages
>  	 *
> --=20
> 2.37.2

