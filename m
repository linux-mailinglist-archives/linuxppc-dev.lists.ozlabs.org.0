Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E681310F32
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 18:56:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXNQX48sfzDwlv
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Feb 2021 04:56:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UdKLWkO4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXNNf05Y8zDwl6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Feb 2021 04:54:56 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 115Hnk0G016547; Fri, 5 Feb 2021 12:54:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=MkTtb8AxGX0Eg0bz77reDlk0J1S2Tf6kAiFAdoE4lX4=;
 b=UdKLWkO48alodEvS6p4Gco2/tegZqyk3IDN/2895lEDPKuwQ5PsWfR8i1/EkUi3UsaiS
 1FYDnlPnk7M5m0r6x3cpcCXRL4d+oOwVaLI/VVYJinU2UIiu98TiUPC0JbuLqAX+eh/2
 A1EAmSJ6AUMwBqiW2eo8o+gTqY7aGELCTFZDvR+PaX3RrAC9MEGh36aaLYCFtZG0WHt2
 /aS3pBkCHo+MKgNK/ciZ2lap9nd7OfEWXb1PEZl8Ip5fJzq+D7ie4M21ONz5x5RxCFrZ
 K5cqaniuzvdxcKK46HPG5S2ZtMmHkmaPcHZ/+XznJTdXbxudQD/WnmLnHl1B5QHIznWY xA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36haf28mt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 12:54:50 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 115HnpoI017387;
 Fri, 5 Feb 2021 12:54:50 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36haf28mq3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 12:54:49 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 115HgZpu016897;
 Fri, 5 Feb 2021 17:49:46 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 36cy38b7de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Feb 2021 17:49:46 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 115HniPJ37355996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Feb 2021 17:49:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62C1911C04C;
 Fri,  5 Feb 2021 17:49:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25C9811C04A;
 Fri,  5 Feb 2021 17:49:42 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
 [9.160.9.149]) by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Feb 2021 17:49:41 +0000 (GMT)
Message-ID: <6a5b7a1767265122d21f185c81399692d12191f4.camel@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] ima: Free IMA measurement buffer on error
From: Mimi Zohar <zohar@linux.ibm.com>
To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Greg KH
 <gregkh@linuxfoundation.org>
Date: Fri, 05 Feb 2021 12:49:41 -0500
In-Reply-To: <7000d128-272e-3654-8480-e46bf7dfad74@linux.microsoft.com>
References: <20210204174951.25771-1-nramas@linux.microsoft.com>
 <YB0YdqbbdAdbEOQw@kroah.com>
 <7000d128-272e-3654-8480-e46bf7dfad74@linux.microsoft.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-14.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-05_10:2021-02-05,
 2021-02-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=861
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102050107
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
Cc: sashal@kernel.org, dmitry.kasatkin@gmail.com, linux-kernel@vger.kernel.org,
 tyhicks@linux.microsoft.com, ebiederm@xmission.com,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2021-02-05 at 09:39 -0800, Lakshmi Ramasubramanian wrote:
> On 2/5/21 2:05 AM, Greg KH wrote:
> > On Thu, Feb 04, 2021 at 09:49:50AM -0800, Lakshmi Ramasubramanian wrote:
> >> IMA allocates kernel virtual memory to carry forward the measurement
> >> list, from the current kernel to the next kernel on kexec system call,
> >> in ima_add_kexec_buffer() function.  In error code paths this memory
> >> is not freed resulting in memory leak.
> >>
> >> Free the memory allocated for the IMA measurement list in
> >> the error code paths in ima_add_kexec_buffer() function.
> >>
> >> Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> >> Suggested-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> >> Fixes: 7b8589cc29e7 ("ima: on soft reboot, save the measurement list")
> >> ---
> >>   security/integrity/ima/ima_kexec.c | 1 +
> >>   1 file changed, 1 insertion(+)
> > 
> > <formletter>
> > 
> > This is not the correct way to submit patches for inclusion in the
> > stable kernel tree.  Please read:
> >      https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
> > for how to do this properly.
> > 
> > </formletter>
> > 
> 
> Thanks for the info Greg.
> 
> I will re-submit the two patches in the proper format.

No need.  I'm testing these patches now.  I'm not exactly sure what the
problem is.  Stable wasn't Cc'ed.  Is it that you sent the patch
directly to Greg or added "Fixes"?

thanks,

Mimi

