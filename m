Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F824534195
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:35:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7cBM2s01z3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 02:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=tw9L7T0N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=tw9L7T0N; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7c9d6vS7z2xbW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 02:35:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=jypLC8pMrKW0j3fSKUVuFFR8ZiBy4DELSKaBKyQvyj4=; b=tw9L7T0NXo7o8eoYtv9HAlFJ8p
 L8VesaUCmyf9j2hJlMwXCqIiF5knDSafP/unnkHP21GatUd0qAR62AtoOWDASqTt0krGn6MnufJbv
 3ljk4sYzaejG9Y1yM8wUn41A44E01dCZq9pGrc0iX6iAHHufGkpiJZlg0URKQ8FobzkPAXBHmSVfD
 rpgJM1utg7ZlWklOaPfUT3XlMJXkAqBkw1daFbYFgapTt71GfmBTTvpd9Ela7aXmIw0H2QC5Y2jxd
 QxdAR2p0qbnusQPE1FQ2q4lLabGdOAbwP1U6impkOxQ8fIaSzZblWlsgK/psyihsFaKsGMMtTuhE2
 RjMwFmJA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntty4-000W0O-P8; Wed, 25 May 2022 16:34:40 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id CF351980E04; Wed, 25 May 2022 18:34:37 +0200 (CEST)
Date: Wed, 25 May 2022 18:34:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1 1/4] Revert "objtool: Enable objtool to run only
 on files with ftrace enabled"
Message-ID: <20220525163437.GH2578@worktop.programming.kicks-ass.net>
References: <cover.1653494186.git.christophe.leroy@csgroup.eu>
 <262b4209a4a8fe99a97d23b89776380cbdad8b38.1653494186.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <262b4209a4a8fe99a97d23b89776380cbdad8b38.1653494186.git.christophe.leroy@csgroup.eu>
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
Cc: aik@ozlabs.ru, jpoimboe@redhat.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sv@linux.ibm.com, Paul Mackerras <paulus@samba.org>,
 naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 25, 2022 at 05:58:14PM +0200, Christophe Leroy wrote:
> This reverts commit cf3013dfad89ad5ac7d16d56dced72d7c138a20e.
> 
> That commit is problematic as we miss some static calls.

Revert ?!?! who comitted this. And there's a ton more broken than just
static calls. This must absolutely not be.
