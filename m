Return-Path: <linuxppc-dev+bounces-12534-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C14B94EED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 10:11:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWCNQ16mFz30Vl;
	Tue, 23 Sep 2025 18:11:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758615062;
	cv=none; b=khhHtzp4mNynM6ELG00UnVW8NqQdJLB3OXpdvQU+tn7a1pxlIDWyYOafIOoKx1LzjSjH0s1qdUZglCRT+CRwoo4nqIvYdTu/Vxu1jaE7IaIG5fLNdgvzdPdI0IlJ42nxWqBvebgjg50ApE2UacApU6y28Kvwazm595dEkFSJzsmYAvmIB166ERPdfPnQ0b8qk+Re/gVurGiZC0ttsHPIGB6csZPgMeFe9/uX3jpJrSJc22U5WyIMrbClDo5jBGE6jUqK+RA6a3YtMeZMri47MM8/pXxixD6fUbpSObnMbrVXRO/hUCNLLfDu8fcrHL0+iD4PBw3ksnBdY+Kbh2qAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758615062; c=relaxed/relaxed;
	bh=te/G0STKsRf+JUAJrOuyiaVBizy+3KQ+LNdEyrQfriQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cd1g32rV1VbrvnTt7ythjcXPLSFr2xZ1aq+ZBsgyl+JOdKYCvoXYPR+L0GgoQM9dHI1wIdG5xJKJ1YKOyG/NJErNtL8RI/pz6AhTQKTt/Sbu60NOlbv9px1Uby3g6unwyw0Ei7fs66u8mWyBhI2HSj/n7F7Ajy7N+0XCv6S1+jaUshRTMyKP4RNUacOu6pvGjwghT9+Q7KnuhpP0wcoR15/sW1t6SXgCSjSiwybwEFpQY2xfBWPzFGPIBCho6Hh94SSHa1fLTci/iIAcCTUeCHl+OCT+ICWp0zYQQ3wRPBzMVLYgZvh66onxf9/oYgjqu2vivFFcS6J0EfOqrqRBTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oPlBAEyN; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=oPlBAEyN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWCNP4BPsz2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 18:11:01 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FCAF432CE;
	Tue, 23 Sep 2025 08:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BC2C4CEF5;
	Tue, 23 Sep 2025 08:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758615059;
	bh=G0FiE47jVMNmpHliwL+OFzsubcfkWiZQF2cHX5bGqrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oPlBAEyNSLE1mtMEit6tAgK95hSg/hQTQW8/itpwYbFtcgCyVxu4reyy4ldr1c/IK
	 ZQusSk+EIFC0Q9C0waJXT6N/Edur7zGGkpqtktnCK/BVRYXqGUZC9z7F1hnhPo9c1P
	 jIKc+xsaDiUXbddhTssHmndVtd4oud76X/HX5OfI=
Date: Tue, 23 Sep 2025 10:10:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
	miklos@szeredi.hu, a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, linux-usb@vger.kernel.org,
	paul@paul-moore.com, casey@schaufler-ca.com,
	linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com
Subject: Re: [PATCH 18/39] convert debugfs
Message-ID: <2025092344-bloated-twister-682d@gregkh>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-18-viro@zeniv.linux.org.uk>
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
In-Reply-To: <20250920074759.3564072-18-viro@zeniv.linux.org.uk>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 20, 2025 at 08:47:37AM +0100, Al Viro wrote:
> similar to tracefs - simulation of normal codepath for creation,
> simple_recursive_removal() for removal.
> 
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  fs/debugfs/inode.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

