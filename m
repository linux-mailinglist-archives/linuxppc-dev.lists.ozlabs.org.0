Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30114AF2E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 06:50:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486G1F0KqZzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 16:50:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=Hma1sjKp; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Fz83lh0zDqBL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 16:48:35 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id j20so12211256qka.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 21:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
 b=Hma1sjKpCAmCNDeQeafPYa2ae6jBDESB1PCm6wfy4m1d7M9+BWh8FVkywYWY7ykCiy
 SzQx25lgeC+4duHJWx6KqUIh8QXTw8di5MeaGwQuHHn89Nhc7uYjdWvvsMbKeA7vFD83
 eZ0ttxqv+O0UBv0Q1ELfjNP83to7CnSAWkh7s2C27oDB+u7jHIZRBxLZHGidOdsQf1JK
 mEEo4/yiVKjxGyBlmRHpRnDqvkuHhNTxRoPqy1Zumzpfc60DAz3G+S+hPw5+FUChoT/q
 bS0YqS6g/Diq0QYdhlCFXqUUyepH5ufSRHLX0WMtxLjOyn6wC8W9mPq32swU9Z657Mb6
 aYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=LCR4yoPyKXUQ+V6Rzx8Vr1pGJBzG7ybCO5xmGhWVO2E=;
 b=Ir1VGH8qEj8muFPOu+eqPR3flpfy8CHsw5U164OUIlxDW4N5NlYUiz9gChpRMDfQab
 xjrTfDzYMCzY1Bv6BE7fRyokEVQxVaqwMnCLd5BNn5WznPnt18SXW7WYjLv4WjfWtPgX
 mnZEXe9Nlk/g3OTqOgmBjyGoNI/NYUq7aTmkHK7DKrb0/o310G8y9g/PHgr0YbC4n3SH
 krAnZIBHiT/lOs++KbmKSLR7eQ6iXscaLSksvzNJFuk8/GZMcXD5hdtApjtNyiooZR2/
 O0BssJJLOImSSOUv6xwdr5xwhsxp0QmYOYPtwawWPoGT9Dhg9Fq9GassmGt04TaGjabG
 lyUQ==
X-Gm-Message-State: APjAAAWVQ1JRkeNwRe9JJiFAc8ohJEkhrXYafT4jYUYWIJoO4L5oY3io
 nqUppBhYTbZKrP4OBVGq2+CrZg==
X-Google-Smtp-Source: APXvYqwn3oHOOTfkm4bMswvjR/8+st1VKZNpzuQd0q1CmHzfURBt8o3+PL4pjZF1Mk5vBV26vMgvyQ==
X-Received: by 2002:ae9:edc8:: with SMTP id
 c191mr20758894qkg.227.1580190511462; 
 Mon, 27 Jan 2020 21:48:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 8sm11519536qkm.92.2020.01.27.21.48.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 21:48:30 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 00:48:30 -0500
Message-Id: <EE5B936C-121E-4322-A285-603D82D59B3A@lca.pw>
References: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
In-Reply-To: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17C54)
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 27, 2020, at 11:58 PM, Anshuman Khandual <Anshuman.Khandual@arm.com=
> wrote:
>=20
> As I had mentioned before, the test attempts to formalize page table helpe=
r semantics
> as expected from generic MM code paths and intend to catch deviations when=
 enabled on
> a given platform. How else should we test semantics errors otherwise ? The=
re are past
> examples of usefulness for this procedure on arm64 and on s390. I am wonde=
ring how
> else to prove the usefulness of a debug feature if these references are no=
t enough.

Not saying it will not be useful. As you mentioned it actually found a bug o=
r two in the past. The problem is that there is always a cost to maintain so=
mething like this, and nobody knew how things could be broken even for the i=
solated code you mentioned in the future given how complicated the kernel co=
de base is. I am not so positive that many developers would enable this debu=
g feature and use it on a regular basis from the information you gave so far=
.=20

On the other hand, it might just be good at maintaining this thing out of tr=
ee by yourself anyway, because if there isn=E2=80=99t going to be used by ma=
ny developers, few people is going to contribute to this and even noticed wh=
en it is broken. What=E2=80=99s the point of getting this merged apart from b=
eing getting some meaningless credits?=
