Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D73532BA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 15:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6wcV5w2Tz3byL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 23:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YuDalzMO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YuDalzMO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6wbl3yRRz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 23:51:46 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24ODnm59004783;
 Tue, 24 May 2022 13:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mZrR9FGA40A5SmIjBAAZ4cA+zKcpp46t0ktUyq6q6hI=;
 b=YuDalzMOgRr3Cr+pTxNgSwcTFlpHP9p6NBAN9l7a6G/ScerntqUUgxLOuvnu0HJ9bH/v
 kOydEi9Dpa6wFi/VZSZlEFWV/qhy+5k9C0djrpbZlWA+Q1qHpUzq7XqXQ8KSjJVyhGE3
 bBwPFgxCEy8YX94AMlbebslzVN+TnlKgdZUE5f9nV6J5bqB3w+fh6yyvygeE+ALs0G3q
 trRCJNLFbAb5qilvS/Ux37547AKHgBuil40kaL7UoVSHAa9Xk4BeCQLCPA/PptRxy5c6
 T9SmTglC32fa+/My0OlUpilcMn/seKr1ErjcuMzJc6Ygy+kJL3Z7dfZRRGahxAkLVpdj Bg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8ypp1j13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 13:51:37 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ODmSUU032201;
 Tue, 24 May 2022 13:51:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3g6qq9ck0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 13:51:34 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ODpVu853608796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 13:51:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACAD2AE055;
 Tue, 24 May 2022 13:51:31 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21474AE051;
 Tue, 24 May 2022 13:51:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.125.120])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 13:51:29 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] powerpc/papr_scm: don't requests stats with '0' sized
 stats buffer
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220524112353.1718454-1-vaibhav@linux.ibm.com>
Date: Tue, 24 May 2022 19:21:28 +0530
Message-Id: <AFC3DC94-B307-471C-AE09-9A36C17B43BA@linux.ibm.com>
References: <20220524112353.1718454-1-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rrmeHhNrord4bzNlLicka-EMznimBQCJ
X-Proofpoint-GUID: rrmeHhNrord4bzNlLicka-EMznimBQCJ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_07,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxscore=0 clxscore=1011 mlxlogscore=711 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240068
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
Cc: nvdimm@lists.linux.dev, Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On 24-May-2022, at 4:53 PM, Vaibhav Jain <vaibhav@linux.ibm.com> wrote:
>=20
> Sachin reported [1] that on a POWER-10 lpar he is seeing a kernel panic b=
eing
> reported with vPMEM when papr_scm probe is being called. The panic is of =
the
> form below and is observed only with following option disabled(profile) f=
or the
> said LPAR 'Enable Performance Information Collection' in the HMC:
>=20
> Kernel attempted to write user page (1c) - exploit attempt? (uid: 0)
> BUG: Kernel NULL pointer dereference on write at 0x0000001c
> Faulting instruction address: 0xc008000001b90844
> Oops: Kernel access of bad area, sig: 11 [#1]
> <snip>
> NIP [c008000001b90844] drc_pmem_query_stats+0x5c/0x270 [papr_scm]
> LR [c008000001b92794] papr_scm_probe+0x2ac/0x6ec [papr_scm]
> Call Trace:
>       0xc00000000941bca0 (unreliable)
>       papr_scm_probe+0x2ac/0x6ec [papr_scm]
>       platform_probe+0x98/0x150
>       really_probe+0xfc/0x510
>       __driver_probe_device+0x17c/0x230
> <snip>
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Fatal exception
>=20
> On investigation looks like this panic was caused due to a 'stat_buffer' =
of
> size=3D=3D0 being provided to drc_pmem_query_stats() to fetch all perform=
ance
> stats-ids of an NVDIMM. However drc_pmem_query_stats() shouldn't have bee=
n called
> since the vPMEM NVDIMM doesn't support and performance stat-id's. This wa=
s caused
> due to missing check for 'p->stat_buffer_len' at the beginning of
> papr_scm_pmu_check_events() which indicates that the NVDIMM doesn't suppo=
rt
> performance-stats.
>=20
> Fix this by introducing the check for 'p->stat_buffer_len' at the beginni=
ng of
> papr_scm_pmu_check_events().
>=20
> [1] https://lore.kernel.org/all/6B3A522A-6A5F-4CC9-B268-0C63AA6E07D3@linu=
x.ibm.com
>=20
> Fixes: 0e0946e22f3665d2732 ("powerpc/papr_scm: Fix leaking nvdimm_events_=
map elements")
> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---

Thanks Vaibhav for the patch. With the patch the reported problem is fixed.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

-Sachin

