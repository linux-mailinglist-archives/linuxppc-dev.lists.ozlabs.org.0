Return-Path: <linuxppc-dev+bounces-8517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 879DEAB3C83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 May 2025 17:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zx3mc0Nztz2xjK;
	Tue, 13 May 2025 01:43:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=66.163.189.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747064623;
	cv=none; b=LR5cDRYzmm9KBE2q1zJbjR5cZwG4RvdtBfnkxE0JAM3l+/0HmrsPdJXSmM54tbvUC6QAuM63gZw61JtRQacymd9xmMxsZwboplBunvKBEb54lIo7tHGWp36uBqrVMThIwBYtLq1KveL6Tgwi9slOTnaup8suFEdydOXHG8WwmBihQJhKPwWanpjQqaa+ny6OWmwnv6p9Cq4ZrbqXcXOzy3H5YRJjO3Nl3b6m32hAl7CaHnP1/ywmfpX/t6o4WSH/iawM7BQQSmIfgIcKX8iKlGY1GSk64NBdPMh9rq5yLSKuvqHibFO0lsnfVBW7GkQlbyGdSDC2ui+VlyrwYndN2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747064623; c=relaxed/relaxed;
	bh=QKPRXBWiP6vdtfxBDOOQtpUp6zIgN5XDA7BfuJSNLwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkKzu8inj8bqDEc3+m7627NUwOBHbDBbWmLN1PD8L5BoBbMV20nr47vKsNpD2oX2+1xjLhtk7fjXM2V9c6NOeunHCmJDhlHN771AhvITeutv7lKVHDJ/QcRLys80deUL6+DcK/doG10kNxhTFkAEZaOkP7zKY/2FiatkpzBO97UC8p4KdVetQVnET9bC6Vu+mO6j7gv4ycKsqHelw9A62WCYg7DacS9kg515qKrda/2/l35RjqeO/XUwCL/ar3ug6Vcu6j2+yeB6ia2qPypnwMX+Eh/N9yfh73meI9BQEZ6rAjeL8xjP3AdpUfgvVbLeuPNc/+LzGrTDKCHGVQaZkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ntyjDWB6; dkim-atps=neutral; spf=none (client-ip=66.163.189.152; helo=sonic314-26.consmr.mail.ne1.yahoo.com; envelope-from=casey@schaufler-ca.com; receiver=lists.ozlabs.org) smtp.mailfrom=schaufler-ca.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=ntyjDWB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=schaufler-ca.com (client-ip=66.163.189.152; helo=sonic314-26.consmr.mail.ne1.yahoo.com; envelope-from=casey@schaufler-ca.com; receiver=lists.ozlabs.org)
