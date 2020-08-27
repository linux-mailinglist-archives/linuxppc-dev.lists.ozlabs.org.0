Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12540253C70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:07:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcThn4C0XzDqJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:07:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iYhzd/fL; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTg655PhzDqNr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:06:10 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o13so2410022pgf.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 21:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zWnaVU3mQqJ/b3av6sLdOZPILa+ttGxLRv6lbGPhE9w=;
 b=iYhzd/fL+Tg0SO13w3s6LKCS65XNZpqka1fxVWR5ZQ/j7Xx1Duw29InDgpPf/iaWnx
 7T4MAZCIvN2Tk5BldfhuWRkzyeFM/ZbpYOWfX2h8HSPhRWSihPoWWfdLwXeomcuYRXQU
 SGDzabteKze3xN1DJZk0YL9+24tO2Zp9bev66z7dBFsfqd1A0hcbPumf1uhMbXo1NLPo
 DNF1kdmHfyFeAyx+BB3CEie0Bl54l84j3bDiatqh+koTQoNnc17dgh+pO8HV/PpvvnfJ
 rHVOZxClY7kXRNMThrLd791KVwWKMllpzhuihknQEkogkFIInhanu1sKLeaiqUNoptG/
 wM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zWnaVU3mQqJ/b3av6sLdOZPILa+ttGxLRv6lbGPhE9w=;
 b=htvHPoeMIjQgE5vJOjUA4/sqFNLSnqe3YaeAK/piWWpzRmkohkcAKdqVJzrvspbwKw
 KfUuaaYyDWHz48ylZ5GOfjritkmpUd99y9O0tJ2OptggtN7ilVWnbh/BgGqWVnPQ+C97
 mmXRC6g2ZJGLXDT5ytRoTvzwI4QZcVLDuEGn1x77fnxBxbBRJQb5F/qJ05jijxrRHLC3
 eIcGrw12kz5QBfM7Olu++BGaNbuXzG4yhwkfKd6urdYM7i05ujN5DgieV37oFPLoJWS3
 ZxONB5VtME+KtFBVZIWOngYlsWM3txbvj+C/Y5ox5hs0SHSFWWMy1orN+Fh74oiyL003
 zY0w==
X-Gm-Message-State: AOAM530IT6F/p2w1sxJrFF/J7CchiKMuTAe/ELlLekW9vAJZjUQpFgXN
 +V7IqMTeASSqSYKbRHjon0J1iab002E=
X-Google-Smtp-Source: ABdhPJy46dpUXkatugNDMDlv9ZQ+5HWRit9zt7jytqT1VnQ3NCENgogM1U0lGA+UcmrtVoHcAZYmgA==
X-Received: by 2002:a65:68d6:: with SMTP id k22mr12448681pgt.136.1598501168202; 
 Wed, 26 Aug 2020 21:06:08 -0700 (PDT)
Received: from tee480.ibm.com (180-150-65-4.b49641.syd.nbn.aussiebb.net.
 [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id v7sm757989pfe.96.2020.08.26.21.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 21:06:07 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: Update documentation of ISA versions for Power10
Date: Thu, 27 Aug 2020 14:05:56 +1000
Message-Id: <20200827040556.1783-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Update the CPU to ISA Version Mapping document to include Power10 and
ISA v3.1.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2: Transactional Memory = No
---
 Documentation/powerpc/isa-versions.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index a363d8c1603c..3873bbba183a 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -7,6 +7,7 @@ Mapping of some CPU versions to relevant ISA versions.
 ========= ====================================================================
 CPU       Architecture version
 ========= ====================================================================
+Power10   Power ISA v3.1
 Power9    Power ISA v3.0B
 Power8    Power ISA v2.07
 Power7    Power ISA v2.06
@@ -32,6 +33,7 @@ Key Features
 ========== ==================
 CPU        VMX (aka. Altivec)
 ========== ==================
+Power10    Yes
 Power9     Yes
 Power8     Yes
 Power7     Yes
@@ -47,6 +49,7 @@ PPC970     Yes
 ========== ====
 CPU        VSX
 ========== ====
+Power10    Yes
 Power9     Yes
 Power8     Yes
 Power7     Yes
@@ -62,6 +65,7 @@ PPC970     No
 ========== ====================================
 CPU        Transactional Memory
 ========== ====================================
+Power10    No  (* see Power ISA v3.1 Appendix A.)
 Power9     Yes (* see transactional_memory.txt)
 Power8     Yes
 Power7     No
-- 
2.17.1

