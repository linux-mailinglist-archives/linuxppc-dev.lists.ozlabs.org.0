Return-Path: <linuxppc-dev+bounces-8539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E251AB553C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 14:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zxbxq5wxlz2ySl;
	Tue, 13 May 2025 22:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747140815;
	cv=none; b=d6deO6HxcEmYj+IdhJ3XG4WcajgZHAVxdoBSkXVKsI9nBiYzxxjVJDjVUG+WrNDm9VPFhM0Qbp5nTa/3DDxaDn+A2PlLFmxXMnUP4E/ssD5P80grc7IrBtoyP8iEhZrEvqf01mrh1jywCVlADY+xuRVyfyXF47P5Rir76fM1JTy7BLFfuIlhVlE/9IUAc1ZxU9ZcZ5dGPz3skdhlIsZermi7TeQ1Q6K6kYBcziPqCQWUCy+ViP7bkmJvI1aLz0VJB6IWW5jzBwY47Xzf/Gf+C9PmazYVaqbErLyfOuAVb4RFPz86TT0raueq/hfVH9mh9PgE7BeCEn1ZzUAW/rPBaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747140815; c=relaxed/relaxed;
	bh=lhUsGW6Aej7UtwPk8Fo3WswAje2EzwjwJ+3T+imRPIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTXvuzYbo5t0FIVw/c7lEnbGZL/MqrxY1qDnERwDh1Tv/9ZjqmDrhL67qqfvN+DIArPEkt08CfqDnWn1R01b4TQSAoR3LwRdYJRwbMpQmW9SKOxWJweLKfknMVs5xk8QxFydegyYV+gKpzPpdDQSGoWIgwccAC+2xbrw1cinpDh6T2IYWqSxSRgn7RtC6T3A0gveoORlMoxdEiMYAFDKLlHs/XNTjgfUq/ooqEg1zOHR4DnBWbQyeI0wv+gjp9flz98RDEHSFiU3YVGbd+B88Ue0xb2g4pa1hcJwkAbmXgV0+JwZWRm7wC0pb/1ZH9csiXM+HhGDAFvZAa54lU2Bsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f7fOiKcd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f7fOiKcd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=amir73il@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zxbxp1sBvz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 22:53:33 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5fbed53b421so8789220a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747140809; x=1747745609; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhUsGW6Aej7UtwPk8Fo3WswAje2EzwjwJ+3T+imRPIA=;
        b=f7fOiKcdQ88FkXC+u6d2qvV2J3vwO5OB71MjP7y/MFulJvb6DbGIHRst9MvH6Wlz6s
         Gic7ESW5nFAzoD+FRDJPjyB0TAQ2ix8iwrTcAfAMJyw8mI4uNBNngMxvepMWZnsZP6O3
         RRFlhh7LPdOkX+nf/Sp9Yk991goLbL4nbLiB5vdUD9Y+j+kp26LMc0t6WtIF2Z9IDB6r
         pWYUmk4h4GKCe3Tw9DHTdTaBzpADftz4WooQJ9eTd0HOfvYK30r+eqQEiLRghfaBQkuw
         /HjT+UnIYJdxfs9Q2AowI4n5VBbFfmOtEdmbZ/KPUOeNkAwzXqV5NefLjkJNxRBTKiUR
         f6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140809; x=1747745609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhUsGW6Aej7UtwPk8Fo3WswAje2EzwjwJ+3T+imRPIA=;
        b=I2PrfGiDbOxXL3XM54CZasjqvuixKQcVdHvl5LGixLdynkWBm2MCPkx0KLTl4dusN7
         Uihw39jvYNyD67e12LYMsf7seGQLPW6m1Eo4W3P4CmE15ynMXdRLsFJIVs9cN8RHgNPj
         8B03C+mbM8mNrlUzjcQ6lrkCvucirJxKM0LxkMEb32X2MA4wcnrkv4IgVlnAL24qEcXq
         QaFQHOIPoMPOTRAJgEAVzrnp4ye1pakgoOtp/qoExi8oe8nR4EY+F4fRid6WtalOWhqc
         aL9oPcuEJHZuZSWawsGCTtfWgjgh8fozEE/QZzFI7ys2I8cEFlGMogn54cecOEJrKJoD
         9jcg==
