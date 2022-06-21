Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0A1552D42
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 10:43:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LS0RQ2BDyz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 18:43:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K0/rxxRx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4sGC2Zpc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=hare@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=K0/rxxRx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=4sGC2Zpc;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LS0Qj50vxz3bXG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jun 2022 18:43:08 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3BCAA1F8DE;
	Tue, 21 Jun 2022 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1655800985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrjsV6j2GxgikRLfvlQrNeSRen6nfTOp6oxrH6LHqfA=;
	b=K0/rxxRxD+aiJWdzNoDa+0SoXPF1IC6BQYG8KRz+uLlaLWZurLtKhY6UYOEfPLCmqSRC/w
	Y1D5KwymXhBqhBR9crYjVykXd3bn4B3i3+h43/ukFTQ8zjpwPQ13XzqCAo01A3ELViJzf6
	uSLq81TeqOgtKl81+nNvuE01bTKb9wU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1655800985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrjsV6j2GxgikRLfvlQrNeSRen6nfTOp6oxrH6LHqfA=;
	b=4sGC2ZpcdwRXnQXA0/sC53dBVT8LwJN6GZh0t4vK8khlBh7SaMpQztL5XFMRTpAKtvDoDF
	+22dtf7sd6JD1TDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB47813A88;
	Tue, 21 Jun 2022 08:43:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id A00dM5iEsWLADgAAMHmgww
	(envelope-from <hare@suse.de>); Tue, 21 Jun 2022 08:43:04 +0000
Message-ID: <361336a6-f3be-c7d9-7bdb-20c30c9a72df@suse.de>
Date: Tue, 21 Jun 2022 10:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220617125750.728590-1-arnd@kernel.org>
 <20220617125750.728590-2-arnd@kernel.org>
From: Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v2 1/3] scsi: dpt_i2o: drop stale VIRT_TO_BUS dependency
In-Reply-To: <20220617125750.728590-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Miquel van Smoorenburg <mikevs@xs4all.net>, linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, "Maciej W . Rozycki" <macro@orcam.me.uk>, linux-m68k@lists.linux-m68k.org, Denis Efremov <efremov@linux.com>, Mark Salyzyn <salyzyn@android.com>, Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org, Matt Wang <wwentao@vmware.com>, linux-alpha@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Khalid Aziz <khalid@gonehiking.org>, Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/17/22 14:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The dpt_i2o driver was fixed to stop using virt_to_bus() in 2008, but
> it still has a stale reference in an error handling code path that could
> never work.
> 
> Fix it up to build without VIRT_TO_BUS and remove the Kconfig dependency.
> 
> The alternative to this would be to just remove the driver, as it is
> clearly obsolete. The i2o driver layer was removed in 2015 with commit
> 4a72a7af462d ("staging: remove i2o subsystem"), but the even older
> dpt_i2o scsi driver stayed around.
> 
> The last non-cleanup patches I could find were from Miquel van Smoorenburg
> and Mark Salyzyn back in 2008, they might know if there is any chance
> of the hardware still being used anywhere.
> 
> Fixes: 67af2b060e02 ("[SCSI] dpt_i2o: move from virt_to_bus/bus_to_virt to dma_alloc_coherent")
> Cc: Miquel van Smoorenburg <mikevs@xs4all.net>
> Cc: Mark Salyzyn <salyzyn@android.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/scsi/Kconfig   | 2 +-
>   drivers/scsi/dpt_i2o.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
> index a9fe5152addd..cf75588a2587 100644
> --- a/drivers/scsi/Kconfig
> +++ b/drivers/scsi/Kconfig
> @@ -460,7 +460,7 @@ config SCSI_MVUMI
>   
>   config SCSI_DPT_I2O
>   	tristate "Adaptec I2O RAID support "
> -	depends on SCSI && PCI && VIRT_TO_BUS
> +	depends on SCSI && PCI
>   	help
>   	  This driver supports all of Adaptec's I2O based RAID controllers as
>   	  well as the DPT SmartRaid V cards.  This is an Adaptec maintained
> diff --git a/drivers/scsi/dpt_i2o.c b/drivers/scsi/dpt_i2o.c
> index 2e9155ba7408..55dfe7011912 100644
> --- a/drivers/scsi/dpt_i2o.c
> +++ b/drivers/scsi/dpt_i2o.c
> @@ -52,11 +52,11 @@ MODULE_DESCRIPTION("Adaptec I2O RAID Driver");
>   
>   #include <linux/timer.h>
>   #include <linux/string.h>
> +#include <linux/io.h>
>   #include <linux/ioport.h>
>   #include <linux/mutex.h>
>   
>   #include <asm/processor.h>	/* for boot_cpu_data */
> -#include <asm/io.h>		/* for virt_to_bus, etc. */
>   
>   #include <scsi/scsi.h>
>   #include <scsi/scsi_cmnd.h>
> @@ -2112,7 +2112,7 @@ static irqreturn_t adpt_isr(int irq, void *dev_id)
>   		} else {
>   			/* Ick, we should *never* be here */
>   			printk(KERN_ERR "dpti: reply frame not from pool\n");
> -			reply = (u8 *)bus_to_virt(m);
> +			goto out;
>   		}
>   
>   		if (readl(reply) & MSG_FAIL) {

Reviewed-by: Hannes Reinecke <hare@suse.de>

Personally I wouldn't mind to see this driver gone, as it's being built 
upon the (long-defunct) I2O specification. We already deleted the i2o 
subsystem years ago, so maybe it's time to consign this driver to 
history, too.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke		           Kernel Storage Architect
hare@suse.de			                  +49 911 74053 688
SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 Nürnberg
HRB 36809 (AG Nürnberg), GF: Felix Imendörffer
