Return-Path: <linuxppc-dev+bounces-8515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974CEAB3907
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 15:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx0lh3mjTz2yrB;
	Mon, 12 May 2025 23:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747056464;
	cv=none; b=kZMR89QXh61/LWQtoiisQT5itfl+0Vn6iJ0gTBkNttbG4piFGmrInScs+tAnZ9OqlFSuMQaHGVu3EalmUvVzJTrowR/ejUqKMVfvivTw1pVZftRAV1xjgsub3ht/Lr6w2Smvnom8A+M3pj7wOcVYgx5prf5w3dvExUc+rkhBnZVi/+ypd55cI0vU/++7FRoxh6QQFS/1D10qrwx8YruqYXCPtn/LQqV974dvQWwN/WGJ0hS2R0EKBicaC2R6KeJP2lMM3WZdMu6Ff5irDvsf3kRnhpVcw/1yGrzMSPz84twAlnGT5j3aAADt6w82yVK0fd9QaWJhmWMi8umrHAwYIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747056464; c=relaxed/relaxed;
	bh=iGGf03vY07V5lmldCU9BJs4LhScCZSGAvX7drfDcFVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Gp7MUvy8zlgAQ7WhVfBf7bC4RbgNUpJeknasgE22+/fnwmtiC+u1N4iVrBRg613dfTYfX1BTYYB7i2BfuvpRj1TF0dXCA6kxZdmm2XNi5EUg0905FumBoSoJNUue5Rqp2klASc+I8UkIA03TxlTZoMgk2OZ6xhbYPDxfjSsOZo3DH7mrBInvx4Aul7kB+AHOqTsXxI9oA9zEYnR/iFKgm/6pw292D8Dhd2DVL9jPtV+mvMLA7Oc3whb2qFAQUJX6ePpU3n9H8fhV8ZuOeXnV/k4RxP3UyW4nLb7OOR0PuqUXHc3gWyQTla8WLUbn0qGTBaGmcdME97brHYvMETRk6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DHrCJ5eB; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkymATKQ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DHrCJ5eB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bkymATKQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx0lg2ySMz2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 23:27:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iGGf03vY07V5lmldCU9BJs4LhScCZSGAvX7drfDcFVs=;
	b=DHrCJ5eBGm8c9pvRnBEm71vzd8GoblqmhBn02fbjJ4+rA/1b61ziz6YXxRdBz7qKgNqAQT
	wsHDYYgr0+NVJr15k35ixycTvfDh8FnkZRBkfez5Uw64wE/9IFTtXTA/C7wwUbQdEFgyz5
	ucsaXAVpET/1WB62AYBWcdOAdDWQKkI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747056461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iGGf03vY07V5lmldCU9BJs4LhScCZSGAvX7drfDcFVs=;
	b=bkymATKQr4a7/hvpOIw8tU2gpHkeXZGCKCImvF05adIIFXCs1PZGu/IKwcJiU0GQe/Avhe
	O/36UbHMH6Onl7td4stosKlMX1T7a9osdmMJD6mSDxsxOvJPA3QR8zvUEwZdNfHLg89+61
	59yhgNF0bJbknf086+ZMKGRDXlQeRS0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-vIWFf-q9Nt-CgMd9-32Ncg-1; Mon, 12 May 2025 09:27:39 -0400
X-MC-Unique: vIWFf-q9Nt-CgMd9-32Ncg-1
X-Mimecast-MFC-AGG-ID: vIWFf-q9Nt-CgMd9-32Ncg_1747056459
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb94dbd01fso538806166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 May 2025 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056454; x=1747661254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGGf03vY07V5lmldCU9BJs4LhScCZSGAvX7drfDcFVs=;
        b=H3s1bEgWsM0t2oQy2vDC98V1nxn/I617j1TkoRN2bFJsGOzBrW19W7cIi07UJSsY+Z
         BV07wJT26+MBB9RYY1eXAeMwrIhBu0iocp+NFYM+Q1tExsNyKPCQJC8WMx5pFcW9bYkS
         O/MJ0SAen+B4SJhLI3VrnFX/mMMqnv3WmnfQW9DgHi4EYQ1+sUeGFaID1AnUol8kxiGZ
         UpvHRae0tRvkBHnKNDwgvzvmKWZ+1G1FkukBV0HOzV+D5i1AB6SuLF+F5diybxNghngu
         Gox1R3v46lhu8WUkn/4IKmNjLKlPWtdZW2zMmeA7TS7LLkLL9CJY70Hr/zzww/MIm/QA
         QLxg==
