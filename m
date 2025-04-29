Return-Path: <linuxppc-dev+bounces-8168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 517ADAA3C44
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 01:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnGlv5pM1z30TY;
	Wed, 30 Apr 2025 09:31:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b35"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745969467;
	cv=none; b=h0NW484FRi510J/mO0Glfh/aOu9camj5pTBHvwDt7XcjoWDwDQOdtpVfmnwEXgprEC2WRvFPLAe8mSkbmDAa5xVRhvCvRkoq1j6xNKFEVAattorIsDjp4BAj1Hk4/OEER0fCrTMb4M8gIkhdNp6lS7OoSFIPzfgikNinJatsJRworPvClw6BVgLVa+Vn1A2RJTJEAaHZS02n1QV8ONaoiZVoZPc2kTnPmiZtNnWMQc5nQaUa/Vx4Gb82DoZXjc3IZJCsDbFHzOZZoqLZqlhc0DMCdtuOv0LYn2460CMAlVw+Q9gDJR1TN3y4xa+PxK1+l4YmDsR11mpb8iFtVu3xZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745969467; c=relaxed/relaxed;
	bh=cIuAebnQ3utGP4sRcNF3af9094rXpAxKt1SXsqCPHIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d+/sdv5WrcEo3Vc+34AdqaB1A0HzhRuKjulQ1xOs2dvkGu6QUYZ7P33koVIHvMZ8rQhsTQ4pxvRYzp81Y+OtAtKPkbVwQ/Yk+UgPDvICm1O0GMbLH8beQRpb+V4iU1/nzXln+MaM0DNeetIekGgL4EmW5+oPTFIw9pGVjgqj44tSovic2FYyKcqxBVAVR6muO+d2jwmxzpk5pRhcnDIQ8LMVsJ4M7ifvYNOpUPnl91fJNhxgaKJxSq9aIMcwcXZvH6VDTaaKxtXVxpPr/rfhI7pMwsZd4EBuMRYnSiheLjQ63DmmN1wHM5xWx9i4SxLaf1jzzAX2mYfktSrAW+4Ymg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=b5CIjzGE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=b5CIjzGE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnGlt1WkHz2yjV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 09:31:04 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e731cd5f2adso3733852276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745969460; x=1746574260; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIuAebnQ3utGP4sRcNF3af9094rXpAxKt1SXsqCPHIU=;
        b=b5CIjzGEMS4m8MX7h7mDTqngnai462/L2gmMDP3lR/23v44Yb+HrBvWJikn959WzQ/
         yWP2gz/AMSuzHgP/Rv8nmJ0FpniATcGx9TNcH6o8HaHM1jEZoW2D1x6xSm7s1L+V5W12
         m5cwcvotR5+hQgS+OWVagTBFOiGGzDaQq0pzORPkiKxJ+K0wVjoETvT+xmHairZ8i3Is
         LaLlNf0Ucnv9Kizop28kFjl9/XniNZ68HanKYXJ8uDO8sEs77okGltd7BGQYQwYB0bhI
         hk99u6MCqFLoAOqt1g+uJvoruOcUc9s8REPmXiH8jUf5ECbn4p7c+rU3lIOPEPJe9qyH
         +wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969460; x=1746574260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIuAebnQ3utGP4sRcNF3af9094rXpAxKt1SXsqCPHIU=;
        b=JJCakAhhizQRgYcvHVhGCG2MlyE+c1PsrcQ8PZp7PMXSxoYzX7DHTHm9lw+Dc4f8eb
         JmtGUgTYeNxtsJnX5f112jEZm+38pelVMSPI6JhJJXm5ULWl3Cjoila6wAXNGM1HNn7J
         RpDIIydLNwMppqi83WvlZJtgQ3xio+F28rvNZTIX0ODfCaUZWewQf4sF2RrytA8xblEI
         p8LgmCg11DoGr0/459f6nCIX9wjzHEiG6jeD5/rftHtiapA2JJXIZ1oYK1khGxTQtxln
         9zu/v1LsgFIR2vr8PN7GE3C9tTWIRfj+pC6FVag60RnX04Tbt8weDqWsY4G/Ua3VQbBB
         ezDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbAZhRg89di706X9qahK6CmL5JuTmSLF9cBxw1lJNKkDpffXvi/RISI7r4hNjbHWMT+Gp8VNLJ7pe76cg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy0Z8QQTsa4KNsDZDLG2YFLabMlGAHI36SUR5HOC/+coIGxCHrf
	oGvF/2J5VOfu1Pbxl8lcptXYRu30huzyvXJXGxFhtju9sH3Ufbzfj4VVHidFQUk8x+QS0A69ZSM
	jQD086dhYhJQjA7dOdfPZHbePwC69zruQiqTx
X-Gm-Gg: ASbGncsjdlhjCsja2uFL4Ep0bXNj7s1hPadeuhix3abCtRZkHHuzIkRF27iI6NWzkFC
	k4wSkdGZ22NaSHXEWAy+HGAVEIjrupFKtz1t3GOAhyWBRlUgrB3saKh/hnZ5zOHbDcm2vveHDDL
	WAIi87fo+YzatQoLwchkuN/A==
X-Google-Smtp-Source: AGHT+IGwua5N9PuQI5YXnZ9QizB13TEvlVyb3ghRMEepupOY9IBACmHRKJ/ceFLULrT2r9vA2fNY/xi9tZpK618tJa8=
X-Received: by 2002:a05:6902:e09:b0:e73:17e3:ef4e with SMTP id
 3f1490d57ef6-e73ecf7cabdmr1474221276.48.1745969460035; Tue, 29 Apr 2025
 16:31:00 -0700 (PDT)
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
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net> <20250429-module-hashes-v3-8-00e9258def9e@weissschuh.net>
In-Reply-To: <20250429-module-hashes-v3-8-00e9258def9e@weissschuh.net>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 29 Apr 2025 19:30:48 -0400
X-Gm-Features: ATxdqUHKCRv2dWw3Z8HwiaRKbffRbebAcIs6GQu6Ludlza-Iyae1SuGp-QceJWc
Message-ID: <CAHC9VhSAANnOYB11AerdtpEwWSu9OoRdxW34dap909D3z=t49A@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] lockdown: Make the relationship to MODULE_SIG a dependency
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>, 
	Christian Heusel <christian@heusel.eu>, =?UTF-8?Q?C=C3=A2ju_Mihai=2DDrosi?= <mcaju95@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Apr 29, 2025 at 9:04=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> The new hash-based module integrity checking will also be able to
> satisfy the requirements of lockdown.
> Such an alternative is not representable with "select", so use
> "depends on" instead.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  security/lockdown/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I'm hopeful that we will see notice about dedicated Lockdown
maintainers soon, but in the meantime this looks okay to me.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/lockdown/Kconfig b/security/lockdown/Kconfig
> index e84ddf48401010bcc0829a32db58e6f12bfdedcb..155959205b8eac2c85897a8c4=
c8b7ec471156706 100644
> --- a/security/lockdown/Kconfig
> +++ b/security/lockdown/Kconfig
> @@ -1,7 +1,7 @@
>  config SECURITY_LOCKDOWN_LSM
>         bool "Basic module for enforcing kernel lockdown"
>         depends on SECURITY
> -       select MODULE_SIG if MODULES
> +       depends on !MODULES || MODULE_SIG
>         help
>           Build support for an LSM that enforces a coarse kernel lockdown
>           behaviour.
>
> --
> 2.49.0

--=20
paul-moore.com

