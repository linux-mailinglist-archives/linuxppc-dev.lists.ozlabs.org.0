Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C719C778
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 18:59:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tTn60QQyzDrTf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 03:59:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=th+t=5s=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=J4YVuxmJ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tTl84g4wzDrSM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 03:57:40 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B277420737;
 Thu,  2 Apr 2020 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585846657;
 bh=X3PlfBlbIWLeP0CMCgHZC7mjUaCakvnwr6GNUHzqNcM=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=J4YVuxmJ6og07F0T/oP2MNLLaNO5WKhKFTnErKaZYhoAS/KPlPlGtkMRteYfzQT0a
 OY8qmQQqBdRXMD8fXMSSEB72DF62PW2I9oc9v8Rjf9qP4TtR1MycHOKYLqwMRakYMW
 i050cCPPsNykKhgYT4mE9Y+omVEAs6NhHLK7NQjY=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id 7FADD3521885; Thu,  2 Apr 2020 09:57:37 -0700 (PDT)
Date: Thu, 2 Apr 2020 09:57:37 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH v2] sched/core: fix illegal RCU from offline CPUs
Message-ID: <20200402165737.GQ19865@paulmck-ThinkPad-P72>
References: <20200402155406.GP19865@paulmck-ThinkPad-P72>
 <4134872A-3D1D-4860-9C1B-2FD9C00272BB@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4134872A-3D1D-4860-9C1B-2FD9C00272BB@lca.pw>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: paulmck@kernel.org
Cc: juri.lelli@redhat.com, "James.Bottomley@hansenpartnership.com"
 <James.Bottomley@hansenpartnership.com>, vincent.guittot@linaro.org,
 linux-parisc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 deller@gmx.de, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com,
 linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>, mgorman@suse.de,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 12:19:54PM -0400, Qian Cai wrote:
> 
> 
> > On Apr 2, 2020, at 11:54 AM, Paul E. McKenney <paulmck@kernel.org> wrote:
> > 
> > I do run this combination quite frequently, but only as part of
> > rcutorture, which might not be a representative workload.  For one thing,
> > it has a minimal userspace consisting only of a trivial init program.
> > I don't recall having ever seen this.  (I have seen one recent complaint
> > about an IPI being sent to an offline CPU, but I cannot prove that this
> > was not due to RCU bugs that I was chasing at the time.)
> 
> Yes, a trivial init is tough while running systemd should be able to catch it as it will use cgroup.

Not planning to add systemd to my rcutorture runs.  ;-)

							Thanx, Paul
