Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C6760500
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 13:04:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gBmf4BDjzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 21:04:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gBkb5VtCzDq9H
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 21:02:14 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Jul 2019 04:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,454,1557212400"; d="scan'208";a="169647925"
Received: from jsakkine-mobl1.tm.intel.com ([10.237.50.189])
 by orsmga006.jf.intel.com with ESMTP; 05 Jul 2019 04:02:07 -0700
Message-ID: <f161616a3681994680c70e66c51afd537a2f3423.camel@linux.intel.com>
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
Date: Fri, 05 Jul 2019 14:02:06 +0300
In-Reply-To: <f315356e7c00378c8785bd20d5869c9046ece2f2.camel@linux.intel.com>
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <f315356e7c00378c8785bd20d5869c9046ece2f2.camel@linux.intel.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Huewe <peterhuewe@gmx.de>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-07-05 at 13:42 +0300, Jarkko Sakkinen wrote:
> On Wed, 2019-07-03 at 23:32 -0400, Nayna Jain wrote:
> > The nr_allocated_banks and allocated banks are initialized as part of
> > tpm_chip_register. Currently, this is done as part of auto startup
> > function. However, some drivers, like the ibm vtpm driver, do not run
> > auto startup during initialization. This results in uninitialized memory
> > issue and causes a kernel panic during boot.
> > 
> > This patch moves the pcr allocation outside the auto startup function
> > into tpm_chip_register. This ensures that allocated banks are initialized
> > in any case.
> > 
> > Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms with
> > PCR read")
> > Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> 
> Please add
> 
> Reported-by: Michal Suchanek <msuchanek@suse.de>
> 
> It is missing. Michal is there a chance you could try this out once
> Nayna send a new version?

Hey, I saw Michal's tested-by. I can do that minor reorg cosmetic
bits myeslf and add Micha's tag.

Some issue with the network but I'll push a commit soonish.

/Jarkko

