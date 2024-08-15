Return-Path: <linuxppc-dev+bounces-111-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC849953D60
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 00:42:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CXAFBcZ+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WlKr508rcz2xfb;
	Fri, 16 Aug 2024 08:42:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=CXAFBcZ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WlFqF0NjZz2yZd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 05:41:11 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-710ec581999so1128042b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2024 12:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1723750866; x=1724355666; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1VWISu56wcliniL1RPNMTZcS4mUkuTA+1qK0QABl0U=;
        b=CXAFBcZ+oa0Kqfv7avnRuw6oYsbSTjjAjyVpH177YRUnp1dNT6KMe/9euFbix/34G2
         opcINKmQek+qH5FR7/ZYYLECePfemDAOe9uB99S/DmWdfaN9QDuSwMFxW6F9MYhPaYbF
         AYXkWdopSBug4Xs8V/GDHQueZjYuN+xSk0xlB3ckTNPctYuRnFK6SDkXwVX8S/Jt1YAi
         cpSK2yOBn1HoR8c8oGN0bP2xkMuEHN8hLrBZmdzLVxO5VH6SDxUSH4ozXOA4pFeuTUy3
         ifLAmceIzm0kajNneAIn5wfF38twt5hQhQNdKKk7Jq8MuqB+5L+GIlw43RMFtNR8S1XU
         HQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723750866; x=1724355666;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1VWISu56wcliniL1RPNMTZcS4mUkuTA+1qK0QABl0U=;
        b=UWX/erRfaviAGZDQEledL3reNBSg6vVQgfUN0TWeY3wVyAY+0+kRR/9MU6/F8lW/5R
         5Th8h3U3BrKGpt+fNr/fYzefdByPb6owaVfKB1FzqrB2mbtCWrR30eY39v/31EXWYFD2
         LcC4Bon7CQx8RXHkMQDvLaPbj3R3yWsFYJ0LJu3L8ArsgHwqTFFlc90+4/ui1QOy0NiJ
         NBu/QcjvaH9BMuASt4t46Yx9G4LUizQ7AP/2dmc2PO1eyoNwOXZjgawsEGR3G9PNuAjZ
         68wB7wKBTqgH93cWiAt8TA0Euoi/h7epRjJ8kdlwde+n03yBq/04AloJyd5RlYVSw8IN
         UO+g==
X-Forwarded-Encrypted: i=1; AJvYcCW/wi8eJev9BPkqE9a9Yt4fzKid2UEs0cAEmuFQqNraWNe0Eh34tlMunWv5r3vY4oyL75x1NIHRDThe/aqNQMqfH5dbrrVHLPw0MX4GCA==
X-Gm-Message-State: AOJu0YwZ4so9OhoMgSGvZxrUQPCWz6n6AaJrUm549bRkj16BjIbbw1Lx
	AZAqstOL7wvUhHxfMFl6WfZzGW4krfIi1LtY9EBVoQt1YIzeucx5iwfgJdbfWzo=
X-Google-Smtp-Source: AGHT+IGBeVra0eMWvYeLqHCk/DezHt9EnEpabZ2WKu9TSxo5+eSv9Ov+1Xc7qtkvdvQlB0z9sH91RA==
X-Received: by 2002:a05:6a00:66cb:b0:710:bdef:5e15 with SMTP id d2e1a72fcca58-713c4e71508mr894035b3a.18.1723750866152;
        Thu, 15 Aug 2024 12:41:06 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7127aef410esm1342447b3a.113.2024.08.15.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 12:41:05 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Cc: alex.williamson@redhat.com,
	bhelgaas@google.com,
	davem@davemloft.net,
	david.abdurachmanov@gmail.com,
	edumazet@google.com,
	helgaas@kernel.org,
	kuba@kernel.org,
	leon@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mattc@purestorage.com,
	mika.westerberg@linux.intel.com,
	netdev@vger.kernel.org,
	npiggin@gmail.com,
	oohall@gmail.com,
	pabeni@redhat.com,
	pali@kernel.org,
	saeedm@nvidia.com,
	sr@denx.de,
	wilson@tuliptree.org
Subject: PCI: Work around PCIe link training failures
Date: Thu, 15 Aug 2024 13:40:59 -0600
Message-Id: <20240815194059.28798-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2408091356190.61955@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408091356190.61955@angie.orcam.me.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Sorry for the delay in my responses here I had some things get in my way.

On Fri, 9 Aug 2024 09:13:52 Oliver O'Halloran <oohall@gmail.com> wrote:

> Ok? If we have to check for DPC being enabled in addition to checking
> the surprise bit in the slot capabilities then that's fine, we can do
> that. The question to be answered here is: how should this feature
> work on ports where it's normal for a device to be removed without any
> notice?

I'm not sure if its the correct thing to check however. I assumed that ports
using the pciehp driver would usually consider it "normal" for a device to
be removed actually, but maybe I have the idea of hp reversed.

On Fri, 9 Aug 2024 14:34:04 Maciej W. Rozycki <macro@orcam.me.uk> wrote:

> Well, in principle in a setup with reliable links the LBMS bit may never 
> be set, e.g. this system of mine has been in 24/7 operation since the last 
> reboot 410 days ago and for the devices that support Link Active reporting 
> it shows:
> ...
> so out of 11 devices 6 have the LBMS bit clear.  But then 5 have it set, 
> perhaps worryingly, so of course you're right, that it will get set in the 
> field, though it's not enough by itself for your problem to trigger.

The way I look at it is that its essentially a probability distribution with time,
but I try to avoid learning too much about the physical layer because I would find
myself debugging more hardware issues lol. I also don't think LBMS/LABS being set
by itself is very interesting without knowing the rate at which it is being set.
FWIW I have seen some devices in the past going into recovery state many times a
second & still never downtrain, but at the same time they were setting the
LBMS/LABS bits which maybe not quite spec compliant.

I would like to help test these changes, but I would like to avoid having to test
each mentioned change individually. Does anyone have any preferences in how I batch
the patches for testing? Would it be ok if I just pulled them all together on one go?

- Matt

