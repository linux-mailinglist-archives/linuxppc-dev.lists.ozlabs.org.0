Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52D4546D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 14:03:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvNQq1hLdz307j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 00:03:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qsvvF/QR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=michaele@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qsvvF/QR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvNQ61Jm4z2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 00:02:53 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHClNnP008105; 
 Wed, 17 Nov 2021 13:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=YwP8EgRHOTEHvy/Pl/L7k492SueLjOm+LcfbEUV7NNE=;
 b=qsvvF/QRT0OVVrsoEwtMbRTURThpYuxXtchYM1gA5TSHlBnlKzqb39UreeT1aysx8q2Q
 BuyOa41y4CUc01SA+sFzblAIre+XYbGmSVz6Mc/cRqFvXwI9R3BTfBN1BI+qbuMJPfps
 wMbw84qz6V5glFGSosdRWyzjcJZ+hgK9ovWoj1DJGdzQD5cnSOyasT9FecI9Jmon919H
 UaW+WR3rj7J5okMCIkYHNYvyn7fAXtKcZjGF6FLuXmYpaNuF5B11V0AkiCxWfzRBLR4J
 S9ZzsiVawNMq0hpTsbg2BD+6oyk4qEh/d5WgaOI14Pmnc7kK+ZWrLi7hD9HpEiYhKR0k Eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd226098t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:02:48 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AHCm5c3012624;
 Wed, 17 Nov 2021 13:02:48 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd2260982-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:02:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHCx2Tr020343;
 Wed, 17 Nov 2021 13:02:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ca50ba2s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 13:02:27 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHD1LGI57999710
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 13:01:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FD49A406E;
 Wed, 17 Nov 2021 13:01:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6822A4073;
 Wed, 17 Nov 2021 13:01:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 13:01:20 +0000 (GMT)
Received: from localhost (unknown [9.206.140.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3A833600E3;
 Thu, 18 Nov 2021 00:01:19 +1100 (AEDT)
From: Michael Ellerman <michaele@au1.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, Michael Ellerman
 <patch-notifications@ellerman.id.au>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel 0/4] Fixes for powerpc/pseries/iommu: Make use of
 DDW for indirect mapping
In-Reply-To: <98447986-ecef-13eb-1fd3-a635cb75fba7@linux.ibm.com>
References: <20211020132315.2287178-1-aik@ozlabs.ru>
 <163582100676.1804905.10010614237761858649.b4-ty@ellerman.id.au>
 <98447986-ecef-13eb-1fd3-a635cb75fba7@linux.ibm.com>
Date: Thu, 18 Nov 2021 00:01:18 +1100
Message-ID: <874k8blyw1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xa3yJYvLAU1Pka8jr1aYKsnjPw-pBod_
X-Proofpoint-GUID: Mx_Grz3XSqixF1THFyHmJeTwBpMffTgn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_04,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 clxscore=1011 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170067
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Brian King <brking@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frederic Barrat <fbarrat@linux.ibm.com> writes:
> On 02/11/2021 03:43, Michael Ellerman wrote:
>> On Thu, 21 Oct 2021 00:23:11 +1100, Alexey Kardashevskiy wrote:
>>> Found some issues on SRIOV enabled PHYP.
>>> It probably should be one patch, or not?
>>>
>>> Please comment. Thanks.
>>>
>>> [...]
>> 
>> Patches 2-4 applied to powerpc/fixes.
>
>
> Any reason why patch 1 was not applied? The indents are still wrong in 
> 5.16-rc1

Just because it was late in the rc series, and it wasn't crucial that
the whitespace fix go into 5.15.

And yeah Alexey has now reposted it and I have picked that series up.

cheers
