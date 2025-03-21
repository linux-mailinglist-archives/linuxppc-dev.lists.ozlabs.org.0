Return-Path: <linuxppc-dev+bounces-7281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB24A6C392
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 20:49:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKCh155MQz30V7;
	Sat, 22 Mar 2025 06:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742586561;
	cv=none; b=kNoj+Tlu8NWOuN563rbQTaoAIi0V5FrfWK16c0fyb0xWTOjAeT1yLb4YxWIWJa0LJXpuiSJjbxYKK0eXeByUyKplyGcjgELEBUdCPo2A5qO35zTDheufVbw7QyGXlGmKwbcLdYWXWKtLt33BXwM6QjQSkQ4EPPwbHZAOXGIT8cgSRl1HMSWkPqglzIdK5XK/LDjxyvjxa9BQXO6gvief/HGeXyqxwecsIFotLx1Ec0jXILmJF6AUjbK9jkxgVN6WRFezD/gMxXQRB+rbgP1D2QyRoOccYooD0pBMdnw2lqCHjdq13nV45Dqdfd9OFmufdELqKyMn98UVJVwrsvMJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742586561; c=relaxed/relaxed;
	bh=1wNhBnm2ReGLfeaXSKjzDT3Sr3/X+7bRy4uy/8cmkEY=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=Z60eTWtwKXI0maqy1CsxwyCkuIJ1FCS7gHya+vghhUh+ndhUbATxLye5Zys6RaiTB1+5rrfVnLX+YqAHig6aEpFeXQeEAXpV5wkz7mB78MOhFOAEgy7O6MDiW7Dgvioj9XfEnlibV0C6kXG9ihgjj6PyuXt3BMfjrHm69z7jmf1YL2rwKveEUYAtTCm1AFFaryTy71kc053EqJlKVh26m/vs5QIY4s0B19FJT1inlsXA25GsMhi4r9js057szSKGp2Ujc3psaqnSm/OQetTXtW5LVmRy/5HXcwZR7L7a8YX+sv8+P4GckFK95S82HnhrEv3i53v+HpCF3lf+I4PXRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pzu+hAF9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D0xvmeJx; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Pzu+hAF9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D0xvmeJx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKCh01CPHz30TJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 06:49:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1wNhBnm2ReGLfeaXSKjzDT3Sr3/X+7bRy4uy/8cmkEY=;
	b=Pzu+hAF927PdDwAGX8Rni0K1T2aQ+wOFp/15p9CekgZJDAd07InWoZOshkuljtv7orwVFb
	3r6ptrm14mvb9dSCxT27F2cdJqe1eDJ5/KPZhE6e5WAQklLwJvyWpHaiz1KcD0h5A7LA8X
	dW6SiqTS5j/Giww/HL3HppEoawks/Dw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742586557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1wNhBnm2ReGLfeaXSKjzDT3Sr3/X+7bRy4uy/8cmkEY=;
	b=D0xvmeJxfwuO6wMoqa2l+QN2I4E8f/0LfdQWhBcrE3vTRA+uLZK8J0VraF6enuEaEyVeiL
	DENDa8fRR/ZvFppFjZgLSYYlAo+Kx693GW6YXLNf3pAkXRLLrxmjqXo1LwAxB3ZD2vnkqb
	Qhr0bsvkeZDXGZcVeGNtnBL/ZM2G3/s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-opUakRIXMrC3gHw4SRmwzA-1; Fri, 21 Mar 2025 15:49:14 -0400