Received: from sonic314-26.consmr.mail.ne1.yahoo.com (sonic314-26.consmr.mail.ne1.yahoo.com [66.163.189.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zx3mY6Z7hz2xgp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 01:43:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747064617; bh=QKPRXBWiP6vdtfxBDOOQtpUp6zIgN5XDA7BfuJSNLwU=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=ntyjDWB6dZv+7X3N+X5yr8pc8QkaeC0EnNEnTjw4j/LhW/o5uxeNqWWaQjHa7TLz0TS2PETV/CDYnYbEmQ/bnq86BJyiMylNlNp6owf1AWCcIDUqcow5jZlmnPPkEivipb8eZNQkjGt0Hy/R95hTcaurNsuxxeInpDw6w3Dblgu/lfHPngbLdlFFOQ593HTotqRgI/YKiping4wg+KPDwR867sRRPcdMxo7eRLA0uyxKFkbYcSKPAkOm/wnDoAgNiXRjT7MuBU+1acqEfzjpNTi2KGV+AqM8oLnThoB+rZYplU+kCGpImYX0vvM9TKYgGjl0+1cvDQjDCWa/GrW6jg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1747064617; bh=8redTxGWiikRY2d9LbwTHUnouBcNgByzMEi97v7vI8H=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=nRUEtVeR4NHmVxZuFNuV/CkPDcetgpdNnyk9EeNGbJ1z4LCvrEyKLj6H8RTiJkyOQN/P5zBUNxOVPAjh5QulBI/SJPN/Ud6wBlVsLaIC8xvan/klygJyE8eJtafxegFIY23HdWuxsAYB/Eq3YvAZb37diwk+DN7Od77ETwbBNs5gWnSYXVm6HOzFOMmrOo8AZ/6vyX2kCiwag/vSvEPzkRitY18IzIjweHRfAm/ur/cA3dbgliY4eRe+PwajjzZmRv1kTIPvRbBSfeld/7dp00DXMzA0qODLuk2ccuA6P6cB/Ahqtt/pgOIW/8rN66ENfhIwHVW8FmbqBU2EWO8GZA==
X-YMail-OSG: WM0Uc6IVM1nokahWIeUzSYQROtDJ9qeYMqEm7._cOi5dW2OQxX1llQWOhl5Htkw
 pjqZQRdX6mFRJ5HACZZsjO4D7uqCqBCGc1hISzip1nkT5f0JbgEYn5DwLsVF_zNN9h5.ljwLXxHG
 MLEdCtBfxijdLgBKpmOBQmdL.6E7I63B67qzw4fTZCtYY87Y2sG7n9V2G3IcXkpSRmCdOjGj35kd
 6wZhNQBHe_zsRK93qaekXH6G3rQ0llGNpd69ZxMX2YgwokTwHrEjucGbV3zA4aY1A0usOxMeI.5Q
 g_Y7ZfRYb9f_iaOkE0C3wlun.ML7bLz9TNs7LR6hUbiKfS7R_xnua7CMPYcos52uVZESl04Yj8HT
 SgkSN.HPDPy_mTbQODVWMFUR1kwxRfSu6y1pp.8Kf1JHOedaNvoTnKdsWbPX1eDMeTG44MWJnkFp
 BreWN8tfY1ZWTOpSF.UrHsF_M45pb7610HXwrW01_zFezmO9sZ6Hs_IswvhcPI2f8roAsMEnEVsy
 YQcqrMHUb3SKNShsH_B2KvZO1q29_1FgKtCbTknNAsW3JhjznDOIhQFqZz1pKTCgMudVmxsaDaEK
 uXPO8GZ66zJhG.Db_2RCAUOkdgg04QsHPqt_Jv9aFJUu_GC1x0ByCnk7LWRO6Eze_PUMZcFCYE.j
 7u_q4Ny66FNycDqi0JYh4V2eak0XQ.9fUIs5N.ZtM5.mPEJbU._veqQCv4eeX0PnjmcH6_6jLlvC
 cMnrhKZeSaJvH7jVwQ3Gy8WBtNc3J7SrdTYTIzsVXb57JuhulLTYcW7gANxy5__UCyzz9yrI_Sle
 dDyaQzYAU6eKo3_thzIur1cqBiA0xfbn7YzjFTflnwaTmB9s8Z5cXoi7qL.IrFiNDg8typtgdpiS
 obXp643ZT.cennx8.wg6MfeSxHio3cUCDwnTIxV3dwv_kwKVD0CIotga4WI52Bvi7MXD_t.vbVlW
 AmlnBrxupeN_f_QhVkf0DGOXGVECOMEt3zs5rw5yb_1kx.JHYf4DyYrvh51Rz8vePzxA9IfRbX1d
 8NITO0GqX7FPEACmRoN9um44C1.b0XjtyqCql7CXQP0P._JiwvpvvNh38RWC7s7RNeG5IFN.JFIf
 jD9l2jK.Vl7WgBphg.Bo.BpPoTBNZh5Jg1Tr_k0e9b4_cTmbpy6fdxwrPF08ENXp.m6DQExcEf0F
 oFaIAzVBYgjolQOlfdgMECkYvUNBAsbdocO00OGFdqxau74UdkBgVM1awnBMUwAflj_Fu_.M1.sg
 svpD5b6Z4HD6d4ILD1C.G9smUlbD1SWuK6KbptHvZqepNB3GTexWWjVem0Z05STHxPGSHOkl.zIN
 _BJDI4ly8NC1S74hHfu4bq.wF..fsPsq1JjyeQLGljkI7SeonIuMRktURm5XxIhdsrFsxNILEzF_
 gJQtx78kT1Vro4YDrt.6wlJGeiPvSnoNDpeAga7Ftm7hQV6zn9cz_M7lAxvvMksUI0_6RWqhrwMa
 Qln6rPUfOOpWXN5KlqhwkU1lcFLoAiqgNtNjxbYrE5pBda3jH3sQBc2fk6ONYxXTmLKR1smptkTh
 zBR2KISLTGFvfO4fypux_tUy.zDVWgQHb.hBwsxdoq.lQQi6P8xIJejgomrkjC_mfNkLwx6ujady
 K2k_12wDulVH7DMfGgH7tb.iriJjz93IfXsXbuzmgQBfGYzFkd7WOlfB2hddSAoJUP5ipAxHtAgU
 0saYraZitFaM4ggkxcTrL9UzkIb5Fud59DW1FRPZqb_l04XEzkx5pQIkhkGF.oi73yquM24q_dBY
 AAgrnSL8tRBalM_LvCniSz9571Y8kjMjA6G8y7jZJWj4DNh_fi_aozx4Eu9P.XS4OLtgA7AE109t
 SKpkzRlBrUnm505ojZRoLVA4qqYnDwusVoD7K0s9Lcq2S6kopzsptsEHsmWfub0DTOCnlXMbattC
 KavPkZytUKqA2cLl9D7_0ncFvzCOUQvBsilxK0gEUd.994raVMJgtdlMDz_REtm0uROPRIW.KQy2
 RS0hypGIAfb1KSV_lnQxl85e9J.aJ2qxtH99GYclfQrVqxriF0RachyDZaCxsN7tIdHMcP_USx6X
 .nnn.bcWn_Vy3tJDwXoR42hyd27mJSLy4ok3.1BDA0LuOMH6u3y0JPOT0pN6Y1PslOdSw4PUUwOl
 X7cSpTQsWS7ZfnQNOno1IGB.d2nDRZkiy9QB9fsqP6KpY5DGbGaBmtw1ug6xXdzV4o8lYcDW8kcy
 lDxB6hRTPgSCzq62cPOd1UJqAv3_xYrAJp7509YQy8Ef.L.75s27NGiAipeIkuudzCObUkBNkMVK
 z238o0uQ-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 4a184068-b4a9-4c89-b0eb-f26242664d7e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ne1.yahoo.com with HTTP; Mon, 12 May 2025 15:43:37 +0000
Received: by hermes--production-gq1-74d64bb7d7-mh87r (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9937c2f444744075ac11cc686b78df22;
          Mon, 12 May 2025 15:43:34 +0000 (UTC)
Message-ID: <f700845d-f332-4336-a441-08f98cd7f075@schaufler-ca.com>
Date: Mon, 12 May 2025 08:43:32 -0700
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode
 fsxattr
To: Andrey Albershteyn <aalbersh@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
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
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
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
 Casey Schaufler <casey@schaufler-ca.com>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
 <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23772 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 5/12/2025 6:25 AM, Andrey Albershteyn wrote:
> Introduce new hooks for setting and getting filesystem extended
> attributes on inode (FS_IOC_FSGETXATTR).
>
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
>
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/file_attr.c                | 19 ++++++++++++++++---
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      | 16 ++++++++++++++++
>  security/security.c           | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 3 deletions(-)
>
> diff --git a/fs/file_attr.c b/fs/file_attr.c
> index 2910b7047721..be62d97cc444 100644
> --- a/fs/file_attr.c
> +++ b/fs/file_attr.c
> @@ -76,10 +76,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
>  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
>  {
>  	struct inode *inode = d_inode(dentry);
> +	int error;
>  
>  	if (!inode->i_op->fileattr_get)
>  		return -ENOIOCTLCMD;
>  
> +	error = security_inode_file_getattr(dentry, fa);
> +	if (error)
> +		return error;
> +

If you're changing VFS behavior to depend on LSMs supporting the new
hooks I'm concerned about the impact it will have on the LSMs that you
haven't supplied hooks for. Have you tested these changes with anything
besides SELinux?

>  	return inode->i_op->fileattr_get(dentry, fa);
>  }
>  EXPORT_SYMBOL(vfs_fileattr_get);
> @@ -242,12 +247,20 @@ int vfs_fileattr_set(struct mnt_idmap *idmap, struct dentry *dentry,
>  		} else {
>  			fa->flags |= old_ma.flags & ~FS_COMMON_FL;
>  		}
> +
>  		err = fileattr_set_prepare(inode, &old_ma, fa);
> -		if (!err)
> -			err = inode->i_op->fileattr_set(idmap, dentry, fa);
> +		if (err)
> +			goto out;
> +		err = security_inode_file_setattr(dentry, fa);
> +		if (err)
> +			goto out;
> +		err = inode->i_op->fileattr_set(idmap, dentry, fa);
> +		if (err)
> +			goto out;
>  	}
> +
> +out:
>  	inode_unlock(inode);
> -
>  	return err;
>  }
>  EXPORT_SYMBOL(vfs_fileattr_set);
> diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
> index bf3bbac4e02a..9600a4350e79 100644
> --- a/include/linux/lsm_hook_defs.h
> +++ b/include/linux/lsm_hook_defs.h
> @@ -157,6 +157,8 @@ LSM_HOOK(int, 0, inode_removexattr, struct mnt_idmap *idmap,
>  	 struct dentry *dentry, const char *name)
>  LSM_HOOK(void, LSM_RET_VOID, inode_post_removexattr, struct dentry *dentry,
>  	 const char *name)
> +LSM_HOOK(int, 0, inode_file_setattr, struct dentry *dentry, struct fileattr *fa)
> +LSM_HOOK(int, 0, inode_file_getattr, struct dentry *dentry, struct fileattr *fa)
>  LSM_HOOK(int, 0, inode_set_acl, struct mnt_idmap *idmap,
>  	 struct dentry *dentry, const char *acl_name, struct posix_acl *kacl)
>  LSM_HOOK(void, LSM_RET_VOID, inode_post_set_acl, struct dentry *dentry,
> diff --git a/include/linux/security.h b/include/linux/security.h
> index cc9b54d95d22..d2da2f654345 100644
> --- a/include/linux/security.h
> +++ b/include/linux/security.h
> @@ -451,6 +451,10 @@ int security_inode_listxattr(struct dentry *dentry);
>  int security_inode_removexattr(struct mnt_idmap *idmap,
>  			       struct dentry *dentry, const char *name);
>  void security_inode_post_removexattr(struct dentry *dentry, const char *name);
> +int security_inode_file_setattr(struct dentry *dentry,
> +			      struct fileattr *fa);
> +int security_inode_file_getattr(struct dentry *dentry,
> +			      struct fileattr *fa);
>  int security_inode_need_killpriv(struct dentry *dentry);
>  int security_inode_killpriv(struct mnt_idmap *idmap, struct dentry *dentry);
>  int security_inode_getsecurity(struct mnt_idmap *idmap,
> @@ -1053,6 +1057,18 @@ static inline void security_inode_post_removexattr(struct dentry *dentry,
>  						   const char *name)
>  { }
>  
> +static inline int security_inode_file_setattr(struct dentry *dentry,
> +					      struct fileattr *fa)
> +{
> +	return 0;
> +}
> +
> +static inline int security_inode_file_getattr(struct dentry *dentry,
> +					      struct fileattr *fa)
> +{
> +	return 0;
> +}
> +
>  static inline int security_inode_need_killpriv(struct dentry *dentry)
>  {
>  	return cap_inode_need_killpriv(dentry);
> diff --git a/security/security.c b/security/security.c
> index fb57e8fddd91..09c891e6027d 100644
> --- a/security/security.c
> +++ b/security/security.c
> @@ -2622,6 +2622,36 @@ void security_inode_post_removexattr(struct dentry *dentry, const char *name)
>  	call_void_hook(inode_post_removexattr, dentry, name);
>  }
>  
> +/**
> + * security_inode_file_setattr() - check if setting fsxattr is allowed
> + * @dentry: file to set filesystem extended attributes on
> + * @fa: extended attributes to set on the inode
> + *
> + * Called when file_setattr() syscall or FS_IOC_FSSETXATTR ioctl() is called on
> + * inode
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_inode_file_setattr(struct dentry *dentry, struct fileattr *fa)
> +{
> +	return call_int_hook(inode_file_setattr, dentry, fa);
> +}
> +
> +/**
> + * security_inode_file_getattr() - check if retrieving fsxattr is allowed
> + * @dentry: file to retrieve filesystem extended attributes from
> + * @fa: extended attributes to get
> + *
> + * Called when file_getattr() syscall or FS_IOC_FSGETXATTR ioctl() is called on
> + * inode
> + *
> + * Return: Returns 0 if permission is granted.
> + */
> +int security_inode_file_getattr(struct dentry *dentry, struct fileattr *fa)
> +{
> +	return call_int_hook(inode_file_getattr, dentry, fa);
> +}
> +
>  /**
>   * security_inode_need_killpriv() - Check if security_inode_killpriv() required
>   * @dentry: associated dentry
>

