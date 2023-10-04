Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA047B7DB5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 13:03:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nCmze0PD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0sHf6zPgz3cTc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 22:03:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nCmze0PD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=adhemerval.zanella@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0sGl6bcRz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 22:02:37 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c735473d1aso14970845ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Oct 2023 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696417353; x=1697022153; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3oXbSz4Vr/TO4F6Fo1F+L1aN+UvHmKyPB5CbaVXPdE=;
        b=nCmze0PDu3PV3xN8DPlfYkszm9ph4pWGDKcEH3jTeDjC+GMB28mHiOXH7xeBHvdK1S
         ByBNWW+NiweN5EujXtCfZ+afVjPvzTVZtpZw06peY4K89yQmFxd9cocjzImkOUfozjTI
         rAhBDrlDcWqDtmV/3R9mAhs91WeLr+UD1NohhqwwCpNzCstVq4tGIwANuuZflj717zIT
         Ad+n+L+MMzVzBH6JcFrtNjbZM60W13w0EaASAD6iEyegncMURGwVlB7IU4ThvMYxfcP7
         1L7h+whvPsfPT+b33snA86tvOabkhGPMi7TWgxiVfcTp9jHhzqD09QExY6SsuMH0+W8T
         A9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696417353; x=1697022153;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3oXbSz4Vr/TO4F6Fo1F+L1aN+UvHmKyPB5CbaVXPdE=;
        b=EagtM4Ml8hjvlLJdnvdjlXmuWYlod6w+o2OgmtvJ/OuQFpL1b3NugXR67CvOL9lbyu
         saBbnmuNbikKpHaPsxWn4bUfu0E7/k4ymkY+gNV7szU3XII8r496oIHMeGUIIAO4eGmR
         hg2wRNX6J0DbnO0bG/6+KP/5/W+pG5Qfwb6D0QUJAJqNsk8QmF8MdEkOvX2jBjXLIpfI
         E4PqwPifOGJ94cDU7Dlym3vgWI1NDDgFCtKJNW6C4bp2NsgG6/6q4cmWomdZeXinnb1Y
         SH3+xJJ16A7WKK8BEPsMyQMnhaFQfOJbGfnSso65k8BkDHEWJ3TAwA5zcTB86nOEhCKt
         CJ8g==
X-Gm-Message-State: AOJu0YxGeHUJ7DEprM6efz5lNndbSCGuOwQlEfbGUi0fKUcs9110H1Xb
	m1NeswDVUwu9FzXt7EDQFJKSQg==
X-Google-Smtp-Source: AGHT+IHE2lbIz5Y66kYbALC9n6ii47EHeeCGPmVVWRQJyGC4GKJ6zn27JE3pya096RVjF3OIVgPZlQ==
X-Received: by 2002:a17:902:c94f:b0:1c3:8464:cabd with SMTP id i15-20020a170902c94f00b001c38464cabdmr2190766pla.12.1696417352641;
        Wed, 04 Oct 2023 04:02:32 -0700 (PDT)
Received: from ?IPV6:2804:1b3:a7c1:feaf:b959:23ff:3a18:c5dc? ([2804:1b3:a7c1:feaf:b959:23ff:3a18:c5dc])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e81000b001bd99fd1114sm3370394plg.288.2023.10.04.04.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 04:02:31 -0700 (PDT)
Message-ID: <bea513ab-9ee2-4808-a490-c7dee5de26a6@linaro.org>
Date: Wed, 4 Oct 2023 08:02:28 -0300
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
 <057366c2-ee65-441d-b2ac-f40e1d94b44e@linaro.org>
 <b4864730-1b12-4dd8-b6e9-85d78dad5e34@linux.ibm.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <b4864730-1b12-4dd8-b6e9-85d78dad5e34@linux.ibm.com>
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



On 03/10/23 19:12, Peter Bergner wrote:
> On 10/3/23 9:08 AM, Adhemerval Zanella Netto wrote:
>> What it is not clear to me is what kind of ABI boundary you are trying to
>> preemptively add support here. The TCB ABI for __builtin_cpu_supports is
>> userland only, so if your intention is just to allow gcc to work on older
>> glibcs, it should be a matter to just reserve the space on tcbhead_t.
> 
> Yes, extending tcbhead_t to contain the slots for hwcap3 and hwcap4 are the
> ABI extensions we are interested in, and not something that can be backported
> into a distro point release.  Yes, we don't strictly need the AT_HWCAP3 and
> AT_HWCAP4 kernel defines to reserve (and clear) that space in glibc, but....
> 
> 
> 
>> If your intention is to also add support on glibc, it makes more sense to
>> already reserve it.  For __builtin_cpu_supports it should work, although
>> for glibc itself some backporting would be required (to correctly showing
>> the bits with LD_SHOW_AUXV).
> 
> Our intention is to also add the glibc support too once we have the
> AT_HWCAP3 and AT_HWCAP4 kernel macros defined.  1) Once the defines are
> there, adding the support should be pretty straight forward, so why wait?
> And 2) part of the glibc and compiler support introduces a new symbol
> that is exported by glibc and referenced by the compilers to ensure the
> compilers *never* access the hwcap* fields in the TCB unless the glibc
> supports them.  See the symbol __parse_hwcap_and_convert_at_platform used
> for HWCAP/HWCAP2.  We'll need a similar one for HWCAP3/HWCAP4 and I'm
> doubtful whether the distros will allow the backport of a patch that
> introduces a new exported symbol from glibc in a distro point release.

Alright, I makes more sense it now.  And indeed backporting a __parse_hwcap
for HWCAP3/HWCAP4 will be frown upon.