X-MC-Unique: opUakRIXMrC3gHw4SRmwzA-1
X-Mimecast-MFC-AGG-ID: opUakRIXMrC3gHw4SRmwzA_1742586553
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3d89cc4f3so176282366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 12:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742586548; x=1743191348;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wNhBnm2ReGLfeaXSKjzDT3Sr3/X+7bRy4uy/8cmkEY=;
        b=BbqCmKdo/ZINCBaLWwCDI67ALPv4YJrCL/5H0MkVfirWcRwZ+6qJDR492zuEFTEPTZ
         3y8EBh1b/vq+/mQHnZQSbgnCwXvVOpJKm9btFPGb5+CxqUvSlm0ukqTRkTPH9uUI9VwN
         oR4ye3SAnJvk7Kp4pcxJFRxxEW9VS0t8ohZFCLG1D4f4nrOqfmDZ5+z75yDWbw6PQGjq
         khEe+etuQqXuVypd+fEPDhVCdtawn+S9DPvngMJ5JuGhlfLmQgfrt2T2pDDpe7IW/f/N
         vvtdOZpBdXHmVdAO7fdg/OTwbaxLMyxKsYfjZqYmLpLBWK4qg+6IAZBQgq3HA682kK+D
         y3BA==
X-Forwarded-Encrypted: i=1; AJvYcCX/wpvCKKpFmjg3NGi7/akVvkQr6clab4bYU7zPO6+0REnnUMXPPEdlYOj1QUMqcN6sk8jSjmTiBQHymEM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyB8LMfFHZDiv2h+10GGX9QTGD9aJIzCE/i32CJatqSAH7d6KlT
	cJ+Zqv2RdRNWJxT9EdhK1AUNQebHGP/UDSAzonEZ9MSKnGmqkBDREq5hUhMxPQD25ZB49rGZZS4
	mbF0s7jrXvXfGP9t8U73O1mgPzTwyMYD8Rl+uHNFEbCWhx4RsiquvPz/YFs6TEg==
X-Gm-Gg: ASbGncuF4E6tOcUOAG5YfN+DErwBHPLTPvbdcs6jUtppg84wwuHl2hGf1iynS36ydy8
	mowgLf29DcKQ1Go/iLplMzorvrBrH/PI9BmGkLjSRzV+BWHK5WvaNaLjvllZ1xNJlRkrFhs+ZVK
	oY4UH5wkKs2QG/xbucD6rb2hHNCjQPIuYR6rE+4It2OOzJTVKihrJWItEXV0cSYGMki8d3nyKf2
	NEat2jfrE288ZtwJRUxAAFp89GIf8mI6HsntK7lWKx2pcrQ4u8ggkHLOuQVMAyqvSTgw8ugB1bs
	/y4LAY73R3QW4ica6hzj6F9fjC1pNJAqbu/FvfgcJg==
X-Received: by 2002:a17:907:7dab:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-ac3f251f252mr442159166b.50.1742586547681;
        Fri, 21 Mar 2025 12:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIuU8NfxIMB+ef2e3eKHAzCm35NOLlzxTP1nDtQXGYf88xl+hzf++88iNdtamLPujW3TPHjA==
X-Received: by 2002:a17:907:7dab:b0:ac2:7a6d:c927 with SMTP id a640c23a62f3a-ac3f251f252mr442156966b.50.1742586547062;
        Fri, 21 Mar 2025 12:49:07 -0700 (PDT)
