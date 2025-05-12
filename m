Return-Path: <linuxppc-dev+bounces-8511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816FAB38D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:25:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0jD312dz2yr9;
	Mon, 12 May 2025 23:25:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747056336;
	cv=none; b=hnZ5j4FmSpoUsCtPV0bRERnT6a346vac1qAu4K+Ixe2zASBSvr2I+94uXGBjF5d6EigS8mMf2OQCHkHa8s0ev7kx+s8cO57A/ton8fIoNQ9JD7NhDPMEYkZhwy1VXy6m9F9lMK7J1xbikHZUtqOkaQVEyuh68c1AdRUJBBfR7qNJugdQ7Qr45emW3rp/ihg8l3AgtRWsaGvtmYv1l2pjFRjYCC5heYKemabXE59ASXbS9pHEsFjvkaLlmaKbSFzkvGxMNm0LuwIv8kIFxl92fbJVeJIAgwzQhEP5n/79Vbe21D3x+T1qvIBpN4zkHO/bbvhWHALi/cAEFjlDeIXpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747056336; c=relaxed/relaxed;
	bh=znSs0IWOkqtw8MwO3eoXgDf53PvMGgHP2+ODqAezjoE=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=Kjp9EAt1kLr5PHBWHHWkV/7gjo6mx/fRQT1JYyIBH+iqeG/V09NMiUWN1t4nReSUnY+kPNpZCz6lbC1lyiXvp6UL0QpdEu+nbds57m1Wqx0tAF3qQ0H8GhpMdA6TCxyBghHaJMvZkXW0bk0yxCn/+TDDuniBTUfAN6Gm7FVWoFxYtPBaCFVAHZMR2ZVZLjE1QYP5tea8eOrfqvsY9VCQooCRacwkauo+i0i+11emnjERJP9UNT50SWJPr6XWrk/rmTLs/8Op7GxYfdqpwTQpLTYZV0LnlggtE/h1Khzhv0zDsa3MSaBQXeiWjyLcXubuERgb3I07uasTmKFrTsiHXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ewW/u3nJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgFhtm3e; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ewW/u3nJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TgFhtm3e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0jB4qlMz2yr3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:25:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=znSs0IWOkqtw8MwO3eoXgDf53PvMGgHP2+ODqAezjoE=;
	b=ewW/u3nJIaP/Bvcfw95pAv/jIcWDn7HL5EFYgNLhenKBSjm5lHxzhUh27k0PE79UwyDpra
	x5ewkfOfYYQdQSSLymVSxiZF4xLR7lVl0CuGEh9zSo7bun63quIk1gJyJzhhneSWDgD5Be
	h2npp4KW/FgcojvmpV7a4jFgNYCx/wo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=znSs0IWOkqtw8MwO3eoXgDf53PvMGgHP2+ODqAezjoE=;
	b=TgFhtm3euUVQn+cEXdKSt7+K7lJJD5PsIgsUyUlhokpMJJfAq60dZ9u8jdxcQ0vNukJ2xj
	2hvfQBIDs4SGPKr2WWRDZ5BFRbEX0wXxT20176buYOxA3nEa0HV7RNdF2Y2ttmLZJv+xsR
	OJHlupGZAY1I/OphAcXg4/Kes1Rll0s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-p6KGzG5PMh-XUMKxTZu0Cw-1; Mon, 12 May 2025 09:25:26 -0400
