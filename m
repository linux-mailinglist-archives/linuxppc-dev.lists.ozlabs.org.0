Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF7811449F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 17:18:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TLVg2dXHzDqc1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 03:18:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TLSd3nSpzDqY6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 03:16:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB5GCrk0025762; Thu, 5 Dec 2019 11:16:27 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wpur469s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 11:16:27 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xB5GFPhT019887;
 Thu, 5 Dec 2019 16:16:25 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 2wkg27r1ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2019 16:16:25 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB5GGPpB17695078
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Dec 2019 16:16:25 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 554BD112066;
 Thu,  5 Dec 2019 16:16:25 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 38977112061;
 Thu,  5 Dec 2019 16:16:25 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Dec 2019 16:16:25 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] pseries: Track and expose idle PURR and SPURR ticks
In-Reply-To: <48823589-b105-0da3-e532-f633ade8f0d9@linux.vnet.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <87r21ju3ud.fsf@linux.ibm.com>
 <48823589-b105-0da3-e532-f633ade8f0d9@linux.vnet.ibm.com>
Date: Thu, 05 Dec 2019 10:16:19 -0600
Message-ID: <87k17au4rw.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-05_05:2019-12-04,2019-12-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912050135
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kamalesh,

Kamalesh Babulal <kamalesh@linux.vnet.ibm.com> writes:
> On 12/5/19 3:54 AM, Nathan Lynch wrote:
>> "Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
>>>
>>> Tools such as lparstat which are used to compute the utilization need
>>> to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
>>> counters are already exposed through sysfs.  We already account for
>>> PURR ticks when we go to idle so that we can update the VPA area. This
>>> patchset extends support to account for SPURR ticks when idle, and
>>> expose both via per-cpu sysfs files.
>> 
>> Does anything really want to use PURR instead of SPURR? Seems like we
>> should expose only SPURR idle values if possible.
>> 
>
> lparstat is one of the consumers of PURR idle metric
> (https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4). 
> Agree, on the argument that system utilization metrics based on SPURR
> accounting is accurate in comparison to PURR, which isn't proportional to
> CPU frequency.  PURR has been traditionally used to understand the system
> utilization, whereas SPURR is used for understanding how much capacity is
> left/exceeding in the system based on the current power saving mode.

I'll phrase my question differently: does SPURR complement or supercede
PURR? You seem to be saying they serve different purposes. If PURR is
actually useful rather then vestigial then I have no objection to
exposing idle_purr.
