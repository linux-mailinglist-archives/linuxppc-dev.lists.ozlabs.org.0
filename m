Return-Path: <linuxppc-dev+bounces-12491-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD79B8E58B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Sep 2025 22:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVJC06Z91z300M;
	Mon, 22 Sep 2025 06:44:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758487484;
	cv=none; b=UalxNF1aEWYBlnF6Uxf31IGW2wTvDSUscC/Jn0AdlItbqwP2AekwxOWMPJtOpqzNR93GCGMXdL2Tpz3PYkS/nhx7Eu7IbSLUfZcTtSU40HVVtqSMoAHwn3Zv6tlA21+F6/cgMWDc9XVCwLrzmS/NAfTpgX4fERSXtEy+obJ1cnunqJ2iJN9EmkFLxxkkwxHT6zpw2+0+vOBzvOF3MOkdHAb6tTXrz7RRHcjnjIFATGXW4lGixF8KHhhc/CCJ1ycAF3n4iVy9GEEtqXENfv01BynGLPp9bZ7KTpq3ZbfH2ALvqi8W5tDeVmL+e09boHc7+lGeckpfyHL9a5yL38EJjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758487484; c=relaxed/relaxed;
	bh=lrp1vYn8+/NUY8DL+Z+wSSTE0867IgQjPinmMLmeavI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxGUbzvyXoYPhSk1Gu8qKkelfIzAqrdaSo27OztPqop/VdJVCV2NhNkBUxi1WQCqM3SedjC0RhFY4TrGJoZhxgkSC7CmreE/efSuL8QdSxktWt5I0gq5gRgbipBIzJDl6q+XXZ1CubdTCe3cqwLgivdDl7ya9yadeUnLdv1H11TRmlIOKw0hzpufE9Y1ERLTsbaVnO4jRxa41GNT4hlnVl+ma3mQbwAx5njWvgbxiNvq7NwiP4sFW3VnCIgGDfCJB6LJBi/c+dBwsVK3IVEBXY14efqsQ37imKoGeOVvlh4D2Hvk0EgCvhKMbFLuemH7txLwcuCd+GTk7DEvSreX1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=UoUvyYdV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=UoUvyYdV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVJBz5b08z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 06:44:42 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-330631e534eso3252625a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 13:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758487480; x=1759092280; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lrp1vYn8+/NUY8DL+Z+wSSTE0867IgQjPinmMLmeavI=;
        b=UoUvyYdV4KfEuZ9bYRlMyg0QYJrtUEUmhdRpXjQhxWkf0MnQKD5dbOBsyRJSKgEwAv
         68G1zNXoLHcrhCyRN80r8NZSSMZgrpubo1nY56hS40FosNsdcfBLKcEdLVFjELRbM2mV
         eU79SUzU2uhJPa3YsPo1SomVHQpE42wt/46aawC2ZBPWGEgIZuZOwpNIRYDCOexpGiO3
         wNIgXDzp9cs+jdSiO+Nofiei13ZD9GP+3341LQJTKcnG/6dhO9PxTSL7RvRYhLyYEiU6
         5/vJE1RcBtzAYhCSuosH0NtxfuHWhasvHp3TXTD4ZxRzL4C8ykO5LHC4UQ00b6CdhxHV
         PioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758487480; x=1759092280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrp1vYn8+/NUY8DL+Z+wSSTE0867IgQjPinmMLmeavI=;
        b=SvO5rey/+Q7FUJf/tqWfKLEB28EKOxMuo0VVd5AlUuP991Whkki2sTZ306PBABgNEI
         yntFDlkYJT8uz9RLyp4uB3a3JMFqNbRLDl0uWsRfB83BwyetfY2Wn+f/sSF0SxWtk1NO
         nzSTWAoXUVD1+jRJEQ9p+PBQ6xUDPVXrcjP+jk/KhK4nd8xMrwCLh86+Cb4W41hOTSDd
         6CEL2tEEDfgLz901vN0jDKY1BlJ1dLMFmw+UjmVP+8J71Y1phobTCKHYMDof8Dl5zjom
         ms8oVxgVTGj0hjz7C8CK36d+kKYFy+GuLgloAs0gUYVovg2gp6mQzSZev0HbJrxQsBoJ
         I5pA==
X-Forwarded-Encrypted: i=1; AJvYcCXPIDAIcwLwxEOSSBNFSBUzXPHvf83UinSt6508AWDOnlPqH/XsxWQWLHxp6w1h1jGbd+wPTBKAOBuNSAw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyuNyqgfucfab+fBBZedu4GnYJIs2XB61DN+Jg7o0ziTRKIZsrd
	uFamCd0kFAiVG9UJsz6hkf4aNXsye8Elvjh9lczMLSFKd1KD5Lvkl1xYLjuOTa4NgDn4qImpx3F
	DPcSxw5+jmKkbptSiZVpDGegNA/fmx2TTt+wUi6ur
