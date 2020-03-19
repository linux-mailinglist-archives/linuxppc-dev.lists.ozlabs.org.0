Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3107018B98D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:40:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jqLm3LzZzDqlF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 01:40:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jpYh17PjzDqnD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 01:04:24 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 959CDAE63;
 Thu, 19 Mar 2020 14:04:18 +0000 (UTC)
Date: Thu, 19 Mar 2020 15:04:16 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v11 4/8] powerpc/perf: consolidate valid_user_sp
Message-ID: <20200319140416.GK25468@kitsune.suse.cz>
References: <cover.1584613649.git.msuchanek@suse.de>
 <1b612025371bb9f2bcce72c700c809ae29e57392.1584613649.git.msuchanek@suse.de>
 <CAHp75VcMkPeJ6exroipnxvf-7g-C8QbVm0bAnp=rk505_nxySw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcMkPeJ6exroipnxvf-7g-C8QbVm0bAnp=rk505_nxySw@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Jiri Olsa <jolsa@redhat.com>,
 Rob Herring <robh@kernel.org>, Michael Neuling <mikey@neuling.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 "linux-fsdevel @ vger . kernel . org --in-reply-to="
 <20200225173541.1549955-1-npiggin@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Allison Randal <allison@lohutok.net>,
 Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicholas Piggin <npiggin@gmail.com>, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Eric Richter <erichte@linux.ibm.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 19, 2020 at 03:35:03PM +0200, Andy Shevchenko wrote:
> On Thu, Mar 19, 2020 at 1:54 PM Michal Suchanek <msuchanek@suse.de> wrote:
> >
> > Merge the 32bit and 64bit version.
> >
> > Halve the check constants on 32bit.
> >
> > Use STACK_TOP since it is defined.
> >
> > Passing is_64 is now redundant since is_32bit_task() is used to
> > determine which callchain variant should be used. Use STACK_TOP and
> > is_32bit_task() directly.
> >
> > This removes a page from the valid 32bit area on 64bit:
> >  #define TASK_SIZE_USER32 (0x0000000100000000UL - (1 * PAGE_SIZE))
> >  #define STACK_TOP_USER32 TASK_SIZE_USER32
> 
> ...
> 
> > +static inline int valid_user_sp(unsigned long sp)
> > +{
> > +       bool is_64 = !is_32bit_task();
> > +
> > +       if (!sp || (sp & (is_64 ? 7 : 3)) || sp > STACK_TOP - (is_64 ? 32 : 16))
> > +               return 0;
> > +       return 1;
> > +}
> 
> Perhaps better to read
> 
>   if (!sp)
>     return 0;
> 
>   if (is_32bit_task()) {
>     if (sp & 0x03)
>       return 0;
>     if (sp > STACK_TOP - 16)
>       return 0;
>   } else {
>     ...
>   }
> 
>   return 1;
> 
> Other possibility:
> 
>   unsigned long align = is_32bit_task() ? 3 : 7;
>   unsigned long top = STACK_TOP - (is_32bit_task() ? 16 : 32);
> 
>   return !(!sp || (sp & align) || sp > top);
Sounds reasonale.

Thanks

Michal
> 
> -- 
> With Best Regards,
> Andy Shevchenko
