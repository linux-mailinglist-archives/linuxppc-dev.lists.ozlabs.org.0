Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC1100D2A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Nov 2019 21:31:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47H0wN2Vv5zDqRw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 07:31:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47H0tC3TnBzDqcL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 07:29:23 +1100 (AEDT)
Received: from p5b06da22.dip0.t-ipconnect.de ([91.6.218.34] helo=nanos)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1iWncA-0004H1-Vg; Mon, 18 Nov 2019 21:27:15 +0100
Date: Mon, 18 Nov 2019 21:27:12 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Qais Yousef <qais.yousef@arm.com>
Subject: Re: [PATCH 00/12] Convert cpu_up/down to device_online/offline
In-Reply-To: <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
Message-ID: <alpine.DEB.2.21.1911182126260.27603@nanos.tec.linutronix.de>
References: <20191030153837.18107-1-qais.yousef@arm.com>
 <20191118160456.emdpzbhse2jxliqo@e107158-lin.cambridge.arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
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
 Catalin Marinas <catalin.marinas@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Richard Fontana <rfontana@redhat.com>, Nadav Amit <namit@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eiichi Tsukata <devel@etsukata.com>, xen-devel@lists.xenproject.org,
 Fenghua Yu <fenghua.yu@intel.com>, Juergen Gross <jgross@suse.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, Steve Capper <steve.capper@arm.com>,
 Jiri Kosina <jkosina@suse.cz>, linuxppc-dev@lists.ozlabs.org,
 Zhenzhong Duan <zhenzhong.duan@oracle.com>, Armijn Hemel <armijn@tjaldur.nl>,
 James Morse <james.morse@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 18 Nov 2019, Qais Yousef wrote:
> I had to make an educated guess that you're probably the 'maintainer' of cpu
> hotplug - but there's no explicit entry that says that. Please let me know if
> I need to bring the attention of others too.

:)
 
> The series do have few rough edges to address, but it's relatively
> straightforward and I think does offer a nice improvement in the form of
> consolidating the API for bringing up/down cpus from external
> subsystems/drivers. Beside fix the inconsistency of device's core view of the
> state of the cpu which can happen when cpu_{up/down} are called directly.
> 
> The downside I see is that the external API to bring cpus up/down for
> suspend/resume and at boot seem to have grown a bit organically (I've added
> a couple in this series to address 2 direct users of cpu_{up,down}). We might
> need to rethink this API, but I think this is outside the scope of this series.
> 
> Any thoughts/feedback would be appreciated.

Let me have a look.
