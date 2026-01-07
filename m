Return-Path: <linuxppc-dev+bounces-15383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FD2CFD9A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 13:19:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmRtZ5RShz2yFh;
	Wed, 07 Jan 2026 23:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767786285;
	cv=none; b=VhpWXBiON/84DRFwcwX/PJ4xBC+bPN4VtiRopkXWzry1luEBLUSfEDhnLglzsqghueir8tQV2DZv98B2o6m0CUoNY2EmuFvEHTjd2AgPHK+Y71dbpuBC19G4JbSf7aNJNlSAnrjMBi83HJrG/cy5fLtfRyPYs4CJ4cu8kT3/6EM3mxJDX+KGjK+sWxfgTT6n8i2P/bifp+7VlHVD3aQWDPyH9mUNq3sZABqt3aMj9uyASBKsQ+QzusoRpy7rVNGsmb7i1bHjpT7tzsFj+2fERAEFDpoALRNFf2TXtdD8KCZudzMV+KXzXxbqLU6D9u3lE2tRYN55dh27zdBebHFdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767786285; c=relaxed/relaxed;
	bh=hQY7gqRUD0m7DCREiZCNdJ7Q8sM0i3MxeoJ9KLvZ9Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8A/aVSx5iBfPw3bTSaSkB/CG5enLQdugymLGpGJI7zpms9dKQuBfnPDM9yFo2gUP6+sq8WyTSYy5w0kf4mlSk8FZRckp28nRwok7rym6ywQ6BULKXQY0Ar8g5bLxBQqv54UZDko2nayr7rnuQMXiAijEjALeBGTXMg5xlScO5NCadwG+tn5t72o+wcuOBSS99yujjFxJvM90XV5zFguhzRKaRXkNCoaMj8HhhfoRUJxKo5IjYHglynhcIBZz/U9RJVmLxbh3PaBZwPX7aRwpWukO+XOmp4AXzKDiBoJE509DxPxkgTo0a2odepFWA4JjPt8096DMoDkLF5vDTZXLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BIMX808s; dkim-atps=neutral; spf=pass (client-ip=209.85.210.173; helo=mail-pf1-f173.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BIMX808s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.173; helo=mail-pf1-f173.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmR636G6Vz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 22:44:42 +1100 (AEDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8035e31d834so1683743b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 03:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767786221; x=1768391021; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQY7gqRUD0m7DCREiZCNdJ7Q8sM0i3MxeoJ9KLvZ9Fc=;
        b=BIMX808sUiSxdx4G2pQ/5hZInAQISP1sO8S83tGnQrHQS/oIqVswsuqbaKfRrxToih
         C0RbCJEpcbzgvaeO6GD/HNb043dYdysJM8/WSobxbkm5wbtdU2W66nywyeLhKOvrGJG9
         UlAmE/J56HBQgyCqzLXl09cSYNTFOs7zxzwMXZ062H8zSlt1XbRye892bFN7we/we00X
         eXYDGkEUPRmfio6KkDQKp1V0Zw0/lWC31aNC3sDtWTm1pcVPfaP1ce+8nBwpnELtf2Fp
         3vgoSybcRC+7TnAvbIsFmYRMpqKLF13nRROw3bQJjKtnh8VUv7tYHuPt8JMd7SZlHb/n
         wyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767786221; x=1768391021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQY7gqRUD0m7DCREiZCNdJ7Q8sM0i3MxeoJ9KLvZ9Fc=;
        b=JTTgYzu/++88dU2t8iwitiOYDg92OpyPCAZMbaXYyGkHh/5c7Q9R78MANtEdWlHdIX
         jMIvcU5+3G19Nr1bDlZm4NUsCnsaZ4UcPCEZUqMaPR8UtsK9x5OVM1Evklv+nRvR5yJO
         yJC3cxOyf434jZGJrO9Q/jtl+VNclKa0ZAhRak2Fy6nZq9ixuk0gElfLwDHrpae3grmL
         X6FnD3o4IxVjb/og+W/dnP5Hj+IamL34LNntg2HBb+URvrzoAEnBu2+42awdlkyNMkvi
         W2uc8vVgCfwmDeqtsFSjUTyVm+V9a7xkKfDM4ISc6idSguR7Fh0RU+a9EjIlGAyE1Nav
         /IRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9tv1HZ5aKUUIQtxf5TE5bFyjVKqGYV1xV5nvk4XcurTiRWPHkFBSdFiindyDdkNQpSJ7tcpOwnU7ATHs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQD1SwmsnsNFrfnV+syRh8YWEmNg91TqBRIobp9rXmF/+Xl91+
	C9/w7c1F2Wzb1Dd7ahNJxJxn0n3mdtRTc4PNRZy+ttUsd1evtNXEtAs=
X-Gm-Gg: AY/fxX72u+yxpsVAMK9iiyJnJOR+1p/3hHzvutQLkP/oqEiwZXynjXiKeNd14tk6Deu
	ND6qOLl7ncRl+Uo8HBKyiyvuDuZG4Z2Yu4Banln6scxpbk/S4MwFmWv64BqEcpMU1C6039A1aPf
	XoBlErm32Mrl3CEWLbg2GqflVpRkxNfbSn5Qe3F7TxHJDYTJdPC9yPK8P1n4mSHHlPQQlZ8XUPj
	c0PEZX86Wl8ZNT+lsZbTh8/6K84S3J2rZfpLj4WzDrqcUkjtJF3Fpg+5ttnaTWFtyl/UKhsSJRr
	kShJb7lsscQUHP6+ZBAETu/6WMqLezU7EbLn5GAeB8331wEw1+V+7Rj9ZLRrxr0uaEtiT11IKKt
	BbISULna8S9nffon7LqH8gMJ7bsDfUv3vgpVR0/0Ql/2nVSOqzx7mFJLi1UvUJoKLFknwWVfoOr
	6TugpIJnqK4KBBSaU=
X-Google-Smtp-Source: AGHT+IEL/irKUmHduAIb+7IQsrOJGizixcnab96aJqSCF1h8BB26P/sAiJWfDmIGBjPcpWtmLyIhZw==
X-Received: by 2002:a05:6a00:801b:b0:7f7:3225:e2da with SMTP id d2e1a72fcca58-81b7d853038mr2000426b3a.18.1767786220582;
        Wed, 07 Jan 2026 03:43:40 -0800 (PST)
Received: from at.. ([171.61.166.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81c4905ca83sm335530b3a.38.2026.01.07.03.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 03:43:40 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	feng.tang@linux.alibaba.com,
	giovanni.cabiddu@intel.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Subject: Re: [PATCH v2] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Wed,  7 Jan 2026 11:43:33 +0000
Message-ID: <20260107114333.1536-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aV4tyKPGioCqXTRr@wunner.de>
References: <aV4tyKPGioCqXTRr@wunner.de>
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
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      [atharvatiwarilinuxdev(at)gmail.com]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.210.173 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.173 listed in list.dnswl.org]
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.166.195 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

> Could you provide a link to the xnu source code
> so that we can double-check what they're doing and why?

The XNU is open-source but its drivers are closed source
(which includes the thunderbolt drivers), so unfourtunatly
i cant provide the source code of the thunderbolt drivers in macOS.

