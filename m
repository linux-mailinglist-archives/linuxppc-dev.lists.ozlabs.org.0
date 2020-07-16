Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E22221DFD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 10:15:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6nB04l3wzDqx0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 18:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6n873H4JzDqRb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 18:13:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6n8720xrz8tCg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 18:13:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6n871b7jz9sRW; Thu, 16 Jul 2020 18:13:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6n8665Dgz9sSt
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 18:13:42 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E1DE5B781;
 Thu, 16 Jul 2020 08:13:42 +0000 (UTC)
Date: Thu, 16 Jul 2020 10:13:38 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/pseries: detect secure and trusted boot state
 of the system.
Message-ID: <20200716081337.GB32107@kitsune.suse.cz>
References: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594813921-12425-1-git-send-email-nayna@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 07:52:01AM -0400, Nayna Jain wrote:
> The device-tree property to check secure and trusted boot state is
> different for guests(pseries) compared to baremetal(powernv).
> 
> This patch updates the existing is_ppc_secureboot_enabled() and
> is_ppc_trustedboot_enabled() functions to add support for pseries.
> 
> The secureboot and trustedboot state are exposed via device-tree property:
> /proc/device-tree/ibm,secure-boot and /proc/device-tree/ibm,trusted-boot
> 
> The values of ibm,secure-boot under pseries are interpreted as:
                                      ^^^
> 
> 0 - Disabled
> 1 - Enabled in Log-only mode. This patch interprets this value as
> disabled, since audit mode is currently not supported for Linux.
> 2 - Enabled and enforced.
> 3-9 - Enabled and enforcing; requirements are at the discretion of the
> operating system.
> 
> The values of ibm,trusted-boot under pseries are interpreted as:
                                       ^^^
These two should be different I suppose?

Thanks

Michal
> 0 - Disabled
> 1 - Enabled
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Reviewed-by: Daniel Axtens <dja@axtens.net>
> ---
> v3:
> * fixed double check. Thanks Daniel for noticing it.
> * updated patch description.
> 
> v2:
> * included Michael Ellerman's feedback.
> * added Daniel Axtens's Reviewed-by.
> 
>  arch/powerpc/kernel/secure_boot.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> index 4b982324d368..118bcb5f79c4 100644
> --- a/arch/powerpc/kernel/secure_boot.c
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -6,6 +6,7 @@
>  #include <linux/types.h>
>  #include <linux/of.h>
>  #include <asm/secure_boot.h>
> +#include <asm/machdep.h>
>  
>  static struct device_node *get_ppc_fw_sb_node(void)
>  {
> @@ -23,12 +24,19 @@ bool is_ppc_secureboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	u32 secureboot;
>  
>  	node = get_ppc_fw_sb_node();
>  	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
> -
>  	of_node_put(node);
>  
> +	if (enabled)
> +		goto out;
> +
> +	if (!of_property_read_u32(of_root, "ibm,secure-boot", &secureboot))
> +		enabled = (secureboot > 1);
> +
> +out:
>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>  
>  	return enabled;
> @@ -38,12 +46,19 @@ bool is_ppc_trustedboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	u32 trustedboot;
>  
>  	node = get_ppc_fw_sb_node();
>  	enabled = of_property_read_bool(node, "trusted-enabled");
> -
>  	of_node_put(node);
>  
> +	if (enabled)
> +		goto out;
> +
> +	if (!of_property_read_u32(of_root, "ibm,trusted-boot", &trustedboot))
> +		enabled = (trustedboot > 0);
> +
> +out:
>  	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
>  
>  	return enabled;
> -- 
> 2.26.2
> 
