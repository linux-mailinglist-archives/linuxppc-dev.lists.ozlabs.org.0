Return-Path: <linuxppc-dev+bounces-1718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7098C73C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2024 23:05:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJ9SH1h4Cz2yGX;
	Wed,  2 Oct 2024 07:05:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727816701;
	cv=none; b=NtJ9eEYBiSzqVPUhHMH0s6fKhqEYYmNyAOVTg7vjX26XUKQH4+xenfb+HlAd0Tl8EQgwDUgDl9O2vPteLGPZOy3jv+VwCHLTdQPbjtetTzb7cQlTh9nOEtB4urZ/Ap1VLxwUiGTsTFmX2BphwMZvSu5HiMH3f2SIAEAtV5ZQ1cQuEHaVouKpF7j5J8r72hS+Gy7i7SaIgS+D2o+uQMDW7Mg6jRWT4Tv5iXbkV4X2U7uT7w6Ej/ddrzH2HW080JIoWwNSQXbg8EYFeN0xD3HLMF8pWbCIXxuauJEIXeDIViNyw/7mzlXuIeVmCSJwIYQqDepH9BOi3EpfUAePXn4hNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727816701; c=relaxed/relaxed;
	bh=qPyDujOFTLNSxbcnmHDSi+KZgC/UzTfXThHY/68Uscw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSF2P8ITTBMbtq7go/FRiHtsgMik502uAGauuM1PeiRquFPa3oczLEytnnIXtVbLQ5n/ZJwEcq7XCpHcE4txbBNxBfXoA1nTKgIXRQdXenCbnLLwCkQurMJjiEzUG2d/Aba/UdfBFefxM3o7B351cAHuYalciFKAOslI2KYmzHY0Xj1ZOHXGnDCTKQeNCYHHBvNeMuuMitSJ483VSQRUaJFEhO3LYziSYsW+F0OZNzAg8nrDfsGMnw+VCMgbpyZABMtcH7cQc5KQb9ckp8ZQfV9UPiazc+FHZAfQ8SZkgUE+ioHciGWmUqR5MNKbt/ozVCtrWDTIvR/z26vgW9R7cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=AKh5CBMH; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=AKh5CBMH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJ9SD5SRPz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 07:04:58 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20b6458ee37so42062645ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Oct 2024 14:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1727816696; x=1728421496; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qPyDujOFTLNSxbcnmHDSi+KZgC/UzTfXThHY/68Uscw=;
        b=AKh5CBMH77d9YSjkItmqdZ5487hV9GPPyLk0xQzRs7s/1gjpcC+/FFfdTQbiPF72XI
         WGTsgGth71MFeoh67bKuloi5yhnCcDeU4M7mKKCnDYp5co29bY10QqWs9SwvTRGDiRtC
         ND3qOsWp0sNOVVRRloqtxWtnToPYnh6ocn8X9AJxtzQp9GhAeaf30NfFghG7ZJxU0cf4
         EOl1/CGgrNPKOEbcYN3L90erqq8kMQXtP1FZV4BJHpZfPGmuXu7VtrlTAJDRhxPZi0OW
         qcPk0laQI2/Rw+/DTF3pWe24BD5uuUMMpk9fSJ8/U3w2xeFzbrOYpzqy0PNB9EbTc1Is
         Nvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727816696; x=1728421496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qPyDujOFTLNSxbcnmHDSi+KZgC/UzTfXThHY/68Uscw=;
        b=X+knQiJnSS3jhX6TBpnvXGY7SWHqIEdl29VDCaMUevNSu95Btaz3FaoRxP3PFWeAjp
         l3PyNKn0vU0OR+RB6xcnJs5CFuI+mIK0BM+cXUUx4Ke1ExGQevrfP/UvJvtcX9+DVV8P
         m1NX+KeXY7jCKCA9gI6L2JsvwSlzQFH9WuvwbMupSO19aP0J+X813njLigCjvzpmhy84
         tslmx0tfTVMOPdeCqPlMSkDzCqJAgzGYH+FOdy/T5LRjGq4LSe1a/cgj+Ded9C20uCNW
         UV/8ol5FChyD1Ijwbz8HmeUBdM2daXvKvvcS79gem678IPJXs/zDtFMOTGnCH6YWOMVD
         0bMw==
X-Forwarded-Encrypted: i=1; AJvYcCVnFP4U5gat9BM2PphKFwqy9I9zDwaNq6wo9UjGjNv46DaEHZ3pUkROUvZAgGkTyOr+FwcLxh+RDnbOnSI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxr1cKZbSNawrC/5ByK++K33W+yVWU/6QIJNID/os6CdCa+jzVS
	HQlY5jaJhfLaNlVGpAaGHauF4OFFUqMVZopayZRt1eXsiImzAefM2bDdO5fvkec=
X-Google-Smtp-Source: AGHT+IHOCKqwJNquHm6zECkIBJWswhGFdb4YTpGgI9Bdwu0jMqj8A4NHRSk3KDE5XuPFEDX+sBe2ng==
X-Received: by 2002:a17:902:ec8f:b0:20b:6f02:b4e5 with SMTP id d9443c01a7336-20bc59ae323mr13811435ad.9.1727816695778;
        Tue, 01 Oct 2024 14:04:55 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20b37e37168sm73412995ad.186.2024.10.01.14.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 14:04:55 -0700 (PDT)
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
Date: Tue,  1 Oct 2024 15:04:46 -0600
Message-ID: <20241001210446.14547-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <alpine.DEB.2.21.2408160312180.59022@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2408160312180.59022@angie.orcam.me.uk>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	T_SPF_PERMERROR autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

I just wanted to follow up with our testing results for the mentioned
patches. It took me a while to get them running in our test pool, but
we just got it going yesterday and the initial results look really good.
We will continue running them in our testing from now on & if any issues
come up I'll try to report them, but otherwise I wanted to say thank you
for entertaining the discussion & reacting so quickly with new patches.

The patches we pulled into our testing:

[PATCH v3 1/4] PCI: Clear the LBMS bit after a link retrain
[PATCH v3 2/4] PCI: Revert to the original speed after PCIe failed link retraining

- Matt

