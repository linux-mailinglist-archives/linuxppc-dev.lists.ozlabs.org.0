Return-Path: <linuxppc-dev+bounces-7294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1108A6CE6C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 09:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZL961141fz2ygY;
	Sun, 23 Mar 2025 19:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742720201;
	cv=none; b=De+lv87vmvPzFn8zEmjE+WTQRqQ1ldPr1F2YENmAsSZqx0j4Q/DsFexrbxYoZRJ17m5SAXEjkX86eU2oSnfjpifhysuYvNj2ailXlK4OmkmYC9IM9i+79Xdh/o2PrC0lOMYmkj+nYhGmiP0dqpqHX21431bcws4Mw0A5AJ5PuxI77ILL1YgPhQef+0hj+mMqFXBayBp1/RdVVHikPT+wy6Pd1oEhhwxA7I8FNNgykT8pmYlCoyxPbnBjbgwd0hVijWqqWXidfZMsLK5HHacQWWXUdZNinwRSB4bTQlZYNO8GlMSlRuhp0NbrIDmnhKXwuXguYCPFcWRGvYCVonj3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742720201; c=relaxed/relaxed;
	bh=TVIItDI8qaPBoFm1BXeIX43KSyqYt1PldCeim8uGiMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VS1CWnnlf32RDaO8/zRuGmZkq2+ebEqwg8O1HBnawGgM717lDh7xNM4WZ2N3ymG3mlgdZ7Z5J2lPEHxfBFDBZmoTUClxJWuqksLL5tWEdjRBiH1+QtB4wGWkdmbUdrDAAnPOg/4qw0CsXILXOB8pgP4d3wzWIffqlJtZYhQ2/z2uCSW5NrcChkZmEWTx79uugeEslE35yFDk/z/qL53YFwnsBgqL8i8NtMswQZuQw8s7KeF4iJOubFJ/fa3PwfnYPtL3rVjTEJ2m259s4AIru5g+4Dj4OupxyDjzDkDVPXIjk2XrtBcwIeqs4p87F6KWg9f9pPDpC5g8NjCeYp5asg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mj7nm2mK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mj7nm2mK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZL95z4WxFz2yfX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 19:56:38 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so5953446a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742720196; x=1743324996; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVIItDI8qaPBoFm1BXeIX43KSyqYt1PldCeim8uGiMU=;
        b=mj7nm2mKlAJemdzbk82doMlaI0oUKnaHVzxCUS5SEl08jMpstz5cP1HjrgqFb6tP4w
         uoFi0yP5XqrWMqoz47VnOy47bxkgz6kNscevidHIwrNoBD/TlSx89abHWF5UzJ72RO2U
         lrYpEjKnKytYSdKD9Yz436OEgotFuJM2len7WKvA7DgG5fDidFeswh4xIkrUwPWzHaLG
         TcQmSP3TiMDKGeuNGtBCrUu0i1fWeSMgdJj9995uY9mIiC+LMBXYyd1TcboZXQi+npXN
         ukNfUfCqXNQGrPXpKZSk/PbS9RrA/9qN4DiJ9CpcJuWz5PyPGbvH65NjRdtJFz5DBrBF
         hbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742720196; x=1743324996;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVIItDI8qaPBoFm1BXeIX43KSyqYt1PldCeim8uGiMU=;
        b=HXewEw6KfKhR7dFR9Hpb3/fi18yu8dIRPEaTwNbo7nlA9wFcW6P2OheCY3mhoTtlVG
         ubpRK+QB91aFFu2xGAlWuZeJLTiD7APXk8r99E7/MsbyFXVbZQ+FWrmnPVWa8iqJpQnq
         2vHqifikMAobaoI8hCzgWqv1UJazyXPTPoCbDMM6RoYxLnbQSn0Pzw3/4AswvRTnHook
         ud6PkPd8R1kbgzQfcKCRFhO0vMNnHleSjyjFAIvUGQ5/Kc5DVdOEA5cF5Ilcua7wYX1W
         qR/J1OHExkb9LSSek4vP7//d7RQ7+k5QR44a0UsmAZwhynKoso8SAANcDI5wiAFLXKs+
         ArLw==
X-Forwarded-Encrypted: i=1; AJvYcCXCxMLbbkEwgf0HaZKrNhZlT6YD4JRZuhL8hcIsnBLOQJOEu4fgKUWV/vE0ff0f9cAjPtY8jpVkXwjxlO0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXfZ6c9Q+eb0DLYq/CEma1ZHPUKcEiCjt4lsnSRznRrsKCaGNb
	rthPubcHp3SNx/mR0/+H+UmA/cvzFIB3gkOUQniFR4pKNot+Pm0bohn1M3xDt9T2yZFl5eOR80O
	GKgl8NdKH1Qcj8bwt6t0iYZJ8Wtg=
