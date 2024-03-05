Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFC3871197
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 01:21:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BVjHMaxv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpbpj1x0Gz3dWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 11:21:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BVjHMaxv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpbnz5d04z30NP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 11:21:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709598069;
	bh=KzZciJi7O7W57jus900aVIrlFHf+alGTZHweec28dLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BVjHMaxvPaNoqGMtWDEj1/UZdE/dzgDpPGRr9pdQc7gzGzu5kuVcP23S0vjIW1hEF
	 1sUquGXaye0k9mQ4kuZC+Z8KyBHXo2Cm18hCaJw99V08nOpDdqGPXqOPW2L/fnsV+D
	 HlDO0mdalo8ITd+8aMGj3LHNLd0J67BAYgb4OGEdGPISMOLFSg6mj5aHZP4D7SLVeZ
	 jWibFrQQGD27EYMGXHxlUAYzzVYyFz6ALW6anfzXVqeLg7t8zE1XHtyzgjLDbReYZ6
	 TjSVUAn9dQURKkPQHad/JLVLLfY3t65skoOcBMDe60iQAO3UxkwHTOG2ucKp2tm9jN
	 0Axwdn177LeRQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tpbnx56kQz4wcF;
	Tue,  5 Mar 2024 11:21:09 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: fix max polling time in
 plpks_confirm_object_flushed() function
In-Reply-To: <20240304065326.787453-1-nayna@linux.ibm.com>
References: <20240304065326.787453-1-nayna@linux.ibm.com>
Date: Tue, 05 Mar 2024 11:21:08 +1100
Message-ID: <87il21plzf.fsf@mail.lhotse>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, npiggin@gmail.com, Nageswara R Sastry <rnsastry@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nayna Jain <nayna@linux.ibm.com> writes:
> usleep_range() function takes input time and range in usec. However,
> currently it is assumed in msec in the function
> plpks_confirm_object_flushed().
>
> Fix the total polling time for the object flushing from 5msec to 5sec.
>
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/plpks.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
> index 23b77027c916..8721d97f32c1 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -44,9 +44,9 @@
>  #define PLPKS_MAX_DATA_SIZE		4000
>  
>  // Timeouts for PLPKS operations
> -#define PLPKS_MAX_TIMEOUT		5000 // msec
> -#define PLPKS_FLUSH_SLEEP		10 // msec
> -#define PLPKS_FLUSH_SLEEP_RANGE		400
> +#define PLPKS_MAX_TIMEOUT		5000000 // usec
> +#define PLPKS_FLUSH_SLEEP		5000 // usec
> +#define PLPKS_FLUSH_SLEEP_RANGE		5000

It would be simpler if you used fsleep, eg:

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 23b77027c916..b2d419eff9cd 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -44,9 +44,8 @@
 #define PLPKS_MAX_DATA_SIZE		4000
 
 // Timeouts for PLPKS operations
-#define PLPKS_MAX_TIMEOUT		5000 // msec
-#define PLPKS_FLUSH_SLEEP		10 // msec
-#define PLPKS_FLUSH_SLEEP_RANGE		400
+#define PLPKS_MAX_TIMEOUT		5 * USEC_PER_SEC
+#define PLPKS_FLUSH_SLEEP		10000 // usec
 
 struct plpks_var {
 	char *component;
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index febe18f251d0..bcfcd5acc5c2 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -415,8 +415,7 @@ static int plpks_confirm_object_flushed(struct label *label,
 			break;
 		}
 
-		usleep_range(PLPKS_FLUSH_SLEEP,
-			     PLPKS_FLUSH_SLEEP + PLPKS_FLUSH_SLEEP_RANGE);
+		fsleep(PLPKS_FLUSH_SLEEP);
 		timeout = timeout + PLPKS_FLUSH_SLEEP;
 	} while (timeout < PLPKS_MAX_TIMEOUT);
 


cheers
