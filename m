Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2791E79203C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 05:55:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=T0vlmAzC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rfs8y0Mm9z3dH6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Sep 2023 13:55:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=T0vlmAzC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=jniethe5@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rfs185ycXz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Sep 2023 13:48:28 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-76df3d8fb4eso125111685a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Sep 2023 20:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693885705; x=1694490505; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5R57R4pB/NFGyKyyWEQaJzGx34ZsOK9sXVs0szt4X8=;
        b=T0vlmAzCgbTLqRKVrhZvprhxiQIZv/hkavhKU3XfK89PoR1TNOiH3wO7CpBh9vEklG
         Sdpi0rgLUvJ76Gv1dF6niK/E2QMwvzlhVgjuZ+xSuENYpT2DO+c96SUNDNhBd2vjlxwk
         UfSoVF7rMfWc8qylHAk37y0tuvbM15ITAT+8wpmgepxlvV63trR5V82z79LfoymOcZQc
         cZ5PoXc+kglPKuEPm7OPoIePtR+Yg6fSaCqPl8wAWc06gVPVS0w7jm+dOaAwdHwMcNc3
         PiR5jzd3ow95pPBGdb+KqIFjzW4S2DMnmCaefYS48vDjXO2wdJHcu3qjJicACFPKY6Kf
         I8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693885705; x=1694490505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5R57R4pB/NFGyKyyWEQaJzGx34ZsOK9sXVs0szt4X8=;
        b=TOjWNR+Xw9WwuBRobJSOjckh5bx3zUA08q5KEC0anVIjWkLMUeSlFmit3UJgY2/qUB
         d2mdQABrtAND3R7giZ7bg8RG3R9RZJ1GffRmkyTDxhsEo8V2gq3+kYBjg3n6l9P+LPVl
         ckXdfbF33bd0C75bK1RUnzaopoDVhZXWTDMpAy10SKncNAfxdKgu5pi8evsmli603Ju2
         DuevYlxMe38Gxg/bert5MTSjkgXoZahYhgMzwektS3+H3RUazRnYGHOWj/rwENKTaWHj
         vsVnzaGVXX97s7UrQTQBiYeblTyUuBfqTtvZCnHAqgZXhX+oVJa5CruOPnUJeHtK3hEZ
         8Uxg==
X-Gm-Message-State: AOJu0YwOg6vMZaF89jpf1LrZUYzwlUe345/qTHz3XBIFXE8MO0PAMn16
	XbIuSEvrDs7GbpJyb9IPiAl5SuAA1/dIg3Oq8Kc=
X-Google-Smtp-Source: AGHT+IFd0ABQ/L+g4m0HQKS5M7Xzk5ZFxrwv+OctF4rae1uKYWrLAqykaJ2Wh1zO9vq+tkPq3UOKNg==
X-Received: by 2002:a05:620a:46a3:b0:76d:9bf2:f1e9 with SMTP id bq35-20020a05620a46a300b0076d9bf2f1e9mr14419787qkb.13.1693885704531;
        Mon, 04 Sep 2023 20:48:24 -0700 (PDT)
Received: from pwon.ozlabs.ibm.com ([129.41.57.2])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0063f0068cf6csm7994951pff.198.2023.09.04.20.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 20:48:24 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/11] KVM: PPC: Add helper library for Guest State Buffers
Date: Tue,  5 Sep 2023 13:46:55 +1000
Message-Id: <20230905034658.82835-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230905034658.82835-1-jniethe5@gmail.com>
References: <20230905034658.82835-1-jniethe5@gmail.com>
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
Cc: mikey@neuling.org, sbhat@linux.ibm.com, kvm@vger.kernel.org, amachhiw@linux.vnet.ibm.com, gautam@linux.ibm.com, npiggin@gmail.com, David.Laight@ACULAB.COM, kvm-ppc@vger.kernel.org, Jordan Niethe <jniethe5@gmail.com>, vaibhav@linux.ibm.com, kconsul@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PAPR "Nestedv2" guest API introduces the concept of a Guest State
Buffer for communication about L2 guests between L1 and L0 hosts.

In the new API, the L0 manages the L2 on behalf of the L1. This means
that if the L1 needs to change L2 state (e.g. GPRs, SPRs, partition
table...), it must request the L0 perform the modification. If the
nested host needs to read L2 state likewise this request must
go through the L0.

The Guest State Buffer is a Type-Length-Value style data format defined
in the PAPR which assigns all relevant partition state a unique
identity. Unlike a typical TLV format the length is redundant as the
length of each identity is fixed but is included for checking
correctness.

A guest state buffer consists of an element count followed by a stream
of elements, where elements are composed of an ID number, data length,
then the data:

  Header:

   <---4 bytes--->
  +----------------+-----
  | Element Count  | Elements...
  +----------------+-----

  Element:

   <----2 bytes---> <-2 bytes-> <-Length bytes->
  +----------------+-----------+----------------+
  | Guest State ID |  Length   |      Data      |
  +----------------+-----------+----------------+

Guest State IDs have other attributes defined in the PAPR such as
whether they are per thread or per guest, or read-only.

Introduce a library for using guest state buffers. This includes support
for actions such as creating buffers, adding elements to buffers,
reading the value of elements and parsing buffers. This will be used
later by the nestedv2 guest support.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v2:
  - Add missing #ifdef CONFIG_VSXs
  - Move files from lib/ to kvm/
  - Guard compilation on CONFIG_KVM_BOOK3S_HV_POSSIBLE
  - Use kunit for guest state buffer tests
  - Add configuration option for the tests
  - Use macros for contiguous id ranges like GPRs
  - Add some missing EXPORTs to functions
  - HEIR element is a double word not a word
v3:
  - Use EXPORT_SYMBOL_GPL()
  - Use the kvmppc namespace
  - Move kvmppc_gsb_reset() out of kvmppc_gsm_fill_info()
  - Comments for GSID elements
  - Pass vector elements by reference
  - Remove generic put and get functions
---
 arch/powerpc/Kconfig.debug                    |  12 +
 arch/powerpc/include/asm/guest-state-buffer.h | 904 ++++++++++++++++++
 arch/powerpc/kvm/Makefile                     |   3 +
 arch/powerpc/kvm/guest-state-buffer.c         | 571 +++++++++++
 arch/powerpc/kvm/test-guest-state-buffer.c    | 328 +++++++
 5 files changed, 1818 insertions(+)
 create mode 100644 arch/powerpc/include/asm/guest-state-buffer.h
 create mode 100644 arch/powerpc/kvm/guest-state-buffer.c
 create mode 100644 arch/powerpc/kvm/test-guest-state-buffer.c

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 2a54fadbeaf5..339c3a5f56f1 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -82,6 +82,18 @@ config MSI_BITMAP_SELFTEST
 	bool "Run self-tests of the MSI bitmap code"
 	depends on DEBUG_KERNEL
 
+config GUEST_STATE_BUFFER_TEST
+	def_tristate n
+	prompt "Enable Guest State Buffer unit tests"
+	depends on KUNIT
+	depends on KVM_BOOK3S_HV_POSSIBLE
+	default KUNIT_ALL_TESTS
+	help
+	  The Guest State Buffer is a data format specified in the PAPR.
+	  It is by hcalls to communicate the state of L2 guests between
+	  the L1 and L0 hypervisors. Enable unit tests for the library
+	  used to create and use guest state buffers.
+
 config PPC_IRQ_SOFT_MASK_DEBUG
 	bool "Include extra checks for powerpc irq soft masking"
 	depends on PPC64
