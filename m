Return-Path: <linuxppc-dev+bounces-7348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC10A72C3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Mar 2025 10:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZNdR424GTz2yST;
	Thu, 27 Mar 2025 20:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743067200;
	cv=none; b=NGBulVegiinMTfcdFdCw8Huo4uJpmy1dCxQXD3/1wIjks6gqUdQHqijJy18WIzkr6lhk+fCPhQY3zRQ9bLRXV8Sbn3553TLIUTT8xYkFnWwiDBHvCZbHPOR3cdxwOqzNO2pP029zJtpmvdPqMJts7SvJ6tbybKjrQd4DughyT9j5YyKyYvj2dXYQOwBLd9R5H+N6LXkkJ4E4cgQNg1dQYNTIC5WDKvPgrLSy9jFf/6wE5sbsrCby8eGrhX5ZHFodIRaeybYujA+q6bFfFitYM+lnSMo1QFAhouG0fH4hIjIVfdALDB0ZdvVji+KB4K9cUFpv7T4z0lSXHrMOWAnuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743067200; c=relaxed/relaxed;
	bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=f359+AGPHhUcOfHCzyFX7ciKH4Jzqkjc2lWj3zW8sIQYL1CD2E3NNKWySjDIp7/Nwn2p2kYW+Xr5PPxaaOFbs4WyRoRQcxuP6IVhhrGy82lSd3a1cyA3GklMjzhFm94YAwzm3SsKDxVhedDB9rnX8Choz/5n+qVqNTLOAuNbxPl5kqpJPXbKHX51lhz4EmNkN879CV7Dd52/aP6exj3CPZEuH+isvXCUL5BtExyAISUgODUGqaYPyoC0dbL6OTgkmFdndKt8yvBSUx7Z/a7AdFgthBOM/vphxh1F27xaxJ+ZJcd4EBPe7CjDCVBfSZthvlxYuhKMqW5sjeQPN7heKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3iWJBn+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3iWJBn+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3iWJBn+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3iWJBn+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZNdR273T2z2ySS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 20:19:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743067192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
	b=a3iWJBn+ZLLgNUhMBGu6ilCIT8zzl4S8NIEESVO4uuF1y2Y18SL5tFFmxehU+j6sCCr0Qs
	rn/zldSCcSdxAmt+/H3StIMO68n3R7QO0WPfKR4vPx1/adMdKcB2ddO85M0+mzxDR5iNAj
	GcvBc6IrRFA8dwX3Ye3oZyH6KTEeKhg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743067192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
	b=a3iWJBn+ZLLgNUhMBGu6ilCIT8zzl4S8NIEESVO4uuF1y2Y18SL5tFFmxehU+j6sCCr0Qs
	rn/zldSCcSdxAmt+/H3StIMO68n3R7QO0WPfKR4vPx1/adMdKcB2ddO85M0+mzxDR5iNAj
	GcvBc6IrRFA8dwX3Ye3oZyH6KTEeKhg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-1lgNd42SNwaKatsBrSDjhw-1; Thu, 27 Mar 2025 05:19:46 -0400
X-MC-Unique: 1lgNd42SNwaKatsBrSDjhw-1
X-Mimecast-MFC-AGG-ID: 1lgNd42SNwaKatsBrSDjhw_1743067185
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f6eso777442a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 02:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743067185; x=1743671985;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9pyhn0HoGdNIq8NPYxOEem1nAHX/1X+tuTFMgKgOzvo=;
        b=p2ml33hcKe9ERojozZG7Vj5/YhS3O+FZanENkgFzBy+/AqdAJ2REPOu4utcJmMipGc
         YKNh68YG/2qxTIzengAuZnf/Dbn2t7hcYCdYcF1fXMBjx6f/pZordb38pGa90mTbO/TJ
         Wp9FhuAtlo2RVx616z3480MhfeI+zziLi6/YCBj/x3EQEAW1gPQtftNjgJVkcHqgHz/3
         5dpqLgsCj2+mmnzLGSUYxIBghicCMN1Qq8BUujG1aUHuaw3cuUF6jgQvKA+l0bdmZoc9
         PEUdRGBWQQbpmPSmM00mYTakg8QyamyZo6F/hAplUchLhZUF0+UMJ5btR6FfyBd7++MS
         HH+A==
X-Forwarded-Encrypted: i=1; AJvYcCXN3SHTS4EoF25vEzJPCJZviX3vCbRJgE92zGPxcMuRS2mw6HRDPJmAhYRZ6MvdUkui0EdYLrPbxLjbKjA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyS6itw2WehBOLRhkQfkF5V0LmuAwzaGEttbYM1xiPbGA3hBecY
	0i2VmdsGArffnCyqC+8olKtFSK8kcfhlg5HQwIH+XnYrh6D8svfuYEypJ/q0PX9qJNgwiifTBw7
	lVTkqVL6Tc8DsXUHt5JYrLc2eqIVJcYQmUhVjR0WBXS1PNXmzHtTEUY90idRJVA==
