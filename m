Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0175F18B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 04:39:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45fMcM3SQwzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 12:38:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZtcmkLsE"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45fMZb0V4bzDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 12:37:26 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o13so2137155pgp.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 19:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=wB6J8TroCOCC4EdXtYGznx0KA4qGa60/14Gvfucvcnc=;
 b=ZtcmkLsE/yYUueFrbzZ/NmuyR2OCuF+8yuSnxIW7Cg4MXHDqex83T2yA/OoBvLQNAC
 qFEj+dW4k0Xmle+TKVenRJDhmgkpyjw5aYavptMGXXzEf6xpeNoHjb5zoFYFPN0+xxNM
 fAB+vkHfxrUrNYKUKX6HpKBw4DATjRsW28ZB/yWY2kcZnZGfWhgmg9qKnxMBKNHGxz4X
 dlbd7t9cvo3gQxGiOOHaFJhj63nlOLIwR2jBXcH3xGVMXdjops5TB8Nc+aeJNl4b0+wU
 /dwCLhG9M7GfWwyaAFs/mYQkGrv3JODOYXZ3d5NdFV+WBs5vS9Mrr3EuUOy+Ogk0JEuk
 XNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=wB6J8TroCOCC4EdXtYGznx0KA4qGa60/14Gvfucvcnc=;
 b=ERgnVZVsdWOSf2aUTefkyW4HlgUFTX4sj2DUlb/AvLAdIdTbqCMI/h621+OgK8xh7N
 Nzl6PQixQCV8evxLDEWcKBUh+0sRFXmDNXxAtcGslERbTG9O4uskaNidLekf3C8KHDLj
 k3zMte6jYn0ez78kwY3Ut2ZzTR/CtGX6eElOCiQV/VJd+KDJu/XzuFxGeqDyb6q8Gu0g
 s2P4nQm4XwrDqwzJJZAsnvaRyJcMsAo7pJic3UHebqsGUhsdpFUU0ZpCWJTz7SK4sCbi
 p7lTBmlGSBZsOGx53ZW6qlrSM9tTjZrq5ZvHOFHrUYp+Sbpr1SwdilcEUsxvWn0Y3AE5
 lLyA==
X-Gm-Message-State: APjAAAXVrpnV9UdfuMMFP6Snfgcby4S1Upwa39zu2bEqu46L31gkBbHS
 COOEM0sgMCrYXaLpyATE9xg=
X-Google-Smtp-Source: APXvYqwOmShGedLUcfHwiqBKtjJ/3bsnVcMRJ7c+70dZWZ3NBes4WEuBHHWfYH/MOusnDu2G1qOY+w==
X-Received: by 2002:a65:640d:: with SMTP id a13mr31114517pgv.256.1562207842946; 
 Wed, 03 Jul 2019 19:37:22 -0700 (PDT)
Received: from localhost (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id f72sm3804309pjg.10.2019.07.03.19.37.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 19:37:22 -0700 (PDT)
Date: Thu, 04 Jul 2019 12:36:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
To: Reza Arbab <arbab@linux.ibm.com>
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-10-santosh@fossix.org>
 <1562047959.5y756f60wn.astroid@bobo.none>
 <20190703172008.aiyofnhqgbzi6ckw@arbab-vm>
In-Reply-To: <20190703172008.aiyofnhqgbzi6ckw@arbab-vm>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562207031.05iwu5t2xm.astroid@bobo.none>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reza Arbab's on July 4, 2019 3:20 am:
> On Tue, Jul 02, 2019 at 04:17:11PM +1000, Nicholas Piggin wrote:
>>Santosh Sivaraj's on July 2, 2019 3:19 pm:
>>> --- a/arch/powerpc/kernel/exceptions-64s.S
>>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>>> @@ -458,6 +458,12 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
>>>  	bl	machine_check_early
>>>  	std	r3,RESULT(r1)	/* Save result */
>>>
>>> +	/* Notifiers may be in a module, so enable virtual addressing. */
>>> +	mfmsr	r11
>>> +	ori	r11,r11,MSR_IR
>>> +	ori	r11,r11,MSR_DR
>>> +	mtmsr	r11
>>
>>Can't do this, we could take a machine check somewhere the MMU is
>>not sane (in fact the guest early mce handling that was added recently
>>should not be enabling virtual mode either, which needs to be fixed).
>=20
> Rats. So in machine_check_handle_early() there are two options; either=20
>=20
> 1. The mc is unhandled/unrecoverable. Stay in real mode, proceed to=20
> unrecover_mce(), the fatal path of no return (panic, reboot, etc).
>=20
> 2. The mc is handled/recovered. Return from MCE where any further action=20
> can be done by processing the machine check event workqueue. Am I =20
> understanding you correctly that this is the absolute earliest we can=20
> get back to virtual mode?

Yes.

> Since the notifier chain is actually part of the decision between (1)=20
> and (2), it's a hard limitation then that callbacks be in real address=20
> space. Is there any way to structure things so that's not the case?

If we tested for KVM guest first, and went through and marked (maybe
in a paca flag) everywhere else that put the MMU into a bad / non-host
state, and had the notifiers use the machine check stack, then it
would be possible to enable MMU here.

Hmm, testing for IR|DR after testing for KVM guest might actually be
enough without requiring changes outside the machine check handler...
Actually no that may not quite work because the handler could take a
SLB miss and it might have been triggered inside the SLB miss handler.

All in all I'm pretty against turning on MMU in the MCE handler
anywhere.

> Luckily this patch isn't really necessary for memcpy_mcsafe(), but we=20
> have a couple of other potential users of the notifier from external=20
> modules (so their callbacks would require virtual mode).

What users are there? Do they do any significant amount of logic that
can not be moved to vmlinux?

Thanks,
Nick
=
