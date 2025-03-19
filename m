Return-Path: <linuxppc-dev+bounces-7214-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B92A689E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 11:45:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHljW6f9Kz2yvs;
	Wed, 19 Mar 2025 21:45:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742381135;
	cv=none; b=gtKlg01OGizKJSMl+bHX+gxFhUOnlvOStXxD07BxoJ1p24BTjZFPOn/iul/8HTCrhTz0QEAMJbpRKkQfBXgl6knkXWMcDC2dSDVEl6z/DI2RViXb7f30SsTkjVApOLFGwxa0/zOJvSKlSEdCWT197hzG3mMmeYvV9VvPls8PoRlUTfogua6S+lgUix6YUaUSJAlRDCkTY6wPQUrmC0dviN3fNpZNiiG2AGPo6qwrAJCPJZF/u+oln5xOzKFjVNKgjpFb7gxGRU/eUX5b7NcDF8SJV0NqIpCeY5rWQKSFDG9IfVY5GucnfAxDjSheiteCX7vKQ5V3QSjDYjFws3ZV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742381135; c=relaxed/relaxed;
	bh=rhe/YVFVvtqAYue+ilvTya6tr5KQKB9BmYqo9z5w8/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U06WoprZWfSoUEV9GR574MCVs5EaCtE+vZZ2dGNMg03yNISk68qGSjVixPj/2Zi62PKrvwFNYZwrmgshgFor6kCypUfEQC2aWe+lw0O6FlLjZsCOP0Ch/vdXdoQjIOZaEp9KhvfArzqlKU4eGPKKBoRLdOlqMRpZHLopNixDMayeaaJ7zWmcVLoOk6NVl4/2axRLZBBc2NW6Rnug4Nf3jvoWEpm6PW3eAkS7RWA2CLVfnaQyIy5VP29Bn8l35Pc+VMPw4ry/1oGuKlvnoholJ1SvXAIkJk6t1uwvD+i7Kff/3+IzitHlA/9VdEedHp4ofb9KiRLhkrtKhroixHanjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EaR6wzjG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=stuyoder@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EaR6wzjG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=stuyoder@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHljV6rYHz2yvk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 21:45:33 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22359001f1aso17672725ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 03:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742381131; x=1742985931; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rhe/YVFVvtqAYue+ilvTya6tr5KQKB9BmYqo9z5w8/s=;
        b=EaR6wzjGLlRDQImnJurqythpYa91wBjFSQS4E3dzgkgmSiVz9T0Fn3zXuASpxBqrks
         hvmxj1qujN5Z8ShnMdGH71BfKfEwAtlyS8EBMiVgWFLxhn2iiXO/r/iDI57xPp8M+6cf
         wvUvM3hlRQYiC9wTLKwVAmh466mUVrmLUNTYd9wslJUSqL47t0AEVo/T4Z37ZNJ2U3V7
         dk8XIf5GnSED1ANwHE+SnGPTtV/jztrFEPjpay+J31n58Zk5XETPIxw/utsgIJywKtI9
         9T3BsxeyCKZnS3zLlmiN3UJIV+Eizw9N3RDJua33ojGHNAmKzJKgJSIh+M7edAJ3kpqr
         uzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742381131; x=1742985931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rhe/YVFVvtqAYue+ilvTya6tr5KQKB9BmYqo9z5w8/s=;
        b=CKH5F58bqq92E/R7xDUureENbBO3uANCn4Ms/SK6yi808hwrNAMgZIvMD2SzJcUkfE
         epiOrbmypkaUfvQxaIdPydc67tt7NUAfwuWmEVwSc1cYoQl1b5iYB4CDILz8FMusxNxL
         uE3HssKP7o747zaY5ZPII5CueRm5dRUSM2TuJwMMoN/FjrCIBlyi/6pG8P+hc9toqGVT
         UTuZaL2B1hZU356Bdlaf8k+csWOtsHp1lcCi8oY7ykrXYUiNyCon3pQVPv9l4eNxpOrQ
         t0D+hKyetN7j6/y81ziqfCP2zm7r6kLd11fp8DeCYFKnXq0tfkTZ0IMloxHzmW0C5Usz
         NTwg==
X-Forwarded-Encrypted: i=1; AJvYcCWBgeJy+g2pIzki5Wh+aHZL09bGgL8/CIGqItuhn5nYnpnVwdLBVsgouBkC+3ZbW3EI30ZTrar1zlFmNiA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzdp4414GfKjCEegahfPVASfmSG2Q+O3/UVPncn62PZfBkBgrb5
	wR7seSPERoTYqfDvdDeJGn69nq2DPp5FMUbvSAsk8mKe52lD9JeibvuhhxodDq2Y0pXQ1cRmMN8
	MV/e9BAam+vdR2YpBQ9/E8jxMyMQ=
