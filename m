Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7487516F854
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 08:07:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S6Lf43vVzDqQ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 18:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DgpjGkbU; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S6HY1xFZzDqSk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 18:04:41 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id p14so977933pfn.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 23:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=U4zjyJLdU3t/j5AP2ABPSwFEGT7wHYCthHT0fxv7Jac=;
 b=DgpjGkbULgJU8a7pwt84PkKVMZc4qaHsyIR4cLSzIL7jTSJsDQcCHqoqskquWXAS2L
 Z4nPqseLwSCfTjwCeN1NAgHrrieiL2tRi5qVRQqVgtaqjAUvs40RzPqwVnDTLjyZsG2e
 sTUycumn5hpDFPnFOnFVG4m7smixmnboxhurkEZ82Ka2OXKY6ZOJ7scFeDkEuRBwXapu
 IQCp9hmOO9tJBchiWnnxxbzkakpnyLT4zIEPZDb5Mf/jG5rmDvXCDFXZowVLXgZuJrUm
 LG4yZVkfurVpL65mXpZ76IkPAiqy/MZzJQfEBJ334GoU1vGczW6Fj4BsK4MgkqTwCTwE
 QrIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=U4zjyJLdU3t/j5AP2ABPSwFEGT7wHYCthHT0fxv7Jac=;
 b=Ue+aWzXikeYXgcvngsiTBZSnBAIHxQ07xt/PECNfwLK5vVL1Pk285LOSDeyVZwCZcM
 p6dzzdcrRet3BSUjhJrwmdr4i+len5459d3YOiNCGB6XrfV+0ULB9rkHOqVSv5e6mtuz
 bXpAZxt1an/veR6PsWzuABr7HfqNWb3dqqGjrNCueFPZ3uqOuERDb+69B103hN3iqFK5
 CLlqHgX//feONxDeUef/S8T3sKN9J6cQGLFctRWF5ZyzNDDTmP1PX+4ma1hv055e/NDk
 qM/vkeOvLUjCMvMdMX0CdrPaORBs5Poz+wt/wtlJYFw6gsqbx1FBR6mf33luuAA5ZhSW
 U75g==
X-Gm-Message-State: APjAAAUH89igopFB+IuUPCe/By82rni1812iK24OnDalYPb4MjJPK7c3
 b6lT0gpstHbntdKCTAtKcCQ=
X-Google-Smtp-Source: APXvYqzJlBYBy5ST9GA9jPA+1npPArr1hTzpVziFEcR1Vnr3MjzSuZSFa/sKcDUnoUv4TIVBqGO3Zg==
X-Received: by 2002:a62:3892:: with SMTP id f140mr2797494pfa.190.1582700678147; 
 Tue, 25 Feb 2020 23:04:38 -0800 (PST)
Received: from localhost ([61.68.187.74])
 by smtp.gmail.com with ESMTPSA id 23sm1439021pfh.28.2020.02.25.23.04.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:04:37 -0800 (PST)
Date: Wed, 26 Feb 2020 17:00:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 08/14] powerpc/xmon: Remove store_inst() for
 patch_instruction()
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200226040716.32395-1-jniethe5@gmail.com>
 <20200226040716.32395-9-jniethe5@gmail.com>
In-Reply-To: <20200226040716.32395-9-jniethe5@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1582699938.333f3hx0ka.astroid@bobo.none>
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

Jordan Niethe's on February 26, 2020 2:07 pm:
> For modifying instructions in xmon, patch_instruction() can serve the
> same role that store_inst() is performing with the advantage of not
> being specific to xmon. In some places patch_instruction() is already
> being using followed by store_inst(). In these cases just remove the
> store_inst(). Otherwise replace store_inst() with patch_instruction().
>=20
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
>  arch/powerpc/xmon/xmon.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>=20
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 897e512c6379..a673cf55641c 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -325,11 +325,6 @@ static inline void sync(void)
>  	asm volatile("sync; isync");
>  }
> =20
> -static inline void store_inst(void *p)
> -{
> -	asm volatile ("dcbst 0,%0; sync; icbi 0,%0; isync" : : "r" (p));
> -}
> -
>  static inline void cflush(void *p)
>  {
>  	asm volatile ("dcbf 0,%0; icbi 0,%0" : : "r" (p));
> @@ -882,8 +877,7 @@ static struct bpt *new_breakpoint(unsigned long a)
>  	for (bp =3D bpts; bp < &bpts[NBPTS]; ++bp) {
>  		if (!bp->enabled && atomic_read(&bp->ref_count) =3D=3D 0) {
>  			bp->address =3D a;
> -			bp->instr[1] =3D bpinstr;
> -			store_inst(&bp->instr[1]);
> +			patch_instruction(&bp->instr[1], bpinstr);
>  			return bp;
>  		}
>  	}
> @@ -913,7 +907,7 @@ static void insert_bpts(void)
>  			bp->enabled =3D 0;
>  			continue;
>  		}
> -		store_inst(&bp->instr[0]);
> +		patch_instruction(&bp->instr[0], bp->instr[0]);

Hmm that's a bit weird. Can you read instructions into a local variable
first, do the checks on them, then patch them into their execution
location?

Otherwise, good cleanup.

Thanks,
Nick
=
