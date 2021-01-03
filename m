Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC32E8B78
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 10:19:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7tVc2fMDzDqDs
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Jan 2021 20:19:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D/NIdKBS; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7tSv0kZ3zDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 Jan 2021 20:17:30 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id s15so12832869plr.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 03 Jan 2021 01:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CBNRAqcJ6O6vwf7NUgGTfHkjviEakxNQ01Fv3RvUaHA=;
 b=D/NIdKBSGNS9ZBOGRDP6SDeUoVuS2dvc/a6LnEknoHAZF5kdZ7+L6QYkiWu1u6r00O
 aBR+u6iSVM2uuccPoHTOQHq8/H126oCjk/dRAVdmXuIygsMHyHiG66yMZQCGI1+rACsh
 3Aqk/XOIHPKjMULnA68IPJ640jos1I2fYDA4288pQfDGi7STIe0rdttxCKUeOIq10BOL
 rXXGGHdiKtPwntFSRWU9mZB1weG/1Xx3mOnnYZ8MRlD4d72uSlU6baRYnEFtpuIY8Qmj
 uwSvUQZYUHetCGBnF/ORnLEmcqMZvYZTgvhJkw3zA6PWKNY5ne9nIQwVoj7+RfPgSngo
 rkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CBNRAqcJ6O6vwf7NUgGTfHkjviEakxNQ01Fv3RvUaHA=;
 b=SpSWe2wnhG7P9yeutFKdNTRZqjYtRJ0EvoxR+pQf+lLXXvn3zeZ1yofH6K8S5B/iDZ
 xwpaGW2pMXOJZ0m0lIkD5IvvSzHmHoUQpG+tuZ1lgDeBPNrIgutodwPgSwuPjmau3Tni
 QCUHrlw1T15RoVEKdA6FgdXVAIihzvPU2+hx04ISQxkl9RaEkZXk7yRy4xDVzaaFDWfv
 XYfRqhkJ9SmtRgJ5t7Uaf9t+a+6Q3IClb3QMqs/7/7xaBw4UeOsSf3g+NSl5cjrsRBqK
 knjUrtxy8yCUgBbuoDvzsG+fN+DahsYSdz7xWqP0ogci9cu/5AQhFovivg6ge/ynNV5h
 sMYQ==
X-Gm-Message-State: AOAM533Rg2pyZ0MbxMXzN8xEPugzAXOL8oVqTcuy4+0lEZXP2VHaY2Nf
 4UaC0Kw+TW9UG1GNtIJK+zQ=
X-Google-Smtp-Source: ABdhPJx5KyywU5QZ2U+ginjxxFqYYarqCdDkDcYuvqZkWBt95aFAkqtKK1nuU4x2RPiL0Bvm29fwzg==
X-Received: by 2002:a17:90a:4a4:: with SMTP id
 g33mr24180760pjg.221.1609665447289; 
 Sun, 03 Jan 2021 01:17:27 -0800 (PST)
Received: from localhost (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id z3sm37209604pgs.61.2021.01.03.01.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 01:17:26 -0800 (PST)
Date: Sun, 03 Jan 2021 19:17:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/21] powerpc/64s: move the last of the page fault
 handling logic to C
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210102122508.1950592-1-npiggin@gmail.com>
 <20210102122508.1950592-3-npiggin@gmail.com>
 <20210102185630.Horde.GwG0xTTuKDzS6PsMZTUftw1@messagerie.c-s.fr>
In-Reply-To: <20210102185630.Horde.GwG0xTTuKDzS6PsMZTUftw1@messagerie.c-s.fr>
MIME-Version: 1.0
Message-Id: <1609663625.fcccd2vjjf.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 3, 2021 3:56 am:
> Nicholas Piggin <npiggin@gmail.com> a =C3=A9crit=C2=A0:
>=20
>> The page fault handling still has some complex logic particularly around
>> hash table handling, in asm. Implement this in C instead.
>=20
> Hi,
>=20
> I'm afk at the moment and unable to look at this in details before one =20
> week but this looks pretty complexe, especially the churn around =20
> ___do_page_fault
> Do we really need 3 layers of do_page_fault() ?

Actually it doesn't, patch 10 wants it. I can move it to there at least
which should make this a bit less churn.

It's convenient because lots of return paths in __do_page_fault, but I=20
could try convert that to a `goto out` style.

> I think it would likely be more straight forward to just move =20
> handle_page_fault() to C.

The hash fault stuff makes things work better this way. Perhaps if I can=20
get to the bottom of the context tracking in the hash fault (I think we
perhaps should avoid it), then it could go back to a common code path.

> There also seems to be some unrelated changes, like the (msr & MSR_PR) =20
> changed to user_mode(regs).

That's part of making it callable from asm and the radix vs hash
prototypes the same so there are no added complexity in the asm:

>> @@ -1439,13 +1440,17 @@ EXC_COMMON_BEGIN(data_access_common)
>>  	GEN_COMMON data_access
>>  	ld	r4,_DAR(r1)
>>  	ld	r5,_DSISR(r1)
>> +	addi	r3,r1,STACK_FRAME_OVERHEAD
>>  BEGIN_MMU_FTR_SECTION
>> -	ld	r6,_MSR(r1)
>> -	li	r3,0x300
>> -	b	do_hash_page		/* Try to handle as hpte fault */
>> +	bl	do_hash_fault
>>  MMU_FTR_SECTION_ELSE
>> -	b	handle_page_fault
>> +	bl	do_page_fault
>>  ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)

I'll see if anything can be done to move some such changes ahead.

Thanks,
Nick
