Return-Path: <linuxppc-dev+bounces-7286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E51A6C534
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 22:32:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKFz40cnXz2yT0;
	Sat, 22 Mar 2025 08:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742592752;
	cv=none; b=TGGzFoXoQ8Dr7hu3h1rXQEAA9gVNmWPm2JKC0XVTDOKJkMKvwiiPJuXS1vvcSecgBLgzhJ9AqNaOh7td69TSFlvHr+3GIwM/N/McwGKHQcFPqNcWmbRKPQhqNigvLmx9IwZMsv8uLWBYDEE+ELL8c+gWXRs2dDNHM4yZMsQ+zvZCCZ4YtS7V2ioLP9ZF68sV/QhdQL9ZBJdiwzyqMciWnSpBkkDcvN7jf2d+XBsSG75Sr3OiUIoHnAylsLFlwZJh5QOmKK82DM+MRWqidcwbMmz/lOo4DMIA5iPSbaH3+UH09imCbSOgCN2AvrAfYIrZ/6g6+KUcwhnTkGCN98ZMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742592752; c=relaxed/relaxed;
	bh=WkEW7se4kA9gakYYehbVu1ZGmOR39c99GGBG3Q74ESA=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=NvtqhHVz5w9ghNlrJ5SPiYyeU+OQvApu0+bTQG54/i+zdGnmpkK7uryl4s98fxW39u4GHGuLSyC6fF51NWIFyh7A6q8cS7csi8zRHuiIo3auIe9Gaz1VeKYgny3dPrqUWw81XhKjBcMnadhOtz+Rn4fG65xFtkcblA2rnRn3IA0oklhlEsllr+7ghscjuyjy1MwPTlXgqqA3svis+OWYo7iIzlePsoSA6yOOB9iENQXHnaeFTDjqGMY3x1h3r5ErAScDl00rZkX6gTpOt3F9yOvrayTqRmVlL4xm6dQAreBUQWyKA0sPhkSNR5iwzWnutX1t19Sq2zdcrb4V5x1NTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=VlO4dnT2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=VlO4dnT2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::82f; helo=mail-qt1-x82f.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKFz30q1xz2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 08:32:29 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4767b3f8899so35811881cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 14:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1742592747; x=1743197547; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkEW7se4kA9gakYYehbVu1ZGmOR39c99GGBG3Q74ESA=;
        b=VlO4dnT2ylw7YAbMzAmhpVPLokI0dafzYtZQRz7BfRy0YQtnDdZDrcJbBvrdWitTFC
         ebDg4CDNmnrJjJ3m3en1d7RBjwYLWGYRpfaQeSaVwGfpFa+w0N0w/x0nTJFq3AJgLv7Z
         1VUL4/HN1JghCTF3DfvJys7MyLpd7/AIFd9reR4jTisgCYigHqxu6Q7XcACXdi5u5Ohm
         I6DXYShIm7NBigBPDISjKWFymfyIaPXOhKsLjwV3lstJpxdOdFtxt50yC6kO62J8QTo9
         3oAY/8djKbUSwY0anyRJaDHyGrcWGbbJc/mAWGb/HStHI7OxbqkPFcqyFCpjYPA3aP81
         6wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742592747; x=1743197547;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WkEW7se4kA9gakYYehbVu1ZGmOR39c99GGBG3Q74ESA=;
        b=uTg8yFM64wJUyNMNmcug8nTxeEXVtIKA5Ri2ulcSy5ZaLd1LvMtuYVBfvbwm/99Ja/
         tZ0N2Tvxo6tzs6r9Dtads3usIMPhFvshrgpp8g1kyiJAOOxa4Sj4MxasKQSocqBlSKhz
         14STehAAtDfndFPGmYp15JN9T0sIrnfW/JMZ1NrNe30GQd7uYlLbBAiDF4390PotRMGw
         wqljp3jC3kA1FoEEmsme4kWPGpzpn7IgnaGDtFdp/dUWW6+vDf19jjyd2cpFwB4tAQDY
         8wbElMB++nYhDX3nWy8bPe7y0OEY5VJHMBO6VOMXpQfcvu4Xv4tJBFS9MqLinRG8Ipbw
         k5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUs6lbA3nH1f+lxwFz4dz0L2Sj+iyEPd+5arMXxTB0JN/QJcTNba4l8YFM0WAjIClkRfDC4N0wY4mrlX7o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjFrlcb+wbmZ0FEQLjVnPpqA+X1X0oW8pFMKl4XTvivGEH8x+n
	cdW+mEltOVdTxC8pnnZ6oC9ZRhP6w/8ejwzyEOK+acES1M7I1JWijNzFIGmQ+Q==
X-Gm-Gg: ASbGnctEr/swc1ZqF88RXDDcMuaqz1Nmccuru7/qXo0jvcSGliZHCM5N3RQVU/1NTqX
	Gpr5TasWUvd3rZlTG1oz3dZy+p3ZHMPO5aFRD/fZmTpxJe871pIYpzm5IJ8nnHiwvWpnUM+hU8+
	LL9IDbLVY2Ru93T5rgg9oFsHPMrlBZkH3DK5cZaEuf5AYgplty7LewTJfAPO65AJgWRKvJVp0JJ
	B+Ex7Og+WH/GsfOZO1boi48Xoh9GCQSpHX+2bgTE+Yt/MwY4EZs9sRI+UkOzpTDviaN+DLc+P8Y
	DvkyfOm332VPMXEF9zb+LayvF8XLJeUoozGOH5peM3faGZud+NrR6uMvccNM4LDV8XVfueixNu+
	ZeYBrMDRaeGMBqA==
X-Google-Smtp-Source: AGHT+IEqvMs9f3zdHkqatEuHHMLq+Pp1CGQwo1N+6m68HBYAt0XjQifVPk3cXxCHJ8EdFG+VR82ouA==
X-Received: by 2002:a05:622a:1f98:b0:471:fef5:ee84 with SMTP id d75a77b69052e-4771d924e1emr70292591cf.7.1742592746683;
        Fri, 21 Mar 2025 14:32:26 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4771d64d5f6sm16343541cf.81.2025.03.21.14.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 14:32:26 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:32:25 -0400
Message-ID: <e2d5b27847fde03e0b4b9fc7a464fd87@paul-moore.com>
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
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250320_1749/pstg-lib:20250320_2248/pstg-pwork:20250320_1749
From: Paul Moore <paul@paul-moore.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
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
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v4 1/3] lsm: introduce new hooks for setting/getting inode  fsxattr
References: <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
In-Reply-To: <20250321-xattrat-syscall-v4-1-3e82e6fb3264@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mar 21, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
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

Thanks Andrey, one small change below, but otherwise this looks pretty
good.  If you feel like trying to work up the SELinux implementation but
need some assitance please let me know, I'll be happy to help :)

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

I don't believe we want to hide or otherwise drop the LSM return code as
that could lead to odd behavior, e.g. returning 0/success despite not
having executed the fileattr_set operation.

--
paul-moore.com

