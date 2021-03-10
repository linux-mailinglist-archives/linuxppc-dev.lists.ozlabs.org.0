Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8513332C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 02:29:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwDyb2KHxz3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 12:29:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=DhGbBceW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DhGbBceW; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwDy95kwlz30L4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 12:29:19 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso6556296pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Mar 2021 17:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=mqm5GjReFw8SY6mddPr+SiVrrIzZTFQq/5dTlBRN2X8=;
 b=DhGbBceWgzp+vxj5K79waSiCvD8OZbI7JIq1uuWos/OxyLdE7wp1zLMX+uzVVqlV6A
 +0tBDqCZxaOaHrGTJU+zkfaEF+BotALT4/gIFd6kqHJF6Yt2QAMj1Ew4/XBrx5NXxk36
 8NynUE1jmV9AyIdNfJ4cY4VXX6opVSG7iWlj0QGnqYj6UHhX5K6TlcLhArnd0nwU4dY+
 cH8lcvA272qtrtfwLaKE+Hzfi/4U7CT4D4nQJ0G68HkNUkhhmforg1R70VmcMwJpX18t
 yNKKNo1sn5f2KJAy/eAwCGHTWIaE4X5LVbuq1waCqIW8GdxFjcpYW5D2klYgO85OR9Tr
 ORXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=mqm5GjReFw8SY6mddPr+SiVrrIzZTFQq/5dTlBRN2X8=;
 b=a9Gg7ZJLFfGxVxfvb/ndQ1DzkowAEODa6kFolc/DyZPJ1YTH545aORRKCtNTezPMhx
 sDLOnXZ4K2EU72BMieCIhO3Jtt/DLRcqUxmZUrCw0Tz5ReFMfqYcrg20mrlJfl2qzcWK
 wsdxjk8XItc2oHfZ1WKY4m83emUtEZXj7HG/MdrJOLBDxA104QLjwWbAUKidQkP6UCJb
 99VbatkVHJAyXm0yaH5Ds/ZiOv9647n+PMWOqbJn7sLUYX2mxcfDeqy6899xKBqH9wQg
 ZsOs03BB8fVx+l4WhnAeOmTwdNJsaaC3CZD0SgngESFoiOpmd2jZMPMCl1cJ7u+WfDOO
 h0ag==
X-Gm-Message-State: AOAM531Ot/29OO9n4HTs9bvspfQ8ePDin8GGcymiE9y5h00raQEc6LSY
 wcMs6bgEPRi8upvKIc2Z+sU=
X-Google-Smtp-Source: ABdhPJyqd5/1VOgBtk/ONDQ7gbtd2txT6fiYwn7VFXcj6nI+l/riLFDNeo3AobEPmMWAdK7jL9BSqg==
X-Received: by 2002:a17:90b:809:: with SMTP id bk9mr781935pjb.83.1615339756109; 
 Tue, 09 Mar 2021 17:29:16 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id s15sm14282344pfe.108.2021.03.09.17.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 17:29:15 -0800 (PST)
Date: Wed, 10 Mar 2021 11:29:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 28/43] powerpc/64e: Call bad_page_fault() from
 do_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
 <b2878184d4c21faa8af55b60e52c83f391272112.1615291473.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b2878184d4c21faa8af55b60e52c83f391272112.1615291473.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1615339667.i88ve15v8a.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of March 9, 2021 10:09 pm:
> book3e/64 is the last one calling __bad_page_fault()
> from assembly.
>=20
> Save non volatile registers before calling do_page_fault()
> and modify do_page_fault() to call __bad_page_fault()
> for all platforms.
>=20
> Then it can be refactored by the call of bad_page_fault()
> which avoids the duplication of the exception table search.

This can go in with the 64e change after your series. I think it should
be ready for the next merge window as well.

Thanks,
Nick

>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/exceptions-64e.S |  8 +-------
>  arch/powerpc/mm/fault.c              | 17 ++++-------------
>  2 files changed, 5 insertions(+), 20 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/e=
xceptions-64e.S
> index e8eb9992a270..b60f89078a3f 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1010,15 +1010,9 @@ storage_fault_common:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	ld	r14,PACA_EXGEN+EX_R14(r13)
>  	ld	r15,PACA_EXGEN+EX_R15(r13)
> +	bl	save_nvgprs
>  	bl	do_page_fault
> -	cmpdi	r3,0
> -	bne-	1f
>  	b	ret_from_except_lite
> -1:	bl	save_nvgprs
> -	mr	r4,r3
> -	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	bl	__bad_page_fault
> -	b	ret_from_except
> =20
>  /*
>   * Alignment exception doesn't fit entirely in the 0x100 bytes so it
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 2e54bac99a22..7bcff3fca110 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -541,24 +541,15 @@ NOKPROBE_SYMBOL(___do_page_fault);
> =20
>  static long __do_page_fault(struct pt_regs *regs)
>  {
> -	const struct exception_table_entry *entry;
>  	long err;
> =20
>  	err =3D ___do_page_fault(regs, regs->dar, regs->dsisr);
>  	if (likely(!err))
> -		return err;
> -
> -	entry =3D search_exception_tables(regs->nip);
> -	if (likely(entry)) {
> -		instruction_pointer_set(regs, extable_fixup(entry));
>  		return 0;
> -	} else if (!IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
> -		__bad_page_fault(regs, err);
> -		return 0;
> -	} else {
> -		/* 32 and 64e handle the bad page fault in asm */
> -		return err;
> -	}
> +
> +	bad_page_fault(regs, err);
> +
> +	return 0;
>  }
>  NOKPROBE_SYMBOL(__do_page_fault);
> =20
> --=20
> 2.25.0
>=20
>=20