diff --git a/arch/powerpc/include/asm/guest-state-buffer.h b/arch/powerpc/include/asm/guest-state-buffer.h
new file mode 100644
index 000000000000..aaefe1075fc4
--- /dev/null
+++ b/arch/powerpc/include/asm/guest-state-buffer.h
@@ -0,0 +1,904 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Interface based on include/net/netlink.h
+ */
+#ifndef _ASM_POWERPC_GUEST_STATE_BUFFER_H
+#define _ASM_POWERPC_GUEST_STATE_BUFFER_H
+
+#include <linux/gfp.h>
+#include <linux/bitmap.h>
+#include <asm/plpar_wrappers.h>
+
+/**************************************************************************
+ * Guest State Buffer Constants
+ **************************************************************************/
+/* Element without a value and any length */
+#define KVMPPC_GSID_BLANK			0x0000
+/* Size required for the L0's internal VCPU representation */
+#define KVMPPC_GSID_HOST_STATE_SIZE		0x0001
+ /* Minimum size for the H_GUEST_RUN_VCPU output buffer */
+#define KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE		0x0002
+ /* "Logical" PVR value as defined in the PAPR */
+#define KVMPPC_GSID_LOGICAL_PVR			0x0003
+ /* L0 relative timebase offset */
+#define KVMPPC_GSID_TB_OFFSET			0x0004
+ /* Partition Scoped Page Table Info */
+#define KVMPPC_GSID_PARTITION_TABLE		0x0005
+ /* Process Table Info */
+#define KVMPPC_GSID_PROCESS_TABLE		0x0006
+
+/* H_GUEST_RUN_VCPU input buffer Info */
+#define KVMPPC_GSID_RUN_INPUT			0x0C00
+/* H_GUEST_RUN_VCPU output buffer Info */
+#define KVMPPC_GSID_RUN_OUTPUT			0x0C01
+#define KVMPPC_GSID_VPA				0x0C02
+
+#define KVMPPC_GSID_GPR(x)			(0x1000 + (x))
+#define KVMPPC_GSID_HDEC_EXPIRY_TB		0x1020
+#define KVMPPC_GSID_NIA				0x1021
+#define KVMPPC_GSID_MSR				0x1022
+#define KVMPPC_GSID_LR				0x1023
+#define KVMPPC_GSID_XER				0x1024
+#define KVMPPC_GSID_CTR				0x1025
+#define KVMPPC_GSID_CFAR			0x1026
+#define KVMPPC_GSID_SRR0			0x1027
+#define KVMPPC_GSID_SRR1			0x1028
+#define KVMPPC_GSID_DAR				0x1029
+#define KVMPPC_GSID_DEC_EXPIRY_TB		0x102A
+#define KVMPPC_GSID_VTB				0x102B
+#define KVMPPC_GSID_LPCR			0x102C
+#define KVMPPC_GSID_HFSCR			0x102D
+#define KVMPPC_GSID_FSCR			0x102E
+#define KVMPPC_GSID_FPSCR			0x102F
+#define KVMPPC_GSID_DAWR0			0x1030
+#define KVMPPC_GSID_DAWR1			0x1031
+#define KVMPPC_GSID_CIABR			0x1032
+#define KVMPPC_GSID_PURR			0x1033
+#define KVMPPC_GSID_SPURR			0x1034
+#define KVMPPC_GSID_IC				0x1035
+#define KVMPPC_GSID_SPRG0			0x1036
+#define KVMPPC_GSID_SPRG1			0x1037
+#define KVMPPC_GSID_SPRG2			0x1038
+#define KVMPPC_GSID_SPRG3			0x1039
+#define KVMPPC_GSID_PPR				0x103A
+#define KVMPPC_GSID_MMCR(x)			(0x103B + (x))
+#define KVMPPC_GSID_MMCRA			0x103F
+#define KVMPPC_GSID_SIER(x)			(0x1040 + (x))
+#define KVMPPC_GSID_BESCR			0x1043
+#define KVMPPC_GSID_EBBHR			0x1044
+#define KVMPPC_GSID_EBBRR			0x1045
+#define KVMPPC_GSID_AMR				0x1046
+#define KVMPPC_GSID_IAMR			0x1047
+#define KVMPPC_GSID_AMOR			0x1048
+#define KVMPPC_GSID_UAMOR			0x1049
+#define KVMPPC_GSID_SDAR			0x104A
+#define KVMPPC_GSID_SIAR			0x104B
+#define KVMPPC_GSID_DSCR			0x104C
+#define KVMPPC_GSID_TAR				0x104D
+#define KVMPPC_GSID_DEXCR			0x104E
+#define KVMPPC_GSID_HDEXCR			0x104F
+#define KVMPPC_GSID_HASHKEYR			0x1050
+#define KVMPPC_GSID_HASHPKEYR			0x1051
+#define KVMPPC_GSID_CTRL			0x1052
+
+#define KVMPPC_GSID_CR				0x2000
+#define KVMPPC_GSID_PIDR			0x2001
+#define KVMPPC_GSID_DSISR			0x2002
+#define KVMPPC_GSID_VSCR			0x2003
+#define KVMPPC_GSID_VRSAVE			0x2004
+#define KVMPPC_GSID_DAWRX0			0x2005
+#define KVMPPC_GSID_DAWRX1			0x2006
+#define KVMPPC_GSID_PMC(x)			(0x2007 + (x))
+#define KVMPPC_GSID_WORT			0x200D
+#define KVMPPC_GSID_PSPB			0x200E
+
+#define KVMPPC_GSID_VSRS(x)			(0x3000 + (x))
+
+#define KVMPPC_GSID_HDAR			0xF000
+#define KVMPPC_GSID_HDSISR			0xF001
+#define KVMPPC_GSID_HEIR			0xF002
+#define KVMPPC_GSID_ASDR			0xF003
+
+#define KVMPPC_GSE_GUESTWIDE_START KVMPPC_GSID_BLANK
+#define KVMPPC_GSE_GUESTWIDE_END KVMPPC_GSID_PROCESS_TABLE
+#define KVMPPC_GSE_GUESTWIDE_COUNT \
+	(KVMPPC_GSE_GUESTWIDE_END - KVMPPC_GSE_GUESTWIDE_START + 1)
+
+#define KVMPPC_GSE_META_START KVMPPC_GSID_RUN_INPUT
+#define KVMPPC_GSE_META_END KVMPPC_GSID_VPA
+#define KVMPPC_GSE_META_COUNT (KVMPPC_GSE_META_END - KVMPPC_GSE_META_START + 1)
+
+#define KVMPPC_GSE_DW_REGS_START KVMPPC_GSID_GPR(0)
+#define KVMPPC_GSE_DW_REGS_END KVMPPC_GSID_CTRL
+#define KVMPPC_GSE_DW_REGS_COUNT \
+	(KVMPPC_GSE_DW_REGS_END - KVMPPC_GSE_DW_REGS_START + 1)
+
+#define KVMPPC_GSE_W_REGS_START KVMPPC_GSID_CR
+#define KVMPPC_GSE_W_REGS_END KVMPPC_GSID_PSPB
+#define KVMPPC_GSE_W_REGS_COUNT \
+	(KVMPPC_GSE_W_REGS_END - KVMPPC_GSE_W_REGS_START + 1)
+
+#define KVMPPC_GSE_VSRS_START KVMPPC_GSID_VSRS(0)
+#define KVMPPC_GSE_VSRS_END KVMPPC_GSID_VSRS(63)
+#define KVMPPC_GSE_VSRS_COUNT (KVMPPC_GSE_VSRS_END - KVMPPC_GSE_VSRS_START + 1)
+
+#define KVMPPC_GSE_INTR_REGS_START KVMPPC_GSID_HDAR
+#define KVMPPC_GSE_INTR_REGS_END KVMPPC_GSID_ASDR
+#define KVMPPC_GSE_INTR_REGS_COUNT \
+	(KVMPPC_GSE_INTR_REGS_END - KVMPPC_GSE_INTR_REGS_START + 1)
+
+#define KVMPPC_GSE_IDEN_COUNT                                 \
+	(KVMPPC_GSE_GUESTWIDE_COUNT + KVMPPC_GSE_META_COUNT + \
+	 KVMPPC_GSE_DW_REGS_COUNT + KVMPPC_GSE_W_REGS_COUNT + \
+	 KVMPPC_GSE_VSRS_COUNT + KVMPPC_GSE_INTR_REGS_COUNT)
+
+/**
+ * Ranges of guest state buffer elements
+ */
+enum {
+	KVMPPC_GS_CLASS_GUESTWIDE = 0x01,
+	KVMPPC_GS_CLASS_META = 0x02,
+	KVMPPC_GS_CLASS_DWORD_REG = 0x04,
+	KVMPPC_GS_CLASS_WORD_REG = 0x08,
+	KVMPPC_GS_CLASS_VECTOR = 0x10,
+	KVMPPC_GS_CLASS_INTR = 0x20,
+};
+
+/**
+ * Types of guest state buffer elements
+ */
+enum {
+	KVMPPC_GSE_BE32,
+	KVMPPC_GSE_BE64,
+	KVMPPC_GSE_VEC128,
+	KVMPPC_GSE_PARTITION_TABLE,
+	KVMPPC_GSE_PROCESS_TABLE,
+	KVMPPC_GSE_BUFFER,
+	__KVMPPC_GSE_TYPE_MAX,
+};
+
+/**
+ * Flags for guest state elements
+ */
+enum {
+	KVMPPC_GS_FLAGS_WIDE = 0x01,
+};
+
+/**
+ * struct kvmppc_gs_part_table - deserialized partition table information
+ * element
+ * @address: start of the partition table
+ * @ea_bits: number of bits in the effective address
+ * @gpd_size: root page directory size
+ */
+struct kvmppc_gs_part_table {
+	u64 address;
+	u64 ea_bits;
+	u64 gpd_size;
+};
+
+/**
+ * struct kvmppc_gs_proc_table - deserialized process table information element
+ * @address: start of the process table
+ * @gpd_size: process table size
+ */
+struct kvmppc_gs_proc_table {
+	u64 address;
+	u64 gpd_size;
+};
+
+/**
+ * struct kvmppc_gs_buff_info - deserialized meta guest state buffer information
+ * @address: start of the guest state buffer
+ * @size: size of the guest state buffer
+ */
+struct kvmppc_gs_buff_info {
+	u64 address;
+	u64 size;
+};
+
+/**
+ * struct kvmppc_gs_header - serialized guest state buffer header
+ * @nelem: count of guest state elements in the buffer
+ * @data: start of the stream of elements in the buffer
+ */
+struct kvmppc_gs_header {
+	__be32 nelems;
+	char data[];
+} __packed;
+
+/**
+ * struct kvmppc_gs_elem - serialized guest state buffer element
+ * @iden: Guest State ID
+ * @len: length of data
+ * @data: the guest state buffer element's value
+ */
+struct kvmppc_gs_elem {
+	__be16 iden;
+	__be16 len;
+	char data[];
+} __packed;
+
+/**
+ * struct kvmppc_gs_buff - a guest state buffer with metadata.
+ * @capacity: total length of the buffer
+ * @len: current length of the elements and header
+ * @guest_id: guest id associated with the buffer
+ * @vcpu_id: vcpu_id associated with the buffer
+ * @hdr: the serialised guest state buffer
+ */
+struct kvmppc_gs_buff {
+	size_t capacity;
+	size_t len;
+	unsigned long guest_id;
+	unsigned long vcpu_id;
+	struct kvmppc_gs_header *hdr;
+};
+
+/**
+ * struct kvmppc_gs_bitmap - a bitmap for element ids
+ * @bitmap: a bitmap large enough for all Guest State IDs
+ */
+struct kvmppc_gs_bitmap {
+	/* private: */
+	DECLARE_BITMAP(bitmap, KVMPPC_GSE_IDEN_COUNT);
+};
+
+/**
+ * struct kvmppc_gs_parser - a map of element ids to locations in a buffer
+ * @iterator: bitmap used for iterating
+ * @gses: contains the pointers to elements
+ *
+ * A guest state parser is used for deserialising a guest state buffer.
+ * Given a buffer, it then allows looking up guest state elements using
+ * a guest state id.
+ */
+struct kvmppc_gs_parser {
+	/* private: */
+	struct kvmppc_gs_bitmap iterator;
+	struct kvmppc_gs_elem *gses[KVMPPC_GSE_IDEN_COUNT];
+};
+
+enum {
+	GSM_GUEST_WIDE = 0x1,
+	GSM_SEND = 0x2,
+	GSM_RECEIVE = 0x4,
+	GSM_GSB_OWNER = 0x8,
+};
+
+struct kvmppc_gs_msg;
+
+/**
+ * struct kvmppc_gs_msg_ops - guest state message behavior
+ * @get_size: maximum size required for the message data
+ * @fill_info: serializes to the guest state buffer format
+ * @refresh_info: dserializes from the guest state buffer format
+ */
+struct kvmppc_gs_msg_ops {
+	size_t (*get_size)(struct kvmppc_gs_msg *gsm);
+	int (*fill_info)(struct kvmppc_gs_buff *gsb, struct kvmppc_gs_msg *gsm);
+	int (*refresh_info)(struct kvmppc_gs_msg *gsm,
+			    struct kvmppc_gs_buff *gsb);
+};
+
+/**
+ * struct kvmppc_gs_msg - a guest state message
+ * @bitmap: the guest state ids that should be included
+ * @ops: modify message behavior for reading and writing to buffers
+ * @flags: guest wide or thread wide
+ * @data: location where buffer data will be written to or from.
+ *
+ * A guest state message is allows flexibility in sending in receiving data
+ * in a guest state buffer format.
+ */
+struct kvmppc_gs_msg {
+	struct kvmppc_gs_bitmap bitmap;
+	struct kvmppc_gs_msg_ops *ops;
+	unsigned long flags;
+	void *data;
+};
+
+/**************************************************************************
+ * Guest State IDs
+ **************************************************************************/
+
+u16 kvmppc_gsid_size(u16 iden);
+unsigned long kvmppc_gsid_flags(u16 iden);
+u64 kvmppc_gsid_mask(u16 iden);
+
+/**************************************************************************
+ * Guest State Buffers
+ **************************************************************************/
+struct kvmppc_gs_buff *kvmppc_gsb_new(size_t size, unsigned long guest_id,
+				      unsigned long vcpu_id, gfp_t flags);
+void kvmppc_gsb_free(struct kvmppc_gs_buff *gsb);
+void *kvmppc_gsb_put(struct kvmppc_gs_buff *gsb, size_t size);
+
+/**
+ * kvmppc_gsb_header() - the header of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns a pointer to the buffer header.
+ */
+static inline struct kvmppc_gs_header *
+kvmppc_gsb_header(struct kvmppc_gs_buff *gsb)
+{
+	return gsb->hdr;
+}
+
+/**
+ * kvmppc_gsb_data() - the elements of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns a pointer to the first element of the buffer data.
+ */
+static inline struct kvmppc_gs_elem *kvmppc_gsb_data(struct kvmppc_gs_buff *gsb)
+{
+	return (struct kvmppc_gs_elem *)kvmppc_gsb_header(gsb)->data;
+}
+
+/**
+ * kvmppc_gsb_len() - the current length of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the length including the header of a buffer.
+ */
+static inline size_t kvmppc_gsb_len(struct kvmppc_gs_buff *gsb)
+{
+	return gsb->len;
+}
+
+/**
+ * kvmppc_gsb_capacity() - the capacity of a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the capacity of a buffer.
+ */
+static inline size_t kvmppc_gsb_capacity(struct kvmppc_gs_buff *gsb)
+{
+	return gsb->capacity;
+}
+
+/**
+ * kvmppc_gsb_paddress() - the physical address of buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the physical address of the buffer.
+ */
+static inline u64 kvmppc_gsb_paddress(struct kvmppc_gs_buff *gsb)
+{
+	return __pa(kvmppc_gsb_header(gsb));
+}
+
+/**
+ * kvmppc_gsb_nelems() - the number of elements in a buffer
+ * @gsb: guest state buffer
+ *
+ * Returns the number of elements in a buffer
+ */
+static inline u32 kvmppc_gsb_nelems(struct kvmppc_gs_buff *gsb)
+{
+	return be32_to_cpu(kvmppc_gsb_header(gsb)->nelems);
+}
+
+/**
+ * kvmppc_gsb_reset() - empty a guest state buffer
+ * @gsb: guest state buffer
+ *
+ * Reset the number of elements and length of buffer to empty.
+ */
+static inline void kvmppc_gsb_reset(struct kvmppc_gs_buff *gsb)
+{
+	kvmppc_gsb_header(gsb)->nelems = cpu_to_be32(0);
+	gsb->len = sizeof(struct kvmppc_gs_header);
+}
+
+/**
+ * kvmppc_gsb_data_len() - the length of a buffer excluding the header
+ * @gsb: guest state buffer
+ *
+ * Returns the length of a buffer excluding the header
+ */
+static inline size_t kvmppc_gsb_data_len(struct kvmppc_gs_buff *gsb)
+{
+	return gsb->len - sizeof(struct kvmppc_gs_header);
+}
+
+/**
+ * kvmppc_gsb_data_cap() - the capacity of a buffer excluding the header
+ * @gsb: guest state buffer
+ *
+ * Returns the capacity of a buffer excluding the header
+ */
+static inline size_t kvmppc_gsb_data_cap(struct kvmppc_gs_buff *gsb)
+{
+	return gsb->capacity - sizeof(struct kvmppc_gs_header);
+}
+
+/**
+ * kvmppc_gsb_for_each_elem - iterate over the elements in a buffer
+ * @i: loop counter
+ * @pos: set to current element
+ * @gsb: guest state buffer
+ * @rem: initialized to buffer capacity, holds bytes currently remaining in
+ *  stream
+ */
+#define kvmppc_gsb_for_each_elem(i, pos, gsb, rem)               \
+	kvmppc_gse_for_each_elem(i, kvmppc_gsb_nelems(gsb), pos, \
+				 kvmppc_gsb_data(gsb),           \
+				 kvmppc_gsb_data_cap(gsb), rem)
+
+/**************************************************************************
+ * Guest State Elements
+ **************************************************************************/
+
+/**
+ * kvmppc_gse_iden() - guest state ID of element
+ * @gse: guest state element
+ *
+ * Return the guest state ID in host endianness.
+ */
+static inline u16 kvmppc_gse_iden(const struct kvmppc_gs_elem *gse)
+{
+	return be16_to_cpu(gse->iden);
+}
+
+/**
+ * kvmppc_gse_len() - length of guest state element data
+ * @gse: guest state element
+ *
+ * Returns the length of guest state element data
+ */
+static inline u16 kvmppc_gse_len(const struct kvmppc_gs_elem *gse)
+{
+	return be16_to_cpu(gse->len);
+}
+
+/**
+ * kvmppc_gse_total_len() - total length of guest state element
+ * @gse: guest state element
+ *
+ * Returns the length of the data plus the ID and size header.
+ */
+static inline u16 kvmppc_gse_total_len(const struct kvmppc_gs_elem *gse)
+{
+	return be16_to_cpu(gse->len) + sizeof(*gse);
+}
+
+/**
+ * kvmppc_gse_total_size() - space needed for a given data length
+ * @size: data length
+ *
+ * Returns size plus the space needed for the ID and size header.
+ */
+static inline u16 kvmppc_gse_total_size(u16 size)
+{
+	return sizeof(struct kvmppc_gs_elem) + size;
+}
+
+/**
+ * kvmppc_gse_data() - pointer to data of a guest state element
+ * @gse: guest state element
+ *
+ * Returns a pointer to the beginning of guest state element data.
+ */
+static inline void *kvmppc_gse_data(const struct kvmppc_gs_elem *gse)
+{
+	return (void *)gse->data;
+}
+
+/**
+ * kvmppc_gse_ok() - checks space exists for guest state element
+ * @gse: guest state element
+ * @remaining: bytes of space remaining
+ *
+ * Returns true if the guest state element can fit in remaining space.
+ */
+static inline bool kvmppc_gse_ok(const struct kvmppc_gs_elem *gse,
+				 int remaining)
+{
+	return remaining >= kvmppc_gse_total_len(gse);
+}
+
+/**
+ * kvmppc_gse_next() - iterate to the next guest state element in a stream
+ * @gse: stream of guest state elements
+ * @remaining: length of the guest element stream
+ *
+ * Returns the next guest state element in a stream of elements. The length of
+ * the stream is updated in remaining.
+ */
+static inline struct kvmppc_gs_elem *
+kvmppc_gse_next(const struct kvmppc_gs_elem *gse, int *remaining)
+{
+	int len = sizeof(*gse) + kvmppc_gse_len(gse);
+
+	*remaining -= len;
+	return (struct kvmppc_gs_elem *)(gse->data + kvmppc_gse_len(gse));
+}
+
+/**
+ * kvmppc_gse_for_each_elem - iterate over a stream of guest state elements
+ * @i: loop counter
+ * @max: number of elements
+ * @pos: set to current element
+ * @head: head of elements
+ * @len: length of the stream
+ * @rem: initialized to len, holds bytes currently remaining elements
+ */
+#define kvmppc_gse_for_each_elem(i, max, pos, head, len, rem)                  \
+	for (i = 0, pos = head, rem = len; kvmppc_gse_ok(pos, rem) && i < max; \
+	     pos = kvmppc_gse_next(pos, &(rem)), i++)
+
+int __kvmppc_gse_put(struct kvmppc_gs_buff *gsb, u16 iden, u16 size,
+		     const void *data);
+int kvmppc_gse_parse(struct kvmppc_gs_parser *gsp, struct kvmppc_gs_buff *gsb);
+
+/**
+ * kvmppc_gse_put_be32() - add a be32 guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: big endian value
+ */
+static inline int kvmppc_gse_put_be32(struct kvmppc_gs_buff *gsb, u16 iden,
+				      __be32 val)
+{
+	__be32 tmp;
+
+	tmp = val;
+	return __kvmppc_gse_put(gsb, iden, sizeof(__be32), &tmp);
+}
+
+/**
+ * kvmppc_gse_put_u32() - add a host endian 32bit int guest state element to a
+ * buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ */
+static inline int kvmppc_gse_put_u32(struct kvmppc_gs_buff *gsb, u16 iden,
+				     u32 val)
+{
+	__be32 tmp;
+
+	val &= kvmppc_gsid_mask(iden);
+	tmp = cpu_to_be32(val);
+	return kvmppc_gse_put_be32(gsb, iden, tmp);
+}
+
+/**
+ * kvmppc_gse_put_be64() - add a be64 guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: big endian value
+ */
+static inline int kvmppc_gse_put_be64(struct kvmppc_gs_buff *gsb, u16 iden,
+				      __be64 val)
+{
+	__be64 tmp;
+
+	tmp = val;
+	return __kvmppc_gse_put(gsb, iden, sizeof(__be64), &tmp);
+}
+
+/**
+ * kvmppc_gse_put_u64() - add a host endian 64bit guest state element to a
+ * buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ */
+static inline int kvmppc_gse_put_u64(struct kvmppc_gs_buff *gsb, u16 iden,
+				     u64 val)
+{
+	__be64 tmp;
+
+	val &= kvmppc_gsid_mask(iden);
+	tmp = cpu_to_be64(val);
+	return kvmppc_gse_put_be64(gsb, iden, tmp);
+}
+
+/**
+ * __kvmppc_gse_put_reg() - add a register type guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: host endian value
+ *
+ * Adds a register type guest state element. Uses the guest state ID for
+ * determining the length of the guest element. If the guest state ID has
+ * bits that can not be set they will be cleared.
+ */
+static inline int __kvmppc_gse_put_reg(struct kvmppc_gs_buff *gsb, u16 iden,
+				       u64 val)
+{
+	val &= kvmppc_gsid_mask(iden);
+	if (kvmppc_gsid_size(iden) == sizeof(u64))
+		return kvmppc_gse_put_u64(gsb, iden, val);
+
+	if (kvmppc_gsid_size(iden) == sizeof(u32)) {
+		u32 tmp;
+
+		tmp = (u32)val;
+		if (tmp != val)
+			return -EINVAL;
+
+		return kvmppc_gse_put_u32(gsb, iden, tmp);
+	}
+	return -EINVAL;
+}
+
+/**
+ * kvmppc_gse_put_vector128() - add a vector guest state element to a buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: 16 byte vector value
+ */
+static inline int kvmppc_gse_put_vector128(struct kvmppc_gs_buff *gsb, u16 iden,
+					   vector128 *val)
+{
+	__be64 tmp[2] = { 0 };
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u;
+
+	u.v = *val;
+	tmp[0] = cpu_to_be64(u.dw[TS_FPROFFSET]);
+#ifdef CONFIG_VSX
+	tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
+#endif
+	return __kvmppc_gse_put(gsb, iden, sizeof(tmp), &tmp);
+}
+
+/**
+ * kvmppc_gse_put_part_table() - add a partition table guest state element to a
+ * buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: partition table value
+ */
+static inline int kvmppc_gse_put_part_table(struct kvmppc_gs_buff *gsb,
+					    u16 iden,
+					    struct kvmppc_gs_part_table val)
+{
+	__be64 tmp[3];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.ea_bits);
+	tmp[2] = cpu_to_be64(val.gpd_size);
+	return __kvmppc_gse_put(gsb, KVMPPC_GSID_PARTITION_TABLE, sizeof(tmp),
+				&tmp);
+}
+
+/**
+ * kvmppc_gse_put_proc_table() - add a process table guest state element to a
+ * buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: process table value
+ */
+static inline int kvmppc_gse_put_proc_table(struct kvmppc_gs_buff *gsb,
+					    u16 iden,
+					    struct kvmppc_gs_proc_table val)
+{
+	__be64 tmp[2];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.gpd_size);
+	return __kvmppc_gse_put(gsb, KVMPPC_GSID_PROCESS_TABLE, sizeof(tmp),
+				&tmp);
+}
+
+/**
+ * kvmppc_gse_put_buff_info() - adds a GSB description guest state element to a
+ * buffer
+ * @gsb: guest state buffer to add element to
+ * @iden: guest state ID
+ * @val: guest state buffer description value
+ */
+static inline int kvmppc_gse_put_buff_info(struct kvmppc_gs_buff *gsb, u16 iden,
+					   struct kvmppc_gs_buff_info val)
+{
+	__be64 tmp[2];
+
+	tmp[0] = cpu_to_be64(val.address);
+	tmp[1] = cpu_to_be64(val.size);
+	return __kvmppc_gse_put(gsb, iden, sizeof(tmp), &tmp);
+}
+
+int __kvmppc_gse_put(struct kvmppc_gs_buff *gsb, u16 iden, u16 size,
+		     const void *data);
+
+/**
+ * kvmppc_gse_get_be32() - return the data of a be32 element
+ * @gse: guest state element
+ */
+static inline __be32 kvmppc_gse_get_be32(const struct kvmppc_gs_elem *gse)
+{
+	if (WARN_ON(kvmppc_gse_len(gse) != sizeof(__be32)))
+		return 0;
+	return *(__be32 *)kvmppc_gse_data(gse);
+}
+
+/**
+ * kvmppc_gse_get_u32() - return the data of a be32 element in host endianness
+ * @gse: guest state element
+ */
+static inline u32 kvmppc_gse_get_u32(const struct kvmppc_gs_elem *gse)
+{
+	return be32_to_cpu(kvmppc_gse_get_be32(gse));
+}
+
+/**
+ * kvmppc_gse_get_be64() - return the data of a be64 element
+ * @gse: guest state element
+ */
+static inline __be64 kvmppc_gse_get_be64(const struct kvmppc_gs_elem *gse)
+{
+	if (WARN_ON(kvmppc_gse_len(gse) != sizeof(__be64)))
+		return 0;
+	return *(__be64 *)kvmppc_gse_data(gse);
+}
+
+/**
+ * kvmppc_gse_get_u64() - return the data of a be64 element in host endianness
+ * @gse: guest state element
+ */
+static inline u64 kvmppc_gse_get_u64(const struct kvmppc_gs_elem *gse)
+{
+	return be64_to_cpu(kvmppc_gse_get_be64(gse));
+}
+
+/**
+ * kvmppc_gse_get_vector128() - return the data of a vector element
+ * @gse: guest state element
+ */
+static inline void kvmppc_gse_get_vector128(const struct kvmppc_gs_elem *gse,
+					    vector128 *v)
+{
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u = { 0 };
+	__be64 *src;
+
+	if (WARN_ON(kvmppc_gse_len(gse) != sizeof(__vector128)))
+		*v = u.v;
+
+	src = (__be64 *)kvmppc_gse_data(gse);
+	u.dw[TS_FPROFFSET] = be64_to_cpu(src[0]);
+#ifdef CONFIG_VSX
+	u.dw[TS_VSRLOWOFFSET] = be64_to_cpu(src[1]);
+#endif
+	*v = u.v;
+}
+
+/**************************************************************************
+ * Guest State Bitmap
+ **************************************************************************/
+
+bool kvmppc_gsbm_test(struct kvmppc_gs_bitmap *gsbm, u16 iden);
+void kvmppc_gsbm_set(struct kvmppc_gs_bitmap *gsbm, u16 iden);
+void kvmppc_gsbm_clear(struct kvmppc_gs_bitmap *gsbm, u16 iden);
+u16 kvmppc_gsbm_next(struct kvmppc_gs_bitmap *gsbm, u16 prev);
+
+/**
+ * kvmppc_gsbm_zero - zero the entire bitmap
+ * @gsbm: guest state buffer bitmap
+ */
+static inline void kvmppc_gsbm_zero(struct kvmppc_gs_bitmap *gsbm)
+{
+	bitmap_zero(gsbm->bitmap, KVMPPC_GSE_IDEN_COUNT);
+}
+
+/**
+ * kvmppc_gsbm_fill - fill the entire bitmap
+ * @gsbm: guest state buffer bitmap
+ */
+static inline void kvmppc_gsbm_fill(struct kvmppc_gs_bitmap *gsbm)
+{
+	bitmap_fill(gsbm->bitmap, KVMPPC_GSE_IDEN_COUNT);
+	clear_bit(0, gsbm->bitmap);
+}
+
+/**
+ * kvmppc_gsbm_for_each - iterate the present guest state IDs
+ * @gsbm: guest state buffer bitmap
+ * @iden: current guest state ID
+ */
+#define kvmppc_gsbm_for_each(gsbm, iden)                  \
+	for (iden = kvmppc_gsbm_next(gsbm, 0); iden != 0; \
+	     iden = kvmppc_gsbm_next(gsbm, iden))
+
+/**************************************************************************
+ * Guest State Parser
+ **************************************************************************/
+
+void kvmppc_gsp_insert(struct kvmppc_gs_parser *gsp, u16 iden,
+		       struct kvmppc_gs_elem *gse);
+struct kvmppc_gs_elem *kvmppc_gsp_lookup(struct kvmppc_gs_parser *gsp,
+					 u16 iden);
+
+/**
+ * kvmppc_gsp_for_each - iterate the <guest state IDs, guest state element>
+ * pairs
+ * @gsp: guest state buffer bitmap
+ * @iden: current guest state ID
+ * @gse: guest state element
+ */
+#define kvmppc_gsp_for_each(gsp, iden, gse)                              \
+	for (iden = kvmppc_gsbm_next(&(gsp)->iterator, 0),               \
+	    gse = kvmppc_gsp_lookup((gsp), iden);                        \
+	     iden != 0; iden = kvmppc_gsbm_next(&(gsp)->iterator, iden), \
+	    gse = kvmppc_gsp_lookup((gsp), iden))
+
+/**************************************************************************
+ * Guest State Message
+ **************************************************************************/
+
+/**
+ * kvmppc_gsm_for_each - iterate the guest state IDs included in a guest state
+ * message
+ * @gsp: guest state buffer bitmap
+ * @iden: current guest state ID
+ * @gse: guest state element
+ */
+#define kvmppc_gsm_for_each(gsm, iden)                            \
+	for (iden = kvmppc_gsbm_next(&gsm->bitmap, 0); iden != 0; \
+	     iden = kvmppc_gsbm_next(&gsm->bitmap, iden))
+
+int kvmppc_gsm_init(struct kvmppc_gs_msg *mgs, struct kvmppc_gs_msg_ops *ops,
+		    void *data, unsigned long flags);
+
+struct kvmppc_gs_msg *kvmppc_gsm_new(struct kvmppc_gs_msg_ops *ops, void *data,
+				     unsigned long flags, gfp_t gfp_flags);
+void kvmppc_gsm_free(struct kvmppc_gs_msg *gsm);
+size_t kvmppc_gsm_size(struct kvmppc_gs_msg *gsm);
+int kvmppc_gsm_fill_info(struct kvmppc_gs_msg *gsm, struct kvmppc_gs_buff *gsb);
+int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
+			    struct kvmppc_gs_buff *gsb);
+
+/**
+ * kvmppc_gsm_include - indicate a guest state ID should be included when
+ * serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline void kvmppc_gsm_include(struct kvmppc_gs_msg *gsm, u16 iden)
+{
+	kvmppc_gsbm_set(&gsm->bitmap, iden);
+}
+
+/**
+ * kvmppc_gsm_includes - check if a guest state ID will be included when
+ * serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline bool kvmppc_gsm_includes(struct kvmppc_gs_msg *gsm, u16 iden)
+{
+	return kvmppc_gsbm_test(&gsm->bitmap, iden);
+}
+
+/**
+ * kvmppc_gsm_includes - indicate all guest state IDs should be included when
+ * serializing
+ * @gsm: guest state message
+ * @iden: guest state ID
+ */
+static inline void kvmppc_gsm_include_all(struct kvmppc_gs_msg *gsm)
+{
+	kvmppc_gsbm_fill(&gsm->bitmap);
+}
+
+/**
+ * kvmppc_gsm_include - clear the guest state IDs that should be included when
+ * serializing
+ * @gsm: guest state message
+ */
+static inline void kvmppc_gsm_reset(struct kvmppc_gs_msg *gsm)
+{
+	kvmppc_gsbm_zero(&gsm->bitmap);
+}
+
+#endif /* _ASM_POWERPC_GUEST_STATE_BUFFER_H */
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 5319d889b184..eb8445e71c14 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -87,8 +87,11 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
 	book3s_hv_ras.o \
 	book3s_hv_builtin.o \
 	book3s_hv_p9_perf.o \
