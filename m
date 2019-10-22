Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C400DE0E9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 01:41:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yVQ54SQhzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 10:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yVM5002RzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 10:38:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="iJS0BO5Z"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46yVM31RNnz9sPV; Wed, 23 Oct 2019 10:38:39 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46yVM30KZ7z9sP3;
 Wed, 23 Oct 2019 10:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1571787519;
 bh=ami4f9vYKglFSg2kDdmqUNRGc0PgB16FBNgszZYiGT8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iJS0BO5Zt/5UnZpboy9Fexepcv5UxfOTmUBHzEbwB/BblzxTYNspikCD5UaCMR91e
 f15rhAPDNUBW6y4Tor1tzB4i77fVRALpb+PgigrOTkMVHa+fLDz6+teRjwks8R2K4H
 BA3jub/ckFJsXyIIybAF0gIbX7nsDILWm6ncQ4PGN6N0MSZ2C1r69Aj3sigiDO+5h7
 MsBi7VOWstM54ck9npR7g7Wfo7iru0Ovs8QwCVdCbtR4OyLbOlonmHCazRoiHaeLeO
 p6OcrSNJoTAmwzTF55V8Tax4wHJ1+SWFIfY/bWTPzDZFBdJDXxofABlAUaB2BijTsE
 nJNwdofapNTKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 linux-efi@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v8 3/8] powerpc: detect the trusted boot state of the
 system
In-Reply-To: <1571508377-23603-4-git-send-email-nayna@linux.ibm.com>
References: <1571508377-23603-1-git-send-email-nayna@linux.ibm.com>
 <1571508377-23603-4-git-send-email-nayna@linux.ibm.com>
Date: Wed, 23 Oct 2019 10:38:38 +1100
Message-ID: <87wocw5p1d.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Prakhar Srivastava <prsriva02@gmail.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver O'Halloran <oohall@gmail.com>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/secure_boot.c b/arch/powerpc/kernel/secure_boot.c
> index 99bba7915629..9753470ab08a 100644
> --- a/arch/powerpc/kernel/secure_boot.c
> +++ b/arch/powerpc/kernel/secure_boot.c
> @@ -28,3 +39,16 @@ bool is_ppc_secureboot_enabled(void)
>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>  	return enabled;
>  }
> +
> +bool is_ppc_trustedboot_enabled(void)
> +{
> +	struct device_node *node;
> +	bool enabled = false;
> +
> +	node = get_ppc_fw_sb_node();
> +	enabled = of_property_read_bool(node, "trusted-enabled");

Also here you need:

	of_node_put(node);

> +
> +	pr_info("Trusted boot mode %s\n", enabled ? "enabled" : "disabled");
> +
> +	return enabled;
> +}

cheers
