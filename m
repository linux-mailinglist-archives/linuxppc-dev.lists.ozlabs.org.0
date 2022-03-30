Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF47E4EB82F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 04:06:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSqXy6T7bz302c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 13:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=x/co=uj=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSqXW71kqz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 13:05:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4FDE8613E2;
 Wed, 30 Mar 2022 02:05:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D11FC340ED;
 Wed, 30 Mar 2022 02:05:13 +0000 (UTC)
Date: Tue, 29 Mar 2022 22:05:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] MAINTAINERS: Enlarge coverage of TRACING inside
 architectures
Message-ID: <20220329220511.62977a6c@gandalf.local.home>
In-Reply-To: <e8338c0ad0e73991cbd8f31c215b16ea4efe212d.1648189904.git.christophe.leroy@csgroup.eu>
References: <e8338c0ad0e73991cbd8f31c215b16ea4efe212d.1648189904.git.christophe.leroy@csgroup.eu>
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
Cc: Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Mar 2022 07:32:21 +0100
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Most architectures have ftrace related stuff in arch/*/kernel/ftrace.c
> but powerpc has it spread in multiple files located in
> arch/powerpc/kernel/trace/
> In several architectures, there are also additional files containing
> 'ftrace' as part of the name but with some prefix or suffix.

Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve
