Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F377874C92
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 11:42:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SSkWN/Cs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr5TX6XBHz3vb6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 21:42:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SSkWN/Cs;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr5Sr2gZ9z3cJW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 21:41:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709808092;
	bh=QHwyFDcupjhTArKQOMkjJ6sLtDVOUhAmTuA0clhv4wM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SSkWN/CsUdTccQiVHbYQloY9qgzNHOhp2tWHvvoiKfSTW/OXDLdNJfX0VnHwmCfk3
	 gtXjChFioqzzrlQZsgsma3C+QfV75e2zWgTRiuV2A33jW2W9DJDl2k/5DCfHf2s97R
	 CtqUlxkXS5agv/jFDIXkpHkq/5X5/uPmaG5wSA+MM2l+xj1lu3ST142FhSKunOHswc
	 cJ3cFlZHsZFtw5Xrvnba1Eo55c7kG6lwjb+21AQgqP1izxedl6YQ+k81o8+Q6TPQcv
	 T05V3+iI3v1B70IsNm853jwb7VnOmpgMkd7Gh0fj5PxJ8JyKFdoSxGZAbRd7SS75ad
	 c6F7yI7FwY3IA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr5Sr1LbWz4wc5;
	Thu,  7 Mar 2024 21:41:32 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stefan Berger <stefanb@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/prom_init: Replace linux,sml-base/sml-size
 with linux,sml-log
In-Reply-To: <20240306155511.974517-2-stefanb@linux.ibm.com>
References: <20240306155511.974517-1-stefanb@linux.ibm.com>
 <20240306155511.974517-2-stefanb@linux.ibm.com>
Date: Thu, 07 Mar 2024 21:41:31 +1100
Message-ID: <87jzmenx2c.fsf@mail.lhotse>
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
Cc: rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org, jarkko@kernel.org, peterhuewe@gmx.de, viparash@in.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Berger <stefanb@linux.ibm.com> writes:
> linux,sml-base holds the address of a buffer with the TPM log. This
> buffer may become invalid after a kexec and therefore embed the whole TPM
> log in linux,sml-log. This helps to protect the log since it is properly
> carried across a kexec with both of the kexec syscalls.
>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  arch/powerpc/kernel/prom_init.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index e67effdba85c..41268c30de4c 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -1956,12 +1956,8 @@ static void __init prom_instantiate_sml(void)
>  
>  	reserve_mem(base, size);
>  
> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-base",
> -		     &base, sizeof(base));
> -	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-size",
> -		     &size, sizeof(size));
> -
> -	prom_debug("sml base     = 0x%llx\n", base);
> +	prom_setprop(ibmvtpm_node, "/vdevice/vtpm", "linux,sml-log",
> +		     (void *)base, size);

As we discussed via chat, doing it this way sucks the full content of
the log back into Open Firmware. 

That relies on OF handling such big properties, and also means more
memory will be consumed, which can cause problems early in boot.

A better solution is to explicitly add the log to the FDT in the
flattening phase.

Also adding the new linux,sml-log property should be accompanied by a
change to the device tree binding.

The syntax is not very obvious to me, but possibly something like?

diff --git a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
index 50a3fd31241c..cd75037948bc 100644
--- a/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
+++ b/Documentation/devicetree/bindings/tpm/ibm,vtpm.yaml
@@ -74,8 +74,6 @@ required:
   - ibm,my-dma-window
   - ibm,my-drc-index
   - ibm,loc-code
-  - linux,sml-base
-  - linux,sml-size
 
 allOf:
   - $ref: tpm-common.yaml#
diff --git a/Documentation/devicetree/bindings/tpm/tpm-common.yaml b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
index 3c1241b2a43f..616604707c95 100644
--- a/Documentation/devicetree/bindings/tpm/tpm-common.yaml
+++ b/Documentation/devicetree/bindings/tpm/tpm-common.yaml
@@ -25,6 +25,11 @@ properties:
       base address of reserved memory allocated for firmware event log
     $ref: /schemas/types.yaml#/definitions/uint64
 
+  linux,sml-log:
+    description:
+      Content of firmware event log
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+
   linux,sml-size:
     description:
       size of reserved memory allocated for firmware event log
@@ -53,15 +58,22 @@ dependentRequired:
   linux,sml-base: ['linux,sml-size']
   linux,sml-size: ['linux,sml-base']
 
-# must only have either memory-region or linux,sml-base
+# must only have either memory-region or linux,sml-base/size or linux,sml-log
 # as well as either resets or reset-gpios
 dependentSchemas:
   memory-region:
     properties:
       linux,sml-base: false
+      linux,sml-log: false
   linux,sml-base:
     properties:
       memory-region: false
+      linux,sml-log: false
+  linux,sml-log:
+    properties:
+      memory-region: false
+      linux,sml-base: false
+      linux,sml-size: false
   resets:
     properties:
       reset-gpios: false


cheers
