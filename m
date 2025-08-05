Return-Path: <linuxppc-dev+bounces-10650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FACB1B3E9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 15:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxD6s5mJ0z3069;
	Tue,  5 Aug 2025 23:00:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754398821;
	cv=none; b=QYaXC/h4W7YG/xDSr3mXtWsItY/ASj3MVfZphs//4QqVskFysHrXwlT3ExfEMZJ4om+HCV8rl3uzn96Llq41jWrATGlTOqdUDbNxYHLcGuNO6IWXPlxWFSSQFREzKSNrt5mxqPkVRrO3+8QwROsGqOkqIbgvY7UP4MdEii029KgJRyg5/6r41SBhFEKwoQ94CI+W3qzotT/W2aZyip+8ExP+l8isQIfzJxFq7M0Z9ccEFVu1ecL93n75Yy2ByFAFJ6dBi0PMlcUB79A2M1WJ7I9EBD6Kk3ucxyCPbKvb5bCm7JufXPCm5Oz09zzo/vahzgxwLeVj8qrrQWOZuKgs6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754398821; c=relaxed/relaxed;
	bh=BzQHx1i5Fs/JOgRu+gEHkLfTlj9ZTI1ibV6XEx4O938=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNx4mynEVoLDUyz74cIo/ovU95ZQLn8e3IrYqIWS+uRhmXuMiHAbQjeP8YOGLGe0WkGxz1SshjwF7bNyjQU1moCsGA9CySLyxzL/8YDb04VK+XDfUKeZ1fEUAOnw1ho0mUBiLcluFlhiK9de8tduHEcx7Va916h+cyIPSunoTr+M7AlEGhCHGlLzc9oQkhgkfkzz+3+WxTGcaTLYga/8joalLHDXI2XyGzLa7HqHvx/gt8WwRuF0Ren5+upcCwvpeXEjtXnsUWLJt+5w4tSrwTk8LvKq9SSpbKe2bmRidx0i0/9fALFY5/DP2JCIbVI+9ehPDZ7+YM0BODcrE4wD0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.47; helo=mail-ed1-f47.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxD6q4x2Sz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 23:00:18 +1000 (AEST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6153a19dddfso8591326a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 06:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754398812; x=1755003612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzQHx1i5Fs/JOgRu+gEHkLfTlj9ZTI1ibV6XEx4O938=;
        b=CJ3RdhDMw8DRUs8l30FbazYXUYCuObfWyiDWFqiRz1C1ZputmmBdPihy/V7jAQVyZf
         VdpQJiSRbabs7DD3wQEN4rccHV6CW0AnFvfdPvPuPVbC9Y8zNmR04ZlmzvQzNOkfvGM2
         LsaZ/QfLKscqudS7TBGp4DcM6NRBeCifmQpsd0fHAYE5APiLZ1Se1qigQurvj9txi/EU
         7+0HleeDm36mzU7Tc2LMalysKcf2oWJwFeLOSsMYfCMOnOSv/i+NjYxlgO2LhE3tGojC
         IAUa2Gz1B5ofCtkW7avbjA2c8WYd9ES4xBSP9XxSlAx49jAoM5t+Q7IYVr/LFNPKNzg/
         8VPg==
X-Forwarded-Encrypted: i=1; AJvYcCWThgg+VNZjfoR66QAygqwcsPLMrY2J3rqXGioUdSn88tHIAgthqcSAN1WjGyZL3bPFkz9JQu8dSFMc3+Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwaEpStp6eG7IrSGzXiX1GjWQH7r0U4YAVGvota22Xfx5dDKJFG
	MrJDnmW8AmsZQcLfxBwClpdJ4fMlfNS5DA3WgprgxW4omhjWwPZtXUff
X-Gm-Gg: ASbGncvBTPvvp229gxVnYlp2TdLRdJjrCj6ThMfr4mtZhvpfjSuWql8V6/o2Tj1RxHp
	dvSuvSGhAs2M1R+7l361J4C322lMnDJY5jT1CK7owbxxY5cLBG+PdOronjczdQjeR9Q+Qa9Stdv
	MTGsSRd4vnJs4BC+rpguEgLDgatOjJ9tKKOFNZYBOWsaN6fv0Gg02hqs2VC8MKbopZ/2ZVkZ6Kn
	C4NrF87YLy1bbQDbROPEGKL739NCCEuk0Ct9PsxsltVmU55M07NauH+crnGFF7bZ527rT+qwjuM
	vNrRCrFAgObIK5byfwMphmiOhoV8ETOv7tdu8SoBuDH1MGFwqZOcQMyckjBTP2yxuSToMbtr3Yu
	69JLHLYO/XeSM
X-Google-Smtp-Source: AGHT+IGjZSNpW7mJUj3kJ0f8IpMzBnPj+YUjP2KOPDwITdV1e7i/FDQIvzJwDgp/H8IFr3t8Mztalg==
X-Received: by 2002:a05:6402:4402:b0:615:b0e2:124b with SMTP id 4fb4d7f45d1cf-615e715bd27mr13276935a12.24.1754398811018;
        Tue, 05 Aug 2025 06:00:11 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:8::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2a448sm8429117a12.20.2025.08.05.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 06:00:10 -0700 (PDT)
Date: Tue, 5 Aug 2025 06:00:07 -0700
From: Breno Leitao <leitao@debian.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com
Subject: Re: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <j4ac55vpiemdjdbfzoktoqv763fhpv6q2agmgaeggvahfj5kuy@v7l5lrrdwkjj>
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
 <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
 <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
 <0c045f1b-44d0-430c-9e8a-58b65dd84453@intel.com>
 <buhwuankenpnvmio6jeoxverixoyfpn2eh62ix7vzxw7xvlxcv@rpibcrufr2yg>
 <842d675e-4c22-4f13-b40b-c4b5208e4223@intel.com>
 <ipdhflmgqrlq2vor657fiwex66jqw2do747uvu3tvrcsvtvdjj@lg5zrcua2dgn>
 <529fbbc1-90fe-467b-9bd2-d1a18bb38670@intel.com>
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
In-Reply-To: <529fbbc1-90fe-467b-9bd2-d1a18bb38670@intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 10:41:05AM -0700, Dave Hansen wrote:
> On 8/4/25 10:12, Breno Leitao wrote:
> ...
> > +- These errros are divided by are, which includes CPU, Memory, PCI, CXL and
> > +  others.
> 
> There's a double typo in there I think:
> 
> 	errros => errors
> and
> 	are,=>area,
> 
> > --- a/include/linux/vmcore_info.h
> > +++ b/include/linux/vmcore_info.h
> > @@ -77,4 +77,20 @@ extern u32 *vmcoreinfo_note;
> >  Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
> >  			  void *data, size_t data_len);
> >  void final_note(Elf_Word *buf);
> > +
> > +enum hwerr_error_type {
> > +	HWERR_RECOV_CPU,
> > +	HWERR_RECOV_MEMORY,
> > +	HWERR_RECOV_PCI,
> > +	HWERR_RECOV_CXL,
> > +	HWERR_RECOV_OTHERS,
> > +	HWERR_RECOV_MAX,
> > +};
> That enum needs to go into an abi header.

