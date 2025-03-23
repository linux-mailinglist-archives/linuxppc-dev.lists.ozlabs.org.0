Return-Path: <linuxppc-dev+bounces-7293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFECA6CE62
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 09:45:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZL8s42SYmz2yfs;
	Sun, 23 Mar 2025 19:45:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742719528;
	cv=none; b=OWSLfLZZnEpz0GtT4MkB4ehQ4oGJi0sb45GnkUx6s59VAigQ8nI68/UoTYCVRu6a1qMCCY5gjGl63PQlLXRlDpuIElk77ed1AEh2Hl11tYSHYEv7b6uE9Tm/pcj+ni8Z8HMaRPtI9DnJ0JddPNHDGycBG1/hqF/9bSWhkcbnroiK7AlBxl2Rpp3pSKiMvEEjgFSDb/mYLL2dAwbv9MyShzgpdhM7eJKx7DDorgaLesf/Ei4WuBVTWqaX4IRKJ5uZIimHm3A2o8uo+234SOyefJVPt7br9BpgS24TlEECD+yY/XOYV2JZ72Q3XxfP8VWVvu43qGOBAQ4eXa6uru3kzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742719528; c=relaxed/relaxed;
	bh=3jxIP2TIUbDJlhhIEkW541D6lu1Z7/8FzD6NZfb9i/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNU08bu9CdjMH6yS3FWEXcgbiEEzw7/FvEoCLptVS0Xq62QImYZjKbIlax74j9CEi1DKJ/1t25cuC2cH2H0qzBdAf9fUzeJjU2sbIPFggFJC/1J3lZ+4iBOEPpWrVtaulm4BHYqdG7wgTWeIHHIw5JxLJEKDA2t0IrkO9lQqC1IKYJGRrLt6928oq+Z03ZJoh+rZ/dfRcdxeKzJkDYZ9zVCpyyPdkBG8xfiCJtpizJwIrN0soH7F3ZTHSr4ML0m4sPNd/LrH5GB95Hu5T0LrgHKGPo+CoUlwb5HclVw4UVmctkSK9zacCzuMl2P00PThXwSBszE+mwS4Gfk2IwiDoQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FcvMTDJ2; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FcvMTDJ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZL8s23gB6z2yfX
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 19:45:25 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so6257228a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 01:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742719517; x=1743324317; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3jxIP2TIUbDJlhhIEkW541D6lu1Z7/8FzD6NZfb9i/w=;
        b=FcvMTDJ2+0Wlvmn5ZzwgKx54kjG/3xvwWer4y8CbQ1fNzsjknKiQg6NiJ+Jg065Hsc
         eQQRjOCMf0nxAQj6kW3uHkiD68sDHz9HEZsr4J2P13gm++cQm1yyYgNKkPSrKkkJzUDf
         RH/E4jD7HZkj/w34xY2iymwdL1eDPu3pcQYG6csyt1TM5Oacns3HBVKbdrkKhnCJlUMz
         DnzKD3vGPD2hIMUxpLu2dCHogSmkqljWn/0XbJweVsU3y+X1Ag5Lj04/vdBJxENv++TL
         ztf+Zhbb3k50CBoxs3I2KZL0Bq67JvZRFAdXKuTS2m5Osdx0+2NcvujKmdBW/uF/FMQ6
         NPnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742719517; x=1743324317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jxIP2TIUbDJlhhIEkW541D6lu1Z7/8FzD6NZfb9i/w=;
        b=IK168xNkc4WIoNjcWKoCwlQcKSpeNxEjSMpbYsJMNKZSxu0ctrJSZ0V3jv1QMnK4za
         6JMbZ7c929IA2E5Hiw6rnK3CHhNnKxkHSsY6elzQmlP3pbSxy91Wao8cX2CuBgc+BYk1
         OfZN2VCfca1ZY3m/bMhNigB+P0bgpLUhPurM2JGhfKFw+KOODa6Z6zH6b93LVx8MwqV9
         ewSbLtee7/msHuRRyHtzfW0NpIpk0RmxJ9JsbaNrF6fK3L0mN4m/7AjH9qmjNj/Om1zZ
         PF00p9X3+cP3cKPZTF7QJdKY1+qkyO7gvg5YV2W+JHFP4BRBef+vHIZhWWbKvfPIXdgx
         /GTw==
X-Forwarded-Encrypted: i=1; AJvYcCWmFNMhFJ1aVv0gG7xqCpql5Ffiw3RKMpaqLwUsAx0kWpyx+WT26bfqwO4Fi8fM7ja12yk/IAsW5i758To=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxW6Z+njR90SYD1PdKvsLH2vwA3Fr1R90l561x9ItQCUAqSnsjd
	qHu+iHnm3pCk7Xutc1syJGGqO0+5nyIvzp8EGEjJNotbKuVQkwgnflRAnVb/y/MRVFvcqeVnCNO
	NswrGoXr6dPSiVEuDNdopqpG1EOw=
