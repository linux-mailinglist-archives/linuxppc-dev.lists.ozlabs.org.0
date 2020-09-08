Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFEE260E7A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 11:15:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blzy94tN6zDqJf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 19:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VGlRdYkT; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzwX04lmzDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 19:13:46 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id b124so10418021pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=w+fgoFgrvub+PVRBQAqPAVJ0vJ5KWjyrTSwEc7m3Tac=;
 b=VGlRdYkT+u84u3Y6Kjvu8qHXN3TW1XyiJ+KOLZEjSJ5tEz1ZmoqFnTL7tM859f6NfT
 BdSeby2ktDOTnLqHtsjBLtOtDf7DBioZPYsJYDACD0+jKLWjnLDLqD6OeITQ9gl9K4WT
 j9II5uAli4pvZKiluAWuUKzG2ECNFoJ6Mv83A01XZhJk9FKWdpkG8ekvXBfPUZ51Zt2e
 G9u1lgB5oXrcz9v7Ltcd3aN3QqumGn5P8ONfN9SYqi2QLMQ5ZlCA+pQWmZFQdAMMDtxI
 ERSsOQ4uuml18R8UR1VgtJg98TEJFsPfgwbLjxZYTaAQ5GuZQPPsNGS8xU1HwgA/bLen
 OiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=w+fgoFgrvub+PVRBQAqPAVJ0vJ5KWjyrTSwEc7m3Tac=;
 b=L91kzJyeNX3n+iQAMAd4oL5iGfs1AFGpYiRGVpRWFwY5FfbG7GQT71ZZJMyY86N+9e
 sN3xodRUsHEix2L9BVs6RH0hu38DcMh1c2zolJpr4MW0oBUtaregl1OblOXjyjJT8kI3
 /OYfe4gmw31+9ccUCLD7NRymdEfkcKVJEgjW7Be8DrJ5rHaNjzqQGf24mu6n8eW1DMPs
 p9xGzK80uzxRjewRAWUH5X5vjEgIRSOMkey2LnOUnyX0UXI7llGET6RDltRdnOsrvkZ1
 uUX0HdIYOaHRAnkET1VqinuKv9ak8Cd4opIO2xEpXj12putq9VlzKT0V+8CJvrSzpBVl
 H5Uw==
X-Gm-Message-State: AOAM530YPxuG6+iC7c9KtxCwtt+qhk2CVhQJ6h+m3EQejOYI2u3nypky
 382pnhiNg3Gy0z8Cs1WowcM=
X-Google-Smtp-Source: ABdhPJwd4muQSZj47jYzjoWHw0sLP9vUqRC+sbt0sjdS5yOxhOJAjexMEe+LdHqfY09BJ08YufwJXQ==
X-Received: by 2002:a62:7c82:0:b029:13c:1611:6532 with SMTP id
 x124-20020a627c820000b029013c16116532mr22326829pfc.4.1599556424068; 
 Tue, 08 Sep 2020 02:13:44 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id f12sm3178494pjm.5.2020.09.08.02.13.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 02:13:43 -0700 (PDT)
Date: Tue, 08 Sep 2020 19:13:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 5/5] powerpc/fault: Perform exception fixup in
 do_page_fault()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <5748c8f5cf0a9b3686169e2c7709107e6aaec408.1596734105.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5748c8f5cf0a9b3686169e2c7709107e6aaec408.1596734105.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599555291.xys33gyt02.astroid@bobo.none>
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
> Exception fixup doesn't require the heady full regs saving,
                                      heavy

> do it from do_page_fault() directly.
>=20
> For that, split bad_page_fault() in two parts.
>=20
> As bad_page_fault() can also be called from other places than
> handle_page_fault(), it will still perform exception fixup and
> fallback on __bad_page_fault().
>=20
> handle_page_fault() directly calls __bad_page_fault() as the
> exception fixup will now be done by do_page_fault()

Looks good. We can probably get rid of bad_page_fault completely after=20
this too.

