Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCFF24A500
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 19:35:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWw0k2ytzzDqxh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 03:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tGyqrmpy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWvwt0ldTzDqpk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 03:32:13 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JGWe7b103678; Wed, 19 Aug 2020 13:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=t9FAIHLkM/lvrFLbVS/B18I2uwTMsZmgzyzxgIY9r+4=;
 b=tGyqrmpyXOoKboIF1Aww7UERmcGfJuFtt+7Aygvx1R3scKzvXRUj9Rt0sy5VNWTLDTtW
 PEk9Vqpvm28HjgmRdFEEPqFBTHI6IxU9kreTSEe++prcA6E/CUgllkJ/jwgHotfjBacj
 LDSHEJ2Q3zMIuISboiM4M0D5XdhLiVnXp3cTOARHmcULkObYvTDEDXpY0yVAs4PDgl2a
 g84eokUDU9RYUuIoGQxMmdvFKSGBllXXihHA4cAgkuwq5sqinnGm3KvoyuZrAmiQ1Rq+
 LkkOLMezlQ0QnQEzYfvrZjnJy6H95P02Eyz3k83ACJEZ+cEcVXhA9vuF4kSm0KDjb3FZ Ow== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310eygwsk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:32:10 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JHSi5b075024;
 Wed, 19 Aug 2020 13:32:10 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3310eygwrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:32:10 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JHVu5F009143;
 Wed, 19 Aug 2020 17:32:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3304um24vy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 17:32:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JHW5xU20185424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 17:32:05 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7797A4065;
 Wed, 19 Aug 2020 17:32:05 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A2B5A4054;
 Wed, 19 Aug 2020 17:32:04 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.199.42.143])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Aug 2020 17:32:04 +0000 (GMT)
Date: Wed, 19 Aug 2020 23:02:02 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/powernv/idle: add a basic stop 0-3 driver for
 POWER10
Message-ID: <20200819173202.GA48285@drishya.in.ibm.com>
References: <20200819094700.493399-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200819094700.493399-1-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_09:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=599 mlxscore=0 suspectscore=1
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190138
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
Reply-To: svaidy@linux.ibm.com
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 Pratik Rajesh Sampat <psampat@linux.ibm.com>, Ryan P Grimm <rgrimm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin <npiggin@gmail.com> [2020-08-19 19:47:00]:

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


Tested-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

This patch series was tested on P9 and P10. Correct set of
stop states were discovered and enabled in the platform.

Further the SPRs saved and restored by this code has also been
tested along with cpuidle state tests and cpu offline/online tests.

Thank for patch.

--Vaidy

