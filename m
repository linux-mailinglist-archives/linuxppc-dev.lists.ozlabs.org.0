Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D612443615B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:19:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZmkG3PVkz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 23:19:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OMHIsnK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OMHIsnK/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZmjS34dyz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 23:18:35 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19LC4iiM019432; 
 Thu, 21 Oct 2021 08:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ArBB2jA0N+riRdv2ps0NK45owFipAJ5pf1YGcH6n8Ek=;
 b=OMHIsnK/W4efrd9GADImVH4HRsqr6BTbuX27VyvIj8WfGSWkG8exHBGFiSqSulMYkAVe
 A+7lhRTU9b8fT6aDUuZeh/PSRMvPh2m2TG+ZzC5uRHmBLarDdd2GnkC5vGSC07FjK2b4
 6l0QWTwz8ajddJ+gQjq2Y81u/5sRWtoEkcqWFXOYeVwtFw5Vtj6Y48VVsF8XnPqsfbKX
 jGqqo/V9eOh6EFMzyKIgpjXarNowtUiXe+Q2cmz0b8CftP6boiL9GgYgl8pjaB2xcd03
 ncKVQ/wF4fjQjj8u1JIyuYj5o1TPvwANlBZvyOsQh+KxUsrl8nPsAIl+haQ3rs9wMu7w ew== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btthkrg4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 08:18:28 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19LCC2Qt018133;
 Thu, 21 Oct 2021 12:18:27 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3bqpccbj22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 21 Oct 2021 12:18:27 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19LCIQmA42991898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Oct 2021 12:18:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D07B1124052;
 Thu, 21 Oct 2021 12:18:26 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70261124053;
 Thu, 21 Oct 2021 12:18:26 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 21 Oct 2021 12:18:26 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v2] powerpc/pseries/mobility: ignore ibm,
 platform-facilities updates
In-Reply-To: <87zgr3expl.fsf@dja-thinkpad.axtens.net>
References: <20211020194703.2613093-1-nathanl@linux.ibm.com>
 <87zgr3expl.fsf@dja-thinkpad.axtens.net>
Date: Thu, 21 Oct 2021 07:18:25 -0500
Message-ID: <87o87iy3ji.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d7dluQRoRKntzFCDSG1esBwVowyeuVU4
X-Proofpoint-GUID: d7dluQRoRKntzFCDSG1esBwVowyeuVU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-21_02,2021-10-21_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011
 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110210064
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
>> On VMs with NX encryption, compression, and/or RNG offload, these
>> capabilities are described by nodes in the ibm,platform-facilities device
>> tree hierarchy:
>>
>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,compression-v1
>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,random-v1
>>   =E2=94=94=E2=94=80=E2=94=80 ibm,sym-encryption-v1
>>
>>   3 directories
>>
>> The acceleration functions that these nodes describe are not disrupted by
>> live migration, not even temporarily.
>>
>> But the post-migration ibm,update-nodes sequence firmware always sends
>> "delete" messages for this hierarchy, followed by an "add" directive to
>> reconstruct it via ibm,configure-connector (log with debugging statements
>> enabled in mobility.c):
>>
>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:4294967=
285
>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:42=
94967284
>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1=
:4294967283
>>   mobility: removing node /ibm,platform-facilities:4294967286
>>   ...
>>   mobility: added node /ibm,platform-facilities:4294967286
>>
>> Note we receive a single "add" message for the entire hierarchy, and what
>> we receive from the ibm,configure-connector sequence is the top-level
>> platform-facilities node along with its three children. The debug message
>> simply reports the parent node and not the whole subtree.
>
> If I understand correctly, (and again, this is not my area at all!) we
> still have to go out to the firmware and call the
> ibm,configure-connector sequence in order to figure out that the node
> we're supposed to add is the ibm,platform-facilites node, right? We
> can't save enough information at delete time to avoid the trip out to
> firmware?

That is right... but maybe I don't understand your angle here. Unsure
what avoiding the configure-connector sequence for the nodes would buy
us.


>> Until that can be realized we have a confirmed use-after-free and the
>> possibility of memory corruption. So add a limited workaround that
>> discriminates on the node type, ignoring adds and removes. This should be
>> amenable to backporting in the meantime.
>
> Yeah it's an unpleasant situation to find ourselves in. It's a bit icky
> but as I think you said in a previous email, at least this isn't worse:
> in the common case it should now succeed and and if properties change
> significantly it will still fail.
>
> My one question (from more of a security point of view) is:
>  1) Say you start using the facilities with a particular set of
>     parameters.
>
>  2) Say you then get migrated and the parameters change.
>
>  3) If you keep using the platform facilities as if the original
>     properties are still valid, can this cause any Interesting,
>     unexpected or otherwise Bad consequences? Are we going to end up
>     (for example) scribbling over random memory somehow?

If drivers are safely handling errors from H_COP_OP etc, then no. (I
know, this looks like a Well That Would Be a Driver Bug dismissal, but
that's not my attitude.) And again this is a case where the change
cannot make things worse.

In the current design of the pseries LPM implementation, user space and
other normal system activity resume as soon as we return from the
stop_machine() call which suspends the partition, executing concurrently
with any device tree updates. So even if we had code in place to
correctly resolve the DT changes and the drivers were able to respond to
the changes, there would still be a window of exposure to the kind of
problem you describe: the changed characteristics, if any, of the
destination obtain as soon as execution resumes, regardless of when the
OS initiates the update-nodes sequence.

The way out of that mess is to use the Linux suspend framework, or
otherwise prevent user space from executing until the destination
system's characteristics have been appropriately propagated out to the
necessary drivers etc. I'm trying to get there.


> Apart from that, the code seems to do what it says, it seems to solve a
> real problem, the error and memory handling makes sense, you _put the DT
> nodes that you _get, the comments are helpful and descriptive, and it
> passes the automated tests on patchwork/snowpatch.

I appreciate your review!
