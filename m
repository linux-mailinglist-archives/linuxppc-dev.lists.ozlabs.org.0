Return-Path: <linuxppc-dev+bounces-2404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538F9A44EB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:38:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVX3Q3DBYz3cFf;
	Sat, 19 Oct 2024 04:37:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729273074;
	cv=none; b=juH1Ftvh8/A1RU3jR3nrNKOvVb64zytUxLKDYnTyhNgYCTsnB4ADuVp4CGCN9hXC/4xFJ1C77u04bIqNJdD4dWXB51ubwJy50FRNe38mphG4XjKbpwQoACbvoO3HI6rHk17avijnDkn/jQFLTO32SeI9+qcS5KRrBzpWURqey968YZuzW4INWvR/5xsFEaR314vjMl3Q9S7GW3U2qFoYvqWE/wgDPl/AyP+tpwN8sk4WtAkA2bOK+W0e8LCLZ+zZ8doNMckL2ksMiXhpAiNIoQtgrZlQ9FN5l/rkuvGEc2hzNJJpP7bhG0pxC3OpP2TQXLvfsIofgRv3OTfbIfrvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729273074; c=relaxed/relaxed;
	bh=AVtaaKl0jM+tjrPFqNyLwdiM2YM1RYXONNwrIPYlQdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TxUW8bvlzk7b0PVRAAqEviIFqiu/B6ukPfPf2VOiKdmx9vF7IYz52/Bs1IUH8pVOhSUVTiqk+Ju1Kd0+yMba/GqvGNVSlMbQ4pcm5ltKYY0v13PlKTycbIMSk36wiPaYlNjVtggZd0gZ9VOxzo2B1Ynb/mazRxo3I1h8nc4DjxPq8TTSCv7NBlp3tXKtj83LtkB2v+J3W3gCWsRoBSdZ6MJzMmeErGdOHNWnUgQdlgColZsOBIo6jSRtCWUvmlxDHsV+0NpFXyB1VvsImTcnnHOPuTLl3lFXa0yyVGLJHQiiLUfCgkS0R7rhXsMFrvwbR3TarQA+yM7xgDdPCm+Hiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZHr4oqh8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZHr4oqh8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVX3P3D1Cz3c3K
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:37:53 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ICZmv3023701;
	Fri, 18 Oct 2024 17:37:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AVtaaKl0jM+tjrPFq
	NyLwdiM2YM1RYXONNwrIPYlQdE=; b=ZHr4oqh8HBz1ejuoBktsmUs++ukn8w2XG
	ZoZWw9lplAmUwGyLiLjYNYCAYHKQrWD9yjGZxaLrNd9Y4M//F81tQE7vNUX+s35o
	zOKpLqtM4gxIqXgkp+lTkWB5oeMNRX9u3t8ipDlEtCpzTjXdy0ktUQEhRAG73/gK
	HmacUV6kqMigEufurmsSNhFawzmPUiLu10lpXUnA5UumR5FmNKMUCRc+VAXXrDgx
	0dc8Kk5n1K0MxXjk1TOLLtSFcmXV26nE0C22arNQ2y61FNebcy8KdKK8j7xXe6iR
	Evyjj1sTW2ebzCE1aufoDcNbbC94+EwitigfJgERTdMhcrcWQTFOQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0ua933-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:31 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49IHbV3E019314;
	Fri, 18 Oct 2024 17:37:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42ar0ua92v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49IGAo4C005937;
	Fri, 18 Oct 2024 17:37:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 428651dkdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 17:37:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49IHbQG718022712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Oct 2024 17:37:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC73520043;
	Fri, 18 Oct 2024 17:37:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE3E820040;
	Fri, 18 Oct 2024 17:37:22 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.99.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Oct 2024 17:37:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v6 11/17] kbuild: Add generic hook for architectures to use before the final vmlinux link
Date: Fri, 18 Oct 2024 23:06:26 +0530
Message-ID: <20241018173632.277333-12-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018173632.277333-1-hbathini@linux.ibm.com>
References: <20241018173632.277333-1-hbathini@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nBXMvXz7wrIX63la6i4oOD2m3uiRJ6Dw
X-Proofpoint-ORIG-GUID: 3XaY1Kp85eNFubEexUjYDyr_wrD3sunt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180111
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

On powerpc, we would like to be able to make a pass on vmlinux.o and
generate a new object file to be linked into vmlinux. Add a generic pass
in Makefile.vmlinux that architectures can use for this purpose.

Architectures need to select CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX and must
provide arch/<arch>/tools/Makefile with .arch.vmlinux.o target, which
will be invoked prior to the final vmlinux link step.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
* Intermediate files named vmlinux.arch.* instead of .vmlinux.arch.*
* Used 'bool' instead of 'def_bool n'
* Missing FORCE added for vmlinux.arch.o


 arch/Kconfig             | 6 ++++++
 scripts/Makefile.vmlinux | 7 +++++++
 scripts/link-vmlinux.sh  | 7 ++++++-
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8af374ea1adc..a1538927c8c1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1684,4 +1684,10 @@ config CC_HAS_SANE_FUNCTION_ALIGNMENT
 config ARCH_NEED_CMPXCHG_1_EMU
 	bool
 
+config ARCH_WANTS_PRE_LINK_VMLINUX
+	bool
+	help
+	  An architecture can select this if it provides arch/<arch>/tools/Makefile
+	  with .arch.vmlinux.o target to be linked into vmlinux.
+
 endmenu
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 1284f05555b9..dddad554e912 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -22,6 +22,13 @@ targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
 endif
 
+ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
+vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
+
+arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
+	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools $@
+endif
+
 ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
 
 # Final link of vmlinux with optional arch pass after final link
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index a9b3f34a78d2..7acf4e31e51c 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -100,7 +100,7 @@ vmlinux_link()
 	${ld} ${ldflags} -o ${output}					\
 		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
 		${wl}--start-group ${libs} ${wl}--end-group		\
-		${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
+		${kallsymso} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
 }
 
 # generate .BTF typeinfo from DWARF debuginfo
@@ -198,6 +198,11 @@ fi
 
 ${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init init/version-timestamp.o
 
+arch_vmlinux_o=""
+if is_enabled CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX; then
+	arch_vmlinux_o=arch/${SRCARCH}/tools/vmlinux.arch.o
+fi
+
 btf_vmlinux_bin_o=
 kallsymso=
 strip_debug=
-- 
2.47.0


