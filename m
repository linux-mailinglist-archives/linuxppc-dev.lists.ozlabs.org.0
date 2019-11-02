Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 84950ECE4C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 12:13:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474xHn5bghzF6Jh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 22:13:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474xFb4SwXzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 22:11:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="T/MCO/BR"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 474xFY5d8Mz9sP4;
 Sat,  2 Nov 2019 22:11:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572693074;
 bh=NS4Uwf3f2SlEFweKKuQjMnasaNcZD4cQVhKKg7qXM58=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=T/MCO/BR3ehdvw2jMjuWoHynChhENWC/XRCsh1eI0cUZtgukg0W9xMxD1Pl5Oh8CI
 i4A/kqsJ6rXxacU9cI6R4h83O5xeTWVCiF2qmYuQktap9JCOzzbzh9nvcLUe8Y8xuR
 LMxrhJyNbKIWA9FIW1joIRaSgYllaSBP0DczOgt7CxIwhr1nGox+g3FPKZp0pbL/iC
 0PFSoXhv3mVlV56nl5rWfmZII93PmsoQ5EVmTMnCIp9kHzflFHCqNvgrhyiRcJvEwg
 s25SOiBqs6DOCtRNXzWKswqmzTnDwZ5XQTDZrcbnKpZPjjPyj4ZWFFr3BU8AXAG/y2
 DjrBPfqfc6Xww==
From: Michael Ellerman <mpe@ellerman.id.au>
To: asteinhauser@google.com, benh@kernel.crashing.org, paulus@samba.org,
 diana.craciun@nxp.com
Subject: Re: [PATCH] L1TF support in PowerPC SYSFS.
In-Reply-To: <20191029190759.84821-1-asteinhauser@google.com>
References: <20191029190759.84821-1-asteinhauser@google.com>
Date: Sat, 02 Nov 2019 22:11:13 +1100
Message-ID: <87zhhe1qjy.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anthony Steinhauser <asteinhauser@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Anthony,

Thanks for the patch.

asteinhauser@google.com writes:
> From: Anthony Steinhauser <asteinhauser@google.com>
>
> PowerPC CPUs are vulnerable to L1TF to the same extent as to Meltdown.
> It is also mitigated by flushing the L1D on privilege transition.
> Currently the SYSFS gives a false negative on L1TF on CPUs that I verified
> to be vulnerable.

Can you include the details of which CPUs you tested?

> https://www.ibm.com/blogs/psirt/potential-impact-processors-power-family/
> https://github.com/google/safeside/pull/52
> Signed-off-by: Anthony Steinhauser <asteinhauser@google.com>
> ---

I don't usually retain links in the change log, because they bit rot, so
I'll drop those, but they will remain in the email archive.

> diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
> index 7cfcb294b11c..a1a5017c5170 100644
> --- a/arch/powerpc/kernel/security.c
> +++ b/arch/powerpc/kernel/security.c
> @@ -135,7 +135,8 @@ void setup_spectre_v2(void)
>  #endif /* CONFIG_PPC_FSL_BOOK3E */
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> -ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
> +static ssize_t cpu_show_delayed_fault_common(

I guess that's an accurate name.

I probably would have just had cpu_show_l1tf() call cpu_show_meltdown(),
but I guess either approach is fine.

cheers


> @@ -167,6 +168,16 @@ ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, cha
>  
>  	return sprintf(buf, "Vulnerable\n");
>  }
> +
> +ssize_t cpu_show_l1tf(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return cpu_show_delayed_fault_common(dev, attr, buf);
> +}
> +
> +ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	return cpu_show_delayed_fault_common(dev, attr, buf);
> +}
>  #endif
>  
>  ssize_t cpu_show_spectre_v1(struct device *dev, struct device_attribute *attr, char *buf)
> -- 
> 2.24.0.rc0.303.g954a862665-goog
