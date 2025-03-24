Return-Path: <linuxppc-dev+bounces-7316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 128BEA6E356
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 20:22:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZM2x16gFdz2xsW;
	Tue, 25 Mar 2025 06:21:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=84.16.66.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742844117;
	cv=none; b=J3jblhukcTr22wnt9JEj6j+XPGc30qIuOJCF22hIjrC28xOIFDzSIv5pt0uPCfE4Idbo7zgynBOj3fz3KtIDjuZeN9DpdBdcewl8QfikA07qiUnLAvGeYpTxOKGirU8eVL622CDTOBoqo8oPPVPnKPUK812gKZfNggUZ2tWIx4NL9/XpLfIIniA7Cf/xGKg4KzR71iuvqLNKrxhsaYJ+a8ftG/CfCmMpiswPndwge5nJMMfwTCApnpKqFvziTpoE0/H23vFLF6Dga+uipFnTPI/AA9UoQHJqUyBvSV+P7KbKTHusKyeyy0/HUANOFqGYJOFZBCn4KNJ8PAx1fl7QtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742844117; c=relaxed/relaxed;
	bh=KP5tQfq9jTZoEX5oO13eq6Eoqzftit1HmO0SOuoKa2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7ssHo7mmq8LGAqiiXfzUPvNYKrUeibUOmekfsO8co1iIp8obYCyWczUr02Wtn61bNVZX7lu8Zvr3qHFtruKeDspax4Pzzt8G+e336yLfH9d4JfcUusqFHMJpaVfhZc06hwqPUr9T9csEx0ituCxCPWOLeUb9FqD6Nm8HuvqyZ5/J0wu/4C/M0LGZZEN5trqPptpRIH27/Vb7cHfi5xIMnvqUD3H1ja4iUnsfz1Jehsz49sDsyT4N/rxUc7VoDnNmFrMit5JqkF+F3FR2twnboNV+WX9VPdx2Qtl/gXUNfaxq7u4GepLVs1Mp7+UD32NS/XKteLxG+Uq+QErMrLcog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=digikod.net; dkim=pass (1024-bit key; secure) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=fw0UGAxS; dkim-atps=neutral; spf=pass (client-ip=84.16.66.172; helo=smtp-42ac.mail.infomaniak.ch; envelope-from=mic@digikod.net; receiver=lists.ozlabs.org) smtp.mailfrom=digikod.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=fw0UGAxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=digikod.net (client-ip=84.16.66.172; helo=smtp-42ac.mail.infomaniak.ch; envelope-from=mic@digikod.net; receiver=lists.ozlabs.org)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZM2wy59cpz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 06:21:49 +1100 (AEDT)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZM2wm1dx4z3SX;
	Mon, 24 Mar 2025 20:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1742844104;
	bh=KP5tQfq9jTZoEX5oO13eq6Eoqzftit1HmO0SOuoKa2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fw0UGAxSsxyEHu4mAuVmj2W5BTDwTRKTUgpOIwFPcKgqCbgVLPf5mFIsd6M+a9TJ/
	 CWMoIuNRwGsOREtC4ItQgIbaVZmF3Mrh7oq2hoog4Nkq2g5T7oVn/0MP94m6kx+zNO
	 Zm92qRXtcEkLcCPRtv8St5nzyW7SucJ7LLndfX6w=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4ZM2wg62TjzhW0;
	Mon, 24 Mar 2025 20:21:39 +0100 (CET)
Date: Mon, 24 Mar 2025 20:21:38 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Andrey Albershteyn <aalbersh@redhat.com>
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
	=?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v4 1/3] lsm: introduce new hooks for setting/getting
 inode fsxattr
Message-ID: <20250324.Sai1Chahyauw@digikod.net>
References: <20250321-xattrat-syscall-v4-0-3e82e6fb3264@kernel.org>
 <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
X-Infomaniak-Routing: alpha
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 08:48:40PM +0100, Andrey Albershteyn wrote:
> Introduce new hooks for setting and getting filesystem extended
> attributes on inode (FS_IOC_FSGETXATTR).
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/ioctl.c                    |  7 ++++++-
>  include/linux/lsm_hook_defs.h |  4 ++++
>  include/linux/security.h      | 16 ++++++++++++++++
>  security/security.c           | 32 ++++++++++++++++++++++++++++++++
>  4 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ioctl.c b/fs/ioctl.c
> index 638a36be31c14afc66a7fd6eb237d9545e8ad997..4434c97bc5dff5a3e8635e28745cd99404ff353e 100644
> --- a/fs/ioctl.c
> +++ b/fs/ioctl.c
> @@ -525,10 +525,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
>  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  {
>  	struct inode *inode = d_inode(dentry);
> +	int error;
>  
>  	if (!inode->i_op->fileattr_get)
>  		return -ENOIOCTLCMD;
>  
> +	error = security_inode_getfsxattr(inode, fa);

It would help for both of these hooks to pass the dentry instead of the
inode.

> +	if (error)
> +		return error;
> +
>  	return inode->i_op->fileattr_get(dentry, fa);
>  }
>  EXPORT_SYMBOL(vfs_fileattr_get);
> @@ -692,7 +697,7 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>  			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
>  		}
>  		err = fileattr_set_prepare(inode, &old_ma, fa);
> -		if (!err)
> +		if (!err && !security_inode_setfsxattr(inode, fa))
>  			err = inode->i_op->fileattr_set(idmap, dentry, fa);
>  	}
>  	inode_unlock(inode);


