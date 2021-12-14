Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A8547443E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 15:02:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD0SC4WDJz3cQp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=l0ty=q7=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD0Rq0gSzz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 01:01:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE54A61505;
 Tue, 14 Dec 2021 14:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC22CC34601;
 Tue, 14 Dec 2021 14:01:49 +0000 (UTC)
Date: Tue, 14 Dec 2021 09:01:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 0/5] Implement livepatch on PPC32
Message-ID: <20211214090148.264f4660@gandalf.local.home>
In-Reply-To: <aac75717-a3ac-c0b4-3e79-dc6eb9c26d8c@csgroup.eu>
References: <cover.1635423081.git.christophe.leroy@csgroup.eu>
 <20211028093547.48c69dfe@gandalf.local.home>
 <6209682d-0caa-b779-8763-376a984d8ed8@csgroup.eu>
 <20211213121536.25e5488d@gandalf.local.home>
 <5511f43c-192a-622b-7c72-52e07f0032c2@csgroup.eu>
 <20211213123338.65eda5a0@gandalf.local.home>
 <fc3099b8-9f12-3e47-08a0-05abc37a0482@csgroup.eu>
 <20211213135410.12642d8f@gandalf.local.home>
 <8df90f94-9939-0178-b92b-6ae6ea81784c@csgroup.eu>
 <20211213144603.47d7c908@gandalf.local.home>
 <76ce2dd7-691e-df73-727c-110713c07cda@csgroup.eu>
 <aac75717-a3ac-c0b4-3e79-dc6eb9c26d8c@csgroup.eu>
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>, "Naveen
 N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Dec 2021 08:35:14 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > Will continue investigating.
> >   
> 
> trace_selftest_startup_function_graph() calls register_ftrace_direct() 
> which returns -ENOSUPP because powerpc doesn't select 
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS.
> 
> Should TEST_DIRECT_TRAMP depend on CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS ?

Yes, that should be:

#if defined(CONFIG_DYNAMIC_FTRACE) && \
    defined(CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS)
#define TEST_DIRECT_TRAMP
noinline __noclone static void trace_direct_tramp(void) { }
#endif


And make it test it with or without the args.

Thanks for finding this.

-- Steve
