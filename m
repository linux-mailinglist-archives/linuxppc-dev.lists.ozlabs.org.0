Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4B61D9BB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 17:51:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RL345qTMzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 01:51:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=pc@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RL0t33sRzDqSw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:49:34 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04JFWYHS036917; Tue, 19 May 2020 11:49:31 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp90td9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 11:49:30 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04JFWa7v037102;
 Tue, 19 May 2020 11:49:30 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp90tcv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 11:49:30 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04JFYqLQ004110;
 Tue, 19 May 2020 15:49:29 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02wdc.us.ibm.com with ESMTP id 313wgs5g4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 May 2020 15:49:29 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04JFnSwU46924266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 May 2020 15:49:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8B3DAE05F;
 Tue, 19 May 2020 15:49:28 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 328A5AE05C;
 Tue, 19 May 2020 15:49:28 +0000 (GMT)
Received: from oc3272150783.ibm.com (unknown [9.160.42.118])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 19 May 2020 15:49:28 +0000 (GMT)
Date: Tue, 19 May 2020 10:49:22 -0500
From: "Paul A. Clarke" <pc@us.ibm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2 6/7] powerpc/dt_cpu_ftrs: Add MMA feature
Message-ID: <20200519154922.GC24922@oc3272150783.ibm.com>
References: <20200519003157.31946-1-alistair@popple.id.au>
 <20200519003157.31946-7-alistair@popple.id.au>
 <20200519144922.GA24922@oc3272150783.ibm.com>
 <20200519150556.GM31009@gate.crashing.org>
 <20200519152240.GB24922@oc3272150783.ibm.com>
 <20200519152855.GN31009@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519152855.GN31009@gate.crashing.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-19_04:2020-05-19,
 2020-05-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 cotscore=-2147483648
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005190131
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
Cc: Alistair Popple <alistair@popple.id.au>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 10:28:55AM -0500, Segher Boessenkool wrote:
> On Tue, May 19, 2020 at 10:22:40AM -0500, Paul A. Clarke wrote:
> > On Tue, May 19, 2020 at 10:05:56AM -0500, Segher Boessenkool wrote:
> > > On Tue, May 19, 2020 at 09:49:22AM -0500, Paul A. Clarke wrote:
> > > > On Tue, May 19, 2020 at 10:31:56AM +1000, Alistair Popple wrote:
> > > > > Matrix multiple accumulate (MMA) is a new feature added to ISAv3.1 and
> > > > 
> > > > nit: "Matrix-Multiply Accelerator".
> > > 
> > > "Matrix-Multiply Assist" in fact :-)
> > 
> > Not according to the ISA (p. 1129).
> 
> There is one mistake in the 3.1 ABI yes, in the description for the PCR
> bit of this same name.  Everything else calls this "assist", like all
> similar things are called as well (whereas an "accelerator" is an
> external device).

I stand corrected. The PCR bit description is in error, and that's what I
was going by.  Section 7.6.1.12 "VSX Matrix-Multiply Assist (MMA)
Instructions" seems to be more definitive.  Thanks, Segher, for correcting
my correction.

Should be "Matrix-Multiply Assist".

:-)

PC
