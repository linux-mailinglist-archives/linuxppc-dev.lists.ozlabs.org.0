Return-Path: <linuxppc-dev+bounces-12494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F96B8ED1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 04:50:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVSJp0Xr3z2yrr;
	Mon, 22 Sep 2025 12:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758509417;
	cv=none; b=NA9ELxv7aQ1tKkOfZ4kAHZFM7ZqdGHuDLJKUGLieplRrE48+i8WVckbHKI+WLlp1jTSXGoM1H8UR1H2YD2+3NNp1tSTPUC5L1kPl3QmtAe6hmtBsvcSEUW+mBYgbu1U/HUcbB2bAVcP+aDtpG/+xobAduAQPq0kscuz+ahqwcPWCbueJ/fFbaEZPfAsH8X6lo5SoVKkoYrFI9LB27lOHhjMnzJwAqpAxve9PONONZVOV73N6gjHSrvWR43EMOuB8IAfP+k4baGu16Zk+2d1sDIjTm7d92iXCwU6WXTjsufli/TIkxes3Y/sEH5MfpkMJ2RrR84Ld6zeelO5BTPzedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758509417; c=relaxed/relaxed;
	bh=p7XFLhLN2bC131m5hKpTDzRYLjnq0kauHpj5EizfADo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sk8U9uEG0bQ2xZYG0PLGNuuYvO4yZ9Kwwygms3As67MpO9A8XlGKATI9w/ie+7AwCVPRG6QGdxKeXa5+KglAINv52caNUA5L9gGfMxqQBvGsvfj8j2/XcxSW5yqzfcS72hmpihAtMiZBl3KKiBQzT466Jfm/g4ZUZTvMKAGFGU1BoN7ANOisR9AkI7UVt4pjIi/f4YuPYiYuz7gJ1dF6N4WUUrzCLY38CIdE4/juRpdOI2Iqt7+Hl2nhA+3FnCdu5+AK3K2IYDabtNIDn3FZNcgxv7/QfD5DhzTku9Bo7szEF8Dq90K4VoOQimWXsiZy9FUeRJ706c/aEEIVWUX24g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=MXMUZ8zz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=MXMUZ8zz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVSJm75dWz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 12:50:15 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso2710904a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 19:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1758509414; x=1759114214; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7XFLhLN2bC131m5hKpTDzRYLjnq0kauHpj5EizfADo=;
        b=MXMUZ8zzHDRVRwRXO05L8Gkg2+Ku2L5cNpwXFoQM1fpDS7vHUnFTSiIIQu+ScjrCDS
         Q6s4nkR63FUdpUR0u+k+eOAkybpyIZQx0ZqpatwBeeY23qYX66cUhR3RkxMHmmr/63SI
         rd83GEce74tm6y07DM3F7CbVSRu4GPUNk8Ibmp0Y/gU9DfPRLtLiDsg5Et7e82LgnKoI
         yViACi+2+Z8v/MDZhX/VpWRenl7Uc02vrsUGe2UOhq9XEaZMqJQN3SEyOjhKSvYgBzBm
         ky8aHLKtxpwqXL3BO/5SAacJY7FlAPHCUukByIe/enKfvMv7HrqdIJRe6LSKrF2ffmer
         RMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758509414; x=1759114214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7XFLhLN2bC131m5hKpTDzRYLjnq0kauHpj5EizfADo=;
        b=PwvJYxAHTQ2VI/+Rhn3sE8lYgUth0Ik6ASqZ/XQGp1/YXN+71sViEpaMgsSubbo2gS
         3Qa/tf5lsSzUjzHjcRoJ0T8FsfLSJ6wUH1TSRtAKPfqPG/fIX2GAw9kX/EI7r08WY0VY
         t0qlnt+kKmbRqJP6UOw5NuhEAZqRMjzM4MBveg5Jx4awzX90E/VPurP8gf9B1jbFWiK4
         1caZWfcrEdDsweA1ZI+CSzosi/G8jk2Ja5D4XCUEQaIQ92kJ/SJE/GyAPCsULuZadA4X
         jbCqkOdOiyITGla8r0Rl42jCR8maofnzhclXVWmtoNf6PRZFt6lkwYaCSKisARo1Feks
         3C7A==
