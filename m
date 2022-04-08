Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5743D4F8BDE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 03:43:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZLcs3Bq7z2ypP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 11:43:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OZIjTu/W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=khno=us=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OZIjTu/W; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZLcC47Klz2yHB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 11:43:07 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5C5A2B8299C;
 Fri,  8 Apr 2022 01:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0271EC385A0;
 Fri,  8 Apr 2022 01:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649382182;
 bh=HKAa0zZ+YfScnYiwonuO4THcQaAZWiT7gougIGWPYSU=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=OZIjTu/W8oyNhG7ciPLsXIUYQr/zfuV1qyJvoXYCBH3Iv2heRTzrYvwKHurqFC/Ic
 eiXcKvcIuW+bqpYF2Gj5Kd5uKV8Mr2Xi87W0EP6r99NzpgMLXepBi7R0zNR29MshIU
 Qi80nBKgY+DPm15BkU4VXJb6u1hzU7pArGFCOtyFLaG5NojJBDRAyNAA01crWhzeHz
 bDP99uvYWL0mKb5STI4F5A4kWNGrTo/1t6jHhC2UFGB8Kzy/8kkRgSlNEpMlDcthRm
 zgU1z9Y4jT5vfdD/QXMlLIBio9n0SbMMWK7KaaTgweIzhiyUdZLmomahQ2mzpBj26n
 CI0WVfmDKoUcA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 9E7F65C04BE; Thu,  7 Apr 2022 18:43:01 -0700 (PDT)
Date: Thu, 7 Apr 2022 18:43:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220408014301.GW4285@paulmck-ThinkPad-P17-Gen-1>
References: <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
 <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
 <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72k7BWjOU8=-dXD4bYWbK1i+rjDNaAohGrU42yJzcBm7uQ@mail.gmail.com>
 <20220407175500.GV4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2yDe3dU0DtigvAE4CQLAipvT81Bw4LrF5WjLSiP5nq1UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2yDe3dU0DtigvAE4CQLAipvT81Bw4LrF5WjLSiP5nq1UA@mail.gmail.com>
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
Cc: rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 08, 2022 at 07:14:20AM +0800, Zhouyi Zhou wrote:
> Dear Paul and Miguel
> 
> On Fri, Apr 8, 2022 at 1:55 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Thu, Apr 07, 2022 at 07:05:58PM +0200, Miguel Ojeda wrote:
> > > On Thu, Apr 7, 2022 at 5:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> > > >
> > > > Ah.  So you would instead look for boot to have completed within 10
> > > > seconds?  Either way, reliable automation might well more important than
> > > > reduction in time.
> > >
> > > No (although I guess that could be an option), I was only pointing out
> > > that when no stall is produced, the run should be much quicker than 30
> > > seconds (at least it was in my setup), which would be the majority of the runs.
> >
> > Ah, thank you for the clarification!
> Thank both of you for the information. In my setup (PPC cloud VM), the
> majority of the runs complete at least for 50 seconds. From last
> evening to this morning (Beijing Time), following experiments have
> been done:
> 1) torture mainline: the test quickly finished by hitting "rcu_sched
> self-detected stall" after 12 runs
> 2) torture v5.17: the test last 10 hours plus 14 minutes, 702 runs
> have been done without trigger the bug
> 
> Conclusion:
> There must be a commit that causes the bug as Paul has pointed out.
> I am going to do the bisect, and estimate to locate the bug within a
> week (at most).
> This is a good learning experience, thanks for the guidance ;-)

Very good, and looking forward to seeing what you find.

							Thanx, Paul
