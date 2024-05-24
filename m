Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4868CDF55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 03:56:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lVTKr8+t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vlnwz5jkGz87kS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 11:47:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lVTKr8+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=richard.weiyang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlnwG3T9rz3vw3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 11:47:08 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3550840d92dso322987f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 18:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716515218; x=1717120018; darn=lists.ozlabs.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6jwG8DKwa2D68PCR9THchOvJn/p8bGOM0gVPOEmuF4=;
        b=lVTKr8+tU4x19purSFr1NIWw1u1Mg3UTivQP51g/DjMLWcaGCNf9SLL1YzhGPw5v69
         S0CCEMab4/mCnYmykTqjwmo5ZCaeUPqTvUwdb9k+trv/tWRQ7MmYny0cYKUAxhdJWe2E
         o+6U+WkSE4MlpLypWj+Fh969aJSL1rSzkmmqdt3ofGcRBdUJjBw/vAcIbot9SUJ8MFVn
         MHXdRDYRhQh/hnZWt0wONbknmsRTR8JbaNTrHVM9YPfDOxcKd/eOorCo4fULQlpfhQ+d
         2zTwjELqqyk0N7atYYfoKMxVi68+2rX2N+tkJl7xmCf1umYc16//DwbsrRWIs4JqyaCX
         qZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716515218; x=1717120018;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6jwG8DKwa2D68PCR9THchOvJn/p8bGOM0gVPOEmuF4=;
        b=PamGNPRRIz+p8jRVMAxAEL5tD6/+NFhfn9cKGjm2ecW0evybLYHOaC51Lt8/CSSlzf
         cYZa0FqZY/KLYy6BTzNPEIHHKuEy5v3lwGVCdTTQnFFS+ME17MKrtQVa3fOSkc2AUUfp
         8941OyWnplvwSDnV52VC2HhW/nGTNClkFmRw3THlfQsqVRUK6pyOgWtY7CWy5gIWWCHn
         L36l42R/+My/V+Hd2ykhj3OBVxitjwFW3586hPMYpXXvHt/57itTWtwN465l3S+odUuB
         6x1/gDrvwRYoYRebClp78OX4LkuMzhws3Wk184k810IMmWFnrkBhQrd8HBRJyohIu6oJ
         DjTw==
X-Forwarded-Encrypted: i=1; AJvYcCWOFBYTM7VKX6O8h3g/MmEECUJv5kvbN+8mE/L7v/YcirZN4h5310igPoVIcAr7V2/CoHNTYBJvweSskp2oa01VsHs2+EDAw7IOw0372g==
X-Gm-Message-State: AOJu0Yz1h9djoteazBHwRhMZYjh52/ScXAYANLVHUjpkBL5Q+2eKAkJf
	ms4rKlsgyvcjNpDQGItW3hfV+Xd9LXibu2PIdHHtHzjooCro2PHz
X-Google-Smtp-Source: AGHT+IHDazZVS98g6jCPWCi6GMzJXJccQeP8EnJhTsM0NPuM+NoCFvUGXOm/kOMvOGJZBv5HNLIsdg==
X-Received: by 2002:adf:ffce:0:b0:354:f802:f3a6 with SMTP id ffacd0b85a97d-355245e31b5mr430730f8f.9.1716515217640;
        Thu, 23 May 2024 18:46:57 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc51ee7sm41771366b.139.2024.05.23.18.46.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 18:46:56 -0700 (PDT)
Date: Fri, 24 May 2024 01:46:56 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [Patch v2] mm/memblock: discard .text/.data if
 CONFIG_ARCH_KEEP_MEMBLOCK not set
Message-ID: <20240524014656.odw4yuvhgbu4dgf7@master>
References: <20240510020422.8038-1-richard.weiyang@gmail.com>
 <ZkxLkK7vgzzaEvyw@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkxLkK7vgzzaEvyw@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, anshuman.khandual@arm.com, linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>, aneesh.kumar@kernel.org, linux-mm@kvack.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 21, 2024 at 10:21:52AM +0300, Mike Rapoport wrote:
