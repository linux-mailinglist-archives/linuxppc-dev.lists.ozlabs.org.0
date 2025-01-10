Return-Path: <linuxppc-dev+bounces-4967-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B81A08C50
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 10:37:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTxQn1623z3cB3;
	Fri, 10 Jan 2025 20:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736501873;
	cv=none; b=G64X7aa4oYGKeNYyDsCMvcJPzahEhB32YGd+fXxvTQXMPe0A3p+D03LT3BFD5NHI/wxNWlv2tHkc8f1IvNB2TzNf221MRGJkWqIe4i+wms2zJE2D/rt7QBTRVSSPFnZVL9ypHZZBfenklp4PIoHPSjm4QpG4cAYb1rpP4Y7txZNXsTylWsj91MoYEq5FxmiiaTS/WEEtc3gFwxKBC45+nLlY2DhNbE6XUVJM8A3DS+wVLT0Xz/Qdd8kc1KFVXpIvqn5xm9gw2E2F9vfESDj4plZb/fICgjrY7Rlzlu0hrzQPdEVkfQXTvhYGKDCieCaYJH4ZO4C2qakjEWdbize7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736501873; c=relaxed/relaxed;
	bh=TSvN27zBgYEDLhVxxKsauuh9EoGy1d7wXzEbI2XcIWc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JpiiBN7A5wtm2zXLWNJzmiN/NW9hAa3hETiu3jxVqeOd+IV2jOMC4crfhiQ8C3Wlw7xEKp9TaheKMM1F3Z40fOmRCVddNRraYKlbq58xF5sOBmg1a3nAppnCgHriyJD09eUfMKUpseq64FidpBjxCf17g5GTP2eao543RVyzcRJ2nzOuuVz4xUJwt253hBwpPpYTpCzE+1dF8TSPHSsGQw0wCUga1QqlYx3CaZP/4gtZFKEk57UiuBPmUu+A5z0vXFT4lEYNs6O3EfiLxXzjsFVX8lTiv0sOGbm4rdP486qs3vQHv8UbyOGVb4v/8DOxriLCpnrpna5aJvzPrw5qMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9odWsG8; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J9odWsG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTxQm134Cz3c9g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 20:37:51 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509NwHHn000788;
	Fri, 10 Jan 2025 09:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=TSvN27zBgYEDLhVxxKsauuh9EoGy1d7wXzEbI2XcI
	Wc=; b=J9odWsG8+Tub5c7zijY65pFtUybwMHkC572qWu/uJpdxszeDxO9QISvJZ
	1SkhKK/vUWaTx1W4kJ/fc4bQH3J3xT1H6NTQrsCoxgbj3MDFp4KonGrzYjq8HV2v
	ucpFHFjcFW0ebxpmDCQljDkbhiU4urwyMkOeZ63bnzGp1SjnFfUodl+lXBnRIr0Y
	q8tXqXMOK1y7aLzz9EuPxJ5irwm+nPsdNdixZyMonp1OltDJ2oHYfyQW2J1X6yR2
	TUywn4utflIkhLk27moqehVGK9nrTmq5nhBsgDXKUVeUk+D2s4QASSWFE1ANcHwE
	BznIpYqbAnUdzcmNAT+uR9tCYaxEw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhsvdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:37:46 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A9OhFu022862;
	Fri, 10 Jan 2025 09:37:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442rkhsvd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:37:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A5nHYA015795;
	Fri, 10 Jan 2025 09:37:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm9g9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:37:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A9bell25625202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 09:37:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF02520040;
	Fri, 10 Jan 2025 09:37:40 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4259420043;
	Fri, 10 Jan 2025 09:37:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.241.17])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 09:37:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH V2] tools/perf/builtin-lock: Fix return code for functions in __cmd_contention
Date: Fri, 10 Jan 2025 15:07:30 +0530
Message-Id: <20250110093730.93610-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
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
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SGlhLc6TF-HnbvK2IHfMwW-XXXq-_4mq
X-Proofpoint-GUID: xlpasoyjlZUMnpmr6m8qOMw_W3zslOrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100078
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf lock contention returns zero exit value even if the lock contention
BPF setup failed.

  # ./perf lock con -b true
  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
  libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
  libbpf: failed to find valid kernel BTF
  libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
  libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
  libbpf: failed to find valid kernel BTF
  libbpf: Error loading vmlinux BTF: -ESRCH
  libbpf: failed to load object 'lock_contention_bpf'
  libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
  Failed to load lock-contention BPF skeleton
  lock contention BPF setup failed
  # echo $?
   0

Fix this by saving the return code for lock_contention_prepare
so that command exits with proper return code. Similarly set the
return code properly for two other functions in builtin-lock, namely
setup_output_field() and select_key().

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2
 Fixed return code in functions: setup_output_field()
 and select_key() as pointed out by Namhyung.

 tools/perf/builtin-lock.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index 208c482daa56..94a2bc15a2fa 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const char **argv)
 				goto out_delete;
 		}
 
-		if (lock_contention_prepare(&con) < 0) {
+		err = lock_contention_prepare(&con);
+		if (err < 0) {
 			pr_err("lock contention BPF setup failed\n");
 			goto out_delete;
 		}
@@ -2070,10 +2071,14 @@ static int __cmd_contention(int argc, const char **argv)
 		}
 	}
 
-	if (setup_output_field(true, output_fields))
+	err = setup_output_field(true, output_fields);
+	if (err) {
+		pr_err("Failed to setup output field\n");
 		goto out_delete;
+	}
 
-	if (select_key(true))
+	err = select_key(true);
+	if (err)
 		goto out_delete;
 
 	if (symbol_conf.field_sep) {
-- 
2.43.5


