Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BE634D8BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 22:00:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8NjD1l6Cz30Lp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 07:00:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256 header.s=google header.b=YJPerRzl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::333;
 helo=mail-wm1-x333.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.a=rsa-sha256
 header.s=google header.b=YJPerRzl; dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8Nhf4vSFz2yR1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 06:59:45 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id d191so7202346wmd.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 12:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DKVpcQ+QpAoXvlyjRMhAGyT+Qqak2JfgZMLiBaSa29E=;
 b=YJPerRzl5+2JaKjv1Eb55P40KGWj7y6pfAam3YE3y8qhoEgUMMSGIdVfB6lepj10yJ
 D9JgvhbtBcvf8hfGDmq8z3Zv50QkNtIZMKlL7qEOsF0W8nlkcRq2Gz4nkYLLJ4Opvwcy
 GeQxTIHi0wGIiu/1stxEX8XdpEX32jglLEn2f5JXz86HT81AdRitSFe+KAw4HGbMqphK
 DL1N4R+sQxYSbcUqJpXZk6egdDmBADKsmQ/uJ+kUO2jfcDoV/VEjpB4e2hoPxcjqs62B
 jlYp0Woty23AO0P9Hdodnyz6GSb0jC1JbWGj8zhE4+rI4qkYA+zhreLGydVxQMXtRKcv
 NAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DKVpcQ+QpAoXvlyjRMhAGyT+Qqak2JfgZMLiBaSa29E=;
 b=KWP71K7KH9GmE1PWdtWjKVmPGZQsVdONaYnoGBasG/HHo+OafsPO/APpu3J6+R+6L+
 fXUC+YKf3H343Oul+pwPyegM2OCUIA7LaJlMH8oJGz6KGchTxwjnlPfps0m+XW+w/t/m
 SvjMYmGc2LtfnFt3ix36ZCMeYZr6vkCrddkt+RbOd2XQco6nBQo6SN/8Socz+sQYTdf5
 +dK5BFYM8ANsmMhRtBMAFMh9F5vuU/meEM6it9E8hxnqrjs2cBMrLE9ToLf4Q1QTtFjz
 F/I8tXkr6kuqgb9bTOB95qF1sRWAXVooF5TSmF0+DTA89PbY0kLl4l4Tvv1fgclDbLBk
 HSGw==
X-Gm-Message-State: AOAM5316FlKNQP7wzOQiovlUBz5vfFds0MhHWMrog+ckCFsAbiKZM7Oa
 fLi2h/hnaNgCNqiR9hdhgljVZg==
X-Google-Smtp-Source: ABdhPJxY4+UJ5NboEvKsiKSfoZc8oEQ4w+NW1XvxfFLt4qF5Y5WCR92gIYO1xNtxtzr0yNW21PC1TQ==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr624923wmi.112.1617047977314; 
 Mon, 29 Mar 2021 12:59:37 -0700 (PDT)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8?
 ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id l6sm32426474wrn.3.2021.03.29.12.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 12:59:36 -0700 (PDT)
Subject: Re: [PATCH] powerpc/vdso: Separate vvar vma from vdso
To: Laurent Dufour <ldufour@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20210326191720.138155-1-dima@arista.com>
 <f97f3ff9-6ae2-64cc-fada-49fcac34ae47@linux.ibm.com>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <50b7a78a-76e6-7d28-5324-a3ada9c43019@arista.com>
Date: Mon, 29 Mar 2021 20:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f97f3ff9-6ae2-64cc-fada-49fcac34ae47@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, Andrei Vagin <avagin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, stable@vger.kernel.org,
 Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/29/21 4:14 PM, Laurent Dufour wrote:
> Le 26/03/2021 à 20:17, Dmitry Safonov a écrit :
>> Since commit 511157ab641e ("powerpc/vdso: Move vdso datapage up front")
>> VVAR page is in front of the VDSO area. In result it breaks CRIU
>> (Checkpoint Restore In Userspace) [1], where CRIU expects that "[vdso]"
>> from /proc/../maps points at ELF/vdso image, rather than at VVAR data
>> page.
>> Laurent made a patch to keep CRIU working (by reading aux vector).
>> But I think it still makes sence to separate two mappings into different
>> VMAs. It will also make ppc64 less "special" for userspace and as
>> a side-bonus will make VVAR page un-writable by debugger (which
>> previously
>> would COW page and can be unexpected).
>>
>> I opportunistically Cc stable on it: I understand that usually such
>> stuff isn't a stable material, but that will allow us in CRIU have
>> one workaround less that is needed just for one release (v5.11) on
>> one platform (ppc64), which we otherwise have to maintain.
>> I wouldn't go as far as to say that the commit 511157ab641e is ABI
>> regression as no other userspace got broken, but I'd really appreciate
>> if it gets backported to v5.11 after v5.12 is released, so as not
>> to complicate already non-simple CRIU-vdso code. Thanks!
>>
>> Cc: Andrei Vagin <avagin@gmail.com>
>> Cc: Andy Lutomirski <luto@kernel.org>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Laurent Dufour <ldufour@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: stable@vger.kernel.org # v5.11
>> [1]: https://github.com/checkpoint-restore/criu/issues/1417
>> Signed-off-by: Dmitry Safonov <dima@arista.com>
>> Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> I run the CRIU's test suite and except the usual suspects, all the tests
> passed.
> 
> Tested-by: Laurent Dufour <ldufour@linux.ibm.com>

Thank you, Laurent!

-- 
          Dmitry
