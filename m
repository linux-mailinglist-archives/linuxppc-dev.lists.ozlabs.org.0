Return-Path: <linuxppc-dev+bounces-9241-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EB7AD2E38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 09:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGfnz4gh9z2yVV;
	Tue, 10 Jun 2025 17:00:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749538855;
	cv=none; b=A0STcAJST4YXlWtaGn4Cl4s0y8s2UX32CqkkmUV+1m00EEsXHHt4B25G/g9mO3ysrzG7AOz4RTCrPqvEbuJ3B2V012oaw4ahPAjUFukrBvCE93juQXZN8bJlmzMFpsc6Ngh5kpnZYrwDNpGeb+yc5TsgHmUktDStgne3GP/ExcjsK/ls1JCFraw472HU/uX/dPRqjUpOQZf9uQummmYmhx2QP+fp+Txo8ENjLK3amuqyvxPgX+jK25Tq0TDNCRjhy+R2fQoqag06Bk53EBTf1+PcwF579JdADTXS4DakMINjXhBXGw2oU6EdtrxWrOk1NsiEZ45mqs/a6DZvot7Wxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749538855; c=relaxed/relaxed;
	bh=JUJitp02dLbwyW6XXbPMt7kAqtrb2lpqnpotbucX9CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TDPzERmh3cTNVAReDO9906VCyufzSbd9QOzhA/AVaWh+7HCVL6U+sSsDEjPlGZ9uQ3kLL6MFy9quGV4/OXm0rqf5i1FzoJN18Nw2oskREzC64l86ZXhCLubqRbXFDfsDN7Li5wzQZPP7WStimtWUtg8W/k1emaLLfO8KN6Chb+YLhXFV/dBJLSy2leE2NA1wAm/NTN5bhFLGo8ibdBE2s98qPZ4g4SiV4cdqQH7FeVhwZorMQvdwNwEAwTxZ2CAiw3FEy038WIVHw+TimY7YzY9uAToh6I3vTAQ/6lsfkS5zaeOYMhL8k6z0f1/NPnYRtTi4actCQSGGUsxynP7JvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Oh8KjCqK; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=Oh8KjCqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGfnx3fzqz2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 17:00:52 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-742c27df0daso4569403b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1749538849; x=1750143649; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUJitp02dLbwyW6XXbPMt7kAqtrb2lpqnpotbucX9CA=;
        b=Oh8KjCqK/+KmgKeF8uENZqULtXWuNTpRvkKqU1DjzIFj9NFklH20Yp6cqhh4eVkcs1
         ZHKrSgAoGrsOYEG8P6TsfXX6vrbkPDykSygv4b0I5yva2ze0tngO4FXDoJtDcEQNduGD
         umfk49tKG0SouaQDyPQlQvAVGm0v5luNj29VNz/Q/l4na0A4F0rrxI+75Q15ak0+Yuv2
         m8u9eLxj9odvx+LSiDC5s6SnViYnlXbrzZQ/oWJPH9s2VAkWjnpPBnokzUE9Q8Qx5X2/
         jKvqedGaADCHie2eK3dP7NH0QvkMYUJxKzGdala3R6H8zpEFQwWiI+BpWzzagSFSDOUd
         DyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749538849; x=1750143649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUJitp02dLbwyW6XXbPMt7kAqtrb2lpqnpotbucX9CA=;
        b=NhMTHmTJxAPFu5q0AFIdMS5OuIzN8fHljUhVr8f4/79KWg+7zbKu1fLb9cgtfl6wv0
         RlSPtST736amPM2HoKG4+DbvvuA/0C0f2r2h4iw6q5FpaYg1Ai6bN9gY/bAFg/EcyW+s
         XozzD6YLnG22pOMY627ssEnbpPz6SPH9/YPqi5jbsHJzObM503T+3dfGRVmaAu+GiXCq
         0Phm8XM7VUN+xt3Bkuwb2slRZ53HYZrEdeo1txOhE3pKj84FUuPSoTP5l/QHHPEWRYMs
         E6eXW7WW9eIkQygh40MMZWgZE/eyo6slhwMepPu5Rfym3A4y0BxqyK5RIUsdvdZphZnp
         A8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUHbDf7+hTGrmzMdpDKKOVgx6Y9COtpdXHvqRQwIffM97kCZ9Js6TkotePahBoVY0614tppK9NRdFkpBJI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxY2Iwc2ZXIVIo/GXAEJ0Wh/rULEyxEyl+HKWzqGb9vHJkL7dYP
	cTEFYxsLdcp7xRSZ6bD7sKuveuHpGK/UtrAfDNV7P0PFD5MzbKbZYlcnvCNqD8xcgbE=
