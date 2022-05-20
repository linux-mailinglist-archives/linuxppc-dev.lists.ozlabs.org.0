Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB5752E0F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 02:06:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L46Tm2BnLz3bmt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 10:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SeLChqOw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SeLChqOw; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L46T41wfKz2yxS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 10:06:15 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id 10so2646779plj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 May 2022 17:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=c+DGCecTaHW8wfGhmO8S9NDcGqXyEL5mQF8/8xuT1Jo=;
 b=SeLChqOwzRHKa02QJVl8DhK0CrYV/va00/fjVF53oEbETsy+6KPqLJqtXPboxwUgB5
 BuD25t/BwDU8JHgdA6x8BSrRTpp7JG5CI2hv424YZqrrKiWHt+ZetWstxXZ7HW1e934d
 vt7TcNPmSkCTkuJfStbc6va45PBxahXPYBWXhiP4M1+TNCbQxT2DSstxZgW60HRhnwRl
 EB2kI4UXUmbr3sfNAI3DDgjlikdyGJnn5eJn3irg/euU53Pggk0XBe8XCFk2qkSUHP3d
 c5OuWbwMZ6m1cGahpUpLF/7UF4KZOU8U68dECFzwwVAPCQLJkD6vNVhQlWowRSz3C12b
 0PlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=c+DGCecTaHW8wfGhmO8S9NDcGqXyEL5mQF8/8xuT1Jo=;
 b=b+4KUcSPx65H//IciXyA+tnhHZpRkp/DtjKfmy9p0O5aOK9cshN1UjtyDNW4riQI9A
 EY9+KdZRwScQ6nR5OFtqADVIKjfh+0MBXe9X4mwisAmIrxQaqQ0o3gMRpaw59+wNtr2q
 j+CRKuUo8ZWTldniD4/BvRU8fiSpvSWaaDNR2lI3E1GA/LfijpU0mUidYjDC5RLUs8C3
 RWP58qToIA0d+GIaVGZ0cguThX5tSGnEWQoIx7TQx3XTm7qmRdNjxrTOZBGThMOJJevk
 D8U91i1Izj5x/z+GMKQM6UgOLmBMVJvTZa3GFIsVbu7nGZlm07Zp6c4YIuuNZgMjcokD
 1IUg==
X-Gm-Message-State: AOAM531ZkX0TTMNbNj3KrV9J7L3f82MB8IigCGOPZ6/sqiBTUDpJ2U+V
 n4zQ/tHK98wv7DQjw8o+Q8s=
X-Google-Smtp-Source: ABdhPJzLS9xsMGAkep+YqNn1RFgYkEYPjkugtmi17yA4IFs6hzlPJpljg0M1cKexk1er55eBXsulFg==
X-Received: by 2002:a17:903:210:b0:15e:f139:f901 with SMTP id
 r16-20020a170903021000b0015ef139f901mr7366107plh.66.1653005172683; 
 Thu, 19 May 2022 17:06:12 -0700 (PDT)
Received: from localhost ([118.208.131.68]) by smtp.gmail.com with ESMTPSA id
 c27-20020aa7953b000000b0050dc762814fsm277317pfp.41.2022.05.19.17.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 17:06:12 -0700 (PDT)
Date: Fri, 20 May 2022 10:06:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/microwatt: Add mmu bits to device tree
To: Joel Stanley <joel@jms.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20220519125706.593532-1-joel@jms.id.au>
In-Reply-To: <20220519125706.593532-1-joel@jms.id.au>
MIME-Version: 1.0
Message-Id: <1653005064.mw8ywmb8ft.astroid@bobo.none>
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joel Stanley's message of May 19, 2022 10:57 pm:
> In commit 5402e239d09f ("powerpc/64s: Get LPID bit width from device
> tree") the kernel tried to determine the pid and lpid bits from the
> device tree. If they are not found, there is a fallback, but Microwatt
> wasn't covered as has the unusual configuration of being both !HV and bar=
e
> metal.
>=20
> Set the values in the device tree to avoid having to add a special case.
> The lpid value is the only one required, but add both for completeness.
>=20
> Fixes: 5402e239d09f ("powerpc/64s: Get LPID bit width from device tree")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

LGTM... does Microwatt actually need 12 lpid bits, or does it just need=20
the LPID 0 partition table entry? I wonder if you set it to 1. That's
a minor nit though.

Acked-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/boot/dts/microwatt.dts | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/=
microwatt.dts
> index 65b270a90f94..b69db1d275cd 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -90,6 +90,8 @@ PowerPC,Microwatt@0 {
>  			64-bit;
>  			d-cache-size =3D <0x1000>;
>  			ibm,chip-id =3D <0>;
> +			ibm,mmu-lpid-bits =3D <12>;
> +			ibm,mmu-pid-bits =3D <20>;
>  		};
>  	};
> =20
> --=20
> 2.35.1
>=20
>=20
