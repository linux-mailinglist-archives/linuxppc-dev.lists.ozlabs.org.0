Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B927F3087A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 11:07:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRtLr3jjdzDrg0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 21:07:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WTaUFgdS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRtHw1qVrzDrfZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 21:05:15 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10TA3LeV103467; Fri, 29 Jan 2021 05:05:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=cE4Ho8Eg/VxXaI0LX/2qJoDx85p0jh6M0bfBiJlV0u4=;
 b=WTaUFgdSr9aellYryPHlth7QtaF+tjP8XB3I6Df/abSTrs/+lQHAXykc2TTSvb1PWdIO
 vi+odV+de4aDKP7fw7X+riBEKlefGLXE3vOYwCzXaZhiQ9Rjt0uNteUYEZvm4Db86Oac
 H0R7iD+cQlBsKMR6CHYs8UvD1qePu3fDlrcdgVGA7kE3nmCv8DuE034aZdvuMwnoggwD
 RDgplOPTbmETnDkSCZeP62XqcjRITcGi2kt5XnY+GWmV118dl3wDviqseIC9k3fsMDE9
 PUje/Kc+x3z0Ge+RDgrYibMeeNABkHsOAd/rRrm8VAiWBPDqBMbehOISPZJPbN5paMjO zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cfs9rumj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 05:05:08 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10TA3atN104556;
 Fri, 29 Jan 2021 05:05:07 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36cfs9rujm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 05:05:07 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10TA2U2U017295;
 Fri, 29 Jan 2021 10:05:05 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 368be8ayty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Jan 2021 10:05:05 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10TA520X37355978
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 Jan 2021 10:05:03 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7C9DA4059;
 Fri, 29 Jan 2021 10:05:01 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61247A404D;
 Fri, 29 Jan 2021 10:05:01 +0000 (GMT)
Received: from localhost (unknown [9.77.204.184])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 Jan 2021 10:05:01 +0000 (GMT)
Date: Fri, 29 Jan 2021 15:34:59 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/sstep: Fix array out of bound warning
Message-ID: <20210129100459.GE117@DESKTOP-TDPLP67.localdomain>
References: <20210129071745.111466-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210129071745.111466-1-ravi.bangoria@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-01-29_04:2021-01-28,
 2021-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101290050
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
Cc: naveen.n.rao@linux.ibm.com, paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/01/29 12:47PM, Ravi Bangoria wrote:
> Compiling kernel with -Warray-bounds throws below warning:
> 
>   In function 'emulate_vsx_store':
>   warning: array subscript is above array bounds [-Warray-bounds]
>   buf.d[2] = byterev_8(reg->d[1]);
>   ~~~~~^~~
>   buf.d[3] = byterev_8(reg->d[0]);
>   ~~~~~^~~
> 
> Fix it by using temporary array variable 'union vsx_reg buf32[]' in
> that code block. Also, with element_size = 32, 'union vsx_reg *reg'
> is an array of size 2. So, use 'reg' as an array instead of pointer
> in the same code block.
> 
> Fixes: af99da74333b ("powerpc/sstep: Support VSX vector paired storage access instructions")
> Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
> v1: http://lore.kernel.org/r/20210115061620.692500-1-ravi.bangoria@linux.ibm.com
> v1->v2:
>   - Change code only in the affected block

I don't see the compiler warning with -Warray-bounds with this patch:
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

- Naveen

