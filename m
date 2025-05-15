Return-Path: <linuxppc-dev+bounces-8596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FE7AB7F34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 09:51:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zyj7m0MHrz2yvv;
	Thu, 15 May 2025 17:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747295459;
	cv=none; b=XaJ2pJvsN2zc+86ch0yQh1sosFl//V5jSqeDUWAPTpa9wFYWN4h285S0Dok9mVfQ3YeVpJ3lsNsDyMAaHoKiS1wf5ifcujsG7qvf/+8ktx+V47orxHM1VMMXHM9xPYcR6XaTlq6RjhPR7JJ5RZnCpJRKcpRnHBgAOKD1Lc3foNwFiNPoMG8CbCiMJXvP96Q2wYS51uQMYco5BOuqxKzdXNDBUCt8xGX6HDrfBQ8yuA1HWoSTbl79x3zR1TjnxKFsA2zmKL3Mwx4G69dNe/0nVtGnXy+10JJB2Xcgd/s+JLAOkWMT2OxXFUhZ7ekSX9J5OOj8PO3VnOnOkTzkTayjig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747295459; c=relaxed/relaxed;
	bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=A+/Z8VrR9Nyw1elxsgFqzdCVUS2y968G6Q31H/qXdmNP26k5EOPMJJyNuCyVYvGUdev0pVXDSBdUjIrqJeN/GktRLXae4S4CPQD0HAc2DF75Ckir4Kw9euzfgtITd/NfXjhrMRs3ZCT1a7psiAMGmoJsGOqnxGwt2NOzcwOUPWwdeeqnVGecRtb/QthlictU+hXM5mLPR9SHbroVnd1fcmyKtZQ0l+3oHtNXb29sVoS2QEZGH+TSrPx7JVIecO97tqmcPvf2Gph+xPJWnLdTsKt8B77f5orneGWbQVznam6jyfrNAGmNc2e1a0TQ6Z6KX4kqwwVB03nzrWrhdeCsPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI1W6tm5; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DldQMFxA; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VI1W6tm5;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DldQMFxA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aalbersh@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zyj7k5WTSz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 17:50:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747295450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
	b=VI1W6tm5uVAu8XbZNsMxPrs82UkHjuB1RuuRMlrzpOpWtDemyOsUIegBcTEXwfFETJxPQ0
	BirYD500P9dF/DzSUxzdBsc60a/SIHzTnnGaj57W1nFZujcvUYxwSTp2HqZ7T9mgCxVy3Y
	/+ACe7KvUzL6OonYjNuBBvRC9UdCtrQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747295451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
	b=DldQMFxAavsg8G6TXoVVzdQa+2B794I131t+XgoYaxCKxDAQYCHlulxQDOnwSl4Kdp6FWG
	Hm336+SU9Dbp4kS8vMUh/okrik/tFSZb8Jw+n+l2Jks824r6QI69jpgaPRq3AQhm9NkDpK
	PQgNhUxK4Q95QzZDFFqJDlBvxSMNwyc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-ZWDRYSn0NzSxwY3yqml4YA-1; Thu, 15 May 2025 03:50:49 -0400
X-MC-Unique: ZWDRYSn0NzSxwY3yqml4YA-1
X-Mimecast-MFC-AGG-ID: ZWDRYSn0NzSxwY3yqml4YA_1747295448
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ad240e3f501so49459866b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 00:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747295448; x=1747900248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIYznBp1zKy3fmdyZZzgeQrbk2pRjSVKo51V0MhaZng=;
        b=eNQTTXcBZU91oj03ogaiC5KQBxbq6CZciK9PgS2vLL3BUf/KEw6VU0LPoc0N6aSuYy
         o/x3IVNFJDZ6cWlbJVoHf/yIPF9fDvsLiGQLG4CMnPqbukKq+583Z9TDkuOSZ7+n/cOP
         HSwn137J6TAWBJFXZFn+PSxwCXGNKMj7h818OBlHUwgFZeWuQ+zy8TI5DO21Eqf/oOn7
         qCL2pIpRuLI37OTBiNCbVJaa09wq9vwpe+Oi2ZVJ5W+z4fIOxhJmrl/TETOel0GwbVTt
         fHJJ2ob/KK8+Ag/v0DyqWHwaPMMl5+muDX1ieTTZf7pemdV2XIaSo7UxKggSwX3o+6wF
         bvrw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTUvvVJX9UEDxGX7Y90MFFRKIMKVMqUKhdoJTnD8juv1ovLeDJhUNpZTLobD0eCQOtKM8wYs/nIPba5I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxcjfWp2sxBWD5zmqDykP5ArrTI054bItfA4cjjtXU33iPqeTja
	0KSd7NA2tiT268xAYGHvZpZufG//ixOKwrQCX7wlP7NwvYl07V1jUQVvOIPkoDBbDhWtTRopAov
	yLPktzodirqlYYVAKX0tFTQshn2IylnWP6F7qVPSVypO5M2XEBT4k9hvdtjeisQ==
