Return-Path: <linuxppc-dev+bounces-11401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28853B390B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 03:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cC3Dt65lmz3bb6;
	Thu, 28 Aug 2025 11:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756342841;
	cv=none; b=aIf1vXuOAgDmUsJbSNO/T3idN0dIH+2Oq7qOkzNCgDwLfLEWyBkk102ANcoZH11CA0IE8l6iQLyANKa86eam1Sa7KYxLqsBBvN4+hma1jo+PTGOodbWqRlyNuzdpmccGgY/nIFL0yL3HRbZV4nxzREARSVF/5fkagiv0zkoHuQVdMijIPOQv3a8wn9h6oVHq655lyIwAOCg/NUG/3AWGkP4hPWYPYFbBbmjktEhDnNjZepMvVvN/AGUqYCSPt5JITHBkXL7IkHTH1cVH/8YkMMXbuhNV/Z1HzhyY4PhIWpqJ7vZJ1v+f6u0tpEpzpiLg1Cnw4zN85FLCWIDXcckckw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756342841; c=relaxed/relaxed;
	bh=qkZV2r2s3Ve2mSW+cNV6K6LiCKiSQdIZC2Q3aoo2TPc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CIY8eysMg8EJ9CUzsQhSy6S2A/IddruXJutkDPZw0c6ukBsYVR0IsQhFnTBrlpLvd9tXh1eXknH9VgY8atfqG1+k4c8LTijIWonVRxXBlJh09xoWt5DqHgSBMgMxowyZefoVlrISrrm7UvSwI0TPhUs/w8X3OHoYGN3JRIj71n7v7vzibvENunqNUhNM+hzG13MpYF9N+vJG9adoeXMRTD4t0b58YQ8P5cufbkXWeQx/q2/4JR1XN39MK0q1KVDgdWU6GKKHWCIj+pdNh/xBi0sHlV6vHADe/VqwvLf4JbhbFtZBls8QDlC+cvQ8wJV9ILyi0TVe+0/9IhonZr4hdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LNGU/7qg; dkim-atps=neutral; spf=permerror (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org) smtp.mailfrom=purestorage.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LNGU/7qg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=purestorage.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=mattc@purestorage.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cC33p1vMZz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 11:00:37 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61cd6089262so312797a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 18:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1756342833; x=1756947633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkZV2r2s3Ve2mSW+cNV6K6LiCKiSQdIZC2Q3aoo2TPc=;
        b=LNGU/7qgoXdM6txRiNVzwRifEsNiY7Octjy7vxrhCl0b8FiEgYGcmB/r27KjYHcJD/
         ec2SxLtGDhtRZDYY9RH3KvbY6ThI688jhLyQVm1teTz8Y0HreWc6BeR+cbust+p42Qp1
         WscdC05LUFj7Ov0ryH7B/uJiAGTRss6szEi1DplfIRttsyvcEujglChHBXAl/gLUh8dy
         iCkzVUi5h5ZcdIAr5o7GhhWqTTwsGU+1dKlvSwW4ECDnEuBlT1Sf9DxOmsIdF6/mZIxg
         hKF1GkgVcUuA/F4kdznA25uDN0FbUMAlhecFMM9upZS96jP6m1sdk/GJg6U7ACtAwJgH
         K+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756342833; x=1756947633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkZV2r2s3Ve2mSW+cNV6K6LiCKiSQdIZC2Q3aoo2TPc=;
        b=qW2+Ul706r/U9LRcF0IHJUd6lGTO15sntsK0n0GyO69s4UrA8NrRCgdK7DJeALv7LN
         G9/RUn2jcH+Nm/Kn9Q6NuF1txncNoOSO8X85kjD2dzPrrCsQVkGKi5unfNctyD+sohG1
         xmNeXn0B/IrTXqT2k4lMgNQ+jBvo46cwybIOkgcufLhgx/2vjdEJV+qWtNYM+4qmtZ13
         mLER46LXFEdeMc02hmYFobe30Ja7zu7LuNhGfxzNTXXvYYO8tNXfdfgOVyBUrHO5lxWJ
         F9WE67rafJhfVv48XW2xGz4gvDhnKB3u6Boi3nUwVe8TQ5hSLUiHVU/GLIpRIghX1NHd
         TMoA==
X-Forwarded-Encrypted: i=1; AJvYcCV610wOX831H6x+qSUtMuukBJ5aaAgieKjMaV3i10STGoegwTKhw+QT3V2cUy9Lpep9bqt7eX+oTalRzKA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRXjQkKwgMSHz78RxOAYlRWMFWmNqjNtTPuYWt327buNn4FWdp
	2H8P5Bry6PWUYgSxyv0ntRTljaDYk5k31ZDkdk+95C7WLs4gfYAoljDmoCPRj0L0jyc=
