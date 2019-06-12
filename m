Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA66431D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 01:06:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PMtj6c46zDr3R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 09:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PMrk04xBzDqwM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 09:04:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="kMu+BVJa"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45PMrj6Fc6z8t23
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 09:04:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45PMrj5tvpz9sCJ; Thu, 13 Jun 2019 09:04:37 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="kMu+BVJa"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45PMrh213jz9sBb
 for <linuxppc-dev@ozlabs.org>; Thu, 13 Jun 2019 09:04:35 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id k187so9236899pga.0
 for <linuxppc-dev@ozlabs.org>; Wed, 12 Jun 2019 16:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0sXEuoXXfB+58oAqB27nyxVJnIR0qxmqN3amvLO4MUI=;
 b=kMu+BVJa981hAatIgUu4yrYi7Q8PVRZO3FdVXL/KM/vtg9zSDoY6QaoYVsgwARCtsB
 8wMNnJZZEbmSLCmDQCZCYinzc3oFyRXDR4yjqyajTfxcaq5mYNvy6US7H9FOyI1ujcE6
 mkifXT6gFQ7lLMNCAiWTrrsyS6n/+tpWDLK+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0sXEuoXXfB+58oAqB27nyxVJnIR0qxmqN3amvLO4MUI=;
 b=t583ys49P9KRD//Bwsl9kbA/FM7TVZhv/7h3yvRJT5TV/JJXwGFippLKmA8g69z0JR
 jOjFCuRZrB4gk7UikbIbpxyE1iZT/TNsXM938ZVsmjx7JSRScbE01OOr5exozSJChlDP
 mPqFl/9fyK+VJ0Q2nonsPC6Ul/JB3YRDA2Fa3dc3/Vepx6E418xTtR95G1++q4RpFs33
 aOwiTX9fUUqpdC7va9KD02g5TIM/EZNjEy8vKHS+J1eaQYZvsGy5W/QQ5zZVnT17Uam2
 MQfwMpd1vKgPjeiPvipcV43B68umlwRqgnpaSrzA6n26EIF1PytKkcbLY1ZVzEkjMoXF
 6ppQ==
X-Gm-Message-State: APjAAAWD+nSgxQmkw+DhK7StkyxkPV+3O6ysTlG+sjX5ZXUdF8wi09eG
 GgODfmPVTFfDvcKaSVZUFtj8RQ==
X-Google-Smtp-Source: APXvYqx+XWoFTjG9dZbuolj86wqQOT4Iqef0H+9nNIH/wMPWesoTcaGtVUCDotl0QJH7LYE+KensLw==
X-Received: by 2002:a63:ee0a:: with SMTP id e10mr26896771pgi.28.1560380672280; 
 Wed, 12 Jun 2019 16:04:32 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id g9sm463989pgs.78.2019.06.12.16.04.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 16:04:31 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna <nayna@linux.vnet.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, linux-efi@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] powerpc/powernv: Add OPAL API interface to get
 secureboot state
In-Reply-To: <eaa37bd0-a77d-d70a-feb5-c0e73ce231bf@linux.vnet.ibm.com>
References: <1560198837-18857-1-git-send-email-nayna@linux.ibm.com>
 <1560198837-18857-2-git-send-email-nayna@linux.ibm.com>
 <87ftofpbth.fsf@dja-thinkpad.axtens.net>
 <eaa37bd0-a77d-d70a-feb5-c0e73ce231bf@linux.vnet.ibm.com>
Date: Thu, 13 Jun 2019 09:04:26 +1000
Message-ID: <87d0jipfr9.fsf@dja-thinkpad.axtens.net>
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Richter <erichte@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, Paul Mackerras <paulus@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nayna,

