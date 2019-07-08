Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6B621A4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 17:18:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45j8Gp3j3dzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 01:18:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45j88F0KdXzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 01:12:44 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 08:12:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="159148707"
Received: from jsakkine-mobl1.tm.intel.com ([10.237.50.189])
 by orsmga008.jf.intel.com with ESMTP; 08 Jul 2019 08:12:37 -0700
Message-ID: <d0f07f81542abfd6579379de552e819a4e3c481d.camel@linux.intel.com>
Subject: Re: [PATCH] tpm: fixes uninitialized allocated banks for IBM vtpm
 driver
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To: Nayna <nayna@linux.vnet.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 Jul 2019 18:12:39 +0300
In-Reply-To: <bd961ef2-baed-8fc3-7f21-566bbcf9da8b@linux.vnet.ibm.com>
References: <1562211121-2188-1-git-send-email-nayna@linux.ibm.com>
 <1998ebcf-1521-778f-2c80-55ad2c855023@linux.ibm.com>
 <164b9c6e-9b6d-324d-9df8-d2f7d1ac8cfc@linux.vnet.ibm.com>
 <1270cd6ab2ceae1ad01e4b83b75fc4c6fc70027d.camel@linux.intel.com>
 <bd961ef2-baed-8fc3-7f21-566bbcf9da8b@linux.vnet.ibm.com>
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
 Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Huewe <peterhuewe@gmx.de>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2019-07-06 at 20:25 -0400, Nayna wrote:
> Thanks Jarkko. I just now posted the v2 version that includes your and
> Stefan's feedbacks.

Looks almost legit :-)

/Jarkko

