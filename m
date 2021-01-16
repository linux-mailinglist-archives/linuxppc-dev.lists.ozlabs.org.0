Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A6D2F8A05
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 01:44:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHfSX2mQYzDvVQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 11:44:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HuKNXDA+; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHfQq6BkmzDql6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 11:42:41 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 30so7077226pgr.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 16:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=ZQNYWV/RLXBfRM+YtaOB8Q/1UCvLHv5bLFTu/vYdz9Y=;
 b=HuKNXDA+BpDOb9eCfIoGwAC0vD6PF6haeaSvCe3Lt3ACpyZSz3lIl0dx3KM5EXVLs9
 4yCp9KVWBe1ONoxcHxjLcyHj2sw+A5Gb3jccfCFrfDb6a7Hagzn2MyGeh00Vz4UNduam
 16Pye9FSKsCycHBADN9bWGrKQrKqpZR2oGxhpi1F9Kqni9fF0x9uu4eT6tSmWa2tO6Kx
 IjHzW5AM1BvcI0i6xJ0RD7xbodGrs00QCSyVvkn2/h05ObtQmQiOSoIAJVhX3In8X+q6
 IXgFcKKWqsXjInFE+8cyPigtoelxUj6aiIrnB+Vg4oU5JlQjJ4O39VrbNSfFNxkUZ1ri
 5Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZQNYWV/RLXBfRM+YtaOB8Q/1UCvLHv5bLFTu/vYdz9Y=;
 b=j0wqMh6FDEF6/zKnsZ6M6yK3dytcU3Sb7qtRtCLw7DrNpGvpd2j6a52Nw1tjfnYpj7
 +V8J9PzQ1bUXhQXNwX0FoIBdR6rfTvPwfhdo7QjxMIHI6NTToHGZ9mCTLCDYegRxbzFr
 Sgf2JKt6T5tg+JW3IWitOjQZEctDh6KqOADuCZoyqUgp0780YJYmeHRZSSbcpK9WcrcH
 HZLIl3jkmYqcruw92GkJ9GMNn69GEfX9Z2QvGDIjFyjcBXGK238/pCCQIitoDQEn6dJ+
 v+yhv4FOQ5XLyR+g5QNtE/uI4Kej/DnzpBpD17CVYAMcb/6cB6oaW+jOPp6Fss7Ft0fk
 fAMA==
X-Gm-Message-State: AOAM5328deVV8HTno8dFRVHPhNA9P7spGD08JYcaWkTEmr7xOpSjNCap
 yGfECuD1oasP22VnltS4NLg=
X-Google-Smtp-Source: ABdhPJwXp8NMOUTZFNVmiITxlYFSERGkCGpV0ufMBtlg06TLlPkE504AKE6u+apJzgVOdUl6+E9wpw==
X-Received: by 2002:a63:101d:: with SMTP id f29mr15110896pgl.165.1610757758314; 
 Fri, 15 Jan 2021 16:42:38 -0800 (PST)
Received: from localhost ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id q23sm9380728pgm.89.2021.01.15.16.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 16:42:36 -0800 (PST)
Date: Sat, 16 Jan 2021 10:42:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v6 07/39] powerpc: bad_page_fault get registers from regs
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20210115165012.1260253-1-npiggin@gmail.com>
 <20210115165012.1260253-8-npiggin@gmail.com>
 <9120125b-6dce-4e89-7113-dfdcea43e191@csgroup.eu>
In-Reply-To: <9120125b-6dce-4e89-7113-dfdcea43e191@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1610757552.lreg4wgkti.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 16, 2021 3:09 am:
>=20
>=20
> Le 15/01/2021 =C3=A0 17:49, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Similar to the previous patch this makes interrupt handler function
>> types more regular so they can be wrapped with the next patch.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/bug.h             |  5 +++--
>>   arch/powerpc/kernel/entry_32.S             |  3 +--
>>   arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>>   arch/powerpc/kernel/exceptions-64s.S       |  4 +---
>>   arch/powerpc/kernel/traps.c                |  2 +-
>>   arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>>   arch/powerpc/mm/book3s64/slb.c             |  2 +-
>>   arch/powerpc/mm/fault.c                    | 13 ++++++++++---
>>   arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>>   9 files changed, 21 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/b=
ug.h
>> index f7827e993196..8f09ddae9305 100644
>> --- a/arch/powerpc/include/asm/bug.h
>> +++ b/arch/powerpc/include/asm/bug.h
>> @@ -112,8 +112,9 @@
>>  =20
>>   struct pt_regs;
>>   long do_page_fault(struct pt_regs *);
>> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
>> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int =
sig);
>> +void bad_page_fault(struct pt_regs *, int);
>> +void __bad_page_fault(struct pt_regs *regs, int sig);
>> +void do_bad_page_fault_segv(struct pt_regs *regs);
>=20
> What is that do_bad_page_fault_segv() ? Shouldn't it be in a separate pat=
ch ?

Hmm, yeah probably. It will be an interrupt handler (that doesn't=20
require SIGSEGV argument).

Thanks,
Nick