X-Forwarded-Encrypted: i=1; AJvYcCWu9vF9pP7MOJlj3XyKnxCT32dT3Bs/XI5H8RJP7ETwWBNXDV2piNLhCCVJfpDOBLIWvG66iKJSa+mQRKE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywmwl8c66Oh/5sZUCno7r4X8/jPhw4XoJYqZySe1eue/kdTGpB6
	hz8CaB+mfmMtfGP1BuDxoBUVSqKXcq81H9amFLA7WzGZ2DaENGtgfJaO1iSLC7ZfPKJ75CLOxap
	vrIaD0z8FCcULoipxK7CRocNH9dg=
X-Gm-Gg: ASbGnctA3vR9WFh7vL212QNltq9sEph4m8HkedmY/6WwgIkCYEK2c8o+YSrzCP89iux
	863DVyHB1cZDU+OoYxykcMA42Tgipea3QVaHlPf1AFyIb5itVl9F8as4qO2NPXwJ+3AlR5Ud3HH
	UigY92vePpwPPTbgcvBhIQiIuvFiNTPIkO
X-Google-Smtp-Source: AGHT+IE/b0BCD4zsWzgMefEsXbY+DbhCAD/XOG3dRDcg9jP4PpucFQp1j7NsiRF8Za5+3lLoqjezqR5fGVfm35+9pG4=
X-Received: by 2002:a17:907:7617:b0:ad2:23fb:5a03 with SMTP id
 a640c23a62f3a-ad223fb7c87mr1075619066b.7.1747140808774; Tue, 13 May 2025
 05:53:28 -0700 (PDT)
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
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org> <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
In-Reply-To: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 13 May 2025 14:53:17 +0200
X-Gm-Features: AX0GCFu24ZFGPch6zxlVZkmp4exgi2YQWGGbqSjGo76MZv2IKCv94Wv0HRsT2OA
Message-ID: <CAOQ4uxgOAxg7N1OUJfb1KMp7oWOfN=KV9Lzz6ZrX0=XRGOQrEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr syscalls
To: Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>
Cc: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, 
	ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, 
	linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 13, 2025 at 11:53=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
>
> >
> >       long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> >               struct fsxattr *fsx, size_t size, unsigned int at_flags);
> >       long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> >               struct fsxattr *fsx, size_t size, unsigned int at_flags);
>
> I don't think we can have both the "struct fsxattr" from the uapi
> headers, and a variable size as an additional argument. I would
> still prefer not having the extensible structure at all and just
> use fsxattr, but if you want to make it extensible in this way,
> it should use a different structure (name). Otherwise adding
> fields after fsx_pad[] would break the ioctl interface.
>

Are you are suggesting that we need to define this variant?:

--- a/include/uapi/linux/fs.h
+++ b/include/uapi/linux/fs.h
@@ -148,6 +148,17 @@ struct fsxattr {
        unsigned char   fsx_pad[8];
 };

+/*
+ * Variable size structure for file_[sg]et_attr().
+ */
+struct fsx_fileattr {
+       __u32           fsx_xflags;     /* xflags field value (get/set) */
+       __u32           fsx_extsize;    /* extsize field value (get/set)*/
+       __u32           fsx_nextents;   /* nextents field value (get)   */
+       __u32           fsx_projid;     /* project identifier (get/set) */
+       __u32           fsx_cowextsize; /* CoW extsize field value (get/set=
)*/
+};
+

> I also find the bit confusing where the argument contains both
> "ignored but assumed zero" flags, and "required to be zero"
> flags depending on whether it's in the fsx_pad[] field or
> after it. This would be fine if it was better documented.
>

I think that is an oversight.
The syscall should have required that fsx_pad is zero,
same as patch 6/7 requires that unknown xflags are zero.

If we change to:
       error =3D copy_struct_from_user(&fsx, sizeof(struct
fsx_fileattr), ufsx, usize);

It will take care of requiring zero fsx_pad even if user calls the syscall =
with
sizeof(struct fsxattr).

Thanks,
Amir.

