Return-Path: <linuxppc-dev+bounces-8419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A8AAEDCE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 23:19:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zt7Rm74WPz30Qk;
	Thu,  8 May 2025 07:19:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746652740;
	cv=none; b=E/+Fs4E6WTp0zElgDJ6soen/8k9386X0m9EnExG9L6tHM4EMWCohMGwDWvBZ8wodH5sOsMfxXA4ToINIrkQX3TEbuzNQYjno/Mq487c1wOoqARxeVol9IvcD2PGmz+220u7OTSs7fkUyOGiMA/kTWXOiZfm/nN0v7ovtitSZt4oe/bd6bXUKxw1sqhvbK/ewAHM+GgtBtWMY4gYvrc2o3V4BH1xPzw2mUwSdOQyiKmIo5WbVDFETx+4nm1o9fU9EiMs39mOuTKYXiKyZPUJFnUuUCN3WDZGcI4pEhsJXaM54asXhskoR1QMdO+ZZdkW2lYIWK3lCFz8Bl5oPBIHz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746652740; c=relaxed/relaxed;
	bh=QTihWgIiBkpZ0So2wXnOWa/xllZkmD8mBa818vmY+ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K89yPfHTgmIVzT9IUGBcXv+6/9APqJ0sxgs7SXZ3gSAO4YFK7Dvhp0BOQwWqDo9Zw8/ZuQBC68xBWupP/GzuLBYqN+z6GAHug/SScJUyJkpi5D4wXMb4fXprqOtnxlN3lcG0woQvjS6tctYX+3Yn1Uoe1L77k1CrRXWrmsBA0psa7W/zraVzyQG/63V+zndCZo+4Y02z9mlEZnPZQG/eFvsupO9iyLcYGF2hNlbeicUp1KyJ/8pu8T2dOUR4t7MLQSb3LeDBz0ciw2wJoHoGP5g83J6upNPrqsWoNxmKGZ4OvEFZguNFHcR1XcvXn7zbp1sBfTZy1cEQjE+CbPuLyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RinESwQd; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=RinESwQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zt7Rj6BKlz3089
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 07:18:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QTihWgIiBkpZ0So2wXnOWa/xllZkmD8mBa818vmY+ag=; b=RinESwQd87yy5BJVrPytdkF/yT
	IHjOC3NetkE10Z9yLZXv4sdSE7fogbOjzKNyH8BCZqA7WfHOO3E/T/T/Vmpy1fYDR0qeP6f1yhXmd
	uPJYfsTR/0YgzqKr+HFRLHRXMVq5x7Rt/5fsGrzA5amxGKaULOZKgsSSNaFVMlKKCU92IEdfpfr58
	Q0GpF8M+Scl8JAKbsaIbWTRnpMyA94Z5UeCzkR4wTuzLSu88lNSVm6YPf8tHx5/vnFRFgWoFV07cM
	lNvLhHEURJgrnNF89r59Np+yyzHnuFATVhTeicAUXlyixzBqGtK3ZsBJWzC9SO9bVd3XyBXQJK8z8
	gvYIhSmQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmAF-00000001d1n-0KRR;
	Wed, 07 May 2025 21:18:51 +0000
Date: Wed, 7 May 2025 22:18:51 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-btrfs@vger.kernel.org, riteshh@linux.ibm.com,
	Qu Wenruo <quwenruo.btrfs@gmx.com>, disgoel@linux.vnet.ibm.com,
	dsterba@suse.com
Subject: Re: [next-20250506][btrfs] Kernel OOPS while btrfs/001 TC
Message-ID: <20250507211851.GX2023217@ZenIV>
References: <75b94ef2-752b-4018-9b2a-148ecda5e8f4@linux.ibm.com>
 <2a17b9b1-c490-4571-8f6a-fa567ed0b57e@linux.ibm.com>
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
In-Reply-To: <2a17b9b1-c490-4571-8f6a-fa567ed0b57e@linux.ibm.com>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 07, 2025 at 09:05:42PM +0530, Venkat Rao Bagalkote wrote:

> > I am observing kernel OOPS, while running btrfs/001 TC, from xfstests
> > suite.
> > 
> > 
> > This issue is introduced in next-20250506. This issue is not seen on
> > next-20250505 kernel.

Braino in fs/btrfs/super.c patch - in a couple of places 'fc' should be
replaced with 'dup_fc'.

See https://lore.kernel.org/all/?q=20250506195826.GU2023217@ZenIV
for replacement patch...

