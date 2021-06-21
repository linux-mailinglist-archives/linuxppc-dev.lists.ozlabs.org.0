Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA65B3AF781
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 23:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G82rh2tbzz3bvG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 07:35:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UKzXohh/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=UKzXohh/; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G82r91q5pz2yjB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 07:35:18 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id u2so572893plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UDidmCZxhroQ+TOCX79nOJNfPKJOGFSjcIs3K19hLp8=;
 b=UKzXohh/1StZBHDI4g+MalYUrKYsPNiqfF19dWdrEZWlbsMxHYiLQZgLy4EXhUuWXR
 M+dVug9hbGLGGAL1TsjAV2lS3Xn1aEk8CKPpyb8zBB/H/ZMu0XR6EhXJwCYlO4Hs6EVq
 8esrQr3Bd6IvJ34m0TFKXLP/ytkY9pj/UA2nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UDidmCZxhroQ+TOCX79nOJNfPKJOGFSjcIs3K19hLp8=;
 b=Enhc+F41OOgCU4awAF8LPp6cK8AVGQw+1CWaF3c9dWgMUztBphzhr8+RSVfOHH3rdK
 RCRScw5bfRw+oC3UHMnlUEHgWQKKB4VSUBzz/RG49ShfpPcj+MgkQZsLxeqfdHzZZVNp
 GTN9WxsgJNuxfFPzKV3k5vloMSRtiWpM76/ubR/q8TbymvzDQAWxA1Dd37AiplSvSUg1
 aTDQyfYuVEDPJaH6a+1i56y3asMjOrQZtn4SfqpFtnBvjo91hsl+AxUl82GAh2P+2+EE
 tXqcHnvsXR1Av/L6FOXu2NULuBrsSGgQI8uLEnl2M6115UX2YPnDtfJHmCKgwfJjevM9
 zlnw==
X-Gm-Message-State: AOAM531xE/M6Ge334BQqYlVtzTRXVV7ylw1mafKhi+Rky6rMnifavyYM
 HVhTvZVWkte1h049VA8IgFPDIA==
X-Google-Smtp-Source: ABdhPJySc3RO6aQntY+AiU2uAIVn9+bZL0/etrX7035KzHaNrh5bI1NZpIt1xweDPjKFhM6dFtEERg==
X-Received: by 2002:a17:90a:e98f:: with SMTP id
 v15mr133613pjy.144.1624311314348; 
 Mon, 21 Jun 2021 14:35:14 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k9sm17811211pgq.27.2021.06.21.14.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 14:35:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "David S . Miller" <davem@davemloft.net>
Subject: [PATCH] ibmvnic: Use strscpy() instead of strncpy()
Date: Mon, 21 Jun 2021 14:35:09 -0700
Message-Id: <20210621213509.1404256-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=9d7d233a23aa862fcc6a92c72955f66ab680a7cf;
 i=2MSGt3s6JKlmLqc/7MhI8MosbesWNfHpXt3ZKIs5Ui0=;
 m=73OdtUon7HnZ7lwINUsDE2u3rLyNTedCFDxqqnCnH0U=;
 p=3HCUEwDxbB6Mvm9EsCUsGy6FDmIED+nO7uTZDX2jFb4=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDRBg0ACgkQiXL039xtwCYm1hAAn8z
 zKGC+z3/HykUm/wR8tpn/0aihvrjXOE/pNGc82OUB9sRdy3xFtnvDq7A/jcfeK5kwd4zBM6kXwNzB
 hM8KxnDiM88KuS4hLn61XmYxNC7V6L5moz2ZX5SZrvv0xsM9gZUxe6frtJoocA4jHfKeR5g0picxr
 4UBq2Wf+VhkKayMKHHYMEAq/2PvJb5hDt/xCV0SMyKx00OPatExs2CZtCbpjmCcQSSGdiufea830i
 Zi3jIfzppQecp3bIq8fXUC0hzIjbYa6KUMJoWOA7SrBAiupg+msTYzA1UvWScPZJE7XtObX9bE4Cf
 K3u5t+0yC8wx0Cjl/0H+QRMVd7iZV2c+FS67Ynwc6eC8NQj2eOE89pg9VBEj0gOqJjkWu7UHzmt62
 SAXNfDGiqs9pmSsrYuAVJV6qsgEPK7f2qzbndwBGL3gqE4uRoV2k5E7f2jnrKGyje3LnVZGAR8Fx9
 tlX3OuqdEB05ejAW5Ay60gUCa3I14flW6fTJwQdHM9zfpSxwMPNuy9apw0tb8BJTCUlTe5fan6HA4
 QSM3EcAu5rSIcgiXiqrDR4AMldjPbKuvtczjKve7Z9KCH7IX1EaTOalWwNH6F6392Sm1X/y0TEMPO
 TB9Mi0LVgyXEfzTKoyyXC7lU49OAulgfZrJe+DU7iiAUhNw+8b75S3j73KGOv46g=
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
 Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since these strings are expected to be NUL-terminated and the buffers
