Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4172C6C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 16:00:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qftck0Gs6z30fh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 00:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qftc0631Fz2yQB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 23:59:58 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA4FB1FB;
	Mon, 12 Jun 2023 07:00:10 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.27.163])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB8E63F71E;
	Mon, 12 Jun 2023 06:59:20 -0700 (PDT)
Date: Mon, 12 Jun 2023 14:59:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 15/18] watchdog/perf: Add a weak function for an arch
 to detect if perf can use NMIs
Message-ID: <ZIckscgmirrgxZ75@FVFF77S0Q05N>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.15.Ic55cb6f90ef5967d8aaa2b503a4e67c753f64d3a@changeid>
 <ZIb0hd8djM+jJviF@FVFF77S0Q05N>
 <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WyLKygSsArCaSzid47Rz5=ozR6Yh9L6Q3JStpzF9Tn9w@mail.gmail.com>
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
Cc: Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, Catalin Marinas <catalin.marinas@arm.com>, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, kgdb-bugreport@lists.sourceforge.net, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.o
 rg, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 12, 2023 at 06:55:37AM -0700, Doug Anderson wrote:
> Mark,
> 
> On Mon, Jun 12, 2023 at 3:33 AM Mark Rutland <mark.rutland@arm.com> wrote:
> >
> > On Fri, May 19, 2023 at 10:18:39AM -0700, Douglas Anderson wrote:
> > > On arm64, NMI support needs to be detected at runtime. Add a weak
> > > function to the perf hardlockup detector so that an architecture can
> > > implement it to detect whether NMIs are available.
> > >
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > While I won't object to this patch landing, I consider it part of the
> > > arm64 perf hardlockup effort. I would be OK with the earlier patches
> > > in the series landing and then not landing ${SUBJECT} patch nor
> > > anything else later.
> >
> > FWIW, everything prior to this looks fine to me, so I reckon it'd be worth
> > splitting the series here and getting the buddy lockup detector in first, to
> > avoid a log-jam on all the subsequent NMI bits.
> 
> I think the whole series has already landed in Andrew's tree,
> including the arm64 "perf" lockup detector bits. I saw all the
> notifications from Andrew go through over the weekend that they were
> moved from an "unstable" branch to a "stable" one and I see them at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/log/?h=mm-nonmm-stable
> 
> When I first saw Anderw land the arm64 perf lockup detector bits in
> his unstable branch several weeks ago, I sent a private message to the
> arm64 maintainers (yourself included) to make sure you were aware of
> it and that it hadn't been caught in mail filters. I got the
> impression that everything was OK. Is that not the case?

Sorry; I'm slowly catching up with a backlog of email, and I'm just behind.

Feel free to ignore this; sorry for the noise!

If we spot anything going wrong in testing we can look at fixing those up.

Thanks,
Mark.
