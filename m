Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D8E45E3D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 01:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0bsZ48ybz304V
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:56:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PEMEO0iN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PEMEO0iN; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0brx4FsGz2yfg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 11:55:45 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id m15so6598982pgu.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 16:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=NsHvPX0n7wne0hpCBJXHR+MXN+x6jE3MZwqkYuiuvLE=;
 b=PEMEO0iNYE0EAxDnHlj/3hAcHsr8jhSIqCM1Ccm9rPTT28dyu28ixjKfVEIHWqsnp2
 GGZck9pO28bPCtHl+FnyK+Mv8NznPR2guWe1ugdNyhH0nullgntrVORWXxz4kaTIfPuL
 OK2ptHGXk/74DlrA8tTy71PrXBWzAEKu0q+87g9LByATaJVCJd2GiWPSTlVE3TpJhEW8
 G3vUfhVVRpJnqNLWAlT66hbmwpzCHd17cIoMIOq0+OInc9mDz0ylOr2n7p68m6+jyLa+
 HGrxkmejb7N7IDJ94NKueFB7iBf27Kb6svbazjhuJGbToN7Nh9ciPPhObg6cgZB7+2hX
 aXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=NsHvPX0n7wne0hpCBJXHR+MXN+x6jE3MZwqkYuiuvLE=;
 b=TGDE6EPco6/UUcXspERcauckU0AI8m2z3BV9vE6O5SwBwFg9icO7zmyBfRUjWQrvQw
 AAajVqK+CBe5MwWPX9fcgx/rYpFfmcYSf2RjlOqWTSMi0vx6uz/giDiZ1Kq+c8Dw+/jk
 he9oTD/d0cjM5C+03XVYwxpjMZ7A404T3CHKBamEaRkE5aIdV1sAYQqLLydM4XBCkTiG
 GFIVTL/yFGyguHN8wSLcSvUZE90X8L0Dl6ADsDYYK4OvRTazhnm3x7y++XmfoqMw1R2r
 ESRdU83oFE6kGmeJ8XDlkIrDk5MG+q9RkJid41bRaBBhrUr8v5iqAuJptYakZPM1RWOO
 09Gg==
X-Gm-Message-State: AOAM5304eGG0FmuQ/ZZh6OdIpD6xWMdj+IRztFMHG7B0VwGZlbaaGZon
 IOjGuM/H6C0r9QvD35uLfSXVGU73kmg=
X-Google-Smtp-Source: ABdhPJx9RI1yanuLZeW8JCFUZPjd4A0VepzGZ0Hc2AOrIo9LoXX/jMY8vmOQ26HtAv4NmxxP0xMf6w==
X-Received: by 2002:a65:5ccb:: with SMTP id b11mr19203087pgt.408.1637888143437; 
 Thu, 25 Nov 2021 16:55:43 -0800 (PST)
Received: from localhost (115-64-213-93.static.tpgi.com.au. [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id d3sm4947232pfv.57.2021.11.25.16.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 16:55:43 -0800 (PST)
Date: Fri, 26 Nov 2021 10:55:38 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 00/17] powerpc: Make hash MMU code build configurable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211125125025.1472060-1-npiggin@gmail.com>
 <27f9cddf-44db-1d1f-17e0-fd8252c7a1c9@csgroup.eu>
 <d792e8a6-de81-1f93-8938-d1d9d6a1e748@csgroup.eu>
In-Reply-To: <d792e8a6-de81-1f93-8938-d1d9d6a1e748@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1637887917.uatiybce4e.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 26, 2021 3:35 am:
>=20
>=20
> Le 25/11/2021 =C3=A0 17:35, Christophe Leroy a =C3=A9crit=C2=A0:
>>=20
>>=20
>> Le 25/11/2021 =C3=A0 13:50, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Now that there's a platform that can make good use of it, here's
>>> a series that can prevent the hash MMU code being built for 64s
>>> platforms that don't need it.
>>=20
>> # CONFIG_PPC_64S_HASH_MMU is not set
>>=20
>>=20
>> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented=20
>> [-Wcpp]
>> arch/powerpc/platforms/cell/spu_base.c: In function '__spu_kernel_slb':
>> arch/powerpc/platforms/cell/spu_base.c:215:38: error: 'mmu_linear_psize'=
=20
>> undeclared (first use in this function); did you mean 'mmu_virtual_psize=
'?
>>  =C2=A0 215 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 llp =3D mmu_psize_defs[mmu_linear_p=
size].sllp;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmu_virtual_psize
>> arch/powerpc/platforms/cell/spu_base.c:215:38: note: each undeclared=20
>> identifier is reported only once for each function it appears in
>> make[3]: *** [scripts/Makefile.build:287:=20
>> arch/powerpc/platforms/cell/spu_base.o] Error 1
>> make[2]: *** [scripts/Makefile.build:549: arch/powerpc/platforms/cell]=20
>> Error 2
>> make[1]: *** [scripts/Makefile.build:549: arch/powerpc/platforms] Error =
2
>> make: *** [Makefile:1846: arch/powerpc] Error 2
>>=20
>>=20
>=20
>=20
> With CONFIG_SPU_BASE removed, the above voids and I get to the final=20
> link with the following errors:

This is building cell platform with POWER9 CPU and !HASH?

We don't have to make that build, just prevent the config. I had that in=20
a previous version which also had platforms select hash, but we went to=20
just CPU. But now there's no constraint that prevents cell+POWER9 even=20
though it doesn't make sense.

Not sure the best way to fix it. I'll think about it.

Thanks,
Nick
