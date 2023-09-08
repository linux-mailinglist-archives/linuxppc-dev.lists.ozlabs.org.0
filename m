Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43494798487
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 11:03:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bOXNj24S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rhqrx0pcLz3cMj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 19:03:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bOXNj24S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=guoren@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rhqr2544tz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 19:02:26 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 10B01CE1B66
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 09:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70F06C433CB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694163739;
	bh=rRKEvIB0lVb2uGUWPoA0+XeAQvNtg/fARJrpqhmZI3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bOXNj24SHdKL79z6qfM1jz0YMFFEnZqcAWfQGXW2LdIVaQDbeY0DQhD5/JprtiyDj
	 5D1k99+9Ug9dFN3lpUVgUMFb+noK4GaCPvJKFCJwg7T2e2+JUsNC8ryA59UAI/MjA+
	 nhZly7RSUCbgUDXu5rbOkRxYN7fIeaweU9f951Eubr4hYUupmCp3r0d0X0xr56GoG7
	 TSWC4FWPFYAvPS4fSD21+7m/TJTDKv1lgcMSbfjITw67g2TtEjYcmoKItUG7Y97Hw0
	 VZNeNKEm7ZluvzqobouSn1v3ioXDS3dPfdRUJCnjtDuu6e2FCsvfTpz6bPkSMQxquU
	 qkfRaTdEcE2/w==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c4923195dso225186966b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Sep 2023 02:02:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YxE5/JMiftdtskCDiNpWdB9Rf+I1oJDjy8CAknq3DE9dIDYTzIH
	nYSWqIcl2yqs8eePmskrXmFjVdxFxNgf6sQZMvw=
X-Google-Smtp-Source: AGHT+IHIxkho9CXfRVQdHREUP1Ny9xnSRZ4p9AxmPd+t8Z6hWpbhNEsJKkVWz7HAOHHA2nwechuLx9pmYabZgwNqZ0U=
X-Received: by 2002:a17:906:18aa:b0:9a1:c42e:5e5e with SMTP id
 c10-20020a17090618aa00b009a1c42e5e5emr1264248ejf.42.1694163717201; Fri, 08
 Sep 2023 02:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230906-jag-sysctl_remove_empty_elem_arch-v1-0-3935d4854248@samsung.com>
 <20230906-jag-sysctl_remove_empty_elem_arch-v1-8-3935d4854248@samsung.com>
In-Reply-To: <20230906-jag-sysctl_remove_empty_elem_arch-v1-8-3935d4854248@samsung.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 8 Sep 2023 17:01:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRFrd4zs_8vv5-n5p_+GYxnTJcRBtYDJaMZQQMOVKKOTw@mail.gmail.com>
Message-ID: <CAJF2gTRFrd4zs_8vv5-n5p_+GYxnTJcRBtYDJaMZQQMOVKKOTw@mail.gmail.com>
Subject: Re: [PATCH 8/8] c-sky: rm sentinel element from ctl_talbe array
To: j.granados@samsung.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, josh@joshtriplett.org, Nicholas Piggin <npiggin@gmail.com>, linux-csky@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Iurii Zaikin <yzaikin@google.com>, linux-kernel@vger
 .kernel.org, Luis Chamberlain <mcgrof@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Guo Ren <guoren@kernel.org>

On Wed, Sep 6, 2023 at 6:04=E2=80=AFPM Joel Granados via B4 Relay
<devnull+j.granados.samsung.com@kernel.org> wrote:
>
> From: Joel Granados <j.granados@samsung.com>
>
> This commit comes at the tail end of a greater effort to remove the
> empty elements at the end of the ctl_table arrays (sentinels) which
> will reduce the overall build time size of the kernel and run time
> memory bloat by ~64 bytes per sentinel (further information Link :
> https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)
>
> Remove sentinel from alignment_tbl ctl_table array.
>
> Signed-off-by: Joel Granados <j.granados@samsung.com>
> ---
>  arch/csky/abiv1/alignment.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/csky/abiv1/alignment.c b/arch/csky/abiv1/alignment.c
> index b60259daed1b..0d75ce7b0328 100644
> --- a/arch/csky/abiv1/alignment.c
> +++ b/arch/csky/abiv1/alignment.c
> @@ -328,8 +328,7 @@ static struct ctl_table alignment_tbl[5] =3D {
>                 .maxlen =3D sizeof(align_usr_count),
>                 .mode =3D 0666,
>                 .proc_handler =3D &proc_dointvec
> -       },
> -       {}
> +       }
>  };
>
>  static int __init csky_alignment_init(void)
>
> --
> 2.30.2
>


--=20
Best Regards
 Guo Ren
