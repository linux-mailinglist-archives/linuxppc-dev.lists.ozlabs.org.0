Return-Path: <linuxppc-dev+bounces-12618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 799F6BA85BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Sep 2025 10:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cZv2t1ZKGz3cYk;
	Mon, 29 Sep 2025 18:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759133318;
	cv=none; b=Y2tqcxy0I2NAxDBMxCz1Z3CDeHOwFOpSik4yAQlmIRlx7uLdvvEuKUMXijLqUpCTG0msmYr9h3lkUiy/IcVz6j6PJO/JEKEIROzrv3S78jnrSEfrXJMO/6Fj2h1U6caG3e1MSerk1tRNeBD648nLDC7E4UlDbQyVVtnWJu5ZEZLRPugYWwUaO2hC3Vxa6f81XQe8zr4HhYmnv1MaabmPRbwyGju9I/gQqW38Dag8VcHA5xXdWeWJB4Wd40HR70iU6EefYaK4S+LHsZU3OFIJ9hyx1Wb9pqSjqIYvmYNHvP2vodKcejhCOQjFfZxonBV8Yz/BpVjZE0e7jEq6G+uj/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759133318; c=relaxed/relaxed;
	bh=HAMfSDJSbJ4xjYZMH8vH7FynSdefu5J6b+jcnMr69Vg=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Date:
	 MIME-Version:Content-Type; b=X81n+CevG/U5Q0qNRZ5ECxGpQs3dXLTyD/hoCWIkCCNG3lkDBi68GCiM4LuRiL+g5lX2mJFbPqjTg7Fvb028ZW3B0TC25IgFCXTYFGM857DDPLHiIIFCeOHoyjxvhnsxzONJlBoN8WvnjWrLbo5UpTLB6LqBGW3/7kXVeqvaj1aRmLOifytIPh3D2QcP1HCiBzanXcO1NrpagKpnObULmgUjFwYYzp1uqQv/idG/SZMqZzk5OsQRbl7MofewNLxuqna57/3ATydzLN2pNeireriLYytCATKUXSLrd/AsOpHVsKUjjsIP7YCswt29jaFpZwgHuNqF3pSUFpBogmHNGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUlQvC0I; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XUlQvC0I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=mikisabate@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cZv2r0BKsz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 18:08:35 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-46b303f7469so28997345e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Sep 2025 01:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759133311; x=1759738111; darn=lists.ozlabs.org;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HAMfSDJSbJ4xjYZMH8vH7FynSdefu5J6b+jcnMr69Vg=;
        b=XUlQvC0IZXQm7I7qtRFuxMikTlie434/fhoXKTA7iA7PZJAa07tkyz8p5Kt5DocTj2
         ExD6ADuvwZ8LSCmjSkH5fxeJwWgy7QQByQhiFuWoATPvNuM/8VqA6k6pizrg0EqKIGLH
         IYdlr3fMHqi4nKQ9g1TgaeOeHTEJ0jDm5def7/TcbjlLpgY6yM/0Xd0QiOHLZ95xZPDP
         5N3MPsoEJZ5VzYRlpslCsBYS0MQNWe4WycbgjicBxrtKhy+dAl2/BCZxUm4Yw+TIGKwO
         hv9H5X45Wt84HngxCpRYq+sKF0xGby9cNBTxltqxKDBP1wupityZEDUP625g65225/o9
         JU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759133311; x=1759738111;
        h=mime-version:date:user-agent:references:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAMfSDJSbJ4xjYZMH8vH7FynSdefu5J6b+jcnMr69Vg=;
        b=GoqyGPLd0QC/fO0kpxzCowHI4BNmTUvSJw5/Zpdwvjma9YNMH7NKqOHjqxvaKHbw+K
         hEKCgYsQizKtc9T8CKWupOeHxBs8HPXENHdv5swe3+WGp6f2qOcxBMl5RoF2WLXuXMtq
         cVg7ZVDUwpQnl9SgAvgYUf6qynpdSHItc+IE9P579S2LGWAyNekyjGwxeWpFhRc9GyZl
         2F4t37PuTobCKFmttUJMGArGteNXMm0fA14foLQagESgX57FYzGZlqU/Ywx4sfCZRvP4
         ASyovasBi71AwVAqOWMbvnif9hEv9gqObXaDi4sYzubu7Y2ItXumef2r1TN3QvfRxNw2
         bpVg==
X-Gm-Message-State: AOJu0YxZmVDq4W2F73YMI5Pf6uWCTB9MHSvOgVGkUtPomBS2gb9FKsIv
	QbBvmr3BgD2/llnX4JkSMqcZ4bgC+cTChAe8wzuCsSVpUburdI56A17oTpCfCAPE
