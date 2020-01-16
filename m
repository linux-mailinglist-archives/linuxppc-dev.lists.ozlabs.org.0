Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001213D56F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 08:56:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yxNl5F1gzDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yxLN554lzDqXN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 18:54:51 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00G73tgt000707
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 02:04:02 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xh7h9g5uy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 02:03:59 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Thu, 16 Jan 2020 07:03:11 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 Jan 2020 07:03:09 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00G738mT51773576
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jan 2020 07:03:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77EE44204B;
 Thu, 16 Jan 2020 07:03:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B5284203F;
 Thu, 16 Jan 2020 07:03:07 +0000 (GMT)
Received: from in.ibm.com (unknown [9.193.100.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jan 2020 07:03:07 +0000 (GMT)
Date: Thu, 16 Jan 2020 12:33:04 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] skiboot machine check handler
References: <20191211100118.544-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211100118.544-1-npiggin@gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 20011607-0008-0000-0000-00000349CB51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011607-0009-0000-0000-00004A6A23EC
Message-Id: <20200116070304.hks6zfsqholfolal@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-16_02:2020-01-16,
 2020-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=750 priorityscore=1501 spamscore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 mlxscore=0
 suspectscore=1 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001160058
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: skiboot@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-12-11 20:01:18 Wed, Nicholas Piggin wrote:
> Provide facilities to decode machine checks into human readable
> strings, with only sufficient information required to deal with
> them sanely.
> 
> The old machine check stuff was over engineered. The philosophy
> here is that OPAL should correct anything it possibly can, what
> it can't handle but the OS might be able to do something with
> (e.g., uncorrected memory error or SLB multi-hit), it passes back
> to Linux. Anything else, the OS doesn't care. It doesn't want a
> huge struct of severities and levels and originators etc that it
> can't do anything with -- just provide human readable strings
> for what happened and what was done with it.
> 
> A Linux driver for this will be able to cope with new processors.
> 
> This also uses the same facility to decode machine checks in OPAL
> boot.
> 
> The code is a bit in flux because it's sitting on top of a few
> other RFC patches and not quite complete, just wanted opinions
> about it.

opal_handle_mce() may have to be treated as special opal call. For MCE
that occurs in OPAL context, Linux making opal call will clobber
original opal call stack which hit MCE. Same is true with nested MCE in
OPAL. Should it just continue using same r1 to avoid clobbering or have
a separate stack for mce opal call ?

Thanks,
-Mahesh.

