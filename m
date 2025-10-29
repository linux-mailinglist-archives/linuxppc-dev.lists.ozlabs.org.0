Return-Path: <linuxppc-dev+bounces-13515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9F4C1B8CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:07:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxVw22Zkmz302b;
	Thu, 30 Oct 2025 02:07:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761750434;
	cv=none; b=BFgVzs+ORVosAUDo+fQLh7xEH0t7ryjaDcmY9PP6IUwJnpahDkP8i3aovWyika5GvBATBqwiFF2reL/+sPbMqtQQJRViZn17hbAg95Lf6vJfmp4x37nDsLVMm3Qsca+WcVXRyH7h8yPFJ9A/oRT665t64P+wokpd+YCZatF4M87StkAugdsNCEm9wzUtWEni/IFD3/dOyx4JlZGLvRQw2YahW/M7kJuabcpt7J3yoUKxGJKer15RIFDRr/PPOOKNLzXYn2LQh9hp8fzFOAC2Ql/ojuraVTN4wXlKQ9fsYRBhHKEgs2WrAkztOENbnCRH5KdMNJFX5p++tU4ZzxdAdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761750434; c=relaxed/relaxed;
	bh=+IfYIDKxJGGNldyfSmZN9xBlg4Ge86/H8w7OAL6l3zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V8pKuP7n7hMJVHpYoSfshU/2V2+Dajy0jaXCnQwj3Xz5pVdXAckTXvLKZfFV7i9PV99AEIX/6qM0pbb0ev3PT3UqZ8Vbw12ztTH28jSXO8UzAa+9764Bu3k6PzKXqb5+fKId+y7PbSXSZAqqlY/TpyHMDoGqANojE7cxmy1ac8eDZkFBnRCkstCOE4FK2TPOG2msgHehBte6De7ot8AEA7oPWyNvTr1J6726lZ/LilpXExOoLKpSsdn5Ig2rXP8erzrosFEaas9kK6MR2OHt8Tv7ProPWIMWvOPovOZ3UoAAvpL3FbDv8MCx5TCltde5xTkv+J87JSGn0V7YqRU36A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AGVTjjes; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=stephen.smalley.work@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AGVTjjes;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=stephen.smalley.work@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxVw11jCQz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:07:12 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-330b4739538so6676a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761750431; x=1762355231; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IfYIDKxJGGNldyfSmZN9xBlg4Ge86/H8w7OAL6l3zA=;
        b=AGVTjjespDM1C1dE6GqDxWRUBgxFMyJFWttI/L8WAjWEWZNanAaK8TXtlfXAFg8F5Y
         sgOzAfXT2adNiGMwChsq3aztpEhC4k0H2xX/0sX4eE6vtpcnJ3qNBERlFwrtGz4NgK3H
         xowI9bAhgI08kNjNVlSNw5afeKb7W4xFgIzgqrqYpj7gZDrLgQ/BKYjiK00dstbqvRrs
         NlV/88oT+AMx8peIbZNmKKAlvUPbuopOzur5YXXHCFr8QKL7Kw4TzV9t3pS5lqehWBG3
         YC/PJ0eF3ZZa/v2bBgn82mZMPdQKDETwUCIEyv2JJx7TTcfAfbnbyLD8m4mvQmt3fyyA
         jPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750431; x=1762355231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IfYIDKxJGGNldyfSmZN9xBlg4Ge86/H8w7OAL6l3zA=;
        b=G9tAZ0zTDLSyMVtRttfMleCWPi8IAU+eSrCpRY6AcSZx8mdB0ukqnRN9cTYq7GSLIZ
         oH8IQ4mW3uJMwd6eWJI6eCqUqoEYq+rPzfF0guip7YaUKbcnBO29mFoPCGwZqmhr1n7H
         KZ7KV+SHfyeYkRz9mzI+sdoUKtwn71KBVSLH6PpYi3Rhus/BHmKluUw2Tr2RWDg9E15/
         UX8NHPzDqzMpKRDhfISDq+kUPKGbBiql6lZOjlU/MmkBUtioFT6+p54sPvySTgf2BS+l
         +80lxgxzY2/f69KhcJMP1wtRlCPoW4B0XvvTZqFIwFVBF0aMG1HaVErb2AIILfNqQ8AO
         u+bg==
