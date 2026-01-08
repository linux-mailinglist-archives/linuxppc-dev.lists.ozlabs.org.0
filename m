Return-Path: <linuxppc-dev+bounces-15414-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C12ED0223F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 11:35:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn1Wl3K4jz2yGq;
	Thu, 08 Jan 2026 21:35:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767868531;
	cv=none; b=cXRdi9glvh0i1c4xyNbqJjgumUHlLAaDyktXpKS/AyHGs+zc5QuMUP7U39nhZCpzi7/e7ove72MSu3NuDkrGYPvaV2t4bmCMLGJn+fJvgHZKuq3F8vmFrUHzpnSiwUSg4JOojF6/VwBbe/R32x2zyM/XEXf/WUnbPpOwjy+tVr3PzUHRYYTjgEDTwx23nGLBHnHaIKID+KDDu/YdapPTlv0JhXKulMuuMSi6NohEREBPzORFfD+bq5XrtttlG/8AXr+myaPrc2nKDkur6ZVL/nsl/hoVIKNdWDZ++dZRMGvHRaJKOpJPBqIXSDC5co67RNSdDWRR2TDMuQ15srUHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767868531; c=relaxed/relaxed;
	bh=Q4CgrKoI+gqPjZdUskKAdxCjFm05f46fwS6i3N+5Edg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=gg4FA0xTVTKdb9P252TIsPBlbE0uFJPb2KmLPbLpIdW3Ha2qCCvBnbdtMejU+XwHb5/0UG3OcSnreCQAlCZ3weMFvdPVZ1J6MrUnNNDnusXXFfYX2dbLA7XD2Pm1YdkwwYR4fMr8MbqmQvMkoAOPoY50sSLRVMnsBMC5kO3NtQWUVCV8lqiBZSl/7QnsvV/AsYPSEh3WhgRjvxp3yRJkLCzkeHCbZU5dWI3MrRggw51Ibzsh5fkAJhSvTk7Y6ZIxaUvi2rJm6ofvKWUX6JcsQGbk5qE/rPBmqpK6PVScz75A2wwE//bni/vo3tCdtA1ruLAfpzK0a1G1AlzbH5roKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a6iNZwtw; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dmVrA472; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a6iNZwtw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dmVrA472;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=coxu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn1Wk0W58z2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 21:35:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767868524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4CgrKoI+gqPjZdUskKAdxCjFm05f46fwS6i3N+5Edg=;
	b=a6iNZwtwj68FrR08CGGPfZQ7h7LczQZi0bEvFPAPHNsQ5XLUOA85kAXGfzM1mMJV/9y+h5
	8Z5fZ8Q1fLiPupAkIRy0eR5k8/1Uq8NcCt/5UyJRMQw91/AMJp+0ukf8EIy+A55W5sxZ43
	UQpzbIqWWM7Xg0xzxzk97gZF5CvyrOw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767868525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q4CgrKoI+gqPjZdUskKAdxCjFm05f46fwS6i3N+5Edg=;
	b=dmVrA472Ul3dmgy2uK3nxATiHJrFrQe19E11oyCWt6hLrLbciVOVX/e9FeFSct7QfzqiFi
	esR0E94jvN8ZlCWf4g6DRtTmQ1Oby2Af8mV9NGcJHZ0/fyPMV7LA8bCV7U79qSfoRpK/hd
	wr1dE3X/BXoX7grrOHfhldnLG9IV6VQ=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-a38zh-fbPqaOs9EHCLVfwA-1; Thu, 08 Jan 2026 05:35:23 -0500
X-MC-Unique: a38zh-fbPqaOs9EHCLVfwA-1
X-Mimecast-MFC-AGG-ID: a38zh-fbPqaOs9EHCLVfwA_1767868522
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f1f79d6afso45636725ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 02:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868522; x=1768473322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4CgrKoI+gqPjZdUskKAdxCjFm05f46fwS6i3N+5Edg=;
        b=RHrnZqDWORaGbhOrp6HzjqWd+7pSMQ6/j8jon9+OM0/45S3z802uQJiZfce87OAtYV
         qzvWEQHgyy4rPPkPIv/U7Q475IRRTMR1NVBNCxdExEnv9F9o93xGHppaacwmBySTY6G2
         cbWvn3QFp0hrMlWqq235Q7ChU214E4ojGcNrCjdamZZlHxulGBYa95PqYtVbYPtUcD8J
         ySMimCjbzSQTHo1Q9QiHmM/bQFUqhUrKc6LCCsAf9MMB1cKIX+y+MLGgGLR3dy24atCL
         S//7fk+NhGqcVBu2/kb/S19Cd+ayGPeFm6gq8ln5EZxQKGB2WVPvJI3cYNQtomBl066K
         rBiA==
X-Forwarded-Encrypted: i=1; AJvYcCUdEYNAnfC0JVDsw5INgjAm4IqgaSzZsmHSLMBcfysiSz7dkvekcWFNF5wIzyH0oKBNLFsveRNE3v+RJ5c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywbln+QfsVUUb8XJTmCPUMFX39kHEJX8iV7vInM0AcxFOetI0N0
	0txzY5JLU9s1wMlkvittDPCbFvwYELHZsIpLiuAtuXqMn+dFnLFaQ3aSvrdYoVUvu8DP68KJwS1
	bLX7IjJ0Xms36GGpYof18i5ruh20X5+1OTZzhCARGGChr78qB682O6e0iCcS/gjnRk18=