X-Forwarded-Encrypted: i=1; AJvYcCVjB4nGxkWYf3K0HstnkFBM6KQz03WYhSAkb765phz2gmanbTEUBI+BRjO47gvvqK03QL/Ld5TqFSW84xo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwgY5GVQQwOLK0AefRdPb3q60C4rzfHH8uDSGrvxWD2IFOXvF1S
	u4ffQoFEJZ0mDsXTSuD5XxsDy7fRdyvSWWN3qvE+zB+hN7WLqoNQdCDRgJRSPSy9g6OW9p5BnoX
	VBS4lSXNQnLah+4KwXmx7gpmdU4EhPSHffdz0V5Np
X-Gm-Gg: ASbGncvafpdfhLGtbL0UlNNYylhBVGD15J8MAB+muDuDHNjWEOVrtVhqpWhXP5g3nz6
	vM73AoSFP9qneQQPIj4jApKynZnW8ZzUYEQdncZi9VJTPAyVbi8jZnHO82rT/ebdLDCNpN7DPEq
	YPHbLzyzDNlrXYFk+cV/yLWZGGfVd33U1OwaUio7uxcySQG3rMDSZFFVx43oH9ZKZNE0OqN9xN2
	R1ukdM=
X-Google-Smtp-Source: AGHT+IGe+15w8xvp7a+Fw0oSWAsBTAKPDi7raUHSz68Xr1TN17drDWabkB3/4zSQVbDi/BgDo5ph0IOND5WuUlo/leI=
X-Received: by 2002:a17:90b:5109:b0:327:7c8e:8725 with SMTP id
 98e67ed59e1d1-33097fee350mr12554584a91.10.1758509413659; Sun, 21 Sep 2025
 19:50:13 -0700 (PDT)
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
 <20250920074759.3564072-31-viro@zeniv.linux.org.uk> <CAHC9VhTRsQtncKx4bkbkSqVXpZyQLHbvKkcaVO-ss21Fq36r+Q@mail.gmail.com>
 <20250921222619.GO39973@ZenIV>
In-Reply-To: <20250921222619.GO39973@ZenIV>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 21 Sep 2025 22:50:02 -0400
X-Gm-Features: AS18NWA59TWujxe3lwJRQwcdud2e03V7ijpvYuacj-73O3HLhpPDNRlQbZP5_x0
Message-ID: <CAHC9VhTy2j+hkT24hM1J2GH+12wp63DArRo6BGTvTwGX2k4CnA@mail.gmail.com>
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

On Sun, Sep 21, 2025 at 6:26=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
> On Sun, Sep 21, 2025 at 04:44:28PM -0400, Paul Moore wrote:
> > On Sat, Sep 20, 2025 at 3:48=E2=80=AFAM Al Viro <viro@zeniv.linux.org.u=
k> wrote:
> > >
> > > Tree has invariant part + two subtrees that get replaced upon each
> > > policy load.  Invariant parts stay for the lifetime of filesystem,
> > > these two subdirs - from policy load to policy load (serialized
> > > on lock_rename(root, ...)).
> > >
> > > All object creations are via d_alloc_name()+d_add() inside selinuxfs,
> > > all removals are via simple_recursive_removal().
> > >
> > > Turn those d_add() into d_make_persistent()+dput() and that's mostly =
it.
> > > Don't bother to store the dentry of /policy_capabilities - it belongs
> > > to invariant part of tree and we only use it to populate that directo=
ry,
> > > so there's no reason to keep it around afterwards.
> >
> > Minor comment on that below, as well as a comment style nitpick, but
> > overall no major concerns from me.
>
> FWIW, how's this for the preparatory part?
>
> commit 17f3b70a28233078dd3dae3cf773b68fcd899950
> Author: Al Viro <viro@zeniv.linux.org.uk>
> Date:   Sun Sep 21 18:09:48 2025 -0400
>
>     selinuxfs: don't stash the dentry of /policy_capabilities
>
>     Don't bother to store the dentry of /policy_capabilities - it belongs
>     to invariant part of tree and we only use it to populate that directo=
ry,
>     so there's no reason to keep it around afterwards.
>
>     Same situation as with /avc, /ss, etc.  There are two directories tha=
t
>     get replaced on policy load - /class and /booleans.  These we need to
>     stash (and update the pointers on policy reload); /policy_capabilitie=
s
>     is not in the same boat.
>
>     Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Looks good to me, ACK below.  For me personally, it's a bit late to
take non-bugfix stuff for the upcoming merge window so I would defer
this for a few weeks, but if you want to take it now that's your call.
Also your call if you would prefer this to go in with the rest of the
patchset you've working on, or if you want me to take it via the
SELinux tree.  Let me know.

