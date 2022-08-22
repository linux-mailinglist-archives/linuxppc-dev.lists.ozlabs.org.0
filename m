Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C46959C59B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 19:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBKrQ14MVz3chX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 03:59:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBKr25BGLz3blf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 03:59:28 +1000 (AEST)
Received: by mail-oi1-f169.google.com with SMTP id j5so13109910oih.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 10:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=3TuVf54GgPydYoGd51XaXL3tfz0KadvwC9z8/Fy+sls=;
        b=tvijujW8bHhMgScE9YhJ0kT3Uj0hLTITCJUBkgMjLzeFdmYcbOqi3OKlVs7vDBNG37
         YF3i1JSRlCDpTB24C/z3+C5tNQ/KFoCgDPHdtmSfmBvmMnMSMwV1kNluRG+xSlIYi7dk
         qAqMjaE3ibKXlknzsdFi/o3IdLye2jfLQgMbQzyh3KQbdFu40Ejr7u48HEaRaITGaV3w
         JsVuw6oupoOS8kFQ04i0cDa6VsWBEuUqZVXASN9cIrYAzeh1YVnG1PLeTGB7cyvIiRpk
         4sUQah9TZBBPN8rN+Cb8TB5o4uyzF6/0uWX25hn8OzYnRE3ecSZGYJf5tnHhr9t/i244
         gSKg==
X-Gm-Message-State: ACgBeo3byxBjImGzyRpfygJq0HSRYHCJki1znL11cQZlxtHv+P31HHRW
	WwDzjfOMxR987VBnfceIxiiCzWCZGg==
X-Google-Smtp-Source: AA6agR602WMERbYZ3uSCPQSQ/AhC9EWTsVLdvnnS5HXY696Jr8IN6ZBdolcGmNue7hlW5WqBeaMdnQ==
X-Received: by 2002:a05:6808:302b:b0:2f9:eeef:f03 with SMTP id ay43-20020a056808302b00b002f9eeef0f03mr11736503oib.128.1661191166666;
        Mon, 22 Aug 2022 10:59:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r11-20020a4a964b000000b0041b49c19a00sm2478019ooi.18.2022.08.22.10.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 10:59:26 -0700 (PDT)
Received: (nullmailer pid 62586 invoked by uid 1000);
	Mon, 22 Aug 2022 17:59:24 -0000
Date: Mon, 22 Aug 2022 12:59:24 -0500
From: Rob Herring <robh@kernel.org>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v7 6/6] tpm/kexec: Duplicate TPM measurement log in
 of-tree for kexec
Message-ID: <20220822175924.GA62553-robh@kernel.org>
References: <20220812164305.2056641-1-stefanb@linux.ibm.com>
 <20220812164305.2056641-7-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220812164305.2056641-7-stefanb@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nageswara R Sastry <rnsastry@linux.ibm.com>, nayna@linux.ibm.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, nasastry@in.ibm.com, Eric Biederman <ebiederm@xmission.com>, linux-integrity@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Aug 2022 12:43:05 -0400, Stefan Berger wrote:
> The memory area of the TPM measurement log is currently not properly
> duplicated for carrying it across kexec when an Open Firmware
> Devicetree is used. Therefore, the contents of the log get corrupted.
> Fix this for the kexec_file_load() syscall by allocating a buffer and
> copying the contents of the existing log into it. The new buffer is
> preserved across the kexec and a pointer to it is available when the new
> kernel is started. To achieve this, store the allocated buffer's address
> in the flattened device tree (fdt) under the name linux,tpm-kexec-buffer
> and search for this entry early in the kernel startup before the TPM
> subsystem starts up. Adjust the pointer in the of-tree stored under
> linux,sml-base to point to this buffer holding the preserved log. The TPM
> driver can then read the base address from this entry when making the log
> available. Invalidate the log by removing 'linux,sml-base' from the
> devicetree if anything goes wrong with updating the buffer.
> 
> Use subsys_initcall() to call the function to restore the buffer even if
> the TPM subsystem or driver are not used. This allows the buffer to be
> carried across the next kexec without involvement of the TPM subsystem
> and ensures a valid buffer pointed to by the of-tree.
> 
> Use the subsys_initcall(), rather than an ealier initcall, since
> page_is_ram() in get_kexec_buffer() only starts working at this stage.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Eric Biederman <ebiederm@xmission.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> 
> ---
> v6:
>  - Define prototype for tpm_add_kexec_buffer under same config options
>    as drivers/of/kexec.c is compiled, provide inline function otherwise.
>    (kernel test robot)
> 
> v4:
>  - Added #include <linux/vmalloc.h> due to parisc
>  - Use phys_addr_t for physical address rather than void *
>  - Remove linux,sml-base if the buffer cannot be updated after a kexec
>  - Added __init to functions where possible
> ---
>  drivers/of/kexec.c    | 216 +++++++++++++++++++++++++++++++++++++++++-
>  include/linux/kexec.h |   6 ++
>  include/linux/of.h    |   9 +-
>  kernel/kexec_file.c   |   6 ++
>  4 files changed, 234 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
