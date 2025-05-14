Return-Path: <linuxppc-dev+bounces-8570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BCAB696A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 13:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy9RP07Nyz2ydv;
	Wed, 14 May 2025 21:02:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747220560;
	cv=none; b=VZYmFBm55LUM/7Gh/BImVQ4pm1UD2BsTaa6dLRKMr+0aH9rUF84Bh+bgp26Le/xZY6xRqK4wADKP4xq0pyZgYApaf6uq9hxGSBx53acfDq8AujnOewOkuInsIyAvjN5VtY09NONUKNda9LOUnCDI2hTpaM9p93T2JRT1gU3w/a8kdsfTfx5Hh7IL8uFevPEfGVOqLS2KhRwK67p4qGotbufmAbvxBBVwO9oYoal8bIxwzbpG/OzIOOAXRjt4s3Yifp/zxLiTeSzyIwjAQAZRIXZfg+pqyfWui0UPLnys07V4FRzFpobko0m31L4fv7lOEdb9UutgJRb3bsn+Hc3H0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747220560; c=relaxed/relaxed;
	bh=Cav3Z4NY5VTBc23C/qTtaVoA8kEGEB5wAcjksldNIvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cWl/5JSk3xruE8N4+Mchitr1UjV9OOxruFZLi/FEuUXMWvhWzaS9Dd0e2E2N+h/y5qTaGAQ5XceTsf1vyibU5kx732tjGXBwlO8bChKsVdyvCbmHToES0Nw77WlGmL+L1z7NqYfLizjX88jWf/VlRCX9UgG3PoDO8SjcGTNCZZlD5PDJMoCwI6Qcri/qUZL6p7yzO82wtSmb7gmRyAPdr5TxRz2+EnLSvbxrKS5p5QRcxEz6rw671QV0K+ls/Sbfw8eReD6hMBOuPRNACOWTcwQwgAIUFBGQNwonSvSpdctY8tVwZYoSTxFp6RZy+6+8ecrGyAeoAZ+yUEmt9X/2vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I15Wzgb4; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I15Wzgb4; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I15Wzgb4;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I15Wzgb4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy9RM5xpmz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 21:02:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747220554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cav3Z4NY5VTBc23C/qTtaVoA8kEGEB5wAcjksldNIvE=;
	b=I15Wzgb4KH+oyoPc6ukXT/0Rwdg5uNuvsAl9IB61zrfdLL64n3zJsde/cQlpOL63vmRgqh
	eIv0oGHsyLYob1U9Fx4UGZG6Ey1R5cIe9TH/vN63/4zQN/PjxsRIT1AnWpkbjir82ox2zz
	gOhrSEgIy0Z5w8YIy6dkuIs0UXJ1P4g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747220554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Cav3Z4NY5VTBc23C/qTtaVoA8kEGEB5wAcjksldNIvE=;
	b=I15Wzgb4KH+oyoPc6ukXT/0Rwdg5uNuvsAl9IB61zrfdLL64n3zJsde/cQlpOL63vmRgqh
	eIv0oGHsyLYob1U9Fx4UGZG6Ey1R5cIe9TH/vN63/4zQN/PjxsRIT1AnWpkbjir82ox2zz
	gOhrSEgIy0Z5w8YIy6dkuIs0UXJ1P4g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-wax-noO7PPCCYgA-vtK9Cg-1; Wed, 14 May 2025 07:02:32 -0400
X-MC-Unique: wax-noO7PPCCYgA-vtK9Cg-1
X-Mimecast-MFC-AGG-ID: wax-noO7PPCCYgA-vtK9Cg_1747220551
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5fca07e1c56so5561135a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 04:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747220551; x=1747825351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cav3Z4NY5VTBc23C/qTtaVoA8kEGEB5wAcjksldNIvE=;
        b=ZaMWb/NhnL63Ao2++iqPDw0OvH6ShwiXyLb4HCFUhuO78QW4fDiZfY8A3d6/lEbsLW
         fgHpIH4mcGVvCNda89cL+w7ZSoFUzdwDdUHrozu0oRdIMTUqXlVsKIox/aNZ3Y1HQ8R2
         Ga7pg4tOuZhS433dL4FHayAdP8kciUlzzhG6U1l93HO6ENuxufKgbL7l+4WgPLcie5AR
         Jsh8DWitQnL/GBcN5bF2N9koQBxroY9r3BGwwSxIjhDQcHZX2pOw45xYv18MYAB4Ia0V
         +UMeXwbLK3Rwy8m4Tucf1B4CoZg7jDP5jqHjWpOL5UJOnwtRVrvQfOWxzX+GrAuhtKcT
         3new==
