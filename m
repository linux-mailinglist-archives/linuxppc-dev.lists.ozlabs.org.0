Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA116CA17D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 12:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlTcT17wnz3fSw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 21:31:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M9hEb/WN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M9hEb/WN;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlTbX47YYz3cFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 21:30:14 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso10452485pjc.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679913011;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/xoPcJZPu6j3k1DY8PgIJALXbobd1RS92NXoVMIbKY=;
        b=M9hEb/WN2PzCPCzexKI81eDSMuLORjGhnA59gxeYCHREPVHuAbEM8joynh4Juk0mjk
         J0rcridJvU2K8jVqBPdk1LqtrZcxDed87znweusGuwKKAKnHmCIvUUOPk5uNyeQplYK4
         p+uDfM0EFNPVODIJtgoUVTu8+clgSHKJkkyYkDtZ+O1uBUtTNvrH7ovSFf8bgDqu4lkQ
         k7ZyH0RwoKTKI+LE59ve3KICRQwVszyu38sUP084tyqq6H4/+OCqW+bRpZdAq85PUt7x
         lOhGGOSHx8S/WVdVStHrU2wEkiaGYR6bmdr7UXlM6fDmhq2ErZJ319QoJCzPsoFYRIJ6
         N1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679913011;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o/xoPcJZPu6j3k1DY8PgIJALXbobd1RS92NXoVMIbKY=;
        b=IcOSNrtOnSLH69S2DT92/ygdHj/RniTYYmS8wkhZOCOsjdB4nyEfQHmjm21Jrd3zUY
         xAfQ9bLL4gL7fPtuSdeizCULwFs6bbs9zbVDmKTvI0QnVIs8BVjmeuD73rfWYYFGKDzi
         hOAmiDP7+QSQovSmbZGgXfR5YwDM64UNaMx1j29M5KJ/FRHpD4kQV7qzuTgZk99mTtFx
         kkWTaUeSZ1TYrlbST1DMV4vUnJ7bUqhFfvXBcADj1aDcsgQZCgjA+qlyiNfZhjTMBYcK
         0M1CCl4E7i0OQyWVbE14CLAze6YYmRdN0OSLaUbnxfTXxx47t6BSw/Tx+p6hNIl0hM/y
         kAtQ==
X-Gm-Message-State: AAQBX9c+O4aASEw076H3rwJt17/IZXb4ZZP7oF7C9Upt3Xx8N+00Czf1
	lfXO6Jsfjf4h7NO4eZZkCl8=
X-Google-Smtp-Source: AKy350ZePws+Fhfg4r9tvskQcm8V2QJtCXxS82HPo/4mMBhVhgoiqPj1L7mnlHYMcfaVlBVElZV2Bw==
X-Received: by 2002:a17:90a:c8c:b0:23f:7e48:4f20 with SMTP id v12-20020a17090a0c8c00b0023f7e484f20mr11999857pja.41.1679913011524;
        Mon, 27 Mar 2023 03:30:11 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id z23-20020a1709028f9700b001a043e84bf0sm18790204plo.209.2023.03.27.03.30.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:30:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 20:30:02 +1000
Message-Id: <CRH3GJDNC4SF.2HBIHLLQSCWSI@bobo>
To: "Kautuk Consul" <kconsul@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Sathvika Vasireddy"
 <sv@linux.ibm.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>, "Fabiano Rosas"
 <farosas@linux.ibm.com>
Subject: Re: [PATCH v4] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.13.0
References: <20230327100411.3342194-1-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230327100411.3342194-1-kconsul@linux.vnet.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 27, 2023 at 8:04 PM AEST, Kautuk Consul wrote:
> kvmppc_hv_entry isn't called from anywhere other than
> book3s_hv_rmhandlers.S itself. Removing .global scope for
> this function and annotating it with SYM_CODE_START_LOCAL
> and SYM_CODE_END.

Does removing .global introduce the objtool warning, or was it already
present? Just trying to understand if this is two changes or one (not
that it really matters, maybe just for the purpose of the changelog).

Since the patch only touches KVM, subject should follow arch/powerpc/kvm
convention, which is not the same as the rest of arch/powerpc. KVM: PPC:
Book3S HV:

Otherwise seems okay

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index acf80915f406..0a9781192b86 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>   *                                                                      =
      *
>   ***********************************************************************=
******/
> =20
> -.global kvmppc_hv_entry
> -kvmppc_hv_entry:
> +SYM_CODE_START_LOCAL(kvmppc_hv_entry)
> =20
>  	/* Required state:
>  	 *
> @@ -940,6 +939,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	ld	r4, VCPU_GPR(R4)(r4)
>  	HRFI_TO_GUEST
>  	b	.
> +SYM_CODE_END(kvmppc_hv_entry)
> =20
>  secondary_too_late:
>  	li	r12, 0
> --=20
> 2.39.2

