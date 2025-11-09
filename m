Return-Path: <linuxppc-dev+bounces-13978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8387CC446F0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 21:40:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4Pnk44dsz303y;
	Mon, 10 Nov 2025 07:40:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762720842;
	cv=none; b=IedQBvbEGjwlVtW9Luez8XKSDmAewlYwpJxyj9c6I9ACiE7WQaD+DuxOvxMno1O4QLOhQOZcgmeCgOrKL9rJMcLC0xCt21W6/s8Cfpg5pYossDVaGe7LAg/VD522E4JFqyoAx7pO/DxhHclCcYaxdflqcqm3TN+BiwP06rBPZHKudXBqZdJtBq9B4BUy3mpJSzd/7+n4JDzR0BP6lygz4C9aJnP0BFBwk8qdtGd/FaJCeqAtLQrtM1JOkRs7Tqz3LXqPMpItFNi88pvaVmN7JSDDlvVWbhjn1/BL+gzotF/wdhN5HthVbwZqxqvU9suimVlK7aLOsoWhtIXO8dodMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762720842; c=relaxed/relaxed;
	bh=BfmRhkxrsEs9tOM8wGbk7dXcVXNceBqTXcIhtt2SrKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFdL38Ai/vlvCc5F5Rn4Q745rkcrpxZk0Iq1dvYI1wS8B7m1JTRbJb1Sl1BfbJE3qLLMviPaO0RhIX6qMYnUwzp9jfiWqKozyN+uS8qlZfrYQqJouX2UmYZNSQQCA4XuLCKFrKFGbwLHIeEgB5H1yzogHR1uNwXaxMG2qLUxV2xJkRHUGUgHG9WKBtLgK+Zb5ClAJNA+Tj2o1Sq5yudPD9gtUaY08bx05Z4mh6Jlb+1vzAVWZxPKgCHaSFHxA2IkHC+h+metJ8K5TyVhrOBYUZdL4b6R018KcSnq361vuQBxTWsNEJWvXJ5GZzDvaOzyDRurHkNvOK0namlWXZWMaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=wUuaVauM; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=wUuaVauM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4Png1fqTz2yG2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 07:40:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BfmRhkxrsEs9tOM8wGbk7dXcVXNceBqTXcIhtt2SrKs=; b=wUuaVauMMR7ErCaLipgahv02uK
	f8zmYZUSkXrkSeIWVD+p2We+E7S0R1h/RkWnDRzYS23UkSGwmELAbRJJxSREYjeqifZdYxQ0MI7Y8
	whP1b+2iLCrarO1lAoXJmD7YCetyf1ykJN7sVe3HCohmhOOvBIYllaLsgF2qgYoPuJ6bpGVgIgYwX
	WVTBkowQ1Lmcdjvk4p6fM2kbY7LuhZft2NVC8ulf4OPzi+fEUEktbxyTH2D3vg2+jh6CBx75Obxt7
	6/7552MEzeebUdxzenriy13HTG10/jzbqdfcj+Rdt/3+FhTjfYrzTwilZk/MP+73IUGSCKVk2vREG
	7z5iDtNA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vICCw-00000007AxF-0Wo7;
	Sun, 09 Nov 2025 20:40:18 +0000
Date: Sun, 9 Nov 2025 20:40:18 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christian Brauner <brauner@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-fsdevel@vger.kernel.org,
	torvalds@linux-foundation.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org,
	linux-mm@kvack.org, linux-efi@vger.kernel.org,
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com,
	selinux@vger.kernel.org, borntraeger@linux.ibm.com,
	bpf@vger.kernel.org
Subject: Re: [PATCH v2 22/50] convert efivarfs
Message-ID: <20251109204018.GH2441659@ZenIV>
References: <20251028174540.GN2441659@ZenIV>
 <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com>
 <20251029193755.GU2441659@ZenIV>
 <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
 <20251105-aufheben-ausmusterung-4588dab8c585@brauner>
 <423f5cc5352c54fc21e0570daeeddc4a58e74974.camel@HansenPartnership.com>
 <20251105-sohlen-fenster-e7c5af1204c4@brauner>
 <20251105-vorbild-zutreffen-fe00d1dd98db@brauner>
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
In-Reply-To: <20251105-vorbild-zutreffen-fe00d1dd98db@brauner>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 02:43:34PM +0100, Christian Brauner wrote:

> -static void filesystems_freeze_callback(struct super_block *sb, void *unused)
> +static void filesystems_freeze_callback(struct super_block *sb, void *bool_freeze_all)
>  {
> +	bool freeze_all = *(bool *)bool_freeze_all;
> +
>  	if (!sb->s_op->freeze_fs && !sb->s_op->freeze_super)
>  		return;
>  
> +	if (!freeze_all) {

Minor nitpick: do we even need a dereference here?  Just check
whether the argument is NULL and adjust the caller...

