Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3794B19CF11
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:20:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tmvW2Zq0zDrK0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R/9TSVUb; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tmsq3sBszDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:19:25 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id ay1so2222754plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 21:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=u578RWdTBK/7qcVgW9R1RT7Q8mregflyNv6EOHOXgjA=;
 b=R/9TSVUbDlU0/mnD1dZRhVGZ6VVVorQBLhkGPldMRvTFkGs1kRcerlwj+TVBKDV32C
 BCnYMVgCQ+pLmX7SXiGP8Ogi1jyTRKdQj0PZcb39l3olZeYvcIbBc4xRhLWQaqpBXDvy
 CVfXRnlFeOmy6v6TcEFn+g5ybeb7rxmQlA6JkGpIi1J04VKQbtUMM/C51Z67QbnL++nB
 Qe+/NrCejbyml1NXHyQAmFvQlxNyICaIXBJN2uzrpsZNQ8S4fR7uEq3ItsG4SgLY+EhB
 2ioAUMQq3Qm86AG8fbjisEkWicjd5B7wlWioRIZnptpKB8iuzY+I9FlbpfrK/Xy/FZwr
 milQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=u578RWdTBK/7qcVgW9R1RT7Q8mregflyNv6EOHOXgjA=;
 b=S1YeN28yOy1pvk8NYun4u3o+Sou+QkShxmLaOeIuIADcNn5f10ROJ9W9dl9YIlv/y7
 +WmXH/WtFwrqG0VH1Ie6Waukeszlitdb+b7LLRTWQHFKenuYR03R2g7JIp0jp1NP+82g
 hygWTF6kPX8x3HddjhE8dLNJtP6grROlaBeMY3a2sdXC8gC7N7MG+oO73/wXhcJS9+rt
 HxboIF5ZZ3F68tf4Ez7rdwV/1yDh+v4uGHQVSO81Cc6hX5CC+npJKXmZxHihhbOhifU+
 7Qcb+tpjB2RSkiZjdPZbW06OZiHuOwmgjC145e9S7NnMWi68ajmDI+5E81q5iR6MMg5O
 +GdA==
X-Gm-Message-State: AGi0Pubonac7nOzYb3lSPPuVGxbphaa3PdOfVG8C5A3AaHekS6CKVDM5
 5po3YpD8nkEAcESesdv0e44=
X-Google-Smtp-Source: APiQypKSSeLnn+1D9+Rm37I3nSa2kY32h23oYFejFI8B/Y0kukdi7bfOrrrSyXN0aCuBfmB96Qghcg==
X-Received: by 2002:a17:90a:2a06:: with SMTP id
 i6mr6608794pjd.99.1585887563013; 
 Thu, 02 Apr 2020 21:19:23 -0700 (PDT)
Received: from 192-168-1-12.tpgi.com.au (220-245-129-32.tpgi.com.au.
 [220.245.129.32])
 by smtp.googlemail.com with ESMTPSA id j65sm4280612pgc.16.2020.04.02.21.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 21:19:22 -0700 (PDT)
Message-ID: <e81c7bce07ba4dad85f541f23a5f669b5610a98a.camel@gmail.com>
Subject: Re: [PATCH 1/4] powerpc/eeh: fix pseries_eeh_configure_bridge()
From: Oliver O'Halloran <oohall@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Apr 2020 15:19:17 +1100
In-Reply-To: <074529df859e2aae5ee1683e567f708b65e3558d.1585544197.git.sbobroff@linux.ibm.com>
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <074529df859e2aae5ee1683e567f708b65e3558d.1585544197.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> If a device is hot unplgged during EEH recovery, it's possible for the
> RTAS call to ibm,configure-pe in pseries_eeh_configure() to return
> parameter error (-3), however negative return values are not checked
> for and this leads to an infinite loop.
> 
> Fix this by correctly bailing out on negative values.
> 

This should probably be a standalone patch. Looks fine otherwise.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>


> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 893ba3f562c4..c4ef03bec0de 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -605,7 +605,7 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
>  				config_addr, BUID_HI(pe->phb->buid),
>  				BUID_LO(pe->phb->buid));
>  
> -		if (!ret)
> +		if (ret <= 0)
>  			return ret;
>  
>  		/*