X-Gm-Gg: ASbGncuZGdyHTVEYq8XYaDjXpBGKRdvahwnn+9MBTZwoKKvQhn8RXLOZW+47Fbk5PEE
	VlPUb3+xKfcUmHRvrGP0oll2alAAwrxxKoWIuj+zmpoAyuGF1FZsy9i3zgf2hx+gSHTYUb/usZS
	XoEzu6XO9KBK8/f7iO4sH6zt6uf1qICHNsNP69//hGHaRX8CxeuihIRgWJQ9+e6c2uaIDp72MoQ
	bhXVBjeuDBlTexLc5RVd90p65f8ehDAkeIoFQmvK0i/MDgfJaJEZ6gya2+Vz+WI0rRJQ0FKwVoQ
	q6sjr45E4ma3TiT5ZWXDszFUwKzj0U3t+3I=
X-Received: by 2002:a05:6402:84f:b0:5ed:5554:7c3b with SMTP id 4fb4d7f45d1cf-5ed8f01bf27mr2519905a12.32.1743067184655;
        Thu, 27 Mar 2025 02:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/DbC1eDv4uqQP1EBxN610IysnB9dK2feEI/zaqXDqyNyHZNke1rzsRI6Nd8rV/ipuBURwEg==
X-Received: by 2002:a05:6402:84f:b0:5ed:5554:7c3b with SMTP id 4fb4d7f45d1cf-5ed8f01bf27mr2519867a12.32.1743067184134;
        Thu, 27 Mar 2025 02:19:44 -0700 (PDT)
Received: from thinky (ip-217-030-074-039.aim-net.cz. [217.30.74.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ebcd0e0470sm10684007a12.77.2025.03.27.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:19:43 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:19:40 +0100
From: Andrey Albershteyn <aalbersh@redhat.com>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v4 1/3] lsm: introduce new hooks for setting/getting
 inode  fsxattr
Message-ID: <gsg4crfqqc7xmvaadcaqiztsr2ngstswmax4aourvc7iuu3tew@mluhff6a2ip5>
References: <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
 <e2d5b27847fde03e0b4b9fc7a464fd87@paul-moore.com>
 <20250324.aThi9ioghiex@digikod.net>
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
In-Reply-To: <20250324.aThi9ioghiex@digikod.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c07YMbdMW7UHJr-g_vGviN-cEwyw1HAjFJfOUGELGnU_1743067185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-03-24 20:27:02, Mickaël Salaün wrote:
> On Fri, Mar 21, 2025 at 05:32:25PM -0400, Paul Moore wrote:
> > On Mar 21, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> > > 
> > > Introduce new hooks for setting and getting filesystem extended
> > > attributes on inode (FS_IOC_FSGETXATTR).
> > > 
> > > Cc: selinux@vger.kernel.org
> > > Cc: Paul Moore <paul@paul-moore.com>
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > ---
> > >  fs/ioctl.c                    |  7 ++++++-
> > >  include/linux/lsm_hook_defs.h |  4 ++++
> > >  include/linux/security.h      | 16 ++++++++++++++++
> > >  security/security.c           | 32 ++++++++++++++++++++++++++++++++
> > >  4 files changed, 58 insertions(+), 1 deletion(-)
> > 
> > Thanks Andrey, one small change below, but otherwise this looks pretty
> > good.  If you feel like trying to work up the SELinux implementation but
> > need some assitance please let me know, I'll be happy to help :)
> > 
> > > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > > index 638a36be31c14afc66a7fd6eb237d9545e8ad997..4434c97bc5dff5a3e8635e28745cd99404ff353e 100644
> > > --- a/fs/ioctl.c
> > > +++ b/fs/ioctl.c
> > > @@ -525,10 +525,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
> > >  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
> > >  {
> > >  	struct inode *inode = d_inode(dentry);
> > > +	int error;
> > >  
> > >  	if (!inode->i_op->fileattr_get)
> > >  		return -ENOIOCTLCMD;
> > >  
> > > +	error = security_inode_getfsxattr(inode, fa);
> > > +	if (error)
> > > +		return error;
> > > +
> > >  	return inode->i_op->fileattr_get(dentry, fa);
> > >  }
> > >  EXPORT_SYMBOL(vfs_fileattr_get);
> > > @@ -692,7 +697,7 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
> > >  			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
> > >  		}
> > >  		err = fileattr_set_prepare(inode, &old_ma, fa);
> > > -		if (!err)
> > > +		if (!err && !security_inode_setfsxattr(inode, fa))
> > >  			err = inode->i_op->fileattr_set(idmap, dentry, fa);
> > >  	}
> > >  	inode_unlock(inode);
> > 
> > I don't believe we want to hide or otherwise drop the LSM return code as
> > that could lead to odd behavior, e.g. returning 0/success despite not
> > having executed the fileattr_set operation.
> 
> Yes, this should look something like this:
> 
>  		err = fileattr_set_prepare(inode, &old_ma, fa);
>  		if (err)
>  			goto out;
>  		err = security_inode_setfsxattr(dentry, fa);
>  		if (err)
>  			goto out;
>  		err = inode->i_op->fileattr_set(idmap, dentry, fa);
>  		if (err)
>  			goto out;
> 
> > 
> > --
> > paul-moore.com
> > 
> 

Sure, thanks for noticing, will switch to dentries and handle error
code it in v5

-- 
- Andrey


