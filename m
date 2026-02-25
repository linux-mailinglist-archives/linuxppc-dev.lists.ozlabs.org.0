Return-Path: <linuxppc-dev+bounces-17201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILU4Gm00n2m5ZQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17201-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:42:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D2919BB2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 18:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLhjj55cFz3fBH;
	Thu, 26 Feb 2026 04:42:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772041321;
	cv=none; b=YY1+PASTXwkdHV4h3FUowXevi3jO3uCwR9Q/9jgRy5wEUADAQdMYL5dl6R4RnaUMHZrYcTri13zOTnm/Vi/d/AY8O4QTG+5WRuGwNz2/CYy1l9aJE6JkdShVEZR41XEEwiaUhktSoH4F/ma0sx0dub1O5eQPDemI5CYFOwYn2yyR6ztf+bHJIO89ea9umAR6hFT4/u8O+x7s/iFac5OA/EE0sYT4bIMMvFrbnakOyOJnIGF7biQEhUoF0LifEvARHaH6faqNP8EJE2epRH6eiMHcdv+TJLT6CiKfgBzOKqvYuxiUtFPYcUg2s0tmoKRJNzlFFWqiVqO2BUNMCK7+cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772041321; c=relaxed/relaxed;
	bh=aMnEPXSeAknTUn6pBGQAEqhzdOlacieP4zL+mwxArg0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=R1ZEsT7M0mrRghAISys5AOcXQ0IiduwCMH16g5L+nLFxzdufibai9ogUlew6l3ZZLh6muim2Nr9ME9I4CNwhhWVca9cEJZrYdq7QQk9EP4ShME0D4o+s0/iiIfCqteU8FhFT07KmJL0qM9LGku+T1ZH714RVwOqi1ldJs65exKxLwHp7QdA1+Kw1zFjoACwm86n/6Bu4qnGXvDVXcWKIoIQMGjblBksvhp5y3iBFXYixkxuXMZhVrdjtDu9U8RlHolccNfHn4ZXwTPS0+J2Y7yXM51ou+2CYIcDP0FksMWoe7xxTro5eTgV4QEt062FOtf/81Ox+12A6hlAxtF6yBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqP5VVaM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KqP5VVaM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLhjh4Qw0z3f96
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 04:41:59 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-824a829f9bbso30062b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 09:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772041318; x=1772646118; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMnEPXSeAknTUn6pBGQAEqhzdOlacieP4zL+mwxArg0=;
        b=KqP5VVaMHDumbep9lsTdWIVCujLqIZ/plWue7weRl+r3aqO/jookHEakvJKx+Iop5r
         0IMPmVWmLyHW959QNMvXn9by88YyjhdcM6KkEVbuu5yMI1QOrxfJpfziYyJyJK1v+QgS
         2WlZ9mnVwDBA+EAMJ1VWlh4sJDftDmuMB0WsCRk1Z56ZfbtIR2MYZxpLxZrdyNcXuVMS
         YdDGawpqFtU8pzou5wT1K0sjefJxy+aUbmZuc3q1+Lz7qCfzk4L/mn+lD8lMyD+4Ke4Q
         HYSPHxfUIsSd8wIiTD9jigedfk84gzvoe5nideyzVx84f6VGgWYorHJYOYMTgwvL0eCZ
         k65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772041318; x=1772646118;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMnEPXSeAknTUn6pBGQAEqhzdOlacieP4zL+mwxArg0=;
        b=kJfSW2qi9UixVGPhsZogVgN46OEZRhMZ2P4el0imeWAfaYnBCkTj3GycAf/iPq9QDn
         FuqRLARXGrF68NWveyFSZH7siCocBWvgA+jQRAeEbX78W6vZIzXK5J38VtvBryolgsqk
         B0BU9oFk95udk1vhLoBmcTHSp5JNlsoSlsBPdq/zWr5RvbTsf22AF0M8P0gCPzke4DsD
         MyM1fpfbeTmnm1V0QuPCHXYZBr77ntWlxOhMdSgyehYLHr2rQnj/MPbWNrrEZ8P3dpgL
         R/s0UAMxK/ic2DaxMU6A7m2Ai5WCEeNgSNymn0Qkwp1HEnGRA+6mbBWncOkwp210aRIt
         yurw==
X-Forwarded-Encrypted: i=1; AJvYcCUrSS1C0YSKZJdu/xhYE6Wh8JjCcuo5m2eCEvVeF7tfEWcEIHA9g4ebNvvJS/WAHce5tMX6Qia8oo2iXfI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysYkfeyvh4nhLeEca3J5LTMEgr/C+mT+eD5AHE+cGmfnnOf5yC
	OzqPGVNvmTESgncWebqw4YGh11wYY+yceOAjQUhUxjQQbnY+G3xgxnEt
