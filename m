Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A62F1253D54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 07:59:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcX9K370CzDqcy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 15:59:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
X-Greylist: delayed 1973 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Aug 2020 15:57:28 AEST
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcX7X4hhSzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 15:57:27 +1000 (AEST)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>)
 id 1kBAOj-0005Aq-4K; Wed, 26 Aug 2020 22:24:32 -0700
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 2E802A75;
 Thu, 27 Aug 2020 05:24:27 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 02AB68004B;
 Thu, 27 Aug 2020 01:24:22 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.231])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 4AFB980055;
 Thu, 27 Aug 2020 05:24:20 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc: Add LKDTM accessor for patching addr
Date: Thu, 27 Aug 2020 00:26:54 -0500
Message-Id: <20200827052659.24922-2-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827052659.24922-1-cmr@codefail.de>
References: <20200827052659.24922-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.02)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhVRtFk8wMgP0ig
 M48okS0WxUTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kq02yUY2BU41HLqp9U+7si8M8
 LdvJpZ7k99Lvu8YZXeI6p5bbhGYzvfahQ7X4A9L0Ye/JicEYVQv1wTfnWwJUGLoHT+TiZ2cHCmVO
 a6Hj9ogla7ZdP44ErCUYDeNW3waCJODXbtOodkPED+RkHjVGH2xZ/WG2ZLv5RT/cF5Q6687AHRjU
 JmjnvGEokRBTZJpViFKfD1jKgYfH+6S5qDVYoB9IP+wAx5V73ybNly/cw9Dbhw3Crbac1ieeuRax
 ITFpzO11BRKqT8B4uLrn7iz8uvLBMzbIQcSG8L0jOzL80Q1MxDcqDeEvahfPkDkTlH91LgaQnmF8
 H6pa6B8MTK1ligAJ9G0GMvMSOAhk0taEj8weJNI+C0vMCMVtmGEXbiaC3YEY+sq0ALsWxTj0qWKj
 35ixdMKk3BBfka4DffHpBWqkz6wxIGi04aIm8At0f8rObIE4IPBEuGByelw7CsYrZplKOaZVvWPN
 YKOkeGHVaNmpda9O3Jm3n4TasdFPGI49Ap/fepC1NisM+LESvgPZp60jiD6XqsJZtjQxlyCdsezj
 agBN88lVV9DZyVHyu83kFRA3eAVqquD0SMTqBT7kVdbWKEjcOn5Sao0omnAkSP01t5GaqW/eByjC
 /a4JzYI0tTHX0DLUbl+m5hodVFL8tfzmJxmVEJ3Gt5OBM/oetP/F4zH/akUxwpSQe0Z72IpD5v0x
 upj3x9Ek7RafJauJpU8IL9xGC9Aq1yswy54RHHfHitWALqOUbaMN01UqsrL68FmGdBjTJq9+UaM6
 AyHQsys5mw8UZwIbwaQoUagpNuN48vZO5vqyKRzY1/C3LtRhfqb5R4VemuUI6bcEARsm0AHffUwf
 1Fe8+QQDoh1JX3JL6YEhoUUiZ+gDjRJBlVjGFjOk+oYG9HSSzX8ii5KOS3syFMyRibh35fUGz9A0
 wQ0EsJrzPSLMV4ckOwy/RJQMQij2rNMC/ijhnA2ohL4kJucUv81X66s2aS76WMD99KzHKlSFZnsN
 X9C2FSfjBOMW
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: kernel-hardening@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When live patching a STRICT_RWX kernel, a mapping is installed at a
"patching address" with temporary write permissions. Provide a
LKDTM-only accessor function for this address in preparation for a LKDTM
test which attempts to "hijack" this mapping by writing to it from
another CPU.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/include/asm/code-patching.h | 4 ++++
 arch/powerpc/lib/code-patching.c         | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index eacc9102c251..7216d6a6bb0a 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -187,4 +187,8 @@ static inline unsigned long ppc_kallsyms_lookup_name(const char *name)
 				 ___PPC_RA(__REG_R1) | PPC_LR_STKOFF)
 #endif /* CONFIG_PPC64 */
 
+#if defined(CONFIG_LKDTM) && defined(CONFIG_STRICT_KERNEL_RWX)
+unsigned long read_cpu_patching_addr(unsigned int cpu);
+#endif
+
 #endif /* _ASM_POWERPC_CODE_PATCHING_H */
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 8c3934ea6220..85d3fdca9452 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -46,6 +46,13 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 #ifdef CONFIG_STRICT_KERNEL_RWX
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
+#ifdef CONFIG_LKDTM
+unsigned long read_cpu_patching_addr(unsigned int cpu)
+{
+	return (unsigned long)(per_cpu(text_poke_area, cpu))->addr;
+}
+#endif
+
 static int text_area_cpu_up(unsigned int cpu)
 {
 	struct vm_struct *area;
-- 
2.28.0

