Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D39982FB2F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 08:27:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKgG36V5dzDr0w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 18:27:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gPRGb6lX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKgD30XDFzDqyd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 18:25:22 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10J73fDp141028; Tue, 19 Jan 2021 02:12:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=TjgaFPFDJH1Zmk+EzMNJQgevie8By4s9zWMwEvR//Lo=;
 b=gPRGb6lXM+mGqGH+seThTFc3N3rUpsS8X8QVKzuHcMRFuHUURfThfsB8YZCKmPHnB2Ne
 9NgJHgddYYhJCrpEr1Da9CdIsheLpF2jyKTcVrNeS69FICG67Fa1GM6Yn7KAeiuISurp
 4FIBtP259ujP5O1ikYGsfQEaYUu5S+26fylmtBL02CtD9HcKwBTLYNKCvBIhmQVPxkgq
 KyODj0p26OUxl0XixLgn2FX2WB5vDsz460HgHpuPjZRHx2pa4nuK93XWrw0QqrRoj79r
 RUMq/kreWzc+uAJnf4cW5i5VvPknivmpbmDexXhmfQTlAXARQTk4KyO09NVFwveJ0IcG jQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365sm19mf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 02:12:52 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10J75AUW003059;
 Tue, 19 Jan 2021 02:12:52 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 365sm19mej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 02:12:52 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10J7032Q025006;
 Tue, 19 Jan 2021 07:12:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 363qdhat4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Jan 2021 07:12:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10J7Cl1r40763666
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Jan 2021 07:12:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA9C3A4051;
 Tue, 19 Jan 2021 07:12:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 97971A4040;
 Tue, 19 Jan 2021 07:12:44 +0000 (GMT)
Received: from [9.77.206.253] (unknown [9.77.206.253])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jan 2021 07:12:44 +0000 (GMT)
Subject: Re: [RFC Qemu PATCH v2 1/2] spapr: drc: Add support for async hcalls
 at the drc level
To: David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <160674929554.2492771.17651548703390170573.stgit@lep8c.aus.stglabs.ibm.com>
 <160674938210.2492771.1728601884822491679.stgit@lep8c.aus.stglabs.ibm.com>
 <20201221130853.15c8ddfd@bahia.lan> <20201228083800.GN6952@yekko.fritz.box>
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Message-ID: <3b47312a-217f-8df5-0bfd-1a653598abad@linux.ibm.com>
Date: Tue, 19 Jan 2021 12:40:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201228083800.GN6952@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-19_01:2021-01-18,
 2021-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 suspectscore=0 clxscore=1011 mlxlogscore=999 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101190041
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
Cc: xiaoguangrong.eric@gmail.com, linux-nvdimm@lists.01.org,
 aneesh.kumar@linux.ibm.com, mst@redhat.com, qemu-devel@nongnu.org,
 kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com, qemu-ppc@nongnu.org,
 bharata@linux.vnet.ibm.com, imammedo@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for the comments!


On 12/28/20 2:08 PM, David Gibson wrote:

> On Mon, Dec 21, 2020 at 01:08:53PM +0100, Greg Kurz wrote:
...
>> The overall idea looks good but I think you should consider using
>> a thread pool to implement it. See below.
> I am not convinced, however.  Specifically, attaching this to the DRC
> doesn't make sense to me.  We're adding exactly one DRC related async
> hcall, and I can't really see much call for another one.  We could
> have other async hcalls - indeed we already have one for HPT resizing
> - but attaching this to DRCs doesn't help for those.

The semantics of the hcall made me think, if this is going to be

re-usable for future if implemented at DRC level. Other option

is to move the async-hcall-state/list into the NVDIMMState structure

in include/hw/mem/nvdimm.h and handle it with machine->nvdimms_state

at a global level.


Hope you are okay with using the pool based approach that Greg

suggested.


Please let me know.


Thanks,

Shivaprasad