Hmm, the alignment exception might(?) hit user copies if the user points=20
it to CI memory. Then you could race and the memory gets unmapped. In=20
that case the exception table check might be better to be explicit there
with comments.

The first call in do_hash_fault is not required (copy user will never
be in nmi context). The second one and the one in slb_fault could be
made explicit too. Anyway for now this is fine.

Thanks,
Nick

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>


>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/entry_32.S       |  2 +-
>  arch/powerpc/kernel/exceptions-64e.S |  2 +-
>  arch/powerpc/kernel/exceptions-64s.S |  2 +-
>  arch/powerpc/mm/fault.c              | 33 ++++++++++++++++++++--------
>  4 files changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_3=
2.S
> index f4d0af8e1136..c198786591f9 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -678,7 +678,7 @@ handle_page_fault:
>  	mr	r5,r3
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	lwz	r4,_DAR(r1)
> -	bl	bad_page_fault
> +	bl	__bad_page_fault
>  	b	ret_from_except_full
> =20
>  #ifdef CONFIG_PPC_BOOK3S_32
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/e=
xceptions-64e.S
> index d9ed79415100..dd9161ea5da8 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1024,7 +1024,7 @@ storage_fault_common:
>  	mr	r5,r3
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	ld	r4,_DAR(r1)
> -	bl	bad_page_fault
> +	bl	__bad_page_fault
>  	b	ret_from_except
> =20
>  /*
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index f7d748b88705..2cb3bcfb896d 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -3254,7 +3254,7 @@ handle_page_fault:
>  	mr	r5,r3
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	ld	r4,_DAR(r1)
> -	bl	bad_page_fault
> +	bl	__bad_page_fault
>  	b	interrupt_return
> =20
>  /* We have a data breakpoint exception - handle it */
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index edde169ba3a6..bd6e397eb84a 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -542,10 +542,20 @@ NOKPROBE_SYMBOL(__do_page_fault);
>  int do_page_fault(struct pt_regs *regs, unsigned long address,
>  		  unsigned long error_code)
>  {
> +	const struct exception_table_entry *entry;
>  	enum ctx_state prev_state =3D exception_enter();
>  	int rc =3D __do_page_fault(regs, address, error_code);
>  	exception_exit(prev_state);
> -	return rc;
> +	if (likely(!rc))
> +		return 0;
> +
> +	entry =3D search_exception_tables(regs->nip);
> +	if (unlikely(!entry))
> +		return rc;
> +
> +	instruction_pointer_set(regs, extable_fixup(entry));
> +
> +	return 0;
>  }
>  NOKPROBE_SYMBOL(do_page_fault);
> =20
> @@ -554,17 +564,10 @@ NOKPROBE_SYMBOL(do_page_fault);
>   * It is called from the DSI and ISI handlers in head.S and from some
>   * of the procedures in traps.c.
>   */
> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig=
)
> +void __bad_page_fault(struct pt_regs *regs, unsigned long address, int s=
ig)
>  {
> -	const struct exception_table_entry *entry;
>  	int is_write =3D page_fault_is_write(regs->dsisr);
> =20
> -	/* Are we prepared to handle this fault?  */
> -	if ((entry =3D search_exception_tables(regs->nip)) !=3D NULL) {
> -		regs->nip =3D extable_fixup(entry);
> -		return;
> -	}
> -
>  	/* kernel has accessed a bad area */
> =20
>  	switch (TRAP(regs)) {
> @@ -598,3 +601,15 @@ void bad_page_fault(struct pt_regs *regs, unsigned l=
ong address, int sig)
> =20
>  	die("Kernel access of bad area", regs, sig);
>  }
> +
> +void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig=
)
> +{
> +	const struct exception_table_entry *entry;
> +
> +	/* Are we prepared to handle this fault?  */
> +	entry =3D search_exception_tables(instruction_pointer(regs));
> +	if (entry)
> +		instruction_pointer_set(regs, extable_fixup(entry));
> +	else
> +		__bad_page_fault(regs, address, sig);
> +}
> --=20
> 2.25.0
>=20
>=20