X-MC-Unique: p6KGzG5PMh-XUMKxTZu0Cw-1
X-Mimecast-MFC-AGG-ID: p6KGzG5PMh-XUMKxTZu0Cw_1747056325
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5f63ee41315so3502875a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056322; x=1747661122;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znSs0IWOkqtw8MwO3eoXgDf53PvMGgHP2+ODqAezjoE=;
        b=mdbyH8qWoygYhtNrJHkVuEKc21eRXmTVkcGLOXCc7eNENfevbh1ctrQeSgY1aW5zR8
         WCeV4EZTr7k3wQG/D485qeNXeubrPWj7w6TljDtsfJzTyVn06ecq4sUWrPXFuwK2fOgq
         k5ze3sm9huLy3RgorQIjMTiJWLD2+Ji9LBsuShCKhwI20XTVb7Exi0scbvjmK+6Gpw/E
         l4BFhcrov0YKZco6XJ7OHowkFwV8ETqDWBdR/kldG65wLrI1Rm3wanSQebVKcwMWJ3Sw
         7N+vE+wGDdvE7K3byj8tqfH4BupyBPymtUnvYvS+wudhUbQb6O27DpF1yXoNQ1NMWmAb
         WTiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT78RFeq4t8GRL5Iyw4OOg0IlWc3MqzoZAq1wtOEpXXsHhkp7ehxQ4pBqTCUKAWopITBDhHJwF7fBYDgo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzj/w18YiaqbFmE1NLuKjf2t1yJuvXfZWoezUgb0dtmEEVJ0S3U
	EhEBiARHxHdZ30QIG7cdu8AjSiimuK4MaT917Yr+EkC2n8d6ip+nPPs3VwDP67vATGUKTSmz3dT
	MKZqw4sOOEku8yggFtftgarcop5rSWsLKcuj/a6R2UAvRtUIrl17RnVyym+odUA==
X-Gm-Gg: ASbGncubd+UNmQ1fmYJJbTb/qVGtvGEQPlhu6TyXSLPo+AY/CXU18UQSwJd7PWv61jX
	yK6zfi3G6RXONBeDCqrLCrHO0BgFauNhS6+cuW5ke/HGQL8aWwY3EGr9OKybFU3kvuz1ZvJBGwq
	6VdgEL/VbQCeZibx+f1NcvDIdNC0hE1SK4aqnzVuoLaYOUzH+xJ8/HLxpobKK9+4K9R3ghDwEAv
	6WSXvYcUjEyhZSldjhnfquYLK7rjI4Ywmukilx4jlG9YeupsPczh+Vlio+5nsyvyqAaFLwvoj7g
	N/bAeZLvaeUZqmgbFt7qKfkkw6o=
X-Received: by 2002:a05:6402:210a:b0:5fd:d62b:6dc5 with SMTP id 4fb4d7f45d1cf-5fdd62b7050mr3299867a12.29.1747056321449;
        Mon, 12 May 2025 06:25:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaL41IYlcRU0gfEoHIziqFeoGWmkEphkigf6LhzVcLkqHPd4BCHb1Ws6xsUyGCgK+qlle9IQ==
X-Received: by 2002:a05:6402:210a:b0:5fd:d62b:6dc5 with SMTP id 4fb4d7f45d1cf-5fdd62b7050mr3299802a12.29.1747056320855;
        Mon, 12 May 2025 06:25:20 -0700 (PDT)
