Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C06C93B786
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 21:19:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZVfdGLB6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTkN93W1nz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 05:19:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=ZVfdGLB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTkMT0Cvvz30St
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 05:18:43 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-70d333d5890so139820b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1721848719; x=1722453519; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a02GUhiWbAY4bVUVygn/E4p/MC1dnbGGAe2U0twtjyY=;
        b=ZVfdGLB6+t7L20+/NontxbuJqdeve28Ldo7LDPPwdJZV0WSixHid/cYO9MLYkZis5C
         +Qu8eQLN0F9W22r9gTILGTK7rVIP9geED2U7DBveGEo/Mp8CZUYH0yupmfPMpuWUbM3B
         vZfhR7W3vAORZwmHafLFIZcwJxcqnE08Rn9zIXCkge1aYsYRgbgIbo3Zp7t/6skZJqB/
         oJuQrStKc0Z7xx5tcOR0HT+M6CcJoiZx3kS1i8S9WeDrkTzZqLr/b7nakBaSCGF64u83
         ArvpHXfO3wIPRiP6gG5ja/tLJHm2av/sb8yq5bmQJYWSwqRPGN+CCl1HL2EHNKtL9lvX
         U1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848719; x=1722453519;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a02GUhiWbAY4bVUVygn/E4p/MC1dnbGGAe2U0twtjyY=;
        b=qCSPFyNH3machF5oJy8rbVIB5tXbVMootTSH8niXmc98VWsxQQUBMySf2Zb52S+mnN
         M0g9e3AK0H2hdXG+rKHhvB5IhEHBWLNJdStuuIStwSdHkZ9f+j/28zR2Gp7FOsVUVA16
         Cajozb9ZZz7Rt0VpaV2nJ3ut2Sybq2JqwrBPWkQSdpmm8+UeufkAyu2vpr1aCKn6njuD
         sLa6WVSNq4LgXcfIC9P095/CAgPlqOIGyzN8yxawiMyGCgibz5tM2Px4B2CuqT+P2sFE
         QW7izsFLouxJNpu0aq2q66ez+xLf6/E8K+vek0R9lAgDphmqA93ZmN/KAbQq3O86RdBz
         XeIw==
X-Forwarded-Encrypted: i=1; AJvYcCWncn7voczlkf6J83IP856UwOarsZC5znNTYFEKV9uvtmPgFXKD8y88s12BDu+wFzKcz6jqqV/upwTb6oL4z+Pnpjagtx3Jv3Gp7mUPMA==
X-Gm-Message-State: AOJu0Yx69vnlXmXU7HcnvJdR5FBDJ/zVzHm632ZYEe0bgeXjXL1M+qFH
	R1UljKBaKZ/b7+OBfYmcwvQdZO2V5S1HRZFT11f5O4ZNzvDy4AXOYgmjdxaK3+Y=
X-Google-Smtp-Source: AGHT+IFUwWJ+8obz221hJG5x/jzoeJXTY4KS7z9HkU5UcBMvPmWxLk9KdioZD32zMoXRgep0BAh/AA==
X-Received: by 2002:a05:6a00:3cd5:b0:70d:15b9:3ece with SMTP id d2e1a72fcca58-70eaa946a3bmr578402b3a.29.1721848719142;
        Wed, 24 Jul 2024 12:18:39 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-70cff4b8166sm8862385b3a.85.2024.07.24.12.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 12:18:38 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Wed, 24 Jul 2024 13:18:30 -0600
Message-Id: <20240724191830.4807-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2407222117300.51207@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2407222117300.51207@angie.orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, npiggin@gmail.com, alex.williamson@redhat.com, ilpo.jarvinen@linux.intel.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, pali@kernel.org, david.abdurachmanov@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, mattc@purestorage.com, saeedm@nvidia.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry for belated response. I wasn't really sure when you first asked & I
still only have a 'hand wavy' theory here. I think one thing that is getting
us in trouble is when we turn the endpoint device on, then off, wait for a
little while then turn it back on. It seems that the port here in this case
is forced to Gen1 & there is not any path for the kernel to allow it to
try another alternative again without an informed user to write the register.

I'm still trying to barter for the time to really deeply dive into this so
must apologize if this sounds crazy or couldn't be correct.

- Matt