X-Forwarded-Encrypted: i=1; AJvYcCWM3RxmTNMOA/bqiY8dWd6PMuYhfwdesRnV5EGV+x62JM+BknzVt8I/PEDpxWbYmm/3Y/eV7b20s7lMQyU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4bpnNOQua9vyetJfYl7oD0AYvnlbUp7P7SByLezvdaoImZG+Y
	kjQCooypJHSl9oGkZVEHA0XtnXxCvWAZYwER3ym1R7GyZTgfxRSVKFmVhXrXKQ6tgu8DKpp7q8f
	Up0u5SSwKFXkuGayX6t79GSjc+GMEdxLMtnxRPVwI1x9zH66aVMYmNDG05M68sg==
X-Gm-Gg: ASbGncsauAlxkg2PDpFOm5bhLytEPpe6JL1ss49WYxek2Om59JqLVc/D4mNVZdd1KOp
	TDprxFvhe4hmqVSVhQtr30N8YP65EVXn7fvJWVa8qrGnY4MRUQC+6JogSDITvoXQ0XYfZacGYB8
	V+zp1RnWR60swNKLNyZmR9pM2HSVoCue6DbyQYEl/zqDh2trkfdzyHXv9V2idGlW3bCVA1mYAcb
	3GYj4GLz+WScSp5maJ2bdCtR8+K4C2SvGtYs7Anovo/RzBG3ArdU9o2UfgQhFxCq6Gp3EoCw9ZE
	sm5T4Vxyxha9j1I7bSgGQ/lzePqFHYKRym594QmD
X-Received: by 2002:a17:907:9445:b0:ad2:4fb7:6cd7 with SMTP id a640c23a62f3a-ad24fb76ef4mr525376066b.2.1747056453509;
        Mon, 12 May 2025 06:27:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm4UNzZCaTm3fHiXFFpEAhvK4jv+cPjTSwVPTo38ODFU1cRFitMK9hJpp/EAl8sqqyR4widQ==
X-Received: by 2002:a17:907:9445:b0:ad2:4fb7:6cd7 with SMTP id a640c23a62f3a-ad24fb76ef4mr525364866b.2.1747056452886;
        Mon, 12 May 2025 06:27:32 -0700 (PDT)
