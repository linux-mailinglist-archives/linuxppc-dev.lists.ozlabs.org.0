Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7033E0F55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgL4f3wDHz3cGY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:35:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H0nVLr8L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H0nVLr8L; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgL4B1Msxz3bY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:35:21 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1757Wv1E089820; Thu, 5 Aug 2021 03:35:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=wJq0ybxY7L2Dl7sNEaUtoMo0Eyb6m2cp1YW6q5Z54gU=;
 b=H0nVLr8LQZypL1kZPu6OSW+wIgOPQGzkEMaVET0BPtRs36rHSVlbDFKDWbMFBRlSKtcs
 BLD3sedJEoTkDaZ79PjX7HngtDImbarPGUHj7KAOe8/kQ2pPrMUz1nri/S/J/sj/P/oH
 Yse/HGmUY93o2A37PjbSvNBR9qWrO5IsfIsbePXz+xw40Z4BF5re15XL1fGNbJ93dHCE
 z8HiRc0ZXu5cE9R/zBKfL0RyCUhRP6BhGrW8YaqIZQno0bqlYtug3IyTV+N+AWG+VaMJ
 0+Pge5rCOKk2lsEbIqmNer1VPjWLlbz9yzQbp07HWCzCAqdfFID7mFB24Eg2846sJIlS wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88k2mphv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:35:19 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1757Ww2T089927;
 Thu, 5 Aug 2021 03:35:19 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a88k2mph2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:35:19 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1757Rhri027416;
 Thu, 5 Aug 2021 07:35:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3a4wshtscu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:35:16 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1757ZDHR51118428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:35:14 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48CA452078;
 Thu,  5 Aug 2021 07:35:13 +0000 (GMT)
Received: from in.ibm.com (unknown [9.102.2.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id E411E52071;
 Thu,  5 Aug 2021 07:35:11 +0000 (GMT)
Date: Thu, 5 Aug 2021 13:05:05 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v0 0/5] PPC: KVM: pseries: Asynchronous page fault
Message-ID: <YQuUqfn3OV/qDI8U@in.ibm.com>
References: <20210805072439.501481-1-bharata@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805072439.501481-1-bharata@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dQ4IEPT42jF3YzuN81mh3vm9kpjOAXjI
X-Proofpoint-GUID: 8i40YJ0Hs5Hj8XuZpk9WumIFaqEKVr7D
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=911
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108050044
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
Reply-To: bharata@linux.ibm.com
Cc: aneesh.kumar@linux.ibm.com, kvm@vger.kernel.org, bharata.rao@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 05, 2021 at 12:54:34PM +0530, Bharata B Rao wrote:
> Hi,
> 
> This series adds asynchronous page fault support for pseries guests
> and enables the support for the same in powerpc KVM. This is an
> early RFC with details and multiple TODOs listed in patch descriptions.
> 
> This patch needs supporting enablement in QEMU too which will be
> posted separately.

QEMU part is posted here:
https://lore.kernel.org/qemu-devel/20210805073228.502292-2-bharata@linux.ibm.com/T/#u

Regards,
Bharata.
