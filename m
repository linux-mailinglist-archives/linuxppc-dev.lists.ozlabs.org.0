Return-Path: <linuxppc-dev+bounces-2670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A439B4100
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2024 04:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcwgJ5syvz2xrC;
	Tue, 29 Oct 2024 14:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730172460;
	cv=none; b=ZAEIQKVKZOtO8dz6g3jB1r96XZdPaPBVxE789O+U8soBwnCNP/5IhdMAurgo5p65ST4oh6ZWJik+m/TBKq7O8lUtlIRruPDA5fy8I1D77ccqo8Ioz7NlRFiBc8iEHsjR3njErlC1dnLFLygyfAe+0uhErlJ1ab06VtXKRvD2UZHMSr+Y3b8rHukdSRXsHtOkeSj1ACRM/YSJqZHU44HQtQt9efo5kC5pIberOmq7IgMSX2Wc9vyYQESfiQ3G4JI/HshEhCmvOGFsm1ewUaZVxdWWk5+smyquTV0Q35kX8qVgN1djB+eRGYeISgKvviMeZh/56E8ULWcYEZwGzsgTbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730172460; c=relaxed/relaxed;
	bh=7Bpc03ix1QsFVsWC3ARzoTg2LTxnM2a7Pv3JVWH6wko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/vcBJ4Rd0u7htqfOZ77W6els4RhGgUdKLYoXRz1BngomBFqifLGbSVkuo8ReN5NUDDP/3IykIP6/UIfHAQZj2hDNLOov3IuJqP11EagPLi6kfu+XEq0dkEm9f3oncpQpSQOOR6+s/9wbS4yJKr2jZ1BGNG8E9DDcws3kvxK3/5fRIH8AhT/AQbcmtgNOtT/o5XlF2Bb1ZAXCYYyx3BK/esRKEPx5DXXEV0IaZ9qcYlYw3uwIyXjkYJ8oN7TkYAI6XFO/gj+W+aNHNPxpfy7LwtzvaSS/O1BP13hXhtDzFSQDD8SoMqn3cJyuViNURewksqb1c9MaOwC50kOSrX2Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tKqwQsWK; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tKqwQsWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcwgH6DR8z2xBf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2024 14:27:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC2675C584F;
	Tue, 29 Oct 2024 03:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5F1C4CECD;
	Tue, 29 Oct 2024 03:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730172457;
	bh=mmgwq8y3H0kMOzRaYgyB6yY10fO8ugLNPAT4h3PEtek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tKqwQsWK8xbZYGTRWXUkQED0JusaOi4QrZEdimc93gx83rU0tjHZvEgZ5V87w4c86
	 XiCkpIScVa5jRj0wUc2kfckBINapFTMSWyRk2+5X3bXrdBm+KkaNdKvgwqBUezifI+
	 sr2mUaQk/OTI++5xcVYC9U6Tz4iEIf4NcSFGna4A2+oz1vd4ciRWqE+xJkE1n8RW3j
	 0O3YTYbTPP18CQcj6UySqY5/ER7PZ+1h/duYfCP2WjKuDyXBD63jaWb0HR2Mi4ufTP
	 eT4y9G52GAOSohCYt7OZw/aum6LJncFJhQBVA/DgSi/BCotLJES/D5MIyQFIO469ca
	 PqTDGfz47RZkQ==
Date: Mon, 28 Oct 2024 20:27:35 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A . Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Message-ID: <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Oct 28, 2024 at 06:56:15PM -0700, Josh Poimboeuf wrote:
> The barrier_nospec() in 64-bit __get_user() is slow.  Instead use
> pointer masking to force the user pointer to all 1's if a previous
> access_ok() mispredicted true for an invalid address.

Linus pointed out that __get_user() may be used by some code to access
both kernel and user space and in fact I found one such usage in
vc_read_mem()....

So I self-NAK this patch for now.

Still, it would be great if patch 1 could get merged as that gives a
significant performance boost.

-- 
Josh

