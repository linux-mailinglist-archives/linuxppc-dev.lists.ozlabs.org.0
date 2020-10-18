Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0103029157D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 06:03:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDR8N3PqdzDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 15:03:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E2UKg5nL; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDR4z2ky1zDqg6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 15:00:50 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c20so3931823pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 21:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Iw/NWcsHha9jkXHtjvanpLfn8hEmgA1RsRWy0+Uvlmk=;
 b=E2UKg5nLNq6a2+oIsv4gMrcRWMSv98oosfP341EZJpKabLIMTasWgOHDPHp0ykdTuL
 hLtAx6ixhUnRtKhMihb34lfLUOq7zMVHz//txG+bYyi/KVvzpCGpWalSb1XynYvKDheN
 ac0dWEFzDVVCvK1YRTjj4sVbPFZ/tpB2umHzBwUtqTicJTx+E2HjLSwpe0bVpcHBy6L0
 tTUbhxXna3VyyeB0VTzbhtV9c5cIR2nv4DYzP6SSqVQP0J7ZEChZrfYeRWglwLPXW+CV
 yGxR+nwT7Uwnd8LeRHKVPolnpLtIwE42Nk6RVHVvHtDoyQZMl/U0pNem+qZDXzSGlG7E
 QOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Iw/NWcsHha9jkXHtjvanpLfn8hEmgA1RsRWy0+Uvlmk=;
 b=VRsp187hOKFk+IdI3GBOIw1pgbgaYZSwuyFTRlDnGla5FOLIpXaImW0bR0kDckKwQQ
 SBrPPS129LFYo4Ei53AfXtRVnBs0diseKOZ3cHs6HEWp1jrCHQbyZHKFqqHc10ryy7Ha
 6fz5L+VhUZjQofRCELyhSqmOeb+Dtj1tLSCO6fcfYC/Qf8DLhiqf6RYOO2bqmVIj4b+H
 cz0O0FZtsYdkKWZp3bxHAHfRLkg6MvZvsbmuTgLQaVx5RkMyPX+L+/N/vQv0zQh4HVnX
 DRfPOb+PERSWd6gw/8ZLefTLby0VhWpS4ehrg/13pJBTw9eLYTb/zjqU79gzBXljMGhE
 C8Ow==
X-Gm-Message-State: AOAM533Ed9uNjJWtA+VXqcI/v1uf32pdJ2jkNl42nbOj/LR02x6ZHn58
 Ac61JZzAISP6ASrEftYxOL1sZKjpx7Q=
X-Google-Smtp-Source: ABdhPJyW4IJ7QkLUarvjIUnOytPOqksVutTj1o2hdN736A3ygbza3qJTAobj6/iqAZmzj3v1f4tstw==
X-Received: by 2002:a62:2985:0:b029:142:2501:3969 with SMTP id
 p127-20020a6229850000b029014225013969mr11209281pfp.46.1602993648549; 
 Sat, 17 Oct 2020 21:00:48 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id 8sm7203579pge.7.2020.10.17.21.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 21:00:48 -0700 (PDT)
Subject: Re: [PATCH v5 18/23] powerpc/book3s64/kuap: Use Key 3 to implement
 KUAP with hash translation.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-19-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <98db93d0-91fd-486e-237d-bfef8b74acc3@gmail.com>
Date: Sun, 18 Oct 2020 09:30:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-19-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 27/08/20 9:39 am, Aneesh Kumar K.V wrote:
> Radix use AMR Key 0 and hash translation use AMR key 3.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
