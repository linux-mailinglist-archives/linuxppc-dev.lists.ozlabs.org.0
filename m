Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D592BED65A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 00:08:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 475s753K3QzF4wv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 10:08:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ogr3bRTW"; 
 dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 475s501GvgzF21Y
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2019 10:06:59 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id c6so16391231ioo.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Nov 2019 15:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eVqB/l9a1uODQEPIKn/PPG0dvGYx8Wnn62KRJDPal58=;
 b=Ogr3bRTWAqrOfrGyYdV5PvYV3ARdso9WSZmAAWAUVNFf5R6gZVAn2suhmsRBuBLR1/
 dW53XjheV7my12jMlO6rV5CfQUMf4cXo1wi+k8bzOlFGjEPVpjfrLLMh5vOO0A/6/oXM
 3ShKC6jxP6wSfEj0/gsdkFz+ntUu3fEZKB28AwKhWaX+O1nDNypQ6igT58up/K4ghO2l
 uP/yIgDW/WzOw0tJLko/ylUM2k1qwMkqUx4NczjZppdGzsFkwXV2p8+YCEcQvqqtj99C
 Ydw086InNypLfzadWcrQP8ewHM8Ag8jkwhzYrF35X5pvfHyBin3yLSe+7iNYRJiOA/QK
 Znsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eVqB/l9a1uODQEPIKn/PPG0dvGYx8Wnn62KRJDPal58=;
 b=b/Q98tFsW/TiFXdRS1zDVYhY2jMfZiIJYF7PjJhVuwHjwc+ExZZ+rXBi95daEo84HL
 /cboLCJEmZMWonZcUa6mmilAHFWZUwyCblPIYcub5UgdhZirXV6GJtS+tIJgWONBU9k/
 C8fnAU5Pu2fFQTSK85kUXZtV1cVln2GiIJ2Pvrsjqb/OpxRqBCowrJyl9EEOZ4UHC18w
 tpp6JS5pFfjmGur50z27yjzCPBGZ31fTUirXIbc6+x1SUPHu7Eo7P0igWC4wZiIdUpXz
 9WCqXibx1eTucvat235+NI3ZjRukZHJ8RwCHHl4P/PKmnvqqm6M7oz3thMtFJvZUCQhh
 lZZQ==
X-Gm-Message-State: APjAAAU2Z3zmINKzRHWHMRGdpqS60SxqWM7ghNdUcwsPF/BVi0ur59PA
 JYO5v1pQFdkpDaaF9XRDRzieOHHL0+zBW330rtU=
X-Google-Smtp-Source: APXvYqz5q7rm3u4DawQENZGNDKe1T9/EKnPlhOlSgXGAtFdFo1uj3sgE+IIUYvtkp3lzE+eEoITqKlfYsqv5wVZb2sA=
X-Received: by 2002:a02:3903:: with SMTP id l3mr12722619jaa.72.1572822416076; 
 Sun, 03 Nov 2019 15:06:56 -0800 (PST)
MIME-Version: 1.0
References: <389022fc-71b0-7952-3404-1da136dbdfd9@web.de>
In-Reply-To: <389022fc-71b0-7952-3404-1da136dbdfd9@web.de>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 4 Nov 2019 10:06:45 +1100
Message-ID: <CAOSf1CGQ7VdhHQ0L3phRwaT9VcsJaN9E7LsEarvpwZUcL6e7bg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_powerpc=2Fpapr=5Fscm=3A_Delete_unnecessary_ass?=
 =?UTF-8?Q?ignment_for_the_field_=E2=80=9Cowner=E2=80=9D?=
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 3, 2019 at 11:31 PM Markus Elfring <Markus.Elfring@web.de> wrot=
e:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 3 Nov 2019 13:23:13 +0100
>
> The field =E2=80=9Cowner=E2=80=9D is set by the core.
> Thus delete an unneeded initialisation.

Acked-by: Oliver O'Halloran <oohall@gmail.com>

>
> Generated by: scripts/coccinelle/api/platform_no_drv_owner.cocci
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/pla=
tforms/pseries/papr_scm.c
> index ee07d0718bf1..f87b474d25a7 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -513,7 +513,6 @@ static struct platform_driver papr_scm_driver =3D {
>         .remove =3D papr_scm_remove,
>         .driver =3D {
>                 .name =3D "papr_scm",
> -               .owner =3D THIS_MODULE,
>                 .of_match_table =3D papr_scm_match,
>         },
>  };
> --
> 2.23.0
>
