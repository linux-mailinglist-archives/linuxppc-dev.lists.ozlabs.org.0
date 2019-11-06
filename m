Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACC4F1AB4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 17:03:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477WXj0FWwzDrfl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 03:03:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="blk99mJs"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477WVX102KzF5N4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 03:01:23 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 29so6114998pgm.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 08:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qJxDuXPZ8UpIcZ8oIYsXCJePMzRQNpnyqe+e0E6zGHM=;
 b=blk99mJsoZk20GxoK2V46+jO/Oqw9jYi6crtDZrI+ZxeXiTlD3tuMCd0Z8VVzDJMpw
 nN+cheIlNECTN7dPlDZKdLFbekuYTE3psnY+5OGStsOBNTAuRkxADLRkSG6N2XtXoD6C
 dfTMLNtwC5oS0f8FgbO9o4ZSWaiwVbX47Tcn23ZfPuDPjE2loe5UqjZgC50t0nDGDPrg
 DfpDcS8uCMwV7C+XhJ3nIQF751Pj0UeKhO23vnokeUcnttBJ+Lr9olwv69waKyH7cwTX
 I8WT6bhvdusExIB3qdO1lGNvxRiiwQO37BGdSabglpCATEJ79yuu9D2Ky6pRxz1BqKkD
 eaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qJxDuXPZ8UpIcZ8oIYsXCJePMzRQNpnyqe+e0E6zGHM=;
 b=PTnL8kjRiijdi8hrC7MM86NNIPBWj5MPtNhGlM2GFv9xd51DBeYOUVGy7z2fAYgxYh
 fOhG7rQHv1P5uB+ZFlrg4QRxZyFbVqyYaCaG5Ok0Xyvp6tRHQGhZoSeiw+bHdYlqrOtX
 regmOeJUdje29o7wQ7NQaQQ+KkmptAovwAfjiI59dEDBH/PvYHDr4h3yT65McWisaQtu
 Ma7JyVkp/M0HMSfUibW6q2gojCNUe6oaIURydKsSUwAzzn5ho/jgzJbuqirR74yGcsXY
 +K8s5DAEtmpeQW3hDlis4mQsFw26Q2Pm/ZiH4ejbG1pwnbCRFMqPaBnFrP6o+dMHHvqD
 tR8Q==
X-Gm-Message-State: APjAAAW6PITr/Rgq/2JzVl72kYaO/zynKqG+zI3BguG/uQzkV0QYXo81
 4VbHM/KLEm7eZHbsvkXToz0SnQ==
X-Google-Smtp-Source: APXvYqzjpa0BHhN80FIOsJE2uFKOZ6uxAYrLjZJ/pohyDNSVgNBiFgRZuXwWekeFORCsVtX74ohm8Q==
X-Received: by 2002:a17:90a:c56:: with SMTP id
 u22mr4702905pje.24.1573056081542; 
 Wed, 06 Nov 2019 08:01:21 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id m13sm21928545pga.70.2019.11.06.08.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2019 08:01:20 -0800 (PST)
Subject: Re: [PATCH 26/50] powerpc: Add show_stack_loglvl()
To: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20191106030542.868541-1-dima@arista.com>
 <20191106030542.868541-27-dima@arista.com>
 <8736f172mj.fsf@mpe.ellerman.id.au>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <85528fea-48e3-627b-d497-dc58ed408f87@arista.com>
Date: Wed, 6 Nov 2019 16:01:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <8736f172mj.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Petr Mladek <pmladek@suse.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Jiri Slaby <jslaby@suse.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/6/19 9:52 AM, Michael Ellerman wrote:
> Dmitry Safonov <dima@arista.com> writes:
>> Currently, the log-level of show_stack() depends on a platform
>> realization. It creates situations where the headers are printed with
>> lower log level or higher than the stacktrace (depending on
>> a platform or user).
> 
> Yes, I've had bug reports where the stacktrace is missing, which is
> annoying. Thanks for trying to fix the problem.
> 
>> Furthermore, it forces the logic decision from user to an architecture
>> side. In result, some users as sysrq/kdb/etc are doing tricks with
>> temporary rising console_loglevel while printing their messages.
>> And in result it not only may print unwanted messages from other CPUs,
>> but also omit printing at all in the unlucky case where the printk()
>> was deferred.
>>
>> Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
>> an easier approach than introducing more printk buffers.
>> Also, it will consolidate printings with headers.
>>
>> Introduce show_stack_loglvl(), that eventually will substitute
>> show_stack().
>>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> [1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
>> Signed-off-by: Dmitry Safonov <dima@arista.com>
>> ---
>>  arch/powerpc/kernel/process.c | 18 +++++++++++++-----
>>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> This looks good to me.
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Thanks for the review and time!

-- 
          Dmitry
