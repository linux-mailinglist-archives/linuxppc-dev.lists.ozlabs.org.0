Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE11A710222
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 02:58:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRV714DdTz3fG2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 10:58:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sWE5ttu3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=sWE5ttu3;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRV6800t5z2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 10:58:07 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-5208be24dcbso723026a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 17:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684976285; x=1687568285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAPj42Llo1zBn7j5EbZjUwNn1stxlOLmIFbZP+Hkftw=;
        b=sWE5ttu3IOXvq5dPyRBpeVf+bDhetwFF738sdeIWuimyyiaHOkxhav9sQg3tTgc91z
         bK7sKVesnW5qwF+P3y1gUG0uoH73rhx+bkvwhXldiYbhYUV+RrMpl0exxYN7PP6+HGEU
         FU+s9gSBGTDVP3WIF0BjcE1UdvboZ1FE/dkAjCpPiDDutsaZ/u7pi5/9WQpPpNkvb1Gs
         Z8TpW8V59Lqn3Xti6S16RkRWlOpslsh5mDZs15+ZZYf1jVvj999Snw9VgawFwlkCBsHo
         eqHSppNjj7DpNC14XSkoBhooTRdrKVsjAfG+aG3zr4Z34f9LuIxigXjPpOKk1AKZM0so
         7Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684976285; x=1687568285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAPj42Llo1zBn7j5EbZjUwNn1stxlOLmIFbZP+Hkftw=;
        b=RYoZYxHUIIkI8NVSzr97C65IfNMMcmfvlLwH2QRZk9G3YYssqR9TRMgAP5lrmnK2Dh
         pGHRke8X/r3znGYlPYbhI3F7iuu7LuieKlfIWACeUFyiQXszqW1pVCqvaeRc5j9tkNNt
         P7gpza2yQGCyRnLBOjWjxY5P/rnvpbmkgrmdPW6XmgqzlZQ9JJkwph3KfjINBauHBiXn
         zVr4S14rxDIpjSD77WqtprW3eLB30dzB4bEYil3L7rQK60vnnLUVV2VyEjZPFo6wYevf
         yBp2HpB3kq6vTiy6DH2nGk1ROEcxBeuMZkQyHuP/B8mfBCV2Jv1E1BKOrPOx6ztFx/pY
         HXMA==
X-Gm-Message-State: AC+VfDzo5OuNo6jkklx7Q9qjvIL2GsPtml9Z3lGvqRRqNoTuz5mn9Rqv
	O+J5tW485/kPwUosqdVJNs4=
X-Google-Smtp-Source: ACHHUZ6vCwyHjQH58WcHE/CqcAAdVyARITzyZWBize5iGPj/Rzy5RhPCJclyEbqnFkeiDbOlfU74IQ==
X-Received: by 2002:a17:903:124f:b0:1af:9c18:a160 with SMTP id u15-20020a170903124f00b001af9c18a160mr17670692plh.17.1684976284891;
        Wed, 24 May 2023 17:58:04 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-12.three.co.id. [116.206.28.12])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902b68200b001ac8218ddb7sm76943pls.84.2023.05.24.17.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:58:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6D35D10625B; Thu, 25 May 2023 07:58:00 +0700 (WIB)
Date: Thu, 25 May 2023 07:57:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Message-ID: <ZG6yl8RN0ChIfNGG@debian.me>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <87bki9ai11.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uI/IsBv88xgOn6QO"
Content-Disposition: inline
In-Reply-To: <87bki9ai11.fsf@mail.lhotse>
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
Cc: doru iorgulescu <doru.iorgulescu1@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Fabiano Rosas <farosas@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--uI/IsBv88xgOn6QO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 01:03:22AM +1000, Michael Ellerman wrote:
> Should be fixed properly by:
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519113806.37=
0635-1-mpe@ellerman.id.au/
>=20
> Which is in powerpc-fixes as 358e526a1648.

Telling regzbot:

#regzbot fix: 358e526a1648cd

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--uI/IsBv88xgOn6QO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG6ykgAKCRD2uYlJVVFO
oxijAP45l+3tHS1RyfI0SLq839DSHCEILcLXGqrYLoT/703ziwEArDioVbgb0kUO
HKdcUrooAH0IKxya1qWE/qkt2ZKQpwo=
=oXBj
-----END PGP SIGNATURE-----

--uI/IsBv88xgOn6QO--