X-Gm-Gg: ASbGncun5vPpqHV47o3ED4M83WGFH1cxn9LxyQ+u4GWD9t4x+DiLZe9VGaAmJ/+QA9N
	0zVF4OvZKPPXG/SH72PDsYLT27sACzfA+A38q9ZMGXcZ+lJSrzMCDEmNRCaCQB4RozEmsFhW9js
	bbEC1hAgRlrvktQNL+hH70BD9MKxeQmXN88oBpnBqOHBml5LBwiSL7WVToDtZV6I1XLKm237VV/
	P9DfTGxJYf9a8NOWnz9zXrSj++7soWG7rUNlgrrNbMDFmvbu+D2u1zXbpAz2jdalkg9Afalq7T6
	PqVspCvLbffEqa4Zm6MbjH0pNyHj/6w6xYVBUj4P
X-Received: by 2002:a17:907:6e8f:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad51601e1edmr114985766b.44.1747295448312;
        Thu, 15 May 2025 00:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWr4fWklZ0eQ07tSCt/uJX+ZC5LZkXrxcbvUbmkmojzea9n6Ige7V0auLmvx+BHm+IbBk77A==
X-Received: by 2002:a17:907:6e8f:b0:ad4:f6d2:431b with SMTP id a640c23a62f3a-ad51601e1edmr114976966b.44.1747295447688;
        Thu, 15 May 2025 00:50:47 -0700 (PDT)
Received: from thinky (109-92-26-237.static.isp.telekom.rs. [109.92.26.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad224531152sm984378866b.38.2025.05.15.00.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 00:50:47 -0700 (PDT)
Date: Thu, 15 May 2025 09:50:44 +0200
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
Message-ID: <5jtjzgfgyjkw5oiofp2npp5zwib4rdp24u6lwmfctvmxo742vz@5wi6latt74lb>
References: <20250512-xattrat-syscall-v5-0-4cd6821e8ff7@kernel.org>
 <20250512-xattrat-syscall-v5-2-4cd6821e8ff7@kernel.org>
 <f700845d-f332-4336-a441-08f98cd7f075@schaufler-ca.com>
 <kgl5h2iruqnhmad65sonlvneu6mdj6jl3sd4aoc3us3lvrgviy@imce27t4nk2e>
 <cb737e58-51ab-4918-b5ba-2c18bf1ad601@schaufler-ca.com>
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
In-Reply-To: <cb737e58-51ab-4918-b5ba-2c18bf1ad601@schaufler-ca.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FvPoF8ief2hjNPl6qTldf6FW3-AbK0akEQFa1sCAOAs_1747295448
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-05-14 11:21:46, Casey Schaufler wrote:
> On 5/14/2025 4:02 AM, Andrey Albershteyn wrote:
> > On 2025-05-12 08:43:32, Casey Schaufler wrote:
> >> On 5/12/2025 6:25 AM, Andrey Albershteyn wrote:
> >>> Introduce new hooks for setting and getting filesystem extended
> >>> attributes on inode (FS_IOC_FSGETXATTR).
> >>>
> >>> Cc: selinux@vger.kernel.org
> >>> Cc: Paul Moore <paul@paul-moore.com>
> >>>
> >>> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> >>> ---
> >>>  fs/file_attr.c                | 19 ++++++++++++++++---
> >>>  include/linux/lsm_hook_defs.h |  2 ++
> >>>  include/linux/security.h      | 16 ++++++++++++++++
> >>>  security/security.c           | 30 ++++++++++++++++++++++++++++++
> >>>  4 files changed, 64 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/fs/file_attr.c b/fs/file_attr.c
> >>> index 2910b7047721..be62d97cc444 100644
> >>> --- a/fs/file_attr.c
> >>> +++ b/fs/file_attr.c
> >>> @@ -76,10 +76,15 @@ EXPORT_SYMBOL(fileattr_fill_flags);
> >>>  int vfs_fileattr_get(struct dentry *dentry, struct fileattr *fa)
> >>>  {
> >>>  	struct inode *inode = d_inode(dentry);
> >>> +	int error;
> >>>  
> >>>  	if (!inode->i_op->fileattr_get)
> >>>  		return -ENOIOCTLCMD;
> >>>  
> >>> +	error = security_inode_file_getattr(dentry, fa);
> >>> +	if (error)
> >>> +		return error;
> >>> +
> >> If you're changing VFS behavior to depend on LSMs supporting the new
> >> hooks I'm concerned about the impact it will have on the LSMs that you
> >> haven't supplied hooks for. Have you tested these changes with anything
> >> besides SELinux?
> > Sorry, this thread is incomplete, I've resent full patchset again.
> > If you have any further comments please comment in that thread [1]
> >
> > I haven't tested with anything except SELinux, but I suppose if
> > module won't register any hooks, then security_inode_file_*() will
> > return 0. Reverting SELinux implementation of the hooks doesn't
> > cause any errors.
> >
> > I'm not that familiar with LSMs/selinux and its codebase, if you can
> > recommend what need to be tested while adding new hooks, I will try
> > to do that for next revision.
> 
> At a minimum the Smack testsuite:
> 	https://github.com/smack-team/smack-testsuite.git
> And the audit suite:
> 	https://github.com/linux-audit/audit-testsuite.git
> 
> AppArmor has a suite as well, but I'm not sure where is resides.

Well, I thought about something more specific, I know about these
testsuites

> 
> My primary concern is that you're making changes that remove existing
> hook calls and add new hook calls without verifying that the protections
> provided by the old calls are always also provided by the new ones.

I'm only adding new hooks, ioctls weren't calling any hooks.

-- 
- Andrey


