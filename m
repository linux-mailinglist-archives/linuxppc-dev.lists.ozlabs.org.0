Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1224F14F2E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 20:40:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488SHJ3RjtzDqkC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 06:40:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488SFn3zv1zDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2020 06:38:53 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00VJcZbS006329;
 Fri, 31 Jan 2020 13:38:35 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00VJcXRI006321;
 Fri, 31 Jan 2020 13:38:33 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2020 13:38:33 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32s: Don't flush all TLBs when flushing one page
Message-ID: <20200131193833.GF22482@gate.crashing.org>
References: <e31c57eb5308a5a73a5c8232454c0dd9f65f6175.1580485014.git.christophe.leroy@c-s.fr>
 <20200131155150.GD22482@gate.crashing.org>
 <27cef66b-df5b-0baa-abac-5532e58bd055@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27cef66b-df5b-0baa-abac-5532e58bd055@c-s.fr>
User-Agent: Mutt/1.4.2.3i
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 31, 2020 at 05:15:20PM +0100, Christophe Leroy wrote:
> Le 31/01/2020 à 16:51, Segher Boessenkool a écrit :
> >On Fri, Jan 31, 2020 at 03:37:34PM +0000, Christophe Leroy wrote:
> >>When the range is a single page, do a page flush instead.
> >
> >>+	start &= PAGE_MASK;
> >>+	end = (end - 1) | ~PAGE_MASK;
> >>  	if (!Hash) {
> >>-		_tlbia();
> >>+		if (end - start == PAGE_SIZE)
> >>+			_tlbie(start);
> >>+		else
> >>+			_tlbia();
> >>  		return;
> >>  	}
> >
> >For just one page, you get  end - start == 0  actually?
> 
> Oops, good catch.
> 
> Indeed you don't get PAGE_SIZE but (PAGE_SIZE - 1) for just one page.

You have all low bits masked off in both start and end, so you get zero.
You could make the condion read "if (start == end)?

Maybe a nicer way to describe what you do is "if start and end are on the
same memory page, flush that page."


Segher
