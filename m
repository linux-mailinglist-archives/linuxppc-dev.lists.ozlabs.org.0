Return-Path: <linuxppc-dev+bounces-795-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8A965858
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 09:24:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ww8m76ZlQz2xFn;
	Fri, 30 Aug 2024 17:24:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725002663;
	cv=none; b=DcMVQy0lNAldOz6mF76qB2skKliKo95dL/AO4hI2u6cCb9w2w7oMI2rKO3HwIGa1hTkgZzn5pn15oNMqAcB7PKJTcFrgMctKvF7ZBwWi/h2Sw279ZYc0aIAwOwUJB29xBm0/Zd1F4ylHWlnAFdejE+9Qvhj+CFesarapnT+WRgwW94p5S59bToBxvrSkQdsr+tFdEaN2nbiJYSaspn7JgoWikQS0CJlQENvveD0U9X4XvjnB/YLb4uwc+dy/Q6UQgWsVVkMQc0oVZ4NTZOaUr2CIovpQyTDwBW8+blJkFtxFxKN36528PlU00sHuvpqV6HWRrbn0v4M9Y3O5M0IU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725002663; c=relaxed/relaxed;
	bh=LVVslDV3vhH3TXW75WoEiVqsEhuwKn0gtiz/69L72e0=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=FJQHXxVyeZmWGrZLo2x/z0l2g/8EdeRgaqnqGTRJE5YlYn15M3A1OpUmjgNxdmv9ntyZc5r3GD/6Rmmu/zU8jenS6/DQo7QPEt5ObYz5GZgYpQWvF88rDWOpW1v/tAEjpU/vYE4O7SmyZdUfoEg4vZT2+XvUEfF62RJqXg4KhYLditNgqRjMPUZ/GiduM1Lckbun58Wl+GKADgwttPosY1wKevFo3uaZQ8mygCcfAEL8ZYtITXKtvYyX/XLVoYdJv8rfQSFYxyQGVN7hPwYKOtcQl4dt1Ck1zp+euu0hWlesIa7pigHbR0+i4JI9RAwyN4dnwY3Gdc489yYtWRB07g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.219.42; helo=mail-qv1-f42.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.42; helo=mail-qv1-f42.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ww8m70HLVz2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 17:24:22 +1000 (AEST)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6bf9ac165d3so8540746d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 00:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725002659; x=1725607459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVVslDV3vhH3TXW75WoEiVqsEhuwKn0gtiz/69L72e0=;
        b=uHSwmKMvx6VvKwSrA1Gm2+ewj1xvc9VX/4MeDvDTy1dKjxSmrr+yXymd16D7Xz2AHi
         WtrgUzaq+t4VjQYWioTD4GX0u7a22MCEvYFD8D1JALx3tA9nPeGOMCGH0piM2xGVWNd6
         mhTBjUSSr0U8VX1/qw8yRC+j1LwP4CcrXcdAua64C7PGrRIa4gUfDU0efboitgiJJiyj
         DmnDXKXhHTN8F9gJNFyVfMLwEhqc/Y/m7PHeNNMhKGcphY7uXQdYLBH7idorBc8j3tWV
         OhSGIXfWdTQVqPupP4DEe8Ha5wFbT8lTs8TNb6kMBT7Szo9UX35Ub4B5hnGYRKbr1tBF
         b22w==
X-Forwarded-Encrypted: i=1; AJvYcCXMDPCGF0BOe2cdbF/99Qj3XKbCL+cnnI8T+1Y0dFVyxZo9IJI1RKinmRzFNDVvI/dj+iOrZnQxFXdq7JY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4Hvw/YGap6kXK5vMGTNWkxWIUTQkcYFat2TtTeKMDaRIPtPQr
	8wBDu3SJyx+GsPCYUnaRFvJjCmDL+QrJ2r7eR5wDi9ljaWE4TSDG
X-Google-Smtp-Source: AGHT+IHTmrzrM2U/eyTLZYz6w/tWs+TLwJZ5juO5eDi0aDfQrqBJTTIuzoqHW54tkQxTg2xYjnmIBA==
X-Received: by 2002:a05:6214:419e:b0:6bf:9281:96b0 with SMTP id 6a1803df08f44-6c33e626c75mr53795666d6.33.1725002659506;
        Fri, 30 Aug 2024 00:24:19 -0700 (PDT)
Received: from [192.168.2.204] (bras-base-mtrlpq3141w-grc-05-65-93-184-127.dsl.bell.ca. [65.93.184.127])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340ca65b3sm12308646d6.119.2024.08.30.00.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:24:18 -0700 (PDT)
Message-ID: <e12e89e5-9617-4515-a3a5-19cf9a6db624@vasilevsky.ca>
Date: Fri, 30 Aug 2024 03:24:17 -0400
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
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
To: Baoquan He <bhe@redhat.com>
Cc: akpm@linux-foundation.org, glaubitz@physik.fu-berlin.de,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, mpe@ellerman.id.au,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Reimar_D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <ZtFoMMsS5PuFw3LF@MiWiFi-R3L-srv>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <ZtFoMMsS5PuFw3LF@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-30 02:35, Baoquan He wrote:
> The overrall looks good to me except of the CRASH_DUMP=n on sh, do you
> have a comment about the reasoning since you have discussed with John?
> Is it because of below config items?

I don't yet know why John asked to turn this off by default on sh, though
I'm sure there's a good reason! John, I'd appreciate if you could chime in.

Otherwise, I could split the patch, and we can discuss the default
on sh separately from powerpc.

-Dave

