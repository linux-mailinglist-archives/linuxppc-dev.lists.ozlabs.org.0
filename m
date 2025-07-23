Return-Path: <linuxppc-dev+bounces-10368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC2B0EA09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 07:27:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bn2h22k93z30Qk;
	Wed, 23 Jul 2025 15:27:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753248434;
	cv=none; b=AKTVKsVjSM/EbR8YJ0L37tR6j0ZssbcTmv8UiqR+DzikSseHNDv2dyMx3qr2dF9LDbnn4i6upMG7uJ3R7NtnOCYVnIuL77WVhFwcue7R+TbWVqXcnv11wXXwwgDFYZB3nKTPMLfOGrk+VgWs/8a+Md+v6zYQ8NI5Tp6pe5Lj/IRZba0X5A0qevheXMj1TKjPkKhUEeAvk3gr4FoyOUN5VzzU49UqZ4OsH+i0D5FeajNjXsenMowQrX0YZf5b1co5nUmhHnUYYssCAbESN+81sZEAJau+3HijHpDaFRTuqWMFuCwprrzVxquTQnjP5Dl/Icsl8gN7QL5u3oTtLaNQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753248434; c=relaxed/relaxed;
	bh=BmkJ3K5wrHWR+wceCjIw79zrjCe++H/KlWmf01IwiE8=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=cYmCGRZfaR4YBklVMEDRqUgPIwoXk0PcXmNC+Rcu2Abp/ReM380AXiS9e78VCBHecoDc3ZxUlVIYxN2tFVBrPFXRqedRDV5L5sdt0mIslA7+jPC3IIJEUTDJgtIZnkVYwLRVn8wuVp82Al0q3bpClIZWwzGZlhooM7yvVp9mM7OPRHbQs0k+L6c1V+elC0uYRoSt/jV63j/FeSJ1028Z3gbitscrBdprB8cp/fuBIV5wuwKd5XwVglPr2Pf2xnK69KrnBcloju0y1RxHDVfmOSV9o3nPd+nTidAlzEMdmCB0VeA+2Hu9qi5X2GsSARjp+lCqKUnEkQATE5R4ZyEizg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COPf8Ag3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=COPf8Ag3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bn2h12xYnz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 15:27:12 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N5Ae6A016183;
	Wed, 23 Jul 2025 05:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=BmkJ3K5wrHWR+wceCjIw79zrjCe+
	+H/KlWmf01IwiE8=; b=COPf8Ag33KzYTO33hN4XYpflSJrkD7Jvn9beJiDIuQK1
	zdi9dk7qgbsc9ORQnonhVeQ1VAHxjj19N/5s4L+WGS/eTKVdp9WCqRxEgibmMlyc
	wJ0qEEyUod2n6Ic2ciA0+Xo3YjwjCYtJ7LfmudqXqt8jXqUu/zDLVMN8IXJvNoBD
	msUwqb1aKRZbDkn9Jq7knUy4dVMo0xhqhqfwB7Z98ia7Z1pTHbUYG7qpyTeC/NN/
	uIDf7WbUIThCO4IyHM83dlT/X95b4h9/zYyuCSB/7BzOXZYAzpVOEG0lmTdo31Qm
	miBajaRv9GnfdSiKu4jcRhnQdrKFfLEDtWm5AOWBuw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff62qrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:26:54 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 56N5Kijl012888;
	Wed, 23 Jul 2025 05:26:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 482ff62qrs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:26:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 56N49g1K014319;
	Wed, 23 Jul 2025 05:26:53 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 480ppp6dcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:26:53 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 56N5QjIB28705322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Jul 2025 05:26:45 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 316075805A;
	Wed, 23 Jul 2025 05:26:52 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0945258056;
	Wed, 23 Jul 2025 05:26:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.252.202])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 23 Jul 2025 05:26:48 +0000 (GMT)
From: Venkat <venkat88@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH v2 1/2] powerpc/ftrace: support
 CONFIG_FUNCTION_GRAPH_RETVAL
Message-Id: <8D20D72F-C411-4F14-A9AA-0F28145B0301@linux.ibm.com>
Date: Wed, 23 Jul 2025 10:56:36 +0530
Cc: christophe.leroy@csgroup.eu, LKML <linux-kernel@vger.kernel.org>,
        linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, mark.rutland@arm.com, mhiramat@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>, npiggin@gmail.com,
        rostedt@goodmis.org, venkat88@linux.ibm.com
To: adityab1@linux.ibm.com
X-Mailer: Apple Mail (2.3774.600.62)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA0MSBTYWx0ZWRfXxnYG0z6qy8cP
 kSm/4+FnREZkPtC9wPXFqL1fDUYTGVeCiuf3NNqjVLGBtnTmEasK0gF1fXFcT/J00TSZs+H/5VI
 zqLhrXZytcOaTDiBD+3pPhkit3+4sYJ66+x70SwV5pTMKq+s84TdMSriNRw8/GNXQIWpIBLxJ+T
 ooP/8euDPPB1yzwbfduz6E5kT9nD/TrBxae9ukHQwqLbqO8h7Y4+EHuooavkNBnrUEdnwxcuY4b
 FdB2nNYqhOzSmBJ96KF//ATLSkEZ2o9YD9tEoY4UmWqSpLmyRlYsxYXhLs6+wVW+cf79XyQ9nIZ
 5bxswuW2fJpVliRnrbbiqPx6afcfcGlTdXUrBaO/+p1d52cRJcMpWyXxNoZ4erAFMY5WKk+k33M
 rjH+EOCmXewjEJHFwgpdJUgrwSoK+vDZtEJyZBq3RkrDIETnugwgQ9LwxPH7gxM8aUctRS3z
X-Proofpoint-ORIG-GUID: CrIRkr5ijwshclL3_LrJoqaVeb79QL-S
X-Proofpoint-GUID: 1mwAsnWZ1ID4aMrKsuUaHJNwxQPxOWMt
X-Authority-Analysis: v=2.4 cv=TtbmhCXh c=1 sm=1 tr=0 ts=6880729f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=VnNF1IyMAAAA:8 a=J52luZ3L32VaiGxZi9YA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=518 suspectscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230041
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SORTED_RECIPS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Tested this patch by applying on top of mainline. Build and boot is =
successful. Also ran ftrace selftest, intended test passed and no new =
failures/errors introduced with this patch. Hence,

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>

Regards,
Venkat.=

