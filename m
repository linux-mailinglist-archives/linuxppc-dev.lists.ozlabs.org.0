Return-Path: <linuxppc-dev+bounces-13519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B13C1B995
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:19:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxWBf5wqRz3bsN;
	Thu, 30 Oct 2025 02:19:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761751194;
	cv=none; b=GgMQDPb4xNN2xqBXVacjRKjw9mJQoZhv+HJD7ni1x8m6g8PbEjvaKZcuRs+5gW7/7J58826wfJn4u+eR1ZU0v3VqQfn5v7aLoJt8a87hWaqV/7cET/K0I2wIjR7ha+xsUEB/Y1GFOUovkNGwWkKAhebrNO2o23hf2QDZdTiOE3GfWhPc+HZkj6o6j73ptzQhil7dLi4vzaOOo9HNd2YB20r7Yd+h+iOcOyYym4SmLp4+K7mJ9p16g8g2euQ2/IOS+2QHgnqvvscur4qsKRfFeqL3DY8Mj+hsOx8qoUML/Cv9EGqIQNROf8N+ZJHMgHNn7qba8BOwjlIsmZi3y1TqwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761751194; c=relaxed/relaxed;
	bh=1CdmUiAXh1HKc3m/r9pA/phMrmd+nlM0IzGmsHncGb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S9P3bekyUy8Hf2RjImo/mA81taXY6ZBTxeir2xrIdZRZApRj2nmO9nsFfln9d9oC00mCK8+LTLtiM/+cLORJPdGtx6XxuwmZb83l8eNHfJBbkBWdCa++KGrdjP+attu0GVBv5XqUmkR71tb/l8UZY2+XcSy/O2XN3hN9TYodXngZnngwmTqRcO6/KrLn0YKuGXT5i9JAxEyn9WlrCHWNNtNzL7JGJjYsnZuUSYgWK1uBUD4hbytTMNrLkHg4Oz4N9kMk3Gvzwfk58GMI6kiwOxNw/79wUgBrfA3xSFJ6PWMMY0/wsNX/GtAEVVv7QHt0KHIFMdwTvVBfKylU/QIDrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HncwtR9N; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=stephen.smalley.work@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HncwtR9N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=stephen.smalley.work@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxWBd60vYz3bfN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:19:52 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32ec291a325so27242a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761751191; x=1762355991; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CdmUiAXh1HKc3m/r9pA/phMrmd+nlM0IzGmsHncGb4=;
        b=HncwtR9NsfZWd5W5WLL2LQrDf/s8xmvhdWaMYQUTlg9vpDZTEx7TOoIeTO8x7UbjJw
         s3o+G6FNxpQNb1Xg5I6pG2TPfSsOiHqt18dBT9diNkJwv83RzUHg9NG26aMT5hiYx7vQ
         DhZ0SbkE6rzfl4QGKMxQTuQJmS2eSq1hRv52FYvFl3mnShlZWxd+EBNYScANMWgD96tV
         iaTfMWnjxM2/CGREDXnDZuoB2ZOxOLDe9GpSF/NB4zH6WkP+9skDsOY5dNDEKyPn6XTj
         AGy0qvHCRxrz1NVF9thxu0H0OqWuqBFyY82tOah5CbFbtR+bdeNmq7rMfcd6vW5HAAzT
         WmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751191; x=1762355991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CdmUiAXh1HKc3m/r9pA/phMrmd+nlM0IzGmsHncGb4=;
        b=Iv8+igpO4G+TZWvawX1C1BXsBFp6aqHomdl4vmGAkoolsdWzGfGOXfRAIRNeYRDXoM
         lS7RgZbjgkQYP/n8fXCywvC81AzmiYyCG1FHt71Zqt37/hx0kCMBKnYsJL7henQem558
         MNgYYtD8EtOcoR/WjGv0fKWz7Kx9HTKJcdbYVdyRbw4YKBJYKyRS3Z0JcRPygC4uTB3P
         LAtaK/optUyjCBsy6ADnYlo8rbZGzN0FTxWWt0apXH8g1MabBKKGOx6tam09yukW++UM
         PhNZLd4aPP5U5nUZYBSbpOibaEBQ1WC+nmOVK+Wx3Eb2drYmkI7A/nJ3iQTRNoziQp1M
         jwNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmMRHnz3GbVjm2d9yWNRpiYuYtwoWWikgKLalkUmsSYtyWllaTLWhn4GzjYVcRCYSaV1Dj0S1WkTi0EYQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxy5473n6iBNks8w/73Vd4hTgzof86qoZ7JG5pXLksrRjM6jh4J
	k41omwNpdSpkmtGn7UGO6ZdefEDjeDlJhr/KdGKskbIjAMYf6BKnLaREBQxD17O7hwp+I/TY913
	APRW09pfd7nRIZcKRr60lSmGyOGrp7XQ=
