Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EA74B083
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 05:50:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45T9vM32HjzDqgq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 13:50:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tC1fzbkL"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45T9sS59LPzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 13:48:28 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t16so8865671pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 20:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=X6XTYsovFVueps9eDYXkESbdVwlOJdDMq7uOuCJqwXc=;
 b=tC1fzbkLO4VEb2uG5tpdzpdcGioSEyum/AxMt7rl3u+3W+pwVWz0ir6DqBvt7Sx/pi
 1WlaAg652y+gLKabGhhaJdZC5Xkwvz6PbaHrbWWyz/xljVyoCpISGt95eX7YZTobS1J6
 hwD6aFs6efu0dM1kesEHSloRI9DM5Ny9A+zFW3syvgakwqh6mAX9NzBVCLWSYe6nHfv3
 3xrcez+XQj8IXjVXr74e0U1ufVVsSBKn0K8lBSZjsUxEHztCH5pfIEbRUm8GFCDuTKes
 ZnxHyzQ92i2RQOPqavK4WLESBq1uTY1GCjHjaQDK682QCK2m2V311Qtx8nHh8LNJW9VG
 0PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=X6XTYsovFVueps9eDYXkESbdVwlOJdDMq7uOuCJqwXc=;
 b=fBXTpKKWQizSbIRM1CAuoQIz8O+NM+eM+3KTochQZ6bJlDL3zx80Mw+/DozFEEJDue
 ldY2ql69soS4LvdeiCF1URhLJLYxJC5IARDMQF5UquuYP8MaJcpcbtPiyWUFiAuBRdOH
 kw8MDw2B6vPRsNw3cb5mQqWZJAkjqiC0uaEmyZxtPEiZrXV81Pbo6G49Dc9Hs4MLCjjw
 T7PkPMEhleRH5awOo0rquzuAM7a4XmnINJbFoT/tTxAsIXTvwUeJMPkRS2xcqlSW+b0B
 QezSj1n8v5Yi7w4GGtG/bVUkh0TqkUDwPptfTkv1yg+pjlv6YwMy1M1gMyFAf5hkC6xW
 Vl/w==
X-Gm-Message-State: APjAAAU3KblvQNSHYLia0F8Z0APmsZRhg0NfpTvosWJngtLQQ5RvcaUa
 H7ZdVFlRURWAYvIRClNXeoI=
X-Google-Smtp-Source: APXvYqxdJiQO254qpFiGA9nxIIwq5CyEWTUc2NnUWtayrZavFfK006a2p6VEwiUzEdlEmOggvyLlnA==
X-Received: by 2002:a63:2b57:: with SMTP id r84mr378763pgr.282.1560916105203; 
 Tue, 18 Jun 2019 20:48:25 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id s15sm20952137pfd.183.2019.06.18.20.48.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 20:48:24 -0700 (PDT)
Date: Wed, 19 Jun 2019 13:43:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <86991f76-2101-8087-37db-d939d5d744fa@c-s.fr>
In-Reply-To: <86991f76-2101-8087-37db-d939d5d744fa@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560915576.aqf69c3nf8.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on June 11, 2019 3:24 pm:
>=20
>=20
> Le 10/06/2019 =C3=A0 06:38, Nicholas Piggin a =C3=A9crit=C2=A0:
>> ioremap_page_range is a generic function to create a kernel virtual
>> mapping, move it to mm/vmalloc.c and rename it vmap_range.
>>=20
>> For clarity with this move, also:
>> - Rename vunmap_page_range (vmap_range's inverse) to vunmap_range.
>> - Rename vmap_page_range (which takes a page array) to vmap_pages.
>=20
> Maybe it would be easier to follow the change if the name change was=20
> done in another patch than the move.

I could do that.

>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> Fixed up the arm64 compile errors, fixed a few bugs, and tidied
>> things up a bit more.
>>=20
>> Have tested powerpc and x86 but not arm64, would appreciate a review
>> and test of the arm64 patch if possible.
>>=20
>>   include/linux/vmalloc.h |   3 +
>>   lib/ioremap.c           | 173 +++---------------------------
>>   mm/vmalloc.c            | 228 ++++++++++++++++++++++++++++++++++++----
>>   3 files changed, 229 insertions(+), 175 deletions(-)
>>=20
>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>> index 51e131245379..812bea5866d6 100644
>> --- a/include/linux/vmalloc.h
>> +++ b/include/linux/vmalloc.h
>> @@ -147,6 +147,9 @@ extern struct vm_struct *find_vm_area(const void *ad=
dr);
>>   extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
>>   			struct page **pages);
>>   #ifdef CONFIG_MMU
>> +extern int vmap_range(unsigned long addr,
>> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
>> +		       unsigned int max_page_shift);
>=20
> Drop extern keyword here.

I don't know if I was going crazy but at one point I was getting
duplicate symbol errors that were fixed by adding extern somewhere.
Maybe sleep depravation. However...

> As checkpatch tells you, 'CHECK:AVOID_EXTERNS: extern prototypes should=20
> be avoided in .h files'

I prefer to follow existing style in surrounding code at the expense
of some checkpatch warnings. If somebody later wants to "fix" it
that's fine.

Thanks,
Nick

=
