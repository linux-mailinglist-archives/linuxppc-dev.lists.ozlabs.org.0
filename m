Return-Path: <linuxppc-dev+bounces-8874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7637AAC0AC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 13:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b363Y18Hbz3c2v;
	Thu, 22 May 2025 21:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747914457;
	cv=none; b=iavxLp14YKidh7BvTECG2C2znf5w2Dh4uTPIN/t1lO3CNu+GCS0KurWSskOy0VvfoRttTMTCVa6kAml2KdtQmryDxZ6L/PsNxICST8Uj7gHKh173iCTVb/7psmWuhhPX4xCZkOOo1Uq7BSQ/mkw65afcZg0rmt4su+8PYDNMBtXNTVNOdK3gpd51KdYH0jRjhvjU59lgLRRrxHiVJEFVZEkZNF1nmUhnsUq4Kom7Rqo5J+ookGD8jkdX2SufvdsRmbsCnFk0Td7Zm2UbYmxblbut0AWEs7ON7gnFjPtmPWjRAgDFvDrt/kla6Ms30u+WWYsKKqGZRW+jL+c4hvlauA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747914457; c=relaxed/relaxed;
	bh=tJ1gudwiHyu+TUV61FEDK/7QlJCEvUcmgmmYX9winDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KBiJEU2zYWzOLGNI/9wlkqx+/P122IVjeKMIUtdQravkXTsOH5lySLzXWNTvbiEFT9xpS1+wYAiSz8RlOmUukeEoiPmrLPhkmA4xlSUAvrNxGATrXK+Dk5MnWOg2DVYYVCWX9cLM2dr0N7lfhfQpcubrfDLh9+ooeoih/CpujxM50howdY1rSxaozJKlzIz7xEG+v179KPOdoJx0VLX35kdaM98ISSTh8rFs1i5/AAoYql2/mSEwxPr9DoTSurK3SRe6KOia494CwPg0okCwpSZ05UhV4j0QSPS6rFlD4fvnxplN+6OpDoPCUv7Bzp56tDRPunNlFeOCKgWxMJcPGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=suHN3Mee; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=suHN3Mee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b363W70TWz2yYq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 21:47:34 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-742c27df0daso4367173b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 04:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747914452; x=1748519252; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJ1gudwiHyu+TUV61FEDK/7QlJCEvUcmgmmYX9winDM=;
        b=suHN3MeeWQ8iUx3/B8tVouEju9UQUP+FsQLAkY+6ero3u1WU7GTpc+W3nx1oKOV/5p
         HpNUJdyD/hkR/oYtQy5KCiqTpVgBaiXGyaRP0GFQKdZ+g+wUMBKRFytl/ySq/9esq2PC
         cgDtaM5srPW7Scy+N0hYpS9f55Fqts5F0DBxcrE6YgxQQyAMvTUBN77aqMmaw5KN15sU
         N7bfasRarh65qNgOc2/yvQG/8r7REl0hSm2OLQki7n/GqIWZ97dm+0c4Nem9eC07JvmI
         nDr0taqywew4T0qdTqp1X7x2FzqTfn5qIbo78Ld2yPR0a9yYP2kVYJm9KNQtmlwAExUf
         Y6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747914452; x=1748519252;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tJ1gudwiHyu+TUV61FEDK/7QlJCEvUcmgmmYX9winDM=;
        b=HEStkLJyx6axs4luyDxWPjVGtFiyxBWjDmRR0xfjqu3D+fRIW3+pXA8upVyHJdXQaH
         9GtOSGYy/hggQzuU0XGwungC4Yfk8hHltP4HW1Sm62JTt+r94f98ZHi/zwkFAVHt2qw/
         fRy9OKyrroPg1IjyFfHnDuUia2IQXpH3nTp2SXsBNBjzWnY+I2HB0jAtW8RkvMfBueJS
         nGdRvOTjTLwHB+d/zwDYamVcuLDw9kn5B3EqlG0m+/Z78KdMtdQMRVCSBpRNz3LlvUTr
         Kd7Uh32XL73A9Gm10GIhuCULn7eoJTe1bXBSGB0aCy+E6Q4mMc8MeDKCaEE/gGjq+CQG
         k8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDKcnOFBTrY6psxfs/TxNwqWy1hnh1kTUvwqJ2iZW1ctvJ1frldftQuVxkVCzWa9tpGoOTHOG6hhEmkUk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7tFct4rx0fP43jcIoiEIQPZgdFVXBb4eg0p3KAgCRGxpeAx+h
	9Fqiz69sCB0201XZIU2cTDSRZtbVIpcCOKRj3v1/t2x46ZurDpfkw+ZilpWSV2zoDg==