X-Gm-Gg: ASbGncvNY7QQY9U/xiYSNXfkmgYELPw3jxd8kyWkBXdUZqD1H0BcsR7FUtVxnHtfVO+
	YhUW+VvGtLTTk4vutG20VmFoEYD8yhxmujUJTzJMyGz1omaYVrhMJ+IuOIMhQlN0nk2j96wDg9R
	BsqnMjLKxvlGdg1fphXMb0yQNeszIfSeJtwdrfzH7uh39SK0drPsrr9OlBPdNCLR3Axk1r/NgL8
	GSyZjnKM0xCqHcSaFNp8gXLq+GHFynWxY2jgUavWlLm/GC0Rzwhj3AOSXD4C9EsH6bij3ODk6gS
	AEtuRl4wf7Ont34vQZ2Or4UIbrlwKeN6MdPLLYCrFMPRhXkFAbm4fI5e91HquNdCWtiCX50hMrG
	DIu4SAx2uC4I6XndYanRmYzs=
X-Google-Smtp-Source: AGHT+IF8uzdNqEI314pocfYYQWBeowDkb4F+LwQ50ySlNHswx1qiGOLWHPFnpEwYjMluBjhKg3WXFg==
X-Received: by 2002:aa7:88c1:0:b0:748:1bac:aff9 with SMTP id d2e1a72fcca58-74861888babmr2307166b3a.18.1749538849387;
        Tue, 10 Jun 2025 00:00:49 -0700 (PDT)
Received: from mattc--Mac15.purestorage.com ([165.225.242.245])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482af7af0csm7038483b3a.62.2025.06.10.00.00.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jun 2025 00:00:48 -0700 (PDT)
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
Date: Tue, 10 Jun 2025 00:00:44 -0700
Message-Id: <20250610070044.92057-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <alpine.DEB.2.21.2410031135250.45128@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2410031135250.45128@angie.orcam.me.uk>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello again.. It looks like there are specific system configurations that are
extremely likely to have issues with this patch & result in undesirable
system behavior..

  Specifically hot-plug systems with side-band presence detection & without
Power Controls (i.e PwrCtrl-) given to config space. It may also be related
to presence on U.2 connectors being first-to-mate/last-to-break, but
I don't have much experience with the different connectors. The main
issue is that the quirk is invoked in at least two common cases when
it is not expected that the link would train. 
  For example, if I power off the slot via an out-of-band vendor specific
mechanism we see the kernel decide that the link should be training,
presumable because it will see PresDet+ in Slot Status. In this case it
decides the link failed to train, writes the Gen1 speed value into TLS
(target link speed) & returns after waiting for the link one more time.
The next time the slot is powered on the link will train to Gen1 due to TLS.
  Another problematic case is when we physically insert a device. In my case
I am using nvme drives with U.2 connectors from several different vendors.
The presence event is often generated before the device is fully powered on
due to U.2 assigning presence as a first-to-mate & power being last-to-mate.
I believe in this case that the kernel is expecting the link to train too
soon & therefore we find that the quirk often applies the Gen1 TLS speed.
Later, when the link comes up it is frequently observed at Gen1. I tried
to unset bit 3 in Slot Control (Presence Detect Changed Enable), but we
still hit the first case I described with powering off slots.
  I should be clear and say that we are able to see devices forced to Gen1
extremely often in the side-band presence configuration. We would really like
to see this "quirk" removed or put behind an opt-in config since it causes
significant regression in common configurations of pcie-hotplug. I have tried
to come up with ideas to modify/improve the quirk, but I am not very
confident that there is a good solution if the kernel cannot know for certain
whether the link is expected to train.

Thanks,
-Matt

