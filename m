Return-Path: <linuxppc-dev+bounces-7349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2371A72C87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 10:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNdlD10cXz2yhG;
	Thu, 27 Mar 2025 20:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743068040;
	cv=none; b=lJrgc6phgpziwAbZ/x35JK3e3ufdd7nIrllgswzuWdjEiekbIukBcwffJFiVlDPNarLX/QXv4eDl+QkBZSVrvKm1XCdPRolfvEAkcUHUW1gETLxQcEOGNzvNesB+55c72Jgc2VPiXgQ1JLee2ObaEpDDp+SpzkmPuAiMbXhbwlEiFiJjBVfGGWsg1Czxus58ipwN1vTi50/BNT/EFkBXLNcl/9YqKA9rDaxly9yYDCo0w9uMHrFooK1JXrYFIf+lX0yCNvsu7JIbiILCR014R0jcvDp8dO/0Ugmc5nIVfbZtp0LUeYZyCLcZCGpBFaXKpCXXGAo0vaIbYm+pIme3Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743068040; c=relaxed/relaxed;
	bh=h5CNfk8nfXsjqd7Al/TA3/xzYA4Q3Hci3BjuX9fq6Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ddbm2lSk64BqpRPEPD3BH7hHfFXXCQhIgdDwWMY5W3k5vqnPYhnm2E2YAWZqf0Y40GdGFqWZOnLC7tOpWfOrfqb0NxxoU/K7NYS3EM9vAtqyeb4UBuLEeaOgMs5jaqnQqGkwcVHuU8XGBaluY40L8bvO17/MDa5VIPkdzvegaBOywE5biE21s84m+zG2abAM5C2KG29E0r94me49YOY+vuXHMoffgWW+mVZy8UPLz5QgDFWKqx8T4iF1HfTES1n9q6DFFDF8+JpluQVqQmLrImJnsRVvIAseK5pwXncnDOUbd9lyaJxgNsCb6wLLcxfi6BiYpSRrxNpthxSIVvy+ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rgd/elkJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rgd/elkJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rgd/elkJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rgd/elkJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNdlC1rGYz2yfp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 20:33:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743068035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5CNfk8nfXsjqd7Al/TA3/xzYA4Q3Hci3BjuX9fq6Hk=;
	b=Rgd/elkJtg3OVrTV4lBpS+cz8WmruBMDOKE6YE9ADe28/VTeAIlLkt7eJ0+fsJmbhvet+D
	2CjEdYWvttQYgvMAUu8kPNKRVtDq6p5hneq8ncWp3L8tEV8CHGk6SlnL+w5z4O9nQbRhm6
	B2uB+pOAedXWUrRjLhxrCroCmD3W8V4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743068035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5CNfk8nfXsjqd7Al/TA3/xzYA4Q3Hci3BjuX9fq6Hk=;
	b=Rgd/elkJtg3OVrTV4lBpS+cz8WmruBMDOKE6YE9ADe28/VTeAIlLkt7eJ0+fsJmbhvet+D
	2CjEdYWvttQYgvMAUu8kPNKRVtDq6p5hneq8ncWp3L8tEV8CHGk6SlnL+w5z4O9nQbRhm6
	B2uB+pOAedXWUrRjLhxrCroCmD3W8V4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-KwAXTX-MOoab7MoOOCx_Mw-1; Thu, 27 Mar 2025 05:33:51 -0400