are exactly sized (in vnic_client_data_len()) with no padding, strncpy()
can be safely replaced with strscpy() here, as strncpy() on
NUL-terminated string is considered deprecated[1]. This has the
side-effect of silencing a -Warray-bounds warning due to the compiler
being confused about the vlcd incrementing:

In file included from ./include/linux/string.h:253,
                 from ./include/linux/bitmap.h:10,
                 from ./include/linux/cpumask.h:12,
                 from ./include/linux/mm_types_task.h:14,
                 from ./include/linux/mm_types.h:5,
                 from ./include/linux/buildid.h:5,
                 from ./include/linux/module.h:14,
                 from drivers/net/ethernet/ibm/ibmvnic.c:35:
In function '__fortify_strncpy',
    inlined from 'vnic_add_client_data' at drivers/net/ethernet/ibm/ibmvnic.c:3919:2:
./include/linux/fortify-string.h:39:30: warning: '__builtin_strncpy' offset 12 from the object at 'v
lcd' is out of the bounds of referenced subobject 'name' with type 'char[]' at offset 12 [-Warray-bo
unds]
   39 | #define __underlying_strncpy __builtin_strncpy
      |                              ^
./include/linux/fortify-string.h:51:9: note: in expansion of macro '__underlying_strncpy'
   51 |  return __underlying_strncpy(p, q, size);
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/ibm/ibmvnic.c: In function 'vnic_add_client_data':
drivers/net/ethernet/ibm/ibmvnic.c:3883:7: note: subobject 'name' declared here
 3883 |  char name[];
      |       ^~~~

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings

Cc: Dany Madden <drt@linux.ibm.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/ibm/ibmvnic.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 2d8804ebdf96..adb0d5ca9ff1 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3909,21 +3909,21 @@ static void vnic_add_client_data(struct ibmvnic_adapter *adapter,
 	vlcd->type = 1;
 	len = strlen(os_name) + 1;
 	vlcd->len = cpu_to_be16(len);
-	strncpy(vlcd->name, os_name, len);
+	strscpy(vlcd->name, os_name, len);
 	vlcd = (struct vnic_login_client_data *)(vlcd->name + len);
 
 	/* Type 2 - LPAR name */
 	vlcd->type = 2;
 	len = strlen(utsname()->nodename) + 1;
 	vlcd->len = cpu_to_be16(len);
-	strncpy(vlcd->name, utsname()->nodename, len);
+	strscpy(vlcd->name, utsname()->nodename, len);
 	vlcd = (struct vnic_login_client_data *)(vlcd->name + len);
 
 	/* Type 3 - device name */
 	vlcd->type = 3;
 	len = strlen(adapter->netdev->name) + 1;
 	vlcd->len = cpu_to_be16(len);
-	strncpy(vlcd->name, adapter->netdev->name, len);
+	strscpy(vlcd->name, adapter->netdev->name, len);
 }
 
 static int send_login(struct ibmvnic_adapter *adapter)
-- 
2.30.2

