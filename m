Return-Path: <linuxppc-dev+bounces-12938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFD6BE1EB3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 09:26:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnKJs1fP3z30Vl;
	Thu, 16 Oct 2025 18:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c206:3008:6895::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760599613;
	cv=none; b=G5WSjKaE6lY0HAKvmJLjlkmPu9guxV+ee9U/KgRH43h6D3DT+rtVvDNI1KAvEgtjea8wwjzJNih/+Bjoxgv26M1C9rJZiPR6h77tjspiVj7JrVaXO/XaMBIpVwYRPANm6/OHEDND5BBXPK9G4M7v6a4xjwe1d1qVXhZnXGHDkK2K+0PAvhN4GJqvbpGOAT6zc5sXPTxQUOxZYAY9/MNnN3U/L2VQ/aQeKIAeoObRdL3xVfkz7zI3sx5+rGF7ebYU4T7JcmI5+jvfa4iani0HiZQmsDOSDOwf+omTT4sHAit6Gq0Yvr9dQ23Bb3pRtLMirddTmlSUlSgEZ7SOJYVpug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760599613; c=relaxed/relaxed;
	bh=VEvL4j8+F+XgSISTk494FQtpJajm2qeH+8/dMLxfttE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tcp94LjZaLVfgEymBHTagKYZ818EfSwQEflvtA8kn+uhT945BGJvk25YRtFMvz0We/poMUOCBd+jXx97IdCsYwE5SxfUsMSy3UWr3qxXY9fOQdaL1lRm2dypLI8TiuGOPVfWPkdfTpWaPSz1ymO4LgO7SnQhoPaQI0VxpzN4AA2Bv2YVMRROAs2JFG74Mx1mJwpiGGKu4+Ovyn3uzLKvN13A7mQIusq8avd5zEV10KJlEaRLc64Udd7gsBXwFIfKLHiSjw1pfiVOJBYlR+ITiPFH7Vg883oWqUpoVL4yrZmgbhrq9cWPXI7gf2HHdsfltoChDrcslaNfVl+DyWCj7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 15471 seconds by postgrey-1.37 at boromir; Thu, 16 Oct 2025 18:26:51 AEDT
Received: from psionic.psi5.com (psionic.psi5.com [IPv6:2a02:c206:3008:6895::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnKJq5vWKz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 18:26:51 +1100 (AEDT)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 039FE3F019;
	Thu, 16 Oct 2025 09:26:46 +0200 (CEST)
Message-ID: <9b85a5f0-8407-43d9-993a-0f6c3cef2f5c@hogyros.de>
Date: Thu, 16 Oct 2025 16:26:42 +0900
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
Subject: Re: BAR resizing broken in 6.18 (PPC only?)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
References: <f9a8c975-f5d3-4dd2-988e-4371a1433a60@hogyros.de>
 <yn2ladybszyrxfridi3z3rx4ogfh6c42bcxq5qld64gul2xltt@6hir2oknxfmg>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <yn2ladybszyrxfridi3z3rx4ogfh6c42bcxq5qld64gul2xltt@6hir2oknxfmg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 10/16/25 3:47 PM, Manivannan Sadhasivam wrote:

> This could be due to the recently merged patch that changes the way we read
> bridge resources. We saw a similar bug report with Qcom platforms as well [1].a43ac325c7cb

> Could you please try reverting the below mentioned commit and see if that fixes
> the issue?

> a43ac325c7cb ("PCI: Set up bridge resources earlier")

No, the problem persists after reverting this.

    Simon

