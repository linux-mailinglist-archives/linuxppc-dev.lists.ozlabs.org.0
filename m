Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 668034F86B0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 19:55:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ8Dq34G4z3bk9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 03:55:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Eg6eeKS5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org;
 envelope-from=srs0=cszx=ur=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Eg6eeKS5; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ8D95dj1z2yZZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 03:55:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ECEB561650;
 Thu,  7 Apr 2022 17:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C03C385A4;
 Thu,  7 Apr 2022 17:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649354101;
 bh=NjqPIHsoPThEmFMj3pqLnI9A1ClWJ6kDy569ZQ6WmFI=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=Eg6eeKS57vUMS8c9cB1S0SCjMUvA8KuurAmnbiRc84hnqg8KA2iLIuA+bCcEJaVRI
 rukTsvuq8FbOg4244AzGK/xzr1o2tZ7pQGW2750YB/sGx/9udWx9FsAISIgGVn+X+m
 Ka31B6Kfrxr7iggzTVjnP94a2gcCOOoa+iu6Ni3ChRpQMKKv3r4/JBQROIGBsC/SSK
 Tb846uJxPF21w/TNaOR2MZa07u56X6Y4dPIgrQS2zQu+IGFVhM/PGq6xl2j+W7XEGe
 Zc4p7spe8DxFaiVkhWEE5Ewy7nfB1PK02XyiCxAlUWHceV5AT13bxlIauHlikz4+qt
 FbndlCopC4Jgw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id DF5955C3267; Thu,  7 Apr 2022 10:55:00 -0700 (PDT)
Date: Thu, 7 Apr 2022 10:55:00 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220407175500.GV4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
 <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
 <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
 <CANiq72k7BWjOU8=-dXD4bYWbK1i+rjDNaAohGrU42yJzcBm7uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72k7BWjOU8=-dXD4bYWbK1i+rjDNaAohGrU42yJzcBm7uQ@mail.gmail.com>
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
Cc: rcu <rcu@vger.kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 07, 2022 at 07:05:58PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 7, 2022 at 5:15 PM Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > Ah.  So you would instead look for boot to have completed within 10
> > seconds?  Either way, reliable automation might well more important than
> > reduction in time.
> 
> No (although I guess that could be an option), I was only pointing out
> that when no stall is produced, the run should be much quicker than 30
> seconds (at least it was in my setup), which would be the majority of the runs.

Ah, thank you for the clarification!

							Thanx, Paul
