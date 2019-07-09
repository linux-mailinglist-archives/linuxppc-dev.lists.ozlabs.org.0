Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FBE6397F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 18:38:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jp0L01QGzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 02:38:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jnxq1v7gzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 02:35:57 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Jul 2019 09:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,470,1557212400"; d="scan'208";a="185945552"
Received: from mmaitert-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.249.34.54])
 by fmsmga001.fm.intel.com with ESMTP; 09 Jul 2019 09:35:49 -0700
Date: Tue, 9 Jul 2019 19:35:48 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v2] tpm: tpm_ibm_vtpm: Fix unallocated banks
Message-ID: <20190709163548.i6w7iawyy6bgnyuw@linux.intel.com>
References: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
 <586c629b6d3c718f0c1585d77fe175fe007b27b1.camel@linux.intel.com>
 <1562624644.11461.66.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1562624644.11461.66.camel@linux.ibm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20180716
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
 Michal Suchanek <msuchanek@suse.de>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 08, 2019 at 06:24:04PM -0400, Mimi Zohar wrote:
> > static int tpm_get_pcr_allocation(struct tpm_chip *chip)
> > {
> > 	int rc;
> > 
> > 	rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
> >      	     tpm2_get_pcr_allocation(chip) :
> >      	     tpm1_get_pcr_allocation(chip);
> 
> > 
> > 	return rc > 0 ? -ENODEV : rc;
> > }
> > 
> > This addresses the issue that Stefan also pointed out. You have to
> > deal with the TPM error codes.
> 
> Hm, in the past I was told by Christoph not to use the ternary
> operator.  Have things changed?  Other than removing the comment, the
> only other difference is the return.

Lets purge the snippet:

rc = (chip->flags & TPM_CHIP_FLAG_TPM2) ?
     tpm2_get_pcr_allocation(chip) :
     tpm1_get_pcr_allocation(chip);

In this statement ternary operator does make sense because it is the
most readable way to express what is going on. We assign something
selecting one of the two options as the value  of rc based on a
condition.

It is like a natural fit for a ternary-operation and less messy than two
assigment statements.

On the other hand:

return rc > 0 ? -ENODEV : rc;

Here a better form would definitely be:

if (rc > 0)
	return - ENODEV;

return rc;

It is just two hard to grasp the logic when ternary operation is used.

Total ban of any language construct would be just utterly stupid. I
would instead use common sense here.

/Jarkko
