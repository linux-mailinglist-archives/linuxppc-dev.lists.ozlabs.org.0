Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF243C1D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 06:44:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfGM75VJhz2xX6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aF8Oc8xk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aF8Oc8xk; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfGLX5hkSz2xRm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 15:44:18 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id v10so520629pjr.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 21:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=L1HDK0O4PEJoarjnPknLHYAOD4FQi97D4WgPJm/h2O0=;
 b=aF8Oc8xkcC5MJZgDlZadb08Tqx1xs3OwiePcljjlfGFiCBCkVG4NcHfdP0WK0eU3ZR
 OMQmE07XJ3wMD/PDfs/RiaiVQKxEGAhxE17RQCN1mgheH7f37v3bj6eYIJpnjIHqN+1y
 sLN9eq/B595qXaJ9RdJlCfNczSia62mnrJPlrmkd5LEPeq9QqgcsuFOx9Jl6SA75HFcR
 mO25FgVm/17A1mYTC2UsWLls47w3b9hXCip1pkqWXUylcwtbLXYM/scqBVvinkZZH+n5
 2bBnwvDCUBTLp+QvCKfP6eZLBKtmHeeTpZjbSNIJHFAw0VrCuQ36j2WKZSbmBby62zQp
 OMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=L1HDK0O4PEJoarjnPknLHYAOD4FQi97D4WgPJm/h2O0=;
 b=RGKsz8l7jUyI/ck4JyDqsuGh1hxEzMuITxwj7kROemyXNzp3Thg04sMu52WG/ilzdp
 zEy3dYAcShGkySDuvzmw5kc29MFultjrzmxi5hJiioOJboBUNbIR51f4wWMRkBbe+wAo
 /k4nnhwbzRFAiOgILPggqhkRRaoU6J9qpbCo7sBPZIR4sRnyQlvCTFhoxRCaImv9asqT
 AU6CBQLKu01a7p/kJWZdQSOgdd4EDLcQDBIWEqabTmU0BRUwn2P3uLcSo1rU5tSxfciv
 5W6htYDfpb7EBPykN/C7jexUas/BEmDhbGS4KtBKW1dKL4tQfk2fHOTnGLper6D1Ydtq
 s0AA==
X-Gm-Message-State: AOAM531zo5xC35Tkd3oxRoVmprc9qZOGuPP/6xHDrGbzOKQnIqk7H9cg
 cEnawjd07XZk5c/tZNjbFuQ=
X-Google-Smtp-Source: ABdhPJy9trhlf3yZoe/kM+w0ybtSLtdBKEjAI2QoTaxq6oILbWQdvt5WnLT4gBK5jfynI8CDxxaLuA==
X-Received: by 2002:a17:90b:d96:: with SMTP id
 bg22mr2871547pjb.221.1635309855618; 
 Tue, 26 Oct 2021 21:44:15 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id a3sm27234221pfv.174.2021.10.26.21.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 21:44:15 -0700 (PDT)
Date: Wed, 27 Oct 2021 14:44:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/book3e: Fix set_memory_x() and set_memory_nx()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
 <c41100f9c144dc5b62e5a751b810190c6b5d42fd.1635226743.git.christophe.leroy@csgroup.eu>
In-Reply-To: <c41100f9c144dc5b62e5a751b810190c6b5d42fd.1635226743.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1635309296.3vv9pb80wz.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 26, 2021 3:39 pm:
> set_memory_x() calls pte_mkexec() which sets _PAGE_EXEC.
> set_memory_nx() calls pte_exprotec() which clears _PAGE_EXEC.
>=20
> Book3e has 2 bits, UX and SX, which defines the exec rights
> resp. for user (PR=3D1) and for kernel (PR=3D0).
>=20
> _PAGE_EXEC is defined as UX only.
>=20
> An executable kernel page is set with either _PAGE_KERNEL_RWX
> or _PAGE_KERNEL_ROX, which both have SX set and UX cleared.
>=20
> So set_memory_nx() call for an executable kernel page does
> nothing because UX is already cleared.
>=20
> And set_memory_x() on a non-executable kernel page makes it
> executable for the user and keeps it non-executable for kernel.
>=20
> Also, pte_exec() always returns 'false' on kernel pages, because
> it checks _PAGE_EXEC which doesn't include SX, so for instance
> the W+X check doesn't work.
>=20
> To fix this:
> - change tlb_low_64e.S to use _PAGE_BAP_UX instead of _PAGE_USER
> - sets both UX and SX in _PAGE_EXEC so that pte_user() returns
> true whenever one of the two bits is set

I don't understand this change. Which pte_user() returns true after
this change? Or do you mean pte_exec()?

Does this filter through in some cases at least for kernel executable
PTEs will get both bits set? Seems cleaner to distinguish user and
kernel exec for that but maybe it's a lot of churn?

Thanks,
Nick

> and pte_exprotect()
> clears both bits.
> - Define a book3e specific version of pte_mkexec() which sets
> either SX or UX based on UR.
>=20
> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3: Removed pte_mkexec() from nohash/64/pgtable.h
> v2: New
> ---