Received: from thinky (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21988d6bdsm610935066b.180.2025.05.12.06.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:27:32 -0700 (PDT)
Date: Mon, 12 May 2025 15:27:29 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <akc24cmkeuna2vo6cdxxyvcdyl7jd7kblesozfjok7jy4tpiok@oxkqmcoeumo2>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
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
In-Reply-To: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dW_-pYFtAWVZVCXvXbU8hQe5c8Lp9QtqzRr79ENVwkI_1747056459
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-12 15:25:11, Andrey Albershteyn wrote:
> This patchset introduced two new syscalls file_getattr() and
> file_setattr(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
> except they use *at() semantics. Therefore, there's no need to open the
> file to get a fd.
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
> NAME
> 
> 	file_getattr/file_setattr - get/set filesystem inode attributes
> 
> SYNOPSIS
> 
> 	#include <sys/syscall.h>    /* Definition of SYS_* constants */
> 	#include <unistd.h>
> 
> 	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> 	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> 
> 	Note: glibc doesn't provide for file_getattr()/file_setattr(),
> 	use syscall(2) instead.
> 
> DESCRIPTION
> 
> 	The syscalls take fd and path. If path is absolute, fd is not
> 	used. If path is empty, fd can be AT_FDCWD or any valid fd which
> 	will be used to get/set attributes on.
> 
> 	This is an alternative to FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR
> 	ioctl with a difference that file don't need to be open as we
> 	can reference it with a path instead of fd. By having this we
> 	can manipulated filesystem inode attributes not only on regular
> 	files but also on special ones. This is not possible with
> 	FS_IOC_FSSETXATTR ioctl as with special files we can not call
> 	ioctl() directly on the filesystem inode using file descriptor.
> 
> 	at_flags can be set to AT_SYMLINK_NOFOLLOW or AT_EMPTY_PATH.
> 
> RETURN VALUE
> 
> 	On success, 0 is returned.  On error, -1 is returned, and errno
> 	is set to indicate the error.
> 
> ERRORS
> 
> 	EINVAL		Invalid at_flag specified (only
> 			AT_SYMLINK_NOFOLLOW and AT_EMPTY_PATH is
> 			supported).
> 
> 	EINVAL		Size was smaller than any known version of
> 			struct fsxattr.
> 
> 	EINVAL		Invalid combination of parameters provided in
> 			fsxattr for this type of file.
> 
> 	E2BIG		Size of input argument **struct fsxattr** is too
> 			big.
> 
> 	EBADF		Invalid file descriptor was provided.
> 
> 	EPERM		No permission to change this file.
> 
> 	EOPNOTSUPP	Filesystem does not support setting attributes
> 			on this type of inode
> 
> HISTORY
> 
> 	Added in Linux 6.15.
> 
> EXAMPLE
> 
> Create directory and file "mkdir ./dir && touch ./dir/foo" and then
> execute the following program:
> 
> 	#include <fcntl.h>
> 	#include <errno.h>
> 	#include <string.h>
> 	#include <linux/fs.h>
> 	#include <stdio.h>
> 	#include <sys/syscall.h>
> 	#include <unistd.h>
> 
> 	int
> 	main(int argc, char **argv) {
> 		int dfd;
> 		int error;
> 		struct fsxattr fsx;
> 
> 		dfd = open("./dir", O_RDONLY);
> 		if (dfd == -1) {
> 			printf("can not open ./dir");
> 			return dfd;
> 		}
> 
> 		error = syscall(467, dfd, "./foo", &fsx, 0);
> 		if (error) {
> 			printf("can not call 467: %s", strerror(errno));
> 			return error;
> 		}
> 
> 		printf("dir/foo flags: %d\n", fsx.fsx_xflags);
> 
> 		fsx.fsx_xflags |= FS_XFLAG_NODUMP;
> 		error = syscall(468, dfd, "./foo", &fsx, 0);
> 		if (error) {
> 			printf("can not call 468: %s", strerror(errno));
> 			return error;
> 		}
> 
> 		printf("dir/foo flags: %d\n", fsx.fsx_xflags);
> 
> 		return error;
> 	}
> 
> SEE ALSO
> 
> 	ioctl(2), ioctl_iflags(2), ioctl_xfs_fsgetxattr(2)
> 
> ---
> Changes in v5:
> - Remove setting of LOOKUP_EMPTY flags which does not have any effect
> - Return -ENOSUPP from vfs_fileattr_set()
> - Add fsxattr masking (by Amir)
> - Fix UAF issue dentry
> - Fix getname_maybe_null() issue with NULL path
> - Implement file_getattr/file_setattr hooks
> - Return LSM return code from file_setattr
> - Rename from getfsxattrat/setfsxattrat to file_getattr/file_setattr
> - Link to v4: https://lore.kernel.org/r/20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org
> 
> Changes in v4:
> - Use getname_maybe_null() for correct handling of dfd + path semantic
> - Remove restriction for special files on which flags are allowed
> - Utilize copy_struct_from_user() for better future compatibility
> - Add draft man page to cover letter
> - Convert -ENOIOCTLCMD to -EOPNOSUPP as more appropriate for syscall
> - Add missing __user to header declaration of syscalls
> - Link to v3: https://lore.kernel.org/r/20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org
> 
> Changes in v3:
> - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> - Remove unnecessary "same filesystem" check
> - Use CLASS() instead of directly calling fdget/fdput
> - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> 
> v1:
> https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> 
> Previous discussion:
> https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> 
> ---
> Amir Goldstein (1):
>       fs: prepare for extending file_get/setattr()
> 
> Andrey Albershteyn (6):
>       fs: split fileattr related helpers into separate file
>       lsm: introduce new hooks for setting/getting inode fsxattr
>       selinux: implement inode_file_[g|s]etattr hooks
>       fs: split fileattr/fsxattr converters into helpers
>       fs: make vfs_fileattr_[get|set] return -EOPNOSUPP
>       fs: introduce file_getattr and file_setattr syscalls
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
>  fs/Makefile                                 |   3 +-
>  fs/ecryptfs/inode.c                         |   8 +-
>  fs/file_attr.c                              | 475 ++++++++++++++++++++++++++++
>  fs/ioctl.c                                  | 309 ------------------
>  fs/overlayfs/inode.c                        |   2 +-
>  include/linux/fileattr.h                    |  26 ++
>  include/linux/lsm_hook_defs.h               |   2 +
>  include/linux/security.h                    |  16 +
>  include/linux/syscalls.h                    |   6 +
>  include/uapi/asm-generic/unistd.h           |   8 +-
>  include/uapi/linux/fs.h                     |   3 +
>  security/security.c                         |  30 ++
>  security/selinux/hooks.c                    |  14 +
>  29 files changed, 621 insertions(+), 313 deletions(-)
> ---
> base-commit: 0d8d44db295ccad20052d6301ef49ff01fb8ae2d
> change-id: 20250114-xattrat-syscall-6a1136d2db59
> 
> Best regards,
> -- 
> Andrey Albershteyn <aalbersh@kernel.org>
> 

Ignore please, somehow b4 crashed with timeout on gmail

-- 
- Andrey