X-Gm-Gg: ASbGncukNozWCwXXtGvhTqlv3nLfbm33X7UwLm/qeRYyJqveRSBgvjk+YRtxoMcWsVb
	OVu7snSTbJQ7kQkHSS6qZAEhOrhuyBgktwi7LFduU7i8DUbTR4F8XouwAOhP5Prm3FCWDNuFwW5
	gl4by9nD/UXz5C9J3CA9mNeEo5Lu73igUBv/hoJipGF5YIq5S5nDZcsNjTsrSvSSjt0uQX7WI7j
	uv+lNM=
X-Google-Smtp-Source: AGHT+IHAbyCRLo/SSuvdFEQRy5JpOpl0NDRXzF/3drghYuhCInE4K6vDNKt06XHhxx3gZXaSMmGzjnpjA/kIMwyAfV0=
X-Received: by 2002:a17:90b:3c06:b0:32d:17ce:49d5 with SMTP id
 98e67ed59e1d1-33098245d63mr11380894a91.23.1758487480037; Sun, 21 Sep 2025
 13:44:40 -0700 (PDT)
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
References: <20250920074156.GK39973@ZenIV> <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
In-Reply-To: <20250920074759.3564072-31-viro@zeniv.linux.org.uk>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 21 Sep 2025 16:44:28 -0400
X-Gm-Features: AS18NWAIN9lhY1WlDGBZGFYNywlyC9vJx6yZK1w_BS23ADZS6YvZADa5RlquZNs
Message-ID: <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
Subject: Re: [PATCH 31/39] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	a.hindborg@kernel.org, linux-mm@kvack.org, linux-efi@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, kees@kernel.org, rostedt@goodmis.org, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 20, 2025 at 3:48=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> Tree has invariant part + two subtrees that get replaced upon each
> policy load.  Invariant parts stay for the lifetime of filesystem,
> these two subdirs - from policy load to policy load (serialized
> on lock_rename(root, ...)).
>
> All object creations are via d_alloc_name()+d_add() inside selinuxfs,
> all removals are via simple_recursive_removal().
>
> Turn those d_add() into d_make_persistent()+dput() and that's mostly it.
> Don't bother to store the dentry of /policy_capabilities - it belongs
> to invariant part of tree and we only use it to populate that directory,
> so there's no reason to keep it around afterwards.

Minor comment on that below, as well as a comment style nitpick, but
overall no major concerns from me.

Acked-by: Paul Moore <paul@paul-moore.com>

> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---
>  security/selinux/selinuxfs.c | 52 +++++++++++++++++++++---------------
>  1 file changed, 30 insertions(+), 22 deletions(-)

...

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 9aa1d03ab612..dc1bb49664f2 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -1966,10 +1973,11 @@ static struct dentry *sel_make_swapover_dir(struc=
t super_block *sb,
>         /* directory inodes start off with i_nlink =3D=3D 2 (for "." entr=
y) */
>         inc_nlink(inode);
>         inode_lock(sb->s_root->d_inode);
> -       d_add(dentry, inode);
> +       d_make_persistent(dentry, inode);
>         inc_nlink(sb->s_root->d_inode);
>         inode_unlock(sb->s_root->d_inode);
> -       return dentry;
> +       dput(dentry);
> +       return dentry;  // borrowed
>  }

Prefer C style comments on their own line:

  dput(dentry);
  /* borrowed dentry */
  return dentry;

> @@ -2079,15 +2088,14 @@ static int sel_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                 goto err;
>         }
>
> -       fsi->policycap_dir =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAM=
E,
> +       dentry =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAME,
>                                           &fsi->last_ino);

I'd probably keep fsi->policycap_dir in this patch simply to limit the
scope of this patch to just the DCACHE_PERSISTENT related changes, but
I'm not going to make a big fuss about that.

> -       if (IS_ERR(fsi->policycap_dir)) {
> -               ret =3D PTR_ERR(fsi->policycap_dir);
> -               fsi->policycap_dir =3D NULL;
> +       if (IS_ERR(dentry)) {
> +               ret =3D PTR_ERR(dentry);
>                 goto err;
>         }
>
> -       ret =3D sel_make_policycap(fsi);
> +       ret =3D sel_make_policycap(fsi, dentry);
>         if (ret) {
>                 pr_err("SELinux: failed to load policy capabilities\n");
>                 goto err;

--=20
paul-moore.com

