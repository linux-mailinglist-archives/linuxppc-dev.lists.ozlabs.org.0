Return-Path: <linuxppc-dev+bounces-10395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A266CB10B91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 15:34:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnsS11B8bz30T9;
	Thu, 24 Jul 2025 23:34:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753364081;
	cv=none; b=FQHIBlj/FQBBeYDxIW5T+tlJCd26qGim3jXyt4yTQide2/Am3kSSjnzqrC6Glij5s1iXkPxjm3W/hEKd2IvKAC5YfUL7TTUYq/dTOqBmCN4HaY0EY2pyLoLv/Tq7QMZsljce8rI+LJUqrl0ZgQ+xgnW7PR63lszsFbDnBPSR3DUaC2XnMJOR4gLOoirF/5VGXgpY4g/R5oj+9lSQcWGQokYcQmn6ifh1yJ4hINY+qsJyA5O03PY4EohxIeudvoMH8sX24fC6wXty/ETAmwWM729Uoh1jwU+h/OdbjL7k3QyrnSV8q2OocTRYZW+CjK8iryQBgfi+nqp2UnBeRh03+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753364081; c=relaxed/relaxed;
	bh=/fx+2jC1brmgVu9hs4XiOEifPBnLGokabrEM+R2kq2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0YgICHzpX4kcKfhp5sQ8gQ9TYW3ZHhyPNn/Uv5GZTsrn/lxXvhg1AeK/CP/+4eqkbgdZ6+B3jKES8otZg9TPVcyUyuCnpvgyQlfNunoFXqvJUfn7FLv96ipKjVrU78kbU9HWqDDg5B6EyNNHM8hvIrsoSLjJJg3ISQL0cZu2N1qlVmZrkd1Dmy05XHGcgv51KWXrbebFzTJ4BH20/I6Amh8BE/LyZz9i8melqg+cSxlTZlY6Lj7+kq/82rqQgmCKOhUIc2tX4ovQe4a0gxDrjnpV5k6MSC8HdsjF2IdvzDTuzhegvYwXmi/0pndZX6SDOfSMZBihU0txfBbblwXDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.53; helo=mail-ej1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnsS00py6z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 23:34:38 +1000 (AEST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af2a2a54a95so162762366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 06:34:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753364075; x=1753968875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/fx+2jC1brmgVu9hs4XiOEifPBnLGokabrEM+R2kq2s=;
        b=eZzXFfwEqKfOJx7JbSyk/pgumeYDXLGFMpOe01tWVquzOeBPPRcikQYzjp6C+E8uvG
         tkXEz3PbmNhGgW/377rJlqved4DSjjAr2Wikha4kANmskfmM8bRtB+xhlJN5OLJdE1RZ
         2FdPynDsKbaTWE5irjK9ScwCfXlraBVTc37mxKOIjop/KHoLN9JPtdTGs+QEi0GXfH18
         vtTUbXtlqHDGDiry4ma1F5B1/Vmn5NX947e0IXFYYbvf/4u24vFJwegmT72Mgb9j7nDt
         i/zjzfGRBIp/4Xo8s5SoKgr+e6kFIRxb0fqYOTpArWD6p+3dVYZrqhFV7kBW5Lw6V5KO
         0CXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDZhky7+QnHfmaDSCnr2/C70Qc1ZIk4aWnF4e4UQktfcNIyMjC2z6JzmPe+yfP7NulWZ4aK+TFbap54QU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyn2Gmpu75z0ZEw+HoX8QqZ3wHVX1rgxlvnH+bulyjyrSbEZVcN
	BuTYghH6RksjosS9Aqm7+XecbEwOH3o/Pre6AnYnlOsxJ7vrqozN5zpP
X-Gm-Gg: ASbGncvcEorMyGgp5niY1fiNfA2HBDZDGInSE960lbKTes76Us+jPGoyxjib791TLbk
	wgkm2gZiPvwmdmEBHdxrJuwnB7sWy+TkX5RBNVPg0IVdtJakcNvulNeopK81t2K84Z4BVJa3cBD
	G2eey9OjPt371UlIyRKaOvNMuadkC2C173s26B+MowxUJzB+GUEJKnjCPEadJRtYFMzn8hmLLCw
	HJnITLzp4AWABfiou1/nKhgQtiZtAgmrcz7uarOIx+rGn7OnR+CCYFjBHBzzpRMVTH29nS1d7tB
	0q5JrtdU8UxzRPAGCjxcQpxtYTGxrhy6lbxmCrENWE3N0LODEX9v1RYLf9krvLAdNBx3I5La67t
	YGwjNlrfmdA==
X-Google-Smtp-Source: AGHT+IErTV5E5SvHgukSA8OS+U/Vctcx7DT/kAXhifsJMwbjohYquNlfTpV+af0AGvLRHpjhkGn6qQ==
X-Received: by 2002:a17:907:e8e:b0:aec:76c6:6ef6 with SMTP id a640c23a62f3a-af2f8d4fc6amr617861566b.50.1753364074854;
        Thu, 24 Jul 2025 06:34:34 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47f861d7bsm111509066b.119.2025.07.24.06.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:34:34 -0700 (PDT)
Date: Thu, 24 Jul 2025 06:34:31 -0700
From: Breno Leitao <leitao@debian.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
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
In-Reply-To: <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shuai,

On Thu, Jul 24, 2025 at 04:00:09PM +0800, Shuai Xue wrote:
> 在 2025/7/23 00:56, Breno Leitao 写道:
> > Introduce a generic infrastructure for tracking recoverable hardware
> > errors (HW errors that did not cause a panic) and record them for vmcore
> > consumption. This aids post-mortem crash analysis tools by preserving
> > a count and timestamp for the last occurrence of such errors.
> > 
> > Add centralized logging for three common sources of recoverable hardware
> > errors:
> 
> The term "recoverable" is highly ambiguous. Even within the x86
> architecture, different vendors define errors differently. I'm not
> trying to be pedantic about classification. As far as I know, for 2-bit
> memory errors detected by scrub, AMD defines them as deferred errors
> (DE) and handles them with log_error_deferred, while Intel uses
> machine_check_poll. For 2-bit memory errors consumed by processes,
> both Intel and AMD use MCE handling via do_machine_check(). Does your
> HWERR_RECOV_MCE only focus on synchronous UE errors handled in
> do_machine_check? What makes it special?

I understand that deferred errors (DE) detected by memory scrubbing are
typically silent and may not significantly impact system stability. In
other words, I’m not convinced that including DE metrics in crash dumps
would be helpful for correlating crashes with hardware issues—it might
just add noise.

Do you think it would be valuable to also log these events within
log_error_deferred()?

> > -	if (ghes_severity(estatus->error_severity) >= GHES_SEV_PANIC)
> > +	sev = ghes_severity(estatus->error_severity);
> > +	if (sev == GHES_SEV_RECOVERABLE || sev ==  GHES_SEV_CORRECTED)
> > +		hwerr_log_error_type(HWERR_RECOV_GHES);
> 
> APEI does not define an error type named GHES. GHES is just a kernel
> driver name. Many hardware error types can be handled in GHES (see
> ghes_do_proc), for example, AER is routed by GHES when firmware-first
> mode is used. As far as I know, firmware-first mode is commonly used in
> production. Should GHES errors be categorized into AER, memory, and CXL
> memory instead?

I also considered slicing the data differently initially, but then
realized it would add more complexity than necessary for my needs.

If you believe we should further subdivide the data, I’m happy to do so.

You’re suggesting a structure like this, which would then map to the
corresponding CPER_SEC_ sections:

	enum hwerr_error_type {
	HWERR_RECOV_AER,     // maps to CPER_SEC_PCIE
	HWERR_RECOV_MCE,     // maps to default MCE + CPER_SEC_PCIE
	HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_*
	HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM
	}

Additionally, what about events related to CPU, Firmware, or DMA
errors—for example, CPER_SEC_PROC, CPER_SEC_FW, CPER_SEC_DMAR? Should we
include those in the classification as well?


Thanks for your review and for the ongoing discussion!
--breno

