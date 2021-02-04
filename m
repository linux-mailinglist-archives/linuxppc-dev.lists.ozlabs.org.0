Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0267830F3C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 14:19:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWfJx3TqPzDwyK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 00:19:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SHXdeGsp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWfFW2F3YzDwjw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 00:16:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 114D7KL6010963; Thu, 4 Feb 2021 08:15:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OiX/ZrJ19lWVFKhO3EJO6ksWn1lQxfzQr8aZJlxPtaY=;
 b=SHXdeGspIDj5tHuAlQlonJ1XdMb4BLatg3q0LR8h8JCTnVcTMfRxMQQT3RlnkLUGpmn1
 a1TeB+zY9csSI5YYj39bZdQ76waIvn02Ja6a619KVRyvHi1Z7iIrJifGINkc40caBTcR
 v+WPeE2TG8GDPdn8wHR2Xpi+vbXfdTj5Gpsi3/AgWTdtBkYxMZruYMlA7sGAs0lkF7MP
 IcmZkzThLtDwghLJEz3DZZ8XPLFxcHLmJR8f6xO5KBqzaxWLd9xY+pOdMKNLIR6r8JUC
 y08ix+BR+cUBacvvrSUS1wvabyb1b6FmLT5OYrJUd2Twbowf2azU9ITvwbVtfyVArjym vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gh56rx3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:15:43 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 114D7OCq011250;
 Thu, 4 Feb 2021 08:15:43 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36gh56rx2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 08:15:42 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 114D7YVa013446;
 Thu, 4 Feb 2021 13:15:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 36cy38ak1e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Feb 2021 13:15:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 114DFbGs28705096
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Feb 2021 13:15:37 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4471C5205A;
 Thu,  4 Feb 2021 13:15:37 +0000 (GMT)
Received: from localhost (unknown [9.85.87.37])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C9E6C52051;
 Thu,  4 Feb 2021 13:15:36 +0000 (GMT)
Date: Thu, 4 Feb 2021 18:45:34 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
Message-ID: <20210204131534.GL210@DESKTOP-TDPLP67.localdomain>
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
 <79b0bed7-8b98-d58d-dc47-644195bbc095@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79b0bed7-8b98-d58d-dc47-644195bbc095@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-04_07:2021-02-04,
 2021-02-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102040082
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
 paulus@samba.org, sandipan@linux.ibm.com, jniethe5@gmail.com,
 naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/02/04 04:19PM, Ravi Bangoria wrote:
> 
> 
> On 2/4/21 4:17 PM, Ravi Bangoria wrote:
> > Don't allow Uprobe on 2nd word of a prefixed instruction. As per
> > ISA 3.1, prefixed instruction should not cross 64-byte boundary.
> > So don't allow Uprobe on such prefixed instruction as well.
> > 
> > There are two ways probed instruction is changed in mapped pages.
> > First, when Uprobe is activated, it searches for all the relevant
> > pages and replace instruction in them. In this case, if we notice
> > that probe is on the 2nd word of prefixed instruction, error out
> > directly. Second, when Uprobe is already active and user maps a
> > relevant page via mmap(), instruction is replaced via mmap() code
> > path. But because Uprobe is invalid, entire mmap() operation can
> > not be stopped. In this case just print an error and continue.
> 
> @mpe,
> 
> arch_uprobe_analyze_insn() can return early if
> cpu_has_feature(CPU_FTR_ARCH_31) is not set. But that will
> miss out a rare scenario of user running binary with prefixed
> instruction on p10 predecessors. Please let me know if I
> should add cpu_has_feature(CPU_FTR_ARCH_31) or not.

The check you are adding is very specific to prefixed instructions, so 
it makes sense to add a cpu feature check for v3.1.

On older processors, those are invalid instructions like any other. The 
instruction emulation infrastructure will refuse to emulate it and the 
instruction will be single stepped.

- Naveen
