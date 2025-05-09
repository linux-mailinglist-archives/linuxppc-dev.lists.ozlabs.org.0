Return-Path: <linuxppc-dev+bounces-8458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1602FAB0B5B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 09:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv0bt42mtz2yqW;
	Fri,  9 May 2025 17:14:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::642"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746771073;
	cv=none; b=lmIDC6ceLJ7Je14RITrRn2ytNBfAKD1KBU73YFHuJKlraESAwYXhv38zGsRJvWC8ZiackNHhZ5XowRsy+eMN+QiY7OL0w/iQQOEjDmqdffCxm11Rs/6HmOhCl5Fsd6Hrw0Refsxw+qEj2zY2ISEX28jS9+1rl8JyAUQVnNJUKqRDn+pyQ/LEqkNzmnuDT2sSx4ok0dQh6YCaROq8Q/RsV2RcuMulhSZ8Ib8iAQnp6or01e/+Iv1ptn9lIMlShz6UuCxPLT9ZMXxgFvIQGbCAe9MgE+vrm8z3Vy2d9JY3fVK0UmZCrSTapDhhUI5fdrvIAZViDjRdcRnE5QL7FFbigA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746771073; c=relaxed/relaxed;
	bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZpFbc6lWn3ybiE5UYGXuLXXYd6KDA63WOKFgbZzf798W5dmbQfk7jzqB5EYziHAPvL3uGBizx8p1lwc5nkW8YPP5kJgQ87MC557Vhs4RudSJNTDJ36DCeLjdcCWR4cMiS0GArJXNs68V75oEfIghHZDIoKmr+1fqMB9aEAgqqm7lkLIEL69m4V5wqJIJ9pRXgQnqPJA84+6eWG3T51gQWqgGfw6ihC+tdaToGIUDeS4SnC+wYOD4crsvd3ALCawRMKtdpb2wWNtj0GL8byhEoGxp7IuLxxBYSXdqUy/w9m/knruYvEWfLB6y4a8Po6fyf014rWPixphaVEH5ZCbzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EYgKsJ6T; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EYgKsJ6T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642; helo=mail-ej1-x642.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtzCN167Kz2yQJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 16:11:10 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-ad21a5466f6so108126966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 23:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746771065; x=1747375865; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=;
        b=EYgKsJ6Tb5TaymWpxXAyuo5Yt6QY5Q4m0iR+7ByW3cDYuxLpmIekTS/todiYUU75DF
         wgs7k1rHRpUsPsZy79kRDEKso9expmvWATLJiYWY6kUgNrpdpdNq7XFb2Nvbe9On4CGx
         obN+b5itXN3KmhuuURuHghOC8ZtI5vTDeY3kaf9sVaqzs2YjHM9uygJEKacPqWG2rIFY
         WSQ1FVOgdILU9kOKTTuFBxuwWFnfO/zm99PWF0l2WzreN/O8Mrc8HhhObNTRhUyt4TIz
         HLatNXoBIKpJ1JfAArbCvVcJG+2xSHXoMmEJB6m8onludDmlxffxb0gW5v5o4NhWSTe1
         IcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746771065; x=1747375865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tT4nmiF3B+9Zf02ngFo5qPxLiB0Cnk6TGo7gdbEV7tc=;
        b=Q1AvRVjjGSuDJtC2ytO/chM0Dw/iE8HDHU1QLVxCUFHZcw0iHammfoLkWMraZbLRfY
         X7ESFRJ3pe1faaM6fK6SM6ZyVQ1DRLmlIorMP9hKM3YLGKefQw1pFljh38fG1KwqpRKs
         6WOrLLoseb2ls54xPe1mQXzvBRCKBiq4hYKC3Aq77uKLcos3N6iORr7WhvPd66MbFxun
         klGo9IJgOaLtq57FRGUDsaoe4VtDuJnsqz5iiszPAHYqD4OQJldew6eso/iwCN9Ysum6
         24xVIiwF9BbFXpoxclcKWRBvzJm49iFWrWbZaonWHArOASvN9BKBP1NTxlWffMK6ZfuF
         7w9g==
X-Forwarded-Encrypted: i=1; AJvYcCWecAfopbi4o0SIfLXWw6/dFp6nZ0DKFk8MuAB/sMhbmUXtAhoweP8G6jGiYN+liFNRBZmppBZRqj3FWu8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzTQT9K3GFRY7MxZPzotXtOX+sQl2NcCzdkR5p6f+A02ndeT1h4
	JdNO4Q6Ta0Eejewcn2+kdSj/7u7M3t6ggZ5OaEUQXMCxkYKW3VRZ
X-Gm-Gg: ASbGncuwGuNCdXyV5Oq3vFHawtR4iMR+x4uj6mbcRvG/9PHeJoptHifFuq3r+4FFtM0
	4gbHuI4GRx6KWkZD1sVa2vH94claPtpwnMf+oNVPQZSYqCzlk6+DqUSR1qwVDeXSy68QCts8vD2
	12hQqCUX23Ld4ndEuLdFh60Dj1Q62r+m9NaFYpsr/jnbAJIzkIsQ84ikyPtQBsCtq5LiPhNXXfj
	h9ASScy5OSIJExXQGwHLSd5YPfrBLTsydzgGPEPocHeqg8vihUef17AWmOswCmjsX8l0I8mHf63
	HgaL+oZRG5XIpl+5eYGdOAYa1///zV41n4VaunyNLYHL5o94+up8wbp1IDUOmK5aXhYLVwHOWGK
	le14xbNlBiD6Q81/GfEM+t9Is2FtIWzm78pkQdOEFMxILUhu87eY=
X-Google-Smtp-Source: AGHT+IHV7Lb+Jz2vAFwguRkPg3xEv8RK1gYxrdSEajyR1uZCyO5I90pymBqse+1L9ASZRUyJgq24dg==
X-Received: by 2002:a17:906:6a22:b0:ad2:cce:8d5e with SMTP id a640c23a62f3a-ad21b16d4d8mr201457766b.7.1746771065029;
        Thu, 08 May 2025 23:11:05 -0700 (PDT)
Received: from [26.26.26.1] (ec2-3-69-236-239.eu-central-1.compute.amazonaws.com. [3.69.236.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219343c81sm101663266b.58.2025.05.08.23.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 23:11:04 -0700 (PDT)
Message-ID: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
Date: Fri, 9 May 2025 14:11:00 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> A PCI device is just another peripheral in a system. So failure to
> recover it, must not result in a kernel panic. So remove the TODO which
> is quite misleading.
> 
Could you explain what the result would be if A PCI device failed to
recovery from FATAL/NON_FATAL aer error or DPC event ? what else
better choice we have as next step ? or just saying "failed" then
go ahead ?

Thanks,
Ethan
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>   drivers/pci/pcie/err.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 31090770fffcc94e15ba6e89f649c6f84bfdf0d5..de6381c690f5c21f00021cdc7bde8d93a5c7db52 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -271,7 +271,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   
>   	pci_uevent_ers(bridge, PCI_ERS_RESULT_DISCONNECT);
>   
> -	/* TODO: Should kernel panic here? */
>   	pci_info(bridge, "device recovery failed\n");
>   
>   	return status;
> 


