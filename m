Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8629594B4DD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 04:08:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=If9smF9Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfVp53XlJz3cjX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 12:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=If9smF9Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfVnP2YQ5z3cjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 12:08:07 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-70d25b5b6b0so410971b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 19:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1723082883; x=1723687683; darn=lists.ozlabs.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l9YwhAKHI/Hi3XQCTqsr2QfZizhIngyNc507Z4rw21M=;
        b=If9smF9YLHBhS1+3TnGI78fiGHJEKgaB4aD+MMTLei6MLi9uHOztLvlD9fiAUosf44
         mnQD5VcgSiRbkYjqwjOYY7kJjUNAY5yVHopdzVH9PcO5dtmad1VVkr7h+iXU7uW8s0rw
         I7OVvYRWKnqRHPIGt3pDx4W7YKLqDUqoPR8ZTtjHvNj6aF9Kbwy7JXAnphN2z59LeZOY
         D3SvITuSkgvCgN5xDlRzmRQmTt6+yOxujMTAHEa73/YX05z8ddwphQoPDKe12gi8WC8y
         8VvfeyC6PPkQyC7266v/oh2lXj/eBuQbaLogDh8zGV35e3Y69wIZNOHZLGsEa1ABwEVE
         yMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723082883; x=1723687683;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l9YwhAKHI/Hi3XQCTqsr2QfZizhIngyNc507Z4rw21M=;
        b=agJdjZq8ev13q5blxlSQkHtxuFqBCIMUt+wOvi6A/F0CwJiiN8jspMvB30+owYM6OA
         P76YqoD00Xwdqw4UM0BdTuG0lhdFP8Hald1tgYCNErnFWxQbF1M+gwAGxqwws5PmOaTF
         L4pIgifz35xgyhkdwKdNOuCJqlVVJljwroWDYWEqvdpzmtsSWIa9gUiVIO0Zbvk5g9vV
         G+acjidqIouwtrxMsHKaXAY88COZgUH6C3eWB0x2hT2jGzC/biz3NFQY3px6GWoPCMR4
         O4cpKNt/ICw6oGxVz1Fs93ZVDxVuKIa8VPor9O264vIF2n93kBIobC0lOnV1a1anczjD
         bkVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZHHUHEqJF668y8XsL4KpQJUNXZ0/yAhyQugdilJPhjZfEqMad0GxiU+WF9qWjPNSkgaUsqfaFJQOzFu+VJLscK6sC8ElspfT5r4z+eQ==
X-Gm-Message-State: AOJu0YxMC+js/OgmqfHiO+eWzc67/tgfr2jAwap1rfnZ6PYqh1tz08dW
	Fy+EMkSzBcKKdQY/w0zzogBCans0ITc7pBftSE1sK/7Smjluwv27EioXTw9YOao=
X-Google-Smtp-Source: AGHT+IHrHVJyd5GUPNY5EbdWEh8M+WDzur8o6xEuv0h5JmUwie9vm1fBjf/yn0ON4rdG2GZrCOmcYA==
X-Received: by 2002:a05:6a00:2e1c:b0:706:742a:1c3b with SMTP id d2e1a72fcca58-710cad8df81mr620125b3a.8.1723082882674;
        Wed, 07 Aug 2024 19:08:02 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-710cb2e56e0sm161141b3a.153.2024.08.07.19.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:08:02 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Wed,  7 Aug 2024 20:07:53 -0600
Message-Id: <20240808020753.16282-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2408071241160.61955@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408071241160.61955@angie.orcam.me.uk>
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, helgaas@kernel.org, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, alex.williamson@redhat.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, david.abdurachmanov@gmail.com, saeedm@nvidia.com, linux-kernel@vger.kernel.org, lukas@wunner.de, netdev@vger.kernel.org, mattc@purestorage.com, pali@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2024 22:29:35 +1000 Oliver O'Halloran Wrote
> My read was that Matt is essentially doing a surprise hot-unplug by
> removing power to the card without notifying the OS. I thought the
> LBMS bit wouldn't be set in that case since the link goes down rather
> than changes speed, but the spec is a little vague and that appears to
> be happening in Matt's testing. It might be worth disabling the
> workaround if the port has the surprise hotplug capability bit set.

Most of the systems I have are using downstream port containment which does
not recommend setting the Hot-Plug Surprise in Slot Capabilities & therefore
we do not. The first time we noticed an issue with this patch was in test
automation which was power cycling the endpoints & injecting uncorrectable
errors to ensure our hosts are robust in the face of PCIe chaos & that they
will recover. Later we started to see other teams on other products
encountering the same bug in simpler cases where humans turn on and off
EP power for development purposes. Although we are not using Hot-Plug Surprise
we are often triggering DPC on the Surprise Down Uncorrectable Error when
we hit this Gen1 issue.

On Wed, 7 Aug 2024 12:14:13 +0100 Maciej W. Rozycki Wrote
> For the quirk to trigger, the link has to be down and there has to be the
> LBMS Link Status bit set from link management events as per the PCIe spec
> while the link was previously up, and then both of that while rescanning
> the PCIe device in question, so there's a lot of conditions to meet.

If there is nothing clearing the bit then why is there any expectation that
it wouldn't be set? We have 20/30/40 endpoints in a host that can be hot-removed,
hot-added at any point in time in any combination & its often the case that
the system uptime be hundreds of days. Eventually the bit will just become set
as a result of time and scale.

On Wed, 7 Aug 2024 12:14:13 +0100 Maciej W. Rozycki Wrote
> The reason for this is safety: it's better to have a link run at 2.5GT/s
> than not at all, and from the nature of the issue there is no guarantee
> that if you remove the speed clamp, then the link won't go back into the
> infinite retraining loop that the workaround is supposed to break.

I guess I don't really understand why it wouldn't be safe for every device
other than the ASMedia since they aren't the device that had the issue in the
first place. The main problem in my mind is the system doesn't actually have to
be retraining at all, it can occur the first time you replace a device or
power cycle the device or the first time the device goes into DPC & comes back.
If the quirk simply returned without doing anything when the ASMedia is not in the
allow-list it would make me more at ease. I can also imagine some other implementations
that would work well, but it doesn't seem correct that we could only give a single
opportunity to a device before forcing it to live at Gen1. Perhaps it should be
aware of the rate or a count or something...

I can only assume that there will be more systems that start to run into issues
with the patch as they strive to keep up with LTS & they exercise the hot-plug
path.

