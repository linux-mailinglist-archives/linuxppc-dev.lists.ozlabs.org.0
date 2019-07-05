Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7406D60B2F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 19:52:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gMqY5WQQzDqfC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 03:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gMnq4fBJzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 03:50:37 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2019 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,455,1557212400"; d="scan'208";a="175559214"
Received: from hsolima-mobl1.ger.corp.intel.com ([10.252.48.252])
 by orsmga002.jf.intel.com with ESMTP; 05 Jul 2019 10:50:28 -0700
Message-ID: <1270cd6ab2ceae1ad01e4b83b75fc4c6fc70027d.camel@linux.intel.com>
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Nayna <nayna@linux.vnet.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Date: Fri, 05 Jul 2019 20:50:27 +0300
In-Reply-To: <164b9c6e-9b6d-324d-9df8-d2f7d1ac8cfc@linux.vnet.ibm.com>
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
 <164b9c6e-9b6d-324d-9df8-d2f7d1ac8cfc@linux.vnet.ibm.com>
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

On Fri, 2019-07-05 at 11:32 -0400, Nayna wrote:
> I am not sure of the purpose of tpm_stop_chip(), so I have left it as it 
> is. Jarkko, what do you think about the change ?

Stefan right. Your does not work, or will randomly work or not work
depending on the chip.

You need to turn the TPM on with tpm_chip_start() and turn it off with
tpm_chip_stop() once you are done. This is done in tpm_chip_register()
before calling tpm_auto_startup().

TPM power management was once in tpm_transmit() but not anymore after my
patch set that removed nested tpm_transmit() calls.

While you're on it please take into account my earlier feedback.

Also, short summary could be "tpm: tpm_ibm_vtpm: Fix unallocated banks"

Some oddballs in your patch that I have to ask.

if (chip->flags & TPM_CHIP_FLAG_TPM2) {
	rc = tpm2_get_pcr_allocation(chip);
	if (rc)
		goto out;
}

chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
		GFP_KERNEL);
if (!chip->allocated_banks) {
	rc = -ENOMEM;
	goto out;
}

Why you don't return on site and instead jump somewhere? Also the
2nd line for kcalloc() is misaligned.

out:
	if (rc < 0)
		rc = -ENODEV;

This will cause a new regression i.e. you let TPM error codes
through.

To summarize this patch fixes one regression and introduces two
completely new ones...

/Jarkko`

