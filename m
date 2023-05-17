Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B82B706BAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 16:52:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLx0y2n4dz3f5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:52:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ca9f/D4S;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EMWrwTfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ca9f/D4S;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=EMWrwTfy;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLwzz3Dp2z3f5D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 00:51:58 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 10A63320030E;
	Wed, 17 May 2023 10:51:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 17 May 2023 10:51:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1684335110; x=1684421510; bh=U9
	81mgJN5ZcIFGHHfNRtTYm9tIIshD/j5t+czAqBesk=; b=Ca9f/D4SJr14QvZGkc
	+q7KTRGXT7JBFRrs75d+HJ2OHOSFueAY0un/ZGcKbVEoscZFW6SjqbiPXereZTY1
	4lcT5rbc2J//JZIJSnLiqFoKjl+7sEm3mRPxHdA8kVhx6i+8Gv6Gs3tgeghB9AVx
	tiFExJee1gfnnXfCGEqrMCOAyztqrVmVbbh4Vx8kBzBcchhCWGq9jE4AWpdrn/zc
	KlbDH9cn2VZKKpo3BlHq2vmDVsjsuLASyEKUhF08I7lpQUUHqQi2ze3FpKl0U9IV
	yp0n5gg/GsUfq8IoMt1JUB+wlGdGrbDiz4LfVQ/hM2UiQ/AKZgZzMrsWIQF+mwUG
	o5Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1684335110; x=1684421510; bh=U981mgJN5ZcIF
	GHHfNRtTYm9tIIshD/j5t+czAqBesk=; b=EMWrwTfyiN4WwFm97r9VWWS6w2uAq
	LgvmOB2bNzX3Nj1iJRBecCwthhPNqACErPlWa7ntFlYoaEwBhGN78KcLN3yBTNyu
	Aqk3H67Dg6iVzIE2eoyn3hmWBvqBblRgzb3TZygGJHtSCh3YrmYDvNM1AlrxXI+/
	YZMWcHS8mskGNb1OcG10Hh5tBRVj/WtG2lS25NQwWzGjSsjt1yoy6lceEwD7hdEp
	ICxlryjGqFpBvOblk/or/mLmEinMRAIO7vCr/4QUi2/F6B8hv2rXwNtgp21zzcmi
	W3WRrfgi52k7r9ApnTs4X2/2idzkX3KZD72Lp+8DQ9oBBrfMF6Te9k6Qg==
X-ME-Sender: <xms:BOpkZAX-ah2gC9qXHRhxL9Jdqt9kqu-VKcGSuWg1GW_5ZN0t_KBOcg>
    <xme:BOpkZEnCWHECQenDSE928iVzgjeKtfqwlYib_ujabtOEKkQ-iVrevetsmAAqV2PXz
    oO1vUF8ZrqpGe5ciQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiuddgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:BOpkZEanBGI8-zi50JEHLFiN5OCN7u3f1N-fS6wbkXOhNFZcQlB9RQ>
    <xmx:BOpkZPWIrxfeze0hM1uxKpTiRjSQF0E2dM8RjNSgq_9LgDgcz5l8Gg>
    <xmx:BOpkZKky6b4GKmAWHHstx-M_Q2MTJ0Mg84yM6a-OyBPfxMEqp1e5aA>
    <xmx:BupkZNFPTGYv1tkCdtIpLzc7PK5bJcAAEF0LFfyPqwuQNavihPAm3g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9F93DB60086; Wed, 17 May 2023 10:51:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-431-g1d6a3ebb56-fm-20230511.001-g1d6a3ebb
Mime-Version: 1.0
Message-Id: <83422cf8-5d77-4e2f-a854-c2b9a9a94d75@app.fastmail.com>
In-Reply-To: <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
References: <20230517131102.934196-5-arnd@kernel.org>
 <e1a07eed22cb33af2733bdffe42b09f0.paul@paul-moore.com>
Date: Wed, 17 May 2023 16:51:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Paul Moore" <paul@paul-moore.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Subject: Re: [PATCH 4/14] audit: avoid missing-prototype warnings
Content-Type: text/plain
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
Cc: linux-kselftest@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Pavel Machek <pavel@ucw.cz>, Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Heiko Carstens <hca@linux.ibm.com>, linux-pm@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, audit@vger.kernel.org, Palmer Dabbelt <palmer@dabb
 elt.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 17, 2023, at 16:33, Paul Moore wrote:
> On May 17, 2023 Arnd Bergmann <arnd@kernel.org> wrote:

> We probably should move the audit_serial() and auditsc_get_stamp()
> away from the watch/mark/tree functions, but that isn't your problem.
>
> Anyway, this looks okay to me; do you have a problem if I merge this
> via the audit/next branch or were you hoping to have this go in
> through a different tree?

Merging it through your tree is probably best, Andrew can either
pick the ones that nobody else took, or I can resend the rest.


    Arnd
