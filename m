Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B996C9F39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 11:20:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlS342qYsz3cZp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 20:20:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=boRoJxii;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=boRoJxii;
	dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlS2B2z7Gz2x9L
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 20:19:46 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id ja10so7809134plb.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 02:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679908783;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MolT2QPdAbhjDzQm/bW+5V6BH1+c0GF0g3SrhCKOHKA=;
        b=boRoJxiiePoGdvCdmLREQ2NLCH36s3EUqVN2C4z3pHpi2IMY1rNwF3xF9j5nRnX7f5
         X48jP+jdwaaqDx2cfgHf2l4uqfdiyS9Lkde22dpHeo4YrW1tJZ/UbEEeKO0wtx2KHOxp
         DJgAmRZopRrJipcFLG+Fm4XzFOKm3OaxoGsbQ+JCkZOgyYFm5+4aEn2wD9Z1NWS0j95V
         b79qk+KIyXC/3wUAb4mU66z7+ITZSbGtUUZjYAr9zYHqSb1/xCseFLUN2ENHQbS/q2uV
         UnKOtdbaKzt7byVriYPnFaUQ12Xr8w+szmnTtx7Tomp+Z4J6m3CW/kMotsmVikxkv7kH
         MD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679908783;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MolT2QPdAbhjDzQm/bW+5V6BH1+c0GF0g3SrhCKOHKA=;
        b=3r6MBym09ST3W1x9lCG5liKKdCi/SsRbTAQatCwu9G35RlUmz24flUBZOalyW823fC
         iXjCJ7gPSHnhvcp1HnhKKhXEW9rWok0H0/EZTlRiMxktRuWGBb+15zD+zJBhxBrs5BOc
         yiRQCyIz3SEApGYK+rSdjI8Z/SwH/oN1HszE0jm1i3O1eypEaY8gqCPbENRVxRRMd0FB
         Q/KXO6jU9k+ZYq2rv0FRlNENBFayykFTlwPrz7rrU2snuEE7g2ZN6/MbGU6x1+l4mHl5
         +HkhhkT9nvtLZ2CpE722oMg0gHRZVwfZtWVuF4vBl95UmXZ/DIqXs5s1sG0lYSmt8kLN
         0TZg==
X-Gm-Message-State: AAQBX9ce3zjLR2svUvDPNAH6WQ9Bi6kRrtKujsSXfjiLKjqZ3wx8qicj
	2AunMJPTU1Jc3+5gcSBEObHzinN/NCE=
X-Google-Smtp-Source: AKy350bpkiTIiYJBIh+3Ol7ZsDC9NV9ZozK01FgEoyh5sLZVnBmFIhW1jprtAsU+csyCO4WtXMytFQ==
X-Received: by 2002:a17:903:41c8:b0:1a0:57df:864f with SMTP id u8-20020a17090341c800b001a057df864fmr12018706ple.16.1679908783211;
        Mon, 27 Mar 2023 02:19:43 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id jm18-20020a17090304d200b001888cadf8f6sm18629720plb.49.2023.03.27.02.19.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 02:19:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 19:19:37 +1000
Message-Id: <CRH1YM72SK4L.QU56WGVQQ2GE@bobo>
Subject: Re: [PATCH v3 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove
 .global scope
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Kautuk Consul" <kconsul@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Fabiano Rosas" <farosas@linux.ibm.com>, "Sathvika Vasireddy"
 <sv@linux.ibm.com>, "Alexey Kardashevskiy" <aik@ozlabs.ru>
X-Mailer: aerc 0.13.0
References: <20230316051025.1424093-1-kconsul@linux.vnet.ibm.com>
 <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
In-Reply-To: <20230316051025.1424093-2-kconsul@linux.vnet.ibm.com>
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

On Thu Mar 16, 2023 at 3:10 PM AEST, Kautuk Consul wrote:
> kvmppc_hv_entry isn't called from anywhere other than
> book3s_hv_rmhandlers.S itself. Removing .global scope for
> this function and annotating it with SYM_INNER_LABEL.
>
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/b=
ook3s_hv_rmhandlers.S
> index acf80915f406..b81ba4ee0521 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -502,8 +502,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>   *                                                                      =
      *
>   ***********************************************************************=
******/
> =20
> -.global kvmppc_hv_entry

I think this is okay.

> -kvmppc_hv_entry:
> +SYM_INNER_LABEL(kvmppc_hv_entry, SYM_L_LOCAL)

The documentation for SYM_INNER_LABEL says it for labels inside a SYM
function block, is that a problem? This is a function but doesn't have
C calling convention, so asm annotation docs say that it should use
SYM_CODE_START_LOCAL?

BTW. why don't our _GLOBAL() macros use these SYM annotations? I haven't
really looked into them.

Thanks,
Nick
