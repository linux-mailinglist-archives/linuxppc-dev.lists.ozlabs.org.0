Return-Path: <linuxppc-dev+bounces-3996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7FE9ED83F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2024 22:15:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7pJt4fRWz2xxx;
	Thu, 12 Dec 2024 08:14:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733932163;
	cv=none; b=QPIiixGvqh79E5oodI7zvlz1tbUE6L9nBg9SEFfMcewIhiYcLtHyzrnvJj9hqF0b7Fsl8lZeqnSc/oFevXXKt+6whK28EnM+2JVp1hgpS90yXt3/u5iVe6TfRYHPPVQHeZMkacfxNBdg8iupyGbBsZtsrZKUf5gp+c3jzonGXnIoCkfP/9YmsGg+m7SblfWhYdEWxQVOEYlbO7qhHsBR+3Sq7F+wzfFwTeRvNd5p06Sa0wIRoeLNMdK/IY0tSbFva8kY5mQ6MgbrRdQdCz2877h1I7J7l/8XFfOXMKR7yV2kl4FxXKoZ0RZng2NqInbfH65PPUUjDLC1NDNFCswuFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733932163; c=relaxed/relaxed;
	bh=9lC67VtD4fFVxuB+r83uZNU+8JW36bmx8Nhp3WQ4tAM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JoTEQL2BoEUzT3y+pS8Q8agKKj2fPRdHZDO0CJPU8uuKqcPanxbzsGKk45iMFer6eqClIxX65XHD8bAgG06aI4ixkd2y5G0nPeR3cV7GNxxSfo81Mv7FULKRH89D4IT6Cd3jIgvgfbz+ew5+H6AODCnBEfXvRhXOQdBEQYttG8Ozw7i/4H7b7zK8jRJYmmWU57spLXy1PDF0R1N2n2MjGxrmL88WlLHcTqorfmkDxnnb8kRIkKXaNrLfd1WlqyIQI6E46OEvVSvgGcCuHRbMCowZf5axOQaxwrJhdXcju2ySW38HIji63/8kSYQlbOvR8IGYdJdyPMjXQhDAup07RA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ki3MQGw9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=cvam0000@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ki3MQGw9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=cvam0000@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7g5G1DgJz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2024 02:49:20 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21636268e43so48611845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 07:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733932156; x=1734536956; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9lC67VtD4fFVxuB+r83uZNU+8JW36bmx8Nhp3WQ4tAM=;
        b=ki3MQGw9w2RkPBP29w7KaRNJh/m5An/ibYn73sIog3+0raLvTqFjLTeo1VYMcA5F5E
         iIXAyhRBB5WtgbDp0U5ljEf/rU+66UEzrZxISiTP3K/ezAZVMPzh2DDxJwZdLvAY2j9+
         BptvGqYn6a4/CNDOLR17IigK8cF/jkOfwF4/GxM2Xj1zBiVI5fv4RZojk1gO6VpvYRSn
         wEv3XB/EgH9q5zicHCn/DrleAxNYU6qb44u2jhlJHmmUejRM/m9tqyUxNNA4q9IOfmK4
         /1vYq7WLwa4AtyATjyYZn2jA6FUwj4ZXPX+M0ieCI4oIZAgqZM2PqOIJhBOWZCT7Onam
         ybTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932156; x=1734536956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9lC67VtD4fFVxuB+r83uZNU+8JW36bmx8Nhp3WQ4tAM=;
        b=DRunpTBnppNjbVylJ+RQZoeROxcW1yC9Bm7JReWfR+MVpwKCFF+IM53burjmleyqfY
         vuCxtyEiUdEoEebFIR+SHCBg9nf52PP/mULu2Rg0YbWHGqNhCIuiMvfwWC43UsziP2AQ
         ghpCx8d16X2hlraSHaSWsUUuOUm+HDRkOYjBjouUD7nn1mdfioYVgBvSl0on0pPyq9ie
         hVOHz/oBIZw+UW6e7zS4c36T7nnzQWu3sn3q3wtoDoWpcfiIUE1kRygaUg5VuuhETT8Y
         z9Zs45lqeJWugK5zzASAPou7HhhYaa/KWiwulvZX2bpi/pPknrWkJx2C9JJG+CrQg2/1
         colQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIZEejhZnim3baqTDc8WkI89g7Jf0MzuMnoXSNk4yWP5EPDAYSbob6BRNo5nKcSMTN8MUuWROumpAKsnI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxrr2DKQ0UL3+3P7yJsALyF+WAp6Z2z+xqTHkB2XW+hSnGNTztg
	ybW1wz4cyiotzroLzWLyyEcpPBsB9nDSSIkLkHv7/msf2hM1hWdakWgP8fhF
X-Gm-Gg: ASbGncvwJAz1wjegnbsMZkKs/XCPCdwyefhE9GXjLgJ7LdMG8ejTbpEzSb1sTNe5tTG
	1DK6E/tmw5B/kKIbpxuOsKw0bqKleYuc1HeXoZq/WYp5lQ9/JsPZ3K4KDvyAFpPuiJK7RfK9HHP
	Cj+Lh1etrv6QbDGOt/kKq+SK7uXYHWVgCPHSPVu1b2GsQorcM5PF0i2VTWe2a+6PC3vUEEUF4V8
	WcIU+JFbylRh6FBQWdEedQcaT3y9qkI2KrDhxXt3Gwum0rqTDbRduPmfiP42klyMRk=
