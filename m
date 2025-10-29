Return-Path: <linuxppc-dev+bounces-13474-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0968EC17734
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 01:03:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx6rZ2Z2Lz304h;
	Wed, 29 Oct 2025 11:02:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761696174;
	cv=none; b=WP9nfYsICSyLtCFWikRy2hT7Cl9wUeygYkSibmhH6fAD4Gh7/3++4ebiUznvL+Jb+8MmwxBASxLlJ6/wzo6iIIzP1+Jo6LVR0FVMAvcZFPQ5SaCNZ1w/9sAgPWKl0MPAf8FDTeN3IFkbCRI/MlI1e5sm5+7y0YCGn79INxkEhdGzQZH7t3epNnFWvh8hM0/S0tpYoTgYqtCO+4DA/iLZxjkxW2S2IUL1/sFHWJBnvrorsXTLDuTkKO5wMA+2BMtr2GLyMjBqzpbdNnCa3QXFbxSHESAWrV6uFcUZzh9NKSUN4jJ/Icv5p8vyCwxDbgp60wqb+gZ0nRtUZz6agB1OKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761696174; c=relaxed/relaxed;
	bh=xF6B/bGLrhNZetGrqx7q4mvUW1pHQ5FZufaW6F5zkk4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OB4SRt1+Rs9XSDJ+cYNASD7SBcZEwV3UsY0U26Sp3XjXW0Am2QR/nd8uOcZzGf0FSeNC2QEALPyzFqTGAPaab7LzCmphTuAqZbvEdMvIwlaKOE5TEeB8NQ5awLMssnQhMQniaPYsR+J330+fWYLqqwT399eCH1B44csWI9aLkjzsD9yffNSjyH+pZ7/TnqAPdJkTALYxIzn+Ftn1w6uuuUk5jbwg1hKin6gPFiClJIh7QEL5zBkE7Q9eLYAKUTBGXFcMr59hNmf+4Ep9k7E/wtODLP4sdjvX82ujRNotu0bCA5hVVsvUKI8LCyU9YEygw9uA01JDTZ1ob3xg7uX8OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HiEq+TZh; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=HiEq+TZh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx6rY30CPz2yyx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 11:02:53 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34029c5beabso1683142a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1761696171; x=1762300971; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xF6B/bGLrhNZetGrqx7q4mvUW1pHQ5FZufaW6F5zkk4=;
        b=HiEq+TZhLhx+ddU7jMRHYO8E8q+X9aKliRLF+vu0Ku8LmQYVMQDnHKwfVkic/2mYie
         tgdV/kiuXNnLhHaVMlvJXSVzDdQzyffjVEpJkB8a7cwBM42IVFVHx11ADrBsJCmFyuoa
         u5dnhRmw2/hsCbx9uv5Ev8cHLCidKQQWueypigQCFslOZPNQlagrEGxflJGD0R/6lEAx
         HMGYVdqVjnmdNKCe0Y1NyDjKVNwZXbs6Q9oQ/ZRvLITHZs1SF+nz0BLUdZtre1z+1y61
         ciGSlsXGDkJZymO/E0mD7LPstydbvOBQBFMFapJXgDQ8d8yuIk/wq2b9n/H9h7CxIRXX
         IJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696171; x=1762300971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF6B/bGLrhNZetGrqx7q4mvUW1pHQ5FZufaW6F5zkk4=;
        b=EDiYL2JbAWHfdBTFnlA/7RYP6AHcbNxMFF6Rtzy0YEHw2a28Q+6Xnpju14+5XJyiyk
         5nEyu2ostS3p6oLOo/ZlPMVIOIMhKDJW12fg6Zspr0y4IhuW2ASIuFdI1N6uKjIcA8Kv
         M05oonStJmkJPoe9bsx7ZH5KDx9Fwt1j+HBLlz1JVeTZrLhYSUUSXffLfMieegXW7cI1
         JnSE7M6QkMaecsMvcmG1X9eehWH1GaWfsArC0fR3jOHM3I3iqV1B0MZpV9j/6Y6z05jT
         eQZzjxnA340OECS7Yhtdbkx/Fy6o9WCzo//EegoghKcM9P0KCK1/rvgWLuIE+eSQqkWR
         w0sA==
X-Forwarded-Encrypted: i=1; AJvYcCVADRLSbB2UL37HlgqSzQKwClGjstL7NE9gg91Z1IapXssoguqph2ubdv7v1heKvcjn6evBpQXOETXm2u0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxEmTnVHJHbEoU0be8I7D+Eq8aW6svcF6AOvsjpMDuzzq0BuEbl
	3ay9YYtOOEsC0jJQtrTgHPMXN/siCI4qlB6b8z/GWrxRHv42+/jNHRN62SPpibBIPnL0RYFN4le
	kDDh0SrR+Z4Vv+P7KbPwQpUcTyo3vXyI7sYZDVLHm
X-Gm-Gg: ASbGncs2NOyXWb6cpSUufuAqWh7Ix5rNcMrRGO63+f2O46VIqZLwNtXTvrZjAhoJTU8
	9rdxlhz1IzGqgm8VpIkU6yybCI4jvNG1bKfnidCldmIEIDIe7dzhHN9+R/tUh7eaG1ODiLaV0Bh
	OZIvV+sVjnLpgS3mskp0/RoU4yo9QCScJkwlAjuC8ZReX9tJ27iRYRrQVv2isiVoFzEi2kJtRot
	8Myx+G2CvP1ZlR/2/79fbZ4EmmjSVAhpk0brwySiqLga912sY64Uh7k6Mf9
X-Google-Smtp-Source: AGHT+IF4NZKo/CMR1Xvo4aqvxCL2dK2Kp/y68pib/yspEfnhKPr97BsNeUO4lrcXad0luDAxu81WWX06Cn/QvKa01OM=
X-Received: by 2002:a17:90b:54c6:b0:33f:ebeb:d7ef with SMTP id
 98e67ed59e1d1-3403a2a420cmr1024634a91.35.1761696171255; Tue, 28 Oct 2025
 17:02:51 -0700 (PDT)
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
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Oct 2025 20:02:39 -0400
X-Gm-Features: AWmQ_bmmcbrTxQbk2K0S9dnAz964E4djBpHBaC2BLyDDdj2u6ZdL3nJ0xadT9U0
Message-ID: <CAHC9VhRQNmPZ3Sz496WPgQp-OkijiF7GgmHuR+=Kn3qBE6nj6Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/50] convert selinuxfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, raven@themaw.net, miklos@szeredi.hu, 
	neil@brown.name, a.hindborg@kernel.org, linux-mm@kvack.org, 
	linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, kees@kernel.org, 
	rostedt@goodmis.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	casey@schaufler-ca.com, linuxppc-dev@lists.ozlabs.org, 
	john.johansen@canonical.com, selinux@vger.kernel.org, 
	borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 27, 2025 at 8:46=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
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

I suppose the kill_litter_super()->kill_anon_super() should probably
be pulled out into another patch as it's not really related to the
d_make_persistent() change, but otherwise this looks okay to me
(assuming I followed the DCACHE_PERSISTENT changes correctly).

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

