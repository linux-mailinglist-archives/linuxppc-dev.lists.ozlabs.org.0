Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5032DF9D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:20:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CzsqF62MKzDqbt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:20:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kaod.org (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Czrzf1Ds4zDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 18:42:54 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BL7VuOH097959; Mon, 21 Dec 2020 02:42:41 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35jjqaec08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 02:42:41 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BL7al67030863;
 Mon, 21 Dec 2020 07:42:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 35h9589sd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Dec 2020 07:42:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0BL7gatx21758232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Dec 2020 07:42:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFFFB42049;
 Mon, 21 Dec 2020 07:42:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD48142041;
 Mon, 21 Dec 2020 07:42:36 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 21 Dec 2020 07:42:36 +0000 (GMT)
Received: from yukon.ibmuc.com (sig-9-145-39-10.uk.ibm.com [9.145.39.10])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 2181122024D;
 Mon, 21 Dec 2020 08:42:36 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 19/23] KVM: PPC: Book3S HV: Include prototypes
Date: Mon, 21 Dec 2020 08:42:18 +0100
Message-Id: <20201221074222.403894-20-clg@kaod.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201221074222.403894-1-clg@kaod.org>
References: <20201221074222.403894-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-21_02:2020-12-19,
 2020-12-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1034
 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0 spamscore=0
 mlxscore=0 mlxlogscore=867 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012210049
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It fixes these W=3D1 compile errors :

 CC [M]  arch/powerpc/kvm/book3s_64_mmu_hv.o
../arch/powerpc/kvm/book3s_64_mmu_hv.c:879:5: error: no previous prototyp=
e for =E2=80=98kvm_unmap_hva_range_hv=E2=80=99 [-Werror=3Dmissing-prototy=
pes]
  879 | int kvm_unmap_hva_range_hv(struct kvm *kvm, unsigned long start, =
unsigned long end)
      |     ^~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_64_mmu_hv.c:888:6: error: no previous prototyp=
e for =E2=80=98kvmppc_core_flush_memslot_hv=E2=80=99 [-Werror=3Dmissing-p=
rototypes]
  888 | void kvmppc_core_flush_memslot_hv(struct kvm *kvm,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_64_mmu_hv.c:970:5: error: no previous prototyp=
e for =E2=80=98kvm_age_hva_hv=E2=80=99 [-Werror=3Dmissing-prototypes]
  970 | int kvm_age_hva_hv(struct kvm *kvm, unsigned long start, unsigned=
 long end)
      |     ^~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_64_mmu_hv.c:1011:5: error: no previous prototy=
pe for =E2=80=98kvm_test_age_hva_hv=E2=80=99 [-Werror=3Dmissing-prototype=
s]
 1011 | int kvm_test_age_hva_hv(struct kvm *kvm, unsigned long hva)
      |     ^~~~~~~~~~~~~~~~~~~
../arch/powerpc/kvm/book3s_64_mmu_hv.c:1019:6: error: no previous prototy=
pe for =E2=80=98kvm_set_spte_hva_hv=E2=80=99 [-Werror=3Dmissing-prototype=
s]
 1019 | void kvm_set_spte_hva_hv(struct kvm *kvm, unsigned long hva, pte_=
t pte)
      |      ^~~~~~~~~~~~~~~~~~~

Cc: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3=
s_64_mmu_hv.c
index 38ea396a23d6..c77f2d4f44ca 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -27,6 +27,7 @@
 #include <asm/cputable.h>
 #include <asm/pte-walk.h>
=20
+#include "book3s.h"
 #include "trace_hv.h"
=20
 //#define DEBUG_RESIZE_HPT	1
--=20
2.26.2

