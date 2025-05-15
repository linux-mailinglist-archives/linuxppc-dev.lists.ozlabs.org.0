Return-Path: <linuxppc-dev+bounces-8598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2B2AB81DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 11:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zykks1jg2z3024;
	Thu, 15 May 2025 19:03:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747299781;
	cv=none; b=NZdyiJg9JR5HVaO7/OfToTFhjSZk1vMvoKRNJ4XMJsDAARvotHGfP4FCdIDFhR7jKIk8oy58nKSQP8PltI/WmYfLEqag2qkGo7tclarzCY+PwOhFAsgLFbF5Bi2/HLJXPXJamznSETc2Q87843J3su+PbweoLG7uNV8ltk1nDQHdCIT6vyWobTkZnIqTqvzizV2zHmmpUS/4SDoOE51NO+POizLsH4SnpBRrf5cOOLeVZvirMB5WYnj5Ci7ouK57cN/jngaafkB6yyKZrv3LhLZFXk8cVrZbTILUZZHEWZnPZBR9rfz7lZO0e7HX/tcSOk8mWdJ9zByJtdt0P2iuxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747299781; c=relaxed/relaxed;
	bh=lf6XELp40BbkFQ8YMZlKL5Y5x9UfNtANG+jBslNV+fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHoLRIqRksODWNQG4zCEqaSOFkC3nNV9ohNoJtIW+X5V7qNunBLLlcMtcpq33RwloVcTI8gKwq8Akj4XzHrPuNjxc9bJ0AVF9SgeUvWfyKHen4juR4kDCe9znvg56XS8iIBJQX3TWn9g/NVDOWSZmp8DFFULArdG/S45BoaLO29fkyrqfWRU2Wwpkqq5QJR+OCXOA6wlIEVqThrwA4qdfmy0krn0G9LFoG8Ena0uhKQQf+ScNSyxX9qSdzDUZ1Rd5BC7e63ZqmBHIRJHQg/BkcYDAAGW/QtDm5ErKtYt1Cwnh0s3rCctHGkVoqu63bgIkUD2LDXIKmzGyiBluNM8Gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HHVHIl/G; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HHVHIl/G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zykkq5kLwz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 19:02:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F851614BA;
	Thu, 15 May 2025 09:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775F2C4CEE9;
	Thu, 15 May 2025 09:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747299775;
	bh=DdR+iT74thckjay2jHl6JRdQgazSc4DbBO3/97MtQFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HHVHIl/GQ3OfHIKWGc8LdkQdOynuN3eRK9dIFOH9AWzvAg/+YVBY38MKu8m6DIaJ8
	 ogZaKfyHPqx+ER/XGzvNDMaAJXfV6hrFs9q0ktQwnuejL3O9/or3b3r6zzw9MsoMlJ
	 /FEqGnayigRX/WV/PxkJx5UYmJfSr8I8UAHI+AqvH8WkR6JLeSgXDHx4KbTPL/+Xi7
	 MerAdihHYW10gxdyoj2xhrd476PtlJKjWgWOPqTFDM7lf3kHaaaJzyORvTLe7T8W30
	 GJu+ICmU1x4ydKhmvpPyUWChoXSJGDFoFi0Io4h8hJxpz5alVnvt2mKo1RambfbR00
	 hdnawvTLfvo3g==
Date: Thu, 15 May 2025 11:02:39 +0200
From: Christian Brauner <brauner@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <20250515-bedarf-absagen-464773be3e72@brauner>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> 
> >
> > 	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > 	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
> 
> I don't think we can have both the "struct fsxattr" from the uapi
> headers, and a variable size as an additional argument. I would
> still prefer not having the extensible structure at all and just

We're not going to add new interfaces that are fixed size unless for the
very basic cases. I don't care if we're doing that somewhere else in the
kernel but we're not doing that for vfs apis.

> use fsxattr, but if you want to make it extensible in this way,
> it should use a different structure (name). Otherwise adding
> fields after fsx_pad[] would break the ioctl interface.

Would that really be a problem? Just along the syscall simply add
something like:

diff --git a/fs/ioctl.c b/fs/ioctl.c
index c91fd2b46a77..d3943805c4be 100644
--- a/fs/ioctl.c
+++ b/fs/ioctl.c
@@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
        case FS_IOC_SETFLAGS:
                return ioctl_setflags(filp, argp);

-       case FS_IOC_FSGETXATTR:
-               return ioctl_fsgetxattr(filp, argp);
-
-       case FS_IOC_FSSETXATTR:
-               return ioctl_fssetxattr(filp, argp);
-
        case FS_IOC_GETFSUUID:
                return ioctl_getfsuuid(filp, argp);

@@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
                break;
        }

+       switch (_IOC_NR(cmd)) {
+       case _IOC_NR(FS_IOC_FSGETXATTR):
+               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
+                       return SOMETHING_SOMETHING;
+               /* Only handle original size. */
+               return ioctl_fsgetxattr(filp, argp);
+
+       case _IOC_NR(FFS_IOC_FSSETXATTR):
+               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
+                       return SOMETHING_SOMETHING;
+               /* Only handle original size. */
+               return ioctl_fssetxattr(filp, argp);
+       }
+
        return -ENOIOCTLCMD;
 }

