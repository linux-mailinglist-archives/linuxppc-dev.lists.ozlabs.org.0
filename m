Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 903D124A51E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:42:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWw8y3wj1zDqym
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 03:42:42 +1000 (AEST)
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
 header.s=pp1 header.b=q8CYu/EH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWw6M5n61zDqx0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 03:40:27 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JHXG9D151258; Wed, 19 Aug 2020 13:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qTCMDCqSrp73EosSfoP2KvwDvcmXqww0tNgEnsmvF0A=;
 b=q8CYu/EHB8bDP9OhIvldCuYAs2oAlonw3n/PtcpWh4rlmxsaO9z6LZI3PPBQzVic+djX
 guoeFooPGto8ljh8/UZkPhhF7o89/44faly903zZTY5R3+PdD+kiUqgpT3PV8knBBzrp
 vJRl894wFnBP6WpwiIRdLotzj67sjKuXGuYWNdZ0jLKiuTL70dk8GP5vr1CTYHrDLCXV
 i/yWHN8SbTAFhTnAm05WsYPtMBV25aQkvdSH7FCWSlYlJEuE09ZyCV8hixtG6UUwr9H1
 hkU5Eal1/7hrCOieF8jyVZxxX4CUOZDxEpVSlvPEV6gBXhYm5Lmi6sX0tKsyrpPouYUg Fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3317aaaggb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:40:25 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JHXUUT151935;
 Wed, 19 Aug 2020 13:40:25 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3317aaagfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:40:25 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JHYxJV022851;
 Wed, 19 Aug 2020 17:40:22 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 3304buhav9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 17:40:22 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07JHeKMH65143080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 17:40:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A3EB42042;
 Wed, 19 Aug 2020 17:40:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A1DA4204B;
 Wed, 19 Aug 2020 17:40:19 +0000 (GMT)
Received: from [9.85.72.156] (unknown [9.85.72.156])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 17:40:19 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for
 POWER10
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200819094700.493399-1-npiggin@gmail.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <b83eb88d-54e1-b7f4-49f6-89ea7f80f838@linux.ibm.com>
Date: Wed, 19 Aug 2020 23:10:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200819094700.493399-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_10:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=830 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008190145
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
Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check 
with PVR check")

The patch fixes the commit 8747bf36f312 which had setup idle for only 
for the P9 PVR.

---
Thanks for fixing this!
Pratik
