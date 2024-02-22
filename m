Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1EA85F195
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 07:45:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBWdYQA+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgNtL6xKlz2xm3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBWdYQA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgNsb0ZVCz3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 17:44:18 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41M6XPUO031354
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 06:44:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=m2h8Pb38wM+QX49qV8hNLt/fZBnyJJ3epPyyilc4Lrk=;
 b=hBWdYQA+511HeW47Hy5Se1Xt/wLk/vjiYlcfh22BufIQ4PWBlW2VT/WbV3KSwtHSljxP
 HQwO26Zb9QZNkPpBdBTAhZyWBJRfOPJwP0R81sBaenDtDMoLOSZQo2XlhC5ZI5Kxu/8q
 IORDV0lUBaNZw6gsyLni2vdH/8teZq0MOuWpbOts+3FtLDPlALCumAftYHg1KF6OPw8m
 0er+JQABM7YR8Ew4sFEsPvHkvrVaJcaNJCvIV4GqSkCKcgA89I4fHuQAuIrXrcET6v+P
 c67Z+CPbjzw2D2lxTzxJV+hyrAKUp5VUE56wbH5IqCgd7B3i0qbCQ6hZHNNRQNoXl//5 vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we13mr7jv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 06:44:14 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41M6Xx6K032674
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 06:44:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we13mr7e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 06:44:13 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41M63xqF009551;
	Thu, 22 Feb 2024 06:43:48 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wb84pmda3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 06:43:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41M6hgsW5243480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 06:43:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C22720043;
	Thu, 22 Feb 2024 06:43:42 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3EF720040;
	Thu, 22 Feb 2024 06:43:40 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.109.199.72])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Feb 2024 06:43:40 +0000 (GMT)
Date: Thu, 22 Feb 2024 12:13:38 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [powerpc] Dump capture failure with recent linux-next
Message-ID: <3u4oxcckd7p42hjchp4cdyqvgcwdcpyp4oq66fepqmkfn7rec5@gkk5klju7md6>
References: <9F885948-234F-4047-AE00-5E37C21FC22D@linux.ibm.com>
 <6914618a-c93c-4200-a84d-51899ae21281@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6914618a-c93c-4200-a84d-51899ae21281@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _554lhmD1v-7aYi1f-8yGDz3gc5qiOuK
X-Proofpoint-ORIG-GUID: kHAumIzZ1TNK_slx2O5JezMY-qT3pjsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_05,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=997 lowpriorityscore=0 clxscore=1011 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402220051
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bhe@redhat.com, Sachin Sant <sachinp@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,

On Thu, Feb 22, 2024 at 11:30:17AM +0530, Hari Bathini wrote:
> Hi Sachin,
> 
> On 22/02/24 10:55 am, Sachin Sant wrote:
> > Kdump fails to save vmcore with recent linux-next builds on IBM Power server
> > with following messages
> > 
> >           Starting Kdump Vmcore Save Service...
> > [ 17.349599] kdump[367]: Kdump is using the default log level(3).
> > [ 17.407407] kdump[391]: saving to /sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
> > [ 17.441270] EXT4-fs (sda2): re-mounted 630dfb4e-74bd-45c4-a8de-232992bc8724 r/w. Quota mode: none.
> > [ 17.444404] kdump[395]: saving vmcore-dmesg.txt to /sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
> > [ 17.464859] kdump[401]: saving vmcore-dmesg.txt complete
> > [ 17.466636] kdump[403]: saving vmcore
> > [ 17.551589] kdump.sh[404]:
> > Checking for memory holes : [ 0.0 %] /
> > Checking for memory holes : [100.0 %] | readpage_elf: Attempt to read non-existent page at 0xc000000000000.
> > [ 17.551718] kdump.sh[404]: readmem: type_addr: 0, addr:c00c000000000000, size:16384
> > [ 17.551793] kdump.sh[404]: __exclude_unnecessary_pages: Can't read the buffer of struct page.
> > [ 17.551864] kdump.sh[404]: create_2nd_bitmap: Can't exclude unnecessary pages.
> > [ 17.562632] kdump.sh[404]: The kernel version is not supported.
> > [ 17.562708] kdump.sh[404]: The makedumpfile operation may be incomplete.
> > [ 17.562773] kdump.sh[404]: makedumpfile Failed.
> > [ 17.564335] kdump[406]: saving vmcore failed, _exitcode:1
> > [ 17.566013] kdump[408]: saving the /run/initramfs/kexec-dmesg.log to /sysroot//var/crash//127.0.0.1-2024-02-21-15:03:55/
> > [ 17.583658] kdump[414]: saving vmcore failed
> > 
> > Git bisect points to following patch
> > 
> > commit 378eb24a0658dd922b29524e0ce35c6c43f56cba
> >      mm/vmalloc: remove vmap_area_list
> > 
> > Reverting this patch allows kdump to save vmcore file correctly.
> > 
> > Does this change require any corresponding changes to makedumpfile?
> 
> Right. The change intends the tools to use VMALLOC_START exported via
> vmcoreinfo instead of vmap_area_list. I don't see the corresponding
> makedumpfile change submitted upstream yet though.
> 
> Aditya, can you help with this..

Sure hari, I will into it. Thanks for the explanation, that will help.

Thanks,
Aditya Gupta

> 
> - Hari