Received: from [127.0.0.1] (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc2633bsm5788360a12.20.2025.05.12.06.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:25:20 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Subject: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Date: Mon, 12 May 2025 15:25:11 +0200
Message-Id: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIALf2IWgC/23NTQrCMBCG4auUrI0kkx9bV95DXCTNRIOllaSEl
 tK7m4ogosv3g3lmIQljwESO1UIi5pDC0JdQu4q0N9NfkQZXmgADxTiXdDLjGM1I05xa03VUG86
 FduCsaki5ekT0YXqJ50vpW0jjEOfXgwzb+rYAfqwMlFNlhWZOettaON0x9tjth3glG5bFBwDOf
 wFRAMMOjitfN/UfQH4AAX8ASRkVWANqbwVo+QWs6/oEtac3pDEBAAA=
X-Change-ID: 20250114-xattrat-syscall-6a1136d2db59
To: Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
 Andrey Albershteyn <aalbersh@kernel.org>, 
 Andrey Albershteyn <aalbersh@redhat.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7943; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=DoJT2dz8txJo2HLysgqy6uqVMVeur99HqA28GNGz35o=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIYMhS/7b0QKJ82jaWWRVhW4In5zAcZBvx6qUEv70UqB
 RWJuk0Pbe4oZWEQ42KQFVNkWSetNTWpSCr/iEGNPMwcViaQIQxcnAIwEaVkRoYnXrLFK7oFvFPP
 XX3zsO+a598Q0ciHIVO31Phv4lnUsfglw2+2XZma+/KWM07dl6f18X/n3LKzLzyvfH/awin/Nt3
 6lSETAMKKRyg=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: S2qHH3s3z-grE-1cJrd7JTuzGNONx4rf3coOYFGtlbY_1747056325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patchset introduced two new syscalls file_getattr() and
file_setattr(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
except they use *at() semantics. Therefore, there's no need to open the
file to get a fd.

These syscalls allow userspace to set filesystem inode attributes on
special files. One of the usage examples is XFS quota projects.

XFS has project quotas which could be attached to a directory. All
new inodes in these directories inherit project ID set on parent
directory.

The project is created from userspace by opening and calling
FS_IOC_FSSETXATTR on each inode. This is not possible for special
files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
with empty project ID. Those inodes then are not shown in the quota
accounting but still exist in the directory. This is not critical but in
the case when special files are created in the directory with already
existing project quota, these new inodes inherit extended attributes.
This creates a mix of special files with and without attributes.
Moreover, special files with attributes don't have a possibility to
become clear or change the attributes. This, in turn, prevents userspace
from re-creating quota project on these existing files.

NAME

	file_getattr/file_setattr - get/set filesystem inode attributes

SYNOPSIS

	#include <sys/syscall.h>    /* Definition of SYS_* constants */
	#include <unistd.h>

	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
		struct fsxattr *fsx, size_t size, unsigned int at_flags);
	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
		struct fsxattr *fsx, size_t size, unsigned int at_flags);

	Note: glibc doesn't provide for file_getattr()/file_setattr(),
	use syscall(2) instead.

DESCRIPTION

	The syscalls take fd and path. If path is absolute, fd is not
	used. If path is empty, fd can be AT_FDCWD or any valid fd which
	will be used to get/set attributes on.

	This is an alternative to FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR
	ioctl with a difference that file don't need to be open as we
	can reference it with a path instead of fd. By having this we
	can manipulated filesystem inode attributes not only on regular
	files but also on special ones. This is not possible with
	FS_IOC_FSSETXATTR ioctl as with special files we can not call
	ioctl() directly on the filesystem inode using file descriptor.

	at_flags can be set to AT_SYMLINK_NOFOLLOW or AT_EMPTY_PATH.

RETURN VALUE

	On success, 0 is returned.  On error, -1 is returned, and errno
	is set to indicate the error.

ERRORS

	EINVAL		Invalid at_flag specified (only
			AT_SYMLINK_NOFOLLOW and AT_EMPTY_PATH is
			supported).

	EINVAL		Size was smaller than any known version of
			struct fsxattr.

	EINVAL		Invalid combination of parameters provided in
			fsxattr for this type of file.

	E2BIG		Size of input argument **struct fsxattr** is too
			big.

	EBADF		Invalid file descriptor was provided.

	EPERM		No permission to change this file.

	EOPNOTSUPP	Filesystem does not support setting attributes
			on this type of inode

HISTORY

	Added in Linux 6.15.

EXAMPLE

Create directory and file "mkdir ./dir && touch ./dir/foo" and then
execute the following program:

	#include <fcntl.h>
	#include <errno.h>
	#include <string.h>
	#include <linux/fs.h>
	#include <stdio.h>
	#include <sys/syscall.h>
	#include <unistd.h>

	int
	main(int argc, char **argv) {
		int dfd;
		int error;
		struct fsxattr fsx;

		dfd = open("./dir", O_RDONLY);
		if (dfd == -1) {
			printf("can not open ./dir");
			return dfd;
		}

		error = syscall(467, dfd, "./foo", &fsx, 0);
		if (error) {
			printf("can not call 467: %s", strerror(errno));
			return error;
		}

		printf("dir/foo flags: %d\n", fsx.fsx_xflags);

		fsx.fsx_xflags |= FS_XFLAG_NODUMP;
		error = syscall(468, dfd, "./foo", &fsx, 0);
		if (error) {
			printf("can not call 468: %s", strerror(errno));
			return error;
		}

		printf("dir/foo flags: %d\n", fsx.fsx_xflags);

		return error;
	}