X-MC-Unique: KwAXTX-MOoab7MoOOCx_Mw-1
X-Mimecast-MFC-AGG-ID: KwAXTX-MOoab7MoOOCx_Mw_1743068030
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac25852291cso70717366b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 02:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068030; x=1743672830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5CNfk8nfXsjqd7Al/TA3/xzYA4Q3Hci3BjuX9fq6Hk=;
        b=IuhKXuJV/O0ShqFwB6k3r7iJR7glJ+7MBzTnd7rEbT786yN0c+/1+2rheSWzPK7mTe
         z6s5ZMvm1LN/U7O+RizWOf4SQSBwh7f4guO8XpoZI5tH/N8vp5bthLq65vHyN1EDO+yA
         teK7moYymOUGFwg95EKeVyUzsTAdcsKtHV5f6XUXPMS9PvDMxOEH5aCgPj3I6nmD5DYU
         eeZpO63oEUMVDTxvklMABMyqd2cArFnV0k6ffeBWJql2ghHWQ9MQtSnN0h9Kz7ldOM9S
         KsSBUkoK6XpKmxltGXCsiBSrY4p/C/ObTsIB0xJFq9HOnGSqppiki8tsFPKnNaBsEaN2
         x2XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVl8Qa4y2hNLBoJ9ILN0hmVN6xWbVutkf0Kj8mTDhlfQtmG6VFobCQJMamwG3uk6Cl3tY6xshVZxLSymTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxadxJZF9Dx8+yjRjObx08fwsE6uGXMXWk5B4lMGnCVeqcYecB6
	pPxD8WHOGHwHmryneHIobXc24vVfo3jLj+jETA0bs2q1Y4AeQ0ofg2qbcjk0wkg7ZQk2PQaSeP9
	ZHZlVL5mrEDqZInTC/BYGHTyyR+eSajADCCy8YzijGFVSy4mTt3M91n2NGD+/Ew==
X-Gm-Gg: ASbGncvGkC/oIrV+skoRc4iDeCgJ8QPCT87DgBYrFOUG3zchay8Kzck+ljuQOrWOtBb
	lFumbhQTCwUClrMwuTdErdmYpTxk99oj5k2RD9IF8LF82+abtCJbQzzECvNAiT1KCJePsmQYuHZ
	1GUulLj148Mj9ZbZSsxlo+bwE+enEpFAkb8bySTamHgGZRO11ALPJtWv8hv3NbbXODPiIWo0hAy
	5OAlctqU8BWKvRShi7eCdm1QaoLQcaIF1f6ZVLlv2Rlhs25O5nekljF0GdEAK9YQIvKEKmcapY3
	FhCzM/2G491bwP0N1wrdOCGfPUR6CtNW154=
X-Received: by 2002:a17:907:9485:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-ac6faeaf925mr243564366b.2.1743068030213;
        Thu, 27 Mar 2025 02:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2zYSC7bMfUbOdY5puF0aDWWJJczWfClUA+AIABeR6/ROC8MRiCRtqFsrSolJNpWyhPAQwww==
X-Received: by 2002:a17:907:9485:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-ac6faeaf925mr243555966b.2.1743068029638;
        Thu, 27 Mar 2025 02:33:49 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47f44sm1185448066b.163.2025.03.27.02.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:33:49 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:33:47 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
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
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-xfs@vger.kernel.org
Subject: Re: [PATCH v4 3/3] fs: introduce getfsxattrat and setfsxattrat
 syscalls
