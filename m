Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D156219D14E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:34:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tsBs2DwzzDrRY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ptRdg/eo; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48ts2J21KwzDqxG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:27:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48ts282dk9z9vBLM;
 Fri,  3 Apr 2020 09:26:56 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ptRdg/eo; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q7_0R8FodDcJ; Fri,  3 Apr 2020 09:26:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48ts281Ly7z9vBLL;
 Fri,  3 Apr 2020 09:26:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585898816; bh=G/gE+3SR1+TZN2RTMUhJh+L+wYW4d0v6JEe81BP7dDo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ptRdg/eo9tW40fi+LHGtu5aDnwLwI2aX5PP7bewfPrpMSzpgGlJvE1yeNnHxxyqSR
 2tQhGDeucgvb4b2+NyrAETGvtbXpRvazSbkKpkouiR7rDWL6307CWs+C8BTSEh2dHv
 exsrh+i4rtv0rLsI/kvEbENe44ABNAZpCM/aIT3M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 064FF8B943;
 Fri,  3 Apr 2020 09:26:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wpdS4NRykvtP; Fri,  3 Apr 2020 09:26:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BABD88B75B;
 Fri,  3 Apr 2020 09:26:54 +0200 (CEST)
Subject: Re: [PATCH v11 0/8] Disable compat cruft on ppc64le v11
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Michal Suchanek <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <1585898335.tckaz04a6x.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1e00a725-9710-2b80-4aff-2f284b31d2e5@c-s.fr>
Date: Fri, 3 Apr 2020 09:26:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <1585898335.tckaz04a6x.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/04/2020 à 09:25, Nicholas Piggin a écrit :
> Michal Suchanek's on March 19, 2020 10:19 pm:
>> Less code means less bugs so add a knob to skip the compat stuff.
>>
>> Changes in v2: saner CONFIG_COMPAT ifdefs
>> Changes in v3:
>>   - change llseek to 32bit instead of builing it unconditionally in fs
>>   - clanup the makefile conditionals
>>   - remove some ifdefs or convert to IS_DEFINED where possible
>> Changes in v4:
>>   - cleanup is_32bit_task and current_is_64bit
>>   - more makefile cleanup
>> Changes in v5:
>>   - more current_is_64bit cleanup
>>   - split off callchain.c 32bit and 64bit parts
>> Changes in v6:
>>   - cleanup makefile after split
>>   - consolidate read_user_stack_32
>>   - fix some checkpatch warnings
>> Changes in v7:
>>   - add back __ARCH_WANT_SYS_LLSEEK to fix build with llseek
>>   - remove leftover hunk
>>   - add review tags
>> Changes in v8:
>>   - consolidate valid_user_sp to fix it in the split callchain.c
>>   - fix build errors/warnings with PPC64 !COMPAT and PPC32
>> Changes in v9:
>>   - remove current_is_64bit()
>> Chanegs in v10:
>>   - rebase, sent together with the syscall cleanup
>> Changes in v11:
>>   - rebase
>>   - add MAINTAINERS pattern for ppc perf
> 
> These all look good to me. I had some minor comment about one patch but
> not really a big deal and there were more cleanups on top of it, so I
> don't mind if it's merged as is.
> 
> Actually I think we have a bit of stack reading fixes for 64s radix now
> (not a bug fix as such, but we don't need the hash fault logic in radix),
> so if I get around to that I can propose the changes in that series.
> 

As far as I can see, there is a v12

Christophe
