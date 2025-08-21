Return-Path: <linuxppc-dev+bounces-11180-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BC9B308EC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Aug 2025 00:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c7HYL6DLSz2xQ2;
	Fri, 22 Aug 2025 08:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755795541;
	cv=none; b=mftiJzFSLOV4IDaViLdCOfAYR3eHnQ3wAaV0FGdYvjjVLgUCqnrXCvekk96cwpdeu1iEJtfnSrxhEsGaODKfnGqV81/i1+WHGnvBAPBdV49Xvcf2E+G80XvIUwMFHTY0zapm+9JrIq723Psw/3F7BPLgk9y5kMVsW7PRwlpfRpN8tTvSZnetdHT3iHJkVmbnsnlkRuM+XrvhL2z3pX+Fsi3ZqGUnXS6NQSocmex9JAlBtKMBSzSIUcmg0TM1nsxVK+lIVeQRf3EiT2QfHt3C/lqzUGEzijc61O6ZFPK9hYbnelDnxC2dEhBPCJPOS+gN5EjSAvz+IiZKryP7C5WdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755795541; c=relaxed/relaxed;
	bh=3A4U0mFlnkILhub4vGFum/rHOWkZrlTYW603OLEkJVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hcUEj+x2+4f8zIpelUKzvPNaY634wkOB/3XSOgfvo9s3H9voigQMONduUOaLV7LN3Fn5axEe2R4Wz4DwVy3GMY0ktkg6qkTPdmKQO63xtTTbEXOI6oY3259f8QA9OdTEqVjToY+U6hYs/UKq3TDy+gGsmimi51bT/vwdOLA49SUHx0TtKezGkj00UocN6YH1uspSZ68segMNFtqX9wsl6Y4H8e0OaE0xoGDqu2FtWf7WzqyEwefyF4LjJFLkDXu9hdyZDtTx0jtf5WI5gzVZ3Ja/eAxGaP/8yf/Ye1i81snDm+Hy5+dfDS3pQQIxV+N3SSLLw7MzopoQmJ/62jioDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=UBoZZyt5; dkim-atps=neutral; spf=permerror (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=UBoZZyt5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c78fp2gRsz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Aug 2025 02:58:57 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61c14b1689eso309696a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Aug 2025 09:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1755795534; x=1756400334; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A4U0mFlnkILhub4vGFum/rHOWkZrlTYW603OLEkJVY=;
        b=UBoZZyt5hCmb9nnhvD50nssH5t+EVveUVfJmnZsTTNkmixPwgrMKrCVza97TvUDgkX
         OYB0SsvZ6MbhcEI4s4+IBSur2Ds/8mSu9BXU8F+krqhHxyj9smEfqyDl104dIvW6SdkP
         if1OPsHyYbAlL4aZfkb5LqePQ+YnwGnwB9DpgrUaKJsx/yusQ2lHyn2vTs2Xit9TMON1
         e9NYDrVFXMdq+nj7fFzDSz578bC6gf9+FXVdii472oZwMEfwGH/SQM+2zTDki4R0qB/z
         sXB+YZOpmfM8S42+PO1q0TbRRtjqHnpKiPddMEQ1lE45NkGshP2kXJzQfG886sxfXyUv
         WP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755795534; x=1756400334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3A4U0mFlnkILhub4vGFum/rHOWkZrlTYW603OLEkJVY=;
        b=TtssYHtAxV8t/gu74NrooYhPZeEIHSjLkpcUypuEKGcyxbe3tCPB9XsXs5HfKm1VzI
         +Tb4b6I2nbzY8rNg+50rNANUQb49jaZLfTG4/rT6poC/4K3rym7JEoESizbZfFjwCVhy
         pEVBcj5B+5mPPjYmKl4Xo1kNC0ffoFqM5YAL7gT6I6pvtMTAuwSj3cHCKfwvCT3eXvsr
         go/Zzni+C1UAc10BJ3b0mAwOuCAU7jYYS75Xz0Z/U9x7KfoywS+3CymsI4MloaaakIxp
         13fURGUvY67kMCWqwufvH4w6yzYQehF7/Gtl/zkE65gK6m14QLRXc/0YrgNuIr6onX0t
         bVAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtDlfXwZFlcOAOTDudmF2mVHirnFsGBa/ugkg98fB7jt/o1qn6qHWIN9Ml8NKoCUyKfjkskFo3MOLFQTg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxojo8Is4ubB2310L7bnkUHZf92VJX9svAYWsR5pJvc8DZMk8eU
	ilI4qsGM4Kg0tPW6jxga9eWe3RTFqwTF50pPo5NvZ2xYQLtilNKD+k2QxowjOTxv97E=
X-Gm-Gg: ASbGncu0G5yMO0NfjK2zJTuCOiIARNTJbC7uXCDg2a/BjqGN8rwphzmWaLEh7hzx5Sj
	UtxLi6KM7wthp0elsTMUXbIBbJ8G1WiyzXEx/W8/doFcp65VNh3MuCX0ljywykVzvu42UmOZmvP
	nVkuTxlzjaAIjQs5G3pyaxGx5vRvvYxK7EvCfB/efh7NveIg3JKqynS7QPkLhCwi3qhRC4BtClC
	UC7m74Jm6DUHcwuR0S9HFxwS7O9rnJ0cCANiUtMioPtMfHy1JgD4cmA0jDn/EFGjiGojcs2S0q/
	2JhfdaoO3mkamyaf/bIvSOoKwEtpJuLXLlnob/nBHJayKYTLOjhKVGuOIUR3yppD4/TS7t47Sj8
	lup8VBE/sWcfMYlAern/+N0cdaNo/L5duqGIr0zeJi1i76tpv
X-Google-Smtp-Source: AGHT+IHbD3hrlfzfuV9dgz0//kT04PlITNsV9cNrzMXodwD/dQM9X/pgqOr/RoZqgWohk3JzCKOHjg==
X-Received: by 2002:a05:6402:5057:b0:618:6fef:83e9 with SMTP id 4fb4d7f45d1cf-61bf8743d4cmr3099366a12.34.1755795533295;
        Thu, 21 Aug 2025 09:58:53 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.128])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-61a758ba909sm5450122a12.54.2025.08.21.09.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 09:58:51 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: zhenzhong.duan@intel.com