X-Gm-Gg: ASbGncteGA4iK3xjrog6YfmoUmQejNEN4Z9VzDDmb9bop+GfGSMpCsfMGVreqqHd+5o
	MmOBLWFFdMTA443Eoe0u510hfR41nc9LQdqFCZFVlMEXdv//h/8BlRrFOdeaPLvQcPLx3Wip41V
	XsFmHcmkT17781cIpj3nvOpfC/HvGV4ZWt31awbd7Lw2/e7kyUHVQfYQAhTGA=
X-Google-Smtp-Source: AGHT+IEBIy49ieatYEuSP1liKg/ID7cKJrCF9akLUZmVZ5wo1f/yMQ0YfYjV0MMVM+aDi+JYvMnWAUZwuWv6wUTqP1A=
X-Received: by 2002:a05:6402:2753:b0:5e7:8501:8c86 with SMTP id
 4fb4d7f45d1cf-5ebcd4f4378mr8004815a12.22.1742720195296; Sun, 23 Mar 2025
 01:56:35 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org> <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 23 Mar 2025 09:56:25 +0100
X-Gm-Features: AQ5f1JrOXpIKV6C3iY7Wt_BJVbE3r_yhhr0gjM9ov_K98R8Pcb1AHPHKowO0lbc
Message-ID: <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat syscalls
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 8:49=E2=80=AFPM Andrey Albershteyn <aalbersh@redhat=
.com> wrote:
>
> From: Andrey Albershteyn <aalbersh@redhat.com>
>
> Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> extended attributes/flags. The syscalls take parent directory fd and
> path to the child together with struct fsxattr.
>
> This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> that file don't need to be open as we can reference it with a path
> instead of fd. By having this we can manipulated inode extended
> attributes not only on regular files but also on special ones. This
> is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> we can not call ioctl() directly on the filesystem inode using fd.
>
> This patch adds two new syscalls which allows userspace to get/set
> extended inode attributes on special files by using parent directory
> and a path - *at() like syscall.
>
> CC: linux-api@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: linux-xfs@vger.kernel.org
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
...
> +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> +               struct fsxattr __user *, ufsx, size_t, usize,
> +               unsigned int, at_flags)
> +{
> +       struct fileattr fa;
> +       struct path filepath;
> +       int error;
> +       unsigned int lookup_flags =3D 0;
> +       struct filename *name;
> +       struct mnt_idmap *idmap;.

> +       struct dentry *dentry;
> +       struct vfsmount *mnt;
> +       struct fsxattr fsx =3D {};
> +
> +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> +       BUILD_BUG_ON(sizeof(struct fsxattr) !=3D FSXATTR_SIZE_LATEST);
> +
> +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) !=3D 0)
> +               return -EINVAL;
> +
> +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> +               lookup_flags |=3D LOOKUP_FOLLOW;
> +
> +       if (at_flags & AT_EMPTY_PATH)
> +               lookup_flags |=3D LOOKUP_EMPTY;
> +
> +       if (usize > PAGE_SIZE)
> +               return -E2BIG;
> +
> +       if (usize < FSXATTR_SIZE_VER0)
> +               return -EINVAL;
> +
> +       error =3D copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufs=
x, usize);
> +       if (error)
> +               return error;
> +
> +       fsxattr_to_fileattr(&fsx, &fa);
> +
> +       name =3D getname_maybe_null(filename, at_flags);
> +       if (!name) {
> +               CLASS(fd, f)(dfd);
> +
> +               if (fd_empty(f))
> +                       return -EBADF;
> +
> +               idmap =3D file_mnt_idmap(fd_file(f));
> +               dentry =3D file_dentry(fd_file(f));
> +               mnt =3D fd_file(f)->f_path.mnt;
> +       } else {
> +               error =3D filename_lookup(dfd, name, lookup_flags, &filep=
ath,
> +                                       NULL);
> +               if (error)
> +                       return error;
> +
> +               idmap =3D mnt_idmap(filepath.mnt);
> +               dentry =3D filepath.dentry;
> +               mnt =3D filepath.mnt;
> +       }
> +
> +       error =3D mnt_want_write(mnt);
> +       if (!error) {
> +               error =3D vfs_fileattr_set(idmap, dentry, &fa);
> +               if (error =3D=3D -ENOIOCTLCMD)
> +                       error =3D -EOPNOTSUPP;

This is awkward.
vfs_fileattr_set() should return -EOPNOTSUPP.
ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
ioctl returns -EOPNOTSUPP.

I don't think it is necessarily a bad idea to start returning
 -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
because that really reflects the fact that the ioctl is now implemented
in vfs and not in the specific fs.

and I think it would not be a bad idea at all to make that change
together with the merge of the syscalls as a sort of hint to userspace
that uses the ioctl, that the sycalls API exists.

Thanks,
Amir.

