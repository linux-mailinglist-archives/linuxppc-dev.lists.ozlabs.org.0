Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66A8D5B19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 09:02:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQe5nKxT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrDZv2b14z30VJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 17:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mQe5nKxT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrDZ41nfTz30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 17:01:47 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44V6Urwa021365;
	Fri, 31 May 2024 07:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc : content-type : date
 : from : in-reply-to : message-id : mime-version : references : subject :
 to; s=pp1; bh=aaBvNxIquJs2EzYvuRrhC1j6ewLwD9KjNMpikXuKNzg=;
 b=mQe5nKxTT+CdpzPbrS0jeeIw8W86Si3gUj3MCUqv6SUYQK4TnE4x2qQhkiI5lI8s0vrC
 PxloZHBfHWVVS7KyS00P1EzjBhGwJUWXQLmocR1wdtE254o3ENnIB6awvuMnGIP4Ocem
 21l85NgYf7UgtV3VrHCbQaKW3SHVei1IPWGuam8E9DNKXsZJ53aoSGrzv+K+FCu5Pi2+
 Kmexz032cTkhctsAC7zA259bumoMkYbEqyPeyMiXfau7vVoxd9qWwtJRtf70BgjpWlxv
 WEvgSjeENx0QfOWHMNls4URTcqNKGv86WYOtc1pqXyLe7+yEIdBOcRWOTurSu+S36hlH tw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yf8sp04pk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 07:01:35 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44V71ZAo003390;
	Fri, 31 May 2024 07:01:35 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yf8sp04pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 07:01:35 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44V5O4nh026740;
	Fri, 31 May 2024 07:01:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpd2xgwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 07:01:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44V71UZM21561822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 07:01:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8575B2004E;
	Fri, 31 May 2024 07:01:30 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AAF920043;
	Fri, 31 May 2024 07:01:28 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 31 May 2024 07:01:28 +0000 (GMT)
Date: Fri, 31 May 2024 12:31:26 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] arch/powerpc/kvm: Fix doorbell emulation by adding DPDES
 support
Message-ID: <35ek73rjziiolk3zja3i5qayjzvjruuro72co74nc4a6ljvhhf@5tus3qlcb522>
References: <20240522082838.121769-1-gautam@linux.ibm.com>
 <rrsuqfqugrdowhws2f7ug7pzvimzkepx3g2cp36ijx2zhzokee@eitrr6vxp75w>
 <2024053143-wanted-legible-ca3f@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024053143-wanted-legible-ca3f@gregkh>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9BAPae-QWeiZiE9h7wdQgwkjUoJxgrhI
X-Proofpoint-ORIG-GUID: Qrx9-h68gqIaI3Q_bqAX6RVcT_WIuh1d
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxlogscore=673 bulkscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405310051
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
Cc: kvm@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 08:09:13AM GMT, Greg KH wrote:
> On Fri, May 31, 2024 at 10:54:58AM +0530, Gautam Menghani wrote:
> > Hello,
> > 
> > Please review this patch and let me know if any changes are needed.
> 
> There already was review comments on it, why ignore them?

Sorry I pinged on the wrong thread, I had already addressed the stable
tag issue in a resend - https://lore.kernel.org/linuxppc-dev/20240522084949.123148-1-gautam@linux.ibm.com/

Thanks,
Gautam
