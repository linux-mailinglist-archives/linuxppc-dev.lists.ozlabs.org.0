Return-Path: <linuxppc-dev+bounces-14080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F8C4C305
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 08:53:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5JgR5Ch9z3fmS;
	Tue, 11 Nov 2025 18:53:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762847603;
	cv=none; b=bHFf1FGY/LH1EXsBtQOwYaagV1RoURz03asr9jsePc/pEKaC01IDbERpTH5ETCIH/O7J3jFAM/A0QkMKbi4LiC3wPrtQadT/tRkxGmfNJ3Pn/IrCy33aFG5kZ3unUttsGQZTVX3edXycw/rTDbOtoTJsO4nEP902ybBX0MFCdb6U1EfpBW98Q5aQoFIVTNfe6oq9iBJp8vzq6yQL0N9dYdSoNDyKoEoY3fvKKxbbRdlRmQDuttjkwoTSA2t0hAHxAcdFWrtQWfg+PClIbySoQGeyjT1J2zMk0AbHB6KWIugCTqVILL/rLmVZjflGXlEr0uz8ZhPAApXN/0E64reC2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762847603; c=relaxed/relaxed;
	bh=QSsXNui30CdY93HhnZ9iVbgXJUzgciOVZvR9PGs4bjM=;
	h=Content-Type:MIME-Version:Message-Id:In-Reply-To:References:
	 Subject:From:To:Cc:Date; b=WNZVTKAGcGpMXRsjFqLnsBwOwggfCK1UJ2tzYAOS3zU2NwkySnh5/vr9G03E+9YkvzrWoXpi9n/TxQWY7qfbQq5QcBwHi1RlPr45hyTSUY8HjkNnj55DPos+OhkkaMXrAYQsdFYNR907QqDKI/IUKqvVtG3Hz2P0XWwTcWSrH+gpNvScd6hsE5/MCEgqpBMSPNpQojeXe++s1+S3OOD2VfLG7Gp5wKxY2ctDtX877LkfAOdhafwV/EAgixXmrh36Mh7UrA5Z2XU5Qg16ADbvjIKPQ9dX8U2i//xz0iv7/UGjNi/pnJ+LQBmir4aLcTiXrScdP87/xZPXwuQc1IDH4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GT1YKP0D; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GT1YKP0D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=bot+bpf-ci@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5JgQ2k4Lz3fmF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 18:53:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7BE47418B4;
	Tue, 11 Nov 2025 07:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5EFAC116D0;
	Tue, 11 Nov 2025 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762847597;
	bh=6vLdCVtUOmwT2xBG2CthgZi9Ig8JOsV5A1e4sciMj58=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=GT1YKP0Dqo8Ysx1f1jn1aJnzunt/m+vgmkHza86dvdju2EoOZI6rbkPd7I+ZcBeM+
	 sMRoB0c30MgD2v1Yb5EZikViuPNT9qU6D1zpwh1o3OD7j4ZzdXpPAIauOb57UMw4bv
	 I60wtyPt3IyQJygJ4dixY3dw68KJmjTTO1siXWRgIfdzeLxoIP8G2HrfqFcRWayLag
	 434bWzG4C5dIXX3cv0RlRRd1dhjWeDIx9KMPU1TowHWPucntp2dQsJT9/iu1QfqbYc
	 Y/H5S/PxMIu45+cpnJF56ZFcZiXa6QAttdqqbIZMPl+jb91U6hNFBKXExqdER7dwwx
	 ib+6wzq9EnUzA==
Content-Type: multipart/mixed; boundary="===============1014260008914052501=="
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
Message-Id: <20754dba9be498daeda5fe856e7276c9c91c271999320ae32331adb25a47cd4f@mail.kernel.org>
In-Reply-To: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
References: <20251111065520.2847791-37-viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 36/50] functionfs: switch to simple_remove_by_name()
From: bot+bpf-ci@kernel.org
To: viro@zeniv.linux.org.uk,linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org,brauner@kernel.org,jack@suse.cz,raven@themaw.net,miklos@szeredi.hu,neil@brown.name,a.hindborg@kernel.org,linux-mm@kvack.org,linux-efi@vger.kernel.org,ocfs2-devel@lists.linux.dev,kees@kernel.org,rostedt@goodmis.org,gregkh@linuxfoundation.org,linux-usb@vger.kernel.org,paul@paul-moore.com,casey@schaufler-ca.com,linuxppc-dev@lists.ozlabs.org,john.johansen@canonical.com,selinux@vger.kernel.org,borntraeger@linux.ibm.com,bpf@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 11 Nov 2025 07:53:16 +0000 (UTC)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--===============1014260008914052501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 47cfbe41f..43dcd39b7 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c

[ ... ]

> @@ -2323,6 +2316,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>  {
>  	struct ffs_epfile *epfile, *epfiles;
>  	unsigned i, count;
> +	int err;
>
>  	count = ffs->eps_count;
>  	epfiles = kcalloc(count, sizeof(*epfiles), GFP_KERNEL);
> @@ -2339,12 +2333,11 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>  			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
>  		else
>  			sprintf(epfile->name, "ep%u", i);
> -		epfile->dentry = ffs_sb_create_file(ffs->sb, epfile->name,
> -						 epfile,
> -						 &ffs_epfile_operations);
> -		if (!epfile->dentry) {
> +		err = ffs_sb_create_file(ffs->sb, epfile->name,
> +					 epfile, &ffs_epfile_operations);
> +		if (err) {
>  			ffs_epfiles_destroy(epfiles, i - 1);
> -			return -ENOMEM;
> +			return err;
>  		}
>  	}
>
> @@ -2355,13 +2348,11 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
>  static void ffs_epfiles_destroy(struct ffs_epfile *epfiles, unsigned count)
>  {
>  	struct ffs_epfile *epfile = epfiles;
> +	struct dentry *root = epfile->ffs->sb->s_root;

Can this dereference uninitialized memory in ffs_epfiles_destroy()?

When ffs_epfiles_create() calls ffs_epfiles_destroy(epfiles, i - 1) after
the first ffs_sb_create_file() call fails (when i=1), it passes count=0.
The initialization loop starts at i=1, so epfiles[0].ffs is never
initialized. The kcalloc() zeros the memory, making epfiles[0].ffs NULL.

The new code unconditionally dereferences epfile->ffs->sb->s_root before
the loop, causing a NULL pointer dereference when count=0. The old code
was safe because the dereference only happened inside the loop.

>
>  	for (; count; --count, ++epfile) {
>  		BUG_ON(mutex_is_locked(&epfile->mutex));
> -		if (epfile->dentry) {
> -			simple_recursive_removal(epfile->dentry, NULL);
> -			epfile->dentry = NULL;
> -		}
> +		simple_remove_by_name(root, epfile->name, NULL);
>  	}
>
>  	kfree(epfiles);


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19257803162

--===============1014260008914052501==--

