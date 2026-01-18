Return-Path: <linuxppc-dev+bounces-15942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB9AD39575
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jan 2026 14:51:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvFNv2b14z2yFW;
	Mon, 19 Jan 2026 00:51:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768744271;
	cv=none; b=O0XXQxOgXeiG7t1uPev6fkhpTj+SF9KpvL7waHyKvPBtgmKlyeI/baalGzc50oVWdyKOkPSYL5WDRwuO0XF1ON2z4vlyt1sKS/NwbWNQBc7QmpPh4vxw021NSbLkEM09cEkvCNjw66dD6UrqpgzWwiDtcDUIaMdRurSGvVQbLGnppRL8svi7ULeMQwuRsdU9zNIJ3ybsxhgIXtGJs1Eoh6h47YCHWhk6+vcKwV0fA2PCqJRvP2xkZrrQ7w/wxKBaWcF6fCMUFLxet2hWwlLCK6gtcW6nMWhZIK/zq6xabsQqkET4eQuN6lUVP6KSq0fdP9nXlO7p66MIFD7Wq8UVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768744271; c=relaxed/relaxed;
	bh=z1piXpiFHso3GGftRgQQooHaij0dQTWZjfWoc2FOYuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RfClmIKvgtzjI0Iq5l7TPM7cdOBumkIMOmAPVN6D+2YGQl3Lg0XDVubg6bc4slzoiiuw3pAYcPyQJfQNv0i+lO02flG8LYQlnyA0/sRKPjVGlum1yWBuv9uj5+OwY3TywUm62MfeDyAwjhf18Vcip4wgTCvKLNKtOf4N88qS190sUwrs5Adbg1mvISWgw/kDg4cqjCPqXBuYchBMfQ1CWDzTa6pYuekOGgy+OGNjkii79trQjXlZvY6+7o3QQZB/F4cQ8zBCVH4iHEHPt3RGaQs6RYAhvEnPGoL7tsRAGGMwU2pbFtgECRE1+oiCPx8woG1JXcoSRAQjKU1/e2X8qA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ijJdo7Co; dkim-atps=neutral; spf=pass (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ijJdo7Co;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.197.31.2; helo=m16.mail.163.com; envelope-from=18255117159@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 152 seconds by postgrey-1.37 at boromir; Mon, 19 Jan 2026 00:51:07 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvFNq3FhYz2xSZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 00:51:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=z1piXpiFHso3GGftRgQQooHaij0dQTWZjfWoc2FOYuc=;
	b=ijJdo7CoNK2U4hWMpXSKGmw9hLxWZPVDnqIXWbj6nNtlFY4ZtkKje7FxNdgqdM
	pP8kj3Hn8NL4N8AsTvH8471pWDoAGcl5oHPuw+UtvFEmjAnM6ksS9o8qhllCP5f5
	EHSSdue3mZLhql9+tpu9gVfqekEQusDnKscLLX41Yf5uo=
Received: from [IPV6:240e:b8f:927e:1000:e94b:3b22:e2ce:7986] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDX+GyK5GxpZrMiGQ--.49932S2;
	Sun, 18 Jan 2026 21:47:54 +0800 (CST)
Message-ID: <1d267e9e-5e32-483c-8b53-1454d4dc5e9a@163.com>
Date: Sun, 18 Jan 2026 21:47:54 +0800
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
Subject: Re: [RESEND PATCH v4 0/2] PCI: Introduce pci_clear/set_config_dword()
To: mahesh@linux.ibm.com, bhelgaas@google.com
Cc: oohall@gmail.com, mani@kernel.org, lukas@wunner.de,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251101162219.12016-1-18255117159@163.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20251101162219.12016-1-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDX+GyK5GxpZrMiGQ--.49932S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF4UJr45XryxJr1ftr1DJrb_yoW8Wry5pr
	Z3Ary3JrW7GFya9FW7GFy2ya45Wa1kJFWrJr17Kwn5Zw13Zry8ZF9agry5AF9rJrWrXw42
	grs2gFy8uw1qkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRyEE8UUUUU=
X-Originating-IP: [240e:b8f:927e:1000:e94b:3b22:e2ce:7986]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wrQdGls5IqSrAAA3Q
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Gentle ping.

Best regards,
Hans

On 2025/11/2 00:22, Hans Zhang wrote:
> This series introduces auxiliary functions for the PCI configuration space
> and simplifies the read and write operations of the AER driver, reducing a
> lot of repetitive code.
> 
> Patch 1 adds pci_clear_config_dword() and pci_set_config_dword() helpers
> to reduce repetitive read-modify-write sequences when modifying PCI config
> space. These helpers improve code readability and maintainability.
> 
> Patch 2 refactors the PCIe AER driver to use these new helpers,
> eliminating manual read-modify-write patterns and intermediate variable
> in several functions. This results in cleaner and more concise code.
> 
> ---
> Changes for v4:
> - Introduce pci_clear/set_config_dword()
> 
> Changes for v3:
> https://patchwork.kernel.org/project/linux-pci/patch/20250816161743.340684-1-18255117159@163.com/
> 
> - Rebase to v6.17-rc1.
> - The patch commit message were modified.
> - Add Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> 
> Changes for v2:
> - The patch commit message were modified.
> - New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
> ---
> 
> Hans Zhang (2):
>    PCI: Introduce pci_clear/set_config_dword()
>    PCI/AER: Use pci_clear/set_config_dword to simplify code
> 
>   drivers/pci/pcie/aer.c | 29 ++++++++++-------------------
>   include/linux/pci.h    | 12 ++++++++++++
>   2 files changed, 22 insertions(+), 19 deletions(-)
> 
> 
> base-commit: 8742b2d8935f476449ef37e263bc4da3295c7b58


