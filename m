Return-Path: <linuxppc-dev+bounces-16384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBkXIV7SemlX+wEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 04:22:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D31AB67F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 04:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1kvr03rvz2yFl;
	Thu, 29 Jan 2026 14:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769656919;
	cv=none; b=QnBcl0D02Iv1wBPgheggZkDpwvJCs7v81rwHo3Ktozp6YoPNBrKE7xivEupO9dB80g8m52idmKl6xZ8EgckUTdRJ3NnHU5tZmcs+mBiVfAGM0khBkh0XuJM99wr6rpLwCJ/112L7ea4AEqldBDZUZUcuMnSkOALTJ2qUrFudr3vpC34Bd3dRT7uAep5/O2/eqkpkCJXHgDzFvjXmjsE6/lQQEX0MaoCamacKrDJvADcul1aBAVm69/QgsGBLAdkLM+Fzi2k6IzIL8Q0Ri7Bh6i9zvXLw8pCAE7p0L44XrqUDsGPlxTn7eRNUIJ7mJYMC5adiTi8R79PaqPvN+LhlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769656919; c=relaxed/relaxed;
	bh=BGsU9GobbaGgoU5iMsb2Tj/ECBvPozp242GaUSp9zUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+HcVZvNhnpIXdjOY+BtxjfUL921wmFG1hsFtBKj40iuJ0igNV7gI+EmJ98wo6/PqWoyE1Du6ihXvNBVGsSGjyRO4tsd2K/tObkF0RYPx9OiMuJsTrhbjS+PvY1/VFX4NZIqWSw4n8OClnhhakUAhxssbwaxH2rR6hbLC5jgAfj0osMY2PCH3mwPNw9NdTaoiDCFqFIi59PYM/9vsl1wGYmvd3cOuTn9K1n3iWN9ELAqdCwYMLftiYw2W3w2i0Yj0Brl23icttoUNtmAglTXrKBva2KnfjJBtU56XiuFW8hN2+fv3Xd7MGguz1HC8pCkr589KJkdPD5WM+3Iyd7JMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=eifTeQz9; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=eifTeQz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1kvp5bgdz2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 14:21:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=BGsU9GobbaGgoU5iMsb2Tj/ECBvPozp242GaUSp9zUU=; b=eifTeQz9MUGgKqDQsKzmHBzB2j
	+CtwHru4Xvc8D5sL9AdjDiqJWwNUFLA4+enSb3HA8EGGjQ/KpTmT7gakB7E0zhfXtSQ15zpP5lBBg
	e6odg/oBWcZoX5HZCZc2eYHerpWACeqgAgw7ymX0/SYyrZbo9XVT/WadmSYd1IjR3qee35vapbO3p
	gJkrrQD+C4GjLabtBWnvoQ+eYIrU3CzT0XUAwBsyq/vYVwiKdr0hgb0eOuEsdsjQ5NMnVRQwtSI9G
	c+nAwH3W7Gnm3mac+MbhcepOrQ8lFKBi3dX17MkNJavZ/NQqs1fFtM/bhJVq1XDSm3DzyYjCgs6Ro
	NcMMDueg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vlId5-0000000HVLd-0y2U;
	Thu, 29 Jan 2026 03:23:35 +0000
Date: Thu, 29 Jan 2026 03:23:35 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Samuel Wu <wusamuel@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, clm@meta.com,
	android-kernel-team <android-kernel-team@google.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
Message-ID: <20260129032335.GT3183987@ZenIV>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh>
 <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
 <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
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
In-Reply-To: <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zeniv.linux.org.uk,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.org.uk:s=zeniv-20220401];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16384-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.org.uk:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:email,linux.org.uk:dkim]
X-Rspamd-Queue-Id: 77D31AB67F
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:58:57PM -0800, Samuel Wu wrote:
> On Tue, Jan 27, 2026 at 8:58 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > Very interesting...  Does 1544775687f0 (parent of e5bf5ee26663)
> > demonstrate that behaviour?
> 
> Reverting only 1544775687f0 (functionfs: need to cancel ->reset_work
> in ->kill_sb()) does not fix the issue. With 6.19-rc7 as baseline, the
> simplest working recipe at the moment is with 6ca67378d0e7,
> c7747fafaba0, and e5bf5ee26663 reverted.

Sorry, I hadn't been clear enough: if you do
git switch --detach 1544775687f0 
and build the resulting tree, does the breakage reproduce?  What I want
to do is to split e5bf5ee26663 into smaller steps and see which one
introduces the breakage, but the starting point would be verify that
there's no breakage prior to that.


PS: v6.19-rc7 contains fc45aee66223 ("get rid of kill_litter_super()"),
and reverting 6ca67378d0e7 ("convert functionfs") would reintroduce
the call of that function in ffs_fs_kill_sb(), so the resulting tree
won't even build on any configs with functionfs enabledd; are you sure
that you'd been testing v6.19-rc7 + reverts of just these 3 commits?

