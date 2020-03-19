Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C56918C230
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 22:18:40 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48k0Bj2hBMzDrQN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 08:18:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=jarkko.sakkinen@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48k08g0kRmzDrP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 08:16:49 +1100 (AEDT)
IronPort-SDR: 8VuazAX23FngINys+nBe4/KNs1lDLEj+Hw6FxvTlCdIB1kxUpSapRuZ5PN6QgR8EjTUZL5eqOe
 5rviIRiZpFiA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 14:16:46 -0700
IronPort-SDR: OBRhkR5VnCf/p7xoXpuzUddSNSb1jZn/xUmnKQPVBXKXMUsYDj29anBBw5c+nly35wywnl9icp
 KXe3LQ+7zEaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,573,1574150400"; d="scan'208";a="237054181"
Received: from oamor-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.251.182.181])
 by fmsmga007.fm.intel.com with ESMTP; 19 Mar 2020 14:16:43 -0700
Date: Thu, 19 Mar 2020 23:16:42 +0200
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH] tpm2: Export tpm2_get_cc_attrs_tbl for ibmvtpm driver as
 module
Message-ID: <20200319211642.GB167847@linux.intel.com>
References: <20200317130819.720318-1-stefanb@linux.vnet.ibm.com>
 <20200318194247.GC48177@linux.intel.com>
 <4b2949a9-b251-906d-d513-1b2ccef758a0@linux.ibm.com>
 <20200319142714.GB3703@linux.intel.com>
 <17b5d98c-76b2-63c0-798a-920d91fec618@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b5d98c-76b2-63c0-798a-920d91fec618@linux.ibm.com>
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

On Thu, Mar 19, 2020 at 11:56:11AM -0400, Stefan Berger wrote:
> On 3/19/20 10:27 AM, Jarkko Sakkinen wrote:
> > On Wed, Mar 18, 2020 at 03:53:54PM -0400, Stefan Berger wrote:
> > > On 3/18/20 3:42 PM, Jarkko Sakkinen wrote:
> > > > On Tue, Mar 17, 2020 at 09:08:19AM -0400, Stefan Berger wrote:
> > > > > From: Stefan Berger <stefanb@linux.ibm.com>
> > > > > 
> > > > > This patch fixes the following problem when the ibmvtpm driver
> > > > > is built as a module:
> > > > > 
> > > > > ERROR: modpost: "tpm2_get_cc_attrs_tbl" [drivers/char/tpm/tpm_ibmvtpm.ko] undefined!
> > > > > make[1]: *** [scripts/Makefile.modpost:94: __modpost] Error 1
> > > > > make: *** [Makefile:1298: modules] Error 2
> > > > > 
> > > > > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > > > Hi, wrong tag (we use "tpm:"), missing fixes tag and please cc stable.
> > > > Thanks.
> > > I did not add the fixes tag because I do not know the final commit hash, or
> > > is it the final commit hash once it is in linux-next? I doubt it with all
> > > the merging that can occur.
> > Can you send me a new version after rc1 is out?
> 
> Michael Ellerman (cc'ed) told me that the fixes tag should 'work' once the
> bad patch is in linux-next. So I reposted yesterday (with a stray 'q' in the
> title :-( ):

OK, cool, I'll correct it and apply thanks.

Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

/Jarkko
