Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3708F24D2D9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 12:39:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXygk35PYzDr6S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 20:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=C5iE0U8l; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXydJ3qGmzDr6S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 20:37:24 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so645206pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 03:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=wrfIR1riy38cnam3DJIOduSkqnt3mE1DONngHIwcH88=;
 b=C5iE0U8llcF3JJ3sIpKpCCcopSQ8ZqrL2/0mn5e1nyG1LUu5ipQagkrjH79XC50tHU
 MYCGwK+U8ct9mZA6q+GvGMQkgGtpYKxv34hT4v+ZW/w9lU9khwWw+toZwhFTWmjYcRY8
 EKsjOvBHoUvMjxfGvOn61gY9TSq6o4EnzAuI5nmH7QdeZHlKJEJbvo7fEfgxQ6OxQL0v
 nMs1ju2TdV6q49XwW3jjuHxNSbSKJV766kfnNTm8BX0YM11toy6FKDJtCPyzm7ip1GOC
 33DAU7C+nJK5xxx0Ii1CaVgtZfcQeFmhTT4OKe2uEKxMMpgbTF1W8KzvIBP2Op5jM/pP
 aiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=wrfIR1riy38cnam3DJIOduSkqnt3mE1DONngHIwcH88=;
 b=o1t1jwHGZ6Hw0eJ24zJFTWfgWY6pAgBqA0ORRCxE2zAUKxzXxHDGf4Fn+9SQkebxHv
 AwgPJHSIHivxdprNYKxLhx1f6OErvpeQDNUsSPUFC4C7IDVxp0BMjV+dnE5qDsRph56o
 bgKtH3is/Pn34yX4FBLiQjAclR6aB0NviNrSNldaZMQqWgosl8PK3k5T7UOxnuyGceZ2
 evscHTxrurFzoFfLBJd+hMNuxNlNaqIgpz1aUvWWbgrzucVzt6BX4xKEOMSpn9eQxsDu
 u6PMHWrUB2hF7ptYd2zXLuWzGYDxrxkdz+EL6joaJu98VieeWYNJbgNd76/EY7KPaPY4
 +kAw==
X-Gm-Message-State: AOAM533hJvbs66T7U6lAOMmZYUV7v/pBBAomzaPmTkOGf/Fr57KGARbo
 dxsd95xY5WUu9LaZMt7rPqT15aYjJhE=
X-Google-Smtp-Source: ABdhPJyuPZEDIiuIbLPBxbngXQe/7Qr7KFnxCBXSvXO75VgvSUKj2huErV01md7AjDyHd+6gouwlsQ==
X-Received: by 2002:a17:902:ed4a:: with SMTP id
 y10mr1965561plb.106.1598006240670; 
 Fri, 21 Aug 2020 03:37:20 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id na14sm1409187pjb.6.2020.08.21.03.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:20 -0700 (PDT)
Date: Fri, 21 Aug 2020 20:37:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/64s: Disallow PROT_SAO in LPARs by default
To: linuxppc-dev@lists.ozlabs.org, Shawn Anastasio <shawn@anastas.io>
References: <20200821010837.4079-1-shawn@anastas.io>
 <20200821010837.4079-3-shawn@anastas.io>
In-Reply-To: <20200821010837.4079-3-shawn@anastas.io>
MIME-Version: 1.0
Message-Id: <1598006106.5gm5wgd52s.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Shawn Anastasio's message of August 21, 2020 11:08 am:
> Since migration of guests using SAO to ISA 3.1 hosts may cause issues,
> disable PROT_SAO in LPARs by default and introduce a new Kconfig option
> PPC_PROT_SAO_LPAR to allow users to enable it if desired.

I think this should be okay. Could you also update the selftest to skip
if we have PPC_FEATURE2_ARCH_3_1 set?

Thanks,
Nick

Acked-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> ---
>  arch/powerpc/Kconfig            | 12 ++++++++++++
>  arch/powerpc/include/asm/mman.h |  9 +++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 1f48bbfb3ce9..65bed1fdeaad 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -860,6 +860,18 @@ config PPC_SUBPAGE_PROT
> =20
>  	  If unsure, say N here.
> =20
> +config PPC_PROT_SAO_LPAR
> +	bool "Support PROT_SAO mappings in LPARs"
> +	depends on PPC_BOOK3S_64
> +	help
> +	  This option adds support for PROT_SAO mappings from userspace
> +	  inside LPARs on supported CPUs.
> +
> +	  This may cause issues when performing guest migration from
> +	  a CPU that supports SAO to one that does not.
> +
> +	  If unsure, say N here.
> +
>  config PPC_COPRO_BASE
>  	bool
> =20
> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/m=
man.h
> index 4ba303ea27f5..7cb6d18f5cd6 100644
> --- a/arch/powerpc/include/asm/mman.h
> +++ b/arch/powerpc/include/asm/mman.h
> @@ -40,8 +40,13 @@ static inline bool arch_validate_prot(unsigned long pr=
ot, unsigned long addr)
>  {
>  	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
>  		return false;
> -	if ((prot & PROT_SAO) && !cpu_has_feature(CPU_FTR_SAO))
> -		return false;
> +	if (prot & PROT_SAO) {
> +		if (!cpu_has_feature(CPU_FTR_SAO))
> +			return false;
> +		if (firmware_has_feature(FW_FEATURE_LPAR) &&
> +		    !IS_ENABLED(CONFIG_PPC_PROT_SAO_LPAR))
> +			return false;
> +	}
>  	return true;
>  }
>  #define arch_validate_prot arch_validate_prot
> --=20
> 2.28.0
>=20
>=20
