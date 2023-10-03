Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1817B6B13
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 16:09:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7ue2XMw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0KSb75njz3vY9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 01:09:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=E7ue2XMw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0KRV53sXz300q
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 01:08:20 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6934202b8bdso740204b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 07:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696342096; x=1696946896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o9RQ2Fb9bLEnmrzYZSIfxNu7G1yFcSEUW3tQEd9IywA=;
        b=E7ue2XMwwkQp9eU1Yi8YvfcFKvCgqMUJIvmSOdaNfDUrDBiOb9FDO2UArMxX1nqIQa
         N+5mS1uMi9K29rC+XqqHGj77meBCp/lrrAo+yI5nwTQlO0o2tqfKBSMUFaz1lEdoxWDa
         VThTq40aLc4Js4Vnv1lCSD43MrerPnjd5Bz0wD4uUUuk6o5+ET9MCmKkiM3OCbg45PK5
         K4r/X8gtZlm0FwIX9zkAwk7HxdcJXWgDPWs7Mdd7bO7AYO5vf2f18IDYjOIW29hBWAht
         v845iniwN6bFMINk3w4c9g7zL6jwVfg/mvMtXJ8h6VsYKJxDOg8MyYCCN3R2LE5WmA9t
         0USQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696342096; x=1696946896;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9RQ2Fb9bLEnmrzYZSIfxNu7G1yFcSEUW3tQEd9IywA=;
        b=GDn5+4cu3Oe7AmIqDphQSIeaeq2Og+m9lLQMuIFzc3HYa2zr6G5fPY5XpbMVN1AmQU
         +IXkLsTRUuDziPMKG5zdSW90/SYKPG3QSim+enOGXVAjnOEaAsc0Ge6/2Hkp9imwx43K
         1NVV6P49AS2Nw0M2kRfiGgA3UAF0oWDr+uDvDVRlnIIGniMRGauVug7YSnd2jMlSzEd1
         GktmglImdc6KcBDo3xPfqRvnY67yKyH1d430FyB4dRyWqCZoDUls9fxGhpPPws3a0wYK
         h6wfHLI4l6AeWV+51M0LEmLnTIB0IPmIWOWBun3qHFkYWyVOCzCUUEfQRVy/oysxZstA
         8nwg==
X-Gm-Message-State: AOJu0Yy6ni3DJNla3ga4a3m48qmHHfdACmPk0CbBNSsBnM5rK3fPIglv
	bMPJ3DxT0HDUDx96LzuVAF8u/w==
X-Google-Smtp-Source: AGHT+IFnebiHHdZDfxamsHmcSvnNx8iA5IlyEN1o219acCh5Cnqdc0JgdUD8yn/eqYycu6H4H4de0g==
X-Received: by 2002:a05:6a00:22cc:b0:68a:5cf8:dac5 with SMTP id f12-20020a056a0022cc00b0068a5cf8dac5mr16883440pfj.22.1696342095702;
        Tue, 03 Oct 2023 07:08:15 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c1:feaf:c9f1:61ab:649c:ad56? ([2804:1b3:a7c1:feaf:c9f1:61ab:649c:ad56])
        by smtp.gmail.com with ESMTPSA id h6-20020a62b406000000b006883561b421sm1390807pfn.162.2023.10.03.07.08.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 07:08:15 -0700 (PDT)
Message-ID: <057366c2-ee65-441d-b2ac-f40e1d94b44e@linaro.org>
Date: Tue, 3 Oct 2023 11:08:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uapi/auxvec: Define AT_HWCAP3 and AT_HWCAP4 aux vector,
 entries
Content-Language: en-US
To: Peter Bergner <bergner@linux.ibm.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <fd879f60-3f0b-48d1-bfa1-6d337768207e@linux.ibm.com>
 <97eb2099-23c2-4921-89ac-9523226ad221@linaro.org>
 <891957ad-453e-4c68-9c5a-7a979667543d@linux.ibm.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <891957ad-453e-4c68-9c5a-7a979667543d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: GNU C Library <libc-alpha@sourceware.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/10/23 18:19, Peter Bergner wrote:
