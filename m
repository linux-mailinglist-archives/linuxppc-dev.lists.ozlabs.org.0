Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 390F84305A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 21:44:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PHPY2b9mzDqZS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 05:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MqMi8TsA"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PHL11x42zDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 05:41:12 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id m202so12600538oig.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=35Xbx5eIJiLu1334ETcHUE8k0RsFsLJfyaYcwmmsQOE=;
 b=MqMi8TsAvOKjHHb0Ft14EKeSpcsfan3MLs4PKi8JS09THBUJxlOaSbogg1bJ88b8uI
 CqDdjbyxSJ0OXMG0UZC1eCnrX/Mem8MH/5DGQDxMHWzfdXJXcG8iBLKiCrW3+utkSkDp
 6jsLNE3D2FabHudbp5cdiomfkj6kP44JU12FRp3NrBUb+1If9YC+nwMrJuozemfwXoj3
 IcjBbrExeDy6bLjoeAwu6d5hDZr0i+6w8JPwRE1xcQqlCUH/5M59qhTxHBIJAWTYKbdt
 jOrXzHWO1eoeArRYVOKnfmm5AXsX3/4idpsnDSeEUjRWV/VuBjarAHc1J+MpTVX4gjj1
 FRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=35Xbx5eIJiLu1334ETcHUE8k0RsFsLJfyaYcwmmsQOE=;
 b=LP/TfBAxZZlSOGDwTMHzKBTfIyrr3C/qnEGKx8gJ5h2m2p3GYA5T8gKtjc7O0tk4zT
 98gdS7lch64XpdViGfGm/xpH9X6d2NT24f/XngOxW+mCD3b81AzYd8FP2Mgvr+zuEZdQ
 7B6Lwc24b+NUWZPLNd/JOUkAyfqkrZJa5AJdCvrTopWWVo8uKD+oYZbuFf40KADB/iVJ
 O3GeGFUDLus2gcipPMbVfpb5jqfqVj1IEVfAcwV7AiHUtXQdXOscEnT2GftAoIGB/5ZZ
 HVQOMnbkEJjhzIKqiyJ3+E1nG4RGdiG7vFVK+6ztwU89IqDYUT7Qb0IA4Wvg4OZ87+Za
 FjEQ==
X-Gm-Message-State: APjAAAUu6CmbucOSxiUKOoq2RwSqwl//lbM3hgbjAq0vADnZe4K/dGWk
 LQMgNA9EuD/p7Z0m+0D/sXw/eMLL
X-Google-Smtp-Source: APXvYqzScBUvO+WRNrO81ncq/61WpdaFUXNBomX2dTD+pIr8DFqrKn74TljYq1F+GoqnCLiT8iep6w==
X-Received: by 2002:aca:5346:: with SMTP id h67mr548323oib.55.1560368468775;
 Wed, 12 Jun 2019 12:41:08 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id f4sm242934oih.39.2019.06.12.12.41.07
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jun 2019 12:41:07 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <73da300c-871c-77ac-8a3a-deac226743ef@lwfinger.net>
 <20190607172902.GA8183@lst.de>
 <30000803-3772-3edf-f4a9-55122d504f3f@lwfinger.net>
 <20190610081825.GA16534@lst.de>
 <153c13f5-a829-1eab-a3c5-fecfb84127ff@lwfinger.net>
 <20190611060521.GA19512@lst.de>
 <5aaa600b-5b59-1f68-454f-20403c318f1a@lwfinger.net>
 <20190612065558.GA19585@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <d6d82c0d-4a40-a191-0414-6b9a64547f65@lwfinger.net>
Date: Wed, 12 Jun 2019 14:41:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612065558.GA19585@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/12/19 1:55 AM, Christoph Hellwig wrote:
> 
> Ooops, yes.  But I think we could just enable ZONE_DMA on 32-bit
> powerpc.  Crude enablement hack below:
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..1dd71a98b70c 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -372,7 +372,7 @@ config PPC_ADV_DEBUG_DAC_RANGE
>   
>   config ZONE_DMA
>   	bool
> -	default y if PPC_BOOK3E_64
> +	default y
>   
>   config PGTABLE_LEVELS
>   	int
> 

With the patch for Kconfig above, and the original patch setting 
ARCH_ZONE_DMA_BITS to 30, everything works.

Do you have any ideas on what should trigger the change in ARCH_ZONE_BITS? 
Should it be CONFIG_PPC32 defined, or perhaps CONFIG_G4_CPU defined?

Larry

