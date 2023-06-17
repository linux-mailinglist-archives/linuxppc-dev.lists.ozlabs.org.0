Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A0733DE8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:55:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=UJDbRMam;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjhyX48tVz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 13:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=UJDbRMam;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=yuzhao@google.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjhxY16J8z3bWS
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 13:54:55 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-33d928a268eso68965ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686974092; x=1689566092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QjPKljmVrq97b/xrgwUpf4fkZeUWNrWjsV3CU9AjkqI=;
        b=UJDbRMamkrBPVExG/+JpPWPTOqM1QRSzYcymaPP5BGEQsRBouuA13TXnrCLvToP8bV
         3lKWCVjeaP/fUBGyCPuHbg0CW8MyxuxVz8142sPH/UfHTXnWL/9qnB8dNcL0Beq/TMmQ
         JqhD594Tk8VivGo6jIoTnf4rOPr1Z+B1guFIC4KvXqrOBNK3dm7Pgfy5L+GI8hJ1stzi
         pWmq2jqc4gGIjAbzipaWV2tUFC1dw2QMDvPO5CI7Zci41h+2G0iHSy6k3ny0RzPtxj1z
         M4qdnJcLBAHnbDtPuvuRyfutO5ro8aWEodws/C53fXxgTAicX1IJCrMcK38L5fRgeR6Y
         ergA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686974092; x=1689566092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjPKljmVrq97b/xrgwUpf4fkZeUWNrWjsV3CU9AjkqI=;
        b=H6t5d64P9AX3vRQhD9bcePP2cFD79QlX5t8dlaLIJjmsT2094RyeGfQ3qf668GbV1z
         SnwwnC3wv6w36rJtfeDCNsjoDHilLvJb/gKcjKPybxiKntEONJXsAyOMY6A5BapM1MFO
         1agHFTWwEIlTZatrVIAUN7LKpG768/Li5aNSPzYyyU9nxzE6JQUIlNhumwrjGo/dT3Hg
         G0dmu3sXwIg6iR6Jxu+bFn8rMXHEEGL6RlmaBIEUrRemwCNVwPEzpF9D/wZzRfQ/eMj8
         zBDzIJxnQFShKanm8V+Siex1NGMacvOzpAAo3SvtuOPd8hEXbwwKtPeyPKVR2VqQNh+C
         XF/g==
X-Gm-Message-State: AC+VfDxhbc7wrlIJK7rpTpNP5fNx1OyKO+nhOYzCJ6FKNlXDULfuJWuT
	8//eR7YqJc5WH02JtWE3Ppnptw==
X-Google-Smtp-Source: ACHHUZ52Zzw4gnAVJGh+M+mwB619YPVvWEDyF49a92w1AraAEi5TFjxraa3d5c9DKFNfF5UZkyYmpQ==
X-Received: by 2002:a05:6e02:1be6:b0:340:57e1:2f76 with SMTP id y6-20020a056e021be600b0034057e12f76mr548195ilv.15.1686974092134;
        Fri, 16 Jun 2023 20:54:52 -0700 (PDT)
Received: from google.com ([2620:15c:183:202:bdb2:a15e:7a58:c3a3])
        by smtp.gmail.com with ESMTPSA id dx7-20020a0566381d0700b0041d759c451asm6634770jab.166.2023.06.16.20.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 20:54:51 -0700 (PDT)
Date: Fri, 16 Jun 2023 21:54:47 -0600
From: Yu Zhao <yuzhao@google.com>
To: Hugh Dickins <hughd@google.com>
Subject: Re: [PATCH v2 07/23 replacement] mips: add pte_unmap() to balance
 pte_offset_map()
Message-ID: <ZI0uh8P/akwkGo0D@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
 <178970b0-1539-8aac-76fd-972c6c46ec17@google.com>
 <20230614231758.GA1503611@dev-arch.thelio-3990X>
 <f5526f17-9d78-f7ea-427a-7e76bfeb6b8@google.com>
 <344a4da-3890-45fd-607e-b5f85ca6ad48@google.com>
 <20230615155059.GB3665766@dev-arch.thelio-3990X>
 <76b41825-30fa-b9e8-d043-2affcba24317@google.com>
 <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <addfcb3-b5f4-976e-e050-a2508e589cfe@google.com>
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
Cc: linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, John David Anglin <dave.anglin@bell.net>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15, 2023 at 04:02:43PM -0700, Hugh Dickins wrote:
> To keep balance in future, __update_tlb() remember to pte_unmap() after
> pte_offset_map().  This is an odd case, since the caller has already done
> pte_offset_map_lock(), then mips forgets the address and recalculates it;
> but my two naive attempts to clean that up did more harm than good.
> 
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Hugh Dickins <hughd@google.com>

FWIW: Tested-by: Yu Zhao <yuzhao@google.com>

