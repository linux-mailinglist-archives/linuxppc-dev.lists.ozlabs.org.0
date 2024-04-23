Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0078F8AF69C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 20:32:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WfiCVzYk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VP9hl4qfGz3vdD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 04:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=mcgrof@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VP9gv6THZz3dRY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 04:31:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
	bh=Rogg05ztOu4aP2/pn8CD75vsgL5H5uwqaxXujjk6r6E=; b=WfiCVzYkyj37KGe/1NcuIa1Hgk
	I9gAfHu6MCMw7NSXSor84TLrOU+mUG0ndyfzjVt0moZbaiRHo/8L+p3QYdcySteGNhcAPGJCKkoWj
	g/687Hepcmtf5PZKpuZ7znbxvUnMDD43qnPnbu67zfXVJS8SML5AtXvgw73tSyJkv3Nhg5awIIQnq
	1JNMkoOZN3LoUHS53IUhOaxE7wP++2K6T0ediCLJbAhO11cNq5v9xJzhveqww2JPt0aKNdvm5A/Y5
	rB55b5NewsYDat/UO4lQuhE8Q3txZ3JjdTGVGjV+Hgo05PhOwNnuMGRbC0LVs1cOtEcnZeCVZdr0F
	79Ap4ebA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzKvd-000000018V6-22Td;
	Tue, 23 Apr 2024 18:31:41 +0000
Date: Tue, 23 Apr 2024 11:31:41 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <Zif-jf8Takojtq7x@bombadil.infradead.org>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2024 at 09:54:35AM +0200, Thomas Weiﬂschuh wrote:
> * Patch 1 is a bugfix for the stack_erasing sysctl handler
> * Patches 2-10 change various helper functions throughout the kernel to
>   be able to handle 'const ctl_table'.
> * Patch 11 changes the signatures of all proc handlers through the tree.
>   Some other signatures are also adapted, for details see the commit
>   message.
> 
> Only patch 1 changes any code at all.
> 
> The series was compile-tested on top of next-20230423 for
> i386, x86_64, arm, arm64, riscv, loongarch, s390 and m68k.
> 
> The series was split from my larger series sysctl-const series [0].
> It only focusses on the proc_handlers but is an important step to be
> able to move all static definitions of ctl_table into .rodata.
> 
> [0] https://lore.kernel.org/lkml/20231204-const-sysctl-v2-0-7a5060b11447@weissschuh.net/
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Cover letters don't need SOBS we only use them for patches.

But anyway:

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
