Return-Path: <linuxppc-dev+bounces-15292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A402ACF6E69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 07:30:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlhB36nWVz2yKr;
	Tue, 06 Jan 2026 17:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767681035;
	cv=none; b=n+9ocqooLuIRTE6ECJCS4/DZ+I0zpO1mjSFxpYnyAOf7JvpqYPgLdxxGAqPqXU/dYe+tRuI9g3418risiBJf9C/3inMUchu1BW/KYa7EaMEUhlr/pHsq5rhaxmZ5X/nlru9gI/kFp8oIa+KC1eXU3o319wlrVCAlhHkWApHBJeDhZRitIOWbVgorMkGXAipggjZnaAwokxJSyTl9WYvK2WUsbsf9+gxxmjkrUuHjV4jmDqFtB2ayKLM+Ii2ktnFWFaxjYsYkrQYbSRjilJIlh4QdBFwst6xsCbSm4lVwr9QTOZrJf2pjliV5jl9ZG7my7/ZyhHQFP1mdPkCuZfKvAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767681035; c=relaxed/relaxed;
	bh=5odIQwPJjuX5od5ef4AjZuxMCllVPli7nQhOJ/OzpYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=KsbvsdbKtBOzHuEhh4n014kyRn5hUnTuk/SEZ+OFuBJCLP0Q86zZSrZaNedESnSvuzeSXcf/FJ1AylKYHE61CCgQbVeaSKyyF4uB9pGtBf/ajLCrd3XIvxfn2L/ZhOk/by25qW6xgA3KASJMYE4oT+Mi3YvAG/FR4QuIUAySh1C0xMZtOIjFwALgkNhPDME/KXalG2Ta+IDDQdf54AXeu/R64+kezbntUM/5zDCU8nA+3iSDppcN7oYNbRlrhWrusMYIjnjfI3Qc/groFBOBDRCXEwMFvf80OPRC4NUWBIZHuejfJ+ltU1t1mMmou1A21FrIFOHuO+ctg61nt4SJTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1EngBiF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGx+zoPl; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=I1EngBiF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SGx+zoPl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlhB23xCZz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 17:30:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767681024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5odIQwPJjuX5od5ef4AjZuxMCllVPli7nQhOJ/OzpYQ=;
	b=I1EngBiFDOnnvbLjY2nkYiUMqGrkw6B1/wJEghp7522pbUkDo8H9GJpU1Z3i0MUr4iA+JG
	1EHw6rTi993KyaaKcPIOGOWjmkl6gAbpkUje/65zPPGuAZXjpiQxyO9NRH/QSf9kfKRlxi
	AIULZM5kg0EeoHDRYHfS7rliYIxXK2A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767681025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5odIQwPJjuX5od5ef4AjZuxMCllVPli7nQhOJ/OzpYQ=;
	b=SGx+zoPlHhSxY/Cpc1qpxNdLCU3lXbdafOxNIWPVvCwJTSdjqjY1RJCtRPIVSn1Uab5ChR
	1UYSfZsqu1bc4AJqNxZQ1A8x08M1qH6/ZsaTbA4LFF5vz3K6BXPv8yPY+JQZAAi4HKOc5h
	AZZGh8YpIphkWRKTOW9LS0dyLMMl7S4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-_seYVl2hMkqkPXadi7XfNQ-1; Tue, 06 Jan 2026 01:30:23 -0500
X-MC-Unique: _seYVl2hMkqkPXadi7XfNQ-1
X-Mimecast-MFC-AGG-ID: _seYVl2hMkqkPXadi7XfNQ_1767681022
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so1375990b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jan 2026 22:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767681022; x=1768285822;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5odIQwPJjuX5od5ef4AjZuxMCllVPli7nQhOJ/OzpYQ=;
        b=KnrDntXz3jKSMYfkQydVzrO6yHSUD/YGw8OnNVWl/HGGSCDTu2Kn1Oj2ZrXn2roQCT
         3ZjCOV1U4W52CZA8m61ViHzm4V68C7gD1CjUjvyfBEJCc/SAZ4cHKfIUxSpKDKwwO3Kl
         gI2ZUjCAKMwCRx2/TUk+csqYzrULAuJuhz3HOwrupZz0/0J2rz2aOClHvF1bLmlaCSg/
         gk7pECRMN9fIW9Mdv924G7knduIol8AcPKTQoRBq6Cqxm3Wf9ITbyAGf4jscjuVVEFoZ
         U9B/kRPPo9BhlwhEdXhN0fHuz6DISbHLOoSeo6a3WnVz+tMtX91ZBD4EiPNh7MwnsUJt
         /ViQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigYURmVtGfPEUUFb4Jyg1DQCIAiDkcB9dvtdcgUQ3ehNrf4sEJhtR4aCOrGesg0CAGRGB0eBTwhYbVWc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy9rdW8cj5o+F0KK5/gnYJx7l+vnJPmUCCYhusNJAOx5tIQISXR
	RSppF6tOsCldq7kEUhRmdI3Dm6F2nHhAH1mYj6Ah9mCSz1Ax+OQgkrQf2cvOXXnYFzEOJ0zlsny
	bGZO9Cdx+zltTnjc3dljyjbcMu6HXGBzWbISmQhJNnBSBaVIrG9TUWAH+wG7Q4Q5HW3A=
