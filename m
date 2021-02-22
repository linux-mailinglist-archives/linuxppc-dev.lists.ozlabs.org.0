Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA440320F1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 02:32:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkPnK6f75z3cKS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 12:32:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RiKpsUd2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RiKpsUd2; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkPms5B0Dz30L6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 12:32:10 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id s6so10589365otk.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 17:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=urSTMy9t6cTiTrhHbL96lNEFLr5gM8etKvvG8YybOtM=;
 b=RiKpsUd2eg9pq2eKx9PgQDgKlS6S2TMP1cA6OmvM+0aHJN1D+Fxatx7zLPScl4ZvP1
 z0qfvtLpR+HDDilB8prIpl46msQycXNibiUYYCf1kto7cDyfvgtxVKRI9ZSyyvcl3ZKp
 6JBAGiAbBDBlaRu8DbGbpHN8pvSQ+rk81NktKSs/nBI+1M2aoBpkxjSBIkaFd8An7F12
 tFHljIX96wMyJpDhZO9594jJ13VQxiZjSjSnv1IBAor0PzRNmhjg0BWxLWZkBRd06PFD
 K7d/0XsrGKDw2UK+ViumxfVoK96HtpH/Sdl+TJkEgMQC8MGj+XmO3FBglsLneyIIE6YI
 G1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=urSTMy9t6cTiTrhHbL96lNEFLr5gM8etKvvG8YybOtM=;
 b=nGvAqD5NL8zb0lmqRHR7YXoG5WMzyf+TKZiRfebEdXAHhsCygaepoa7r0w+GH4tEF8
 QCV+GdHubv1GP7BMsuXa8wOtBDIMAR6ll0RQY8KNJiQwpXOCx+4j3/elZPFJMGE6j/s2
 oOHQdV74P+nWtNypST1IAYh54Zc1Gnbk0EJfZL61JokuuRqFsgquuYvbcYP/Y6zZMCxs
 FBVuTnDqFTpkVgIWmyvDXXqvacNqQ53CTj5SF7OzFw2fADZtB/TmCqW8a0cDd9f6wkat
 1vgtNsYySKkOSBqie1OBe3IP11AhFWcqeLV6wGR6AdmhIh9YhB35/dnSPsDXGH3JwnFG
 YVEA==
X-Gm-Message-State: AOAM532ejgg3ugSBcyZaoiBNJF0b3hjA6HqxWE4Pm3mRyB+6z6pLtYN4
 lEojplec9aAYqTrZU5s5+KU=
X-Google-Smtp-Source: ABdhPJy9/ek5tQDmOCC4jipCZCItMiaiSmbk31Qp56NGSfXHrJmQjQYbxDtf5G5zBFDY1OH+xstrXg==
X-Received: by 2002:a05:6830:3151:: with SMTP id
 c17mr1142078ots.194.1613957529125; 
 Sun, 21 Feb 2021 17:32:09 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id p3sm1046484otf.22.2021.02.21.17.32.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 21 Feb 2021 17:32:08 -0800 (PST)
Date: Sun, 21 Feb 2021 17:32:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
Subject: Re: [PATCH v18 03/11] of: Add a common kexec FDT setup function
Message-ID: <20210222013207.GA142216@roeck-us.net>
References: <20210213161049.6190-1-nramas@linux.microsoft.com>
 <20210213161049.6190-4-nramas@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210213161049.6190-4-nramas@linux.microsoft.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: mark.rutland@arm.com, tao.li@vivo.com, zohar@linux.ibm.com,
 paulus@samba.org, vincenzo.frascino@arm.com, frowand.list@gmail.com,
 sashal@kernel.org, robh@kernel.org, masahiroy@kernel.org, jmorris@namei.org,
 takahiro.akashi@linaro.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, serge@hallyn.com, devicetree@vger.kernel.org,
 pasha.tatashin@soleen.com, will@kernel.org, prsriva@linux.microsoft.com,
 hsinyi@chromium.org, allison@lohutok.net, christophe.leroy@c-s.fr,
 mbrugger@suse.com, balajib@linux.microsoft.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, james.morse@arm.com, dmitry.kasatkin@gmail.com,
 joe@perches.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 13, 2021 at 08:10:41AM -0800, Lakshmi Ramasubramanian wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Both arm64 and powerpc do essentially the same FDT /chosen setup for
> kexec.  The differences are either omissions that arm64 should have
> or additional properties that will be ignored.  The setup code can be
> combined and shared by both powerpc and arm64.
> 
> The differences relative to the arm64 version:
>  - If /chosen doesn't exist, it will be created (should never happen).
>  - Any old dtb and initrd reserved memory will be released.
>  - The new initrd and elfcorehdr are marked reserved.
>  - "linux,booted-from-kexec" is set.
> 
> The differences relative to the powerpc version:
>  - "kaslr-seed" and "rng-seed" may be set.
>  - "linux,elfcorehdr" is set.
>  - Any existing "linux,usable-memory-range" is removed.
> 
> Combine the code for setting up the /chosen node in the FDT and updating
> the memory reservation for kexec, for powerpc and arm64, in
> of_kexec_alloc_and_setup_fdt() and move it to "drivers/of/kexec.c".
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>

s390:allmodconfig:

drivers/of/kexec.c: In function 'of_kexec_alloc_and_setup_fdt':
drivers/of/kexec.c:378:10: error: 'const struct kimage' has no member named 'arch'
  378 |     image->arch.elf_load_addr,
      |          ^~
drivers/of/kexec.c:379:10: error: 'const struct kimage' has no member named 'arch'
  379 |     image->arch.elf_headers_sz);
      |          ^~
drivers/of/kexec.c:387:35: error: 'const struct kimage' has no member named 'arch'
  387 |   ret = fdt_add_mem_rsv(fdt, image->arch.elf_load_addr,
      |                                   ^~
drivers/of/kexec.c:388:16: error: 'const struct kimage' has no member named 'arch'
  388 |           image->arch.elf_headers_sz);
      |                ^~

Guenter
