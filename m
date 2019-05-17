Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 577D021631
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 11:23:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4552sK6cY3zDqSs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 19:23:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NLJ9EacG"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4552qp5l9lzDqD7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 19:22:14 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d21so3100108plr.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=rLyzi5dHdAIdr6R4wT+pyq/RFSV+rDnfA5Z7CJgbHOw=;
 b=NLJ9EacG3EGaFiGUa9CvaBG/TcZcQp8w2UeZoFY+DWMJFl1z9chBtKq/ZvYZPaZdw3
 2Rhfnwy1GAvk+lKEGrw2ZeTZV5F2XByalLFznA+CvKKIW9VPL5bH+GqreT17AUCSsYCz
 v9sVIhC9bdzCBQg8g2PfwsQchbjZnM0CXjhQiyogOt/bzt/VoTLWeyoWcvTlsbD7sJ0C
 nR59UgcBJ4JvQ9HcZwwYTKsWolE4JWdeAdov+lKuS7zfkRGOp3BRIn6fpQVOFIwKsRJM
 Qy0OPSBTCvoMpbmbgD1VMkxfJy6lgwGNYRagnS2NV4+TU2q7VvJesFXd4yexhir3RpGs
 ozwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=rLyzi5dHdAIdr6R4wT+pyq/RFSV+rDnfA5Z7CJgbHOw=;
 b=JPDOo2gsrXSf8ufr2+fqbPwdqK/tS49hoPw718lY7W8PuBzcqbwxLBDyaCqlAKAqIh
 RgWe0DIdgVBfLz1TmVQuBwqdt/XIvt+exyFGS+cpFCX+8R1z+x0DUHwozIVvnW5DchIW
 cFwjzdJMn0DQToLQzr5dQ6kYy9EabYuaklXEzv4b7Lgvp/+jVxrSJBbJXLXQNnpq/KSl
 kjYDt6Vvh0HvUUr+XFQ08dlwff6IOhDpcNnvRAFgtLSTGvfJ4WPwp+PRTITOgI2twkO5
 chPMOIYaLjU52rMvOBTcxa5p5diiPPYVpO/GVVuiZqtJlBW5ScN7avSMFkI5zIJ7gJTV
 3hlQ==
X-Gm-Message-State: APjAAAW0s/IdKQnXK9AFAdnrZxtHp+8Upc7ew39e2co7CtvQtXS0UfWJ
 MxqGnrBpEldl1AwoUkybwPc=
X-Google-Smtp-Source: APXvYqwumLyiAc9ahPOxa79cA4GXA2roWuX7PT4TkZlXiSLQbjZjxeaK7+Luf/1YkX4nkmKh13kdfA==
X-Received: by 2002:a17:902:a503:: with SMTP id
 s3mr54798441plq.16.1558084929471; 
 Fri, 17 May 2019 02:22:09 -0700 (PDT)
Received: from localhost (61-68-212-131.tpgi.com.au. [61.68.212.131])
 by smtp.gmail.com with ESMTPSA id v64sm10321056pfv.106.2019.05.17.02.22.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 02:22:08 -0700 (PDT)
Date: Fri, 17 May 2019 19:21:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/book3s/mm: Clear MMU_FTR_HPTE_TABLE when radix is
 enabled.
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au,
 paulus@samba.org
References: <20190514060205.20887-1-aneesh.kumar@linux.ibm.com>
 <1557982690.pk1t7llmyy.astroid@bobo.none>
 <df83cf16-669c-ae90-88c9-333700e38dcd@linux.ibm.com>
In-Reply-To: <df83cf16-669c-ae90-88c9-333700e38dcd@linux.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558084576.9an48zl8ss.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V's on May 16, 2019 11:36 pm:
> On 5/16/19 10:34 AM, Nicholas Piggin wrote:
>> Aneesh Kumar K.V's on May 14, 2019 4:02 pm:
>>> Avoids confusion when printing Oops message like below
>>>
>>>   Faulting instruction address: 0xc00000000008bdb4
>>>   Oops: Kernel access of bad area, sig: 11 [#1]
>>>   LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D2048 NUMA Pow=
erNV
>>>
>>> Either ibm,pa-features or ibm,powerpc-cpu-features can be used to enabl=
e the
>>> MMU features. We don't clear related MMU feature bits there. We use the=
 kernel
>>> commandline to determine what translation mode we want to use and clear=
 the
>>> HPTE or radix bit accordingly. On LPAR we do have to renable HASH bit i=
f the
>>> hypervisor can't do radix.
>>=20
>> Well we have the HPTE feature: the CPU supports hash MMU mode. It's
>> just the the kernel is booted in radix mode.
>>=20
>=20
> We are not using mmu_features to indicate the capability of the hardware=20
> right? ie, mmu_features is an indication of current running config.

It's kind of both.

> We=20
> set MMU_FTR_TYPE_RADIX if the kernel is running in radix translation=20
> mode and on similar lines we should set MMU_FTR_HPTE_TABLE if the kernel=20
> is running in only hash translation mode. Whether the hardware support=20
> these translation mode is different from which mode is currently used.

I don't see why that logic follows. We have MMU_FTR_TYPE_RADIX to
determine if we are running in radix or HPT mode, why do we need
another bit for the same thing?

>> Could make a difference for KVM, if it will support an HPT guest or
>> not.
>>=20
>=20
> kvm should not depend on MMU_FTR_HPTE_TABLE to identify whether the=20
> hardware supports hash page table translation.

Why not though?

> I don't think we do that.

It doesn't, but the point is the bit is kind of useful now (in
theory if you wanted to do something like that), but if you just
make it an inverse of the current mode bit we already have, then
it's useless.

Point is, just use the existing radix MMU selection bit that we
use everywhere else to fix the problem. If that finishes off the
only 64-bit users of the bit and you want to get rid of that as
well I'm fine with that too.

Thanks,
Nick

=
