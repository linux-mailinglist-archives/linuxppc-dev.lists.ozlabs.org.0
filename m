Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F6A1D5C09
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 00:04:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49P2WS6F0MzDr7p
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 08:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gromero@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49P2Tj1yTVzDr6V
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 08:03:01 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04FLXf9e184332
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 18:02:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310t9q3gph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 18:02:59 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04FLiELo012454
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 18:02:58 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 310t9q3gpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 18:02:58 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04FM02uo003573;
 Fri, 15 May 2020 22:02:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3100ucgyst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 May 2020 22:02:58 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04FM2tlJ19857838
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 22:02:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD2F9C607B;
 Fri, 15 May 2020 22:02:56 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F40DC607A;
 Fri, 15 May 2020 22:02:55 +0000 (GMT)
Received: from oc6336877782.ibm.com (unknown [9.85.201.81])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 May 2020 22:02:55 +0000 (GMT)
Subject: Re: powerpc/pci: [PATCH 1/1 V2] PCIE PHB reset
To: wenxiong@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
References: <1589573097-12892-1-git-send-email-wenxiong@linux.vnet.ibm.com>
From: Gustavo Romero <gromero@linux.vnet.ibm.com>
Message-ID: <45fc2a87-9b3b-d08e-b567-42443415ccf5@linux.vnet.ibm.com>
Date: Fri, 15 May 2020 19:02:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1589573097-12892-1-git-send-email-wenxiong@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-15_07:2020-05-15,
 2020-05-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=743 phishscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 cotscore=-2147483648 suspectscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005150181
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
Cc: brking@linux.vnet.ibm.com, oohall@gmail.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Xiong,

On 5/15/20 5:04 PM, wenxiong@linux.vnet.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
> 
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code. PHB reset stop all PCI transactions from previous
> kernel. We have tested the patch in several enviroments:

What do you mean exactly by "previous kernel" in here? Is there a way to
enhance that comment a bit further?


Thanks,
Gustavo