Cc: Smita.KoralahalliChannabasappa@amd.com,
	adam.c.preble@intel.com,
	alison.schofield@intel.com,
	bhelgaas@google.com,
	bp@alien8.de,
	chao.p.peng@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	erwin.tsaur@intel.com,
	feiting.wanyan@intel.com,
	helgaas@kernel.org,
	ira.weiny@intel.com,
	james.morse@arm.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	qingshun.wang@linux.intel.com,
	rafael@kernel.org,
	rrichter@amd.com,
	sathyanarayanan.kuppuswamy@intel.com,
	tony.luck@intel.com,
	vishal.l.verma@intel.com,
	yudong.wang@intel.com,
	msaggi@purestorage.com,
	sconnor@purestorage.com,
	ashishk@purestorage.com,
	rhan@purestorage.com,
	jrangi@purestorage.com,
	agovindjee@purestorage.com,
	bamstadt@purestorage.com
Subject: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Date: Thu, 21 Aug 2025 10:58:29 -0600
Message-ID: <20250821165829.3471-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <SJ0PR11MB67441DAC71325558C8881EEF92A62@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <SJ0PR11MB67441DAC71325558C8881EEF92A62@SJ0PR11MB6744.namprd11.prod.outlook.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,T_SPF_PERMERROR autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [208.88.159.128 listed in zen.spamhaus.org]
	*  0.0 T_SPF_PERMERROR SPF: test of record failed (permerror)
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:52d listed in]
	[list.dnswl.org]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello. My team had independently started to make a change similar to this
before realizing that someone had already taken a stab at it. It is highly
desirable in my mind to have an improved handling of Advisory Errors in
the upstream kernel. Is there anything we can do to help move this effort
along? Perhaps testing? We have a decent variety of system configurations &
are able to inject various kinds of errors via special devices/commands etc.

Thanks,
-Matt

