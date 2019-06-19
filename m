Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADB14B217
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 08:26:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TFMt3F8DzDqgN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 16:26:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TFKp63xwzDqYV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 16:24:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="GbiWq5vg"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45TFKp5B1Tz8t5L
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 16:24:46 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45TFKp4yRsz9sN6; Wed, 19 Jun 2019 16:24:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="GbiWq5vg"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45TFKn0rc6z9s7h
 for <linuxppc-dev@ozlabs.org>; Wed, 19 Jun 2019 16:24:42 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 196so9058966pgc.6
 for <linuxppc-dev@ozlabs.org>; Tue, 18 Jun 2019 23:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=sujGvoRGZJ3i3KZSIFgr7wBrpESiCcd+VDm4gizC9fs=;
 b=GbiWq5vgFlAN0sNeKdhEmBifg8O5NWyoMcNgY0OqFifufBNe19n5knuKRlq4XnF5vX
 Ld3jJ3pAHShXy0SUi+zWjADEC4rjbmp20xjyeF+NkP6zKrbbj3gs4sUUt4QFryfhHRsu
 5XqmD6e7AxCLyz2+LkSm3vTMrHX16LYMlsBR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=sujGvoRGZJ3i3KZSIFgr7wBrpESiCcd+VDm4gizC9fs=;
 b=ATA/CpzL1DaNS74YZvmkkbhKUhjlsw3Tp7uVa9tkHdRHZIRTzYEYBPGkvDaMZx4q+A
 l4l0IrtOD9UaQD91vY0qF024Hn8ucBatzBAjxYY5ZHICU5QwXRl/jHosgUThZHqkEiS6
 t7q6/51+bdhfYlC3xhowLjG/0HalIy4CjPp5Tzlrca09mRb/I+UL7HWiHW5IyYUHpt1J
 1srr7ZYE5HSpfu2pIWhspuHfyhbu3LAwI/uxBFANOK5yscsUXNbDQlcgBqerROWHxEYs
 WR6eU29/VJ0SRbbCcQzombZqK1pCYtr1dxSFaOU/0su8KJytr+055lsKPaTz8ZMkDbs6
 dPWg==
X-Gm-Message-State: APjAAAV69XY0Ypt1mvB+WRySiQ0bYc6lHMXLs1n1mJnjfQyMdn2C9xh+
 5f5bpQHQe6UzClZPF7Dj0OpWgA==
X-Google-Smtp-Source: APXvYqzu7fTlAhAdwUAA5u9aktaFiTv30wSiaYPtCc9idEzMq6pIPcjwS4Sw9C6jvTsPApRo3UNd+Q==
X-Received: by 2002:a62:ab18:: with SMTP id p24mr2987259pff.113.1560925479811; 
 Tue, 18 Jun 2019 23:24:39 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id i133sm14761005pfe.75.2019.06.18.23.24.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 23:24:38 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [RFC PATCH v2] powerpc/xmon: restrict when kernel is locked down
In-Reply-To: <57844920-c17b-d93c-66c0-e6822af71929@linux.ibm.com>
References: <20190524123816.1773-1-cmr@informatik.wtf>
 <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
 <1146575236.484635.1559617524880@privateemail.com>
 <57844920-c17b-d93c-66c0-e6822af71929@linux.ibm.com>
Date: Wed, 19 Jun 2019 16:24:35 +1000
Message-ID: <87h88m2iu4.fsf@dja-thinkpad.axtens.net>
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
Cc: mjg59@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:

> On 4/6/19 1:05 pm, Christopher M Riedl wrote:>>> +	if (!xmon_is_ro) {
>>>> +		xmon_is_ro = kernel_is_locked_down("Using xmon write-access",
>>>> +						   LOCKDOWN_INTEGRITY);
>>>> +		if (xmon_is_ro) {
>>>> +			printf("xmon: Read-only due to kernel lockdown\n");
>>>> +			clear_all_bpt();
>>>
>>> Remind me again why we need to clear breakpoints in integrity mode?
>>>
>>>
>>> Andrew
>>>
>> 
>> I interpreted "integrity" mode as meaning that any changes made by xmon should
>> be reversed. This also covers the case when a user creates some breakpoint(s)
>> in xmon, exits xmon, and then elevates the lockdown state. Upon hitting the
>> first breakpoint and (re-)entering xmon, xmon will clear all breakpoints.
>> 
>> Xmon can only take action in response to dynamic lockdown level changes when
>> xmon is invoked in some manner - if there is a better way I am all ears :)
>> 
>
> Integrity mode merely means we are aiming to prevent modifications to 
> kernel memory. IMHO leaving existing breakpoints in place is fine as 
> long as when we hit the breakpoint xmon is in read-only mode.
>
> (dja/mpe might have opinions on this)

Apologies for taking so long to get back to you.

I think ajd is right. 

I think about it like this. There are 2 transitions:

 - into integrity mode

   Here, we need to go into r/o, but do not need to clear breakpoints.
   You can still insert breakpoints in readonly mode, so clearing them
   just makes things more irritating rather than safer.

 - into confidentiality mode

   Here we need to purge breakpoints and disable xmon completely.

Kind regards,
Daniel

>
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
