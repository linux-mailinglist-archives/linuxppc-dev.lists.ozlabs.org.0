Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA79526D67
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:15:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0Pdk2NTsz3byk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 09:15:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vgu2J1nN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vgu2J1nN; dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0Pd5553yz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 09:15:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652483721; x=1684019721;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+wjfqOqIYe6TZTMHFU68r4+WktU+l0Y6oPd5aHItbaM=;
 b=Vgu2J1nNJQgs5EXgBTxF4FNScto+IELBc4yiIWjdYI4s5txrEnk56BUA
 16cPzpCUMjS77XTmh77iFLgXjEmLAtw/i/c/oM5b2d8hSVjjBHj86a3A+
 0TCdhlXI9uPr/RiKeKGrrnaGI0HjLtF2gnIksg+CAcV4KAMAlmfVYHAPc
 cj2Xtoo8idBvxBmAt3SDVqTUsJcxUgNlj6gEn98ZT10+XEwqiwG9EivbU
 NJDMg+tlJZSkHlVqhN7Ol0yZFp6pEtjwOSkuN04NntK152J15mAQpoMVY
 9iQvanDMtGrHZI8M+rmK6GIltY2LhZkhPNxQbWiUTuyaJed+4+E41mrIj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="270104314"
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="270104314"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2022 16:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; d="scan'208";a="815594245"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga006.fm.intel.com with ESMTP; 13 May 2022 16:14:19 -0700
Date: Fri, 13 May 2022 16:17:54 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 24/29] watchdog/hardlockup: Use parse_option_str() to
 handle "nmi_watchdog"
Message-ID: <20220513231754.GB9074@ranerica-svr.sc.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
 <20220506000008.30892-25-ricardo.neri-calderon@linux.intel.com>
 <1652179333.fnu2fjiffn.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652179333.fnu2fjiffn.astroid@bobo.none>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Stephane Eranian <eranian@google.com>, Ricardo Neri <ricardo.neri@intel.com>,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 10, 2022 at 08:46:41PM +1000, Nicholas Piggin wrote:
> Excerpts from Ricardo Neri's message of May 6, 2022 10:00 am:
> > Prepare hardlockup_panic_setup() to handle a comma-separated list of
> > options. Thus, it can continue parsing its own command-line options while
> > ignoring parameters that are relevant only to specific implementations of
> > the hardlockup detector. Such implementations may use an early_param to
> > parse their own options.
> 
> It can't really handle comma separated list though, until the next
> patch. nmi_watchdog=panic,0 does not make sense, so you lost error
> handling of that.

Yes that is true. All possible combinations need to be checked.

> 
> And is it kosher to double handle options like this? I'm sure it
> happens but it's ugly.
> 
> Would you consider just add a new option for x86 and avoid changing
> this? Less code and patches.

Sure, I can not modify this code and add a x86-specific command-line
option.

Thanks and BR,
Ricardo
