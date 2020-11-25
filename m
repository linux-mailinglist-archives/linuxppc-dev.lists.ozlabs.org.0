Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2F2C3D55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 11:11:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgxWX59WyzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 21:11:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hs1qPfAe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgxTH0ZvGzDqQG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 21:09:54 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0APA2eK9047356; Wed, 25 Nov 2020 05:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=izIxdfYMBig8wZeWFr6sWO8q4sVy35etsgzGm+aYOIQ=;
 b=hs1qPfAe4kfdQoeYwsRfqPGIrzDsUMagiqqER9+tqCC3uadUatRH3jdVBGP10tru/ZoL
 0rGzebGzvrT8FmB+u5KKAOw42vOYhXbKZXydWzRyAZddywUAsD7/ar7tj7tW9XB37L0F
 igL8Cf7lFwdOLkReCsGZIGHfK0wXZAloykOGKO1uFq9BHyxk88dg0ofJAeNDTvmjM6zA
 OOvgwSxM/Q0qRPLXo4NSimMfwoPoOAzDmqzAcVUDEMy7GF8C+mhrFFKH9SG7giXa79XM
 mYgj46ewqUJuc23x3dzGMBVQUyRAz8EhuhXkciV6clfWMPbhSKAjpZGocKTPk5P65eTH QA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351jj7wfxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:09:43 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0APA2tN5048877;
 Wed, 25 Nov 2020 05:09:43 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 351jj7wfw3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:09:43 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0APA2SaB009416;
 Wed, 25 Nov 2020 10:09:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 350cvrt0au-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 10:09:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0APA9b8H47710650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 10:09:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD67D4C044;
 Wed, 25 Nov 2020 10:09:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C78C54C058;
 Wed, 25 Nov 2020 10:09:34 +0000 (GMT)
Received: from [9.199.45.188] (unknown [9.199.45.188])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 10:09:34 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc: sstep: Fix load and update instructions
To: Sandipan Das <sandipan@linux.ibm.com>
References: <20201119054139.244083-1-sandipan@linux.ibm.com>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <daf02936-8a92-e909-7495-7a48f01cfe31@linux.ibm.com>
Date: Wed, 25 Nov 2020 15:39:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201119054139.244083-1-sandipan@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-25_05:2020-11-25,
 2020-11-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011250057
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, jniethe5@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 855457ed09b5..25a5436be6c6 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -2157,11 +2157,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   
>   		case 23:	/* lwzx */
>   		case 55:	/* lwzux */
> +			if (u && (ra == 0 || ra == rd))
> +				return -1;

I guess you also need to split case 23 and 55?

- Ravi