X-Gm-Gg: AY/fxX5hjRgGn4RHqYK+FzZmMZ3HeifaGjtdkYXqiTAEM+SKu58+taVLwTUJVy471wH
	pMzg9q20rakbh+XBErvEEhviWkcNpF8iRgei96AMjymMlPuWmNhBkPOjBm4c8cmxlpP0qV+KUL/
	dcYUbnh0ApfmvKvJUSQBjk2bMgz7ltgX2/82fN447Bu6Qo5aRyUF74cZdLZ2r12WvlMW6Uj05El
	JDGedWkFkBblG8/sMjVOmV1JgGpy2SjyFxRCyIuF1yhE0kbJHH6+j6afJCEqgdSvsYdLtLGfI7s
	j1MVvLaISQL7Xn6+3xayTdb9wcpMJTehtPEzCLvQKMl04vdgaMcu6gmPr3JSp+zPbQWrJFPBX68
	4
X-Received: by 2002:a05:6a21:33a2:b0:366:14ac:e20d with SMTP id adf61e73a8af0-389823ccaeamr1702272637.75.1767681021943;
        Mon, 05 Jan 2026 22:30:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9cfpUUe1HFlsOEg/hJrnV4Zf0Q08lNkGZQR8DEVWxFHSM5lZqtkm1xu9aYzl5/kpjJzLI2w==
X-Received: by 2002:a05:6a21:33a2:b0:366:14ac:e20d with SMTP id adf61e73a8af0-389823ccaeamr1702228637.75.1767681021396;
        Mon, 05 Jan 2026 22:30:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29592sm1233261a12.22.2026.01.05.22.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 22:30:20 -0800 (PST)
