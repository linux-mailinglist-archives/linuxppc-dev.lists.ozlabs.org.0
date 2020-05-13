Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4BB1D0625
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 06:52:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MMj33SP9zDqcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 14:52:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MMgH0gygzDqXt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:50:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U8qEq4dP; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49MMgF4vLfz9BVP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 14:50:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49MMgF4Qlyz9sSm; Wed, 13 May 2020 14:50:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U8qEq4dP; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49MMgF0Jfqz9sPF
 for <linuxppc-dev@ozlabs.org>; Wed, 13 May 2020 14:50:32 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id l73so1271822pjb.1
 for <linuxppc-dev@ozlabs.org>; Tue, 12 May 2020 21:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=rXMnRWCkTuwQoVZ4c9NYVwi3/vfOaL78YGqK9/VgwfQ=;
 b=U8qEq4dP6q4LnO7k96M/3X+KhnmBheDcdL/ESRG6I1iBXV8hsqFYFW19kImPInRp0l
 gJdlq00ZXzG7uwAcX/0KfJgtGnJsTOJ9YDv9mUBbl5CBpxe0qwuJatSHwFMa7/Z4UcpX
 tiB4DcBWidSc1oSntiE4MNrZ4gtLmK7fDDzjxoCD1HFsVNASY2LKSN1ag/JFhpCWXAIn
 jy1Z5R8I5jDoj7YnjAjz8A2PF7q6IboYF/UcMd11YDGqhcI6Za0m0yQBnFxVOdgJbgzQ
 fBBn0ewpg8bMQmIU7EnEvVh2Hmuu3JfrpUuC24LH/cb/leI/UJR6+FYxh70iMigvLpm7
 rCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=rXMnRWCkTuwQoVZ4c9NYVwi3/vfOaL78YGqK9/VgwfQ=;
 b=FqINT8aJYYDUXGGdwMwUY6WuxWZryJwX7B8A0uJzPELVQXeNhTDDgRn0K/BEdWhtX9
 b5zrm0EcdXT8BarpHBSzh9hmPk4aJQT22a+Dam6zmOxW9AIlIbMa+RuejpuRaeKY+OJZ
 mxEKSc+k4TrzJVuxIiS0EoM4wBytBZY1wqpj876xEUJF2ct0uAAG2t4+qQIVEEI02BXu
 Bhr+fdM5UVRpeT9Gbdb5AZmXsClBKSgTQFdcQs3j5sfQmvjQj+YciJPAV6Xi/idVBKD/
 xR6OOwoOiCcmzQVdej+aSkg/RHF/HspcER7wdBwXvseoYVtNllgwiMKRBZRlZd6LlBYl
 6SAQ==
X-Gm-Message-State: AGi0PuYO8TXNL5+5uumiiQXfBc60awhUpXY5Hfc43EJalrXSPFOWPpbW
 FVHLzuMurNXSnFO5duKMPbeTrqNi
X-Google-Smtp-Source: APiQypKpX4oPJyJzTweVZWuXdqI/hdV6pJ14dcTodVExehuE1dibQHDDqJoXznv+CPGiP8nBT9YydQ==
X-Received: by 2002:a17:90a:24a7:: with SMTP id
 i36mr32521433pje.32.1589345429795; 
 Tue, 12 May 2020 21:50:29 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id m13sm2940028pff.9.2020.05.12.21.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 21:50:29 -0700 (PDT)
Date: Wed, 13 May 2020 14:50:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/2] powerpc/64s/hash: Add stress_hpt kernel boot
 option to increase hash faults
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20200511125825.3081305-1-mpe@ellerman.id.au>
 <20200511125825.3081305-2-mpe@ellerman.id.au>
In-Reply-To: <20200511125825.3081305-2-mpe@ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1589344619.irwrodmhoy.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of May 11, 2020 10:58 pm:
> +void hpt_do_stress(unsigned long ea, unsigned long access,
> +		   unsigned long rflags, unsigned long hpte_group)
> +{
> +	unsigned long last_group;
> +	int cpu =3D raw_smp_processor_id();
> +
> +	last_group =3D stress_hpt_last_group[cpu];
> +	if (last_group !=3D -1UL) {
> +		while (mmu_hash_ops.hpte_remove(last_group) !=3D -1)
> +			;

This seems to have issues causing hangs and livelocking, particularly on=20
SMP guests. I think another CPU taking a fault and inserting an HPTE
into this group can get stuck when it has its entry removed before it can
return from the fault and load its TLB, so it faults again.

The hpte_remove hypercall must be slow enough on a guest that this loop=20
doesn't finish before the other CPU comes in and puts another entry in=20
there. Which explains why I didn't see it on bare metal.

Removing the loop doesn't end up generating a lot of faults because most=20
HPTEs are userspace, so they end up overwhelming the kernel HPTE=20
removal.

Using hpte_invalidate to invalidate the specific entry might be the go,
although it removes some element of randomness at least on PowerNV --=20
the kernel TLB is still there and will fault "some time" when the TLB=20
entry drops out.

Maybe hpt stress should go into the hash implementation. I'm thinking=20
about what to do.

Better drop this patch for now, but the SLB one should be good to go.

Thanks,
Nick