X-Forwarded-Encrypted: i=1; AJvYcCUykqComfmhQOPued73HaJ7pwSYmeQNwP8tn12HsdciaTzxJhZmbtDhJyjdr8VcuUynuvDFdSjbOebrhsE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzGnwpuJiJ273EcU+FWLa4k83YTV9aVq+ryuv9N1oS6J280cQ7J
	QK8KsTO9b2PLM6unM6JVlnYW298G/O1ZwZr+ANsrnSrQJr14lKjtvTx4NQ0swvVtRE2bdpUPX9B
	G0JLUMKFtidWEJHZfN/47ER2Q9UYESl4=
X-Gm-Gg: ASbGnctdCbdreHJeFzfk/WOzRzyOPZlLwcP4uhyVFvZc9hW7lVELOGiXVwryVjEx/8d
	dHcthu5jpnXIZ6TxFjGRGmBy5pUtQXHoCiqrXFw/ydjw+VXZzJx22f+ElGmR9XXKIcZKSNGK23h
	+v6CHH96mIxsI4vqSTBpLKyyEiF1I6XRhiGWA4F9D3R3aTj3POO1Gxm3a0vMWvKeVSd+xtf6nVe
	VLWA0Ic2tKVEd4NIjCSITdeUsB4zz0U5u18yDcjp1ZZ4izf//1kMEbImyQiYXhyZFp/Y/M=
X-Google-Smtp-Source: AGHT+IFVqO8ewpIAf0wvRQFGIOOwuq6fD8Gg5dHkMSFcg7AR9XFXs/odOiaOENp+NesUqtIMC2BHNrgVUxHGzL0/CTY=
X-Received: by 2002:a17:90b:134b:b0:32d:db5b:7636 with SMTP id
 98e67ed59e1d1-3403a28efb0mr3676582a91.27.1761750430698; Wed, 29 Oct 2025
 08:07:10 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-36-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-36-viro@zeniv.linux.org.uk>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 29 Oct 2025 11:06:58 -0400
X-Gm-Features: AWmQ_blCWCRSlgnSUoNEZRYW0rUX4EVkF7hJCMWu9E3EunP63rWoSyVWbO7_enY
Message-ID: <CAEjxPJ53wJEK4bzt0VMbY=G9gkzuZZA_XtrT+acwPys3p0byBA@mail.gmail.com>
Subject: Re: [PATCH v2 35/50] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	paul@paul-moore.com, casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 28, 2025 at 2:00=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
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
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

I took this series for a spin and didn't see any problems with the
selinux-testsuite.
Also re-based my WIP selinux namespaces patch series [1] on top, which
introduces multiple selinuxfs instances (one per selinux namespace),
and didn't see any problems.

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com>

[1] https://lore.kernel.org/selinux/20250814132637.1659-1-stephen.smalley.w=
ork@gmail.com/

> ---
>  security/selinux/selinuxfs.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index f088776dbbd3..eae565358db4 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -1205,7 +1205,8 @@ static struct dentry *sel_attach(struct dentry *par=
ent, const char *name,
>                 iput(inode);
>                 return ERR_PTR(-ENOMEM);
>         }
> -       d_add(dentry, inode);
> +       d_make_persistent(dentry, inode);
> +       dput(dentry);
>         return dentry;
>  }
>
> @@ -1934,10 +1935,11 @@ static struct dentry *sel_make_swapover_dir(struc=
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
>
>  #define NULL_FILE_NAME "null"
> @@ -2080,7 +2082,7 @@ static int sel_init_fs_context(struct fs_context *f=
c)
>  static void sel_kill_sb(struct super_block *sb)
>  {
>         selinux_fs_info_free(sb);
> -       kill_litter_super(sb);
> +       kill_anon_super(sb);
>  }
>
>  static struct file_system_type sel_fs_type =3D {
> --
> 2.47.3
>
>