Acked-by: Paul Moore <paul@paul-moore.com>

> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 9aa1d03ab612..482a2cac9640 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -75,7 +75,6 @@ struct selinux_fs_info {
>         struct dentry *class_dir;
>         unsigned long last_class_ino;
>         bool policy_opened;
> -       struct dentry *policycap_dir;
>         unsigned long last_ino;
>         struct super_block *sb;
>  };
> @@ -117,7 +116,6 @@ static void selinux_fs_info_free(struct super_block *=
sb)
>
>  #define BOOL_DIR_NAME "booleans"
>  #define CLASS_DIR_NAME "class"
> -#define POLICYCAP_DIR_NAME "policy_capabilities"
>
>  #define TMPBUFLEN      12
>  static ssize_t sel_read_enforce(struct file *filp, char __user *buf,
> @@ -1879,23 +1877,24 @@ static int sel_make_classes(struct selinux_policy=
 *newpolicy,
>         return rc;
>  }
>
> -static int sel_make_policycap(struct selinux_fs_info *fsi)
> +static int sel_make_policycap(struct dentry *dir)
>  {
> +       struct super_block *sb =3D dir->d_sb;
>         unsigned int iter;
>         struct dentry *dentry =3D NULL;
>         struct inode *inode =3D NULL;
>
>         for (iter =3D 0; iter <=3D POLICYDB_CAP_MAX; iter++) {
>                 if (iter < ARRAY_SIZE(selinux_policycap_names))
> -                       dentry =3D d_alloc_name(fsi->policycap_dir,
> +                       dentry =3D d_alloc_name(dir,
>                                               selinux_policycap_names[ite=
r]);
>                 else
> -                       dentry =3D d_alloc_name(fsi->policycap_dir, "unkn=
own");
> +                       dentry =3D d_alloc_name(dir, "unknown");
>
>                 if (dentry =3D=3D NULL)
>                         return -ENOMEM;
>
> -               inode =3D sel_make_inode(fsi->sb, S_IFREG | 0444);
> +               inode =3D sel_make_inode(sb, S_IFREG | 0444);
>                 if (inode =3D=3D NULL) {
>                         dput(dentry);
>                         return -ENOMEM;
> @@ -2079,15 +2078,13 @@ static int sel_fill_super(struct super_block *sb,=
 struct fs_context *fc)
>                 goto err;
>         }
>
> -       fsi->policycap_dir =3D sel_make_dir(sb->s_root, POLICYCAP_DIR_NAM=
E,
> -                                         &fsi->last_ino);
> -       if (IS_ERR(fsi->policycap_dir)) {
> -               ret =3D PTR_ERR(fsi->policycap_dir);
> -               fsi->policycap_dir =3D NULL;
> +       dentry =3D sel_make_dir(sb->s_root, "policy_capabilities", &fsi->=
last_ino);
> +       if (IS_ERR(dentry)) {
> +               ret =3D PTR_ERR(dentry);
>                 goto err;
>         }
>
> -       ret =3D sel_make_policycap(fsi);
> +       ret =3D sel_make_policycap(dentry);
>         if (ret) {
>                 pr_err("SELinux: failed to load policy capabilities\n");
>                 goto err;

--=20
paul-moore.com

