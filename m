Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDC41FC0AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 23:09:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mgnQ22k8zDr2m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 07:09:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mgln261mzDqQL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 07:08:17 +1000 (AEST)
IronPort-SDR: 7dM5m9vivqJAUju31YI8Y7sS4h1g0snlF6sKVxAeaKQVJNYQFaS/2MG/FACO+2UAq9u1cSphwH
 J7j+SI/t4MWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2020 14:08:14 -0700
IronPort-SDR: uYSGeta2jHg/O7VYnU4drv0O2NvAE+qnGReSnhh1BY/tenQtJycf5uXNGK4K2kpbvHHxpEHuKC
 ++DbHNucE5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,519,1583222400"; d="scan'208";a="261535509"
Received: from gosinald-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.36.106])
 by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2020 14:08:09 -0700
Date: Wed, 17 Jun 2020 00:08:08 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH] tpm: ibmvtpm: Wait for ready buffer before probing for
 TPM2 attributes
Message-ID: <20200616210808.GJ20943@linux.intel.com>
References: <20200605063719.456277-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200605063719.456277-1-david@gibson.dropbear.id.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 Peter Huewe <peterhuewe@gmx.de>, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 05, 2020 at 04:37:19PM +1000, David Gibson wrote:
> The tpm2_get_cc_attrs_tbl() call will result in TPM commands being issued,
> which will need the use of the internal command/response buffer.  But,
> we're issuing this *before* we've waited to make sure that buffer is
> allocated.
> 
> This can result in intermittent failures to probe if the hypervisor / TPM
> implementation doesn't respond quickly enough.  I find it fails almost
> every time with an 8 vcpu guest under KVM with software emulated TPM.
> 
> Fixes: 18b3670d79ae9 "tpm: ibmvtpm: Add support for TPM2"

Should be Fixes: 18b3670d79ae ("tpm: ibmvtpm: Add support for TPM2")

Also briefly state what the commit does, not just the problem
description. The code change looks legit.

Please send v2 with these changes.

> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  drivers/char/tpm/tpm_ibmvtpm.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
> index 09fe45246b8c..994385bf37c0 100644
> --- a/drivers/char/tpm/tpm_ibmvtpm.c
> +++ b/drivers/char/tpm/tpm_ibmvtpm.c
> @@ -683,13 +683,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  	if (rc)
>  		goto init_irq_cleanup;
>  
> -	if (!strcmp(id->compat, "IBM,vtpm20")) {
> -		chip->flags |= TPM_CHIP_FLAG_TPM2;
> -		rc = tpm2_get_cc_attrs_tbl(chip);
> -		if (rc)
> -			goto init_irq_cleanup;
> -	}
> -
>  	if (!wait_event_timeout(ibmvtpm->crq_queue.wq,
>  				ibmvtpm->rtce_buf != NULL,
>  				HZ)) {
> @@ -697,6 +690,13 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
>  		goto init_irq_cleanup;
>  	}
>  
> +	if (!strcmp(id->compat, "IBM,vtpm20")) {
> +		chip->flags |= TPM_CHIP_FLAG_TPM2;
> +		rc = tpm2_get_cc_attrs_tbl(chip);
> +		if (rc)
> +			goto init_irq_cleanup;
> +	}
> +
>  	return tpm_chip_register(chip);
>  init_irq_cleanup:
>  	do {
> -- 
> 2.26.2
> 

/Jarkko
