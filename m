Return-Path: <linuxppc-dev+bounces-10652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C9B1B654
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:25:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG0z30TCz3bkb;
	Wed,  6 Aug 2025 00:25:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754403923;
	cv=none; b=M9rz9z+Y18Yk5VoOj+8hvgubfKmE5Nip8Zs/DPadevR3Pa4qBYaJ8r1PHGfU9eROAT7fI+NbAyNVNGfyP6lHv1vLfTZI0uUHYsX3HVqY40/YJQB/6DHGH5B7+v2caSSWuVmDwnA1h2kYk+qZagdA9xQbcTAbjRB+umJdw70ALdUciVj5FbVT5xYGG3KP+jOuTbw8veBOPQDLQZPFde5grOrvc39zhC2o2ROqGnzOmnH+pnUIeI91ZqR9vaC4wRgDLtVGukdyItb0hYeERuVn/u0PELh5+sly+LCd3k2AI7CqBQ9hWserv0xYcGIJNoz0bqH9codg1JbDZK2mcUnfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754403923; c=relaxed/relaxed;
	bh=JwL5zRYEtiklaHm3SpHhcTGST02UpRtHf+IbVq5I8rg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+8MD5s7W3MAWgRA2RMZSPei3lG2ueBD5lTbNpTrIVJUwSr4MSj9b2wN1D7Qb7AEsmGfNgexpIpI+G2icvSqp+1QJcLcHWFtT9hJEBpDF4yobf2QNIAs84ipBxJLRcpuob2qWzPatVh9pz86tG05w4Qd/Om/oV7F3v1HQ+iUUtKIaQt0eSAze0H/fGRlbv7tnniB2lp2zzbSSMNklKwCjp7wF0zNgCub154Nb2SzaL2PCrw4D6W9RGdWVei/6R47vQtQ1F3FdLStf5EzHquQVLQGuK8Zrp/nP1c9ledX2zd71U1PEgxkKbXE7XW3mNm7VPXsjlqJU1//Fi5+blxy5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mc95ANzK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mc95ANzK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=etzhao1900@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG0x567gz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:25:21 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-61557997574so8502515a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403916; x=1755008716; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JwL5zRYEtiklaHm3SpHhcTGST02UpRtHf+IbVq5I8rg=;
        b=mc95ANzKKoD6zBIwws1g6FI4/zLQZY7MkkO0rPWNzHB1frF9/zlWXBkyar7c/8n4/Q
         GUT1g0/KX1tMMeb6KuBbCZBJ84tayLZRRZ++Od5/jRN+tO7k1bw9XEohc6SNDpTXGPGE
         SkOxNplHQWjUmgVlv1NtSDm/VnY5/bw2mxNgtfdG2DSoRDeLpchqlw3b69jE75rkh+dU
         qoOu/qXrfNM75Q0oV9LTr6f1uqrWMCIhYrfXlIu3Z+PjfdU1Cj8Zg47DmRVZobGNm6BE
         wpEk4H8GsEebcKw2qricb2bzp+9XRjQJwz0EwVRTjWmOMUmI3DdbEgK5Uw1mcxr6Gbxy
         jorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403916; x=1755008716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JwL5zRYEtiklaHm3SpHhcTGST02UpRtHf+IbVq5I8rg=;
        b=GaphCnOIDx4qh2tQhfHei5IaizsBqd+/Uc3yh1u6AKpUmY3GW+CZT0YchhuejaAnSO
         IJwRU2mX4Slh8spROGGU7pICkVlMsrbBhvdhc6uWU3gYBbTMEhyutG1NSTAuK+0gwNe3
         /NvJm+dEDfFFFn9zVmJcXALnJvc6JEHtI4LjvG3w5Rt2lIg4ZSE3k24DLbM31SudjWEG
         /xpS8uTyRR+9AAMNFf8ap0QE751uzqtROrZWt92iAVWxQnJQEiTpIXbuMrfyd667sqZr
         5vN3iADiUB7DfM29jFTyxqem1RXehgBLusB5ONUROL1szT3S9fVckvzPbll5i5P8HkBW
         /mEQ==