There is another problem, likely caused by khugepaged, happened multiple times. But I don't think it's related to your series, just FYI.

  Got mcheck at ffffffff81134ef0
  CPU: 3 PID: 36 Comm: khugepaged Not tainted 6.4.0-rc6-00049-g62d8779610bb-dirty #1
  $ 0   : 0000000000000000 0000000000000014 40000000011ac004 4000000000000000
  $ 4   : c000000000000000 0000000000000045 000000011a80045b 000000011a80045b
  $ 8   : 8000000080188000 ffffffff81b526c0 0000000000000200 0000000000000000
  $12   : 0000000000000028 ffffffff81910cb4 0000000000000000 0000000000000207
  $16   : 000000aaab800000 80000000037ee990 ffffffff81b50200 8000000005066ae0
  $20   : 0000000000000001 ffffffff80000000 ffffffff81c10000 000000aaab800000
  $24   : 0000000000000002 ffffffff812b75f8
  $28   : 8000000002310000 8000000002313b00 ffffffff81b50000 ffffffff81134d88
  Hi    : 000000000000017a
  Lo    : 0000000000000000
  epc   : ffffffff81134ef0 __update_tlb+0x260/0x2a0
  ra    : ffffffff81134d88 __update_tlb+0xf8/0x2a0
  Status: 14309ce2	KX SX UX KERNEL EXL
  Cause : 00800060 (ExcCode 18)
  PrId  : 000d9602 (Cavium Octeon III)
  CPU: 3 PID: 36 Comm: khugepaged Not tainted 6.4.0-rc6-00049-g62d8779610bb-dirty #1
  Stack : 0000000000000001 0000000000000000 0000000000000008 8000000002313768
          8000000002313768 80000000023138f8 0000000000000000 0000000000000000
          a6c8cd76e1667e00 8000000001db4f28 0000000000000001 30302d3663722d30
          643236672d393430 0000000000000010 ffffffff81910cc0 0000000000000000
          8000000001d96bcc 0000000000000000 0000000000000000 ffffffff81a68ed0
          ffffffff81b50000 0000000000000001 ffffffff80000000 ffffffff81c10000
          000000aaab800000 0000000000000002 ffffffff815b78c0 ffffffffa184e710
          00000000000000c0 8000000002310000 8000000002313760 ffffffff81b50000
          ffffffff8111c9cc 0000000000000000 0000000000000000 0000000000000000
          0000000000000000 0000000000000000 ffffffff8111c9ec 0000000000000000
          ...
  Call Trace:
  [<ffffffff8111c9ec>] show_stack+0x64/0x158
  [<ffffffff81920078>] dump_stack_lvl+0x5c/0x7c
  [<ffffffff8111e03c>] do_mcheck+0x2c/0x98
  [<ffffffff81118608>] handle_mcheck_int+0x38/0x50
  
  Index    : 80000000
  PageMask : 1fe000
  EntryHi  : 000000aaab8000bd
  EntryLo0 : 40000000011a8004
  EntryLo1 : 40000000011ac004
  Wired    : 0
  PageGrain: e8000000
  
  Index:  2 pgmask=4kb va=c00000feffff4000 asid=b9
  	[ri=0 xi=0 pa=000022a7000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000022af000 c=0 d=1 v=1 g=1]
  Index:  3 pgmask=4kb va=c00000feffff8000 asid=b9
  	[ri=0 xi=0 pa=00002380000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002381000 c=0 d=1 v=1 g=1]
  Index:  4 pgmask=4kb va=c00000feffffa000 asid=b9
  	[ri=0 xi=0 pa=000023e9000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000023ea000 c=0 d=1 v=1 g=1]
  Index:  5 pgmask=4kb va=c00000feffffe000 asid=b9
  	[ri=0 xi=0 pa=00002881000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002882000 c=0 d=1 v=1 g=1]
  Index:  6 pgmask=4kb va=c00000fefffb0000 asid=b9
  	[ri=0 xi=0 pa=00002cc2000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002cc3000 c=0 d=1 v=1 g=1]
  Index:  7 pgmask=4kb va=c00000feffffc000 asid=b9
  	[ri=0 xi=0 pa=000023eb000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002880000 c=0 d=1 v=1 g=1]
  Index:  8 pgmask=4kb va=c00000feffff6000 asid=b9
  	[ri=0 xi=0 pa=0000237e000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000237f000 c=0 d=1 v=1 g=1]
  Index: 14 pgmask=4kb va=c00000fefff62000 asid=8e
  	[ri=0 xi=0 pa=00007477000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000745e000 c=0 d=1 v=1 g=1]
  Index: 15 pgmask=4kb va=c00000fefff52000 asid=8e
  	[ri=0 xi=0 pa=0000744c000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000616d000 c=0 d=1 v=1 g=1]
  Index: 16 pgmask=4kb va=c00000fefff42000 asid=8e
  	[ri=0 xi=0 pa=00006334000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000616b000 c=0 d=1 v=1 g=1]
  Index: 19 pgmask=4kb va=c00000fefffb6000 asid=8e
  	[ri=0 xi=0 pa=00005050000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00005051000 c=0 d=1 v=1 g=1]
  Index: 20 pgmask=4kb va=c00000fefff72000 asid=b9
  	[ri=0 xi=0 pa=00007504000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00007503000 c=0 d=1 v=1 g=1]
  Index: 58 pgmask=4kb va=c00000fefffaa000 asid=8e
  	[ri=0 xi=0 pa=00005126000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00005127000 c=0 d=1 v=1 g=1]
  Index: 59 pgmask=4kb va=c00000fefffba000 asid=8e
  	[ri=0 xi=0 pa=00005129000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000512a000 c=0 d=1 v=1 g=1]
  Index: 79 pgmask=4kb va=c000000000060000 asid=8e
  	[ri=0 xi=0 pa=0000534b000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000062f9000 c=0 d=1 v=1 g=1]
  Index: 80 pgmask=4kb va=c00000000005e000 asid=8e
  	[ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=1] [ri=0 xi=0 pa=00004013000 c=0 d=1 v=1 g=1]
  Index: 81 pgmask=4kb va=c0000000003a0000 asid=8e
  	[ri=0 xi=0 pa=000060c6000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=0000340e000 c=0 d=1 v=1 g=1]
  Index: 82 pgmask=4kb va=c00000000039e000 asid=8e
  	[ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=1] [ri=0 xi=0 pa=000060c5000 c=0 d=1 v=1 g=1]
  Index: 83 pgmask=4kb va=c00000000003e000 asid=8e
  	[ri=0 xi=0 pa=00002bf3000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002c42000 c=0 d=1 v=1 g=1]
  Index: 84 pgmask=4kb va=c000000000042000 asid=8e
  	[ri=0 xi=0 pa=00002c45000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002c46000 c=0 d=1 v=1 g=1]
  Index: 85 pgmask=4kb va=0aaab820000 asid=bd
  	[ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=0] [ri=0 xi=0 pa=00000000000 c=0 d=0 v=0 g=0]
  Index: 86 pgmask=4kb va=0aaab748000 asid=bd
  	[ri=0 xi=1 pa=0003c959000 c=0 d=1 v=1 g=0] [ri=0 xi=1 pa=0000f7b6000 c=0 d=0 v=1 g=0]
  Index: 87 pgmask=4kb va=0fff37c4000 asid=bd
  	[ri=0 xi=0 pa=0000bd23000 c=0 d=0 v=1 g=0] [ri=0 xi=0 pa=0000bd24000 c=0 d=0 v=1 g=0]
  Index: 88 pgmask=4kb va=0fff3992000 asid=bd
  	[ri=0 xi=1 pa=0000bfcd000 c=0 d=0 v=1 g=0] [ri=0 xi=1 pa=0002977b000 c=0 d=0 v=1 g=0]
  Index: 89 pgmask=4kb va=0fff3288000 asid=bd
  	[ri=0 xi=0 pa=00032b62000 c=0 d=0 v=1 g=0] [ri=0 xi=0 pa=00032b63000 c=0 d=0 v=1 g=0]
  Index: 90 pgmask=4kb va=0fff3982000 asid=bd
  	[ri=0 xi=1 pa=0002d6a3000 c=0 d=1 v=1 g=0] [ri=0 xi=1 pa=0002a423000 c=0 d=0 v=1 g=0]
  Index: 91 pgmask=4kb va=0fffbb5e000 asid=bd
  	[ri=0 xi=0 pa=00028949000 c=0 d=1 v=1 g=0] [ri=0 xi=0 pa=00035060000 c=0 d=1 v=1 g=0]
  Index: 92 pgmask=4kb va=c00000fefffe2000 asid=8e
  	[ri=0 xi=0 pa=000020f0000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000020ff000 c=0 d=1 v=1 g=1]
  Index: 93 pgmask=4kb va=c00000fefffd2000 asid=8e
  	[ri=0 xi=0 pa=000020b7000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000020fe000 c=0 d=1 v=1 g=1]
  Index: 94 pgmask=4kb va=c00000fefffc2000 asid=8e
  	[ri=0 xi=0 pa=000020b6000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000020fd000 c=0 d=1 v=1 g=1]
  Index: 110 pgmask=4kb va=c00000feffff2000 asid=bc
  	[ri=0 xi=0 pa=000020f1000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00002100000 c=0 d=1 v=1 g=1]
  Index: 125 pgmask=4kb va=c00000fefffbe000 asid=bc
  	[ri=0 xi=0 pa=00005268000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=000053dc000 c=0 d=1 v=1 g=1]
  Index: 126 pgmask=4kb va=c00000fefffbc000 asid=bc
  	[ri=0 xi=0 pa=00005266000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00005267000 c=0 d=1 v=1 g=1]
  Index: 188 pgmask=4kb va=c00000fefff76000 asid=bb
  	[ri=0 xi=0 pa=00007576000 c=0 d=1 v=1 g=1] [ri=0 xi=0 pa=00007577000 c=0 d=1 v=1 g=1]
  
  Code: 1000ff92  00601025  00000000 <42000006> 1000ffb8  00000000  00000000  8f820018  00021238
  Kernel panic - not syncing: Caught Machine Check exception - caused by multiple matching entries in the TLB.
  ---[ end Kernel panic - not syncing: Caught Machine Check exception - caused by multiple matching entries in the TLB. ]---
