Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA0B4C2671
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:43:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45yh3Q5rz3cPh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:43:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OJgUqWsS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c;
 helo=mail-oi1-x22c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=OJgUqWsS; dkim-atps=neutral
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45xS3xjnz30LQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:42:04 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id z7so1737343oid.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=EyCz/npgrvK3wpbga7/cyV5B/USjVvhtf8rmko5Ci44=;
 b=OJgUqWsSYFDXMW2sk/xBn7Dewz4VOyeBPLsINElsaZ7NKuWAfaIWyYvNOn1xtvm3Lf
 3eI5xv7A8DlDwu6OWAaMZJLYOOsUQxo5n87KDSpotcAoO45Omd4/8+zfyx7i6G31kJYy
 j8CXnXG1MEeNqivSFTyvFeqMS7pE+/cTSh9Pssv52IFjnpcWFYG8MAairObWsYJMcSt2
 QTal643N9GTg4iBzl6GxbpOk2e9nX3o0+WHR1P6eWo307dlaAEYfZ2tYGpHG+JsscMw7
 PDYKuSH6XpHiUxNwq1epytPAVW+feSZtv2GFfeesftXhaHQRyAodhpl8b6x44k3iQ/ao
 pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=EyCz/npgrvK3wpbga7/cyV5B/USjVvhtf8rmko5Ci44=;
 b=6lQkh0lQWHUKFeaZtVQjq6dXPEchbu2qTtJVptqGwQNxCZ5MO8oGZ6JW0kZe3PfPed
 +fPjPvmUtgWviA8Qa/Y1QAClUnS+bVJl9/CueRLhre9zODz0GR1m8PVHweVdv5MyQhF4
 u4qE3lgKUeQ82sqEtN8Oq8gewwAzarDgUSnRbmufE08m1G9DPzLMFKSzP5EAwNU32Hx9
 1aSLkjfqVVKDp6udQ13ig4KAkBSvZEiq7fZdg+4n0EQtQi786y3nugIx5l0E+ggR4Wpe
 oDdiMKXhp6f8jMcvkKxtJFIXA9uqKpvKKWq2TtQTeYXKvwkz73ARVkuE5n9jorlD4MWo
 Od2w==
X-Gm-Message-State: AOAM530ac2rhKK6CA50rilKN7RbTk6ZyjKgHbf9K1NsRbHHNwAJinW29
 +u5mZiyp32wfp5Xmz8omdBkgQMq4O90=
X-Google-Smtp-Source: ABdhPJzLyhj73Fo6tspeW72DSqxDKpnxx2XzGLuzmSvGZw8cXuc6R3oLeUpxJPFg8bAMvJnoBz67RQ==
X-Received: by 2002:a17:90a:aa98:b0:1b8:5adb:e35f with SMTP id
 l24-20020a17090aaa9800b001b85adbe35fmr612568pjq.192.1645670462502; 
 Wed, 23 Feb 2022 18:41:02 -0800 (PST)
Received: from localhost (115-64-212-59.static.tpgi.com.au. [115.64.212.59])
 by smtp.gmail.com with ESMTPSA id j5sm882941pfu.185.2022.02.23.18.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 18:41:02 -0800 (PST)
Date: Thu, 24 Feb 2022 12:40:57 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] powerpc: lib: sstep: fix 'sthcx' instruction
To: Anders Roxell <anders.roxell@linaro.org>, mpe@ellerman.id.au
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
In-Reply-To: <20220223135820.2252470-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Message-Id: <1645670438.z6ynuisobl.astroid@bobo.none>
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Anders Roxell's message of February 23, 2022 11:58 pm:
> Looks like there been a copy paste mistake when added the instruction
> 'stbcx' twice and one was probably meant to be 'sthcx'.
> Changing to 'sthcx' from 'stbcx'.
>=20
> Cc: <stable@vger.kernel.org> # v4.13+
> Fixes: 350779a29f11 ("powerpc: Handle most loads and stores in instructio=
n emulation code")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Good catch.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/lib/sstep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index bd3734d5be89..d2d29243fa6d 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -3389,7 +3389,7 @@ int emulate_loadstore(struct pt_regs *regs, struct =
instruction_op *op)
>  			__put_user_asmx(op->val, ea, err, "stbcx.", cr);
>  			break;
>  		case 2:
> -			__put_user_asmx(op->val, ea, err, "stbcx.", cr);
> +			__put_user_asmx(op->val, ea, err, "sthcx.", cr);
>  			break;
>  #endif
>  		case 4:
> --=20
> 2.34.1
>=20
>=20
