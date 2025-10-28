Return-Path: <linuxppc-dev+bounces-13415-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C90C128EC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:33:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwXvm5kF7z3fqm;
	Tue, 28 Oct 2025 12:33:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:a000:7:0:5054:ff:fe1c:15ff"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761615220;
	cv=none; b=liEhQNl8gVo18whBG/GSGWEoVysy+QZodqdjFruyX2T7zL/dle97md4puqOqLjdMUpEcwJGHSaU/fKUnjAnL5ZBt6HEC49ZX1drSEGflCE2GduMABMOejHr8xvLv5LgINSMeEgKsoziYA0M017yX+WZbUcPJwi9K5GJeyiGtLQQTz1W693xj41uCZa/rLS44L5JKadUL89KFicee8vhvbWPk29vW0vy3YIApW6nPhNNHbuhwur8FQ4hiS49jG1v7Zhe3Ndn+VxZAyrVCxSYngZ7JudNBb+GzSxyuaT8gQD0nREktU3uwNPKxGK9vz0XrpCwwK9CiRko6G+UAkekYcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761615220; c=relaxed/relaxed;
	bh=6EhTcx4XVYoBHVkNibUDLjnZaviM/uEjsjdvqBMDQHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWqbuG84xOx73Zz7AXMvnG7UF0hH6k3N/e/0MH757ey4BaAMxPRzBtsFn8iG9ws5CwVeggYUWxV3j/LT/LKfo55wkni9aW4ghbSqD5TtgqK0rMzkY18bjtzfRaNEe0yZ4NasF7FCHsvAEQp7YQ1IEqWYz1zp/a46/CguzJzgsR1PetlDGal0JQKFMLyt5P0yHr8CLOPL3zgpQs3+ovRNbimQ68GP8btDgNMeoSYZOSAeBpgcRaD3emqXRtDO7NSg2msrl+QX9EtvsYDGnIVFgmAnJszdj6YdPV2KUIZzkxV70tBocqSz5DQeF2unfUJ7E3bDG+aWxc0+b4+28UK9gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=iSLxKvvt; dkim-atps=neutral; spf=none (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org) smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linux.org.uk header.i=@linux.org.uk header.a=rsa-sha256 header.s=zeniv-20220401 header.b=iSLxKvvt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ftp.linux.org.uk (client-ip=2a03:a000:7:0:5054:ff:fe1c:15ff; helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk; receiver=lists.ozlabs.org)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [IPv6:2a03:a000:7:0:5054:ff:fe1c:15ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwXvl74Zrz3fqk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:33:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6EhTcx4XVYoBHVkNibUDLjnZaviM/uEjsjdvqBMDQHg=; b=iSLxKvvtuhp7vyTm2gF1EkkIBc
	VueY3k/5kNwOCT60HJvudYt/pn3+nmuXN8BlmSieBlAk9P1lFjbnXfWWohkokyPBzwL6mC3YK0ypj
	sW84+IvdJ1yjbhOgc0P0eftHSrMDFpdFWkNpDO9jxNZQH/EQU+717GyU1YjNSY8UPlXoOVYqQCNUm
	L1/m2fq5epG+ZpDNUkQvsZfuwbXAFt2ERX3bKTejVx1aC8c4ns34fe3bXqhBWWrfvJuyhBA1jOWFs
	o+wjASO+eBBtE0L3jWo+tNcmc1JNpVF+OC3oqVXlZd+U3SoLopqjWLJ5T8ciF4EV4rkTBl4haONpo
	JNpPWnYA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDYaW-00000002gKs-2u1f;
	Tue, 28 Oct 2025 01:33:28 +0000
Date: Tue, 28 Oct 2025 01:33:28 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: bot+bpf-ci@kernel.org
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org,
	brauner@kernel.org, jack@suse.cz, raven@themaw.net,
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
Subject: Re: [PATCH v2 23/50] convert spufs
Message-ID: <20251028013328.GL2441659@ZenIV>
References: <20251028004614.393374-24-viro@zeniv.linux.org.uk>
 <022fbcc8127b3bcf15731de7956ca892619da224487161febb9ef1ed4c71597a@mail.kernel.org>
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
In-Reply-To: <022fbcc8127b3bcf15731de7956ca892619da224487161febb9ef1ed4c71597a@mail.kernel.org>
Sender: Al Viro <viro@ftp.linux.org.uk>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 01:15:38AM +0000, bot+bpf-ci@kernel.org wrote:

> >
> > -	d_instantiate(dentry, inode);
> > -	dget(dentry);
> >  	inc_nlink(dir);
> >  	inc_nlink(d_inode(dentry));
> > +	d_make_persistent(dentry, inode);
> >  	return ret;
> 
> In spufs_mkgang(), can this call inc_nlink(d_inode(dentry)) before
> d_make_persistent() instantiates the dentry? The dentry is not
> instantiated until d_make_persistent() is called, so d_inode(dentry)
> returns NULL here.

Screwed-up editing - that should've been inc_nlink(inode), of course.
Fixed...

