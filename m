Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD391F4CD1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 07:20:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hb1H4Fx5zDqXN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 15:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hZyp2TjlzDqY0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 15:18:42 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05A53Zc5163447; Wed, 10 Jun 2020 01:18:35 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jbvjn1h8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 01:18:35 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05A557tm174053;
 Wed, 10 Jun 2020 01:18:34 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31jbvjn1gd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 01:18:34 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05A5FtuR021504;
 Wed, 10 Jun 2020 05:18:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 31g2s7twk1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jun 2020 05:18:32 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05A5ITmc54460666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Jun 2020 05:18:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0466F4C046;
 Wed, 10 Jun 2020 05:18:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 789E94C040;
 Wed, 10 Jun 2020 05:18:26 +0000 (GMT)
Received: from [9.199.42.207] (unknown [9.199.42.207])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Jun 2020 05:18:26 +0000 (GMT)
Subject: Re: [PATCH 4/6] powerpc/ppc-opcode: consolidate powerpc instructions
 from bpf_jit.h
To: Balamuruhan S <bala24@linux.ibm.com>
References: <20200526081523.92463-1-bala24@linux.ibm.com>
 <20200526081523.92463-5-bala24@linux.ibm.com>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <dd44456a-cd76-f992-4aca-eaabdf05f348@linux.ibm.com>
Date: Wed, 10 Jun 2020 10:48:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526081523.92463-5-bala24@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-10_02:2020-06-10,
 2020-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=698 malwarescore=0 impostorscore=0
 cotscore=-2147483648 suspectscore=0 mlxscore=0 clxscore=1015 adultscore=0
 spamscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006100037
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, paulus@samba.org,
 jniethe5@gmail.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 26/05/20 1:45 pm, Balamuruhan S wrote:
> move macro definitions of powerpc instructions from bpf_jit.h to ppc-opcode.h
> and adopt the users of the macros accordingly. `PPC_MR()` is defined twice in
> bpf_jit.h, remove the duplicate one.
> 
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
> Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h | 139 +++++++++++++
>  arch/powerpc/net/bpf_jit.h            | 166 ++-------------
>  arch/powerpc/net/bpf_jit32.h          |  24 +--
>  arch/powerpc/net/bpf_jit64.h          |  12 +-
>  arch/powerpc/net/bpf_jit_comp.c       | 132 ++++++------
>  arch/powerpc/net/bpf_jit_comp64.c     | 278 +++++++++++++-------------
>  6 files changed, 378 insertions(+), 373 deletions(-)
> [...]
> 

Acked-by: Sandipan Das <sandipan@linux.ibm.com>
