Return-Path: <linuxppc-dev+bounces-1668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 450FE9888DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 18:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFbG006Dyz3cMG;
	Sat, 28 Sep 2024 02:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727453831;
	cv=none; b=IIiIUfCN23wbZB9CwQVYj53jRjf0A8Tk7zuN4VHRMBXYVPVVh0ViaMzzH210uWGRPORqHtwmQNi7JXnMP7tZiL4pF1T1DzbsIeOqERu5+vzRSql5SnN6QuRzd3VDycanRSucTi7DCsTE+GaAwqvqdNR1FLtSJw+iVU+TbVl+2Al1FXd6yQAvtejbNsdTG8GzwjDCcVZFj1DkBCVZKdUuXAeBfccZgQXfYvVvO4vbVPyfLySdLTdA7FxL+n+VlcyNQIVJ1SMsOGwZqx95t1xwujtFMUazzB54WMz9SW1/E0F64o5M92dj5x9bXNrFIojY4kQLVmKT1BXRmFckJova1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727453831; c=relaxed/relaxed;
	bh=L+yddGmNvvninROrZh27GX7gU63fOouPWzZAESW4FuI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=UJhB+Rqo2B2YnG2KTNawzglNggrIbWzXc7YkACLn5d5m1Qtq9VXN7+cruECWMrZlZAHCCCJPNP30myWqgX4AEal/jx4apXre2H50m2A4cFyzIt18noadX0AZhkdXwXvIMWesUMld0+IAZoUMN2wBf8mTSeu4C43mKjQ5iwQ3HFUeOJI9cmIMuDrcyiEUnfTygQ1nMFoZYoojH2wQFMNkcLssFkaPtLRx3SQRTmLV1JVfOMpT90ObiugspTG/IxMehxMXHj1jXx1xXLqfjy53xnijhWaXoKAqciBvkF+f9Iz/UvDq5ZNR8ykTmVbtXnALTYjrPzupx9x2YT95drBvcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mjw5OnTH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mjw5OnTH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFbFz4qmPz3cM2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2024 02:17:09 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7178df70f28so1958693b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727453827; x=1728058627; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+yddGmNvvninROrZh27GX7gU63fOouPWzZAESW4FuI=;
        b=Mjw5OnTHD5atUq9QAT0fwOAj/C2Y1R/+tPpFG8Ui5DOJq7qvdNJnTHm0BW/fV+dSs7
         3EP534dtreKqSK/lvZqQSGvhOYzB+wqSIJAh2VOGwYCOOj4aF+CsPok9DGIRCS3L8Xhn
         IWfGsw4mUubScAEAbpiudT6byd3udXkphpBW4ybYb2/sljk7pP6YUunfHvYsjTc1osc6
         97+ITrSxYMAoo26XpNWqhGqf8cHCP5Hyrj8lIgBCvWj6qNE/e5ju3JocrdrXXzmsxU5f
         8s33gjiYGWXpBza5dwMj2+ONsnOH1eVPyJCkR+B0We4Eqvercy9hfmDLvTGQA3Qs5x8i
         9ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727453827; x=1728058627;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+yddGmNvvninROrZh27GX7gU63fOouPWzZAESW4FuI=;
        b=ZWaBC+IQu3NnPrqkiV5Kfnag1zK7AVIARciu8OqYc5OCn1dw6yhXGJXOrjxUOO2pyt
         LwXsi3vK093S0FeFoiyswwSvsYpaUsjuHrSzaHd/hPfTurby9JH2XY6RsI4aQUrajOUJ
         Lu6iJy4MutoTybKAvNbdFgGpxu3T5O/D1stLxcHTZBicxnTC1qA4rAvpdMSJ4XI6rXwx
         xE37Kb4IlviL5Ob2f1Xke7qkSx9uneqnePI+Nscj0sS4Sb51q53UACHNEM03uqZBjyDT
         z/GvacoJf5AkxxjfmyzUp0TQGlyRBVU208ytToL4hGrSDBg3wt/WCX3Mung1B5rWUFFD
         RHZA==
