Return-Path: <linuxppc-dev+bounces-13414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC8C128C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 02:30:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwXqZ1kCwz3cZL;
	Tue, 28 Oct 2025 12:30:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761614143;
	cv=none; b=dZDIRmOfzkoHMAFC1EY/QanphAnyb2NismLl4/XmiM2ugaXZOESa7FxBIOCB6p2VMMBigBLwjU/W/xQWIFyGc0KR1717DabL6T+yHBOn+krjxAB8CgA98xFraz/+GB6SCZ19p+gXteEfodOdcF1GEgEnos8xCNJQtEm76Mb0pGbTJh+mCMOTEKk4Z+3dIZ6NVKPhMvVjyayC4OqaMfFODvdSwzJoFnxgILgI+5RUCZnrcDcEmxlf5BiE15TUdixY5KdHfXhEaAKoV89PFKW3BIPsRcfR8JkJeVeKWAtyAFwMhq1uGroo3FZaZbCDGogfWiBcZdEv+h97a4pb+YCmaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761614143; c=relaxed/relaxed;
	bh=bOQ1Ne0AqDDrph5fTBEt5Su6YDHYv0+Dldqs58lMnUg=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=TdtiCZ5ta/MenxCYqGFdZsRZaNCP1wjN59tI2AT0QZ2WJjyPRsFsgjP8Ih8du7vblLrM2wW6WzMK/htOUyQ5lJV6CNOVN2fdm4l/tZDFtexx1U2TcQP+n9WottaMBejSYa2wOpZo7J5M6tgERtl9JHhpFY485E0swlTS58Oa//RtSDq87wPRN9weQ3oGBpdDqHJSyjw4Td7Vk2d3FBqoWMWyKDEuHzZh9bOb8InCaPFUpSKzLCDxv/gtY+dMBLM7YW/StvlhtbuijJC8HL/iUZaB3MovdH76zQS09lVRBaDEKoojNIEeMFPKo2HAUID1q6MUdOMXNbXURoJ7X26UGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D6YozAOS; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D6YozAOS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwXW23hc1z3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 12:15:42 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 97D8843D32;
	Tue, 28 Oct 2025 01:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D295C4CEF1;
	Tue, 28 Oct 2025 01:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761614140;
	bh=hZMNoT84NWTUnJ7xeU4dTqY3HFxtGS2LILZkNTb0rRQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=D6YozAOSL4ftkP1327QSAIyotS32B0Q61n32u8VQuijuZFU6ZGCDkPw9rpPPx2X/d
	 jPdBfxTrUvESTVDaPBpKoau0kghcyTvqfhAUE3k343cWjmoS8FFpTh9ENMdhx9nay3
	 DpIjPkZUoV0H561FWIL4G9bQoY03UPf13yRixAe5Zt9eMV8Gg9vBvvlEJs3R6mVNCO
	 cVvt8FKZ0wSlX84xMC2Q/FN0g9SoZSGxUOEDkrBpSJf4YjLIn2OLuu/+O+RjNnQS67
	 Nrcaqwl12T0AYIYui6OyoRJCoaCd+Bb4jdUMSvGLZiwMDSCkJ2jeFyQBv/NGmnACJ0
	 z5mJ/sXQZgy2A==
Content-Type: multipart/mixed; boundary="===============3821749126373374714=="
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
Message-Id: <022fbcc8127b3bcf15731de7956ca892619da224487161febb9ef1ed4c71597a@mail.kernel.org>
In-Reply-To: <20251028004614.393374-24-viro@zeniv.linux.org.uk>
References: <20251028004614.393374-24-viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v2 23/50] convert spufs
From: bot+bpf-ci@kernel.org
To: viro@zeniv.linux.org.uk,linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,brauner@kernel.org,jack@suse.cz,raven@themaw.net,miklos@szeredi.hu,neil@brown.name,a.hindborg@kernel.org,linux-mm@kvack.org,linux-efi@vger.kernel.org,ocfs2-devel@lists.linux.dev,kees@kernel.org,rostedt@goodmis.org,gregkh@linuxfoundation.org,linux-usb@vger.kernel.org,paul@paul-moore.com,casey@schaufler-ca.com,linuxppc-dev@lists.ozlabs.org,john.johansen@canonical.com,selinux@vger.kernel.org,borntraeger@linux.ibm.com,bpf@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 28 Oct 2025 01:15:38 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============3821749126373374714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


```
commit 0e359e5d712e3abcf8056b43da12f092c37e9f21
Author: Al Viro <viro@zeniv.linux.org.uk>

convert spufs

This commit converts spufs to use d_make_persistent() instead of d_add()
and d_instantiate(). The conversion includes making dput() unconditional
in callers and changing from kill_litter_super to kill_anon_super.

> diff --git a/arch/powerpc/platforms/cell/spufs/inode.c b/arch/powerpc/platforms/cell/spufs/inode.c
> index 7ec60290a..f21f7a76e 100644
> --- a/arch/powerpc/platforms/cell/spufs/inode.c
> +++ b/arch/powerpc/platforms/cell/spufs/inode.c

[ ... ]

> @@ -241,11 +240,10 @@ spufs_mkdir(struct inode *dir, struct dentry *dentry, unsigned int flags,
>
>  	inode_lock(inode);
>
> -	dget(dentry);
>  	inc_nlink(dir);
>  	inc_nlink(inode);
>
> -	d_instantiate(dentry, inode);
> +	d_make_persistent(dentry, inode);

[ ... ]

> @@ -479,10 +477,9 @@ spufs_mkgang(struct inode *dir, struct dentry *dentry, umode_t mode)
>  	inode->i_op = &simple_dir_inode_operations;
>  	inode->i_fop = &simple_dir_operations;
>
> -	d_instantiate(dentry, inode);
> -	dget(dentry);
>  	inc_nlink(dir);
>  	inc_nlink(d_inode(dentry));
> +	d_make_persistent(dentry, inode);
>  	return ret;

In spufs_mkgang(), can this call inc_nlink(d_inode(dentry)) before
d_make_persistent() instantiates the dentry? The dentry is not
instantiated until d_make_persistent() is called, so d_inode(dentry)
returns NULL here.

In the old code, d_instantiate() was called first, then
inc_nlink(d_inode(dentry)). For comparison, spufs_mkdir() uses
inc_nlink(inode) directly instead of inc_nlink(d_inode(dentry)).

[ ... ]


```

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

In-Reply-To-Subject: `convert spufs`
CI run summary: https://github.com/kernel-patches/bpf/actions/runs/18860600716

--===============3821749126373374714==--

