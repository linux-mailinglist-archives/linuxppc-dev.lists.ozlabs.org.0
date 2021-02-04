Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08530EDE3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:01:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWFq2PrgzDwlc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:01:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sandipan@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DVUAYSm6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWCx2djQzDwlP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 18:59:24 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1147WboJ143085; Thu, 4 Feb 2021 02:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=45ycLnBSX3y/1xsfOnsFf5+Lh0WgKpSrLwDvbFA9zf0=;
 b=DVUAYSm6qae/Tywex1JlMNIR0MKXrwWs4g0/lGWzk+IdAQdIALqeFSfCqfhEWLPI7EWi
 NBAP+DoZ2cZU9N5d2exKp1ldP6hIEkrWbN/sBvRE6AoX75eTv5GK7uYlam4teTrCNG6Y
 bmFUgrgiZO8pwCn1tWfXMbl16O1K506WHkGyJ3vpAbI5k3EjRAsxrU5p61TITaAhrnWu
 GvUbI4zu4dTZiAN3P6j8N45XTAa5yfv8vXcRPmCcmbzqxDiT44ikWS6NHoJm8kEyZ/4i
 blRF34lCHiXpojaWleiW1jDV+8YEF3O426dshGdSuxZXHRP/CQJvA9G6q6ZxjZARW4Q4 GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gbf2jgvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:59:18 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 1147ZXqb156077;
 Thu, 4 Feb 2021 02:59:17 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gbf2jgu6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 02:59:17 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1147r3bl020169;
 Thu, 4 Feb 2021 07:59:15 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 36cy38mng0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 07:59:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1147x2ob21430674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 07:59:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64F6311C058;
 Thu,  4 Feb 2021 07:59:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F80211C04A;
 Thu,  4 Feb 2021 07:59:09 +0000 (GMT)
Received: from [9.199.62.53] (unknown [9.199.62.53])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Feb 2021 07:59:09 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc: sstep: Fix load-store and update emulation
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210204071432.116439-1-sandipan@linux.ibm.com>
 <20210204073954.GH210@DESKTOP-TDPLP67.localdomain>
From: Sandipan Das <sandipan@linux.ibm.com>
Message-ID: <c946a40c-63d5-868f-8e75-5e84a931e437@linux.ibm.com>
Date: Thu, 4 Feb 2021 13:29:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204073954.GH210@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_03:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040041
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
Cc: ravi.bangoria@linux.ibm.com, ananth@linux.ibm.com, jniethe5@gmail.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/02/21 1:09 pm, Naveen N. Rao wrote:
> [...]
> 
> I'm afraid there is one more thing. scripts/checkpatch.pl reports:
> 
> WARNING: 'an userspace' may be misspelled - perhaps 'a userspace'?
> #52:
> While an userspace program having an instruction word like
>       ^^^^^^^^^^^^
> 
> ERROR: switch and case should be at the same indent
> #96: FILE: arch/powerpc/lib/sstep.c:3021:
> +               switch (GETTYPE(op->type)) {
> +                       case LOAD:
> [...]
> +                       case STORE:
> +                       case LOAD_FP:
> +                       case STORE_FP:
> 
> 

Yikes! Thanks for pointing that out. Sending v4.

- Sandipan
