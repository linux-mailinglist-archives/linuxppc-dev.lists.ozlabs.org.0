Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BE454EF9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 14:35:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y5HC3hqQzDqNr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:35:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y55S0cG4zDqNZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 22:27:23 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PCMaBB100688
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 08:27:19 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbkc00tup-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 08:27:19 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Tue, 25 Jun 2019 13:27:17 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 13:27:15 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5PCRDBj41353632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 12:27:13 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C2A652051;
 Tue, 25 Jun 2019 12:27:13 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.230])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 021905204E;
 Tue, 25 Jun 2019 12:27:11 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] powerpc/papr_scm: Workaround for failure of drc bind
 after kexec
Date: Tue, 25 Jun 2019 17:57:06 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062512-0020-0000-0000-0000034D38F6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062512-0021-0000-0000-000021A0A84C
Message-Id: <20190625122709.11846-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=691 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250099
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Presently an error is returned in response to hcall H_SCM_BIND_MEM when a
new kernel boots on lpar via kexec. This prevents papr_scm from registering
drc memory regions with nvdimm. The error reported is of the form below:

"papr_scm ibm,persistent-memory:ibm,pmemory@44100002: bind err: -68"

On investigation it was revealed that phyp returns this error as previous
kernel did not completely release bindings for drc scm-memory blocks and
hence phyp rejected request for re-binding these block to lpar with error
H_OVERLAP. Also support for a new H_SCM_UNBIND_ALL is recently added which
is better suited for releasing all the bound scm-memory block from an lpar.

So leveraging new hcall H_SCM_UNBIND_ALL, we can workaround H_OVERLAP issue
during kexec by forcing an unbind of all drm scm-memory blocks and issuing
H_SCM_BIND_MEM to re-bind the drc scm-memory blocks to lpar. This sequence
will also be needed when a new kernel boot on lpar after previous kernel
panicked and it never got an opportunity to call H_SCM_UNBIND_MEM/ALL.

Hence this patch-set implements following changes to papr_scm module:

* Update hvcall.h to include opcodes for new hcall H_SCM_UNBIND_ALL.

* Update it to use H_SCM_UNBIND_ALL instead of H_SCM_UNBIND_MEM

* In case hcall H_SCM_BIND_MEM fails with error H_OVERLAP, force
  H_SCM_UNBIND_ALL and retry the bind operation again.

With the patch-set applied re-bind of drc scm-memory to lpar succeeds after
a kexec to new kernel as illustrated below:

# Old kernel
$ sudo ndctl list -R
[
  {
    "dev":"region0",
    <snip>
    ....
  }
]
# kexec to new kernel
$ sudo kexec --initrd=... vmlinux
...
...
I'm in purgatory
...
papr_scm ibm,persistent-memory:ibm,pmemory@44100002: Un-binding and retrying
...
# New kernel
$ sudo ndctl list -R
[
  {
    "dev":"region0",
    <snip>
    ....
  }
]

---
Change-log:

v2:
* Addressed review comments from Oliver on v1 patchset.

Vaibhav Jain (3):
  powerpc/pseries: Update SCM hcall op-codes in hvcall.h
  powerpc/papr_scm: Update drc_pmem_unbind() to use H_SCM_UNBIND_ALL
  powerpc/papr_scm: Force a scm-unbind if initial scm-bind fails

 arch/powerpc/include/asm/hvcall.h         |  9 +++--
 arch/powerpc/platforms/pseries/papr_scm.c | 44 ++++++++++++++++++-----
 2 files changed, 43 insertions(+), 10 deletions(-)

-- 
2.21.0