Agree. I came up with something like the change below. Is it the right
thing to mark the enum as stable ABI?

Thanks
--breno

diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 37e003ae52626..e71518caacdfc 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -5,6 +5,7 @@
 #include <linux/linkage.h>
 #include <linux/elfcore.h>
 #include <linux/elf.h>
+#include <uapi/linux/vmcore.h>

 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
 #define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
@@ -77,4 +78,11 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
                          void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+#ifdef CONFIG_VMCORE_INFO
+void hwerr_log_error_type(enum hwerr_error_type src);
+#else
+static inline void hwerr_log_error_type(enum hwerr_error_type src) {};
+#endif
+
 #endif /* LINUX_VMCORE_INFO_H */
diff --git a/include/uapi/linux/vmcore.h b/include/uapi/linux/vmcore.h
index 3e9da91866ffd..2ba89fafa518a 100644
--- a/include/uapi/linux/vmcore.h
+++ b/include/uapi/linux/vmcore.h
@@ -15,4 +15,13 @@ struct vmcoredd_header {
        __u8 dump_name[VMCOREDD_MAX_NAME_BYTES]; /* Device dump's name */
 };

+enum hwerr_error_type {
+       HWERR_RECOV_CPU,
+       HWERR_RECOV_MEMORY,
+       HWERR_RECOV_PCI,
+       HWERR_RECOV_CXL,
+       HWERR_RECOV_OTHERS,
+       HWERR_RECOV_MAX,
+};
+
 #endif /* _UAPI_VMCORE_H */