X-Gm-Gg: ASbGncubJxBQY/Cz/va4WOjEQ9D0Q15yrt8Zmj6AyrD6XcwYl69SUAnz/em7qK4Yhi/
	+jc9M6GGgDtEEQBEuY22UhEN7UxCjmy+KoE1xCnxSKRTNz4ouGfRh5HTgY9D0EbYqYg5CLuP9J+
	Zk7gCS99oFt2bDlRDz3/8LDkJlsUIoegQAfDR8/duhJUu1Vcwm8sTx6YCQLzX0
X-Google-Smtp-Source: AGHT+IFHMOwI3ci08Xdbgi0HisPueEsAOyGtg2PZPOACOufiHYA9ltSrQHzy1sOgy/ozpJEVTujg8JMFSPF/kypHvDo=
X-Received: by 2002:a17:90b:224c:b0:2fe:b907:562f with SMTP id
 98e67ed59e1d1-301bdf84fb6mr3769103a91.14.1742381131249; Wed, 19 Mar 2025
 03:45:31 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250319094311.2966519-1-ioana.ciornei@nxp.com> <20250319094311.2966519-2-ioana.ciornei@nxp.com>
In-Reply-To: <20250319094311.2966519-2-ioana.ciornei@nxp.com>
From: Stuart Yoder <stuyoder@gmail.com>
Date: Wed, 19 Mar 2025 05:45:19 -0500
X-Gm-Features: AQ5f1JpWMkc7Rl9Jl3L62MSMbECLagCqIa2itUidvbRMU8FmCT2dvUoaLbmx4dc
Message-ID: <CAEac7tYQE76z4pYminhvMJR6GZ66RPRv4PxM-U9VpGJjvn6APg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: add myself as maintainer for the fsl-mc bus
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000643e820630afb87e"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000643e820630afb87e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 4:43=E2=80=AFAM Ioana Ciornei <ioana.ciornei@nxp.co=
m> wrote:

> Laurentiu left the company and is no longer involved with the fsl-mc
> bus. Remove him and add myself as maintainer.
>
> Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ebf7fa9a814d..76b6db4074ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19633,7 +19633,7 @@ F:      include/linux/qnx6_fs.h
>
>  QORIQ DPAA2 FSL-MC BUS DRIVER
>  M:     Stuart Yoder <stuyoder@gmail.com>
> -M:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
> +M:     Ioana Ciornei <ioana.ciornei@nxp.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/ABI/stable/sysfs-bus-fsl-mc
>

Please remove me as well.

Thanks,
Stuaryt

--000000000000643e820630afb87e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 19,=
 2025 at 4:43=E2=80=AFAM Ioana Ciornei &lt;<a href=3D"mailto:ioana.ciornei@=
nxp.com">ioana.ciornei@nxp.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Laurentiu left the company and is no longer i=
nvolved with the fsl-mc<br>
bus. Remove him and add myself as maintainer.<br>
<br>
Signed-off-by: Ioana Ciornei &lt;<a href=3D"mailto:ioana.ciornei@nxp.com" t=
arget=3D"_blank">ioana.ciornei@nxp.com</a>&gt;<br>
---<br>
=C2=A0MAINTAINERS | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index ebf7fa9a814d..76b6db4074ce 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -19633,7 +19633,7 @@ F:=C2=A0 =C2=A0 =C2=A0 include/linux/qnx6_fs.h<br>
<br>
=C2=A0QORIQ DPAA2 FSL-MC BUS DRIVER<br>
=C2=A0M:=C2=A0 =C2=A0 =C2=A0Stuart Yoder &lt;<a href=3D"mailto:stuyoder@gma=
il.com" target=3D"_blank">stuyoder@gmail.com</a>&gt;<br>
-M:=C2=A0 =C2=A0 =C2=A0Laurentiu Tudor &lt;<a href=3D"mailto:laurentiu.tudo=
r@nxp.com" target=3D"_blank">laurentiu.tudor@nxp.com</a>&gt;<br>
+M:=C2=A0 =C2=A0 =C2=A0Ioana Ciornei &lt;<a href=3D"mailto:ioana.ciornei@nx=
p.com" target=3D"_blank">ioana.ciornei@nxp.com</a>&gt;<br>
=C2=A0L:=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:linux-kernel@vger.kernel.org"=
 target=3D"_blank">linux-kernel@vger.kernel.org</a><br>
=C2=A0S:=C2=A0 =C2=A0 =C2=A0Maintained<br>
=C2=A0F:=C2=A0 =C2=A0 =C2=A0Documentation/ABI/stable/sysfs-bus-fsl-mc<br></=
blockquote><div><br></div><div>Please remove me as well.</div><div><br></di=
v><div>Thanks,</div><div>Stuaryt</div></div></div>

--000000000000643e820630afb87e--

