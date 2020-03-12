Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F400218335B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 15:40:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dWhT1r25zDqgs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 01:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=YAPR5J0j; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dWdm6gWHzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 01:38:04 +1100 (AEDT)
Received: from localhost (mobile-166-175-186-165.mycingular.net
 [166.175.186.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF38C20663;
 Thu, 12 Mar 2020 14:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584023882;
 bh=0DcC20iLj0N577EVNaLkN4jq6nKFZkDXbAjkEH4vZRc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=YAPR5J0jUgfmVL6WDpJtfYJxBmKXznWHm3NbsyZSAuvkfue0yv0PscM7ujCYwKXcX
 COBhDT5Mbeo4cigwDSZ0RT8WkiH6PHpN3mob9wzhKFXTFRLoHGcmrKU/N9gFIMGL3Y
 /1bNyL2KZQrR8i+PwXBtZhw2er5y9xMTljoRZ35c=
Date: Thu, 12 Mar 2020 09:38:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chen Zhou <chenzhou10@huawei.com>
Subject: Re: [PATCH -next] PCI: rpaphp: remove set but not used variable
 'value'
Message-ID: <20200312143800.GA109542@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312140412.32373-1-chenzhou10@huawei.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: tyreld@linux.ibm.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 12, 2020 at 10:04:12PM +0800, Chen Zhou wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/pci/hotplug/rpaphp_core.c: In function is_php_type:
> drivers/pci/hotplug/rpaphp_core.c:291:16: warning:
> 	variable value set but not used [-Wunused-but-set-variable]
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>

Michael, if you want this:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

If you don't mind, edit the subject to follow the convention, e.g.,

  PCI: rpaphp: Remove unused variable 'value'

Apparently simple_strtoul() is deprecated and we're supposed to use
kstrtoul() instead.  Looks like kstrtoul() might simplify the code a
little, too, e.g.,

  if (kstrtoul(drc_type, 0, &value) == 0)
    return 1;

  return 0;

> ---
>  drivers/pci/hotplug/rpaphp_core.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index e408e40..5d871ef 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -288,11 +288,10 @@ EXPORT_SYMBOL_GPL(rpaphp_check_drc_props);
>  
>  static int is_php_type(char *drc_type)
>  {
> -	unsigned long value;
>  	char *endptr;
>  
>  	/* PCI Hotplug nodes have an integer for drc_type */
> -	value = simple_strtoul(drc_type, &endptr, 10);
> +	simple_strtoul(drc_type, &endptr, 10);
>  	if (endptr == drc_type)
>  		return 0;
>  
> -- 
> 2.7.4
> 
