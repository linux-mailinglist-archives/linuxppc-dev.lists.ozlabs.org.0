Return-Path: <linuxppc-dev+bounces-8580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DECAB6F93
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 17:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyHBv5MkXz2yrl;
	Thu, 15 May 2025 01:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747236135;
	cv=none; b=RTB9NjT6AEOfp+IWUbGwJjy/8CyOWS3FO+tH2vE9G/1fC6/5y2ebWSmBpgc78Fu14GPH7/uPGBxoYm6W71UsMfDhL4+eC4Kf+M56PR9xfwWTmPCFUh8t4C2dhWanRzpiYEN/tLvkH8h+OEpHrny+31cDDkN4C/0RSx89rMHSJyg08e5b7EYYVCUnaLcaI6I5x1QceCLW9xNeKTDNqCcwbzHMDlBXrBiUZ2dyoGQaLGwWHgS1WRoob04HhbjtrwPCDy1WEwtKrzOHAuqpnA/0VXdQLeMvf10ztuRizUSoktYJR60UV7DjBxX5XtR7Ex6vnrPZFCIm7Y+Pd3SVIc9jZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747236135; c=relaxed/relaxed;
	bh=yapZ2s67BLNwus6ibHABzXGBCoZzVlVupFJe/q2qy/U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=XJg6KPOjGirNcLUxqYYpe1qHZ4YedDdBf6OgwczkI4CWpRj72MB0MfB/swJ4WZBUVrYkhoylqsxNd9fg37t8OdcT/f0+Zp+wQhOAhQ1z1p08IHTq5fA0gedkezD606/iKxCwvqMQS/PzFhBZ4gD5nyi/nQ6uiutR070ZMdmWXj8Zr1eKb93xSEj9geGp/BcBOfvN5W+CUQRWV0geYSzzbb2xbIz+znxGsc95MXqA5hB7R1i55d8XzidL9V92hrzn0vzbHWmGhtf6WmkIH8eYibtcqBAP4DvkHmQwT6jvRLkV8dbpFurs01GBFxRnd1oqU0TJt2BiLOjWheLi88pS2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025042001 header.b=djZFgxiA; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025042001 header.b=djZFgxiA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 603 seconds by postgrey-1.37 at boromir; Thu, 15 May 2025 01:22:13 AEST
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyHBs2kW6z2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 01:22:13 +1000 (AEST)
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54EFAEbT3012887
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 14 May 2025 08:10:15 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54EFAEbT3012887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747235422;
	bh=yapZ2s67BLNwus6ibHABzXGBCoZzVlVupFJe/q2qy/U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=djZFgxiAUJE7iFHA0Wd/yFppU4TGqi4fxmoBT1mvTgxRmRiu+8QH1zl3CND+QbbP4
	 97UVxN+J8QD8iz78UlxzP16emoOIxJpWaoO9qxu1Ec5we80T+FOOb4RfHy40YAODf4
	 27XX25rvc06YcNMTsxppaOiXgVXhowu2DQa6R8gC1Tcuq8Oq9GVQp3swa9CciK5Vg/
	 jv/tWyK4JR8CJyAVAYMpVNTUaE0Ax5AVAQfxExqancQ8ZpUjlh9FBEWFvjm5PCVbut
	 6qwwqWO9GyDweGO8bFsU0TsmuX3ejxdQaqkTWk3Ymh6Yue7onjRsMrCGmrkfplN9Ef
	 P/Ifsp+Ororjw==
Date: Wed, 14 May 2025 08:10:12 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrey Albershteyn <aalbersh@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.osdn.me>, Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        =?ISO-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
        =?ISO-8859-1?Q?G=FCnther_Noack?= <gnoack@google.com>,
        =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali@kernel.org>,
        Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephen Smalley <stephen.smalley.work@gmail.com>,
        Ondrej Mosnacek <omosnace@redhat.com>, Tyler Hicks <code@tyhicks.com>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Amir Goldstein <amir73il@gmail.com>
CC: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
        selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
        linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org,
        Andrey Albershteyn <aalbersh@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/7=5D_fs=3A_introduce_fi?=
 =?US-ASCII?Q?le=5Fgetattr_and_file=5Fsetattr_syscalls?=
User-Agent: K-9 Mail for Android
In-Reply-To: <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org> <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
Message-ID: <B17E8366-DB80-45E6-90D6-294824C40FD9@zytor.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On May 13, 2025 2:53:23 AM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
>
>>
>> 	long syscall(SYS_file_getattr, int dirfd, const char *pathname,
>> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
>> 	long syscall(SYS_file_setattr, int dirfd, const char *pathname,
>> 		struct fsxattr *fsx, size_t size, unsigned int at_flags);
>
>I don't think we can have both the "struct fsxattr" from the uapi
>headers, and a variable size as an additional argument=2E I would
>still prefer not having the extensible structure at all and just
>use fsxattr, but if you want to make it extensible in this way,
>it should use a different structure (name)=2E Otherwise adding
>fields after fsx_pad[] would break the ioctl interface=2E
>
>I also find the bit confusing where the argument contains both
>"ignored but assumed zero" flags, and "required to be zero"
>flags depending on whether it's in the fsx_pad[] field or
>after it=2E This would be fine if it was better documented=2E
>
>
>> 		fsx=2Efsx_xflags |=3D FS_XFLAG_NODUMP;
>> 		error =3D syscall(468, dfd, "=2E/foo", &fsx, 0);
>
>The example still uses the calling conventions from a previous
>version=2E
>
>       Arnd

Well, ioctls carry the structure size in the ioctl number, so changing the=
 structure size would change the ioctl number with it=2E

