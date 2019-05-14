Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D16801CE15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:37:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453PyN2vnCzDqMK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 03:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="d1hrQP6H"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453Pwv4SSxzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:35:59 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id r18so3833172pls.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 10:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ZTRncmxtDxlV1F7umKPD+uG9W2QsyoTTFP+CjuiFaiU=;
 b=d1hrQP6HgUD01+7GWOVBzOQ5PTUN/qhB4jZMcGO/Pd+k4zKMHgoXcd+1fx31QklV7i
 6BNhtNz3/WojLe294pPvIjAaip2059gJ2Ql2EITwg9Cpc2zE8yxq+RzOmtBf14B55RgX
 r8EpWbSI34USzzL8RF0SpbroLrAQ4pb50Nfzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ZTRncmxtDxlV1F7umKPD+uG9W2QsyoTTFP+CjuiFaiU=;
 b=HmK1+KtCF6545yboaUlSITKcW0og/F6d7gyz2CXaW6AdSTcGiC3xhU8jVMuPsQh2hV
 tcOiccCJj0AJGrGJgzcQU4RO5EOj1kd+/16VRTl94/oBf9F/0h9wtgf+13LDclww0WYP
 1jBldFioYuzYP7vN57eiIru/yF1iVW/1Uzi7CLaHuEfCRruYAKr6Ca1gOY9qXuRZN+tZ
 FWkUHIMj7dVmjrvdMF5jVMVXXEdf71tHnf9z2vQGHXJY7xZMQl23fG7BHWFCwvMPa8rv
 FAsCbN9FRRVY6MjkJR0B0YwXDlkgdMO5EoDas67FebNWIr4iY28L+HKRW66s7nzdvxia
 xHqA==
X-Gm-Message-State: APjAAAVKa7IysCElbdsDpjxXd+hxctfZnFz/hUDo80fv4Vh4fRDkmkG3
 6jO4qs9ZnTD6eCJwgr4CX+RtEg==
X-Google-Smtp-Source: APXvYqxCO66J3FmsHeZHkJs4q9kftmYeVs7T9n3Dd/MZ8iMbZu1RqUSoi9RyfgWX3G41jaR2cflEpA==
X-Received: by 2002:a17:902:24a:: with SMTP id
 68mr37701250plc.250.1557855355801; 
 Tue, 14 May 2019 10:35:55 -0700 (PDT)
Received: from localhost (124-171-102-38.dyn.iinet.net.au. [124.171.102.38])
 by smtp.gmail.com with ESMTPSA id y16sm13035325pfo.133.2019.05.14.10.35.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 10:35:54 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
In-Reply-To: <87pnomtwgh.fsf@concordia.ellerman.id.au>
References: <20190315020901.16509-1-dja@axtens.net>
 <20190315022414.GA1671@sol.localdomain>
 <875zsku5mk.fsf@dja-thinkpad.axtens.net>
 <20190315043433.GC1671@sol.localdomain>
 <8736nou2x5.fsf@dja-thinkpad.axtens.net>
 <20190410070234.GA12406@sol.localdomain>
 <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
 <20190506155315.GA661@sol.localdomain>
 <20190513005901.tsop4lz26vusr6o4@gondor.apana.org.au>
 <87pnomtwgh.fsf@concordia.ellerman.id.au>
Date: Wed, 15 May 2019 03:35:51 +1000
Message-ID: <877eat0wi0.fsf@dja-thinkpad.axtens.net>
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
Cc: leo.barbosa@canonical.com, Nayna <nayna@linux.vnet.ibm.com>,
 Stephan Mueller <smueller@chronox.de>, nayna@linux.ibm.com,
 omosnacek@gmail.com, marcelo.cerri@canonical.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, leitao@debian.org,
 George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Herbert Xu <herbert@gondor.apana.org.au> writes:
>> On Mon, May 06, 2019 at 08:53:17AM -0700, Eric Biggers wrote:
>>>
>>> Any progress on this?  Someone just reported this again here:
>>> https://bugzilla.kernel.org/show_bug.cgi?id=203515
>>
>> Guys if I don't get a fix for this soon I'll have to disable CTR
>> in vmx.
>
> No objection from me.
>
> I'll try and debug it at some point if no one else does, but I can't
> make it my top priority sorry.

I'm a bit concerned that this will end up filtering down to distros and
tanking crypto performance for the entire lifespan of the releases, so
I'd rather fix it if I can.

A quick additional test reveals an issue in the uneven misaligned
splits. (the may-sleep may reveal an extra bug, but there's at least one
with uneven/misaligned.)

By all means disable vmx ctr if I don't get an answer to you in a
timeframe you are comfortable with, but I am going to at least try to
have a look.

Regards,
Daniel

>
> cheers