X-Gm-Gg: ATEYQzwnirK8DzuS4/GTegcHmTZN7LowEP7Egyr1MAukjS7T/q1s4D1LzcK7myy8fvn
	2es/3tgA+XVl7LgX5rVbEKQ3ONfZ07/fwAFfDrgP5Rx+d/tN4xAuDOcU5R5xQAbh/9yz7mDY5/R
	dPiGpXYkn67CdyjQ1+LkD24Jkb2TNlku3BJOzPRf1H5xKZrohAOXoapY2A+OEjsFJW9SDlGv8w8
	4pYaPL2ZKQrjdNAVnZHUoJVpUkDkyQ6TyXXVpG95tRyFs/qH0Xd60STBiGnpgw3fVLVQ6ae1086
	0EtuEECPvmwIcWWgmMfr5WLjkIZtcy0OC5i0Eha7q04feDJrjuj/pEjzfmyMWSDvnW+uxRFV+KJ
	J+aDUI6XyzftgKFcrID9LrIEtA8jha3e3nScDno6r95qaBxB5Ou5eF94TyYUyCdkR3sch1hcYkm
	uGzna1DhWXSrbzjRRmIA==
X-Received: by 2002:a05:6a21:3290:b0:38d:edd4:2fbe with SMTP id adf61e73a8af0-39545ed058emr15020115637.31.1772041317482;
        Wed, 25 Feb 2026 09:41:57 -0800 (PST)
Received: from dw-tp ([203.81.243.177])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8fdb81sm14825760b3a.64.2026.02.25.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:41:56 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 24/29] arch, mm: consolidate initialization of SPARSE memory model
In-Reply-To: <aZ8idANginXzhf0_@kernel.org>
Date: Wed, 25 Feb 2026 23:08:38 +0530
Message-ID: <87seaohgf5.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-25-rppt@kernel.org> <87tsv5h544.ritesh.list@gmail.com> <aZ8idANginXzhf0_@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-17201-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:akpm@linux-foundation.org,m:alexs@kernel.org,m:agordeev@linux.ibm.com,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:hca@linux.ibm.com,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:corbet@lwn.net,m:klarasmodin@gmail.com,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:palmer@dabbelt.com,m:pratyush@kernel.org,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:gor@linux.ibm.com,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org
 ,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-um@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[66];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 75D2919BB2E
X-Rspamd-Action: no action

Mike Rapoport <rppt@kernel.org> writes:

