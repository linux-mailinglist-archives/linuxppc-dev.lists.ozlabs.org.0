Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EBBA7493
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 22:24:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NJMg0vp7zDqnc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 06:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=iram.es
 (client-ip=130.206.19.177; helo=mx02.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
X-Greylist: delayed 638 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Sep 2019 06:22:46 AEST
Received: from mx02.puc.rediris.es (outbound4sev.lav.puc.rediris.es
 [130.206.19.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NJKf1SsTzDqm6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 06:22:45 +1000 (AEST)
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es
 [130.206.24.43])
 by mx02.puc.rediris.es  with ESMTP id x83KBN0J009423-x83KBN0L009423
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 3 Sep 2019 22:11:23 +0200
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 3AE24332E817;
 Tue,  3 Sep 2019 22:11:23 +0200 (CEST)
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 2A326332E818;
 Tue,  3 Sep 2019 22:11:23 +0200 (CEST)
Received: from lt-gp.iram.es (219.red-80-24-122.staticip.rima-tde.net
 [80.24.122.219])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPA id 5A9B4332E817;
 Tue,  3 Sep 2019 22:11:22 +0200 (CEST)
Date: Tue, 3 Sep 2019 22:11:21 +0200
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 3/6] powerpc: Convert flush_icache_range & friends to C
Message-ID: <20190903201121.GD3547@lt-gp.iram.es>
References: <20190903052407.16638-1-alastair@au1.ibm.com>
 <20190903052407.16638-4-alastair@au1.ibm.com>
 <20190903130430.GC31406@gate.crashing.org>
 <d268ee78-607e-5eb3-ed89-d5c07f672046@c-s.fr>
 <20190903160415.GA9749@gate.crashing.org>
 <321b003a-9633-5ff4-c4a2-59a47ec23421@c-s.fr>
 <20190903183157.GB9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190903183157.GB9749@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FEAS-CONTENT-MODIFICATION: 
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
 Nicholas Piggin <npiggin@gmail.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, alastair@d-silva.org, Qian Cai <cai@lca.pw>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 01:31:57PM -0500, Segher Boessenkool wrote:
> On Tue, Sep 03, 2019 at 07:05:19PM +0200, Christophe Leroy wrote:
> > Le 03/09/2019 à 18:04, Segher Boessenkool a écrit :
> > >(Why are they separate though?  It could just be one loop var).
> > 
> > Yes it could just be a single loop var, but in that case it would have 
> > to be reset at the start of the second loop, which means we would have 
> > to pass 'addr' for resetting the loop anyway,
> 
> Right, I noticed that after hitting send, as usual.
> 
> > so I opted to do it 
> > outside the inline asm by using to separate loop vars set to their 
> > starting value outside the inline asm.
> 
> The thing is, the way it is written now, it will get separate registers
> for each loop (with proper earlyclobbers added).  Not that that really
> matters of course, it just feels wrong :-)

After "mtmsr %3", it is always possible to copy %0 to %3 and use it as
an address register for the second loop. One register less to allocate
for the compiler. Constraints of course have to be adjusted.

	Gabriel
> 
> 
> Segher
