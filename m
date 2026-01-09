Return-Path: <linuxppc-dev+bounces-15487-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CEFD0D2CB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jan 2026 08:42:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dp9bR08hkz2yFq;
	Sat, 10 Jan 2026 18:42:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767956845;
	cv=none; b=h+6GyrS4uv3YpidaVGCgXn6wY7AyQGyW6910xKgzZ4Sg+qaq2frDgG+cwi2IAzgt6/JDjb68KIU/5ltYI5PU8d9XFHlmYv6VobswIjUvceRmK5L57VbQmzpRRVihFtXv3jMDeRwzX2bVACD7bEx6XbVt5q8HMpWLTB5rJ6p2VXMKx3lyO25r4WEEsV9TK5qpWvdAmEee7hcfaGVC30XDBodwC8F0eURsQ41UxbBzSjbSgUy6Rrh+v4ZXyKomO1pOvNs6tWvbDdFaewcYJ6HGDHqJBu2m6oSGD9C5aAucgXvkoQOncOi1HwEp5iL4RN2h9aPPupK4uiAPkHuhgU6UQw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767956845; c=relaxed/relaxed;
	bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q+qmNnEtRw/AdJsvFswXtmswv8KkQrKdLuIWCo7/2AwFSBK09X5FX8yGrzEuz1q3Vh1Kzi+SY+0+HpsuPpr3tvewCUtumFlJMax7ibUXATfUEyAmqDE2TwX1ywXRtD5Icrr9QP/wYVetxva+hLTgnfOUxmbk1rjthdx3onET3xXuZlqhjW5BSmsrZKxnVdyMtOcz6f+e2MMR6iiFEIDAJBpUIW70urT3rkf02UHG/KYKjERZd02tXqwq/r3AQGQZjZl0l30gMtoILLGG/SOj6+cWHFzZTB9QXvHRC/X/UBUxdDmR6BF8UOFg+Q3McDacyZDolskR36R6iUu6azs92g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aB5NZOGv; dkim-atps=neutral; spf=pass (client-ip=209.85.215.174; helo=mail-pg1-f174.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aB5NZOGv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.215.174; helo=mail-pg1-f174.google.com; envelope-from=atharvatiwarilinuxdev@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dnfB36rXCz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 22:07:22 +1100 (AEDT)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c2dc870e194so2222793a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jan 2026 03:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956776; x=1768561576; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
        b=aB5NZOGvMQ7wUjWbwPssH/8DznX5S+fn6GKlsyqDFk+gMAKcbaoED8C6ilKgd4D2bE
         mtR9NvN1ARtz4r2oVaIsdIizrZjuHZefCHJHkhSONkkFN0QslZtKO1/4X/5RXalnwxHO
         lrMCIROJenepZxA0Nsbc/kM6kYBvoWKEcW7K7mMT/K64bTlVR9CFd9vlOuyqGC0200KB
         AfUmJ6JoeqnjXWAk+QdKcVJLD6P3iaP720YxipgLIvk3ySLHXYSRZzQEZ9kqE2I3iSBU
         FelBWGln+k+ZpS59kTF2wNvLHXKwSC3svDwvkqjDKb5Aj6VFV6ZBzVrZI1r7KJN8sqLA
         6AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956776; x=1768561576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TxFUMFoBKTYWtOsk/VSHEKe5wy+98xWUwhsYV4V1C8A=;
        b=SaL6xhZ8dp8GKBzskKQ72v7zqv7ZVeGWL+gc7wL//LbkEOa5o4WivlpxdT9wgmp/Qk
         vO72yjXcZkV92CP2Adc3Ha+DG3WhP+zYANOjgkPgvG0NVfcEsawMXt7twR9nKiWYrvU5
         UpLgdwro4p6fpnnKrKbqQGM9NhL42rzu5EaBjchKTELkxye/p2Co3h4vzUmxMu4xGlkU
         bhxGRKhv4TzNBR8VXMpUXqj0Zsmt/TBGtBAkGuZhhLUb6XFNSg+KQsWkB7WLcgk7oP+B
         jAmDawjijKwzKLsctQVE9FoenIAAhZHjIjrSycUFz8QvdLAGjY0FsbR5VOJx8yyDAnDP
         Qm/w==
X-Forwarded-Encrypted: i=1; AJvYcCW1XCWqQYuEk2+cP4nZc2fyIKYlB2aISL4sV4oQmNgwa9KOf/O7i+7LMbI8RmI5noHF1MAAuWI7M67stLI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9AexXd+mNdCHH6v6FT9+C4J2GeRZYWSy78LvGK4uP1Wy/aLvK
	GVCQv9y1ii9CXF/jYEIPaXahblq5YSUmnK3/KCYNS5eNid55cu2TjC47MLxt
X-Gm-Gg: AY/fxX57DT3FYF0hjQbKdRr3ln2JO/zqK+uU01Ld2gTSbb5p1SxbGoKjOd5z+eRr62j
	BO6y/XmWe3aaxS+I+dOX4i3458aeO/fnmo43s8sVWKsrBcDwssbsQz8uMZVXha3ILc9b7JGiCtE
	1KNiWGpt3YuySG4hvVGZGR9JzABLIXE79KQ0AyTEc+6pA3MVq0APFLMO9M6Z+S/gLuzi5YRjrzN
	rDKzqMOZPldvaDCDbNrxKH8+mlG7m07Ttxm4XI3/9a/1+t8fGQJtSuv6mru74qHNMUNIsYOtm11
	GRZCFMgMI/R9iPMQ/HtdI5k+flE0/8DY0N9MKlC9RqY9ZiALZxm8EXhcb7Vouiw/ooUTM0RcRWn
	0YNnOR9XAwy9I6zHo8GMbwUwV8sAHWKSmV1zb5DwfdbS5LMpp0GqHmkY4wXTzT15Cu9ZxbYOHGm
	hYqBemqpykiSxsWn0=
X-Google-Smtp-Source: AGHT+IEcCIF5q4w23kqNSH0TmkW6lcxveVlDrJucdG2n+7nDKHsoEHF08l7LWzBlXmTgd5h9lZyYAA==
X-Received: by 2002:a05:6a20:a103:b0:361:2c56:fca8 with SMTP id adf61e73a8af0-3898f9cd68emr8378899637.50.1767956775758;
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
Received: from at.. ([171.61.163.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc02ecfccsm10334516a12.13.2026.01.09.03.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:06:15 -0800 (PST)
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
Date: Fri,  9 Jan 2026 11:06:05 +0000
Message-ID: <20260109110607.2971-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109100840.GV2275908@black.igk.intel.com>
References: <20260109100840.GV2275908@black.igk.intel.com>
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
Content-Type: text/plain; charset=UTF-8
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
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [171.61.163.202 listed in zen.spamhaus.org]
	*  0.0 RCVD_IN_MSPIKE_H3 RBL: Good reputation (+3)
	*      [209.85.215.174 listed in wl.mailspike.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.215.174 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

I dont test it, but I do review the code and fix the issues.
For example:
Using DECLARE_PCI_FIXUP_FINAL instead of DECLARE_PCI_FIXUP_EARLY is wrong
because DECLARE_PCI_FIXUP_FINAL runs after PCIe is initialized.

If i cant install linux, I can’t test it—that’s why there are multiple
revisions, each fixing issues found by code review.

