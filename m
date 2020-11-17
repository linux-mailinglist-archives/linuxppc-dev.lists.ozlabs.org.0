Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C52B55D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 01:43:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZnHC0zkgzDqRL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 11:43:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rKbYO2OM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZnF31tL1zDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 11:41:26 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AH0Vjss149049
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 19:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2JY/WzolvnSKYP+XFrQCzQ6sondyFOg2qqTXh3Y9wf4=;
 b=rKbYO2OM7msQU1b+O/uMG41qjwEFnFl30HInqQUyJ2mrA8aGnFRcWJr/ZzykWG9HEbhs
 O51kyni5RAgaGgGLQAc0pkdc4k3VXKIRNv24ZbuZeCMB9hEbB8fI6R2JLojh/QX2ATLO
 7IYZ3eGg2mvhoKioGuNqdA7HECfb2LHCWgdkskw9j9paU7wse/HWR34NS2Ji5hCAlY08
 D/LqzTYENOH+zZsipraehur956oDrDF1i0K2TF7UVQAg7B4v8XGoYbTuQ8s6S923eS7q
 NRyOIUnE8MqusS4FJFoqiDN0cse0Lkx+E5llbqNqlkih6YCsUnMDLBvOd861B29JoTVb 8w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v3w9gb59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 19:41:23 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AH0cGmG019689
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:21 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 34t6gh2kq1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AH0fJF61245754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352F411C05B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:19 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D71B411C04C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 00:41:18 +0000 (GMT)
Received: from [9.206.209.35] (unknown [9.206.209.35])
 (using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9FC3BA012A;
 Tue, 17 Nov 2020 11:41:17 +1100 (AEDT)
Subject: Re: [PATCH] ocxl: Mmio invalidation support
To: Christophe Lombard <clombard@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, fbarrat@linux.vnet.ibm.com
References: <20201113153333.290505-1-clombard@linux.vnet.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <76002af5-6ada-ad2c-0470-e2cdc5b360c2@linux.ibm.com>
Date: Tue, 17 Nov 2020 11:41:17 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113153333.290505-1-clombard@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_13:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=686
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011160147
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14/11/20 2:33 am, Christophe Lombard wrote:
> OpenCAPI 4.0/5.0 with TLBI/SLBI Snooping, is not used due to performance
> problems caused by the PAU having to process all incoming TLBI/SLBI
> commands which will cause them to back up on the PowerBus.
> 
> When the Address Translation Mode requires TLB and SLB Invalidate
> operations to be initiated using MMIO registers, a set of registers like
> the following is used:
> • XTS MMIO ATSD0 LPARID register
> • XTS MMIO ATSD0 AVA register
> • XTS MMIO ATSD0 launch register, write access initiates a shoot down
> • XTS MMIO ATSD0 status register
> 
> The MMIO based mechanism also blocks the NPU/PAU from snooping TLBIE
> commands from the PowerBus.
> 
> The Shootdown commands (ATSD) will be generated using MMIO registers
> in the NPU/PAU and sent to the device.
> 
> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>

snowpatch has reported some minor checkpatch issues: 
https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/16267//artifact/linux/checkpatch.log

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
