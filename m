Return-Path: <linuxppc-dev+bounces-16945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAkgJza6lmkLlAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 08:22:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324E15CA02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 08:22:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGlFZ2322z30GV;
	Thu, 19 Feb 2026 18:22:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771485746;
	cv=none; b=hDibVHrHijrEs/HRwnWMQCzMy0g58lObxsk69+vj8LYqSktFxadMl8lPTXGHeDqrgq1GH2opmzZ8nir2o+ao8DdWL/MQf6Ii/6civx49TGr0KGN+WwqbDuDn8ZYg85hxMlUQhYunseg5ZHnHIQwWMp7wRl+db/3uBfkemeUtaP2LdswVTkEz2xLfrazuuLfQNoSVETaA1wxUPqn7BzWiJfUTctmrcw3Sc9D9OqoWtOisOLxhBtzyGpPD/bQyxvJpq1HvbyyKwygYx0e7p6gQ7lKapkAzzf0MVoincGTuQp50YCZtJk+DGXOzk0syMLV64UMSi7dCaSo+bjIF837bJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771485746; c=relaxed/relaxed;
	bh=86jfWNKp4WUpruTj7f4GjO3NVA1FG0qGwfFhVrz8U8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Me/KNkSVm4bskDt8LZEo/g8T+58DWtXf0dCA/2KKrY0mhGK2msLmMRIoKPT5Am78vCUlfnbDZWlEaVVXG78NdlaR5eeZONJtJHf3cBcvBrYagIlc8/WQbpp5FqUVMbmtjjyqw1PCFjBJdUQJWnFKtquTk64rBIt0x0BBnmslE2ogMJ8ppY7LHrS1IpVSHLq2FTQsy4Jg9YHSk4fq8iBqaxd0FE6jF3HU6vDRqzZH+9uBG4vD2c+JhVwsZiB5Or5O3FlmURfuk5Jpw9NCnCmTfnxvj2qcncwaVqX2V7vkmZJNzIUeEWKldB8rdCbr+radeQNKIFScSnGq7WcNSy8O5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGlFX6bbpz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 18:22:23 +1100 (AEDT)
Received: from [192.168.0.107] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowACXPWkhupZpoFpACA--.15858S2;
	Thu, 19 Feb 2026 15:22:10 +0800 (CST)
Message-ID: <6f02c046-1ff6-4086-8fd0-a276eabece10@iscas.ac.cn>
Date: Thu, 19 Feb 2026 15:22:09 +0800
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
Subject: Re: [PATCH] powerpc/pci: Initialize msi_addr_mask for OF-created PCI
 devices
To: Nilay Shroff <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org
Cc: tglx@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, chleroy@kernel.org, gjoyce@ibm.com
References: <20260217174537.1154686-1-nilay@linux.ibm.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20260217174537.1154686-1-nilay@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXPWkhupZpoFpACA--.15858S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4DCF4xWryUWFy5ZrW3trb_yoW8uFykp3
	97W3Z8trW8t34xCF47Cw18ZF1Ygws3Z347Jw45t397C3WS9rnFyr1fJ34UAa47Xr4vkw10
	vw4j9w1vqFyDCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUqiFxDUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16945-lists,linuxppc-dev=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_COUNT_THREE(0.00)[3];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:nilay@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2324E15CA02
X-Rspamd-Action: no action

On 2/18/26 01:45, Nilay Shroff wrote:

> Recent changes [1] replaced the use of no_64bit_msi with msi_addr_mask.
> As a result, msi_addr_mask is now expected to be initialized to
> DMA_BIT_MASK(64) when a pci_dev is set up. However, this initialization
> was missed on powerpc due to differences in the device initialization
> path compared to other architectures. Due to this, now pci device probe
> method fails on powerpc system.
>
> On powerpc systems, struct pci_dev instances are created from device
> tree nodes via of_create_pci_dev(). Because msi_addr_mask was not
> initialized there, it remained zero. Later, during MSI setup,
> msi_verify_entries() validates the programmed MSI address against
> pdev->msi_addr_mask. Since the mask was not set correctly, the
> validation fails, causing PCI driver probe failures for devices on
> powerpc systems.

Thanks for catching this. I had naively assumed that pci_setup_device()
was the right place for adding this initialization, and didn't think of
other possibilities.

I grep'd for pci_alloc_dev() and found these uses:

  * of_create_pci_dev() in arch/powerpc/kernel/pci_of_scan.c (this patch)
  * of_create_pci_dev() in arch/sparc/kernel/pci.c (*same missed init*)
  * drivers/char/agp/{alpha,parisc}-agp.c (fake pci_dev, should be fine)
  * drivers/scsi/megaraid.c (copying from existing pci_dev, should be fine)

So, while we're at it, can we fix the SPARC one as well in v2? The code
seems similar to what we do for powerpc.

> Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
> of_create_pci_dev() so that MSI address validation succeeds and device
> probe works as expected.
>
> [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/

Nit: Link seems redundant given the Fixes tag below.

Thanks again,
Vivian "dramforever" Wang

> Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address mask")
> Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
> ---
>  arch/powerpc/kernel/pci_of_scan.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> [...]


