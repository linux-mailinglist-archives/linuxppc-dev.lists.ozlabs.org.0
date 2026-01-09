Return-Path: <linuxppc-dev+bounces-15486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38453D0D2C8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:38:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9VN1LlVz2yKn;
	Sat, 10 Jan 2026 18:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767946532;
	cv=none; b=AWEf66WYEd3dqj72mtZicPp4VhYxWScGRCfAJoAxMBXptgpIwAComFfdqagYKJifYGIW0XWagpv82dY4gYLQF9BAdL1BEC7S0gAxijk7dJrZH5BhheblI/d5W1AJ5LmI2LU/zHobNfrZu8Nh+gjjbB4C4BUcteubF4MjmshmwQKhmaMtjdYXPrRAfjYaNv02Dz3dX3aSJZ/Ja/QKDwu4GXleaTdmx+r2bRVxq0HtJvD6ijwzl4uIj9ax+hak8ciKxisYE4Uxuk0QAArJGAfxjJnEp96fwlCrCu+hcjgy9xrtGSXGkyitsS2BAJJC+VK6+Kc5iDXP5LHmpI/XIqjl1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767946532; c=relaxed/relaxed;
	bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InAt0NtpgUluDn5ztBdmJxfgbt1TZ1DbJ55TDzQt4bIT7f0KpnYSjfA4d/qvcl0dXyWVa6ztKyrbndO/nfPpEKseN18uobkKdltCtlgezfclFMVmU5/jWWhafZAbe/PXjKF0WiuBD5nrlWs67+SWRNtehLzZcMW7jqvui06Vrw72SjdnN4oJDsqvLA879tCJbufx4S3KPY+5VaThFJ7Ranoh74s4m1Rg8ymvv/seXIPmkylDWkfdnULl6QTZ5qxZkMsCTxBm1R2EMkqL0wz8VRV/cRGon+RnqCF4T6aR8kLHgrtIzTz6IsRRPYCpq0ynZ33bz1yH1XHinUY7ix/n5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CnlcA9vb; dkim-atps=neutral; spf=pass (client-ip=209.85.210.171; helo=mail-pf1-f171.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CnlcA9vb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.171; helo=mail-pf1-f171.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnZMl2MMpz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 19:15:30 +1100 (AEDT)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso4069768b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 00:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767946469; x=1768551269; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
        b=CnlcA9vbo4PPxMcwPp1V8/3PYu8+aWEEULMrS2YZubNSRMiSc5Fmbwupm7s8YkptqI
         NhDcVCWfTA1O+fvu4Hx1Nul4uRz/ZA6VS6mV9c1w1DjGt+61Y8pmJ0pSJnesYD6kVXCH
         r9k4mNa1zU/BMtyKzcgwuRilYoc6+QxJKbV0kI+y01b30sMjxa9Ltrfb8u039pUwCSYJ
         eBDPOvtipTtR/hq07rl6/TOdDzYvOM3DpF242aWIG6TfC7Cvu4r7mTbZn4jOkPeEB5xg
         vOV58r7HYNboE2PsJ9daM/qIn3QXvPgi0NP6+6p4l/Ypm/v0TjQRFmpwhmo7WqWqfKHj
         gegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767946469; x=1768551269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpySyFm/k0yHRyxc4TzhQRxSTNDzUkPIS2roYizOlEA=;
        b=eHxD70jM5GvqP/YjnPEv65nMmEFrzLxussQ0+kI6r1Cj/rUPrdk+ngndMiFpNss9H+
         Ld/lCiiBQouC1fIqz+DEDgr9dxkzGeBGYhU1U3brxQ3FQBIorRuthHd5Cd5PuUmpZgOZ
         f51PKbX39+NFE8S3lJrAflNIUtiIEMbwsMwMN4EMb9Yrdh3K4aPGVpw8idTCTTySjtiJ
         LT/ZE5lBsZyeCupYuetsqtzdhw9nBZbtPlobux6JEcdoC1oC/AqLaCaCFig3OdVZmTkW
         qzVklTR44G4/223WN3z+PCFrRl0S/CBmaaXvuCq1UgbQ6mZaVWYmKPG4WbJ2CPK45XLt
         cDLw==
X-Forwarded-Encrypted: i=1; AJvYcCUlM1XBLVCL4SRe4F8RqFgfsXmaXpYot6RDLlRoqSYR1+gxTS+8MdUIytQqXJbT1S2GeNiH6C5lW5AJAYY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzm6sy1vU01oZL9LQUmqw3PMnZaTRXDmLyE/EKhzbiNh02+YDhm
	biWiBjCWwQvI/8yI+behaXxLseJKsPla47kpwXrjf5lrVH89pfdgvG8=
X-Gm-Gg: AY/fxX4bXG+ciZwfruH1a5mocsQmCR5QhiCG7lYR8Vcw7qzFQ2lMgYZHC8t9t8xX4zT
	GgYoZoILuGjazsIPC2HjWE2q3Ge8mrRw0UDGGBoLD0Te3Xd4u29rPUhGIfW7A/FnhtQjSxux+90
	TqZX/HD26BYyh0Qd2Gl9gD3lh9IhaTauFbbxsEIzNX5L/jNq5xyasO70p9MpNl2s4WbOi/nEi6J
	s881JDkKa/tt4erVyQxBUseXQsemhnRP3s7lVA5t9UaMw7EdlR5LW7pAHVnN5Dgq2vDPCnKJoYO
	jVP5QcdCoNMQgz2qtu3XJluRq+/lQKPMYFHJ/UVsOBsOy4PGjyLMJAPwkjT9DA0a3Lvey+yqH4O
	vivk8VeEu2IcoITknqvpHpUi/T8u0hMIsF9xfy66b5TEz1n8/gJ9xiPYz/sNzuMz+nxJ9FkhK7K
	a5L7RElHDR0zntN+E=
X-Google-Smtp-Source: AGHT+IHp8AMqv9c4azrHD6Y6JJV04ILq12NFVTRqxBqD6sCbbov2HXVi14txeZNz5RHLy3TSD5xafA==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:450c:61a7 with SMTP id d2e1a72fcca58-81b7ffd1519mr7639426b3a.62.1767946468726;
        Fri, 09 Jan 2026 00:14:28 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8ff7sm9695717b3a.37.2026.01.09.00.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:14:28 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	feng.tang@linux.alibaba.com,
	hpa@zytor.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lukas@wunner.de,
	mahesh@linux.ibm.com,
	mingo@redhat.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	tglx@linutronix.de,
	westeri@kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Date: Fri,  9 Jan 2026 08:14:19 +0000
Message-ID: <20260109081419.2746-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109065746.GT2275908@black.igk.intel.com>
References: <20260109065746.GT2275908@black.igk.intel.com>
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
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.163.202 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.210.171 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
	*      [209.85.210.171 listed in wl.mailspike.net]
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

unfourtunatly the GRUB problem isint fixed, and the solution i see, is to
wipe the drive which i cant do currently, because of my data

