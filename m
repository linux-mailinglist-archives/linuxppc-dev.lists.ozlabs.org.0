Return-Path: <linuxppc-dev+bounces-203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D08E957E0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 08:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnzyN5tC1z2xdp;
	Tue, 20 Aug 2024 16:26:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ZDNcrElU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WnzyM0Wlfz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 16:26:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724135209;
	bh=EFXLGZEJkQUFQN28krLsjRFbPfS1YdUIsO6keM3oM8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZDNcrElUZ2xY3s8w2eLhoYpi2YViK/FMkN+ADmqFd+TanHYCabHsCvxKxJDrMJmQ3
	 PALcnEi8+N6YuFVo/NT9ULv1COUzAljpcuypZ5EsiRuQHXj0Y4ejCBMJvxI3/YPw22
	 Cx1ZzVd1bkUvMnEHpxzGLiv+yEvYtXyS5Oje/tUckPFLL9zIPpyvzxzVgz2GUBwZ3N
	 6mpBsvhBFEiLa9uIceT/jTftvX4piUfkdT2doVoBbq3BLaEwDAGmCQLSZo7ixVG2WD
	 U/UKzAas2jHBiOPL5qaZxuF4uBCF+93ttNCAf/R7WStVDr/gZVSeIwEjWOctOtHn7y
	 lqUl+TYJ99dZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WnzyD15rhz4wd6;
	Tue, 20 Aug 2024 16:26:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain
 <bcain@quicinc.com>, Dinh Nguyen <dinguyen@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 akpm@linux-foundation.org, christophe.leroy@csgroup.eu, jeffxu@google.com,
 Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 oliver.sang@intel.com, pedro.falcato@gmail.com,
 linux-um@lists.infradead.org, linux-csky@vger.kernel.org, linux-hexagon
 <linux-hexagon@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
In-Reply-To: <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
 <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X>
 <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
Date: Tue, 20 Aug 2024 16:26:43 +1000
Message-ID: <87y14rso9o.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Mon, 19 Aug 2024 at 13:15, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Ok, I did a quick hack-job to remove that disgusting
>> install_special_mapping() legacy case.
>>
>> With this [..]
>
> I forgot to actually attach that "this". Here it is. For real, this time.
>
>                    Linus
>  arch/csky/kernel/vdso.c            | 28 +++++++++++++++++++++-------
>  arch/hexagon/kernel/vdso.c         | 14 ++++++++++----
>  arch/nios2/mm/init.c               | 12 ++++++++----
>  arch/sh/kernel/vsyscall/vsyscall.c | 14 +++++++++++---
>  arch/x86/um/vdso/vma.c             | 12 ++++++++----
>  include/linux/mm.h                 |  4 ----
>  mm/mmap.c                          | 32 +++++---------------------------
>  7 files changed, 63 insertions(+), 53 deletions(-)
>
...
> index 1bd85a6949c4..5e68ab7a8898 100644
> --- a/arch/sh/kernel/vsyscall/vsyscall.c
> +++ b/arch/sh/kernel/vsyscall/vsyscall.c
> @@ -36,6 +36,10 @@ __setup("vdso=", vdso_setup);
>   */
>  extern const char vsyscall_trapa_start, vsyscall_trapa_end;
>  static struct page *syscall_pages[1];
> +static struct vm_special_mapping vdso_mapping = {
> +	.name = "[vdso]",
> +	.pages = syscall_pages;
                              ^
                              should be ,
> +};

cheers

