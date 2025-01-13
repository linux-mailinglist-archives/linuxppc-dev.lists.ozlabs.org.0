Return-Path: <linuxppc-dev+bounces-5188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B63BEA0C1C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 20:48:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX2qV2YZBz302c;
	Tue, 14 Jan 2025 06:48:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736797686;
	cv=none; b=R+pQ/b1LXp/x9Io6xbgz8+ulMj+VmEZAsEcYqy54Ng2mFzyDlVwPzGb0UiDkkcKJNrJ/5i91AboH9FaBx9sPNuZPKZ98dzdc4pity+mexk1u4JQdxpKCt3HPId6ZE0rjT+c0vcSiXR4JeITot/0/+lIlzaY4jBxXakhw6gvVpV7zSpj1qdgTktn7HYYvFx4xVfeyxod7KCFn9Y4CHCudBzT/vamP5KfAfnU3vH2B9972jOIg++yOsLHBYhEnBhvq6oO1Ky8jbUhrlbO4f1YdDurEy7Qs4XUn4j1sKQSVmWpW/cPSNapuucTkJvJihuislH2/df4Do8elT6JPQo8USg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736797686; c=relaxed/relaxed;
	bh=/tfPUo2EO2PAFpHSyL8n5WUMBZY0Ez9O+GdUFRQZDug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIO6HNvhUvwiVWla5XCqywQqzwj1hkRWIL1fxdooOWpsnST+KnE/R1GH8mX40NMrn6SxR+FjUrtM8kjUyO2JwKFMOeJARQJ7/4Q8zFW9UECUpfjoo2hOJC4W9PywQ9X2kiD490i73/Ajlu9uWx7BbWJeWEVd7LN6k9F6+F/mA/anazmWLTGC0qy3Mu5NF12dnt558AzuWA7rQV9nLCGLZkP0LxvZTtv9HaR0BP3hoCPFfOwsss5s0+XwOaEjP6YCzdeMnPoUJ2SiA/wdKtIy10MX+EC+bWOJLYREeANHyQ1Er2L9EYV2tPvjpOeijB2DBipEMMZmy9jyUSmEOWrGSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=LCy8H8mm; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=LCy8H8mm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YX2qM1nfgz2yys
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 06:47:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/tfPUo2EO2PAFpHSyL8n5WUMBZY0Ez9O+GdUFRQZDug=; b=LCy8H8mmNuUrQvYmf0T58GQmN1
	owAyWWzaGL46R2hedjAuzzp5C7N559UXyDXIzbX0/HGurPRFDleoYZMWv1mZreb6aQEdlJKTJeuAQ
	O67mnbanGT+5vmcx5ReqlgxtWIDh3Po3R2c5i8l4i/BRuRbpj0jINSCsaRv8uUv71JTEzckird+iw
	+uEYYHQDSCGkhiKtd/NN0bQJV2vzjoCnEMlH9fAtWcavfM8BCeEFPlZO58n/66pMU/42Q+PUX+AQL
	Bkm7L8BatLEY5NQ2+ydOQ6D4ay7Auds6fMAzBLocSeGoFl2QO8Tz4PwYdMSEk/eoovROGiOMRu7qE
	rF5GbxXA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQPY-0000000113X-2J4k;
	Mon, 13 Jan 2025 19:47:44 +0000
Date: Mon, 13 Jan 2025 19:47:44 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] select: Fix unbalanced user_access_end()
Message-ID: <20250113194744.GZ1977892@ZenIV>
References: <a7139e28d767a13e667ee3c79599a8047222ef36.1736751221.git.christophe.leroy@csgroup.eu>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7139e28d767a13e667ee3c79599a8047222ef36.1736751221.git.christophe.leroy@csgroup.eu>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 13, 2025 at 09:37:24AM +0100, Christophe Leroy wrote:
> While working on implementing user access validation on powerpc
> I got the following warnings on a pmac32_defconfig build:
> 
> 	  CC      fs/select.o
> 	fs/select.o: warning: objtool: sys_pselect6+0x1bc: redundant UACCESS disable
> 	fs/select.o: warning: objtool: sys_pselect6_time32+0x1bc: redundant UACCESS disable
> 
> On powerpc/32s, user_read_access_begin/end() are no-ops, but the
> failure path has a user_access_end() instead of user_read_access_end()
> which means an access end without any prior access begin.
> 
> Replace that user_access_end() by user_read_access_end().

ACK.

