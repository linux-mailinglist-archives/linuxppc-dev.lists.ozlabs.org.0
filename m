Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14DB530223
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 11:44:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L5bBq4SL2z3bth
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 May 2022 19:44:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NIn1jNaO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NIn1jNaO; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L5bB56Pr6z3bj3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 May 2022 19:43:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653212606; x=1684748606;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J1uRxreTk2vcgBP+Mv+o2kjbzDSrcYl4+WqXF1IBsU8=;
 b=NIn1jNaOfvG3FgYB+NtFJuBYNRffC65RgWOIP08spBdKpSKiWKi+7u9E
 kptk+qCezYLn74tBEiZ0pMc+u5IjLigOLGaF/vFiitZtjd+7YWmJCM350
 l8eah7I6Vtfv7O+OFJzVugUqeCpORwzpJ+r9onuTg6qhNtA1DizX0BmPK
 br6rMgiOr7GnwYF6qrSZE82XY+U+5HGGumAYqysKCmVMYTr2W6GLSuSr7
 sTZmvPHeE4i/283rUkpPeOtrdlEdDojL9Ek4Vq7DJ2dsSu2CVry99c5pI
 Q+SkSA1kcmwps/9Y+feUPjqFU3CE33JltgsBlXGOtrpT4UlSr9VN5j7aR g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10354"; a="255027847"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="255027847"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 02:43:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600"; d="scan'208";a="571562866"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 02:43:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nsi73-000IR6-9y; Sun, 22 May 2022 12:43:01 +0300
Date: Sun, 22 May 2022 12:43:01 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 1/5] kallsyms: pass buffer size in sprint_* APIs
Message-ID: <YooFpVGuDoyfoQPS@smile.fi.intel.com>
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083725epcas5p1c3e2989c991e50603a40c81ccc4982e0@epcas5p1.samsung.com>
 <20220520083701.2610975-2-maninder1.s@samsung.com>
 <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
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
Cc: peterz@infradead.org, linux@rasmusvillemoes.dk,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org,
 daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org,
 onkarnath.1@samsung.com, anil.s.keshavamurthy@intel.com, kartilak@cisco.com,
 kgdb-bugreport@lists.sourceforge.net, naveen.n.rao@linux.ibm.com,
 borntraeger@linux.ibm.com, jejb@linux.ibm.com, mhiramat@kernel.org,
 v.narang@samsung.com, pmladek@suse.com, satishkh@cisco.com,
 boqun.feng@gmail.com, keescook@chromium.org, gor@linux.ibm.com,
 hca@linux.ibm.com, rostedt@goodmis.org, linux-fsdevel@vger.kernel.org,
 mingo@redhat.com, bcain@quicinc.com, martin.petersen@oracle.com,
 dianders@chromium.org, sebaddel@cisco.com, senozhatsky@chromium.org,
 mcgrof@kernel.org, svens@linux.ibm.com, jason.wessel@windriver.com,
 Maninder Singh <maninder1.s@samsung.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 20, 2022 at 03:52:01PM -0400, Waiman Long wrote:
> On 5/20/22 04:36, Maninder Singh wrote:

...

> > -		sprint_symbol(sym, addr);
> > +		sprint_symbol(sym, KSYM_SYMBOL_LEN, addr);
> 
> Instead of hardcoding KSYM_SYMBOL_LEN everywhere, will it better to hide it
> like this:
> 
>         extern int __sprint_symbol(char *buffer, size_t size, unsigned long
> address);
>         #define sprint_symbol(buf, addr)        __sprint_symbol(buf,
> sizeof(buf), addr)
> 
> Or you can use sizeof(buf) directly instead of KSYM_SYMBOL_LEN.

This assumes that buf is defined as char [], which might be not always the
case. If you are going with the macro, than ARRAY_SIZE() seems appropriate
to perform a check against the above mentioned constraint.


-- 
With Best Regards,
Andy Shevchenko


