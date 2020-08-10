Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E649A2403BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 11:00:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ9150NnrzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 19:00:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Knzpvj2j; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8yp1cpPzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:58:57 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A8aUeY166943; Mon, 10 Aug 2020 04:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WIrnU1b+VVp7E/NR92LozMt2FAeGL+Td+3pQ6MnfYMw=;
 b=Knzpvj2j/xZ1NrEE+WEfYwnmqqQI9kG7iDe51XB+1kXSIVhanVbsa6YtDdV/IDoinkvy
 IwcUkqHdKhFtwW/khubBlGVChRmrmkonwbxfDroSiMdpYRAL3YQWCBUQP/lgY5TbgQu3
 8yqkpjwoVxcYrQa32cF2oKR+3daTEONP2+6rNOtM8iQsDdMi+qEIxzySXVaoI4gO0J0t
 Uo5cxycrG0KTSHHZocqzEITwB/60mWQBlSGGHADJEcScw2knv1mse9EMS/QAkIN2kMYm
 rhAaAE9gbp7hDgOrl3X0DPhz2AcE+FOzaWjIvdqXXU06cvvtNDdcDyMkjHWl2Pt2lcpM Aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6re4c9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 04:58:55 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A8aXbT167155;
 Mon, 10 Aug 2020 04:58:54 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr6re4a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 04:58:54 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A8trI3012021;
 Mon, 10 Aug 2020 08:58:48 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 32skp81965-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 08:58:48 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07A8wjeH57278876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 08:58:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9924A4053;
 Mon, 10 Aug 2020 08:58:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81AF3A4055;
 Mon, 10 Aug 2020 08:58:44 +0000 (GMT)
Received: from [9.85.68.158] (unknown [9.85.68.158])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 08:58:44 +0000 (GMT)
Subject: Re: [PASEMI] Nemo board doesn't boot anymore after the commit
 "powerpc/book3s64/pkeys: Simplify pkey disable branch"
To: Christian Zigotzky <chzigotzky@xenosoft.de>
References: <87h7tb4zwp.fsf@linux.ibm.com>
 <E1C071A5-19D1-4493-B04A-4507A70D7848@xenosoft.de>
 <bc1975fb-23df-09c2-540a-c13b39ad56c5@xenosoft.de>
 <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <9688335c-d7d0-9eaa-22c6-511e708e0d2a@linux.ibm.com>
Date: Mon, 10 Aug 2020 14:28:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <51482c70-1007-1202-9ed1-2d174c1e923f@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_03:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100057
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/10/20 2:15 PM, Christian Zigotzky wrote:
> Hello Aneesh,
> 
> I tested the new kernel today and unfortunately it doesn't run very well.
> 
> I have only one core (1 physical processor; 1 core; 2 threads) instead 
> of two cores (1 physical processor; 2 cores; 2 threads) so the system is 
> slower.
> 
> Boot log: http://www.xenosoft.de/dmesg_nemo_board_kernel_5.9.txt
> 
> Could you please check the updates?


modified   arch/powerpc/mm/book3s64/hash_utils.c
@@ -1116,7 +1116,8 @@ void hash__early_init_mmu_secondary(void)
  		tlbiel_all();

  #ifdef CONFIG_PPC_MEM_KEYS
-	mtspr(SPRN_UAMOR, default_uamor);
+	if (mmu_has_feature(MMU_FTR_PKEY))
+		mtspr(SPRN_UAMOR, default_uamor);
  #endif
  }
  #endif /* CONFIG_SMP */



-aneesh