Date: Tue, 6 Jan 2026 14:26:45 +0800
From: Coiby Xu <coxu@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Thomas Staudt <tstaudt@de.ibm.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aVyqc_0FALlTV8Ad@Rk>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <e32554c8-774e-416d-92e4-306aec42b953@linux.ibm.com>
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
In-Reply-To: <e32554c8-774e-416d-92e4-306aec42b953@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UziHo2EdWG0ggqo77AJ5Hvaj4rBQgMNytF9R72w1BvM_1767681022
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 01, 2026 at 08:36:09PM +0530, Sourabh Jain wrote:
>
>
>On 26/12/25 19:36, Coiby Xu wrote:
>>Based on the CONFIG_CRASH_DM_CRYPT feature, this patch adds
>>LUKS-encrypted device dump target support to PowerPC by addressing two
>>challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>>1st kernel will build up the kernel command parameter dmcryptkeys as
>>similar to elfcorehdr to pass the memory address of the stored info of
>>dm-crypt keys to the kdump kernel.
>>
>>[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>>
>>Cc: Thomas Staudt <tstaudt@de.ibm.com>
>>Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>>Cc: Baoquan he <bhe@redhat.com>
>>Cc: Dave Young <dyoung@redhat.com>
>>Cc: Kairui Song <ryncsn@gmail.com>
>>Cc: Pingfan Liu <kernelfans@gmail.com>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Signed-off-by: Coiby Xu <coxu@redhat.com>
>>---
>>  arch/powerpc/include/asm/kexec.h |  3 ++-
>>  arch/powerpc/kexec/elf_64.c      | 26 +++++++++++++++++++++++++-
>>  arch/powerpc/kexec/file_load.c   | 19 +++++++++++--------
>>  3 files changed, 38 insertions(+), 10 deletions(-)
>>
>>diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>>index bd4a6c42a5f3..f3d098d543b4 100644
>>--- a/arch/powerpc/include/asm/kexec.h
>>+++ b/arch/powerpc/include/asm/kexec.h
>>@@ -80,7 +80,8 @@ struct kimage_arch {
>>  };
>>  char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
>>-			  unsigned long cmdline_len);
>>+			  unsigned long cmdline_len,
>>+			  char *name, unsigned long addr);
>>  int setup_purgatory(struct kimage *image, const void *slave_code,
>>  		    const void *fdt, unsigned long kernel_load_addr,
>>  		    unsigned long fdt_load_addr);
>>diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
>>index 5d6d616404cf..57cb3361d91b 100644
>>--- a/arch/powerpc/kexec/elf_64.c
>>+++ b/arch/powerpc/kexec/elf_64.c
>>@@ -81,13 +81,37 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
>>  		/* Setup cmdline for kdump kernel case */
>>  		modified_cmdline = setup_kdump_cmdline(image, cmdline,
>>-						       cmdline_len);
>>+						       cmdline_len,
>>+						       "elfcorehdr",
>>+						       image->elf_load_addr);
>>  		if (!modified_cmdline) {
>>  			pr_err("Setting up cmdline for kdump kernel failed\n");
>>  			ret = -EINVAL;
>>  			goto out;
>>  		}
>>  		cmdline = modified_cmdline;
>>+		cmdline_len = strlen(cmdline) + 1;
>>+
>>+		ret = crash_load_dm_crypt_keys(image);
>>+		if (ret == -ENOENT) {
>>+			kexec_dprintk("No dm crypt key to load\n");
>>+		} else if (ret) {
>>+			pr_err("Failed to load dm crypt keys\n");
>>+			return ERR_PTR(ret);
>>+		}
>>+
>>+		if (image->dm_crypt_keys_addr != 0) {
>>+			modified_cmdline = setup_kdump_cmdline(image, cmdline,
>>+							       cmdline_len,
>>+							       "dmcryptkeys",
>>+							       image->dm_crypt_keys_addr);
>>+			if (!modified_cmdline) {
>>+				pr_err("Setting up cmdline for kdump kernel failed\n");
>>+				ret = -EINVAL;
>>+				goto out;
>>+			}
>>+			cmdline = modified_cmdline;
>>+		}
>>  	}
>>  	if (initrd != NULL) {
>>diff --git a/arch/powerpc/kexec/file_load.c b/arch/powerpc/kexec/file_load.c
>>index 4284f76cbef5..e1c08050286d 100644
>>--- a/arch/powerpc/kexec/file_load.c
>>+++ b/arch/powerpc/kexec/file_load.c
>>@@ -23,38 +23,41 @@
>>  #define SLAVE_CODE_SIZE		256	/* First 0x100 bytes */
>>  /**
>>- * setup_kdump_cmdline - Prepend "elfcorehdr=<addr> " to command line
>>+ * setup_kdump_cmdline - Prepend "<name>=<addr> " to command line
>>   *                       of kdump kernel for exporting the core.
>>   * @image:               Kexec image
>>   * @cmdline:             Command line parameters to update.
>>   * @cmdline_len:         Length of the cmdline parameters.
>>+ * @name:                Name e.g elfcorehdr.
>>+ * @addr:                Memory address.
>>   *
>>   * kdump segment must be setup before calling this function.
>>   *
>>   * Returns new cmdline buffer for kdump kernel on success, NULL otherwise.
>>   */
>>  char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
>>-			  unsigned long cmdline_len)
>>+			  unsigned long cmdline_len,
>>+			  char *name, unsigned long addr)
>>  {
>>-	int elfcorehdr_strlen;
>>+	unsigned long parameter_len;
>>  	char *cmdline_ptr;
>>  	cmdline_ptr = kzalloc(COMMAND_LINE_SIZE, GFP_KERNEL);
>>  	if (!cmdline_ptr)
>>  		return NULL;
>>-	elfcorehdr_strlen = sprintf(cmdline_ptr, "elfcorehdr=0x%lx ",
>>-				    image->elf_load_addr);
>>+	parameter_len = sprintf(cmdline_ptr, "%s=0x%lx ", name, addr);
>>-	if (elfcorehdr_strlen + cmdline_len > COMMAND_LINE_SIZE) {
>>-		pr_err("Appending elfcorehdr=<addr> exceeds cmdline size\n");
>>+	if (parameter_len + cmdline_len > COMMAND_LINE_SIZE) {
>>+		pr_err("Appending %s=<addr> exceeds cmdline size\n", name);
>>  		kfree(cmdline_ptr);
>>  		return NULL;
>>  	}
>>-	memcpy(cmdline_ptr + elfcorehdr_strlen, cmdline, cmdline_len);
>>+	memcpy(cmdline_ptr + parameter_len, cmdline, cmdline_len);
>>  	// Ensure it's nul terminated
>>  	cmdline_ptr[COMMAND_LINE_SIZE - 1] = '\0';
>>+	kfree(cmdline);
>
>When setup_kdump_cmdline() is called for elfcorehdr, cmdline holds the
>same pointer as image->cmdline_buf. Freeing it here may therefore
>cause issues, right?

Yes, you are right, I'll drop the above kfree in next version.

>
>Currently, image->cmdline_buf is not used after calling the
>architecture-specific load function (elf64_load on powerpc).
>However, kimage_file_post_load_cleanup() later calls kfree() on
>the same address.

I missed kimage_file_post_load_cleanup. Thanks for pointing it out!


-- 
Best regards,
Coiby


