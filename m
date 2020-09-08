Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A452260E32
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:56:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzXV6kk2zDqH5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:56:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TR3ZoyMe; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzVf6K3BzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:54:48 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id o20so10399473pfp.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ex1fX1NtuHc8hEhYz2q3N1DA37jYJdBynWyV2dLsWOI=;
 b=TR3ZoyMeHl9eHSOWfOD8I4Sf7s2fOzVi6PM7Yj8wNN7KwJODMIpaSsYC6Pyn5tDQcH
 q4XnNo9u+LMStIowLNCwRZyQaJi3U7SeEfF5cJmL60TkxZLlpDqK/JQFVafZ9j2L8S0G
 svuCnbDrGvE+QvU2ygTyTZ+PUEbUP1PLvf9T3p0SmUKNbaay9jvhcw+cnAWNaeZfqk3K
 Sq38f2TccO+F38LQ3eQh955iFNcoJdoYHmgCEonBcsolC+jHbvoYupiSw4041bsH15PZ
 ufEnWmrlTt6c4kYjMyC5B5ICRNZBsskzBaCetk7gG0lLKAqLiyg2xQu8SYuULfEG5ulT
 vSaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ex1fX1NtuHc8hEhYz2q3N1DA37jYJdBynWyV2dLsWOI=;
 b=SgMXhbgqWIwlNezROdc/lz4ckovv2ce5XMeGCVwx1ZB3HIWh9sY6LQdukAiO81CjBy
 IP+r1Y53eMv+lpGGtT2bIY+oRteAgZNuSq8AXyX1XcxQFIs29wwx/5QefJCkEUCcTmWm
 cGpw32VNzc3Ryr0k6m/0zl256nm9fdVkwmKUAN/zmYPJ5MyKoTKd4BQtevi5dAFXagmv
 G/cKm4G9whkr4m4m3tVFo2s0CDkU9Ahg6oSx7ocJRl030TUu/yAXkVU2EBhX7BOM26a0
 PJ1kPcsishMInRS0Eh09SFd9zNKqtvX8B0dXf32T0AeNrH4qK61ziq/65+EassEiA1EM
 rutw==
X-Gm-Message-State: AOAM531Ui+N9TpHcc2yRjTHygF/8xQCY5MQz6oKvPPnPblWpHfXrJaaD
 yM3zyL3CnGRrPmV/Iy+oGIk=
X-Google-Smtp-Source: ABdhPJzaH4LSCk2cy2RdfTrz3Men6W3SL6+DCGxwzimSryedVSk8dG5ZkJVIuXI0DvpBEpBnkIFDkQ==
X-Received: by 2002:a63:490f:: with SMTP id w15mr19473095pga.323.1599555285912; 
 Tue, 08 Sep 2020 01:54:45 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id p68sm17798313pfb.40.2020.09.08.01.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:54:45 -0700 (PDT)
Date: Tue, 08 Sep 2020 18:54:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 4/5] powerpc/fault: Avoid heavy
 search_exception_tables() verification
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <b07bac7a882c69deb9e6c8f234a68b3022f29072.1596734105.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b07bac7a882c69deb9e6c8f234a68b3022f29072.1596734105.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599554783.p12klynd6d.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 7, 2020 3:15 am:
> search_exception_tables() is an heavy operation, we have to avoid it.
> When KUAP is selected, we'll know the fault has been blocked by KUAP.
> Otherwise, it behaves just as if the address was already in the TLBs
> and no fault was generated.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Sorry I missed reviewing this. Yes, we discussed this and decided
that it's not effective I think (and KUAP solves it properly).

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/mm/fault.c | 20 +++++---------------
>  1 file changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 525e0c2b5406..edde169ba3a6 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -214,24 +214,14 @@ static bool bad_kernel_fault(struct pt_regs *regs, =
unsigned long error_code,
>  	if (address >=3D TASK_SIZE)
>  		return true;
> =20
> -	if (!is_exec && (error_code & DSISR_PROTFAULT) &&
> -	    !search_exception_tables(regs->nip)) {
> +	// Read/write fault blocked by KUAP is bad, it can never succeed.
> +	if (bad_kuap_fault(regs, address, is_write)) {
>  		pr_crit_ratelimited("Kernel attempted to access user page (%lx) - expl=
oit attempt? (uid: %d)\n",
> -				    address,
> -				    from_kuid(&init_user_ns, current_uid()));
> -	}
> -
> -	// Fault on user outside of certain regions (eg. copy_tofrom_user()) is=
 bad
> -	if (!search_exception_tables(regs->nip))
> -		return true;
> -
> -	// Read/write fault in a valid region (the exception table search passe=
d
> -	// above), but blocked by KUAP is bad, it can never succeed.
> -	if (bad_kuap_fault(regs, address, is_write))
> +				    address, from_kuid(&init_user_ns, current_uid()));
>  		return true;
> +	}
> =20
> -	// What's left? Kernel fault on user in well defined regions (extable
> -	// matched), and allowed by KUAP in the faulting context.
> +	// What's left? Kernel fault on user and allowed by KUAP in the faultin=
g context.
>  	return false;
>  }
> =20
> --=20
> 2.25.0
>=20
>=20