X-Forwarded-Encrypted: i=1; AJvYcCVxWf0LrkrC37deNBX4qOFxuf2poybr180vEWPR7sMNaZjcXG7ZZw8nBpwpNdvaKYvTzXXkycoaUysWdQY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+pRHQGjiCMOiVGOTZBFheO4A/lhbPCCZh9tp/h9k5euLNTCpo
	QkEWfcYp47qhBoN/K4N43Nyhv3Jnhy84qavun23ncaRTSdEzkzDS4kzEBwaSFcFQQBZ266EDLFo
	15OKO34L6bEaoOamkwF3RFT6FTpsDa/52a/1MVD5VvIM1YDoEEStZLM+Ac6OX6Q==
X-Gm-Gg: ASbGnctDXm0Cx0l+gdvQLZy7YjvnXiFXswtxNQHkSbVDr2Gq3vt2WS6oXEdlgr3BDaI
	NatcjlC9i3hEWNi876+pJY1ew2BfPkiVroGpDZZ8s9quYgLnRI/6puhy3HIiSQ1ltp6n58wScid
	dlpIsJTxJ4LfMIexKhbPJl5XwSjK28ErdlUocstjGrN4ZnzU4MvgDS1RGyWEMOnSo5hiSyIJDim
	Dg1EFIPgAdap+glE8hf2lbdb6Xm3exCLs8/PENb5My2+kxteoYgNjXj2TYQLU5mccikiLbxmnNi
	Aw==
X-Received: by 2002:a05:6402:234d:b0:5f4:ade4:88c5 with SMTP id 4fb4d7f45d1cf-5ff988dd135mr2082966a12.34.1747220551024;
        Wed, 14 May 2025 04:02:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs3ORoNcv9GW9V4gupozuqWmYmwSxEEUINo5zQzLXzCm36ngPWceLYKaaZhwPfqmrqY5iYdA==
X-Received: by 2002:a05:6402:234d:b0:5f4:ade4:88c5 with SMTP id 4fb4d7f45d1cf-5ff988dd135mr2082854a12.34.1747220550339;
        Wed, 14 May 2025 04:02:30 -0700 (PDT)
Received: from thinky ([2a0e:fd87:a051:1:e664:4a86:4c01:c774])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fe43357d45sm4879817a12.54.2025.05.14.04.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 04:02:29 -0700 (PDT)
Date: Wed, 14 May 2025 13:02:13 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Casey Schaufler <casey@schaufler-ca.com>
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
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Amir Goldstein <amir73il@gmail.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting
 inode fsxattr
Message-ID: <kgl5h2iruqnhmad65sonlvneu6mdj6jl3sd4aoc3us3lvrgviy@imce27t4nk2e>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
 <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
 <f700845d-f332-4336-a441-08f98cd7f075@schaufler-ca.com>
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
In-Reply-To: <f700845d-f332-4336-a441-08f98cd7f075@schaufler-ca.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f-N2g0AN9Xga1s76QjzyGCfqopKEwlJtKFS8i4gV1Ac_1747220551
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-12 08:43:32, Casey Schaufler wrote:
> On 5/12/2025 6:25 AM, Andrey Albershteyn wrote:
> > Introduce new hooks for setting and getting filesystem extended
> > attributes on inode (FS_IOC_FSGETXATTR).
> >
> > Cc: selinux@vger.kernel.org
> > Cc: Paul Moore <paul@paul-moore.com>
> >
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/file_attr.c                | 19 ++++++++++++++++---
> >  include/linux/lsm_hook_defs.h |  2 ++
> >  include/linux/security.h      | 16 ++++++++++++++++
> >  security/security.c           | 30 ++++++++++++++++++++++++++++++
> >  4 files changed, 64 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/file_attr.c b/fs/file_attr.c
> > index 2910b7047721..be62d97cc444 100644
> > --- a/fs/file_attr.c
> > +++ b/fs/file_attr.c
> > @@ -76,10 +76,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
> >  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
> >  {
> >  	struct inode *inode = d_inode(dentry);
> > +	int error;
> >  
> >  	if (!inode->i_op->fileattr_get)
> >  		return -ENOIOCTLCMD;
> >  
> > +	error = security_inode_file_getattr(dentry, fa);
> > +	if (error)
> > +		return error;
> > +
> 
> If you're changing VFS behavior to depend on LSMs supporting the new
> hooks I'm concerned about the impact it will have on the LSMs that you
> haven't supplied hooks for. Have you tested these changes with anything
> besides SELinux?

Sorry, this thread is incomplete, I've resent full patchset again.
If you have any further comments please comment in that thread [1]

I haven't tested with anything except SELinux, but I suppose if
module won't register any hooks, then security_inode_file_*() will
return 0. Reverting SELinux implementation of the hooks doesn't
cause any errors.

I'm not that familiar with LSMs/selinux and its codebase, if you can
recommend what need to be tested while adding new hooks, I will try
to do that for next revision.

[1]: https://lore.kernel.org/linux-fsdevel/CAOQ4uxgOAxg7N1OUJfb1KMp7oWOfN=KV9Lzz6ZrX0=XRGOQrEQ@mail.gmail.com/T/#t

-- 
- Andrey


