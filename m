Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF64221936
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 03:01:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6bYv3F03zDqB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:01:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FvGyXOqu; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6bTS5cHGzDqFD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 10:58:03 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id f7so5080248wrw.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 17:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8t7YbdL4p7H/NHbPbXemPXmpbmcct4N4l3AbjbVoPJI=;
 b=FvGyXOquQxyBllbnVnMrqu56DGo7jKIGoAFYJhNgt3DFk0WkK2alTCyAcjS3Y59Iph
 DiyU6QZ52D4TiBE/VdpGFmOxusJiBC4l7xN2oW4NS6Y9LG7H4+Pfpu8oaB0+0BIb04+E
 z5JBEWjYcxsUetVd/QcagkLVnRKyp/lSoze0AuR6RMOPEmDJjFWpjMuHNQWEk+bp6f9c
 rRy0bMIKM/MXLO2f4fq5XYEwMJFccnWbCwPbOHzqijWq5VVFqhJAkgb2b6co+gRYFn0m
 TL+J90QticE8tR/zlSR+P0sooTb2+g4aQ+zvjlxD2vRqTmfCNv8r5qBzW1XBQerX+6+h
 tg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8t7YbdL4p7H/NHbPbXemPXmpbmcct4N4l3AbjbVoPJI=;
 b=F6E0zoO+WM+vQBBTnTTswUQRK2H2Yib71lRlKhEg2Cf5yc21fofzmxo5t9uX4EuJ+o
 klinGG3GtX4vrojpsJ7uAxgx/6qMzGSfakX562SEf98OVDot0QroOMmVk5IBs64JuI4y
 ssDNTtdAV/Km4fklFSsxFyRWzaqH53FswkTwXNiK4DCGSPjtcILMuRZNPX+ovUWMGB2W
 JR+ay1bg6AenGKGygMuaP/CA7Ob3wQhaWo4kcOLRiBTzXrkRZOXbsftdaD8ybo8cXg56
 aWTPuEJQ+6V11CW36TDZtD5uYZA3qwOuPHyX26f1Rtw4P6XLZM++/szMUsClq5K1Bfdi
 4IFw==
X-Gm-Message-State: AOAM531jElo3Lriw1nfRx2F9+S7PmGO1EOtUqSnb3SB7+ZIfn9FabhM3
 Vt93ZPpi9egeHZWgZZly0I8=
X-Google-Smtp-Source: ABdhPJwEy/3pQsa1L3+D7ZvBB6nAYRwUGYIzdbuYLTH3zKC4IimNZtkCXjKrQG17cZzjo0Piw1y4YA==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr2308607wrq.357.1594861078004; 
 Wed, 15 Jul 2020 17:57:58 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id j4sm6295369wrp.51.2020.07.15.17.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 17:57:57 -0700 (PDT)
Date: Thu, 16 Jul 2020 10:57:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
References: <20200715094829.252208-1-npiggin@gmail.com>
 <849841781.14062.1594816035327.JavaMail.zimbra@efficios.com>
In-Reply-To: <849841781.14062.1594816035327.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Message-Id: <1594860978.y7ksqnxc5n.astroid@bobo.none>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Mathieu Desnoyers's message of July 15, 2020 10:27 pm:
> ----- On Jul 15, 2020, at 5:48 AM, Nicholas Piggin npiggin@gmail.com wrot=
e:
> [...]
>> index 47bd4ea0837d..a4704f405e8d 100644
>> --- a/arch/powerpc/include/asm/exception-64s.h
>> +++ b/arch/powerpc/include/asm/exception-64s.h
>> @@ -68,6 +68,13 @@
>>  *
>>  * The nop instructions allow us to insert one or more instructions to f=
lush the
>>  * L1-D cache when returning to userspace or a guest.
>> + *
>> + * powerpc relies on return from interrupt/syscall being context synchr=
onising
>> + * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_SY=
NC_CORE
>> + * without additional additional synchronisation instructions. soft-mas=
ked
>> + * interrupt replay does not include a context-synchronising rfid, but =
those
>> + * always return to kernel, the context sync is only required for IPIs =
which
>> + * return to user.
>>  */
>> #define RFI_FLUSH_SLOT							\
>> 	RFI_FLUSH_FIXUP_SECTION;					\
>=20
> I suspect the statement "the context sync is only required for IPIs which=
 return to
> user." is misleading.
>=20
> As I recall that we need more than just context sync after IPI. We need c=
ontext sync
> in return path of any trap/interrupt/system call which returns to user-sp=
ace, else
> we'd need to add the proper core serializing barriers in the scheduler, a=
s we had
> to do for lazy tlb on x86.
>=20
> Or am I missing something ?

Maybe ambiguous wording. For IPIs, the context synch is only required=20
for those which return to user. Other things also require context sync.

I will try to improve it.

Thanks,
Nick
