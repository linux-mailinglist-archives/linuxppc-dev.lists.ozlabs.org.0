Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57AD4F829B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 17:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZ4jL4xvQz3bdZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 01:16:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=b7AdTEGU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=cszx=ur=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=b7AdTEGU; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZ4hc4jFNz2yMS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 01:16:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C473561DD6;
 Thu,  7 Apr 2022 15:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025BBC385A0;
 Thu,  7 Apr 2022 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649344556;
 bh=zgcypSqcOjttw+NOmBx1xs+dR2yyEnA+Y3BOWHLvyQg=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=b7AdTEGUiOsYfaURI5xgXgpBRMlEDu/XqqCHGRYGQLlEJnQ2HcZ4jNAS7et+QhRui
 oJqBT1w3IB/PENacBAqj/hm337U60JTOWVvmvcYULxFIxMUapuv18NsrDA3Y80muwE
 yTPSIObBOyYIlTUim8dgGHhwU50dqc8aDhPrp5NlcMSXZAmTQF2R7tYS/ERO9zO1vT
 E5uyt5JWxB/Sc2aVUXIWeb0F5xsP5dl7Et83ftsQD4sN+mC3UpuJRRag7SsCxtDjdA
 S/UoGWuvhzpzvevLesnGY1A3yWPoorCbIWsVBUXsyqV8EIo5U6wwrKJ0Kwq+PPe1fq
 bJm3DYzh399dw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 14F165C0176; Thu,  7 Apr 2022 08:15:55 -0700 (PDT)
Date: Thu, 7 Apr 2022 08:15:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: rcu_sched self-detected stall on CPU
Message-ID: <20220407151555.GR4285@paulmck-ThinkPad-P17-Gen-1>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2zhZaN0+KqP7oMoyXTSkDhLjZwWvnj7coa1ZVve9M+jsQ@mail.gmail.com>
 <20220406195011.GP4285@paulmck-ThinkPad-P17-Gen-1>
 <CAABZP2x8_783jhEhC3AozH9=xj40UO-rZT2BRJsg5gaLdBz=9w@mail.gmail.com>
 <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mYXnQo_Y39k23rY-rdJay8GEPJ8MhU-y7-bjkw=zRC+Q@mail.gmail.com>
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

On Thu, Apr 07, 2022 at 12:07:34PM +0200, Miguel Ojeda wrote:
> On Thu, Apr 7, 2022 at 4:27 AM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> >
> > Yes, this happens within 30 seconds after kernel boot.  If we take all
> > into account (qemu preparing, kernel loading), we can do one test
> > within 54 seconds.
> 
> When it does not trigger, the run should be 20 seconds quicker than
> that (e.g. 10 seconds), since we don't wait for the stall timeout. I
> guess the timeout could also be reduced a fair bit to make failures
> quicker, but they do not contribute as much as the successes anyway.

Ah.  So you would instead look for boot to have completed within 10
seconds?  Either way, reliable automation might well more important than
reduction in time.

> Thanks a lot for running the bisect on that server, Zhouyi!

What Miguel said!

							Thanx, Paul
