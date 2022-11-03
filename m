Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5262B61834F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 16:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N37cl1Ykdz3ccv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 02:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=Q/42eQoM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=Q/42eQoM;
	dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N37br1M76z3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 02:54:16 +1100 (AEDT)
Received: from zn.tnic (p200300ea9733e7e7329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:9733:e7e7:329c:23ff:fea6:a903])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9076F1EC0559;
	Thu,  3 Nov 2022 16:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1667490853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=rA76MiReFYdyzzFnwVP8TI+Yl5vD+IAy50wE2e/pB5o=;
	b=Q/42eQoMNEpt6v+yMF7SaTCBQyI5cOTWZsxTCcL6g3/hzbNlTitjCnWQ88xqkhu/FWRymK
	Yb1zoedOXZSjiEJ4AC2A3WoEtNnflcCGCJIWEEJYCYhIhHV/xToo/DQ+YOqFZtP5ofOS+H
	YnzBPdUv7j4yAJ9/0NbUyRp3pBDX/x4=
Date: Thu, 3 Nov 2022 16:54:09 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 2/2] x86: Fix /proc/cpuinfo cpumask warning
Message-ID: <Y2PkIUZDS8/qMRWq@zn.tnic>
References: <Y1vvMlwf/4EA/8WW@zn.tnic>
 <CAAH8bW_DkvPCH0-q2Bfe0OJ72r63mRM3GP7NKOFrhe3zMO2gbQ@mail.gmail.com>
 <Y1v+Ed6mRN9gisJS@zn.tnic>
 <20221031080604.6xei6c4e3ckhsvmy@kamzik>
 <Y1+OUawGJDjh4DOJ@zn.tnic>
 <20221031100327.r7tswmpszvs5ot5n@kamzik>
 <Y2K6clNJBn0SbWU+@zn.tnic>
 <20221103125945.lrr5oxxmylwpam53@kamzik>
 <Y2PX9GfxWYh6+XGT@zn.tnic>
 <20221103153404.uh77nrdkowrxj6cr@kamzik>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221103153404.uh77nrdkowrxj6cr@kamzik>
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
Cc: Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Vasily Gorbik <gor@linux.ibm.com>, Yury Norov <yury.norov@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, openrisc@lists.librecores.org, Ingo Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Albert Ou <aou@eecs.berkeley.edu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 04:34:04PM +0100, Andrew Jones wrote:
> Indeed, but that's less of an issue with cpumask_next() than with
> the way cpuinfo implements its start and next seq ops (next
> unconditionally increments *pos and then calls start and start
> must use *pos - 1 since the first time its called it needs to use
> -1).

Maybe because those are done wrongly...

A ->next() function should not call the ->start() function. A ->start()
function should, well, only start and nothing else.

And a ->stop() function should maybe check *pos and say whether one
should stop or not.

But I haven't looked at seq_ops at least in a decade and I have no clue
whether that would work.

I'm just looking at the function pointers and am trying to spell out
what looks most natural IMO.

IOW, maybe this should be fixed "right" and not only "made to work".

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