>>> Since OPAL can support different types of backend which can vary in the
>>> variable interpretation, a new OPAL API call named OPAL_SECVAR_BACKEND, is
>>> added to retrieve the supported backend version. This helps the consumer
>>> to know how to interpret the variable.
>>>
>> (Firstly, apologies that I haven't got around to asking about this yet!)
>>
>> Are pluggable/versioned backend a good idea?
>>
>> There are a few things that worry me about the idea:
>>
>>   - It adds complexity in crypto (or crypto-adjacent) code, and that
>>     increases the likelihood that we'll accidentally add a bug with bad
>>     consequences.
>
> Sorry, I think I am not clear on what exactly you mean here.Can you 
> please elaborate or give specifics ?

Cryptosystems with greater flexibility can have new kinds of
vulnerabilities arise from the greater complexity. The first sort of
thing that comes to mind is a downgrade attack like from TLS. I think
you're protected from this because the mode cannot be negotiatied at run
time, but in general it's security sensitive code so I'd like it to be
as simple as possible.

>>   - If we are worried about a long-term-future change to how secure-boot
>>     works, would it be better to just add more get/set calls to opal at
>>     the point at which we actually implement the new system?
>
> The intention is to avoid to re-implement the key/value interface for 
> each scheme. Do you mean to deprecate the old APIs and add new APIs with 
> every scheme ?

Yes, because I expect the scheme would change very, very rarely.

>>   - Under what circumstances would would we change the kernel-visible
>>     behaviour of skiboot? Are we expecting to change the behaviour,
>>     content or names of the variables in future? Otherwise the only
>>     relevant change I can think of is a change to hardware platforms, and
>>     I'm not sure how a change in hardware would lead to change in
>>     behaviour in the kernel. Wouldn't Skiboot hide h/w differences?
>
> Backends are intended to be an agreement for firmware, kernel and 
> userspace on what the format of variables are, what variables should be 
> expected, how they should be signed, etc. Though we don't expect it to 
> happen very often, we want to anticipate possible changes in the 
> firmware which may affect the kernel such as new features, support of 
> new authentication mechanisms, addition of new variables. Corresponding 
> skiboot patches are on - 
> https://lists.ozlabs.org/pipermail/skiboot/2019-June/014641.html

I still feel like this is holding onto ongoing complexity for very
little gain, but perhaps this is because I can't picture a specific
change that would actually require a wholesale change to the scheme.

You mention new features, support for new authentication mechanisms, and
addition of new variables.

 - New features is a bit too generic to answer specifically. In general
   I accept that there exists some new feature that would be
   sufficiently backwards-incompatible as to require a new version. I
   just can't think of one off the top of my head and so I'm not
   convinced it's worth the complexity. Did you have something in mind?

 - By support for new authentication mechanisms, I assume you mean new
   mechanisms for authenticating variable updates? This is communicated
   in edk2 via the attributes field. Looking at patch 5 from the skiboot
   series:

+ * When the attribute EFI_VARIABLE_TIME_BASED_AUTHENTICATED_WRITE_ACCESS is set,
+ * then the Data buffer shall begin with an instance of a complete (and
+ * serialized) EFI_VARIABLE_AUTHENTICATION_2 descriptor.

   Could a new authentication scheme be communicated by setting a
   different attribute value? Or are we not carrying attributes in the
   metadata blob?

 - For addition of new variables, I'm confused as to why this would
   require a new API - wouldn't it just be exposed in the normal way via
   opal_secvar_get(_next)?

I guess I also somewhat object to calling it a 'backend' if we're using
it as a version scheme. I think the skiboot storage backends are true
backends - they provide different implementations of the same
functionality with the same API, but this seems like you're using it to
indicate different functionality. It seems like we're using it as if it
were called OPAL_SECVAR_VERSION.

>>   - What is the correct fallback behaviour if a kernel receives a result
>>     that it does not expect? If a kernel expecting BackendV1 is instead
>>     informed that it is running on BackendV2, then the cannot access the
>>     secure variable at all, so it cannot load keys that are potentially
>>     required to successfully boot (e.g. to validate the module for
>>     network card or graphics!)
>
> The backend is declaredby the firmware, and is set at compile-time. The 
> kernel queriesfirmware on whichbackend is in use, and the backend will 
> not change at runtime.If the backend in use by the firmware is not 
> supported by the kernel (e.g. kernel is too old), the kernel does not 
> attempt to read any secure variables, as it won't understand what the 
> format is. This is a secure boot failure condition, as we cannot verify 
> the next kernel. With addition of new backends in the skiboot, the 
> support will be added to the kernel. Note: skiboot and skiroot should 
> always be in sync with backend support.

Seems reasonable. I'm thinking specifically about the kernel loaded
after skiroot; and yes, on reflection just failing to boot is the only
sensible thing you can do.

Regards,
Daniel

