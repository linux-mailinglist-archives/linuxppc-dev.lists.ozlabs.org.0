Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8300251D1FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 09:08:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvhVy3StWz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 17:08:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RquPcCEt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=bagasdotme@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RquPcCEt; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvhVF2Kfrz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 17:08:04 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id j6so5538239pfe.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 00:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJZVl5EvwvcXVjSPcNvmPIb3iIpc3e94gPZeNfEIGDE=;
 b=RquPcCEtPTQ8NBVOkNpgpfhMCaOU7gI0N2vmjXVEjeXEe47eK3VzRCiPPHMYYCxLg1
 P6CPTSsRWdUdNnPe/pRgZi+CAMTXOUW0aypCBBwy8+E+GZt1qfHSrSgiWhFOXQrDerPl
 DatPmAPOlMB2tmNlha9NwkZVVfrkt7/5nPmmGw1r/xOKTjKETDCaCs0tDLHNU6qL6xi7
 zAW9JgkwQRnxFAMqJeCE+U8r5dQmqbrlgs9EClh2uSa24oGIURlPYADWhRa9yFHAXrQC
 CnveAh8yJez5ypZvu1OL+WLOuhds+4ACEz2XKq+7SS60PyrasC1F8NQ9g5oL9GzwDwCI
 gxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJZVl5EvwvcXVjSPcNvmPIb3iIpc3e94gPZeNfEIGDE=;
 b=X3yZfjYkj8vgWWb2BUSNtBUJxcJN1WELhEG9Hy+Jx7zKGEwRNnQelaH84U7x9o2nAc
 f51ydrgh9mvPeC0rZC0vhbfQ6eMyViGR53p1W84RtnvyqEVymNG6rUUj0eImbu1QdmhP
 kF06USD/hyYzRDkI9iVhcOqzTXZincD7M61Rk+Mpd1MDgFzC5HCufk4G6e2xerhKxvnQ
 2ayQZFldlAkM61IJ/D+l4f8sJcABPh9L2yNJCw19NdT2zoJDGP2OT8DOZOfRghSdyowK
 awX9sjDFVHm0GIExjPTfXS/czJn20EU5xHq57DNGkX+i8mBZUUFb44lP+3tkA5SA5BCg
 bfew==
X-Gm-Message-State: AOAM533QsxFMGM+w18XCliouejK2bs0cWBLOYQC4XS2XjRcCQlvGgNv6
 1S0P5iv9ak0w5nqh9ajN3Gg=
X-Google-Smtp-Source: ABdhPJyQwhu+TLbFod80h890qcGGw9VNP9GSkzdKgcSkhgYmo6vXqdsuzS9lzJ1uVtzCOtokQbwb6A==
X-Received: by 2002:a63:ee50:0:b0:3c5:f762:c709 with SMTP id
 n16-20020a63ee50000000b003c5f762c709mr1648410pgk.222.1651820881250; 
 Fri, 06 May 2022 00:08:01 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-93.three.co.id. [180.214.233.93])
 by smtp.gmail.com with ESMTPSA id
 i12-20020a170902e48c00b0015e8d4eb26dsm844317ple.183.2022.05.06.00.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 00:08:00 -0700 (PDT)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org
Subject: [PATCH RESEND] KVM: powerpc: remove extraneous asterisk from
 rm_host_ipi_action comment
Date: Fri,  6 May 2022 14:07:47 +0700
Message-Id: <20220506070747.16309-1-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 stable@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Suresh Warrier <warrier@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kernel test robot reported kernel-doc warning for rm_host_ipi_action():

>> arch/powerpc/kvm/book3s_hv_rm_xics.c:887: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Host Operations poked by RM KVM

Since the function is static, remove the extraneous (second) asterisk at
the head of function comment.

Fixes: 0c2a66062470cd ("KVM: PPC: Book3S HV: Host side kick VCPU when poked by real-mode KVM")
Link: https://lore.kernel.org/linux-doc/202204252334.Cd2IsiII-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Cc: Suresh Warrier <warrier@linux.vnet.ibm.com>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Anders Roxell <anders.roxell@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm@vger.kernel.org
Cc: stable@vger.kernel.org # v5.15, v5.17
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_rm_xics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_rm_xics.c b/arch/powerpc/kvm/book3s_hv_rm_xics.c
index 587c33fc45640f..6e16bd751c8423 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_xics.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_xics.c
@@ -883,7 +883,7 @@ long kvmppc_deliver_irq_passthru(struct kvm_vcpu *vcpu,
 
 /*  --- Non-real mode XICS-related built-in routines ---  */
 
-/**
+/*
  * Host Operations poked by RM KVM
  */
 static void rm_host_ipi_action(int action, void *data)

base-commit: a7391ad3572431a354c927cf8896e86e50d7d0bf
-- 
An old man doll... just what I always wanted! - Clara