SEE ALSO

	ioctl(2), ioctl_iflags(2), ioctl_xfs_fsgetxattr(2)

---
Changes in v5:
- Remove setting of LOOKUP_EMPTY flags which does not have any effect
- Return -ENOSUPP from vfs_fileattr_set()
- Add fsxattr masking (by Amir)
- Fix UAF issue dentry
- Fix getname_maybe_null() issue with NULL path
- Implement file_getattr/file_setattr hooks
- Return LSM return code from file_setattr
- Rename from getfsxattrat/setfsxattrat to file_getattr/file_setattr
- Link to v4: https://lore.kernel.org/r/20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org

Changes in v4:
- Use getname_maybe_null() for correct handling of dfd + path semantic
- Remove restriction for special files on which flags are allowed
- Utilize copy_struct_from_user() for better future compatibility
- Add draft man page to cover letter
- Convert -ENOIOCTLCMD to -EOPNOSUPP as more appropriate for syscall
- Add missing __user to header declaration of syscalls
- Link to v3: https://lore.kernel.org/r/20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org

Changes in v3:
- Remove unnecessary "dfd is dir" check as it checked in user_path_at()
- Remove unnecessary "same filesystem" check
- Use CLASS() instead of directly calling fdget/fdput
- Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org

v1:
https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/

Previous discussion:
https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/

---
Amir Goldstein (1):
      fs: prepare for extending file_get/setattr()

Andrey Albershteyn (6):
      fs: split fileattr related helpers into separate file
      lsm: introduce new hooks for setting/getting inode fsxattr
      selinux: implement inode_file_[g|s]etattr hooks
      fs: split fileattr/fsxattr converters into helpers
      fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
      fs: introduce file_getattr and file_setattr syscalls

 arch/alpha/kernel/syscalls/syscall.tbl      |   2 +
 arch/arm/tools/syscall.tbl                  |   2 +
 arch/arm64/tools/syscall_32.tbl             |   2 +
 arch/m68k/kernel/syscalls/syscall.tbl       |   2 +
 arch/microblaze/kernel/syscalls/syscall.tbl |   2 +
 arch/mips/kernel/syscalls/syscall_n32.tbl   |   2 +
 arch/mips/kernel/syscalls/syscall_n64.tbl   |   2 +
 arch/mips/kernel/syscalls/syscall_o32.tbl   |   2 +
 arch/parisc/kernel/syscalls/syscall.tbl     |   2 +
 arch/powerpc/kernel/syscalls/syscall.tbl    |   2 +
 arch/s390/kernel/syscalls/syscall.tbl       |   2 +
 arch/sh/kernel/syscalls/syscall.tbl         |   2 +
 arch/sparc/kernel/syscalls/syscall.tbl      |   2 +
 arch/x86/entry/syscalls/syscall_32.tbl      |   2 +
 arch/x86/entry/syscalls/syscall_64.tbl      |   2 +
 arch/xtensa/kernel/syscalls/syscall.tbl     |   2 +
 fs/Makefile                                 |   3 +-
 fs/ecryptfs/inode.c                         |   8 +-
 fs/file_attr.c                              | 475 ++++++++++++++++++++++++++++
 fs/ioctl.c                                  | 309 ------------------
 fs/overlayfs/inode.c                        |   2 +-
 include/linux/fileattr.h                    |  26 ++
 include/linux/lsm_hook_defs.h               |   2 +
 include/linux/security.h                    |  16 +
 include/linux/syscalls.h                    |   6 +
 include/uapi/asm-generic/unistd.h           |   8 +-
 include/uapi/linux/fs.h                     |   3 +
 security/security.c                         |  30 ++
 security/selinux/hooks.c                    |  14 +
 29 files changed, 621 insertions(+), 313 deletions(-)
---
base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
change-id: 20250114-xattrat-syscall-6a1136d2db59

Best regards,
-- 
Andrey Albershteyn <aalbersh@kernel.org>


