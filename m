Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 96790184E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 07:39:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4502Fs6jS2zDqNS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 15:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dSR8FxlX"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4502DX2Fq1zDqK9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 15:37:47 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id n8so547051plp.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2019 22:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=QTBSKwov9bV42h8AaZgpxExz8HLq9XgMRYYGowUTF9k=;
 b=dSR8FxlXMBl8jJGJ8XNFijMB4byq3QnUyvon9O+J4xWqE0f4cbE+GmarktjlkytQ5J
 qFF/f6aK42LxahUp72+MepofD9I9wc761Vw4jcLCRNWMsChvTpeHcKH7mtDaAs23qlji
 PcsT+FO8hkf9wHOgJT3ewM/fEAedoBkW+Gvv3tsW6VbpqdUaLbKntLxK21fTOIg0tKsT
 l1YupS1/xIOC/gUEu2o6aD+T08MHuJq1A/dXYTL5w/LaapODSbGEAPrVcoNQ0jQuI4Sf
 pBxb7W49VLyNfRDBZ8Qk29SRd9pVN1qZ5pv5jj9BnhPghAIg8fyQLg+G1ZqFqxk1AnWG
 gKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=QTBSKwov9bV42h8AaZgpxExz8HLq9XgMRYYGowUTF9k=;
 b=QOv0H8b6ePgTNnqUwXu4JU1IjMO09+srFhUPN+U4b/8RMsFkrYVgZ3U11rtog/Q87s
 li11iRZuuSt5j5eRkHxqG156/R76dLLma5zkJ4FVPs9Lxy6KwQl9YH+4Zqwx0/VyDMTU
 7Om5NVkAXPbzZLH9/pnNAxVuOhQEU1m0wdcbpe6cLs6Zj4uY0zNBKyToN76fknCqoYuW
 iNe9PWpArb43cTMM8jNnpWRbNprFukuGzPNZ1n2rZozfq8INeoIfi7ve1b6isN0vZTtE
 lMTNCiqCg/ReoxYezQ5l2qKPdxshE+h0u7nqywM7PPcJ6HVKe04CtG9N1MVBfcYwiqdT
 sSQQ==
X-Gm-Message-State: APjAAAXuo0a4UsGswayEIl6Zr4wl7Ur4QdfQ45hNPtsvnol+wzV9ehFq
 L8ai9sDheDcEbM1+93RF4J8I5uCF
X-Google-Smtp-Source: APXvYqyVtyNDsqooXqwztRGV9xNhDEkwUNZVD+WP9R492uuj8YUpuixSG66HOD5TwllU3zRFRg/Dyg==
X-Received: by 2002:a17:902:1024:: with SMTP id
 b33mr2658892pla.46.1557380264761; 
 Wed, 08 May 2019 22:37:44 -0700 (PDT)
Received: from localhost (60-240-170-217.tpgi.com.au. [60.240.170.217])
 by smtp.gmail.com with ESMTPSA id s6sm1307826pfb.128.2019.05.08.22.37.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 22:37:44 -0700 (PDT)
Date: Thu, 09 May 2019 15:37:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/5] powerpc/configs: Disable SCOM_DEBUGFS in
 powernv_defconfig
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20190509051119.7694-1-ajd@linux.ibm.com>
 <20190509051119.7694-5-ajd@linux.ibm.com>
In-Reply-To: <20190509051119.7694-5-ajd@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557380130.bkras9z1l5.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan's on May 9, 2019 3:11 pm:
> SCOM_DEBUGFS is really not needed for anything other than low-level
> hardware debugging.
>=20
> opal-prd uses its own interface (/dev/prd) for SCOM access, so it doesn't
> need SCOM_DEBUGFS.
>=20
> At some point in the future we'll introduce a debug config fragment where
> this can go instead.

That doesn't really explain why you want to disable it. It is useful
for low level hardware debugging, I added it.

obscurity^Wsecurity?

>=20
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
> v1->v2:
> - new patch
> ---
>  arch/powerpc/configs/powernv_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/config=
s/powernv_defconfig
> index ef2ef98d3f28..d5a6608cb2e0 100644
> --- a/arch/powerpc/configs/powernv_defconfig
> +++ b/arch/powerpc/configs/powernv_defconfig
> @@ -38,7 +38,7 @@ CONFIG_MODULE_UNLOAD=3Dy
>  CONFIG_MODVERSIONS=3Dy
>  CONFIG_MODULE_SRCVERSION_ALL=3Dy
>  CONFIG_PARTITION_ADVANCED=3Dy
> -CONFIG_SCOM_DEBUGFS=3Dy
> +# CONFIG_SCOM_DEBUGFS is not set
>  CONFIG_OPAL_PRD=3Dy
>  CONFIG_PPC_MEMTRACE=3Dy
>  # CONFIG_PPC_PSERIES is not set
> --=20
> 2.20.1
>=20
>=20
=