X-Forwarded-Encrypted: i=1; AJvYcCVnjvG15FY/9Eln/4kf2kimKpAvY/mDEoN/RLfo3akCDtBC1YgcLo/R8dAkfUaqCkMWF82c+1UUu3HuDBY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGkb3m36smBXNXvkgytQJUdiQtBNWg6gYHdNCc376S06nuhyNz
	B4wVe6oOWvRZ8RS5WO7FEY502bWcjHVxZi+klQH0sahg17qNZyGc
X-Google-Smtp-Source: AGHT+IGozEALnQx1Er7SBfzGwW2QDie8jNd5SkYPMBx3yNF2xMOdfceVDjor2c9KEZXwlrpTM7HORA==
X-Received: by 2002:a05:6a00:17a9:b0:70d:2fb5:f996 with SMTP id d2e1a72fcca58-71b25f451e7mr5943442b3a.11.1727453826683;
        Fri, 27 Sep 2024 09:17:06 -0700 (PDT)
Received: from dw-tp ([171.76.86.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26515f1asm1766740b3a.135.2024.09.27.09.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 09:17:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>, Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] powerpc: remove dead config options for MPC85xx platform support
In-Reply-To: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
Date: Fri, 27 Sep 2024 21:23:45 +0530
Message-ID: <87frplay9i.fsf@gmail.com>
References: <20240927095203.392365-1-lukas.bulwahn@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Lukas Bulwahn <lbulwahn@redhat.com> writes:

> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform
> support") and commit b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform
> support") removes the platform support for MPC8540_ADS, MPC8560_ADS and
> MPC85xx_CDS in the source tree, but misses to remove the config options in
> the Kconfig file. Hence, these three config options are without any effect
> since then.
>
> Drop these three dead config options.
>

Indeed these looks to be dead config remaining.

> Fixes: 384e338a9187 ("powerpc: drop MPC8540_ADS and MPC8560_ADS platform support")
> Fixes: b751ed04bc5e ("powerpc: drop MPC85xx_CDS platform support")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  arch/powerpc/platforms/85xx/Kconfig | 21 ---------------------
>  1 file changed, 21 deletions(-)

I couldn't find any relevant reference of MPC8540_ADS, MPC8560_ADS or MPC85xx_CDS
after this patch

So please feel free to add - 

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

>
> diff --git a/arch/powerpc/platforms/85xx/Kconfig b/arch/powerpc/platforms/85xx/Kconfig
> index 9315a3b69d6d..604c1b4b6d45 100644
> --- a/arch/powerpc/platforms/85xx/Kconfig
> +++ b/arch/powerpc/platforms/85xx/Kconfig
> @@ -40,27 +40,6 @@ config BSC9132_QDS
>  	  and dual StarCore SC3850 DSP cores.
>  	  Manufacturer : Freescale Semiconductor, Inc
>  
> -config MPC8540_ADS
> -	bool "Freescale MPC8540 ADS"
> -	select DEFAULT_UIMAGE
> -	help
> -	  This option enables support for the MPC 8540 ADS board
> -
> -config MPC8560_ADS
> -	bool "Freescale MPC8560 ADS"
> -	select DEFAULT_UIMAGE
> -	select CPM2
> -	help
> -	  This option enables support for the MPC 8560 ADS board
> -
> -config MPC85xx_CDS
> -	bool "Freescale MPC85xx CDS"
> -	select DEFAULT_UIMAGE
> -	select PPC_I8259
> -	select HAVE_RAPIDIO
> -	help
> -	  This option enables support for the MPC85xx CDS board
> -
>  config MPC85xx_MDS
>  	bool "Freescale MPC8568 MDS / MPC8569 MDS / P1021 MDS"
>  	select DEFAULT_UIMAGE
> -- 
> 2.46.1

