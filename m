Return-Path: <linuxppc-dev+bounces-6427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7D8A427BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 17:21:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1mG36l0Bz2ynR;
	Tue, 25 Feb 2025 03:21:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740414107;
	cv=none; b=GYYJ+7ZGDFFOVBr1AejLrK8RYzB55EQI+/uASwGfkXOTArVmvcJF4Fny+XwzZT6CpWSSOMU66zQ+vN94mgB8JZiW3aoqmfFmK48RKLEejfFX9zAMkbeAuos4LpLkYJ72yNg/6vmOiD/hjQAf8an+wKVwkdJ4PVMsEMooSoATpNbQDIgIw57g6CHwoT5D+qSw2UPmF2LRLpQuxOlU6OWAlvtnOb2mpj1CjmSF6CcF8McpWeWw7xK1fqh7SPXtCdqfPUzlZQp1B4Y2rMWvKc6e54WiG2DtmlU84Wf0bGmg+gXbT6LK5cVKimYz0myJHrqEvJFTajJVfmttEHLjhkRYrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740414107; c=relaxed/relaxed;
	bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GY2BkqVuDpqoodohpDx7Ok+RwKVJ5O1idPKqlhYmM6eMRYpeNL6l8+WaY48VvCAqsOKr8uDpyv0JRq/tKuu7c6VEY5c5kUZ/12QWoR3v1EwunDPIQ19+vQsona1yZHN2SRj2QRNSP71kzEWwoChguK8iwh1nv9t6arVYQ2mG9Olpe80F5Dj/h6cCPZKEjJ8Yo0zWKVphBHiX9t9kgtPvxkQmb7YpaMPdmdjVyBo8iRe3eW7cCs9pcHmvvKjwFHZR7v7HbOe4XXn3O15Bz3pjqQ67DULbx20crOFX3QbpfMVzAWP4MsgssT2ikqJ7RFYPVaZyE9QaZqGCDMWOj62Mvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQeAQWz7; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQeAQWz7; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQeAQWz7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQeAQWz7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1mG26HS4z2ym2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 03:21:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740414101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
	b=NQeAQWz76lRmy21bFaY/djIZdaF9iiNWPtHHd8aL9ReAlwUWNTnLdnGWa59c8YAHDQp3s9
	ZVrgm1b0TEjEPBBA+fFWJqT+/SMbef8rkmW/56QkmQ26WTPpQUinJD0nCQzi2XNXEuLHmJ
	gKN9gxNUFlSacRQwdDJeqKTEg9qzQvc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740414101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
	b=NQeAQWz76lRmy21bFaY/djIZdaF9iiNWPtHHd8aL9ReAlwUWNTnLdnGWa59c8YAHDQp3s9
	ZVrgm1b0TEjEPBBA+fFWJqT+/SMbef8rkmW/56QkmQ26WTPpQUinJD0nCQzi2XNXEuLHmJ
	gKN9gxNUFlSacRQwdDJeqKTEg9qzQvc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-Ubk71GYWMWCeutPO6VreMw-1; Mon, 24 Feb 2025 11:21:40 -0500
X-MC-Unique: Ubk71GYWMWCeutPO6VreMw-1
X-Mimecast-MFC-AGG-ID: Ubk71GYWMWCeutPO6VreMw_1740414099
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab77dd2c243so512692966b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 08:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740414099; x=1741018899;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbgONUWfgHLarcjp/Tl0GNlCJNdAiQjgaPgMeontBJk=;
        b=X49IQcJrdsBE4i8ujcayQpTclMUSiYURrF/37eiEx1LkwaapjsXyWcsBZ2WjCycXo7
         Ju5JFZqWQNInJAK6QeZD1Y9MCTEjSPObMU6u6cE9J/uuv8M+QRCjId5tDgHkH7I2koTM
         6f3h1nZKJkafLQCYqiO38wIpSohsy8iGjTV4XXTFQW53JtLexfplnphv68NTLhsuon5o
         +7FPvXgVLeeljZQcwPl4t6z3JnduATIS688jl3lWj+4m3ZbsRzhW1Qao2DPi+PzXVC7+
         pk82k/siuwCPcT+RjviBOrKiaGl7EKxbYE6jCXcuQLlTCV3kr+lamOAsUm0q9AoKGKQ1
         fqcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVELGwTMKLYmYMDzB3C4G2YWKzkVyTRAq85mgR8FVfKoQoxNXE6MK+FtJLe75lIhfbGU/9HSqvYqiLPWJc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7MvG5cHHrDVvNIbFt0OmzXj/lvDIw/zAX5fqMC5xhqOwUrpxa
	w6WJTKUnOOTifsSAvtVYFlcCAFdPtenCm7/euYvJqpnfYgG4wRoyew69H5OXgayA94qqvZbp3JV
	M6vco+bp7hO3KcmXrTsWNPB44zi86dM4KOtmi1ERtvJ/DI5MiSruU8QHAkbTafQ==
