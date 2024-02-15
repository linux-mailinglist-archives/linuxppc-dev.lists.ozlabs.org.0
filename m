Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15323856D72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 20:14:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wl0Wu+6x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbPrR72BFz3vYM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 06:14:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wl0Wu+6x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbPqg2J53z3cT2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 06:13:50 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41FIU18f025950;
	Thu, 15 Feb 2024 19:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=qQdOnaUP5H9DK70UwFji6brSoUJN3Qo/OYN31JKGHwY=;
 b=Wl0Wu+6x35mDOkc83bi+Amtgh008rwnJJSnUYMUV5895f2ysPdv3KpIe07v158nlbV/g
 ghb5h3dypB+QxeTz6oQivPaKLPfltf/5Elok1D6zkA1Hfp4bFN96im0NTNvoz+b34xJP
 4ir85AInn1pbwp9E37WyYiWAYNmuelPff/RUUn4IgkXEwLdeiuwiz6H6C3xanSei5Xk2
 chkLhJaGn4ykO/KJpaUBQnK0GICdoN5rTGYE9VZvRHNuthH18wBOKQ6KkkcoFGIPXg1t
 I6aRy9YcJA4EK/Tiwpm5lL+Pw4AWa+Kr04SdOj+/3f/pJB0Atl/MjLKBcV7r9Brh7oHD hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9nj9n82v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 19:13:39 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FIuIDO011290;
	Thu, 15 Feb 2024 19:13:38 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w9nj9n82d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 19:13:38 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41FIi5TU032600;
	Thu, 15 Feb 2024 19:13:37 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kfty0ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 19:13:37 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41FJDZxQ4850360
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Feb 2024 19:13:37 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55E7558061;
	Thu, 15 Feb 2024 19:13:35 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F4E458058;
	Thu, 15 Feb 2024 19:13:35 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Feb 2024 19:13:35 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: powerpc: Add header symlinks for building
 papr character device tests
In-Reply-To: <20240215165527.23684-1-msuchanek@suse.de>
References: <20240215165527.23684-1-msuchanek@suse.de>
Date: Thu, 15 Feb 2024 13:13:34 -0600
Message-ID: <87cysxilr5.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WNSDgHdCHwYeiyh7cahTZ6b9lx-jyrNw
X-Proofpoint-GUID: aLWAHrReJkp_p3mBfLgYuXMvh5u07EJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_18,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=432
 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402150154
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
Cc: linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek <msuchanek@suse.de> writes:
>
> Without the headers the tests don't build.
>
> Fixes: 9118c5d32bdd ("powerpc/selftests: Add test for papr-vpd")
> Fixes: 76b2ec3faeaa ("powerpc/selftests: Add test for papr-sysparm")
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
>  tools/testing/selftests/powerpc/include/asm/papr-miscdev.h | 1 +
>  tools/testing/selftests/powerpc/include/asm/papr-sysparm.h | 1 +
>  tools/testing/selftests/powerpc/include/asm/papr-vpd.h     | 1 +
>  3 files changed, 3 insertions(+)
>  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
>  create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
>  create mode 120000
> tools/testing/selftests/powerpc/include/asm/papr-vpd.h

I really hope making symlinks into the kernel source isn't necessary. I
haven't experienced build failures with these tests. How are you
building them?

I usually do something like (on a x86 build host):

$ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- ppc64le_defconfig
$ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- headers
$ make ARCH=powerpc CROSS_COMPILE=powerpc64le-linux- -C tools/testing/selftests/powerpc/

without issue.