X-Gm-Gg: ASbGncsgzRRHPgbak+vImiJ1mziMQBbHLkM/Z2BRuZbHG27yo39wCEcOxP8A2FU3ZqV
	zPdfZNbrvCbGlJqn9QJ8CA8Ld2ls72HHvK6Pg4mNHoB6e2ixspJZNAgix0ykZVNP4CUk/APSy5D
	N4bKNegJq6J0aodCxXoAw6JjmBZeHvuSUOz9/gVEIKLmfrLaUyy4i8G1a4w1E=
X-Google-Smtp-Source: AGHT+IGKn4NZALUSEG+rHMaGWglZZduHpRclHK5w+Kv4NN031fphTZKyVC6h710/5c6HAafbvHO3fjsZw2YzDAeWHLw=
X-Received: by 2002:a05:6402:42c9:b0:5e5:854d:4d17 with SMTP id
 4fb4d7f45d1cf-5eb9a017821mr12555025a12.11.1742719516454; Sun, 23 Mar 2025
 01:45:16 -0700 (PDT)
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
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sun, 23 Mar 2025 09:45:06 +0100
X-Gm-Features: AQ5f1JqljvGQqYT8xQtG-jZ8bGx-mNtzX8tKytu1uegIaEXtua4XQMAbrGMEflk
Message-ID: <CAOQ4uxjQDUg8HFG+mSxMkR54zen7nC2jttzOKqh13Bx-uosh3Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat syscalls
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
	linux-arch@vger.kernel.org, selinux@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 8:50=E2=80=AFPM Andrey Albershteyn <aalbersh@redhat=
.com> wrote:
>
> This patchset introduced two new syscalls getfsxattrat() and
> setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> except they use *at() semantics. Therefore, there's no need to open the
> file to get an fd.
>
> These syscalls allow userspace to set filesystem inode attributes on
> special files. One of the usage examples is XFS quota projects.
>
> XFS has project quotas which could be attached to a directory. All
> new inodes in these directories inherit project ID set on parent
> directory.
>
> The project is created from userspace by opening and calling
> FS_IOC_FSSETXATTR on each inode. This is not possible for special
> files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> with empty project ID. Those inodes then are not shown in the quota
> accounting but still exist in the directory. This is not critical but in
> the case when special files are created in the directory with already
> existing project quota, these new inodes inherit extended attributes.
> This creates a mix of special files with and without attributes.
> Moreover, special files with attributes don't have a possibility to
> become clear or change the attributes. This, in turn, prevents userspace
> from re-creating quota project on these existing files.
>
> Christian, if this get in some mergeable state, please don't merge it
> yet. Amir suggested these syscalls better to use updated struct fsxattr
> with masking from Pali Roh=C3=A1r patchset, so, let's see how it goes.

Andrey,

To be honest I don't think it would be fair to delay your syscalls more
than needed.

If Pali can follow through and post patches on top of your syscalls for
next merge window that would be great, but otherwise, I think the
minimum requirement is that the syscalls return EINVAL if fsx_pad
is not zero. we can take it from there later.

We can always also increase the size of struct fsxattr, but let's first
use the padding space already available.

Thanks,
Amir.

