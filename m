Return-Path: <linuxppc-dev+bounces-10383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40897B0F727
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 17:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnJCf5YQWz30HB;
	Thu, 24 Jul 2025 01:37:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753285022;
	cv=none; b=dIva9xblivFU/aVxItlxEHqUp/naUD8AZo2QbJ3hpklljtgV26nfUmBxmjQf1LMg+dtobEUVzVq2djZCaJw7Ypmtf7SG7vJam3hU2XA0lROtVoFf1efl0/pLjsz4o2S2q6a+8dDjbLAs9yb2Bt8PaUNGHAuo2VUyFmAOn1WE/LMS43BVkiXkhCWyiVcE65NNpCw+/67VvKgS7XlUjkLqmEpETlVI1uzMVV8dIO2hfupY3nCemNzKDxIWw9Uuy/MUPs+juy1tjxE4qmi42ZJveFJz7A/giNznW+y00UfbNM8mvX+vfql8vigYX8znfeyERLqnuK2a8GXVqWBAM3XKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753285022; c=relaxed/relaxed;
	bh=hxQ3M1WeHEo+nA3pDBj1z9ZXTmnmq5hk8Qm0uzS3eUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3BRq3ugY9nWMGSIVXKTtCDz4bjg799u58hTEo+jlVwBQt2cKQU3R73XSZqeTGWKbeo/fMOHW04SS1na+IKmvg0Q4O/nTJ0bL85ALOJldW3YcZkw+D708tMV5vEMVsUulPY5OJcMxSm3unBDbsPn7maHnmKJdFAFeqS7fzKGzlG/4lxTbSTDlc/EyQ53nzwWph1ROYfIuX0ZXUgL/+ADuAlew8Yj+Srv3rlg5OWRvMsZpEgNxAZkI3urgQ3TMz+j3bTP9MAUdk4lKVff6Ul/5QdtmH3YsFSNETywjn8YKLRCWTQShGKncFZDIIpJ8C192ALbIq/f6UrMeIwUD0zwUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.48; helo=mail-ej1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.48; helo=mail-ej1-f48.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnJCc74YWz306d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 01:37:00 +1000 (AEST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aec46b50f33so1174531966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 08:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753285017; x=1753889817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxQ3M1WeHEo+nA3pDBj1z9ZXTmnmq5hk8Qm0uzS3eUY=;
        b=vMGH6ypb+rYOxySyT+rEjjfAaaXhIh6bFQtAu6ayPUA1TXwDrket0UroPVtEcJk7zc
         sdW6OwW49TI3wz+JzhHIP+Az6XgmOtJEnSbFVe6+XjIvu3jHtCUCJpJjn3Xes8wDOfD7
         cgZDtzovWLSuP/MAYdqPAbDlfI+F817J2DKNO8TrDJ6NFbAGRYN42kXFasWLSwvRgCg5
         9FlO08qCxgWUpIWWTy6pcDr+byN/SnJeyIpA6KM6fk2+vZ5TPw8RBPwPJFl8JX9v10v0
         KtLV+oFB2Eo3bUQxb661b8WX/87rFzFB+KUS+flcT/swFZ/BzyPvWA06/TLeovLQlAnD
         6g0g==
X-Forwarded-Encrypted: i=1; AJvYcCUTAL288uKHgqVac0T60pgil5MS77T702AIgxOxAHrLAkPnkJWip/Yt6SmtLZjfCKrRYGlVVwmgyan01ws=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwneuMvj0HpaH7OCUktTCMbTePpYSwnajZwVGmie8Tj+xeHLX3i
	ldcLqEpRjQ9Z4rm+sP/d08XFF5fhXrzg5+U1rZdhu1KnSX5idd6F6Kw7
X-Gm-Gg: ASbGncudmVx2o0V7v9K/EKeskONkHSlxk34v15iKN15UbBa4a5mYssZxrxJy5mcLyaA
	TPxqqKVAl1qRO3PtstNk+0SLYgufDCLb+TbpC5ZXP2unnNBD08rKu+SxtmARksXLhylxyKCYpok
	JtS5Pi2UW9gMbsoxLDzdD6V3zCK2uYa6ju4al3NUSTYB34cIN3PLvirEek3gKUN0sJL1sXKQr4X
	iIDDl8fh7CiRDlT2N3TLE6W8U9XREsFasJND7JiQhTWFc6mEA2qP00eA3tBOcOXdqceoihbJkNC
	sQ4vbH11/J8Bkcsiuc4bGw3IimsdTED6rGOojbbOzsqtEujq72zlZET+Ea1T6BdyimBqB5C1A1H
	a1gjkSdbxbRevVw==
X-Google-Smtp-Source: AGHT+IETRaOgydL5D9alhTF8zO82hzgDecgDyn/Edc5pZ0K0bOUQXLbkxv/O/N+5sE2Ilhir+6nemA==
X-Received: by 2002:a17:907:74a:b0:ad8:a935:b905 with SMTP id a640c23a62f3a-af2f6c0c6a1mr324567566b.22.1753285016210;
        Wed, 23 Jul 2025 08:36:56 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:70::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7bc99sm1068454266b.109.2025.07.23.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 08:36:55 -0700 (PDT)
Date: Wed, 23 Jul 2025 08:36:52 -0700
From: Breno Leitao <leitao@debian.org>
To: kernel test robot <lkp@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <helgaas@kernel.org>, 
	oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <cdlrppnrheyq7z3gmwmwsmktpmoiwq7g5hxa67rcx4iem5i6ge@jksa5o5use4w>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <202507232209.GrgpSr47-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507232209.GrgpSr47-lkp@intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jul 23, 2025 at 10:28:29PM +0800, kernel test robot wrote:
> Hi Breno,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 97987520025658f30bb787a99ffbd9bbff9ffc9d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Breno-Leitao/vmcoreinfo-Track-and-log-recoverable-hardware-errors/20250723-005950
> base:   97987520025658f30bb787a99ffbd9bbff9ffc9d
> patch link:    https://lore.kernel.org/r/20250722-vmcore_hw_error-v3-1-ff0683fc1f17%40debian.org
> patch subject: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
> config: x86_64-buildonly-randconfig-001-20250723 (https://download.01.org/0day-ci/archive/20250723/202507232209.GrgpSr47-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232209.GrgpSr47-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507232209.GrgpSr47-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> vmlinux.o: warning: objtool: do_machine_check+0x5cc: call to hwerr_log_error_type() leaves .noinstr.text section

Oh, it seems a real issue.

Basically there are two approaches, from what I understand:

	1) mark do_machine_check() as noinstr

	2) Move hwerr_log_error_type() earlier inside the
	instrumentation_begin() area.

Probably option 1 might be more flexible, given that
hwerr_log_error_type() doesn't seem a function that anyone wants to
instrument?!