Received: from [127.0.0.2] (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d38sm204412266b.39.2025.03.21.12.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 12:49:06 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
X-Google-Original-From: Andrey Albershteyn <aalbersh@kernel.org>
Subject: [PATCH v4 0/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Date: Fri, 21 Mar 2025 20:48:39 +0100
Message-Id: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAJjC3WcC/2XN0QqDIBTG8VcJr+fwHLPVrvYeYxeaVrKoUJEie
 vdZDAbr8v/B+Z2VeOOs8eSercSZaL0dhxT5JSN1J4fWUKtTE2QoGEBOZxmCk4H6xdey72khAXi
 hUStRkXQ1OdPY+RCfr9Sd9WF0y/Eg4r5+LcSTFZECFYoXTOeNqhU+3sYNpr+OriU7FvkPQIAzw
 BMg2U2DaMqq/AO2bfsAGIg0CfAAAAA=
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
 "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
 selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>, 
 Andrey Albershteyn <aalbersh@redhat.com>, linux-xfs@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7149; i=aalbersh@kernel.org;
 h=from:subject:message-id; bh=FQVoAK1grhAv3nZByLs+uzRSU6UsJz/ykU8hQy3B+S4=;
 b=owJ4nJvAy8zAJea2/JXEGuOHHIyn1ZIY0u8e2vB17Ur5VW0+Gx1C7pyq2fjopYGGydO9y6YW+
 c/4/jCiIG1rRykLgxgXg6yYIss6aa2pSUVS+UcMauRh5rAygQxh4OIUgIlcSGZkaAtVCfd2P3uU
 cQdTt4coF6++p8WE+2wb8xhWObiyr2E8y8jQURZRWfY081TjgR7tSktm7c+nv4iv0W9lm1se/Wa
 T5xkGAGijRuY=
X-Developer-Key: i=aalbersh@kernel.org; a=openpgp;
 fpr=AE1B2A9562721A6FC4307C1F46A7EA18AC33E108
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c5hB1NkI_rSvYz7t-P6p3Zwvz13jgrVSllVsAdMkDIU_1742586553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patchset introduced two new syscalls getfsxattrat() and
setfsxattrat(). These syscalls are similar to FS_IOC_FSSETXATTR ioctl()
except they use *at() semantics. Therefore, there's no need to open the
file to get an fd.

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

Christian, if this get in some mergeable state, please don't merge it
yet. Amir suggested these syscalls better to use updated struct fsxattr
with masking from Pali Rohár patchset, so, let's see how it goes.

NAME

	getfsxattrat/setfsxattrat - get/set filesystem inode attributes

SYNOPSIS

	#include <sys/syscall.h>    /* Definition of SYS_* constants */
	#include <unistd.h>

	long syscall(SYS_getfsxattrat, int dirfd, const char *pathname,
		struct fsxattr *fsx, size_t size,
		unsigned int at_flags);
	long syscall(SYS_setfsxattrat, int dirfd, const char *pathname,
		struct fsxattr *fsx, size_t size,
		unsigned int at_flags);

	Note: glibc doesn't provide for getfsxattrat()/setfsxattrat(),
	use syscall(2) instead.

DESCRIPTION

	The syscalls take fd and path to the child together with struct
	fsxattr. If path is absolute, fd is not used. If path is empty,
	inode under fd is used to get/set attributes on.

	This is an alternative to FS_IOC_FSGETXATTR/FS_IOC_FSSETXATTR
	ioctl with a difference that file don't need to be open as we
	can reference it with a path instead of fd. By having this we
	can manipulated filesystem inode attributes not only on regular
	files but also on special ones. This is not possible with
	FS_IOC_FSSETXATTR ioctl as with special files we can not call
	ioctl() directly on the filesystem inode using file descriptor.

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

	Added in Linux 6.14.

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
Andrey Albershteyn (3):
      lsm: introduce new hooks for setting/getting inode fsxattr
      fs: split fileattr/fsxattr converters into helpers
      fs: introduce getfsxattrat and setfsxattrat syscalls

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
 fs/inode.c                                  | 130 ++++++++++++++++++++++++++++
 fs/ioctl.c                                  |  39 ++++++---
 include/linux/fileattr.h                    |   2 +
 include/linux/lsm_hook_defs.h               |   4 +
 include/linux/security.h                    |  16 ++++
 include/linux/syscalls.h                    |   6 ++
 include/uapi/asm-generic/unistd.h           |   8 +-
 include/uapi/linux/fs.h                     |   3 +
 security/security.c                         |  32 +++++++
 25 files changed, 259 insertions(+), 13 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250114-xattrat-syscall-6a1136d2db59

Best regards,
-- 
Andrey Albershteyn <aalbersh@kernel.org>


