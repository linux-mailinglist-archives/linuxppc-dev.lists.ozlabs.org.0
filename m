Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F17CA18BA62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 16:07:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jqy85jsBzDrK2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 02:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jq4K0t3PzDrDm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:27:27 +1100 (AEDT)
IronPort-SDR: uQo9tqux6VO2w9gG6NoiCUEyWZCf061db/ULKUHLnJNi4AzYtRIgdYW9iBL7SM1c0rKK3RdKNQ
 9OsobNG0wGkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 07:27:19 -0700
IronPort-SDR: EtchYp8B7uoiL7wXlFcN9kwhNz4PotBR5UDN4L88/9cjUnL/sX041L43u1+FsR1fQ8+fpnnp2x
 +Sf2pLhtxX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="245175060"
Received: from awagner-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.86.227])
 by orsmga003.jf.intel.com with ESMTP; 19 Mar 2020 07:27:15 -0700
Date: Thu, 19 Mar 2020 16:27:14 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH] tpm2: Export tpm2_get_cc_attrs_tbl for ibmvtpm driver as
 module
Message-ID: <20200319142714.GB3703@linux.intel.com>
References: <20200317130819.720318-1-stefanb@linux.vnet.ibm.com>
 <20200318194247.GC48177@linux.intel.com>
 <4b2949a9-b251-906d-d513-1b2ccef758a0@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b2949a9-b251-906d-d513-1b2ccef758a0@linux.ibm.com>
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
Cc: sachinp@linux.vnet.ibm.com, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 18, 2020 at 03:53:54PM -0400, Stefan Berger wrote:
> On 3/18/20 3:42 PM, Jarkko Sakkinen wrote:
> > On Tue, Mar 17, 2020 at 09:08:19AM -0400, Stefan Berger wrote:
> > > From: Stefan Berger <stefanb@linux.ibm.com>
> > > 
> > > This patch fixes the following problem when the ibmvtpm driver
> > > is built as a module:
> > > 
> > > ERROR: modpost: "tpm2_get_cc_attrs_tbl" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!
> > > make[1]: *** [scripts/Makefile.modpost:94: __modpost] Error 1
> > > make: *** [Makefile:1298: modules] Error 2
> > > 
> > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > Hi, wrong tag (we use "tpm:"), missing fixes tag and please cc stable.
> > Thanks.
> 
> I did not add the fixes tag because I do not know the final commit hash, or
> is it the final commit hash once it is in linux-next? I doubt it with all
> the merging that can occur.

Can you send me a new version after rc1 is out?

/Jarkko
