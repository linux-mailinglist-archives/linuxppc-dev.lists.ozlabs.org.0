Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E33D600A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 07:32:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45g3QF4vm2zDqSg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 15:32:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="j0kXVusR"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45g3NY64VdzDqNH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 15:31:09 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r1so3770990pfq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jul 2019 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=qpBjxF0ZBUXgG0nB1OqStakBMQBdIcy+GceNtT2cyM4=;
 b=j0kXVusRHns+xJp6OnwHEe7uiP6tG5SaSUmt725Lx2LvQAA0lyD7ohNdkBQOvtnF+b
 NXLYdMFH0A21mixzJA+ihW9i+z5P+tNjYi/c0FjlIEoX8JZ+m8gM4IkkWFBCsoBYC/LB
 nyTJ8JjjAIuWxkWFXS2e2JSBU7UJOKyCfE/hPwN+U+N9XBr75RMONhg2Pkb12YTnIycq
 bWgfUL7Ud9Tu9y1ePvCVc5E1JzPZFLi8+1MarXlk4TKt3MnlzZNd+Ww4nhsVzIrwULRg
 ZYAXK4UP/xVeBMS83dPrbA4QG34h8/gK/YciJp7MHfXHNere2M6Z/JQFa5zA5qmM57gv
 EveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=qpBjxF0ZBUXgG0nB1OqStakBMQBdIcy+GceNtT2cyM4=;
 b=s40rsOuNaI0RwpZfxQlS8jxkS7Ki5V9o8UIm17mm6hyZ9athqahKV6iSuCff1uEZQ/
 tzMuIGB/Kk9lTI/NwIxXt7VxPYvGrCcd1cXZCFCnMkgDw/ZdpjbvwO/Idur2HYLiG2Cs
 IegPROdzVZ+WLdPiAvfRDL2YP2WKKlgknGNRXRuY+cGXWnt4/5PRbprIlktp+rd9tCPo
 vAlE5p6Wj3vfhlA3XOPntfaQT6axOtw2VZ1eVFpCGvl3i9C2sz958ZcO9WJl0hwAncgv
 rszGWd1biE7luMNDubVTDLHUj1Eqc3vaT5jWUCb4UJ97kIQgQIZtP2qhb38cLa4RvmmJ
 a8PQ==
X-Gm-Message-State: APjAAAVLm/YpSFDvljrZ++lOtbnsiXyDNiA9jzik+HdBfvAYk0BsbbpF
 Qj919Luaj0xjlXTuhun9MJQ=
X-Google-Smtp-Source: APXvYqwL3IdGs45NsJEMCpGR0tjmiNLoTsJfPQj/HnKSqPCgA9yTvvJasFxpjcfto7chGT21s5itCg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr2451752pjb.115.1562304665771; 
 Thu, 04 Jul 2019 22:31:05 -0700 (PDT)
Received: from localhost (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id i1sm10283640pjt.3.2019.07.04.22.31.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 22:31:05 -0700 (PDT)
Date: Fri, 05 Jul 2019 15:29:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
To: Reza Arbab <arbab@linux.ibm.com>
References: <20190702051932.511-1-santosh@fossix.org>
 <20190702051932.511-10-santosh@fossix.org>
 <1562047959.5y756f60wn.astroid@bobo.none>
 <20190703172008.aiyofnhqgbzi6ckw@arbab-vm>
 <1562207031.05iwu5t2xm.astroid@bobo.none>
 <20190705025042.nnov5s45jc4jd5ld@arbab-vm>
In-Reply-To: <20190705025042.nnov5s45jc4jd5ld@arbab-vm>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562304274.ecukc5yx4t.astroid@bobo.none>
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

Reza Arbab's on July 5, 2019 12:50 pm:
> On Thu, Jul 04, 2019 at 12:36:18PM +1000, Nicholas Piggin wrote:
>>Reza Arbab's on July 4, 2019 3:20 am:
>>> Since the notifier chain is actually part of the decision between (1)
>>> and (2), it's a hard limitation then that callbacks be in real address
>>> space. Is there any way to structure things so that's not the case?
>>
>>If we tested for KVM guest first, and went through and marked (maybe
>>in a paca flag) everywhere else that put the MMU into a bad / non-host
>>state, and had the notifiers use the machine check stack, then it
>>would be possible to enable MMU here.
>>
>>Hmm, testing for IR|DR after testing for KVM guest might actually be
>>enough without requiring changes outside the machine check handler...
>>Actually no that may not quite work because the handler could take a
>>SLB miss and it might have been triggered inside the SLB miss handler.
>>
>>All in all I'm pretty against turning on MMU in the MCE handler
>>anywhere.
>=20
> Hey, fair enough. Just making sure there really isnt't any room to make=20
> things work the way I was trying.

Understand.

>=20
>>> Luckily this patch isn't really necessary for memcpy_mcsafe(), but we
>>> have a couple of other potential users of the notifier from external
>>> modules (so their callbacks would require virtual mode).
>>
>>What users are there? Do they do any significant amount of logic that
>>can not be moved to vmlinux?
>=20
> One I had in mind was the NVIDIA driver. When taking a UE from defective=20
> GPU memory, it could use the notifier to save the bad address to a=20
> blacklist in their nvram. Not so much recovering the machine check, just=20
> logging before the system reboots.
>=20
> The other user is a prototype driver for the IBM Research project we had=20
> a talk about offline a while back.

Okay. It might be possible to save the address in the kernel and
then notify the driver afterward. For user-mode and any non-atomic
user copy AFAIK the irq_work should practically run synchronously
after the machine check returns so it might be enough to have a
notifier in the irq work processing.

> We can make this patchset work for memcpy_mcsafe(), but I think it's=20
> back to the drawing board for the others.

For the first stage that would be preferable.

Thanks,
Nick
=
