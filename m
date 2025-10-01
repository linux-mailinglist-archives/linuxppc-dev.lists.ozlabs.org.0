Return-Path: <linuxppc-dev+bounces-12628-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE96BB0A6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 01 Oct 2025 16:09:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ccGyS2mBbz3cfB;
	Thu,  2 Oct 2025 00:09:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759327776;
	cv=none; b=LfPsEcxc9s3StorDQqhX94F2jN7lDbf09XOrw+wvbWiwnIxBdZG7RJSZC/QxQZZkMcYpGXL7kfZ9VdJn3e60nzeIG9x/oYp0xutTBiBFHwdCONqskvRBHhqsPQi57MJQB0y2YT3DEjAF/+mB2s5rmAEp6zlnyVlubGCFozI7IzGziDc90RKikRCzClqgt57kn7zFG+ONJyqkap+pghbC6YIaZAffjXZoRGdcSADzUHRxJr+8bsEqg0dBPd4UNHt1xFC8B/JEOEdgyT2Myc+LVMYIjMsv+220o5vE4dRMzlS7lXpxPFkWoGfy21h0RButXX+z7/c+sWvEPokyeGIvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759327776; c=relaxed/relaxed;
	bh=o6G+LZsta4oQo1jiBoxMS8IgkjltspgRUCCO28PqZGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJcWBfFJ2tYIDTRE8e4vr3iEVG36qCqXghJWuKMIu6FR22jzg2xZgelE7jKLAjXMECOlljHgXM6NIykpgo64rbdoaByngR3TldeY8ZC1owK4ljxN7YPddDLyyVHvMhNgqLBJ2ytuU0csAb1RRXaU0fc0BNyy05k00aOYYKfUBrw0pH3xN9noBS5x3HYFKzZ78ciAQdeDp7BS5bwUqEXh2Xv+MCFPyMob7xlvztEU5J6vlG6dwkjgLnMoRinr06CGmbPno2cVXhl4vy4kGoYi2JQNQIvHRff4wyh/HUOnF8D2PjSIqxQlKl2KcX82nySoOo2EATPL1UDq8wFa+Wk5yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxANNX2W; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxANNX2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ccGyQ6Hltz3cdn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Oct 2025 00:09:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D40C9604BE;
	Wed,  1 Oct 2025 14:09:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E725AC4CEF1;
	Wed,  1 Oct 2025 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759327770;
	bh=aV9Quhsd3bTsmyd1udOTUsvKepHnvhjVqiYvAtgBOjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lxANNX2WM64f+TmAOiA8AFpsl+rn/cPn3Wwc+0N74w+bEqSKjvIbvhHEoyBryEiU+
	 a9lafN6lol0p4dZY8oCruGHsYFjc0bQg6fJIkrx+IbtqR6I9VA3NYT+Nru97KlYfbW
	 livQCBloAMGyrbobKZ2i1rbWpJW57UxS+i1LxMaSfE88P2r8FZZs43uasDF9eIjsgg
	 Td/FpX0KWotz3tUWb/sOeKLl5KcYNGKZdofMEMHMx8MYQ0xnLp+67CFncqH4ATamp/
	 NIy4lZ5Bp0rffyLORR6/YQN+XIb32EMpEV9UIwWMja/UiP1Q8UJIzsI5boHm/pD/fE
	 q4xTpQtvC74wA==
Date: Wed, 1 Oct 2025 11:09:27 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	hbathini@linux.vnet.ibm.com, Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Tejas Manhas <Tejas.Manhas1@ibm.com>
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
Message-ID: <aN02F61OLv6Tx_gB@x1>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
 <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
 <7EE7DD5B-6550-436B-A799-2B1DF293121E@gmail.com>
 <AB498516-CA5D-428C-B6FC-CC46A43E39AA@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AB498516-CA5D-428C-B6FC-CC46A43E39AA@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 26, 2025 at 10:23:56AM +0530, Athira Rajeev wrote:
> > On 25 Sep 2025, at 9:57 PM, Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com> wrote:
> > On September 25, 2025 6:21:19 PM GMT+02:00, Athira Rajeev <atrajeev@linux.ibm.com> wrote:
> >> Looking for further comments if any on this patchset.
> >> The kernel side patches for this feature which was sent as separate series is pulled to powerpc tree by Maddy
> >> 
> >> If the tools side changes looks good, can we have this merged to perf tools tree ?

> > Sure, I'll look at it soon now that the kernel part is merged.

> Sure, thanks Arnaldo 

Applied locally, build testing now.

- Arnaldo

