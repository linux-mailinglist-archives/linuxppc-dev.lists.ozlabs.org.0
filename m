Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E91AE8AA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 01:42:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493t100zWQzDrpp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 09:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=amodra@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Yq7npGFo; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493sz56z53zDrfM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 09:40:33 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r14so1811170pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 16:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t2pHPUO5psRk+6AYZcx6fAxPGP+2uVE/k5zlxhVYoaQ=;
 b=Yq7npGFoXiQshxjDVuclwgklknnilfl9aB978gDcZ3RKRCa7CXHqaQR5HO/Z1ou7Ct
 2ZZFbm5uNsBG7BCcDWTYSkxzz6F7nIlq380QkFsbmnDCsfb4tNjWcjNVNpVUlHlDTWou
 LMicDqgfxjbhMA2iq9ryyBOlqNH9zyUyCBJamJ1hXlyN0CqBqmUcZ/Poppam0BJ2rjhr
 QVuwfn+6vM+8aS3oIUMEbsze+RbU8cSsj5CKsxZJXEWh81RHsFQT2GjnnJ8Oyd2ZkiAa
 W2Fo9n5I+HJAaRcQrbcmxNN3rN+KGXshiKOHVJ0tzsNqq98KPO79Xfbw5+qv/P/iiLH2
 X6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t2pHPUO5psRk+6AYZcx6fAxPGP+2uVE/k5zlxhVYoaQ=;
 b=KU2EdiijfowxG7M1pb1OVu5uvgi0msaoGx6NecSGKzR78HVwaPGKFfnubiogRL3FlH
 xCMmXn9xdCC81DTQOMSWUdWtf7A+J2j4/uHOSf3PkFk+SRtV8RZN+zyDPjKjHQmEnIcb
 u0oDz0ey6UwNkzwe6+kF4doa7doJ/mCwO3DQM1pyWHv+9KZPdycQse5+P/bWkbDVxlfw
 bApRTyHTOx35KRh2yj5zcbyaR/EEfc0v81U/zFU3gppd+R1dXLGk5Qg/xYt1nPyP5213
 6YFCcrDSsX8896dZ0BP4M3AmeYH21cgVRAWRAQuxfOQJV/zn6QrnEBL8Ycita918dM/5
 p/jw==
X-Gm-Message-State: AGi0PuaOStSS4fDZJM8ZDHvmuj03iBW/Rcni6YM+tzHT6pC8WYW6alhy
 j0aW4wFjhjQYZ7eNfK9qrXg=
X-Google-Smtp-Source: APiQypLr/AS425mDt0OZARiNY619IeuikYJvqstxOLMxwlfVwb3oVlgLCzB/uSSUZ6O66AvHNAaKcA==
X-Received: by 2002:a62:4dc3:: with SMTP id a186mr5858229pfb.40.1587166830971; 
 Fri, 17 Apr 2020 16:40:30 -0700 (PDT)
Received: from bubble.grove.modra.org ([2406:3400:51d:8cc0:f104:389:7c30:4029])
 by smtp.gmail.com with ESMTPSA id w3sm5568361pfn.115.2020.04.17.16.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 16:40:30 -0700 (PDT)
Received: by bubble.grove.modra.org (Postfix, from userid 1000)
 id 3604688BCA; Sat, 18 Apr 2020 09:10:26 +0930 (ACST)
Date: Sat, 18 Apr 2020 09:10:26 +0930
From: Alan Modra <amodra@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64/signal: balance return predictor stack in
 signal trampoline
Message-ID: <20200417234026.GB29913@bubble.grove.modra.org>
References: <20200417091747.316707-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417091747.316707-1-npiggin@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@lists.ozlabs.org, Anton Blanchard <anton@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 17, 2020 at 07:17:47PM +1000, Nicholas Piggin wrote:
> I don't know much about dwarf, gdb still seems to recognize the signal
> frame and unwind properly if I break inside a signal handler.

Yes, the dwarf unwind info still looks good.  The commented out dwarf
near the end of sigtramp.S should probably go.  At least if you really
can't take an async signal in the trampoline (a kernel question, not
anything to do with gcc support of async signals as the comment
wrongly says).  If you *can* take an async signal at some point past
the trampoline addi, then delete the comment and uncomment the code.
Note that the advance_loc there bitrotted ever since the nop was added
before the trampoline, so you'd need to change that to an advance_loc
that moves from .Lsigrt_start to immediately after the addi, ie. 0x42.

-- 
Alan Modra
Australia Development Lab, IBM
