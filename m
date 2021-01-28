Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F56B306896
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 01:24:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR1Rw3xz1zDr4M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 11:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RkQFqOEx; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR1K51BJDzDr5R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:18:16 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id g3so2208656plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 16:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=quEFvlOMZJMXid0VyprFDIb4Lr8SL8a4/QNJfFNOYXY=;
 b=RkQFqOExQxPBqhGdIVIrNk2WJWTVxgfC7izHHYmrcKPrBFGKR0YbygRNj5YbYacwLd
 Aqxn++vNOxZ6aFOsJz1YFV0EQIoLjhhLnh4utQn9mUCFeNTidwn0p684F5/h7eB6WNom
 D6cc4bP+YKPegIcrJzZ0HqBVkcWiPv6LJH/76q9m0WMP/zTtOw+XSiZowcXmX3kpe51N
 TUR9UodAz8Q8p6bcNBfW8LhHx2oVFJVHzgf5JPmqvjiHvrY9v6lmSUtcQs3FSVF7EVOu
 4y2mnvaoHYN8ipdXeMvwgWdkVaEFLLO+SJtXlOFnWMnL3nePULruyk39MTWldTJiawBj
 Djkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=quEFvlOMZJMXid0VyprFDIb4Lr8SL8a4/QNJfFNOYXY=;
 b=Di2wnatfWdGciAXqaWDqpkEJbC7x8nQVl4y359SG4ubaLL+yz0UYcEec72KN031ptb
 pa8YklEqAljOELV3OAqC72jpMqw4mZFT4Ot8IPHxIN7HGjhyYQlVYOv4cd+lEBFta7rz
 qqeMDuuikawdE71HQFAMLi4Sop3GclyUARHJmjOp4AGlNhkgyjrOgzARrpTciScejw7V
 oETWRmIDrOGWqM3LnaMgmABkJ0frQcQ2VcRysemyfeTbkvoUR5/B6TODF0rkMsfhj3Fz
 JoOZnnUscoh0OsXn+nzR+TVIn59rRVFKaroHCJ8Kvsp9J3NaQ2VGpKKrFglaf7qrpRhf
 SxZw==
X-Gm-Message-State: AOAM530SN17CtWlKpa/ucI3vV2SIZIaMouq5xPak9EnXBb5qyOM9TDYw
 CZp2nuGUVDXOBGERWQPfC44=
X-Google-Smtp-Source: ABdhPJw+jKsyilqAeteTqNDXHjkpKSB8AIxIg5lPQo49UnU14rQQfUiEVUIGqCV8eDZgU94zLLwvVg==
X-Received: by 2002:a17:902:9a93:b029:e0:e41:f088 with SMTP id
 w19-20020a1709029a93b02900e00e41f088mr5968584plp.55.1611793093176; 
 Wed, 27 Jan 2021 16:18:13 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id kr9sm3044317pjb.0.2021.01.27.16.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 16:18:12 -0800 (PST)
Date: Thu, 28 Jan 2021 10:18:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/fault: fix wrong KUAP fault for IO_URING
To: Jens Axboe <axboe@kernel.dk>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Zorro Lang
 <zlang@redhat.com>
References: <20210127145648.348135-1-zlang@redhat.com>
 <cce83328-d996-defc-6c87-97cd24ec7027@csgroup.eu>
 <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
In-Reply-To: <a8013c71-433a-96b3-c657-66ac2ba5b838@kernel.dk>
MIME-Version: 1.0
Message-Id: <1611792928.nw4g8h8kj4.astroid@bobo.none>
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

Excerpts from Jens Axboe's message of January 28, 2021 5:29 am:
> On 1/27/21 9:38 AM, Christophe Leroy wrote:
>>=20
>>=20
>> Le 27/01/2021 =C3=A0 15:56, Zorro Lang a =C3=A9crit :
>>> On powerpc, io_uring test hit below KUAP fault on __do_page_fault.
>>> The fail source line is:
>>>
>>>    if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address,=
 is_write)))
>>>        return SIGSEGV;
>>>
>>> The is_user() is based on user_mod(regs) only. This's not suit for
>>> io_uring, where the helper thread can assume the user app identity
>>> and could perform this fault just fine. So turn to use mm to decide
>>> if this is valid or not.
>>=20
>> I don't understand why testing is_user would be an issue. KUAP purpose
>> it to block any unallowed access from kernel to user memory
>> (Equivalent to SMAP on x86). So it really must be based on MSR_PR bit,
>> that is what is_user provides.
>>=20
>> If the kernel access is legitimate, kernel should have opened
>> userspace access then you shouldn't get this "Bug: Read fault blocked
>> by KUAP!".
>>=20
>> As far as I understand, the fault occurs in
>> iov_iter_fault_in_readable() which calls fault_in_pages_readable() And
>> fault_in_pages_readable() uses __get_user() so it is a legitimate
>> access and you really should get a KUAP fault.
>>=20
>> So the problem is somewhere else, I think you proposed patch just
>> hides the problem, it doesn't fix it.
>=20
> If we do kthread_use_mm(), can we agree that the user access is valid?

Yeah the io uring code is fine, provided it uses the uaccess primitives=20
like any other kernel code. It's looking more like a an arch/powerpc bug.

> We should be able to copy to/from user space, and including faults, if
> that's been done and the new mm assigned. Because it really should be.
> If SMAP was a problem on x86, we would have seen it long ago.
>=20
> I'm assuming this may be breakage related to the recent uaccess changes
> related to set_fs and friends? Or maybe recent changes on the powerpc
> side?
>=20
> Zorro, did 5.10 work?

Would be interesting to know.

Thanks,
Nick
