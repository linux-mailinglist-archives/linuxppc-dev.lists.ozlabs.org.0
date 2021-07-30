Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7773DC122
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 00:35:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gc2KN3Xtcz30Dd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 08:35:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=UfW+Uyhy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=UfW+Uyhy; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gc2Jl3YyJz30BX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 08:34:45 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id l19so17340160pjz.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 15:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2B8bmMK1MWV0IKBzZFhJ4QQnRCCDWLQwwtmcrrRzShw=;
 b=UfW+Uyhy937lSOvlfCbvzUSHfPBdVvhcTOaILHqlmzjEQeZkE7CJS1pDjY85yLeTrk
 ZUbJvCXGnG9V4YR8YvLqiCoHxoAuC0RJHo8xznM5u3dhr6dkJI9BNq9mI/HgcDxL19UV
 T0+Bsg6O2a3etVDRUOMu6je3JU33B5pFqiYpolqwzc84ASrmmPyryuwH24+FPODl2NK0
 /jswqbw3cLYGC3s8tw+3+64iNj05CofMOCHjsjPmhNsSGF6fZGX5s2X6UpkAmOT82yEf
 KD+vMh5N6wzurqnoLV7GP3bDuQRiamzrkbH5J6wxueQVfjy9YKlsV1lqKUCTBLbTMy1G
 tbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2B8bmMK1MWV0IKBzZFhJ4QQnRCCDWLQwwtmcrrRzShw=;
 b=FR+rR2+7w76oNQFizChzGLmFfhwW0hfkvtp8oDHN4YYAYm1qNTOgPwttqCP6suTVio
 wGKZJJkn+nlyMBBBs2OH+Q0nwb/e6FYq0nw6VISd+95RDE66evSUjrqc/ZyIcbLq8nck
 OOtIeKKAb+m2659P4cMcwNYVmbM/gckTmB66Wb9fPVA+5flKJDq8zQszU3vABN1Rj+0e
 ibRCl6hiF20142JMIMVoLWPYEGwTIEK3+xNBjLBhGXNxY0VtaxgBqhMFvyEW6twswkLq
 TnwyFfNmJL1L5qAl5Hn3AJSTbsyX5nKjhuNvNATEFpXJl7PFR7fVo5Ve9LUl00tqbygp
 E64g==
X-Gm-Message-State: AOAM531O8AkGf6925xlMrHiZsw4zOmz9CGcZQrfisSYtZ+jbmwO/8u1S
 fn1mjDEH2rBsKWsDYhxIxxE5kw==
X-Google-Smtp-Source: ABdhPJzSqN3B7Go3MtNjE9VY5h0clk+hYXj3ladZ5/S+PnXE8W92M9c05HKB4nGF1ekuX4eoULgjrQ==
X-Received: by 2002:a17:90b:1bcc:: with SMTP id
 oa12mr5239612pjb.113.1627684481796; 
 Fri, 30 Jul 2021 15:34:41 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id b184sm3525033pfg.72.2021.07.30.15.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 15:34:41 -0700 (PDT)
Date: Fri, 30 Jul 2021 22:34:37 +0000
From: Sean Christopherson <seanjc@google.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH 07/11] treewide: Replace the use of mem_encrypt_active()
 with prot_guest_has()
Message-ID: <YQR+ffO92gMfGDbs@google.com>
References: <cover.1627424773.git.thomas.lendacky@amd.com>
 <029791b24c6412f9427cfe6ec598156c64395964.1627424774.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <029791b24c6412f9427cfe6ec598156c64395964.1627424774.git.thomas.lendacky@amd.com>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Ingo Molnar <mingo@redhat.com>, linux-graphics-maintainer@vmware.com,
 Dave Young <dyoung@redhat.com>, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 27, 2021, Tom Lendacky wrote:
> @@ -451,7 +450,7 @@ void __init mem_encrypt_free_decrypted_mem(void)
>  	 * The unused memory range was mapped decrypted, change the encryption
>  	 * attribute from decrypted to encrypted before freeing it.
>  	 */
> -	if (mem_encrypt_active()) {
> +	if (sme_me_mask) {

Any reason this uses sme_me_mask?  The helper it calls, __set_memory_enc_dec(),
uses prot_guest_has(PATTR_MEM_ENCRYPT) so I assume it's available?

>  		r = set_memory_encrypted(vaddr, npages);
>  		if (r) {
>  			pr_warn("failed to free unused decrypted pages\n");

