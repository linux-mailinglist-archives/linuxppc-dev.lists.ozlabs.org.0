Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B847426E187
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 19:00:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsjrM1HzJzDqfH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Sep 2020 03:00:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=MJLfb4lm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsjnM4FjSzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Sep 2020 02:57:27 +1000 (AEST)
Received: from localhost (52.sub-72-107-123.myvzw.com [72.107.123.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 818A72064B;
 Thu, 17 Sep 2020 16:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600361844;
 bh=nu7RsY28LVyN+IsFpaXaxIpemXjC7Q2RYaAJUnnZ2r8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=MJLfb4lmVitwKrAl4tGM9ILl8JGYXcXszpcpnzFEb6k8oJ5ax0iNsfFS8e9FxKUZ0
 C+tYyN/wTuiXpcH172VU1aywBGTfhiTyQoi/GkH/kglPqRuVr8iRxX5dmmGUpJsFdS
 AJ9Faia/pQLEdUCrc/vdPrdf69lvmoVPAZPBsylY=
Date: Thu, 17 Sep 2020 11:57:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] PCI: rpadlpar: use for_each_child_of_node() and
 for_each_node_by_name
Message-ID: <20200917165723.GA1708462@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916062128.190819-1-miaoqinglang@huawei.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 02:21:28PM +0800, Qinglang Miao wrote:
> Use for_each_child_of_node() and for_each_node_by_name macro
> instead of open coding it.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Applied to pci/hotplug for v5.10, thanks!

> ---
>  drivers/pci/hotplug/rpadlpar_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
> index f979b7098..0a3c80ba6 100644
> --- a/drivers/pci/hotplug/rpadlpar_core.c
> +++ b/drivers/pci/hotplug/rpadlpar_core.c
> @@ -40,13 +40,13 @@ static DEFINE_MUTEX(rpadlpar_mutex);
>  static struct device_node *find_vio_slot_node(char *drc_name)
>  {
>  	struct device_node *parent = of_find_node_by_name(NULL, "vdevice");
> -	struct device_node *dn = NULL;
> +	struct device_node *dn;
>  	int rc;
>  
>  	if (!parent)
>  		return NULL;
>  
> -	while ((dn = of_get_next_child(parent, dn))) {
> +	for_each_child_of_node(parent, dn) {
>  		rc = rpaphp_check_drc_props(dn, drc_name, NULL);
>  		if (rc == 0)
>  			break;
> @@ -60,10 +60,10 @@ static struct device_node *find_vio_slot_node(char *drc_name)
>  static struct device_node *find_php_slot_pci_node(char *drc_name,
>  						  char *drc_type)
>  {
> -	struct device_node *np = NULL;
> +	struct device_node *np;
>  	int rc;
>  
> -	while ((np = of_find_node_by_name(np, "pci"))) {
> +	for_each_node_by_name(np, "pci") {
>  		rc = rpaphp_check_drc_props(np, drc_name, drc_type);
>  		if (rc == 0)
>  			break;
> -- 
> 2.23.0
> 
