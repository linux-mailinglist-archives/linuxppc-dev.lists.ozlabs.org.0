Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FA02000ED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 05:44:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p4Rt6TH2zDrNv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 13:44:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jsnitsel@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=FoA0KjGE; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WN+rRxzm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p4QC2qGPzDrM2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 13:42:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592538165;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=28QQhWqRGlKtVSPRIgoEL6SC7gfBRze3wXuD/kfRWpU=;
 b=FoA0KjGEjR0M9yDAP57y3hL/hldlee3AlTE97LtmsJix3ZAugUDR3U8DAQe3oxTarp3y8O
 DJss/P3TOuYQ0Cbgqy9oDaEy1A1tmNnbb7tMrbZ2OWE7lDJJJ+4RmQZaoBsnXkBYZdVaAZ
 ftSNnEH0BnjU6XmCVw9mgCxTha8udIY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592538166;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=28QQhWqRGlKtVSPRIgoEL6SC7gfBRze3wXuD/kfRWpU=;
 b=WN+rRxzmksvP5VX66uFFvznvSlY/ciG+XW9dOXSo/Bpqd62DmlCEzqkksgQyNIfnbwh0sx
 JCtY8b9DMokXvRTmTimPrIomKIbqmULJNcwJhyXizI9kfUGparTuK5Jcljkg1TYYYvUDnV
 f3S0q1vzI4Yhv1TtmgkPVAn2Xu76zPM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-3QLgnLn-NgibTaJNe2j5bw-1; Thu, 18 Jun 2020 23:42:43 -0400
X-MC-Unique: 3QLgnLn-NgibTaJNe2j5bw-1
Received: by mail-qt1-f197.google.com with SMTP id t24so6084596qtj.15
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 20:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=28QQhWqRGlKtVSPRIgoEL6SC7gfBRze3wXuD/kfRWpU=;
 b=ephVKEjHJ1t6ew5tQo5SPpPxRncT9LdUIau927jwKVwOtWTd6DtNvMR4XYk7y2pZSO
 nPkjPswMg0JmPKVGwHAbZPzE1l5mmKv0PLJX4KZz3dAeOqEsAb/E+xCSWr9mkuGIxj1g
 KzUZey1d0JUDTbn7FZ92vGclXEuOtYujiK0hagcdOySHHIqTS/xZo/P/3Y8a5OgH1qf0
 4ChRFYbXBP2gxs8s1abzMrUDgzXcZIr0Qi1akNw5E/eFSzRUQVtClI9d1SXMTZQK7YdY
 GBYpFXtcZ1Jv8UbA4WZZDiYDAPki01RtV1Y1n1jV2pBve8IXB0eFKeAPHprK7+jk0/xb
 Rbng==
X-Gm-Message-State: AOAM533sZQsfLGK4RSt1gXcZyKyuT6mA3YhkvzBKyg1afUX3F0Agdpbi
 J9nGjoS6E3yPRu9j7Fy4Q5YvWAVBshE+FkAEbJaA8HA8X2qho+STE/tYUOrdab0ztCAHEEMDqAi
 SvJWEetmySGheS7NKC17mnea1Ng==
X-Received: by 2002:a05:620a:1114:: with SMTP id
 o20mr1701680qkk.120.1592538163462; 
 Thu, 18 Jun 2020 20:42:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEdCt+tIxvWhB4ftv3tYaBoyyRuWID8OfhggBjQxCeKOfezWy9w7oOYhRS+zMVygilIx2xyg==
X-Received: by 2002:a05:620a:1114:: with SMTP id
 o20mr1701654qkk.120.1592538163097; 
 Thu, 18 Jun 2020 20:42:43 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id o144sm5112725qke.126.2020.06.18.20.42.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 20:42:42 -0700 (PDT)
Date: Thu, 18 Jun 2020 20:42:40 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCHv2] tpm: ibmvtpm: Wait for ready buffer before probing for
 TPM2 attributes
Message-ID: <20200619034240.xcl56oboxurym4jm@cantor>
Mail-Followup-To: David Gibson <david@gibson.dropbear.id.au>,
 jarkko.sakkinen@linux.intel.com, stefanb@linux.ibm.com,
 mpe@ellerman.id.au, peterhuewe@gmx.de, jgg@ziepe.ca,
 nayna@linux.ibm.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20200619033040.121412-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
In-Reply-To: <20200619033040.121412-1-david@gibson.dropbear.id.au>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: nayna@linux.ibm.com, linux-kernel@vger.kernel.org,
 jarkko.sakkinen@linux.intel.com, jgg@ziepe.ca, paulus@samba.org,
 peterhuewe@gmx.de, linuxppc-dev@lists.ozlabs.org,
 linux-integrity@vger.kernel.org, stefanb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 19 20, David Gibson wrote:
>The tpm2_get_cc_attrs_tbl() call will result in TPM commands being issued,
>which will need the use of the internal command/response buffer.  But,
>we're issuing this *before* we've waited to make sure that buffer is
>allocated.
>
>This can result in intermittent failures to probe if the hypervisor / TPM
>implementation doesn't respond quickly enough.  I find it fails almost
>every time with an 8 vcpu guest under KVM with software emulated TPM.
>
>To fix it, just move the tpm2_get_cc_attrs_tlb() call after the
>existing code to wait for initialization, which will ensure the buffer
>is allocated.
>
>Fixes: 18b3670d79ae9 ("tpm: ibmvtpm: Add support for TPM2")
>Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
>---

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

>
>Changes from v1:
> * Fixed a formatting error in the commit message
> * Added some more detail to the commit message
>
>drivers/char/tpm/tpm_ibmvtpm.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
>index 09fe45246b8cc..994385bf37c0c 100644
>--- a/drivers/char/tpm/tpm_ibmvtpm.c
>+++ b/drivers/char/tpm/tpm_ibmvtpm.c
>@@ -683,13 +683,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
> 	if (rc)
> 		goto init_irq_cleanup;
>
>-	if (!strcmp(id->compat, "IBM,vtpm20")) {
>-		chip->flags |= TPM_CHIP_FLAG_TPM2;
>-		rc = tpm2_get_cc_attrs_tbl(chip);
>-		if (rc)
>-			goto init_irq_cleanup;
>-	}
>-
> 	if (!wait_event_timeout(ibmvtpm->crq_queue.wq,
> 				ibmvtpm->rtce_buf != NULL,
> 				HZ)) {
>@@ -697,6 +690,13 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
> 		goto init_irq_cleanup;
> 	}
>
>+	if (!strcmp(id->compat, "IBM,vtpm20")) {
>+		chip->flags |= TPM_CHIP_FLAG_TPM2;
>+		rc = tpm2_get_cc_attrs_tbl(chip);
>+		if (rc)
>+			goto init_irq_cleanup;
>+	}
>+
> 	return tpm_chip_register(chip);
> init_irq_cleanup:
> 	do {
>-- 
>2.26.2
>

