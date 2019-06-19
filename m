Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADD4B4ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 11:29:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TKRF603YzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 19:29:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=jzn+=us=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TKPP4qj0zDqRP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 19:28:09 +1000 (AEST)
Received: from oasis.local.home (rrcs-50-75-126-20.nys.biz.rr.com
 [50.75.126.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8AEE0206E0;
 Wed, 19 Jun 2019 09:28:05 +0000 (UTC)
Date: Wed, 19 Jun 2019 05:28:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/7] powerpc/ftrace: Update ftrace_location() for
 powerpc -mprofile-kernel
Message-ID: <20190619052800.434ff6f0@oasis.local.home>
In-Reply-To: <1560930937.j2vguryjp3.naveen@linux.ibm.com>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <186656540d3e6225abd98374e791a13d10d86fab.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <20190618114509.5b1acbe5@gandalf.local.home>
 <1560881411.p0i6a1dkwk.naveen@linux.ibm.com>
 <1560881840.vz9llflvnf.naveen@linux.ibm.com>
 <20190618143234.78539805@gandalf.local.home>
 <1560930937.j2vguryjp3.naveen@linux.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 19 Jun 2019 13:26:37 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> > In include/ftrace.h:
> > 
> > #ifndef FTRACE_IP_EXTENSION
> > # define FTRACE_IP_EXTENSION	0
> > #endif
> > 
> > 
> > In arch/powerpc/include/asm/ftrace.h
> > 
> > #define FTRACE_IP_EXTENSION	MCOUNT_INSN_SIZE
> > 
> > 
> > Then we can just have:
> > 
> > unsigned long ftrace_location(unsigned long ip)
> > {
> > 	return ftrace_location_range(ip, ip + FTRACE_IP_EXTENSION);
> > }  
> 
> Thanks, that's indeed nice. I hope you don't mind me adding your SOB for 
> that.

Actually, it's best not to put a SOB by anyone other than yourself. It
actually has legal meaning.

In this case, please add:

Suggested-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks!

-- Steve
