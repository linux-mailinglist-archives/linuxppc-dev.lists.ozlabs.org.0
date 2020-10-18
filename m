Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A457291577
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 05:55:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDQyf3mm8zDqld
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Oct 2020 14:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=sandipan.osd@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KDbzkHwd; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDQvC2wl0zDqld
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Oct 2020 14:52:23 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t22so330171plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 20:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w+NSgk/GXzmLvy2qBVKjNSOVL2tccmUHotixmejcdhU=;
 b=KDbzkHwdV2+A7igYCwXDICtbagsI40nVHzFs5rHSRXq3nzmozgYPjFJc9V7amS9lUA
 xl6yQx67R+7HIsKpkfqbaaohKvjcnrQJskC31M1MZhhSVXnSPLQFZANJWs5X//wK2ETj
 AyJET+8fkTYHh21kMdqfCVB/D8vUlQU+4NYf3wrfXkKM+EQCqwfzMcjCmtvX+80eS2oa
 ub6RIoR+dWArEDkCil6cKDYodjk/Jt2IlUPS9Y8FoQF25wYayrsBhzkPXOiMLnuM+dDM
 xsdV36iAGEJQh6r1q6yARFhaIhZWf0YsY3N/pWvxMLoMOAm/Bdn38LOtKhJ/SHxfF8s+
 pzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w+NSgk/GXzmLvy2qBVKjNSOVL2tccmUHotixmejcdhU=;
 b=o7KMJS++mJZbCTJWl6L1YQ9XY8rZo71NVuRSiEXMr2YgKXldhT0pVb2g3zEhk4Tsr0
 RBk+uhUjePOMcjh4acsfFBQBgDf+dVFdHXAwc3Jy/9adPtttDTBhuHAsISzfdf02slrn
 sgsQzjYr+g6l84sta3LphHNSdPLA0VS60P7AnxEGVLrRK6JbFI/WAffSJaBXV8jqSYj1
 johSevlpq4ckeysl1QK/73WTvGzYnYRm3mnGo/JTnQvj1WXz5z8ZLbSB2xUavePO9R0G
 nryuPnlawF494rjYIPpN+Pr7LE28xvjFMPLZ6PBaSLHZovXn5uKBAfHDHtCuHv98Sk+p
 nxxQ==
X-Gm-Message-State: AOAM532D+PRbEqQA1crbTNKLNQKdTOu0uNqFpPflm0U1ISs0Azd/Os3p
 ROqPqWIgzsw6sy10agsY76s=
X-Google-Smtp-Source: ABdhPJyEB6pGztIToucV3bMxFQskUNCLQ7LIssd9IP/KCZZQc8uWegHcpmxk788+zzltATFGcsU9Lw==
X-Received: by 2002:a17:90a:4488:: with SMTP id
 t8mr11189778pjg.43.1602993139891; 
 Sat, 17 Oct 2020 20:52:19 -0700 (PDT)
Received: from [192.168.0.102] ([49.207.205.150])
 by smtp.gmail.com with ESMTPSA id z26sm8326898pfq.131.2020.10.17.20.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Oct 2020 20:52:19 -0700 (PDT)
Subject: Re: [PATCH v5 15/23] powerpc/book3s64/pkeys: Don't update SPRN_AMR
 when in kernel mode.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
 <20200827040931.297759-16-aneesh.kumar@linux.ibm.com>
From: Sandipan Das <sandipan.osd@gmail.com>
Message-ID: <4772d1ce-97e5-2f9b-6b7e-da93cd40b626@gmail.com>
Date: Sun, 18 Oct 2020 09:22:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200827040931.297759-16-aneesh.kumar@linux.ibm.com>
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
> Now that kernel correctly store/restore userspace AMR/IAMR values, avoid
> manipulating AMR and IAMR from the kernel on behalf of userspace.
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h | 18 ++++++++
>  arch/powerpc/include/asm/processor.h     |  4 --
>  arch/powerpc/kernel/process.c            |  4 --
>  arch/powerpc/kernel/traps.c              |  6 ---
>  arch/powerpc/mm/book3s64/pkeys.c         | 57 +++++-------------------
>  5 files changed, 28 insertions(+), 61 deletions(-)
> 

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
