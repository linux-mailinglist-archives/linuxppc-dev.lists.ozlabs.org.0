Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFFC47D34D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 15:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJw3X3LVWz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:01:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mJKlTWe2;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/CXr7qnT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=mbenes@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=mJKlTWe2; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/CXr7qnT; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJw2p4lN4z2yQw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 01:00:50 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2178A212B7;
 Wed, 22 Dec 2021 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1640181647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0utRSqmLOFDMTX1m4c/q1Eo/3WAVcqCk1NnGENJ0Dsg=;
 b=mJKlTWe2MOa4ObQhf1wxT2JppLXljYsNaqd5AEoJzBsLK5DAZo0V/lDIVhtxHdUX2mdU6I
 FCaC61JDBpjvUfbRPMgVa0fM3R6BhDgv7AXzssm03YPG8GRIsEpVm5dmDqm4BxTsoDHneH
 idq3SuNdKG3c2+R/dEvg33VOsvROeAw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1640181647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0utRSqmLOFDMTX1m4c/q1Eo/3WAVcqCk1NnGENJ0Dsg=;
 b=/CXr7qnTf483W1DHSVCZGHxApoDnDyO8hZhOwK7vrnOmADOpUTlBPsHmuwZXJD3qX4BlQj
 eMUS+aj3Hj8aBACg==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 02CD4A3B89;
 Wed, 22 Dec 2021 14:00:47 +0000 (UTC)
Date: Wed, 22 Dec 2021 15:00:46 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 04/13] powerpc/ftrace: Add support for livepatch to
 PPC32
In-Reply-To: <63cb094125b6a6038c65eeac2abaabbabe63addd.1640017960.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2112221459030.18494@pobox.suse.cz>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
 <63cb094125b6a6038c65eeac2abaabbabe63addd.1640017960.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Dec 2021, Christophe Leroy wrote:

> PPC64 needs some special logic to properly set up the TOC.
> See commit 85baa095497f ("powerpc/livepatch: Add live patching support
> on ppc64le") for details.
> 
> PPC32 doesn't have TOC so it doesn't need that logic, so adding
> LIVEPATCH support is straight forward.
> 
> Add CONFIG_LIVEPATCH_64 and move livepatch stack logic into that item.
> 
> Livepatch sample modules all work.

Great.
 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

FWIW the patch looks good to me.

Miroslav
