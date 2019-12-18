Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBD123FFA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 08:03:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47d5ZS0MSjzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2019 18:03:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="HJ57PQOL"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47d5XR2wlyzDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2019 18:01:42 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id l24so759693pgk.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=BZCWkhOFV3yf2yR16aoRfXzQzGQ6DZmCFUiKpUKgtKg=;
 b=HJ57PQOLVeFDWs5pPEm8r4CDItVMeCu5KLeQ4NJI+/3RFeWqSohuCj05oj8iIksoji
 LBJWTgT0aPLaGtmuAEfWgKyhcfyHKTH7JdTgkG9ZP0bJVOaVHl4n81pUT/5kwswuxkI2
 cICePRCvQ2kUgGEW5NzFKPmykXeOTEAu3FNAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=BZCWkhOFV3yf2yR16aoRfXzQzGQ6DZmCFUiKpUKgtKg=;
 b=AjnhOP9NQOeeiWryyXkEAIC6O6at1ZNSvluE0wyz7yruJd8dBAizEINxrQ3wnoZmC9
 hzXAP8j589IYd7qvqTI7uNlqzVPNM+qVjQTplECQ3sZLf2OVbtdiyGqPb3gZgKgkC2NT
 qtXWT8GXVPYbjQ16NTsnIh7nuudECZjdbXQAMQVXFPAIr/kirjowQJzDVOmuBHplrvDZ
 i/Q7pFKyTg3ggt8/0uoUgfsOjJ0fHWCLSbB0KP0VgLLb15AVlKEFDMCNm2/uEiMlMeud
 4zanrL711VVfz/3XKj3wixDghLHH26T+Dmmp2FsXiXP8dxZAQm0SmsNW+hfcbJ6v8m9o
 RPkQ==
X-Gm-Message-State: APjAAAVFmlGkL/ji77ArRIE/rYyGgbliSMbjGVPFggWBSDPtmHZYvZd9
 IJoEJYAi9JNoQt6iLqbzNpH06g==
X-Google-Smtp-Source: APXvYqyGk7+DsmSnrPB6g5gp31sxI6sfx2J8mSWVUByqzssCbVtU40pAOxr5YrMiphHnf0wAgDdaSw==
X-Received: by 2002:a63:3484:: with SMTP id b126mr1263334pga.17.1576652499643; 
 Tue, 17 Dec 2019 23:01:39 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-a084-b324-40b3-453d.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:a084:b324:40b3:453d])
 by smtp.gmail.com with ESMTPSA id i127sm1608577pfc.55.2019.12.17.23.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 23:01:38 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc: Book3S 64-bit "heavyweight" KASAN support
In-Reply-To: <CACzsE9q1iLgoMLzVy0AYeRvWbj=kY-Ry52y84PGtWw3YXXFipA@mail.gmail.com>
References: <20191212151656.26151-1-dja@axtens.net>
 <20191212151656.26151-4-dja@axtens.net>
 <CACzsE9q1iLgoMLzVy0AYeRvWbj=kY-Ry52y84PGtWw3YXXFipA@mail.gmail.com>
Date: Wed, 18 Dec 2019 18:01:34 +1100
Message-ID: <87y2vat8vl.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: aneesh.kumar@linux.ibm.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


>>    [For those not immersed in ppc64, in real mode, the top nibble or 2 b=
its
>>    (depending on radix/hash mmu) of the address is ignored. The linear
>>    mapping is placed at 0xc000000000000000. This means that a pointer to
>>    part of the linear mapping will work both in real mode, where it will=
 be
>>    interpreted as a physical address of the form 0x000..., and out of re=
al
>>    mode, where it will go via the linear mapping.]
>>
>
> How does hash or radix mmu mode effect how many bits are ignored in real =
mode?

Bah, you're picking on details that I picked up from random
conversations in the office rather than from reading the spec! :P

The ISA suggests that real addresses space is limited to at most 64
bits. ISAv3, Book III s5.7:

| * Host real address space size is 2^m bytes, m <=3D 60;
|   see Note 1.
| * Guest real address space size is 2 m bytes, m <=3D 60;
|   see Notes 1 and 2.
...
| Notes:
| 1. The value of m is implementation-dependent (sub-
|    ject to the maximum given above). When used to
|    address storage or to represent a guest real
|    address, the high-order 60-m bits of the =E2=80=9C60-bit=E2=80=9D
|    real address must be zeros.
| 2. The hypervisor may assign a guest real address
|    space size for each partition that uses Radix Tree
|    translation. Accesses to guest real storage out-
|    side this range but still mappable by the second
|    level Radix Tree will cause an HISI or HDSI.
|    Accesses to storage outside the mappable range
|    will have boundedly undefined results.

However, it doesn't follow from that passage that the top 4 bits are
always ignored when translations are off ('real mode'): see for example
the discussion of the HRMOR in s 5.7.3 and s 5.7.3.1.=20

I think I got the 'top 2 bits on radix' thing from the discussion of
'quadrants' in arch/powerpc/include/asm/book3s/64/radix.h, which in turn
is discussed in s 5.7.5.1. Table 20 in particular is really helpful for
understanding it. But it's not especially relevant to what I'm actually
doing here.

I think to fully understand all of what's going on I would need to spend
some serious time with the entirety of s5.7, because there a lot of
quirks about how storage works! But I think for our purposes it suffices
to say:

  The kernel installs a linear mapping at effective address
  c000... onward. This is a one-to-one mapping with physical memory from
  0000... onward. Because of how memory accesses work on powerpc 64-bit
  Book3S, a kernel pointer in the linear map accesses the same memory
  both with translations on (accessing as an 'effective address'), and
  with translations off (accessing as a 'real address'). This works in
  both guests and the hypervisor. For more details, see s5.7 of Book III
  of version 3 of the ISA, in particular the Storage Control Overview,
  s5.7.3, and s5.7.5 - noting that this KASAN implementation currently
  only supports Radix.

Thanks for your attention to detail!

Regards,
Daniel



