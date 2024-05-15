Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F1B8C6871
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 16:21:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=RN0TFR+s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vfb4K4hQ7z3fpY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 00:21:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=RN0TFR+s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vfb3X5trQz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 00:20:23 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5238b7d0494so1451234e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715782818; x=1716387618; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=16qftxrB5EgdSgH7j+99BTnIlGUnb8pcrY5C9J7hC3I=;
        b=RN0TFR+sdcAU+otkBs2uRyW8RWe6tD7ghaHXkr+O3WnkkNWHljuDerwVamVpCeWIDO
         m5DzDU0j27UlviyIV+wyqUWIQO3N8P0yLx4uOuEizLLp4GdFOXjrVz6CXacJG/cd+mGr
         RIjLdXs21SebdYp5lIIQcuAIbL222y7SSypmlJFSNm/2CwY1jhoGGuL4e3HNOmf9Jiww
         p6JqFJh9M3HzLEP8e9vaU2ALSPysilqTSrq+lMAkqt76NVSwvQ97ZsrvMSpPHhjIAssj
         ZNaaw8daOZubM9T5uaDrOsmKQFeNfZFIpnCKltTGm+VkoiSlVAoy0T0UMNUs214yKQqD
         kuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782818; x=1716387618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=16qftxrB5EgdSgH7j+99BTnIlGUnb8pcrY5C9J7hC3I=;
        b=PmezxJ20t2zciAPu/hX77zljqkKIU3BM6mJdHz2BhbSFTgG1xd4pvD32xP67qIgMFf
         zxcDYYDK132y9fUceHvppKpQSXoC/t6Lxqmh33r+jojnDpkCoH6uPBi1Z8/HAuaTSPNV
         uIKO4G5u9AJ6AbQGD/UfR1fZE/W+l5mQ5KUaLfE+j5TeNUyEz+4aMzPe/4bGU1x8+Ty/
         RhCkGT+zUxrUuB4lHdR7Nnbs5/341DQg+oNsZBYcDREtpFgQOxBvjwqfIp+YlPh7rD17
         CcTHqNceU0Hk/knHVwcE4JWZJ1YT31CiFnJ6gs5HGpvXrbE3J6Q8GFlAasQ6XQ7Qr/z2
         3EzA==
X-Forwarded-Encrypted: i=1; AJvYcCV7X/Hmjdng33xu08S9su9yvj8QzsPQLWEqaLSE6aVkjrfspVitU1EGex2MkpdDeGeNuQYrqEfLn4hDx5azZGi2ThRlgmKDGNebwYaKrA==
X-Gm-Message-State: AOJu0YxriNO5g3tmR3Vrce2nqAVfjesDETDa9MTY/itPSp+jSHHiE8zn
	c+XFKdD8w0Er6tPuE3KuFtH1d6kdA/o/l9CD45WWTAuXGski2doQWlitCDIyP2L+VG9sZ/SpGkE
	f
X-Google-Smtp-Source: AGHT+IFpgBj/DAxqhrrPpTiW6l24RSbRhMtwGY7avTDZ4wHHSHq0yDBMJDQD8AtftGZW6eRvsGhAAg==
X-Received: by 2002:ac2:5f89:0:b0:51d:6790:b788 with SMTP id 2adb3069b0e04-522102779dbmr13134213e87.56.1715782816422;
        Wed, 15 May 2024 07:20:16 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d2cbbsm2531960e87.277.2024.05.15.07.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 07:20:15 -0700 (PDT)
Message-ID: <200be7b8-a245-4d72-9514-eb5402a61b77@cryptogams.org>
Date: Wed, 15 May 2024 16:20:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: X25519 core functions for ppc64le
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-3-dtsen@linux.ibm.com>
 <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
 <7eb6bf4b-5510-48fe-aa6c-ac5207d5a2c1@cryptogams.org>
 <7859e867-ddf4-494f-8ddb-2949aafbb40a@linux.ibm.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <7859e867-ddf4-494f-8ddb-2949aafbb40a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> Thanks for the info.  I should be able to do it.  I was hoping an 
> assembly guru like you can show me some tricks here if there is :)

No tricks in cswap, it's as straightforward as it gets, so go ahead :-)

