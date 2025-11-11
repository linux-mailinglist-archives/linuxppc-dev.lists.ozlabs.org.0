Return-Path: <linuxppc-dev+bounces-14088-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCF8C4CD75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 11:01:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5MWC0p5rz30J0;
	Tue, 11 Nov 2025 21:01:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762855286;
	cv=none; b=FwoR80335+sexFXrPtiRxzaBLTuv0YRJ+0RyWvxQgqm5eQgE//rreW8se9NUeYzU5vYLVpLG8YswrUhEWGbBqyA7QLyHwaMlr93h+aSDVaCMsLTi9XnnIS/tfwiEg+VWmGMMikK3MxbiAqB7UEAHMMqLArwafPCPnf8u8AMDuK9y6UQ/y0PvGsdYS/GME9GLkMCKWEavheS38ollqNJFX7QAiNKV6Xvyz/zb4HWlk3AlrVmVGUzFe10MmSKPMofsEOiNELyB7pmH15t2Qo9jLz20uEqwrxK2D58QwgOzAGpFwAQr3RmnXyJ2GKQ8f7jBp2mfdUap63OC+xxO73+Ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762855286; c=relaxed/relaxed;
	bh=mqzMG8DZM/gvRBtNitIiPBI41Lv4Ew10vO1gkoA+Kjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGRLzKwLImHkl1BJqYi4Vw54N4cTee8nH0EFjfAFKqiV2ccPNEUtZeJT4e98YeOm3Y6i3U0GxeAn3MyxKekpvv0RD0T3sUVavnFsL9575lD2kiXkZ9rLCXSE1BRNEWObasCvkDYbqw5d8/lceCwp0uGinKefUJxqjmo4qcnRmUhUKcEL/6ycF0EZP4a9g2TZayaL6eLlZLurCmOmVkoS64is3erlOB+AnM1cxylnzxXn4eyeiJmIo3+0GvyXMx1aqSoKq/Xrr6V4aPUxaoJgx/7gbL3b5zI7NhSRPj6M6hmHiZM10rQHTepXF+FqvZOlAGtMSLifn0uG6njM88pGAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=MW8BXQRZ; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=MW8BXQRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5MWB0v7Zz30Gt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 21:01:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mqzMG8DZM/gvRBtNitIiPBI41Lv4Ew10vO1gkoA+Kjs=; b=MW8BXQRZWfQCxSkVRaAW5RDNRv
	u1sda6MVQC9abOrzArDC8Tn/TJ0Lsnq3zSEIToxqDk+2Y3hn7b+eNYfnCIbwUlXCj2iIT2wjI/wew
	cBCjS6trY0nXW2EHN2fegFgCawQAJsMgikqLavler34mWIP1rQcTnw8A+1GdCExcvRmhNRc8KvMsv
	1qNOJzokl6uVp9Ybw0BL5rIhQ4k24h8BTs3yqMPybTjBAdjdlfD5wcYREFELha7wTjdS7t/GfB0pT
	gJRegxPM88TCv3SWy/DpaceAnnpzuoH08amxqHgXkDEMvxRFnhOFsiApuvBrXKnLF1ZZDYsq8fPYB
	xbQFpQFQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlBb-0000000FeCe-2SRQ;
	Tue, 11 Nov 2025 10:01:15 +0000
Date: Tue, 11 Nov 2025 10:01:15 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
Cc: bot+bpf-ci@kernel.org, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 36/50] functionfs: switch to simple_remove_by_name()
Message-ID: <20251111100115.GU2441659@ZenIV>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
 <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
 <20251111092244.GS2441659@ZenIV>
 <20251111-verelendung-unpolitisch-1bdcd153611e@brauner>
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
In-Reply-To: <20251111-verelendung-unpolitisch-1bdcd153611e@brauner>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 10:30:22AM +0100, Christian Brauner wrote:

> > Incorrect.  The loop in question is
> 
> Are you aware that you're replying to a bot-generated email?

I am.  I couldn't care less about the bot, but there are intelligent
readers and the loop _is_ unidiomatic enough to trigger a WTF
reaction in those as well.  Sure, they can figure it out on their
own, but...

And yes, catching places that might smell fishy is one area where that
kind of bots can be genuinely useful - triage assistance, same as with
sparse/cc/etc. warnings.  With the same need to LART the cretins of
"The Most Holy Tool Makes Unhappy Noises - Must Appease It" variety,
of course...