X-Gm-Gg: ASbGnct0HInYEjFWRrHPttpRMWrmQU1PI+tyQ/f/sbtUJ/zUJk0YyNeOl7GDbr4w7j/
	fuR6DI/K4gYGV0bM3GD7uLamyDslleXLypGSolX/mCLc4731JDwEqFnNBV3q/0EqJksYxul0fAF
	LuzvB9pLHUXcxAUqp9kBaN+sLEL3LNOAgydoIoSQRtEkftqRaUlTdtGPmmjVCkbJQMxL2hXx2zM
	nyyN+/UxnI5b0FXsp7dojSm9RLLXZeWW2/nAwaRqPGLWymXs6iA1l05jM9/4RKgDVy/m/EF1/gz
	R4M+3TuC+jWCwg8RHhGHht0cm0QQe2AaJcr7/Tdmdm9xhNd8PNM9S3JYm3qrKA==
X-Google-Smtp-Source: AGHT+IHC0b/jva12Q7TKdRYGBUhf44wv/UkRVQDXr+TC6tXwIOo1ebhkI3CtBJXlt3OvApFzHql4fA==
X-Received: by 2002:a05:6a21:900c:b0:1f5:790c:947 with SMTP id adf61e73a8af0-216218f7a98mr33151680637.19.1747914451678;
        Thu, 22 May 2025 04:47:31 -0700 (PDT)
Received: from thinkpad ([120.60.130.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm11140491a12.18.2025.05.22.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 04:47:31 -0700 (PDT)
Date: Thu, 22 May 2025 17:17:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com, 
	mahesh@linux.ibm.com, oohall@gmail.com, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 0/4] pci: implement "pci=aer_panic"
Message-ID: <e2iu7w3sn7m4zwo6ork2mbfjcfixo5jn5ydshkefezsgtquvh6@kjdvxgiapbjj>
References: <20250516165518.125495-1-18255117159@163.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516165518.125495-1-18255117159@163.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 17, 2025 at 12:55:14AM +0800, Hans Zhang wrote:
> The following series introduces a new kernel command-line option aer_panic
> to enhance error handling for PCIe Advanced Error Reporting (AER) in
> mission-critical environments. This feature ensures deterministic recover
> from fatal PCIe errors by triggering a controlled kernel panic when device
> recovery fails, avoiding indefinite system hangs.
> 
> Problem Statement
> In systems where unresolved PCIe errors (e.g., bus hangs) occur,
> traditional error recovery mechanisms may leave the system unresponsive
> indefinitely. This is unacceptable for high-availability environment
> requiring prompt recovery via reboot.
> 
> Solution
> The aer_panic option forces a kernel panic on unrecoverable AER errors.
> This bypasses prolonged recovery attempts and ensures immediate reboot.
> 

You should not panic the kernel when a PCI error occurs (even if it is a fatal
one). You should instead try to reset the root complex. For that you need this
series that got merged recently:
https://lore.kernel.org/all/20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org

PS: You need to populate the slot_reset callback in your controller driver to
reset the controller in the event of a fatal AER error or link down.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

