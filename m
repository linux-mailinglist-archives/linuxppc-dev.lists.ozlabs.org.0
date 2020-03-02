Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02859176808
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 00:24:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WbnC6P0xzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 10:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.79.46; helo=10.mo179.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 8858 seconds by postgrey-1.36 at bilbo;
 Tue, 03 Mar 2020 10:22:28 AEDT
Received: from 10.mo179.mail-out.ovh.net (10.mo179.mail-out.ovh.net
 [46.105.79.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WblS2M7GzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 10:22:24 +1100 (AEDT)
Received: from player726.ha.ovh.net (unknown [10.108.35.211])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 7CE7715CEFB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 21:54:41 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player726.ha.ovh.net (Postfix) with ESMTPSA id 3EA04FE49C0A;
 Mon,  2 Mar 2020 20:54:25 +0000 (UTC)
Date: Mon, 2 Mar 2020 21:54:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Message-ID: <20200302215415.6a4ba5cf@bahia.home>
In-Reply-To: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8255379595624749515
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedruddtgedgudegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, kvm-ppc@vger.kernel.org,
 clg@fr.ibm.com, sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Feb 2020 23:54:04 -0800
Ram Pai <linuxram@us.ibm.com> wrote:

> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
> 

What exactly is "not correctly enabled" ?

> Hence Secure VM, must always default to XICS interrupt controller.
> 

So this is a temporary workaround until whatever isn't working with
XIVE and the Secure VM gets fixed. Maybe worth mentioning this in
some comment.

> If XIVE is requested through kernel command line option "xive=on",
> override and turn it off.
> 

There's no such thing as requesting XIVE with "xive=on". XIVE is
on by default if the platform and CPU support it BUT it can be
disabled with "xive=off" in which case the guest wont request
XIVE except if it's the only available mode.

> If XIVE is the only supported platform interrupt controller; specified
> through qemu option "ic-mode=xive", simply abort. Otherwise default to
> XICS.
> 

If XIVE is the only option and the guest requests XICS anyway, QEMU is
supposed to print an error message and terminate:

        if (!spapr->irq->xics) {
            error_report(
"Guest requested unavailable interrupt mode (XICS), either don't set the ic-mode machine property or try ic-mode=xics or ic-mode=dual");
            exit(EXIT_FAILURE);
        }

I think it would be better to end up there rather than aborting.

> Cc: kvm-ppc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Michael Anderson <andmike@linux.ibm.com>
> Cc: Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: Cedric Le Goater <clg@fr.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 43 ++++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index 5773453..dd96c82 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -805,6 +805,18 @@ static void __init early_cmdline_parse(void)
>  #endif
>  	}
>  
> +#ifdef CONFIG_PPC_SVM
> +	opt = prom_strstr(prom_cmd_line, "svm=");
> +	if (opt) {
> +		bool val;
> +
> +		opt += sizeof("svm=") - 1;
> +		if (!prom_strtobool(opt, &val))
> +			prom_svm_enable = val;
> +		prom_printf("svm =%d\n", prom_svm_enable);
> +	}
> +#endif /* CONFIG_PPC_SVM */
> +
>  #ifdef CONFIG_PPC_PSERIES
>  	prom_radix_disable = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
>  	opt = prom_strstr(prom_cmd_line, "disable_radix");
> @@ -823,23 +835,22 @@ static void __init early_cmdline_parse(void)
>  	if (prom_radix_disable)
>  		prom_debug("Radix disabled from cmdline\n");
>  
> -	opt = prom_strstr(prom_cmd_line, "xive=off");
> -	if (opt) {

A comment to explain why we currently need to limit ourselves to using
XICS would be appreciated.

> +#ifdef CONFIG_PPC_SVM
> +	if (prom_svm_enable) {
>  		prom_xive_disable = true;
> -		prom_debug("XIVE disabled from cmdline\n");
> +		prom_debug("XIVE disabled in Secure VM\n");
>  	}
> -#endif /* CONFIG_PPC_PSERIES */
> -
> -#ifdef CONFIG_PPC_SVM
> -	opt = prom_strstr(prom_cmd_line, "svm=");
> -	if (opt) {
> -		bool val;
> +#endif /* CONFIG_PPC_SVM */
>  
> -		opt += sizeof("svm=") - 1;
> -		if (!prom_strtobool(opt, &val))
> -			prom_svm_enable = val;
> +	if (!prom_xive_disable) {
> +		opt = prom_strstr(prom_cmd_line, "xive=off");
> +		if (opt) {
> +			prom_xive_disable = true;
> +			prom_debug("XIVE disabled from cmdline\n");
> +		}
>  	}
> -#endif /* CONFIG_PPC_SVM */
> +
> +#endif /* CONFIG_PPC_PSERIES */
>  }
>  
>  #ifdef CONFIG_PPC_PSERIES
> @@ -1251,6 +1262,12 @@ static void __init prom_parse_xive_model(u8 val,
>  		break;
>  	case OV5_FEAT(OV5_XIVE_EXPLOIT): /* Only Exploitation mode */
>  		prom_debug("XIVE - exploitation mode supported\n");
> +
> +#ifdef CONFIG_PPC_SVM
> +		if (prom_svm_enable)
> +			prom_panic("WARNING: xive unsupported in Secure VM\n");

Change the prom_panic() line into a break. The guest will ask XICS and QEMU
will terminate nicely. Maybe still print out a warning since QEMU won't mention
the Secure VM aspect of things.

> +#endif /* CONFIG_PPC_SVM */
> +
>  		if (prom_xive_disable) {
>  			/*
>  			 * If we __have__ to do XIVE, we're better off ignoring

