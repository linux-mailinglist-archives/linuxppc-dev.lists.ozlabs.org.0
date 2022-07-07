Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153C8569E8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 11:28:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdrgP0R33z3c1y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 19:28:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ldrg00xvNz30Mr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 19:27:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ldrfv1brxz9tCW;
	Thu,  7 Jul 2022 11:27:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xv3_kLgNajC2; Thu,  7 Jul 2022 11:27:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ldrfr6KL3z9tCg;
	Thu,  7 Jul 2022 11:27:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C9E548B79F;
	Thu,  7 Jul 2022 11:27:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id krOM3Y6qgYfg; Thu,  7 Jul 2022 11:27:48 +0200 (CEST)
Received: from [192.168.233.174] (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 858168B768;
	Thu,  7 Jul 2022 11:27:48 +0200 (CEST)
Message-ID: <a0f9f7ba-12fa-1515-ab4d-d3066a619277@csgroup.eu>
Date: Thu, 7 Jul 2022 11:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc/powernv: Map OPAL msglog in IOREMAP area
Content-Language: fr-FR
To: Gavin Shan <gwshan@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <1489645033-15831-1-git-send-email-gwshan@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1489645033-15831-1-git-send-email-gwshan@linux.vnet.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

Le 16/03/2017 à 07:17, Gavin Shan a écrit :
> With OPAL msglog driver, there are two interfaces to retrieve the
> firmware (skiboot) logs: /sys/firmware/opal/msglog and xmon "do"
> command. The memory console header (descritpor) and output buffer
> are resident in memory blocks whose addresses are greater than
> 0x30000000. The memory blocks needn't be necessarily visible to
> kernel. For example when the memory visible to kernel is limited
> by "mem=768M" in bootargs. In this case, reading the memory console
> header (descriptor) and its output buffer directly causes kernel
> crash as the memory blocks aren't mapped in the linear area as the
> driver assumed.
> 
> This reworks the driver to map the memory console header (descitpor)
> and its output buffer as readonly in IOREMAP area as Michael Ellerman
> suggested before. Also, the memory console descriptor are readed into
> local descriptor so that we needn't care about its endian (big or little)
> afterwards, until we need update the output position when dumping the
> messages in the output buffer.
> 
> Signed-off-by: Gavin Shan <gwshan@linux.vnet.ibm.com>

This patch badly conflits when applying.

If it's still applicable, could you rebase and resubmit ?

Thanks
Christophe

> ---
>   arch/powerpc/platforms/powernv/opal-msglog.c | 81 ++++++++++++++++++----------
>   1 file changed, 54 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
> index 7a9cde0..0f2167f 100644
> --- a/arch/powerpc/platforms/powernv/opal-msglog.c
> +++ b/arch/powerpc/platforms/powernv/opal-msglog.c
> @@ -18,38 +18,46 @@
>   
>   /* OPAL in-memory console. Defined in OPAL source at core/console.c */
>   struct memcons {
> -	__be64 magic;
> +	unsigned long	magic;
>   #define MEMCONS_MAGIC	0x6630696567726173L
> -	__be64 obuf_phys;
> -	__be64 ibuf_phys;
> -	__be32 obuf_size;
> -	__be32 ibuf_size;
> -	__be32 out_pos;
> +	unsigned long	obuf_phys;
> +	unsigned long	ibuf_phys;
> +	unsigned int	obuf_size;
> +	unsigned int	ibuf_size;
> +	unsigned int	out_pos;
>   #define MEMCONS_OUT_POS_WRAP	0x80000000u
>   #define MEMCONS_OUT_POS_MASK	0x00ffffffu
> -	__be32 in_prod;
> -	__be32 in_cons;
> +	unsigned int	in_prod;
> +	unsigned int	in_cons;
>   };
>   
> -static struct memcons *opal_memcons = NULL;
> +static struct memcons opal_memcons;
> +static void __iomem *opal_memcons_virt;
> +static void __iomem *opal_memcons_obuf;
> +
> +#define OPAL_MEMCONS_GET_FIELD(field, accessor, converter, tmp)	\
> +	tmp = accessor(opal_memcons_virt +			\
> +		       offsetof(struct memcons, field));	\
> +	opal_memcons.field = converter(tmp)
>   
>   ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
>   {
> -	const char *conbuf;
> +	char *conbuf;
>   	ssize_t ret;
>   	size_t first_read = 0;
> -	uint32_t out_pos, avail;
> +	uint32_t out_pos, avail, val32;
>   
> -	if (!opal_memcons)
> +	if (!opal_memcons_obuf)
>   		return -ENODEV;
>   
> -	out_pos = be32_to_cpu(ACCESS_ONCE(opal_memcons->out_pos));
> +	OPAL_MEMCONS_GET_FIELD(out_pos, __raw_readl, be32_to_cpu, val32);
> +	out_pos = opal_memcons.out_pos;
>   
>   	/* Now we've read out_pos, put a barrier in before reading the new
>   	 * data it points to in conbuf. */
>   	smp_rmb();
>   
> -	conbuf = phys_to_virt(be64_to_cpu(opal_memcons->obuf_phys));
> +	conbuf = opal_memcons_obuf;
>   
>   	/* When the buffer has wrapped, read from the out_pos marker to the end
>   	 * of the buffer, and then read the remaining data as in the un-wrapped
> @@ -57,7 +65,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
>   	if (out_pos & MEMCONS_OUT_POS_WRAP) {
>   
>   		out_pos &= MEMCONS_OUT_POS_MASK;
> -		avail = be32_to_cpu(opal_memcons->obuf_size) - out_pos;
> +		avail = opal_memcons.obuf_size - out_pos;
>   
>   		ret = memory_read_from_buffer(to, count, &pos,
>   				conbuf + out_pos, avail);
> @@ -75,7 +83,7 @@ ssize_t opal_msglog_copy(char *to, loff_t pos, size_t count)
>   	}
>   
>   	/* Sanity check. The firmware should not do this to us. */
> -	if (out_pos > be32_to_cpu(opal_memcons->obuf_size)) {
> +	if (out_pos > opal_memcons.obuf_size) {
>   		pr_err("OPAL: memory console corruption. Aborting read.\n");
>   		return -EINVAL;
>   	}
> @@ -104,35 +112,54 @@ static struct bin_attribute opal_msglog_attr = {
>   
>   void __init opal_msglog_init(void)
>   {
> -	u64 mcaddr;
> -	struct memcons *mc;
> +	u64 val64;
> +	u32 val32;
>   
> -	if (of_property_read_u64(opal_node, "ibm,opal-memcons", &mcaddr)) {
> +	if (of_property_read_u64(opal_node, "ibm,opal-memcons", &val64)) {
>   		pr_warn("OPAL: Property ibm,opal-memcons not found, no message log\n");
>   		return;
>   	}
>   
> -	mc = phys_to_virt(mcaddr);
> -	if (!mc) {
> +	opal_memcons_virt = ioremap_prot(val64, sizeof(opal_memcons),
> +					 (_PAGE_BASE | _PAGE_KERNEL_RO));
> +	if (!opal_memcons_virt) {
>   		pr_warn("OPAL: memory console address is invalid\n");
>   		return;
>   	}
>   
> -	if (be64_to_cpu(mc->magic) != MEMCONS_MAGIC) {
> +	OPAL_MEMCONS_GET_FIELD(magic,     __raw_readq, be64_to_cpu, val64);
> +	OPAL_MEMCONS_GET_FIELD(obuf_phys, __raw_readq, be64_to_cpu, val64);
> +	OPAL_MEMCONS_GET_FIELD(ibuf_phys, __raw_readq, be64_to_cpu, val64);
> +	OPAL_MEMCONS_GET_FIELD(obuf_size, __raw_readl, be32_to_cpu, val64);
> +	OPAL_MEMCONS_GET_FIELD(ibuf_size, __raw_readl, be32_to_cpu, val32);
> +	OPAL_MEMCONS_GET_FIELD(out_pos,   __raw_readl, be32_to_cpu, val32);
> +	OPAL_MEMCONS_GET_FIELD(in_prod,   __raw_readl, be32_to_cpu, val32);
> +	OPAL_MEMCONS_GET_FIELD(in_cons,   __raw_readl, be32_to_cpu, val32);
> +
> +	if (opal_memcons.magic != MEMCONS_MAGIC) {
>   		pr_warn("OPAL: memory console version is invalid\n");
> +		iounmap(opal_memcons_virt);
>   		return;
>   	}
>   
> -	/* Report maximum size */
> -	opal_msglog_attr.size =  be32_to_cpu(mc->ibuf_size) +
> -		be32_to_cpu(mc->obuf_size);
> +	opal_memcons_obuf = ioremap_prot(opal_memcons.obuf_phys,
> +					 opal_memcons.obuf_size,
> +					 (_PAGE_BASE | _PAGE_KERNEL_RO));
> +	if (!opal_memcons_obuf) {
> +		pr_warn("OPAL: Fail mapping output buffer (0x%lx, 0x%x)\n",
> +			opal_memcons.obuf_phys, opal_memcons.obuf_size);
> +		iounmap(opal_memcons_virt);
> +		return;
> +	}
>   
> -	opal_memcons = mc;
> +	/* Report maximum size */
> +	opal_msglog_attr.size =  opal_memcons.ibuf_size +
> +				 opal_memcons.obuf_size;
>   }
>   
>   void __init opal_msglog_sysfs_init(void)
>   {
> -	if (!opal_memcons) {
> +	if (!opal_memcons_obuf) {
>   		pr_warn("OPAL: message log initialisation failed, not creating sysfs entry\n");
>   		return;
>   	}
