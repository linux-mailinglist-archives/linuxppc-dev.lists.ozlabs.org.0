Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C98428B569
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 15:00:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8zLX05m2zDqfS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 00:00:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=olGiS19F; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8zFD2mHvzDqkc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 23:55:57 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id b26so13437861pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 05:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jJ/wUvol9JboUBdIyJ3njZoveyZAnt9T8XZSkpIyEl4=;
 b=olGiS19FBS02GG4yaTw8CBuJRQdrL0XIzIbjl8r38quqtwEP7nVy+EQMAEpQwDE20g
 EeVL0nYrGXIHeO/UQ1NZ8Z1fZ7jeTxc78w+xvA9QG229qMRRjiaO87KSPGngOm4LIAPV
 quBFOBKCXtYwuyqhrmfd707HeQj/yVYC3wyZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jJ/wUvol9JboUBdIyJ3njZoveyZAnt9T8XZSkpIyEl4=;
 b=mX+Aj2dmOh4VZJhi3QyJXEmAsSvAaV9ypDKKL54Zwee9RQmr+Uzz6rX94OgWj7w/DA
 0N9GZl8mPBZGasAXa2ENgfmQ+HN4TNj3ncC2aY5pqUd9gAU3UC/bLo5duCugvZ6YBOq0
 c9J9i23it8hlx6Rbx0+Ev2z6SNHZiMXA6pNLGadkwjuWTX0yj7OAjdrqknlUPKMgNUXo
 QqtP761TVuNizDe8XzQrSW+ADTVDXc42HDZjNs288PeP0s6W/S02rgl55dznQhlevv1a
 wBydlYw2uDTeMWEtW+l7Nal9DQf/DjJT6EF/dgqbgI8kAao0NMmBfJ92Q9tv7Q+zGwa4
 OmOw==
X-Gm-Message-State: AOAM5300solVK6TTT+mYcTnLu8hA1fe2yBJsxZZwyjNSPZ5iuXo3kj1b
 qbSPcSS0KF9qX8p4z/YhkfVk8Q==
X-Google-Smtp-Source: ABdhPJx4s44wzkJitFfrf10GSLlLQd+jotdk84OQBmwvojogkKFnUz1OgHra7Z7kXIzvFiEyTPkmNg==
X-Received: by 2002:a62:8389:0:b029:152:416d:f026 with SMTP id
 h131-20020a6283890000b0290152416df026mr23935778pfe.64.1602507354681; 
 Mon, 12 Oct 2020 05:55:54 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-2428-55d4-1def-c9e5.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:2428:55d4:1def:c9e5])
 by smtp.gmail.com with ESMTPSA id az18sm24066875pjb.35.2020.10.12.05.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:55:54 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v5 1/5] powerpc/sstep: Emulate prefixed instructions only
 when CPU_FTR_ARCH_31 is set
In-Reply-To: <41dda593-0fc6-569e-2243-189d84653b4a@linux.ibm.com>
References: <20201011050908.72173-1-ravi.bangoria@linux.ibm.com>
 <20201011050908.72173-2-ravi.bangoria@linux.ibm.com>
 <87h7r0w6s0.fsf@dja-thinkpad.axtens.net>
 <41dda593-0fc6-569e-2243-189d84653b4a@linux.ibm.com>
Date: Mon, 12 Oct 2020 23:55:50 +1100
Message-ID: <87a6wrwqll.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, bala24@linux.ibm.com,
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ravi Bangoria <ravi.bangoria@linux.ibm.com> writes:

> Hi Daniel,
>
> On 10/12/20 7:21 AM, Daniel Axtens wrote:
>> Hi,
>> 
>> Apologies if this has come up in a previous revision.
>> 
>> 
>>>   	case 1:
>>> +		if (!cpu_has_feature(CPU_FTR_ARCH_31))
>>> +			return -1;
>>> +
>>>   		prefix_r = GET_PREFIX_R(word);
>>>   		ra = GET_PREFIX_RA(suffix);
>> 
>> The comment above analyse_instr reads in part:
>> 
>>   * Return value is 1 if the instruction can be emulated just by
>>   * updating *regs with the information in *op, -1 if we need the
>>   * GPRs but *regs doesn't contain the full register set, or 0
>>   * otherwise.
>> 
>> I was wondering why returning -1 if the instruction isn't supported the
>> right thing to do - it seemed to me that it should return 0?
>> 
>> I did look and see that there are other cases where the code returns -1
>> for an unsupported operation, e.g.:
>> 
>> #ifdef __powerpc64__
>> 	case 4:
>> 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
>> 			return -1;
>> 
>> 		switch (word & 0x3f) {
>> 		case 48:	/* maddhd */
>> 
>> That's from commit 930d6288a267 ("powerpc: sstep: Add support for
>> maddhd, maddhdu, maddld instructions"), but it's not explained there either
>> 
>> I see the same pattern in a number of commits: commit 6324320de609
>> ("powerpc sstep: Add support for modsd, modud instructions"), commit
>> 6c180071509a ("powerpc sstep: Add support for modsw, moduw
>> instructions"), commit a23987ef267a ("powerpc: sstep: Add support for
>> darn instruction") and a few others, all of which seem to have come
>> through Sandipan in February 2019. I haven't spotted any explanation for
>> why -1 was chosen, but I haven't checked the mailing list archives.
>> 
>> If -1 is OK, would it be possible to update the comment to explain why?
>
> Agreed. As you rightly pointed out, there are many more such cases and, yes,
> we are aware of this issue and it's being worked upon as a separate patch.
> (Sandipan did send a fix patch internally some time back).

That sounds like a perfectly reasonable approach.

I'd love to review the patch when it's sent - if you or Sandipan could
please cc: me so I don't miss it I'd really appreciate that.

I will proceed to review the rest of the patch and series.

Kind regards,
Daniel

>
> Thanks for pointing it out!
> Ravi
