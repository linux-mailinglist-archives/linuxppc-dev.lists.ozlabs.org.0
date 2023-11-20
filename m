Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19ACA7F1367
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 13:33:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QihSDLnn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYn4F6vjkz3dLY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:33:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QihSDLnn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYmzd2Y4Bz3cWH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:29:49 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so3411715a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 04:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700483387; x=1701088187; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgx8LkV8H82w8tImzphDtH1iEDRz4SAPPUMfGtDicEM=;
        b=QihSDLnndnVX69Sj/yVSHKeVBc4RBnjAV6zvFqpsfdL7CJ0WdbgFlNyyjxlitA11Sv
         YWJAn/SaGLSuBBa6y4tGbR8TsCY3VZobxrNWKljeeiUYhYQ1CzGc7dnoTQoiZc+CrDAC
         nh95cAmxFr5EYFH3NSPBPtAfFe2Q+AvQ7j7ymzH2ZToEmyz0rWA46diYRyecHbqtqRFU
         p29jGI9xcpwwCV5nqHT39lt9/1WdYJAiytn79aByQn5SQOkMifQ/3mWes/CqeqJwEnZQ
         CDftB2BUHh/dBEQjvrTtaC3jaDDmJR8bfqFzTBwx+IGEee3ODuAMEzeaUIizAFjVUe1C
         X/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483387; x=1701088187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgx8LkV8H82w8tImzphDtH1iEDRz4SAPPUMfGtDicEM=;
        b=KArl+L2hQyMq1iFKerjilUAg+OEtUjxuzYvb659Echlw1tiR9XmflbA+PKQnfAKVlj
         +3W0VypvWa+3dmyV8BUfIxcQLWI5kH4tpoDbtzCmlThv3A84xXEL3mwUfNiE8hTiTSBD
         QsZFQLFzDSeWEXoQVkSoWJJRqGe9m5eUYMTCjJxDRrIu5Qhif+VS+UAkKG9C3CwRRhNO
         aoflNX1WWNJXXadj0hJFv1nmgN0YUmJCTOBwp2c+0Z33BcI+U6yF4Lu3oMxbljWp1iDS
         zxqh0j+7gqQI1ehI5o3j+E09S7xVzT8ooE2uACt8eprw6ntV0EH8+Yz6czwTyUl3HpaE
         8pLA==
X-Gm-Message-State: AOJu0YxbaNCP7KWDGA2Fo1YyzvcN2Fqyfz8WQ+DFLflnBDMthYipRwja
	ePDdgU/tbCA7URlzp9Bw84E=
X-Google-Smtp-Source: AGHT+IEibB6+6VzrAmexQ6L9y13uR22ZWYNVN8FC5GZHCDTfmSbEJdroHwYxybkyfCXhWzRBWtMSrQ==
X-Received: by 2002:a05:6a20:8f27:b0:186:8dc1:f4a with SMTP id b39-20020a056a208f2700b001868dc10f4amr9984281pzk.0.1700483386805;
        Mon, 20 Nov 2023 04:29:46 -0800 (PST)
Received: from wheely.local0.net (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b00690fe1c928csm6047477pfj.147.2023.11.20.04.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:29:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 4/4] KVM: PPC: selftests: powerpc enable kvm_create_max_vcpus test
Date: Mon, 20 Nov 2023 22:29:20 +1000
Message-ID: <20231120122920.293076-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120122920.293076-1-npiggin@gmail.com>
References: <20231120122920.293076-1-npiggin@gmail.com>
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
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's maximum permitted vCPU ID depends on the VM's SMT mode, and
the maximum reported by KVM_CAP_MAX_VCPU_ID exceeds a simple non-SMT
VM's limit.

The powerpc KVM selftest port uses non-SMT VMs, so add a workaround
to the kvm_create_max_vcpus test case to limit vCPU IDs to
KVM_CAP_MAX_VCPUS on powerpc. And enable the test case.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 tools/testing/selftests/kvm/Makefile               | 1 +
 tools/testing/selftests/kvm/kvm_create_max_vcpus.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index a198fe6136c8..1e904d8871d7 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -211,6 +211,7 @@ TEST_GEN_PROGS_powerpc += dirty_log_test
 TEST_GEN_PROGS_powerpc += dirty_log_perf_test
 TEST_GEN_PROGS_powerpc += guest_print_test
 TEST_GEN_PROGS_powerpc += hardware_disable_test
+TEST_GEN_PROGS_powerpc += kvm_create_max_vcpus
 TEST_GEN_PROGS_powerpc += kvm_page_table_test
 TEST_GEN_PROGS_powerpc += max_guest_memory_test
 TEST_GEN_PROGS_powerpc += memslot_modification_stress_test
diff --git a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
index 31b3cb24b9a7..330ede73c147 100644
--- a/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
+++ b/tools/testing/selftests/kvm/kvm_create_max_vcpus.c
@@ -51,6 +51,15 @@ int main(int argc, char *argv[])
 	pr_info("KVM_CAP_MAX_VCPU_ID: %d\n", kvm_max_vcpu_id);
 	pr_info("KVM_CAP_MAX_VCPUS: %d\n", kvm_max_vcpus);
 
+#ifdef __powerpc64__
+	/*
+	 * powerpc has a particular format for the vcpu ID that depends on
+	 * the guest SMT mode, and the max ID cap is too large for non-SMT
+	 * modes, where the maximum ID is the same as the maximum vCPUs.
+	 */
+	kvm_max_vcpu_id = kvm_max_vcpus;
+#endif
+
 	/*
 	 * Check that we're allowed to open nr_fds_wanted file descriptors and
 	 * try raising the limits if needed.
-- 
2.42.0

