Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 508078FDA34
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 01:12:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cfZpMpHz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvjt53BDkz3cdD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 09:12:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cfZpMpHz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=jain.abhinav177@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvjsL6K7Fz3cQf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 09:12:06 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7025e7a42dcso262261b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2024 16:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717629124; x=1718233924; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjDX2hX7Uso3teou4bJNTRXKSoRMvYQRMdknmfn7m5M=;
        b=cfZpMpHzxt3pJuLqtc2LOVRCcESCHOm1o0W+YWkbV/3aKLCtmZycQCLopYzJqRZ1fL
         NKWGhi/fnkEwPNofzQKkTGZZJxJ9T7rYnuhdwh53a/5Fs9oLgTM2cAh4hXPEntNOECzK
         MLqSaLJX72TLG6vlGqztPIXJSyKRCPIAEKBbtf/y6cQkRwgx1DV08HpL0XXXNX0KsdEi
         hMKG8M16hj/GOgLM4xu7NbD6GufT2JOuR7jOsQJvFjzvTCBBfkE4dM/NYxfi+LV59OcF
         rNaa60K9j8rP7pat4C71iViUcoABR6IdiVZ2GxAUOPIVn30ttkHtfH1TxQZQIZc0ZrA/
         DtTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717629124; x=1718233924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjDX2hX7Uso3teou4bJNTRXKSoRMvYQRMdknmfn7m5M=;
        b=HTmiR17RMcXfxrM5DVt8eN+lO8BR2jLnPMBIzNtP2NvvC9bMTeDOzg0ehaszMmqrLo
         3nnF88ATzEtIbmH5S+zpgOQ92NiiIQ1kTqZixDT4haruM/DNHa8S36CPCxMJwrSXo+2v
         3er3oZISCr/bBAJUv2h1djoHj/Vj/0N6079moMTXZE3Lhci2HJ6FKJklEXxyt7h1Pk/q
         7zV6YFsvXyiRUCasrj0/kB/3rCu/lmStXxfUWN9eDrZK05I5lsApmhLYN4Pz00iZ0Dwt
         DV1VFZrpoRlvH8tqrAS3LVNB8ndC7fCnBHUhmRVI9awNYQOu+SpfLvlm6M1SNrDdGgCs
         VhKA==
X-Forwarded-Encrypted: i=1; AJvYcCWHOOVNOIGxSqRzv5Yjt85ZxVDqNvzqpPXv4sE9v8hUBfkesRtWvo2Jz6PknmMpS7pM0LpMQImkzmdwSrDEyH8X8JCACR3RD8dRfUXdUg==
X-Gm-Message-State: AOJu0YwKOFDTmLXtWMu6Lv5VFBdAcfEqHGmmbDXXn2XrRPBwbmaZPIaL
	SRHPeAznPhahuTTNw/M0SasZVa9Ou+Cb25meCpsxcR1SK0TTjcN/7o0cKoZV
X-Google-Smtp-Source: AGHT+IEvSJWjZvCAuOdJ7JHjs5or9ojfn+5TZtxB1V0IgRL3ajQOdVAeDO4abrTWzlbHzx6Ymhj/IQ==
X-Received: by 2002:a05:6a00:1caa:b0:6e6:946b:a983 with SMTP id d2e1a72fcca58-703e594a710mr4048104b3a.10.1717629124206;
        Wed, 05 Jun 2024 16:12:04 -0700 (PDT)
Received: from dev0.. ([49.43.162.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703fd50fd7fsm31068b3a.197.2024.06.05.16.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 16:12:03 -0700 (PDT)
From: Abhinav Jain <jain.abhinav177@gmail.com>
To: helgaas@kernel.org
Subject: Re: [PATCH v2] PCI/AER: Print error message as per the TODO
Date: Wed,  5 Jun 2024 23:11:56 +0000
Message-Id: <20240605231156.22934-1-jain.abhinav177@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605215848.GA782210@bhelgaas>
References: <20240605215848.GA782210@bhelgaas>
MIME-Version: 1.0
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
Cc: jain.abhinav177@gmail.com, javier.carrasco.cruz@gmail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, skhan@linuxfoundation.org, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 5 Jun 2024 16:58:48 -0500, Bjorn Helgaas wrote:
> - It doesn't apply to -rc1 (the TODO message is missing).  In PCI,
>   we normally apply patches on topic branches based on -rc1.

Thank you for the detailed feedback. I was looking at mainline only.

> - The subject should be more specific so it makes sense all by
>   itself, e.g., "Log note if we find too many devices with errors"

> - Add period at end of sentence in commit log.
> - Move historical notes (v1 URL, changes since v1) below the "---"
>  line so they don't get included in the commit log.

I have included these changes to the v3. Please find it here: 
https://lore.kernel.org/all/20240605230954.22911-1-jain.abhinav177@gmail.com/

> - __func__ is not relevant here -- that's generally a debugging
>   thing.  We can find the function by searching for the message
>   text.  In cases like this, I'd rather have something that helps
>   identify a *device* that's related to the message, e.g., the
>   pci_dev in this case.  So I'd suggest pci_err(dev, "...") here.

> - I'd keep pci_err() instead of switching to pr_notice().  If we get
>   this message, we should re-think the way we collect this
>   information, so I want to hear about it.

I understand, this helped me get a clear picture of what needs to be 
done. I have accordingly added two pci_err for the same. Please review.
