Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C802B1008E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 17:07:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Gv3j6WbvzDqTh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 03:07:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=qais.yousef@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Gv1K0M2SzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 03:05:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA4C0DA7;
 Mon, 18 Nov 2019 08:05:05 -0800 (PST)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EA623F703;
 Mon, 18 Nov 2019 08:04:59 -0800 (PST)
Date: Mon, 18 Nov 2019 16:04:56 +0000
From: Qais Yousef <qais.yousef@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/12] Convert cpu_up/down to device_online/offline
Message-ID: <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
References: <20191030153837.18107-1-qais.yousef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191030153837.18107-1-qais.yousef@arm.com>
User-Agent: NeoMutt/20171215
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
Cc: Mark Rutland <mark.rutland@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Fontana <rfontana@redhat.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eiichi Tsukata <devel@etsukata.com>, Catalin Marinas <catalin.marinas@arm.com>,
 xen-devel@lists.xenproject.org, Fenghua Yu <fenghua.yu@intel.com>,
 Juergen Gross <jgross@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Steve Capper <steve.capper@arm.com>,
 Jiri Kosina <jkosina@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, Armijn Hemel <armijn@tjaldur.nl>,
 James Morse <james.morse@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thomas

On 10/30/19 15:38, Qais Yousef wrote:
> Using cpu_up/down directly to bring cpus online/offline loses synchronization
> with sysfs and could suffer from a race similar to what is described in
> commit a6717c01ddc2 ("powerpc/rtas: use device model APIs and serialization
> during LPM").
> 
> cpu_up/down seem to be more of a internal implementation detail for the cpu
> subsystem to use to boot up cpus, perform suspend/resume and low level hotplug
> operations. Users outside of the cpu subsystem would be better using the device
> core API to bring a cpu online/offline which is the interface used to hotplug
> memory and other system devices.
> 
> Several users have already migrated to use the device core API, this series
> converts the remaining users and hides cpu_up/down from internal users at the
> end.
> 
> I still need to update the documentation to remove references to cpu_up/down
> and advocate for device_online/offline instead if this series will make its way
> through.
> 
> I noticed this problem while working on a hack to disable offlining
> a particular CPU but noticed that setting the offline_disabled attribute in the
> device struct isn't enough because users can easily bypass the device core.
> While my hack isn't a valid use case but it did highlight the inconsistency in
> the way cpus are being onlined/offlined and this attempt hopefully improves on
> this.
> 
> The first 6 patches fixes arch users.
> 
> The next 5 patches fixes generic code users. Particularly creating a new
> special exported API for the device core to use instead of cpu_up/down.
> Maybe we can do something more restrictive than that.
> 
> The last patch removes cpu_up/down from cpu.h and unexport the functions.
> 
> In some cases where the use of cpu_up/down seemed legitimate, I encapsulated
> the logic in a higher level - special purposed function; and converted the code
> to use that instead.
> 
> I did run the rcu torture, lock torture and psci checker tests and no problem
> was noticed. I did perform build tests on all arch affected except for parisc.
> 
> Hopefully I got the CC list right for all the patches. Apologies in advance if
> some people were omitted from some patches but they should have been CCed.

I had to make an educated guess that you're probably the 'maintainer' of cpu
hotplug - but there's no explicit entry that says that. Please let me know if
I need to bring the attention of others too.

The series do have few rough edges to address, but it's relatively
straightforward and I think does offer a nice improvement in the form of
consolidating the API for bringing up/down cpus from external
subsystems/drivers. Beside fix the inconsistency of device's core view of the
state of the cpu which can happen when cpu_{up/down} are called directly.

The downside I see is that the external API to bring cpus up/down for
suspend/resume and at boot seem to have grown a bit organically (I've added
a couple in this series to address 2 direct users of cpu_{up,down}). We might
need to rethink this API, but I think this is outside the scope of this series.

Any thoughts/feedback would be appreciated.

Thanks

--
Qais Yousef