X-Gm-Gg: ASbGnctDL2pz/DtMkc0HXI/YaEbrkvXKbize0i5U+MRPfjq8/+1fYADw+0L8gtcdCsn
	0zSAWTEVV9T2R7gUTPNrhE32XMQp918VQjelXmame8YTWTBPRUxZLSd06bbEjZsJkcpzNqztvDV
	MDSz8cH1rQxOgoppYN4n6sDg1MQwpIQNMLiSWGDYeH6Q2c3dZXNMdK99uT2SHc9B6Fa1QSNysof
	cGVma35nB7xVHNJVAY+sproczEMxoZ3RTa2jhb3Rt9ZH+YCgFkVeXGGP+Ax341j1s1Evf/dy0am
	QET73kB1NXOJxoFces1DL+HiLAfMH3i6Adhr2WtnYNsu/7EsTfhqK6LPZ/QdD1Lpuer7jJb8Ize
	QFf/uZLMd6Y8Zk7Dj+ulwDleDqX4U0DIuVHolmaXjwwacw07nN988RPXFgpo=
X-Google-Smtp-Source: AGHT+IHV+5/OPoidJc+VFRpQ3RDVstQeCOgbJbduyd+YoxhpucCmsRW+mCqJOOcvZ2DftJsEqzKuyQ==
X-Received: by 2002:a05:600c:1c8e:b0:46e:1f86:aeba with SMTP id 5b1f17b1804b1-46e329f819dmr157710745e9.17.1759133311480;
        Mon, 29 Sep 2025 01:08:31 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2ab31ea3sm213196785e9.12.2025.09.29.01.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 01:08:30 -0700 (PDT)
Message-ID: <68da3e7e.050a0220.8efdc.f1ab@mx.google.com>
X-Google-Original-Message-ID: <877bxhy936.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,  maddy@linux.ibm.com,  mpe@ellerman.id.au,
  npiggin@gmail.com,  christophe.leroy@csgroup.eu
Subject: Re: [PATCH] powerpc: kgdb: Remove OUTBUFMAX constant
In-Reply-To: <20250915141808.146695-1-mikisabate@gmail.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Mon, 15 Sep 2025
 16:18:08 +0200")
References: <20250915141808.146695-1-mikisabate@gmail.com>
User-Agent: mu4e 1.12.13; emacs 30.2
Date: Mon, 29 Sep 2025 10:08:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2025-09-15 16:18 +02:

> This constant was introduced in commit 17ce452f7ea3 ("kgdb, powerpc:
> arch specific powerpc kgdb support"), but it is no longer used anywhere
> in the source tree.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> ---
>  arch/powerpc/include/asm/kgdb.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kgdb.h b/arch/powerpc/include/asm/k=
gdb.h
> index 715c18b75334..4c0afde87e97 100644
> --- a/arch/powerpc/include/asm/kgdb.h
> +++ b/arch/powerpc/include/asm/kgdb.h
> @@ -25,7 +25,6 @@
>
>  #define BREAK_INSTR_SIZE	4
>  #define BUFMAX			((NUMREGBYTES * 2) + 512)
> -#define OUTBUFMAX		((NUMREGBYTES * 2) + 512)
>
>  #define BREAK_INSTR		0x7d821008	/* twge r2, r2 */

Gently ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJlBAEBCgBPFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmjaPn0bFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyFRxtaWtpc2FiYXRlQGdtYWlsLmNvbQAKCRCWvoxv
2J1lZZWeEACfvXT5BDoAcVnNuPxZ36G0knwhRxUX3kxQSfzbX0bs1vH5FK4FCBGe
TIes6jqBY9w2jOXTZSZK+A4rnTy8kV7vYEKb4iYJOYVq0Rz1xwrI39A2JcX2s9w8
DZ8foErf6AiqUiXg7LgQaPH0KJTknqV+sQmAIhgx0QWEA2jcnLrwis0droGZlGFY
UWFIMXVcPalNz1gWe2Kpt98z459sYvPDDYqRd622yQkCmsm2skkfT2lWdliuZREz
NJF32bVhG9KiD1t/l6P7x1y6CrXYtZBzcm/D1lqmvSSWsY3X8ImA2CvsNPqc3jKX
cfQOcMfBtdXav18oxV29Pbin/LrIMWf5fPrBBn1t/v1LNVN/AwofYhVAVRCuHbpJ
WUOGXrvs/ovpROPyLtGzxCKuGbRTXIM/uZIbMYb4Xk+AT+U7zPdIUgOHnETRG09o
lRodAa541k+13M4CVzf9ymtGLAFDNpealz35oet8e50z9VbMZTk9vfqjUkTskP54
eqHf87a3i0s4Lra/mqLiTDCpR8rpV7SWvNpumPH1skaDmbtN4pg9yE5qSuOb0fS5
h58fngqridD2SQ5Kze1GN3IetgJyLPAkkUNdVVoSZr5x+s1/poYivgCxtWuAkilJ
ZbaNMXeRezTPNl4vKkoesdRHaSCmN9u754MccG+dOetvpA4lom1aRw==
=/0e1
-----END PGP SIGNATURE-----
--=-=-=--

