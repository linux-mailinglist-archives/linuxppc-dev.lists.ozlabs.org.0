Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF352F409
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 21:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4cpD0kS0z3bsH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 May 2022 05:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TVHchE81;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TVHchE81;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=TVHchE81; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TVHchE81; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4cnV58wLz3bkV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 May 2022 05:52:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653076329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QC4HhoSa5ax5VuJxdudrkP+hQQcM6Ir26+NRsLLyTuA=;
 b=TVHchE81j9YK3Pk5pV125Le9PENhOJt+b593Aumyy5/8YN+r9PIBJteNi6fkqIAHVRGsv9
 vElf1VmV6X8Edubb7cMdp+BdhfkG5BQMZr7VXX7UEq0yt3F/D/eH0B2hXo80nNOU046sLn
 KKCiOzvtmNvMRvP4OQDPPLBcyS6DsbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653076329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QC4HhoSa5ax5VuJxdudrkP+hQQcM6Ir26+NRsLLyTuA=;
 b=TVHchE81j9YK3Pk5pV125Le9PENhOJt+b593Aumyy5/8YN+r9PIBJteNi6fkqIAHVRGsv9
 vElf1VmV6X8Edubb7cMdp+BdhfkG5BQMZr7VXX7UEq0yt3F/D/eH0B2hXo80nNOU046sLn
 KKCiOzvtmNvMRvP4OQDPPLBcyS6DsbY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-4t-3E9E5PQGx31S7cEd1eQ-1; Fri, 20 May 2022 15:52:06 -0400
X-MC-Unique: 4t-3E9E5PQGx31S7cEd1eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC1829AB3FB;
 Fri, 20 May 2022 19:52:04 +0000 (UTC)
Received: from [10.22.32.226] (unknown [10.22.32.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED99440D2821;
 Fri, 20 May 2022 19:52:01 +0000 (UTC)
Message-ID: <f3627eae-f5ae-1d30-2c09-1820a255334a@redhat.com>
Date: Fri, 20 May 2022 15:52:01 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/5] kallsyms: pass buffer size in sprint_* APIs
Content-Language: en-US
To: Maninder Singh <maninder1.s@samsung.com>, keescook@chromium.org,
 pmladek@suse.com, bcain@quicinc.com, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, satishkh@cisco.com, sebaddel@cisco.com,
 kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 mcgrof@kernel.org, jason.wessel@windriver.com, daniel.thompson@linaro.org,
 dianders@chromium.org, naveen.n.rao@linux.ibm.com,
 anil.s.keshavamurthy@intel.com, davem@davemloft.net, mhiramat@kernel.org,
 peterz@infradead.org, mingo@redhat.com, will@kernel.org,
 boqun.feng@gmail.com, rostedt@goodmis.org, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 akpm@linux-foundation.org, arnd@arndb.de
References: <20220520083701.2610975-1-maninder1.s@samsung.com>
 <CGME20220520083725epcas5p1c3e2989c991e50603a40c81ccc4982e0@epcas5p1.samsung.com>
 <20220520083701.2610975-2-maninder1.s@samsung.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220520083701.2610975-2-maninder1.s@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: v.narang@samsung.com, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, onkarnath.1@samsung.com,
 kgdb-bugreport@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/20/22 04:36, Maninder Singh wrote:
> As of now sprint_* APIs don't pass buffer size as an argument
> and use sprintf directly.
>
> To replace dangerous sprintf API to scnprintf,
> buffer size is required in arguments.
>
> Co-developed-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
> ---
>   arch/s390/lib/test_unwind.c    |  2 +-
>   drivers/scsi/fnic/fnic_trace.c |  8 ++++----
>   include/linux/kallsyms.h       | 20 ++++++++++----------
>   init/main.c                    |  2 +-
>   kernel/kallsyms.c              | 27 ++++++++++++++++-----------
>   kernel/trace/trace_output.c    |  2 +-
>   lib/vsprintf.c                 | 10 +++++-----
>   7 files changed, 38 insertions(+), 33 deletions(-)
>
> diff --git a/arch/s390/lib/test_unwind.c b/arch/s390/lib/test_unwind.c
> index 5a053b393d5c..adbc2b53db16 100644
> --- a/arch/s390/lib/test_unwind.c
> +++ b/arch/s390/lib/test_unwind.c
> @@ -75,7 +75,7 @@ static noinline int test_unwind(struct task_struct *task, struct pt_regs *regs,
>   			ret = -EINVAL;
>   			break;
>   		}
> -		sprint_symbol(sym, addr);
> +		sprint_symbol(sym, KSYM_SYMBOL_LEN, addr);

Instead of hardcoding KSYM_SYMBOL_LEN everywhere, will it better to hide 
it like this:

         extern int __sprint_symbol(char *buffer, size_t size, unsigned 
long address);
         #define sprint_symbol(buf, addr)        __sprint_symbol(buf, 
sizeof(buf), addr)

Or you can use sizeof(buf) directly instead of KSYM_SYMBOL_LEN.

Cheers,
Longman

