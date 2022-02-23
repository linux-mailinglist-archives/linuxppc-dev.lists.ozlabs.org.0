Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB434C0CC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 07:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3RRW4hXwz3bYh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 17:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nKWBTbGZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nKWBTbGZ; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3RQt66qYz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 17:46:46 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id gi6so1829016pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 22:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=9F8BMuZjY5bWRhatjKIYeWjGRnJz62q6i5jz3F6wbFA=;
 b=nKWBTbGZzGqguwysZ82UA0d5OtOt1mSDkkhB9pHMREzFl8y8q4r3/E0X7ZvUFzZ/kD
 PGb85xYGSRnQLnvKx5pp159CjboKWGMKxQAxrd/fd3NVrOYUThzFVHSt224fpr89eTlt
 y2VY69JAPB94q9gqN99TVio32gWIIEgcBvncG5fDJFO7ftTlGAS3UlLhECP44lXH/nDz
 OTVmBnZz+tPkY8LKYbaJNMe+7j2fgWv5kSklrPEkHjgxnZE2iL6qYv0YBCXFXXugIxPg
 Wea3HXj7vQhTjZTRIabRWhe1XnUtFOrpiY2HK1mfceXUMueuAaMkT9wSq+KHqZsVHlls
 QEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=9F8BMuZjY5bWRhatjKIYeWjGRnJz62q6i5jz3F6wbFA=;
 b=J6ss7U8qMnVI+OKEHnzTH7eEZe9IG3MX7nX12FdSO8PFc6f/tRZv+2/zaV2Jrl3VRZ
 SCZrLIJd7vdGPi4tK47YdVa3VceP7MjE8zh1E5T8BP4o2ARuOe48RDzHiTQ733akmoBK
 miPujHCj5AOJtI+4ul8Aeh9ltN1OLvv2asDcrV0MpPpbdWXGmAnv20tTJncYrbcxvfL5
 fB7sIZ0VL3KQwC8AnY2Azz0XtxnPBH3LnTF9TRCoIgKjgf05MsrOf4BB/jpVndAjT5s7
 yOrXQq9krgaVwU2HvogOePx5W2yofqHQO4XMF+2XxaHAxLtO/Uo2q6LwHBYPmcXiNH0a
 RMRA==
X-Gm-Message-State: AOAM533KtTMs5V3ezxFfU89bdCgbu34LCdg8GUW8C+t3ZGdPhodxdIWc
 zqPfstyxk+VcpuwcM8oj4tyzqWQJCfWt0Q==
X-Google-Smtp-Source: ABdhPJxNOPFDaEHgBoJ1Zzt5Li+QglUr1OwuF8kIYtCxGIbPWJ8zXJ7Hi8xpTtvUM2JNuLdOMBsogQ==
X-Received: by 2002:a17:902:db0d:b0:14f:b047:8d22 with SMTP id
 m13-20020a170902db0d00b0014fb0478d22mr13416337plx.90.1645598804379; 
 Tue, 22 Feb 2022 22:46:44 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id q13sm20684050pfl.210.2022.02.22.22.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 22:46:44 -0800 (PST)
Date: Wed, 23 Feb 2022 16:46:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Don't use DSISR for SLB faults
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20220222113449.319193-1-mpe@ellerman.id.au>
In-Reply-To: <20220222113449.319193-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1645598745.1nbr1zwhu9.astroid@bobo.none>
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
Cc: rnsastry@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Michael Ellerman's message of February 22, 2022 9:34 pm:
> Since commit 46ddcb3950a2 ("powerpc/mm: Show if a bad page fault on data
> is read or write.") we use page_fault_is_write(regs->dsisr) in
> __bad_page_fault() to determine if the fault is for a read or write, and
> change the message printed accordingly.
>=20
> But SLB faults, aka Data Segment Interrupts, don't set DSISR (Data
> Storage Interrupt Status Register) to a useful value. All ISA versions
> from v2.03 through v3.1 specify that the Data Segment Interrupt sets
> DSISR "to an undefined value". As far as I can see there's no mention of
> SLB faults setting DSISR in any BookIV content either.
>=20
> This manifests as accesses that should be a read being incorrectly
> reported as writes, for example, using the xmon "dump" command:
>=20
>   0:mon> d 0x5deadbeef0000000
>   5deadbeef0000000
>   [359526.415354][    C6] BUG: Unable to handle kernel data access on wri=
te at 0x5deadbeef0000000
>   [359526.415611][    C6] Faulting instruction address: 0xc00000000010a30=
0
>   cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf400]
>       pc: c00000000010a300: mread+0x90/0x190
>=20
> If we disassemble the PC, we see a load instruction:
>=20
>   0:mon> di c00000000010a300
>   c00000000010a300 89490000      lbz     r10,0(r9)
>=20
> We can also see in exceptions-64s.S that the data_access_slb block
> doesn't set IDSISR=3D1, which means it doesn't load DSISR into pt_regs. S=
o
> the value we're using to determine if the fault is a read/write is some
> stale value in pt_regs from a previous page fault.
>=20
> Rework the printing logic to separate the SLB fault case out, and only
> print read/write in the cases where we can determine it.
>=20
> The result looks like eg:
>=20
>   0:mon> d 0x5deadbeef0000000
>   5deadbeef0000000
>   [  721.779525][    C6] BUG: Unable to handle kernel data access at 0x5d=
eadbeef0000000
>   [  721.779697][    C6] Faulting instruction address: 0xc00000000014cbe0
>   cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf390]
>=20
>   0:mon> d 0
>   0000000000000000
>   [  742.793242][    C6] BUG: Kernel NULL pointer dereference at 0x000000=
00
>   [  742.793316][    C6] Faulting instruction address: 0xc00000000014cbe0
>   cpu 0x6: Vector: 380 (Data SLB Access) at [c00000000ffbf390]
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Fixes: 46ddcb3950a2 ("powerpc/mm: Show if a bad page fault on data is rea=
d or write.")
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/mm/fault.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index eb8ecd7343a9..7ba6d3eff636 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -567,18 +567,24 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
>  static void __bad_page_fault(struct pt_regs *regs, int sig)
>  {
>  	int is_write =3D page_fault_is_write(regs->dsisr);
> +	const char *msg;
> =20
>  	/* kernel has accessed a bad area */
> =20
> +	if (regs->dar < PAGE_SIZE)
> +		msg =3D "Kernel NULL pointer dereference";
> +	else
> +		msg =3D "Unable to handle kernel data access";
> +
>  	switch (TRAP(regs)) {
>  	case INTERRUPT_DATA_STORAGE:
> -	case INTERRUPT_DATA_SEGMENT:
>  	case INTERRUPT_H_DATA_STORAGE:
> -		pr_alert("BUG: %s on %s at 0x%08lx\n",
> -			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
> -			 "Unable to handle kernel data access",
> +		pr_alert("BUG: %s on %s at 0x%08lx\n", msg,
>  			 is_write ? "write" : "read", regs->dar);
>  		break;
> +	case INTERRUPT_DATA_SEGMENT:
> +		pr_alert("BUG: %s at 0x%08lx\n", msg, regs->dar);
> +		break;
>  	case INTERRUPT_INST_STORAGE:
>  	case INTERRUPT_INST_SEGMENT:
>  		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
> --=20
> 2.34.1
>=20
>=20
