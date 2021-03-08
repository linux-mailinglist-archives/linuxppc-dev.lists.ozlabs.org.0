Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97D3306DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 05:35:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv59N6cRmz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 15:35:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UDIWQrLV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UDIWQrLV; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv58s6b4Rz30RT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 15:34:36 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12842W9O019901; Sun, 7 Mar 2021 23:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TXBED8z4I094JXl5OSVos1ZKTFdMDQ2Tq24XC5ZPlWM=;
 b=UDIWQrLVfJLlMhp03cNUNtY6kqV7aJuhn9hX3pEZ7sKBtssrDnU6t/DTIa0rZi0q3jfz
 UN7LBQtSI3Rt6WCmlK+Q2VcVXNuqaU5TXybLH7niIemMkG69DVmVmCQYXiFAi7jEnl9R
 NbqtfUQ0UrcGOCp1IC8tE8ihCtviBRsHo1Dvwiepsz5W/KrfL2AKVO8I1TDr2HwBpa9u
 Rnt709sxzIxPQf88H04gkXIb0KjCPvVtcVCDD1x+q2Z2zPs8APntBEDsrB8eLtprocBh
 f2ydkHa+9UY4CyHp5ZHMh04gQoP5Lnh5HTnPjhPGMNtqDCf7M4OjDTbsA6lflt8Bym06 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37583158n0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Mar 2021 23:33:54 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1284Nohv092896;
 Sun, 7 Mar 2021 23:33:54 -0500
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37583158mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 07 Mar 2021 23:33:54 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1284WUqt030826;
 Mon, 8 Mar 2021 04:33:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3741c89fya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 04:33:51 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1284Xnqg37618144
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 04:33:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E455A42049;
 Mon,  8 Mar 2021 04:33:48 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88EC742041;
 Mon,  8 Mar 2021 04:33:46 +0000 (GMT)
Received: from [9.102.1.31] (unknown [9.102.1.31])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 04:33:46 +0000 (GMT)
Subject: Re: [PATCH v4] powerpc/uprobes: Validation for prefixed instruction
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20210305115433.140769-1-ravi.bangoria@linux.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <fcbf618d-453e-b6ab-a41f-f69157ec1504@linux.ibm.com>
Date: Mon, 8 Mar 2021 10:03:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210305115433.140769-1-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_01:2021-03-03,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080018
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
Cc: oleg@redhat.com, rostedt@goodmis.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, jniethe5@gmail.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 05/03/21 5:24 pm, Ravi Bangoria wrote:
> As per ISA 3.1, prefixed instruction should not cross 64-byte
> boundary. So don't allow Uprobe on such prefixed instruction.
> 
> There are two ways probed instruction is changed in mapped pages.
> First, when Uprobe is activated, it searches for all the relevant
> pages and replace instruction in them. In this case, if that probe
> is on the 64-byte unaligned prefixed instruction, error out
> directly. Second, when Uprobe is already active and user maps a
> relevant page via mmap(), instruction is replaced via mmap() code
> path. But because Uprobe is invalid, entire mmap() operation can
> not be stopped. In this case just print an error and continue.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
> v3: https://lore.kernel.org/r/20210304050529.59391-1-ravi.bangoria@linux.ibm.com
> v3->v4:
>   - CONFIG_PPC64 check was not required, remove it.
>   - Use SZ_ macros instead of hardcoded numbers.
> 

Acked-by: Sandipan Das <sandipan@linux.ibm.com>
