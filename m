Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71D1B76B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 15:14:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497vlR4CQLzDr88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 23:14:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497vh24J8SzDr76
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 23:11:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 497vh123j9z8sWS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 23:11:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 497vh11BpDz9sT0; Fri, 24 Apr 2020 23:11:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=19w6=6i=goodmis.org=rostedt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=goodmis.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 497vgy5DLgz9sSM
 for <linuxppc-dev@ozlabs.org>; Fri, 24 Apr 2020 23:11:26 +1000 (AEST)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47E6920728;
 Fri, 24 Apr 2020 13:11:23 +0000 (UTC)
Date: Fri, 24 Apr 2020 09:11:21 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 2/3] powerpc/lib: Initialize a temporary mm for code
 patching
Message-ID: <20200424091121.6999a428@gandalf.local.home>
In-Reply-To: <87mu7bhqu1.fsf@mpe.ellerman.id.au>
References: <20200323045205.20314-1-cmr@informatik.wtf>
 <20200323045205.20314-3-cmr@informatik.wtf>
 <ecccbeb2-731b-f9a3-1039-f2a662e3a9a5@c-s.fr>
 <1782990079.111623.1585624792778@privateemail.com>
 <8ff6d279-fdd9-4e4d-b4e0-f5c5cba480a4@c-s.fr>
 <87mu7bhqu1.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org, Christopher M Riedl <cmr@informatik.wtf>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 17 Apr 2020 10:57:10 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> >>> Does it needs to be a BUG_ON() ? Can't we fail gracefully with just a
> >>> WARN_ON ?
> >>>  
> >> 
> >> I'm not sure what failing gracefully means here? The main reason this could
> >> fail is if there is not enough memory to allocate the patching_mm. The
> >> previous implementation had this justification for BUG_ON():  
> >
> > But the system can continue running just fine after this failure.
> > Only the things that make use of code patching will fail (ftrace, kgdb, ...)  
> 
> That's probably true of ftrace, but we can't fail patching for jump
> labels (static keys).
> 
> See:
> 
> void arch_jump_label_transform(struct jump_entry *entry,
> 			       enum jump_label_type type)
> {
> 	u32 *addr = (u32 *)(unsigned long)entry->code;
> 
> 	if (type == JUMP_LABEL_JMP)
> 		patch_branch(addr, entry->target, 0);
> 	else
> 		patch_instruction(addr, PPC_INST_NOP);
> }

I would still error on a WARN_ON() as a lot of static keys should still
work if they don't get switched over.

If a user is concerned about something like this, they can always set
panic_on_warn.

-- Steve
