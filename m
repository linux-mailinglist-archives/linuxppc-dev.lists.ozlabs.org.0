Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D600260DEB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 10:47:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlzL63DLSzDqHk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 18:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lkL9TzTO; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlzHB2cPQzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 18:44:53 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d9so4103833pfd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Sep 2020 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=PiRn9NwzKohrwBuFF5bFBZNNmANW0xplBGn4HXUwbyY=;
 b=lkL9TzTOhf4dkeNPtCdPcsSlTqHtEC3Af69+imHnsfVc4F94f5/uTawrqMRt05G5Bf
 /qaZ53cp41K2BtaTuxHKI6SIFU2/JREPuLvrJY4NitPTxqv5gYoomX4xuz/gpgJecN3i
 eP28Rkfm6Cy4k3eh7YbN2LMnakrJcXtDXzMGn2OPeG3QPdlbAiFlVPc5etn9ivr941Fs
 SS9pgsRNxYVBWFzJUuDj78/LkJ3c2935s12UMZlGaq4+SOm8gpNG/TtrtZDdh0HwkrZM
 SRzcendWednW5KpWFaKBv4RryDecjCJmJLPB6o6ob39pQvvSgLBSfSkMTgqlEjyUrudF
 NCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=PiRn9NwzKohrwBuFF5bFBZNNmANW0xplBGn4HXUwbyY=;
 b=ObB6dAi5MEm8KPj3WcFZKHjmOg6IDztvzfjla6VNYKOzZgK5IvI4vDKIB5EAFHQYuL
 B1p7w/DMEO4DM74Pb0BNkDd8BLBva+K+p9mgRX2kEGOH4gkA97f7hejFIBiroKzJcNjJ
 Aq/w+7fYhT46BdH5NzZvWzRTaA+4/6Og7OxgneV2ygVOoz4R8Ew5uRPBRX9fqV0PhmfR
 hlQ+Lzo0mFCf5o6AXF5yJLx2wnoXGyOle11kLORA9v8Ah1LIxmVnmdnyhdqPCW1iZnxR
 tT0EOJDJ87yZDAy+0x+hMh6xkLGFzxu588F6WEeiUsPQ2BmzJKM1dRAXS8YPoUxifeI5
 rSjQ==
X-Gm-Message-State: AOAM530OartLfL6zX/QDrdW08lODjlKTWMA5KY5ik9I5IWEL0m739jg8
 +KI0piIXNhoyS0weVp5aEEY=
X-Google-Smtp-Source: ABdhPJxVM8x5twFdRZ5+HrEYOCxGbZDu70wGmAmIaGeAjbvnI0yPo6twAe3uTH9ciTVhFg1ASQWuUw==
X-Received: by 2002:a63:6d0d:: with SMTP id i13mr19811682pgc.372.1599554691406; 
 Tue, 08 Sep 2020 01:44:51 -0700 (PDT)
Received: from localhost ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id 82sm14468515pgd.6.2020.09.08.01.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:44:50 -0700 (PDT)
Date: Tue, 08 Sep 2020 18:44:45 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 2/5] powerpc/fault: Unnest definition of
 page_fault_is_write() and page_fault_is_bad()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <7baae4086cbb9ffb08c933b065ff7d29dbc03dd6.1596734104.git.christophe.leroy@csgroup.eu>
 <4cd127f8988b7b5d3a9b24b67dbad81fef3aee7f.1596734104.git.christophe.leroy@csgroup.eu>
In-Reply-To: <4cd127f8988b7b5d3a9b24b67dbad81fef3aee7f.1596734104.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1599554667.yx7o7g5m0l.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of August 7, 2020 3:15 am:
> To make it more readable, separate page_fault_is_write() and page_fault_i=
s_bad()
> to avoir several levels of #ifdefs

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/mm/fault.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 2efa34d7e644..9ef9ee244f72 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -363,17 +363,19 @@ static void sanity_check_fault(bool is_write, bool =
is_user,
>   */
>  #if (defined(CONFIG_4xx) || defined(CONFIG_BOOKE))
>  #define page_fault_is_write(__err)	((__err) & ESR_DST)
> -#define page_fault_is_bad(__err)	(0)
>  #else
>  #define page_fault_is_write(__err)	((__err) & DSISR_ISSTORE)
> -#if defined(CONFIG_PPC_8xx)
> +#endif
> +
> +#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
> +#define page_fault_is_bad(__err)	(0)
> +#elif defined(CONFIG_PPC_8xx)
>  #define page_fault_is_bad(__err)	((__err) & DSISR_NOEXEC_OR_G)
>  #elif defined(CONFIG_PPC64)
>  #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
>  #else
>  #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
>  #endif
> -#endif
> =20
>  /*
>   * For 600- and 800-family processors, the error_code parameter is DSISR
> --=20
> 2.25.0
>=20
>=20
