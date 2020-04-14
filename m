Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABDE1A7520
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 09:45:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491cwZ4J52zDqdl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:45:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491cZf344hzDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 17:30:00 +1000 (AEST)
IronPort-SDR: afWZBZiUkOdQOGuGPneG3FAK9knTrORREj1jOluEUuFkIfnl5TPVOAdyo+n2pqgMrEWRIa+Md5
 jI4UMULT6NTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 00:29:56 -0700
IronPort-SDR: EsEakIQVMAszRJ7SduQBFy1ioFSV3Wt4cZnXwXUPa8/MmyJOeYCuONkiJ9OMJ/Pdb8JlVtZMsO
 Hfki/ckE7k8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,381,1580803200"; d="scan'208";a="256426116"
Received: from elenamax-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.42.208])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 00:29:51 -0700
Date: Tue, 14 Apr 2020 10:29:50 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] qtpm2: Export tpm2_get_cc_attrs_tbl for ibmvtpm
 driver as module
Message-ID: <20200414072950.GD8403@linux.intel.com>
References: <20200319010017.738677-1-stefanb@linux.vnet.ibm.com>
 <20200319195706.GD24804@linux.intel.com>
 <2BF66599-184A-4647-BC57-105A1512F119@linux.vnet.ibm.com>
 <20200402193134.GC10314@linux.intel.com>
 <87k12ikhye.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87k12ikhye.fsf@mpe.ellerman.id.au>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 10:51:37AM +1000, Michael Ellerman wrote:
> Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> writes:
> > On Wed, Apr 01, 2020 at 02:40:30PM +0530, Sachin Sant wrote:
> >> > On 20-Mar-2020, at 1:27 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> >> > 
> >> > On Wed, Mar 18, 2020 at 09:00:17PM -0400, Stefan Berger wrote:
> >> >> From: Stefan Berger <stefanb@linux.ibm.com>
> >> >> 
> >> >> This patch fixes the following problem when the ibmvtpm driver
> >> >> is built as a module:
> >> >> 
> >> >> ERROR: modpost: "tpm2_get_cc_attrs_tbl" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!
> >> >> make[1]: *** [scripts/Makefile.modpost:94: __modpost] Error 1
> >> >> make: *** [Makefile:1298: modules] Error 2
> >> >> 
> >> >> Fixes: 18b3670d79ae ("tpm: ibmvtpm: Add support for TPM2")
> >> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> >> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> >> >> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> >> > 
> >> 
> >> Ping. This failure can now be seen in mainline (cad18da0af) as well.
> >
> > It is in my tree
> 
> Can you please send it to Linus?
> 
> cheers

Yes.

/Jarkko
