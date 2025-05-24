Return-Path: <linuxppc-dev+bounces-8925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73282AC30F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 May 2025 20:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4W6t2M5Hz2xJ8;
	Sun, 25 May 2025 04:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748112022;
	cv=none; b=HVesG5uMx9OhXzTqniTBvhQDJN5TOS/GQPK5u+VVW8hOTQHM3K0ZF4Jwv07XLfzv99WZT/zRPG5wJ9xJ46wKrkwEBJxE6xFDFHuB8oYeC4kFWDU8fAH3ZY8ASlx46ephqNITEZkUOGtjOVS/b1J7uSoCd/0ZdQsf/qLWrbvtnYXvrSLvDOrXiVygRMrS1LzS1Xy+6mPP1hVa9pPcPZ876h+f1CPXar97lJgzo6nSq+ik09Fvj+C5t1mFwXs1iuqnQxOrIhfahq/1R0fQ1IWapQpzI/ijJeellPYF8FuJ3VAwizVjqjrg1gTCqWdlPY8qujvkumgSOO2HLh+UwgS1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748112022; c=relaxed/relaxed;
	bh=G2jW8tpSOwaDI0VoFJf07PhcOYQqvUoBlo3Z0WssK0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxyiPK9lL7aa0Yvx7Pzqj/K95P8gv1u0S5txHmQLxvr+Awm6AP46PX6aHDO4aRkYGWViEymV4RfobcFlFNtujVG/jXrMn0zZII7TAcMuqzrzbtP1zW/xbuw4XalP5WG9vvfKAS7W1EGuazBORvcfHS7yisenGYjHgY0KVpzvdismZtQGURmVvfjIwZQ75QSxwk8qAt+2KfshdQlR3aMddSIjOcAwvfeNslZJffDdd2xclO43NZTNvtMTl3NM5Mrjbs4F1XQGtcaOKh2vbW9UygNVTBcRoxHwiQMKo1g7dMiNP8SJkruOvt3dLWTzIedeLuQSoeFrAU15Rqfvp0KupA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b4W6s0XY7z2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 May 2025 04:40:20 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 54OIYA0B026874;
	Sat, 24 May 2025 13:34:10 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 54OIY83Z026873;
	Sat, 24 May 2025 13:34:08 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Sat, 24 May 2025 13:34:08 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Paul Mackerras <paulus@ozlabs.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Crash in __do_IRQ with gcc 15
Message-ID: <20250524183408.GU30295@gate.crashing.org>
References: <aB6teOoVLWkdvyBu@bruin> <8bbd9fc6-8edf-46e4-952a-0a4da0a0660c@cs-soprasteria.com> <85ae2cb8-f594-46ac-87fd-2a53cdd7ef9e@app.fastmail.com> <233701f4-4d31-40b6-97d3-5abd8b9954ab@app.fastmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <233701f4-4d31-40b6-97d3-5abd8b9954ab@app.fastmail.com>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 04:05:05PM +0200, Arnd Bergmann wrote:
> On Tue, May 13, 2025, at 12:08, Arnd Bergmann wrote:
> > On Mon, May 12, 2025, at 20:13, LEROY Christophe wrote:
> >> Hi Arnd,
> >>
> >> Do you know when you will be able to add GCC 15 to 
> >> https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?
> >
> > I have to create a new build environment for gcc-15 after I lost
> > access to the machine I used for the earlier builds. I should
> > be able to do that within a few weeks, but unfortunately it's
> > a little more work than just rerunning my scripts (which I still
> > have).
> 
> I've uploaded gcc-15.1 binaries now. I've only tested the arm64,
> as usual, so please let me know if the powerpc and x86 hosted
> ones cause any problems.

As always: thank you!


Segher

