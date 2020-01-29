Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D8B14CD6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:31:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4876rb44HhzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 02:30:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4876pM4ZvLzDqDd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 02:28:58 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TFHNXR040288
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:56 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xtfh0vswa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 10:28:56 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 29 Jan 2020 15:28:54 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 15:28:51 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00TFRwGD10289520
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 15:27:58 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 548E05204E;
 Wed, 29 Jan 2020 15:28:50 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1DF5A5204F;
 Wed, 29 Jan 2020 15:28:48 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/6] powerpc/papr_scm: Implement support for reporting
 DIMM health and stats
Date: Wed, 29 Jan 2020 20:58:38 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012915-0008-0000-0000-0000034DD43B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012915-0009-0000-0000-00004A6E5198
Message-Id: <20200129152844.71286-1-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290128
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PAPR standard provides suitable mechanisms to query the health and
performance stats of an NVDIMM via various hcalls as described in Ref[2]. Until
now these stats were never fetched in the papr_scm modules nor exposed to the
user-space tools like 'ndctl'. This is partly due to PAPR platform not having
support for ACPI and NFIT. Hence 'ndctl' is unable to query and report the dimm
health status and a user had no way to determine the current health status of
a NDVIMM.

To overcome this limitation this RFC patch-set proposes a new set of
Dimm-Specific-Methods(DSM) for querying and fetching health and stat information
for dimms that support PAPR and provides an implementation in kernel for these
DSM in papr_scm modules. These changes coupled with draft/proposed ndtcl changes
located at Ref[4] should provide a way for user to retributive NVDIMM status
using ndtcl. Below is a sample output using proposed kernel + ndctl for PAPR
NVDIMM in an emulation environment:

 # ndctl list -DH
[
  {
    "dev":"nmem0",
    "health":{
      "health_state":"fatal",
      "life_used_percentage":60,
      "shutdown_state":"dirty"
    }
  }
]

PAPR Dimm-Specific-Methods(DSM)
================================

As the name suggests DSMs are used by vendor specific code in libndctl to
execute certain operations or fetch certain information for NVDIMMS. DSMs
can be sent to papr_scm module via libndctl (userspace) and libnvdimm(kernel)
using the ND_CMD_CALL ioctl which can be handled in the dimm control function
papr_scm_ndctl(). For PAPR this RFC proposes two DSMs that directly map to
hcalls provided by PHYP to query NVDIMM health and stats. These DSMs are:

* DSM_PAPR_SCM_HEALTH: Which map to hcall H_SCM_HEALTH and returns dimm health.

* DSM_PAPR_SCM_STATS: Which map to hcall H_SCM_PERFORMANCE_STATS and returns
  		      dimm performance stats.

The ioctl ND_CMD_CALL can also transfer data between
user-space and kernel via 'envelopes'. The envelop is part of a
'struct nd_cmd_pkg' which in return is wrapped in a user defined struct which
in our case is called 'struct nd_pkg_papr_scm' (packaged). These struct is
defined as:

struct nd_pkg_papr_scm {
	struct nd_cmd_pkg hdr;		/* Package header containing sub-cmd */
	uint32_t cmd_status;		/* Out: Sub-cmd status returned back */
	uint8_t payload[];		/* Out: Sub-cmd data buffer */
};

The 'payload' field of the package holds the libnvdimm defined 'envelope' which
is used to send/receive data from userspace buffer (libndctl). This RFC uses this
field to copy the results of hcalls that are executed in response to the DSM
commands.

Please note that results of hcalls are not interpreted (with few exceptions) in
papr_scm module at all. Instead they are directly copied to the 'payload' field
and sent to userspace(libndctl) for interpretation. This essentially means that
the papr_scm module simply acts as a conduit for libndctl to issue hcalls and
fetch its output. This should make parsing and interpreting with output buffers
of hcalls easier as it can be performed in userspace.

References:
[1]: "Power Architecture Platform Reference"
      https://en.wikipedia.org/wiki/Power_Architecture_Platform_Reference
[2]: "[DOC,v2] powerpc: Provide initial documentation for PAPR hcalls"
     https://patchwork.ozlabs.org/patch/1154292/
[3]: "Linux on Power Architecture Platform Reference"
     https://members.openpowerfoundation.org/document/dl/469
[4]: https://github.com/vaibhav92/ndctl/tree/papr_scm_health

Vaibhav Jain (6):
  powerpc/papr_scm: Provide support for fetching dimm health information
  powerpc/papr_scm: Fetch dimm performance stats from PHYP
  UAPI: ndctl: Introduce NVDIMM_FAMILY_PAPR as a new NVDIMM DSM family
  powerpc/papr_scm: Add support for handling PAPR DSM commands
  powerpc/papr_scm: Implement support for DSM_PAPR_SCM_HEALTH
  powerpc/papr_scm: Implement support for DSM_PAPR_SCM_STATS

 arch/powerpc/platforms/pseries/papr_scm.c | 314 +++++++++++++++++++++-
 include/uapi/linux/ndctl.h                |   1 +
 2 files changed, 306 insertions(+), 9 deletions(-)

-- 
2.24.1

