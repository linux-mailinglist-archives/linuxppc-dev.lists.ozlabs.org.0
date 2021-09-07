Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F744027BB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 13:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3jbc6xvDz2yXf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 21:24:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sZpmFKcR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sZpmFKcR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3jZz2b37z2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 21:24:11 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D782610FF;
 Tue,  7 Sep 2021 11:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631013847;
 bh=+upmPCkRhPM+Pwqhf6/lViXSAyGhcvV26ITuL5tT+Ek=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=sZpmFKcR7IaO2ztw7+k5Ozy5Lp081oRiqMMSmn69Y2I9QiOVvshOGCLPQIznSBvmW
 ipO/GVR3iq5WGhoYfEVH6B6eayBhf38jE9N9bAur8iwHP5LCYNeK17ujEOW+VC5D6x
 sEuoAgcONere0v0QMNN8iCN/tMOfud8qi+0k5Zq8dqHogLupmhi7OBGqNZxd7cL0dU
 pnJ00Gfl8Eh2Vj/STXy7YBcf8B257W5t4+jWamTtD5xaz4EFXFvzfgu44G4KFe0RF7
 71RTADvDtW9bE16DwHbb43gYE3eYhDmdQu7lGrj7xxKz1LldcOK1qUSgRKBiIakVQ4
 H4041Xt9q1AFQ==
Date: Tue, 7 Sep 2021 06:24:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xu Wang <vulab@iscas.ac.cn>
Subject: Re: [PATCH] pci/hotplug/pnv-php: Remove probable double put
Message-ID: <20210907112405.GA722145@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907085946.21694-1-vulab@iscas.ac.cn>
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org, linux-pci@vger.kernel.org,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make your subject line follow the previous convention.

Figure out if this is a "probable" or a real double put.  If it's a
real double put, we should fix it.  If it's only "probable," that
means we don't understand the problem yet.

On Tue, Sep 07, 2021 at 08:59:46AM +0000, Xu Wang wrote:
> Device node iterators put the previous value of the index variable,
> so an explicit put causes a double put.
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/pci/hotplug/pnv_php.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 04565162a449..ed4d1a2c3f22 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -158,7 +158,6 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
>  	for_each_child_of_node(parent, dn) {
>  		pnv_php_detach_device_nodes(dn);
>  
> -		of_node_put(dn);
>  		of_detach_node(dn);
>  	}
>  }
> -- 
> 2.17.1
> 
