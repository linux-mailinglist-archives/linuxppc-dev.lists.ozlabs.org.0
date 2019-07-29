Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0883785C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 09:03:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xrHh3LkSzDqHh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 17:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xrF013fZzDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 17:00:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="lMZEXZFQ"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45xrDy3VmZz8tTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 17:00:50 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45xrDy34pHz9sMQ; Mon, 29 Jul 2019 17:00:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="lMZEXZFQ"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45xrDw6CN4z9s7T
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Jul 2019 17:00:45 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id t16so27481304pfe.11
 for <linuxppc-dev@ozlabs.org>; Mon, 29 Jul 2019 00:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=x68WSHqzgOt8X1v6Nhk9LJIdr20J8mlA0StKGgUt7jU=;
 b=lMZEXZFQjwtoyDt4RSf6Vbz6DgysKTLhtFZubkL/qaKaTRYjLw428Efuv23wnkwqJQ
 GbJk6zGAHEVvHRH5Tw0pKajTYOM2GZbrWTECIQAY+VuQ5QkPGnJQxXpxCFq9Sb5/SVQb
 1hzketwWN4ebgYglRk1PB6+PlXwF1QaH30pAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=x68WSHqzgOt8X1v6Nhk9LJIdr20J8mlA0StKGgUt7jU=;
 b=ac01Ezd1ImaG29Jn+M3cpeVh7Y3Z1Oqd4gUEq+qQZFggvu/fCMhDWHyMDfgjxa0jYu
 zR7hEnkmf1Y4Vkob8Yoq9XgEJLAjhsaV8avdplxDa72+SuHxNv916eAFrzql5hGPDvQ+
 Jq0CZvMHExAvxJSfu7FPiFUYeFDeaJrvgvtJt1BBDhKBs+X/ucbrxUzLVcSp2vv+f1mt
 CK8Dv5quEoyLUAgB4H84dps61P9dWKXC7zZEOSwljwBsU0aXdYsbKn4wEnK/a61bsNn5
 xAm29V/psQDiDvV+iNarrUdKSbC9fATRoAHhWcI8/dO9DojmJBW55rSJp+frzSMjGShS
 woxw==
X-Gm-Message-State: APjAAAUMRT1eY4CqpJ/gXlR8IMM23w6k0T0wT+aZwXfbanF8LMeA8a2s
 OYcaYms2b1MfIRTSKAq4w9Y=
X-Google-Smtp-Source: APXvYqwRCGEBrkNmiEc2N0xdRuhPKQOYoNi2+1tLwh4iQHOeCG61louZm3CHBIJYGiFxgogXP5QSrA==
X-Received: by 2002:a17:90a:30e4:: with SMTP id
 h91mr106220547pjb.37.1564383643846; 
 Mon, 29 Jul 2019 00:00:43 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id f64sm63703792pfa.115.2019.07.29.00.00.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 00:00:42 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Andrew Donnellan <ajd@linux.ibm.com>,
 Christopher M Riedl <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [RFC PATCH v2] powerpc/xmon: restrict when kernel is locked down
In-Reply-To: <87h88m2iu4.fsf@dja-thinkpad.axtens.net>
References: <20190524123816.1773-1-cmr@informatik.wtf>
 <81549d40-e477-6552-9a12-7200933279af@linux.ibm.com>
 <1146575236.484635.1559617524880@privateemail.com>
 <57844920-c17b-d93c-66c0-e6822af71929@linux.ibm.com>
 <87h88m2iu4.fsf@dja-thinkpad.axtens.net>
Date: Mon, 29 Jul 2019 17:00:38 +1000
Message-ID: <87ef29gwa1.fsf@dja-thinkpad.axtens.net>
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

Hi Chris,

>>>> Remind me again why we need to clear breakpoints in integrity mode?
...
>> Integrity mode merely means we are aiming to prevent modifications to 
>> kernel memory. IMHO leaving existing breakpoints in place is fine as 
>> long as when we hit the breakpoint xmon is in read-only mode.
>>
...
> I think ajd is right. 
>
> I think about it like this. There are 2 transitions:
>
>  - into integrity mode
>
>    Here, we need to go into r/o, but do not need to clear breakpoints.
>    You can still insert breakpoints in readonly mode, so clearing them
>    just makes things more irritating rather than safer.
>
>  - into confidentiality mode
>
>    Here we need to purge breakpoints and disable xmon completely.

Would you be able to send a v2 with these changes? (that is, not purging
breakpoints when entering integrity mode)

Regards,
Daniel
