Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E17D731F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 12:25:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ss4m6RzzzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 21:25:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ss2j322TzDqwB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 21:23:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="K4LhDW80"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46ss2j1Vgdz9sPJ; Tue, 15 Oct 2019 21:23:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46ss2f4wgZz9sP7;
 Tue, 15 Oct 2019 21:23:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571135005;
 bh=QDJF4xxVTIRvTYf+gOcubZ00WJm0i6g3A1Svt7cre38=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=K4LhDW80OVyaL3MN6pBE+6p+c+I+gygMW0OIttzIFCaEEqNVPTdC2Xy1S+Ah3t5wM
 cuuapGFB5T+ItFF38gaATt7HAJUSbJ1gq+u8xa104hgVgFPrJjz2x7lH/7Ch6AzKuP
 oEefqD48kMy00C06GMTiZU8LG84/u5V+9nPztjHDrRDX2sQv4xihUJemuko+Vpq/Z3
 bFOJFPo8pOx2hZZwTOEJiGf1irYQysTSA9AWJYvNLOodxSpq9U9jYpq3YKJVkpU+yP
 /iDvRqRyvLbeBrAzAdbaRd9s9sPhjpbq9NJD1ch4ZKujPsd34AseMSjx4XEoXsu+f1
 HMzSkpQgjovXw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v7 3/8] powerpc: detect the trusted boot state of the
 system
In-Reply-To: <1570497267-13672-4-git-send-email-nayna@linux.ibm.com>
References: <1570497267-13672-1-git-send-email-nayna@linux.ibm.com>
 <1570497267-13672-4-git-send-email-nayna@linux.ibm.com>
Date: Tue, 15 Oct 2019 21:23:19 +1100
Message-ID: <877e56ux2g.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:
> PowerNV systems enables the IMA measurement rules only if the
> trusted boot is enabled on the system.

That confused me a lot. But the key is the distinction between appraisal
rules vs measurement rules, right?

I think it would be clearer if it was phrased as a positive statement, eg:

  On PowerNV systems when trusted boot is enabled, additional IMA rules
  are enabled to implement measurement.

Or something like that.

> This patch adds the function to detect if the system has trusted
> boot enabled.

It would probably help people to briefly explain the difference between
secure vs trusted boot.

> diff --git a/arch/powerpc/include/asm/secure_boot.h b/arch/powerpc/include/asm/secure_boot.h
> index 23d2ef2f1f7b..ecd08515e301 100644
> --- a/arch/powerpc/include/asm/secure_boot.h
> +++ b/arch/powerpc/include/asm/secure_boot.h
> @@ -12,6 +12,7 @@
>  
>  bool is_powerpc_os_secureboot_enabled(void);
>  struct device_node *get_powerpc_os_sb_node(void);
> +bool is_powerpc_trustedboot_enabled(void);
>  
>  #else
>  
> @@ -25,5 +26,10 @@ static inline struct device_node *get_powerpc_os_sb_node(void)
>  	return NULL;
>  }
>  
> +static inline bool is_powerpc_os_trustedboot_enabled(void)

That has an extra "_os" in it.

> +{
> +	return false;
> +}
> +
>  #endif
>  #endif
> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> index 0488dbcab6b9..9d5ac1b39e46 100644
> --- a/arch/powerpc/kernel/secure_boot.c
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -7,6 +7,27 @@
>  #include <linux/of.h>
>  #include <asm/secure_boot.h>
>  
> +static const char * const fwsecureboot_compat[] = {
> +	"ibm,secureboot-v1",
> +	"ibm,secureboot-v2",
> +	NULL,
> +};
> +
> +static struct device_node *get_powerpc_fw_sb_node(void)
> +{
> +	struct device_node *node;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(fwsecureboot_compat); ++i) {
> +		node = of_find_compatible_node(NULL, NULL,
> +					       fwsecureboot_compat[i]);
> +		if (node)
> +			return node;
> +	}
> +
> +	return NULL;
> +}

You shouldn't need to do that by hand, instead use
of_find_matching_node(), eg:

static struct device_node *get_powerpc_fw_sb_node(void)
{
	static const struct of_device_id ids[] = {
		{ .compatible = "ibm,secureboot-v1", },
		{ .compatible = "ibm,secureboot-v2", },
		{},
	};

	return of_find_matching_node(NULL, ids);
}


> @@ -40,3 +61,17 @@ bool is_powerpc_os_secureboot_enabled(void)
>  	pr_info("secureboot mode disabled\n");
>  	return false;
>  }
> +
> +bool is_powerpc_trustedboot_enabled(void)
> +{
> +	struct device_node *node;
> +
> +	node = get_powerpc_fw_sb_node();
> +	if (node && (of_find_property(node, "trusted-enabled", NULL))) {

Again this can use of_property_read_bool(), which copes with a NULL node
also, so just:

+	if (of_property_read_bool(node, "trusted-enabled"))) {

> +		pr_info("trustedboot mode enabled\n");
> +		return true;
> +	}
> +
> +	pr_info("trustedboot mode disabled\n");
> +	return false;
> +}
> -- 
> 2.20.1


cheers
