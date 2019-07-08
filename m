Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 095CB62148
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:14:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j8BN72VdzDqND
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 01:14:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j8794lQNzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 01:11:48 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 08:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="159148473"
Received: from jsakkine-mobl1.tm.intel.com ([10.237.50.189])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 08:11:38 -0700
Message-ID: <586c629b6d3c718f0c1585d77fe175fe007b27b1.camel@linux.intel.com>
Subject: Re: [PATCH v2] tpm: tpm_ibm_vtpm: Fix unallocated banks
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Jul 2019 18:11:40 +0300
In-Reply-To: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
References: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 George Wilson <gcwilson@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Huewe <peterhuewe@gmx.de>, Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-07-06 at 20:18 -0400, Nayna Jain wrote:
> +/*
> + * tpm_get_pcr_allocation() - initialize the chip allocated banks for PCRs
> + * @chip: TPM chip to use.
> + */
> +static int tpm_get_pcr_allocation(struct tpm_chip *chip)
> +{
> +	int rc;
> +
> +	if (chip->flags & TPM_CHIP_FLAG_TPM2)
> +		rc = tpm2_get_pcr_allocation(chip);
> +	else
> +		rc = tpm1_get_pcr_allocation(chip);
> +
> +	return rc;
> +}

It is just a trivial static function, which means that kdoc comment is
not required and neither it is useful. Please remove that. I would
rewrite the function like:

static int tpm_get_pcr_allocation(struct tpm_chip *chip)
{
	int rc;

	rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
     	     tpm2_get_pcr_allocation(chip) :
     	     tpm1_get_pcr_allocation(chip);

	return rc > 0 ? -ENODEV : rc;
}

This addresses the issue that Stefan also pointed out. You have to
deal with the TPM error codes.

/Jarkko

