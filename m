Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 338FE14B017
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 08:08:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486Hlp6cB2zDqJB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 18:08:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=HLqlIR1y; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486Hjr4NyxzDqJ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 18:07:12 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id c24so9518781qtp.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jan 2020 23:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
 b=HLqlIR1y5B5/PsLNv/5LbKmkRD0LOfvs+3Uw5UFR8XmB3CZjk35sCKEGU7QUrB0DXx
 ro3J8jPDeF5kpX6rK5bqvFjVyygmmBxTqc+U9+GqB6XkJi7vq8NcYRCERMAEMhDVXUCh
 582xGO5f2XyXtpU5uRDgb4Bc99IiX0ZDjMomKpIHbbLRjRqqVt+qwAOuBjm+lP5W2SJ+
 vCTV/46saWz+DSrfHpwXbiE5Bw1kdqVnfBTP+u5/moAx6Z3f1YyRVCqjbBB5F8ReCJuz
 rLNiGsK+2jKaexspyfqYWjO7Gf6gMQ5SLYW8N1k3kz0BSFSsLmhau83aEBKEGep3vOtX
 Tp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=S88X9kdR1m457FxjowRY1cG95Ez9+awfEFeNZBzBj5c=;
 b=SHTBU68H1s0IrahIZyw02t2Ot7JlRwNxPNTbVdmHNSbE548a04Inlz9TmXwhVHp97g
 Jr96yFJCKRKVBK7Ih4g72bYoSUJInp1xM2B/XgN2X7lynRVkLt4w+X9o3K/dlIHMqKG0
 BqekffVC2KSkJ6n2IkfsZc0iTlig54tDPsJC5vqCWvmXNIG5o3/6JjQ1XCDGzRSxdxVq
 /RQ/LbvrXKqFCAEZylU44XTmS+GKbEIpcVo5Ka1dzMUMnuO9Ux1WgGWymcT4CpvWhalJ
 FslBeI8OED09xQJeyAye63sMYQVtmmjZyUPZ1R00Hyrf5Ipy5SlovrgDu7yqL7CD5sZd
 lFhA==
X-Gm-Message-State: APjAAAU+zfDYxPnMzS5W/GTSvzIZk6Sp65B6KJG+3KPEH4+uHId24DY9
 Dc2DRIyKwAoszaat96aD/G31iA==
X-Google-Smtp-Source: APXvYqwjL/tF2WR3QmLuG8LOj7E2zvaXqRI6bLl13yd8OQ3r0ofRKuuNBE3aHo9M+hTpUmSXvKe5+w==
X-Received: by 2002:aed:3fce:: with SMTP id w14mr20841113qth.0.1580195228489; 
 Mon, 27 Jan 2020 23:07:08 -0800 (PST)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q130sm11341027qka.114.2020.01.27.23.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2020 23:07:07 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Date: Tue, 28 Jan 2020 02:07:07 -0500
Message-Id: <C0CC7DB9-5B58-40D3-BE7A-D15B3738C971@lca.pw>
References: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
In-Reply-To: <ba5a836a-b594-f846-1734-71dcd5d089e6@arm.com>
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
 Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
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



> On Jan 28, 2020, at 2:03 AM, Anshuman Khandual <Anshuman.Khandual@arm.com>=
 wrote:
>=20
> 'allyesconfig' makes 'DEBUG_VM =3D y' which in turn will enable 'DEBUG_VM_=
PGTABLE =3D y'
> on platforms that subscribe ARCH_HAS_DEBUG_VM_PGTABLE.

Isn=E2=80=99t that only for compiling testing? Who is booting such a beast a=
nd make sure everything working as expected?=
