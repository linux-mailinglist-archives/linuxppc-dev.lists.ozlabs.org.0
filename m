Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C15024A696
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 21:12:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWy801fHzzDqxH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 05:12:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XvyShfWd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWy4C1xqgzDqx4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 05:08:42 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JJ54ZZ026604; Wed, 19 Aug 2020 15:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fERrORDHRZJqKDURjxDfZ/sgwq/lbGPVe7/HP4wuH2k=;
 b=XvyShfWd/j4ro9rbaUVbrUlhIzmTduhJGejjBNGzkXTZQxnXbuOFUVWbEUGgCosNvSUs
 5H+dDy8dsGFhjRCqOgbQCTwWEGVV2AnQD9SI2Zw5Sk6S87yQVF2zzR/tWpn+a3kwWTeq
 A2U3OatopRwEUDVUe9FQnp6Sx1NDTBnpLvJxcINVO66azzmDoEyrgyQxEAcZY33QfoMU
 HWpUP/G6yOnbs0VGrQOJFScC2gKLbMCtH2GvoLuoV9GPuBVm+X3S8MQnbpikmiDpkMWZ
 29oIgb9GImwtUl35wxLOj2mxnGIYDDnCfM3GsbVp7RzUQT07WWLJyP/lPH2+iO4vV8G8 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3311ydrc2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 15:08:39 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JJ5N64028499;
 Wed, 19 Aug 2020 15:08:38 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3311ydrc1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 15:08:38 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JJ5fgd032716;
 Wed, 19 Aug 2020 19:08:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3304buhc8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 19:08:36 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07JJ8YYc59572626
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 19:08:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 302EC52051;
 Wed, 19 Aug 2020 19:08:34 +0000 (GMT)
Received: from [9.199.46.117] (unknown [9.199.46.117])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4BCD45204E;
 Wed, 19 Aug 2020 19:08:33 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for
 POWER10
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200819094700.493399-1-npiggin@gmail.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <0a983343-d551-3dc6-50a1-6de902c8f522@linux.ibm.com>
Date: Thu, 20 Aug 2020 00:38:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200819094700.493399-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_12:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=745 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190154
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, Ryan P Grimm <rgrimm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/08/20 3:17 pm, Nicholas Piggin wrote:
> This driver does not restore stop > 3 state, so it limits itself
> to states which do not lose full state or TB.
>
> The POWER10 SPRs are sufficiently different from P9 that it seems
> easier to split out the P10 code. The POWER10 deep sleep code
> (e.g., the BHRB restore) has been taken out, but it can be re-added
> when stop > 3 support is added.
>
> Cc: Ryan P Grimm <rgrimm@us.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Cc: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>
Tested-by: Pratik Rajesh Sampat<psampat@linux.ibm.com>
Reviewed-by: Pratik Rajesh Sampat<psampat@linux.ibm.com>

I've tested the patch on P9 and P10, can verify the corresponding code
paths are being taken for their respective architecture and cpuidle is
being exercised with the correct set of advertised stop states in each
case.

The patch looks good to me.

---
Thanks,
Pratik

  

