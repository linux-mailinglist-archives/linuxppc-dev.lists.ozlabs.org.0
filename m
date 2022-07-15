Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4E5763EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 16:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkvZQ4nr8z3cdY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 00:56:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=MYUg6HZk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=MYUg6HZk;
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkvYn0qfMz3c20
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 00:55:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yMChqUS1P9k9RZ7lev7X/u1NHY9UHpOS0k0M7hpJ0Qw=; b=MYUg6HZk4WnUkQqe4YgjDIUM/q
	t/2trymMgvlTjfP0FiCehzgdFSAO6ZYEkhJD3xXNcWD65PIO3PISrX3nQJ5XJdmapJVn3ZmZMkSIT
	M5vk3A6QusizEJPsQw/PDLbzDJl4irHntn6X+2OEePX0v/hs1NfHFO1tXGUY03jGL2OuGPB97e1jL
	C3X0OT//Bur/WEsZUHkZXJ6ftPy4bLEnDPBXfGfLBowzSRH327Z6jADPHA6iyrQ1Q/ae6FqgR7DMN
	gGGxdMvL44G5BnZb0fY/7vmU+Tz+fjZ9JQy7wBTMm2zdwyZOI4A8UuTysK6A7f+9dlEwSYvUr78gD
	KjadXi4A==;
Received: from 201-42-109-188.dsl.telesp.net.br ([201.42.109.188] helo=[192.168.1.60])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1oCMiv-000KCj-0j; Fri, 15 Jul 2022 16:55:21 +0200
Message-ID: <17fb8d12-60f9-09d5-91fa-09d5a5a9a4fd@igalia.com>
Date: Fri, 15 Jul 2022 11:55:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg'
 for PCI domain
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Guowen Shan <gshan@redhat.com>, Tyrel Datwyler <tyreld@linux.ibm.com>
References: <20220706102148.5060-1-pali@kernel.org>
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <20220706102148.5060-1-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/07/2022 07:21, Pali Rohár wrote:
> [...] 
> Fix this issue and introduce a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG.
> When this option is disabled then powerpc kernel would assign PCI domains
> in the similar way like it is doing kernel for other architectures,
> starting from zero and also how it was done prior that commit.

I found this sentence a bit weird, "in the similar way like it is doing
kernel for other architectures", but other than that:

Reviewed-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Thanks for the improvement!
Cheers,


Guilherme


> 
> This option is by default enabled for powernv and pseries platform for which
> was that commit originally intended.
> 
> With this change upgrading kernels from LTS 4.4 version does not change PCI
> domain on smaller embedded platforms with fixed number of PCIe controllers.
> And also ensure that PCI domain zero is present as before that commit.
> 
> Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on device-tree properties")
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
> Changes in v2:
> * Enable CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG by default on powernv and pseries
> ---
>  arch/powerpc/Kconfig             | 11 +++++++++++
>  arch/powerpc/kernel/pci-common.c |  4 ++--
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index f66084bc1dfe..053a88e84049 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -386,6 +386,17 @@ config PPC_OF_PLATFORM_PCI
>  	depends on PCI
>  	depends on PPC64 # not supported on 32 bits yet
>  
> +config PPC_PCI_DOMAIN_FROM_OF_REG
> +	bool "Use OF reg property for PCI domain"
> +	depends on PCI
> +	default y if PPC_PSERIES || PPC_POWERNV
> +	help
> +	  By default PCI domain for host bridge during its registration is
> +	  chosen as the lowest unused PCI domain number.
> +
> +	  When this option is enabled then PCI domain can be determined
> +	  also from lower bits of the OF / Device Tree 'reg' property.
> +
>  config ARCH_SUPPORTS_UPROBES
>  	def_bool y
>  
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index 068410cd54a3..7f959df34833 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -74,7 +74,6 @@ void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
>  static int get_phb_number(struct device_node *dn)
>  {
>  	int ret, phb_id = -1;
> -	u32 prop_32;
>  	u64 prop;
>  
>  	/*
> @@ -83,7 +82,8 @@ static int get_phb_number(struct device_node *dn)
>  	 * reading "ibm,opal-phbid", only present in OPAL environment.
>  	 */
>  	ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
> -	if (ret) {
> +	if (ret && IS_ENABLED(CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG)) {
> +		u32 prop_32;
>  		ret = of_property_read_u32_index(dn, "reg", 1, &prop_32);
>  		prop = prop_32;
>  	}
