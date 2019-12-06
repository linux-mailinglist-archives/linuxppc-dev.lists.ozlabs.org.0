Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 740AB114AC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 03:03:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TbVB4KG8zDqRp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 13:03:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y6tCO3KX"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TbRz3lRDzDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 13:01:51 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id o9so2022282plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Dec 2019 18:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yawCDzrn1DZPzEC7TC2gsk/hjYWQ4hmDMD32WCjrPbk=;
 b=Y6tCO3KXQbX6mVGeqhEP97b/3pfwbgbG9fZAKtX3DfI/5sQ9/x7c0+d98HmaKY8VMk
 S2YGlDSiYypUevwgwsDJ+10qNi8s2juIbE2sT4w6Q0MFWvg9pU+EfmMeTH2ei41cQ8Mp
 d1JnDTZVyy9JhLP8EV0BqACLfqAQzxgyrjXYiOb7l0cAGo4oYw+Pv/SAgD8qnSKaC/0a
 rD8FXgrCkyGEUJ/on8f71AZB3mNkw0p/h6EJheutKQYEjo2QLb/ufPFHz0rchJEzVzcc
 aeqBqtuXQ1qK8dJGu6BXkoLkSNdJlG5XyKU+BTgBve2FPORSOYD8PpKRkR9sbaJ6yNhB
 0eUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yawCDzrn1DZPzEC7TC2gsk/hjYWQ4hmDMD32WCjrPbk=;
 b=PQaxjPOooUMGkAsU8Gk/B6pZo9Wo+f+uvXyHC41pJqTPnUboypehbHj8IYKvPqyYKJ
 M9an2M1mj/z/WOrbw1S34IW89RcpK6zBFOQ/xWBG3mH73HYBIiuke5SdMNbYx6L7Dlvm
 lCMoNRpbm0sGzHc/zJIQpTz8yhZfL6gUfJ+Zt4AegQgHqPxF21sBElYJXxTojyhrt8+a
 2BhbMaQ3duuK5ooX1kFdR1y5L3DYqqN891zQNp1govMjLSbKTJ1oL8z5wfYSSxjoBTi8
 29E7QiF/4Lxe7fehXQe43vJxt1dteaOeTG7XwhNd2oNKRhA+Y1y3xYsxf2a1FhGPdZ+u
 ZDDg==
X-Gm-Message-State: APjAAAVMHLifPXMPja2knOnIDvF1dV7SP6mlEcQNjEgAET4D5mxygLPO
 ywkKkL2OfafzoxUYryslIYM=
X-Google-Smtp-Source: APXvYqw2ueWFPqikZhD0a2qq1gWWV/hMz4rEndjfA9geXRuajF2h7mb6m0NVl6+8/W2Sr5Om8zAeDg==
X-Received: by 2002:a17:90a:348c:: with SMTP id
 p12mr12729041pjb.105.1575597708183; 
 Thu, 05 Dec 2019 18:01:48 -0800 (PST)
Received: from ?IPv6:240d:1a:90a:7900:b0a6:2318:ed21:5e5?
 ([240d:1a:90a:7900:b0a6:2318:ed21:5e5])
 by smtp.gmail.com with ESMTPSA id z1sm14087108pfk.61.2019.12.05.18.01.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 18:01:47 -0800 (PST)
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
Date: Thu, 5 Dec 2019 20:01:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205163538.mzunfrpox7jbrssl@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/5/19 10:35 AM, Sebastian Andrzej Siewior wrote:
> On 2019-12-03 10:56:35 [-0600], Rob Herring wrote:
>>> Another possibility would be to make the cache be dependent
>>> upon not CONFIG_PPC.  It might be possible to disable the
>>> cache with a minimal code change.
>>
>> I'd rather not do that.
>>
>> And yes, as mentioned earlier I don't like the complexity. I didn't
>> from the start and I'm  I'm still of the opinion we should have a
>> fixed or 1 time sized true cache (i.e. smaller than total # of
>> phandles). That would solve the RT memory allocation and locking issue
>> too.
>>
>> For reference, the performance difference between the current
>> implementation (assuming fixes haven't regressed it) was ~400ms vs. a
>> ~340ms improvement with a 64 entry cache (using a mask, not a hash).
>> IMO, 340ms improvement was good enough.
> 
> Okay. So the 814 phandles would result in an array with 1024 slots. That
> would need 4KiB of memory.

Is this amount of memory an issue for this system?

If module support is not configured into the kernel then the cache is
removed and memory freed in a late initcall.  I don't know if that helps
your use case or not.


> What about we go back to the fix 64 slots array but with hash32 for the
> lookup? Without the hash we would be 60ms slower during boot (compared
> to now, based on ancient data) but then the hash isn't expensive so we
> end up with better coverage of the memory on systems which don't have a
> plain enumeration of the phandle.

That performance data is specific to one particular system.  It does not
generalize to all devicetree based systems.  So don't draw too many
conclusions from it.  If you want to understand the boot performance
impact for your system, you need to measure the alternatives on
your system.

Is there a memory usage issue for the systems that led to this thread?
Unless there is a documented memory issue, I do not want to expand an
issue with poor cache bucket percent utilization to the other issue
of cache size.

-Frank

> 
>> Rob
> 
> Sebastian
> 

