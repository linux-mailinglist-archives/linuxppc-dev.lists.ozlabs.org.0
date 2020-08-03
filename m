Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F1823A7F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 15:55:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKztV3P6TzDqSm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 23:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKzqJ2TBtzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 23:52:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 073DbWnl025963; Mon, 3 Aug 2020 09:52:51 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pkdkrq6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 09:52:51 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 073DbXO3026364;
 Mon, 3 Aug 2020 09:52:50 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32pkdkrq64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 09:52:50 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073Dp5mT014155;
 Mon, 3 Aug 2020 13:52:48 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32nyyd0jnb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Aug 2020 13:52:48 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 073Dqjn819726800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Aug 2020 13:52:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BC22AE055;
 Mon,  3 Aug 2020 13:52:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D36E0AE04D;
 Mon,  3 Aug 2020 13:52:44 +0000 (GMT)
Received: from pomme.local (unknown [9.145.48.251])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  3 Aug 2020 13:52:44 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCHv4 1/2] powerpc/pseries: group lmb operation and memblock's
To: linuxppc-dev@lists.ozlabs.org, Pingfan Liu <kernelfans@gmail.com>
References: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
Message-ID: <ee585548-aefc-ff3f-6a79-e616b9e04f12@linux.ibm.com>
Date: Mon, 3 Aug 2020 15:52:44 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596116005-27511-1-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-03_10:2020-08-03,
 2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=957 priorityscore=1501 clxscore=1011
 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008030098
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> @@ -603,6 +606,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>         }
>
>         lmb_set_nid(lmb);
> +       lmb->flags |= DRCONF_MEM_ASSIGNED;
> +
>         block_sz = memory_block_size_bytes();
>
>         /* Add the memory */

Since the lmb->flags is now set earlier, you should unset it in the case the 
call to __add_memory() fails, something like:

@@ -614,6 +614,7 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
  	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
  	if (rc) {
  		invalidate_lmb_associativity_index(lmb);
+		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
  		return rc;
  	}

> @@ -614,11 +619,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>
>         rc = dlpar_online_lmb(lmb);
>         if (rc) {
> -               __remove_memory(lmb->nid, lmb->base_addr, block_sz);
> +               int nid = lmb->nid;
> +               phys_addr_t base_addr = lmb->base_addr;
> +
>                 invalidate_lmb_associativity_index(lmb);
>                 lmb_clear_nid(lmb);
> -       } else {
> -               lmb->flags |= DRCONF_MEM_ASSIGNED;
> +               lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> +
> +               __remove_memory(nid, base_addr, block_sz);
>         }
>
>         return rc;
