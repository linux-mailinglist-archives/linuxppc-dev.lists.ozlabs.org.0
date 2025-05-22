Return-Path: <linuxppc-dev+bounces-8878-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB291AC16A6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 00:26:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3NDN2GmTz2yVP;
	Fri, 23 May 2025 08:26:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f30"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747952772;
	cv=none; b=avqy9szY6VKBk39X6yYe4ojvhDx7/Gmqs4jaqid0CTELdzJDta31oS2WwTh0kG/ehb4T9JnNntSeizSlIIZlimD47HuRFT5ImWEoTx31gNJasiIN8gZnvOxmjatm0vsCe7Cjsv4gyUqrXqhavpcQtMg4SJD3za4BRkASk+3HqrAQWetahZIFJbw5p0HfH3XOSZbuu8q71FxCdNxdEw/J7C4zY9mWiPC5BgBSNyYJNkLE6e1yzn0v1TbQ9uHBIDEBa2k62t7R5j1J2qmyudclUaohYhWs06fDcZXthBJU3nMlYV7MHX4/NEkk98UyParQ059sIfWmsZq4oeNdeAeDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747952772; c=relaxed/relaxed;
	bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=iowns7qRSPIaYyFTRJxSci1sp/NpsTf11F+1ShqDhwRPbEiCM0ntWIpA8XBQBw86Pe+5P39SWBaZnW1J0kh4MPHE6phOBQsVJcUuFU1/Sp6+EJLHGMDAsPbT2zHaLRxiXKLYSwjGjcYq8GpQoTPGWaNA31gYM9MvxC980weGog/Pgw3blcbGso7HtD4awy4rMf9ssaVylc2i+3AWLf5Szw2nu9VxgfkDxGywDNFNw3dVI2NJy2r9RvkQsnAlZ3yXSDj4WthDGJ5YTNsENk49Yy+AWQjisyLbcftzV9gxm/vr01qMx1gf9Q7W3BsUoaay2DNa2wm2bgvo9aKIIBN6Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=TKOkWmZo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org) smtp.mailfrom=paul-moore.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=TKOkWmZo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=paul-moore.com (client-ip=2607:f8b0:4864:20::f30; helo=mail-qv1-xf30.google.com; envelope-from=paul@paul-moore.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3NDM13q2z2yNG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 May 2025 08:26:10 +1000 (AEST)
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6fa8eca392dso9928726d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952767; x=1748557567; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=TKOkWmZo25Cfp+K4ovfZzCpdGYLBRQyg+zEAa4fmaMl8Oc6KPWP+NVY+0lLAYrKSyj
         LeHkB9YokTaCjPc0tMQJ6gBGQe0TEQa+t01v8SRgkjFQAfv75fRalT+jvgCvPfympy82
         pUXt7qAhPRRRBlZcKrnrIlr78rK+MueMtxL+QZEriL5PqAHEgjK1oV+ySntk/PS+rrFU
         BAlhTn0T+PntIMZcj+w8WujYD0IFFxkb49EFhg6ame78C+b8YdKopyyTH9D4jcLlZR6J
         UOReac7s6EoV0DGUG7lilGwKz6BsvbbsRAdAmhfHhs4gQIOAmzg0v5t5LVV/5o4RRHC7
         bfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952767; x=1748557567;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=PhpEWsPe0iOBrvYl1gBsAu1wT0wDtt4k+NHWeYCvs6f/23CXufWs1YtGctNaoxfzSl
         QauyI2YP51N5msrt+Bsw/rP2vFoLuu07XPhj2i0qMy704YElJszmZFwhmEVUMSEhQxxS
         RFi6xCccdyEXfrWlwtY+iZBhi3hnJWZAUks9d1B5Elf2rQZqnFN73UHqzfdcaQPnwj9Z
         xFYya1cOzwv/Uo9xr9Qea+LKXbjGrpLsCv9epxscKsTE7IDODloEyZxGKyoUoZLBphjz
         /Kgaa5DpQVLHop9dvd7WczMrufx/rlLqacoxLDn2CIvcVlQ9j4LRgVqc4kfFk4OmyWqt
         /CHw==
X-Forwarded-Encrypted: i=1; AJvYcCWniJY2n9t7O/DRaAyTGVXkVx8OH3+Ur57EcxEC/0EXFYQqGJoLlLpcm5DUbYD4HLhep3C/x8GA3CfUA2E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwiMzJrxfElOIMrO8XwV5q5smPHYxuSxZHd3924lZJT5K3EUgJI
	+vUZjGU0KNDv/28tDDaqC+1wRAS8n9sSBcFFoBTMkoYlhcQAGMLwXoKsAhE+BlvMlQ==
X-Gm-Gg: ASbGncv5rJhAPShamEoIbo7b3u5wuwjuSBJhNozmDJtof1HswIYnHTUOH7FvWKkIo9S
	du9adlfeO9gEnsqRR6Ne9yk580XXJiUoe64dgGEmhXjYz/j5OrqX1elfAXC0N+zD500D2nsoRCq
	tbPpjDgwaAOKDw+zqEVWXL3l9CeJqVTsG7ZYkfJeJXy7JpzuiWywjp7NeuvIzoZP7DAcvyJiIye
	SlisV2egO3UoxXgP7KbwD00XXH6Vm0DCUuAW8jGS3mjgIdRS4geh2T8lGyKqqb/onsTVO3vC1ls
	m4lBF6Vpqj74oKh+yzKtDU+yTgGAtlkGg8N73Uy5aU+/q3fCDhHwSBu5iJUJbCPZ+ri1uKHfAL7
	jl6oynL9vf/8/PUzIarCz
X-Google-Smtp-Source: AGHT+IE2zN7SH+0SaGrs2tzepSFkLMKNXBgIbbn8M9DQcRbDJBs1dDzlx85ZuSxbIPErdUE31K4qXg==
X-Received: by 2002:a05:6214:1947:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6f8b0829131mr503375636d6.25.1747952766984;
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0987259sm105076766d6.120.2025.05.22.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:05 -0400
Message-ID: <0bb73a49ccbc93e90ea87c0dbb4097ae@paul-moore.com>
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
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250522_1740/pstg-lib:20250522_1730/pstg-pwork:20250522_1740
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
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode  fsxattr
References: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
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

The only thing that gives me a slight pause is that on a set operation
we are going to hit both the get and set LSM hooks, but since the code
does call into the getter on a set operation this is arguably the right
thing.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com