X-Google-Smtp-Source: AGHT+IEIO/z1IiRLnFQUxOAoeXPx2qv/BrmO6W4H8J2PEcOvAn7nRdf9JnCDAcTSg9K1CFOkkiJvGA==
X-Received: by 2002:a17:903:986:b0:216:6769:9eea with SMTP id d9443c01a7336-217786973afmr54705605ad.37.1733932155968;
        Wed, 11 Dec 2024 07:49:15 -0800 (PST)
Received: from 2abb50c-lcedt.nvidia.com ([203.200.25.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2177fc9615asm11734205ad.273.2024.12.11.07.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 07:49:15 -0800 (PST)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	maddy@linux.ibm.com,
	dennis.dalessandro@cornelisnetworks.com,
	jgg@ziepe.ca,
	leon@kernel.org
Cc: viro@zeniv.linux.org.uk,
	akpm@linux-foundation.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Subject: [PATCH] kernel-wide: Add explicity||explicitly to spelling.txt
Date: Wed, 11 Dec 2024 21:19:03 +0530
Message-Id: <20241211154903.47027-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Correct the spelling dictionary so
that future instances will be caught by checkpatch,
and fix the instances found.

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c                                | 2 +-
 drivers/infiniband/hw/hfi1/iowait.h                         | 2 +-
 drivers/infiniband/hw/usnic/usnic_abi.h                     | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 2 +-
 drivers/scsi/cxlflash/superpipe.c                           | 2 +-
 scripts/spelling.txt                                        | 1 +
 tools/testing/selftests/pidfd/pidfd_test.c                  | 2 +-
 7 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 25429905ae90..86bff159c51e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4957,7 +4957,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 			 * states are synchronized from L0 to L1. L1 needs to inform L0 about
 			 * MER=1 only when there are pending external interrupts.
 			 * In the above if check, MER bit is set if there are pending
-			 * external interrupts. Hence, explicity mask off MER bit
+			 * external interrupts. Hence, explicitly mask off MER bit
 			 * here as otherwise it may generate spurious interrupts in L2 KVM
 			 * causing an endless loop, which results in L2 guest getting hung.
 			 */
diff --git a/drivers/infiniband/hw/hfi1/iowait.h b/drivers/infiniband/hw/hfi1/iowait.h
index 49805a24bb0a..7259f4f55700 100644
--- a/drivers/infiniband/hw/hfi1/iowait.h
+++ b/drivers/infiniband/hw/hfi1/iowait.h
@@ -92,7 +92,7 @@ struct iowait_work {
  *
  * The lock field is used by waiters to record
  * the seqlock_t that guards the list head.
- * Waiters explicity know that, but the destroy
+ * Waiters explicitly know that, but the destroy
  * code that unwaits QPs does not.
  */
 struct iowait {
diff --git a/drivers/infiniband/hw/usnic/usnic_abi.h b/drivers/infiniband/hw/usnic/usnic_abi.h
index 7fe9502ce8d3..86a82a4da0aa 100644
--- a/drivers/infiniband/hw/usnic/usnic_abi.h
+++ b/drivers/infiniband/hw/usnic/usnic_abi.h
@@ -72,7 +72,7 @@ struct usnic_ib_create_qp_resp {
 	u64				bar_bus_addr;
 	u32				bar_len;
 /*
- * WQ, RQ, CQ are explicity specified bc exposing a generic resources inteface
+ * WQ, RQ, CQ are explicitly specified bc exposing a generic resources inteface
  * expands the scope of ABI to many files.
  */
 	u32				wq_cnt;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index 0949e7975ff1..b70d20128f98 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1810,7 +1810,7 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 			rfi->cur_idx = cur_idx;
 		}
 	} else {
-		/* explicity window move updating the expected index */
+		/* explicitly window move updating the expected index */
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
 
 		brcmf_dbg(DATA, "flow-%d (0x%x): change expected: %d -> %d\n",
diff --git a/drivers/scsi/cxlflash/superpipe.c b/drivers/scsi/cxlflash/superpipe.c
index b375509d1470..97631f48e19d 100644
--- a/drivers/scsi/cxlflash/superpipe.c
+++ b/drivers/scsi/cxlflash/superpipe.c
@@ -966,7 +966,7 @@ static int cxlflash_disk_detach(struct scsi_device *sdev, void *detach)
  *
  * This routine is the release handler for the fops registered with
  * the CXL services on an initial attach for a context. It is called
- * when a close (explicity by the user or as part of a process tear
+ * when a close (explicitly by the user or as part of a process tear
  * down) is performed on the adapter file descriptor returned to the
  * user. The user should be aware that explicitly performing a close
  * considered catastrophic and subsequent usage of the superpipe API
diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index 05bd9ca1fbfa..d46c313ceaca 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -669,6 +669,7 @@ exmaple||example
 expecially||especially
 experies||expires
 explicite||explicit
+explicity||explicitly
 explicitely||explicitly
 explict||explicit
 explictely||explicitly
diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index 9faa686f90e4..e9728e86b4f2 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -497,7 +497,7 @@ static int child_poll_leader_exit_test(void *args)
 	pthread_create(&t2, NULL, test_pidfd_poll_leader_exit_thread, NULL);
 
 	/*
-	 * glibc exit calls exit_group syscall, so explicity call exit only
+	 * glibc exit calls exit_group syscall, so explicitly call exit only
 	 * so that only the group leader exits, leaving the threads alone.
 	 */
 	*child_exit_secs = time(NULL);
-- 
2.34.1


