Return-Path: <linuxppc-dev+bounces-16474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oItWCqtTfWn9RQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 01:58:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F26BFC65
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jan 2026 01:58:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2vd10kbCz30BR;
	Sat, 31 Jan 2026 11:58:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769821092;
	cv=none; b=eIaPbb1RTEte36OG18MFtfIcqgHKX4AwIEa9mcMyviy6iNusCLDvSDIO2HpZHDxHHeBrz1W9vmd6qP/Aak8ZIL6a02/AC7MDTAUQ84SNG0qJ6+DGYKYgySIW7op3Qx12scT8XWfmXA5RVLwaKkZlGJmFMAAnSZRuHrnNfAqYTzriXIgv0xACDkFaPT6IBnhLYki3bW78B19PCxEw2rDweSRNfXZSL5vsTf05xHQMOyceQeaNNCLMBhHETdj/9JY5oBY5MtgY6tDfSgaqRXkCpotRRE9deWQ8en+itsza/Cel8n1530AM9v3EVKk7jcxWkOjbb+rhYorqQ2t2XM2tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769821092; c=relaxed/relaxed;
	bh=6wn5ysU0YfloeA6exMYYK6iQpv2UsqLmSW+HgYt8Lvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ydxfwm34DUhRlQMZZhsbvjumd69Z1sOn1bCZhK7PlZKP/nO9hB9sI/Qz/l+E0ixNR6RGnRy3U2xAqX1g5gwmtLgcz24z7PhWg7YvBINXEqMq4WdkiKJf7yFk8BxOp/pwJ+bf+C0eSWh4MCAKxXT6AH+TdbMduDZhXgnoo52ITcRcNe7g5gNowwCdXmNbBAiDRZwdvLBfYBY9dRz6vR0wWeJQIakaaZSUhIf4cnK4Idyb4+P4Bt+dEs6UIOKJIpKZ2bUp0XQGx/ksfIWi7dHSrDJJCutquuXADRVhfTbeH619wYXD0LpchOnXlzadfAnTkxXHAy60JEx4Kdwbqf98bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=UM/ksZZW; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=UM/ksZZW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2vcz6R8Hz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jan 2026 11:58:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6wn5ysU0YfloeA6exMYYK6iQpv2UsqLmSW+HgYt8Lvk=; b=UM/ksZZWv++c+yQ2Z0BCZkfn/S
	HjTROjfZP9usvFLH2AozqIKT5BfvGCplmb5PT/OrqOxyIcxn1AnMzXsSeyOPcgbqqK7NMoXLYcvD+
	AiRLG7sl+WVpci94VwwaRDPiyv+ALu0PW0AOh4CiNKrQBg0ntaI7j9YVDXwgHCt8rFkuXFoQG/qMG
	eM8x2UZHeYYWXCwshzBNpx/h2uX9YYt6vLnLMjgpBNC6Py3sbsH1CGWkWSNnpJz82lWdW9yjSFjyo
	D5jPNPQHtBTk91smKSHKmFupg6W69tzPTg2LBnAVeU/tacJaM4FNWwWmfNA5hRayFruPqi7yXGApP
	RaQL9bWw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vlzL8-0000000D2NM-1MYL;
	Sat, 31 Jan 2026 00:59:54 +0000
Date: Sat, 31 Jan 2026 00:59:54 +0000
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
Message-ID: <20260131005954.GX3183987@ZenIV>
References: <2026012715-mantra-pope-9431@gregkh>
 <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
 <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV>
 <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
 <20260130070424.GV3183987@ZenIV>
 <CAG2Kctoqja9R1bBzdEAV15_yt=sBGkcub6C2nGE6VHMJh13=FQ@mail.gmail.com>
 <20260130235743.GW3183987@ZenIV>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130235743.GW3183987@ZenIV>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux.org.uk:s=zeniv-20220401];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:wusamuel@google.com,m:gregkh@linuxfoundation.org,m:linux-fsdevel@vger.kernel.org,m:torvalds@linux-foundation.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux.org.uk:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viro@zeniv.linux.org.uk,linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16474-lists,linuxppc-dev=lfdr.de];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.org.uk:dkim]
X-Rspamd-Queue-Id: 35F26BFC65
X-Rspamd-Action: no action

On Fri, Jan 30, 2026 at 11:57:43PM +0000, Al Viro wrote:

> Another thing to try (not as a suggestion of a fix, just an attempt to figure
> out how badly would the things break): in current mainline replace that
> 	ffs_mutex_lock(&ffs->mutex, file->f_flags & O_NONBLOCK)
> in ffs_ep0_open() with
> 	ffs_mutex_lock(&ffs->mutex, false)
> and see how badly do the things regress for userland.  Again, I'm not saying
> that this is a fix - just trying to get some sense of what's the userland
> is doing.

At a guess, quite badly.  ffs->mutex *is* way too heavy for that purpose -
that's a geniune bug.

State transitions in that thing are messy; AFAICS, the state is a combination
of ->opened and ->state, and transitions assume atomicity that just isn't there.

All updates of ->opened are process-synchronous; the nasty part is in the
FFS_DEACTIVATED handling.  We don't want it to coexist with ->opened > 0;
normally decrement of ->opened to 0 gets us into FFS_CLOSING immediately
and follows that with ffs_data_reset().  In -o no_disconnect mounts we switch
to FFS_DEACTIVATED instead.  On the next open() after that we want it to
transition to the same FFS_CLOSING + the same call of ffs_data_reset().

open() running into FFS_CLOSING fails; that happens until ffs_data_reset()
switches ->state to FFS_READ_DESCRIPTORS.

Things are complicated by ffs_func_set_alt() and ffs_func_disable() - these
can come with ->opened being zero and both contain this:
        if (ffs->state == FFS_DEACTIVATED) {
		ffs->state = FFS_CLOSING;
		INIT_WORK(&ffs->reset_work, ffs_reset_work);
		schedule_work(&ffs->reset_work);
		return -ENODEV;
	}
with s/return -ENODEV;/return;/ for ffs_func_disable().  The point, AFAICT,
is to avoid deadlocks from having ffs_data_reset() called in the locking
environment these two are called in.  At least ->set_alt() can be called
under a spinlock and ffs_data_reset() is blocking.

Another potentially troubling part is the check for FFS_ACTIVE in the
same functions, seeing that
                        ffs->state = FFS_ACTIVE;
                        mutex_unlock(&ffs->mutex);
 
                        ret = ffs_ready(ffs);
                        if (ret < 0) {
                                ffs->state = FFS_CLOSING;
                                return ret;
                        }
in ep0 write() happens with no exclusion with those (as the matter of
fact, that transition to FFS_CLOSING holds no locks at all)...