X-Gm-Gg: AY/fxX5jnJpoKP4wufYzs/WGa28LhQLJkM1tELA8dOYbT7ZjKEbkQmnGfIm+quRumVW
	DEcbBETsBmx8YhpUPaxZiYKUdsLfXG4G9Hni4JVfvZptBLyX3DP2/qoriqIbDeYtlybeUnNwt+Z
	V8IkLRHMln/mm8uxHk9jR4/n6JQrdcNMGqT7HBN+ylrk6XmIWqvT5Y0vQJ7XTEs7m6KYM/60EW0
	XW4RvNtmo1oH1ASG+8m9zpeuyQPzqcBkVDsJD7oIg+Djx+hWMcT4CqnhM8pIrjQU+xGkVhc9k9w
	faKwpHZ/tVHQOSHxYbzi5qK5x857WsfZRQFPt2ndNolYAo3SynYg1CY+2uwCb2ghVfJwuySVLgD
	J
X-Received: by 2002:a17:903:46c5:b0:2a3:e89c:593e with SMTP id d9443c01a7336-2a3ee41f181mr62398185ad.4.1767868522223;
        Thu, 08 Jan 2026 02:35:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWb7Nq1EAzfMOaDGj/G/lGftVbslZgXtHq29CNW23TT+aB3wwbYZDR2hEBzPzfJM832bE6sw==
X-Received: by 2002:a17:903:46c5:b0:2a3:e89c:593e with SMTP id d9443c01a7336-2a3ee41f181mr62397775ad.4.1767868521555;
        Thu, 08 Jan 2026 02:35:21 -0800 (PST)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c2bsm74465035ad.26.2026.01.08.02.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:35:21 -0800 (PST)
Date: Thu, 8 Jan 2026 18:32:55 +0800
From: Coiby Xu <coxu@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	Thomas Staudt <tstaudt@de.ibm.com>, Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>, 
	Baoquan he <bhe@redhat.com>, Dave Young <dyoung@redhat.com>, Kairui Song <ryncsn@gmail.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Vivek Goyal <vgoyal@redhat.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] powerpc/kdump: pass dm-crypt keys to kdump kernel
Message-ID: <aV5F-T1nNumTTdgK@Rk>
References: <20251226140636.1378505-1-coxu@redhat.com>
 <20260106074039.564707-1-coxu@redhat.com>
 <9aa592c9-c766-4aac-a60c-25dd5c2f143d@linux.ibm.com>
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
In-Reply-To: <9aa592c9-c766-4aac-a60c-25dd5c2f143d@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gp0A4nbo-_7qLIgq_ojxmwXk92q3LnQ-xBQmJFhsODA_1767868522
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 02:32:41PM +0530, Sourabh Jain wrote:
>
>
>On 06/01/26 13:10, Coiby Xu wrote:
>>CONFIG_CRASH_DM_CRYPT has been introduced to support LUKS-encrypted
>>device dump target by addressing two challenges [1],
>>  - Kdump kernel may not be able to decrypt the LUKS partition. For some
>>    machines, a system administrator may not have a chance to enter the
>>    password to decrypt the device in kdump initramfs after the 1st kernel
>>    crashes
>>
>>  - LUKS2 by default use the memory-hard Argon2 key derivation function
>>    which is quite memory-consuming compared to the limited memory reserved
>>    for kdump.
>>
>>To also enable this feature for PowerPC, we only need to let 1st kernel
>>build up the kernel command parameter dmcryptkeys as similar to
>>elfcorehdr to pass the memory address of the stored info of dm-crypt
>>keys to the kdump kernel.
>>
>>Note to avoid a building failure [2] caused by undeclared function
>>crash_load_dm_crypt_keys when CONFIG_CRASH_DUMP is not enabled,
>>realign the function declaration with CONFIG_CRASH_DM_CRYPT.
>>
>>[1] https://lore.kernel.org/all/20250502011246.99238-1-coxu@redhat.com/
>>[2] https://lore.kernel.org/oe-kbuild-all/202512272218.ghBaSjzO-lkp@intel.com/
>>
>>Cc: Thomas Staudt <tstaudt@de.ibm.com>
>>Cc: Arnaud Lefebvre <arnaud.lefebvre@clever-cloud.com>
>>Cc: Baoquan he <bhe@redhat.com>
>>Cc: Dave Young <dyoung@redhat.com>
>>Cc: Kairui Song <ryncsn@gmail.com>
>>Cc: Pingfan Liu <kernelfans@gmail.com>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>Signed-off-by: Coiby Xu <coxu@redhat.com>
>>---
>>v2:
>>- fix double kfree issue [Sourabh]
>>- corretly kfree old modified_cmdline
>>- use imperative mood for commit message
>>- fix a compiling error caught by kernel test robot
>>
>>  arch/powerpc/include/asm/kexec.h |  3 ++-
>>  arch/powerpc/kexec/elf_64.c      | 27 ++++++++++++++++++++++++++-
>>  arch/powerpc/kexec/file_load.c   | 18 ++++++++++--------
>>  include/linux/crash_core.h       | 14 +++++++-------
>>  4 files changed, 45 insertions(+), 17 deletions(-)
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
>>index 5d6d616404cf..995d7e8e98e1 100644
>>--- a/arch/powerpc/kexec/elf_64.c
>>+++ b/arch/powerpc/kexec/elf_64.c
>>@@ -81,13 +81,38 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
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
>
>I have a limited understanding of the new dm-crypt keys, but the way they
>are loaded and the additional command-line options added for the kdump
>kernel look good to me.
>
>Feel free to add:
>Acked-by: Sourabh Jain <sourabhjain@linux.ibm.com>

Thanks for reviewing and acknowledging the patch!

-- 
Best regards,
Coiby


