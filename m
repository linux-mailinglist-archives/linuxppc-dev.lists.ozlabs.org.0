Return-Path: <linuxppc-dev+bounces-11918-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4CAB4A64C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:00:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLd8K0Rg7z3cYx;
	Tue,  9 Sep 2025 19:00:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757408448;
	cv=none; b=kZ2GK/rRWnh3/l179dQnM+KK7fJz3EOhy7D3ar0WzgxthmkfOe1jAIDde9uX3oqCg+ajwQjcLH6D/nJLUF3ojKCs6EmeOpo13q5XDBQm4eIFh/+51ubir8LdPKY6EQRJjzlgPd2mzTQPwNFOIlXq1fTw0ilR9QhBE7IyeihP0EMXwR4YWe3Y9nqxdrgnQ9+8EcYgohnuaJaafLQQU1JcBvetYveqVzd1DX60bN6a3LhigORE41/9C71SGj4zeSv0UHTWaYhJ0thlMzkK17ukdvXA/LYcZL7JNpYZTM/2QtTmIt7v2XodRbqqm/aRhBPvVGPWy5eiZuFbRMbz71K5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757408448; c=relaxed/relaxed;
	bh=33quVQF3sN+IR8V6qTQcV6kWPYXOzy0RKLKkFmGZ3Tc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WwwfapDqGKjg41N1ku6ypjmeCC3Jdv60gaaBwvSkYp9A2mjH3GC4rAk2v5WHF6Ljs7TOeIjQHV46l/bcB+lU5CEXasfbKxiiYUHoCCQhHYlyTXDGOV7sqzIuH6N3aulz33x52TC6GBv7iS2z23XFQ+jH/WzB+hqF7UvPZZqmHAhLqtxr0jNcEZtBNZaNVhzg4SS+NWXB3biqynNR3s8BehU4BVkQxZE+5EsrqOP1cRlWGusorLXNR6MnDglA8JRbFMquNFIS8b2Bq2Vlisy5HnOo3fzb+IvtH4nmjz1KyPIk8POjBYCh7QjU0GZy4J7pUsn5PuxOOnYlHE1vVkuQRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgONOUF3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sgONOUF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLd8J1KDcz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:00:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 03B00601CF;
	Tue,  9 Sep 2025 09:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5791C4CEF4;
	Tue,  9 Sep 2025 09:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757408445;
	bh=ALlxNsIscQgE1MW2G44pZiPc1j/HZOfg72IZlSKTjxw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sgONOUF34dJjeqWsm4AfHIk6nkiav045F+95MzjnJYOdbsmWh/JUkg+PX5R5OhQ4w
	 Yx/fRZ+F62fNFlTq7FlRNFCS50S4LX398TReDiwU4jLbVMMJQfhZVjaFn/xFyxV+zr
	 VTfn4orFqfWZdqxdWQy8cnOTstKKheFpSlkGww9K724pZEJfx1oLo0VRi4WfbGbm0k
	 +4H3AcQvYjE6i/dXgYiIsugtHS/CJ4VWXW9PydWGwEPZW4ISNBJusvj4srmPppo6c9
	 3YkNsO3en2OoUtoMP/6Lrgi+WmYoUhD7hcxb2bUEcIn4ukqrchcxyQ8UThneoUO8AN
	 o6jYBdNdmcr+w==
Message-ID: <bf390f9e-e06f-4743-a9dc-e0b995c2bab2@kernel.org>
Date: Tue, 9 Sep 2025 11:00:41 +0200
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
Subject: Re: [PATCH v3 1/6] PCI: pnv_php: Properly clean up allocated IRQs on
 unplug
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 christophe leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <1268570622.1359844.1752615109932.JavaMail.zimbra@raptorengineeringinc.com>
 <2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <2013845045.1359852.1752615367790.JavaMail.zimbra@raptorengineeringinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15. 07. 25, 23:36, Timothy Pearson wrote:
> In cases where the root of a nested PCIe bridge configuration is
> unplugged, the pnv_php driver would leak the allocated IRQ resources for
> the child bridges' hotplug event notifications, resulting in a panic.
> Fix this by walking all child buses and deallocating all it's IRQ
> resources before calling pci_hp_remove_devices.
> 
> Also modify the lifetime of the workqueue at struct pnv_php_slot::wq so
> that it is only destroyed in pnv_php_free_slot, instead of
> pnv_php_disable_irq. This is required since pnv_php_disable_irq will now
> be called by workers triggered by hot unplug interrupts, so the
> workqueue needs to stay allocated.
> 
> The abridged kernel panic that occurs without this patch is as follows:
> 
>    WARNING: CPU: 0 PID: 687 at kernel/irq/msi.c:292 msi_device_data_release+0x6c/0x9c
>    CPU: 0 UID: 0 PID: 687 Comm: bash Not tainted 6.14.0-rc5+ #2
>    Call Trace:
>     msi_device_data_release+0x34/0x9c (unreliable)
>     release_nodes+0x64/0x13c
>     devres_release_all+0xc0/0x140
>     device_del+0x2d4/0x46c
>     pci_destroy_dev+0x5c/0x194
>     pci_hp_remove_devices+0x90/0x128
>     pci_hp_remove_devices+0x44/0x128
>     pnv_php_disable_slot+0x54/0xd4
>     power_write_file+0xf8/0x18c
>     pci_slot_attr_store+0x40/0x5c
>     sysfs_kf_write+0x64/0x78
>     kernfs_fop_write_iter+0x1b0/0x290
>     vfs_write+0x3bc/0x50c
>     ksys_write+0x84/0x140
>     system_call_exception+0x124/0x230
>     system_call_vectored_common+0x15c/0x2ec
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
> ---
>   drivers/pci/hotplug/pnv_php.c | 94 ++++++++++++++++++++++++++++-------
>   1 file changed, 75 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 573a41869c15..aec0a6d594ac 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
...
> @@ -647,6 +702,15 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)

This is preceded by:
         php_slot = kzalloc(sizeof(*php_slot), GFP_KERNEL);

Ie. php_slot is zeroed.

>   		return NULL;
>   	}
>   
> +	/* Allocate workqueue for this slot's interrupt handling */
> +	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
> +	if (!php_slot->wq) {
> +		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");

I believe this introduced a (unlikely) NULL ptr dereference.

> +		kfree(php_slot->name);
> +		kfree(php_slot);
> +		return NULL;
> +	}
> +
>   	if (dn->child && PCI_DN(dn->child))
>   		php_slot->slot_no = PCI_SLOT(PCI_DN(dn->child)->devfn);
>   	else

This continues:
         php_slot->pdev                  = bus->self;
         php_slot->bus                   = bus;


And SLOT_WARN() is defined as:
#define SLOT_WARN(sl, x...) \
         ((sl)->pdev ? pci_warn((sl)->pdev, x) : 
dev_warn(&(sl)->bus->dev, x))

The else branch is alkays taken in the 'if' above, which still 
dereferences NULLed (sl)->bus here.

> @@ -843,14 +907,6 @@ static void pnv_php_init_irq(struct pnv_php_slot *php_slot, int irq)
>   	u16 sts, ctrl;
>   	int ret;
>   
> -	/* Allocate workqueue */
> -	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
> -	if (!php_slot->wq) {
> -		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");

Here, php_slot used to have both ->pdev and ->bus assigned at this point.

> -		pnv_php_disable_irq(php_slot, true);
> -		return;
> -	}
> -

Right?

thanks,
-- 
js
suse labs


