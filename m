Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478D29E5FB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 12:43:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hlpq3YG7zDqbf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 20:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nalX0/t8"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hlmp4LXlzDq9Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:42:01 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i30so13856080pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=VWiw7Lb+HCIlUzBtXkd7EsakEG5gSdvS6oqUctzBf+w=;
 b=nalX0/t8kSqnxcBx6R7ohuy9dntZjBEg76RjxynHaNjZyXU6xh/XCG1LR4luU71iNp
 c74iDLUO/4b5yXiFK7/A229hriXoEK3ATMsziuOKRMw6tMbgtZqqe0lvxGJBgNNL9v0X
 FyffkXfEyhyO7P/+ge0vy/9vVjVRgzLeUiK2m+3unR7uwc1JQWATH7kXGDrNsZmUkj/e
 LIHSQjxR/1GpEswWx2jVqOlXXqN5e80WSsyJc/iixZ7JNmrDZqZ0XZ26do5r/xUl4x6z
 QSmSsXUu0bS4LsqJtSpZzxnOf3Q11EhLab9mKUCXQ+KXSNmSvFALRmDRI0s8Bz3O47h7
 Ii4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=VWiw7Lb+HCIlUzBtXkd7EsakEG5gSdvS6oqUctzBf+w=;
 b=LCtwEMQ7o/AgGbNrg7yl7ISEv2wZJIVu4dOb80K+LgXSuClJ06hmmJMNEU6M6qDI0E
 6DZa+yHWYlOWqLuZmyZY4fc4ibD2g+5AG5j9ZHDJBWlj/UIkbIi7RHS2SH3goCQBn1WI
 pEYunwkiBm/WwCcX4bXiXu0uYxZODRxDKbqYH5weRdHA2Y3X91orQ9o0B8LRohF7xQTi
 GZEW4Ng+Mn+0dItoyyIKASZnBVMZLOT1x+fKx5w2OPDATBBPetiDjY3l5COs0UsS6o43
 b4vSWAVzh7lIYrQA3fTRx5rWOjeXr4XZplPgGdd4oct1eLdLhe3uaygLKA2ijot8XqvU
 27GA==
X-Gm-Message-State: APjAAAVi3cjc3sinqPSbRvmFpl897MxPpm7xQZneSdiV/1kdI32GbxOe
 ZxpWJwom8CY8XQDOW7IqmCk=
X-Google-Smtp-Source: APXvYqxhrJGK6PClSFOs28AWXATmci6ohSHZWYtL/z2MK5dWtkDoDgmD6f5aeIL5lq7hz5EYVvfzjQ==
X-Received: by 2002:a65:4505:: with SMTP id n5mr18502823pgq.301.1566902519729; 
 Tue, 27 Aug 2019 03:41:59 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id r4sm16283122pfl.127.2019.08.27.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 03:41:59 -0700 (PDT)
Date: Tue, 27 Aug 2019 20:41:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/64: remove support for kernel-mode syscalls
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-3-npiggin@gmail.com>
 <4bcfa6ed-07f7-f162-664f-134b40124dda@c-s.fr>
 <1566900842.ttf5qhpflv.astroid@bobo.none>
In-Reply-To: <1566900842.ttf5qhpflv.astroid@bobo.none>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566902428.f4rgy4icjs.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on August 27, 2019 8:20 pm:
> Christophe Leroy's on August 27, 2019 4:13 pm:
>>=20
>>=20
>> Le 27/08/2019 =C3=A0 05:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> There is support for the kernel to execute the 'sc 0' instruction and
>>> make a system call to itself. This is a relic that is unused in the
>>> tree, therefore untested. It's also highly questionable for modules to
>>> be doing this.
>>=20
>> I like it.
>>=20
>> I dropped support for that in PPC32 when I added fast-path syscalls.
>=20
> Good, then we'll match again.
>=20
>>> -	beq	2f			/* if from kernel mode */
>>>   #ifdef CONFIG_PPC_FSL_BOOK3E
>>>   START_BTB_FLUSH_SECTION
>>>   	BTB_FLUSH(r10)
>>>   END_BTB_FLUSH_SECTION
>>>   #endif
>>>   	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
>>> -2:	std	r2,GPR2(r1)
>=20
> Btw. there is a hunk which restores this optimisation but it leaked
> into a later patch, I'll move it back here.

I'm wrong. Now I look at it again, the hunk should be removed
completely of course.

Thanks,
Nick
=
