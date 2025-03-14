Return-Path: <linuxppc-dev+bounces-7030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC08A607E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 04:47:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDVgD4Xc8z3cXN;
	Fri, 14 Mar 2025 14:47:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741924040;
	cv=none; b=nv6DqeK1tWp1MdHUGksBLit81gNSNSsiCW0mPTuPRAE1rwPXsDN98ptEgibGnXdqswW3DynGI8RjgMoLZASPUGDZKraj32Vgd+wYftPSl9Keo0ZlHBXwGnYx9nph3qErRXkvm8RL+4NL3bT71bq4WrIC04HviZRZ+ZbRZaRI+S9lk7+wfdYBER3tDStBjfSqIRF3uZvA9XJuTnaEln/CFdC6r5pgsiGK+PjR8VPW3zUEZSypeziQSGWX5vbtdADcyt3BS/90uE1eVs1OuJnduMrwnScmOBYYzsMWFWiIFP/10qeu+5sQv5mvB3NHkjRYdRf/Ekh+VWfuJ7kwMW10ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741924040; c=relaxed/relaxed;
	bh=dv7DcNzfKpDoRegGq6BAd81m+l+Gv0AVddi4b2R9sR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KS05r6fsCyt3njPYWgGWhQcsYYE8aDfmxH4SDd+H1Wi1T028DLDe2nwl5Pym7CUq+qD8phcQKuBPzKf9/LjLQfAePMgan18fNO24ngYLLyB3kplp2bFhxEQ2WZlvUkiZjKG+jw+2ptNBlnXQy/d8QCGgTg7mZJUrkDL8aV0bJoTpKpj/EgOWvmle5w09NUNVo0TGr7sEAf7yjYKXCGAcNFHs0DeHFzDLChr+3msRdlLLdP7ilB/kbtTtmpbpS+qCPDWwaNbN2s7KQQf7egzOSzxC9ArRy3JeHKEYrT24udn00hXIyENykKv8e9+lmb/hNbrE6pgh7f5vuySyuIhOGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TM5SvJd0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TM5SvJd0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDVgD0W4wz3cW2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 14:47:19 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNOvn4030500;
	Fri, 14 Mar 2025 03:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dv7DcN
	zfKpDoRegGq6BAd81m+l+Gv0AVddi4b2R9sR8=; b=TM5SvJd0WtkNFjMzAXdcDJ
	KDcttJtuzysR9rRYgUkcMmqmCGzYvxlZj4ksobNdOGa0NKDZMPgi5QSR5GRczM2u
	H2QvFuCPzqeVycoEhWlkPvC2TwbEV3vQMILNRNEAY0AqzhJjdvJ+QfIt/iE4cvVF
	GzO4HIISGxrua/x95srz6jtu0VMaiQ1KWGX14U2qfR9AdWmkkBfU1YrIWlQ2PSQZ
	8oheMMJwLVNwMKgIF60rWgYQ6cqxM0AviXL0LOiZ+QXKVqmVetCXDPnRfUASbFQt
	GcMTsVx9vRMRcsyXPha2KH/I7xS71GONVB55aM90qqLGqDW1zOwuHzf+7p7M1K0A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8v1pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52DN8JU0003124;
	Fri, 14 Mar 2025 03:47:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstw3aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 03:47:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E3l6Zt20054292
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 03:47:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07E1A20040;
	Fri, 14 Mar 2025 03:47:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91F2A2004B;
	Fri, 14 Mar 2025 03:47:03 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.204.206.207])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 03:47:03 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, atrajeev@linux.vnet.ibm.com,
        kjain@linux.ibm.com, disgoel@linux.ibm.com, hbathini@linux.ibm.com,
        adubey@linux.ibm.com, gautam@linux.ibm.com
Subject: Re: [PATCH] powerpc/perf: Fix ref-counting on the PMU 'vpa_pmu'
Date: Fri, 14 Mar 2025 09:17:02 +0530
Message-ID: <174192385436.14370.8988935499499753559.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204153527.125491-1-vaibhav@linux.ibm.com>
References: <20250204153527.125491-1-vaibhav@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Trxq7CHcStED-hArgwHO7jSU1xA5Mvgo
X-Proofpoint-ORIG-GUID: Trxq7CHcStED-hArgwHO7jSU1xA5Mvgo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=972 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 04 Feb 2025 21:05:26 +0530, Vaibhav Jain wrote:
> Commit 176cda0619b6 ("powerpc/perf: Add perf interface to expose vpa
> counters") introduced 'vpa_pmu' to expose Book3s-HV nested APIv2 provided
> L1<->L2 context switch latency counters to L1 user-space via
> perf-events. However the newly introduced PMU named 'vpa_pmu' doesn't
> assign ownership of the PMU to the module 'vpa_pmu'. Consequently the
> module 'vpa_pmu' can be unloaded while one of the perf-events are still
> active, which can lead to kernel oops and panic of the form below on a
> Pseries-LPAR:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Fix ref-counting on the PMU 'vpa_pmu'
      https://git.kernel.org/powerpc/c/ff99d5b6a246715f2257123cdf6c4a29cb33aa78

Thanks

