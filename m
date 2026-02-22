Return-Path: <linuxppc-dev+bounces-17004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id N1PFMzajmmm0egMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:33:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0516E8F1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 07:33:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJZ1Y5Hypz3bll;
	Sun, 22 Feb 2026 17:33:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:19f0:5800:8dea:5400:ff:fe25:676e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771740657;
	cv=none; b=oscXE6cDOV7I0Yg+lZWnlDie9VC0GXc0cqJFfThgKQRAcbE66Iyi6CHRowWQlPnUazEu+r8V3iv1tCnsWHFe/WTIAIPONoOUShkqoMpebmPsuzb/cZWm3uHUM+5o8MZwyF04dYGofQFRYowB/uIvfYSQ0PeHttHm2B4j8AC6CqguJpSpu6Q42DFf5RqPJh6NEu0XZw4e9Q8+5NVZQOpV0tvE2SEzmyyaYRIE2ALoW9XEGjn+XSfhZDQcHhVtrWtzgHxb2d84kaezeeL674PvbRisFkQd+o4neiwq+YAfA+iQztb0YymqtboGmLVhaGc3Jr6IP97ougDONJbJD53PJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771740657; c=relaxed/relaxed;
	bh=RRdlnthyiAYvYf+PF3zh72k237xjd6HvWMI+59FQbm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpNjeFLxQYj6tcUIifElqBOsrKtP2HFbOMsHXW0tRANPeOthNkMkiP1ExRwBw5aa2vU4nAEhDihoOE47BB30lFBVOUCkFH9MnuLKAHrzbuVswCH9Rr6L+3trwurOvx8VNa2h6PEe+EIrgG1AkUNi4llTMyQA0g5vC4cPlgtU6pmwP/ChpP1UbaO+TGP/ixm1PPbqr7za+r57pG87eTwfwHXXa9qwjPuf/JcyoGrx2qL54LtD7UrbYPcQBAcTSSw0XGlx84/M1KMuDu09HgroaDU2ZiWFLPtvJXLiAqXiAM5ZtdnTVlM47V+8jiSLX+w9vbs+wEbQre19mxdRE7e8/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au; dkim=pass (2048-bit key; unprotected) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=gFTB++kU; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=gFTB++kU; dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=f7CdgK4d; dkim-atps=neutral; spf=pass (client-ip=2001:19f0:5800:8dea:5400:ff:fe25:676e; helo=arcturus.nroach44.id.au; envelope-from=nroach44@nroach44.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=nroach44.id.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=nroach44.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=gFTB++kU;
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=gFTB++kU;
	dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=f7CdgK4d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nroach44.id.au (client-ip=2001:19f0:5800:8dea:5400:ff:fe25:676e; helo=arcturus.nroach44.id.au; envelope-from=nroach44@nroach44.id.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 569 seconds by postgrey-1.37 at boromir; Sun, 22 Feb 2026 17:10:56 AEDT
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [IPv6:2001:19f0:5800:8dea:5400:ff:fe25:676e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJYWh1yMJz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 17:10:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1771740082;
	bh=8U/bP+r/4Svx2WVB+nx4JWF9ZuYunuY2P74myov9U9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFTB++kUuK0bcLo7rCA7VcLE10Lmin5m59fPyEXyaHSiQgGdZzi7zBbgcozrSDVnr
	 4iRz9yfEXzuFPNT3jqPgfreFPlmaHH/CdrO9lVI+SxRAzHqjUG1FggWzIcDutzHiKt
	 0s8e1FsPhxO7utuWXvq3ozrKw60n8aMc65fJFKXF0oJ9B4QYTWPKovieyoOcf4BvPD
	 EXGTyvWrQ/N3psnc8PliLSkHrzNaYNJVTms3faD/2KwA/NQrqe0+NiWnx7cP0tDs9U
	 8fEh9Y8dypEx31FpkmQz7gjh812LgjHNXYEP4EANBY/CwKNiphLZe6OAZWnvKuZ7O1
	 YNfJstgHCEouA==
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPS id 5F2892E659
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Feb 2026 14:01:22 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1771740082;
	bh=8U/bP+r/4Svx2WVB+nx4JWF9ZuYunuY2P74myov9U9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gFTB++kUuK0bcLo7rCA7VcLE10Lmin5m59fPyEXyaHSiQgGdZzi7zBbgcozrSDVnr
	 4iRz9yfEXzuFPNT3jqPgfreFPlmaHH/CdrO9lVI+SxRAzHqjUG1FggWzIcDutzHiKt
	 0s8e1FsPhxO7utuWXvq3ozrKw60n8aMc65fJFKXF0oJ9B4QYTWPKovieyoOcf4BvPD
	 EXGTyvWrQ/N3psnc8PliLSkHrzNaYNJVTms3faD/2KwA/NQrqe0+NiWnx7cP0tDs9U
	 8fEh9Y8dypEx31FpkmQz7gjh812LgjHNXYEP4EANBY/CwKNiphLZe6OAZWnvKuZ7O1
	 YNfJstgHCEouA==
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
	id 43C6F30D1E; Sun, 22 Feb 2026 14:01:22 +0800 (AWST)
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_PASS,T_SPF_HELO_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nroach44.id.au;
	s=dYX2HNEqNNRL; t=1771740068;
	bh=8U/bP+r/4Svx2WVB+nx4JWF9ZuYunuY2P74myov9U9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f7CdgK4d4wk8Sj0Cp0KAfzNKCLJMCZEqVglBumfnfjMFcv0jBT/GFwUHPLd5+lMfA
	 ZCSxOdbcRY3WRaRDAGcDxoOLEziGwC4xyD/OhMCm+OJtf3bnKC0TM+igKtnFWyNclI
	 Na+1WTJSitA73Cx/cqdR7bTXJLP7k5CY+3XpZMIbzxvNOHhtZ47b0rsuS3m0T6zXBc
	 Z9zAZZpxkhGEQHl+bAhPnUHf8cZZXfGYPZZYJn1XnkHVbPo9ABKcHQhQiQMWT9f9IF
	 8Lxyc6WsaoAb7S9RYgNC6OuP/ZzpZ3OEZ5X5cEg0ycIAZAuqfYQl+M23WUkT9Xz282
	 uD4wR+AG3cpPw==
Received: from [IPV6:2403:5814:4228:10:3a62:38:7f97:4cc] (unknown [IPv6:2403:5814:4228:10:3a62:38:7f97:4cc])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by arcturus.nroach44.id.au (Postfix) with ESMTPSA id 3719E2E659;
	Sun, 22 Feb 2026 14:01:07 +0800 (AWST)
Message-ID: <dd9f072a-9db8-475f-a7a6-3cf5c5ec45bd@nroach44.id.au>
Date: Sun, 22 Feb 2026 14:01:05 +0800
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
Subject: Re: [PATCHv2 2/2] sparc/pci: Initialize msi_addr_mask for OF-created
 PCI devices
To: Han Gao <gaohan@iscas.ac.cn>, Nilay Shroff <nilay@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org, wangruikang@iscas.ac.cn, tglx@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, gjoyce@ibm.com, helgaas@kernel.org, davem@davemloft.net,
 andreas@gaisler.com, "Han Gao (Revy)" <rabenda.cn@gmail.com>
References: <20260220070239.1693303-1-nilay@linux.ibm.com>
 <20260220070239.1693303-3-nilay@linux.ibm.com>
 <47EB6E53-3E20-4E95-A329-928E5BDDFB81@iscas.ac.cn>
Content-Language: en-US
From: Nathaniel Roach <nroach44@nroach44.id.au>
In-Reply-To: <47EB6E53-3E20-4E95-A329-928E5BDDFB81@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nroach44.id.au,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[nroach44.id.au:s=dYX2HNEqNNRL];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17004-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[nroach44@nroach44.id.au,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,iscas.ac.cn,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:gaohan@iscas.ac.cn,m:nilay@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:helgaas@kernel.org,m:davem@davemloft.net,m:andreas@gaisler.com,m:rabenda.cn@gmail.com,m:rabendacn@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nroach44@nroach44.id.au,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[nroach44.id.au:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 7CC0516E8F1
X-Rspamd-Action: no action

On 22/2/26 00:36, Han Gao wrote:
> Tested and passed on SPARC Enterprise T5220.
>
> Without this patch, the e1000e would use intx.
>
> Tested-by: Han Gao <gaohan@iscas.ac.cn <mailto:gaohan@iscas.ac.cn>> # on SPARC Enterprise T5220
>
>> On Feb 20, 2026, at 15:02, Nilay Shroff <nilay@linux.ibm.com> wrote:
>>
>> Recent changes replaced the use of no_64bit_msi with msi_addr_mask,
>> which is now expected to be initialized to DMA_BIT_MASK(64) during PCI
>> device setup. On SPARC systems, this initialization was inadvertently
>> missed for devices instantiated from device tree nodes, leaving
>> msi_addr_mask unset for OF-created pci_dev instances. As a result,
>> MSI address validation fails during probe, causing affected devices
>> to fail initialization.
>>
>> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
>> of_create_pci_dev() so that MSI address validation succeeds and PCI
>> device probing works as expected.
>>
>> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address mask")
>> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
>> ---
>> arch/sparc/kernel/pci.c | 7 +++++++
>> 1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
>> index b290107170e9..a4815d544781 100644
>> --- a/arch/sparc/kernel/pci.c
>> +++ b/arch/sparc/kernel/pci.c
>> @@ -355,6 +355,13 @@ static struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
>> dev->error_state = pci_channel_io_normal;
>> dev->dma_mask = 0xffffffff;
>>
>> + /*
>> + * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
>> + * if MSI (rather than MSI-X) capability does not have
>> + * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
>> + */
>> + dev->msi_addr_mask = DMA_BIT_MASK(64);
>> +
>> if (of_node_name_eq(node, "pci")) {
>> /* a PCI-PCI bridge */
>> dev->hdr_type = PCI_HEADER_TYPE_BRIDGE;
>> -- 
>> 2.52.0
Tested-by: Nathaniel Roach <nroach44@nroach44.id.au> # SPARC T5-2

