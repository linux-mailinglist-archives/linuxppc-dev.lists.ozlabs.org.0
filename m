Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E13EA5EBC06
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 09:53:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McBhD3tD6z3cCC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:53:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1vmthHc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d1vmthHc;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McBgY0GBnz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 17:52:56 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R7RrfN003060;
	Tue, 27 Sep 2022 07:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=cHE7lrcn16mA8EML+xbjQhGs1OhtEXPVbBeJ62ihTBQ=;
 b=d1vmthHcxItFfX9L08QJPLx1h10e9dVVzI6BYva99/ezMI2bXea1V1F6Q2CN/e+KOuXi
 8x77prl/hRyCD8bt0muR601DZ3pati5ifBXLtEwDrQCuxBBgOvJXnu6YSEyQvTlgpYZc
 7ZUJwdkhn/VD1bIW/heMVfFB0X3m40FEkmDcEqrC8Jfnl53aEwJ+4i91/0z4nKCt+OgU
 Iy3VVXY2Y2B3InNw/w2XbMYpODwkT5Fl0jrBCRDsJyeMJF19yDPpkIP0CeLUG0cRq+Vc
 Ga1NB+r+vzP2YnNypHWVDland0bI/04JEhAz1gdfciBW1aGw41HKEcbF9LrZLx4W9jHA 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3juvtdgkjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 07:52:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28R7UCdp009678;
	Tue, 27 Sep 2022 07:52:33 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3juvtdgkhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 07:52:33 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28R7psu3015958;
	Tue, 27 Sep 2022 07:52:31 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3jssh92m9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Sep 2022 07:52:31 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28R7qS5S5374586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Sep 2022 07:52:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0D9752050;
	Tue, 27 Sep 2022 07:52:28 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.94.238])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A705752051;
	Tue, 27 Sep 2022 07:52:26 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] scripts/faddr2line: Fix regression in name resolution on ppc64le
Date: Tue, 27 Sep 2022 13:22:11 +0530
Message-Id: <20220927075211.897152-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.34.3
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HWBmjJbKSMX3_2jZ8JK5u-A6ZPIZoGVt
X-Proofpoint-ORIG-GUID: OejE7pt4GMwj1nz1Jcx1kkT4W3GvQReb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209270043
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1d1a0e7c5100 ("scripts/faddr2line: Fix overlapping text section failures")
can cause scripts/faddr2line to fail on ppc64le machines on few
distributions, while working on other distributions. The failure can be
attributed to difference in readelf output on various distributions.

$ ./scripts/faddr2line vmlinux find_busiest_group+0x00
no match for find_busiest_group+0x00

Expected output was:
$ ./scripts/faddr2line vmlinux find_busiest_group+0x00
find_busiest_group+0x00/0x3d0:
find_busiest_group at kernel/sched/fair.c:9595

On ppc64le, readelf adds localentry tag before the symbol name on few
distributions and adds the localentry tag after the symbol name on few
other distributions. This problem has been discussed in the reference
URL given below. This problem can be overcome by filtering out
localentry tags in readelf output. Similar fixes are already present in
kernel by way of commits:

1fd6cee127e2 ("libbpf: Fix VERSIONED_SYM_COUNT number parsing")
aa915931ac3e ("libbpf: Fix readelf output parsing for Fedora")

Fixes: 1d1a0e7c5100 ("scripts/faddr2line: Fix overlapping text section failures")
Reference: https://lore.kernel.org/bpf/20191211160133.GB4580@calabresa/
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 scripts/faddr2line | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/faddr2line b/scripts/faddr2line
index 5514c23f45c2..0e73aca4f908 100755
--- a/scripts/faddr2line
+++ b/scripts/faddr2line
@@ -74,7 +74,8 @@ command -v ${ADDR2LINE} >/dev/null 2>&1 || die "${ADDR2LINE} isn't installed"
 find_dir_prefix() {
 	local objfile=$1
 
-	local start_kernel_addr=$(${READELF} --symbols --wide $objfile | ${AWK} '$8 == "start_kernel" {printf "0x%s", $2}')
+	local start_kernel_addr=$(${READELF} --symbols --wide $objfile | sed 's/\[.*\]//' |
+		${AWK} '$8 == "start_kernel" {printf "0x%s", $2}')
 	[[ -z $start_kernel_addr ]] && return
 
 	local file_line=$(${ADDR2LINE} -e $objfile $start_kernel_addr)
@@ -178,7 +179,7 @@ __faddr2line() {
 				found=2
 				break
 			fi
-		done < <(${READELF} --symbols --wide $objfile | ${AWK} -v sec=$sym_sec '$7 == sec' | sort --key=2)
+		done < <(${READELF} --symbols --wide $objfile | sed 's/\[.*\]//' | ${AWK} -v sec=$sym_sec '$7 == sec' | sort --key=2)
 
 		if [[ $found = 0 ]]; then
 			warn "can't find symbol: sym_name: $sym_name sym_sec: $sym_sec sym_addr: $sym_addr sym_elf_size: $sym_elf_size"
@@ -259,7 +260,7 @@ __faddr2line() {
 
 		DONE=1
 
-	done < <(${READELF} --symbols --wide $objfile | ${AWK} -v fn=$sym_name '$4 == "FUNC" && $8 == fn')
+	done < <(${READELF} --symbols --wide $objfile | sed 's/\[.*\]//' | ${AWK} -v fn=$sym_name '$4 == "FUNC" && $8 == fn')
 }
 
 [[ $# -lt 2 ]] && usage

base-commit: bf682942cd26ce9cd5e87f73ae099b383041e782
-- 
2.31.1

