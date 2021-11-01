Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02669441F85
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 18:44:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjgQX5tK9z3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 04:44:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=UoyF+Ni8;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DqbJRBkx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UoyF+Ni8; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DqbJRBkx; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjgPB25Qjz2yKF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 04:43:26 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7D07A2192D;
 Mon,  1 Nov 2021 17:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635788603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lP5c+H138B3wgl7YTrlSXRTuTQvNqJou0t/Lpm7B9tI=;
 b=UoyF+Ni8K06wrh5r4zwleJoAdQN+YagumzEPYoqVTrWmlOyk2FaJPgckDw+B/j7lNWhSs6
 AphV0mfYDNS0zVboWzOuTNIM0habS9RRtmul/MFRMu1aacc2AX2uQHY+C1BBSP5InbAuu7
 hm+E0SiwYoyR6LJg4k+jR0BU5SAaZvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635788603;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lP5c+H138B3wgl7YTrlSXRTuTQvNqJou0t/Lpm7B9tI=;
 b=DqbJRBkxoKcLaIp6oL88Q8lS9PyhIOalxPOjOmH/qLsDTxZht1STHLQaypKX96owmjUThj
 L4UVBApdiPpIYBDg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 6C401A3B88;
 Mon,  1 Nov 2021 17:43:23 +0000 (UTC)
Date: Mon, 1 Nov 2021 18:43:22 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
Message-ID: <20211101174322.GN11195@kunlun.suse.cz>
References: <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
 <878ryfavaz.fsf@mpe.ellerman.id.au>
 <04864fe5-fdd0-74b2-2bad-0303e4c2b15a@physik.fu-berlin.de>
 <874k92bubv.fsf@mpe.ellerman.id.au>
 <c21c7a0e-95f1-e6d2-a04c-fb99d801e8da@physik.fu-berlin.de>
 <878rydac0d.fsf@mpe.ellerman.id.au>
 <87b1404f-7805-da29-4899-6ab9459e5364@physik.fu-berlin.de>
 <9ed788c0-b99b-f327-0814-a2d92db6bd8b@physik.fu-berlin.de>
 <1635467831.en5s268a3l.astroid@bobo.none>
 <1d02b53d-cb39-38bb-8ce2-9a92cc97e729@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d02b53d-cb39-38bb-8ce2-9a92cc97e729@physik.fu-berlin.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 29, 2021 at 02:33:12PM +0200, John Paul Adrian Glaubitz wrote:
> Hi Nicholas!
> 
> On 10/29/21 02:41, Nicholas Piggin wrote:
> > Soft lockup should mean it's taking timer interrupts still, just not 
> > scheduling. Do you have the hard lockup detector enabled as well? Is
> > there anything stuck spinning on another CPU?
> 

> 
> > Could you try a sysrq+w to get a trace of blocked tasks?
> 
> Not sure how to send a magic sysrequest over the IPMI serial console. Any idea?

As on any serial console sending break should be equivalent to the magic
sysrq key combo.

https://tldp.org/HOWTO/Remote-Serial-Console-HOWTO/security-sysrq.html

With ipmitool break is sent by typing ~B

https://linux.die.net/man/1/ipmitool

Thanks

Michal