>
> NAME
>
>         getfsxattrat/setfsxattrat - get/set filesystem inode attributes
>
> SYNOPSIS
>
>         #include <sys/syscall.h>    /* Definition of SYS_* constants */
>         #include <unistd.h>
>
>         long syscall(SYS_getfsxattrat, int dirfd, const char *pathname,
>                 struct fsxattr *fsx, size_t size,
>                 unsigned int at_flags);
>         long syscall(SYS_setfsxattrat, int dirfd, const char *pathname,
>                 struct fsxattr *fsx, size_t size,
>                 unsigned int at_flags);
>
>         Note: glibc doesn't provide for getfsxattrat()/setfsxattrat(),
>         use syscall(2) instead.
>
> DESCRIPTION
>
>         The syscalls take fd and path to the child together with struct
>         fsxattr. If path is absolute, fd is not used. If path is empty,
>         inode under fd is used to get/set attributes on.
>
>         This is an alternative to FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR
>         ioctl with a difference that file don't need to be open as we
>         can reference it with a path instead of fd. By having this we
>         can manipulated filesystem inode attributes not only on regular
>         files but also on special ones. This is not possible with
>         FS_IOC_FSSETXATTR ioctl as with special files we can not call
>         ioctl() directly on the filesystem inode using file descriptor.
>
> RETURN VALUE
>
>         On success, 0 is returned.  On error, -1 is returned, and errno
>         is set to indicate the error.
>
> ERRORS
>
>         EINVAL          Invalid at_flag specified (only
>                         AT_SYMLINK_NOFOLLOW and AT_EMPTY_PATH is
>                         supported).
>
>         EINVAL          Size was smaller than any known version of
>                         struct fsxattr.
>
>         EINVAL          Invalid combination of parameters provided in
>                         fsxattr for this type of file.
>
>         E2BIG           Size of input argument **struct fsxattr** is too
>                         big.
>
>         EBADF           Invalid file descriptor was provided.
>
>         EPERM           No permission to change this file.
>
>         EOPNOTSUPP      Filesystem does not support setting attributes
>                         on this type of inode
>
> HISTORY
>
>         Added in Linux 6.14.
>
> EXAMPLE
>
> Create directory and file "mkdir ./dir && touch ./dir/foo" and then
> execute the following program:
>
>         #include <fcntl.h>
>         #include <errno.h>
>         #include <string.h>
>         #include <linux/fs.h>
>         #include <stdio.h>
>         #include <sys/syscall.h>
>         #include <unistd.h>
>
>         int
>         main(int argc, char **argv) {
>                 int dfd;
>                 int error;
>                 struct fsxattr fsx;
>
>                 dfd =3D open("./dir", O_RDONLY);
>                 if (dfd =3D=3D -1) {
>                         printf("can not open ./dir");
>                         return dfd;
>                 }
>
>                 error =3D syscall(467, dfd, "./foo", &fsx, 0);
>                 if (error) {
>                         printf("can not call 467: %s", strerror(errno));
>                         return error;
>                 }
>
>                 printf("dir/foo flags: %d\n", fsx.fsx_xflags);
>
>                 fsx.fsx_xflags |=3D FS_XFLAG_NODUMP;
>                 error =3D syscall(468, dfd, "./foo", &fsx, 0);
>                 if (error) {
>                         printf("can not call 468: %s", strerror(errno));
>                         return error;
>                 }
>
>                 printf("dir/foo flags: %d\n", fsx.fsx_xflags);
>
>                 return error;
>         }
>
> SEE ALSO
>
>         ioctl(2), ioctl_iflags(2), ioctl_xfs_fsgetxattr(2)
>
> ---
> Changes in v4:
> - Use getname_maybe_null() for correct handling of dfd + path semantic
> - Remove restriction for special files on which flags are allowed
> - Utilize copy_struct_from_user() for better future compatibility
> - Add draft man page to cover letter
> - Convert -ENOIOCTLCMD to -EOPNOSUPP as more appropriate for syscall
> - Add missing __user to header declaration of syscalls
> - Link to v3: https://lore.kernel.org/r/20250211-xattrat-syscall-v3-1-a07=
d15f898b2@kernel.org
>
> Changes in v3:
> - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> - Remove unnecessary "same filesystem" check
> - Use CLASS() instead of directly calling fdget/fdput
> - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b3=
60d4fbcb2@kernel.org
>
> v1:
> https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@ker=
nel.org/
>
> Previous discussion:
> https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat=
.com/
>
> ---
> Andrey Albershteyn (3):
>       lsm: introduce new hooks for setting/getting inode fsxattr
>       fs: split fileattr/fsxattr converters into helpers
>       fs: introduce getfsxattrat and setfsxattrat syscalls
>
>  arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
>  arch/arm/tools/syscall.tbl                  |   2 +
>  arch/arm64/tools/syscall_32.tbl             |   2 +
>  arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
>  arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
>  arch/mips/kernel/syscalls/syscall_n32.tbl   |   2 +
>  arch/mips/kernel/syscalls/syscall_n64.tbl   |   2 +
>  arch/mips/kernel/syscalls/syscall_o32.tbl   |   2 +
>  arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
>  arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
>  arch/s390/kernel/syscalls/syscall.tbl       |   2 +
>  arch/sh/kernel/syscalls/syscall.tbl         |   2 +
>  arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
>  arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
>  arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
>  fs/inode.c                                  | 130 ++++++++++++++++++++++=
++++++
>  fs/ioctl.c                                  |  39 ++++++---
>  include/linux/fileattr.h                    |   2 +
>  include/linux/lsm_hook_defs.h               |   4 +
>  include/linux/security.h                    |  16 ++++
>  include/linux/syscalls.h                    |   6 ++
>  include/uapi/asm-generic/unistd.h           |   8 +-
>  include/uapi/linux/fs.h                     |   3 +
>  security/security.c                         |  32 +++++++
>  25 files changed, 259 insertions(+), 13 deletions(-)
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250114-xattrat-syscall-6a1136d2db59
>
> Best regards,
> --
> Andrey Albershteyn <aalbersh@kernel.org>
>
>

