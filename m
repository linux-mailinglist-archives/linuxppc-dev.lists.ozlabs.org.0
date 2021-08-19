Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D763F2357
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 00:40:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrKV82lDZz3cYZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 08:40:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=dIr051qi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=dIr051qi; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrKTR6gf2z307T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 08:39:53 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id w8so7296490pgf.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 15:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=WX/qJVOnuFAI2moIv6OF4lqewvc4NdGxWkCdYilIaS4=;
 b=dIr051qis+9TSdlqlxkVlLOVanqfmbLXpUhEciivJ12h+asK6W8Lb8B1xQ5SOFx0ed
 hBWa5vXbV5b1XLr52yfjhKR12+utTBNZO8Ms6rSiPQtoDnQJGUQfsRj1N9qnjRpMnSko
 tbJ3maAALuUqpegMFAmcYb5xUkx8ZNp9IKaEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=WX/qJVOnuFAI2moIv6OF4lqewvc4NdGxWkCdYilIaS4=;
 b=YiHD271kShfqwSOIJm8QDmY9EYTCYynXYrs3xHEBfAfbA6I40ARk2lO28Gk27xhoHD
 R4DwwlPj9oKXJB1JxDa3QgrgZtNf+8SjFclswDqU2yIX7yuMf6UhgSt6Jl0QygSbF1lK
 W3XP5CHTMIIS5HzkKV+2NBixeJ0mvq5+ODrxrKZUmJxk/zpf4SM84irRgXUfCHOT6Lsa
 8951OGH5Qm9eYQq0GvDJRIeofCW7GyqEXK31DfA8N4TffJv/zUY995o9Dw4kWRDRG3uj
 AIT/ez1iMTod2wg0UNgcfXe+/QRwjoNY5eY4W/g7z4l4AHehzmbV3kJvih93NBiL3I6M
 HOYA==
X-Gm-Message-State: AOAM5325UaR1NnWzq4jVHNc4EC2xu3k2WkhKJP8sk5z7N8tRJiWq5yRo
 EHxWlBA5OISNBusaH3iLT7XSSA==
X-Google-Smtp-Source: ABdhPJydtoDgmtfFU7iCvzmfD+6LAiNa/sBr8PkQ4fFuCRed3yo4/Qn+wZAYqYuVMFMYpSUN+dNGhA==
X-Received: by 2002:aa7:8e56:0:b029:3cd:c2ec:6c1c with SMTP id
 d22-20020aa78e560000b02903cdc2ec6c1cmr16390211pfr.80.1629412788706; 
 Thu, 19 Aug 2021 15:39:48 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:3a83:f47e:d5a3:378a])
 by smtp.gmail.com with ESMTPSA id x69sm4639869pfc.59.2021.08.19.15.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 15:39:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Paul Mackerras
 <paulus@ozlabs.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Michael Neuling
 <mikey@neuling.org>, Anshuman Khandual <anshuman.khandual@arm.com>,
 kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc: kvm: remove obsolete and unneeded select
In-Reply-To: <20210819113954.17515-2-lukas.bulwahn@gmail.com>
References: <20210819113954.17515-1-lukas.bulwahn@gmail.com>
 <20210819113954.17515-2-lukas.bulwahn@gmail.com>
Date: Fri, 20 Aug 2021 08:39:45 +1000
Message-ID: <87sfz59hzi.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Lukas,

> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index e45644657d49..ff581d70f20c 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -38,7 +38,6 @@ config KVM_BOOK3S_32_HANDLER
>  config KVM_BOOK3S_64_HANDLER
>  	bool
>  	select KVM_BOOK3S_HANDLER
> -	select PPC_DAWR_FORCE_ENABLE

I looked at some of the history here. It looks like this select was left
over from an earlier version of the patch series that added PPC_DAWR: v2
of the series has a new symbol PPC_DAWR_FORCE_ENABLE but by version 4
that new symbol had disappeared but the select had not.

v2: https://lore.kernel.org/linuxppc-dev/20190513071703.25243-1-mikey@neuling.org/
v5: https://lore.kernel.org/linuxppc-dev/20190604030037.9424-2-mikey@neuling.org/

The rest of the patch reasoning makes sense to me: DAWR support will be
selected anyway by virtue of PPC64->PPC_DAWR so there's no need to try
to select it again anyway.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>  
>  config KVM_BOOK3S_PR_POSSIBLE
>  	bool
> -- 
> 2.26.2
