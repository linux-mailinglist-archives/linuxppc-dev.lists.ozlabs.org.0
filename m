Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 083A070DD64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 15:20:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQZgx0NrGz3f67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 23:20:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=q/om=bm=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQZgR6T2Kz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:20:19 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F54560B60;
	Tue, 23 May 2023 13:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46538C433EF;
	Tue, 23 May 2023 13:20:15 +0000 (UTC)
Date: Tue, 23 May 2023 09:20:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [RFC PATCH] powerpc/ftrace: Refactoring and support for
 -fpatchable-function-entry
Message-ID: <20230523092013.5a0b03d8@rorschach.local.home>
In-Reply-To: <1684606745.vlpj5zhydx.naveen@kernel.org>
References: <20230519192600.2593506-1-naveen@kernel.org>
	<3527b8d2-275e-29d8-fd3b-4002a4a901fd@csgroup.eu>
	<1684606745.vlpj5zhydx.naveen@kernel.org>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 20 May 2023 23:58:01 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> > 
> > At the begining of ftrace_replace_code(), don't you miss:
> > 
> > 	if (unlikely(ftrace_disabled))
> > 		return;  
> 
> ftrace_disabled is a static, so it can't be tested here. FWIW, x86 also 
> implements ftrace_replace_code(), and doesn't test ftrace_disabled.
> 
> Looking at the call path, it looks like it gets tested much before, so 
> may not be necessary. It sure would be good to get Steven's view on 
> this.

Yes, ftrace_disabled should not be used in arch code. It should be
caught before then.

Thanks,

-- Steve
