Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F52F2CE176
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 23:15:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cn9CG1szmzDrGv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 09:15:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UPHGqln5; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cn98x4bdwzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 09:13:53 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id p6so1952201plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Dec 2020 14:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eEmxf4uLm5+F9e4VAD5l7evhNTpueoEKmJf7NHBSgF8=;
 b=UPHGqln5b2MVwkQJ9DPW4W+c/WOYPO4pDdYgSkuUBuPAEool6k1o9tCh15tbT9uHrK
 Att6CPPLElr2Kizx6k8SBYlHiYybik+D2pHNYrEi6lvIa/OVMCqcofSbjZiFQCWNagWm
 gpfCcQKaP4yJ2ZfKAd6w0i3b/1ey0c1DO4esRuIh3lZT4EjH/cz8VKCKfqyuShuaeYhd
 x0YLD40CLwN02ITpU2TIn1dchmgPuXgxg9Hw3uQ8i6iktCUFcnDMyR1iVOdnAXdjnV9J
 dlREfCYAI47ZTNuw4m686ZqB4sYG5SbZx+ElCOdLB971GcExKVCtR58og1IlVpDkeiRG
 GVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eEmxf4uLm5+F9e4VAD5l7evhNTpueoEKmJf7NHBSgF8=;
 b=s87RO74ifr+e8vQyX17tv4n596vVYVq2pGSuNNzNww6nJdPj0rmiAJAmXy2GKwpGKZ
 IX3olixcxAN6O4qkRb0VNDlVe/mkNom3/CI1sZ+F6K8Tt63ULo35yrFna3RwkncxL1tP
 Uq7jjhyarpIi5olk6pox/i1p/bFEIH3yZBS887VXljZvnPRXVq6LyAhpx+7rqbvwHf7Z
 UIyCs6nzO+rkkEtx+lhccENWuPEl6EfYnWNN1W+4LE2W7/QGkbdZItX72XbDp2NQKFWY
 2RQxfUgaXWdpJlip8vEEgZTcpPPMRLlFGjTL5+8Lb3ZNSEOdBZLbLomWDNXEKYvRD7cQ
 YNUQ==
X-Gm-Message-State: AOAM533NgT/H8qRAFfpo4IXwJReQzL0Yp50Eeo46G8Hn65a0n5D+GJpd
 YHgC7EKSDfhP69Rep45e3yY=
X-Google-Smtp-Source: ABdhPJz9kr0b40p8QhJurdR1DemR7fcJ+w7w3vdRbJJ4sHZwhGLmJpARUd3RcgIEF27oxEAuC/OzQg==
X-Received: by 2002:a17:90a:d308:: with SMTP id
 p8mr1145716pju.110.1607033630047; 
 Thu, 03 Dec 2020 14:13:50 -0800 (PST)
Received: from localhost ([2001:8004:1480:55d9:df22:9c5d:bdf7:7c2b])
 by smtp.gmail.com with ESMTPSA id kb12sm318120pjb.2.2020.12.03.14.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 14:13:49 -0800 (PST)
Date: Fri, 04 Dec 2020 08:13:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [MOCKUP] x86/mm: Lightweight lazy mm refcounting
To: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <7c4bcc0a464ca60be1e0aeba805a192be0ee81e5.1606972194.git.luto@kernel.org>
 <20201203084448.GF2414@hirez.programming.kicks-ass.net>
In-Reply-To: <20201203084448.GF2414@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Message-Id: <1607033145.hcppy9ndl4.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux-MM <linux-mm@kvack.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Rik van Riel <riel@surriel.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Peter Zijlstra's message of December 3, 2020 6:44 pm:
> On Wed, Dec 02, 2020 at 09:25:51PM -0800, Andy Lutomirski wrote:
>=20
>> power: same as ARM, except that the loop may be rather larger since
>> the systems are bigger.  But I imagine it's still faster than Nick's
>> approach -- a cmpxchg to a remote cacheline should still be faster than
>> an IPI shootdown.=20
>=20
> While a single atomic might be cheaper than an IPI, the comparison
> doesn't work out nicely. You do the xchg() on every unlazy, while the
> IPI would be once per process exit.
>=20
> So over the life of the process, it might do very many unlazies, adding
> up to a total cost far in excess of what the single IPI would've been.

Yeah this is the concern, I looked at things that add cost to the
idle switch code and it gets hard to justify the scalability improvement
when you slow these fundmaental things down even a bit.

I still think working on the assumption that IPIs =3D scary expensive=20
might not be correct. An IPI itself is, but you only issue them when=20
you've left a lazy mm on another CPU which just isn't that often.

Thanks,
Nick
