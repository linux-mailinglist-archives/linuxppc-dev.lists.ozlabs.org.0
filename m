Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7C951363F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 16:06:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpy8h2MfQz3bcG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 00:06:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=ytzr=vg=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpy8G5kTQz2yNG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 00:06:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC14561D7C;
 Thu, 28 Apr 2022 14:06:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9269C385A9;
 Thu, 28 Apr 2022 14:06:03 +0000 (UTC)
Date: Thu, 28 Apr 2022 10:06:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/2] recordmcount: Handle sections with no non-weak symbols
Message-ID: <20220428100602.7b215e52@gandalf.local.home>
In-Reply-To: <1651129169.fpixr00hgx.naveen@linux.ibm.com>
References: <cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <1b9566f0e7185fb8fd8ef2535add7a081501ccc8.1651047542.git.naveen.n.rao@linux.vnet.ibm.com>
 <20220427095415.594e5120@gandalf.local.home>
 <1651129169.fpixr00hgx.naveen@linux.ibm.com>
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

On Thu, 28 Apr 2022 13:15:22 +0530
"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> wrote:

> Indeed, plain old -pg will be a problem. I'm not sure there is a generic 
> way to address this. I suppose architectures will have to validate the 
> mcount locations, something like this?

Perhaps another solution is to make the mcount locations after the linking
is done. The main downside to that is that it takes time to go over the
entire vmlinux, and will slow down a compile that only modified a couple of
files.

-- Steve
