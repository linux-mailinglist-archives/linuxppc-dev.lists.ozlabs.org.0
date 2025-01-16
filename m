Return-Path: <linuxppc-dev+bounces-5335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4E8A13699
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 10:29:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYcym3jD9z3bgy;
	Thu, 16 Jan 2025 20:29:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737019792;
	cv=none; b=EcVqC6dopqip+BI810GJ59EABF/2LPiald37VVbhjdJcXIM3a9Igt0IJYlIW9y9X1POqPP7f+dzYUhZ/jJjS1q64oFze7QG+E3KPxKhCv41NIj31Q9sGUU/5YTDYLX8nHAuWxCszGLJAhna66p7GfYEKJd0VCi9sWy977K6LdLOdLJ7R4762GKnAGM8Q+frKytjTUshjFug0/fLDGZ/UqLZv0I22uxw9eApjf0Y2NFfZSENq+s67EOKjFtc6bjyZwwxsDw2SXBl8YAHrtoLbm7zjCe4L5WUVILdib3GuhxxeP9wWp3d6npdlSnYehYZ8XM+SjWoO3ALiRqGdhf9ttA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737019792; c=relaxed/relaxed;
	bh=ndOQe7iYVdafaQgYnE+41A58i1xptE9OdOrBo0S9x6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QO0pl63TNxXER3eKfWB3cymc4QOmf5GuqKUWaSHLsOEvAikfRCJETxedwoPYdcgpVv8CfrwOKU0Omne3f2tXK229aLDn/ApDEB8omK3bMTGEn4A24gNkTXqlUfSvU7kN9HgLAg2U7aie373EVsyLYy7fQ8XQF4I5FEUFp8eevxucSvuTLm2dz1mCApPKwTFW38Whn0UXrgrNHrcJAl7/xif+rGdrFBiN2U3JZzlTmjTnnD/QXEUF18k4L5yFS5tMzbdmFRULyUPIpTieHjGr3zVkHn4rwrMH0Tfu2KnMif37HNUp1GhglBaCeCFQqPQHLyY8bFMCUY5vISXg3xzPUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XRXao3j9; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=XRXao3j9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYcyl4qTNz3bfc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 20:29:51 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862b40a6e0so399830f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 01:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737019788; x=1737624588; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ndOQe7iYVdafaQgYnE+41A58i1xptE9OdOrBo0S9x6g=;
        b=XRXao3j9urVTm5ajBt4SJV59ew0hwdkxIrOWPYH7wixV4pgLKUM+eLdWWaAf4feba2
         NPDxhYz2fKi5O6L13Ep1+Q2zuTi0JS6RilgRmwLldnaeS1ouFntMw+ZiClx/vfwu5Ysn
         nTeS3B0icNLr5cQ9r767D0Bgv+qoEpSQZu/JFV6pT5+8HzKG/lrIaIWGqP3RoUfRd58w
         J5gxNBVxHb162Yx1Yxz08OP0GIqUnjHtM/vYqqJG3mtoQXafX59lRL/cai057E+UoHUD
         aQo5n8l4k2C3NUdJ9p4jZJQvd5qRpTLMdk/5h908brHZ7J+PXNhfJxV5fbT5AdPAbcIu
         rFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737019788; x=1737624588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndOQe7iYVdafaQgYnE+41A58i1xptE9OdOrBo0S9x6g=;
        b=bGSCOy6G82rrXV+X6x7LB4LuLjRZBf1g2CfcQmQYXhAwUOFo63wCQBhJci8byBzVV0
         vg2Ceun79m4jrWQRva4aDRcnvo7sO1/VQW456m0Q2VFIkVR+cxRHVZukUynBTBNSI9k/
         mOdDXvxh0m3tJsoVYpqqruPC+9GFrLOUGuEKwhYv5zdeuQboC276An/h1+PWx882Oc9M
         fgyAsrrBIuXev8LKTHuNrXeyJioTM1GrSAwONU2oXrkFErfYPvg8d2i6auO9u9Hf0rPd
         2zDtiLsL9KLo3x/TN4tw6X9zCn2d41ldqLKJeLAcwVO4g5n6w8gAJe+60ZWpIOF7ao3T
         ah4A==
X-Forwarded-Encrypted: i=1; AJvYcCVaFVaK5jwR+Y0rXlW7GTg6lpEQssGMYIArYLUkXSZ6+pFI5rDU6WuKHRoHHaxD36MoZ9G/p17hmInONoo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1wcBSPdp1awBUgIAETCPStt/2MjKhVyJDestWI51u/EoRdqy1
	DD625r2aAEiZbFJ+5ejMc+rCY2nKr2rL6IiJyst9YO43SOLhMBmLbDDaIjN46F4=
X-Gm-Gg: ASbGncvRSqYMOTW2hAPW2EIR1wCU0cpVc01M8RZkRGbA5W5bOqP60483zv1e3p/rzsG
	UXRDXsSD5bteC0gZ9Y7WsRK9LMP9rfHX2K2SlwetyWHteP/JPwa7eVCZ/2kk4pcsuPJ3lf26ssV
	Kc4U55uJWIVZaEuZi8SVn5mpx/trNr/glRUHJus84OdZmrU0yHYPiKWqyGk3RcQlJh8QBq1Lyy9
	tOiu3ApkQTzeIr4wSjdK6s2JcOjqnR5MsljxWBpsfxHs3ZK/DjY3+2Yhg==
X-Google-Smtp-Source: AGHT+IH5nuIBbL7/hc99gmUbXnHjV1QmVgQbVuzI8DIlS9I/l5k+cT/NveGuMhqp+ADX/0RVXMkBfA==
X-Received: by 2002:a05:6000:4011:b0:385:f47b:1501 with SMTP id ffacd0b85a97d-38a87312d58mr26829937f8f.32.1737019788570;
        Thu, 16 Jan 2025 01:29:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c73e370fsm53343725e9.0.2025.01.16.01.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 01:29:48 -0800 (PST)
Date: Thu, 16 Jan 2025 10:29:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: jikos@kernel.org, mbenes@suse.cz, joe.lawrence@redhat.com,
	shuah@kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
Message-ID: <Z4jRisgTXOR5-gmv@pathway.suse.cz>
References: <20250114143144.164250-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114143144.164250-1-maddy@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue 2025-01-14 20:01:44, Madhavan Srinivasan wrote:
> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
> adds the caller id as part of the dmesg. Due to this, even though
> the expected vs observed are same, end testcase results are failed.

CONFIG_PRINTK_CALLER is not the only culprit. We (SUSE) have it enabled
as well and the selftests pass without this patch.

The difference might be in dmesg. It shows the caller only when
the messages are read via the syslog syscall (-S) option. It should
not show the caller when the messages are read via /dev/kmsg
which should be the default.

I wonder if you define an alias to dmesg which adds the "-S" option
or if /dev/kmsg is not usable from some reason.

That said, I am fine with the patch. But I would like to better
understand and document why you need it. Also it would be nice
to update the filter format as suggested by Joe.

Best Regards,
Petr

