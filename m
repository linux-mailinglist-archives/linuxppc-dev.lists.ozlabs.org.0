Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C7D79F1CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 21:16:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k8YLSIVT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm9Dg5Q8Qz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 05:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=k8YLSIVT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=axboe@kernel.dk; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm9Cl1tMWz3bdG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 05:16:00 +1000 (AEST)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-77dcff76e35so2121439f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 12:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1694632555; x=1695237355; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x4zSkAY9ImGwNcCjHTTaJbM5GM/WyQlYdRbd+ef7TV4=;
        b=k8YLSIVTl0p+/GZo0cZMJA7ytpXe3GCf0tiKZcf31HHs+eIQ74FD3fXxTKOZ9Nv4yP
         xq5i8R7MldfzdqwNyh7jbVK33tFpq7PI4p61RHlGdhaDs4bPjmItsr/DfCagQVveLONt
         KBZjuOUn25URTxjlupxyMcrPsWrm0IQLgD32uZSS5bczZ3eN7ZSACpM/zX6FOVjTl1QD
         YCTKkiDS+0iTX+dw9+FFWcQ4SjzQ7jRbAj0Lr3V9V3pJ9Ry2eMOeydLSO6V0P9n1l+FI
         qN97zM+AXorzfR/Y6Udg0LCuq9IyprDxBIWB4OCqeWYK5Zy42xCtD1GdSckiuRco5bKu
         j1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694632555; x=1695237355;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x4zSkAY9ImGwNcCjHTTaJbM5GM/WyQlYdRbd+ef7TV4=;
        b=ORPCXifu2jRiOQ6w+8jFr3gmQcecBnkSjajPqgXcwreTLCivZvvWhYEWJKyyckSa1B
         H425zNkxamJEeWpBkmkSxZA26z3odbLeTgOkRNySSJ4DUkDEdrQimN3aizpscv0hvMuE
         NBXQ6y5dK5dhR4CLDPJjephSx2JyXYlAY/AL1vJcwXF/nPKOLuhQfKKNwqqOXF500Ptw
         d/T6V7kfOCs1y7WTv8By7xBRBDmJjjoskIS/9TNS93H99/WDjl1t3aaHAsxusV5mKp/Y
         0lrOIMkAS/Na9nVdQwdVdfneLuSUyjns+pRhlWq9ekJ3G4L2p8UfBrb+In5Bgy+1Zs7K
         B1qA==
X-Gm-Message-State: AOJu0Ywl1vT2vTr/UqLe8qTgorP+n0I+cTCfijcsxEeOgpSDjmdJFpyM
	B1G/swfqjUHApPXym+94khLPMg==
X-Google-Smtp-Source: AGHT+IHyPlzHEiXrLYtOyG3dd+H5yVcu5Qbi6bs9p/FW1+eqTxe7UgbDnBr+u2tVkyeRzeqLOmvZQw==
X-Received: by 2002:a05:6e02:20c7:b0:34f:9fbc:8c7c with SMTP id 7-20020a056e0220c700b0034f9fbc8c7cmr2722113ilq.3.1694632555483;
        Wed, 13 Sep 2023 12:15:55 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id o9-20020a92d389000000b0034f13bcaf9asm3815116ilo.22.2023.09.13.12.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 12:15:54 -0700 (PDT)
Message-ID: <def46b96-b881-4806-bd0c-ca0b0462e72e@kernel.dk>
Date: Wed, 13 Sep 2023 13:15:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore
 support
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, gjoyce@linux.vnet.ibm.com
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
 <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
 <20230913185951.GA3643621@dev-arch.thelio-3990X>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230913185951.GA3643621@dev-arch.thelio-3990X>
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
Cc: nayna@linux.ibm.com, linux-block@vger.kernel.org, jarkko@kernel.org, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/13/23 12:59 PM, Nathan Chancellor wrote:
> Hi Greg,
> 
> On Fri, Sep 08, 2023 at 10:30:56AM -0500, gjoyce@linux.vnet.ibm.com wrote:
>> From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>>
>> Define operations for SED Opal to read/write keys
>> from POWER LPAR Platform KeyStore(PLPKS). This allows
>> non-volatile storage of SED Opal keys.
>>
>> Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
>> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
>> Reviewed-by: Hannes Reinecke <hare@suse.de>
> 
> After this change in -next as commit 9f2c7411ada9 ("powerpc/pseries:
> PLPKS SED Opal keystore support"), I see the following crash when
> booting some distribution configurations, such as OpenSUSE's [1] (the
> rootfs is available at [2] if necessary):

I'll drop the series for now - I didn't push out the main branch just
yet as I don't publish the block next tree until at least at -rc2 time,
so it's just in a private branch for now.

-- 
Jens Axboe


