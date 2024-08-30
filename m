Return-Path: <linuxppc-dev+bounces-817-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829419664B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 16:57:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwLpX25M0z30CL;
	Sat, 31 Aug 2024 00:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725024936;
	cv=none; b=IVwqHenB3MzoxMalBSC30C51Ki9RIFO9qzWKfPBrrwuZKlaw8ahAT0WAXEqhO+qJgfThpxuHSPCta2igAUzWqbGA+GxKAnpBjai3z1s3dzXnezRm8ZflJ7pSTJPbCDaHrY9/4BsDkkGEs8VYWsKZ91Y5agH1GgRWHtGSkQjKgGwS4dpdobEionP+OhlImGYlP/eQJ3x+cST2Am8L8Ke34B9ejzOVGE76OuztKtahrmwYvf8qcmBS0yueBzYGQ/R3wHlalD6pzcj7lZ20uaoBSL5eAKeHqZxAOwlsffUwaJVS8fXykKrKnd09msFiwdi9DJu1V081M7wI6kt/ueLHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725024936; c=relaxed/relaxed;
	bh=lHvnH/4zOuzzT8TCzaUdUbOM1uEXUpCOxCXYL3PqkuU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding; b=oBRc0bVDA1rD+w6IgGtujPJnQIXXJiuqc908CByBGM4JD7aXIuiWdUCKALr8RKR8Q4EOlEwz3BXJRHIVyS64itdZh1yhEosy9SD2oHKX7Ai3gEJNLs211Xz/qw0yWI4oHT0Qm5ldEcOVpewXqEfpGriwRcTqB0LuhZx8knv2mZ44g+/HOkeT/D7b/2rh9BypvvcOHDr7Q1cmrQvey5A3jnDGqMAF+jh7Zpi4c7z5+PN6V3ZTFG/gTEcB/jLxVhydIyFLtuu5toO8TGzzuiZZGPQLyNOMuq+sPv+Xza715wDi8UPmpvbfS59Xxa9o1nMduqRKVHn0NMrU/pqHVgVRSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Shzvo8Hd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=Shzvo8Hd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=skhan@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwK0R27v7z2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 23:35:33 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-451a0b04f6bso10056861cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725024928; x=1725629728; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lHvnH/4zOuzzT8TCzaUdUbOM1uEXUpCOxCXYL3PqkuU=;
        b=Shzvo8HdumRqWLDDV08vHQFeaukmznDuurFw+ssDX4Ha674GEwcCcBo/b+khrL0yxY
         +hCB6nEqm26vNscFh6DvL8IT1rwFFZE5gfjkRqVapVxxyroifdTC9L/iHHjRpRRGAhy/
         +bOjvySJWnIIbIltpyroQVK4AtxRictvD1YnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725024928; x=1725629728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHvnH/4zOuzzT8TCzaUdUbOM1uEXUpCOxCXYL3PqkuU=;
        b=oMc3FafZ6DWbBN6Z/TvI4HVJ1qEiKwhTMYKQe2FSgaemLwNSNn9yq08PnmwIxViVao
         yHIgty87sN8nztgjLvXfcn1Lwp4z4SO0qhVhwdB7vpyQeZcxVLb0MzvZeomX9/WvLfQG
         M0A7msIfNXQe0Gn3Mx01/1HFx6aqL2+g0zMzfHRv8wmOmVvYsDuBjBt/6s0Dt01MJQSf
         +HSwP1uLsBh2O/x7W86A8jttWv7/lIixBCqEQDrS167JIe+PM6X90keLgwGiG9EVq6RM
         P3OEktjdA8/OOyM1aMoQI5gWEaEJgkSSLzu9QzfIBsLnIPBoY38GN4DG0k6bA+VsK2P3
         OvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaqze5Vp1LQ7kOtjqccT5oaXMaFgDoFPX+wI5+kiFmJ/d1EcyI5wkutw+8/iUVTiWrYxz4EsOkHc25eiM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywey+hfVEO9v9mXr5ptk8CQCZedFkirmWV810iBnOCuju4O1quk
	DTq7uNAA+FXW9cNspNV/ByjDmrc9QqW5A3eEn3nK8Q7oOgtk3xufRmSFeVhsEk4=
X-Google-Smtp-Source: AGHT+IG8cg3+iwNoBRjX29bHUWGerLYZqb/2lmBI6h5IfvZ9WYS6tunfEvRS+bcOhw4pt4KgG5PXtw==
X-Received: by 2002:a05:622a:40c8:b0:456:4688:d70b with SMTP id d75a77b69052e-4567f71c204mr79224871cf.61.1725024928201;
        Fri, 30 Aug 2024 06:35:28 -0700 (PDT)
Received: from [172.19.248.149] ([205.220.129.17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682d66c9dsm13869521cf.76.2024.08.30.06.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 06:35:27 -0700 (PDT)
Message-ID: <af63ebb4-af0c-4b0d-9b58-691be5087868@linuxfoundation.org>
Date: Fri, 30 Aug 2024 07:34:53 -0600
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] selftests: vdso: Fix vDSO name for powerpc
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Shuah Khan <shuah@kernel.org>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@mit.edu>,
 "H. Peter Anvin" <hpa@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Shuah Khan <skhan@linuxfoundation.org>
References: <6c5da802e72befecfa09046c489aa45d934d611f.1725020674.git.christophe.leroy@csgroup.eu>
 <ZtG-DqWo8kBMocVh@zx2c4.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <ZtG-DqWo8kBMocVh@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/30/24 06:41, Jason A. Donenfeld wrote:
> Hi Shuah,
> 
> No 0/5 patch, so replying to the first one.
> 
> These are fixes to the vDSO selftests that Christophe is ostensibly
> providing as a preamble to his work porting vgetrandom to PPC. Do you
> mind if I take these via my random tree so his PPC vgetrandom code can
> go on top of it?
> 
> Jason
> 

Yes - here is the Ack to apply to all patches in the series:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

