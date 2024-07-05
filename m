Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CB2928DCF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2024 21:35:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=e/8GtZXV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WG3dD2pM3z3cyf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2024 05:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=e/8GtZXV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WG3cW2qpDz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2024 05:34:33 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7f3d2f12d26so11414139f.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2024 12:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720208071; x=1720812871; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uMwcWC3o3HrUVeD8fd8AU+OfLGD14mr9eYqviZBaZNs=;
        b=e/8GtZXVd673ueLWLvsDh1hnuhGLws/au8x92Pti57yVipl3SNYa9ML5jRxeLdMKo4
         vahGtxDzlffOUZuxb0NMgHE8pHmMi/r4KAZLhar99YlnqsY0mEzXMiGT5WXGcy1C1ANr
         JQgcUEHAau+Bzx2qm4zhPN2OWuQUDmxCWRTac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720208071; x=1720812871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMwcWC3o3HrUVeD8fd8AU+OfLGD14mr9eYqviZBaZNs=;
        b=w2q0Ca59/OVF3zmd3zmvflnqwddre+SuSSnCp0oh/6DLCfuRfNzCdh5jqxC+NUoTgJ
         XpIUv8dvj5PWDfgAFQ1qe9KQwD0mey+fEHl2+F73ecU+67JgNEq/F2ls4GnUrwy9IFZD
         cxkooIyevlCs6QjNCCHyqihRsMJEDUn1zrJ9g76bVxMHxROHikMhUIP3IVerBgVJ7cOG
         riK1WguPYj1CEv4G19vn638N3i2Y9Lxw+bSUixOqefV1wExZSbS+Fulfm0BPE8fPBJUr
         STc9O7JCJinkg6SHBN8TW+uTmCEo38yuo6kN4CiD5feCYukGZWobxBX66+eHZlgKnd+0
         E57Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNywtsLTdUsJaFnIVisbPuTE0yKC4SAKSakIs79YfJm+07pU/R3HEs/6pPCUMSVGCjIe93gk6xKoyma6WD3e23j1LEHehB5FIaj6f27g==
X-Gm-Message-State: AOJu0Yz2bZIZV/ZCx3BJeCIs4d4IJWbDvUSJBCY1ohm99PItO/6l6dZp
	Wf/LacTQo+6OSPdgHHBQ7cInqvbtGrbpam8XJ8bTaHlhs3uib8z6ubP1IUgTkKo=
X-Google-Smtp-Source: AGHT+IFVfC3ipyP6qVo1x6Bb2rPetYjbe/+5LIMBYOIKkl+pUyXkyZoVtgaToDJ3zLia3VmYin/naA==
X-Received: by 2002:a05:6602:6304:b0:7eb:69ec:43f2 with SMTP id ca18e2360f4ac-7f66dedecb6mr645266439f.1.1720208070940;
        Fri, 05 Jul 2024 12:34:30 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c085dd5c7dsm225863173.77.2024.07.05.12.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 12:34:30 -0700 (PDT)
Message-ID: <cd1d4033-b4ec-408d-aff7-94330615a69a@linuxfoundation.org>
Date: Fri, 5 Jul 2024 13:34:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/29] kselftest/arm64: Add test case for POR_EL0
 signal frame records
To: Mark Brown <broonie@kernel.org>, Joey Gouly <joey.gouly@arm.com>
References: <20240503130147.1154804-1-joey.gouly@arm.com>
 <20240503130147.1154804-29-joey.gouly@arm.com>
 <58fb8a27-6c40-4b13-a231-b0db1c16916c@sirena.org.uk>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <58fb8a27-6c40-4b13-a231-b0db1c16916c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: szabolcs.nagy@arm.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org, hpa@zytor.com, shuah@kernel.org, maz@kernel.org, x86@kernel.org, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, mingo@redhat.com, naveen.n.rao@linux.ibm.com, will@kernel.org, npiggin@gmail.com, bp@alien8.de, Shuah Khan <skhan@linuxfoundation.org>, kvmarm@lists.linux.dev, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, aneesh.kumar@linux.ibm.com, linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/29/24 09:51, Mark Brown wrote:
> On Fri, May 03, 2024 at 02:01:46PM +0100, Joey Gouly wrote:
>> Ensure that we get signal context for POR_EL0 if and only if POE is present
>> on the system.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

For kselftest:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
