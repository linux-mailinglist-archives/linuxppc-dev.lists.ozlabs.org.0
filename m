Return-Path: <linuxppc-dev+bounces-10471-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AA9B16541
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 19:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsf5H57Rnz2yFK;
	Thu, 31 Jul 2025 03:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753895795;
	cv=none; b=kRe4Ys54PU21sm5kxQLdwpiL3kZQMnOUjBMkUEDITRB4SZ5jTmioNpnKWwIYBF4C21FIyQceHUrzDjh9ciIPRZzzCIwrF7CKTh4Fm0XjoSzYpVYi1/fvq39GBs1Z307yGNIns4TfHgkMx9kjckSaNkr3jmx2l26clvMxFPWPOelVz0rykF7RilFEGG/FZMtbSNWwW8cxEGSXtthctLX8ulpQmSqLyVCrATEkliQIscmT+Ua0i2kyguYQE10mFsX5VzqsqrtwaKLLXqN1DPo+aMPDK5xCbiUeIZxGgf+R3tWu54FMKZh7Tj/+VR7RaXxRU8obd6ktV703x6MAuhOL3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753895795; c=relaxed/relaxed;
	bh=QnBLTSAmqLEpz+AnF+mqUYEiUlYclERoRLZ14/+NMT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oq5d9cx4wNEizhXXdTdJoTba9p1Jv4NB5blkJk4K8I/matobHiMLUDn8ikZilLjoagith1BO6juD16Wji54Uskem8bmR3xVRqDcluoQ+yf+EdPr0riEXkbbZlkZsxchI9/feAiXBc8pZnA+UcCIDVhNsmtMIYWzThYup5TvFWVdo1AzU54OD8PyM8AHGQt6WcO2IPLbMoDP3UwD8DPOmqOcODzoMLdp50rS7VK0R6ALFz18RqqPaQYrkKNp2bRZV39JpxSHAh2AzusK6yi/mNZcWfpQelpDaUgnQcRiViu97ugrXDesXqX5HOYhXEX1+vMoKJEfmcSfc6pOel2uukw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.49; helo=mail-ed1-f49.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.49; helo=mail-ed1-f49.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsf5G3pMKz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 03:16:33 +1000 (AEST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso11350316a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 10:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753895790; x=1754500590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QnBLTSAmqLEpz+AnF+mqUYEiUlYclERoRLZ14/+NMT0=;
        b=TzO/8TsqICbIW9TY7IMt33G+aT7bgOhTvRXAEK3EmYZUvY+z1msQ/N3Srb8zonse9j
         Bf7bjpXDlRHro/fpUO6FOqa39k+nbZ0R12Uk3GBEJJaTl60QjFMQw0OBJWqhDHw+28yN
         WM0Ymd9DzIf+JyxSzXFPNTbbUTFivq2WzuP0ygXRVEvyeqqP1jGgl9V4gSSEjgjP1po7
         WKTqGkvbIWlBZmApzMsF4LpyFSfrT94YtbBIr2ont+4a+Da2zlSb8gHl45LUuXKivd9q
         L1a8wDhrG/ZiWqFZDsAZ4SLa39kN3Cje36BO4YFiBFlglFAK51Y4mV9UoUOQcvGnu289
         sjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBktcbUGqZ9OFW1Xwd8ggEP06j0uNAwJgMYwTg8o0bKqp8YzrtN7tINha5ZXFACQPBiz43mCmEpHpjDjc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwIRUqECHzN7aYQx+ldUubtxvNS4jGJhvJHddaMn9ov2v3tobuD
	99qpB97SjDm3kF/4X6a7bDFVdG7EXdPQ5DHZiO/x8b+Qb9ZbothCA0SN
X-Gm-Gg: ASbGnctPziIcEt7vY+jyEwFMU6wWAbaX9g4Uwd3I1RW7mztPgqBMD2mn5gsLpKKdHNp
	EWykW1XjMDKFwO3/smVq1WzmLcU51p0zlz5vHcMJT7k9W3dwnFDR33HZok6eMmcqy89oBo/bXGy
	+Jwd6ve5G8C6Qxepr3D/UBOfZ4oqIQhLJoC6WrLCjXF165/uju+VqlRCrasNZAnaP2RIe9vz+Us
	JqKp+bE0GejALN94PjNNIUIzf8Ir7DE02ZTsslDxLhmZsbEYRZPsp428D1migekaMzMwEGYiR3J
	xxprkKPm91zuFfv51Rh9ry2cmN7asG0+crp6RvuDDp6RnK2Novdbv9tt2OTIoY6S4XRDYaLMCvu
	WfycgZWkQF6lT
X-Google-Smtp-Source: AGHT+IEiGi0ZE+hn6nJPN3xAPRd7sUfNkdea1puk9Js+8BUSU2zNcBVIaxaV6D3y2/hqS+gwsWTE+g==
X-Received: by 2002:a05:6402:5245:b0:615:7703:e0a7 with SMTP id 4fb4d7f45d1cf-615872098ccmr4788798a12.26.1753895789412;
        Wed, 30 Jul 2025 10:16:29 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:3::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61548bca6acsm3819155a12.17.2025.07.30.10.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 10:16:28 -0700 (PDT)
Date: Wed, 30 Jul 2025 10:16:26 -0700
From: Breno Leitao <leitao@debian.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <yhfoip6ihr5r75pa7vnz3x53nifaxvi6rbin32nhwqx4hu7gnn@taj22iria3aa>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
 <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
 <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
 <ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
 <4ef01be1-44b2-4bf5-afec-a90d4f71e955@linux.alibaba.com>
 <2a7ok3hdq3hmz45fzosd5vve4qpn6zy5uoogg33warsekigazu@wgfi7qsg5ixo>
 <a87c5e74-082f-4be6-bbfd-4867bf72ddcc@linux.alibaba.com>
 <zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
 <a0839ff9-ea8d-44b9-8289-fcd5039e9263@linux.alibaba.com>
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
In-Reply-To: <a0839ff9-ea8d-44b9-8289-fcd5039e9263@linux.alibaba.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shuai,

Thanks for the review,

On Wed, Jul 30, 2025 at 09:50:39PM +0800, Shuai Xue wrote:
> 在 2025/7/30 21:11, Breno Leitao 写道:
> >
> > @@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
> >   	}
> > 
> >   out:
> > +	/* Given it didn't panic, mark it as recoverable */
> > +	hwerr_log_error_type(HWERR_RECOV_MCE);
> > +
> 
> Indentation: needs tab alignment.

