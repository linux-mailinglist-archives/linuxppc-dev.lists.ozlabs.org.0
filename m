Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7B04ECA72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 19:18:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTCnr3lZ7z3c1L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 04:18:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KTCnK13Jnz2yb7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 04:18:12 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22UH7CgV004223;
 Wed, 30 Mar 2022 12:07:12 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 22UH76l5004220;
 Wed, 30 Mar 2022 12:07:06 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 30 Mar 2022 12:07:06 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.18-1 tag
Message-ID: <20220330170706.GV614@gate.crashing.org>
References: <87zglefhxd.fsf@mpe.ellerman.id.au>
 <CAHk-=whk4jihDM+zkhZPYRyNO0-YA1_-K9_NyC3EDsX+gkxC-w@mail.gmail.com>
 <87wngefnsu.fsf@mpe.ellerman.id.au> <20220330112733.GG163591@kunlun.suse.cz>
 <87k0cbfuf4.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87k0cbfuf4.fsf@mpe.ellerman.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, jniethe5@gmail.com,
 ganeshgr@linux.ibm.com, wangborong@cdjrlc.com,
 Jakob Koschel <jakobkoschel@gmail.com>, Miroslav Benes <mbenes@suse.cz>,
 hbh25y@gmail.com, mikey@neuling.org, Joe Lawrence <joe.lawrence@redhat.com>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 danielhb413@gmail.com, haren@linux.ibm.com,
 Wedson Almeida Filho <wedsonaf@google.com>,
 Corentin Labbe <clabbe@baylibre.com>, mamatha4@linux.vnet.ibm.com,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Thierry Reding <treding@nvidia.com>, kernel.noureddine@gmail.com,
 nathanl@linux.ibm.com, Paul Menzel <pmenzel@molgen.mpg.de>,
 YueHaibing <yuehaibing@huawei.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, guozhengkui@vivo.com, kjain@linux.ibm.com,
 chenjingwen6@huawei.com, Nick Piggin <npiggin@gmail.com>, oss@buserror.net,
 rmclure@linux.ibm.com, maddy@linux.ibm.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, psampat@linux.ibm.com,
 sachinp@linux.ibm.com, bigunclemax@gmail.com, ldufour@linux.ibm.com,
 hbathini@linux.ibm.com, Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>, farosas@linux.ibm.com,
 Geoff Levand <geoff@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anders Roxell <anders.roxell@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sourabhjain@linux.ibm.com, Julia Lawall <Julia.Lawall@inria.fr>,
 Ritesh Harjani <riteshh@linux.ibm.com>, cgel.zte@gmail.com,
 Vaibhav Jain <vaibhav@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tobias@waldekranz.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 31, 2022 at 12:21:03AM +1100, Michael Ellerman wrote:
> Michal Suchánek <msuchanek@suse.de> writes:
> > On Mon, Mar 28, 2022 at 08:07:13PM +1100, Michael Ellerman wrote:
> >> Linus Torvalds <torvalds@linux-foundation.org> writes:
> >> > On Fri, Mar 25, 2022 at 3:25 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> 
> >> > That said:
> >> >
> >> >> There's a series of commits cleaning up function descriptor handling,
> >> >
> >> > For some reason I also thought that powerpc had actually moved away
> >> > from function descriptors, so I'm clearly not keeping up with the
> >> > times.
> >> 
> >> No you're right, we have moved away from them, but not entirely.
> >> 
> >> Functions descriptors are still used for 64-bit big endian, but they're
> >> not used for 64-bit little endian, or 32-bit.
> >
> > There was a patch to use ABIv2 for ppc64 big endian. I suppose that
> > would rid usof the gunction descriptors for good.
> 
> It would be nice.
> 
> The hesitation in the past was that the GNU toolchain developers don't
> officially support BE+ELFv2, though it is in use so it does work.

We do not officially support ELFv2 BE because there are no significant
users, so we cannot have the same confidence it works correctly.

It isn't tested often with GCC for example, mainly because it isn't
convenient to do without pre-packaged user space for it (and on the
other hand, there isn't much demand for it).

> > Maybe it's worth resurrecting?
> 
> Yeah maybe we should think about it again. If it builds with clang/lld
> that would be a real plus.

With GCC it should work fine still.  But no doubt you will find some
edge cases...  which you won't find until you try :-)


Segher
