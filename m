Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43426F1CD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 18:51:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Yxh0lrhzF4hJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 04:51:36 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 477YvM2w4yzF4ft
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 04:49:32 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id xA6Hn9SQ005721;
 Wed, 6 Nov 2019 11:49:09 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id xA6Hn792005718;
 Wed, 6 Nov 2019 11:49:07 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 6 Nov 2019 11:49:07 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 1/6] powerpc: Allow flush_icache_range to work across
 ranges >4GB
Message-ID: <20191106174907.GR16031@gate.crashing.org>
References: <20191104023305.9581-1-alastair@au1.ibm.com>
 <20191104023305.9581-2-alastair@au1.ibm.com>
 <20191104194357.GE16031@gate.crashing.org>
 <74435ba6-51dc-1dff-b55b-cdcf85e2e302@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74435ba6-51dc-1dff-b55b-cdcf85e2e302@c-s.fr>
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
Cc: Alastair D'Silva <alastair@au1.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>, alastair@d-silva.org,
 Qian Cai <cai@lca.pw>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 05, 2019 at 07:04:04AM +0100, Christophe Leroy wrote:
> Le 04/11/2019 à 20:43, Segher Boessenkool a écrit :
> >Please send this separately, to be committed right now?  It is a bug fix,
> >independent of the rest of the series.
> 
> Patch 4/6 needs it, as it drops the function.
> 
> Or do you mean that the series should drop the assembly at once, and 
> this patch should only go into stable ?

I meant that you can say these patches (yes, 2/ as well) are bug fixes,
independent of the rest, and they can be picked up immediately, there
is no need to wait for v18 of this series.

> But I guess mpe can take this patch alone if he wants to ?

Yeah, but you can help him do that ;-)


Segher
