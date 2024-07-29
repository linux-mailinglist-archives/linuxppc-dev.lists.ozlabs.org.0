Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BB93FDDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:57:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JDETK6Yj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXnfV1DWgz3cfy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 04:57:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=JDETK6Yj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXndn7486z3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 04:56:44 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-70ea93aa9bdso2511632b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 11:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1722279399; x=1722884199; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzEwxQGj+0IZOLuTF4KLdIouOQ7maqSg1CPSph8L8J0=;
        b=JDETK6Yj4U3Gb95oj68x67NoW6K8ZnBStrAkoEpiSHHf+CP4eP7A31ygP6MP8F3kQN
         I2ztDmefuVJ9YG7s7tPornL8IWQGyvFzhYIeCayfntvpcUEHNMlQLcVWDECcMHnDUmjH
         09+c8EptkMhKitI7/tYnRRWnKF30SqATpONJ/hDHrKwb7u7XFfiVar+JTKA4fr7gnGbS
         Kn+T+VD7mznLd7NHmSMJxdLN+J3mzTfD5i2pCg88XZqOdwaypi4+5lnr5hJ7GMpHuiOI
         nhN2ny4tlLrrz3F8TiaMAcdqFFVHpWeOWLWvDvMGkJleiYKPNjvPe2Ct8j1/yTZs8xA1
         oLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722279399; x=1722884199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzEwxQGj+0IZOLuTF4KLdIouOQ7maqSg1CPSph8L8J0=;
        b=mOOOyp2hpLEuCxmN7vIWmuiHa9K+vVRg9GZvS0I/l5NEUI3/i5v10j3bepLrb/nPe5
         8+Y8I6oPcvB+bTSYGl/3pyFl5c9ap1RDxyuO0Ro8c7IX+6sCgL6EbQQ8O3wm4GNfSOzB
         VYHMb+qxRxbTe/n2tPyOY3VyBuNnkMxTPtWXD5KvB+j7enPIfn8OWU4luX++aYZWwZwX
         IFCIlyeviXaepPxFKB1Ag76icVdyxp/ZVMc1yNFao7jhuYO4hAGtOHnFbChRNFUIVsi2
         4YvzhfekEM6oIVjy+9Gb3XhJHD8F9e4fHEkzZbnew2+Mc5DdJnVwluZ16VcmyMOPFR1n
         Zd1w==
X-Forwarded-Encrypted: i=1; AJvYcCVUt088GLUfeWnFauwA9uoba4EWdScUw/yEib/Vsu0+GWa2+MqRLybmobaVkUtrvx2GMVJZJwuthi1hRMGGpgM/Ryv5XO2Yq+zT/61afA==
X-Gm-Message-State: AOJu0YzDiisOM56tfsR+MYQ9VbKjOV5kMhmyLFErJ3Ip1ueSxKCtcZkJ
	2btTuyqLRud9kpxGVIowPscemqYu6y8vRXY0I/r/H088uWrZe8OZCzHXR9DXyxw=
X-Google-Smtp-Source: AGHT+IHp4G/eNIx4GLsebVJC5eA3zOPjD4ezvkrqqaLtoBYO/pkdRShKVSU014d6+Yn8k2Pau3dazg==
X-Received: by 2002:a05:6a20:7f94:b0:1c4:8da5:5825 with SMTP id adf61e73a8af0-1c4a0e05515mr7565769637.0.1722279399232;
        Mon, 29 Jul 2024 11:56:39 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1fed7c8cfdasm86722845ad.41.2024.07.29.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:56:38 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: macro@orcam.me.uk
Subject: PCI: Work around PCIe link training failures
Date: Mon, 29 Jul 2024 12:56:31 -0600
Message-Id: <20240729185631.26746-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2407291540120.48387@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2407291540120.48387@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, mahesh@linux.ibm.com, edumazet@google.com, oohall@gmail.com, sr@denx.de, leon@kernel.org, linux-rdma@vger.kernel.org, christophe.leroy@csgroup.eu, kuba@kernel.org, pabeni@redhat.com, wilson@tuliptree.org, npiggin@gmail.com, alex.williamson@redhat.com, ilpo.jarvinen@linux.intel.com, bhelgaas@google.com, mika.westerberg@linux.intel.com, pali@kernel.org, david.abdurachmanov@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, mattc@purestorage.com, saeedm@nvidia.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 July 2024, Ilpo Järvinen wrote:

> The most obvious solution is to not leave the speed at Gen1 on failure in
> Target Speed quirk but to restore the original Target Speed value. The
> downside with that is if the current retraining interface (function) is
> used, it adds delay.

Tends to be that I care less about how long a device is gone & more about
how it will behave once it reappears. For our purposes we don't even tend
to notice a few seconds of wiggle in this area, but we do notice impact
if the kernel creates the nvme device & it is degraded in some way. Even
though we might have automation to recover the device we will have lost
more time already than by the purposed delay afaik.

Some of the time a human would have hot-insert'ed a new device, but much of
the time perhaps the device will be coming back from downstream port containment
where there won't be a person to ensure the correctness of link speed/width.
In the DPC case perhaps the endpoint itself will have reset/rebooted/crashed
where you already suffer a few hundred ms of delay from EP's boot time.

I would be interested to know what kind of maximum delay we would all be
willing to tolerate & what applications might care.

On Mon, 29 Jul 2024, Maciej W. Rozycki wrote:

> After these many years it took from the inception of this change until it
> landed upstream I'm not sure anymore what my original idea was behind
> leaving the link clamped

A familiar question I have been known to ask myself. - "Why did I do this again?"
The scary/funny thing is that there is almost always a reason.

I do think there might be some benefit to overall system stability to have some
kind of damping on link retraining rate because I have also seen device stuck
in an infinite cycle of many retrains per second, but each time we come through
the hot-insert code path kernel should let the link partners try to get to their
maximum speeds because it could in theory be a totally new EP. In the handful
I have seen there was some kind of defect with a particular device & replacement
resolved it.

- Matt
