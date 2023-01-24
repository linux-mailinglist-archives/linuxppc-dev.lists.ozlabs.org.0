Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9367679DC8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 16:43:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1WT54xPLz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 02:43:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eK8PveY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eK8PveY1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1WSB0TRcz2xY3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 02:42:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30OEAC5b000561;
	Tue, 24 Jan 2023 15:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=UgMQEqtjhQF9r/tw/AUOwEcMaeF8fVSZBwtQlYRU3KU=;
 b=eK8PveY12rZbfqkN/oHXPw1HHsPo6QzT+Fxpg7x9IWF8VKBhlWCP9joqAPotmsJeD+fa
 tooaqWRV0rQxK2bR3MU/jSMypZPayHXlPLOa9yfK5FZ5qQRbDIjoQMXEcfV3KhzvFmA/
 e572rSMWCM88botfCetrXz4TlsROB2ChmxsVuKqUkW/gnLfRRr4/JKc+URAiymUZmOkl
 zSYxJ3sUXJuCwwAYLhrqS/COWOXNcmlLCHKJoq3oT2ZqgEeP4Y6baqNS86HULpqlDs3M
 ng2uYYwj+6bcDdwmLwUv1X9HIFuPRYcJhG363aFolBSIwJ4Kw38vjQVyO7NP2Y/YgIi7 CA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac201tdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 15:42:09 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30OFHCpW010684;
	Tue, 24 Jan 2023 15:42:08 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([9.208.129.118])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n87p72w6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jan 2023 15:42:08 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30OFg6MP3867214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 24 Jan 2023 15:42:06 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D69B5805D;
	Tue, 24 Jan 2023 15:42:06 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6918B58058;
	Tue, 24 Jan 2023 15:42:05 +0000 (GMT)
Received: from sig-9-65-196-40.ibm.com (unknown [9.65.196.40])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 24 Jan 2023 15:42:05 +0000 (GMT)
Message-ID: <d8146e42b3d0a6d361035fa49aa2dd2fb7539363.camel@linux.ibm.com>
Subject: Re: [PATCH v4 23/24] integrity/powerpc: Improve error handling &
 reporting when loading certs
From: Mimi Zohar <zohar@linux.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-integrity@vger.kernel.org
Date: Tue, 24 Jan 2023 10:42:05 -0500
In-Reply-To: <20230120074306.1326298-24-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
	 <20230120074306.1326298-24-ajd@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M54Hp2sYwHwDaeuybN7342Rgr9MJjL_q
X-Proofpoint-ORIG-GUID: M54Hp2sYwHwDaeuybN7342Rgr9MJjL_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301240141
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-01-20 at 18:43 +1100, Andrew Donnellan wrote:
> From: Russell Currey <ruscur@russell.cc>
> 
> A few improvements to load_powerpc.c:
> 
>  - include integrity.h for the pr_fmt()
>  - move all error reporting out of get_cert_list()
>  - use ERR_PTR() to better preserve error detail
>  - don't use pr_err() for missing keys
> 
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>

Thanks,

Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>

