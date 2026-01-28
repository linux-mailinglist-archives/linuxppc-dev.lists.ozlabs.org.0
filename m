Return-Path: <linuxppc-dev+bounces-16350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BTwALbOeWnezgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 09:54:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD19E7B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 09:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1GKY1gymz2xjK;
	Wed, 28 Jan 2026 19:54:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769590449;
	cv=none; b=NPh7Z4n0bt6sleLFT9Ewt4S31W6NfAoleUEOiwqLN6KhcETBOo1gxI5/wKaG0yjFWJ9JEgPRvWHorCeAMhSCO5lHTtyh4EiNVeTkxK4LPVGANMGe32eql8Z92GnzVyUmWdUpRiDzyZQNOWFxa51GpaUUDQ2F2prucHc414FH04dhkJp/2TKDTEv1mGua37tQf09E82PeI8qL+zHsEojEVof5JjPmzOB8PzhpheNZj6nReF5z2T5zOLKj0OjsvYpqdvJNPsbSWqTTCpcO+5Z16+OXm/igEo/XjJGjG8PBBRbwXJijxr0xSeg4R9NKbbkycQWHkboxY5L45XINCD/OgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769590449; c=relaxed/relaxed;
	bh=wxcLHxE0h0tZrYY8m14TIbzP4neRX2cVHl04cabob+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B663FnJFvP2G0KEVp8oaI/w/kXrKg+pBqVaKfaxID5+WTWWWkgEQj+zL+geGSyfA5gPSb8mmX1lfNCgG3zXRZ+UM4JgKd/4yO4G9CYzvGHHKU4x2537X4ytNanCHWuNq1zybP4082CsCXuY948quhKI6Y0JyDWcc79hTfAlNJcFIW4AcoVtAdvcxMvtJceoLC3OfrB8WU3/zNDN+0XjhiQU1A/4JUGgx4325BHUQSu9f2zY09rxYU5SCb/v3xRWrVeIhrGpS3P1KFZ5IFe8f5Vi2ASf/WLrMSLSQaSzLKDoMROItB2oVCRfDEioP9Y/xH/3sNqrWPc8QcccUiUiYUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IiNsTsjt; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=IiNsTsjt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1GKV56yKz2xMY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jan 2026 19:54:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68D5D60097;
	Wed, 28 Jan 2026 08:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B35C4CEF1;
	Wed, 28 Jan 2026 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769590442;
	bh=sp8ZzgKfLYBf6n5dvtaPV7JJtZoVmZtARJEfnOlvgnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IiNsTsjt7/JJEy7yHNve/JooAIlH0pnM87ZGvmgdHepEWko5EVz56NLPJSRbmXI8w
	 sxKEPaOCpGXqDtQ0OHpQYWN7Mt9VjqvMvARm+eLYaHLPTNohEerYQif5fI9Qezgjy+
	 G4XDfI/hst0WjbqQ1xzHMsJI6EzUETgPfOt5Yvr0=
Date: Wed, 28 Jan 2026 09:53:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Samuel Wu <wusamuel@google.com>, linux-fsdevel@vger.kernel.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org, clm@meta.com,
	android-kernel-team <android-kernel-team@google.com>
Subject: Re: [PATCH v4 00/54] tree-in-dcache stuff
Message-ID: <2026012812-jurist-whoops-0ef5@gregkh>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh>
 <CAHk-=whME4fu2Gn+W7MPiFHqwn51VByhpttf-wHdhAqQAQXpqw@mail.gmail.com>
 <20260127201454.GQ3183987@ZenIV>
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
In-Reply-To: <20260127201454.GQ3183987@ZenIV>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.29 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:torvalds@linux-foundation.org,m:wusamuel@google.com,m:linux-fsdevel@vger.kernel.org,m:brauner@kernel.org,m:jack@suse.cz,m:raven@themaw.net,m:miklos@szeredi.hu,m:neil@brown.name,m:a.hindborg@kernel.org,m:linux-mm@kvack.org,m:linux-efi@vger.kernel.org,m:ocfs2-devel@lists.linux.dev,m:kees@kernel.org,m:rostedt@goodmis.org,m:linux-usb@vger.kernel.org,m:paul@paul-moore.com,m:casey@schaufler-ca.com,m:linuxppc-dev@lists.ozlabs.org,m:john.johansen@canonical.com,m:selinux@vger.kernel.org,m:borntraeger@linux.ibm.com,m:bpf@vger.kernel.org,m:clm@meta.com,m:android-kernel-team@google.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16350-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 30AD19E7B7
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:14:54PM +0000, Al Viro wrote:
> On Tue, Jan 27, 2026 at 10:39:04AM -0800, Linus Torvalds wrote:
> > On Mon, 26 Jan 2026 at 23:42, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > Note that I had to revert commit e5bf5ee26663 ("functionfs: fix the
> > > open/removal races") from the stable backports, as it was causing issues
> > > on the pixel devices it got backported to.  So perhaps look there?
> > 
> > Hmm. That commit is obviously still upstream, do we understand why it
> > caused problems in the backports?
> 
> This is all I've seen:
> 
> | It has been reported to cause test problems in Android devices.  As the
> | other functionfs changes were not also backported at the same time,
> | something is out of sync.  So just revert this one for now and it can
> | come back in the future as a patch series if it is tested.
> 
> My apologies for not following up on that one; Greg, could you give some
> references to those reports?

Sorry, all I got was a "this commit caused devices to fail" and was
found from bisection, on the 6.18.y tree.  Samuel has much more
information as to exactly what is happening here as he can see the test
results properly, I'll let him work through this, thanks!

greg k-h

