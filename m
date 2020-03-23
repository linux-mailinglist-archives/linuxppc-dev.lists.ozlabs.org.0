Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32C18F028
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 08:12:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m5DW0PJdzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 18:12:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=scxhyCr+; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m5943BpqzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 18:09:28 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id b9so5533959pls.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Fegzw3wehVCScrY4JFXkgGmDCPXn4IYsSCwQJBL8cEQ=;
 b=scxhyCr+krufFYpoyIz0NhtgeTS+MmcwuFLsryqINQa84Ih6j55C3qnse+rXK5oL0T
 8v1uPWeKbwSxTsGbpaGhymb2qHSDgKiR+uW9AQOdbT4mkKIvqs5FbiPATp5RyJtWqfhn
 IIZdTjpjLIhNO2Ck7eJcN2xw0iC3X5HqXk1ueKc6KCtJilEqMNUNdht93f1oW0tKtc0A
 g+Syojizr7SPnQKCfJoWU3ktwRyUk4irgojSCKAn4aGoi+xeoycT5y1xD/br+UJw/dAm
 khClzzDavROtGiRCftkpWsosXMjQlrH9tf0T7TX8CZ16/MnbgHzcay/huMKh/wy98ldo
 ZN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Fegzw3wehVCScrY4JFXkgGmDCPXn4IYsSCwQJBL8cEQ=;
 b=S+YiQ+f4FgyO0zm0riog758X77R7s7Rdz/T5wDYy4m1vgywhb18a4sG1oZY3ELKwyi
 RzJfecrcVq/Zo/CERUen0ySW1Pt+cMY+81zLCBrs6Nj+yr7JrPvHulRsJMJOuJvWhmRh
 wARTrjf6zR4luu8BwerzdUTklYJccOttiJSQFyXo+aFR5az1XzLGSk1+bFDPav2hyXZs
 JU19ntJ4tPQ4/VRv/2yUbE7LeuvKjQZ8U+ldi+gI3cgnD+CVJ6B/VBmdCNQQ7w01OZJ0
 6KnFStiUIwRUwOWQfIqYPI/EnST3aUFzF5U20y7pFe1B+L6GKz2VN+iPTrxn2lfxFV+D
 G/Ug==
X-Gm-Message-State: ANhLgQ0p4Y09phqn9FFqaBLyQss9kCDghsuKVHQpOInstFMpGV9rv/Eh
 oQhqRXLBIY5R9rP5zckUqXw=
X-Google-Smtp-Source: ADFU+vsLd/dZz6982Q6xvhJM3GVPe3frVckajqc1cMwAZPHC+9/E3DWOA+ERxWnj8owFTkYxbi16TQ==
X-Received: by 2002:a17:90a:1d4:: with SMTP id
 20mr22800874pjd.95.1584947366368; 
 Mon, 23 Mar 2020 00:09:26 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id 11sm12169651pfv.43.2020.03.23.00.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 00:09:26 -0700 (PDT)
Date: Mon, 23 Mar 2020 17:05:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 13/16] powerpc: Support prefixed instructions in
 alignment handler
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-14-jniethe5@gmail.com>
In-Reply-To: <20200320051809.24332-14-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1584947091.jsvdec8of0.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: alistair@popple.id.au, dja@axtens.net, bala24@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jordan Niethe's on March 20, 2020 3:18 pm:
> Alignment interrupts can be caused by prefixed instructions accessing
> memory. Prefixed instructions are not permitted to cross 64-byte
> boundaries. If they do the alignment interrupt is invoked with SRR1
> BOUNDARY bit set.  If this occurs send a SIGBUS to the offending process
> if in user mode.  If in kernel mode call bad_page_fault().
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: - Move __get_user_instr() and __get_user_instr_inatomic() to this
> commit (previously in "powerpc sstep: Prepare to support prefixed
> instructions").
>     - Rename sufx to suffix
>     - Use a macro for calculating instruction length
> v3: Move __get_user_{instr(), instr_inatomic()} up with the other
> get_user definitions and remove nested if.
> v4: Just do the things for alignment_exception(). Other changes handled
> elsewhere.
> ---
>  arch/powerpc/kernel/traps.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index a4764b039749..cd8b3043c268 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -583,6 +583,10 @@ static inline int check_io_access(struct pt_regs *re=
gs)
>  #define REASON_ILLEGAL		(ESR_PIL | ESR_PUO)
>  #define REASON_PRIVILEGED	ESR_PPR
>  #define REASON_TRAP		ESR_PTR
> +#define REASON_PREFIXED		0
> +#define REASON_BOUNDARY		0
> +
> +#define inst_length(reason)	4
> =20
>  /* single-step stuff */
>  #define single_stepping(regs)	(current->thread.debug.dbcr0 & DBCR0_IC)
> @@ -597,6 +601,10 @@ static inline int check_io_access(struct pt_regs *re=
gs)
>  #define REASON_ILLEGAL		SRR1_PROGILL
>  #define REASON_PRIVILEGED	SRR1_PROGPRIV
>  #define REASON_TRAP		SRR1_PROGTRAP
> +#define REASON_PREFIXED		SRR1_PREFIXED
> +#define REASON_BOUNDARY		SRR1_BOUNDARY
> +
> +#define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)

Looks good. If you define REASON_BOUNDARY 0, then this will constant
fold away so no need to define it twice.

Thanks,
Nick
=
