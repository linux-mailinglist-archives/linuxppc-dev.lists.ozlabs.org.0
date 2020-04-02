Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6819CA0B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 21:33:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tYBm2ZCwzDrTC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tY8t4t05zDrRG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 06:31:41 +1100 (AEDT)
IronPort-SDR: EgJe6LfX6gp8bM/tGG3WZKcVHqSy3WFX1vO/y1WB8J8NUTqDEIYS3XDP03McCVlaHIMYYEyHRF
 d8JmDeLMq9ug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 12:31:39 -0700
IronPort-SDR: e818wdZCBUVsYzp4U6BJ2Qs8+Q43Q9Q/oXz4HQxZxW1jZNUehwjhCwCUuZOXi121xQ+V+8oFYI
 Ksm606buqnuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="240914698"
Received: from hbriegel-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.39.101])
 by fmsmga007.fm.intel.com with ESMTP; 02 Apr 2020 12:31:36 -0700
Date: Thu, 2 Apr 2020 22:31:34 +0300
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] qtpm2: Export tpm2_get_cc_attrs_tbl for ibmvtpm
 driver as module
Message-ID: <20200402193134.GC10314@linux.intel.com>
References: <20200319010017.738677-1-stefanb@linux.vnet.ibm.com>
 <20200319195706.GD24804@linux.intel.com>
 <2BF66599-184A-4647-BC57-105A1512F119@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2BF66599-184A-4647-BC57-105A1512F119@linux.vnet.ibm.com>
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 01, 2020 at 02:40:30PM +0530, Sachin Sant wrote:
> 
> 
> > On 20-Mar-2020, at 1:27 AM, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> wrote:
> > 
> > On Wed, Mar 18, 2020 at 09:00:17PM -0400, Stefan Berger wrote:
> >> From: Stefan Berger <stefanb@linux.ibm.com>
> >> 
> >> This patch fixes the following problem when the ibmvtpm driver
> >> is built as a module:
> >> 
> >> ERROR: modpost: "tpm2_get_cc_attrs_tbl" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!
> >> make[1]: *** [scripts/Makefile.modpost:94: __modpost] Error 1
> >> make: *** [Makefile:1298: modules] Error 2
> >> 
> >> Fixes: 18b3670d79ae ("tpm: ibmvtpm: Add support for TPM2")
> >> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> >> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> >> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> > 
> 
> Ping. This failure can now be seen in mainline (cad18da0af) as well.

It is in my tree

/Jarkko
