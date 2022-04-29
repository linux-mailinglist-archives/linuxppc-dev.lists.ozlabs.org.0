Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8F85154D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 21:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KqjhL5xZzz3byG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 05:48:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=xag3=vh=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kqjgt3Kwmz2ynk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 05:47:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66E62B8354B;
 Fri, 29 Apr 2022 19:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AE2C385A4;
 Fri, 29 Apr 2022 19:47:28 +0000 (UTC)
Date: Fri, 29 Apr 2022 15:47:26 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] ftrace: recordmcount: Handle sections with no
 non-weak symbols
Message-ID: <20220429154726.19f72a1a@gandalf.local.home>
In-Reply-To: <1651257788.xtscezsfky.naveen@linux.ibm.com>
References: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
 <126aca34935cf1c7168e17970c706e36577094e7.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220428184212.18fbf438@gandalf.local.home>
 <1651252324.js9790ngjg.naveen@linux.ibm.com>
 <20220429135916.47c3e623@gandalf.local.home>
 <1651257788.xtscezsfky.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 30 Apr 2022 01:03:01 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> > The point of this section is to know which functions in __mcount_loc may
> > have been overridden, as they would be found in the __mcount_loc_weak
> > section. And then we can do something "special" to them.  
> 
> I'm not sure I follow that. How are you intending to figure out which 
> functions were overridden by looking at entries in the __mcount_loc_weak 
> section?

If there's duplicates (or something strange with the offset) then we could
delete the one that has the match in the weak section.

> 
> In the final vmlinux image, we only get offsets into .text for all 
> mcount locations, but no symbol information. The only hint is the fact 
> that a single kallsym symbol has multiple mcount locations within it. 
> Even then, the symbol with duplicate mcount entries won't be the 
> function that was overridden.
> 
> We could do a kallsyms_lookup() on each entry and consult the 
> __mcount_loc_weak section to identify duplicates, but that looks to be 
> very expensive.
> 
> Did you have a different approach in mind?

We only need to look at the ones in the weak section. How many that is may
determine if that's feasible or not.

> 
> >   
> >> 
> >> As an example, in the issue described in this patch set, if powerpc 
> >> starts over-riding kexec_arch_apply_relocations(), then the current weak 
> >> implementation in kexec_file.o gets carried over to the final vmlinux, 
> >> but the instructions will instead appear under the previous function in 
> >> kexec_file.o: crash_prepare_elf64_headers(). This function may or may 
> >> not be traced to begin with, so we won't be able to figure out if this 
> >> is valid or not.  
> > 
> > If it was overridden, then there would be two entries for function that
> > overrides the weak function in the __mcount_loc section, right? One for the
> > new function, and one that was overridden.  
> 
> In the final vmlinux, we will have two entries: one pointing at the 
> correct function, while the other will point to some other function 
> name. So, at least from kallsym perspective, duplicate mcount entries 
> won't be for the function that was overridden, but some arbitrary 
> function that came before the weak function in the object file.

Right, and we should be able to find them.

> 
> > Of course this could be more
> > complex if the new function had been marked notrace.
> > 
> > I was thinking of doing this just so that we know what functions are weak
> > and perhaps need extra processing.
> > 
> > Another issue with weak functions and ftrace just came up here:
> > 
> >   https://lore.kernel.org/all/20220428095803.66c17c32@gandalf.local.home/  
> 
> I noticed this just yesterday:
> 
>   # cat available_filter_functions | sort | uniq -d | wc -l
>   430
> 
> I'm fairly certain that some of those are due to weak functions -- I 
> just wasn't sure if all of those were.

Probably :-/

> 
> I suppose this will now also be a problem with ftrace_location(), given 
> that it was recently changed to look at an entire function for mcount 
> locations?
> 

Maybe. I have to focus on other things at the moment, but I'll try to find
some time to look at this deeper.

-- Steve