>Hi,
>
>On Fri, May 10, 2024 at 02:04:22AM +0000, Wei Yang wrote:
>> When CONFIG_ARCH_KEEP_MEMBLOCK not set, we expect to discard related
>> code and data. But it doesn't until CONFIG_MEMORY_HOTPLUG not set
>> neither.
>> 
>> This patch puts memblock's .text/.data into its own section, so that it
>> only depends on CONFIG_ARCH_KEEP_MEMBLOCK to discard related code and
>> data.
>> 
>> After this, from the log message in mem_init_print_info(), init size
>> increase from 2420K to 2432K on arch x86.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> 
>> ---
>> v2: fix orphan section for powerpc
>> ---
>>  arch/powerpc/kernel/vmlinux.lds.S |  1 +
>>  include/asm-generic/vmlinux.lds.h | 14 +++++++++++++-
>>  include/linux/memblock.h          |  8 ++++----
>>  3 files changed, 18 insertions(+), 5 deletions(-)
>>  
>> +#define __init_memblock        __section(".mbinit.text") __cold notrace \
>> +						  __latent_entropy
>> +#define __initdata_memblock    __section(".mbinit.data")
>> +
>
>The new .mbinit.* sections should be added to scripts/mod/modpost.c
>alongside .meminit.* sections and then I expect modpost to report a bunch
>of section mismatches because many memblock functions are called on memory
>hotplug even on architectures that don't select ARCH_KEEP_MEMBLOCK.
>

I tried to add some code in modpost.c, "make all" looks good.

May I ask how can I trigger the "mismatch" warning?

BTW, if ARCH_KEEP_MEMBLOCK unset, we would discard memblock meta-data. If
hotplug would call memblock function, it would be dangerous?

The additional code I used is like below.

---
 scripts/mod/modpost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 937294ff164f..c837e2882904 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -777,14 +777,14 @@ static void check_section(const char *modname, struct elf_info *elf,
 
 #define ALL_INIT_DATA_SECTIONS \
 	".init.setup", ".init.rodata", ".meminit.rodata", \
-	".init.data", ".meminit.data"
+	".init.data", ".meminit.data", "mbinit.data"
 
 #define ALL_PCI_INIT_SECTIONS	\
 	".pci_fixup_early", ".pci_fixup_header", ".pci_fixup_final", \
 	".pci_fixup_enable", ".pci_fixup_resume", \
 	".pci_fixup_resume_early", ".pci_fixup_suspend"
 
-#define ALL_XXXINIT_SECTIONS ".meminit.*"
+#define ALL_XXXINIT_SECTIONS ".meminit.*", "mbinit.*"
 
 #define ALL_INIT_SECTIONS INIT_SECTIONS, ALL_XXXINIT_SECTIONS
 #define ALL_EXIT_SECTIONS ".exit.*"
@@ -799,7 +799,7 @@ static void check_section(const char *modname, struct elf_info *elf,
 
 #define INIT_SECTIONS      ".init.*"
 
-#define ALL_TEXT_SECTIONS  ".init.text", ".meminit.text", ".exit.text", \
+#define ALL_TEXT_SECTIONS  ".init.text", ".meminit.text", ".mbinit.text", ".exit.text", \
 		TEXT_SECTIONS, OTHER_TEXT_SECTIONS
 
 enum mismatch {
-- 
2.34.1


>>  #ifndef CONFIG_ARCH_KEEP_MEMBLOCK
>> -#define __init_memblock __meminit
>> -#define __initdata_memblock __meminitdata
>>  void memblock_discard(void);
>>  #else
>> -#define __init_memblock
>> -#define __initdata_memblock
>>  static inline void memblock_discard(void) {}
>>  #endif
>>  
>> -- 
>> 2.34.1
>> 
>> 
>
>-- 
>Sincerely yours,
>Mike.

-- 
Wei Yang
Help you, Help me