X-Gm-Message-State: AOJu0Ywwl/JOoCSJplyJCdgQoBklPBT2nkwXdAbzSSQQ/GdD/7WXqjbh
	KCR3/lt4e3wwN56VJ+rL3B3xA9UHpF3M17umtFpdoVlBBj2U9jblgJ28
X-Gm-Gg: ASbGncvA1HfSDUDy6j7i3v+qhHaeBXekXKWj+hSlMRjVXwpq/2vOH2npKZ2CSnt9Kyq
	XySUuK87vB6Xv6OsCxBQNcrS9Bh2IJ2PPcfFm25rJjiMMIGZwK0nM4WuUdYjnxrWIELhyYIX18P
	Oysi2yaM3c5CXhpVhcFVfbZITzrHhdLsW5gmATdQu1tkLA6o8oSVFcjVFyysLYOp9/TTaY2qA9O
	0YeKbHwfg888cITgvqovynU47Or1w5dKp59Pd58MdwI4zkAPEFWKDQia6qRip0WSgXcdXJ4uvMz
	OnLv1th3sTd8pESZbO6M1HJziXL1HrMZSXhIfzqlFMYuEpOKAD53iDcTysiv2nhwkCN4qsXJXKG
	UncpzR2dKPAWKaG+ti51rIpne47RO2jzpPLQbGmQ2/K++1rjeVD3qZ3qHj9816h16Ed3xmngOpG
	B23NNlYOCICTaYCz14MqoUPimko5RrlQ==
X-Google-Smtp-Source: AGHT+IFMnbOmPOkh2KoJ9SKdrdwTiw7fxvxwn6Wm4g2NsRxJY1JwJTk04j1ewMhEnfw6wd2bNsxyuw==
X-Received: by 2002:a05:6402:1ecb:b0:615:c5a9:4caf with SMTP id 4fb4d7f45d1cf-615e6eb68f1mr12187369a12.7.1754403915795;
        Tue, 05 Aug 2025 07:25:15 -0700 (PDT)
Received: from [26.26.26.1] (ec2-52-29-20-83.eu-central-1.compute.amazonaws.com. [52.29.20.83])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f000c3sm8599838a12.4.2025.08.05.07.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 07:25:15 -0700 (PDT)
Message-ID: <1e332191-e1b0-49e9-afa9-09e76779f72f@gmail.com>
Date: Tue, 5 Aug 2025 22:25:11 +0800
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
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
To: Breno Leitao <leitao@debian.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Jon Pan-Doh <pandoh@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Language: en-US
From: Ethan Zhao <etzhao1900@gmail.com>
In-Reply-To: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/4/2025 5:17 PM, Breno Leitao wrote:
> Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> does not rate limit, given this is fatal.
> 
> This prevents a kernel crash triggered by dereferencing a NULL pointer
> in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> which already performs this NULL check.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Fixes: a57f2bfb4a5863 ("PCI/AER: Ratelimit correctable and non-fatal error logging")
> ---
>   drivers/pci/pcie/aer.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 70ac661883672..b5f96fde4dcda 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -786,6 +786,9 @@ static void pci_rootport_aer_stats_incr(struct pci_dev *pdev,
>   
>   static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
>   {
> +	if (!dev->aer_info)
> +		return 1;
> +
>   	switch (severity) {
>   	case AER_NONFATAL:
>   		return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
> 
> ---
Seems you are using arm64 platform default config item
arch/arm64/configs/defconfig:CONFIG_ACPI_APEI_PCIEAER=y
So the issue wouldn't be triggered on X86_64 with default config.


Thanks,
Ethan

> base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
> change-id: 20250801-aer_crash_2-b21cc2ef0d00
> 
> Best regards,
> --
> Breno Leitao <leitao@debian.org>
> 
> 


