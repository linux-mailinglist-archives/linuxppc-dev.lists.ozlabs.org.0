Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC6551A830
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 19:07:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtjtW2YmBz3brL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 03:07:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=srs0=qyz8=vm=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktjt55TwVz2yJQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 03:06:53 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DB64B827A2;
 Wed,  4 May 2022 17:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65FFC385B4;
 Wed,  4 May 2022 17:06:48 +0000 (UTC)
Date: Wed, 4 May 2022 13:06:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Message-ID: <20220504130642.7b9a301d@rorschach.local.home>
In-Reply-To: <72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
 <20220428100602.7b215e52@gandalf.local.home>
 <819939e3-285b-2a65-9c4c-85640d2a3a02@csgroup.eu>
 <20220502195251.5d862365@rorschach.local.home>
 <6d5ff91a-560e-56ea-0047-175f712872c2@csgroup.eu>
 <20220503122533.6033647e@rorschach.local.home>
 <72d17597-874c-f3a3-9398-0cc944350c5b@csgroup.eu>
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

On Wed, 4 May 2022 16:50:58 +0000
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> In vmlinux, relocations are resolved, trampolines are installed for 
> unreachable destinations and you don't anymore have a section with all 
> the relocations to mcount. It means 'recordmcount' or whatever tool we 
> use will have to read the code to find all direct calls to mcount, then 
> find all trampolines to mcount then find all calls to those trampolines.

OK, so what you are saying is that in the object file, we can see the
site that calls mcount, but when it is linked, it may not call mcount,
but instead it will call a trampoline that will call mcount, thus the
tool will need to find these calls to the trampolines that call mcount
as well as the locations that call mcount directly.

Did I get that right?

-- Steve
