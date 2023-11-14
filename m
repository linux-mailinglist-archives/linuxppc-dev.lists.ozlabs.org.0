Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6337EB444
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 16:57:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5avGCXT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV9sl5gyGz3dBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 02:57:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5avGCXT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV9rt2H9Tz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 02:56:29 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AEFggi7008159;
	Tue, 14 Nov 2023 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=YLb/ytjwOAf1kAB5jgoYszAQwRYlUTzi/Da/EFG41p0=;
 b=Q5avGCXTPkEHo+0or/HTjq3a1uSOzhsxBtgXiw/kJnukWTibdmPd7CTvR/6VGKuk8+r6
 jDEp3+K4okws0Cxh6aNPZmpUdAkKclh/gMdpf5ZgeD7yrpMBIMGiDUm1q7ml0DmKIIEI
 GJoNfIghi/oBe6mlXq3h4+BCyCm0ApYb+ZnYPA4PV6psXGvuaRid6pQn8jKRE6KSlOop
 JGNzXHfXCqyOYf4Duony6Ko3AU7waeICyusV/GuH3swjJdhto761hCKMrUfhwmPI9YkN
 xJ5SDd7UoHBcU/rC347jdZkI0y/SKIYbNIpR21X9RdD0qH7CjUNlwJeyhyKcDbXNuDau WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucbs4gjfj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 15:56:17 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AEFh1op010629;
	Tue, 14 Nov 2023 15:56:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucbs4gjd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 15:56:17 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AEE6Jvs011397;
	Tue, 14 Nov 2023 15:56:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn1gced-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Nov 2023 15:56:14 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AEFuC5q16908880
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Nov 2023 15:56:12 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D06E20040;
	Tue, 14 Nov 2023 15:56:12 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B4CA20043;
	Tue, 14 Nov 2023 15:56:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 14 Nov 2023 15:56:10 +0000 (GMT)
Date: Tue, 14 Nov 2023 21:26:10 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/sched: Cleanup vcpu_is_preempted()
Message-ID: <20231114155610.GS2194132@linux.vnet.ibm.com>
References: <20231114071219.198222-1-aneesh.kumar@linux.ibm.com>
 <20231114094622.GR2194132@linux.vnet.ibm.com>
 <b21c7dc2-cdfa-45f2-b799-18aaa7297b46@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b21c7dc2-cdfa-45f2-b799-18aaa7297b46@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oQhIF2F5XXmlB3_4CkPSXAWuu1095Bbp
X-Proofpoint-ORIG-GUID: P3DyFbOesgabKMw5Q3IFW58Mkd4dGjfu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_16,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=568 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311140123
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K V <aneesh.kumar@linux.ibm.com> [2023-11-14 15:45:35]:

> On 11/14/23 3:16 PM, Srikar Dronamraju wrote:
> > * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2023-11-14 12:42:19]:
> > 
> >> No functional change in this patch. A helper is added to find if
> >> vcpu is dispatched by hypervisor. Use that instead of opencoding.
> >> Also clarify some of the comments.
> >>
> > 
> > If we are introducing vcpu_is_dispatched, we should remove 
> > yield_count_of() and use vcpu_is_dispatched everwhere
> > 
> > No point in having yield_count_of() and vcpu_is_dispatched, since
> > yield_count_of() is only used to check if we are running in OS or not.
> > 
> 
> We do
> 
> yield_count = yield_count_of(owner);
> yield_to_preempted(owner, yield_count);

yield_to_preempted is defined just below yield_count_of() and we are anyway
passing the CPU, so we dont have to pass yield_count to yield_to_preempted


-- 
Thanks and Regards
Srikar Dronamraju
