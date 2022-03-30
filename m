Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009EA4ECDC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 22:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTHqN63tpz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 07:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=x/co=uj=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTHq05zTPz2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 07:19:56 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CE93E615E7;
 Wed, 30 Mar 2022 20:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B13C340EC;
 Wed, 30 Mar 2022 20:19:51 +0000 (UTC)
Date: Wed, 30 Mar 2022 16:19:50 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] ftrace: Make ftrace_graph_is_dead() a static branch
Message-ID: <20220330161950.1d12d708@gandalf.local.home>
In-Reply-To: <8c65a6fb-cd93-926d-7851-0831658dd289@csgroup.eu>
References: <8628338322fa74287ca8d432d5c0c1964acd6f2a.1648195329.git.christophe.leroy@csgroup.eu>
 <20220329220733.682172ec@gandalf.local.home>
 <8c65a6fb-cd93-926d-7851-0831658dd289@csgroup.eu>
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
Cc: Ingo Molnar <mingo@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 30 Mar 2022 06:55:26 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> > Small nit. Please order the includes in "upside-down x-mas tree" fashion:
> > 
> > #include <linux/jump_label.h>
> > #include <linux/suspend.h>
> > #include <linux/ftrace.h>
> > #include <linux/slab.h>
> >   
> 
> That's the first time I get such a request. Usually people request 
> #includes to be in alphabetical order so when I see a file that has 
> headers in alphabetical order I try to not break it, but here that was 
> not the case so I put it at the end of the list.

This is something that Ingo Molnar started back in 2009 or so. And I do
find it easier on the eyes ;-)  I may be the only one today trying to keep
it (albeit poorly).

It's not a hard requirement, but I find it makes the code look more like
art, which it is :-D

> 
> I'll send v3

Thanks,

-- Steve
