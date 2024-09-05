Return-Path: <linuxppc-dev+bounces-1043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C5B96D3D5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 11:46:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wzvdm3dYxz2xGW;
	Thu,  5 Sep 2024 19:46:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725529612;
	cv=none; b=RY3WgW0ntX1UXoflhYbfn61oxpldD8qMJ0HUxAXlPBhahyv6io+r3DqZTgNZf9rtc+l1A1KozdvyEj97dSfaPBGT2A0rjhXeyidiNnLVTkXZAf5VENvAc5J+fNzgvBDg7+SAvfUblQpbSMx0mtSEQDAQ9OkgBfSslKtpjcXdML3OXbcranifCFKcnRfFLP898RMs9omziJDl0oKOiuP+PcpSjdOsuYoh0M7T6LWI9olhE4f3WzidoQotR2L37EU/x6fAdbYZjvIPhLkGZ3CF84SspLKbmZEtCdMOo+fCgpMP6ocBS5x7BGuD5uJ+ehnfcNdxbe4X5Fw2cwfy+TyP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725529612; c=relaxed/relaxed;
	bh=a3A+0OEpset36zqQ8dSnuPMDIA8aciodye1/vukDHAs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=RPy4mRMH1uZN11g2sZvgAbrNkEsh7MLXffPJotDRdpfBc7Son6K8BQA4wz9WwPFIS7/4XChnRqArSICwGTgYBhaXCBSNcc/yMULHbL5jlO89JMSLNDk5Oo2TQ4bWJXbX6e4k06gf2No2vfOXC8rUih6p9OEsvaNScBoPP83+TWnIE9iV0SyiQCKKvBCOPZNf40ZR7hkdA490gk4ep0w9BwGPT5hCJbUvwq5SCZ+fd/Dl82+e0TsHLxCz83McHRLkZ4pDJ53BVGUPokC/9YATLPhyyFEE9h9dQ0pr7GUvec5lRHwro0gk+Cdt3WYngrK9jID+17pk7qaekOFiVnpVnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=je+cpfK8; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=je+cpfK8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=mingo.kernel.org@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wzvdl6Km2z2xGg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 19:46:50 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-374c8cef906so314344f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2024 02:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725529607; x=1726134407; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3A+0OEpset36zqQ8dSnuPMDIA8aciodye1/vukDHAs=;
        b=je+cpfK8iAYIFZqH+4+u9fbR8N6z3Se04xjjncDmYxEsrzwmsobUTksZdA9Z379e6I
         ORG4+cW83wggiY+8/KVn2vDzA0FJkJ3WIwD0p5LDNmS/va8HXsL+0m8Z2F3nFgfUdnCS
         yoT4z5zxjiJd1DQOKX2cUaoImFV4WDxiA10/858I0IKXdProwcSONrh3cBZ/FUE2HZvx
         xkaL6mkmdKOBrpXzar21aqph1bbOgE2Fjs5hzzD5tqpFDe0u8TVki6tAVzBmzBOgAM7R
         tA30bQUmmg4rRWOn0LdzwB6fuvkGn3BWTwrA+u3njVWE3F+xx9l2XoSMKyu4mBON92g1
         6yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725529607; x=1726134407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3A+0OEpset36zqQ8dSnuPMDIA8aciodye1/vukDHAs=;
        b=NcojRUY7PiKloS2x4/o0kuKNu3uh/B0Grr1HWM5TonGRnlLqr2V9K7DWUi715T77SH
         ryDuxDcC2B41CPE9FmeBzTWcZ9OfgWC/8EOxS/DXITwZm4SKvI6WmCjE/37hz7RFEPFw
         OAxS51C1XyRONIvzS4Q1CLyZ4+E460y95S5ZGztAwzqMEJ6hSBq7QUdjBDDgfNji+bFI
         QwcoUj5oWijBuHna/Q2k3d7E5UFeInwTYgGHvGTiZOZxGBfH8Lo39yXTaPeGSX6FNaYg
         S03USanDSPZEzmRUbeyKkwKaWeJe6a7jzv7Wx0pnEhsKyNgqoQ2jO3lzFHvs91T5NELq
         tM6A==
X-Forwarded-Encrypted: i=1; AJvYcCWdK7sBxSxWIIJGhUcybl90Xdk/0FVe/YWhrMZHd6Dqk1GDA0tB6o3OjUonA4UlliLxl3HuaBt8GUxU3fA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyJYCqQvaOxNwaOEms6bxr8M9B/6tuEeXtU890Gp1nX0XLKjztJ
	RaGubqTiL6w1DC+GTvQKqwK6InUFqT8rAfDCQdHPvadzB3rqSE4C
X-Google-Smtp-Source: AGHT+IGwAx2QSUfLDZ+tfaLzM6jDxYn1gijqzhfBCWl8wJV2u0GTNpP6gbYbb2bM1aZJ2WyRNkSboA==
X-Received: by 2002:a05:6000:1f8d:b0:374:c29f:8ddc with SMTP id ffacd0b85a97d-376dea47192mr5800262f8f.40.1725529606275;
        Thu, 05 Sep 2024 02:46:46 -0700 (PDT)
Received: from gmail.com (1F2EF525.nat.pool.telekom.hu. [31.46.245.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c1de81b2sm13382624f8f.30.2024.09.05.02.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:46:45 -0700 (PDT)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Thu, 5 Sep 2024 11:46:42 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>,
	Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH 2/5] perf: Hoist perf_instruction_pointer() and
 perf_misc_flags()
Message-ID: <Ztl-AjEEbIbX4lnm@gmail.com>
References: <20240904204133.1442132-1-coltonlewis@google.com>
 <20240904204133.1442132-3-coltonlewis@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904204133.1442132-3-coltonlewis@google.com>


* Colton Lewis <coltonlewis@google.com> wrote:

> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -6915,6 +6915,16 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
>  EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
>  #endif
>  
> +unsigned long perf_misc_flags(unsigned long pt_regs *regs)
> +{
> +	return perf_arch_misc_flags(regs);
> +}
> +
> +unsigned long perf_instruction_pointer(unsigned long pt_regs *regs)
> +{
> +	return perf_arch_instruction_pointer(regs);
> +}

What's an 'unsigned long pt_regs' ??

Thanks,

	Ingo

