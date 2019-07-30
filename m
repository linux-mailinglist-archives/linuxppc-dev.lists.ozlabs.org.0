Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F367A059
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 07:33:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yQFW1ZswzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 15:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qyEzDSXc"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yQCQ0DN1zDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 15:31:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45yQCH3NcVzB09ZT;
 Tue, 30 Jul 2019 07:31:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qyEzDSXc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rd-v7jPqQJgu; Tue, 30 Jul 2019 07:31:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45yQCH2HdXzB09ZN;
 Tue, 30 Jul 2019 07:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1564464683; bh=ePSetGxy2Hgvqtd+MAQAGKMxy2rhqR0kq9ZlpTUXHps=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qyEzDSXcnwLMN8hHx717ZrDE0Jv3hY6oYqpm8o29LeHg0T2Nl8V/kNdFsQgoV6CQT
 LbYMXDw+LGfxTyJliNgft9h1Jv2zGxQ6PnhCVndsAxlVYD749/0E2dNnzcY3frc2uu
 /hVX8u33apZRbxJSLbuTXC1ChrxEpO0T22sRdr/w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 27A588B7F1;
 Tue, 30 Jul 2019 07:31:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8Lk1aYWXxBaY; Tue, 30 Jul 2019 07:31:24 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1AFC8B74F;
 Tue, 30 Jul 2019 07:31:23 +0200 (CEST)
Subject: Re: [PATCH] powerpc: workaround clang codegen bug in dcbz
To: Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <20190729202542.205309-1-ndesaulniers@google.com>
 <20190729203246.GA117371@archlinux-threadripper>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8f2331db-151f-a481-23e0-ec6dd9ba6f1c@c-s.fr>
Date: Tue, 30 Jul 2019 07:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190729203246.GA117371@archlinux-threadripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/07/2019 à 22:32, Nathan Chancellor a écrit :
> On Mon, Jul 29, 2019 at 01:25:41PM -0700, Nick Desaulniers wrote:
>> Commit 6c5875843b87 ("powerpc: slightly improve cache helpers") exposed
>> what looks like a codegen bug in Clang's handling of `%y` output
>> template with `Z` constraint. This is resulting in panics during boot
>> for 32b powerpc builds w/ Clang, as reported by our CI.
>>
>> Add back the original code that worked behind a preprocessor check for
>> __clang__ until we can fix LLVM.
>>
>> Further, it seems that clang allnoconfig builds are unhappy with `Z`, as
>> reported by 0day bot. This is likely because Clang warns about inline
>> asm constraints when the constraint requires inlining to be semantically
>> valid.
>>
>> Link: https://bugs.llvm.org/show_bug.cgi?id=42762
>> Link: https://github.com/ClangBuiltLinux/linux/issues/593
>> Link: https://lore.kernel.org/lkml/20190721075846.GA97701@archlinux-threadripper/
>> Debugged-by: Nathan Chancellor <natechancellor@gmail.com>
>> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> ---
>> Alternatively, we could just revert 6c5875843b87. It seems that GCC
>> generates the same code for these functions for out of line versions.
>> But I'm not sure how the inlined code generated would be affected.
> 
> For the record:
> 
> https://godbolt.org/z/z57VU7
> 
> This seems consistent with what Michael found so I don't think a revert
> is entirely unreasonable.

Your example functions are too simple to show anything. The functions 
takes only one parameter so of course GCC won't use two registers 
allthough given the opportunity.

Christophe

> 
> Either way:
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> 