X-Gm-Gg: ASbGnctOjL3RQSgMeGvOUEAUC1XjcmOGpiLedBzZdo/esyrwc4PqLlbYDm7JhsSZ8d+
	azUtt6jOEiKt/rP+0r/aPX8we534hSfdLmxl1j39EJcr6HvpW+Mn6P+1a+GYfFmdj0UXG03Ogew
	xmzEtNt00tsqXHPrW7mMQnl3kY5vrRlq9QcVsuiTXijg9QIyPJ696J6sRE1mV/SACR9R7cW3pAb
	Cr0Z+OIohHqHfARyw7h9xNxGC5egWJ/1iQz2S5sg75TKEUyPGtHaBhrUnUuE2j6wVXFE8c=
X-Google-Smtp-Source: AGHT+IFbcnsAk75YEZiUX3rsU0b/ZmVe83k3NaOxPSYI+q4vlPOeZ92ke++maKcHRCEWJ6+8d/ixoTttE36+ff9pbFg=
X-Received: by 2002:a17:90b:1f8a:b0:33f:eca0:47c6 with SMTP id
 98e67ed59e1d1-3403a2f179cmr3475777a91.30.1761751190939; Wed, 29 Oct 2025
 08:19:50 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk> <20251028004614.393374-34-viro@zeniv.linux.org.uk>
In-Reply-To: <20251028004614.393374-34-viro@zeniv.linux.org.uk>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Wed, 29 Oct 2025 11:19:39 -0400
X-Gm-Features: AWmQ_bk3QGrfeacG4nKn1A56jExYpoFICsJu3Aq8X6pMLjFJYWj1N_7Lqh37COA
Message-ID: <CAEjxPJ60geP6mJsKW41Pj12tPCf-dGk=ys8vr5fEiO2tVj1Rdg@mail.gmail.com>
Subject: Re: [PATCH v2 33/50] selinuxfs: don't stash the dentry of /policy_capabilities
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

On Mon, Oct 27, 2025 at 8:48=E2=80=AFPM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> Don't bother to store the dentry of /policy_capabilities - it belongs
> to invariant part of tree and we only use it to populate that directory,
> so there's no reason to keep it around afterwards.
>
> Same situation as with /avc, /ss, etc.  There are two directories that
> get replaced on policy load - /class and /booleans.  These we need to
> stash (and update the pointers on policy reload); /policy_capabilities
> is not in the same boat.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Reviewed-by: Stephen Smalley <stephen.smalley.work@gmail.com>
Tested-by: Stephen Smalley <stephen.smalley.work@gmail.com>

> ---
>  security/selinux/selinuxfs.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index 232e087bce3e..b39e919c27b1 100644
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
> @@ -1871,23 +1869,24 @@ static int sel_make_classes(struct selinux_policy=
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
> @@ -2071,15 +2070,13 @@ static int sel_fill_super(struct super_block *sb,=
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
> --
> 2.47.3
>
>

