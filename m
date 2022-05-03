Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7CE5189D5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 18:26:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kt51T4RBdz3c7S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 02:26:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=7baa=vl=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kt51521dWz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 02:25:45 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 97569616E7;
 Tue,  3 May 2022 16:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF69C385A9;
 Tue,  3 May 2022 16:25:41 +0000 (UTC)
Date: Tue, 3 May 2022 12:25:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Message-ID: <20220503122533.6033647e@rorschach.local.home>
In-Reply-To: <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
 <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
 <20220502195251.5d862365@rorschach.local.home>
 <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 May 2022 11:20:22 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Maybe I misunderstood. When you say 'after linking', do you mean vmlinux 
> or vmlinux.o ?

Whichever ;-)

> 
> In vmlinux, the addresses to be saved in __mcount_loc table might not 
> contain anymore a call to _mcount but a call to a trampoline that jumps 
> to _mcount, in case _mcount is too far from the said location at link 
> time. That's what I meant.

But how is that different than what is done today? And at linking,
everything still calls mcount. It's not until runtime things change.

The point I'm talking about is that after linking, if the linker
removed unused code (which would include unused weak functions,
right?), then the calls to mcount that were in the weak functions would
be gone too, and they would not be added by recordmcount, and for those
that are still around, then using their symbols as the reference point
would also not be an issue.

The problem we have right now is that the only symbol we have is a weak
function to reference the mcount call location in the __mcount_loc
section. But if all the global entries are not used and the linker
removes them, then the references using those symbols in the
__mcount_loc section will be "undefined". After linking, everything in
the vmlinux(.o) is set, and we are free to use that as a reference
point for the call sites.

-- Steve
