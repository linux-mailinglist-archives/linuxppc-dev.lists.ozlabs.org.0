Return-Path: <linuxppc-dev+bounces-13682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B62C2A007
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 04:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0Hs20d7rz30RT;
	Mon,  3 Nov 2025 14:59:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762142357;
	cv=none; b=BV1NB2+78rU72l1b+wkhZfvguO8lNLEKOAyODPMkJ5uBc01MxgXV80meybaObzrNIIKaK2xV0WLW5gzFprBoz+dDVhzeR8o1dt5t2nnFNmrYXByL07VPGjaCdh8DcouFvnpSLw+O/YlOqPTwKAIMim6RnfTW0AFIiRhGqe2LHzo7SI84SoHD53dvGTWAkZPabvuYSMRWN8oiSYSdOJ1xHnxXxIjICoD/GgpECsEaLbpIltU6t7WNvTiLPelYb95fSCKB+jITgB10OYr9gs/Q+OUvDMbXDzQ8aRsWiDvgGZpMAPIVVhQoo+PD7mTBbOoSiWIo7QQ3dURQKjhcZD1VRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762142357; c=relaxed/relaxed;
	bh=jG0Iw6QpT58oATgb/oO5UhFDe0HY8lXWzUzsrRiKGis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OWh71hv0C/AdSNYUvDgDORyT3W5OIIgfLt1mLbLERQGSMyl7RdCFhjsOjoWMRKboijocctKhaHnfLkFn/RxZy2uuh6DgpoBQd7WjT5y+4DoFtkdSZrS+52O/nl8y+/bBdV7AojlMDheqFI22uRahSZdmy3QcAHxFRwJvYqhTpwxC3rocJgfLbmgmv9eHwQnV8ce6u+kQzXQJgb2WjDKsjNSDdi4DlLJ9TDdXjEq1KGTFyelmZTTIlyamBx/Sc4yUaF2a4MVlLe1TE448IaeXlmmsVmL7rKWvoXvmIfuf0oPzL0qeyeXMhQ9DgA86oGiAOxdIp7ofsFX4UOWxRuWEkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aax2FDu9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aax2FDu9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0Hs113P5z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 14:59:16 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2MhkbD023007;
	Mon, 3 Nov 2025 03:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=jG0Iw6QpT58oATgb/oO5UhFDe0HY8lXWzUzsrRiKG
	is=; b=aax2FDu9n376TJwfD54rCLYC7q2UGmPSnL5riagy+GhZ1wmBmyZwjILbM
	k5Ew1FdBsL5loAsTBRiz40qgohur53TuvwkK1uNgvV1SF/LLmczM52Tc8NxeTcb0
	/VFAkMdEWcrxVtjRXpVuvBzYT0WzWc4J0zbqU7uK6gABxfP/bXDwjsVxNezazt7r
	61myYdl4zWy2glsley5Ly57JeDbq02S/lqq1vm1I95IanE5uZ1UIXS8xKkzTSa81
	CYtlB36eZIq9ixjnH5JErT5HEa+WdgdxHIeslBZZiXUiPDXAEIJkMcBworB36yWy
	Xakz4R/Hh4wZgRLuDznMH6nYr7lfQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xbmtp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A31pgbc025605;
	Mon, 3 Nov 2025 03:59:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vhsbvad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 03:59:09 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A33x6qK53019130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 03:59:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20C522004E;
	Mon,  3 Nov 2025 03:59:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 147182004B;
	Mon,  3 Nov 2025 03:59:04 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 03:59:03 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Jiri Bohac <jbohac@suse.cz>, Shivang Upadhyay <shivangu@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Subject: [PATCH 0/2] Export kdump crashkernel CMA ranges
Date: Mon,  3 Nov 2025 09:28:57 +0530
Message-ID: <20251103035859.1267318-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX9Jv2DGNs4KoA
 P41p2b9x0mrajMEf6XE3CfSv0pzvi0v3t8xhfN5hPSoW+IQoyYid9FhDoHw+Tb1mueDJhNatOZ0
 H1BpTzgLqxhc1Xf84mSWeCRBF8Nw5aoIdwoxxHO3USYmut0EurYjf63Eokv30r9PC0qBri5Uq39
 faQt8hcTxElT3soEAhMmEsuusQ94pBqjDE8aiJ1NNz2E4rF6kkIOv+hZflqRatd0KXVmg/9Agmi
 jUfzalRPUMuBiDYE1oD+Z/DRFw2d4pVuktCU59Mz4ye+eF5cmpAx6R8G2H8dzvFkdC0B3q0oHC1
 3bgoCkNuS5sET0LcmINSXKOKZ20Yq0fwR7YK87aCKjw9MOPL3am44VUc7vPkn7M5uS9orz2EkWz
 H7R+ZCdRJMYYb6EXj1iUAaijsqoNwA==
X-Proofpoint-GUID: IoHpLgL9Ckx4FvbHmod1NksDnf2MPXun
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=6908288f cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8
 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=bBV_4OgQmAgx81cr9awA:9
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: IoHpLgL9Ckx4FvbHmod1NksDnf2MPXun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

/sys/kernel/kexec_crash_cma_ranges to export all CMA regions reserved
for the crashkernel to user-space. This enables user-space tools
configuring kdump to determine the amount of memory reserved for the
crashkernel. When CMA is used for crashkernel allocation, tools can use
this information to warn users that attempting to capture user pages
while CMA reservation is active may lead to unreliable or incomplete
dump capture.

While adding documentation for the new sysfs interface, I realized that
there was no ABI document for the existing kexec and kdump sysfs
interfaces, so I added one.

The first patch adds the ABI documentation for the existing kexec and
kdump sysfs interfaces, and the second patch adds the
/sys/kernel/kexec_crash_cma_ranges sysfs interface along with its
corresponding ABI documentation.

*Seeking opinions*
There are already four kexec/kdump sysfs entries under /sys/kernel/,
and this patch series adds one more. Should we consider moving them to
a separate directory, such as /sys/kernel/kexec, to avoid polluting
/sys/kernel/? For backward compatibility, we can create symlinks at
the old locations for sometime and remove them in the future.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org

Sourabh Jain (2):
  Documentation/ABI: add kexec and kdump sysfs interface
  crash: export crashkernel CMA reservation to userspace

 .../ABI/testing/sysfs-kernel-kexec-kdump      | 53 +++++++++++++++++++
 kernel/ksysfs.c                               | 17 ++++++
 2 files changed, 70 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-kernel-kexec-kdump

-- 
2.51.0


