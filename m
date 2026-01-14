Return-Path: <linuxppc-dev+bounces-15741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BBD203F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 17:38:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drsJH01W3z2xT6;
	Thu, 15 Jan 2026 03:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768408734;
	cv=none; b=fYnszDbVjQ6kDtLe19r5Lb6qGkvPbHchew57eJWUA/uHk+pSIpwQTFixjdRKt4Dy99+e3sdPxOmFd7N8hHClyIgn8Ob3017JMVEGbmWV/ks7E38yu50yfiC3sv4lxDeGvEMK/7oleURTIHKHXjwpuF5aEmQtV2QRRPyj0eODntlE0w7Pw51vQ589eo9Om5tC+dLew1g35x2yFE+WWRl0d2OFM3M/LmlQDZfQ2r3pyv5oprcWjW97vMA/HHk2r76xj6ckCmJyhT9eNUd4UQfIOyY8DLZKhRbrBvyHgyz6nR8atN32LgfG663aJMMYyOBxN6d3IpX1Zc/Bp2xMRsktDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768408734; c=relaxed/relaxed;
	bh=3O46Pj7m8kkRm5o6FCiKeQjNffkaPKNOyTPfHDTuyTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5EaDATHoMo08MShlsTy2TLH44EqZFtcWZPEal9OCPqNquyb6TvkR1j3FzoaNj5NUS2k+97VWcp7bGI81r08mfFQaMLyyi5kBsfgqkO2sQDhU2GbqgL4DyTFiVHugTU7i0xOvw9KLIB1ptbhtuIg8gQCpwsEd31OQo+HN8shVKW11TbB+l1ypLPReorBMGodygip1xmGpFzMG0Ujf7Z3ipUxrMaPjywOLcPFomHLKG5xi57B4R9q9sZyh4gglB+lcYZ9ZHkI0umSTEMr3Dg0R8R4Voya7kfbql/Q2e1X5sxyf8tjMi4eYGL0iLjNQ0cdK4hOVwb+dTochSRZguVtew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rX3NXa+Z; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=danielt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rX3NXa+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=danielt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drsJD5DT5z2xNT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 03:38:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A323408E4;
	Wed, 14 Jan 2026 16:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80489C4CEF7;
	Wed, 14 Jan 2026 16:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768408730;
	bh=3O46Pj7m8kkRm5o6FCiKeQjNffkaPKNOyTPfHDTuyTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rX3NXa+ZIaH3nFwhK4UUCK7Tl+BkdrM7lAWylErEBVX8n4+UiQ4G9G3ZhsgmdM3kk
	 vN8PXFoQ+O9dscO4bKZ3M3QWmyyXJXre63JLVYqnzZ2NTakKl+OU0g0oj8iEefzjr3
	 mgengyjgYNSq8vnqi/nIcJdbHx722ODGLyY8W8WF4jD1J44QYJo3q7W39OBPor2Wnp
	 mtMB1YriAKD7oAMO5DENXpRw1aefTtMKh3nXtSKTmIbbZIhuLzX4/xt9jCGtUk6R4U
	 0bsnyWbYeo3xcvSjczR5clmShq482fExnV7dzxGfD2Q4FGvs3AgYwtJ9KizIe5aoQq
	 liWKl6bOegsTQ==
Date: Wed, 14 Jan 2026 16:38:39 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Daniel Thompson <daniel@riscstar.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Douglas Anderson <dianders@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 00/19] printk cleanup - part 3
Message-ID: <aWfGj1eQhj2fAWB-@aspen.lan>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <aVuz_hpbrk8oSCVC@aspen.lan>
 <aVvF2hivCm0vIlfE@aspen.lan>
 <a5d83903fe2d2c2eb21de1527007913ff00847c5.camel@suse.com>
 <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
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
In-Reply-To: <89409a0f48e6998ff6dd2245691b9954f0e1e435.camel@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 09:32:33PM -0300, Marcos Paulo de Souza wrote:
> I talked with Petr Mladek and it would need to rework the way that we
> register a console, and he's already working on it. For now I believe
> that we could take a look in all the patches besides the last one that
> currently breaks the earlycon with kgdb and maybe other usecases.
>
> Sorry for not catching this issue before. I'll use kgdb next time to
> make sure that it keeps working :)

As I understood things the bug was in earlycon rather then kgdb.

It was picked up by the kgdbtest suite since kgdb does some cool things
with earlycon (thanks to Doug Anderson) so I added a few earlycon tests
to the kgdbtest suite. However it wasn't kgdb itself that failed here.

So... if you want to run https://gitlab.com/daniel-thompson/kgdbtest
then certainly feel free but its probably less effort just to include
a couple of earlycon checks in your testing.


Daniel.

