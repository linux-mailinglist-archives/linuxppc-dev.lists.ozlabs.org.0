Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDDD11A789
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 10:39:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XsMn6GhczDqWW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 20:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="KWGpaH6L"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XsKQ2hzgzDqS8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 20:37:29 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id a17so825807pls.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2019 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=FTXppE5PXWj9Iahx6Njio8VEySUYkGtFHN0024RkukI=;
 b=KWGpaH6L4hh/N5DBTkDfFICnrMVCH1O+Cr9mROCVLeWmC0wjFyTx9E601A1xCLz28i
 XbVQOmDlOBi4XEIl+ju7vjU3iAuSmwt7ZuQOtCjNuZPwYAfetTqi4ctJQBym29NqOvJW
 TDrkP9MiGXBlvNuvDrAAre3v/NjxX0oDRt1Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=FTXppE5PXWj9Iahx6Njio8VEySUYkGtFHN0024RkukI=;
 b=ZDmWy1K/2PK3Y5eOWit3zKrR5zO9rqqkgGNe689dB8vFHSDLxX0e3ZeGZhdavn76gn
 NCsF1T0e2+e8wxDMSUu6t/CrbMeuSSnlmPjRan0WCHVYFlFHu7DwIbZG5xC48/rp7UIi
 vEBfRqL9U+5M2iYyUQHaTqXXjFE3eTYKirzzO5zFvFUhcUzKVHrivJ4em/c8Ibhj6Fi2
 gfsGIOpVhxlOIF+z5exA4a26Xck+xt+mKrLuDUdB9pEF6ks5Am7Gxj3OgrjcLsVQevNM
 VZu56D+9CFsIuHYSpH25cY56Hjii8Qs0WbkmqFeqLdve9k2rsJDZ0G2ZjQwpaGuGJ5Q9
 8oBA==
X-Gm-Message-State: APjAAAUXlN4gKf0ys7HdPEZl8q5kH+Co0oTCQViqXSERYCQLIlAINsGF
 P97y2wvowB5PBh3aJW8fYPwAv3MiQbM=
X-Google-Smtp-Source: APXvYqxA/UYojuyRYQryE+lA/U/q5V+fQdfv6PNURAJPMaQHBgrnB/2yw/UaT+6+Q60VRHLwwgMJGg==
X-Received: by 2002:a17:90a:1a10:: with SMTP id
 16mr2453092pjk.93.1576057046067; 
 Wed, 11 Dec 2019 01:37:26 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-899f-c50f-5647-b1f9.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:899f:c50f:5647:b1f9])
 by smtp.gmail.com with ESMTPSA id f81sm2256125pfa.118.2019.12.11.01.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 01:37:25 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/fault: kernel can extend a user process's stack
In-Reply-To: <20191211072806.GI3986@kitsune.suse.cz>
References: <20191211014337.28128-1-dja@axtens.net>
 <20191211072806.GI3986@kitsune.suse.cz>
Date: Wed, 11 Dec 2019 20:37:21 +1100
Message-ID: <8736drciem.fsf@dja-thinkpad.axtens.net>
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
Cc: Tom Lane <tgl@sss.pgh.pa.us>, linuxppc-dev@lists.ozlabs.org,
 Daniel Black <daniel@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Fixes: 14cf11af6cf6 ("powerpc: Merge enough to start building in
> arch/powerpc.")

Wow, that's pretty ancient! I'm also not sure it's right - in that same
patch, arch/ppc64/mm/fault.c contains:

^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 213)            if (address + 2048 < uregs->gpr[1]
^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 214)                && (!user_mode(regs) || !store_updates_sp(regs)))
^1da177e4c3f4 (Linus Torvalds         2005-04-16 15:20:36 -0700 215)                    goto bad_area;

Which is the same as the new arch/powerpc/mm/fault.c code:

14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 234)            if (address + 2048 < uregs->gpr[1]
14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 235)                && (!user_mode(regs) || !store_updates_sp(regs)))
14cf11af6cf60 (Paul Mackerras 2005-09-26 16:04:21 +1000 236)                    goto bad_area;

So either they're both right or they're both wrong, either way I'm not
sure how this patch is to blame.

I guess we should also cc stable@...

Regards,
Daniel

>> Reported-by: Tom Lane <tgl@sss.pgh.pa.us>
>> Cc: Daniel Black <daniel@linux.ibm.com>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>> ---
>>  arch/powerpc/mm/fault.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
>> index b5047f9b5dec..00183731ea22 100644
>> --- a/arch/powerpc/mm/fault.c
>> +++ b/arch/powerpc/mm/fault.c
>> @@ -287,7 +287,17 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
>>  			if (!res)
>>  				return !store_updates_sp(inst);
>>  			*must_retry = true;
>> +		} else if ((flags & FAULT_FLAG_WRITE) &&
>> +			   !(flags & FAULT_FLAG_USER)) {
>> +			/*
>> +			 * the kernel can also attempt to write beyond the end
>> +			 * of a process's stack - for example setting up a
>> +			 * signal frame. We assume this is valid, subject to
>> +			 * the checks in expand_stack() later.
>> +			 */
>> +			return false;
>>  		}
>> +
>>  		return true;
>>  	}
>>  	return false;
>> -- 
>> 2.20.1
>> 
