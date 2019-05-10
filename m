Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC2C1A1C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:43:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450wyX6pGXzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 02:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450ww773FczDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 02:41:42 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 09:41:40 -0700
X-ExtLoop1: 1
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga004.fm.intel.com with ESMTP; 10 May 2019 09:41:35 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hP8aU-0005ve-6P; Fri, 10 May 2019 19:41:34 +0300
Date: Fri, 10 May 2019 19:41:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510164134.GH9224@smile.fi.intel.com>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510122401.21a598f6@gandalf.local.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>, linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 10, 2019 at 12:24:01PM -0400, Steven Rostedt wrote:
> On Fri, 10 May 2019 10:42:13 +0200
> Petr Mladek <pmladek@suse.com> wrote:
> 
> >  static const char *check_pointer_msg(const void *ptr)
> >  {
> > -	char byte;
> > -
> >  	if (!ptr)
> >  		return "(null)";
> >  
> > -	if (probe_kernel_address(ptr, byte))
> > +	if ((unsigned long)ptr < PAGE_SIZE || IS_ERR_VALUE(ptr))
> >  		return "(efault)";
> >  
> 
> 
> 	< PAGE_SIZE ?
> 
> do you mean: < TASK_SIZE ?

Original code used PAGE_SIZE. If it needs to be changed, that it might be a
separate explanation / patch.

-- 
With Best Regards,
Andy Shevchenko


