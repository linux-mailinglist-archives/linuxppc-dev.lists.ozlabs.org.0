Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D57A76DB18
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 00:59:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HaGWfHIq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGS8r0F53z3cC7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 08:59:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HaGWfHIq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGS7w1WLjz2yFC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 08:58:35 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 372MuNmU024419;
	Wed, 2 Aug 2023 22:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=QK66vtPkzYFSebZgaYZ9q+LMUPFJ6hFoVvtGd6vohRI=;
 b=HaGWfHIqpTCmin3p/QGMBXGgdtpLFkgmtJfmAmTBqoy25i+u21qZw53NVEuxYXwaXjE5
 ozabJF5NqaKvFaZMJPUfb94qoj7w/Op1SVLwwN0HMIb6oODVFW6Uhn3aSZLHS+fU3U6h
 T6gM7tF3d239ADdL2mLGD5z+yGZ4+TsOGTwCLgLGXjYA9ND6jF6ndOa1+cBYjNHD+yAR
 EHVJ07NxVlz8oGdTd8cqRJOvh290pSj/Bad5wyxrtLUJ/3qIHN69iT5I2/wo0fCXkIeY
 91NdGrRXh+MC4HUZw1xMuvDroYjiaJlB7e4iGJ8HeqAZxXHOWVuR9fZnrAJpv6HuktVq PA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s80ck00qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 22:58:30 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 372MBB94014550;
	Wed, 2 Aug 2023 22:58:29 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s5ft1qvnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 22:58:29 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 372MwSSf65208740
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 22:58:28 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A8625805B;
	Wed,  2 Aug 2023 22:58:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E0B258058;
	Wed,  2 Aug 2023 22:58:27 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown [9.61.115.23])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Aug 2023 22:58:27 +0000 (GMT)
Message-ID: <a312804f17f273ee0b31d28fc2bb95ef99cbb150.camel@linux.ibm.com>
Subject: Re: [PATCH 0/6] Enable loading local and third party keys on
 PowerVM guest
From: Mimi Zohar <zohar@linux.ibm.com>
To: Nayna Jain <nayna@linux.ibm.com>, linux-integrity@vger.kernel.org
Date: Wed, 02 Aug 2023 18:58:27 -0400
In-Reply-To: <20230714153435.28155-1-nayna@linux.ibm.com>
References: <20230714153435.28155-1-nayna@linux.ibm.com>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-22.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ony8YeYLq8qDwIe589R8_zLRl0FmxnVd
X-Proofpoint-ORIG-GUID: Ony8YeYLq8qDwIe589R8_zLRl0FmxnVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_18,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxlogscore=901 clxscore=1011 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020199
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2023-07-14 at 11:34 -0400, Nayna Jain wrote:
> On a secure boot enabled PowerVM guest, local and third party code signing
> keys are needed to verify signed applications, configuration files, and
> kernel modules.
> 
> Loading these keys onto either the .secondary_trusted_keys or .ima
> keyrings requires the certificates be signed by keys on the
> .builtin_trusted_keys, .machine or .secondary_trusted_keys keyrings.
> 
> Keys on the .builtin_trusted_keys keyring are trusted because of the chain
> of trust from secure boot up to and including the linux kernel.  Keys on
> the .machine keyring that derive their trust from an entity such as a
> security officer, administrator, system owner, or machine owner are said
> to have "imputed trust." The type of certificates and the mechanism for
> loading them onto the .machine keyring is platform dependent.
> 
> Userspace may load certificates onto the .secondary_trusted_keys or .ima
> keyrings. However, keys may also need to be loaded by the kernel if they
> are needed for verification in early boot time. On PowerVM guest, third
> party code signing keys are loaded from the moduledb variable in the
> Platform KeyStore(PKS) onto the .secondary_trusted_keys.

Thanks, Nayna.   I've reviewed and done some initially testing up to
5/6.

Mimi

