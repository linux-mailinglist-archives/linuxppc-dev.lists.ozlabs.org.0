Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C3614C0A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 20:09:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486bkg0xjnzDqKW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=rZzl+qEA; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486bhh2H2JzDqHl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 06:07:15 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id e25so11133447qtr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
 b=rZzl+qEAYLTBtMp9ssPK9Ejc0IQXfIjcMlCwc8RZJ/Poapm8WZnOmSKjpPGU/CRTsz
 s49j6egQsNv+bATXo82MSoiXpQi3N3QHvgnyq6VfzcooOemBU6djud+xflwQG7RGqoPc
 L5M9+QbKcXOUUg0U09rJgFyuy4M0BvZq0fS3S49pfbq8xDC/uRvuAV9T3NJ2dNoyS3t+
 r0VLb2Wpo+pntt9bwsRP15mZe1cOZg5vc4u8F4VRwv/pqDLOhfKGv0d7nyNY7llsOI2p
 sOz+jYkbLFQ6oe89WgJeyG/Pa023GcDt5lsRxS1gRMmySONFqvaE1MUA5AHjPWyKvzIK
 /yww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ZSIv5JurPysNixS3YWSkJ+cqh/2vHLB/JAVHcGR/4Zo=;
 b=FMVdJCfyE8E2koPTb3CEztZnJnegyKsNGys7AFhuKP4nqhPZ6VJQ/dEl4tjA6BR5c4
 pZZpWnoI/Cksp8ArFzkrbsTqHi3DTEVM5XKa5BHJvkqJ2iajsKcUOHGI3aL2d/sJAIOM
 f/qdHexK/nZVi3OR5EV1LOoBjP0yZ7CG6kCAWPx2ftwYB7uDXf2K6B1cahgnlXizN4/u
 2xMALxYDbqym+iJmD4Nndm5ytKAbef4/AsFImOrZ/f8dxlPkX+NNw1s+OG1otDGCKvJD
 DrsVHc/Ezw9LT/6rXkwM/wOyLTRlJpdGzmmG4ez8C8gdW9MEQ/gyXetgFVCWvS3FbvmE
 5BJQ==
X-Gm-Message-State: APjAAAVgYHtPzl35uvVsPUIpcNIOJEN45oLD0a6eZQ7aC1wNgFNzyDgo
 TLL+0qPh/zDMcXY5gWHI2+PJKw==
X-Google-Smtp-Source: APXvYqwfcEAdtsZ+rCamZtj0MvoXkHQbqikImH2K21Z7lN9o0ZlEjUgJncOajxaQBGEujZOyMJYZkQ==
X-Received: by 2002:ac8:2b86:: with SMTP id m6mr23384923qtm.190.1580238432152; 
 Tue, 28 Jan 2020 11:07:12 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id f7sm13273329qtp.86.2020.01.28.11.07.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 11:07:10 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 14:07:10 -0500
Message-Id: <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
In-Reply-To: <20200128174709.GK655507@arrakis.emea.arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
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
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Dan Williams <dan.j.williams@intel.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jan 28, 2020, at 12:47 PM, Catalin Marinas <catalin.marinas@arm.com> wr=
ote:
>=20
> The primary goal here is not finding regressions but having clearly
> defined semantics of the page table accessors across architectures. x86
> and arm64 are a good starting point and other architectures will be
> enabled as they are aligned to the same semantics.

This still does not answer the fundamental question. If this test is simply i=
nefficient to find bugs, who wants to spend time to use it regularly?  If th=
is is just one off test that may get running once in a few years (when intro=
ducing a new arch), how does it justify the ongoing cost to maintain it?

I do agree there could be a need to clearly define this thing but that belon=
gs to documentation rather than testing purpose. It is confusing to mix this=
 with other config options which have somewhat a different purpose, it will t=
hen be a waste of time for people who mistakenly enable this for regular aut=
omatic testing and never found any bug from it.=