> Hello Ritesh,
>
> On Wed, Feb 25, 2026 at 09:00:35AM +0530, Ritesh Harjani wrote:
>> Mike Rapoport <rppt@kernel.org> writes:
>> 
>> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>> >
>> > Every architecture calls sparse_init() during setup_arch() although the
>> > data structures created by sparse_init() are not used until the
>> > initialization of the core MM.
>> >
>> > Beside the code duplication, calling sparse_init() from architecture
>> > specific code causes ordering differences of vmemmap and HVO initialization
>> > on different architectures.
>> >
>> > Move the call to sparse_init() from architecture specific code to
>> > free_area_init() to ensure that vmemmap and HVO initialization order is
>> > always the same.
>> >
>> 
>> Hello Mike,
>> 
>> [    0.000000][    T0] ------------[ cut here ]------------
>> [    0.000000][    T0] WARNING: arch/powerpc/include/asm/io.h:879 at virt_to_phys+0x44/0x1b8, CPU#0: swapper/0
>> [    0.000000][    T0] Modules linked in:
>> [    0.000000][    T0] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.19.0-12139-gc57b1c00145a #31 PREEMPT
>> [    0.000000][    T0] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
>> [    0.000000][    T0] NIP:  c000000000601584 LR: c000000004075de4 CTR: c000000000601548
>> [    0.000000][    T0] REGS: c000000004d1f870 TRAP: 0700   Not tainted  (6.19.0-12139-gc57b1c00145a)
>> [    0.000000][    T0] MSR:  8000000000021033 <SF,ME,IR,DR,RI,LE>  CR: 48022448  XER: 20040000
>> [    0.000000][    T0] CFAR: c0000000006016c4 IRQMASK: 1
>> [    0.000000][    T0] GPR00: c000000004075dd4 c000000004d1fb10 c00000000304bb00 c000000180000000
>> [    0.000000][    T0] GPR04: 0000000000000009 0000000000000009 c000000004ec94a0 0000000000000000
>> [    0.000000][    T0] GPR08: 0000000000018000 0000000000000001 c000000004921280 0000000048022448
>> [    0.000000][    T0] GPR12: c000000000601548 c000000004fe0000 0000000000000004 0000000000000004
>> [    0.000000][    T0] GPR16: 000000000287fb08 0000000000000060 0000000000000002 0000000002831750
>> [    0.000000][    T0] GPR20: 0000000002831778 fffffffffffffffd c000000004d78050 00000000051cbb00
>> [    0.000000][    T0] GPR24: 0000000005a40008 c000000000000000 c000000000400000 0000000000000100
>> [    0.000000][    T0] GPR28: c000000004d78050 0000000000000000 c000000004ecd4a8 0000000000000001
>> [    0.000000][    T0] NIP [c000000000601584] virt_to_phys+0x44/0x1b8
>> [    0.000000][    T0] LR [c000000004075de4] alloc_bootmem+0x144/0x1a8
>> [    0.000000][    T0] Call Trace:
>> [    0.000000][    T0] [c000000004d1fb50] [c000000004075dd4] alloc_bootmem+0x134/0x1a8
>> [    0.000000][    T0] [c000000004d1fba0] [c000000004075fac] __alloc_bootmem_huge_page+0x164/0x230
>> [    0.000000][    T0] [c000000004d1fbe0] [c000000004030bc4] alloc_bootmem_huge_page+0x44/0x138
>> [    0.000000][    T0] [c000000004d1fc10] [c000000004076e48] hugetlb_hstate_alloc_pages+0x350/0x5ac
>> [    0.000000][    T0] [c000000004d1fd30] [c0000000040782f0] hugetlb_bootmem_alloc+0x15c/0x19c
>> [    0.000000][    T0] [c000000004d1fd70] [c00000000406d7b4] mm_core_init_early+0x7c/0xdf4
>> [    0.000000][    T0] [c000000004d1ff30] [c000000004011d84] start_kernel+0xac/0xc58
>> [    0.000000][    T0] [c000000004d1ffe0] [c00000000000e99c] start_here_common+0x1c/0x20
>> [    0.000000][    T0] Code: 6129ffff 792907c6 6529ffff 6129ffff 7c234840 40810018 3d2201e8 3929a7a8 e9290000 7c291840 41810044 3be00001 <0b1f0000> 3d20bfff 6129ffff 792907c6
>> 
>> 
>> I think this is happening because, now in mm_core_early_init(), the
>> order of initialization between hugetlb_bootmem_alloc() and
>> free_area_init() is reversed. Since free_area_init() -> sparse_init()
>> is responsible for setting SECTIONS and vmemmap area. 
>> 
>> Then in alloc_bootmem() (from hugetlb_bootmem_alloc() path), it uses virt_to_phys(m)...
>> 
>> 			/*
>> 			 * For pre-HVO to work correctly, pages need to be on
>> 			 * the list for the node they were actually allocated
>> 			 * from. That node may be different in the case of
>> 			 * fallback by memblock_alloc_try_nid_raw. So,
>> 			 * extract the actual node first.
>> 			 */
>> 			if (m)
>> 				listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
>> 
>> 
>> ... virt_to_phys on powerpc uses:
>> 
>> static inline unsigned long virt_to_phys(const volatile void * address)
>> {
>> 	WARN_ON(IS_ENABLED(CONFIG_DEBUG_VIRTUAL) && !virt_addr_valid(address));
>> 
>> 	return __pa((unsigned long)address);
>> }
>> 
>> #define virt_addr_valid(vaddr)	({					\
>> 	unsigned long _addr = (unsigned long)vaddr;			\
>> 	_addr >= PAGE_OFFSET && _addr < (unsigned long)high_memory &&	\
>> 	pfn_valid(virt_to_pfn((void *)_addr));				\
>> })
>> 
>> 
>> I think the above warning in dmesg gets printed from above WARN_ON, i.e.
>> because pfn_valid() is false, since we haven't done sparse_init() yet.
>
> Yes, I agree.
>  
>> So, what I wanted to check was - do you think instead of virt_to_phys(), we
>> could directly use __pa() here() in mm/hugetlb.c, since these are
>> memblock alloc addresses? i.e.: 
>> 
>> // alloc_bootmem():
>> -   listnode = early_pfn_to_nid(PHYS_PFN(virt_to_phys(m)));
>> +   listnode = early_pfn_to_nid(PHYS_PFN(__pa(m)));
>> 
>> // __alloc_bootmem_huge_page():
>> -   memblock_reserved_mark_noinit(virt_to_phys((void *)m + PAGE_SIZE),
>> +   memblock_reserved_mark_noinit(__pa((void *)m + PAGE_SIZE),
>
> It surely will work for powerpc :)
> I checked the definitions of __pa() on other architectures and it seems the
> safest and the easiest way to fix this.
>  
> Would you send a formal patch?
>

Thanks Mike for taking a look at above and confirming. Sure, let me
prepare the patch and send it by tomorrow. 

-ritesh

