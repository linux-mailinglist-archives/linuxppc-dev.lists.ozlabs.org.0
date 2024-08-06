Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2BB948685
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 02:07:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LD1soPk5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdDCR61dNz3cgP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 10:07:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LD1soPk5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdDBl4fpvz30Vv
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 10:07:09 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2cd5d6b2581so10968a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Aug 2024 17:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1722902827; x=1723507627; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NAHTjQgD4+zmcG5S0XfaQDNArJDKgMYBVIZNZ/aJ1Cc=;
        b=LD1soPk5EPT3r0nhHQiLqTdlg1FUn3mOGvXM3zdQfReyy6DqhwFxl9EEf+IsFItBug
         /h3ljVAgvrhXzvvLM+HUPsg7T7ou6LBbVMp0XSgT2WeYSMJzxjZiwSGf2RtqFoVCFceN
         lVZ3EFqUBlPEtqTB9jpBiEmgWZc49VGLdzVzuFEyiNL94hXAXdputRayChW4E3aFHt4h
         /6jVSkg1GodVgYoOTbOh1a8JK396wK0i0LPW1pL+oT4YTiMXhoFS0+Ne8ZRJFVCy+P4I
         lev9ARU3jTScimM/5R+D5vUBFB3mzCoShuHxN80sycIG9nle7KyTE9FMFmZf7NSnR30R
         n5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722902827; x=1723507627;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAHTjQgD4+zmcG5S0XfaQDNArJDKgMYBVIZNZ/aJ1Cc=;
        b=pdYhl2NX/ewOZ9m/XHaPgWBzomwetwqOVbDp6SdmG0bf6wq8pnAZ66twAlzCKL5/aF
         8TYYPf4a8C2BP35sFUma908Dyp4nEo7RkzDXxqwzDZyChJd5y0t5PMh3vfTRP1lrF7in
         ItUhPwPWnasV6vsa0+SRxhL2y6lc2WG6BoQxKbiWfzPGbXQ/fcsfXaMmKumm/NwfAD8B
         37UeqgXtV5+OtB+LeHdo56+oShBL1WcEdzK6bQbkIx1x+i4f3h5LfXK61caVs7Zyug5z
         HdFeZU4uUsoida/GjcDU6N4zixJRRiuL5VFAkSGxtys55aisUsuFmezWGJeo/pK/Axjw
         AOUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/dpypCx2brNNDZEx/Yr+VJDi8YivvLJpcUQhqRcBeO+BawU2sDuMJAuiVptn1JcYL6dc/J8+kIdwye7GquzHHU7aKlMGJK5S83YHgAw==
X-Gm-Message-State: AOJu0Yx7ZQfZKQdim1DLTOoZVeguWNdC6LYTPfzaWkRl6Lw6KgqN1MEL
	AhT7OLU8nJWJFEVUOpK18s7/tefWqTjmDU3b5mq6ekMWRdRy70T5tP1B60th07w=
X-Google-Smtp-Source: AGHT+IEQSHScRjfnGvU+Fw05tXfpsc+P5lXsv6/4ahugCBzY43bWRk3MpQCenDGZj1yYOONAG+y5yA==
X-Received: by 2002:a17:90b:1e04:b0:2c9:8b33:318f with SMTP id 98e67ed59e1d1-2cff94143damr11644050a91.11.1722902826882;
        Mon, 05 Aug 2024 17:07:06 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2cffb388ecesm7730694a91.49.2024.08.05.17.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 17:07:06 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Mon,  5 Aug 2024 18:06:59 -0600
Message-Id: <20240806000659.30859-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2306201040200.14084@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2306201040200.14084@angie.orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, helgaas@kernel.org, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, pali@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello again. I just realized that my first response to this thread two weeks
ago was not actually starting from the end of the discussion. I hope I found
it now... Must say sorry for this I am still figuring out how to follow these
threads.
I need to ask if we can either revert this patch or only modify the quirk to
only run on the device in mention (ASMedia ASM2824). We have now identified
it as causing devices to get stuck at Gen1 in multiple generations of our
hardware & across product lines on ports were hot-plug is common. To be a
little more specific it includes Intel root ports and Broadcomm PCIe switch
ports and also Microchip PCIe switch ports.
The most common place where we see our systems getting stuck at Gen1 is with
device power cycling. If a device is powered on and then off quickly then the
link will of course fail to train & the consequence here is that the port is
forced to Gen1 forever. Does anybody know why the patch will only remove the
forced Gen1 speed from the ASMedia device?

- Matt
