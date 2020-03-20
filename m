Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D5218D4DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 17:49:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kV9k6M6bzF0RF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 03:49:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kV7M11pmzDscR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 03:47:26 +1100 (AEDT)
IronPort-SDR: nzONMyQJNwG03jA0997cCEA0Y563ClGShqujhsK+XYfQNFjFn9UDZwZALSLQNZV8EM9234uLcJ
 hHqZvlnBr9ug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 09:47:19 -0700
IronPort-SDR: dh18lLVo7SI0bBVLPd2Cy19KovYFRENeBeSupTfr4AIdadWB9ym3f9KLJ4NiA2Y4dyMWqRbDKu
 uxX8AfF9TK1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; d="scan'208";a="234560765"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2020 09:47:11 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jFKnf-00BVrf-RA; Fri, 20 Mar 2020 18:47:11 +0200
Date: Fri, 20 Mar 2020 18:47:11 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v12 8/8] MAINTAINERS: perf: Add pattern that matches ppc
 perf to the perf entry.
Message-ID: <20200320164711.GH1922688@smile.fi.intel.com>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584699455.git.msuchanek@suse.de>
 <4b150d01c60bd37705789200d9adee9f1c9b50ce.1584699455.git.msuchanek@suse.de>
 <20200320103350.GV1922688@smile.fi.intel.com>
 <20200320112338.GP25468@kitsune.suse.cz>
 <20200320124251.GW1922688@smile.fi.intel.com>
 <b96c9dd4dba4afca5288a551158659bf545d29fb.camel@perches.com>
 <20200320163157.GF1922688@smile.fi.intel.com>
 <20200320164204.GV25468@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200320164204.GV25468@kitsune.suse.cz>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Joe Perches <joe@perches.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 05:42:04PM +0100, Michal Suchánek wrote:
> On Fri, Mar 20, 2020 at 06:31:57PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 20, 2020 at 07:42:03AM -0700, Joe Perches wrote:
> > > On Fri, 2020-03-20 at 14:42 +0200, Andy Shevchenko wrote:
> > > > On Fri, Mar 20, 2020 at 12:23:38PM +0100, Michal Suchánek wrote:
> > > > > On Fri, Mar 20, 2020 at 12:33:50PM +0200, Andy Shevchenko wrote:
> > > > > > On Fri, Mar 20, 2020 at 11:20:19AM +0100, Michal Suchanek wrote:
> > > > > > > While at it also simplify the existing perf patterns.
> > > > > > And still missed fixes from parse-maintainers.pl.
> > > > > 
> > > > > Oh, that script UX is truly ingenious.
> > > > 
> > > > You have at least two options, their combinations, etc:
> > > >  - complain to the author :-)
> > > >  - send a patch :-)
> > > 
> > > Recently:
> > > 
> > > https://lore.kernel.org/lkml/4d5291fa3fb4962b1fa55e8fd9ef421ef0c1b1e5.camel@perches.com/
> > 
> > But why?
> > 
> > Shouldn't we rather run MAINTAINERS clean up once and require people to use
> > parse-maintainers.pl for good?
> 
> That cleanup did not happen yet, and I am not volunteering for one.
> The difference between MAINTAINERS and MAINTAINERS.new is:
> 
>  MAINTAINERS | 5510 +++++++++++++++++++++++++++++------------------------------
>  1 file changed, 2755 insertions(+), 2755 deletions(-)

Yes, it was basically reply to Joe.

-- 
With Best Regards,
Andy Shevchenko


