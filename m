Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D91154F4D6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 11:44:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45W9cj6p2HzDqf4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 19:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ts6AebvH"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45W9Zt2VX0zDq69
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 19:42:44 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id a93so4181912pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 02:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=9j2IX/8es+MUtSvRFN6FI7AtAfO00jHDIvuYq49EqJ4=;
 b=Ts6AebvHzxuEt7R7gbjgIxoo4iHiicCl3sDn4pN1BZckM0bNb7iQ8db/Rnc5ojI7xK
 Am+VjjmHYsPZbH04bvBDUkevdmvWbmB55qd4JuzFg+Q8g6DWFXiBeRG0YJ8kfK47u1E5
 gCDQyJUhaIPouxgkcfbIzWNh/6fXNX8kqLTqqOF70gPYZfR7sxojn2F2JJpeBIZ+HhWj
 O2dcWwu/QL4xRGvJnSU2bUZjB/JjJXmLYQ7IdYz5WMBhHxfGJeJpBjwg6QhLDy06qTKq
 uDtBFAh4z95tU/HD9nzcWJKhKIH5rtr/zdiK2fZahh/MeJc3voiawu/7zXQTk8tI0Dgv
 QQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=9j2IX/8es+MUtSvRFN6FI7AtAfO00jHDIvuYq49EqJ4=;
 b=bLPSJbdaAW7XxkgHfAC2riudEfupnF5rkAJ1GKySvt7O6tS04BpVnkMKZQ3sXdeKi8
 YNNr16YE+LBDLxJDy6XU0fPxxls21tDrbep+CjYTyMPVhV4aLvnUpWC2vH6TJMzvxGdx
 /Q5Aq3y5ZLyXXrq6qBvnNpaK2ru8EeRJ45zIgpjFMsMdGEI68iA9x9CLFevnkDw3lxHd
 UA8+AqnwHgELFpcT7GnzYGQLNuGUFD1yROkXlgRDUGVxeIuc0PqByRDsy0vy0OBtqNN3
 A64kOUtGJOSyMPNhSXtV78XHeVd/iz9tWGLY30N/yqsurU2a4Xlij+IDxg95C84knMq5
 aiow==
X-Gm-Message-State: APjAAAXhtvzFuJFer6/sCazgP4KPGyoYrcdhTL/9ao0gsuP6Qw5RR6zG
 5WPt2HGTXqFBuC3IjrKrEfQ=
X-Google-Smtp-Source: APXvYqxQoSAjvHvNNS187noku0m+vdYzBFRilcXKyC8mBY29vB2ASuYueJN/FrkjmvvwxZV72kH54g==
X-Received: by 2002:a17:902:5ac4:: with SMTP id
 g4mr60474836plm.80.1561196561489; 
 Sat, 22 Jun 2019 02:42:41 -0700 (PDT)
Received: from localhost ([1.144.215.73])
 by smtp.gmail.com with ESMTPSA id u5sm4782194pgp.19.2019.06.22.02.42.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 02:42:40 -0700 (PDT)
Date: Sat, 22 Jun 2019 19:42:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] mm: Move ioremap page table mapping function to mm/
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <20190610043838.27916-1-npiggin@gmail.com>
 <86991f76-2101-8087-37db-d939d5d744fa@c-s.fr>
 <1560915576.aqf69c3nf8.astroid@bobo.none>
 <7218a243-0d9c-ad90-d409-87663893799e@c-s.fr>
In-Reply-To: <7218a243-0d9c-ad90-d409-87663893799e@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561196381.zbgk3puxhu.astroid@bobo.none>
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

Christophe Leroy's on June 19, 2019 11:18 pm:
>=20
>=20
> Le 19/06/2019 =C3=A0 05:43, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Christophe Leroy's on June 11, 2019 3:24 pm:
>>>
>>>
>>> Le 10/06/2019 =C3=A0 06:38, Nicholas Piggin a =C3=A9crit=C2=A0:
>=20
> [snip]
>=20
>>>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>>>> index 51e131245379..812bea5866d6 100644
>>>> --- a/include/linux/vmalloc.h
>>>> +++ b/include/linux/vmalloc.h
>>>> @@ -147,6 +147,9 @@ extern struct vm_struct *find_vm_area(const void *=
addr);
>>>>    extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
>>>>    			struct page **pages);
>>>>    #ifdef CONFIG_MMU
>>>> +extern int vmap_range(unsigned long addr,
>>>> +		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
>>>> +		       unsigned int max_page_shift);
>>>
>>> Drop extern keyword here.
>>=20
>> I don't know if I was going crazy but at one point I was getting
>> duplicate symbol errors that were fixed by adding extern somewhere.
>=20
> probably not on a function name ...

I know it sounds crazy :P

>>> As checkpatch tells you, 'CHECK:AVOID_EXTERNS: extern prototypes should
>>> be avoided in .h files'
>>=20
>> I prefer to follow existing style in surrounding code at the expense
>> of some checkpatch warnings. If somebody later wants to "fix" it
>> that's fine.
>=20
> I don't think that's fine to 'fix' later things that could be done right=20
> from the begining. 'Cosmetic only' fixes never happen because they are a=20
> nightmare for backports, and a shame for 'git blame'.
>=20
> In some patches, you add cleanups to make the code look nicer, and here=20
> you have the opportunity to make the code nice from the begining and you=20
> prefer repeating the errors done in the past ? You're surprising me.

Well I never claimed to be consistent. I actually don't mind the
extern keyword so it's probably just my personal preference that
makes me notice something nearby. I have dropped those "cleanup"
changes though, so there.

Thanks,
Nick
=