X-Gm-Gg: ASbGncsuKo8aTURx9dygnQdVsw5x/VmrRH8C0VNLYn4Zi3vveKeVK5J6scG1U50ncTo
	65Q5NnPpfVt3V6AQWBhG+Wj2GiIYTjsnV+kl1idVoFJCHpj6LhYJobAkNck4or2JYh+OYmbYf59
	9fpbrPQT9fXtt3JnVziEWh/Z8qo9GqQuTg6T0VE/Gtv5lnQAsekSrarNnrohIFj/lGjCVKj7qFl
	HWJCRkAh9q9iN0SJDRDH7xHv9BB2E2HUci3fcZvvBvYi6gfJQ168A/OIissfMyKD2zhaINBnOTy
	8r0FNogPeM46rJyLBwAlWjr8Tsze9v12CE4=
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391792666b.7.1740414098584;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVIc+JAiSWQcjvyNYMJZbdBLdYt9qKN3p7wrynJ8JvTXd/WAhRLvwN0eiscAH5n9vkRsMuqA==
X-Received: by 2002:a17:907:1b26:b0:abb:b0c0:5b6b with SMTP id a640c23a62f3a-abc099b386dmr1391785866b.7.1740414098057;
        Mon, 24 Feb 2025 08:21:38 -0800 (PST)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abec4c14a27sm95755766b.45.2025.02.24.08.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:21:37 -0800 (PST)
