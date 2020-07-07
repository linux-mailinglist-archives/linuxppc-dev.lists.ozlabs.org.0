Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DDE216429
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 04:52:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B16RY10blzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:52:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B16Pw4hv1zDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:51:00 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0672VmEo019712; Mon, 6 Jul 2020 22:50:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3248nrjarv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 22:50:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0672k5TT023460;
 Tue, 7 Jul 2020 02:50:51 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 322hd7tw8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jul 2020 02:50:51 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0672om0u48562338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jul 2020 02:50:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D11E2AE057;
 Tue,  7 Jul 2020 02:50:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE11CAE051;
 Tue,  7 Jul 2020 02:50:47 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue,  7 Jul 2020 02:50:47 +0000 (GMT)
Date: Tue, 7 Jul 2020 08:20:47 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Restrict possible nodes based on platform
Message-ID: <20200707025047.GA874@linux.vnet.ibm.com>
References: <20200706064002.14848-1-srikar@linux.vnet.ibm.com>
 <00388e11-9025-e273-137d-c23f8795457a@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <00388e11-9025-e273-137d-c23f8795457a@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-07_01:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 cotscore=-2147483648 mlxscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007070014
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Tyrel Datwyler <tyreld@linux.ibm.com> [2020-07-06 13:58:42]:

> On 7/5/20 11:40 PM, Srikar Dronamraju wrote:
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index 9fcf2d195830..3d55cef1a2dc 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -897,7 +897,7 @@ static void __init find_possible_nodes(void)
> >  		return;
> > 
> >  	if (of_property_read_u32_index(rtas,
> > -				"ibm,max-associativity-domains",
> > +				"ibm,current-associativity-domains",
> 
> I'm not sure ibm,current-associativity-domains is guaranteed to exist on older
> firmware. You may need check that it exists and fall back to
> ibm,max-associativity-domains in the event it doesn't
> 
> -Tyrel
> 

Oh, 
thanks Tyrel thats a good observation.
Will fallback on max-associativity.

-- 
Thanks and Regards
Srikar Dronamraju
