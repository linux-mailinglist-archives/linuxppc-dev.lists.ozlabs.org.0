Return-Path: <linuxppc-dev+bounces-16421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLPeAJ1XfGn6LwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:02:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C4B7C00
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:02:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Rm65xgNz2xjP;
	Fri, 30 Jan 2026 18:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769756566;
	cv=none; b=VG9l4w4AMLsYa2ShnbwiWszqWwba5NlS0ujJDxPaSb2jkmJFUPd1WvD3zORn5heIrHeAQZVNb+mPeengZLOqc30Le8Gc4wjmtHvWe/q9oXvIZCCfhAJye7BxIidU0rypp1SUmyLp+fMKvBitJzaE6KC0x6iUoDeH6+Err1b16/sp8cRT8nL0nObFqVVGriVvlpsntDLkG68L0SuWrtAuCZIzkgIpqbSLBmI0oVXsPxxiYotDu6266ch20wn6rzcaA85FnBrX0fxHjxtR54eToQILSAPb4BhkKDZWgAeuNIVGH8pqoSwaknQVkwtpcCer9N45GD41ZeeIIR7SAmeBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769756566; c=relaxed/relaxed;
	bh=INMf6UfFQjVVnORY/K4s0FguYtBlQgR4+GC7Az9nAHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TSo30j8wxVQw4KQIuoLHa+f8rh8rMHSVVeoSxkWpf2e8cry+Gh8xChXmvJw/I6oup6Obgd7DtJ8Ue+2lSWp45Xc1ShKF6Q+gpEMOrIzSJBYyAGimCDI8tWa6H6SAzDIcxXZqDG0J/Rx5u3xpc5Q0l+QSukix1X8dAcx9pl4tLepe93fA0CGhBVLbHutb+LCn5cWUX2kflX02nSYAcsa8NtsbKcuGcfNqKjJ8a65hI+YBE754kjRgdqTPEi5Sow0M4NFi7QZtO0SN+vP/FOiUia6o95h9CzIDXfDizV3aNqMoEwfpscr5RoHfM4KL7IcjU29jK4O0WIlK1mQkgemyeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ilytkKYY; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=ilytkKYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Rm55J52z2xS6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:02:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=INMf6UfFQjVVnORY/K4s0FguYtBlQgR4+GC7Az9nAHk=; b=ilytkKYYIb15hDUYvk/ktFurn2
	rIoSaVvuwrv/jNqt4iR6TROJ8IeZlN1PH5whhMv1/AbdXFNN++4wyTyv7KF0rsVh9LyisYV+v2x4b
	8QcYgnYdrwmOBebbLAj82HRGHPg83XKl4d5ixnZQP3jnt6qes1l7NJpUU15IRRrSd2OrPbXiWuF5G
	1Usc1/YAHY1hTXStoU1uN95rtw2ejQed+PicyisANY6LLn93TFaRsRfhXSowFrUo7Xjyenb5oA8gy
	k3TEBPyYB9WuLgY3oozldImd1hRSvpxcR/Ekx3NPG7coY7XpmsUV6OouYMej4OWnhCk8fo8Af/yTI
	OpDd5jSA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1vliYK-00000009qV4-2BjG;
	Fri, 30 Jan 2026 07:04:24 +0000
Date: Fri, 30 Jan 2026 07:04:24 +0000
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
Message-ID: <20260130070424.GV3183987@ZenIV>
References: <20251118051604.3868588-1-viro@zeniv.linux.org.uk>
 <CAG2KctrjSP+XyBiOB7hGA2DWtdpg3diRHpQLKGsVYxExuTZazA@mail.gmail.com>
 <2026012715-mantra-pope-9431@gregkh>
 <CAG2Kctoo=xiVdhRZnLaoePuu2cuQXMCdj2q6L-iTnb8K1RMHkw@mail.gmail.com>
 <20260128045954.GS3183987@ZenIV>
 <CAG2KctqWy-gnB4o6FAv3kv6+P2YwqeWMBu7bmHZ=Acq+4vVZ3g@mail.gmail.com>
 <20260129032335.GT3183987@ZenIV>
 <20260129225433.GU3183987@ZenIV>
 <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
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
In-Reply-To: <CAG2KctoNjktJTQqBb7nGeazXe=ncpwjsc+Lm+JotcpaO3Sf9gw@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-16421-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 126C4B7C00
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 05:16:20PM -0800, Samuel Wu wrote:
> On Thu, Jan 29, 2026 at 2:52 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> 
> > > Sorry, I hadn't been clear enough: if you do
> > > git switch --detach 1544775687f0
> > > and build the resulting tree, does the breakage reproduce?  What I want
> > > to do is to split e5bf5ee26663 into smaller steps and see which one
> > > introduces the breakage, but the starting point would be verify that
> > > there's no breakage prior to that.
> 
> Ultimately, same conclusion as before: 6.18-rc5 with patches up to
> 1544775687f0 works, but adding e5bf5ee26663 breaks it.

OK.  Could you take a clone of mainline repository and in there run
; git fetch git://git.kernel.org:/pub/scm/linux/kernel/git/viro/vfs.git for-wsamuel:for-wsamuel
then
; git diff for-wsamuel e5bf5ee26663
to verify that for-wsamuel is identical to tree you've seen breakage on
; git diff for-wsamuel-base 1544775687f0
to verify that for-wsamuel-base is the tree where the breakage did not reproduce
Then bisect from for-wsamuel-base to for-wsamuel.

Basically, that's the offending commit split into steps; let's try to figure
out what causes the breakage with better resolution...

