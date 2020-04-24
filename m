Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E196B1B7B31
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 18:12:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497zhK3SfmzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Apr 2020 02:12:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497zbX0J7DzDr4M
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Apr 2020 02:07:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03OG4ULB130812
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:07:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmv3c5ke-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:07:47 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03OG4kGC132320
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 12:07:47 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30gmv3c5k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 12:07:47 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03OG0Lml011403;
 Fri, 24 Apr 2020 16:07:46 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 30fs67ffv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Apr 2020 16:07:46 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03OG7i1K52494806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 16:07:44 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 786DEC605A;
 Fri, 24 Apr 2020 16:07:44 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B3BCC6055;
 Fri, 24 Apr 2020 16:07:44 +0000 (GMT)
Received: from localhost (unknown [9.85.163.64])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 16:07:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc/rtas: Export rtas_error_rc
In-Reply-To: <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
References: <cover.1587704308.git.sbobroff@linux.ibm.com>
 <e9c245df4a0b1cd1f68171c81e0d9e64a13ab0e9.1587704308.git.sbobroff@linux.ibm.com>
Date: Fri, 24 Apr 2020 11:07:43 -0500
Message-ID: <874kt8lve8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_08:2020-04-24,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=1 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=831
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004240122
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> Export rtas_error_rc() so that it can be used by other users of
> rtas_call() (which is already exported).

This will do the right thing for your ibm,configure-pe use case in patch
2, but the -900x => errno translations in rtas_error_rc() appear
tailored for the indicator- and sensor-related calls that currently use
it. From my reading of PAPR+, the meaning of a -900x RTAS status word
depends on the call. For example, -9002 commonly means "not authorized",
which we would typically translate to -EPERM, but rtas_error_rc() would
translate it to -ENODEV.

Also the semantics of -9001 as a return value seem to vary a bit.

So I don't think rtas_error_rc() should be advertised as a generically
useful facility in its current form.

(I have had some thoughts about how firmware/hypervisor call status can
be translated to meaningful Linux error values without tedious switch
statements, which I'm happy to expand on if anyone is interested, but I
don't want to hijack your submission for that discussion.)