+	guest-state-buffer.o \
 	$(kvm-book3s_64-builtin-tm-objs-y) \
 	$(kvm-book3s_64-builtin-xics-objs-y)
+
+obj-$(CONFIG_GUEST_STATE_BUFFER_TEST) += test-guest-state-buffer.o
 endif
 
 kvm-book3s_64-objs-$(CONFIG_KVM_XICS) += \
diff --git a/arch/powerpc/kvm/guest-state-buffer.c b/arch/powerpc/kvm/guest-state-buffer.c
new file mode 100644
index 000000000000..0775652a1209
--- /dev/null
+++ b/arch/powerpc/kvm/guest-state-buffer.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "asm/hvcall.h"
+#include <linux/log2.h>
+#include <asm/pgalloc.h>
+#include <asm/guest-state-buffer.h>
+
+static const u16 kvmppc_gse_iden_len[__KVMPPC_GSE_TYPE_MAX] = {
+	[KVMPPC_GSE_BE32] = sizeof(__be32),
+	[KVMPPC_GSE_BE64] = sizeof(__be64),
+	[KVMPPC_GSE_VEC128] = sizeof(vector128),
+	[KVMPPC_GSE_PARTITION_TABLE] = sizeof(struct kvmppc_gs_part_table),
+	[KVMPPC_GSE_PROCESS_TABLE] = sizeof(struct kvmppc_gs_proc_table),
+	[KVMPPC_GSE_BUFFER] = sizeof(struct kvmppc_gs_buff_info),
+};
+
+/**
+ * kvmppc_gsb_new() - create a new guest state buffer
+ * @size: total size of the guest state buffer (includes header)
+ * @guest_id: guest_id
+ * @vcpu_id: vcpu_id
+ * @flags: GFP flags
+ *
+ * Returns a guest state buffer.
+ */
+struct kvmppc_gs_buff *kvmppc_gsb_new(size_t size, unsigned long guest_id,
+				      unsigned long vcpu_id, gfp_t flags)
+{
+	struct kvmppc_gs_buff *gsb;
+
+	gsb = kzalloc(sizeof(*gsb), flags);
+	if (!gsb)
+		return NULL;
+
+	size = roundup_pow_of_two(size);
+	gsb->hdr = kzalloc(size, GFP_KERNEL);
+	if (!gsb->hdr)
+		goto free;
+
+	gsb->capacity = size;
+	gsb->len = sizeof(struct kvmppc_gs_header);
+	gsb->vcpu_id = vcpu_id;
+	gsb->guest_id = guest_id;
+
+	gsb->hdr->nelems = cpu_to_be32(0);
+
+	return gsb;
+
+free:
+	kfree(gsb);
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsb_new);
+
+/**
+ * kvmppc_gsb_free() - free a guest state buffer
+ * @gsb: guest state buffer
+ */
+void kvmppc_gsb_free(struct kvmppc_gs_buff *gsb)
+{
+	kfree(gsb->hdr);
+	kfree(gsb);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsb_free);
+
+/**
+ * kvmppc_gsb_put() - allocate space in a guest state buffer
+ * @gsb: buffer to allocate in
+ * @size: amount of space to allocate
+ *
+ * Returns a pointer to the amount of space requested within the buffer and
+ * increments the count of elements in the buffer.
+ *
+ * Does not check if there is enough space in the buffer.
+ */
+void *kvmppc_gsb_put(struct kvmppc_gs_buff *gsb, size_t size)
+{
+	u32 nelems = kvmppc_gsb_nelems(gsb);
+	void *p;
+
+	p = (void *)kvmppc_gsb_header(gsb) + kvmppc_gsb_len(gsb);
+	gsb->len += size;
+
+	kvmppc_gsb_header(gsb)->nelems = cpu_to_be32(nelems + 1);
+	return p;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsb_put);
+
+static int kvmppc_gsid_class(u16 iden)
+{
+	if ((iden >= KVMPPC_GSE_GUESTWIDE_START) &&
+	    (iden <= KVMPPC_GSE_GUESTWIDE_END))
+		return KVMPPC_GS_CLASS_GUESTWIDE;
+
+	if ((iden >= KVMPPC_GSE_META_START) && (iden <= KVMPPC_GSE_META_END))
+		return KVMPPC_GS_CLASS_META;
+
+	if ((iden >= KVMPPC_GSE_DW_REGS_START) &&
+	    (iden <= KVMPPC_GSE_DW_REGS_END))
+		return KVMPPC_GS_CLASS_DWORD_REG;
+
+	if ((iden >= KVMPPC_GSE_W_REGS_START) &&
+	    (iden <= KVMPPC_GSE_W_REGS_END))
+		return KVMPPC_GS_CLASS_WORD_REG;
+
+	if ((iden >= KVMPPC_GSE_VSRS_START) && (iden <= KVMPPC_GSE_VSRS_END))
+		return KVMPPC_GS_CLASS_VECTOR;
+
+	if ((iden >= KVMPPC_GSE_INTR_REGS_START) &&
+	    (iden <= KVMPPC_GSE_INTR_REGS_END))
+		return KVMPPC_GS_CLASS_INTR;
+
+	return -1;
+}
+
+static int kvmppc_gsid_type(u16 iden)
+{
+	int type = -1;
+
+	switch (kvmppc_gsid_class(iden)) {
+	case KVMPPC_GS_CLASS_GUESTWIDE:
+		switch (iden) {
+		case KVMPPC_GSID_HOST_STATE_SIZE:
+		case KVMPPC_GSID_RUN_OUTPUT_MIN_SIZE:
+		case KVMPPC_GSID_TB_OFFSET:
+			type = KVMPPC_GSE_BE64;
+			break;
+		case KVMPPC_GSID_PARTITION_TABLE:
+			type = KVMPPC_GSE_PARTITION_TABLE;
+			break;
+		case KVMPPC_GSID_PROCESS_TABLE:
+			type = KVMPPC_GSE_PROCESS_TABLE;
+			break;
+		case KVMPPC_GSID_LOGICAL_PVR:
+			type = KVMPPC_GSE_BE32;
+			break;
+		}
+		break;
+	case KVMPPC_GS_CLASS_META:
+		switch (iden) {
+		case KVMPPC_GSID_RUN_INPUT:
+		case KVMPPC_GSID_RUN_OUTPUT:
+			type = KVMPPC_GSE_BUFFER;
+			break;
+		case KVMPPC_GSID_VPA:
+			type = KVMPPC_GSE_BE64;
+			break;
+		}
+		break;
+	case KVMPPC_GS_CLASS_DWORD_REG:
+		type = KVMPPC_GSE_BE64;
+		break;
+	case KVMPPC_GS_CLASS_WORD_REG:
+		type = KVMPPC_GSE_BE32;
+		break;
+	case KVMPPC_GS_CLASS_VECTOR:
+		type = KVMPPC_GSE_VEC128;
+		break;
+	case KVMPPC_GS_CLASS_INTR:
+		switch (iden) {
+		case KVMPPC_GSID_HDAR:
+		case KVMPPC_GSID_ASDR:
+		case KVMPPC_GSID_HEIR:
+			type = KVMPPC_GSE_BE64;
+			break;
+		case KVMPPC_GSID_HDSISR:
+			type = KVMPPC_GSE_BE32;
+			break;
+		}
+		break;
+	}
+
+	return type;
+}
+
+/**
+ * kvmppc_gsid_flags() - the flags for a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns any flags for the guest state ID.
+ */
+unsigned long kvmppc_gsid_flags(u16 iden)
+{
+	unsigned long flags = 0;
+
+	switch (kvmppc_gsid_class(iden)) {
+	case KVMPPC_GS_CLASS_GUESTWIDE:
+		flags = KVMPPC_GS_FLAGS_WIDE;
+		break;
+	case KVMPPC_GS_CLASS_META:
+	case KVMPPC_GS_CLASS_DWORD_REG:
+	case KVMPPC_GS_CLASS_WORD_REG:
+	case KVMPPC_GS_CLASS_VECTOR:
+	case KVMPPC_GS_CLASS_INTR:
+		break;
+	}
+
+	return flags;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsid_flags);
+
+/**
+ * kvmppc_gsid_size() - the size of a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns the size of guest state ID.
+ */
+u16 kvmppc_gsid_size(u16 iden)
+{
+	int type;
+
+	type = kvmppc_gsid_type(iden);
+	if (type == -1)
+		return 0;
+
+	if (type >= __KVMPPC_GSE_TYPE_MAX)
+		return 0;
+
+	return kvmppc_gse_iden_len[type];
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsid_size);
+
+/**
+ * kvmppc_gsid_mask() - the settable bits of a guest state ID
+ * @iden: guest state ID
+ *
+ * Returns a mask of settable bits for a guest state ID.
+ */
+u64 kvmppc_gsid_mask(u16 iden)
+{
+	u64 mask = ~0ull;
+
+	switch (iden) {
+	case KVMPPC_GSID_LPCR:
+		mask = LPCR_DPFD | LPCR_ILE | LPCR_AIL | LPCR_LD | LPCR_MER |
+		       LPCR_GTSE;
+		break;
+	case KVMPPC_GSID_MSR:
+		mask = ~(MSR_HV | MSR_S | MSR_ME);
+		break;
+	}
+
+	return mask;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsid_mask);
+
+/**
+ * __kvmppc_gse_put() - add a guest state element to a buffer
+ * @gsb: buffer to the element to
+ * @iden: guest state ID
+ * @size: length of data
+ * @data: pointer to data
+ */
+int __kvmppc_gse_put(struct kvmppc_gs_buff *gsb, u16 iden, u16 size,
+		     const void *data)
+{
+	struct kvmppc_gs_elem *gse;
+	u16 total_size;
+
+	total_size = sizeof(*gse) + size;
+	if (total_size + kvmppc_gsb_len(gsb) > kvmppc_gsb_capacity(gsb))
+		return -ENOMEM;
+
+	if (kvmppc_gsid_size(iden) != size)
+		return -EINVAL;
+
+	gse = kvmppc_gsb_put(gsb, total_size);
+	gse->iden = cpu_to_be16(iden);
+	gse->len = cpu_to_be16(size);
+	memcpy(gse->data, data, size);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__kvmppc_gse_put);
+
+/**
+ * kvmppc_gse_parse() - create a parse map from a guest state buffer
+ * @gsp: guest state parser
+ * @gsb: guest state buffer
+ */
+int kvmppc_gse_parse(struct kvmppc_gs_parser *gsp, struct kvmppc_gs_buff *gsb)
+{
+	struct kvmppc_gs_elem *curr;
+	int rem, i;
+
+	kvmppc_gsb_for_each_elem(i, curr, gsb, rem) {
+		if (kvmppc_gse_len(curr) !=
+		    kvmppc_gsid_size(kvmppc_gse_iden(curr)))
+			return -EINVAL;
+		kvmppc_gsp_insert(gsp, kvmppc_gse_iden(curr), curr);
+	}
+
+	if (kvmppc_gsb_nelems(gsb) != i)
+		return -EINVAL;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gse_parse);
+
+static inline int kvmppc_gse_flatten_iden(u16 iden)
+{
+	int bit = 0;
+	int class;
+
+	class = kvmppc_gsid_class(iden);
+
+	if (class == KVMPPC_GS_CLASS_GUESTWIDE) {
+		bit += iden - KVMPPC_GSE_GUESTWIDE_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_GUESTWIDE_COUNT;
+
+	if (class == KVMPPC_GS_CLASS_META) {
+		bit += iden - KVMPPC_GSE_META_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_META_COUNT;
+
+	if (class == KVMPPC_GS_CLASS_DWORD_REG) {
+		bit += iden - KVMPPC_GSE_DW_REGS_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_DW_REGS_COUNT;
+
+	if (class == KVMPPC_GS_CLASS_WORD_REG) {
+		bit += iden - KVMPPC_GSE_W_REGS_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_W_REGS_COUNT;
+
+	if (class == KVMPPC_GS_CLASS_VECTOR) {
+		bit += iden - KVMPPC_GSE_VSRS_START;
+		return bit;
+	}
+
+	bit += KVMPPC_GSE_VSRS_COUNT;
+
+	if (class == KVMPPC_GS_CLASS_INTR) {
+		bit += iden - KVMPPC_GSE_INTR_REGS_START;
+		return bit;
+	}
+
+	return 0;
+}
+
+static inline u16 kvmppc_gse_unflatten_iden(int bit)
+{
+	u16 iden;
+
+	if (bit < KVMPPC_GSE_GUESTWIDE_COUNT) {
+		iden = KVMPPC_GSE_GUESTWIDE_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_GUESTWIDE_COUNT;
+
+	if (bit < KVMPPC_GSE_META_COUNT) {
+		iden = KVMPPC_GSE_META_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_META_COUNT;
+
+	if (bit < KVMPPC_GSE_DW_REGS_COUNT) {
+		iden = KVMPPC_GSE_DW_REGS_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_DW_REGS_COUNT;
+
+	if (bit < KVMPPC_GSE_W_REGS_COUNT) {
+		iden = KVMPPC_GSE_W_REGS_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_W_REGS_COUNT;
+
+	if (bit < KVMPPC_GSE_VSRS_COUNT) {
+		iden = KVMPPC_GSE_VSRS_START + bit;
+		return iden;
+	}
+	bit -= KVMPPC_GSE_VSRS_COUNT;
+
+	if (bit < KVMPPC_GSE_IDEN_COUNT) {
+		iden = KVMPPC_GSE_INTR_REGS_START + bit;
+		return iden;
+	}
+
+	return 0;
+}
+
+/**
+ * kvmppc_gsp_insert() - add a mapping from an guest state ID to an element
+ * @gsp: guest state parser
+ * @iden: guest state id (key)
+ * @gse: guest state element (value)
+ */
+void kvmppc_gsp_insert(struct kvmppc_gs_parser *gsp, u16 iden,
+		       struct kvmppc_gs_elem *gse)
+{
+	int i;
+
+	i = kvmppc_gse_flatten_iden(iden);
+	kvmppc_gsbm_set(&gsp->iterator, iden);
+	gsp->gses[i] = gse;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsp_insert);
+
+/**
+ * kvmppc_gsp_lookup() - lookup an element from a guest state ID
+ * @gsp: guest state parser
+ * @iden: guest state ID (key)
+ *
+ * Returns the guest state element if present.
+ */
+struct kvmppc_gs_elem *kvmppc_gsp_lookup(struct kvmppc_gs_parser *gsp, u16 iden)
+{
+	int i;
+
+	i = kvmppc_gse_flatten_iden(iden);
+	return gsp->gses[i];
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsp_lookup);
+
+/**
+ * kvmppc_gsbm_set() - set the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+void kvmppc_gsbm_set(struct kvmppc_gs_bitmap *gsbm, u16 iden)
+{
+	set_bit(kvmppc_gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsbm_set);
+
+/**
+ * kvmppc_gsbm_clear() - clear the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+void kvmppc_gsbm_clear(struct kvmppc_gs_bitmap *gsbm, u16 iden)
+{
+	clear_bit(kvmppc_gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsbm_clear);
+
+/**
+ * kvmppc_gsbm_test() - test the guest state ID
+ * @gsbm: guest state bitmap
+ * @iden: guest state ID
+ */
+bool kvmppc_gsbm_test(struct kvmppc_gs_bitmap *gsbm, u16 iden)
+{
+	return test_bit(kvmppc_gse_flatten_iden(iden), gsbm->bitmap);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsbm_test);
+
+/**
+ * kvmppc_gsbm_next() - return the next set guest state ID
+ * @gsbm: guest state bitmap
+ * @prev: last guest state ID
+ */
+u16 kvmppc_gsbm_next(struct kvmppc_gs_bitmap *gsbm, u16 prev)
+{
+	int bit, pbit;
+
+	pbit = prev ? kvmppc_gse_flatten_iden(prev) + 1 : 0;
+	bit = find_next_bit(gsbm->bitmap, KVMPPC_GSE_IDEN_COUNT, pbit);
+
+	if (bit < KVMPPC_GSE_IDEN_COUNT)
+		return kvmppc_gse_unflatten_iden(bit);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsbm_next);
+
+/**
+ * kvmppc_gsm_init() - initialize a guest state message
+ * @gsm: guest state message
+ * @ops: callbacks
+ * @data: private data
+ * @flags: guest wide or thread wide
+ */
+int kvmppc_gsm_init(struct kvmppc_gs_msg *gsm, struct kvmppc_gs_msg_ops *ops,
+		    void *data, unsigned long flags)
+{
+	memset(gsm, 0, sizeof(*gsm));
+	gsm->ops = ops;
+	gsm->data = data;
+	gsm->flags = flags;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_init);
+
+/**
+ * kvmppc_gsm_init() - creates a new guest state message
+ * @ops: callbacks
+ * @data: private data
+ * @flags: guest wide or thread wide
+ * @gfp_flags: GFP allocation flags
+ *
+ * Returns an initialized guest state message.
+ */
+struct kvmppc_gs_msg *kvmppc_gsm_new(struct kvmppc_gs_msg_ops *ops, void *data,
+				     unsigned long flags, gfp_t gfp_flags)
+{
+	struct kvmppc_gs_msg *gsm;
+
+	gsm = kzalloc(sizeof(*gsm), gfp_flags);
+	if (!gsm)
+		return NULL;
+
+	kvmppc_gsm_init(gsm, ops, data, flags);
+
+	return gsm;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_new);
+
+/**
+ * kvmppc_gsm_size() - creates a new guest state message
+ * @gsm: self
+ *
+ * Returns the size required for the message.
+ */
+size_t kvmppc_gsm_size(struct kvmppc_gs_msg *gsm)
+{
+	if (gsm->ops->get_size)
+		return gsm->ops->get_size(gsm);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_size);
+
+/**
+ * kvmppc_gsm_free() - free guest state message
+ * @gsm: guest state message
+ *
+ * Returns the size required for the message.
+ */
+void kvmppc_gsm_free(struct kvmppc_gs_msg *gsm)
+{
+	kfree(gsm);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_free);
+
+/**
+ * kvmppc_gsm_fill_info() - serialises message to guest state buffer format
+ * @gsm: self
+ * @gsb: buffer to serialise into
+ */
+int kvmppc_gsm_fill_info(struct kvmppc_gs_msg *gsm, struct kvmppc_gs_buff *gsb)
+{
+	if (!gsm->ops->fill_info)
+		return -EINVAL;
+
+	return gsm->ops->fill_info(gsb, gsm);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_fill_info);
+
+/**
+ * kvmppc_gsm_fill_info() - deserialises from guest state buffer
+ * @gsm: self
+ * @gsb: buffer to serialise from
+ */
+int kvmppc_gsm_refresh_info(struct kvmppc_gs_msg *gsm,
+			    struct kvmppc_gs_buff *gsb)
+{
+	if (!gsm->ops->fill_info)
+		return -EINVAL;
+
+	return gsm->ops->refresh_info(gsm, gsb);
+}
+EXPORT_SYMBOL_GPL(kvmppc_gsm_refresh_info);
diff --git a/arch/powerpc/kvm/test-guest-state-buffer.c b/arch/powerpc/kvm/test-guest-state-buffer.c
new file mode 100644
index 000000000000..4720b8dc8837
--- /dev/null
+++ b/arch/powerpc/kvm/test-guest-state-buffer.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/init.h>
+#include <linux/log2.h>
+#include <kunit/test.h>
+
+#include <asm/guest-state-buffer.h>
+
+static void test_creating_buffer(struct kunit *test)
+{
+	struct kvmppc_gs_buff *gsb;
+	size_t size = 0x100;
+
+	gsb = kvmppc_gsb_new(size, 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb->hdr);
+
+	KUNIT_EXPECT_EQ(test, gsb->capacity, roundup_pow_of_two(size));
+	KUNIT_EXPECT_EQ(test, gsb->len, sizeof(__be32));
+
+	kvmppc_gsb_free(gsb);
+}
+
+static void test_adding_element(struct kunit *test)
+{
+	const struct kvmppc_gs_elem *head, *curr;
+	union {
+		__vector128 v;
+		u64 dw[2];
+	} u;
+	int rem;
+	struct kvmppc_gs_buff *gsb;
+	size_t size = 0x1000;
+	int i, rc;
+	u64 data;
+
+	gsb = kvmppc_gsb_new(size, 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	/* Single elements, direct use of __kvmppc_gse_put() */
+	data = 0xdeadbeef;
+	rc = __kvmppc_gse_put(gsb, KVMPPC_GSID_GPR(0), 8, &data);
+	KUNIT_EXPECT_GE(test, rc, 0);
+
+	head = kvmppc_gsb_data(gsb);
+	KUNIT_EXPECT_EQ(test, kvmppc_gse_iden(head), KVMPPC_GSID_GPR(0));
+	KUNIT_EXPECT_EQ(test, kvmppc_gse_len(head), 8);
+	data = 0;
+	memcpy(&data, kvmppc_gse_data(head), 8);
+	KUNIT_EXPECT_EQ(test, data, 0xdeadbeef);
+
+	/* Multiple elements, simple wrapper */
+	rc = kvmppc_gse_put_u64(gsb, KVMPPC_GSID_GPR(1), 0xcafef00d);
+	KUNIT_EXPECT_GE(test, rc, 0);
+
+	u.dw[0] = 0x1;
+	u.dw[1] = 0x2;
+	rc = kvmppc_gse_put_vector128(gsb, KVMPPC_GSID_VSRS(0), &u.v);
+	KUNIT_EXPECT_GE(test, rc, 0);
+	u.dw[0] = 0x0;
+	u.dw[1] = 0x0;
+
+	kvmppc_gsb_for_each_elem(i, curr, gsb, rem) {
+		switch (i) {
+		case 0:
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_iden(curr),
+					KVMPPC_GSID_GPR(0));
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_len(curr), 8);
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_get_be64(curr),
+					0xdeadbeef);
+			break;
+		case 1:
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_iden(curr),
+					KVMPPC_GSID_GPR(1));
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_len(curr), 8);
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_get_u64(curr),
+					0xcafef00d);
+			break;
+		case 2:
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_iden(curr),
+					KVMPPC_GSID_VSRS(0));
+			KUNIT_EXPECT_EQ(test, kvmppc_gse_len(curr), 16);
+			kvmppc_gse_get_vector128(curr, &u.v);
+			KUNIT_EXPECT_EQ(test, u.dw[0], 0x1);
+			KUNIT_EXPECT_EQ(test, u.dw[1], 0x2);
+			break;
+		}
+	}
+	KUNIT_EXPECT_EQ(test, i, 3);
+
+	kvmppc_gsb_reset(gsb);
+	KUNIT_EXPECT_EQ(test, kvmppc_gsb_nelems(gsb), 0);
+	KUNIT_EXPECT_EQ(test, kvmppc_gsb_len(gsb),
+			sizeof(struct kvmppc_gs_header));
+
+	kvmppc_gsb_free(gsb);
+}
+
+static void test_gs_parsing(struct kunit *test)
+{
+	struct kvmppc_gs_elem *gse;
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmppc_gs_buff *gsb;
+	size_t size = 0x1000;
+	u64 tmp1, tmp2;
+
+	gsb = kvmppc_gsb_new(size, 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	tmp1 = 0xdeadbeefull;
+	kvmppc_gse_put_u64(gsb, KVMPPC_GSID_GPR(0), tmp1);
+
+	KUNIT_EXPECT_GE(test, kvmppc_gse_parse(&gsp, gsb), 0);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_GPR(0));
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gse);
+
+	tmp2 = kvmppc_gse_get_u64(gse);
+	KUNIT_EXPECT_EQ(test, tmp2, 0xdeadbeefull);
+
+	kvmppc_gsb_free(gsb);
+}
+
+static void test_gs_bitmap(struct kunit *test)
+{
+	struct kvmppc_gs_bitmap gsbm = { 0 };
+	struct kvmppc_gs_bitmap gsbm1 = { 0 };
+	struct kvmppc_gs_bitmap gsbm2 = { 0 };
+	u16 iden;
+	int i, j;
+
+	i = 0;
+	for (u16 iden = KVMPPC_GSID_HOST_STATE_SIZE;
+	     iden <= KVMPPC_GSID_PROCESS_TABLE; iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = KVMPPC_GSID_RUN_INPUT; iden <= KVMPPC_GSID_VPA;
+	     iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = KVMPPC_GSID_GPR(0); iden <= KVMPPC_GSID_CTRL; iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = KVMPPC_GSID_CR; iden <= KVMPPC_GSID_PSPB; iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = KVMPPC_GSID_VSRS(0); iden <= KVMPPC_GSID_VSRS(63);
+	     iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	for (u16 iden = KVMPPC_GSID_HDAR; iden <= KVMPPC_GSID_ASDR; iden++) {
+		kvmppc_gsbm_set(&gsbm, iden);
+		kvmppc_gsbm_set(&gsbm1, iden);
+		KUNIT_EXPECT_TRUE(test, kvmppc_gsbm_test(&gsbm, iden));
+		kvmppc_gsbm_clear(&gsbm, iden);
+		KUNIT_EXPECT_FALSE(test, kvmppc_gsbm_test(&gsbm, iden));
+		i++;
+	}
+
+	j = 0;
+	kvmppc_gsbm_for_each(&gsbm1, iden)
+	{
+		kvmppc_gsbm_set(&gsbm2, iden);
+		j++;
+	}
+	KUNIT_EXPECT_EQ(test, i, j);
+	KUNIT_EXPECT_MEMEQ(test, &gsbm1, &gsbm2, sizeof(gsbm1));
+}
+
+struct kvmppc_gs_msg_test1_data {
+	u64 a;
+	u32 b;
+	struct kvmppc_gs_part_table c;
+	struct kvmppc_gs_proc_table d;
+	struct kvmppc_gs_buff_info e;
+};
+
+static size_t test1_get_size(struct kvmppc_gs_msg *gsm)
+{
+	size_t size = 0;
+	u16 ids[] = {
+		KVMPPC_GSID_PARTITION_TABLE,
+		KVMPPC_GSID_PROCESS_TABLE,
+		KVMPPC_GSID_RUN_INPUT,
+		KVMPPC_GSID_GPR(0),
+		KVMPPC_GSID_CR,
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(ids); i++)
+		size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
+	return size;
+}
+
+static int test1_fill_info(struct kvmppc_gs_buff *gsb,
+			   struct kvmppc_gs_msg *gsm)
+{
+	struct kvmppc_gs_msg_test1_data *data = gsm->data;
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_GPR(0)))
+		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_GPR(0), data->a);
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_CR))
+		kvmppc_gse_put_u32(gsb, KVMPPC_GSID_CR, data->b);
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_PARTITION_TABLE))
+		kvmppc_gse_put_part_table(gsb, KVMPPC_GSID_PARTITION_TABLE,
+					  data->c);
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_PROCESS_TABLE))
+		kvmppc_gse_put_proc_table(gsb, KVMPPC_GSID_PARTITION_TABLE,
+					  data->d);
+
+	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_RUN_INPUT))
+		kvmppc_gse_put_buff_info(gsb, KVMPPC_GSID_RUN_INPUT, data->e);
+
+	return 0;
+}
+
+static int test1_refresh_info(struct kvmppc_gs_msg *gsm,
+			      struct kvmppc_gs_buff *gsb)
+{
+	struct kvmppc_gs_parser gsp = { 0 };
+	struct kvmppc_gs_msg_test1_data *data = gsm->data;
+	struct kvmppc_gs_elem *gse;
+	int rc;
+
+	rc = kvmppc_gse_parse(&gsp, gsb);
+	if (rc < 0)
+		return rc;
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_GPR(0));
+	if (gse)
+		data->a = kvmppc_gse_get_u64(gse);
+
+	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_CR);
+	if (gse)
+		data->b = kvmppc_gse_get_u32(gse);
+
+	return 0;
+}
+
+static struct kvmppc_gs_msg_ops gs_msg_test1_ops = {
+	.get_size = test1_get_size,
+	.fill_info = test1_fill_info,
+	.refresh_info = test1_refresh_info,
+};
+
+static void test_gs_msg(struct kunit *test)
+{
+	struct kvmppc_gs_msg_test1_data test1_data = {
+		.a = 0xdeadbeef,
+		.b = 0x1,
+	};
+	struct kvmppc_gs_msg *gsm;
+	struct kvmppc_gs_buff *gsb;
+
+	gsm = kvmppc_gsm_new(&gs_msg_test1_ops, &test1_data, GSM_SEND,
+			     GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsm);
+
+	gsb = kvmppc_gsb_new(kvmppc_gsm_size(gsm), 0, 0, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gsb);
+
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_PARTITION_TABLE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_PROCESS_TABLE);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_RUN_INPUT);
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_GPR(0));
+	kvmppc_gsm_include(gsm, KVMPPC_GSID_CR);
+
+	kvmppc_gsm_fill_info(gsm, gsb);
+
+	memset(&test1_data, 0, sizeof(test1_data));
+
+	kvmppc_gsm_refresh_info(gsm, gsb);
+	KUNIT_EXPECT_EQ(test, test1_data.a, 0xdeadbeef);
+	KUNIT_EXPECT_EQ(test, test1_data.b, 0x1);
+
+	kvmppc_gsm_free(gsm);
+}
+
+static struct kunit_case guest_state_buffer_testcases[] = {
+	KUNIT_CASE(test_creating_buffer),
+	KUNIT_CASE(test_adding_element),
+	KUNIT_CASE(test_gs_bitmap),
+	KUNIT_CASE(test_gs_parsing),
+	KUNIT_CASE(test_gs_msg),
+	{}
+};
+
+static struct kunit_suite guest_state_buffer_test_suite = {
+	.name = "guest_state_buffer_test",
+	.test_cases = guest_state_buffer_testcases,
+};
+
+kunit_test_suites(&guest_state_buffer_test_suite);
+
+MODULE_LICENSE("GPL");
-- 
2.39.3