No sure I got what it the alignment process. The code seems to be
properly aligned, and using tabs. Could you please clarify what is the
current problem?

> The current placement only logs errors that reach the out: label. Errors
> that go to `clear` lable won't be recorded. Would it be better to log at
> the beginning of do_machine_check() to capture all recoverable MCEs?

This is a good point, and I've thought about it. I understand we don't
want to track the code flow that goes to the clear: label, since it is
wrongly triggered by some CPUs, and it is not a real MCE.
That is described in commit 8ca97812c3c830 ("x86/mce: Work around an
erratum on fast string copy instructions").

At the same time, the current block of MCEs are not being properly
tracked, since they return earlier in do_machine_check(). Here is
a quick 

   void do_machine_check(struct pt_regs *regs)
   ...
          if (unlikely(mce_flags.p5))
                  return pentium_machine_check(regs);
          else if (unlikely(mce_flags.winchip))
                  return winchip_machine_check(regs);
          else if (unlikely(!mca_cfg.initialized))
                  return unexpected_machine_check(regs);

         if (mce_flags.skx_repmov_quirk && quirk_skylake_repmov())
                  goto clear;

	  /* Code doesn't exit anymore unless through out: */

    }

Given that instrumentation is not enabled when those return are called,
we cannot easily call hwerr_log_error_type() before the returns.

An option is just to ignore those, given they are unlikely. Another
option is to call hwerr_log_error_type() inside those functions above,
so, we do not miss these counters in case do_machine_check() returns
earlier. 


--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -1481,6 +1481,7 @@ static void queue_task_work(struct mce_hw_err *err, char *msg, void (*func)(stru
 static noinstr void unexpected_machine_check(struct pt_regs *regs)
 {
        instrumentation_begin();
+       hwerr_log_error_type(HWERR_RECOV_MCE);
        pr_err("CPU#%d: Unexpected int18 (Machine Check)\n",
               smp_processor_id());
        instrumentation_end();
diff --git a/arch/x86/kernel/cpu/mce/p5.c b/arch/x86/kernel/cpu/mce/p5.c
index 2272ad53fc339..a627ed10b752d 100644
--- a/arch/x86/kernel/cpu/mce/p5.c
+++ b/arch/x86/kernel/cpu/mce/p5.c
@@ -26,6 +26,7 @@ noinstr void pentium_machine_check(struct pt_regs *regs)
        u32 loaddr, hi, lotype;

        instrumentation_begin();
+       hwerr_log_error_type(HWERR_RECOV_MCE);
        rdmsr(MSR_IA32_P5_MC_ADDR, loaddr, hi);
        rdmsr(MSR_IA32_P5_MC_TYPE, lotype, hi);

diff --git a/arch/x86/kernel/cpu/mce/winchip.c b/arch/x86/kernel/cpu/mce/winchip.c
index 6c99f29419090..b7862bf5ba870 100644
--- a/arch/x86/kernel/cpu/mce/winchip.c
+++ b/arch/x86/kernel/cpu/mce/winchip.c
@@ -20,6 +20,7 @@
 noinstr void winchip_machine_check(struct pt_regs *regs)
 {
        instrumentation_begin();
+       hwerr_log_error_type(HWERR_RECOV_MCE);
        pr_emerg("CPU0: Machine Check Exception.\n");
        add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);
        instrumentation_end();