> Hi Adhemerval, sorry for the delay in replying, I was a little under the
> weather last week.
> 
> 
> On 9/27/23 11:03 AM, Adhemerval Zanella Netto wrote:
>> On 26/09/23 19:02, Peter Bergner wrote:
>>> The powerpc toolchain keeps a copy of the HWCAP bit masks in our TCB for fast
>>> access by our __builtin_cpu_supports built-in function.  The TCB space for
>>> the HWCAP entries - which are created in pairs - is an ABI extension, so
>>> waiting to create the space for HWCAP3 and HWCAP4 until we need them is
>>> problematical, given distro unwillingness to apply ABI modifying patches
>>> to distro point releases.  Define AT_HWCAP3 and AT_HWCAP4 in the generic
>>> uapi header so they can be used in GLIBC to reserve space in the powerpc
>>> TCB for their future use.
>>
>> This is different than previously exported auxv, where each AT_* constant
>> would have a auxv entry. On glibc it would require changing _dl_parse_auxv
>> to iterate over the auxv_values to find AT_HWCAP3/AT_HWCAP4 (not ideal, 
>> but doable).
> 
> When you say different, do you mean because all AUXVs exported by the kernel
> *will* have an AT_HWCAP and AT_HWCAP2 entry and AT_HWCAP3/AT_HWCAP4 won't?
> I don't think that's a problem for either kernel or glibc side of things.
> I'm not even sure there is a guarantee that every AT_* value *must* be
> present in the exported AUXV.
> 
> The new AT_HWCAP3/AT_HWCAP4 defines are less than AT_MINSIGSTKSZ, so they
> don't affect the size of _dl_parse_auxv's auxv_values array size and the
> AT_HWCAP3 and AT_HWCAP4 entries in auxv_values[] are already initialized
> to zero today.  Additionally, the loop in _dl_parse_auxv already parses
> the entire AUXV, so there is no extra work for it to do, unless and until
> AT_HWCAP3 and AT_HWCAP4 start being exported by the kernel.  Really, the
> only extra work _dl_parse_auxv would need to do, is add two new stores:
> 
>   GLRO(dl_hwcap3) = auxv_values[AT_HWCAP3];
>   GLRO(dl_hwcap4) = auxv_values[AT_HWCAP4];
> 

Indeed you are right, I wrong assumed that the AT_HWCAP3/AT_HWCAP4 would
be higher than AT_MINSIGSTKSZ. 

> 
> 
>> Wouldn't be better to always export it on fs/binfmt_elf.c, along with all 
>> the machinery to setup it (ELF_HWCAP3, etc), along with proper documentation?
> 
> You mean modify the kernel now to export AT_HWCAP3 and AT_HWCAP4 as zero
> masks?  Is that really necessary since we don't need or have any features
> defined in them yet?  GLIBC's _dl_parse_auxv doesn't really need them to
> be exported either, since in the absence of the entries, it will just end
> up using zero masks for dl_hwcap3 and dl_hwcap4, so everything is copacetic
> even without any kernel changes.
> 
> As I mentioned, our real problem is the lead time for getting changes that
> affect the user ABI into a distro release, and ppc's copy/cache of the HWCAP
> masks is an ABI change.  If we wait to add this support until when we
> actually have a need for HWCAP3, then we won't have any support until
> the next major distro release.  However, if we can add this support now,
> which I don't think is an onerous change on glibc's part, then we can
> start using it immediately when Linux starts exporting them.

What it is not clear to me is what kind of ABI boundary you are trying to
preemptively add support here. The TCB ABI for __builtin_cpu_supports is
userland only, so if your intention is just to allow gcc to work on older
glibcs, it should be a matter to just reserve the space on tcbhead_t.  Once
kernel actually provides AT_HWCAP3/AT_HWCAP4, backporting should be
straightforward.

If your intention is to also add support on glibc, it makes more sense to
already reserve it.  For __builtin_cpu_supports it should work, although
for glibc itself some backporting would be required (to correctly showing
the bits with LD_SHOW_AUXV).


