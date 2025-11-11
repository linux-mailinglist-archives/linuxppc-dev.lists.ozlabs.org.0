Return-Path: <linuxppc-dev+bounces-14079-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C3C4C2FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 08:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5JgP6t2wz3fm7;
	Tue, 11 Nov 2025 18:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762847601;
	cv=none; b=Hv+L/UQYyQ+Wp6iJyPBBjo9ZD3Zl3VZgnDBER2UGwSlc2afZ/vUdtbVJ+60dp9cwfqf6K6fwFyt7I0y9tgJR7h6A+DGXXzshhs2SEucyFbmQWL3jPtCopMGfsVtZt0F7YOChJDdPCTaLma3DLGliu0uyc/KKjhSbe9xsbdejo5QYejQlkXB29CekJnW/1xKGAdFNazuLsFRJVLwmsmdPUyOQe2HxiewFvlTQjPlGnaAWKHHGGuwMnyhv4ZIVouhMj5OyMHHjALVymG2oUvqipYBiUGYIfqyRlbRmFnkLm2NJEBd3P7MUwfRyuFu0kikXMYJYlH4hLuMAxs6YR5VFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762847601; c=relaxed/relaxed;
	bh=NLoaUhRplSc2c+OLwLIc3JhAwVgSH0o4v+ejZHdX3XI=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=OtbZVxDRNXPIqasEvAqFfAYpTSTeJEmUQ+xYv0CHTc1uSr0iUjM/mUDH7E1q/amUumrZEIG4Jp3xwLi/fyXFV5uDNtBUdBmOqJ7vTfuNRvy5/trveJ/VumT6SYtbgG4P9MI/ts9WMKnFDpRN0udX098sXSPDZBrRklD0Cv0j1xDMcgw7vGnTuM1Zw2tOOMpT1qqz4dLJ0VdBIwaos5whNdL4T5DfwXoCf6o6VUuP2HZ/OC5A2dDxFo+YbdgnO9Gf+G57l9E547kPvzG1AwHMusgMVwlShxbG1TaYlEuxhCFAfipBupNz1MunaifMutghVFyLhv3vfWqhbih3BZ38+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o8p0McGb; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o8p0McGb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5JgN6q1Jz3fm4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 18:53:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 034B143E59;
	Tue, 11 Nov 2025 07:53:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73270C116B1;
	Tue, 11 Nov 2025 07:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847598;
	bh=7qxex0fb9sux6H6YiFyflQQ1fF27LToi81rAOC7nyJw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=o8p0McGbUBg/mt4W0NwniQY9deSF651afKOoP439t4jTJeKv5LTx9vea9SGEQP8si
	 Q+5a+sIU7/rr5zqsP+ur8SebApGAvWVYTCiHpEoBxnRS/ATLz92ZlOpzA+IPHvqxX7
	 dy4GVB4pVeP8wFW2h7PYHaYeO0gbrMbOZYKJPHlrur9uUuvNsp9xny9Zx+MXTS3GYV
	 cqyVrLtwlM6rSDu0Fgu90qu055/duQnw869B0CGPbEtwgor0ofWM7MG2wjg4jSiR0W
	 0z4Ylk8vrW16xqRUmM/x1Dj8l4LfK4kIc0/1RsgkaikoHSoF9wMUFwvk/QGdaVgMjc
	 CIoMYVMhdAYTw==
Content-Type: multipart/mixed; boundary="===============1170773288298516893=="
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
Message-Id: <70d825699c6e0a7e6cb978fdefba5935d5a515702e22e732d5c2ad919cfe010b@mail.kernel.org>
In-Reply-To: <20251111065520.2847791-35-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-35-viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 34/50] selinuxfs: new helper for attaching files to tree
From: bot+bpf-ci@kernel.org
To: viro@zeniv.linux.org.uk,linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,brauner@kernel.org,jack@suse.cz,raven@themaw.net,miklos@szeredi.hu,neil@brown.name,a.hindborg@kernel.org,linux-mm@kvack.org,linux-efi@vger.kernel.org,ocfs2-devel@lists.linux.dev,kees@kernel.org,rostedt@goodmis.org,gregkh@linuxfoundation.org,linux-usb@vger.kernel.org,paul@paul-moore.com,casey@schaufler-ca.com,linuxppc-dev@lists.ozlabs.org,john.johansen@canonical.com,selinux@vger.kernel.org,borntraeger@linux.ibm.com,bpf@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 11 Nov 2025 07:53:18 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============1170773288298516893==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index b39e919c2..f088776db 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c

[ ... ]

> @@ -1197,6 +1197,25 @@ static struct inode *sel_make_inode(struct super_block *sb, umode_t mode)
>  	return ret;
>  }
>
> +static struct dentry *sel_attach(struct dentry *parent, const char *name,
> +				 struct inode *inode)
> +{
> +	struct dentry *dentry = d_alloc_name(parent, name);
> +	if (unlikely(!dentry)) {
> +		iput(inode);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +	d_add(dentry, inode);
> +	return dentry;
> +}
> +
> +static int sel_attach_file(struct dentry *parent, const char *name,
> +			   struct inode *inode)
> +{
> +	struct dentry *dentry = sel_attach(parent, name, inode);
> +	return PTR_ERR_OR_ZERO(dentry);
> +}

[ ... ]

> @@ -1887,31 +1887,23 @@ static struct dentry *sel_make_dir(struct dentry *dir, const char *name,
>  			unsigned long *ino)
>  {
> -	struct dentry *dentry = d_alloc_name(dir, name);
>  	struct inode *inode;
>
> -	if (!dentry)
> -		return ERR_PTR(-ENOMEM);
> -
>  	inode = sel_make_inode(dir->d_sb, S_IFDIR | S_IRUGO | S_IXUGO);
> -	if (!inode) {
> -		dput(dentry);
> +	if (!inode)
>  		return ERR_PTR(-ENOMEM);
> -	}
>
>  	inode->i_op = &simple_dir_inode_operations;
>  	inode->i_fop = &simple_dir_operations;
>  	inode->i_ino = ++(*ino);
>  	/* directory inodes start off with i_nlink == 2 (for "." entry) */
>  	inc_nlink(inode);
> -	d_add(dentry, inode);
>  	/* bump link count on parent directory, too */
>  	inc_nlink(d_inode(dir));
> +
> +	return sel_attach(dir, name, inode);
>  }

Can this leak the parent directory's reference count? The parent inode's
link count is incremented with inc_nlink(d_inode(dir)) before calling
sel_attach(). When sel_attach()->d_alloc_name() fails and returns NULL,
sel_attach() correctly cleans up the child inode with iput() and returns
ERR_PTR(-ENOMEM). However, the parent directory's link count has already
been incremented and is never decremented on this error path.

In the original code, the parent link count increment happened after
d_add() succeeded, ensuring it only occurred when the full operation
completed successfully.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19257803162

--===============1170773288298516893==--

