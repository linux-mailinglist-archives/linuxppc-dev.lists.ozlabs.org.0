Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BFB4350D4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 18:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZGyd0kymz30RK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 03:58:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lbzwgOun;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lbzwgOun; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZGxr4C0vz2xX5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 03:57:36 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KGpe2d026736; 
 Wed, 20 Oct 2021 12:57:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=trLzzqXQ74LpX5eCSDS2/sCA15hX4PPZwwXliX5rAYA=;
 b=lbzwgOunDHUq0I+y9yGzdHiSvzaLW6DFdIQw+Y9BE91X9nlg0WJWVELWMknKc10yecvW
 gjl1YA+RMA0zByaRogqh132LmJo7Fdl8hz5ErLF+snediK7tiPPM7F3LWBiqP+L1jny7
 2Rq1yC8dQEvdAcF2rvgAi+7WMY+3n8KiGEGNYq39Tiap2IJ743OYtQJjTHueOKxpfti7
 ZdGhghCGzLeND7cqmdiCte2MSlYV6QVf/BFTDzdtNh2JJGuIlXc4Ik+F+ODk2g/fhq2k
 T01mG+wpoP5tMned8mq3SwJ1TbW8GRnCtBk0JGlaw0qee7B+QHUl86cyFTaSsQcTO9AO +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btpg70vn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 12:57:30 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19KGs652031779;
 Wed, 20 Oct 2021 12:57:29 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btpg70vmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 12:57:29 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KGvSDq000882;
 Wed, 20 Oct 2021 16:57:28 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04wdc.us.ibm.com with ESMTP id 3bqpcbspgp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 16:57:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KGvQMq42336660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 16:57:26 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A81F7C6073;
 Wed, 20 Oct 2021 16:57:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC1A8C6062;
 Wed, 20 Oct 2021 16:57:24 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 16:57:24 +0000 (GMT)
Subject: Re: [PATCH] PCI/hotplug: Remove unneeded of_node_put() in pnv_php
To: Nathan Lynch <nathanl@linux.ibm.com>, Wan Jiabing <wanjiabing@vivo.com>
References: <20211020094604.2106-1-wanjiabing@vivo.com>
 <87tuhcx6v6.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <0622b8ea-7587-2e6b-5558-fae1847b14b9@linux.ibm.com>
Date: Wed, 20 Oct 2021 09:57:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87tuhcx6v6.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UQqsjwRes6ukURU9LcuVM2CbxBr-x2Cg
X-Proofpoint-ORIG-GUID: mfaW1Nz8f-BHa00nn_2yLtUZbY8oSQtP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110200092
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
Cc: ajd@linux.ibm.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 kael_w@yeah.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/20/21 4:39 AM, Nathan Lynch wrote:
> Wan Jiabing <wanjiabing@vivo.com> writes:
>> Fix following coccicheck warning:
>> ./drivers/pci/hotplug/pnv_php.c:161:2-13: ERROR: probable double put.
>>
>> Device node iterators put the previous value of the index variable, so
>> an explicit put causes a double put.
> 
> I suppose Coccinelle doesn't take into account that this code is
> detaching and freeing the nodes.
> 
> 
>> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
>> index f4c2e6e01be0..f3da4f95d73f 100644
>> --- a/drivers/pci/hotplug/pnv_php.c
>> +++ b/drivers/pci/hotplug/pnv_php.c
>> @@ -158,7 +158,6 @@ static void pnv_php_detach_device_nodes(struct device_node *parent)
>>  	for_each_child_of_node(parent, dn) {
>>  		pnv_php_detach_device_nodes(dn);
>>  
>> -		of_node_put(dn);
>>  		of_detach_node(dn);
>>  	}
> 
> The code might be improved by comments explaining how the bare
> of_node_put() corresponds to a "get" somewhere else in the driver, and
> how it doesn't render the ongoing traversal unsafe. It looks suspicious
> on first review, but I believe it's intentional and probably correct as
> written.
> 

This is a common usage pattern which if we put a comment about the pattern here
we need to do it every where. I suppose a better solution is to wrap this put in
a more descriptive function name like of_node_long_put() or something of the
sort the makes it obvious we are dropping a long held global scope reference.

-Tyrel
