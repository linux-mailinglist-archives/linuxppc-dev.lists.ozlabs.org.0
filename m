Return-Path: <linuxppc-dev+bounces-13417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C82AC12988
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwYPh593dz3fnY;
	Tue, 28 Oct 2025 12:56:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761616568;
	cv=none; b=cqFoS/oFf8wU0oHy65K3+WSXo+Z6jILeBa0qRsXwC7DIvPsSBwEilb+lzbPQ1eJTqN+TF+vDtfa6YhdZFi24ypLIqSeiEBUp7rBijOhxX0FM8eLHpp4tgCFU/ucipf/3poc4qgZfI85CJwCMKGlrW6ntSkcaYB9n41v/aWVasQqXx3yXRLoknqKHl/vK7O1MZOxq/aJTolXbfJGZ5fXKwxJC4+YEQ0HuaomQRB9GAM8tuMLnBJUTegg7ExZyt2YvFCeRTYVGaBBpKScFIqLeRnjHVf1QMHxRUfHft0G1Plob52C2G9zCrGTsLTOs/900F/Jfvktk3lNVm4JVfvobEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761616568; c=relaxed/relaxed;
	bh=NMWzOpxOLp7djj4rryockFPgtDMeGtwU0HcuCp9Qs50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dAuDTX6CwvSuY/b5+FiTpRiXg1hRuhBPpqiC860qKA3ai/6e3n8+0uzeeP8UcFeBZ6QHeqzANjLHyzbxQc4DALpuh4ZalIHJpBnxLJk2aA7GpbCwUyFMaHaF7VZa2DOWVUvneAYV/uO+TEXuXnfT1eqNVX75pKK2nbnnkzUG9iQTJP6/lgrP3A00mF4EQakAATFA25PCaL2PnKmLZyUOlaikI48uNrausbCbaXF4QP4HfC4phdknsLKlaqVaif+OGKJwe/QLm1QwgSYukGeehf9QpiPBAtXYDaifSi+e0LRZSrYMHGK0DeTbVrWHfMZRP8QMLEVsyj3erOBwVIH/5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Le8KjsBu; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=Le8KjsBu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwYPc1bjhz3fRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:56:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NMWzOpxOLp7djj4rryockFPgtDMeGtwU0HcuCp9Qs50=; b=Le8KjsBu+85kzt1t4BL8YLSUCP
	aF48vXMeS/zemSMpkY8HqTGBwm0ZU5YrRhYzEC5oZEVC+l3smpfNXn666wRG/uExh/x7oN9MB9XOj
	zpeS72wOY36FmbBVPzYMMCQUKinAbkmV3tCxRZIrNthIThSX5espx/xsim9TTv3BqSJ5A3D6OV7Yi
	rK1NreXBBAvHNZiQc7rChyFRYtgOIkKQZt1TysBJYZfVG3/4CyNNL7QgtACAKJ466GTZWdbgE7ac4
	BJAPN7UfUYSWmql2NJztc1/1b1yzIJ4W5eLGvarO+t66RFki8ovME3q7knigxC7p/U+4mPtzoxn5X
	iyn+VxuQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYwD-000000039xT-37LE;
	Tue, 28 Oct 2025 01:55:53 +0000
Date: Tue, 28 Oct 2025 01:55:53 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name,
	a.hindborg@kernel.org, linux-mm@kvack.org,
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, paul@paul-moore.com,
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org,
	john.johansen@canonical.com, selinux@vger.kernel.org,
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Subject: Re: [PATCH v2 31/50] convert autofs
Message-ID: <20251028015553.GM2441659@ZenIV>
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-32-viro@zeniv.linux.org.uk>
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
In-Reply-To: <20251028004614.393374-32-viro@zeniv.linux.org.uk>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 12:45:50AM +0000, Al Viro wrote:

> @@ -627,7 +626,7 @@ static int autofs_dir_unlink(struct inode *dir, struct dentry *dentry)
>  
>  	p_ino = autofs_dentry_ino(dentry->d_parent);
>  	p_ino->count--;
> -	dput(dentry);
> +	d_make_discardable(dentry);
>  
>  	d_inode(dentry)->i_size = 0;
>  	clear_nlink(d_inode(dentry));

BTW, is there any reason why autofs_dir_unlink() does not update
ctime of the parent directory?  Try it on a normal filesystem:

; mkdir foo
; touch foo/bar
; stat --printf='%z\n' foo
2025-10-27 21:40:03.489427380 -0400
; rm foo/bar
; stat --printf='%z\n' foo
2025-10-27 21:40:16.853470607 -0400

and note the change of ctime of directory reported after removing
an entry in it.   All Unices since v7 had been that way...

Why does autofs unlink() need to be different in that respect?
Some userland reasons?