Date: Mon, 24 Feb 2025 17:21:36 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Amir Goldstein <amir73il@gmail.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
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
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, 
	Theodore Tso <tytso@mit.edu>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Message-ID: <snfyyqhdzevotzcivrcd7uqpaobnslxgddd26s6nc3bb7ey3g4@posoztx4qrtm>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
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
In-Reply-To: <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ks06cxnh4ABC87nFuP6q8gC_98NqCptxzYeFcdTlPaA_1740414099
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-02-24 12:32:17, Christian Brauner wrote:
> On Fri, Feb 21, 2025 at 08:15:24PM +0100, Amir Goldstein wrote:
> > On Fri, Feb 21, 2025 at 7:13 PM Darrick J. Wong <djwong@kernel.org> wrote:
> > >
> > > On Tue, Feb 11, 2025 at 06:22:47PM +0100, Andrey Albershteyn wrote:
> > > > From: Andrey Albershteyn <aalbersh@redhat.com>
> > > >
> > > > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > > > extended attributes/flags. The syscalls take parent directory fd and
> > > > path to the child together with struct fsxattr.
> > > >
> > > > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > > > that file don't need to be open as we can reference it with a path
> > > > instead of fd. By having this we can manipulated inode extended
> > > > attributes not only on regular files but also on special ones. This
> > > > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > > > we can not call ioctl() directly on the filesystem inode using fd.
> > > >
> > > > This patch adds two new syscalls which allows userspace to get/set
> > > > extended inode attributes on special files by using parent directory
> > > > and a path - *at() like syscall.
> > > >
> > > > Also, as vfs_fileattr_set() is now will be called on special files
> > > > too, let's forbid any other attributes except projid and nextents
> > > > (symlink can have an extent).
> > > >
> > > > CC: linux-api@vger.kernel.org
> > > > CC: linux-fsdevel@vger.kernel.org
> > > > CC: linux-xfs@vger.kernel.org
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > > ---
> > > > v1:
> > > > https://lore.kernel.org/linuxppc-dev/20250109174540.893098-1-aalbersh@kernel.org/
> > > >
> > > > Previous discussion:
> > > > https://lore.kernel.org/linux-xfs/20240520164624.665269-2-aalbersh@redhat.com/
> > > >
> > > > XFS has project quotas which could be attached to a directory. All
> > > > new inodes in these directories inherit project ID set on parent
> > > > directory.
> > > >
> > > > The project is created from userspace by opening and calling
> > > > FS_IOC_FSSETXATTR on each inode. This is not possible for special
> > > > files such as FIFO, SOCK, BLK etc. Therefore, some inodes are left
> > > > with empty project ID. Those inodes then are not shown in the quota
> > > > accounting but still exist in the directory. Moreover, in the case
> > > > when special files are created in the directory with already
> > > > existing project quota, these inode inherit extended attributes.
> > > > This than leaves them with these attributes without the possibility
> > > > to clear them out. This, in turn, prevents userspace from
> > > > re-creating quota project on these existing files.
> > > > ---
> > > > Changes in v3:
> > > > - Remove unnecessary "dfd is dir" check as it checked in user_path_at()
> > > > - Remove unnecessary "same filesystem" check
> > > > - Use CLASS() instead of directly calling fdget/fdput
> > > > - Link to v2: https://lore.kernel.org/r/20250122-xattrat-syscall-v2-1-5b360d4fbcb2@kernel.org
> > > > ---
> > > >  arch/alpha/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/arm/tools/syscall.tbl                  |  2 +
> > > >  arch/arm64/tools/syscall_32.tbl             |  2 +
> > > >  arch/m68k/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/microblaze/kernel/syscalls/syscall.tbl |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n32.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_n64.tbl   |  2 +
> > > >  arch/mips/kernel/syscalls/syscall_o32.tbl   |  2 +
> > > >  arch/parisc/kernel/syscalls/syscall.tbl     |  2 +
> > > >  arch/powerpc/kernel/syscalls/syscall.tbl    |  2 +
> > > >  arch/s390/kernel/syscalls/syscall.tbl       |  2 +
> > > >  arch/sh/kernel/syscalls/syscall.tbl         |  2 +
> > > >  arch/sparc/kernel/syscalls/syscall.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_32.tbl      |  2 +
> > > >  arch/x86/entry/syscalls/syscall_64.tbl      |  2 +
> > > >  arch/xtensa/kernel/syscalls/syscall.tbl     |  2 +
> > > >  fs/inode.c                                  | 75 +++++++++++++++++++++++++++++
> > > >  fs/ioctl.c                                  | 16 +++++-
> > > >  include/linux/fileattr.h                    |  1 +
> > > >  include/linux/syscalls.h                    |  4 ++
> > > >  include/uapi/asm-generic/unistd.h           |  8 ++-
> > > >  21 files changed, 133 insertions(+), 3 deletions(-)
> > > >
> > >
> > > <cut to the syscall definitions>
> > >
> > > > diff --git a/fs/inode.c b/fs/inode.c
> > > > index 6b4c77268fc0ecace4ac78a9ca777fbffc277f4a..b2dddd9db4fabaf67a6cbf541a86978b290411ec 100644
> > > > --- a/fs/inode.c
> > > > +++ b/fs/inode.c
> > > > @@ -23,6 +23,9 @@
> > > >  #include <linux/rw_hint.h>
> > > >  #include <linux/seq_file.h>
> > > >  #include <linux/debugfs.h>
> > > > +#include <linux/syscalls.h>
> > > > +#include <linux/fileattr.h>
> > > > +#include <linux/namei.h>
> > > >  #include <trace/events/writeback.h>
> > > >  #define CREATE_TRACE_POINTS
> > > >  #include <trace/events/timestamp.h>
> > > > @@ -2953,3 +2956,75 @@ umode_t mode_strip_sgid(struct mnt_idmap *idmap,
> > > >       return mode & ~S_ISGID;
> > > >  }
> > > >  EXPORT_SYMBOL(mode_strip_sgid);
> > > > +
> > > > +SYSCALL_DEFINE4(getfsxattrat, int, dfd, const char __user *, filename,
> > > > +             struct fsxattr __user *, fsx, unsigned int, at_flags)
> > >
> > > Should the kernel require userspace to pass the size of the fsx buffer?
> > > That way we avoid needing to rev the interface when we decide to grow
> > > the structure.
> 
> Please version the struct by size as we do for clone3(),
> mount_setattr(), listmount()'s struct mnt_id_req, sched_setattr(), all
> the new xattrat*() system calls and a host of others. So laying out the
> struct 64bit and passing a size alongside it.
> 
> This is all handled by copy_struct_from_user() and copy_struct_to_user()
> so nothing to reinvent. And it's easy to copy from existing system
> calls.
> 

Oh, thanks for pointing to these, will use them.

-- 
- Andrey


