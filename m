Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B101D4686D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 21:58:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QWcq6QnYzDrq9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 05:58:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=chunkeey@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qIH+M8u6"; 
 dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QWb54vQPzDrgl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 05:56:46 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id v14so3743747wrr.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkfIkc5EEziIC8JttuF44VEsntcOdSTSm668OicBieA=;
 b=qIH+M8u6ZHF56mysF2rv7LgxnEGFYR951cqj5/ufPiitDHFKDiSzyDgKT0UHHa7Rtw
 dCXyZoQ6PxgjU7i8iacuMREE1//5Vxt/sdt6LkWWPiUaLa9Wz4tVFuXy8BYpCscurA4B
 +BFnfpmmTNMht6wpoSgG+h+cw9fRpSX+PYwNQOEQ3eAaBm/QcK6prEkZ/YDSnHqTx8Ij
 HIztDKPZmech4lNjF6gFc9Y38nNiOgwnw5Vx28LAx6Rgf8d0OQziAe8/XsJbFo0do1i1
 5bF8GfolMUILyUmsiSsazQMP4VdVln41Tu2/oJcriwLdUKKtyvakmU4ae1CRgzDAuDbh
 YjIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkfIkc5EEziIC8JttuF44VEsntcOdSTSm668OicBieA=;
 b=eGuCSOAH8fWHxmW/0S3Q46OobvUMOzxBt2PSz+8Vtkv9oJfqhG4bFELQCojsMW3dWM
 FO6J3syXVG/RlbCOyplryDahcewqKImMcUYwZTVMCfYSbDSXZIYWGocdxjz/jvPf02pt
 3eUWwGWZ8I48/HuecXtcoZ+7AHE1fK8agJEBHIg7Wdi442PX4Xjipa8DK4Yv4u3jayr6
 hjUG1A3Zi0r7KotJrwL1G/zIXEknDoul0u0d11gsImOkL1bZ5ryymrQcq+RZ3pG2xlDN
 x94efRCKy3/vV37zEHdwCzGFr2owrpQenDf66mHAZW2hIQyroxihyUL/bciUa3HMnOyv
 RZoA==
X-Gm-Message-State: APjAAAWL9Ol7nPJgnuqWbHyuIdNUcuBF93yAuMES3sfRuz0z0DJb3REq
 hMGzqYoBEa7dNsxVKpkGJ5U=
X-Google-Smtp-Source: APXvYqz4dnTX5FOuo1+mrF9OWokv0GO2DjUQU5Onl8cJM/+eoB8LwPhxf3ttG4o9SNRjq4RoASQQQg==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr52574643wru.297.1560542202338; 
 Fri, 14 Jun 2019 12:56:42 -0700 (PDT)
Received: from debian64.daheim (pD9E29824.dip0.t-ipconnect.de.
 [217.226.152.36])
 by smtp.gmail.com with ESMTPSA id a19sm2447233wmm.46.2019.06.14.12.56.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 12:56:41 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
 by debian64.daheim with esmtp (Exim 4.92)
 (envelope-from <chunkeey@gmail.com>)
 id 1hbsJU-0007ny-CJ; Fri, 14 Jun 2019 21:56:40 +0200
From: Christian Lamparter <chunkeey@gmail.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: Enable kernel XZ compression option on PPC_85xx
Date: Fri, 14 Jun 2019 21:56:40 +0200
Message-ID: <4407251.g26ZO3zR3C@debian64>
In-Reply-To: <f988951c-3077-ab19-81eb-560418468d14@c-s.fr>
References: <20190603164115.27471-1-paweldembicki@gmail.com>
 <87ftodempa.fsf@concordia.ellerman.id.au>
 <f988951c-3077-ab19-81eb-560418468d14@c-s.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: linux-kernel@vger.kernel.org, Pawel Dembicki <paweldembicki@gmail.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, June 14, 2019 12:06:48 PM CEST Christophe Leroy wrote:
>=20
> Le 13/06/2019 =E0 13:42, Michael Ellerman a =E9crit :
> > Daniel Axtens <dja@axtens.net> writes:
> >> Pawel Dembicki <paweldembicki@gmail.com> writes:
> >>
> >>> Enable kernel XZ compression option on PPC_85xx. Tested with
> >>> simpleImage on TP-Link TL-WDR4900 (Freescale P1014 processor).
> >>>
> >>> Suggested-by: Christian Lamparter <chunkeey@gmail.com>
> >>> Signed-off-by: Pawel Dembicki <paweldembicki@gmail.com>
> >>> ---
> >>>   arch/powerpc/Kconfig | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> >>> index 8c1c636308c8..daf4cb968922 100644
> >>> --- a/arch/powerpc/Kconfig
> >>> +++ b/arch/powerpc/Kconfig
> >>> @@ -196,7 +196,7 @@ config PPC
> >>>   	select HAVE_IOREMAP_PROT
> >>>   	select HAVE_IRQ_EXIT_ON_IRQ_STACK
> >>>   	select HAVE_KERNEL_GZIP
> >>> -	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x
> >>> +	select HAVE_KERNEL_XZ			if PPC_BOOK3S || 44x || PPC_85xx
> >>
> >> (I'm not super well versed in the compression stuff, so apologies if
> >> this is a dumb question.) If it's this simple, is there any reason we
> >> can't turn it on generally, or convert it to a blacklist of platforms
> >> known not to work?
> >=20
> > For some platforms enabling XZ requires that your u-boot has XZ support,
> > and I'm not very clear on when that support landed in u-boot and what
> > boards have it. And there are boards out there with old/custom u-boots
> > that effectively can't be updated.
>=20
> I don't think that it has anything to do with u-boot.
> AFAIK, today's mainline U-boot only supports GZIP (by default) and the=20
> following optional ones: LZO, LZMA, LZ4.
>=20
> If we want to set additional compression types for u-boot, it is not=20
> enough to select HAVE_KERNEL_XXXX, we also have to update uImage=20
> generation scripts.
>=20
> See the series I sent some time ago:=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D104153
> I'll resent it without bzip2 as today's uboot doesn't support bzip2 anymo=
re.
>=20
> >=20
> > But as a server guy I don't really know the details of all that very
> > well. So if someone tells me that we should enable XZ for everything, or
> > as you say just black list some platforms, then that's fine by me.
> >=20
>=20
> I guess we first need to understand how this is used.
>=20

to add to the confusion:

The powerpc arch is sort of special since it has the various targets have
different arch/powerpc/boot/wrapper for everyone unfamiliar (people from
ARM or other targets,) please look at:=20

https://www.kernel.org/doc/Documentation/powerpc/bootwrapper.txt

and see that this is very different from ARM, MIPS, x86, etc.

I think the cuImage*, dtbImage*, simpleImage, etc... wouldn't
be affected if the kernel is compressed by XZ, as in they should
still boot fine, altough XZ takes a bit longer to unpack of course.

However, for the uImage this could spell a problem, however "HAVE_KERNEL_XZ"
does not automatically entail that the wrapper script from above
compresses the generated uimage with LZMAd/xz. Instead this is controlled
by init/Kconfig and the "Kernel compression mode" setting there.=20
And currently that defaults to CONFIG_KERNEL_GZIP. So the wrapper script
currently gzipped uImages unless the target config overwrites it to
something else (and the target has the right=20
HAVE_KERNEL_XZ/BZIP2/LZMA/LZO/LZ4/... as well).

Regards,
Christian


