Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F83E85C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:33:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472ScH4PqQzF31G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::841; helo=mail-qt1-x841.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="G/LkZ5EF"; 
 dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472SYJ74W9zDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 21:31:16 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id t8so19402854qtc.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 03:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=9SS4b78ehrP4a9/DZbJX4AGCB0l2oYRtncqtM2VcVgs=;
 b=G/LkZ5EFLI13fNYweg2QLrX9wPwyX1HFJIpSnMQHTrMXQvOr8WcBlj7L6PpPDNjdgP
 i5InJ9pIYo4M2+ahXyCmJkm0/aSmAFV1b0ddTRW1LgRG7OVGwCri8wGtJhq7q7n0OHXS
 /62wwsP9sjkBXi1sfsKUBwKdoX3XI/7IX8CepjzvKNmSryJQnKF34LTh2GQ9WhtDP2dt
 IXSVXKbxiNcS5b+rYkiVMk/YKYGmnfMv31SeMxHd7e0Hp2u4HSyq7youtj+T3jqrMDT3
 TABjTwTyDtWr5DElB4lPasN8uyXQjZI6Au4SUlUuoJnmXJBOg31XRn9SRwxaflUvjklQ
 6j8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=9SS4b78ehrP4a9/DZbJX4AGCB0l2oYRtncqtM2VcVgs=;
 b=CNRrp8TkV+WEzf5BLt8fO9EVC4REbUPSNFNsOjWdrlmvRIQSaAXj6Qrzy+MPl86aKu
 a0akaJG1X/l+lHgV3/QEoxh9Pblzu1QCFF+E11pamByBPgHe3kPKD38R7AFTIFGkc4CB
 za+AXXsCEBF3w5rwXu/0ekAqo9SQ76Kkd64llSufwWOyridSa6t+2i9yYdMWwCwoEFX9
 34nng0S3TFB0l4kL5AKYXIiP3E6Fk1iGaOBpN/5io1MzHQFfM/EbUJeolNDGq2gjCmm7
 DqjqmYVSaFMunJWYLBPG7fjgERq3kxzCkuFl7ZCn1WCPMqXBlwxZ5dcoi69lz9XL1qc0
 xm1g==
X-Gm-Message-State: APjAAAXvmLVPiPny8gBzRILgvoBfuo3GjXdGaRWOaAEiAp3dC24fhUGY
 ZpadeKM8F2FcMZ9nWv+3SLqFJw==
X-Google-Smtp-Source: APXvYqxu87KxuRTj39OXWAVjw/WFzSDMbE3Up95oGqmF/PZSf0Vx1vPkAAaomtV6kZQFzmiTSl4zEw==
X-Received: by 2002:a0c:f6d2:: with SMTP id d18mr6856697qvo.155.1572345072935; 
 Tue, 29 Oct 2019 03:31:12 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id t1sm7346140qkm.121.2019.10.29.03.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 03:31:12 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
Date: Tue, 29 Oct 2019 06:31:11 -0400
Message-Id: <B6AAFA3F-745D-48E2-98CC-CFB30934CE39@lca.pw>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
To: Anshuman Khandual <Anshuman.Khandual@arm.com>
X-Mailer: iPhone Mail (17A878)
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
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
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



> On Oct 28, 2019, at 1:29 AM, Anshuman Khandual <Anshuman.Khandual@arm.com>=
 wrote:
>=20
> This adds tests which will validate architecture page table helpers and
> other accessors in their compliance with expected generic MM semantics.
> This will help various architectures in validating changes to existing
> page table helpers or addition of new ones.
>=20
> This test covers basic page table entry transformations including but not
> limited to old, young, dirty, clean, write, write protect etc at various
> level along with populating intermediate entries with next page table page=

> and validating them.
>=20
> Test page table pages are allocated from system memory with required size
> and alignments. The mapped pfns at page table levels are derived from a
> real pfn representing a valid kernel text symbol. This test gets called
> right after page_alloc_init_late().
>=20
> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along wit=
h
> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to=

> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 an=
d
> arm64. Going forward, other architectures too can enable this after fixing=

> build or runtime problems (if any) with their page table helpers.
>=20
> Folks interested in making sure that a given platform's page table helpers=

> conform to expected generic MM semantics should enable the above config
> which will just trigger this test during boot. Any non conformity here wil=
l
> be reported as an warning which would need to be fixed. This test will hel=
p
> catch any changes to the agreed upon semantics expected from generic MM an=
d
> enable platforms to accommodate it thereafter.

This looks like a perfect candidate to streamline with the new kunit framewo=
rk, no?=