Message-ID: <faqun3wrpvwrhwukql3niqvvauy5ngrpytx5bxbrv5xkounez3@m7j2znjuzapu>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-3-3e82e6fb3264@kernel.org>
 <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
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
In-Reply-To: <CAOQ4uxj2Fqmc_pSD4bqqoQu7QjmgSVp2V15FbmBdTNqQ03aPGQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ea-2y73ZlHSgU2-kNwZSNw7M15Vpzsm7UcAmBDxJsJM_1743068030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-03-23 09:56:25, Amir Goldstein wrote:
> On Fri, Mar 21, 2025 at 8:49 PM Andrey Albershteyn <aalbersh@redhat.com> wrote:
> >
> > From: Andrey Albershteyn <aalbersh@redhat.com>
> >
> > Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> > extended attributes/flags. The syscalls take parent directory fd and
> > path to the child together with struct fsxattr.
> >
> > This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> > that file don't need to be open as we can reference it with a path
> > instead of fd. By having this we can manipulated inode extended
> > attributes not only on regular files but also on special ones. This
> > is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> > we can not call ioctl() directly on the filesystem inode using fd.
> >
> > This patch adds two new syscalls which allows userspace to get/set
> > extended inode attributes on special files by using parent directory
> > and a path - *at() like syscall.
> >
> > CC: linux-api@vger.kernel.org
> > CC: linux-fsdevel@vger.kernel.org
> > CC: linux-xfs@vger.kernel.org
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> ...
> > +SYSCALL_DEFINE5(setfsxattrat, int, dfd, const char __user *, filename,
> > +               struct fsxattr __user *, ufsx, size_t, usize,
> > +               unsigned int, at_flags)
> > +{
> > +       struct fileattr fa;
> > +       struct path filepath;
> > +       int error;
> > +       unsigned int lookup_flags = 0;
> > +       struct filename *name;
> > +       struct mnt_idmap *idmap;.
> 
> > +       struct dentry *dentry;
> > +       struct vfsmount *mnt;
> > +       struct fsxattr fsx = {};
> > +
> > +       BUILD_BUG_ON(sizeof(struct fsxattr) < FSXATTR_SIZE_VER0);
> > +       BUILD_BUG_ON(sizeof(struct fsxattr) != FSXATTR_SIZE_LATEST);
> > +
> > +       if ((at_flags & ~(AT_SYMLINK_NOFOLLOW | AT_EMPTY_PATH)) != 0)
> > +               return -EINVAL;
> > +
> > +       if (!(at_flags & AT_SYMLINK_NOFOLLOW))
> > +               lookup_flags |= LOOKUP_FOLLOW;
> > +
> > +       if (at_flags & AT_EMPTY_PATH)
> > +               lookup_flags |= LOOKUP_EMPTY;
> > +
> > +       if (usize > PAGE_SIZE)
> > +               return -E2BIG;
> > +
> > +       if (usize < FSXATTR_SIZE_VER0)
> > +               return -EINVAL;
> > +
> > +       error = copy_struct_from_user(&fsx, sizeof(struct fsxattr), ufsx, usize);
> > +       if (error)
> > +               return error;
> > +
> > +       fsxattr_to_fileattr(&fsx, &fa);
> > +
> > +       name = getname_maybe_null(filename, at_flags);
> > +       if (!name) {
> > +               CLASS(fd, f)(dfd);
> > +
> > +               if (fd_empty(f))
> > +                       return -EBADF;
> > +
> > +               idmap = file_mnt_idmap(fd_file(f));
> > +               dentry = file_dentry(fd_file(f));
> > +               mnt = fd_file(f)->f_path.mnt;
> > +       } else {
> > +               error = filename_lookup(dfd, name, lookup_flags, &filepath,
> > +                                       NULL);
> > +               if (error)
> > +                       return error;
> > +
> > +               idmap = mnt_idmap(filepath.mnt);
> > +               dentry = filepath.dentry;
> > +               mnt = filepath.mnt;
> > +       }
> > +
> > +       error = mnt_want_write(mnt);
> > +       if (!error) {
> > +               error = vfs_fileattr_set(idmap, dentry, &fa);
> > +               if (error == -ENOIOCTLCMD)
> > +                       error = -EOPNOTSUPP;
> 
> This is awkward.
> vfs_fileattr_set() should return -EOPNOTSUPP.
> ioctl_setflags() could maybe convert it to -ENOIOCTLCMD,
> but looking at similar cases ioctl_fiemap(), ioctl_fsfreeze() the
> ioctl returns -EOPNOTSUPP.
> 
> I don't think it is necessarily a bad idea to start returning
>  -EOPNOTSUPP instead of -ENOIOCTLCMD for the ioctl
> because that really reflects the fact that the ioctl is now implemented
> in vfs and not in the specific fs.
> 
> and I think it would not be a bad idea at all to make that change
> together with the merge of the syscalls as a sort of hint to userspace
> that uses the ioctl, that the sycalls API exists.
> 
> Thanks,
> Amir.
> 

Hmm, not sure what you're suggesting here. I see it as:
- get/setfsxattrat should return EOPNOTSUPP as it make more sense
  than ENOIOCTLCMD
- ioctl_setflags returns ENOIOCTLCMD which also expected

Don't really see a reason to change what vfs_fileattr_set() returns
and then copying this if() to other places or start returning
EOPNOTSUPP.

-- 
- Andrey


