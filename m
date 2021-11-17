Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D335454951
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 15:53:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvQsj2sNpz3bbx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 01:53:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IjVAMjOz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IjVAMjOz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvQrv0rxgz2yV5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 01:52:46 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AHEMs21028022; 
 Wed, 17 Nov 2021 14:52:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=nMmhMdO+KoDz0mSTqZLZF+KAMrxFxESlP6D+yCIn5sA=;
 b=IjVAMjOzdVPUcPT2nHYvUZoDAzSiNRM0teUHoGiVXYsOHeXqnd1WPYi8wSOgrHIRO5jj
 hFHoYtThhkm7v4FSbY9QF2YOUVZ3uuRokhpPO2+p32AQFbEclAxN+UBQjimPwo0Knq6b
 yGthDmc3rr7cX77qt+dPmX53SRGg4Ra5PwMfHAeI1OWk9F4SsFloDcYhOQXTW46vflHr
 T/1A0fDjGlVuyvBIPYGsmCjH/rFGrfjYVpsr1gMXMAsnA43w1/3gNEi1PIRcvHkhPViI
 0313DRggnA4DGB30Zw7agAIM+Q1z0gJJaci+ZDqzPkLKwgXzrctLQ2Jxouc2Rdobs0t3 Qg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cd3cjgr62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 14:52:40 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AHEO3DD014816;
 Wed, 17 Nov 2021 14:47:38 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04dal.us.ibm.com with ESMTP id 3ca50bypun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Nov 2021 14:47:38 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AHElb0b25493844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Nov 2021 14:47:37 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED28AC6057;
 Wed, 17 Nov 2021 14:47:36 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BD1BCC6067;
 Wed, 17 Nov 2021 14:47:36 +0000 (GMT)
Received: from localhost (unknown [9.211.102.167])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Nov 2021 14:47:36 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: delete scanlog
In-Reply-To: <877dd7m5jd.fsf@mpe.ellerman.id.au>
References: <20210920173203.1800475-1-nathanl@linux.ibm.com>
 <87sfvvijjw.fsf@linux.ibm.com> <877dd7m5jd.fsf@mpe.ellerman.id.au>
Date: Wed, 17 Nov 2021 08:47:36 -0600
Message-ID: <87mtm2j0tz.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hfOOVuoSe-mZImfzP5xzbhpbktMGfSnt
X-Proofpoint-ORIG-GUID: hfOOVuoSe-mZImfzP5xzbhpbktMGfSnt
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-17_05,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111170073
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Nathan Lynch <nathanl@linux.ibm.com> writes:
>>> Remove the pseries scanlog driver.
>>>
>>> This code supports functions from Power4-era servers that are not prese=
nt
>>> on targets currently supported by arch/powerpc. System manuals from this
>>> time have this description:
>>>
>>>   Scan Dump data is a set of chip data that the service processor gathe=
rs
>>>   after a system malfunction. It consists of chip scan rings, chip trace
>>>   arrays, and Scan COM (SCOM) registers. This data is stored in the
>>>   scan-log partition of the system=E2=80=99s Nonvolatile Random Access
>>>   Memory (NVRAM).
>>>
>>> PowerVM partition firmware development doesn't recognize the associated
>>> function call or property, and they don't see any references to them in
>>> their codebase. It seems to have been specific to non-virtualized
>>> pseries.
>>
>> Just bumping this to see if there are any objections.
>
> Not an objection, I like nothing better than dropping old unused cruft,
> but are we sure it's safe to remove the proc file?
>
> I see that rtas_errd still looks for it, have you checked that it will
> handle the absence of the file gracefully and continue doing whatever
> else it does?

Uhh. I will stop forgetting to check ppc64_diag when making such
changes. Thanks for pointing this out.

> On further inspection it looks like the code that looks for it in
> rtas_errd is #if 0'ed out (??), so maybe it's dead.

Yes it seems so. From rtas_errd's main():

#if 0
	/*=20
	 * Check to see if a new scanlog dump is available;  if so, copy it to
	 * the filesystem and associate the dump with the first error processed.
	 */
	check_scanlog_dump();
#endif

And that's the only entry point into the code that collects the scanlog
data. And that dead code appears to deal with the absence of
/proc/ppc64/scan-log-dump gracefully. It has been like that since
initial git import in 2013.

> Anyway if you can test that rtas_errd still works that'd be good.

I've verified that it starts normally and logs EPOW events associated
with partition migration.

> Presumably there's no other code that cares about the proc file.

AFAIK this is right. powerpc-utils and librtas do not use it. librtas
has a wrapper for the calling the associated RTAS function directly, but
that's fine.

I tried using GitHub's search to find instances of "scan-log-dump" that
weren't from Linux or ppc64_diag (need to be logged in I think):

https://github.com/search?q=3D%22scan-log-dump%22+-path%3Aarch%2Fpowerpc+-f=
ilename%3Ascanlog.c+-extension%3Apatch&type=3DCode&ref=3Dadvsearch&l=3D&l=3D

This hasn't yielded any unexpected users. There may be better search
terms but that's what a few minutes of fiddling with it got me.
