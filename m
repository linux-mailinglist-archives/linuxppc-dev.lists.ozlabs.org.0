Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9AD6DFCB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 19:27:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PxV5t21jyz3fRM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 03:27:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PxV5L5W57z3chn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 03:27:18 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7DEAC63282;
	Wed, 12 Apr 2023 17:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA85C433EF;
	Wed, 12 Apr 2023 17:27:11 +0000 (UTC)
Date: Wed, 12 Apr 2023 18:27:08 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Justin Forbes <jforbes@fedoraproject.org>
Subject: Re: [PATCH v3 02/14] arm64: drop ranges in definition of
 ARCH_FORCE_MAX_ORDER
Message-ID: <ZDbp7LAHES3YFo30@arm.com>
References: <20230325060828.2662773-1-rppt@kernel.org>
 <20230325060828.2662773-3-rppt@kernel.org>
 <CAFxkdAr5C7ggZ+WdvDbsfmwuXujT_z_x3qcUnhnCn-WrAurvgA@mail.gmail.com>
 <ZCvQGJzdED+An8an@kernel.org>
 <CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFbkSA38eTA_iJ3ttBvQ8G4Rjj8qB12GxY7Z=qmZ8wm+0tZieA@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 04, 2023 at 06:50:01AM -0500, Justin Forbes wrote:
> On Tue, Apr 4, 2023 at 2:22 AM Mike Rapoport <rppt@kernel.org> wrote:
> > On Wed, Mar 29, 2023 at 10:55:37AM -0500, Justin Forbes wrote:
> > > On Sat, Mar 25, 2023 at 1:09 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > >
> > > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > >
> > > > It is not a good idea to change fundamental parameters of core memory
> > > > management. Having predefined ranges suggests that the values within
> > > > those ranges are sensible, but one has to *really* understand
> > > > implications of changing MAX_ORDER before actually amending it and
> > > > ranges don't help here.
> > > >
> > > > Drop ranges in definition of ARCH_FORCE_MAX_ORDER and make its prompt
> > > > visible only if EXPERT=y
> > >
> > > I do not like suddenly hiding this behind EXPERT for a couple of
> > > reasons.  Most importantly, it will silently change the config for
> > > users building with an old kernel config.  If a user has for instance
> > > "13" set and building with 4K pages, as is the current configuration
> > > for Fedora and RHEL aarch64 builds, an oldconfig build will now set it
> > > to 10 with no indication that it is doing so.  And while I think that
> > > 10 is a fine default for many aarch64 users, there are valid reasons
> > > for choosing other values. Putting this behind expert makes it much
> > > less obvious that this is an option.
> >
> > That's the idea of EXPERT, no?
> >
> > This option was intended to allow allocation of huge pages for
> > architectures that had PMD_ORDER > MAX_ORDER and not to allow user to
> > select size of maximal physically contiguous allocation.
> >
> > Changes to MAX_ORDER fundamentally change the behaviour of core mm and
> > unless users *really* know what they are doing there is no reason to choose
> > non-default values so hiding this option behind EXPERT seems totally
> > appropriate to me.
> 
> It sounds nice in theory. In practice. EXPERT hides too much. When you
> flip expert, you expose over a 175ish new config options which are
> hidden behind EXPERT.  You don't have to know what you are doing just
> with the MAX_ORDER, but a whole bunch more as well.  If everyone were
> already running 10, this might be less of a problem. At least Fedora
> and RHEL are running 13 for 4K pages on aarch64. This was not some
> accidental choice, we had to carry a patch to even allow it for a
> while.  If this does go in as is, we will likely just carry a patch to
> remove the "if EXPERT", but that is a bit of a disservice to users who
> might be trying to debug something else upstream, bisecting upstream
> kernels or testing a patch.  In those cases, people tend to use
> pristine upstream sources without distro patches to verify, and they
> tend to use their existing configs. With this change, their MAX_ORDER
> will drop to 10 from 13 silently.   That can look like a different
> issue enough to ruin a bisect or have them give bad feedback on a
> patch because it introduces a "regression" which is not a regression
> at all, but a config change they couldn't see.

If we remove EXPERT (as prior to this patch), I'd rather keep the ranges
and avoid having to explain to people why some random MAX_ORDER doesn't
build (keeping the range would also make sense for randconfig, not sure
we got to any conclusion there).

-- 
Catalin