X-Gm-Gg: ASbGncsCzUskqubcd3fxt1q9TIdQGaDPf8Qb6Yp6VvwB74bMx/8hydtxWsi8eP253dS
	RmtojOMZ1eYH94F7OXt1+6q9QQWZQhiaTGqgkK0Vg/yRtUjgDIfwGCJCLgg4VixB1pY5wXaY6Dw
	jBJYS3UIIIOc2zJtXtBQevFleGkP2L18UF3RK6PbhAHVqP/NtTCUqxTd+qVc8DJQlT1TY8oALmE
	dzzcYjzj8rMnl4FY3RvQWRAKgblBOR0+iHKnuiamOgT2Xs0cVpr8oXqkiNKUlgTxaC49y+dbb2E
	aTFg3YzD3PDJoeg39CCfR3KgM0bUoSs0w4StiUnLZWaZDO7oa1V1y9C+TkDzKNE+x3VrZM6dvZ6
	jb2io3EpESYNqPUSeeEbklU+vgDGCpioNWWQ1+qsQyc0KDv0nl/wSiwhKBawjAgg=
X-Google-Smtp-Source: AGHT+IFowfbzDXzfKj1tbin1CbADg6SQUppIoHgdL2LBKWx0TCuFZuLUREbfAZ6iz35NlZp/Mlr9+A==
X-Received: by 2002:a05:6402:a0c1:b0:61c:30cf:885c with SMTP id 4fb4d7f45d1cf-61c30cf8ca9mr15283114a12.32.1756342833263;
        Wed, 27 Aug 2025 18:00:33 -0700 (PDT)
Received: from dev-mattc2.dev.purestorage.com ([208.88.159.129])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-61caeb5e786sm2651785a12.32.2025.08.27.18.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 18:00:32 -0700 (PDT)
From: Matthew W Carlis <mattc@purestorage.com>
To: helgaas@kernel.org
Cc: Smita.KoralahalliChannabasappa@amd.com,
	adam.c.preble@intel.com,
	agovindjee@purestorage.com,
	alison.schofield@intel.com,
	ashishk@purestorage.com,
	bamstadt@purestorage.com,
	bhelgaas@google.com,
	bp@alien8.de,
	chao.p.peng@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	erwin.tsaur@intel.com,
	feiting.wanyan@intel.com,
	ira.weiny@intel.com,
	james.morse@arm.com,
	jrangi@purestorage.com,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mattc@purestorage.com,
	msaggi@purestorage.com,
	oohall@gmail.com,
	qingshun.wang@linux.intel.com,
	rafael@kernel.org,
	rhan@purestorage.com,
	rrichter@amd.com,
	sathyanarayanan.kuppuswamy@intel.com,
	sconnor@purestorage.com,
	tony.luck@intel.com,
	vishal.l.verma@intel.com,
	yudong.wang@intel.com,
	zhenzhong.duan@intel.com
Subject: [PATCH v5 0/2] PCI/AER: Handle Advisory Non-Fatal error
Date: Wed, 27 Aug 2025 19:00:16 -0600
Message-ID: <20250828010016.5824-1-mattc@purestorage.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250822165112.GA688464@bhelgaas>
References: <20250822165112.GA688464@bhelgaas>
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
	*      [208.88.159.129 listed in zen.spamhaus.org]
	*  0.0 T_SPF_PERMERROR SPF: test of record failed (permerror)
	*  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [2a00:1450:4864:20:0:0:0:52f listed in]
	[list.dnswl.org]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 22 Aug 2025 11:51:12 -0500, Bjorn Helgaas wrote 
> Matthew, if you are able to test and/or provide a Reviewed-by, that would
> be the best thing you can do to move this forward ...

I spent some time looking at the patch thinking about it a little
more carefully. The only thing I don't really like in this revision
of the patch is the logging for "may cause Advisory". Example below
from "[PATCH v5 2/2] PCI/AER: Print UNCOR_STATUS bits that might be ANFE".

AER: Correctable error message received from 0000:b7:02.0
PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
  device [8086:0db0] error status/mask=00002000/00000000
   [13] NonFatalErr
  Uncorrectable errors that may cause Advisory Non-Fatal:
   [12] TLP

I don't think we really need to log the UE caused by ANF any differently
than any other UE & in fact I would prefer not to. In my mind we should log all
the UE status bits via the same format as before. Taking from example above,
in my mind it would be nice if the logging looked like this.

AER: Correctable error message received from 0000:b7:02.0
PCIe Bus Error: severity=Correctable, type=Transaction Layer, (Receiver ID)
  device [8086:0db0] error status/mask=00002000/00000000
   [13] NonFatalErr
PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer
   [12] TLP

If there was only one error (that triggered ANF handling) then we would
know that the Non-Fatal UE was what triggered the NonFatalErr. If some other
Non-Fatal errors are happening at the same time then it doesn't really matter
which was sent via ERR_COR vs ERR_NONFATAL since we would also know from Root
Error Status that we had received at least one of each message type. The
objective in my mind being to free up header-logs & log status details without
making error the recovery worse.

Does this sound reasonable or unreasonable? I can update the patch-set &
re-submit if 'reasonable'.

Cheers!
-Matt

