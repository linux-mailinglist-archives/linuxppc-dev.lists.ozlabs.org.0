Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5D14FCE8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 12:29:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489TJ05jFrzDqTm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 22:29:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=ktqi1Si5; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 489TDr6ZlJzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 22:26:35 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id u19so3750179qku.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Feb 2020 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
 b=ktqi1Si5IANgowqGSuWt2goxaefj9MArH9hBL4drDxYpQy5gO9eIMpaj4x1g9qz0Ft
 wJg8PZziG/0FMCaYMFvU0R1ed/sRIgt60RVYo/fiPoIuWPHtw5CoKADSbrdPinp59eNX
 GqmqoNXOemL5q0rosXYIx2UJ1orNdlYcFK73Ygg0a/RE2arXPeSnjr+QO/TuQNX54JbP
 bi9ii20//c0h4YooeibM3yZGm2vZjIxTdT2q1agyMmadm90FFuyO+OFJ2urFPdZeXwtw
 AgKWNyLv5Arxyw8debfI90Lt1gaaDIBA8bYeatlKiESPBREuLesS3poug3ybj8+iH21/
 Psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=haUAAZdbmdU3COyJ/sqnDbNti6tUXhiH5WpEb5CUu3o=;
 b=fmRifeFleY9C5qpryeg5qa7OBR03O+gMp1khWY8yWVyNV1PW8Z7OQsapknbSgbIrjk
 oCOyepDnPmgq1SdYqNiCzyOVTV6LmkL5ktHl4UHLMM8nrfeOEBO1s0+34CdhrAcdu8Nc
 isU93HFFWAWQMrb6e6ByaQlpKzVo8oEF7UgV6MpJccEPdQJ6qqk+4oEUBUduyHQdgsIL
 SNuGLUF/4tHLbTXo7xaksW2Moha+nZap98+XcwXfbzjNw1bXiwRkecQoj97rvIb/Mz9C
 6wVO/4uVt3RI1i9TOGPLLMfzzaemVfTjbar3Zvl0UAwLRvr2QoxYGi3SK2OL4faQd8mW
 qLHA==
X-Gm-Message-State: APjAAAWXK5A6642Zkz8+GicEUOc/mY3Gt1V/9C66wYqZDRyKIL002XbJ
 ZRftAJcdgsB3T2fbC1WSV16Fgw==
X-Google-Smtp-Source: APXvYqz2LMXXgwCpUXH7EnnO/Ck2Cj8Gc2SWzAj6pxocjOsHmdsAhT1kwXiGUD+liMIX2mq/rCkMKw==
X-Received: by 2002:a05:620a:218d:: with SMTP id
 g13mr19497581qka.286.1580642791619; 
 Sun, 02 Feb 2020 03:26:31 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id s1sm7274932qkm.84.2020.02.02.03.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Feb 2020 03:26:30 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Sun, 2 Feb 2020 06:26:29 -0500
Message-Id: <2C4ADFAE-7BB4-42B7-8F54-F036EA7A4316@lca.pw>
References: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
In-Reply-To: <473d8198-3ac4-af3b-e2ec-c0698a3565d3@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 kasan-dev <kasan-dev@googlegroups.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 30, 2020, at 9:13 AM, Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
>=20
> config DEBUG_VM_PGTABLE
>    bool "Debug arch page table for semantics compliance" if ARCH_HAS_DEBUG=
_VM_PGTABLE || EXPERT
>    depends on MMU
>    default 'n' if !ARCH_HAS_DEBUG_VM_PGTABLE
>    default 'y' if DEBUG_VM

Does it really necessary to potentially force all bots to run this? Syzbot, k=
ernel test robot etc? Does it ever pay off for all their machine times there=
?=
