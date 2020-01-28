Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6D114B43D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 13:34:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Qzr3T1gzDqLK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 23:34:48 +1100 (AEDT)
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
 header.s=google header.b=Rbz1P8X1; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Qth4rfYzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 23:30:19 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id w15so11389881qkf.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 04:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :cc:to; bh=8GwDVchQDE0RRDd6Z1x4gzFv6pXtLF378PeW6dBbf+w=;
 b=Rbz1P8X1bfckF8p5+fQPfltDNpYpc5sp5fHqq9u1T5/uhK6rRW78SfwJEw2v28znfV
 wPfmUeOnrz7CBbeIgQixtLq2TPQmdgtO1vVi6z9urV65HN1x4ZK0nWUORD8codoMVkS8
 rPApC12IYdkgP3grHEjFihd/Jh4OgeLy2QqFihiQOoNERJPGlH4ggjAY8evnQXoqrTaN
 KqoP6/pkU7BjH0xE18gbhqENWpt3g5gz/4WQxHhB9FaTgVokGRGk0m2PJgFNbLse/V1Q
 DUm5C86KbFXNmme7COzfebOm4aubFGvujqheNY2AxjxXyz7y4nv8h1Ou8ChS1lBEdbUk
 SJNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:cc:to;
 bh=8GwDVchQDE0RRDd6Z1x4gzFv6pXtLF378PeW6dBbf+w=;
 b=LWb3Irfzdo/zMD+tQxvEaYmomOuic5+sNy51zkoN7qYVBcWJRNozQgRwPfpD3MEJ4d
 Xf9kFjDJhQH4c1ZLGCd8DF3qoHY3ztJTWnoX7FzTe7jSLb1h3/hhUehBQpFiDkkCxUEu
 CVbF4qB8ugT0GeBjYpKWyBZFbb15rPevHGjTF6fks1fZC0AEbEitUqtYMaXWaw/1E9PY
 SjrBSueyVw91iRs+8e3dzyxJqy4dZVLDSt3EZCuam0mLNd5EX1tdNpAd53spNZLN7hf3
 4ljXdVvkoq5W5jn5/qFXya7DblCgXKjwJsPpeIxvinP785nDwJfbM4AeduNc4UPeyYTa
 U1mA==
X-Gm-Message-State: APjAAAXSE7NxpZjM7E2l6+Z5u5CKcqZcHGY7AeQ+QeCs7z8YGMo3WzBK
 f0JFnH0p33tJNHHRb7RZEHO76w==
X-Google-Smtp-Source: APXvYqw4NHHH616JlS/IrWEyv4wSaDB7EoG4ap5GXk6Z++ZZIlsdVUcHztpJPWJHmyylARL29R+hpQ==
X-Received: by 2002:a37:9ce:: with SMTP id 197mr22314564qkj.194.1580214614838; 
 Tue, 28 Jan 2020 04:30:14 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id 69sm11862264qkk.106.2020.01.28.04.30.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2020 04:30:14 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Date: Tue, 28 Jan 2020 07:30:13 -0500
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Message-Id: <0C97A195-CBF2-43EF-88A0-7683BB9EF892@lca.pw>
To: Mike Rapoport <rppt@linux.ibm.com>
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
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
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



> On Jan 28, 2020, at 7:10 AM, Mike Rapoport <rppt@linux.ibm.com> wrote:
>=20
> Aren't x86 and arm64 not decent enough?
> Even if this test could be used to detect regressions only on these two
> platforms, the test is valuable.

The question is does it detect regressions good enough? Where is the list of=
 past bugs that it had found?

It is an usual deal for unproven debugging features remain out of tree first=
 and keep gathering unique bugs it found and then justify for a mainline inc=
lusion with enough data.=
